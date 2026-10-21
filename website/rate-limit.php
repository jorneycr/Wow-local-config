<?php

declare(strict_types=1);

function enforce_rate_limit(string $bucket, int $limit, int $windowSeconds): void
{
    $directory = sys_get_temp_dir() . '/azerothcore-rate-limit';
    if (!is_dir($directory) && !mkdir($directory, 0700, true) && !is_dir($directory)) {
        throw new RuntimeException('No se pudo inicializar el limitador.');
    }

    $ip = $_SERVER['REMOTE_ADDR'] ?? 'unknown';
    $key = hash('sha256', $bucket . '|' . $ip);
    $path = $directory . '/' . $key;
    $now = time();
    $handle = fopen($path, 'c+');

    if ($handle === false || !flock($handle, LOCK_EX)) {
        throw new RuntimeException('No se pudo aplicar el limitador.');
    }

    $contents = stream_get_contents($handle);
    $state = $contents === '' ? ['started_at' => $now, 'count' => 0] : json_decode($contents, true);
    if (!is_array($state) || $now - (int) ($state['started_at'] ?? 0) >= $windowSeconds) {
        $state = ['started_at' => $now, 'count' => 0];
    }

    $state['count']++;
    ftruncate($handle, 0);
    rewind($handle);
    fwrite($handle, json_encode($state));
    fflush($handle);
    flock($handle, LOCK_UN);
    fclose($handle);

    if ($state['count'] > $limit) {
        header('Retry-After: ' . max(1, $windowSeconds - ($now - $state['started_at'])));
        http_response_code(429);
        echo json_encode(['message' => 'Demasiadas solicitudes. Inténtalo más tarde.']);
        exit;
    }
}
