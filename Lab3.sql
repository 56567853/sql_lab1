--1.Показать список продуктов (Name) и название их подкатегорий, из таблиц Production.Product, Production.ProductSubcategory.
SELECT PS.Name, PP.Name
FROM Production.ProductSubcategory AS PS
INNER JOIN Production.Product AS PP
ON PS.ProductSubcategoryID=PP.ProductSubcategoryID;

--2.Показать список продуктов (поле Name) в котором указано, есть ли у продукта единицы измерения размера или нет, из таблиц Production.Product, Production.UnitMeasure, используя LEFT OUTER JOIN.
SELECT PP.Name, UM.Name
FROM 
Production.Product AS PP
LEFT OUTER JOIN Production.UnitMeasure AS UM
ON PP.SizeUnitMeasureCode=UM.UnitMeasureCode;

--3.Показать названия моделей (поле Name) в котором указано, есть ли продукты данной модели или нет, из таблиц Production.ProductionModel, Production.Product, используя RIGHT OUTER JOIN.
SELECT PP.Name, PM.Name
FROM 
Production.Product AS PP
RIGHT OUTER JOIN
Production.ProductModel AS PM
ON PP.ProductModelID=PM.ProductModelID;

--4.Показать список продуктов (ProductID), которые имеют несколько причин списания (ScrapReasonID), из таблицы Production.WorkOrder, используя SELF JOIN.
SELECT DISTINCT W1.ProductID, W1.ScrapReasonID
FROM Production.WorkOrder AS W1
INNER JOIN Production.WorkOrder AS W2
ON W1.ProductID=W2.ProductID
AND W1.ScrapReasonID<>W2.ScrapReasonID
ORDER BY W1.ProductID;

--5.Показать список причин списания (ScrapReasonID), которые имеют несколько продуктов (ProductID), из таблицы Production.WorkOrder, используя SELF JOIN.
SELECT DISTINCT W1.ProductID, W1.ScrapReasonID
FROM Production.WorkOrder AS W1
INNER JOIN Production.WorkOrder AS W2
ON W1.ScrapReasonID=W2.ScrapReasonID
AND W1.ProductID<>W2.ProductID
ORDER BY W1.ScrapReasonID;

--6.Показать список товаров из таблицы Production.Product, которые имеют такой же размер как у товара с названием Mountain Bike Socks, M, используя SELF JOIN.
SELECT DISTINCT P1.Name, P1.Size
FROM Production.Product AS P1
INNER JOIN Production.Product AS P2
ON P1.Size=P2.Size
AND P2.Name='Mountain Bike Socks, M';

--7.Показать комбинированный список таблиц Production.Product по полям ProductID, ListPrice, Purchasing.ProductVendor по полям ProductID, StandardPrice, используя UNION.
SELECT ProductID, ListPrice
FROM Production.Product
UNION
SELECT ProductID, StandardPrice
FROM Purchasing.ProductVendor

--8.	Показать список ID, которые содержатся и в таблице Sales.Store (поле BusinessEntityID), и в таблице Sales.Customer (поле CustomerID).
SELECT BusinessEntityID
FROM Sales.Store
INTERSECT
SELECT CustomerID
FROM Sales.Customer