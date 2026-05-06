## SQL Protiseduur
Sotre procedure - salvestatud gprotseduurid - sama mis on funktsioonid programmerimleses, mingi teegevus, mis
 on salvestatud andmebaasi, ja saab automatselt teha (INSERT, UPDATE, SELECT).

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

CREATE TABLE brands (
    brand_id INT PRIMARY KEY IDENTITY(1,1),
    brand_name VARCHAR(50) NOT NULL
);

SELECT * FROM brands;


CREATE TABLE products(
    product_id INT PRIMARY KEY identity(1,1),
    product_name VARCHAR(50) NOT NULL,
    brand_id INT,
    idCategory INT,
    model_year INT,
    list_price DECIMAL(10,2),

    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
	idCategory2 int,
    FOREIGN KEY (idCategory) REFERENCES Category2(idCategory),
	model_year2 INT,
	list_price2 money);

SELECT * FROM products;

INSERT INTO products 
VALUES 
('nutitelefon', 1, 2, 2021, 20022);


CREATE procedure suuremhind
@hind int 
AS
BEGIN 
	SELECT * FROM products
	WHERE list_price > @hind;
END;

--kutse
EXEC suuremhind 1000;

--OUTPUT parameetr

CREATE PROCEDURE minmaxHind
    @minHind MONEY OUTPUT,
    @maxHind MONEY OUTPUT
AS
BEGIN
    SELECT 
        @minHind = MIN(list_price),
        @maxHind = MAX(list_price)
    FROM products;
END;

--kustse
DECLARE @minHind MONEY, @maxHind MONEY;

EXEC minmaxHind @minHind OUTPUT, @maxHind OUTPUT;

PRINT 'Min hind = ' + CONVERT(varchar, @minHind);
PRINT 'Max hind = ' + CONVERT(varchar, @maxHind);

-- Protseduur veeru lisamiseks või kustutamiseks 
CREATE PROCEDURE muudatus
    @tegevus varchar(10),
    @tabelinimi varchar(25),
    @veerunimi varchar(25),
    @tyyp varchar(25) = NULL
AS
BEGIN
    DECLARE @sqltegevus varchar(max);

    SET @sqltegevus = CASE 
        WHEN @tegevus = 'add' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tyyp)

        WHEN @tegevus = 'drop' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
    END;

    PRINT @sqltegevus;
    EXEC (@sqltegevus);
END;

EXEC muudatus 'add', 'Category', 'testVeerg', 'int'
SELECT * FROM 
