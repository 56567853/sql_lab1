--1.  Показать все поля из таблицы Production.ProductDocument.
      SELECT * FROM Production.ProductDocument

--2.  Показать поля ProductModelID, IllustrationID из таблицы Production.ProductModelIllustration.
      SELECT ProductModelID
         ,IllustrationID
      FROM Production.ProductModelIllustration

--3.  Показать поля ProductDescriptionID, [Description] из таблицы Production.ProductDescription, для которых идентификатор (ProductDescriptionID) больше 3 и меньше 122. Использовать оператор BETWEEN.
      SELECT ProductDescriptionID
         ,[Description]
      FROM Production.ProductDescription
      WHERE ProductDescriptionID BETWEEN 3 AND 122

--4.  Из таблицы HumanResources.JobCandidate показать ID кандидатов на должность (JobCandidateID), ID сотрудников (BusinessEntityID) и резюме ([Resume]). Показать только существующие ID сотрудников.
      SELECT JobCandidateID
         , BusinessEntityID
         , [Resume]
      FROM HumanResources.JobCandidate
      WHERE BusinessEntityID IS NOT NULL

--5.  Показать ID товаров (ProductID), имена и адреса электронных почт покупателей (ReviewerName и EmailAddress) и комментарии (Comments) из таблицы Production.ProductReview, где имя покупателя начинается на 'J'.
      SELECT ProductID
         , ReviewerName
         , EmailAddress
         , Comments
      FROM Production.ProductReview
      WHERE ReviewerName LIKE 'J%'

-- 6.  Из таблицы HumanResources.Department показать поля DepartmentID, [Name] и GroupName. Показать только значения поля GroupName из списка ('Manufacturing','Quality Assurance','Research and Development'). Использовать оператор IN.
      SELECT DepartmentID
         , [Name]
         , GroupName
      FROM HumanResources.Department
      WHERE GroupName IN ('Manufacturing','Quality Assurance','Research and Development')

-- 7.  Показать ID сотрудников (BusinessEntityID), доли продаж (SalesQuota), продажи в этом году (SalesYTD) и продажи в прошлом году (SalesLastYear). Неизвестные доли продаж заменить на 0 и вынести в отдельное поле с названием OtherSalesQuota.
      SELECT BusinessEntityID
         , SalesQuota
         , SalesYTD
         , SalesLastYear
         , ISNULL (SalesQuota, 0) AS OtherSalesQuota
      FROM Sales.SalesPerson

--8.  Показать поля ProductID, [Name] из таблицы Production.Product с применением функции COALESCE(). Показать поле Meauserement , так, чтобы, если значение в поле Size известно, то показать его, а иначе, показать значение в поле Class. Если и в поле Class значение неизвестно, то вывести значение 'UNKNOWN'.
      SELECT ProductID
         , Name
         , COALESCE (Size,Class,'UNKNOWN') AS Meauserement
      FROM Production.Product

      --9.  Отсортировать в обратном алфавитном порядке строки таблицы Person.AddressType в соответствии с полем [Name]. Показать поля AddressTypeID и [Name].
      SELECT AddressTypeID
         , [Name]
      FROM Person.AddressType
      ORDER BY [Name] DESC

--10.  Из таблицы Person.PersonPhone показать ID сотрудников (BusinessEntityID), номера телефонов (PhoneNumber) и типы номеров телефонов (PhoneNumberTypeID). Отсортировать все строки в алфавитном порядке в соответствии с полем BusinessEntityID и все значения поля PhoneNumberTypeID равные 1 заменить на NULL. Названия полей оставить без изменений.
      SELECT BusinessEntityID
         , PhoneNumber
         , PhoneNumberTypeID
         , NULLIF (PhoneNumberTypeID,1) AS PhoneNumberTypeID
      FROM Person.PersonPhone
      ORDER BY BusinessEntityID