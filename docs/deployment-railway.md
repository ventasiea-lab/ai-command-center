# Deployment en Railway

## Config compartida del repo

- `railway.json` usa `npm run start:railway`.
- Ese script detecta `RAILWAY_SERVICE_NAME` y arranca el proceso correcto para cada servicio.
- Si Railway intenta arrancar un servicio sin artefactos compilados, el script ahora ejecuta el build faltante antes del start.
- Resultado:
  - `web` -> `npm run start:web`
  - `api` -> `npm run start:api`
  - `agent-bridge` -> `npm run start:bridge`
  - `jobs` -> `npm run start:jobs`

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
