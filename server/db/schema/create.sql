-- Drop and recreate Users table (Example)
DROP TABLE IF EXISTS outcomes CASCADE;
DROP TABLE IF EXISTS settings CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS waitlists CASCADE;
DROP TABLE IF EXISTS sessions CASCADE;

CREATE TABLE outcomes (
  id SERIAL PRIMARY KEY NOT NULL,
  value VARCHAR (255) NOT NULL
);

CREATE TABLE settings (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR (255) NOT NULL,
  url VARCHAR (255) NOT NULL,
  capacity INTEGER NOT NULL
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  first_name VARCHAR (255) NOT NULL,
  last_name VARCHAR (255) NOT NULL,
  contact_number VARCHAR (255) NOT NULL,
  group_size INTEGER NOT NULL
);

CREATE TABLE waitlists (
  id SERIAL PRIMARY KEY NOT NULL,
  setting_id INTEGER REFERENCES settings (id) ON DELETE CASCADE
);

CREATE TABLE sessions (
  id SERIAL PRIMARY KEY NOT NULL,
  waitlist_id INTEGER REFERENCES waitlists (id) ON DELETE CASCADE,
  user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
  outcome_id INTEGER REFERENCES outcomes (id) ON DELETE CASCADE,
  date_start TIMESTAMP NOT NULL,
  date_end TIMESTAMP,
  position INTEGER NOT NULL

);
