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

Server Name: (localdb)\MSSQLLocalDB

##Andmetüübid
```
1. int, smallint, decimal(5,2) - numbrillised
2. varchar(30), char(5), TEXT - tekst/sümbolised
3. date, time, datetime - kuppäeva
4. boolean, bit, bool - loogilised
```

## Piirangud - ограничения - CONSTRAINT (5)
1. PRIMARY KEY
2. NOT NULL
3. CHECK - valik
4. UNIQUE
5. FOREING KEY

## Tabelivahelised seosed
üks-ühele (nt naine-mees)
üks-mitmele (nt naine - lapsed)
mitme-mitmele (õpilased-tunnid)
<img width="523" height="276" alt="{9CF9F13D-74CF-43E6-B673-9C24E34F65BB}" src="https://github.com/user-attachments/assets/a84a9ec9-c4e9-4927-934e-b79e72723c5b" />
