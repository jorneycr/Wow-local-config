import { StrictMode, useEffect, useState } from 'react';
import { createRoot } from 'react-dom/client';
import { apiRequest, csrfToken } from './api';
import { SiteHeader } from './components/SiteHeader';
import { AuthView } from './views/AuthView';
import { HomeView } from './views/HomeView';
import { InfoView } from './views/InfoView';
import { PanelView } from './views/PanelView';
import { RecoverView } from './views/RecoverView';
import './styles.css';

function App() {
  const [route, setRoute] = useState('home');
  const [account, setAccount] = useState(null);
  const [characters, setCharacters] = useState([]);

  useEffect(() => {
    apiRequest('/api/me').then(async (session) => {
      const result = await apiRequest('/api/characters');
      setAccount(session);
      setCharacters(result.characters);
      setRoute('panel');
    }).catch(() => {});
  }, []);

  const navigate = (nextRoute) => setRoute(nextRoute);

  const login = (session, playerCharacters) => {
    setAccount(session);
    setCharacters(playerCharacters);
    setRoute('panel');
  };

  const logout = async () => {
    const token = await csrfToken();
    await apiRequest('/api/logout', { method: 'POST', headers: { 'X-CSRF-Token': token } });
    setAccount(null);
    setCharacters([]);
    setRoute('home');
  };

  const content = account && route === 'panel' ? <PanelView account={account} characters={characters} onLogout={logout} /> : route === 'auth' ? <AuthView onLogin={login} onNavigate={navigate} /> : route === 'recover' ? <RecoverView onNavigate={navigate} /> : route === 'start' ? <InfoView eyebrow="Cómo empezar" title="Entra a Azeroth." text="Crea tu cuenta, configura tu realmlist y comienza tu aventura en el reino local." action="Crear cuenta" onNavigate={navigate} /> : route === 'events' ? <InfoView eyebrow="Eventos" title="Siempre hay algo que hacer." text="Próximamente encontrarás aquí los eventos activos y las actividades de la comunidad." action="Volver al inicio" onNavigate={navigate} /> : route === 'status' ? <InfoView eyebrow="Estado del servidor" title="Reino local disponible." text="Authserver, worldserver y base de datos operativos en tu entorno local." action="Acceder a mi cuenta" onNavigate={navigate} /> : route === 'help' ? <InfoView eyebrow="Ayuda" title="Todo lo que necesitas." text="Consulta la documentación del proyecto para instalar el cliente, configurar el realmlist y administrar tu cuenta." action="Ir al acceso" onNavigate={navigate} /> : <HomeView onNavigate={navigate} />;

  return <><SiteHeader account={account} onNavigate={navigate} onLogout={logout} />{content}</>;
}

createRoot(document.getElementById('root')).render(<StrictMode><App /></StrictMode>);
