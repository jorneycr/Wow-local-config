export function HomeView({ onNavigate }) {
  return (
    <section className="page home-view">
      <div className="hero-copy">
        <p className="eyebrow">Azeroth Local · WotLK 3.3.5a</p>
        <h1>Tu reino empieza <em>aquí.</em></h1>
        <p className="lead">Una experiencia clásica, una comunidad viva y un mundo listo para que escribas tu propia historia.</p>
        <div className="hero-actions">
          <button className="button button-primary button-large" type="button" onClick={() => onNavigate('auth')}>Crear mi cuenta</button>
          <button className="button button-ghost button-large" type="button" onClick={() => onNavigate('start')}>Cómo empezar <span>→</span></button>
        </div>
        <div className="trust-row"><span className="online-dot" /> Reino local disponible <span className="trust-separator" /> Build 12340</div>
      </div>
      <div className="feature-grid">
        <article><span className="feature-icon">✦</span><h3>WotLK auténtico</h3><p>La expansión clásica en su versión 3.3.5a.</p></article>
        <article><span className="feature-icon">◈</span><h3>Comunidad</h3><p>Construye tu historia junto a otros jugadores.</p></article>
        <article><span className="feature-icon">⌁</span><h3>Tu progreso</h3><p>Consulta tus personajes y evolución desde tu panel.</p></article>
      </div>
    </section>
  );
}
