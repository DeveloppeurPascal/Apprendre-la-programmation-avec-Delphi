CREATE TABLE editeurs (
  raisonsociale VARCHAR(255) NULL,
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
);

CREATE TABLE lien_auteur_livre (
  id_auteur INTEGER NOT NULL,
  id_livre INTEGER NOT NULL
);

CREATE TABLE livres (
  gencod VARCHAR(255) NULL,
  titre VARCHAR(255) NULL,
  commentaire TEXT NULL,
  couverture BLOB NULL,
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  id_editeur INTEGER NULL
);

CREATE TABLE auteurs (
  nom VARCHAR(255) NULL,
  prenom VARCHAR(255) NULL,
  pseudo VARCHAR(255) NULL,
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
);

CREATE UNIQUE INDEX livre_auteur ON lien_auteur_livre
  (id_livre,id_auteur);
