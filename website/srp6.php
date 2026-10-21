<?php

declare(strict_types=1);

function srp6_registration_data(string $username, string $password): array
{
    if (!extension_loaded('gmp')) {
        throw new RuntimeException('La extensión GMP es necesaria para SRP6.');
    }

    $salt = random_bytes(32);
    $verifier = srp6_verifier(
        strtoupper_basic_latin($username),
        strtoupper_basic_latin($password),
        $salt
    );

    return ['salt' => $salt, 'verifier' => $verifier];
}

function srp6_password_matches(string $username, string $password, string $salt, string $verifier): bool
{
    if (strlen($salt) !== 32 || strlen($verifier) !== 32 || !extension_loaded('gmp')) {
        return false;
    }

    $username = strtoupper_basic_latin($username);
    $password = strtoupper_basic_latin($password);
    return hash_equals($verifier, srp6_verifier($username, $password, $salt));
}

function strtoupper_basic_latin(string $value): string
{
    return preg_replace_callback('/[a-z]/', static fn (array $match): string => strtoupper($match[0]), $value);
}

function srp6_verifier(string $username, string $password, string $salt): string
{
    $identityHash = sha1($username . ':' . $password, true);
    $x = gmp_import(sha1($salt . $identityHash, true), 1, GMP_LSW_FIRST | GMP_LITTLE_ENDIAN);
    $modulus = gmp_init('894B645E89E1535BBDAD5B8B290650530801B18EBFBF5E8FAB3C82872A3E9BB7', 16);
    $verifier = gmp_powm(gmp_init('7'), $x, $modulus);

    return srp6_little_endian_bytes($verifier, 32);
}

function srp6_little_endian_bytes(GMP $number, int $length): string
{
    $bytes = gmp_export($number, 1, GMP_LSW_FIRST | GMP_LITTLE_ENDIAN);
    if ($bytes === false) {
        $bytes = '';
    }

    return str_pad(substr($bytes, 0, $length), $length, "\0", STR_PAD_RIGHT);
}
