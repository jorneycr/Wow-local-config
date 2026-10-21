import { useState } from 'react';
import { apiRequest, csrfToken } from '../api';
import { PasswordField } from '../components/PasswordField';

const classNames = { 1: 'Guerrero', 2: 'Paladín', 3: 'Cazador', 4: 'Pícaro', 5: 'Sacerdote', 6: 'Caballero de la Muerte', 7: 'Chamán', 8: 'Mago', 9: 'Brujo', 11: 'Druida' };

export function PanelView({ account, characters, onLogout }) {
  const [selectedGuid, setSelectedGuid] = useState(null);
  const [characterDetail, setCharacterDetail] = useState(null);
  const [passwordForm, setPasswordForm] = useState({ current_password: '', new_password: '', new_password_confirmation: '' });
  const [status, setStatus] = useState(null);
  const [loading, setLoading] = useState(false);
  const update = (event) => setPasswordForm((current) => ({ ...current, [event.target.name]: event.target.value }));

  const viewCharacter = async (character) => {
    setSelectedGuid(character.guid);
    try {
      const result = await apiRequest(`/api/character?guid=${character.guid}`);
      setCharacterDetail(result.character);
    } catch (error) {
      setStatus({ type: 'error', text: error.message });
    }
  };

  const changePassword = async (event) => {
    event.preventDefault();
    setStatus(null);
    setLoading(true);
    try {
      const token = await csrfToken();
      const result = await apiRequest('/api/password', { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': token }, body: JSON.stringify(passwordForm) });
      setPasswordForm({ current_password: '', new_password: '', new_password_confirmation: '' });
      setStatus({ type: 'success', text: result.message });
    } catch (error) {
      setStatus({ type: 'error', text: error.message });
    } finally {
      setLoading(false);
    }
  };

  return (
    <section className="page panel-page">
      <div className="section-heading"><div><p className="eyebrow">Mi cuenta</p><h1>Resumen de <em>tu aventura.</em></h1><p className="lead">Tus personajes, actividad y seguridad en un solo lugar.</p></div><span className="status-pill"><span /> Sesión activa</span></div>
      <div className="dashboard-grid">
        <article className="glass-card account-card"><div className="profile-orb">{account.username.slice(0, 1)}</div><h2>{account.username}</h2><p className="muted">{account.email}</p><div className="account-meta"><span>Registrado desde<strong>{account.joindate || '—'}</strong></span><span>Última conexión<strong>{account.last_login || '—'}</strong></span></div></article>
        <article className="glass-card stat-card"><p className="card-kicker">PERSONAJES</p><strong className="big-number">{characters.length}</strong><p className="muted">Personajes vinculados a tu cuenta</p></article>
        <article className="glass-card stat-card"><p className="card-kicker">REINO</p><strong className="big-number">ONLINE</strong><p className="muted">Azeroth Local · Build 12340</p></article>
      </div>
      {characterDetail && <article className="glass-card character-detail"><div className="card-title"><div><p className="card-kicker">FICHA DEL PERSONAJE</p><h2>{characterDetail.name}</h2></div><button className="link-button" type="button" onClick={() => setCharacterDetail(null)}>Cerrar</button></div><div className="detail-grid"><div><span>Nivel</span><strong>{characterDetail.level}</strong></div><div><span>Estado</span><strong>{characterDetail.online ? 'En línea' : 'Offline'}</strong></div><div><span>Salud</span><strong>{characterDetail.health.toLocaleString()}</strong></div><div><span>Oro</span><strong>{(characterDetail.money / 10000).toFixed(2)}g</strong></div><div><span>Honor</span><strong>{characterDetail.totalHonorPoints.toLocaleString()}</strong></div><div><span>Bajas</span><strong>{characterDetail.totalKills.toLocaleString()}</strong></div><div><span>Tiempo jugado</span><strong>{Math.floor(characterDetail.totaltime / 86400)} días</strong></div><div><span>Creado</span><strong>{characterDetail.creation_date}</strong></div></div></article>}
      <div className="panel-columns">
        <article className="glass-card"><div className="card-title"><div><p className="card-kicker">MIS PERSONAJES</p><h2>Tu progreso</h2></div><span className="muted">Datos ligeros · sin imágenes</span></div><div className="character-list large-list">{characters.map((character) => <div className="character-row" key={character.name}><div><strong>{character.name}</strong><span>Nivel {character.level} · {character.online ? 'En línea' : 'Offline'} · {classNames[character.class] || `Clase ${character.class}`}</span></div><button className="link-button" type="button" onClick={() => viewCharacter(character)}>{selectedGuid === character.guid ? 'Abierto' : 'Ver personaje →'}</button></div>)}</div></article>
        <article className="glass-card security-panel"><p className="card-kicker">SEGURIDAD</p><h2>Protege tu cuenta</h2><form className="form-stack" onSubmit={changePassword}><PasswordField label="Contraseña actual" name="current_password" value={passwordForm.current_password} onChange={update} minLength={1} /><PasswordField label="Nueva contraseña" name="new_password" value={passwordForm.new_password} onChange={update} minLength={8} /><PasswordField label="Confirmar nueva contraseña" name="new_password_confirmation" value={passwordForm.new_password_confirmation} onChange={update} minLength={8} /><button className="button button-primary button-full" disabled={loading}>{loading ? 'Actualizando…' : 'Cambiar contraseña'}</button></form>{status && <p className={`message ${status.type}`}>{status.text}</p>}</article>
      </div>
      <button className="button button-ghost" type="button" onClick={onLogout}>Cerrar sesión</button>
    </section>
  );
}
