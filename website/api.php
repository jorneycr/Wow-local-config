<?php

declare(strict_types=1);

require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/db.php';
require_once __DIR__ . '/http.php';
require_once __DIR__ . '/security.php';
require_once __DIR__ . '/rate-limit.php';
require_once __DIR__ . '/validation.php';
require_once __DIR__ . '/auth.php';
require_once __DIR__ . '/srp6.php';

send_security_headers();

$path = parse_url($_SERVER['REQUEST_URI'] ?? '/', PHP_URL_PATH) ?: '/';
$method = $_SERVER['REQUEST_METHOD'] ?? 'GET';

if ($path === '/api/register' && $method === 'GET') {
    json_response(200, ['csrf_token' => issue_csrf_token()]);
}

if ($path === '/api/register' && $method === 'POST') {
    enforce_rate_limit('register', 5, 900);
    require_csrf();
    $input = request_json();
    $email = validate_email($input['email'] ?? null);
    $username = validate_username($input['username'] ?? null);
    $password = validate_password($input['password'] ?? null);
    $confirmation = (string) ($input['password_confirmation'] ?? '');

    if (!hash_equals($password, $confirmation)) {
        json_response(422, ['message' => 'Las contraseñas no coinciden.']);
    }

    json_response(501, ['message' => 'El registro SRP6 todavía está pendiente de activación.', 'email' => $email]);
}

if ($path === '/api/login' && $method === 'POST') {
    enforce_rate_limit('login', 10, 900);
    require_csrf();
    $input = request_json();
    $email = validate_email($input['email'] ?? null);
    $password = validate_password($input['password'] ?? null);
    $db = database();
    $statement = $db->prepare('SELECT id, username, email, salt, verifier, locked FROM account WHERE LOWER(email) = ? LIMIT 1');
    $statement->bind_param('s', $email);
    $statement->execute();
    $account = $statement->get_result()->fetch_assoc();

    if (!is_array($account) || (int) $account['locked'] !== 0 || !srp6_password_matches(
        (string) ($account['username'] ?? ''),
        $password,
        (string) $account['salt'],
        (string) $account['verifier']
    )) {
        json_response(401, ['message' => 'Usuario o contraseña incorrectos.']);
    }

    set_access_cookie(issue_access_token((int) $account['id'], (string) $account['username']));
    json_response(200, ['message' => 'Sesión iniciada.']);
}

if (in_array($path, ['/api/me', '/api/characters'], true) && $method === 'GET') {
    try {
        $claims = authenticated_claims();
    } catch (Throwable) {
        json_response(401, ['message' => 'No autenticado.']);
    }

    $accountId = (int) ($claims['sub'] ?? 0);
    if ($path === '/api/me') {
        $db = database();
        $statement = $db->prepare('SELECT username, email, joindate, last_login, last_ip FROM account WHERE id = ? LIMIT 1');
        $statement->bind_param('i', $accountId);
        $statement->execute();
        $account = $statement->get_result()->fetch_assoc();
        if (!is_array($account)) {
            json_response(401, ['message' => 'No autenticado.']);
        }

        json_response(200, [
            'id' => $accountId,
            'username' => (string) $account['username'],
            'email' => (string) $account['email'],
            'joindate' => $account['joindate'],
            'last_login' => $account['last_login'],
            'last_ip' => (string) $account['last_ip'],
        ]);
    }

    $db = database('characters');
    $statement = $db->prepare(
        'SELECT name, level, race, class, online FROM characters WHERE account = ? ORDER BY name'
    );
    $statement->bind_param('i', $accountId);
    $statement->execute();
    $result = $statement->get_result();
    $characters = [];
    while ($character = $result->fetch_assoc()) {
        $characters[] = [
            'name' => $character['name'],
            'level' => (int) $character['level'],
            'race' => (int) $character['race'],
            'class' => (int) $character['class'],
            'online' => (bool) $character['online'],
        ];
    }

    json_response(200, ['characters' => $characters]);
}

if ($path === '/api/logout' && $method === 'POST') {
    require_csrf();
    clear_access_cookie();
    json_response(200, ['message' => 'Sesión cerrada.']);
}

json_response(404, ['message' => 'Recurso no encontrado.']);
