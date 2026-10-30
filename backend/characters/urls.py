from django.urls import path
from .api import character_list, character_detail

urlpatterns = [
    path('characters', character_list),
    path('character', character_detail),
]
