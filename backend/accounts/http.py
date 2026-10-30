import json
from functools import wraps
from django.http import JsonResponse


def json_body(request):
    if request.content_type != 'application/json':
        return None, JsonResponse({'message': 'Formato no permitido.'}, status=415)
    if len(request.body) > 4096:
        return None, JsonResponse({'message': 'Solicitud demasiado grande.'}, status=413)
    try:
        body = json.loads(request.body)
    except json.JSONDecodeError:
        return None, JsonResponse({'message': 'Datos no válidos.'}, status=422)
    if not isinstance(body, dict):
        return None, JsonResponse({'message': 'Datos no válidos.'}, status=422)
    return body, None


def json_method(method):
    def decorator(view):
        @wraps(view)
        def wrapped(request, *args, **kwargs):
            if request.method != method:
                response = JsonResponse({'message': 'Método no permitido.'}, status=405)
                response['Allow'] = method
                return response
            return view(request, *args, **kwargs)
        return wrapped
    return decorator
