<?php

declare(strict_types=1);

function database(): mysqli
{
    $db = new mysqli(
        getenv('DB_HOST') ?: 'ac-database',
        getenv('DB_USER') ?: 'acore',
        getenv('DB_PASSWORD') ?: '',
        getenv('DB_NAME') ?: 'acore_auth',
        (int) (getenv('DB_PORT') ?: 3306)
    );

    if ($db->connect_errno) {
        throw new RuntimeException('No se pudo conectar a la base de datos.');
    }

    $db->set_charset('utf8mb4');
    return $db;
}
