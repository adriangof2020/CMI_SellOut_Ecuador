/****** Script for SelectTopNRows command from SSMS  ******/
USE CmiSellOutEcuador;

SET LANGUAGE US_ENGLISH;

DECLARE @dia DATE;
DECLARE @workday INT;
--Dia hábil de la fecha
DECLARE @workday_MA INT;
--Dia hábil que hay en el mes anterior
DECLARE @d1 AS VARCHAR(20);

SELECT @dia= DATEADD(DAY,-1,SYSDATETIME());
-- poner el último día de ventas
SELECT @workday = DIA_UTIL FROM BD_FECHAS WHERE TRY_CONVERT(DATE,DIA,103) = @dia
SELECT @workday_MA = DIA_UTIL FROM BD_FECHAS WHERE  TRY_CONVERT(DATE,DIA,103) = EOMONTH(@dia,-1)
SELECT @d1= TRY_CONVERT(VARCHAR(20), TRY_CONVERT(DATE, @dia,103),103);

PRINT @dia;
PRINT @workday;
PRINT @workday_MA;
PRINT 'd1 '+ @d1;

DECLARE @f AS DATE;
DECLARE @d2 AS VARCHAR(20);
DECLARE @d3 AS VARCHAR(20); 


SELECT @f= CASE WHEN TRY_CONVERT(VARCHAR(20), TRY_CONVERT(DATE, @dia,103),103)= TRY_CONVERT(VARCHAR(10),TRY_CONVERT(DATE,EOMONTH(@dia),103),103)
THEN TRY_CONVERT(DATE,EOMONTH(DATEADD(MONTH,-1,(@dia))),103) ELSE TRY_CONVERT(DATE, DATEADD(MONTH,-1,TRY_CONVERT(DATE, @d1, 103)),103) END;
SELECT @d2 = TRY_CONVERT(VARCHAR(10), @f, 103);
SELECT @d3 = TRY_CONVERT(VARCHAR(10), TRY_CONVERT(DATE,DATEADD(YEAR,-1,@dia),103),103); 

PRINT 'd2  '+ @d2;
PRINT 'd3  '+@d3;

DECLARE @M1 AS VARCHAR(20); 
DECLARE @M2 AS VARCHAR(20);
DECLARE @M3 AS VARCHAR(20);

SELECT @M1= PER FROM BD_FECHAS WHERE TRY_CONVERT(VARCHAR(10),TRY_CONVERT(DATE,DIA,103),103) = @d1;
SELECT @M2= PER FROM BD_FECHAS WHERE TRY_CONVERT(VARCHAR(10),TRY_CONVERT(DATE,DIA,103),103)  = @d2;
SELECT @M3= PER FROM BD_FECHAS WHERE TRY_CONVERT(VARCHAR(10),TRY_CONVERT(DATE,DIA,103),103)  = @d3;
 
PRINT @M1;
PRINT @M2;
PRINT @M3;

 --Para Pydaco
DECLARE @MA AS DATE;
DECLARE @MA_1 AS DATE;
DECLARE @MA_2 AS DATE;
DECLARE @MA_3 AS DATE;

SELECT @MA = DATEADD(MONTH,-1,@dia);
SELECT @MA_1 = DATEADD(MONTH,-2,@dia);
SELECT @MA_2 = DATEADD(MONTH,-3,@dia);
SELECT @MA_3 = DATEADD(MONTH,-4,@dia);

PRINT @MA;
PRINT @MA_1;
PRINT @MA_2;
PRINT @MA_3;


DECLARE @dm1 AS INTEGER; 
DECLARE @dm2 AS INTEGER;
DECLARE @dm3 AS INTEGER;

SELECT @dm1 = DIA_UTIL FROM BD_FECHAS
WHERE TRY_CONVERT(DATETIME, DIA,103) = TRY_CONVERT(DATETIME,@d1,103);
SELECT @dm2 = DIA_UTIL  FROM BD_FECHAS
WHERE TRY_CONVERT(DATETIME, dia,103) = TRY_CONVERT(DATETIME,@d2,103);
SELECT @dm3 = DIA_UTIL  FROM BD_FECHAS
WHERE TRY_CONVERT(DATETIME, dia,103) = TRY_CONVERT(DATETIME,@d3,103);

PRINT 'dm1 ' + TRY_CONVERT(VARCHAR(10),@dm1);
PRINT 'dm2 ' +  TRY_CONVERT(VARCHAR(10),@dm2);
PRINT 'dm3 ' +  TRY_CONVERT(VARCHAR(10),@dm3);

DECLARE @DMAX AS INTEGER;
DECLARE @DMAX2 AS INTEGER;
DECLARE @DMAX3 AS INTEGER;

SELECT @DMAX= MAX(DIA_UTIL) FROM BD_FECHAS 
WHERE PER IN  (SELECT PER FROM BD_FECHAS WHERE TRY_CONVERT(VARCHAR(10),TRY_CONVERT(DATE,DIA,103),103)=@d1);
SELECT @DMAX2= MAX(DIA_UTIL) FROM BD_FECHAS 
WHERE PER IN  (SELECT PER FROM BD_FECHAS WHERE TRY_CONVERT(VARCHAR(10),TRY_CONVERT(DATE,DIA,103),103)=@d2);
SELECT @DMAX3= MAX(DIA_UTIL) FROM BD_FECHAS 
WHERE PER IN  (SELECT PER FROM BD_FECHAS WHERE TRY_CONVERT(VARCHAR(10),TRY_CONVERT(DATE,DIA,103),103)=@d3);

PRINT @DMAX;
PRINT @DMAX2;
PRINT @DMAX3;

DECLARE @ds1 AS INTEGER; 
DECLARE @ds2 AS INTEGER;
DECLARE @ds3 AS INTEGER;
DECLARE @ds4 AS INTEGER;
DECLARE @ds5 AS INTEGER;
DECLARE @ds6 AS INTEGER;
DECLARE @ds7 AS INTEGER;
DECLARE @ds8 AS INTEGER;
DECLARE @ds9 AS INTEGER;
DECLARE @ds10 AS INTEGER;
DECLARE @ds11 AS INTEGER;
DECLARE @ds12 AS INTEGER;

SELECT @ds1 = MAX(dia_SEM_util)   FROM BD_FECHAS
WHERE TRY_CONVERT(DATETIME, dia,103) <= TRY_CONVERT(DATETIME,@d1,103) AND PER= @M1 AND SEM LIKE '%1 AL 7%';
SELECT @ds2 = MAX(dia_SEM_util)   FROM BD_FECHAS
WHERE TRY_CONVERT(DATETIME, dia,103) <= TRY_CONVERT(DATETIME,@d1,103) AND PER= @M1 AND SEM LIKE '%8 AL 14%';
SELECT @ds3 = MAX(dia_SEM_util)   FROM BD_FECHAS
WHERE TRY_CONVERT(DATETIME, dia,103) <= TRY_CONVERT(DATETIME,@d1,103) AND PER= @M1 AND SEM LIKE '%15 AL 21%';
SELECT @ds4 = MAX(dia_SEM_util)   FROM BD_FECHAS
WHERE TRY_CONVERT(DATETIME, dia,103) <= TRY_CONVERT(DATETIME,@d1,103) AND PER= @M1 AND SEM LIKE '%22 AL 31%';
SELECT @ds5	 = MAX(dia_SEM_util)   FROM BD_FECHAS
WHERE TRY_CONVERT(DATETIME, dia,103) <= TRY_CONVERT(DATETIME,@d2,103) AND PER= @M2 AND SEM LIKE '%1 AL 7%';
SELECT @ds6 = MAX(dia_SEM_util)   FROM BD_FECHAS
WHERE TRY_CONVERT(DATETIME, dia,103) <= TRY_CONVERT(DATETIME,@d2,103) AND PER= @M2 AND SEM LIKE '%8 AL 14%';
SELECT @ds7 = MAX(dia_SEM_util)   FROM BD_FECHAS
WHERE TRY_CONVERT(DATETIME, dia,103) <= TRY_CONVERT(DATETIME,@d2,103) AND PER= @M2 AND SEM LIKE '%15 AL 21%';
SELECT @ds8 = MAX(dia_SEM_util)   FROM BD_FECHAS
WHERE TRY_CONVERT(DATETIME, dia,103) <= TRY_CONVERT(DATETIME,@d2,103) AND PER= @M2 AND SEM LIKE '%22 AL 31%';
SELECT @ds9 = MAX(dia_SEM_util)   FROM BD_FECHAS
WHERE TRY_CONVERT(DATETIME, dia,103) <= TRY_CONVERT(DATETIME,@d3,103) AND PER= @M3 AND SEM LIKE '%1 AL 7%';
SELECT @ds10 = MAX(dia_SEM_util)   FROM BD_FECHAS
WHERE TRY_CONVERT(DATETIME, dia,103) <= TRY_CONVERT(DATETIME,@d3,103) AND PER= @M3 AND SEM LIKE '%8 AL 14%';
SELECT @ds11 = MAX(dia_SEM_util)   FROM BD_FECHAS
WHERE TRY_CONVERT(DATETIME, dia,103) <= TRY_CONVERT(DATETIME,@d3,103) AND PER= @M3 AND SEM LIKE '%15 AL 21%';
SELECT @ds12 = MAX(dia_SEM_util)   FROM BD_FECHAS
WHERE TRY_CONVERT(DATETIME, dia,103) <= TRY_CONVERT(DATETIME,@d3,103) AND PER= @M3 AND SEM LIKE '%22 AL 31%';

PRINT @ds1;
PRINT @ds2;
PRINT @ds3;
PRINT @ds4;
PRINT @ds5;
PRINT @ds6;
PRINT @ds7;
PRINT @ds8;
PRINT @ds9;
PRINT @ds10;
PRINT @ds11;
PRINT @ds12;


--Creo tablas con variables
IF OBJECT_ID(N'tempdb..#FECHA1') IS NOT NULL DROP TABLE #FECHA1;

SELECT *
INTO #FECHA1
FROM (SELECT @d1 Fecha) A

IF OBJECT_ID(N'tempdb..#FECHA2') IS NOT NULL DROP TABLE #FECHA2;

SELECT *
INTO #FECHA2
FROM (SELECT @d2 Fecha) A

IF OBJECT_ID(N'tempdb..#FECHA3') IS NOT NULL DROP TABLE #FECHA3;

SELECT *
INTO #FECHA3
FROM (SELECT @d3 Fecha) A

IF OBJECT_ID(N'tempdb..#FECHA') IS NOT NULL DROP TABLE #FECHA;

SELECT *
INTO #FECHA
FROM #FECHA1

INSERT INTO #FECHA
SELECT * FROM #FECHA2

INSERT INTO #FECHA
SELECT * FROM #FECHA3

--Creo tabla que contiene solo fechas con días hábiles
IF OBJECT_ID(N'tempdb..#WORKINGDAYS') IS NOT NULL DROP TABLE #WORKINGDAYS;

SELECT *
INTO #WORKINGDAYS
FROM BD_FECHAS

DELETE FROM #WORKINGDAYS WHERE DIA_SEM = '7';
DELETE FROM #WORKINGDAYS WHERE FESTIVO = '1';


--Este maestro solo tiene codigos alicorp y sus quiebres
TRUNCATE TABLE MAESTRO_ALICORP;
--La llave es el CodAlicorp
BULK INSERT MAESTRO_ALICORP
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\MATERIALES_ALICORP_2.csv'
WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

UPDATE TABLA_MATERIALES SET CodAlicorp = TRIM(CodAlicorp);
UPDATE TABLA_MATERIALES SET Material = TRIM(Material);
UPDATE TABLA_MATERIALES SET CodCategoria = TRIM(CodCategoria);
UPDATE TABLA_MATERIALES SET Categoria = TRIM(Categoria);
UPDATE TABLA_MATERIALES SET CodFamilia = TRIM(CodFamilia);
UPDATE TABLA_MATERIALES SET Familia = TRIM(Familia);
UPDATE TABLA_MATERIALES SET CodMarca = TRIM(CodMarca);
UPDATE TABLA_MATERIALES SET Marca = TRIM(Marca);
UPDATE TABLA_MATERIALES SET Plataforma = TRIM(Plataforma);

--Este maestro se usa para unir el CodLaFabril con los CodAlicorp
TRUNCATE TABLE TABLA_MATERIALES;
--En esta base la llave es CodLaFabril&Descripcion de la Fabril
-- se usa para poner los codigos alicorp a las notas de credito
BULK INSERT TABLA_MATERIALES
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\MATERIALES_ALICORP_1.csv'
WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

UPDATE TABLA_MATERIALES SET CodFabril = TRIM(CodFabril);
UPDATE TABLA_MATERIALES SET MaterialLaFabril = TRIM(MaterialLaFabril);
UPDATE TABLA_MATERIALES SET CodAlicorp = TRIM(CodAlicorp);
UPDATE TABLA_MATERIALES SET Material = TRIM(Material);
UPDATE TABLA_MATERIALES SET CodCategoria = TRIM(CodCategoria);
UPDATE TABLA_MATERIALES SET Categoria = TRIM(Categoria);
UPDATE TABLA_MATERIALES SET CodFamilia = TRIM(CodFamilia);
UPDATE TABLA_MATERIALES SET Familia = TRIM(Familia);
UPDATE TABLA_MATERIALES SET CodMarca = TRIM(CodMarca);
UPDATE TABLA_MATERIALES SET Marca = TRIM(Marca);
UPDATE TABLA_MATERIALES SET Plataforma = TRIM(Plataforma);


TRUNCATE TABLE MAESTRO_AGENCIAS;
 
BULK INSERT MAESTRO_AGENCIAS
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\MAESTRO_AGENCIAS.csv'
WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

UPDATE MAESTRO_AGENCIAS SET Agencia = TRIM(Agencia);
UPDATE MAESTRO_AGENCIAS SET NomOficina = TRIM(NomOficina);
UPDATE MAESTRO_AGENCIAS SET CodOficina = TRIM(CodOficina);



--PYDACO
-- Usar cada vez para cargar meses nuevo al histórico
--SET LANGUAGE SPANISH;

--BULK INSERT PYDACO_HISTORICO
--FROM 'C:\Proyectos\Ecuador\PYDACO\JUN2022.csv'
--WITH (FIELDTERMINATOR = ';', FIRSTROW = 2, CODEPAGE = 'ACP') 
----USAR CADA VEZ QUE SE TENGA LA INFO DEL MES CERRADO
--SET LANGUAGE US_ENGLISH;

TRUNCATE TABLE VENTAS_PYDACO_SELL_OUT;
--Colocar los meses a comparar
INSERT INTO VENTAS_PYDACO_SELL_OUT
SELECT *
FROM PYDACO_HISTORICO
WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 06;

INSERT INTO VENTAS_PYDACO_SELL_OUT
SELECT *
FROM PYDACO_HISTORICO
WHERE DATEPART(YEAR,Fecha) = 2021 AND DATEPART(MONTH,Fecha) = 06;

INSERT INTO VENTAS_PYDACO_SELL_OUT
SELECT *
FROM PYDACO_HISTORICO
WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 05;


UPDATE A SET Agencia = TRIM(Agencia) FROM VENTAS_PYDACO_SELL_OUT A;
UPDATE A SET ClienteSellOut = TRIM(ClienteSellOut) FROM VENTAS_PYDACO_SELL_OUT A;
UPDATE A SET Vendedor_Distribuidora = TRIM(Vendedor_Distribuidora) FROM VENTAS_PYDACO_SELL_OUT A;
UPDATE A SET CodPydaco = TRIM(CodPydaco) FROM VENTAS_PYDACO_SELL_OUT A;
UPDATE A SET CodClienteSellOut = TRIM(CodClienteSellOut) FROM VENTAS_PYDACO_SELL_OUT A;

--Creo tabla temporal para homologar los campos y darle formato a la fecha, tambien calculo las toneladas , VentaKilos real_ton
IF OBJECT_ID(N'tempdb..#PYDACO') IS NOT NULL DROP TABLE #PYDACO; 

SELECT CONVERT(VARCHAR(20), A.Fecha, 103) Fecha, A.Agencia Agencia, A.CodClienteSellOut, A.ClienteSellOut,  A.Vendedor_Distribuidora, 'SIN ASIGNAR - PYCO' Tipo_tienda_Distribuidora, M.CodAlicorp CodAlicorp,
	   A.TUnidades, 0  Plan_Ton, 0 Plan_Dol, A.Importe real_Dolares,
	   'Consumo Masivo' Negocio
INTO #PYDACO
FROM VENTAS_PYDACO_SELL_OUT A
	LEFT JOIN TABLA_MATERIALES_PYDACO M ON A.CodPydaco = M.CodPydaco;

--SELECT * FROM  #PYDACO WHERE CodAlicorp IS NULL

IF OBJECT_ID(N'tempdb..#PYDACO_DUMMY') IS NOT NULL DROP TABLE #PYDACO_DUMMY;

SELECT B.Fecha, A.Agencia, C.CodAlicorp
INTO #PYDACO_DUMMY 
FROM (SELECT DISTINCT Agencia FROM #PYDACO) A CROSS JOIN #FECHA B
CROSS JOIN (SELECT DISTINCT CodAlicorp FROM #PYDACO) C


INSERT INTO #PYDACO
SELECT CONVERT(VARCHAR(20), A.Fecha, 103) Fecha, A.Agencia Agencia, 'Dummy' CodClienteSellOut, 'Dummy' ClienteSellOut, 'Dummy' Vendedor_Distribuidora, 'Dummy' Tipo_tienda_Distribuidora, A.CodAlicorp CodAlicorp,
	   0 TUnidades, 0  Plan_Ton, 0 Plan_Dol, 0 real_Dolares,
	   'Consumo Masivo' Negocio
FROM #PYDACO_DUMMY A


UPDATE #PYDACO 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%'

UPDATE #PYDACO
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'   
	WHEN '8309001' THEN '8309120' 
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128'
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;
---------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
--Creo tabla temporal para obtener la proporcion de ventas que se reemplazara a la informacion que viene del sell in

IF OBJECT_ID(N'tempdb..#CONSOLIDADO0') IS NOT NULL drop table #CONSOLIDADO0

SELECT *
--SELECT DAY(Fecha) Dia, SUM(Importe) SUBTOTAL_NETO
INTO #CONSOLIDADO0
FROM PYDACO_HISTORICO
WHERE TRY_CONVERT(VARCHAR,YEAR(Fecha))+TRY_CONVERT(VARCHAR,MONTH(Fecha))
	IN (TRY_CONVERT(VARCHAR,YEAR(@MA))+TRY_CONVERT(VARCHAR,MONTH(@MA)),
		TRY_CONVERT(VARCHAR,YEAR(@MA_1))+TRY_CONVERT(VARCHAR,MONTH(@MA_1)),
		TRY_CONVERT(VARCHAR,YEAR(@MA_2))+TRY_CONVERT(VARCHAR,MONTH(@MA_2)),
		TRY_CONVERT(VARCHAR,YEAR(@MA_3))+TRY_CONVERT(VARCHAR,MONTH(@MA_3)))
--SELECT * FROM #CONSOLIDADO0 where month (fecha) = 12 ORDER BY FECHA

UPDATE A SET Agencia = TRIM(Agencia) FROM #CONSOLIDADO0 A;
UPDATE A SET ClienteSellOut = TRIM(ClienteSellOut) FROM #CONSOLIDADO0 A;
UPDATE A SET Vendedor_Distribuidora = TRIM(Vendedor_Distribuidora) FROM #CONSOLIDADO0 A;
UPDATE A SET CodPydaco = TRIM(CodPydaco) FROM #CONSOLIDADO0 A;
UPDATE A SET CodClienteSellOut = TRIM(CodClienteSellOut) FROM #CONSOLIDADO0 A;
		
--GROUP BY DAY(Fecha)
--SELECT TRY_CONVERT(VARCHAR,YEAR(@MA))+TRY_CONVERT(VARCHAR,MONTH(@MA))

IF OBJECT_ID(N'tempdb..#CONSOLIDADO0_1') IS NOT NULL DROP TABLE #CONSOLIDADO0_1; 

SELECT A.Fecha Fecha, A.Agencia Agencia, A.CodClienteSellOut, A.ClienteSellOut,  A.Vendedor_Distribuidora, 'SIN ASIGNAR - PYCO' Tipo_tienda_Distribuidora,
	   MP.CodAlicorp, M.CodFamilia, M.Familia,
	   A.TUnidades, 0  Plan_Ton, 0 Plan_Dol, A.Importe/1000 real_Dolares, A.TUnidades*M.PesoTon real_ton,
	   'Consumo Masivo' Negocio
INTO #CONSOLIDADO0_1
FROM #CONSOLIDADO0 A
	LEFT JOIN TABLA_MATERIALES_PYDACO MP ON A.CodPydaco = MP.CodPydaco
	LEFT JOIN MAESTRO_ALICORP M ON MP.CodAlicorp = M.CodAlicorp;
--SELECT distinct CodFamilia ,Familia  FROM #CONSOLIDADO0_1 where month (fecha ) =12 and day (fecha) = 29


IF OBJECT_ID(N'tempdb..#CONSOLIDADO0_2') IS NOT NULL DROP TABLE #CONSOLIDADO0_2; 

SELECT A.Fecha, A.Agencia, A.CodFamilia, A.Familia,
	   ISNULL(SUM(A.Plan_Ton), 0) Plan_Ton, ISNULL(SUM(A.Plan_Dol), 0) Plan_Dol , ISNULL(SUM(A.real_Dolares), 0) real_Dolares, ISNULL(SUM(A.real_ton), 0) real_ton
INTO #CONSOLIDADO0_2
FROM #CONSOLIDADO0_1 A
GROUP BY A.Fecha, A.Agencia, A.CodFamilia, A.Familia
	   

IF OBJECT_ID(N'tempdb..#CONSOLIDADO0_3') IS NOT NULL DROP TABLE #CONSOLIDADO0_3; 

SELECT *
INTO #CONSOLIDADO0_3
FROM #CONSOLIDADO0_2


--Selecciono los 3 meses que necesito
IF TRY_CONVERT(VARCHAR,YEAR(@MA))+TRY_CONVERT(VARCHAR,MONTH(@MA)) IN (SELECT TRY_CONVERT(VARCHAR,YEAR(Fecha))+TRY_CONVERT(VARCHAR,MONTH(Fecha))
						                                              FROM #CONSOLIDADO0_3)
DELETE FROM #CONSOLIDADO0_3
WHERE TRY_CONVERT(VARCHAR,YEAR(Fecha))+TRY_CONVERT(VARCHAR,MONTH(Fecha)) IN (TRY_CONVERT(VARCHAR,YEAR(@MA_3))+TRY_CONVERT(VARCHAR,MONTH(@MA_3)))
--select distinct Fecha from #CONSOLIDADO0_3		order by 1 asc	


IF OBJECT_ID(N'tempdb..#CONSOLIDADO1') IS NOT NULL DROP TABLE #CONSOLIDADO1; 

SELECT A.DIA Dia,
--B.CodFamilia, B.Familia,
	   C.Plan_Ton , C.Plan_Dol , C.real_Dolares, C.real_ton, AVG(C.real_Dolares) OVER() AS AVG_Dolares, AVG(C.real_ton) OVER() AS AVG_Ton
INTO #CONSOLIDADO1
FROM (SELECT DIA_UTIL Dia FROM #WORKINGDAYS WHERE PER = @M1 ) A
	--CROSS JOIN (SELECT DISTINCT CodFamilia, Familia FROM #CONSOLIDADO0_3) B
	LEFT JOIN 
	(SELECT D.DIA_UTIL Dia2,
	--CodFamilia, Familia,
	        SUM(E.Plan_Ton) Plan_Ton, SUM(E.Plan_Dol) Plan_Dol , SUM(E.real_Dolares) real_Dolares, SUM(E.real_ton) real_ton
	 FROM (SELECT * FROM #WORKINGDAYS)  D
		  JOIN  (SELECT Fecha, SUM(Plan_Ton) Plan_Ton, SUM(Plan_Dol) Plan_Dol , SUM(real_Dolares) real_Dolares, SUM(real_ton) real_ton
			     FROM  #CONSOLIDADO0_3  GROUP BY Fecha) E ON CONVERT(DATE,D.DIA,103) = E.Fecha
	 GROUP BY D.DIA_UTIL) 
			     --, CodFamilia, Familia
	 C	ON
	--B.CodFamilia = C.CodFamilia AND
	 A.Dia =C.Dia2;
	
--INSERT INTO #CONSOLIDADO1 VALUES(26,NULL, NULL, NULL, NULL,9.3270372, 4.07487564 )

--Reemplazamos a los dias hábiles sin ventas por el promedio
UPDATE A SET A.real_Dolares = A.AVG_Dolares,
             A.real_ton = A.AVG_Ton,
			 A.Plan_Dol = 0,
			 A.Plan_Ton = 0
		FROM #CONSOLIDADO1 A 
		WHERE A.real_Dolares IS NULL AND A.real_ton IS NULL AND A.Plan_Dol IS NULL AND A.Plan_Ton IS NULL;


--IF OBJECT_ID(N'tempdb..#CONSOLIDADO1') IS NOT NULL DROP TABLE #CONSOLIDADO1; 

--SELECT A.DIA Dia,
----B.CodFamilia, B.Familia,
--	   ISNULL(C.Plan_Ton, 0) Plan_Ton, ISNULL(C.Plan_Dol, 0) Plan_Dol , ISNULL(C.real_Dolares, 0) real_Dolares, ISNULL(C.real_ton, 0) real_ton
--INTO #CONSOLIDADO1
--FROM (SELECT DAY(CONVERT(DATE,DIA,103)) DIA FROM [BD_FECHAS] WHERE PER = @M1 ) A
--	--CROSS JOIN (SELECT DISTINCT CodFamilia, Familia FROM #CONSOLIDADO0_3) B
--	LEFT JOIN (SELECT DAY(Fecha) Dia,
--	--CodFamilia, Familia,
--					  SUM(Plan_Ton) Plan_Ton, SUM(Plan_Dol) Plan_Dol , SUM(real_Dolares) real_Dolares, SUM(real_ton) real_ton
--			   FROM #CONSOLIDADO0_3
--			   GROUP BY DAY(Fecha)
--			   --, CodFamilia, Familia
--			   ) C
--			   	ON
--	--B.CodFamilia = C.CodFamilia AND
--	A.DIA =C.Dia;
	
IF OBJECT_ID(N'tempdb..#CONSOLIDADO2') IS NOT NULL  DROP TABLE #CONSOLIDADO2;

SELECT A.Dia, 
--A.CodFamilia, A.Familia,
       A.real_Dolares Subtotal, A.real_ton Subtotal_Ton
INTO #CONSOLIDADO2 
--SELECT * from #CONSOLIDADO2 order by 1 asc, 2 asc , 2 asc 
--SELECT *
FROM #CONSOLIDADO1 A

--ORDER BY 1 ASC,8 ASC
--GROUP BY A.DIA, A.CodFamilia, A.Familia 

IF OBJECT_ID(N'tempdb..#CONSOLIDADO3') IS NOT NULL  DROP TABLE #CONSOLIDADO3;

SELECT A.Dia,
--A.CodFamilia, B.CodFamilia CodFamilia2, B.Familia, 
       SUM(B.real_Dolares) Tot_Acum, SUM(B.real_ton) Tot_Acum_Ton
INTO #CONSOLIDADO3 
--SELECT *
FROM #CONSOLIDADO1 A
	 LEFT JOIN #CONSOLIDADO1 B ON A.Dia>=B.Dia 
GROUP BY A.Dia
--, A.CodFamilia, B.CodFamilia, B.Familia

--SELECT * from #CONSOLIDADO2
--SELECT * FROM #CONSOLIDADO3 where codfamilia = '1003012081'  and codfamilia2 = '1003012081' AND Agencia = 'ESMERALDAS' ORDER BY 1 ASC,3 ASC, 2 ASC 36.23656  249.32736
--ORDER BY 1 ASC,2 ASC
--SELECT * FROM #CONSOLIDADO2  where codfamilia = '5016105811' ORDER BY 1 ASC,2 ASC   396.26518


IF OBJECT_ID(N'tempdb..#CONSOLIDADO4') IS NOT NULL  DROP TABLE #CONSOLIDADO4;

SELECT A.Dia,
--A.CodFamilia,
       A.Subtotal, A.Subtotal_Ton, B.Tot_Acum, B.Tot_Acum_Ton
INTO #CONSOLIDADO4
--select *
FROM #CONSOLIDADO2 A
	 LEFT JOIN #CONSOLIDADO3 B ON A.Dia= B.Dia 
	--AND  A.CodFamilia = B.CodFamilia AND A.CodFamilia = B.CodFamilia2

--SELECT * FROM #CONSOLIDADO2 WHERE CodFamilia ='1003012081' AND Agencia = 'ESMERALDAS'
IF OBJECT_ID(N'tempdb..#PORCIONES') IS NOT NULL DROP TABLE #PORCIONES; 

SELECT A.Dia,
--A.CodFamilia, 
       A.Subtotal, A.Subtotal_Ton, B.Dia Dia2,
--B.CodFamilia CodFamilia2,
       B.Tot_Acum, B.Tot_Acum_Ton, A.Subtotal/B.Tot_Acum Porcion, A.Subtotal_Ton/B.Tot_Acum_Ton Porcion_Ton
INTO #PORCIONES
FROM #CONSOLIDADO2 A
     LEFT JOIN #CONSOLIDADO4 B ON A.Dia<=B.Dia
--ORDER BY 1 ASC
WHERE B.Dia= @workday-- asigna el dia de corte(con esto se tendra la proy por dia)
--AND A.CodFamilia = B.CodFamilia
ORDER BY 1 ASC
--, 2 ASC

--SELECT distinct codfamilia FROM #PORCIONES
--SELECT * FROM #PORCIONES_M1
--SELECT distinct codfamilia FROM #CONSOLIDADO2
--WHERE CodFamilia = '1003012081'

 
--SELECT * FROM #CONSOLIDADO1_M1 
----------------------------------------------------
--Corte para agrupar los 3 meses que mecesito apartir  del MES-1

IF OBJECT_ID(N'tempdb..#CONSOLIDADO1_M1') IS NOT NULL DROP TABLE #CONSOLIDADO1_M1; 

SELECT A.DIA Dia,
--B.CodFamilia, B.Familia,
	   C.Plan_Ton , C.Plan_Dol , C.real_Dolares, C.real_ton, AVG(C.real_Dolares) OVER() AS AVG_Dolares, AVG(C.real_ton) OVER() AS AVG_Ton
INTO #CONSOLIDADO1_M1
FROM (SELECT DIA_UTIL Dia FROM #WORKINGDAYS WHERE PER = @M2 ) A
	--CROSS JOIN (SELECT DISTINCT CodFamilia, Familia FROM #CONSOLIDADO0_2 
	--			WHERE  TRY_CONVERT(VARCHAR,YEAR(Fecha))+TRY_CONVERT(VARCHAR,MONTH(Fecha))
	--                   IN (TRY_CONVERT(VARCHAR,YEAR(@MA_1))+TRY_CONVERT(VARCHAR,MONTH(@MA_1)),
	--	                   TRY_CONVERT(VARCHAR,YEAR(@MA_2))+TRY_CONVERT(VARCHAR,MONTH(@MA_2)),
	--	                   TRY_CONVERT(VARCHAR,YEAR(@MA_3))+TRY_CONVERT(VARCHAR,MONTH(@MA_3)))) B
	 LEFT JOIN 
	 (SELECT D.DIA_UTIL Dia2,
	--CodFamilia, Familia,
			 SUM(E.Plan_Ton) Plan_Ton, SUM(E.Plan_Dol) Plan_Dol , SUM(E.real_Dolares) real_Dolares, SUM(E.real_ton) real_ton
	  FROM (SELECT * FROM #WORKINGDAYS)  D
		   JOIN  (SELECT Fecha, SUM(Plan_Ton) Plan_Ton, SUM(Plan_Dol) Plan_Dol , SUM(real_Dolares) real_Dolares, SUM(real_ton) real_ton
				  FROM  #CONSOLIDADO0_2 
			  	  WHERE  TRY_CONVERT(VARCHAR,YEAR(Fecha))+TRY_CONVERT(VARCHAR,MONTH(Fecha))
					  IN (TRY_CONVERT(VARCHAR,YEAR(@MA_1))+TRY_CONVERT(VARCHAR,MONTH(@MA_1)),
						  TRY_CONVERT(VARCHAR,YEAR(@MA_2))+TRY_CONVERT(VARCHAR,MONTH(@MA_2)),
						  TRY_CONVERT(VARCHAR,YEAR(@MA_3))+TRY_CONVERT(VARCHAR,MONTH(@MA_3)))
			      GROUP BY Fecha) E ON CONVERT(DATE,D.DIA,103) = E.Fecha
	  GROUP BY D.DIA_UTIL) 
			     --, CodFamilia, Familia
	  C	ON
	--B.CodFamilia = C.CodFamilia AND
	  A.Dia =C.Dia2;

--INSERT INTO #CONSOLIDADO1 VALUES(26,NULL, NULL, NULL, NULL,9.3270372, 4.07487564 )


UPDATE A SET A.real_Dolares = A.AVG_Dolares,
             A.real_ton = A.AVG_Ton,
			 A.Plan_Dol = 0,
			 A.Plan_Ton = 0
		FROM #CONSOLIDADO1_M1 A 
		WHERE A.real_Dolares IS NULL AND A.real_ton IS NULL AND A.Plan_Dol IS NULL AND A.Plan_Ton IS NULL;


--SELECT * FROM #CONSOLIDADO1_M1 WHERE DIA IN (29 ,30)

IF OBJECT_ID(N'tempdb..#CONSOLIDADO2_M1') IS NOT NULL  DROP TABLE #CONSOLIDADO2_M1;

SELECT A.Dia, 
--A.CodFamilia, A.Familia,
A.real_Dolares Subtotal, A.real_ton Subtotal_Ton
INTO #CONSOLIDADO2_M1 
--SELECT *
FROM #CONSOLIDADO1_M1 A
--ORDER BY 1 ASC,8 ASC
--GROUP BY A.DIA, A.CodFamilia, A.Familia


IF OBJECT_ID(N'tempdb..#CONSOLIDADO3_M1') IS NOT NULL  DROP TABLE #CONSOLIDADO3_M1;

SELECT A.Dia,
--A.CodFamilia, B.CodFamilia CodFamilia2, B.Familia, 
       SUM(B.real_Dolares) Tot_Acum, SUM(B.real_ton) Tot_Acum_Ton
INTO #CONSOLIDADO3_M1 
--SELECT *
FROM #CONSOLIDADO1_M1 A
	 LEFT JOIN #CONSOLIDADO1_M1 B ON A.Dia>=B.Dia  
--ORDER BY 1 ASC,8 ASC
GROUP BY A.Dia
--, A.CodFamilia, B.CodFamilia, B.Familia


IF OBJECT_ID(N'tempdb..#CONSOLIDADO4_M1') IS NOT NULL  DROP TABLE #CONSOLIDADO4_M1;

SELECT A.Dia, 
--A.CodFamilia,
       A.Subtotal, A.Subtotal_Ton, B.Tot_Acum, B.Tot_Acum_Ton
INTO #CONSOLIDADO4_M1
FROM #CONSOLIDADO2_M1 A
	 LEFT JOIN #CONSOLIDADO3_M1 B ON A.Dia= B.Dia 
	--AND  A.CodFamilia = B.CodFamilia AND A.CodFamilia = B.CodFamilia2


IF OBJECT_ID(N'tempdb..#PORCIONES_M1') IS NOT NULL DROP TABLE #PORCIONES_M1; 

SELECT A.Dia, 
--A.CodFamilia,
       A.Subtotal, A.Subtotal_Ton, B.Dia Dia2,
--B.CodFamilia CodFamilia2,
       B.Tot_Acum, B.Tot_Acum_Ton, A.Subtotal/B.Tot_Acum Porcion, A.Subtotal_Ton/B.Tot_Acum_Ton Porcion_Ton
INTO #PORCIONES_M1
FROM #CONSOLIDADO2_M1 A 
     LEFT JOIN #CONSOLIDADO4_M1 B ON A.Dia<=B.Dia 
WHERE B.Dia= @workday_MA-- asigna el dia de corte(con esto se tendra la proy por dia)
--AND A.CodFamilia = B.CodFamilia
ORDER BY 1 ASC
--, 2 ASC

--SELECT * FROM #PORCIONES_M1
--SELECT * FROM #PORCIONES

--Cargo la información del Sell In
SET LANGUAGE SPANISH;

TRUNCATE TABLE VENTAS_PYDACO;

ALTER TABLE VENTAS_PYDACO ALTER COLUMN Fecha VARCHAR(100);

BULK INSERT VENTAS_PYDACO
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\VentasPydaco.csv'
WITH (FIELDTERMINATOR = ';' , FIRSTROW= 2, CODEPAGE = 'ACP')

UPDATE A SET Fecha = REPLACE(Fecha, '.', '/') FROM VENTAS_PYDACO A;

ALTER TABLE VENTAS_PYDACO ALTER COLUMN Fecha DATE NOT NULL;

SET LANGUAGE US_ENGLISH;

UPDATE VENTAS_PYDACO SET Fecha = CASE WHEN Fecha > @dia THEN @dia ELSE Fecha END;
UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM VENTAS_PYDACO A; 
UPDATE A SET Agencia = TRIM(Agencia) FROM VENTAS_PYDACO A;
UPDATE A SET NombreDistribuidor = TRIM(NombreDistribuidor) FROM VENTAS_PYDACO A;
DELETE FROM VENTAS_PYDACO WHERE Agencia = '1000027901'
--preguntar hasta cuando hare este update


UPDATE VENTAS_PYDACO
SET CodMarca = RIGHT(CodMarca,1)
WHERE CodMarca LIKE '00%';

UPDATE VENTAS_PYDACO
SET CodMarca = RIGHT(CodMarca,2)
WHERE CodMarca LIKE '0%';
-- Debido a que cuando subo la información del csv se agrega un cero a la izquierda


UPDATE VENTAS_PYDACO
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128'
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;


--Creo tabla temporal para darle los campos y el formato a la información que viene del Sell In
IF OBJECT_ID(N'tempdb..#PYDACO_SELL_IN') IS NOT NULL DROP TABLE #PYDACO_SELL_IN;

SELECT A.DIA, B.Agencia, B.CodCategoria, B.Categoria, B.CodMarca, B.Marca, B.CodFamilia, B.Familia,
	   ISNULL(C.Plan_Ton, 0) Plan_Ton, ISNULL(C.real_ton, 0) real_ton, ISNULL(C.Plan_Dol, 0) Plan_Dol, ISNULL(C.real_Dolares, 0) real_Dolares,
	   B.Plataforma
INTO #PYDACO_SELL_IN
FROM (SELECT CONVERT(DATE,DIA,103) DIA FROM [BD_FECHAS] WHERE PER = @M1 AND TRY_CONVERT(DATE, DIA, 103) < = @dia) A
	 CROSS JOIN (SELECT DISTINCT Agencia, CodCategoria, Categoria, CodMarca, Marca, CodFamilia, Familia, Plataforma FROM VENTAS_PYDACO WHERE MONTH(Fecha) = MONTH (@dia)) B
	 LEFT JOIN (SELECT Fecha, Agencia, CodCategoria, Categoria, CodMarca, Marca, CodFamilia, Familia, Plataforma,
			    ISNULL(SUM(Plan_Ton),0) Plan_Ton, ISNULL(SUM(real_ton), 0) real_ton, ISNULL(SUM(Plan_Dol), 0) Plan_Dol, ISNULL(SUM(real_Dolares), 0) real_Dolares
			    FROM VENTAS_PYDACO  WHERE MONTH(Fecha) = MONTH (@dia) GROUP BY Fecha, Agencia, CodCategoria, Categoria, CodMarca, Marca, CodFamilia, Familia, Plataforma) C
	ON B.CodFamilia = C.CodFamilia AND A.DIA = C.Fecha AND B.Agencia = C.Agencia
ORDER BY A.DIA , B.CodFamilia, B.Agencia;
--SELECT  * FROM #PYDACO_SELL_IN

IF OBJECT_ID(N'tempdb..#PYDACO_SELL_IN_1') IS NOT NULL DROP TABLE #PYDACO_SELL_IN_1; 

SELECT CONVERT(VARCHAR(20), A.DIA, 103) Dia, ISNULL(C.DIA_UTIL, 0) Workdays, A.Agencia, A.CodCategoria, A.Categoria, A.CodMarca, A.Marca, A.CodFamilia, A.Familia,
	   A.Plan_Ton, A.Plan_Dol, A.real_ton, A.real_Dolares ,  A.Plataforma, A.Total_Ton, A.Total_Dolares, ISNULL(B.Porcion_Ton, 0) Porcion_Ton
INTO #PYDACO_SELL_IN_1 
--select *
FROM (SELECT DIA, Agencia, CodCategoria, Categoria, CodMarca, Marca, CodFamilia, Familia,
	         Plan_Ton, Plan_Dol, real_ton, real_Dolares ,  Plataforma ,SUM(real_ton) OVER (PARTITION BY CodFamilia, Agencia ) AS Total_Ton , SUM(real_Dolares) OVER (PARTITION BY CodFamilia, Agencia  ) AS Total_Dolares
	  FROM #PYDACO_SELL_IN) A
	LEFT JOIN	#WORKINGDAYS C ON A.DIA = CONVERT(DATE, C.DIA, 103)
	LEFT JOIN 	#PORCIONES B ON C.DIA_UTIL = B.DIA 
	--AND A.CodFamilia = B.CodFamilia
	
--SELECT  * FROM #PYDACO_SELL_IN_1 where Porcion_Ton is null


IF OBJECT_ID(N'tempdb..#PYDACO_DUMMY_1') IS NOT NULL DROP TABLE #PYDACO_DUMMY_1;

SELECT B.Fecha, A.Agencia, C.CodCategoria, C.Categoria, C.CodMarca, C.Marca, C.CodFamilia, C.Familia, C.Plataforma
INTO #PYDACO_DUMMY_1
FROM (SELECT DISTINCT Agencia FROM #PYDACO_SELL_IN_1) A
     CROSS JOIN #FECHA B
     CROSS JOIN (SELECT DISTINCT CodCategoria, Categoria, CodMarca, Marca, CodFamilia, Familia, Plataforma FROM #PYDACO_SELL_IN_1) C


INSERT INTO #PYDACO_SELL_IN_1
SELECT CONVERT(VARCHAR(20), A.Fecha, 103) Dia, @workday Workdays, A.Agencia, A.CodCategoria, A.Categoria, A.CodMarca, A.Marca, A.CodFamilia, A.Familia,
	   0 Plan_Ton, 0 Plan_Dol, 0 real_ton, 0 real_Dolares , A.Plataforma, 0 Total_Ton, 0 Total_Dolares, 0 Porcion_Ton
FROM #PYDACO_DUMMY_1 A


----Mes anterior
IF OBJECT_ID(N'tempdb..#PYDACO_SELL_IN_MA') IS NOT NULL DROP TABLE #PYDACO_SELL_IN_MA;

SELECT A.DIA, B.Agencia, B.CodCategoria, B.Categoria, B.CodMarca, B.Marca, B.CodFamilia, B.Familia,
	   ISNULL(C.Plan_Ton, 0) Plan_Ton, ISNULL(C.real_ton, 0) real_ton, ISNULL(C.Plan_Dol, 0) Plan_Dol, ISNULL(C.real_Dolares, 0) real_Dolares,
	   B.Plataforma
INTO #PYDACO_SELL_IN_MA
FROM (SELECT CONVERT(DATE,DIA,103) DIA FROM [BD_FECHAS] WHERE PER = @M2) A
     CROSS JOIN (SELECT DISTINCT Agencia, CodCategoria, Categoria, CodMarca, Marca, CodFamilia, Familia, Plataforma FROM VENTAS_PYDACO WHERE MONTH(Fecha) = MONTH(DATEADD(MONTH, -1, @dia))) B
     LEFT JOIN (SELECT Fecha, Agencia, CodCategoria, Categoria, CodMarca, Marca, CodFamilia, Familia, Plataforma,
				ISNULL(SUM(Plan_Ton),0) Plan_Ton, ISNULL(SUM(real_ton), 0) real_ton, ISNULL(SUM(Plan_Dol), 0) Plan_Dol, ISNULL(SUM(real_Dolares), 0) real_Dolares
			    FROM VENTAS_PYDACO  WHERE MONTH(Fecha) = MONTH(DATEADD(MONTH, -1, @dia)) GROUP BY Fecha, Agencia, CodCategoria, Categoria, CodMarca, Marca, CodFamilia, Familia, Plataforma) C
	 ON B.CodFamilia = C.CodFamilia AND A.DIA = C.Fecha AND B.Agencia = C.Agencia
ORDER BY A.DIA , B.CodFamilia, B.Agencia;

--SELECT  * FROM  #PYDACO_SELL_IN_1

IF OBJECT_ID(N'tempdb..#PYDACO_SELL_IN_1_MA') IS NOT NULL DROP TABLE #PYDACO_SELL_IN_1_MA; 

SELECT CONVERT(VARCHAR(20), A.DIA, 103) Dia, ISNULL(C.DIA_UTIL, 0) Workdays, A.Agencia, A.CodCategoria, A.Categoria, A.CodMarca, A.Marca, A.CodFamilia, A.Familia,
	   A.Plan_Ton, A.Plan_Dol, A.real_ton, A.real_Dolares ,  A.Plataforma, A.Total_Ton, A.Total_Dolares, ISNULL(B.Porcion_Ton, 0) Porcion_Ton
INTO #PYDACO_SELL_IN_1_MA
FROM (SELECT DIA, Agencia, CodCategoria, Categoria, CodMarca, Marca, CodFamilia, Familia,
	  Plan_Ton, Plan_Dol, real_ton, real_Dolares ,  Plataforma ,SUM(real_ton) OVER (PARTITION BY CodFamilia, Agencia ) AS Total_Ton , SUM(real_Dolares) OVER (PARTITION BY CodFamilia, Agencia  ) AS Total_Dolares
	  FROM #PYDACO_SELL_IN_MA) A
	 LEFT JOIN #WORKINGDAYS C ON A.DIA = CONVERT(DATE, C.DIA, 103)
	 LEFT JOIN #PORCIONES_M1 B ON C.DIA_UTIL = B.DIA 
	--AND A.CodFamilia = B.CodFamilia

--select * from #PYDACO_SELL_IN_1_MA	
--SELECT * FROM #PYDACO_SELL_IN_1


IF OBJECT_ID(N'tempdb..#PYDACO_DUMMY_2') IS NOT NULL DROP TABLE #PYDACO_DUMMY_2;

SELECT B.Fecha, A.Agencia, C.CodCategoria, C.Categoria, C.CodMarca, C.Marca, C.CodFamilia, C.Familia, C.Plataforma
INTO #PYDACO_DUMMY_2
FROM (SELECT DISTINCT Agencia FROM #PYDACO_SELL_IN_1_MA) A CROSS JOIN #FECHA B
     CROSS JOIN (SELECT DISTINCT CodCategoria, Categoria, CodMarca, Marca, CodFamilia, Familia, Plataforma FROM #PYDACO_SELL_IN_1_MA) C


INSERT INTO #PYDACO_SELL_IN_1_MA
SELECT CONVERT(VARCHAR(20), A.Fecha, 103) Dia, @workday_MA Workdays, A.Agencia, A.CodCategoria, A.Categoria, A.CodMarca, A.Marca, A.CodFamilia, A.Familia,
	   0 Plan_Ton, 0 Plan_Dol, 0 real_ton, 0 real_Dolares , A.Plataforma, 0 Total_Ton, 0 Total_Dolares, 0 Porcion_Ton
FROM #PYDACO_DUMMY_2 A


ALTER TABLE VENTAS_PYDACO ALTER COLUMN Fecha VARCHAR (100) NOT NULL;

ALTER TABLE #PYDACO_SELL_IN_1 ALTER COLUMN DIA VARCHAR (100) NOT NULL;
ALTER TABLE #PYDACO_SELL_IN_1_MA ALTER COLUMN DIA VARCHAR (100) NOT NULL;


UPDATE #PYDACO_SELL_IN_1 
SET DIA = RIGHT(DIA,9)
WHERE DIA LIKE '0_/%'

UPDATE #PYDACO_SELL_IN_1_MA 
SET DIA = RIGHT(DIA,9)
WHERE DIA LIKE '0_/%'

-- Para el proyecto de tablero
-----------------------------------------------------------------
-----Inserto la data  que se paso de las tabla ventas sellout  a la tabla temporal a esta tabla de ventas tablero
IF OBJECT_ID('VENTAS_TABLERO') IS NOT NULL DROP TABLE VENTAS_TABLERO;


SELECT F.DES_MES Mes, A.Fecha Dia,
	   M.CodCategoria CodCategoria, M.Categoria Categoria, M.CodFamilia CodFamilia, M.Familia Familia, A.CodAlicorp CodAlicorp, M.Material Material, M.CodMarca CodMarca, M.Marca Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   A.Vendedor_Distribuidora, A.Tipo_tienda_Distribuidora, A.CodClienteSellOut, A.ClienteSellOut,
	   'Consumo Masivo' Negocio, M.FacUnitario, SUM(ISNULL(A.TUnidades,0)) TUnidades, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL((A.TUnidades*M.PesoTon),0)) real_ton, SUM(ISNULL(A.Plan_Dol,0)) Plan_Dol, SUM(ISNULL(A.real_Dolares/1000,0)) real_Dolares,
	  M.Plataforma Plataforma
INTO VENTAS_TABLERO
FROM #PYDACO A
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.Agencia = AG.Agencia
GROUP BY F.DES_MES, A.Fecha,
	     M.CodCategoria, M.Categoria, M.CodFamilia, M.Familia, A.CodAlicorp, M.Material, M.CodMarca, M.Marca,
	     AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	     AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	     A.Vendedor_Distribuidora, A.Tipo_tienda_Distribuidora, A.CodClienteSellOut, A.ClienteSellOut,
	     M.FacUnitario, M.Plataforma;

----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

IF OBJECT_ID('VENTAS_CONSOLIDADO') IS NOT NULL DROP TABLE VENTAS_CONSOLIDADO;
--Creo tabla donde consolido la información de la tabla tablero
--En esta tabla se va a insertar la información de todas las distribuidoras
SELECT A.Mes, A.Dia,
	   A.CodCategoria, A.Categoria, A.CodFamilia, A.Familia, A.CodMarca, A.Marca, A.CodClienteSellOut, A.ClienteSellOut,
	   A.ZonaV2, A.CodOficina, A.NomOficina, A.CodTerritorio, A.NomTerritorio, A.CodZona, A.NomZona,
	   A.Oficina_Ventas, A.Grupo_Vendedores, A.Territorio, A.Agrupacion_Distribuidora, A.Agencia_Distribuidora, A.Zona_Clientes, A.Grupo_Condiciones,
	   A.Negocio, SUM(A.Plan_Ton) Plan_Ton,
	  SUM(A.real_ton) real_ton, SUM(A.Plan_Dol) Plan_Dol, SUM(A.real_Dolares) real_Dolares,
	  A.Plataforma Plataforma
INTO VENTAS_CONSOLIDADO
FROM VENTAS_TABLERO A
GROUP BY A.MES, A.Dia,
	   A.CodCategoria, A.Categoria, A.CodFamilia, A.Familia, A.CodMarca, A.Marca, A.CodClienteSellOut, A.ClienteSellOut,
	   A.ZonaV2, A.CodOficina, A.NomOficina, A.CodTerritorio, A.NomTerritorio, A.CodZona, A.NomZona,
	   A.Oficina_Ventas, A.Grupo_Vendedores, A.Territorio, A.Agrupacion_Distribuidora, A.Agencia_Distribuidora, A.Zona_Clientes, A.Grupo_Condiciones,
	   A.Negocio,
	   A.Plataforma;

------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

---INSERTO PYDACO SELL IN------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

INSERT INTO VENTAS_CONSOLIDADO
SELECT F.DES_MES Mes, A.Dia,
	   A.CodCategoria, A.Categoria, A.CodFamilia, A.Familia, A.CodMarca, A.Marca, 'Sell IN PYCO' CodClienteSellOut, 'Sell IN PYCO' ClienteSellOut,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   'Consumo Masivo' Negocio, A.Plan_Ton,
	  --CASE WHEN A.Porcion_Ton IS NOT NULL THEN 
	  A.Total_Ton * A.Porcion_Ton
	  --ELSE 0 END 
	  real_ton,
	  A.Plan_Dol,
	  --CASE WHEN A.Porcion_Ton IS NOT NULL THEN 
	  A.Total_Dolares * A.Porcion_Ton
	  --ELSE 0 END 
	  real_Dolares,
--usamos solo la proporcion de toneladas
	  A.Plataforma Plataforma
--SELECT *
FROM #PYDACO_SELL_IN_1 A
     LEFT JOIN BD_FECHAS F ON  A.DIA= F.DIA
     LEFT JOIN MAESTRO_AGENCIAS AG ON A.Agencia = AG.Agencia


--Inserto Pydaco mes anterior

INSERT INTO VENTAS_CONSOLIDADO
SELECT F.DES_MES Mes, A.Dia,
	   A.CodCategoria, A.Categoria, A.CodFamilia, A.Familia, A.CodMarca, A.Marca, 'Sell IN PYCO' CodClienteSellOut, 'Sell IN PYCO' ClienteSellOut,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   'Consumo Masivo' Negocio, A.Plan_Ton,
	  --CASE WHEN A.Porcion_Ton IS NOT NULL THEN 
	  A.Total_Ton * A.Porcion_Ton
	  --ELSE 0 END 
	  real_ton,
	  A.Plan_Dol,
	  --CASE WHEN A.Porcion_Ton IS NOT NULL THEN 
	  A.Total_Dolares * A.Porcion_Ton
	  --ELSE 0 END 
	  real_Dolares,
--usamos solo la proporcion de toneladas
	  A.Plataforma Plataforma
--SELECT *
FROM #PYDACO_SELL_IN_1_MA A
	 LEFT JOIN BD_FECHAS F ON  A.DIA= F.DIA	
	 LEFT JOIN MAESTRO_AGENCIAS AG ON A.Agencia = AG.Agencia


------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

IF OBJECT_ID('DBO.TMP_SELL_OUT_21') IS NOT NULL DROP TABLE DBO.TMP_SELL_OUT_21;
--Creo tabla final donde se van a elaborar todos los indicadores
SELECT *
INTO TMP_SELL_OUT_21
FROM (SELECT A.Mes "MES", 'Sem' "Semana", A.DIA DIA, B.DIA_2 dia_2,
      CONCAT(A.CodCategoria,' ', A.Categoria) "Categoria",
      A.Negocio Negocio,
      CONCAT(A.CodFamilia,' ',A.Familia) Familia, CONCAT(A.CodMarca,' ',A.Marca) Marca,
      A.Oficina_Ventas, A.Grupo_Vendedores, A.Territorio, A.Agrupacion_Distribuidora, A.Agencia_Distribuidora, A.Zona_Clientes, A.Grupo_Condiciones,
      A.Plan_Ton plan_ton, A.real_ton real_ton, A.Plan_Dol plan_dol, A.real_Dolares real_dol,
      A.real_ton/@dm1 * @DMAX	 PROY_LIN_TON, A.real_Dolares/@dm1 * @DMAX	PROY_LIN_DOL, 0 PROY_TON, 0 PROY_DOL,
      B.ANIO ANIO, B.SEM SEM, B.MES MES2,
      CASE WHEN B.PER=@M1 AND TRY_CONVERT(DATE, A.Dia, 103) <=TRY_CONVERT(DATE,@d1,103) THEN  A.real_ton/@dm1 
           WHEN B.PER=@M2  AND TRY_CONVERT(date, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN  A.real_ton/@dm2 
           WHEN B.PER=@M3  AND TRY_CONVERT(date, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  A.real_ton/@dm3 END  PROM_AV,
-- PROMEDIO AL AVANCE TONELADAS
	  CASE WHEN B.PER=@M1 AND B.SEM LIKE '%1 AL 7%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103) THEN  IIF(@ds1=0,null,A.real_ton/@ds1 )
		   WHEN B.PER=@M1 AND B.SEM LIKE '%8 AL 14%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103) THEN  IIF(@ds2=0,null,A.real_ton/@ds2 )
		   WHEN B.PER=@M1 AND B.SEM LIKE '%15 AL 21%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103) THEN  IIF(@ds3=0,null,A.real_ton/@ds3 )
		   WHEN B.PER=@M1 AND B.SEM LIKE '%22 AL 31%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103) THEN  IIF(@ds4=0,null,A.real_ton/@ds4 )
		   WHEN B.PER=@M2 AND B.SEM LIKE '%1 AL 7%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN IIF(@ds5=0,null,A.real_ton/@ds5)
		   WHEN B.PER=@M2 AND B.SEM LIKE '%8 AL 14%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN  IIF(@ds6=0,null,A.real_ton/@ds6 )
		   WHEN B.PER=@M2 AND B.SEM LIKE '%15 AL 21%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN IIF(@ds7=0,null,A.real_ton/@ds7 )
		   WHEN B.PER=@M2 AND B.SEM LIKE '%22 AL 31%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN  IIF(@ds8=0,null,A.real_ton/@ds8 )
		   WHEN B.PER=@M3 AND B.SEM LIKE '%1 AL 7%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  IIF(@ds9=0,null,A.real_ton/@ds9)
		   WHEN B.PER=@M3 AND B.SEM LIKE '%8 AL 14%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  IIF(@ds10=0,null,A.real_ton/@ds10 )
		   WHEN B.PER=@M3 AND B.SEM LIKE '%15 AL 21%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  IIF(@ds11=0,null,A.real_ton/@ds11 )
		   WHEN B.PER=@M3 AND B.SEM LIKE '%22 AL 31%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  IIF(@ds12=0,null,A.real_ton/@ds12 ) END  PROM_SEM,
-- PROMEDIO SEMANAL TONELADAS
	  CASE WHEN  @DMAX=@dm1 THEN A.Plan_Ton - A.real_ton ELSE (A.Plan_Ton - A.real_ton)/(@DMAX-@dm1) END OBJ_DIA,
-- OBJETIVO DIARIO TONELADAS
	  CASE WHEN  @DMAX=@dm1 THEN (A.Plan_Ton - A.real_ton) - A.real_ton/@dm1 ELSE (A.Plan_Ton - A.real_ton)/(@DMAX-@dm1) - A.real_ton/@dm1 END INCREMENTO_TON,
--INCREMENTO_TON
	  CASE WHEN B.PER=@M1  AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103)  THEN  A.real_Dolares/@dm1 
		   WHEN B.PER=@M2  AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103)  THEN  A.real_Dolares/@dm2 
		   WHEN B.PER=@M3  AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103)  THEN  A.real_Dolares/@dm3 END  PROM_AV_DOL,
-- PROMEDIO AL AVANCE DOLARES
	  CASE WHEN B.PER=@M1 AND B.SEM LIKE '%1 AL 7%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103) THEN IIF(@ds1=0,null,A.real_Dolares/@ds1)
		   WHEN B.PER=@M1 AND B.SEM LIKE '%8 AL 14%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103)THEN  IIF(@ds2=0,null,A.real_Dolares/@ds2)
		   WHEN B.PER=@M1 AND B.SEM LIKE '%15 AL 21%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103) THEN  IIF(@ds3=0,null,A.real_Dolares/@ds3)
		   WHEN B.PER=@M1 AND B.SEM LIKE '%22 AL 31%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103) THEN  IIF(@ds4=0,null,A.real_Dolares/@ds4)
		   WHEN B.PER=@M2 AND B.SEM LIKE '%1 AL 7%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN  IIF(@ds5=0,null,A.real_Dolares/@ds5)
		   WHEN B.PER=@M2 AND B.SEM LIKE '%8 AL 14%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN  IIF(@ds6=0,null,A.real_Dolares/@ds6)
		   WHEN B.PER=@M2 AND B.SEM LIKE '%15 AL 21%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN  IIF(@ds7=0,null,A.real_Dolares/@ds7)
		   WHEN B.PER=@M2 AND B.SEM LIKE '%22 AL 31%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN  IIF(@ds8=0,null,A.real_Dolares/@ds8)
		   WHEN B.PER=@M3 AND B.SEM LIKE '%1 AL 7%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  IIF(@ds9=0,null,A.real_Dolares/@ds9)
		   WHEN B.PER=@M3 AND B.SEM LIKE '%8 AL 14%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  IIF(@ds10=0,null,A.real_Dolares/@ds10)
		   WHEN B.PER=@M3 AND B.SEM LIKE '%15 AL 21%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  IIF(@ds11=0,null,A.real_Dolares/@ds11)
		   WHEN B.PER=@M3 AND B.SEM LIKE '%22 AL 31%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  IIF(@ds12=0,null,A.real_Dolares/@ds12) END  PROM_SEM_DOL,
-- PROMEDIO SEMANAL DOLARES
	  CASE WHEN  @DMAX=@dm1 THEN A.Plan_Dol - A.real_Dolares ELSE (A.Plan_Dol - A.real_Dolares)/(@DMAX-@dm1) END OBJ_DIA_DOL,
--- OBJETIVO DIARIO DOLARES
	  CASE WHEN  @DMAX=@dm1 THEN (A.Plan_Dol - A.real_Dolares) - A.real_Dolares/@dm1 ELSE (A.Plan_Dol- A.real_Dolares)/(@DMAX-@dm1) - A.real_Dolares/@dm1 END INCREMENTO_DOL,
--INCREMENTO_DOLARES
	  CASE WHEN B.PER = @M1 THEN A.real_ton/@dm1 
		   WHEN B.PER = @M2 THEN A.real_ton/@DMAX2 
		   WHEN B.PER = @M3 THEN A.real_ton/@DMAX3 END prom_mes,
--VENTA PROMEDIO MENSUAL TONELADAS
	  CASE WHEN B.PER = @M1 THEN A.real_Dolares/@dm1 
		   WHEN B.PER = @M2 THEN A.real_Dolares/@DMAX2 
		   WHEN B.PER = @M3 THEN A.real_Dolares/@DMAX3 END prom_mes_dol,
--VENTA PROMEDIO MENSUAL DOLARES
	  A.Plataforma as Plataforma
FROM VENTAS_CONSOLIDADO  A 
	 LEFT JOIN BD_FECHAS  B ON A.DIA = B.DIA) A 
WHERE A.ANIO IS NOT NULL ;