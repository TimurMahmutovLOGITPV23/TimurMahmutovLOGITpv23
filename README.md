## Andmetüübid
1. **Arvulised** - int, decimal(5,2), kus 2 numbri peale koma, bigint, smallint, real
2. **Teksti/sümboolid** - VARCHAR (255), CHAR(10), TEXT
Näited: telefoninumber, nimi, nimetus, isikukood, address
3. **Kuupäeva**  - DATE, TIME, date/time
4. **loogilised** - bit, bool, boolean, true/false

## Piirangud - ограниеченияъ
1. Primary key - primaarne võti - первичный ключ -
определяет уникальные значение для каждой строки / määrab unkiaalne iga rea kohta
2. UNIQUE
3. NOT NULL - ei luba tuhja väärust
4. FORGEIN KEY - võõrvälti / väline võti - вторичный ключ 
определяет набор значения из другой таблциы
5. CHECK - СHECK(naine, mees) - определяет наюор значений

##Põhimõised
- Andmebaasi haldussüteemid -  tarkvara, millega abil saab luua andmebaas (mariaDB - XAMPP, SQL Server)
- Andmebaas + struktureeritud andmete kogum
- Tabel - olem - cущности
- Veerg - väli - поле
- Rida - kirje - запись
- Primaarne võti - primary key -PK- veerg, unikaalse identifkatooriga (tavaliselt nimetakse id)
- Võõrvõti - foreign key - FK - veerg, mis loob seose teise tabeli primmarne võtmega

##SQL - structured query language - struktureeritud päringu keel
- päring - запрос
<img width="427" height="339" alt="image" src="https://github.com/user-attachments/assets/d055fe53-1bba-4edb-9cfc-b5f1cdfd6f96" />

1. DDL - Data definition Language
2. DML - Data Manipulation Language
