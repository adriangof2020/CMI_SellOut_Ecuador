/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [CmiSellOutEcuador].[dbo].[BD_FECHAS] FOR JSON AUTO

  SELECT * FROM OPENJSON(@json)
WITH (BusinessEntityID int,
   NationalIDNumber int,
   JobTitle varchar(100),
   BirthDate varchar(200),
   Gender varchar(2)
)