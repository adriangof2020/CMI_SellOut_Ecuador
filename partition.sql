--SET DATEFORMAT DMY  para volverlo dias mes a�o,,,osea solo el orden
   


IF OBJECT_ID(N'tempdb..#CONSOLIDADO11') IS NOT NULL drop table #CONSOLIDADO11
SELECT day(Fecha) dia,--GRUPO,
SUM(Importe) SUBTOTAL_NETO
--SELECT * FROM #CONSOLIDADO11
--SELECT DAY(CONVERT(DATE,FECHA_MOVI))
into #CONSOLIDADO11
--select * FROM  #CONSOLIDADO1 ORDER BY  DIA
--select distinct FECHA_MOVI
FROM VENTAS_PYDACO_SELL_OUT-- tabla historica de Pydaco(tener el detalle de los 3 ultimos meses)
--WHERE GRUPO='SHAMPOO'
GROUP BY --GRUPO,
day(Fecha) 

IF OBJECT_ID(N'tempdb..#CONSOLIDADO22') IS NOT NULL  drop table #CONSOLIDADO22
SELECT a.dia,max(A.SUBTOTAL_NETO) SUBTOTAL,sum(b.SUBTOTAL_NETO) tot_acum
INTO #CONSOLIDADO22
--SELECT * 
FROM #CONSOLIDADO11 A
LEFT JOIN #CONSOLIDADO11 B
ON A.DIA>=B.DIA
--ORDER BY 1,3 ASC   
GROUP BY a.dia 
ORDER BY 1 ASC,2 ASC

--SELECT * FROM #CONSOLIDADO1 ORDER BY DIA SELECT * FROM #CONSOLIDADO2  13018.74  28956.27
 

SELECT A.DIA,A.SUBTOTAL_NETO,B.TOT_ACUM,A.SUBTOTAL_NETO/B.TOT_ACUM PORC

--SELECT * FROM #CONSOLIDADO1 ORDER BY DIA SELECT * FROM #CONSOLIDADO2 select *
FROM #CONSOLIDADO11 A
LEFT JOIN #CONSOLIDADO22 B
ON A.DIA<=B.DIA 
--order by A.dia asc
WHERE B.DIA=20-- asignar el dia de corte(con esto se tendra la proy por dia)  167576.81
order by 1 asc

--SELECT * FROM #CONSOLIDADO1 ORDER BY DIA 
SELECT DISTINCT datepart(DAY,Fecha) D
--SELECT DISTINCT datepart(DAY,Fecha) D ESTE ES EL DETALLE POR EL QUE ME LO VA A MOSTRAR SI LE QUITO EL DISTINCT EL DETALLE SERIA MAS GRANDE
,SUM(importe)  
OVER  (PARTITION BY datepart(DAY,Fecha) ) AS TOTAL
--ESTA ES COMO LA AGRUPACION POR LA QUE LO HARA LA SUMA EN ESTE CASO POR CADA DIA
from VENTAS_PYDACO_SELL_OUT 
ORDER BY 1 



SELECT DISTINCT datepart(DAY,Fecha) D
,SUM(importe)  
OVER  (PARTITION BY datepart(DAY,Fecha) ORDER BY datepart(DAY,Fecha) ) AS TOTAL
from VENTAS_PYDACO_SELL_OUT 
ORDER BY 1
