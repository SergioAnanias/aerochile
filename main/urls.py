from django.urls import path
from . import views

urlpatterns = [
    path('', views.index),
    path('login', views.login),
    path('register', views.registerForm),
    path('new', views.register),
    path('logout', views.logout),
    path('logged', views.logged),
    path('flights/new', views.newflight),
    path('addflight', views.addflight),
    path('completed/<str:code>', views.completed),
    path('flights/<str:code>', views.viewflight),
    path('flights/<str:code>/newpassenger', views.newpassenger),
    path('flights/<str:code>/addpassenger', views.addpassenger)
]
