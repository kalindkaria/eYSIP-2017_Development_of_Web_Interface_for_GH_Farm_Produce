from django.shortcuts import render, HttpResponseRedirect
from .forms import LoginForm, SignUpForm


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
                return HttpResponseRedirect('/home/')
        elif request.POST.get("signup", ""):
            signupform = SignUpForm(request.POST)
            print(signupform)
            if signupform.is_valid():
                print(signupform.cleaned_data)
                return HttpResponseRedirect('/home/')
        else:
            print(request.POST)
    return render(request, 'dashboard.html', {'loginform': loginform, 'signupform': signupform})
