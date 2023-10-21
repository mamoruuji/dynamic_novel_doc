# CREATE DATABASE dynamic_novel;

\c dynamic_novel

CREATE SCHEMA dynamic_novel_schema;

CREATE ROLE dev WITH LOGIN PASSWORD 'pass';

GRANT ALL PRIVILEGES ON SCHEMA dynamic_novel_schema TO dev;
