<?php

declare(strict_types=1);

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

require_once __DIR__ . '/vendor/autoload.php';

function jwt_secret(): string
{
    $secret = getenv('JWT_SECRET') ?: '';
    if (strlen($secret) < 32) {
        throw new RuntimeException('JWT_SECRET debe tener al menos 32 bytes.');
    }

    return $secret;
}

function issue_access_token(int $accountId, string $username): string
{
    $now = time();

    return JWT::encode([
        'iss' => getenv('JWT_ISSUER') ?: 'azerothcore-website',
        'aud' => getenv('JWT_AUDIENCE') ?: 'azerothcore-client',
        'iat' => $now,
        'nbf' => $now,
        'exp' => $now + 900,
        'sub' => (string) $accountId,
        'username' => $username,
    ], jwt_secret(), 'HS256');
}

function set_access_cookie(string $token): void
{
    setcookie('access_token', $token, [
        'expires' => time() + 900,
        'path' => '/',
        'secure' => !empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off',
        'httponly' => true,
        'samesite' => 'Strict',
    ]);
}

function clear_access_cookie(): void
{
    setcookie('access_token', '', [
        'expires' => time() - 3600,
        'path' => '/',
        'secure' => !empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off',
        'httponly' => true,
        'samesite' => 'Strict',
    ]);
}

function authenticated_claims(): array
{
    $token = (string) ($_COOKIE['access_token'] ?? '');
    if ($token === '') {
        throw new RuntimeException('No autenticado.');
    }

    $claims = (array) JWT::decode($token, new Key(jwt_secret(), 'HS256'));
    if (($claims['iss'] ?? null) !== (getenv('JWT_ISSUER') ?: 'azerothcore-website')) {
        throw new RuntimeException('Token no válido.');
    }
    if (($claims['aud'] ?? null) !== (getenv('JWT_AUDIENCE') ?: 'azerothcore-client')) {
        throw new RuntimeException('Token no válido.');
    }

    return $claims;
}
