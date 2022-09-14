/****** Script for SelectTopNRows command from SSMS  ******/
select  TipoDistribuidor ,Agrupacion_Distribuidora,  SUM(Real_Ton) toneladas FROM STAYING_SO_ECUADOR
WHERE Mes = 'Set-22'
GROUP BY TipoDistribuidor ,Agrupacion_Distribuidora
order by 1


select  TipoDistribuidor ,Agrupacion_Distribuidora,  SUM(Real_Ton) toneladas FROM [DATA_MART_SO_ECUADOR]
WHERE Mes = 'Set-22'
GROUP BY TipoDistribuidor ,Agrupacion_Distribuidora
order by 1
