\c matthewtirrell
DROP USER "michael";
CREATE USER "michael" WITH PASSWORD 'stonebreaker';
DROP DATABASE IF EXISTS "todo_app";
CREATE DATABASE "todo_app";
\c "todo_app";

CREATE TABLE "tasks" (id serial PRIMARY KEY NOT NULL, title varchar(255) NOT NULL, description text NULL, created_at timestamp WITHOUT TIME ZONE NOT NULL DEFAULT now(), updated_at timestamp WITHOUT TIME ZONE NULL, completed boolean NOT NULL DEFAULT false);
SELECT * FROM "tasks";
ALTER TABLE "tasks" DROP COLUMN "completed";
SELECT * FROM "tasks";
ALTER TABLE "tasks" ADD COLUMN "completed_at" timestamp WITHOUT TIME ZONE DEFAULT NULL;
SELECT * FROM "tasks";
ALTER TABLE "tasks" ALTER COLUMN "updated_at" SET NOT NULL;
ALTER TABLE "tasks" ALTER COLUMN "updated_at" SET DEFAULT now();
INSERT INTO "tasks" VALUES (default, 'Study SQL', 'Complete this exercise', now(), now(), NULL);
SELECT * FROM "tasks";
UPDATE "tasks" SET "title" = 'Study PostgreSQL', "description" = 'Read all the documentation';
SELECT * FROM "tasks";
DROP TABLE "tasks";
