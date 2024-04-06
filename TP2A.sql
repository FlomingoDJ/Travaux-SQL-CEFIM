-- Supprime la BDD invitation
DROP DATABASE invitation;

-- Création de la BDD invitation avec encodage UTF-8
CREATE DATABASE invitation CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Utilisation de la BDD invitation
USE invitation;

-- Création de la table personne dans la BDD invitation
CREATE TABLE personne(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    prénom varchar(255) NOT null,
    nom varchar(255) NOT null,
    age tinyint(1) NOT null,
    date_inscription date NOT null,
    statut enum ('valide','non valide') DEFAULT 'non valide',
    type enum('membre','non membre') DEFAULT 'non membre',
    description text,
    salaire_annuel int NOT null)
    ENGINE=INNODB;

-- Supprime la table personne si elle existe    
DROP TABLE if EXISTS personne;
-- Création de la table personne si elle n'existe pas
CREATE TABLE IF NOT EXISTS personne(
    id int NOT NULL AUTO_INCREMENT,
    prénom varchar(255) NOT null DEFAULT 'Toto',
    nom varchar(255) NOT null,
    age tinyint(1) NOT null,
    date_inscription date NOT null,
    statut enum ('valide','non valide') DEFAULT 'non valide',
    type enum('membre','non membre') DEFAULT 'non membre',
    description text,
    salaire_annuel int NOT null,
    PRIMARY KEY (`id`)
    )
    ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
  
-- Ajout des valeurs à la table 
insert into personne (prénom,nom,age,date_inscription,statut,type,description,salaire_annuel) values
('Brad','PITT',60,'1970/01/01','valide','non membre','lorem ipsum',2000000),
('George','Clooney',62,'1999/01/01','valide','membre','juste beau',4000000),
('Jean','DUJARDIN',51,'1994/01/01','non valide','membre','brice de nice',1000000);

-- Affiche le salaire annuel max de la table
select max(salaire_annuel) as salaire_max from personne;

-- Affiche le salaire annuel min de la table
select min(salaire_annuel) as salaire_min from personne;

-- Trie les salaires annuels par ordre décroissant et Affiche le 1er salaire et le nom associé (Affiche donc le salaire max = nom)
select nom, salaire_annuel from personne ORDER BY salaire_annuel desc limit 1;

-- Trie les salaires annuels par ordre croissant et Affiche le 1er salaire et le nom associé (Affiche donc le salaire min = nom)
select nom, salaire_annuel from personne ORDER BY salaire_annuel asc limit 1;

-- Affiche le salaire annuel moyen
select avg(salaire_annuel) from personne;

-- Affiche le nombre de personnes
select count(id) from personne;

-- Affiche les personnes s'étant inscrites entre le 1er janvier 1990 et le 1er janvier 2000
select * from personne where date_inscription between '1990/01/01' and '2000/01/01';

-- Reformate les noms des personnes en majuscule
select upper(nom) from personne;

-- Affiche les personnes dont le prénom commençe par B
select * from personne where prénom like 'B%';

-- Trie et affiche les personnes par age en ordre croissant
select age from personne order by age asc;
