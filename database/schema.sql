create extension if not exists pgcrypto;

create table if not exists users (
  id uuid primary key default gen_random_uuid(),
  email text unique not null,
  full_name text,
  role text not null default 'owner',
  created_at timestamptz not null default now()
);

create table if not exists agents (
  id text primary key,
  name text not null,
  slug text unique not null,
  department text not null,
  role text not null,
  status text not null default 'draft',
  owner_user_id uuid references users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists shared_memories (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  body text not null,
  scope text not null default 'global',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists agent_memories (
  id uuid primary key default gen_random_uuid(),
  agent_id text not null references agents(id) on delete cascade,
  memory_type text not null default 'context',
  body text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists conversations (
  id uuid primary key default gen_random_uuid(),
  channel text not null,
  external_thread_id text,
  customer_name text,
  summary text,
  status text not null default 'open',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists tasks (
  id uuid primary key default gen_random_uuid(),
  external_id text unique,
  title text not null,
  description text,
  customer_name text,
  owner_agent_id text references agents(id) on delete set null,
  source text not null default 'panel',
  priority text not null default 'medium',
  status text not null default 'queued',
  payload jsonb not null default '{}'::jsonb,
  result jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists agent_states (
  agent_id text primary key references agents(id) on delete cascade,
  heartbeat_at timestamptz,
  last_run_at timestamptz,
  last_error text,
  meta jsonb not null default '{}'::jsonb
);

create table if not exists integrations (
  id uuid primary key default gen_random_uuid(),
  provider text not null,
  label text not null,
  status text not null default 'draft',
  config jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists idx_tasks_status on tasks(status);
create index if not exists idx_tasks_owner_agent_id on tasks(owner_agent_id);
create index if not exists idx_agent_memories_agent_id on agent_memories(agent_id);
create index if not exists idx_conversations_status on conversations(status);

