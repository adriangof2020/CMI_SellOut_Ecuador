/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      sum(real_Dolares)
     
  FROM [CmiSellOutEcuador].[dbo].[VENTAS_TABLERO] where Mes = 'Jul-22' AND Agrupacion_Distribuidora = 'PANALES'

  SELECT  Agencia_Distribuidora,  sum(real_Dolares) SUMA
  FROM [VENTAS_TABLERO] where Mes = 'Jul-22' AND Agrupacion_Distribuidora = 'PANALES'
  GROUP BY Agencia_Distribuidora
  ORDER BY 1 ASC

 SELECT SUM(Importe) FROM BASE_MOBILVENDOR_AUTOMATICA WHERE MONTH(Fecha) = 07 AND Agencia = '156148774'

 DELETE FROM BASE_MOBILVENDOR_AUTOMATICA WHERE CodAlicorp IN ('AD0220', 'AD0221', 'AD0224', 'AD0225', 'AD0226', 'AD0227', 'AD0228', 'AD0229', 'AD0230', 'AD0231', 'AD0232', 'AD0233', 'AD0234', 'AD0241', 'AD0242', 'AD0243', 'AD0246', 'AD0247',
                                          'AD0248', 'Ali001', 'Ali002', 'Ali003', 'Ali005', 'Ali007', 'Ali008', 'Ali009', 'Ali011', 'Ali013', 'Ali015', 'Ali016', 'Ali017', 'Ali10', 'AD0219', 'AD0215', 'AD0218', 'Ali006',
										  'AD0217', 'ESPAPROM', 'AD0103', 'AD239', 'Ali014', 'ALIC063', 'H450C200', 'H523B017', 'H523B222', 'H523B223', 'P.33001461', '617080', '688320', '484168', '29116B', '453-G', '648-001', 'AMB360',
										  'H180-G', 'MY', 'SP', 'TALL', 'AD0058', 'GLL','AD0250', 'AD0249', 'AD0251', 'CL001' )
										  AND MONTH(Fecha) = 07 AND Agencia = '156148774'