/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [Mes]
      ,[Dia]
      ,[CodCategoria]
      ,[Categoria]
      ,[CodFamilia]
      ,[Familia]
      ,[CodAlicorp]
      ,[Material]
      
      ,[Agrupacion_Distribuidora]
      ,[Agencia_Distribuidora]
      , Usuario
      ,[Vendedor_Distribuidora]
      
      ,[CodClienteSellOut]
      ,[ClienteSellOut]
      
      ,[real_ton]
      
      ,[real_Dolares]
      
  FROM [CmiSellOutEcuador].[dbo].[VENTAS_TABLERO]
  WHERE Dia LIKE '%08/2022' AND CodClienteSellOut <> 'Dummy'