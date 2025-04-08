--kommentaar
--Xampp control panel
--Conect TO:
--Server Name:  local host - 127.0.0.1
-- Authentification 2 tüüpi:
--1. Windows Auth - localdb admini õigused
--2. SQL Server Auth - kontrollida varem tehtud kasutajad
--parool: eil ole

___________________________________________

CREATE DATABASE mahmutovLOGITpv23;
USE mahmutovLOGITpv23;

--tabeli loomine
-- identity(1,1) - ise täidab tabeli 1,2,3,...
CREATE TABLE inimene(
inimeneID int Primary Key identity(1,1),
nimi varchar(50) unique,
synniaeg date,
telefon char(12),
pikkus decimal(5,2),
opilaskodu bit
);
SELECT * FROM inimene;

--tabeli kustutamine 
DROP table inimene;
USE mahmutovLOGITpv23;

--tabeli loomine
--identity(1,1) - ise täidab tabeli 1,2,3,...
CREATE TABLE inimene(
inimeneID int Primary Key identity(1,1),
nimi varchar(50) unique,
synniaeg date,
telefon char(12),
pikkus decimal(5,2),
opilaskodu bit
);
SELECT * FROM inimene;

--tabeli kustutamine 
DROP table inimene;

--andnete lisamine
--DDL -data definition language
--DML -date manipulation language

INSERT INTO inimene (nimi, synniaeg, telefon, pikkus, opilaskodu);
VALUES
('Peeter Uus', '2001-15-30', '2568952', 90.5, 0),
('Kaarel Oja', '2000-12-30', '2568952', 90.5, 0),
('Mati Kask', '1983-12-30', '33333', 140.5, 0),
('Peeter Oja', '2021-12-30', '333333', 90.5, 0)
;

SELECT * FROM inimene;
--kustuta id =
DELETE FROM inimene
WHERE inimeneID=3;

CREATE TABLE elukoht(
elukohtID int PRIMARY KEY identity(1,1),
elukoht varchar(50) UNIQUE,
maakond varchar(50)
);
SELECT * FROM elukoht;
--andmete lisamine tabeli elukoht
INSERT INTO elukoht(elukoht, maakond)
VALUES ('Tallinn', 'Harjumaa'), ('Pärnu', 'Pärnumaa'), ('Tartu', 'Tartumaa');

--tabeli muutmine uue veergu lisamine
ALTER TABLE inimene ADD elukohtID int;
SELECT * from inimene;
-- foreign key lisamine
Alter table inimene 
ADD Constraint fk_elukoht
FOREIGN KEY (elukohtID)
references elukoht(elukohtID);


SELECT * from inimene;
SELECT * from elukoht;

INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID)
VALUES
('Peeter Uus', '2001-15-30', '2568952', 90.5, 1)

SELECT inimene.nimi, inimene.synniaeg, elukoht.elukoht
from inimene join elukoht
ON inimene.elukohtID=elukoht.elukohtID;

SELECT i.nimi, i.synniaeg, e.elukoht 
from inimene i join elukoht e
ON i.elukohtID=e.elukohtID;

CREATE TABLE autod
autoID int Primary Key Identity(1,1),
autoNR varchar(50) unique,
mudell char(12),
mark varchar(50,
v_aasta int,
);
SELECT * From autod;

INSERT INTO autod
(autoNR, mudell, mark, v_aasta)
VALUES
('ghf245', '88', 'Audi', '2000'),
('479hfn', '54', 'Honda', '2024')
;

ALTER TABLE inimene ADD autoID int;
SELECT * From inimene;

-- FOreing key
ALTER TABLE inimene
ADD constraint fk_autod
Foreign key (autoID)
references autod(autoID);

INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID, autoID)
VALUES
('Peeter Uus', '2001-15-30', '2568952', 90.5, 0, 1, 1);
