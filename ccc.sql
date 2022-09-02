
  SELECT 
      Cliente_Dist, SUM(Real_USD) VentaPositiva
  FROM [TABLERO_ECUADOR3].[dbo].[BASE_FINAL] where Periodo = '8_2022'
  GROUP BY Cliente_Dist
  HAVING
  SUM(Real_USD) > 0.0000000001

 SELECT  
      CodClienteSellOut, SUM(real_Dolares) VentaPositiva
  FROM [CmiSellOutEcuador].[dbo].[WeekLanzamiento]
  GROUP BY CodClienteSellOut
  HAVING SUM(real_Dolares) > 0.0000000001