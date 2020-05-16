CREATE TABLE products (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  category TEXT NOT NULL,
  price MONEY NOT NULL,
  url TEXT NOT NULL
);

CREATE TABLE users (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  username TEXT NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE invoices (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  user_id INTEGER REFERENCES users(id),
  date TIMESTAMP DEFAULT now(),
  checked_out BOOLEAN DEFAULT false
);

CREATE TABLE invoice_products (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS identity,
  invoice_id INTEGER REFERENCES invoices(id),
  product_id INTEGER REFERENCES products(id),
  user_id INTEGER REFERENCES users(id),
  quantity INTEGER NOT null
);