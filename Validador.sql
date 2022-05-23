/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [CmiSellOutEcuador].[dbo].[VENTAS_TABLERO] WHERE Territorio IS NULL

SELECT * 
FROM [CmiSellOutEcuador].[dbo].[VENTAS_TABLERO] WHERE plataforma IS  null

SELECT *
FROM [CmiSellOutEcuador].[dbo].[VENTAS_TABLERO] WHERE CodAlicorp IS NULL

SELECT *
FROM [CmiSellOutEcuador].[dbo].[VENTAS_TABLERO] WHERE Mes IS NULL

