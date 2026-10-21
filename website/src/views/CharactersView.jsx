import { useState } from 'react';
import { apiRequest } from '../api';

const classNames = { 1: 'Guerrero', 2: 'Paladín', 3: 'Cazador', 4: 'Pícaro', 5: 'Sacerdote', 6: 'Caballero de la Muerte', 7: 'Chamán', 8: 'Mago', 9: 'Brujo', 11: 'Druida' };

export function CharactersView({ characters }) {
  const [detail, setDetail] = useState(null);
  const [error, setError] = useState(null);

  const openDetail = async (character) => {
    try { setError(null); setDetail((await apiRequest(`/api/character?guid=${character.guid}`)).character); }
    catch (requestError) { setError(requestError.message); }
  };

  return <section className="page characters-view"><div className="section-heading"><div><p className="eyebrow">Mi cuenta</p><h1>Mis <em>personajes.</em></h1><p className="lead">Estos son los personajes vinculados a tu cuenta. Selecciona uno para abrir su ficha.</p></div><span className="status-pill"><span /> {characters.length} personajes</span></div>{error && <p className="message error">{error}</p>}{detail && <article className="glass-card character-detail"><div className="card-title"><div><p className="card-kicker">FICHA DEL PERSONAJE</p><h2>{detail.name}</h2></div><button className="link-button" type="button" onClick={() => setDetail(null)}>Cerrar</button></div><div className="detail-grid"><div><span>Nivel</span><strong>{detail.level}</strong></div><div><span>Estado</span><strong>{detail.online ? 'En línea' : 'Offline'}</strong></div><div><span>Salud</span><strong>{detail.health.toLocaleString()}</strong></div><div><span>Oro</span><strong>{(detail.money / 10000).toFixed(2)}g</strong></div><div><span>Honor</span><strong>{detail.totalHonorPoints.toLocaleString()}</strong></div><div><span>Bajas</span><strong>{detail.totalKills.toLocaleString()}</strong></div><div><span>Tiempo jugado</span><strong>{Math.floor(detail.totaltime / 86400)} días</strong></div><div><span>Creado</span><strong>{detail.creation_date}</strong></div></div></article>}<div className="character-grid">{characters.map((character) => <article className="glass-card character-card" key={character.guid}><div><p className="card-kicker">PERSONAJE</p><h2>{character.name}</h2><p className="muted">Nivel {character.level} · {classNames[character.class] || `Clase ${character.class}`}</p><span className="character-status">{character.online ? 'EN LÍNEA' : 'OFFLINE'}</span></div><button className="link-button" type="button" onClick={() => openDetail(character)}>Ver personaje →</button></article>)}</div></section>;
}
