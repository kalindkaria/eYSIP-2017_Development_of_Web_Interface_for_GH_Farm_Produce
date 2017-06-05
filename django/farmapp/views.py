from django.shortcuts import render, HttpResponseRedirect
from .forms import LoginForm, SignUpForm
from farmapp.models import User,Produce,Machine,Trough,Inventory
from django.views.decorators.cache import cache_control


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
<<<<<<< HEAD
        user = User.objects.get(pk=request.session['user_id'])
        machines = Machine.objects.filter(user_id=user)
        produce = list(Produce.objects.filter(machine_id__in=machines))

        print(produce)
        return render(request, 'producer.html', {'page': "home", 'produce': produce})
    return HttpResponseRedirect('/')


def about(request):
    loginform = LoginForm()
    signupform = SignUpForm()
    return render(request, 'about.html', {'loginform': loginform, 'signupform': signupform, 'page': 'about'})


def crops(request):
    loginform = LoginForm()
    signupform = SignUpForm()
    return render(request, 'crops.html', {'loginform': loginform, 'signupform': signupform, 'page': 'crops'})
=======
        user = User.objects.get(pk = request.session['user_id'])
        inventory = Inventory.objects.filter(user_id = user)
        return render(request, 'producer_inventory.html', {'page': "inventory",'inventory':inventory})
    return HttpResponseRedirect('/')
>>>>>>> 755195d270f27e4d6068eed9ea670b839022883e
