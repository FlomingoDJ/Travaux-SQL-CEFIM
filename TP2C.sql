DROP DATABASE salade;

CREATE DATABASE salade CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE salade;

-- crée la table couleur
CREATE TABLE couleur (
  id INT PRIMARY KEY auto_increment NOT NULL,
  nom VARCHAR(30) NOT NULL
);

CREATE TABLE fruit (
  id INT PRIMARY KEY auto_increment NOT NULL,
  nom VARCHAR(30) NOT NULL,
  couleur_id INT not null,
  -- ajout de la contrainte de clef etrangere foreign key
    CONSTRAINT fk_couleur FOREIGN KEY (couleur_id) REFERENCES couleur(id)
);

insert into couleur(nom) values
('rouge'),
('vert'),
('bleu');

insert into fruit(nom,couleur_id) values
('pomme',1),
('poire',2),
('cerise',null);

-- Joindre les 2 tables avec un INNER JOIN (99% des cas): 
-- Possibilité 1
SELECT fruit.nom, couleur.nom
from fruit
inner JOIN couleur 
on fruit.couleur_id = couleur.id;

-- Possiblité 2
SELECT f.nom, c.nom
from fruit as f
inner JOIN couleur as c
on f.couleur_id = c.id;

-- Joindre les 2 tables avec un LEFT JOIN (1% des cas):
SELECT f.nom, c.nom
from fruit as f
LEFT JOIN couleur as c
on f.couleur_id = c.id;

-- Joindre les 2 tables avec un RIGHT JOIN ("jamais"):
SELECT f.nom, c.nom
from fruit as f
RIGHT JOIN couleur as c
on f.couleur_id = c.id;