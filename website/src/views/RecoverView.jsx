import { useState } from 'react';

export function RecoverView({ onNavigate }) {
  const [email, setEmail] = useState('');
  const [sent, setSent] = useState(false);

  return (
    <section className="page centered-page">
      <div className="glass-card auth-card narrow-card">
        <div className="card-kicker">RECUPERACIÓN</div>
        <h2>Recupera el acceso</h2>
        {sent ? (
          <div className="notice success"><strong>Solicitud recibida</strong><p>Cuando el servicio de correo esté configurado, recibirás las instrucciones en {email}.</p></div>
        ) : (
          <>
            <p className="muted">Introduce el correo asociado a tu cuenta. Esta pantalla queda preparada para el flujo de recuperación.</p>
            <form className="form-stack" onSubmit={(event) => { event.preventDefault(); setSent(true); }}>
              <label className="field"><span>Correo electrónico</span><input type="email" value={email} onChange={(event) => setEmail(event.target.value)} required /></label>
              <button className="button button-primary button-full">Enviar instrucciones</button>
            </form>
          </>
        )}
        <button className="link-button" type="button" onClick={() => onNavigate('auth')}>Volver al acceso</button>
      </div>
    </section>
  );
}
