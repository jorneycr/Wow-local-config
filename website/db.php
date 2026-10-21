<?php

declare(strict_types=1);

function database(string $database = 'auth'): mysqli
{
    $databaseName = $database === 'characters' ? 'acore_characters' : 'acore_auth';
    $db = new mysqli(
        getenv('DB_HOST') ?: 'ac-database',
        getenv('DB_USER') ?: 'acore',
        getenv('DB_PASSWORD') ?: '',
        $databaseName,
        (int) (getenv('DB_PORT') ?: 3306)
    );

    if ($db->connect_errno) {
        throw new RuntimeException('No se pudo conectar a la base de datos.');
    }

    $db->set_charset('utf8mb4');
    return $db;
}
