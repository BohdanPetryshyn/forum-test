-- Revert forum:post-table from pg

BEGIN;

DROP TABLE public.post;

DROP TYPE public.post_topic;

COMMIT;
