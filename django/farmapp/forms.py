from django import forms
from .models import Crop, Inventory, Produce, User


class LoginForm(forms.Form):
    email = forms.EmailField(label="Email ID", max_length=100, help_text="Enter your email id", label_suffix=":")
    password = forms.CharField(label="Password", help_text="Enter your password", widget=forms.PasswordInput(),
                               label_suffix=":")


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
    crop_list = []
    allcrops = Crop.objects.all()
    for crop in allcrops:
        crop_list.append([str(crop.crop_id), crop.english_name])
    start_date = forms.DateField(label="Start Date", input_formats=['%d.%m.%Y'], required=False)
    end_date = forms.DateField(label="End Date", input_formats=['%d.%m.%Y'], required=False)
    crops = forms.MultipleChoiceField(crop_list, widget=forms.CheckboxSelectMultiple())

    def __init__(self, *args, **kwargs):
        crop_list = kwargs.pop('crop_list', None)
        super(AnalyticsForm, self).__init__(*args, **kwargs)
        self.fields['crops'].choices = crop_list


class CropAnalyticsForm(forms.Form):
    crop_list = []
    allcrops = Crop.objects.all()
    for crop in allcrops:
        crop_list.append([str(crop.crop_id), crop.english_name])
    start_date = forms.DateField(label="Start Date", input_formats=['%m.%Y', '%Y'], required=False)
    end_date = forms.DateField(label="End Date", input_formats=['%m.%Y', '%Y'], required=False)
    time_frame = forms.ChoiceField([('weekly', 'Weekly'), ('monthly', 'Monthly'), ('quaterly', 'Quaterly')])
    crops = forms.ChoiceField(crop_list)

    def __init__(self, *args, **kwargs):
        crop_list = kwargs.pop('crop_list', None)
        super(CropAnalyticsForm, self).__init__(*args, **kwargs)
        self.fields['crops'].choices = crop_list


class InventoryForm(forms.ModelForm):
    class Meta:
        model = Inventory
        fields = ['minimum', 'maximum', 'price', 'shelf_life']

class ProduceForm(forms.ModelForm):
    class Meta:
        model = Produce
        fields = ['farm_id', 'date_of_expiry', 'wasted', 'show_image']

class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['address_line1', 'address_line2', 'state', 'country', 'pin_code', 'contact']
