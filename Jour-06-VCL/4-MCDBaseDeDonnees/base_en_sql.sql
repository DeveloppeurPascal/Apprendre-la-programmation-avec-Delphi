CREATE TABLE editeurs (
  raisonsociale TEXT NULL,
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
);

CREATE TABLE lien_auteur_livre (
  id_auteur INTEGER NOT NULL,
  id_livre INTEGER NOT NULL
);

CREATE TABLE livres (
  gencod TEXT NULL,
  titre TEXT NULL,
  commentaire TEXT NULL,
  couverture BLOB NULL,
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  id_editeur INTEGER NULL
);

CREATE TABLE auteurs (
  nom TEXT NULL,
  prenom TEXT NULL,
  pseudo TEXT NULL,
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
);

CREATE UNIQUE INDEX livre_auteur ON lien_auteur_livre
  (id_livre,id_auteur);
