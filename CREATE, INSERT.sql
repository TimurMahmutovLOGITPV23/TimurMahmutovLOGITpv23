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
