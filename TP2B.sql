-- Création BDD Zoo
CREATE DATABASE zoo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Utilisation de la BDD Zoo
USE zoo;

-- Création d'une table dans la BDD Zoo
CREATE TABLE chat(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom varchar(50) NOT null,
    yeux varchar(25) NOT null,
    age tinyint(1) NOT null
    )
    ENGINE=INNODB;

-- Ajout des valeurs dans la table chat
insert into chat (nom, yeux, age) values
('Maine Coon','Marron',20),
('Siamois','Bleu',15),
('Bengal','Marron',18),
('Scottish Fold','Marron',10);

-- Affiche la ligne de l'id 2
select * from chat where id = 2;

-- Trie et affiche les colonnes nom puis age dans l'ordre croissant
select nom,age from chat order by nom,age asc;

-- Affiche les chats dont l'âge est compris strictement entre 11 et 19
select * from chat where age between 11 and 19;

-- Affiche les chats qui ont "sia" dans leur nom (insensible à la casse)
select nom from chat where nom like '%sia%';

-- Affiche l'âge moyen des chats
select AVG(age) from chat;

-- Affiche le nombre de chats
select COUNT(id) from chat;



