/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Mes]
      ,[Dia]
      ,[CodCategoria]
      ,[Categoria]
      ,[CodFamilia]
      ,[Familia]
      ,[CodAlicorp]
      ,[Material]
      ,[CodMarca]
      ,[Marca]
      ,[Oficina_Ventas]
      ,[Grupo_Vendedores]
      ,[Agrupacion_Distribuidora]
      ,[Agencia_Distribuidora]
      ,[Grupo_Condiciones]
       ,[CodClienteSellOut]
      ,[ClienteSellOut]
	  ,Plan_Dol
	  ,real_Dolares
      ,[Plan_Ton]
      ,[real_ton]
      ,[Plataforma]
  FROM [CmiSellOutEcuador].[dbo].[VENTAS_TABLERO]
  WHERE Dia LIKE '%05/2022' AND ClienteSellOut <> 'Dummy'

