import { agentCards, metrics, priorities, timelines } from "../lib/dashboard-data";

export default function HomePage() {
  const isProduction = process.env.NODE_ENV === "production";
  const apiBaseUrl =
    process.env.NEXT_PUBLIC_API_URL || (isProduction ? "" : "http://localhost:4000");
  const bridgeBaseUrl =
    process.env.NEXT_PUBLIC_BRIDGE_URL || (isProduction ? "" : "http://localhost:4100");
  const apiHealthUrl = apiBaseUrl ? `${apiBaseUrl}/health` : undefined;
  const bridgeHealthUrl = bridgeBaseUrl ? `${bridgeBaseUrl}/health` : undefined;

  return (
    <main className="shell">
      <div className="frame">
        <section className="hero">
          <div className="eyebrow">AI Command Center</div>
          <h1>Opera tus agentes como una empresa, no como tareas sueltas.</h1>
          <p>
            Este MVP concentra visibilidad, memoria, tareas e integración con Codex/Cloud Code
            para que puedas dirigir clientes, calendario, reporting y operación diaria desde un
            solo panel.
          </p>
          <div className="hero-actions">
            {apiHealthUrl ? (
              <a className="button primary" href={apiHealthUrl}>
                Ver estado del API
              </a>
            ) : (
              <span className="button primary" aria-disabled="true">
                Configurar URL del API
              </span>
            )}
            {bridgeHealthUrl ? (
              <a className="button secondary" href={bridgeHealthUrl}>
                Ver estado del bridge
              </a>
            ) : (
              <span className="button secondary" aria-disabled="true">
                Configurar URL del bridge
              </span>
            )}
          </div>
          {isProduction && (!apiHealthUrl || !bridgeHealthUrl) ? (
            <p className="muted">
              Faltan variables públicas del frontend en Railway: `NEXT_PUBLIC_API_URL` y/o
              `NEXT_PUBLIC_BRIDGE_URL`.
            </p>
          ) : null}
        </section>

        <section className="stats">
          {metrics.map((metric) => (
            <article className="stat" key={metric.label}>
              <div className="stat-label">{metric.label}</div>
              <div className="stat-value">{metric.value}</div>
              <div className="muted">{metric.note}</div>
            </article>
          ))}
        </section>

        <section className="grid">
          <div className="panel">
            <div className="row">
              <h2>Prioridades de arranque</h2>
              <span className="badge">Focus</span>
            </div>
            <div className="list">
              {priorities.map((priority) => (
                <div className="card" key={priority}>
                  {priority}
                </div>
              ))}
            </div>
          </div>

          <div className="panel">
            <div className="row">
              <h2>Mapa operativo</h2>
              <span className="badge warn">MVP</span>
            </div>
            <div className="timeline">
              {timelines.map((item) => (
                <div className="card" key={item.title}>
                  <div className="row">
                    <strong>{item.title}</strong>
                    <span className="badge ok">{item.status}</span>
                  </div>
                  <div className="muted">{item.detail}</div>
                </div>
              ))}
            </div>
          </div>
        </section>

        <section className="panel">
          <div className="row">
            <h2>Agentes críticos</h2>
            <span className="badge">Org Chart</span>
          </div>
          <div className="agents">
            {agentCards.map((agent) => (
              <article className="card" key={agent.name}>
                <div className="row">
                  <div>
                    <div className="agent-name">{agent.name}</div>
                    <div className="agent-role">{agent.role}</div>
                  </div>
                  <span className={agent.status === "Activo" ? "badge ok" : "badge warn"}>
                    {agent.status}
                  </span>
                </div>
              </article>
            ))}
          </div>
        </section>
      </div>
    </main>
  );
}
