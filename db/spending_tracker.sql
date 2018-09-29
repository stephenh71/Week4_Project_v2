DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS merchants;

CREATE TABLE merchants(
  id serial4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags(
  id serial4 PRIMARY KEY,
  title VARCHAR(255),
  budget INT4
);

CREATE TABLE transactions(
  id serial4 PRIMARY KEY,
  trans_date DATE NOT NULL DEFAULT CURRENT_DATE,
  merchant_id INT REFERENCES
  merchants(id) ON DELETE CASCADE,
  tag_id INT REFERENCES tags(id) ON DELETE CASCADE,
  amount INT4
);
