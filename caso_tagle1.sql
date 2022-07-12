/****** Script for SelectTopNRows command from SSMS  ******/
select sum(Real_USD) from BASE_FINAL WHERE 1=1
AND Periodo= '7_2022'
AND Grupo_Cliente = 'PANALES'

select Distribuidora, sum(Real_USD) from BASE_FINAL WHERE 1=1
AND Periodo= '7_2022'
AND Grupo_Cliente = 'PANALES'
GROUP BY Distribuidora
ORDER BY 1 ASC