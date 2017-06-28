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
    url(r'^logout/$', views.log_out, name='logout'),
    url(r'^producer/home/$', views.producer_home, name='producer_home'),
    url(r'^producer/inventory/$', views.producer_inventory, name='producer_inventory'),
    url(r'^about/$', views.about, name='about'),
    url(r'^crops/$', views.crops, name='crops'),
    url(r'^shop/addcart/(?P<crop_id>[0-9]+)/$', views.add_to_cart, name='add_to_cart'),
    url(r'^shop/removecart/(?P<crop_id>[0-9]+)/$', views.remove_from_cart, name='remove_from_cart'),
    url(r'^cart/$', views.view_cart, name='cart'),
    url(r'^predict', predict_view.predict, name='predict'),
    url(r'^checkout/$', views.checkout, name='checkout'),
    url(r'^order/$', views.order_summary, name='order'),
    url(r'^producer/analytics/$', views.analytics, name='analytics'),
    url(r'^producer/orders/$', views.producer_orders, name='producer_orders'),
    url(r'^producer/pendingorders/$', views.producer_pending_orders, name='producer_orders'),
    url(r'^consumer/orders/$', views.consumer_orders, name='consumer_orders'),
    url(r'^consumer/cancel_order/(?P<cart_id>[0-9]+)/(?P<seller>[0-9]+)/(?P<crop_id>[0-9]+)$',
        views.consumer_order_cancel, name='consumer_order_cancel'),
    url(r'^producer/reject_order/(?P<cart_id>[0-9]+)/(?P<buyer>[0-9]+)/(?P<crop_id>[0-9]+)$',
        views.producer_order_reject, name='producer_order_reject'),
    url(r'^producer/download/', views.download, name='download'),
    url(r'^producer/alerts/$', views.alerts, name='produceralerts'),
    url(r'^consumer/alerts/$', views.alerts, name='consumeralerts'),
    url(r'^producer/analytics/crop/$', views.crop_analytics, name='crop_analytics'),
    url(r'^producer/delivery/$', views.producer_delivery, name='producer_delivery'),
    url(r'^producer/reject_order/(?P<cart_id>[0-9]+)/(?P<buyer>[0-9]+)/$', views.producer_order_deliver,
        name='producer_order_deliver'),
    url(r'^producer/deliveredorders/$', views.producer_delivered, name='producer_delivered'),
    url(r'^consumer/deliveredorders/$', views.consumer_delivered, name='consumer_delivered'),
    url(r'^producer/edit_inventory/(?P<crop_id>[0-9]+)/$', views.edit_inventory, name='edit_inventory'),
    url(r'^producer/edit_produce/(?P<produce_pk>[0-9]+)/$', views.edit_produce, name='edit_produce'),
    url(r'^producer/profile/$', views.producer_profile, name='producer_profile'),
    url(r'^consumer/profile/$', views.consumer_profile, name='consumer_profile'),
    url(r'^processreview/(?P<cart_id>[0-9]+)/(?P<seller>[0-9]+)$', views.process_review, name='process_review')
]
