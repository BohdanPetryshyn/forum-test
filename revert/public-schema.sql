-- Revert forum:public-schema from pg

BEGIN;

DROP SCHEMA public;

COMMIT;
