import { useState } from 'react';
import { apiRequest, csrfToken } from '../api';
import { PasswordField } from '../components/PasswordField';

const emptyRegister = { email: '', username: '', password: '', confirmation: '' };

export function AuthView({ initialMode = 'login', onLogin, onNavigate }) {
  const [mode, setMode] = useState(initialMode);
  const [login, setLogin] = useState({ email: '', password: '' });
  const [register, setRegister] = useState(emptyRegister);
  const [status, setStatus] = useState(null);
  const [loading, setLoading] = useState(false);

  const update = (setter) => (event) => setter((current) => ({ ...current, [event.target.name]: event.target.value }));

  const submitLogin = async (event) => {
    event.preventDefault();
    setStatus(null);
    setLoading(true);
    try {
      const token = await csrfToken();
      await apiRequest('/api/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': token },
        body: JSON.stringify(login),
      });
      const [account, characters] = await Promise.all([apiRequest('/api/me'), apiRequest('/api/characters')]);
      onLogin(account, characters.characters);
    } catch (error) {
      setStatus({ type: 'error', text: error.message });
    } finally {
      setLoading(false);
    }
  };

  const submitRegister = async (event) => {
    event.preventDefault();
    setStatus(null);
    setLoading(true);
    try {
      const token = await csrfToken();
      const response = await apiRequest('/api/register', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': token },
        body: register,
      });
      setStatus({ type: 'success', text: response.message });
      setRegister(emptyRegister);
      setMode('login');
    } catch (error) {
      setStatus({ type: 'error', text: error.message });
    } finally {
      setLoading(false);
    }
  };

  return (
    <section className="page auth-page">
      <div className="auth-intro">
        <p className="eyebrow">Acceso WLA</p>
        <h1>{mode === 'login' ? <>Acceder a <em>la cuenta.</em></> : <>Únete al <em>reino.</em></>}</h1>
        <p className="lead">{mode === 'login' ? 'Accede a tu panel para consultar tus personajes y proteger tu cuenta.' : 'Crea tu cuenta y comienza tu aventura en Azeroth.'}</p>
        <div className="auth-points"><span>✓</span> Panel personal <span>✓</span> Personajes y progreso <span>✓</span> Seguridad SRP6</div>
      </div>
      <div className="glass-card auth-card">
        <div className="card-kicker">CUENTA</div>
        <h2>{mode === 'login' ? 'Bienvenido de vuelta' : 'Crear cuenta'}</h2>
        <div className="tabs" role="tablist">
          <button className={mode === 'login' ? 'active' : ''} type="button" onClick={() => { setMode('login'); setStatus(null); }}>Acceder</button>
          <button className={mode === 'register' ? 'active' : ''} type="button" onClick={() => { setMode('register'); setStatus(null); }}>Registrarse</button>
        </div>
        {mode === 'login' ? (
          <form onSubmit={submitLogin} className="form-stack">
            <label className="field"><span>Correo electrónico</span><input type="email" name="email" value={login.email} onChange={update(setLogin)} autoComplete="email" required /></label>
            <PasswordField label="Contraseña" name="password" value={login.password} onChange={update(setLogin)} autoComplete="current-password" minLength={1} />
            <button className="button button-primary button-full" disabled={loading}>{loading ? 'Validando…' : 'Acceder'}</button>
            <button className="link-button" type="button" onClick={() => onNavigate('recover')}>¿Olvidaste la contraseña?</button>
          </form>
        ) : (
          <form onSubmit={submitRegister} className="form-stack">
            <label className="field"><span>Correo electrónico</span><input type="email" name="email" value={register.email} onChange={update(setRegister)} autoComplete="email" required /></label>
            <label className="field"><span>Usuario</span><input name="username" value={register.username} onChange={update(setRegister)} minLength="3" maxLength="16" autoComplete="username" required /></label>
            <PasswordField label="Contraseña" name="password" value={register.password} onChange={update(setRegister)} autoComplete="new-password" minLength={8} />
            <PasswordField label="Confirmar contraseña" name="confirmation" value={register.confirmation} onChange={update(setRegister)} autoComplete="new-password" minLength={8} />
            <button className="button button-primary button-full" disabled={loading}>{loading ? 'Creando…' : 'Crear cuenta'}</button>
          </form>
        )}
        {status && <p className={`message ${status.type}`}>{status.text}</p>}
        <p className="form-note">Tus credenciales se protegen con autenticación SRP6 compatible con AzerothCore.</p>
      </div>
    </section>
  );
}
