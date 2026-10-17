-- NEXO Control shared store.
-- This intentionally allows public read/write access: anyone with the deployed
-- link and the public Supabase key can view and change all records.
create table if not exists public.nexo_records (
  bucket text not null,
  record_id text not null,
  payload jsonb not null,
  updated_at timestamptz not null default now(),
  constraint nexo_records_pkey primary key (bucket, record_id)
);

alter table public.nexo_records enable row level security;
grant select, insert, update, delete on public.nexo_records to anon;

drop policy if exists "NEXO public read" on public.nexo_records;
create policy "NEXO public read" on public.nexo_records
  for select to anon using (true);
drop policy if exists "NEXO public insert" on public.nexo_records;
create policy "NEXO public insert" on public.nexo_records
  for insert to anon with check (true);
drop policy if exists "NEXO public update" on public.nexo_records;
create policy "NEXO public update" on public.nexo_records
  for update to anon using (true) with check (true);
drop policy if exists "NEXO public delete" on public.nexo_records;
create policy "NEXO public delete" on public.nexo_records
  for delete to anon using (true);

do $$
begin
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'nexo_records'
  ) then
    alter publication supabase_realtime add table public.nexo_records;
  end if;
end $$;
