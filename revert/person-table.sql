-- Revert forum:person-table from pg

BEGIN;

DROP TABLE public.person;

COMMIT;
