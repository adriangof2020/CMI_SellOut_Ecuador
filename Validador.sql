/****** Script for SelectTopNRows command from SSMS  ******/
--Tablero

SELECT *
  FROM [CmiSellOutEcuador].[dbo].[VENTAS_TABLERO] WHERE Territorio IS NULL

SELECT *
FROM [CmiSellOutEcuador].[dbo].[VENTAS_TABLERO] WHERE Familia IS NULL

SELECT *
FROM [CmiSellOutEcuador].[dbo].[VENTAS_TABLERO] WHERE CodAlicorp IS NULL

SELECT *
FROM [CmiSellOutEcuador].[dbo].[VENTAS_TABLERO] WHERE Mes IS NULL

--VENTAS_CONSOLIDADO

--SELECT *
--  FROM [CmiSellOutEcuador].[dbo].VENTAS_CONSOLIDADO WHERE Territorio IS NULL

--SELECT *
--FROM [CmiSellOutEcuador].[dbo].VENTAS_CONSOLIDADO WHERE Familia IS NULL


--SELECT *
--FROM [CmiSellOutEcuador].[dbo].VENTAS_CONSOLIDADO WHERE Mes IS NULL

