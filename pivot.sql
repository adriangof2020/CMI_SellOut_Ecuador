/****** Script for SelectTopNRows command from SSMS  ******/

SELECT categoria, A�O, Sales
--INTO UNPIVOT2
FROM
--------------------------------------------------------
(SELECT  *
  FROM [CmiSellOutEcuador].[dbo].[unpivot]) HOLI
	UNPIVOT
	(Sales FOR A�O IN ([2000], [2001], [2002], [2003])
	) AS PRUEBA_UNPIVOT
---------------------------------
-- LO QUE ESTA ENTRE RAYAS SERIA COMO UN ESPECIE DE TABLA TEMPORAL LLAMADA PRUEBA_UNPIVOT
--CREADA DE LA TABLA HOLI QUE VIENE DEL  tabla unpivot