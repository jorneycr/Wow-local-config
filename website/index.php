<?php

declare(strict_types=1);

require_once __DIR__ . '/db.php';

$message = null;
$error = null;

function valid_username(string $username): bool
{
    return preg_match('/^[A-Za-z0-9]{3,16}$/', $username) === 1;
}

function valid_password(string $password): bool
{
    return preg_match('/^[\\x21-\\x7E]{8,32}$/', $password) === 1;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = strtoupper(trim((string) ($_POST['username'] ?? '')));
    $password = (string) ($_POST['password'] ?? '');
    $confirmation = (string) ($_POST['password_confirmation'] ?? '');

    if (!valid_username($username)) {
        $error = 'El usuario debe tener entre 3 y 16 caracteres alfanuméricos.';
    } elseif (!valid_password($password)) {
        $error = 'La contraseña debe tener entre 8 y 32 caracteres imprimibles.';
    } elseif (!hash_equals($password, $confirmation)) {
        $error = 'Las contraseñas no coinciden.';
    } else {
        $error = 'La validación está lista, pero la creación SRP6 debe conectarse a la revisión exacta de AzerothCore instalada.';
    }
}
?>
<!doctype html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registro AzerothCore</title>
</head>
<body>
    <h1>Crear cuenta</h1>

    <?php if ($message !== null): ?>
        <p><?= htmlspecialchars($message, ENT_QUOTES, 'UTF-8') ?></p>
    <?php endif; ?>

    <?php if ($error !== null): ?>
        <p><?= htmlspecialchars($error, ENT_QUOTES, 'UTF-8') ?></p>
    <?php endif; ?>

    <form method="post">
        <label>
            Usuario
            <input name="username" minlength="3" maxlength="16" required>
        </label>
        <br>
        <label>
            Contraseña
            <input type="password" name="password" minlength="8" maxlength="32" required>
        </label>
        <br>
        <label>
            Repetir contraseña
            <input type="password" name="password_confirmation" minlength="8" maxlength="32" required>
        </label>
        <br>
        <button type="submit">Registrarse</button>
    </form>
</body>
</html>
