export function InfoView({ title, eyebrow, text, action, onNavigate }) {
  return <section className="page centered-page"><div className="glass-card info-card"><p className="eyebrow">{eyebrow}</p><h1>{title}</h1><p className="lead">{text}</p><button className="button button-primary" type="button" onClick={() => onNavigate('auth')}>{action}</button></div></section>;
}
