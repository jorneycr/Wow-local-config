<?php

declare(strict_types=1);

function validate_username(mixed $value): string
{
    $username = strtoupper(trim((string) $value));
    if (preg_match('/^[A-Z0-9]{3,16}$/', $username) !== 1) {
        json_response(422, ['message' => 'El usuario debe tener entre 3 y 16 caracteres alfanuméricos.']);
    }

    return $username;
}

function validate_email(mixed $value): string
{
    $email = strtolower(trim((string) $value));
    if (filter_var($email, FILTER_VALIDATE_EMAIL) === false || strlen($email) > 255) {
        json_response(422, ['message' => 'Introduce un correo electrónico válido.']);
    }

    return $email;
}

function validate_password(mixed $value): string
{
    $password = (string) $value;
    if (preg_match('/^[\x21-\x7E]{8,32}$/', $password) !== 1) {
        json_response(422, ['message' => 'La contraseña debe tener entre 8 y 32 caracteres imprimibles.']);
    }

    return $password;
}
