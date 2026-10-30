import time
import jwt
from django.conf import settings
from django.http import JsonResponse

COOKIE = 'access_token'


def issue_token(account_id: int, username: str) -> str:
    now = int(time.time())
    return jwt.encode({
        'iss': settings.JWT_ISSUER,
        'aud': settings.JWT_AUDIENCE,
        'iat': now,
        'nbf': now,
        'exp': now + 900,
        'sub': str(account_id),
        'username': username,
    }, settings.JWT_SECRET, algorithm='HS256')


def set_token(response, token):
    response.set_cookie(COOKIE, token, max_age=900, httponly=True, secure=settings.SESSION_COOKIE_SECURE, samesite='Strict')


def clear_token(response):
    response.delete_cookie(COOKIE)


def claims(request):
    token = request.COOKIES.get(COOKIE)
    if not token:
        return None
    try:
        return jwt.decode(token, settings.JWT_SECRET, algorithms=['HS256'], issuer=settings.JWT_ISSUER, audience=settings.JWT_AUDIENCE)
    except jwt.InvalidTokenError:
        return None


def require_auth(view):
    def wrapped(request, *args, **kwargs):
        payload = claims(request)
        if payload is None:
            return JsonResponse({'message': 'No autenticado.'}, status=401)
        request.account_id = int(payload['sub'])
        request.account_username = payload['username']
        return view(request, *args, **kwargs)
    return wrapped
