/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP [Eje_per] tabla fechas
      
      ,[dia]
      ,[COD_CATEGORIA] maestro materiales
      ,[CATEGORIA] maestro materiales
      ,[COD_FAMILIA] maestro materiales
      ,[FAMILIA_ACTUAL] maestro materiales
      ,[COD_MARCA] maestro materiales
      ,[MARCA_ACTUAL] maestro materiales

      
      ,[REGION_GEO][ZonaV2] 
	  'grupo condiciones' maestro agencia

      

      ,[REGION_VENTA][CodOficina],[NomOficina]
	   'Oficina de ventas' maestro agencia
      

      ,[ZONA_VENTA] [CodTerritorio] [NomTerritorio]
	  'Grupo_Vendedores' maestro agencia

     

      ,[OFICINA_VENTA][CodZona] [NomZona]
	  '[Zona_Clientes]' maestro agencia
	 

      
      ,[CLIENTE_ACTUAL]dex 

	  [Negocio] si es consumo masivo
      
      ,[PLAN_TON]
      ,[REAL_TON]
      ,[PLAN_SOLES]
      ,[REAL_SOLES]
      
      ,[UNIDAD_NEGOCIO] [Plataforma] maestro materiales
      
  FROM [FENIX_SO].[dbo].[BD_SELL_OUT_21]