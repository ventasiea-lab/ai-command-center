# Deployment en Railway

## Servicios a crear

### 1. `web`
- Root directory: `/`
- Build command: `npm install && npm run build:web`
- Start command: `npm run start:web`

### 2. `api`
- Root directory: `/`
- Build command: `npm install && npm run build:api`
- Start command: `npm run start:api`

### 3. `agent-bridge`
- Root directory: `/`
- Build command: `npm install && npm run build:bridge`
- Start command: `npm run start:bridge`

## Base de datos

- Crear `Postgres` en Railway.
- Cargar `DATABASE_URL`.

## Variables mínimas

- `NEXT_PUBLIC_API_URL`
- `NEXT_PUBLIC_BRIDGE_URL`
- `PORT`
- `BRIDGE_PORT`
- `DATABASE_URL`
- `CODEX_BRIDGE_SHARED_SECRET`

## Orden recomendado

1. deploy `web`
2. deploy `api`
3. deploy `agent-bridge`
4. conectar variables públicas del frontend a URLs reales

