DROP Database if exists `CRM`;

Create database if not exists `CRM` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use CRM;

create table clients(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom varchar(255) NOT null)
    ENGINE=INNODB;

create table projet(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom varchar(255) NOT null,
    client_id int not null,
        constraint fk_client foreign key (client_id) references client(id))
    ENGINE=INNODB;

create table devis(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    version int not null,
    reference varchar(10) not null,
    prix float not null,
    projet_id int not null,
        constraint fk_projet foreign key (projet_id) references projet(id))
    ENGINE=INNODB;

create table facture(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    reference varchar(10) not null,
    info varchar(255) not null,
    total float not null,
    date_crea date not null,
    date_paiement date,
    devis_id int not null,
        constraint fk_devis foreign key (devis_id) references devis(id))
    ENGINE=INNODB;

INSERT INTO clients (nom) VALUES 
	('Mairie de Rennes'),
	('Neo Soft'),
	('Sopra'),
	('Accenture'),
	('Amazon');

INSERT INTO projet (nom, client_id) VALUES
	('Création de site internet', 1),
	('Creation de site internet', 1),
	('Logiciel CRM', 2),
	('Logiciel de devis', 3),
	('Site internet e-commerce', 4),
	('Logiciel ERP', 2),
	('Logiciel gestion de stock',4);

    
INSERT INTO devis (version,reference, prix, projet_id) VALUES
	('1','DEV2100A', 3000, 1),
	('2','DEV2100B', 5000, 2),
	('1','DEV2100C', 5000, 3),
	('1','DEV2100D', 3000, 4),
	('1','DEV2100E', 5000, 5),
	('1','DEV2100F', 2000, 6),
	('1','DEV2100G', 1000, 7);

INSERT INTO facture (reference,info,total,devis_id,date_crea,date_paiement)	
    VALUES
	('FA001', 'site internet partie 1', 1500, 1, '2023-09-01','2023-10-01'),
	('FA002', 'site internet partie 2', 1500, 1, '2023-09-20',null),
	('FA003', 'logiciel CRM', 5000, 2, '2024-02-01',null),
	('FA004', 'logiciel devis', 3000, 3, '2024-03-03','2024-04-03'),
	('FA005', 'site ecommerce', 5000, 4, '2024-04-01',null),
	('FA006', 'logiciel ERP', 2000, 2, '2024-04-01',null);


