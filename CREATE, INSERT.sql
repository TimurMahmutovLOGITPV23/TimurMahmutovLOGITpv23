Create Database MahmutovBaas;

--ab kustutamine
DROP Database AUTOSMS;

USE MahmutovBaas;
CREATE TABLE tootaja(
tootajaID int PRIMARY KEY identity(1,1), --identity - automaatselt kasvav arv +1
eesnimi varchar(15) not null, 
perenimi varchar(30) not null,
synniaeg date,
aadress TEXT,
koormus int CHECK (koormus>0), -- piirang, et koormus > 0
aktiivne bit)

--tabeli kuvamine
SELECT * FROM tootaja

--andmete lisamine tabelisse
INSERT INTO tootaja(perenimi, eesnimi, synniaeg)
VALUES('Ilus', 'Liis', '2002-12-4')

--tabeli struktuuri muutmine
--1. uue veeru lisamine
ALTER TABLE tootaja ADD testVeerg int;
Select * from tootaja;
--2. veeru kustutamine
ALTER TABLE tootaja DROP COLUMN testVeerg;
--3. andmetüübi muutmine veerus
ALTER TABLE tootaja ALTER COLUMN testVeerg varchar(5);
--struktuuri kontrollimiseks kasutame protseduur sp_help
sp_help tootaja;

--piirangute lisamine
CREATE TABLE ryhm(
ryhmId int not null,
ryhmNimi char(10));
DROP TABLE ryhm;
--muudame tabeli ja lisame piirang - primary key
ALTER TABLE ryhm ADD CONSTRAINT pk_ryhm PRIMARY KEY (ryhmId);

INSERT INTO ryhm
VALUES (4, 'TITpe24');
SELECT * FROM ryhm;
--lisame piirang UNIQUE
ALTER TABLE ryhm ADD CONSTRAINT un_ryhm UNIQUE (ryhmNimi);

--lisame uus veerg
ALTER TABLE ryhm ADD ryhmajuhataja int;
--lisame piirang Foreign Key
ALTER TABLE ryhm ADD CONSTRAINT fk_ryhm
FOREIGN KEY (ryhmajuhataja) REFERENCES tootaja(tootajaId);
--kontrollimiseks
SELECT * from tootaja;
SELECT * from ryhm;
UPDATE ryhm SET ryhmajuhataja=2 WHERE ryhmNimi='LOGITpv24';

INSERT INTO tootaja
VALUES('Boris', 'Sinine', '1999-5-5', 'Tallinn', 200, 1),
('Aleksandr', 'Valge', '2010-2-6', 'Narva', 180, 0)
--andmete uuendaamine tabelis
UPDATE tootaja SET aadress='Tallinn', koormus=10, aktiivne=1
WHERE tootajaID=1;

--teine tabel
CREATE TABLE toovahetus(
toovahetusID int PRIMARY KEY identity(1,1),
kuupäev date,
tundideARV int,
tootajaID int,
FOREIGN KEY (tootajaID) REFERENCES tootaja(tootajaID))

Select * from toovahetus
select * from tootaja

--täidame tabeli
INSERT INTO toovahetus
VALUES ('2026-04-14', 7, 3)


CREATE TABLE koolitus(
koolitusID int PRIMARY KEY identity(1,1), 
nimetus varchar(60) not null, 
kestvus int,
algus date,
lopp date,
opetaja varchar(20))


CREATE TABLE opetamine(
opetamineID int PRIMARY KEY identity(1,1),
tootajaID int,
koolitusID int,
tunnistus bit,
hinne int,
FOREIGN KEY (tootajaID) REFERENCES tootaja(tootajaID),
FOREIGN KEY (koolitusID) REFERENCES koolitus(koolitusID))

INSERT INTO koolitus
VALUES
('Matemaatika', 16, '2026-03-01', '2026-03-02', 'Arnold Saar'),
('Inglise keel', 8, '2026-03-10', '2026-03-10', 'Tiina Lehtman'),
('Linux Operatsioonisüsteem', 24, '2026-04-01', '2026-04-03', 'Jaan Tamm');

INSERT INTO opetamine (tootajaID, koolitusID, tunnistus, hinne)
VALUES
(1, 1, 1, 5),
(2, 2, 0, 4),
(1, 3, 1, 5);

SELECT * FROM koolitus
SELECT * FROM opetamine
SELECT * FROM toovahetus
SELECT * FROM tootaja
