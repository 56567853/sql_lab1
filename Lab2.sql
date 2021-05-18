--1)  Найти минимальную стоимость (StandardCost) из Production.ProductCostHistory.
SELECT MIN(StandardCost) as 'Минимальная стоимость'
FROM Production.ProductCostHistory;
--2)  Найти среднее время отдыха работников женского пола, которым 50 лет из таблицы HumanResources.Employee.
SELECT AVG(VacationHours) as 'Среднее время отдыха'
FROM HumanResources.Employee
WHERE DATEDIFF(YEAR, BirthDate, GETDATE()) = 50 AND Gender LIKE 'F'
--3)  Найти количество городов из разных стран из таблицы Person.StateProvince (из выборки исключить пустые поля).
SELECT CountryRegionCode, COUNT(Name) as 'Количество городов'
FROM Person.StateProvince
WHERE CountryRegionCode IS NOT NULL
GROUP BY CountryRegionCode
--4)  Найти профессии из таблицы HumanResources.Employee, где количество работников женского пола больше 1 (из выборки исключить пустые поля).
SELECT JobTitle, Gender, Count(BusinessEntityID) as 'Количество работников женского пола'
FROM HumanResources.Employee
WHERE JobTitle IS NOT NULL AND Gender IS NOT NULL
GROUP BY JobTitle, Gender
HAVING Count(BusinessEntityID) > 1 AND Gender LIKE 'F';
--5)  Вывести ProductID, где минимальная цена (ListPrice) меньше 1 из таблицы Production.ProductCostHistory. Добавить столбец с номером строки, определяя его порядок в зависимости от минимальной цены.
SELECT ROW_NUMBER() OVER (ORDER BY MIN(StandardCost)) as 'Номер строки', ProductID, MIN(StandardCost) as MinCost
FROM Production.ProductCostHistory
GROUP BY(ProductID)
HAVING MIN(StandardCost) < 1;