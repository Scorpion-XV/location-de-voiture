CREATE DATABASE location_de_voiture;



CREATE TABLE Clients (
    client_id INT PRIMARY KEY ,
    nom VARCHAR(30) DEFAULT 'Senegal',
    adresse VARCHAR(60) NOT NULL,
    numtel VARCHAR(15) UNIQUE NOT NULL,
    datenaiss DATE NOT NULL,
    email VARCHAR(30) UNIQUE,
    numpermis VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE Agences (
    nom VARCHAR(50) PRIMARY KEY,
    adresse VARCHAR(60) NOT NULL,
    numtel VARCHAR(15) UNIQUE NOT NULL,
    datecreation DATE NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL,
    voiture_dispo boolean,
    heure_ouv TIME NOT NULL,
    heure_fer TIME NOT NULL
);

CREATE TABLE Paiements (
    id_paiement INT PRIMARY KEY,
    client_id INT NOT NULL,
    id_voiture INT NOT NULL,
    mode VARCHAR(20) NOT NULL,
    montant INT NOT NULL,
    date_p TIMESTAMP NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Clients (client_id),
    FOREIGN KEY (id_voiture) REFERENCES voitures (numplaq)
);

CREATE TABLE Reservations (
    id_res INT PRIMARY KEY,
    client_id INT NOT NULL,
    voiture_res VARCHAR(100),
    debut_res TIMESTAMP NOT NULL,
    fin_res TIMESTAMP NOT NULL,
    montantloc INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Clients (client_id)
);

CREATE TABLE voitures (
    numplaq VARCHAR(20) PRIMARY KEY,
    client_id INT NOT NULL,
    modele VARCHAR(30) NOT NULL,
    anneefab DATE NOT NULL,
    prixloc INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Clients (client_id)
);



INSERT INTO Clients (client_id, nom, adresse, numtel, datenaiss, email, numpermis)
VALUES (1, 'Mouhammad NDOUR', 'Dakar Plateau', '767569140', '2000-05-15', 'ndourmouhammad15@fakemail.com', '92151600N7492'),
(2, 'Aziz DIOP', 'Bambey', '767564340', '1999-05-15', 'azizdiop99@fakemail.com', '921H1600N749M'),
(3, 'Awa Fall', 'Grand Dakar', '757569140', '3005-05-15', 'awa15@fakemail.com', '88151600N7492'),
(4, 'Aissa POUYE', 'Diourbel', '787569140', '1950-05-15', 'apouye@fakemail.com', '921516ZZN7492'),
(5, 'Abdou k NDOUR', 'Diourbel', '767560040', '1974-05-15', 'ndourak@fakemail.com', '94451600N7492');

INSERT INTO Agences (nom, adresse, numtel, datecreation, email, voiture_dispo, heure_ouv, heure_fer)
VALUES ('Budget', 'Hann', '33 889 46 80', '2008-01-01', 'budget.loc@gmail.com',TRUE, '08:00:00', '22:00:00'),
('DAP', 'Diourbel', '33 889 46 11', '2018-01-01', 'dkautop@gmail.com',TRUE, '08:00:00', '20:00:00'),
('locasen', 'Ouest Foire', '33 900 46 80', '2000-01-01', 'locasen00@gmail.com',FALSE, '08:00:00', '23:00:00'),
('AutoRent', 'Thies', '33 889 10 80', '1999-01-01', 'auto@gmail.com',TRUE, '07:00:00', '16:00:00');

INSERT INTO Paiements (id_paiement, client_id, id_voiture, mode, montant, date_p)
VALUES (1, 5, 'AA.012.BC', 'WAVE', 35000, '2023-03-23 10:00:05'),
(2, 1, 'AA.123.BC', 'Orange Money', 50000, '2023-03-20 08:00:05'),
(3, 4, 'AA.645.BF', 'Carte VISA', 45000, '2023-03-15 20:00:05');

INSERT INTO Reservations (id_res, client_id, voiture_res, debut_res, fin_res, montantloc)
VALUES (1, 5, 'Mercedes', '2023-03-15 08:00:00', '2023-03-15 20:00:00', 35000),
(2, 1, 'BMW', '2023-04-01 14:00:00', '2023-04-15 20:00:00', 235000),
(3, 4, 'TOYOTA', '2023-03-23 08:00:00', '2023-03-24 20:00:00', 45000);

INSERT INTO voitures (numplaq, client_id, modele, anneefab, prixloc)
VALUES ('AA.012.BC', 5 ,'berlines', '2000', 35000),
('AA.123.BC', 1 ,'hayonss', '2010', 50000),
('AA.645.BF', 4 ,'limousines', '1999', 45000);


UPDATE Clients 
set nom = 'Daouda DIONE', adresse = 'Thiaroye'
WHERE nom = 'Mouhammad NDOUR';

UPDATE Paiements
set mode = 'Free Money'
WHERE id_paiement = 3;

UPDATE voitures 
set anneefab = '2007'
WHERE client_id = 4;


DELETE FROM Reservations 
WHERE client_id = 1;

DELETE FROM Clients
WHERE email = 'ndourmouhammad15@gmail.com';

DELETE FROM Paiements
WHERE id_paiement IN (1,3);

SELECT client_id, prixloc
FROM voitures
ORDER BY 2;

SELECT client_id, prixloc
FROM voitures
ORDER BY 2 DESC;
