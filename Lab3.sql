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
SELECT DISTINCT PW1.ProductID, PW1.ScrapReasonID
FROM Production.WorkOrder AS PW1
INNER JOIN Production.WorkOrder AS PW2
ON PW1.ProductID=PW2.ProductID
AND PW1.ScrapReasonID<>PW2.ScrapReasonID
ORDER BY PW1.ProductID;

--5.Показать список причин списания (ScrapReasonID), которые имеют несколько продуктов (ProductID), из таблицы Production.WorkOrder, используя SELF JOIN.
SELECT DISTINCT PW1.ProductID, PW1.ScrapReasonID
FROM Production.WorkOrder AS PW1
INNER JOIN Production.WorkOrder AS PW2
ON PW1.ScrapReasonID=PW2.ScrapReasonID
AND PW1.ProductID<>PW2.ProductID
ORDER BY PW1.ScrapReasonID;

--6.Показать список товаров из таблицы Production.Product, которые имеют такой же размер как у товара с названием Mountain Bike Socks, M, используя SELF JOIN.
SELECT DISTINCT PP1.Name, PP1.Size
FROM Production.Product AS PP1
INNER JOIN Production.Product AS PP2
ON PP1.Size=PP2.Size
AND PP2.Name='Mountain Bike Socks, M';

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