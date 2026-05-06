## SQL Protiseduur
Sotre procedure - salvestatud gprotseduurid - sama mis on funktsioonid programmerimleses, mingi teegevus, mis
 on salvestatud andmebaasi, ja saab automatselt teha (INSERT, UPDATE, SELECT).

´´´
Create database protseduuridMahmutov;
use protseduuridMahmutov;

CREATE TABLE Category2(
idCategory int PRIMARY KEY identity(1,1),
CategoryNimetus varchar (20));
INSERT INTO Category2
Values('Electronics');
SELECT * FROM Category2;
ALTER TABLE Category2 ADD CONSTRAINT CategoryNimetus UNIQUE (CategoryNimetus);


--pprotseduur mis lisab andmeid tabellisse ja kohe kuvab neid. (INSERT, SELECT).
CREATE Procedure lisaKategooria
--parameetrid @...
@uusKategooria varchar(30)
AS
BEGIN
--kirjeldus
	INSERT INTO Category2
	Values(@uusKategooria);
	SELECT * FROM Category2;
END;

--Kutse
EXEC lisaKategooria "AUTO";

--protseduur, mis kustutab kategooria id järgi
CREATE procedure kustutavKategooria
@kustutaID int
AS
BEGIN
	SELECT * FROM Category2;
	DELETE FROM Category2 WHERE idCategory=@kustutaID;
	SELECT * FROM Category2;
END
--kutse
EXEC kustutavKategooria 1

--protseduur mis kuvab kategooriad sissetatud esimese tähe järgi
CREATE PROCEDURE otsingtaht
@taht char(1)
AS
BEGIN
	SELECT * FROM Category2
	WHERE CategoryNimetus LIKE @taht + '%'; 
	END

--kutse
EXEC  otsingtaht 'A';
