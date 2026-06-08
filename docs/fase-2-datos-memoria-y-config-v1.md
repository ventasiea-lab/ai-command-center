# Fase 2 - Datos, Memoria y Configuración v1

## Estado
Completada en versión base.

## Objetivo
Dejar preparada la base técnica para memorias, agentes y configuración del sistema.

## Componentes definidos
- estructura inicial de base de datos
- memoria compartida
- memoria por agente
- carpetas de prompts
- configuración de herramientas por agente
- archivo de variables base

## Modelo de datos inicial

### Tabla users
- id
- name
- email
- role
- created_at

### Tabla agents
- id
- name
- slug
- department
- role
- status
- profile_path
- prompt_path
- tools_config
- created_at
- updated_at

### Tabla agent_memories
- id
- agent_id
- memory_type
- content
- created_at
- updated_at

### Tabla shared_memories
- id
- title
- content
- priority
- created_at
- updated_at

### Tabla conversations
- id
- agent_id
- channel
- user_input
- agent_output
- created_at

### Tabla tasks
- id
- owner_agent_id
- assigned_by_agent_id
- title
- status
- priority
- notes
- created_at
- updated_at

### Tabla agent_states
- id
- agent_id
- mode
- last_run_at
- last_result
- updated_at

### Tabla integrations
- id
- name
- provider
- status
- config_ref
- created_at
- updated_at

## Memoria compartida
Ubicación inicial:
- empresa-agentes/memory/shared/

Propósito:
- decisiones globales
- prioridades activas
- contexto de negocio
- reglas de coordinación

## Memoria individual
Ubicación inicial:
- empresa-agentes/memory/agents/

Propósito:
- contexto específico del agente
- aprendizajes
- límites específicos
- notas operativas

## Configuración base
- .env.example ya creado
- schema.sql inicial ya creado
- tools.json base por agente ya creado

## Entregables de Fase 2
- esquema inicial de datos
- estructura de memorias
- configuración base de agentes
- estructura de frontend preparada para el panel
