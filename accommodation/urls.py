from django.conf.urls import url
from django.urls import path
from . import views

app_name = "accommodation"

urlpatterns = [
    url(r'^$', views.index_view, name='index'),
    url(r'^index/$', views.index_view, name='index'),
    url(r'^reservation/$', views.reservation_view, name='reservation'),
    url(r'^property/$', views.property_view, name='property'),
    url(r'^imageUploader/$', views.imageUploader_view, name='imageUploader'),
    path('propertyDetailed/<int:pk>/', views.propertyDetailed_view, name='propertyDetailed'),
    path('delete/<int:pk>/', views.deleteReservation_view, name='deleteReservation'),
]