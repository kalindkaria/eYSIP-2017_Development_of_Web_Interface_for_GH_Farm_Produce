from django import forms
from .models import Crop, Produce

class LoginForm(forms.Form):
    email = forms.EmailField(label="Email ID", max_length=100, help_text="Enter your email id", label_suffix=":")
    password = forms.CharField(label="Password", help_text="Enter your password", widget=forms.PasswordInput(), label_suffix=":")


class SignUpForm(forms.Form):
    firstname = forms.CharField(label="First Name", max_length=100, label_suffix=":")
    lastname = forms.CharField(label="Last Name", max_length=100, label_suffix=":")
    email = forms.EmailField(label="Email ID", max_length=100, label_suffix=":")
    contact = forms.CharField(label="Contact", max_length=15, label_suffix=":")
    password = forms.CharField(label="Password", widget=forms.PasswordInput(), label_suffix=":")
    repass = forms.CharField(label="Retype Password", widget=forms.PasswordInput(), label_suffix=":")

class CartForm(forms.Form):
    quantity = forms.FloatField(label="Quantity", help_text="Specify quantity", label_suffix=":")


class AnalyticsForm(forms.Form):
    def __init__(self, *args, **kwargs):
        super(AnalyticsForm, self).__init__(*args, **kwargs)
        crop_list = kwargs.pop('crop_list', None)
        self.fields['crops'] = forms.ModelChoiceField(choices = crop_list, widget=forms.CheckboxSelectMultiple)

    start_date = forms.DateField(label="Start Date", required=False)
    end_date = forms.DateField(label="End Date", required=False)
