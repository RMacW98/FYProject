from django.urls import path
from django.conf.urls import url
from . import views

urlpatterns = [
    # path('', views.index, name="home"),
    # path('accounts/sign_up/', views.sign_up, name="sign-up"),
    # path('accounts/login/', views.sign_up, name="login"),
    path('', views.dial, name='dial'),
]
