Задача 1. Вывести ко-во поставщиков не из UK и не из China

SELECT
	COUNT(*) AS total_not_uk_china_suppliers
FROM Suppliers

WHERE
	NOT Country IN ('UK', 'China')


Задача 2. Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5

SELECT
    AVG(Price) AS avg_price,
	MAX(Price) AS max_price,
    MIN(Price) AS min_price,
	COUNT(*) AS total_products
FROM Products
WHERE CategoryID IN (3, 5)


Задача 3. Вывести общую сумму проданных товаров

SELECT
 SUM (Products.Price * OrderDetails.Quantity) AS total_order_cost
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID=Products.ProductID

Задача 4. Вывести ко-во стран, которые поставляют напитки


SELECT
COUNT (DISTINCT Suppliers.Country) AS count_country
FROM  Products
JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE
 Categories.CategoryName = 'Beverages'

Задача 5. Вывести сумму, на которую было отправлено товаров клиентам в Germany

SELECT
SUM(Products.Price * OrderDetails.Quantity) AS sum_products_to_Germany
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID=Products.ProductID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE
    Customers.Country = 'Germany'


Задача 6. Вывести ко-во заказов, которое компания Speedy Express доставила в Brazil

SELECT
COUNT(*) AS total_orders
FROM Orders
JOIN Shippers ON Orders.ShipperID=Shippers.ShipperID
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
WHERE
Shippers.ShipperName = 'Speedy Express'
And
Customers.Country = 'Brazil'