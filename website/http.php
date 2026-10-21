<?php

declare(strict_types=1);

function json_response(int $status, array $payload): never
{
    http_response_code($status);
    echo json_encode($payload, JSON_UNESCAPED_UNICODE);
    exit;
}

function request_json(): array
{
    $contentType = strtolower((string) ($_SERVER['CONTENT_TYPE'] ?? ''));
    if (!str_starts_with($contentType, 'application/json')) {
        json_response(415, ['message' => 'Formato no permitido.']);
    }

    $body = file_get_contents('php://input');
    if (strlen($body) > 4096) {
        json_response(413, ['message' => 'Solicitud demasiado grande.']);
    }

    try {
        $payload = json_decode($body, true, 8, JSON_THROW_ON_ERROR);
    } catch (JsonException) {
        json_response(422, ['message' => 'Datos no válidos.']);
    }

    if (!is_array($payload)) {
        json_response(422, ['message' => 'Datos no válidos.']);
    }

    return $payload;
}

function require_method(string $method): void
{
    if ($_SERVER['REQUEST_METHOD'] !== $method) {
        header('Allow: ' . $method);
        json_response(405, ['message' => 'Método no permitido.']);
    }
}
