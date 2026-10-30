import os
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent
SECRET_KEY = os.getenv('DJANGO_SECRET_KEY', 'local-only-change-me')
DEBUG = os.getenv('DJANGO_DEBUG', '0') == '1'
ALLOWED_HOSTS = ['*']
ROOT_URLCONF = 'config.urls'
WSGI_APPLICATION = 'config.wsgi.application'
INSTALLED_APPS = ['django.contrib.contenttypes', 'django.contrib.auth', 'rest_framework', 'accounts', 'characters']
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
]
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'acore_auth',
        'USER': os.getenv('DB_USER', 'website'),
        'PASSWORD': os.getenv('DB_PASSWORD', 'change_this_website_password'),
        'HOST': os.getenv('DB_HOST', 'ac-database'),
        'PORT': os.getenv('DB_PORT', '3306'),
    },
    'characters': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'acore_characters',
        'USER': os.getenv('DB_USER', 'website'),
        'PASSWORD': os.getenv('DB_PASSWORD', 'change_this_website_password'),
        'HOST': os.getenv('DB_HOST', 'ac-database'),
        'PORT': os.getenv('DB_PORT', '3306'),
    },
}
DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
USE_TZ = True
ROOT_URLCONF = 'config.urls'
JWT_SECRET = os.getenv('JWT_SECRET', 'change-this-django-jwt-secret-at-least-32-bytes')
JWT_ISSUER = os.getenv('JWT_ISSUER', 'azerothcore-django')
JWT_AUDIENCE = os.getenv('JWT_AUDIENCE', 'azerothcore-client')
SESSION_COOKIE_SECURE = os.getenv('COOKIE_SECURE', '0') == '1'
CSRF_COOKIE_SECURE = SESSION_COOKIE_SECURE
CSRF_COOKIE_SAMESITE = 'Strict'
SESSION_COOKIE_SAMESITE = 'Strict'
