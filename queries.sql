-- Veritabanı Sorguları

-- Posta kodu 1010 olan tüm müşterileri bulun
SELECT * FROM Customers WHERE PostalCode = 1010;
-- id'si 11 olan tedarikçinin telefon numarasını bulun
SELECT Phone FROM [Suppliers] WHERE SupplierID = 11;
-- Verilen ilk 10 siparişi, sipariş tarihine göre azalan şekilde listeleyin
SELECT * FROM [Orders] ORDER BY OrderDate desc limit 10;
-- Londra, Madrid veya Brezilya'da yaşayan tüm müşterileri bulun
SELECT * FROM [Customers] WHERE City='London' OR City='Madrid' OR Country='Brazil';
SELECT * FROM [Customers] where City in ('London','Madrid')  or Country = 'Brazil' --Aternative one with "in"
-- "The Shire" için bir müşteri kaydı ekleyin, ilgili kişi adı "Bilbo Baggins", adres - "Bag End" içinde "1 Hobbit-Hole", posta kodu "111" ve ülke "Middle Earth"
INSERT into Customers (CustomerName, ContactName, Address, City, PostalCode, Country) values ('The Shire', 'Bilbo Baggins', '1 Hobbit-Hole', 'Bag End', '111', 'Middle Earth');
INSERT into Customers values (92,'The Shire','Bilbo Baggins','Bag End','1 Hobbit-Hole','111','Middle Earth') --Alternative one but id column must be written is the difference 
-- Posta kodu "11122" olarak değişecek şekilde Bilbo Baggins kaydını güncelleyin
UPDATE Customers set PostalCode = '11122' WHERE ContactName = 'Bilbo Baggins';
-- (Zorlayıcı Görev) Müşteriler tablosunda kaç farklı şehrin saklandığını keşfetmek için bir sorgu bulun. Tekrarlar çift sayılmamalıdır
SELECT COUNT(DISTINCT City) /*AS TotalCities*/ FROM Customers; --Number of records: 70. Actually 69 but The Shire has added so...
-- (Zorlayıcı Görev) 20 karakterden uzun adları olan tüm tedarikçileri bulun. Adın uzunluğunu almak için "length(SupplierName)" kullanabilirsiniz.
SELECT * FROM [Suppliers] WHERE LENGTH(SupplierName) > 20; --Number of records: 11.