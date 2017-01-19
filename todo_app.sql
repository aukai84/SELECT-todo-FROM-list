\c matthewtirrell
DROP USER "michael";
CREATE USER "michael" WITH PASSWORD 'stonebreaker';
DROP DATABASE IF EXISTS "todo_app";
CREATE DATABASE "todo_app";
\c "todo_app";

CREATE TABLE "tasks" (id serial PRIMARY KEY NOT NULL, title varchar(255) NOT NULL, description text NULL, created_at timestamp WITHOUT TIME ZONE NOT NULL DEFAULT now(), updated_at timestamp WITHOUT TIME ZONE NULL, completed boolean NOT NULL DEFAULT false);
ALTER TABLE "tasks" DROP COLUMN "completed";
ALTER TABLE "tasks" ADD COLUMN "completed_at" timestamp WITHOUT TIME ZONE DEFAULT NULL;
ALTER TABLE "tasks" ALTER COLUMN "updated_at" SET NOT NULL;
ALTER TABLE "tasks" ALTER COLUMN "updated_at" SET DEFAULT now();
INSERT INTO "tasks" VALUES (default, 'Study SQL', 'Complete this exercise', now(), now(), NULL);
INSERT INTO "tasks" ("title", "description") VALUES ('Study PostgreSQL', 'Read all the documentation');
SELECT "title" FROM "tasks" WHERE "completed_at" IS NULL;
UPDATE "tasks" SET "completed_at" = now() WHERE "title" = 'Study SQL';
SELECT "title", "description" FROM "tasks" WHERE "completed_at" IS NULL;
SELECT * FROM "tasks";
