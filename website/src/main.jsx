import { StrictMode, useState } from 'react';
import { createRoot } from 'react-dom/client';
import './styles.css';

const initialForm = { username: '', password: '', confirmation: '' };

async function apiRequest(path, options = {}) {
  const response = await fetch(path, { ...options, credentials: 'same-origin' });
  const payload = await response.json();
  if (!response.ok) throw new Error(payload.message || 'La solicitud no pudo completarse.');
  return payload;
}

async function csrfToken() {
  const response = await fetch('/api/register', { credentials: 'same-origin' });
  const payload = await response.json();
  if (!response.ok || typeof payload.csrf_token !== 'string') {
    throw new Error('No se pudo validar la sesión.');
  }
  return payload.csrf_token;
}

function App() {
  const [form, setForm] = useState(initialForm);
  const [login, setLogin] = useState({ username: '', password: '' });
  const [account, setAccount] = useState(null);
  const [characters, setCharacters] = useState([]);
  const [mode, setMode] = useState('login');
  const [status, setStatus] = useState(null);
  const [isSubmitting, setIsSubmitting] = useState(false);

  const updateField = (event) => {
    setForm((current) => ({ ...current, [event.target.name]: event.target.value }));
  };

  const updateLogin = (event) => {
    setLogin((current) => ({ ...current, [event.target.name]: event.target.value }));
  };

  const submitLogin = async (event) => {
    event.preventDefault();
    setStatus(null);

    if (login.username.trim() === '' || login.password === '') {
      setStatus({ type: 'error', text: 'Introduce tu usuario y contraseña.' });
      return;
    }

    setIsSubmitting(true);
    try {
      const token = await csrfToken();
      await apiRequest('/api/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': token },
        body: JSON.stringify({ ...login }),
      });
      const session = await apiRequest('/api/me');
      const result = await apiRequest('/api/characters');
      setAccount(session);
      setCharacters(result.characters);
    } catch (error) {
      setStatus({ type: 'error', text: error.message });
    } finally {
      setIsSubmitting(false);
    }
  };

  const submit = async (event) => {
    event.preventDefault();
    setStatus(null);

    if (!/^[A-Za-z0-9]{3,16}$/.test(form.username)) {
      setStatus({ type: 'error', text: 'Usa entre 3 y 16 caracteres alfanuméricos.' });
      return;
    }
    if (!/^[\x21-\x7E]{8,32}$/.test(form.password)) {
      setStatus({ type: 'error', text: 'La contraseña debe tener entre 8 y 32 caracteres.' });
      return;
    }
    if (form.password !== form.confirmation) {
      setStatus({ type: 'error', text: 'Las contraseñas no coinciden.' });
      return;
    }

    setIsSubmitting(true);
    try {
      const token = await csrfToken();
      const response = await fetch('/api/register', {
        method: 'POST',
        credentials: 'same-origin',
        headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': token },
        body: JSON.stringify({
          username: form.username,
          password: form.password,
          password_confirmation: form.confirmation,
        }),
      });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload.message || 'No se pudo crear la cuenta.');
      setStatus({ type: 'success', text: payload.message });
      setForm(initialForm);
    } catch (error) {
      setStatus({ type: 'error', text: error.message });
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <main className="shell">
      <section className="hero">
        <p className="eyebrow">Azeroth Local · WotLK 3.3.5a</p>
        <h1>Tu reino empieza aquí.</h1>
        <p className="intro">Crea tu cuenta y entra a un servidor local construido para explorar.</p>
        <div className="status-pill"><span /> Reino local disponible</div>
      </section>

      <section className="panel">
        <div className="panel-heading">
          <div><p className="eyebrow">Cuenta</p><h2>{account ? `Hola, ${account.username}` : 'Entrar o registrarse'}</h2></div>
          <span className="realm-badge">127.0.0.1</span>
        </div>

        {account ? (
          <div className="account-panel">
            <p className="panel-copy">Tus personajes</p>
            {characters.length === 0 ? <p className="hint">No hay personajes asociados.</p> : (
              <ul className="character-list">
                {characters.map((character) => (
                  <li key={character.name}>
                    <strong>{character.name}</strong>
                    <span>Nivel {character.level}{character.online ? ' · En línea' : ''}</span>
                  </li>
                ))}
              </ul>
            )}
            <p className="hint">El cambio de contraseña estará disponible después de completar el flujo SRP6.</p>
            <button type="button" onClick={async () => {
              try {
                const token = await csrfToken();
                await apiRequest('/api/logout', {
                  method: 'POST',
                  headers: { 'X-CSRF-Token': token },
                });
                setAccount(null);
                setCharacters([]);
              } catch (error) {
                setStatus({ type: 'error', text: error.message });
              }
            }}>Cerrar sesión</button>
          </div>
        ) : (
          <>
            {mode === 'login' ? (
              <form onSubmit={submitLogin} noValidate>
                <p className="eyebrow form-label">Iniciar sesión</p>
                <label>Usuario<input name="username" value={login.username} onChange={updateLogin} autoComplete="username" required /></label>
                <label>Contraseña<input type="password" name="password" value={login.password} onChange={updateLogin} autoComplete="current-password" required /></label>
                <button type="submit" disabled={isSubmitting}>{isSubmitting ? 'Validando…' : 'Iniciar sesión'}</button>
              </form>
            ) : (
              <form onSubmit={submit} noValidate>
                <p className="eyebrow form-label">Crear cuenta</p>
                <label>Usuario<input name="username" value={form.username} onChange={updateField} minLength="3" maxLength="16" autoComplete="username" required /></label>
                <label>Contraseña<input type="password" name="password" value={form.password} onChange={updateField} minLength="8" maxLength="32" autoComplete="new-password" required /></label>
                <label>Confirmar contraseña<input type="password" name="confirmation" value={form.confirmation} onChange={updateField} minLength="8" maxLength="32" autoComplete="new-password" required /></label>
                <button type="submit" disabled={isSubmitting}>{isSubmitting ? 'Validando…' : 'Crear cuenta'}</button>
              </form>
            )}
            <button
              className="secondary-button"
              type="button"
              onClick={() => {
                setMode((current) => current === 'login' ? 'register' : 'login');
                setStatus(null);
              }}
            >
              {mode === 'login' ? 'Crear una cuenta nueva' : 'Ya tengo una cuenta'}
            </button>
          </>
        )}
        {status && <p className={`message ${status.type}`}>{status.text}</p>}
        <p className="hint">El registro y login quedan protegidos y pendientes de SRP6 compatible con la revisión instalada.</p>
      </section>
    </main>
  );
}

createRoot(document.getElementById('root')).render(<StrictMode><App /></StrictMode>);
