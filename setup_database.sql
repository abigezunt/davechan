DROP TABLE davechan;

CREATE TABLE davechan
(
  id SERIAL4 PRIMARY KEY,
  url text DEFAULT 'http://cuteoverload.com',
  caption text DEFAULT 'so cute! OMG!',
  name text DEFAULT 'anonymous',
  date timestamp DEFAULT current_timestamp
);
