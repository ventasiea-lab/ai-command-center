# AI Command Center

Centro de mando para operar agentes, tareas, memoria e integraciones desde una sola capa.

## Stack

- `apps/web`: panel en Next.js
- `apps/api`: API central para agentes, tareas y memoria
- `services/agent-bridge`: puente para coordinar trabajo con Codex/Cloud Code
- `services/jobs`: workers para tareas recurrentes
- `database`: esquema inicial para memoria, tareas y agentes
- `agents`: perfiles base de agentes operativos

## MVP actual

- dashboard inicial con KPIs y mapa operativo
- API base con endpoints de salud, agentes y tareas
- bridge inicial para recibir instrucciones externas
- worker inicial para checks y jobs recurrentes
- documentación y perfiles base de agentes

## Monorepo

```bash
ai-command-center/
├── apps/
│   ├── api/
│   └── web/
├── services/
│   ├── agent-bridge/
│   └── jobs/
├── packages/
│   ├── config/
│   ├── types/
│   └── ui/
├── agents/
├── database/
├── docs/
└── memory/
```

## Arranque local

```bash
npm install
npm run dev
```

Servicios:

- web: `http://localhost:3000`
- api: `http://localhost:4000`
- bridge: `http://localhost:4100`

## Despliegue recomendado

1. Conectar este repo a Railway.
2. Crear 3 servicios:
   - `web`
   - `api`
   - `agent-bridge`
3. Crear `Postgres`.
4. Cargar variables de entorno desde `.env.example`.
5. Desplegar `web` primero, luego `api`, luego `bridge`.

## Variables clave

Revisar `.env.example`.

## Siguiente fase

- conectar Supabase/Postgres real
- persistir tareas y memoria
- autenticar panel
- enlazar `agent-bridge` con flujos reales de Codex/Cloud Code

