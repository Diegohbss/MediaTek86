-- Création de la base de données
CREATE DATABASE mediatek86;

-- Sélection de la base de données
USE mediatek86;

-- Création de l'utilisateur avec les droits d'accès à la base de données
CREATE USER 'mediatek_user'@'localhost' IDENTIFIED BY 'password123';
GRANT ALL PRIVILEGES ON mediatek86.* TO 'mediatek_user'@'localhost';
FLUSH PRIVILEGES;

-- Création de la table 'responsable'
CREATE TABLE responsable (
    login VARCHAR(64),
    pwd VARCHAR(64)
);

-- Insertion du login et du mot de passe chiffré dans la table 'responsable'
INSERT INTO responsable (login, pwd) VALUES ('admin', SHA2('adminpassword', 256));

-- Création de la table 'motif'
CREATE TABLE motif (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(64)
);

-- Insertion des motifs dans la table 'motif'
INSERT INTO motif (nom) VALUES ('vacances'), ('maladie'), ('motif familial'), ('congé parental');

-- Création de la table 'service'
CREATE TABLE service (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(64)
);

-- Insertion des services dans la table 'service'
INSERT INTO service (nom) VALUES ('administratif'), ('médiation culturelle'), ('prêt');

-- Création de la table 'personnel'
CREATE TABLE personnel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(64),
    prenom VARCHAR(64),
    service_id INT,
    FOREIGN KEY (service_id) REFERENCES service(id)
);

-- Insertion d'exemples dans la table 'personnel'
INSERT INTO personnel (nom, prenom, service_id) VALUES 
('Dupont', 'Jean', 1),
('Martin', 'Marie', 2),
('Durand', 'Pierre', 3),
('Bernard', 'Lucie', 1),
('Moreau', 'Julien', 2),
('Roux', 'Sophie', 3),
('Leroy', 'Paul', 1),
('Petit', 'Clara', 2),
('Fontaine', 'Emma', 3),
('Moulin', 'Hugo', 1);

-- Création de la table 'absence'
CREATE TABLE absence (
    id INT AUTO_INCREMENT PRIMARY KEY,
    personnel_id INT,
    motif_id INT,
    date_debut DATE,
    date_fin DATE,
    FOREIGN KEY (personnel_id) REFERENCES personnel(id),
    FOREIGN KEY (motif_id) REFERENCES motif(id)
);

-- Insertion d'exemples dans la table 'absence'
INSERT INTO absence (personnel_id, motif_id, date_debut, date_fin) VALUES 
(1, 1, '2023-01-01', '2023-01-10'),
(2, 2, '2023-02-15', '2023-02-20'),
(3, 3, '2023-03-05', '2023-03-07'),
(4, 4, '2023-04-10', '2023-04-30'),
(5, 1, '2023-05-20', '2023-05-25'),
(6, 2, '2023-06-01', '2023-06-10'),
(7, 3, '2023-07-15', '2023-07-18'),
(8, 4, '2023-08-01', '2023-08-20'),
(9, 1, '2023-09-05', '2023-09-15'),
(10, 2, '2023-10-10', '2023-10-12'),
(1, 3, '2023-11-01', '2023-11-05'),
(2, 4, '2023-12-01', '2023-12-15'),
(3, 1, '2023-01-20', '2023-01-25'),
(4, 2, '2023-02-05', '2023-02-10'),
(5, 3, '2023-03-01', '2023-03-05'),
(6, 4, '2023-04-20', '2023-04-25'),
(7, 1, '2023-05-01', '2023-05-10'),
(8, 2, '2023-06-05', '2023-06-15'),
(9, 3, '2023-07-01', '2023-07-05'),
(10, 4, '2023-08-10', '2023-08-15'),
(1, 1, '2023-09-01', '2023-09-10'),
(2, 2, '2023-10-05', '2023-10-15'),
(3, 3, '2023-11-10', '2023-11-15'),
(4, 4, '2023-12-05', '2023-12-10'),
(5, 1, '2023-01-15', '2023-01-20'),
(6, 2, '2023-02-20', '2023-02-25'),
(7, 3, '2023-03-10', '2023-03-15'),
(8, 4, '2023-04-01', '2023-04-05'),
(9, 1, '2023-05-15', '2023-05-20'),
(10, 2, '2023-06-10', '2023-06-20'),
(1, 3, '2023-07-20', '2023-07-25'),
(2, 4, '2023-08-05', '2023-08-10'),
(3, 1, '2023-09-10', '2023-09-20'),
(4, 2, '2023-10-15', '2023-10-20'),
(5, 3, '2023-11-20', '2023-11-25'),
(6, 4, '2023-12-10', '2023-12-20'),
(7, 1, '2023-01-05', '2023-01-10'),
(8, 2, '2023-02-10', '2023-02-15'),
(9, 3, '2023-03-15', '2023-03-20'),
(10, 4, '2023-04-05', '2023-04-10'),
(1, 1, '2023-05-10', '2023-05-15'),
(2, 2, '2023-06-15', '2023-06-20'),
(3, 3, '2023-07-10', '2023-07-15'),
(4, 4, '2023-08-15', '2023-08-20'),
(5, 1, '2023-09-20', '2023-09-25'),
(6, 2, '2023-10-20', '2023-10-25'),
(7, 3, '2023-11-15', '2023-11-20'),
(8, 4, '2023-12-15', '2023-12-20');

-- Fin du script SQL
