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
