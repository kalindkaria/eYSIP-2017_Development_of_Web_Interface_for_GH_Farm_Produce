from django.shortcuts import render, redirect
from .forms import LoginForm, SignUpForm


def home(request):
    if request.method == "POST":
        if request.POST.get("login", ""):
            loginform = LoginForm(request.POST)
            return redirect()
        elif request.POST.get("signup", ""):
            signupform = SignUpForm(request.POST)
    else:
        loginform = LoginForm()
        signupform = SignUpForm()
        return render(request, 'dashboard.html', {'loginform': loginform, 'signupform': signupform})
