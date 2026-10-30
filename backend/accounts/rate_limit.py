import time
from collections import defaultdict, deque
from functools import wraps
from django.http import JsonResponse

_events = defaultdict(deque)


def limited(bucket, maximum, seconds):
    def decorator(view):
        @wraps(view)
        def wrapped(request, *args, **kwargs):
            now = time.monotonic()
            key = (bucket, request.META.get('REMOTE_ADDR', 'unknown'))
            events = _events[key]
            while events and now - events[0] >= seconds:
                events.popleft()
            if len(events) >= maximum:
                response = JsonResponse({'message': 'Demasiadas solicitudes. Inténtalo más tarde.'}, status=429)
                response['Retry-After'] = str(seconds)
                return response
            events.append(now)
            return view(request, *args, **kwargs)
        return wrapped
    return decorator
