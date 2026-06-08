# Bridge Codex / Cloud Code

## Objetivo

Tener una capa que permita:

- crear tareas desde el panel
- despachar instrucciones a Codex/Cloud Code
- recibir estados y resultados
- consolidar trazabilidad por cliente y proyecto

## Flujo v1

1. Usuario crea o dispara una tarea desde el panel.
2. `apps/api` valida y registra la tarea.
3. `services/agent-bridge` recibe el despacho.
4. El bridge empuja la instrucción al runtime externo.
5. El resultado vuelve a la API para histórico y auditoría.

## Eventos clave futuros

- `task.created`
- `task.dispatched`
- `task.started`
- `task.completed`
- `task.failed`

