from django.shortcuts import render, HttpResponseRedirect
from .forms import LoginForm, SignUpForm
from farmapp.models import User


def home(request):
    return render(request, 'base.html')


def index(request):
    loginform = LoginForm()
    signupform = SignUpForm()
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
    return render(request, 'dashboard.html', {'loginform': loginform, 'signupform': signupform})
