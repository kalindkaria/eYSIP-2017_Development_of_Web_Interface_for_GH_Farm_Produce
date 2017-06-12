"""ghfarm URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from farmapp import views
from machine import views as machine_views
from predict import views as predict_view

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', views.index, name='index'),
    url(r'^machine/$', machine_views.data_entry, name='data_entry'),
    url(r'^home/$', views.home, name='home'),
    url(r'^logout/$', views.logout, name='logout'),
    url(r'^login/$', views.login, name="login"),
    url(r'^producer/home/$', views.producer_home, name='producer_home'),
    url(r'^producer/inventory/$', views.producer_inventory, name='producer_inventory'),
    url(r'^about/$', views.about, name='about'),
    url(r'^crops/$', views.crops, name='crops'),
    url(r'^shop/addcart/(?P<crop_id>[0-9]+)/$', views.add_to_cart, name='add_to_cart'),
    url(r'^shop/removecart/(?P<crop_id>[0-9]+)/$', views.remove_from_cart, name='remove_from_cart'),
    url(r'^cart/$', views.view_cart, name='cart'),
    url(r'^graph/$', views.graph, name='graph'),
    url(r'^predict', predict_view.predict, name='predict'),
    url(r'^checkout/$', views.checkout, name='checkout')
]

