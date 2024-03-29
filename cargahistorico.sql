USE CmiSellOutEcuador;

SET LANGUAGE US_ENGLISH;

DECLARE @dia DATE;
DECLARE @workday INT;
--Dia h�bil de la fecha
DECLARE @workday_MA INT;
--Dia h�bil que hay en el mes anterior
DECLARE @d1 AS VARCHAR(20);

SELECT @dia= DATEADD(DAY,-1,SYSDATETIME());
-- poner el �ltimo d�a de ventas
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

--Creo tabla que contiene solo fechas con d�as h�biles
IF OBJECT_ID(N'tempdb..#WORKINGDAYS') IS NOT NULL DROP TABLE #WORKINGDAYS;

SELECT *
INTO #WORKINGDAYS
FROM BD_FECHAS

DELETE FROM #WORKINGDAYS WHERE DIA_SEM = '7';
DELETE FROM #WORKINGDAYS WHERE FESTIVO = '1';




----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
--Panales

--Esta es la base de ventas de Panales

--Coloco el periodo actual
DELETE FROM BASE_PANALES_HISTORICA WHERE LEFT(Fecha,7) = '2022-09';

BULK INSERT BASE_PANALES_HISTORICA
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\userConcretions3.txt'
WITH (FIELDTERMINATOR='|',FIRSTROW=2,CODEPAGE='ACP');

--Colocar los meses que deseamos comparar con el mes actual
TRUNCATE TABLE BASE_MOBILVENDOR_AUTOMATICA;

INSERT INTO BASE_MOBILVENDOR_AUTOMATICA
SELECT *
FROM BASE_PANALES_HISTORICA
--WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 09;

--INSERT INTO BASE_MOBILVENDOR_AUTOMATICA
--SELECT *
--FROM BASE_PANALES_HISTORICA
--WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 08;


------------------USAR CUANDO LLEGUE EL 2023------------------------------------------------------
--INSERT INTO BASE_MOBILVENDOR_AUTOMATICA
--SELECT *
--FROM BASE_PANALES_HISTORICA
--WHERE DATEPART(YEAR,Fecha) = PONER A�OPASADO AND DATEPART(MONTH,Fecha) = PONER MES DE A�O PASADO;
-----------------------------------------------------------------------------------------------------------

DELETE FROM [BASE_MOBILVENDOR_AUTOMATICA] WHERE Importe = 0;
DELETE FROM [BASE_MOBILVENDOR_AUTOMATICA] WHERE Importe IS NULL;


UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = [Codigo Articulo] WHERE CodAlicorp IS NULL;
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = [Codigo Articulo] WHERE CodAlicorp = 'null';
UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM BASE_MOBILVENDOR_AUTOMATICA A;
UPDATE A SET Agencia = TRIM(Agencia) FROM BASE_MOBILVENDOR_AUTOMATICA A;
UPDATE A SET Usuario = TRIM(Usuario) FROM BASE_MOBILVENDOR_AUTOMATICA A;
UPDATE A SET TipoNegocio = TRIM(TipoNegocio) FROM BASE_MOBILVENDOR_AUTOMATICA A;
UPDATE A SET [Codigo Cliente] = TRIM([Codigo Cliente]) FROM BASE_MOBILVENDOR_AUTOMATICA A;
UPDATE A SET [Nombre Cliente] = TRIM([Nombre Cliente]) FROM BASE_MOBILVENDOR_AUTOMATICA A;

DELETE FROM BASE_MOBILVENDOR_AUTOMATICA WHERE Agencia IS NULL; 
--PREGUNTAR HASTA CUANDO ES ESTE UPDATE

UPDATE BASE_MOBILVENDOR_AUTOMATICA
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128' 
	WHEN 'P.3300147' THEN '3300147'
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;
-- 293369 este error solo sale en la data de ventas de Panales

UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '29113' WHERE CodAlicorp = 'AD0237';
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '29135' WHERE CodAlicorp = 'AD0239';
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8410094' WHERE CodAlicorp = 'AD0236';
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8410093' WHERE CodAlicorp = 'AD0235';
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '29121' WHERE CodAlicorp = 'AD0238';
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '3300176' WHERE CodAlicorp = 'AD0245';
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '4302037' WHERE CodAlicorp = 'AD0240';
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8325017' WHERE CodAlicorp = 'AD0222';
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8325021' WHERE CodAlicorp = 'AD0223';
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '3300063' WHERE CodAlicorp = 'AD0244';
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8305209' WHERE CodAlicorp = '83052090';
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '4302045' WHERE CodAlicorp = '4302045-1';

UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '4302045' WHERE CodAlicorp = '4302045-1';

----cambios aplicar hasa nuevo aviso desde agosto en adelante

UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '3300222' WHERE CodAlicorp = '0861' AND Agencia = '1000027692';
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '3305229' WHERE CodAlicorp = '2560' AND Agencia = '1000027692';
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '3300222' WHERE CodAlicorp = '0044' AND Agencia = '1000027692';
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '3300222' WHERE CodAlicorp = '0045' AND Agencia = '1000027692';
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8320003' WHERE CodAlicorp = '0885' AND Agencia = '1000027692';	
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '4302044' WHERE CodAlicorp = '0064' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8320032' WHERE CodAlicorp = '0992' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8320031' WHERE CodAlicorp = '0991' AND Agencia = '1000027692';			
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '4504072' WHERE CodAlicorp = '1967' AND Agencia = '1000027692';	
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '4504048' WHERE CodAlicorp = '0076' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '4504047' WHERE CodAlicorp = '0077' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '4527198' WHERE CodAlicorp = '1966' AND Agencia = '1000027692';			
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '9051019' WHERE CodAlicorp = '0876' AND Agencia = '1000027692';	
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8317130' WHERE CodAlicorp = '0771' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '9051020' WHERE CodAlicorp = '0878' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '9051021' WHERE CodAlicorp = '0877' AND Agencia = '1000027692';			
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8315000' WHERE CodAlicorp = '2377' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8317131' WHERE CodAlicorp = '0768' AND Agencia = '1000027692';			
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8305218' WHERE CodAlicorp = '0763' AND Agencia = '1000027692';	
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8305215' WHERE CodAlicorp = '0829' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8317133' WHERE CodAlicorp = '0769' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8317145' WHERE CodAlicorp = '2050' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8305211' WHERE CodAlicorp = '0875' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8303007' WHERE CodAlicorp = '0737' AND Agencia = '1000027692';			
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8317144' WHERE CodAlicorp = '2051' AND Agencia = '1000027692';	
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8305222' WHERE CodAlicorp = '1904' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8305223' WHERE CodAlicorp = '1905' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8305224' WHERE CodAlicorp = '1906' AND Agencia = '1000027692';	
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8315031' WHERE CodAlicorp = '1050' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8309126' WHERE CodAlicorp = '1052' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8315044' WHERE CodAlicorp = '1003' AND Agencia = '1000027692';			
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '4335030' WHERE CodAlicorp = '2637' AND Agencia = '1000027692';	
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '4335041' WHERE CodAlicorp = '2570' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '4335038' WHERE CodAlicorp = '2562' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '4335039' WHERE CodAlicorp = '2569' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '4335025' WHERE CodAlicorp = '2565' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '4335022' WHERE CodAlicorp = '2564' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8325013' WHERE CodAlicorp = '1903' AND Agencia = '1000027692';		

UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8309128' WHERE CodAlicorp = 'ALH36' AND Agencia = '1000027653';	
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8410174' WHERE CodAlicorp = 'ALH01' AND Agencia = '1000027653';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8410115' WHERE CodAlicorp = 'ALH043' AND Agencia = '1000027653';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '4302053' WHERE CodAlicorp = 'AL03' AND Agencia = '1000027653';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '29337' WHERE CodAlicorp = 'AL19' AND Agencia = '1000027653';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8325017' WHERE CodAlicorp = 'ALH10' AND Agencia = '1000027653';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = '8305220' WHERE CodAlicorp = 'ALH272' AND Agencia = '1000027653';		
--	------------------------------------------------------aplicar hasa nuevo aviso------------------------


DELETE FROM BASE_MOBILVENDOR_AUTOMATICA WHERE Agencia IN ('1000026571' )
--preguntar hasta cuando se elimina coparesa

--ati campa�a
--DELETE FROM BASE_MOBILVENDOR_AUTOMATICA WHERE Agencia  NOT IN ('156150253', '156163360', '156131204', '156150076', '156148774', '156117292')
--('156150253', '156163360', '156131204', '156150076')
--PREGUNTAR A DIEGO HASTA CUANDO SERA HARA



--Inserto Codify

SET LANGUAGE SPANISH;

DELETE FROM CODIFY_HISTORICA WHERE LEFT(Fecha,7) = '2022-09';

BULK INSERT CODIFY_HISTORICA
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\CODIFY.csv'
WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

DELETE FROM CODIFY_HISTORICA WHERE CodAlicorp IS NULL;

TRUNCATE TABLE CODIFY;

ALTER TABLE CODIFY ALTER COLUMN VentaDolares VARCHAR(100);
ALTER TABLE CODIFY ALTER COLUMN VentaTon VARCHAR(100);


INSERT INTO CODIFY
SELECT *
FROM CODIFY_HISTORICA
--WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 09;

--INSERT INTO CODIFY
--SELECT *
--FROM CODIFY_HISTORICA
--WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 08;



------------------USAR CUANDO LLEGUE EL 2023------------------------------------------------------
--INSERT INTO CODIFY
--SELECT *
--FROM CODIFY_HISTORICA
--WHERE DATEPART(YEAR,Fecha) = PONER A�OPASADO AND DATEPART(MONTH,Fecha) = PONER MES DE A�O PASADO; 
-----------------------------------------------------------------------------------------------------------


UPDATE CODIFY
SET VentaDolares = REPLACE(VentaDolares,',','')
WHERE CHARINDEX(',', VentaDolares) > 0;

UPDATE CODIFY
SET VentaTon = REPLACE(VentaTon,',','')
WHERE CHARINDEX(',', VentaTon) > 0;

UPDATE CODIFY
SET VentaDolares = REPLACE(VentaDolares,'$','')
WHERE CHARINDEX('$', VentaDolares) > 0;


ALTER TABLE CODIFY ALTER COLUMN VentaDolares FLOAT;
ALTER TABLE CODIFY ALTER COLUMN VentaTon FLOAT;


SET LANGUAGE US_ENGLISH;

DELETE CODIFY WHERE CodAlicorp IS NULL;
DELETE CODIFY WHERE CodAlicorp = '';
DELETE FROM CODIFY WHERE VentaDolares = 0;
DELETE FROM CODIFY WHERE VentaDolares IS NULL;

UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM CODIFY A;
UPDATE A SET CodClienteSellOut = TRIM(CodClienteSellOut) FROM CODIFY A;
UPDATE A SET Agencia = TRIM(Agencia) FROM CODIFY A;

UPDATE CODIFY
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128'
	WHEN 'P.3300147' THEN '3300147'
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;

--Creo tabla temporal para homologar los campos y darle formato a la fecha, tambien calculo las toneladas
IF OBJECT_ID(N'tempdb..#PANALES') IS NOT NULL DROP TABLE #PANALES;

SELECT CONVERT(VARCHAR(20), A.Fecha,103) Fecha, A.Agencia Agencia, [Codigo Cliente] CodClienteSellOut, [Nombre Cliente] ClienteSellOut, A.Usuario, V.Nombre Vendedor_Distribuidora, A.TipoNegocio Tipo_tienda_Distribuidora, A.CodAlicorp CodAlicorp,
	   M.FacUnitario FacUnitario, A.Cantidad TUnidades, 0  Plan_Ton, (M.PesoTon)*(A.Cantidad) VentaTon, 0 Plan_Dol, A.Importe VentaDolares,
	   'Consumo Masivo' Negocio
INTO #PANALES
FROM BASE_MOBILVENDOR_AUTOMATICA A
	LEFT JOIN VENDEDORES_PANALES V ON A.Usuario = V.Codigo
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp;

INSERT INTO #PANALES
SELECT CONVERT(VARCHAR(20), A.Fecha,103) Fecha, A.Agencia Agencia, A.CodClienteSellOut CodClienteSellOut, 'SIN ASIGNAR - CODIFY' ClienteSellOut, 'SIN DATOS' Usuario, 'SIN ASIGNAR - CODIFY' Vendedor_Distribuidora, 'SIN ASIGNAR - CODIFY' Tipo_tienda_Distribuidora, A.CodAlicorp CodAlicorp,
	   M.FacUnitario FacUnitario, A.TUnidades TUnidades, 0  Plan_Ton, A.VentaTon VentaTon, 0 Plan_Dol, A.VentaDolares VentaDolares,
	   'Consumo Masivo' Negocio
FROM CODIFY A
   	 LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp;


DELETE FROM #PANALES WHERE   FacUnitario is null
--SELECT  sum(VentaDolares)   FROM #PANALES WHERE   FacUnitario is null and RIGHT(Fecha,7) = '09/2022'
--SELECT    agencia, CodAlicorp,sum(VentaDolares)  FROM #PANALES WHERE   FacUnitario is null and RIGHT(Fecha,7) = '09/2022' group by agencia, CodAlicorp
--DELETE FROM #PANALES WHERE CodAlicorp IN ('AD0220', 'AD0221', 'AD0224', 'AD0225', 'AD0226', 'AD0227', 'AD0228', 'AD0229', 'AD0230', 'AD0231', 'AD0232', 'AD0233', 'AD0234', 'AD0241', 'AD0242', 'AD0243', 'AD0246', 'AD0247',
--                                          'AD0248', 'Ali001', 'Ali002', 'Ali003', 'Ali005', 'Ali007', 'Ali008', 'Ali009', 'Ali011', 'Ali013', 'Ali015', 'Ali016', 'Ali017', 'Ali10', 'AD0219', 'AD0215', 'AD0218', 'Ali006',
--										  'AD0217', 'ESPAPROM', 'AD0103', 'AD239', 'Ali014', 'ALIC063', 'H450C200', 'H523B017', 'H523B222', 'H523B223', 'P.33001461', '617080', '688320', '484168', '29116B', '453-G', '648-001', 'AMB360',
--										  'H180-G', 'MY', 'SP', 'TALL', 'AD0058', 'GLL','AD0250', 'AD0249', 'AD0251', 'CL001' )

ALTER TABLE #PANALES ALTER COLUMN Plan_Ton FLOAT;
ALTER TABLE #PANALES ALTER COLUMN VentaTon FLOAT;
ALTER TABLE #PANALES ALTER COLUMN Plan_Dol FLOAT;

--Creo tabla temporal para insertar variables Dummies ya que no todas los sku tienen registros suficientes y asi no se desconfigure el excel

--IF OBJECT_ID(N'tempdb..#PANALES_DUMMY1') IS NOT NULL DROP TABLE #PANALES_DUMMY1;

--SELECT B.Fecha, A.Agencia, C.CodAlicorp
--INTO #PANALES_DUMMY1 
--FROM (SELECT DISTINCT Agencia FROM #PANALES) A CROSS JOIN #FECHA B
--CROSS JOIN (SELECT DISTINCT CodAlicorp FROM #PANALES) C

--INSERT INTO #PANALES
--SELECT A.Fecha Fecha, A.Agencia Agencia, 'Dummy' CodClienteSellOut, 'Dummy' ClienteSellOut, 'Dummy' Vendedor_Distribuidora, 'Dummy' Tipo_tienda_Distribuidora, A.CodAlicorp CodAlicorp,
--	   0 FacUnitario, 0 TUnidades, 0  Plan_Ton, 0 VentaTon, 0 Plan_Dol, 0 VentaDolares,
--	   'Consumo Masivo' Negocio
--FROM #PANALES_DUMMY1 A


--Ingreso los planes

TRUNCATE TABLE PLAN_PANALES;

BULK INSERT PLAN_PANALES
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_PANALES.csv'
WITH (FIELDTERMINATOR=';', FIRSTROW=2, CODEPAGE='ACP');

UPDATE A SET Fecha = REPLACE(Fecha, '.', '/') FROM PLAN_PANALES A;
UPDATE A SET Ventas_Reales = 0 FROM PLAN_PANALES A;
UPDATE A SET Ventas_Ton = 0 FROM PLAN_PANALES A;


SET LANGUAGE US_ENGLISH;

DELETE PLAN_PANALES WHERE Plan_Dol = 0 AND Plan_Ton = 0;
DELETE FROM PLAN_PANALES WHERE Plan_Dol IS NULL AND Plan_Ton IS NULL;
DELETE FROM PLAN_PANALES WHERE Plan_Dol = '' AND Plan_Ton = '';


UPDATE A SET CodCategoria = TRIM(CodCategoria) FROM PLAN_PANALES A;
UPDATE A SET Categoria = TRIM(Categoria) FROM PLAN_PANALES A;
UPDATE A SET CodMarca = TRIM(CodMarca) FROM PLAN_PANALES A;
UPDATE A SET Marca = TRIM(Marca) FROM PLAN_PANALES A;
UPDATE A SET CodFamilia = TRIM(CodFamilia) FROM PLAN_PANALES A;
UPDATE A SET Familia = TRIM(Familia) FROM PLAN_PANALES A;
UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM PLAN_PANALES A;
UPDATE A SET Des_Material = TRIM(Des_Material) FROM PLAN_PANALES A;
UPDATE A SET Agencia_Distribuidora = TRIM(Agencia_Distribuidora) FROM PLAN_PANALES A;
UPDATE A SET Plataforma = TRIM(Plataforma) FROM PLAN_PANALES A;

DELETE FROM PLAN_PANALES
	   WHERE Agencia_Distribuidora IN ('CONTRERAS DELGADO WASHINGTON BENEDI', 'COPARESA S.A.')
--preguntar hasta cuando se elimina coparesa

--DELETE FROM PLAN_PANALES
--	   WHERE Agencia_Distribuidora IN ('CONTRERAS DELGADO WASHINGTON BENEDI','ATI CAMPA�A FLAVIA MARINA')
			 


UPDATE PLAN_PANALES
SET CodMarca = RIGHT(CodMarca,1)
WHERE CodMarca LIKE '00%';

UPDATE PLAN_PANALES
SET CodMarca = RIGHT(CodMarca,2)
WHERE CodMarca LIKE '0%';
-- Debido a que cuando subo la informaci�n del csv se agrega un cero a la izquierda


UPDATE PLAN_PANALES 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%';


UPDATE PLAN_PANALES
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128'
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;

-- Cada vez que ingrese un nuevo panal registrarlo en este update para homologarlo con el maestro de agencia
--UPDATE PLAN_PANALES
--SET NomOficina = CASE NomOficina
--	WHEN 'JINES CAJAS CESAR XAVIER' THEN 'JINES CAJAS XAVIER CESAR'
--	WHEN 'ZAMORA BRIONES MARIA MAGDALENA' THEN 'MOREJON QUISPE LUIS ALFREDO'
--	WHEN 'ESPINOZA ZEAS MANUEL JOHN' THEN 'ESPINOZA ZEAS MANUEL JHON'
--	WHEN 'GUADALUPE CASTILLO ERNESTO VICENTE' THEN 'GUADALUPE CASTILLO ERNESTO VICEN 2'
--	WHEN 'COPARESA S.A.' THEN 'COPARESA'
--	WHEN 'COPARESA S.A N 1' THEN 'COPARESA'
--	WHEN 'TAGLE GUERRERO ARISTIDES NORMANDO' THEN 'ARISTIDES NORMANDO TAGLE GUERRERO'
--	ELSE NomOficina END


--Inserto data dummy
--INSERT INTO #PANALES_DUMMY1
--SELECT B.Fecha, A.Agencia, C.CodAlicorp
--FROM  (SELECT F.Agencia FROM (SELECT DISTINCT Agencia_Distribuidora FROM PLAN_PANALES) D LEFT JOIN MAESTRO_AGENCIAS F ON D.Agencia_Distribuidora = F.Agencia_Distribuidora)  A CROSS JOIN #FECHA B
--CROSS JOIN (SELECT DISTINCT CodAlicorp FROM PLAN_PANALES) C


TRUNCATE TABLE PLAN_2MAYA;

BULK INSERT PLAN_2MAYA
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_2MAYA.csv'
WITH (FIELDTERMINATOR=';', FIRSTROW=2, CODEPAGE='ACP');

UPDATE A SET Fecha = REPLACE(Fecha, '.', '/') FROM PLAN_2MAYA A;
UPDATE A SET Ventas_Reales = 0 FROM PLAN_2MAYA A;
UPDATE A SET Ventas_Ton = 0 FROM PLAN_2MAYA A;

DELETE PLAN_2MAYA WHERE Plan_Dol = 0 AND Plan_Ton = 0;
DELETE FROM PLAN_2MAYA WHERE Plan_Dol IS NULL AND Plan_Ton IS NULL;
DELETE FROM PLAN_2MAYA WHERE Plan_Dol = '' AND Plan_Ton = '';

--Cada vez que haya una nueva agencia incluirlo aca que se considerara en el reporte incluirla aca
--DELETE FROM PLAN_2MAYA WHERE NomOficina NOT IN ('NEOPOR S.A.', 'PULLA', 'MARVECOBE S.A', 'HARO')
--DELETE FROM PLAN_2MAYA WHERE NomOficina NOT IN ('NEOPOR S.A.', 'PULLA', 'MARVECOBE S.A', 'HARO', 'ALVAREZ') 
--PREGUNTAR HASTA CUANDO SERA ESTO

UPDATE A SET CodCategoria = TRIM(CodCategoria) FROM PLAN_2MAYA A;
UPDATE A SET Categoria = TRIM(Categoria) FROM PLAN_2MAYA A;
UPDATE A SET CodMarca = TRIM(CodMarca) FROM PLAN_2MAYA A;
UPDATE A SET Marca = TRIM(Marca) FROM PLAN_2MAYA A;
UPDATE A SET CodFamilia = TRIM(CodFamilia) FROM PLAN_2MAYA A;
UPDATE A SET Familia = TRIM(Familia) FROM PLAN_2MAYA A;
UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM PLAN_2MAYA A;
UPDATE A SET Des_Material = TRIM(Des_Material) FROM PLAN_2MAYA A;
UPDATE A SET Agencia_Distribuidora = TRIM(Agencia_Distribuidora) FROM PLAN_2MAYA A;
UPDATE A SET Plataforma = TRIM(Plataforma) FROM PLAN_2MAYA A;

DELETE FROM PLAN_2MAYA
	   WHERE Agencia_Distribuidora
			 IN ('FREDVY S.A.', 'REPRESENTACIONES J.LEONARDO SORIA')

UPDATE PLAN_2MAYA
SET CodMarca = RIGHT(CodMarca,1)
WHERE CodMarca LIKE '00%';

UPDATE PLAN_2MAYA
SET CodMarca = RIGHT(CodMarca,2)
WHERE CodMarca LIKE '0%';
-- Debido a que cuando subo la informaci�n del csv se agrega un cero a la izquierda


UPDATE PLAN_2MAYA 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%';
	 

UPDATE PLAN_2MAYA
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128'
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;


-- Cada vez que ingrese una nueva agencia registrarlo en este update para homologarlo con el maestro de agencia
--UPDATE PLAN_2MAYA
--SET NomOficina = CASE NomOficina
--	WHEN 'NEOPOR S.A.' THEN 'DISTRIBUIDORA DE CONSUMO MASIVO NEOPOR S.A'
--	WHEN 'PULLA' THEN 'PULLA VIMOS LOURDES CATALINA'
--	WHEN 'MARVECOBE S.A' THEN 'MARVECOBE'
--	WHEN 'HARO' THEN 'HARO IVAN'   
--	WHEN 'ALVAREZ' THEN 'ALVAREZ TORRES SEGUNDO MIGUEL'
--	ELSE NomOficina END

--Inserto data dummy

--INSERT INTO #PANALES_DUMMY1
--SELECT B.Fecha, A.Agencia, C.CodAlicorp
--FROM  (SELECT F.Agencia FROM (SELECT DISTINCT Agencia_Distribuidora FROM PLAN_2MAYA) D LEFT JOIN MAESTRO_AGENCIAS F ON D.Agencia_Distribuidora = F.Agencia_Distribuidora)  A CROSS JOIN #FECHA B
--CROSS JOIN (SELECT DISTINCT CodAlicorp FROM PLAN_2MAYA) C


--INSERT INTO #PANALES
--SELECT A.Fecha Fecha, A.Agencia Agencia, 'Dummy' CodClienteSellOut, 'Dummy' ClienteSellOut, 'Dummy' Usuario, 'Dummy' Vendedor_Distribuidora, 'Dummy' Tipo_tienda_Distribuidora, A.CodAlicorp CodAlicorp,
--	   0 FacUnitario, 0 TUnidades, 0  Plan_Ton, 0 VentaTon, 0 Plan_Dol, 0 VentaDolares,
--	   'Consumo Masivo' Negocio
--FROM #PANALES_DUMMY1 A


UPDATE #PANALES 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%'

--------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
-- Para el proyecto de tablero
IF OBJECT_ID('DATA_MART_SO_ECUADOR') IS NOT NULL DROP TABLE DATA_MART_SO_ECUADOR;

SELECT F.DES_MES Mes, A.Fecha Dia, 'MINORISTAS' TipoDistribuidor,
	   M.CodCategoria CodCategoria, M.Categoria Categoria, M.CodFamilia CodFamilia, M.Familia Familia, M.CodAlicorp CodAlicorp, M.Material Material, M.CodMarca CodMarca, M.Marca Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   A.Usuario, A.Vendedor_Distribuidora, A.Tipo_tienda_Distribuidora, A.CodClienteSellOut, A.ClienteSellOut,
	   A.Negocio, A.FacUnitario, SUM(ISNULL(A.TUnidades,0)) TUnidades, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL(A.VentaTon,0)) real_ton, SUM(ISNULL(A.Plan_Dol,0)) Plan_Dol, SUM(ISNULL(A.VentaDolares,0)/1000) real_Dolares,
	  M.Plataforma Plataforma
INTO DATA_MART_SO_ECUADOR
FROM #PANALES A
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.Agencia = AG.Agencia
GROUP BY F.DES_MES, A.Fecha,
	   M.CodCategoria, M.Categoria, M.CodFamilia, M.Familia, M.CodAlicorp, M.Material, M.CodMarca, M.Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   A.Usuario, A.Vendedor_Distribuidora, A.Tipo_tienda_Distribuidora, CodClienteSellOut, ClienteSellOut,
	   A.Negocio,A.FacUnitario, M.Plataforma;


--Inserto el Plan de Panales
--Para el proyecto tablero

INSERT INTO DATA_MART_SO_ECUADOR
SELECT F.DES_MES Mes, A.Fecha Dia, 'MINORISTAS' TipoDistribuidor,
	   A.CodCategoria CodCategoria, A.Categoria Categoria, A.CodFamilia CodFamilia, A.Familia Familia, A.CodAlicorp CodAlicorp, A.Des_Material Material, A.CodMarca CodMarca, A.Marca Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   'SIN DATOS' Usuario, 'SIN ASIGNAR - PA_PLAN ' Vendedor_Distribuidora, 'SIN ASIGNAR - PA_PLAN ' Tipo_tienda_Distribuidora, 'SIN ASIGNAR - PA_PLAN ' CodClienteSellOut, 'SIN ASIGNAR - PA_PLAN ' ClienteSellOut,
	   'Consumo Masivo' Negocio, 0 FacUnitario, 0 TUnidades, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL(A.Ventas_Ton,0)) real_ton, SUM(ISNULL(A.Plan_Dol,0)) Plan_Dol, SUM(ISNULL(A.Ventas_Reales,0)) real_Dolares,
	  A.Plataforma Plataforma
FROM PLAN_PANALES A  
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.Agencia_Distribuidora = AG.Agencia_Distribuidora
GROUP BY F.DES_MES, A.Fecha,
	   A.CodCategoria, A.Categoria, A.CodFamilia, A.Familia, A.CodAlicorp, A.Des_Material, A.CodMarca, A.Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   A.Plataforma;

--- Pueden haber rows con valor 0 en plan y venta a vez debido en la fabril hay muchas ventas negativas, las nc negativas y debido al plan
--que puede darse el caso de que hay codigos sin plan
-- en Panales exectuando los rows ficticios porque puede darse el caso de que hay codigos sin plan.

----inserto el Plan de 2maya----------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO DATA_MART_SO_ECUADOR
SELECT F.DES_MES Mes, A.Fecha Dia, 'MINORISTAS' TipoDistribuidor,
	   A.CodCategoria CodCategoria, A.Categoria Categoria, A.CodFamilia CodFamilia, A.Familia Familia, A.CodAlicorp CodAlicorp, A.Des_Material Material, A.CodMarca CodMarca, A.Marca Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   'SIN DATOS' Usuario, 'SIN ASIGNAR - 2MAY_PLAN ' Vendedor_Distribuidora, 'SIN ASIGNAR - 2MAY_PLAN ' Tipo_tienda_Distribuidora, 'SIN ASIGNAR - 2MAY_PLAN ' CodClienteSellOut, 'SIN ASIGNAR - 2MAY_PLAN ' ClienteSellOut,
	   'Consumo Masivo' Negocio, 0 FacUnitario, 0 TUnidades, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL(A.Ventas_Ton,0)) real_ton, SUM(ISNULL(A.Plan_Dol,0)) Plan_Dol, SUM(ISNULL(A.Ventas_Reales,0)) real_Dolares,
	  A.Plataforma Plataforma
FROM PLAN_2MAYA A  
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.Agencia_Distribuidora = AG.Agencia_Distribuidora
GROUP BY F.DES_MES, A.Fecha,
	   A.CodCategoria, A.Categoria, A.CodFamilia, A.Familia, A.CodAlicorp, A.Des_Material, A.CodMarca, A.Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   A.Plataforma;




--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
----Hularruss


--SET LANGUAGE SPANISH;

--Coloco el mes en curso aqui comienza
DELETE FROM HULARUSS_HISTORICO WHERE LEFT(Fecha,7) = '2022-09';


--ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN Importe VARCHAR(100);
ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN VentaKilos VARCHAR(100);
ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN importe VARCHAR(100);
ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN Cantidad VARCHAR(100);

DECLARE @HULARUSS VARCHAR(MAX);
SELECT @HULARUSS = BULKCOLUMN FROM 
OPENROWSET(BULK 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\ALISCORP_ventas_peso.json', SINGLE_BLOB) JSON;
IF (ISJSON(@HULARUSS) = 1)
INSERT INTO HULARUSS_HISTORICO
SELECT *
FROM OPENJSON(@HULARUSS)
WITH (
	CanalSR VARCHAR (100),
	Ruta VARCHAR (100),
	customernum VARCHAR(100),
	invoicenum VARCHAR(100),
	Fecha DATE,
	status VARCHAR(100),
	inventorynum VARCHAR(100),
	description VARCHAR(100),
	Cantidad VARCHAR(100),
	Precio VARCHAR(100),
	Valor VARCHAR(100),
	Empaque VARCHAR(100),
	PesoTot VARCHAR(100),
	Territorio VARCHAR(100),
	Vendedor VARCHAR(100),
	Categoria VARCHAR(100)
)
WHERE YEAR(Fecha) = 2022 AND MONTH(Fecha) = 09;


--BULK INSERT HULARUSS_HISTORICO
--FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\VentasHularuss_JUN.csv'
--WITH (FIELDTERMINATOR= ';', FIRSTROW=2, CODEPAGE='ACP');


--SET LANGUAGE US_ENGLISH;

UPDATE HULARUSS_HISTORICO
SET Cantidad = REPLACE(Cantidad,',','')
WHERE CHARINDEX(',',Cantidad) > 0;

UPDATE HULARUSS_HISTORICO
SET importe = REPLACE(importe,',','')
WHERE CHARINDEX(',',importe) > 0;

UPDATE HULARUSS_HISTORICO
SET VentaKilos = REPLACE(VentaKilos,',','')
WHERE CHARINDEX(',',VentaKilos) > 0;

ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN VentaKilos FLOAT;
ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN importe FLOAT;
ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN Cantidad DECIMAL (18,2);

--ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN Importe FLOAT;

TRUNCATE TABLE VENTAS_HULARUSS;

--Coloco los meses a comparar
INSERT INTO VENTAS_HULARUSS
SELECT *
FROM HULARUSS_HISTORICO
--WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 09;

--INSERT INTO VENTAS_HULARUSS
--SELECT *
--FROM HULARUSS_HISTORICO
--WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 08;

------------------USAR CUANDO LLEGUE EL 2023------------------------------------------------------
--INSERT INTO VENTAS_HULARUSS
--SELECT *
--FROM HULARUSS_HISTORICO
--WHERE DATEPART(YEAR,Fecha) = PONER A�OPASADO AND DATEPART(MONTH,Fecha) = PONER MES DE A�O PASADO;
-----------------------------------------------------------------------------------------------------------

UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM VENTAS_HULARUSS A;
UPDATE A SET Agencia = TRIM(Agencia) FROM VENTAS_HULARUSS A;
UPDATE A SET Empaque = TRIM(Empaque) FROM VENTAS_HULARUSS A;
UPDATE A SET CodClienteSellOut = TRIM(CodClienteSellOut) FROM VENTAS_HULARUSS A
UPDATE A SET Canal = TRIM(Canal) FROM VENTAS_HULARUSS A

UPDATE VENTAS_HULARUSS SET CodAlicorp = REPLACE(CodAlicorp, 'A', '')




--DELETE FROM VENTAS_HULARUSS WHERE Importe = 0; Esperar a ver que dice sobre las importes negativos
DELETE FROM VENTAS_HULARUSS WHERE CodAlicorp LIKE '%PROMO%';
DELETE FROM VENTAS_HULARUSS WHERE CodAlicorp = 'BNDEO - 002';
DELETE FROM VENTAS_HULARUSS WHERE Importe IS NULL;
DELETE FROM VENTAS_HULARUSS WHERE Canal IS NULL;

DELETE FROM VENTAS_HULARUSS WHERE Importe =0; 
--Ver este delete

DELETE FROM VENTAS_HULARUSS WHERE agencia IS NULL; 

--UPDATE A SET PesoKG = TRIM(PesoKG) FROM BASE_MOBILVENDOR_AUTOMATICA A;
--UPDATE A SET PesoTon = TRIM(PesoTon) FROM BASE_MOBILVENDOR_AUTOMATICA A;

UPDATE VENTAS_HULARUSS
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128'
	WHEN '335015' THEN '4335015'
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;
-- 293369 este error solo sale en la data de ventas de Panales

UPDATE A SET A.Cantidad = A.Cantidad*M.FacUnitario FROM VENTAS_HULARUSS A
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
	WHERE Empaque <> 'Unidad'


UPDATE A SET A.Ventakilos = (A.Cantidad * M.PesoKG) FROM VENTAS_HULARUSS A 
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
	WHERE A.Ventakilos = 0

UPDATE A SET A.Canal = CASE A.Canal WHEN 'TAT' THEN 'MINORISTAS' ELSE 'MAYORISTAS' END FROM VENTAS_HULARUSS A 
	
--UPDATE A SET A.Canal = 'MAYORISTAS' FROM VENTAS_HULARUSS A 
--	WHERE  A.Canal <> 'TAT'

--Creo tabla temporal para homologar los campos y darle formato a la fecha, tambien calculo las toneladas
IF OBJECT_ID(N'tempdb..#HULARUSS') IS NOT NULL DROP TABLE #HULARUSS;

SELECT CONVERT(VARCHAR(20), A.Fecha,103) Fecha, A.Canal, A.Agencia Agencia, 'SIN DATOS' Usuario, 'H-SIN ASIGNAR' Vendedor_Distribuidora, 'H-SIN ASIGNAR' Tipo_tienda_Distribuidora, A.CodClienteSellOut, A.CodAlicorp CodAlicorp,
	   M.FacUnitario FacUnitario, A.Cantidad TUnidades, 0  Plan_Ton, VentaKilos VentaKil, 0 Plan_Dol, A.Importe VentaDolares,
	   'Consumo Masivo' Negocio
INTO #HULARUSS
--SELECT DISTINCT CANAL from #HULARUSS
FROM VENTAS_HULARUSS A
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
--WHERE A.Canal = 'MINORISTAS';

--SELECT * FROM #HULARUSS WHERE  FacUnitario is null VentaKil=0 AND VentaDolares= 0 AND Plan_Dol = 0 AND Plan_Ton = 0
--Solo deben salir 28 rows por los datos ficticios simpre y cuando lo corra desde la l�nea donde se agregan

--Creo tabla temporal para insertar variables Dummies ya que no todas los sku tienen registros suficientes y asi no se desconfigure el excel
--IF OBJECT_ID(N'tempdb..#HULARUSS_DUMMY') IS NOT NULL DROP TABLE #HULARUSS_DUMMY;

--SELECT B.Fecha, A.Agencia, C.CodAlicorp
--INTO #HULARUSS_DUMMY
--FROM (SELECT DISTINCT Agencia FROM #HULARUSS) A CROSS JOIN #FECHA B
--CROSS JOIN (SELECT DISTINCT CodAlicorp FROM #HULARUSS) C


ALTER TABLE #HULARUSS ALTER COLUMN Plan_Ton FLOAT;
ALTER TABLE #HULARUSS ALTER COLUMN Plan_Dol FLOAT;








SET LANGUAGE US_ENGLISH;

TRUNCATE TABLE NuevoPlanHularussFormato;

BULK INSERT NuevoPlanHularussFormato
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_HULARUSS.csv'
WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

--DECLARE @dia DATE;
--SELECT @dia= DATEADD(DAY,-2,SYSDATETIME());

DELETE FROM NuevoPlanHularussFormato WHERE CodAlicorp LIKE '%TOTAL%'

UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM NuevoPlanHularussFormato A;
UPDATE A SET Canal = TRIM(Canal) FROM NuevoPlanHularussFormato A;
UPDATE NuevoPlanHularussFormato SET CodAlicorp = LEFT(CodAlicorp,CHARINDEX(' ',CodAlicorp)-1);
UPDATE NuevoPlanHularussFormato SET Fecha = @dia

IF OBJECT_ID(N'tempdb..#HULARUSS_PLAN_NUEVO') IS NOT NULL DROP TABLE #HULARUSS_PLAN_NUEVO;

SELECT Fecha, Canal, CodAlicorp, NomOficina, MontoCantidad
INTO #HULARUSS_PLAN_NUEVO
FROM
(SELECT * FROM NuevoPlanHularussFormato) PLAN_HULARUSS
UNPIVOT
(MontoCantidad FOR NomOficina IN (AMBATO,AMBATO_TN,CHONE,CHONE_TN,CUENCA,CUENCA_TN,ESMERALDAS,ESMERALDAS_TN,GUAYAQUIL,GUAYAQUIL_TN,IBARRA,IBARRA_TN,LOJA,LOJA_TN,MACHALA,MACHALA_TN,
MANABI,MANABI_TN,MILAGRO,MILAGRO_TN,ORIENTE,ORIENTE_TN,QUEVEDO,QUEVEDO_TN,QUITO,QUITO_TN,[SANTA ELENA],[SANTA ELENA_TN],[SANTO DGO],[SANTO DGO_TN])) AS PLAN_UNPIVOT

UPDATE A SET Canal = 'MINORISTAS' FROM #HULARUSS_PLAN_NUEVO A  WHERE Canal = 'TIENDA';

DELETE FROM #HULARUSS_PLAN_NUEVO WHERE NomOficina IN ('CHONE', 'CHONE_TN', 'ORIENTE', 'ORIENTE_TN' )

IF OBJECT_ID(N'tempdb..#HULARUSS_PLAN_NUEVO_TON') IS NOT NULL DROP TABLE #HULARUSS_PLAN_NUEVO_TON;

SELECT *
INTO #HULARUSS_PLAN_NUEVO_TON
FROM #HULARUSS_PLAN_NUEVO
WHERE NomOficina IN('AMBATO_TN','CHONE_TN','CUENCA_TN','ESMERALDAS_TN','GUAYAQUIL_TN',
'IBARRA_TN','LOJA_TN','MACHALA_TN','MANABI_TN','MILAGRO_TN','ORIENTE_TN','QUEVEDO_TN',
'QUITO_TN','SANTA ELENA_TN','SANTO DGO_TN')

UPDATE A SET NomOficina = LEFT(NomOficina,LEN(NomOficina)-3) FROM #HULARUSS_PLAN_NUEVO_TON A;
--SELECT * FROM #HULARUSS_PLAN_NUEVO_TON WHERE MontoCantidad IS NULL

IF OBJECT_ID(N'tempdb..#HULARUSS_PLAN_NUEVO_DOL') IS NOT NULL DROP TABLE #HULARUSS_PLAN_NUEVO_DOL;

SELECT *
INTO #HULARUSS_PLAN_NUEVO_DOL
FROM #HULARUSS_PLAN_NUEVO
WHERE NomOficina IN('AMBATO','CHONE','CUENCA','ESMERALDAS','GUAYAQUIL',
'IBARRA','LOJA','MACHALA','MANABI','MILAGRO','ORIENTE','QUEVEDO',
'QUITO','SANTA ELENA','SANTO DGO')

--ACA #HULARUSS_PLAN_NUEVO_MINOR INCLUYE TAMBIEN MAYORISTAS
IF OBJECT_ID(N'tempdb..#HULARUSS_PLAN_NUEVO_MINOR') IS NOT NULL DROP TABLE #HULARUSS_PLAN_NUEVO_MINOR;

SELECT CONVERT(VARCHAR(20),A.Fecha,103) Fecha, A.Canal Canal, A.CodAlicorp CodAlicorp, A.NomOficina, A.MontoCantidad Plan_Ton, B.MontoCantidad Plan_Dol
INTO #HULARUSS_PLAN_NUEVO_MINOR
FROM #HULARUSS_PLAN_NUEVO_TON A 
	LEFT JOIN #HULARUSS_PLAN_NUEVO_DOL B ON A.CodAlicorp = B.CodAlicorp AND A.NomOficina = B.NomOficina AND A.Canal = B.Canal AND A.Fecha = B.Fecha
--WHERE A.Canal = 'MINORISTAS'

DELETE #HULARUSS_PLAN_NUEVO_MINOR WHERE Plan_Dol = 0 AND Plan_Ton = 0;

UPDATE #HULARUSS_PLAN_NUEVO_MINOR 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%'

--select DISTINCT CANAL from #HULARUSS_PLAN_NUEVO_MINOR

UPDATE #HULARUSS_PLAN_NUEVO_MINOR
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128'
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;

--INSERT INTO #HULARUSS_DUMMY
--SELECT B.Fecha, A.Agencia, C.CodAlicorp
--FROM  (SELECT F.Agencia FROM (SELECT DISTINCT NomOficina FROM #HULARUSS_PLAN_NUEVO_MINOR) D LEFT JOIN MAESTRO_AGENCIAS F ON D.NomOficina = F.NomOficina)  A CROSS JOIN #FECHA B
--CROSS JOIN (SELECT DISTINCT CodAlicorp FROM #HULARUSS_PLAN_NUEVO_MINOR) C



--select SUM(Plan_Ton) FROM #HULARUSS_PLAN_NUEVO_MAYOR


--INSERT INTO #HULARUSS
--SELECT A.Fecha Fecha, 'Dummy' Canal , A.Agencia Agencia, 'Dummy' Usuario, 'Dummy' Vendedor_Distribuidora, 'Dummy' Tipo_tienda_Distribuidora, 'Dummy' CodClienteSellOut, A.CodAlicorp CodAlicorp,
--	   0 FacUnitario, 0 TUnidades, 0  Plan_Ton, 0 Ventakil, 0 Plan_Dol, 0 VentaDolares,
--	   'Consumo Masivo' Negocio
--FROM #HULARUSS_DUMMY A


UPDATE #HULARUSS 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%'

-- Para el proyecto de tablero

INSERT INTO DATA_MART_SO_ECUADOR
SELECT F.DES_MES Mes, A.Fecha Dia, A.Canal TipoDistribuidor,
	   M.CodCategoria CodCategoria, M.Categoria Categoria, M.CodFamilia CodFamilia, M.Familia Familia, A.CodAlicorp CodAlicorp, M.Material Material, M.CodMarca CodMarca, M.Marca Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   A.Usuario, A.Vendedor_Distribuidora, A.Tipo_tienda_Distribuidora, A.CodClienteSellOut, 'SIN ASIGNAR - HU ' ClienteSellOut,
	   A.Negocio, A.FacUnitario, SUM(ISNULL(A.TUnidades,0)) TUnidades, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL(A.VentaKil,0)/1000) real_ton, SUM(ISNULL(A.Plan_Dol,0)) Plan_Dol, SUM(ISNULL(A.VentaDolares,0)/1000) real_Dolares,
	  M.Plataforma Plataforma
FROM #HULARUSS A
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.Agencia = AG.Agencia
GROUP BY F.DES_MES, A.Fecha, A.Canal,
	   M.CodCategoria, M.Categoria, M.CodFamilia, M.Familia, A.CodAlicorp, M.Material, M.CodMarca, M.Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   A.Usuario, A.Vendedor_Distribuidora, A.Tipo_tienda_Distribuidora, A.CodClienteSellOut,
	   A.Negocio,A.FacUnitario, M.Plataforma;


--Inserto el Plan de Hularuss

------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------



INSERT INTO DATA_MART_SO_ECUADOR
SELECT F.DES_MES Mes, A.Fecha Dia, A.Canal TipoDistribuidor,
	   M.CodCategoria CodCategoria, M.Categoria Categoria, M.CodFamilia CodFamilia, M.Familia Familia, A.CodAlicorp CodAlicorp, M.Material Material, M.CodMarca CodMarca, M.Marca Marca,
	   AG.ZonaV2, AG.CodOficina, A.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   'SIN DATOS' Usuario, 'SIN ASIGNAR - HU_PLAN ' Vendedor_Distribuidora, 'SIN ASIGNAR - HU_PLAN ' Tipo_tienda_Distribuidora, 'SIN ASIGNAR - HU' CodClienteSellOut, 'SIN ASIGNAR - HU' ClienteSellOut,
	   'Consumo Masivo' Negocio, 0 FacUnitario, 0 TUnidades, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  0 real_ton, SUM(ISNULL(A.Plan_Dol/1000,0)) Plan_Dol, 0 real_Dolares,
	  M.Plataforma Plataforma
FROM #HULARUSS_PLAN_NUEVO_MINOR A
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.NomOficina = AG.NomOficina
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
GROUP BY F.DES_MES, A.Fecha, A.Canal,
	   M.CodCategoria, M.Categoria, M.CodFamilia, M.Familia, A.CodAlicorp, M.Material, M.CodMarca, M.Marca,
	   AG.ZonaV2, AG.CodOficina, A.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   M.Plataforma;
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


---La Fabril

TRUNCATE TABLE PLAN_LA_FABRIL;

BULK INSERT PLAN_LA_FABRIL
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_LA_FABRIL.csv'
WITH (FIELDTERMINATOR=';', FIRSTROW=2, CODEPAGE='ACP');

DELETE [PLAN_LA_FABRIL] WHERE Plan_Ton = 0 AND Importe = 0;

UPDATE PLAN_LA_FABRIL SET Agencia = TRIM(Agencia);
UPDATE PLAN_LA_FABRIL SET CodAlicorp = TRIM(CodAlicorp);
UPDATE PLAN_LA_FABRIL SET Fecha = @dia;


UPDATE PLAN_LA_FABRIL
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '3300154' THEN '3300141'
	WHEN '3300155' THEN '3300140'
	WHEN '8309009' THEN '8309128' ELSE CodAlicorp END;
--Cambiamos los codigos antiguos por los nuevos codigos afo

SET LANGUAGE SPANISH;

TRUNCATE TABLE BASE_INICIAL_CARGA;

BULK INSERT BASE_INICIAL_CARGA
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\BDPRUEBAVENTA.csv'
WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

UPDATE BASE_INICIAL_CARGA
SET Kilos = REPLACE(Kilos,',','')
WHERE CHARINDEX(',',Kilos) > 0;

UPDATE BASE_INICIAL_CARGA
SET Importe = REPLACE(Importe,',','')
WHERE CHARINDEX(',',Importe) > 0;

UPDATE BASE_INICIAL_CARGA
SET Cajas = REPLACE(Cajas,',','')
WHERE CHARINDEX(',',Cajas) > 0;

UPDATE BASE_INICIAL_CARGA
SET FacUnitario = REPLACE(FacUnitario,',','')
WHERE CHARINDEX(',',FacUnitario) > 0;

UPDATE BASE_INICIAL_CARGA
SET FactKilos = REPLACE(FactKilos,',','')
WHERE CHARINDEX(',',FactKilos) > 0;

UPDATE BASE_INICIAL_CARGA
SET TUnidades = REPLACE(TUnidades,',','')
WHERE CHARINDEX(',',TUnidades) > 0;

--colocamos el periodo actual
DELETE FROM LF_VENTAS_HISTORICO WHERE LEFT(FFactura,7) = '2022-09';

INSERT INTO LF_VENTAS_HISTORICO
SELECT *
FROM BASE_INICIAL_CARGA;

SET LANGUAGE US_ENGLISH;

--Colocar los meses que deseamos comparar con el mes actual
TRUNCATE TABLE BASE_INICIAL_VENTAS;

INSERT INTO BASE_INICIAL_VENTAS
SELECT *
FROM LF_VENTAS_HISTORICO
--WHERE DATEPART(YEAR, FFactura)= 2022 AND DATEPART(MONTH, FFactura) = 09

--INSERT INTO BASE_INICIAL_VENTAS
--SELECT *
--FROM LF_VENTAS_HISTORICO
--WHERE DATEPART(YEAR, FFactura)= 2021 AND DATEPART(MONTH, FFactura) = 09

--INSERT INTO BASE_INICIAL_VENTAS
--SELECT *
--FROM LF_VENTAS_HISTORICO
--WHERE DATEPART(YEAR, FFactura)= 2022 AND DATEPART(MONTH, FFactura) = 08


DELETE FROM BASE_INICIAL_VENTAS WHERE Kilos = 0 AND Importe = 0;

UPDATE A SET Agencia = TRIM(Agencia) FROM BASE_INICIAL_VENTAS A;
UPDATE A SET CodArticulo = TRIM(CodArticulo) FROM BASE_INICIAL_VENTAS A;
UPDATE A SET GrupoProducto = TRIM(GrupoProducto) FROM BASE_INICIAL_VENTAS A;
UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM BASE_INICIAL_VENTAS A;
UPDATE A SET DesArticulo = TRIM(DesArticulo) FROM BASE_INICIAL_VENTAS A;
UPDATE A SET NSupervisor = TRIM(NSupervisor) FROM BASE_INICIAL_VENTAS A;
UPDATE A SET TVendedor = TRIM(TVendedor) FROM BASE_INICIAL_VENTAS A;
UPDATE A SET Cliente = TRIM(Cliente) FROM BASE_INICIAL_VENTAS A;
UPDATE A SET NomCliente = TRIM(NomCliente) FROM BASE_INICIAL_VENTAS A;

UPDATE BASE_INICIAL_VENTAS
SET NSupervisor ='SIN ASIGNAR'
WHERE NSupervisor = ''

UPDATE BASE_INICIAL_VENTAS
SET CodAlicorp = CASE CodArticulo
	WHEN '8005777' THEN '8312006'
	WHEN '8005653' THEN '3300123'
	ELSE CodAlicorp	END;

UPDATE BASE_INICIAL_VENTAS
SET CodAlicorp = CASE DesArticulo
	WHEN 'NUTREG BOLSA SURTIDA 200G 20BO'	THEN	'4335049'
	WHEN 'NUTREG BOLSA SURTIDA 400G 12BO'	THEN	'4335048'
	ELSE CodAlicorp END;

UPDATE BASE_INICIAL_VENTAS
SET	DesArticulo = 'INSECTIC SAPOL MOSC/ZANC 360ML C*12'
WHERE DesArticulo = 'INSECTIC SAPOL MOSC/ZANC 360ML';

UPDATE BASE_INICIAL_VENTAS
SET	CodArticulo = '8005796',
	DesArticulo = 'ALACENA MAYONESA EXP 90CC 24DPK'
WHERE CodArticulo = '8005634' AND DesArticulo = 'ALACENA MAYONESA 90CC 24DPK';	

UPDATE BASE_INICIAL_VENTAS
SET	CodAlicorp = '3300141'
WHERE CodAlicorp = '3300154';

UPDATE BASE_INICIAL_VENTAS
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128' ELSE CodAlicorp END;
--Cambiamos los codigos antiguos por los nuevos codigos afo

SET LANGUAGE SPANISH;
--colocamos el periodo actual
DELETE FROM LF_NC_HISTORICO WHERE LEFT(FNC,7) = '2022-09';

ALTER TABLE LF_NC_HISTORICO ALTER COLUMN Importe VARCHAR(100)

BULK INSERT LF_NC_HISTORICO
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\BDPRUEB.csv'
WITH (FIELDTERMINATOR=';', FIRSTROW=2, CODEPAGE='ACP');

UPDATE LF_NC_HISTORICO
SET Importe = REPLACE(Importe, '(', '');

UPDATE LF_NC_HISTORICO
SET Importe = REPLACE(Importe, ')', '');

UPDATE LF_NC_HISTORICO
SET Importe = REPLACE(Importe,',','')
WHERE CHARINDEX(',',Importe) > 0;

ALTER TABLE LF_NC_HISTORICO ALTER COLUMN Importe FLOAT;


SET LANGUAGE US_ENGLISH;

--Colocar los meses que deseamos comparar con el mes actual
TRUNCATE TABLE NOTAS_CREDITO;

INSERT INTO NOTAS_CREDITO
SELECT *
FROM LF_NC_HISTORICO
--WHERE DATEPART(YEAR, FNC)= 2022 AND DATEPART(MONTH, FNC) = 09;


--INSERT INTO NOTAS_CREDITO
--SELECT *
--FROM LF_NC_HISTORICO
--WHERE DATEPART(YEAR, FNC)= 2021 AND DATEPART(MONTH, FNC) = 09;

--INSERT INTO NOTAS_CREDITO
--SELECT *
--FROM LF_NC_HISTORICO
--WHERE DATEPART(YEAR, FNC)= 2022 AND DATEPART(MONTH, FNC) = 08;

DELETE FROM NOTAS_CREDITO WHERE Importe = 0;

--Este c�digo se puede usar si en alg�n momento descargas la informaci�n del b2b en csv
--BULK INSERT LF_NC_HISTORICO
--FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\BDPRUEBA.csv'
--WITH (FIELDTERMINATOR=';', FIRSTROW=2, CODEPAGE='ACP');

--SET LANGUAGE spanish
--UPDATE [LF_NC_HISTORICO] SET FNC = TRIM(FNC)
--UPDATE [LF_NC_HISTORICO] SET FNC = CONVERT(DATE,FNC,107)
--SET LANGUAGE us_english
--UPDATE [LF_NC_HISTORICO] SET importe = TRIM(importe);


UPDATE A SET CodArticulo = TRIM(CodArticulo) FROM NOTAS_CREDITO A;
UPDATE A SET Agencia = TRIM(Agencia) FROM NOTAS_CREDITO A;
UPDATE A SET DesArticulo = TRIM(DesArticulo) FROM NOTAS_CREDITO A;
UPDATE A SET Cliente = TRIM(Cliente) FROM NOTAS_CREDITO A;
UPDATE A SET NCliente = TRIM(NCliente) FROM NOTAS_CREDITO A;

UPDATE NOTAS_CREDITO
SET	CodArticulo = '8005796',
	DesArticulo = 'ALACENA MAYONESA EXP 90CC 24DPK'
WHERE CodArticulo = '8005634' AND DesArticulo = 'ALACENA MAYONESA 90CC 24DPK';

UPDATE NOTAS_CREDITO
SET	DesArticulo = 'INSECTIC SAPOL MOSC/ZANC 360ML C*12'
WHERE DesArticulo = 'INSECTIC SAPOL MOSC/ZANC 360ML';

UPDATE NOTAS_CREDITO
SET	DesArticulo = 'INSECTIC SAPOL PULG/GARR 360ML C*12'
WHERE DesArticulo = 'INSECTIC SAPOL PULG/GARR 360ML';

UPDATE NOTAS_CREDITO
SET	DesArticulo = 'INSECTIC SAPOL MOSC/ZANC 230ML C*12'
WHERE DesArticulo = 'INSECTIC SAPOL MOSC/ZANC 230ML';



UPDATE A
SET A.CodAlicorp = B.CodAlicorp
FROM NOTAS_CREDITO A
	LEFT JOIN TABLA_MATERIALES B ON A.CodArticulo = B.CodFabril AND A.DesArticulo = B.MaterialLaFabril;  
--Asignamos c�digo Alicorp a las notas de cr�dito
--SELECT * FROM NOTAS_CREDITO WHERE CodAlicorp IS NULL;

UPDATE NOTAS_CREDITO
SET CodAlicorp = CASE CodArticulo
	WHEN '8005777' THEN '8312006'
	WHEN '8005653' THEN '3300123'
	ELSE CodAlicorp	END;

UPDATE NOTAS_CREDITO
SET CodAlicorp = CASE DesArticulo
	WHEN 'NUTREG BOLSA SURTIDA 200G 20BO'	THEN	'4335049'
	WHEN 'NUTREG BOLSA SURTIDA 400G 12BO'	THEN	'4335048'
	ELSE CodAlicorp END;

UPDATE NOTAS_CREDITO
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128' ELSE CodAlicorp END;


TRUNCATE TABLE MAESTRO_AGENCIAS;
 
BULK INSERT MAESTRO_AGENCIAS
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\MAESTRO_AGENCIAS.csv'
WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

UPDATE MAESTRO_AGENCIAS SET Agencia = TRIM(Agencia);
UPDATE MAESTRO_AGENCIAS SET NomOficina = TRIM(NomOficina);
UPDATE MAESTRO_AGENCIAS SET CodOficina = TRIM(CodOficina);

--Creo tabla temporal para homologar campos con la tablas NOTAS_CREDITO y BASE_INICIAL_VENTAS
--SELECT * FROM #PLAN  A LEFT JOIN [dbo].[TABLA_MATERIALES] B ON A.CodAlicorp = B.CodAlicorp WHERE A.CodAlicorp IS  NULL

IF OBJECT_ID(N'tempdb..#VENTAS_Y_NOTAS_CREDITO') IS NOT NULL DROP TABLE #VENTAS_Y_NOTAS_CREDITO;
--Creo tabla temporal para unir las ventas, las notas de cr�dito y el plan con los campos que se requiere
SELECT A.FFactura Fecha, A.Agencia Agencia, A.Cliente CodClienteSellOut, A.NomCliente ClienteSellOut,A.NSupervisor Vendedor_Distribuidora, TVendedor Tipo_tienda_Distribuidora, A.CodArticulo CodLaFabril, A.CodAlicorp CodAlicorp,
	   A.FacUnitario, A.TUnidades, 0 Plan_Ton, A.Kilos VentaKil, 0 Plan_Dol, A.Importe VentaDolares, A.GrupoProducto TipoProducto
INTO #VENTAS_Y_NOTAS_CREDITO 
FROM BASE_INICIAL_VENTAS A;  
--SELECT * FROM #VENTAS_Y_NOTAS_CREDITO  WHERE  Plan_Ton =0 AND VentaKil = 0 AND Plan_Dol = 0 AND VentaDolares = 0

INSERT INTO #VENTAS_Y_NOTAS_CREDITO 
SELECT A.FNC Fecha, A.Agencia Agencia, A.Cliente CodClienteSellOut, NCliente ClienteSellOut, 'SIN ASIGNAR - NC' Vendedor_Distribuidora,'SIN ASIGNAR - NC' Tipo_tienda_Distribuidora, A.CodArticulo CodLaFabril, A.CodAlicorp CodAlicorp,
		0 FacUnitario, 0 TUnidades, 0 Plan_Ton, 0 VentaKil, 0 Plan_Dol,  A.Importe VentaDolares, 'MARCAS TERCEROS' TipoProducto
FROM NOTAS_CREDITO  A;

ALTER TABLE #VENTAS_Y_NOTAS_CREDITO ALTER COLUMN Plan_Ton FLOAT;
ALTER TABLE #VENTAS_Y_NOTAS_CREDITO ALTER COLUMN Plan_Dol FLOAT;

 INSERT INTO #VENTAS_Y_NOTAS_CREDITO
 SELECT P.Fecha Fecha, P.Agencia, 'SIN ASIGNAR - LF_PLAN' CodClienteSellOut, 'SIN ASIGNAR - LF_PLAN' ClienteSellOut, 'SIN ASIGNAR - LF_PLAN' Vendedor_Distribuidora, 'SIN ASIGNAR - LF_PLAN' Tipo_tienda_Distribuidora, 'NC' CodLaFabril, P.CodAlicorp CodAlicorp,
		0 FacUnitario, 0 TUnidades, P.Plan_Ton, 0 VentaKil, P.Importe Plan_Dol , 0 VentaDolares, 'MARCAS TERCEROS' TipoProducto
 FROM PLAN_LA_FABRIL P
	--LEFT JOIN MAESTRO_AGENCIAS AG ON P.CodOficina = AG.CodOficina
--SELECT * FROM #VENTAS_Y_NOTAS_CREDITO WHERE codalicorp IS NULL
--Le asigno una fecha al plan, puede ser cualquiere dentro del rango de d�as de venta transcurridos
--El campo CodLaFabril a este punto ya no es necesario por eso le asignamos un valor NC

--- UPDATE A LAS AGENCIAS QUE NO SE ENCUENTRAN EN EL MAESTRO AGENCIAS
UPDATE #VENTAS_Y_NOTAS_CREDITO  
SET Agencia = 'AGG'
WHERE Agencia = 'DCG'

UPDATE #VENTAS_Y_NOTAS_CREDITO
SET Agencia = 'AGM'
WHERE Agencia = 'DCM'

UPDATE #VENTAS_Y_NOTAS_CREDITO
SET Agencia = 'AGM'
WHERE Agencia = 'PTA'

UPDATE #VENTAS_Y_NOTAS_CREDITO
SET Agencia = 'AGA'
WHERE Agencia = 'AMA'
--AMA ES UNA AGENCIA DE AGA


IF OBJECT_ID(N'tempdb..#VENTAS_Y_NOTAS') IS NOT NULL DROP TABLE #VENTAS_Y_NOTAS;
--Creo tabla temporal para darle formato varchar a la fecha
SELECT CONVERT(VARCHAR(20), V.Fecha,103) Fecha, V.Agencia, CodClienteSellOut, ClienteSellOut, V.Vendedor_Distribuidora, V.Tipo_tienda_Distribuidora, V.CodLaFabril, V.CodAlicorp,
	   V.FacUnitario, V.TUnidades,V.Plan_Ton, V.Ventakil, V.Plan_Dol, V.VentaDolares, V.TipoProducto
INTO #VENTAS_Y_NOTAS
FROM #VENTAS_Y_NOTAS_CREDITO V


--Creo tabla temporal para insertar variables Dummies ya que no todas los sku tienen registros suficientes y asi no se desconfigure el excel
--IF OBJECT_ID(N'tempdb..#LAFABRIL_DUMMY') IS NOT NULL DROP TABLE #LAFABRIL_DUMMY;

--SELECT B.Fecha, A.Agencia, C.CodAlicorp
--INTO #LAFABRIL_DUMMY
--FROM (SELECT DISTINCT Agencia FROM #VENTAS_Y_NOTAS) A CROSS JOIN #FECHA B
--CROSS JOIN (SELECT DISTINCT CodAlicorp FROM #VENTAS_Y_NOTAS) C


--INSERT INTO #VENTAS_Y_NOTAS
--SELECT A.Fecha Fecha, A.Agencia Agencia, 'Dummy' CodClienteSellOut, 'Dummy' ClienteSellOut, 'Dummy' Vendedor_Distribuidora, 'Dummy' Tipo_tienda_Distribuidora, 'Dummy' CodLaFabril,  A.CodAlicorp CodAlicorp,
--	   0 FacUnitario, 0 TUnidades, 0  Plan_Ton, 0 Ventakil, 0 Plan_Dol, 0 VentaDolares,
--	   'MARCAS TERCEROS' TipoProducto
--FROM #LAFABRIL_DUMMY A





UPDATE #VENTAS_Y_NOTAS 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%';

UPDATE #VENTAS_Y_NOTAS
SET Agencia = 'NC'
WHERE Agencia = ''

UPDATE #VENTAS_Y_NOTAS
SET Agencia = 'NC'
WHERE Agencia is null;

INSERT INTO DATA_MART_SO_ECUADOR
SELECT F.DES_MES Mes, A.Fecha Dia, 'MAYORISTAS' TipoDistribuidor,
	   M.CodCategoria CodCategoria, M.Categoria Categoria, M.CodFamilia CodFamilia, M.Familia Familia, A.CodAlicorp CodAlicorp, M.Material Material,  M.CodMarca CodMarca, M.Marca Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	  'SIN DATOS' Usuario, A.Vendedor_Distribuidora, A.Tipo_tienda_Distribuidora, A.CodClienteSellOut, A.ClienteSellOut,
	  IIF(A.TipoProducto='MARCAS TERCEROS','Consumo Masivo',A.TipoProducto) Negocio, A.FacUnitario, SUM(ISNULL(A.TUnidades,0)) TUnidades, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL(A.VentaKil,0)/1000) real_ton, SUM(ISNULL(A.Plan_Dol,0)) Plan_Dol, SUM(ISNULL(A.VentaDolares,0)/1000) real_Dolares,
	  M.Plataforma Plataforma

FROM #VENTAS_Y_NOTAS A
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.Agencia = AG.Agencia
GROUP BY F.DES_MES, A.Fecha,
	   M.CodCategoria, M.Categoria, M.CodFamilia, M.Familia, A.CodAlicorp, M.Material , M.CodMarca, M.Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   A.Vendedor_Distribuidora, Tipo_tienda_Distribuidora, A.CodClienteSellOut, A.ClienteSellOut,
	   IIF(A.TipoProducto='MARCAS TERCEROS','Consumo Masivo',A.TipoProducto),A.FacUnitario,
	   M.Plataforma;


--poner hularuss separado minorista y mayorista





























----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

IF OBJECT_ID('VENTAS_CONSOLIDADO') IS NOT NULL DROP TABLE VENTAS_CONSOLIDADO;
--Creo tabla donde consolido la informaci�n de la tabla tablero
--En esta tabla se va a insertar la informaci�n de todas las distribuidoras
SELECT A.Mes, A.Dia,
	   A.CodCategoria, A.Categoria, A.CodFamilia, A.Familia, A.CodMarca, A.Marca, A.CodClienteSellOut, A.ClienteSellOut,
	   A.ZonaV2, A.CodOficina, A.NomOficina, A.CodTerritorio, A.NomTerritorio, A.CodZona, A.NomZona,
	   A.Oficina_Ventas, A.Grupo_Vendedores, A.Territorio, A.Agrupacion_Distribuidora, A.Agencia_Distribuidora, A.Zona_Clientes, A.Grupo_Condiciones,
	   A.Negocio, SUM(A.Plan_Ton) Plan_Ton,
	  SUM(A.real_ton) real_ton, SUM(A.Plan_Dol) Plan_Dol, SUM(A.real_Dolares) real_Dolares,
	  A.Plataforma Plataforma
INTO VENTAS_CONSOLIDADO
FROM DATA_MART_SO_ECUADOR A
GROUP BY A.MES, A.Dia,
	   A.CodCategoria, A.Categoria, A.CodFamilia, A.Familia, A.CodMarca, A.Marca, A.CodClienteSellOut, A.ClienteSellOut,
	   A.ZonaV2, A.CodOficina, A.NomOficina, A.CodTerritorio, A.NomTerritorio, A.CodZona, A.NomZona,
	   A.Oficina_Ventas, A.Grupo_Vendedores, A.Territorio, A.Agrupacion_Distribuidora, A.Agencia_Distribuidora, A.Zona_Clientes, A.Grupo_Condiciones,
	   A.Negocio,
	   A.Plataforma;


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