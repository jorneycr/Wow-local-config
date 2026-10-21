import { StrictMode, useState } from 'react';
import { createRoot } from 'react-dom/client';
import './styles.css';

const initialForm = { email: '', username: '', password: '', confirmation: '' };

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
  const [login, setLogin] = useState({ email: '', password: '' });
  const [passwordForm, setPasswordForm] = useState({ current: '', next: '', confirmation: '' });
  const [account, setAccount] = useState(null);
  const [characters, setCharacters] = useState([]);
  const [mode, setMode] = useState('login');
  const [visibleFields, setVisibleFields] = useState({ login: false, password: false, confirmation: false });
  const [status, setStatus] = useState(null);
  const [isSubmitting, setIsSubmitting] = useState(false);

  const updateField = (event) => {
    setForm((current) => ({ ...current, [event.target.name]: event.target.value }));
  };

  const updateLogin = (event) => {
    setLogin((current) => ({ ...current, [event.target.name]: event.target.value }));
  };

  const togglePassword = (field) => {
    setVisibleFields((current) => ({ ...current, [field]: !current[field] }));
  };

  const updatePassword = (event) => {
    setPasswordForm((current) => ({ ...current, [event.target.name]: event.target.value }));
  };

  const submitPasswordChange = async (event) => {
    event.preventDefault();
    setStatus(null);
    if (passwordForm.next !== passwordForm.confirmation) {
      setStatus({ type: 'error', text: 'Las contraseñas nuevas no coinciden.' });
      return;
    }
    setIsSubmitting(true);
    try {
      const token = await csrfToken();
      await apiRequest('/api/password', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': token },
        body: JSON.stringify({
          current_password: passwordForm.current,
          new_password: passwordForm.next,
          new_password_confirmation: passwordForm.confirmation,
        }),
      });
      setPasswordForm({ current: '', next: '', confirmation: '' });
      setAccount(null);
      setCharacters([]);
      setStatus({ type: 'success', text: 'Contraseña actualizada. Inicia sesión nuevamente.' });
    } catch (error) {
      setStatus({ type: 'error', text: error.message });
    } finally {
      setIsSubmitting(false);
    }
  };

  const submitLogin = async (event) => {
    event.preventDefault();
    setStatus(null);

    if (login.email.trim() === '' || login.password === '') {
      setStatus({ type: 'error', text: 'Introduce tu correo y contraseña.' });
      return;
    }

    setIsSubmitting(true);
    try {
      const token = await csrfToken();
      await apiRequest('/api/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': token },
        body: JSON.stringify({ email: login.email, password: login.password }),
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

    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.email)) {
      setStatus({ type: 'error', text: 'Introduce un correo electrónico válido.' });
      return;
    }
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
          email: form.email,
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
            <p className="eyebrow">Resumen de mi cuenta</p>
            <div className="account-summary">
              <div><span>Correo electrónico</span><strong>{account.email || 'No configurado'}</strong></div>
              <div><span>Nombre de usuario</span><strong>{account.username}</strong></div>
              <div><span>Registrado desde</span><strong>{account.joindate || '—'}</strong></div>
              <div><span>Última conexión</span><strong>{account.last_login || '—'}</strong></div>
            </div>
            <p className="eyebrow section-label">Mis personajes</p>
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
            <div className="security-card">
              <p className="eyebrow">Seguridad de la cuenta</p>
              <form onSubmit={submitPasswordChange} noValidate>
                <label>Contraseña actual<div className="password-field"><input type={visibleFields.current ? 'text' : 'password'} name="current" value={passwordForm.current} onChange={updatePassword} required /><button className="password-toggle" type="button" onClick={() => togglePassword('current')}>{visibleFields.current ? 'Ocultar' : 'Mostrar'}</button></div></label>
                <label>Nueva contraseña<div className="password-field"><input type={visibleFields.next ? 'text' : 'password'} name="next" value={passwordForm.next} onChange={updatePassword} minLength="8" maxLength="32" required /><button className="password-toggle" type="button" onClick={() => togglePassword('next')}>{visibleFields.next ? 'Ocultar' : 'Mostrar'}</button></div></label>
                <label>Confirmar nueva contraseña<div className="password-field"><input type={visibleFields.confirmation ? 'text' : 'password'} name="confirmation" value={passwordForm.confirmation} onChange={updatePassword} minLength="8" maxLength="32" required /><button className="password-toggle" type="button" onClick={() => togglePassword('confirmation')}>{visibleFields.confirmation ? 'Ocultar' : 'Mostrar'}</button></div></label>
                <button type="submit" disabled={isSubmitting}>{isSubmitting ? 'Actualizando…' : 'Cambiar contraseña'}</button>
              </form>
            </div>
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
                <label>Correo electrónico<input type="email" name="email" value={login.email} onChange={updateLogin} autoComplete="email" required /></label>
                <label>Contraseña<div className="password-field"><input type={visibleFields.login ? 'text' : 'password'} name="password" value={login.password} onChange={updateLogin} autoComplete="current-password" required /><button className="password-toggle" type="button" onClick={() => togglePassword('login')} aria-label={visibleFields.login ? 'Ocultar contraseña' : 'Mostrar contraseña'}>{visibleFields.login ? 'Ocultar' : 'Mostrar'}</button></div></label>
                <button type="submit" disabled={isSubmitting}>{isSubmitting ? 'Validando…' : 'Iniciar sesión'}</button>
              </form>
            ) : (
              <form onSubmit={submit} noValidate>
                <p className="eyebrow form-label">Crear cuenta</p>
                <label>Correo electrónico<input type="email" name="email" value={form.email} onChange={updateField} autoComplete="email" required /></label>
                <label>Usuario<input name="username" value={form.username} onChange={updateField} minLength="3" maxLength="16" autoComplete="username" required /></label>
                <label>Contraseña<div className="password-field"><input type={visibleFields.password ? 'text' : 'password'} name="password" value={form.password} onChange={updateField} minLength="8" maxLength="32" autoComplete="new-password" required /><button className="password-toggle" type="button" onClick={() => togglePassword('password')} aria-label={visibleFields.password ? 'Ocultar contraseña' : 'Mostrar contraseña'}>{visibleFields.password ? 'Ocultar' : 'Mostrar'}</button></div></label>
                <label>Confirmar contraseña<div className="password-field"><input type={visibleFields.confirmation ? 'text' : 'password'} name="confirmation" value={form.confirmation} onChange={updateField} minLength="8" maxLength="32" autoComplete="new-password" required /><button className="password-toggle" type="button" onClick={() => togglePassword('confirmation')} aria-label={visibleFields.confirmation ? 'Ocultar contraseña' : 'Mostrar contraseña'}>{visibleFields.confirmation ? 'Ocultar' : 'Mostrar'}</button></div></label>
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
