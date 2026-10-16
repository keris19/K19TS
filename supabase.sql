-- Ejecutar en SQL Editor de Supabase
create table if not exists public.tournaments (
  slug text primary key,
  owner_id uuid not null references auth.users(id),
  state jsonb not null,
  updated_at timestamptz not null default now()
);
alter table public.tournaments enable row level security;
drop policy if exists "Public read tournaments" on public.tournaments;
create policy "Public read tournaments" on public.tournaments for select to anon, authenticated using (true);
drop policy if exists "Owner insert tournaments" on public.tournaments;
create policy "Owner insert tournaments" on public.tournaments for insert to authenticated with check (auth.uid() = owner_id);
drop policy if exists "Owner update tournaments" on public.tournaments;
create policy "Owner update tournaments" on public.tournaments for update to authenticated using (auth.uid() = owner_id) with check (auth.uid() = owner_id);
drop policy if exists "Owner delete tournaments" on public.tournaments;
create policy "Owner delete tournaments" on public.tournaments for delete to authenticated using (auth.uid() = owner_id);
