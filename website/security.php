<?php

declare(strict_types=1);

function send_security_headers(): void
{
    header('Content-Type: application/json; charset=utf-8');
    header('Cache-Control: no-store');
    header('X-Content-Type-Options: nosniff');
    header('Referrer-Policy: no-referrer');
    header("Content-Security-Policy: default-src 'none'; frame-ancestors 'none'; base-uri 'none'");
}

function issue_csrf_token(): string
{
    $token = bin2hex(random_bytes(32));
    setcookie('csrf_token', $token, [
        'expires' => 0,
        'path' => '/',
        'secure' => !empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off',
        'httponly' => false,
        'samesite' => 'Strict',
    ]);

    return $token;
}

function require_csrf(): void
{
    $cookie = (string) ($_COOKIE['csrf_token'] ?? '');
    $header = (string) ($_SERVER['HTTP_X_CSRF_TOKEN'] ?? '');
    if ($cookie === '' || $header === '' || !hash_equals($cookie, $header)) {
        json_response(403, ['message' => 'Solicitud no válida.']);
    }
}
