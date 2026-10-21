import { useState } from 'react';

export function AccountDropdown({ account, onNavigate, onLogout }) {
  const [open, setOpen] = useState(false);

  return (
    <div className="account-menu">
      <button className="account-chip" type="button" onClick={() => setOpen((current) => !current)} aria-expanded={open}>
        <span className="account-avatar">{account.username.slice(0, 1)}</span>
        <span><strong>{account.username}</strong><small>Sesión activa</small></span>
        <span className="account-chevron">⌄</span>
      </button>
      {open && <div className="account-dropdown">
        <div className="dropdown-account"><strong>{account.username}</strong><span>{account.email}</span></div>
        <button type="button" onClick={() => { onNavigate('account'); setOpen(false); }}>⌂ &nbsp; Mi cuenta</button>
        <button type="button" onClick={() => { onNavigate('characters'); setOpen(false); }}>♙ &nbsp; Mis personajes</button>
        <button type="button" onClick={() => { onNavigate('security'); setOpen(false); }}>♧ &nbsp; Seguridad</button>
        <button type="button" onClick={() => { onNavigate('settings'); setOpen(false); }}>⚙ &nbsp; Configuración</button>
        <button className="dropdown-logout" type="button" onClick={onLogout}>Cerrar sesión</button>
      </div>}
    </div>
  );
}
