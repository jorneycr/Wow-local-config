from django.db import connections, transaction
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_protect, ensure_csrf_cookie
from django.views.decorators.http import require_GET, require_POST
from .auth import clear_token, issue_token, require_auth, set_token
from .http import json_body
from .rate_limit import limited
from .security import password_matches, registration_data


def validate_email(value):
    from django.core.validators import validate_email as django_validate_email
    from django.core.exceptions import ValidationError
    value = str(value or '').strip().lower()
    try:
        django_validate_email(value)
    except ValidationError:
        return None
    return value if len(value) <= 255 else None


def validate_password(value):
    value = str(value or '')
    return value if 8 <= len(value) <= 32 and all(33 <= ord(char) <= 126 for char in value) else None


def auth_cursor():
    return connections['default'].cursor()


@ensure_csrf_cookie
@require_GET
def csrf(request):
    from django.middleware.csrf import get_token
    return JsonResponse({'csrf_token': get_token(request)})


@csrf_protect
@limited('register', 5, 900)
@require_POST
def register(request):
    body, error = json_body(request)
    if error:
        return error
    email = validate_email(body.get('email'))
    username = str(body.get('username', '')).strip().upper()
    password = validate_password(body.get('password'))
    if not email or not 3 <= len(username) <= 16 or not username.isalnum() or not password:
        return JsonResponse({'message': 'Datos de registro no válidos.'}, status=422)
    if password != body.get('password_confirmation'):
        return JsonResponse({'message': 'Las contraseñas no coinciden.'}, status=422)
    salt, verifier = registration_data(username, password)
    with transaction.atomic(using='default'):
        with auth_cursor() as cursor:
            cursor.execute('SELECT id FROM account WHERE username = %s OR LOWER(email) = %s LIMIT 1', [username, email])
            if cursor.fetchone():
                return JsonResponse({'message': 'El usuario o correo ya está registrado.'}, status=409)
            cursor.execute('INSERT INTO account (username,email,reg_mail,salt,verifier,expansion,joindate) VALUES (%s,%s,%s,%s,%s,2,NOW())', [username, email, email, salt, verifier])
    return JsonResponse({'message': 'Cuenta creada correctamente.'}, status=201)


@csrf_protect
@limited('login', 10, 900)
@require_POST
def login(request):
    body, error = json_body(request)
    if error:
        return error
    email = validate_email(body.get('email'))
    password = validate_password(body.get('password'))
    if not email or not password:
        return JsonResponse({'message': 'Usuario o contraseña incorrectos.'}, status=401)
    with auth_cursor() as cursor:
        cursor.execute('SELECT id, username, salt, verifier, locked FROM account WHERE LOWER(email) = %s LIMIT 1', [email])
        account = cursor.fetchone()
    if not account or account[4] or not password_matches(account[1], password, account[2], account[3]):
        return JsonResponse({'message': 'Usuario o contraseña incorrectos.'}, status=401)
    response = JsonResponse({'message': 'Sesión iniciada.'})
    set_token(response, issue_token(account[0], account[1]))
    return response


@require_GET
@require_auth
def me(request):
    with auth_cursor() as cursor:
        cursor.execute('SELECT username,email,joindate,last_login,last_ip FROM account WHERE id = %s LIMIT 1', [request.account_id])
        account = cursor.fetchone()
    if not account:
        return JsonResponse({'message': 'No autenticado.'}, status=401)
    return JsonResponse({'id': request.account_id, 'username': account[0], 'email': account[1], 'joindate': account[2], 'last_login': account[3], 'last_ip': account[4]})


@csrf_protect
@require_POST
@require_auth
def logout(request):
    response = JsonResponse({'message': 'Sesión cerrada.'})
    clear_token(response)
    return response


@csrf_protect
@limited('password', 5, 900)
@require_POST
@require_auth
def password_change(request):
    body, error = json_body(request)
    if error:
        return error
    current = validate_password(body.get('current_password'))
    new = validate_password(body.get('new_password'))
    if not current or not new or new != body.get('new_password_confirmation'):
        return JsonResponse({'message': 'Datos de contraseña no válidos.'}, status=422)
    with auth_cursor() as cursor:
        cursor.execute('SELECT username,salt,verifier FROM account WHERE id = %s LIMIT 1', [request.account_id])
        account = cursor.fetchone()
    if not account or not password_matches(account[0], current, account[1], account[2]):
        return JsonResponse({'message': 'La contraseña actual no es correcta.'}, status=401)
    salt, verifier = registration_data(account[0], new)
    with auth_cursor() as cursor:
        cursor.execute('UPDATE account SET salt=%s, verifier=%s WHERE id=%s', [salt, verifier, request.account_id])
    response = JsonResponse({'message': 'Contraseña actualizada. Inicia sesión nuevamente.'})
    clear_token(response)
    return response
