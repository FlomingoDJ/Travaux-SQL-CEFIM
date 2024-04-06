-- Supprime la BDD spa
drop DATABASE spa;

-- Crée la BDD spa avec encodage UTF-8
create database spa CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Utilise la BDD spa
use spa;

-- Crée la table couleur avec en paramètre id et yeux
CREATE TABLE couleur(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    yeux varchar(25) NOT null)
    ENGINE=INNODB;

-- Ajoute des données à la table couleur
insert into couleur (yeux) values
('Marron'),
('Bleu');

-- Crée la table chat avec en paramètre id, nom, age et couleur_id (qui )
CREATE TABLE chat(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom varchar(50) NOT null,
    age tinyint(1) NOT null,
    couleur_id int not null,
        constraint fk_couleur foreign key (couleur_id) references couleur(id)
    )
    
    ENGINE=INNODB;

insert into chat (nom, age,couleur_id) values
('Maine Coon',20,1),
('Siamois',15,2),
('Bengal',18,1),
('Scottish Fold',10,1);

SELECT chat.id, chat.nom, chat.age, chat.couleur_id, couleur.yeux
FROM chat
INNER JOIN couleur
ON chat.couleur_id=couleur.id;

