-- Deploy forum:post-table to pg

BEGIN;

CREATE TYPE public.post_topic AS ENUM (
  'discussion',
  'inspiration',
  'help',
  'showcase'
);

CREATE TABLE public.post (
  id               SERIAL PRIMARY KEY,
  author_id        INTEGER NOT NULL REFERENCES public.person(id),
  headline         TEXT NOT NULL CHECK (char_length(headline) < 280),
  body             TEXT,
  topic            public.post_topic,
  created_at       TIMESTAMP DEFAULT now()
);

COMMENT ON TABLE public.post IS 'A forum post written by a user.';
COMMENT ON COLUMN public.post.id IS 'The primary key for the post.';
COMMENT ON COLUMN public.post.headline IS 'The title written by the user.';
COMMENT ON COLUMN public.post.author_id IS 'The id of the author user.';
COMMENT ON COLUMN public.post.topic IS 'The topic this has been posted in.';
COMMENT ON COLUMN public.post.body IS 'The main body text of our post.';
COMMENT ON COLUMN public.post.created_at IS 'The time this post was created.';

COMMIT;
