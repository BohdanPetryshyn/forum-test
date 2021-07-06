-- Deploy forum:person-table to pg

BEGIN;

CREATE TABLE public.person (
  id               SERIAL PRIMARY KEY,
  first_name       TEXT NOT NULL CHECK (char_length(first_name) < 80),
  last_name        TEXT CHECK (char_length(last_name) < 80),
  about            TEXT,
  created_at       TIMESTAMP DEFAULT now()
);

COMMENT ON TABLE public.person IS 'A user of the forum.';
COMMENT ON COLUMN public.person.id IS 'The primary unique identifier for the person.';
COMMENT ON COLUMN public.person.first_name IS 'The person’s first name.';
COMMENT ON COLUMN public.person.last_name IS 'The person’s last name.';
COMMENT ON COLUMN public.person.about IS 'A short description about the user, written by the user.';
COMMENT ON COLUMN public.person.created_at IS 'The time this person was created.';

COMMIT;
