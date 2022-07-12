/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      sum(real_Dolares)
     
  FROM [CmiSellOutEcuador].[dbo].[VENTAS_TABLERO] where Mes = 'Jul-22' AND Agrupacion_Distribuidora = 'PANALES'

  SELECT  Agencia_Distribuidora,  sum(real_Dolares) SUMA
  FROM [VENTAS_TABLERO] where Mes = 'Jul-22' AND Agrupacion_Distribuidora = 'PANALES'
  GROUP BY Agencia_Distribuidora
  ORDER BY 1 ASC
