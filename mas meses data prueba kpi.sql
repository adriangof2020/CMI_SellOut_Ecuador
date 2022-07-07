/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [TABLERO_ECUADOR3].[dbo].[INDICADORES_KPI_1]

  UPDATE A SET A.[Zona_Clientes] = M.[Zona_Clientes]
FROM [INDICADORES_KPI_1] A JOIN MAESTRO_AGENCIAS_1 M ON A.cliente = M.Agencia_Distribuidora

UPDATE A SET A.territorio = M.territorio
FROM [INDICADORES_KPI_1] A JOIN MAESTRO_AGENCIAS_1 M ON A.cliente = M.Agencia_Distribuidora

UPDATE [INDICADORES_KPI_1] SET territorio = 'Todas' where territorio IS NULL
UPDATE [INDICADORES_KPI_1] SET [Zona_Clientes] = 'Todas' where [Zona_Clientes] IS NULL

UPDATE [INDICADORES_KPI_1] SET grupo_cliente = CASE grupo_cliente
WHEN 'Panales' THEN 'PANALES'
WHEN '2Malla' THEN '2MALLA' ELSE grupo_cliente END

UPDATE [INDICADORES_KPI_1] SET categoria = 'Limpiadores Light Du' where categoria = 'Desinfectantes'
