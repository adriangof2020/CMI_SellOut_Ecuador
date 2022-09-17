/****** Script for SelectTopNRows command from SSMS  ******/
--Tablero

SELECT *
  FROM [CmiSellOutEcuador].[dbo].STAYING_SO_ECUADOR WHERE Territorio IS NULL

SELECT *
FROM [CmiSellOutEcuador].[dbo].STAYING_SO_ECUADOR WHERE Familia IS NULL

SELECT *
FROM [CmiSellOutEcuador].[dbo].STAYING_SO_ECUADOR WHERE CodAlicorp IS NULL

SELECT *
FROM [CmiSellOutEcuador].[dbo].STAYING_SO_ECUADOR WHERE Mes IS NULL

