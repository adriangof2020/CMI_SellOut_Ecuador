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
      , 'SIN DATOS' Usuario
      ,[Vendedor_Distribuidora]
      
      ,[CodClienteSellOut]
      ,[ClienteSellOut]
      
      ,[real_ton]
      
      ,[real_Dolares]
      
  FROM [CmiSellOutEcuador].[dbo].[VENTAS_TABLERO]
  WHERE Dia LIKE '%07/2022' AND CodClienteSellOut <> 'Dummy'