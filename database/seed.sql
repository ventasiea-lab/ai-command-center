insert into agents (id, name, slug, department, role, status)
values
  ('agent-ceo-central', 'CEO Central', 'ceo-central', 'direccion', 'routing y supervision global', 'active'),
  ('agent-marketing', 'Gerente de Marketing', 'marketing', 'marketing', 'campanas, ofertas y posicionamiento', 'active'),
  ('agent-ventas', 'Gerente de Ventas', 'ventas', 'ventas', 'seguimiento comercial y cierres', 'active'),
  ('agent-atencion', 'Atencion al Cliente', 'atencion-cliente', 'soporte', 'soporte, seguimiento y retencion', 'active'),
  ('agent-admin-cobros', 'Administracion y Cobros', 'administracion-cobros', 'administracion', 'cobranza y control administrativo', 'draft'),
  ('agent-diseno', 'Diseno y Contenido', 'diseno-contenido', 'contenido', 'creatividad, piezas y copy', 'draft'),
  ('agent-agenda', 'Agenda y Operaciones', 'agenda-operaciones', 'operaciones', 'calendario, tareas y coordinacion diaria', 'draft'),
  ('agent-reporting', 'Reporting y Gama', 'reporting-gama', 'insights', 'reportes, analisis y entregables', 'draft');

insert into shared_memories (title, body, scope)
values
  (
    'Prioridad actual',
    'Construir el command center para centralizar tareas, reporting, calendario y ejecucion con bridge a Codex/Cloud Code.',
    'global'
  );

insert into tasks (external_id, title, description, customer_name, owner_agent_id, priority, status, payload)
values
  (
    'task-seed-001',
    'Revisar campanas activas de Nido',
    'Control rapido de rendimiento y proximas optimizaciones.',
    'Nido',
    'agent-marketing',
    'high',
    'queued',
    '{"channel":"panel","category":"campaign-review"}'::jsonb
  ),
  (
    'task-seed-002',
    'Preparar informe semanal',
    'Consolidar datos y resumen ejecutivo para cliente.',
    'Revolution',
    'agent-reporting',
    'high',
    'draft',
    '{"channel":"panel","category":"reporting"}'::jsonb
  );

