/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  TipoDistribuidor ,Agrupacion_Distribuidora,  SUM(Real_Ton) toneladas FROM STAYING_SO_ECUADOR
WHERE Mes = 'Set-22'
GROUP BY TipoDistribuidor ,Agrupacion_Distribuidora
ORDER BY 1

SELECT  TipoDistribuidor ,Agrupacion_Distribuidora,  SUM(Real_Ton) toneladas FROM FactbookSOEcuador
WHERE Mes = 'Set-22'
GROUP BY TipoDistribuidor ,Agrupacion_Distribuidora
ORDER BY 1

SELECT  TipoDistribuidor ,Agrupacion_Distribuidora,  SUM(Real_Ton) toneladas FROM [DATA_MART_SO_ECUADOR]
WHERE Mes = 'Set-22'
GROUP BY TipoDistribuidor ,Agrupacion_Distribuidora
ORDER BY 1

