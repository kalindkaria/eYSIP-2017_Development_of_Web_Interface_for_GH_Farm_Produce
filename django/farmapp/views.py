import csv
import datetime
import os

from django.conf import settings
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db import transaction
from django.db.models import F
from django.db.models import Sum
from django.http import HttpResponse
from django.shortcuts import render, HttpResponseRedirect
from django.template.defaulttags import register
from django.views.decorators.cache import cache_control
from farmapp.models import User, Produce, Machine, Inventory, Crop, Cart, Cart_session, Order, Alert
from graphos.renderers.morris import DonutChart, BarChart
from graphos.sources.model import ModelDataSource
from graphos.sources.simple import SimpleDataSource
from django.contrib.auth import authenticate, login

from .forms import LoginForm, SignUpForm, AnalyticsForm, CropAnalyticsForm, InventoryForm

# Function to handle login and signup of user
# returns redirect, login form, signup form
def handle_login_signup(request):
    print("CALLED HANDLE")
    loginform = LoginForm()
    signupform = SignUpForm()

    # If user is already logged in.
    if request.session.get('logged_in', False):
        if request.session.get('user_type', "").upper() == "PRODUCER":
            return HttpResponseRedirect('/producer/home/'), loginform, signupform
        else:
            return HttpResponseRedirect('/home/'), loginform, signupform

    # Handling the form submitted
    if request.method == "POST":
        print("GOT A POST REQ")
        # If the login form is submitted
        if request.POST.get("login", ""):
            # recreating the login form via the request data
            loginform = LoginForm(request.POST)
            # if the form is valid
            if loginform.is_valid():
                print(loginform.cleaned_data)
                # checking the details from the database
                try:
                    user = authenticate(request, email=loginform.cleaned_data['email'], password=loginform.cleaned_data['password'])
                    print("User: ",user)
                    if user is not None:
                        login(request, user)
                    # user = User.objects.get(email=loginform.cleaned_data['email'],
                    #                         password=loginform.cleaned_data['password'])
                    # storing the details into the session
                        request.session['logged_in'] = True
                        request.session['user_id'] = user.pk
                        request.session['email'] = user.email
                        request.session['user_type'] = user.user_type
                    # if the logged in user is a producer
                    if request.session['user_type'] == "Producer":
                        print("A Producer Logged In")
                        # redirect to producer home
                        return None, loginform, signupform
                    # if the logged in user is a consumer
                    else:
                        print("A Consumer Logged In")
                        # trying to restore last cart session
                        try:
                            cart = Cart.objects.get(cart_id=user.last_cart.cart_id)
                            print(user.last_cart.cart_id)
                            if request.session.get('cart_id', False):
                                user.last_cart = cart
                                user.save()
                            else:
                                request.session['cart_id'] = cart.cart_id

                            return None, loginform, signupform
                        except:
                            return None, loginform, signupform

                except Exception as e:
                    loginform.add_error(None, "The username and password do not match!")
                    print(e)
        # If the signup form is submitted
        if request.POST.get("signup", ""):
            signupform = SignUpForm(request.POST)
            if signupform.is_valid():
                print(signupform.cleaned_data)
                data = signupform.cleaned_data
                if data['password'] == data['repass']:
                    # Creating New user
                    user = User.objects.create(email=data['email'], first_name=data['firstname'],
                                               last_name=data['lastname'],
                                               password=data['password'], contact=data['contact'], user_type="Consumer")
                    request.session['logged_in'] = True
                    request.session['user_id'] = user.user_id
                    request.session['email'] = user.email
                    request.session['user_type'] = user.user_type
                    print("A Consumer Logged In")
                    # trying to restore last cart session
                    try:
                        cart = Cart.objects.get(cart_id=user.last_cart.cart_id)
                        print(user.last_cart.cart_id)
                        if request.session.get('cart_id', False):
                            user.last_cart = cart
                            user.save()
                        else:
                            request.session['cart_id'] = cart.cart_id
                    except:
                        return None, loginform, signupform
                else:
                    signupform.add_error(None, "The Passwords do not match!")
                return HttpResponseRedirect('/home/'), loginform, signupform

    return None, loginform, signupform

# Function to return the value for given key from a given dict in django template
@register.filter
def get_item(dictionary, key):
    return dictionary.get(key)

# Function to return the value for given key from a given list in django template
@register.filter
def get_list_item(list, key):
    return list[key]


# The view for the homepage.
@cache_control(max_age=0, no_cache=True, no_store=True, must_revalidate=True)
def index(request):
    errors = []
    request.session['page'] = "/crops"

    # Handle Login and Signup.
    redirect, loginform, signupform = handle_login_signup(request)

    # If the user is a producer redirect to producer home
    if request.session.get('logged_in', False) and request.session.get('user_type', "").upper() == "PRODUCER":
        return HttpResponseRedirect("/producer/home/")

    # If the user is a consumer.
    if request.session.get('logged_in', False) and request.session.get('user_type', "").upper() == "CONSUMER":
        availability = {}
        # If a user cart exists
        if request.session.get('cart_id', False):
            cart = Cart.objects.get(cart_id=request.session['cart_id'])
            cart_items = Cart_session.objects.filter(cart_id=cart)

            id = []
            # Extracting details about the crops present in the cart
            for crop in cart_items:
                if (crop.crop_id.availability > 10):
                    user = User.objects.get(email=request.session['email'])
                    producers = Inventory.objects.filter(crop_id=crop.crop_id)
                    maximum_sum = 0
                    for producer in producers:
                        maximum_sum += int(min(producer.maximum, (producer.weight - producer.sold)))
                    print("maximum sum:  ", maximum_sum)
                    try:
                        order_sum = \
                            Order.objects.filter(user_id=user, crop_id=crop.crop_id, time__date=datetime.date.today(),
                                                 status__iexact="pending").aggregate(Sum('weight'))['weight__sum']
                        order_sum = int(order_sum)
                        print("order sum:  ", order_sum)
                    except:
                        order_sum = 0
                    availability[crop.crop_id.crop_id] = maximum_sum - order_sum
                    print("Availability  ", availability[crop.crop_id.crop_id])
                    if availability[crop.crop_id.crop_id] > 10:
                        id.append(crop.crop_id.crop_id)
                    else:
                        message = "Sorry you have exceeded your daily limit for purchasing " + crop.crop_id.english_name
                        errors.append(message)
                        print(errors)
                        crop.delete()
                else:
                    message = "Sorry " + crop.crop_id.english_name + " is no longer available!"
                    errors.append(message)
                    print(errors)
                    crop.delete()
            added_crops = Crop.objects.filter(crop_id__in=id).order_by('-availability')
            print(added_crops)
            request.session['cart_count'] = added_crops.count()
            crops = Crop.objects.exclude(crop_id__in=id).order_by('-availability')

        else:
            crops = Crop.objects.all().order_by('-availability')
            added_crops = []

        for crop in crops:
            user = User.objects.get(email=request.session['email'])
            producers = Inventory.objects.filter(crop_id=crop)
            maximum_sum = 0
            for producer in producers:
                maximum_sum += int(min(producer.maximum, (producer.weight - producer.sold)))

            try:
                order_sum = Order.objects.filter(user_id=user, crop_id=crop, time__date=datetime.date.today(),
                                                 status__iexact="pending").aggregate(Sum('weight'))['weight__sum']
                order_sum = int(order_sum)
            except:
                order_sum = 0
            availability[crop.crop_id] = maximum_sum - order_sum

        context = {'page': 'home', 'crops': crops, 'added_crops': added_crops, 'errors': errors,
                   'availability': availability}
        return render(request, 'login/shop.html', context)
    # The user is not logged in.
    else:
        # If user cart exists
        if request.session.get('cart_id', False):
            cart = Cart.objects.get(cart_id=request.session['cart_id'])
            cart_items = Cart_session.objects.filter(cart_id=cart)

            id = []
            for crop in cart_items:
                if (crop.crop_id.availability > 10):
                    id.append(crop.crop_id.crop_id)
                else:
                    message = "Sorry " + crop.crop_id.english_name + " is no longer available!"
                    errors.append(message)
                    print(errors)
                    Cart_session.objects.get(cart_id=crop.cart_id).delete()
            added_crops = Crop.objects.filter(crop_id__in=id).order_by('-availability')
            request.session['cart_count'] = added_crops.count()
            crops = Crop.objects.exclude(crop_id__in=id).order_by('-availability')

        else:
            crops = Crop.objects.all().order_by('-availability')
            added_crops = []

        context = {'loginform': loginform, 'signupform': signupform, 'page': 'crops', 'crops': crops,
                   'added_crops': added_crops, 'errors': errors}
        return render(request, 'shop.html', context)

# The view for consumer home. The page has been removed and redirected to 'crops/' i.e. the store
def home(request):
    if request.session.get("logged_in", False) and request.session.get('user_type', "").upper() != "PRODUCER":
        if request.session.get('cart_id', False):
            if request.session.get('page', False):
                return HttpResponseRedirect(request.session['page'])
            else:
                return HttpResponseRedirect('/crops')
        else:
            return HttpResponseRedirect('/crops')
    return HttpResponseRedirect('/')

# The view to logout a user. It flushes the user session.
def logout(request):
    if request.session.get('cart_id', False):
        user = User.objects.get(pk=request.session['email'])
        user.last_cart = Cart.objects.get(cart_id=request.session['cart_id'])
        user.save()
        request.session.flush()

        # request.session['cart_id'] = cart_id
        # request.session['cart_count'] = cart_count
        return HttpResponseRedirect('/')
    request.session.flush()
    return HttpResponseRedirect('/')

# The view for producer home.
def producer_home(request):
    if request.session.get('logged_in', False) and request.session.get('user_type', "").upper() == "PRODUCER":
        # Fetch all infomation about the logged produce
        user = User.objects.get(pk=request.session['user_id'])
        machines = Machine.objects.filter(user_id=user)
        produce = list(Produce.objects.filter(machine_id__in=machines).order_by('-timestamp'))
        print(produce)
        return render(request, 'producer.html', {'page': "home", 'produce': produce})
    return HttpResponseRedirect('/')


# The view for producer inventory
def producer_inventory(request):
    if request.session.get('logged_in', False) and request.session.get('user_type', "").upper() == "PRODUCER":
        # Fetch all information about the producer inventory
        user = User.objects.get(pk=request.session['user_id'])
        inventory = Inventory.objects.filter(user_id=user)
        return render(request, 'producer_inventory.html', {'page': "inventory", 'inventory': inventory})
    return HttpResponseRedirect('/')


# The view for the about page
def about(request):
    request.session['page'] = '/about'
    redirect, loginform, signupform = handle_login_signup(request)
    if request.session.get('logged_in', False) and request.session.get('user_type', "").upper() == "PRODUCER":
        return HttpResponseRedirect("/")
    if request.session.get('logged_in', False) and request.session.get('user_type', "").upper() == "CONSUMER":
        context = {'page': 'about'}
        return render(request, 'login/about.html', context)
    else:
        context = {'loginform': loginform, 'signupform': signupform, 'page': 'about'}
        return render(request, 'about.html', context)


# The view for the crops page. Has been moved to the homepage('/')
@cache_control(max_age=0, no_cache=True, no_store=True, must_revalidate=True)
def crops(request):
    return HttpResponseRedirect("/")


# The view to add item to cart and redirect back.
def add_to_cart(request, crop_id):
    try:
        input_crop = Crop.objects.get(crop_id=crop_id)
        cart_session = Cart_session()
        if input_crop.availability > 0:
            if request.session.get('cart_id', False):
                try:
                    cart = Cart.objects.get(cart_id=request.session['cart_id'])
                    Cart_session.objects.get(cart_id=cart, crop_id=input_crop)
                    return HttpResponseRedirect('/crops')
                except:
                    cart = Cart.objects.get(cart_id=request.session['cart_id'])
                    cart_session.cart_id = cart
            else:
                cart = Cart.objects.create()
                cart_session.cart_id = cart
                request.session['cart_id'] = cart.cart_id
            print(request.session['cart_id'])
            cart_session.crop_id = input_crop
            cart_session.save()
        return HttpResponseRedirect('/crops')
    except:
        return HttpResponseRedirect('/crops')

# The view to remove item from cart and redirect back
def remove_from_cart(request, crop_id):
    try:
        input_crop = Crop.objects.get(crop_id=crop_id)
        if request.session.get('cart_id', False):
            cart = Cart.objects.get(cart_id=request.session['cart_id'])
            Cart_session.objects.get(cart_id=cart, crop_id=input_crop).delete()
        if request.session.get('page', False):
            return HttpResponseRedirect(request.session['page'])
        else:
            return HttpResponseRedirect(request.session['page'])
    except:
        if request.session.get('page', False):
            return HttpResponseRedirect(request.session['page'])
        else:
            return HttpResponseRedirect(request.session['page'])


# The view for the cart page. Shows information anout the items present in the cart.
@cache_control(max_age=0, no_cache=True, no_store=True, must_revalidate=True)
def view_cart(request):
    errors = []
    request.session['page'] = "/crops"
    redirect, loginform, signupform = handle_login_signup(request)
    if request.session.get('logged_in', False) and request.session.get('user_type', "").upper() == "PRODUCER":
        return HttpResponseRedirect("/producer/home/")

    if request.session.get('logged_in', False) and request.session.get('user_type', "").upper() == "CONSUMER":
        availability = {}
        if request.session.get('cart_id', False):
            cart = Cart.objects.get(cart_id=request.session['cart_id'])
            cart_items = Cart_session.objects.filter(cart_id=cart)

            id = []
            for crop in cart_items:
                if (crop.crop_id.availability > 10):
                    user = User.objects.get(pk=request.session['email'])
                    producers = Inventory.objects.filter(crop_id=crop.crop_id)
                    maximum_sum = 0
                    for producer in producers:
                        maximum_sum += int(min(producer.maximum, (producer.weight - producer.sold)))
                    print("maximum sum:  ", maximum_sum)
                    try:
                        order_sum = \
                            Order.objects.filter(user_id=user, crop_id=crop.crop_id, time__date=datetime.date.today(),
                                                 status__iexact="pending").aggregate(Sum('weight'))['weight__sum']
                        order_sum = int(order_sum)
                        print("order sum:  ", order_sum)
                    except:
                        order_sum = 0
                    availability[crop.crop_id.crop_id] = maximum_sum - order_sum
                    print("Availability  ", availability[crop.crop_id.crop_id])
                    if availability[crop.crop_id.crop_id] > 10:
                        id.append(crop.crop_id.crop_id)
                    else:
                        message = "Sorry you have exceeded your daily limit for purchasing " + crop.crop_id.english_name
                        errors.append(message)
                        print(errors)
                        crop.delete()
                else:
                    message = "Sorry " + crop.crop_id.english_name + " is no longer available!"
                    errors.append(message)
                    print(errors)
                    crop.delete()
            added_crops = Crop.objects.filter(crop_id__in=id).order_by('-availability')
            request.session['cart_count'] = added_crops.count()
            if request.session['cart_count'] == 0:
                return HttpResponseRedirect('/crops')

            cart_items = Cart_session.objects.filter(cart_id=cart)
            context = {'page': 'cart', 'cart_session': cart_items, 'availability': availability, 'errors': errors}
            return render(request, 'login/cart.html', context)

    else:
        try:
            request.session['page'] = "/cart"
            redirect, loginform, signupform = handle_login_signup(request)

            cart = Cart.objects.get(cart_id=request.session['cart_id'])
            cart_session = Cart_session.objects.filter(cart_id=cart)
            errors = []

            id = []
            for crop in cart_session:
                if (crop.crop_id.availability > 0):
                    id.append(crop.crop_id.crop_id)
                else:
                    message = "Sorry " + crop.crop_id.english_name + " is no longer available!"
                    errors.append(message)
                    print(errors)
                    Cart_session.objects.get(cart_id=crop.cart_id).delete()
            added_crops = Crop.objects.filter(crop_id__in=id, availability__gt=0).order_by('-availability')
            request.session['cart_count'] = added_crops.count()
            if request.session['cart_count'] == 0:
                return HttpResponseRedirect('/crops')

            context = {'loginform': loginform, 'signupform': signupform, 'page': 'cart', 'cart_session': cart_session,
                       'errors': errors}
            return render(request, 'cart.html', context)
        except:
            return HttpResponseRedirect('/crops')


# The view for the checkout page.
@cache_control(max_age=0, no_cache=True, no_store=True, must_revalidate=True)
def checkout(request):
    outerlist = {}
    errors = {}
    error_flag = 0
    form_values = {}

    if request.session.get('cart_id', False):
        if request.method == "POST":
            try:
                with transaction.atomic():
                    cart = Cart.objects.get(cart_id=request.session['cart_id'])
                    cart_session = Cart_session.objects.filter(cart_id=cart)
                    valid_producers = []
                    for item in cart_session:
                        producers = Inventory.objects.filter(crop_id=item.crop_id, weight__gte=F('minimum'))
                        item_errors = []
                        for producer in producers:
                            requested_quantity = request.POST.get(
                                producer.user_id.first_name + str(producer.crop_id.crop_id))
                            form_values[producer.user_id.first_name + str(producer.crop_id.crop_id)] = int(
                                requested_quantity)
                            requested_quantity = float(requested_quantity)
                            print(requested_quantity)
                            if requested_quantity != 0:
                                if (producer.weight - producer.sold) < requested_quantity and (
                                            producer.weight - producer.sold) >= producer.minimum:
                                    message = "Sorry " + producer.crop_id.english_name + " is  unavailable as requested quantity of " \
                                              + str(requested_quantity) + "gm is greater than available quantity of " \
                                              + str(producer.weight - producer.sold) + "gm !"
                                    form_values[producer.user_id.first_name + str(producer.crop_id.crop_id)] = 0
                                    error_flag = 1
                                    item_errors.append(message)
                                elif (producer.weight - producer.sold) < producer.minimum:
                                    message = "Sorry " + producer.user_id.first_name + " does not have enough " + producer.crop_id.english_name + "!"
                                    form_values[producer.user_id.first_name + str(producer.crop_id.crop_id)] = 0
                                    error_flag = 1
                                    item_errors.append(message)
                                else:
                                    valid_producers.append(producer)
                            errors[item.crop_id.crop_id] = item_errors

                    if error_flag == 0:
                        user = User.objects.get(pk=request.session['email'])
                        for producer in valid_producers:
                            requested_quantity = request.POST.get(
                                producer.user_id.first_name + str(producer.crop_id.crop_id))
                            requested_quantity = float(requested_quantity)
                            crop = Crop.objects.get(crop_id=producer.crop_id.crop_id)

                            if requested_quantity != 0:

                                try:
                                    order = Order(user_id=user, cart_id=cart, crop_id=producer.crop_id,
                                                  seller=producer.user_id, weight=requested_quantity)

                                    crop = Crop.objects.get(crop_id=producer.crop_id.crop_id)
                                    inventory = Inventory.objects.select_for_update().get(user_id=producer.user_id,
                                                                                          crop_id=crop)
                                    final_inventory = inventory.weight - inventory.sold
                                    if requested_quantity <= final_inventory:
                                        inventory.sold = F('sold') + requested_quantity
                                        crop.availability = F('availability') - requested_quantity
                                        with transaction.atomic():
                                            inventory.save()
                                            order.save()
                                            crop.save()
                                    else:
                                        return HttpResponseRedirect('/checkout')
                                except Exception as e:
                                    print(e)
                                    return HttpResponseRedirect('/checkout')

                        return HttpResponseRedirect('/order')
            except Exception as e:
                print(e)
                return HttpResponseRedirect('/checkout')

        cart = Cart.objects.get(cart_id=request.session['cart_id'])
        cart_session = Cart_session.objects.filter(cart_id=cart)

        for item in cart_session:
            producers = Inventory.objects.filter(crop_id=item.crop_id, weight__gte=F('minimum'))
            item_list = []
            for producer in producers:
                machines = Machine.objects.filter(user_id=producer.user_id)
                row = \
                    Produce.objects.filter(machine_id__in=machines, crop_id=producer.crop_id).order_by(
                        '-date_of_produce')[
                        0]
                innerlist = []
                innerlist.append(producer.user_id)
                innerlist.append(producer.crop_id)
                innerlist.append(producer.weight - producer.sold)
                innerlist.append(producer.minimum)
                innerlist.append(producer.maximum)
                innerlist.append(row.image)

                quantity = []
                i = int(producer.minimum)
                user = User.objects.get(pk=request.session['email'])
                order_sum = 0
                try:
                    order_sum = \
                        Order.objects.filter(user_id=user, crop_id=producer.crop_id, time__date=datetime.date.today(),
                                             status__iexact="pending").aggregate(Sum('weight'))['weight__sum']
                    order_sum = int(order_sum)
                    print(order_sum)
                except:
                    order_sum = 0
                finally:
                    max = min(int(producer.maximum), int(producer.weight - producer.sold))
                    print(max)
                    if max - order_sum > 0:
                        max = max - order_sum
                    else:
                        max = 0
                    print(max)
                    if i <= max:
                        while i <= max:
                            quantity.append(i)
                            i = i + int(producer.minimum)
                        if quantity[len(quantity) - 1] != max:
                            quantity.append(max)
                    else:
                        quantity.append("Unavailable")
                    print(quantity)
                    innerlist.append(quantity)
                    innerlist.append(producer.user_id.first_name + str(producer.crop_id.crop_id))
                    innerlist.append(max)
                    item_list.append(innerlist)
                    print(quantity)
            outerlist[item.crop_id.crop_id] = item_list
        context = {'page': 'checkout', 'cart_session': cart_session, 'outerlist': outerlist, 'errors': errors,
                   'form_values': form_values}
        return render(request, 'login/checkout.html', context)
    else:
        return HttpResponseRedirect('/crops')


# The view for the order summary page.
def order_summary(request):
    try:
        cart = Cart.objects.get(cart_id=request.session['cart_id'])
        user = User.objects.get(pk=request.session['email'])
        user.last_cart = None
        user.save()
        orders = Order.objects.filter(user_id=user, cart_id=cart)

        for order in orders:
            try:
                machines = Machine.objects.filter(user_id=order.seller.user_id)
                produce = Produce.objects.filter(machine_id__in=machines,
                                                 crop_id=order.crop_id,
                                                 date_of_expiry__gt=datetime.datetime.now(),
                                                 weight__gt=F('sold')).order_by('date_of_expiry')

                quantity_left = order.weight
                for entry in produce:
                    if quantity_left > 0:
                        if entry.weight - entry.sold >= quantity_left:
                            entry.sold = entry.sold + quantity_left
                            with transaction.atomic():
                                entry.save()
                            break
                        else:
                            quantity_left = quantity_left - (entry.weight - entry.sold)
                            entry.sold = entry.weight
                            with transaction.atomic():
                                entry.save()
            except Exception as e:
                print(e)
                return HttpResponseRedirect('/crops')

        if orders:
            del request.session['cart_id']
            del request.session['cart_count']

            return render(request, 'login/order.html', {'orders': orders})
        else:
            return HttpResponseRedirect('/crops')
    except:
        return HttpResponseRedirect('/')


# The view for the producer orders page. Shows all the orders.
def producer_orders(request):
    try:
        request.session['page'] = "/producer/orders"
        user = User.objects.get(pk=request.session['email'])
        orders = Order.objects.filter(seller=user).order_by('-cart_id')

        if orders:
            all_orders = {}

            for order in orders:
                if all_orders.get(order.crop_id.english_name, False):
                    print("")
                else:
                    all_orders[order.crop_id.english_name] = []
                item_order = {}
                item_order['cart_id'] = order.cart_id
                item_order['crop_id'] = order.crop_id
                item_order['user_id'] = order.user_id
                item_order['weight'] = order.weight
                item_order['time'] = order.time
                item_order['status'] = order.status.upper()
                all_orders[order.crop_id.english_name].append(item_order)

            context = {'page': "orders", 'all_orders': all_orders}
            return render(request, 'producerOrder.html', context)
        else:
            context = {'page': "orders"}
            return render(request, 'producerOrder.html', context)
    except:
        return HttpResponseRedirect('/')


# The view for the producer pending orders.
def producer_pending_orders(request):
    try:
        request.session['page'] = "/producer/pendingorders"
        user = User.objects.get(pk=request.session['email'])
        orders = Order.objects.filter(seller=user, status__iexact='pending').order_by('-cart_id')
        if orders:
            all_orders = {}

            for order in orders:
                if all_orders.get(order.crop_id.english_name, False):
                    print("")
                else:
                    all_orders[order.crop_id.english_name] = []
                item_order = {}
                item_order['cart_id'] = order.cart_id
                item_order['crop_id'] = order.crop_id
                item_order['user_id'] = order.user_id
                item_order['weight'] = order.weight
                item_order['time'] = order.time
                item_order['status'] = order.status.upper()
                all_orders[order.crop_id.english_name].append(item_order)

            context = {'page': "orders", 'all_orders': all_orders}
            return render(request, 'producerPendingOrder.html', context)
        else:
            context = {'page': "orders"}
            return render(request, 'producerPendingOrder.html', context)
    except:
        return HttpResponseRedirect('/')


# The view for the delivery page.
@cache_control(max_age=0, no_cache=True, no_store=True, must_revalidate=True)
def producer_delivery(request):
    try:
        request.session['page'] = "/producer/delivery"
        user = User.objects.get(pk=request.session['email'])
        orders = Order.objects.filter(seller=user, status="pending").order_by('cart_id')

        if orders:
            prev_order = orders[0].cart_id.cart_id
            all_orders = []
            individual_order = []
            for order in orders:
                if order.cart_id.cart_id != prev_order:
                    all_orders.append(individual_order)
                    individual_order = []
                    prev_order = order.cart_id.cart_id

                item_order = {}
                item_order['cart_id'] = order.cart_id
                item_order['crop_id'] = order.crop_id
                item_order['buyer'] = order.user_id
                item_order['weight'] = order.weight
                item_order['time'] = order.time
                item_order['status'] = order.status.upper()
                individual_order.append(item_order)
            all_orders.append(individual_order)

            paginator = Paginator(all_orders, 5)  # Show 5 orders per page

            page = request.GET.get('page')
            try:
                orders = paginator.page(page)
            except PageNotAnInteger:
                # If page is not an integer, deliver first page.
                orders = paginator.page(1)
            except EmptyPage:
                # If page is out of range (e.g. 9999), deliver last page of results.
                orders = paginator.page(paginator.num_pages)

            pagelist = []
            for i in range(1, orders.paginator.num_pages + 1):
                pagelist.append(i)
            print(paginator.num_pages)
            context = {'page': "delivery", 'all_orders': orders, 'pagelist': pagelist}
            return render(request, 'producerDelivery.html', context)
        else:
            context = {'page': "orders"}
            return render(request, 'producerDelivery.html', context)
    except:
        return HttpResponseRedirect('/')


# The view for the delivered orders of producer
@cache_control(max_age=0, no_cache=True, no_store=True, must_revalidate=True)
def producer_delivered(request):
    try:
        user = User.objects.get(pk=request.session['email'])
        orders = Order.objects.filter(seller=user, status__iexact="delivered").order_by('-delivery_date')

        if orders:
            prev_order = orders[0].cart_id.cart_id
            all_orders = []
            individual_order = []
            for order in orders:
                if order.cart_id.cart_id != prev_order:
                    all_orders.append(individual_order)
                    individual_order = []
                    prev_order = order.cart_id.cart_id

                item_order = {}
                item_order['cart_id'] = order.cart_id
                item_order['crop_id'] = order.crop_id
                item_order['buyer'] = order.user_id
                item_order['weight'] = order.weight
                item_order['time'] = order.time
                item_order['delivery_date'] = order.delivery_date
                item_order['status'] = order.status.upper()
                individual_order.append(item_order)
            all_orders.append(individual_order)

            paginator = Paginator(all_orders, 5)  # Show 5 orders per page

            page = request.GET.get('page')
            try:
                orders = paginator.page(page)
            except PageNotAnInteger:
                # If page is not an integer, deliver first page.
                orders = paginator.page(1)
            except EmptyPage:
                # If page is out of range (e.g. 9999), deliver last page of results.
                orders = paginator.page(paginator.num_pages)

            pagelist = []
            for i in range(1, orders.paginator.num_pages + 1):
                pagelist.append(i)
            print(paginator.num_pages)
            context = {'page': "orders", 'all_orders': orders, 'pagelist': pagelist}
            return render(request, 'producerDelivered.html', context)
        else:
            context = {'page': "orders"}
            return render(request, 'producerDelivered.html', context)
    except:
        return HttpResponseRedirect('/')


# The view for the consumer orders page.
def consumer_orders(request):
    try:
        request.session['page'] = "/consumer/orders"
        user = User.objects.get(pk=request.session['email'])
        orders = Order.objects.filter(user_id=user).order_by('-cart_id')
        if orders:
            prev_order = orders[0].cart_id.cart_id
            all_orders = []
            individual_order = []
            for order in orders:
                if order.cart_id.cart_id != prev_order:
                    all_orders.append(individual_order)
                    individual_order = []
                    prev_order = order.cart_id.cart_id

                item_order = {}
                item_order['cart_id'] = order.cart_id
                item_order['crop_id'] = order.crop_id
                item_order['seller'] = order.seller
                item_order['weight'] = order.weight
                item_order['time'] = order.time
                item_order['status'] = order.status.upper()
                individual_order.append(item_order)
            all_orders.append(individual_order)

            paginator = Paginator(all_orders, 5)  # Show 5 orders per page

            page = request.GET.get('page')
            try:
                orders = paginator.page(page)
            except PageNotAnInteger:
                # If page is not an integer, deliver first page.
                orders = paginator.page(1)
            except EmptyPage:
                # If page is out of range (e.g. 9999), deliver last page of results.
                orders = paginator.page(paginator.num_pages)

            pagelist = []
            for i in range(1, orders.paginator.num_pages + 1):
                pagelist.append(i)
            print(paginator.num_pages)
            context = {'page': "orders", 'all_orders': orders, 'pagelist': pagelist}
            return render(request, 'consumerOrder.html', context)
        else:
            context = {'page': "orders"}
            return render(request, 'consumerOrder.html', context)
    except:
        return HttpResponseRedirect('/')


# The view for consumer to cancel a particular order
def consumer_order_cancel(request, cart_id, seller, crop_id):
    try:
        user = User.objects.get(pk=request.session['email'])

        seller = User.objects.get(user_id=seller)
        cart = Cart.objects.get(cart_id=cart_id)
        crop = Crop.objects.get(crop_id=crop_id)

        order = Order.objects.get(user_id=user, cart_id=cart, crop_id=crop, seller=seller)
        order.status = "cancelled"
        producer_message = order.user_id.first_name + " has cancelled his order for " + str(order.weight) + " grams of " \
                           + order.crop_id.english_name + " placed on " + str(order.time.date())

        crop.availability = crop.availability + order.weight
        inventory = Inventory.objects.get(user_id=seller, crop_id=crop)
        inventory.sold = inventory.sold - order.weight
        Alert.objects.create(user_id=seller, message=producer_message)

        with transaction.atomic():
            order.save()
            inventory.save()
            crop.save()

            machines = Machine.objects.filter(user_id=seller)
            produce = Produce.objects.filter(machine_id__in=machines,
                                             crop_id=crop,
                                             date_of_expiry__gt=datetime.datetime.now(),
                                             ).exclude(sold=0).order_by('-date_of_expiry')

            quantity_left = order.weight
            for entry in produce:
                if quantity_left > 0:
                    if entry.sold >= quantity_left:
                        entry.sold = entry.sold - quantity_left
                        entry.save()
                        break
                    else:
                        quantity_left = quantity_left - entry.sold
                        entry.sold = 0
                        entry.save()
            if request.session.get('page', False):
                return HttpResponseRedirect(request.session['page'])
            else:
                return HttpResponseRedirect(request.session['page'])
    except Exception as e:
        print(e)
        if request.session.get('page', False):
            return HttpResponseRedirect(request.session['page'])
        else:
            return HttpResponseRedirect(request.session['page'])


# The view for producer to reject a order.
def producer_order_reject(request, cart_id, buyer, crop_id):
    try:
        user = User.objects.get(pk=request.session['email'])
        buyer = User.objects.get(user_id=buyer)
        cart = Cart.objects.get(cart_id=cart_id)
        crop = Crop.objects.get(crop_id=crop_id)
        order = Order.objects.get(seller=user, cart_id=cart, crop_id=crop, user_id=buyer)
        order.status = "rejected"
        producer_message = order.seller.first_name + " has rejected your order for " + str(order.weight) + " grams of " \
                           + order.crop_id.english_name + " placed on " + str(order.time.date())

        Alert.objects.create(user_id=buyer, message=producer_message)
        crop.availability = crop.availability + order.weight
        inventory = Inventory.objects.get(user_id=user, crop_id=crop)
        inventory.sold = inventory.sold - order.weight

        with transaction.atomic():
            order.save()
            inventory.save()
            crop.save()

            machines = Machine.objects.filter(user_id=user)
            produce = Produce.objects.filter(machine_id__in=machines,
                                             crop_id=crop,
                                             date_of_expiry__gt=datetime.datetime.now(),
                                             ).exclude(sold=0).order_by('-date_of_expiry')

            quantity_left = order.weight
            for entry in produce:
                if quantity_left > 0:
                    if entry.sold >= quantity_left:
                        entry.sold = entry.sold - quantity_left
                        entry.save()
                        break
                    else:
                        quantity_left = quantity_left - entry.sold
                        entry.sold = 0
                        entry.save()
        if request.session.get('page', False):
            return HttpResponseRedirect(request.session['page'])
        else:
            return HttpResponseRedirect(request.session['page'])
    except Exception as e:
        print(e)
        if request.session.get('page', False):
            return HttpResponseRedirect(request.session['page'])
        else:
            return HttpResponseRedirect(request.session['page'])

# The view for producer to deliver a order
def producer_order_deliver(request, cart_id, buyer):
    try:
        user = User.objects.get(pk=request.session['email'])
        buyer = User.objects.get(user_id=buyer)
        cart = Cart.objects.get(cart_id=cart_id)
        orders = Order.objects.filter(seller=user, cart_id=cart, user_id=buyer, status__iexact="pending")

        for order in orders:
            order.status = "delivered"
            order.delivery_date = datetime.datetime.now()
            producer_message = order.seller.first_name + " has delivered your order for " + str(
                order.weight) + " grams of " \
                               + order.crop_id.english_name + " placed on " + str(order.time.date())

            Alert.objects.create(user_id=buyer, message=producer_message)

            with transaction.atomic():
                order.save()

        return HttpResponseRedirect('/producer/deliveredorders/')
    except Exception as e:
        print(e)
        if request.session.get('page', False):
            return HttpResponseRedirect(request.session['page'])
        else:
            return HttpResponseRedirect('/')


# The view for the alerts page
def alerts(request):
    user = User.objects.get(pk=request.session['email'])
    alerts = Alert.objects.filter(user_id=user).order_by('-timestamp')
    if user.user_type.upper() == "PRODUCER":
        return render(request, 'login/produceralert.html', {'alerts': alerts})
    else:
        return render(request, 'login/consumeralert.html', {'alerts': alerts})


# Function to convert a given set of dict to a list.
def set_to_list(set_of_dict):
    keys = set_of_dict[0].keys()
    list = []
    list.append(tuple(keys))
    for dict in set_of_dict:
        list.append(tuple(dict.values()))
    return list


# The view for the analytics page.
def analytics(request):
    context = {}
    if request.session.get('logged_in', False) and request.session.get('user_type', "").upper() == "PRODUCER":
        inventory = Inventory.objects.filter(pk=request.session['email'])
        producer_crops = []
        crop_list = []
        for item in inventory:
            producer_crops.append(Crop.objects.get(crop_id=item.crop_id.pk))
        for crop in producer_crops:
            crop_list.append([str(crop.crop_id), crop.english_name])
        print(crop_list)
        form = AnalyticsForm(crop_list=crop_list)
        if request.method == "POST":
            form = AnalyticsForm(request.POST, crop_list=crop_list)
            print(request.POST)
            if form.is_valid():
                print("Printing Data:" + str(form.cleaned_data))
                selected_crops = Crop.objects.filter(pk__in=form.cleaned_data['crops'])
                selected_crops_name = []
                data = []
                for crop in selected_crops:
                    try:
                        user = User.objects.get(pk=request.session['user_id'])
                        machines = Machine.objects.filter(user_id=user)
                        start_date = form.cleaned_data['start_date']
                        end_date = form.cleaned_data['end_date']
                        if not start_date:
                            start_date = datetime.date(1, 1, 1)
                        if not end_date:
                            end_date = datetime.date.today()
                        print(start_date, end_date)
                        object = Produce.objects.filter(machine_id__in=machines, crop_id=crop) \
                            .exclude(date_of_produce__date__lt=start_date) \
                            .exclude(date_of_produce__date__gt=end_date)
                        sum_weight = object.aggregate(Sum('weight'))
                        sum_sold = object.aggregate(Sum('sold'))
                        print("SOLD", sum_sold)
                        if sum_weight['weight__sum']:
                            weight = sum_weight['weight__sum']
                        else:
                            weight = 0
                        if sum_sold['sold__sum']:
                            sold = sum_sold['sold__sum']
                        else:
                            sold = 0
                        data.append([crop.short_name, weight, sold])
                        selected_crops_name.append(crop.english_name)
                    except Exception as e:
                        print(e)
                        data.append([crop.short_name, 0])
                        selected_crops_name.append(crop.english_name)
                sorted_data = list(sorted(data, key=lambda data: data[1], reverse=True))
                sorted_data.insert(0, ['Crop Name', 'Weight (g)', 'Sold (g)'])
                data = SimpleDataSource(sorted_data)
                print(sorted_data)
                chart = BarChart(data, html_id='graph', options={'formatter': 'function(y){return y+" gm"}'})
                context['chart'] = chart
                context['data'] = form.cleaned_data
                context['crop_names'] = selected_crops_name

                # Write to a CSV file
                file_name = "media/" + str(request.session['user_id']) + "_output.csv"
                context['csv_filename'] = file_name
                with open(settings.MEDIA_ROOT + file_name, "w") as f:
                    writer = csv.writer(f)
                    writer.writerows(sorted_data)
            else:
                print("Not Valid")
        context['analyticsform'] = form
        context['page'] = "analytics"
        return render(request, 'analytics.html', context)
    return HttpResponseRedirect("/")

# The view for crop analytics page
def crop_analytics(request):
    context = {}
    if request.session.get('logged_in', False) and request.session.get('user_type', "").upper() == "PRODUCER":
        inventory = Inventory.objects.filter(pk=request.session['email'])
        producer_crops = []
        crop_list = []
        for item in inventory:
            producer_crops.append(Crop.objects.get(crop_id=item.crop_id.pk))
        for crop in producer_crops:
            crop_list.append([str(crop.crop_id), crop.english_name])
        print(crop_list)
        form = CropAnalyticsForm(crop_list=crop_list)
        if request.method == "POST":
            form = CropAnalyticsForm(request.POST, crop_list=crop_list)
            print(request.POST)
            if form.is_valid():
                print("Printing Data:" + str(form.cleaned_data))
                context['data'] = form.cleaned_data
                try:
                    user = User.objects.get(pk=request.session['user_id'])
                    machines = Machine.objects.filter(user_id=user)
                    object = Produce.objects.filter(machine_id__in=machines, crop_id=form.cleaned_data['crops'])
                    start_date = form.cleaned_data['start_date']
                    end_date = form.cleaned_data['end_date']
                    if not start_date:
                        start_date = datetime.date(datetime.date.today().year, 1, 1)
                    if not end_date:
                        end_date = datetime.date.today()
                    time_frame = form.cleaned_data['time_frame']
                    data = []
                    context['crop'] = Crop.objects.get(crop_id=form.cleaned_data['crops'])

                    if time_frame == "weekly":
                        first_date = start_date
                        second_date = start_date + datetime.timedelta(weeks=1)
                        while first_date <= end_date:
                            temp = object.exclude(date_of_produce__date__lt=first_date) \
                                .exclude(date_of_produce__date__gte=second_date)
                            print(temp)
                            sum_weight = temp.aggregate(Sum('weight'))
                            sum_sold = temp.aggregate(Sum('sold'))
                            if sum_weight['weight__sum']:
                                weight = sum_weight['weight__sum']
                            else:
                                weight = 0
                            if sum_sold['sold__sum']:
                                sold = sum_sold['sold__sum']
                            else:
                                sold = 0
                            data.append([first_date.strftime('%e %b\'%y'), weight, sold])
                            first_date = first_date + datetime.timedelta(weeks=1)
                            second_date = second_date + datetime.timedelta(weeks=1)
                        data.insert(0, ['Date', 'Weight (g)', 'Sold(g)'])
                        context['table'] = data[1:]
                        data = SimpleDataSource(data)
                        print(data)
                        chart = BarChart(data, html_id='graph', options={'formatter': 'function(y){return y+" gm"}'})
                        context['chart'] = chart
                    elif time_frame == "monthly":
                        cur_month = start_date.month
                        cur_year = start_date.year
                        while datetime.date(cur_year, cur_month, 1) < end_date:
                            if cur_month == 12:
                                temp = object.exclude(date_of_produce__date__lt=datetime.date(cur_year, cur_month, 1)) \
                                    .exclude(date_of_produce__date__gte=datetime.date(cur_year + 1, 1, 1))
                            else:
                                temp = object.exclude(date_of_produce__date__lt=datetime.date(cur_year, cur_month, 1)) \
                                    .exclude(date_of_produce__date__gte=datetime.date(cur_year, cur_month + 1, 1))
                            print(temp)
                            sum_weight = temp.aggregate(Sum('weight'))
                            sum_sold = temp.aggregate(Sum('sold'))
                            if sum_weight['weight__sum']:
                                weight = sum_weight['weight__sum']
                            else:
                                weight = 0
                            if sum_sold['sold__sum']:
                                sold = sum_sold['sold__sum']
                            else:
                                sold = 0
                            data.append([datetime.date(cur_year, cur_month, 1).strftime("%b %Y"), weight, sold])
                            if cur_month == 12:
                                cur_year += 1
                                cur_month = 1
                            else:
                                cur_month += 1
                        data.insert(0, ['Date', 'Weight (g)', 'Sold(g)'])
                        context['table'] = data[1:]
                        data = SimpleDataSource(data)
                        print(data)
                        chart = BarChart(data, html_id='graph', options={'formatter': 'function(y){return y+" gm"}'})
                        context['chart'] = chart
                    elif time_frame == "quaterly":
                        cur_month = start_date.month
                        cur_year = start_date.year
                        while datetime.date(cur_year, cur_month, 1) < end_date:
                            if cur_month == 10:
                                temp = object.exclude(date_of_produce__date__lt=datetime.date(cur_year, cur_month, 1)) \
                                    .exclude(date_of_produce__date__gte=datetime.date(cur_year + 1, 1, 1))
                            else:
                                temp = object.exclude(date_of_produce__date__lt=datetime.date(cur_year, cur_month, 1)) \
                                    .exclude(date_of_produce__date__gte=datetime.date(cur_year, cur_month + 3, 1))
                            print(temp)
                            sum_weight = temp.aggregate(Sum('weight'))
                            sum_sold = temp.aggregate(Sum('sold'))
                            if sum_weight['weight__sum']:
                                weight = sum_weight['weight__sum']
                            else:
                                weight = 0
                            if sum_sold['sold__sum']:
                                sold = sum_sold['sold__sum']
                            else:
                                sold = 0
                            data.append([datetime.date(cur_year, cur_month, 1).strftime("%B %Y"), weight, sold])
                            if cur_month == 10:
                                cur_year += 1
                                cur_month = 1
                            else:
                                cur_month += 3
                        data.insert(0, ['Date', 'Weight (g)', 'Sold(g)'])
                        context['table'] = data[1:]
                        data = SimpleDataSource(data)
                        print(data)
                        chart = BarChart(data, html_id='graph', options={'formatter': 'function(y){return y+" gm"}'})
                        context['chart'] = chart

                except Exception as e:
                    print(e)
        context['analyticsform'] = form
        context['page'] = "analytics"
        return render(request, 'crop_analytics.html', context)
    return HttpResponseRedirect("/")


def profile(request):
    if request.session.get('logged_in', False) and request.session.get('user_type', "").upper() == "CONSUMER":
        try:
            user = User.objects.get(user_id=request.session.get('user_id', False))

        except Exception as e:
            print(e)

# The view to allow editing of inventory to producer.
def edit_inventory(request, crop_id):
    context = {}
    if request.session.get('logged_in', False) and request.session.get('user_type', "").upper() == "PRODUCER":
        user = User.objects.get(pk=request.session['user_id'])
        crop = Crop.objects.get(pk=crop_id)
        inventory = Inventory.objects.get(crop_id=crop, user_id=user)
        form = InventoryForm(instance=inventory)
        print("Form\n")
        if request.method == "POST":
            form = InventoryForm(request.POST)
            if form.is_valid():
                print("DATA\n", form.cleaned_data)
                o = InventoryForm(request.POST, inventory)
                o.save()
        context['form'] = form
        context['page'] = "edit_inventory"
        return render(request, "edit_inventory.html", context)
        # except Exception as e:
        #     print(e)
        #     return HttpResponseRedirect(request.session.get("page","/"))
    return HttpResponseRedirect("/")

# The view for download of csv for overall analytics by producer.
def download(request):
    if request.session.get("user_id", None):
        file_name = "media/" + str(request.session['user_id']) + "_output.csv"
        file_path = os.path.join(settings.MEDIA_ROOT, file_name)
        if os.path.exists(file_path):
            with open(file_path, 'r') as f:
                response = HttpResponse(f.read(), content_type="text/csv")
                response['Content-Disposition'] = 'attachment; filename=' + "report.csv"
                return response
    return HttpResponseRedirect(request.session.get('page', "/"))
