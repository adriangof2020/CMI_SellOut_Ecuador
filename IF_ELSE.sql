/****** Script for SelectTopNRows command from SSMS  ******/

IF OBJECT_ID(N'tempdb..#SUPERPRUEBAIF') IS NOT NULL DROP TABLE  #SUPERPRUEBAIF;
IF OBJECT_ID(N'tempdb..#SUPERPRUEBAIF2') IS NOT NULL DROP TABLE  #SUPERPRUEBAIF2;
IF OBJECT_ID(N'tempdb..#SUPERPRUEBAIF3') IS NOT NULL DROP TABLE  #SUPERPRUEBAIF3;

  DECLARE @HOLI INT
  SET @HOLI = YEAR(GETDATE())
  PRINT @HOLI
   
 
   --(SELECT distinct FNC DIA2 FROM [LF_NC_HISTORICO] WHERE FNC = '2022-03-14') B
-- CUANDO USAS IF NO SE PUEDE CREAR TABLAS PARA JOIN A PARTIR DE LOS SELECT
--SI EL IF ESTA A PARTIR DEL A SEGUNDA TABLA DEL JOIN. SI SE PUEDE CUANDO ESTA DENTRO DE UNA DE LAS OPCIONES
-- NOSE PUEDE CREAR DOS TABLAS CON EL MISMO NOMBRE SI USO IFEN LAS OPCIONES


SELECT * FROM [LF_NC_HISTORICO] WHERE FNC IN ('2020-07-20', '2020-07-27', '2005-07-27')
-- Cuando usas if la comparacion si una variable esta dentro de una seleccion es al revez que en un select con where
  IF @HOLI IN (SELECT YEAR(FNC) FROM [LF_NC_HISTORICO] )  
  
   SELECT DISTINCT FNC DIA2 
   INTO #SUPERPRUEBAIF
   FROM [LF_NC_HISTORICO]
   else  SELECT *
   INTO #SUPERPRUEBAIF2
   FROM [LF_NC_HISTORICO]

IF 
--IF OBJECT_ID(N'tempdb..#SUPERPRUEBAIF') IS NOT NULL alter table PRUEBA33 rename AA;  


  
--IF @HOLI IN (SELECT YEAR(FNC) FROM [LF_NC_HISTORICO] ) 
--select A.DIA, B.DIA2
--   INTO #SUPERPRUEBAIF3
--   FROM (SELECT DISTINCT DAY(FNC) DIA FROM [LF_NC_HISTORICO]) A
--   CROSS JOIN #SUPERPRUEBAIF B
--   ELSE 
--select A.DIA, B.DIA2
--   INTO #SUPERPRUEBAIF3
--   FROM (SELECT DISTINCT DAY(FNC) DIA FROM [LF_NC_HISTORICO]) A
--   CROSS JOIN #SUPERPRUEBAIF2 B

--   --select * from #SUPERPRUEBAIF2
----select 542 * 31
 



