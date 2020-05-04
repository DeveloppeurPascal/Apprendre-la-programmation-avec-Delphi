CREATE TABLE contacts (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  nom VARCHAR(255) NULL,
  prenom VARCHAR(255) NULL,
  telephone VARCHAR(255) NULL,
  email VARCHAR(255) NULL,
  url VARCHAR(255) NULL
);

CREATE UNIQUE INDEX nomprenom ON contacts
  (nom,prenom,id);
