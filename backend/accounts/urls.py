from django.urls import path
from .api import csrf, login, logout, me, password_change, register

urlpatterns = [
    path('csrf', csrf, name='csrf'),
    path('register', register, name='register'),
    path('login', login),
    path('logout', logout),
    path('password', password_change),
    path('me', me),
]
