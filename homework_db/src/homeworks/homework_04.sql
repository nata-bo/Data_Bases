Задача 1. Найти мин/стоимость товаров для каждой категории

SELECT
  CategoryID,
  MIN(Price) AS min_price

FROM Products

GROUP BY Products.CategoryID
ORDER BY CategoryID

Задача 2. Вывести ТОП-3 стран по количеству доставленных заказов

SELECT
  Suppliers.Country,
  SUM(OrderDetails.Quantity) AS sold_count

FROM OrderDetails

JOIN Products ON OrderDetails.ProductID=Products.ProductID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
GROUP BY Products.SupplierID
ORDER BY sold_count DESC
LIMIT 3

Задача 3. Вывести названия категорий, в которых более 10 товаров

SELECT
  Categories.CategoryName,
  COUNT(ProductID)

FROM Products

JOIN Categories ON Products.CategoryID= Categories.CategoryID
GROUP BY Products.CategoryID
HAVING COUNT(ProductID)>10

Задача 4. Очистить тел/номер поставщикам из USA
UPDATE Suppliers
SET
Phone = ''
WHERE Country = 'USA'

Задача 5. Вывести имена и фамилии (и ко-во заказов) менеджеров,
 у которых ко-во заказов менее 15
 SELECT
  Employees.FirstName,
  Employees.LastName,
  COUNT(OrderDetails.Quantity) AS order_count

 FROM OrderDetails

 JOIN Orders ON OrderDetails.OrderID= Orders.OrderID
 JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
 GROUP BY Employees.EmployeeID
 HAVING order_count<15