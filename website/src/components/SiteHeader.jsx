import { AccountDropdown } from './AccountDropdown';

export function SiteHeader({ account, onNavigate, onLogout }) {
  return (
    <header className="site-header">
      <button className="brand" type="button" onClick={() => onNavigate('home')}>
        <span className="brand-mark">W</span>
        <span><strong>WLA</strong><small>WOW LATINOAMERICA<br />WOTLK 3.3.5A</small></span>
      </button>
      <nav className="main-nav" aria-label="Navegación principal">
        <button type="button" onClick={() => onNavigate('home')}>Inicio</button>
        <button type="button" onClick={() => onNavigate('start')}>Cómo empezar</button>
        <button type="button" onClick={() => onNavigate('events')}>Eventos</button>
        <button type="button" onClick={() => onNavigate('status')}>Estado del servidor</button>
        <button type="button" onClick={() => onNavigate('help')}>Ayuda</button>
      </nav>
      <div className="header-actions">
        {account ? <AccountDropdown account={account} onNavigate={onNavigate} onLogout={onLogout} /> : (
          <button className="button button-ghost" type="button" onClick={() => onNavigate('auth')}>Acceder</button>
        )}
        <button className="button button-primary" type="button" onClick={() => onNavigate('start')}>Descargar</button>
      </div>
    </header>
  );
}
