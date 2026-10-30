from django.db import connections
from django.http import JsonResponse
from django.views.decorators.http import require_GET
from accounts.auth import require_auth


def character_cursor():
    return connections['characters'].cursor()


def character_list_data(request):
    with character_cursor() as cursor:
        cursor.execute('SELECT guid,name,level,race,class,online FROM characters WHERE account = %s ORDER BY name', [request.account_id])
        rows = cursor.fetchall()
    return {'characters': [
        {'guid': row[0], 'name': row[1], 'level': row[2], 'race': row[3], 'class': row[4], 'online': bool(row[5])}
        for row in rows
    ]}


@require_GET
@require_auth
def character_list(request):
    return JsonResponse(character_list_data(request))


@require_GET
@require_auth
def character_detail_data(request):
    try:
        guid = int(request.GET.get('guid', '0'))
    except ValueError:
        return JsonResponse({'message': 'Personaje no válido.'}, status=422)
    if guid < 1:
        return JsonResponse({'message': 'Personaje no válido.'}, status=422)
    with character_cursor() as cursor:
        cursor.execute('SELECT guid,name,level,race,class,gender,xp,money,map,zone,online,totaltime,totalHonorPoints,arenaPoints,totalKills,health,power1,power2,power3,power4,power5,power6,power7,creation_date FROM characters WHERE guid=%s AND account=%s LIMIT 1', [guid, request.account_id])
        row = cursor.fetchone()
    if not row:
        return None
    fields = ['guid','name','level','race','class','gender','xp','money','map','zone','online','totaltime','totalHonorPoints','arenaPoints','totalKills','health','power1','power2','power3','power4','power5','power6','power7','creation_date']
    character = dict(zip(fields, row))
    character['online'] = bool(character['online'])
    return {'character': character}


@require_GET
@require_auth
def character_detail(request):
    result = character_detail_data(request)
    if result is None:
        return JsonResponse({'message': 'Personaje no encontrado.'}, status=404)
    if isinstance(result, JsonResponse):
        return result
    return JsonResponse(result)
