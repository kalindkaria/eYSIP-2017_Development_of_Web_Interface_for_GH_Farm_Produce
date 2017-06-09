from django.shortcuts import render, HttpResponseRedirect
from .forms import LoginForm, SignUpForm,CartForm
from farmapp.models import User,Produce,Machine,Trough,Inventory,Crop,Cart,Cart_session,Order
from django.views.decorators.cache import cache_control
from django.db.models import Sum,Count


@cache_control(max_age=0, no_cache=True, no_store=True, must_revalidate=True)
def index(request):
    loginform = LoginForm()
    signupform = SignUpForm()
    if request.session.get('logged_in', False):
        if request.session.get('user_type', "") == "Producer":
            return HttpResponseRedirect('/producer/home/')
        else:
            return HttpResponseRedirect('/home/')
    return render(request, 'index.html', {'loginform': loginform, 'signupform': signupform, 'page': 'index'})


def home(request):
    if request.session.get("logged_in", False) and request.session.get('user_type', "").upper() != "PRODUCER":
        return render(request, 'home.html', {'page': "home"})
    return HttpResponseRedirect('/')


def logout(request):
    request.session.flush()
    return HttpResponseRedirect('/')


def login(request):
    print("In LOGIN")
    print(request.session.get("logged_in", False))
    if request.session.get('logged_in', False):
        if request.session.get('user_type', "").upper() == "PRODUCER":
            return HttpResponseRedirect('/producer/home/')
        else:
            return HttpResponseRedirect('/home/')
    if request.method == "POST":
        if request.POST.get("login", ""):
            loginform = LoginForm(request.POST)
            if loginform.is_valid():
                print(loginform.cleaned_data)
                try:
                    user = User.objects.get(email=loginform.cleaned_data['email'], password=loginform.cleaned_data['password'])
                    request.session['logged_in'] = True
                    request.session['user_id'] = user.user_id
                    request.session['email'] = user.email
                    request.session['user_type'] = user.user_type
                    if request.session['user_type'] == "Producer":
                        print("A Producer Logged In")
                        return HttpResponseRedirect('/producer/home/')
                    else:
                        print("A Consumer Logged In")
                        return HttpResponseRedirect('/home/')
                except Exception as e:
                    print(e)
        elif request.POST.get("signup", ""):
            signupform = SignUpForm(request.POST)
            print(signupform)
            if signupform.is_valid():
                print(signupform.cleaned_data)
                return HttpResponseRedirect('/home/')
        else:
            print(request.POST)
    return HttpResponseRedirect('/')


def producer_home(request):
    if request.session.get('logged_in', False) and request.session.get('user_type', "").upper() == "PRODUCER":
        user = User.objects.get(pk=request.session['user_id'])
        machines = Machine.objects.filter(user_id=user)
        produce = list(Produce.objects.filter(machine_id__in=machines))

        print(produce)
        return render(request, 'producer.html', {'page': "home", 'produce': produce})
    return HttpResponseRedirect('/')


def producer_inventory(request):
    if request.session.get('logged_in', False) and request.session.get('user_type', "").upper() == "PRODUCER":
        user = User.objects.get(pk = request.session['user_id'])
        inventory = Inventory.objects.filter(user_id = user)
        return render(request, 'producer_inventory.html', {'page': "inventory",'inventory':inventory})
    return HttpResponseRedirect('/')


def about(request):
    loginform = LoginForm()
    signupform = SignUpForm()
    context = {'loginform': loginform, 'signupform': signupform, 'page': 'about'}
    return render(request, 'about.html', context)


def crops(request):
    loginform = LoginForm()
    signupform = SignUpForm()
    if request.session.get('cart_id',False):
        cart = Cart.objects.get(cart_id = request.session['cart_id'])
        cart_items = Cart_session.objects.filter(cart_id = cart)
        id=[]
        print(cart_items)
        for crop in cart_items:
            id.append(crop.crop_id.crop_id)
        print(id)
        added_crops = Crop.objects.filter(crop_id__in=id).order_by('-availability')
        request.session['cart_count'] = added_crops.count()
        crops = Crop.objects.exclude(crop_id__in = id).order_by('-availability')
        print(crops)

    else:
        crops = Crop.objects.all().order_by('-availability')
        added_crops = []
    context = {'loginform': loginform, 'signupform': signupform, 'page': 'crops', 'crops': crops,'added_crops': added_crops}
    return render(request, 'shop.html', context)

def add_to_cart(request,crop_id):
    try:
        input_crop = Crop.objects.get(crop_id = crop_id)
        cart_session = Cart_session()
        if request.session.get('cart_id', False):
            cart = Cart.objects.get(cart_id = request.session['cart_id'])
            cart_session.cart_id = cart
        else:
            cart = Cart.objects.create()
            cart_session.cart_id = cart
            request.session['cart_id'] = cart.cart_id
        print(request.session['cart_id'])
        cart_session.crop_id = input_crop
        cart_session.save()
        # cart_items = Cart_session.objects.filter(cart_id = cart_session.cart_id)
        # id=[]
        # print(cart_items)
        # for crop in cart_items:
        #     id.append(crop.crop_id.crop_id)
        # print(id)
        # added_crops = Crop.objects.filter(crop_id__in=id).order_by('-availability')
        # crops = Crop.objects.exclude(crop_id__in = id).order_by('-availability')
        # print(crops)
        # context = {'loginform': loginform, 'signupform': signupform, 'page': 'crops', 'crops': crops ,'added_crops':added_crops}
        return HttpResponseRedirect('/crops')
    except:
        return HttpResponseRedirect('/crops')

def remove_from_cart(request,crop_id):
    try:
        input_crop = Crop.objects.get(crop_id = crop_id)
        if request.session.get('cart_id',False):
            cart = Cart.objects.get(cart_id = request.session['cart_id'])
            Cart_session.objects.get(cart_id = cart,crop_id = input_crop).delete()
        return HttpResponseRedirect('/crops')

    except:
        return HttpResponseRedirect('/crops')

def view_cart(request,cart_id):
    dsa=""