## SQL Protiseduur
Sotre procedure - salvestatud gprotseduurid - sama mis on funktsioonid programmerimleses, mingi teegevus, mis
 on salvestatud andmebaasi, ja saab automatselt teha (INSERT, UPDATE, SELECT).

´´´
--pprotseduur mis lisab andmeid tabellisse ja kohe kuvab neid. (INSERT, SELECT).
CREATE Procedure lisaKategooria
--parameetrid @...
@uusKategooria varchar(30)
AS
BEGIN
--kirjeldus
	INSERT INTO Category
	Values(@uusKategooria),
	SELECT * FROM Category
END;
´´´
