export async function apiRequest(path, options = {}) {
  const response = await fetch(path, { ...options, credentials: 'same-origin' });
  const payload = await response.json();
  if (!response.ok) throw new Error(payload.message || 'La solicitud no pudo completarse.');
  return payload;
}

export async function csrfToken() {
  const response = await fetch('/api/register', { credentials: 'same-origin' });
  const payload = await response.json();
  if (!response.ok || typeof payload.csrf_token !== 'string') {
    throw new Error('No se pudo validar la sesión.');
  }
  return payload.csrf_token;
}
