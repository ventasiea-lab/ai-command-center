# Arquitectura General

## Objetivo

Crear una capa operativa donde Alex pueda:

- ver agentes y estados
- disparar tareas
- revisar memoria
- coordinar trabajo recurrente
- conectar ejecucion real con Codex/Cloud Code

## Componentes

### `apps/web`
- panel principal
- vista movil y desktop
- KPIs, tareas y agentes

### `apps/api`
- capa central para tareas, agentes y memoria
- expone endpoints para panel e integraciones

### `services/agent-bridge`
- puente hacia runtimes externos
- recibe dispatches del panel
- en fases futuras devolverá estados y resultados

### `services/jobs`
- runner para tareas recurrentes
- checks programados
- mantenimientos livianos

### `database`
- Postgres/Supabase
- persistencia de tareas, memoria, agentes e integraciones

## Flujo de alto nivel

1. Alex crea una tarea desde el panel.
2. `apps/api` la registra.
3. `agent-bridge` la despacha al runtime correcto.
4. El runtime procesa.
5. El resultado vuelve a `api`.
6. El panel muestra estado, histórico y contexto.

## Canal primero

- `monday` y panel como centro de mando visual
- `Telegram` y otros canales como entrada/salida
- `Railway` como capa de deploy
- `GitHub` como base de código

