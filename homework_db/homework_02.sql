Задача 1. Вывести название и стоимость в USD одного самого дорогого проданного товара

SELECT
    ProductName,
    Price * 1.1 AS Price_usd
FROM OrderDetails
JOIN Products ON OrderDetails.ProductId=Products.ProductId
ORDER BY Price DESC
LIMIT 1

Задача 2. Вывести два самых дорогих товара из категории Beverages из USA

SELECT *
FROM Products
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
JOIN Categories ON Products.CategoryID=Categories.CategoryID
WHERE
	Suppliers.Country LIKE 'usa'
    AND
    Categories.CategoryName = 'Beverages'
    ORDER BY Price DESC
LIMIT 2

Задача 3. Удалить товары с ценой менее 5 EUR

DELETE FROM Products
WHERE
	Price < 5

Задача 4. Вывести список стран, которые поставляют морепродукты

SELECT  DISTINCT
Suppliers.Country
FROM  Products
JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE
 Categories.CategoryName = 'Seafood'

Задача 5. Очистить поле ContactName у всех клиентов не из China

UPDATE Customers
SET
    ContactName=''
 WHERE
  Country !='China'