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

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
--Panales
TRUNCATE TABLE VENDEDORES_PANALES;

BULK INSERT VENDEDORES_PANALES
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\VenderoresPanales.csv'
WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

UPDATE VENDEDORES_PANALES SET Codigo = TRIM(Codigo);

--Esta es la base de ventas de Panales

--Coloco el periodo actual
DELETE FROM BASE_PANALES_HISTORICA WHERE LEFT(Fecha,7) = '2022-07';

BULK INSERT BASE_PANALES_HISTORICA
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\Panales_JUL.txt'
WITH (FIELDTERMINATOR='|',FIRSTROW=2,CODEPAGE='ACP');

--Colocar los meses que deseamos comparar con el mes actual
TRUNCATE TABLE BASE_MOBILVENDOR_AUTOMATICA;

INSERT INTO BASE_MOBILVENDOR_AUTOMATICA
SELECT *
FROM BASE_PANALES_HISTORICA
--WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 07;

--INSERT INTO BASE_MOBILVENDOR_AUTOMATICA
--SELECT *
--FROM BASE_PANALES_HISTORICA
--WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 06;


------------------USAR CUANDO LLEGUE EL 2023------------------------------------------------------
--INSERT INTO BASE_MOBILVENDOR_AUTOMATICA
--SELECT *
--FROM BASE_PANALES_HISTORICA
--WHERE DATEPART(YEAR,Fecha) = PONER AÑOPASADO AND DATEPART(MONTH,Fecha) = PONER MES DE AÑO PASADO;
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


--DELETE FROM BASE_MOBILVENDOR_AUTOMATICA WHERE Agencia IN ('1000029778' )
--ati campaña
--DELETE FROM BASE_MOBILVENDOR_AUTOMATICA WHERE Agencia  NOT IN ('156150253', '156163360', '156131204', '156150076', '156148774', '156117292')
--('156150253', '156163360', '156131204', '156150076')
--PREGUNTAR A DIEGO HASTA CUANDO SERA HARA



--Inserto Codify

SET LANGUAGE SPANISH;

DELETE FROM CODIFY_HISTORICA WHERE LEFT(Fecha,7) = '2022-07';

BULK INSERT CODIFY_HISTORICA
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\CODIFY_JUL.csv'
WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

DELETE FROM CODIFY_HISTORICA WHERE CodAlicorp IS NULL;

TRUNCATE TABLE CODIFY;

ALTER TABLE CODIFY ALTER COLUMN VentaDolares VARCHAR(100);
ALTER TABLE CODIFY ALTER COLUMN VentaTon VARCHAR(100);


INSERT INTO CODIFY
SELECT *
FROM CODIFY_HISTORICA
--WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 07;

--INSERT INTO CODIFY
--SELECT *
--FROM CODIFY_HISTORICA
--WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 06;



------------------USAR CUANDO LLEGUE EL 2023------------------------------------------------------
--INSERT INTO CODIFY
--SELECT *
--FROM CODIFY_HISTORICA
--WHERE DATEPART(YEAR,Fecha) = PONER AÑOPASADO AND DATEPART(MONTH,Fecha) = PONER MES DE AÑO PASADO; 
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

SELECT CONVERT(VARCHAR(20), A.Fecha,103) Fecha, A.Agencia Agencia, [Codigo Cliente] CodClienteSellOut, [Nombre Cliente] ClienteSellOut, V.Nombre Vendedor_Distribuidora, A.TipoNegocio Tipo_tienda_Distribuidora, A.CodAlicorp CodAlicorp,
	   M.FacUnitario FacUnitario, A.Cantidad TUnidades, 0  Plan_Ton, (M.PesoTon)*(A.Cantidad) VentaTon, 0 Plan_Dol, A.Importe VentaDolares,
	   'Consumo Masivo' Negocio
INTO #PANALES
FROM BASE_MOBILVENDOR_AUTOMATICA A
	LEFT JOIN VENDEDORES_PANALES V ON A.Usuario = V.Codigo
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp;

INSERT INTO #PANALES
SELECT CONVERT(VARCHAR(20), A.Fecha,103) Fecha, A.Agencia Agencia, A.CodClienteSellOut CodClienteSellOut, 'SIN ASIGNAR - CODIFY' ClienteSellOut, 'SIN ASIGNAR - CODIFY' Vendedor_Distribuidora, 'SIN ASIGNAR - CODIFY' Tipo_tienda_Distribuidora, A.CodAlicorp CodAlicorp,
	   M.FacUnitario FacUnitario, A.TUnidades TUnidades, 0  Plan_Ton, A.VentaTon VentaTon, 0 Plan_Dol, A.VentaDolares VentaDolares,
	   'Consumo Masivo' Negocio
FROM CODIFY A
   	 LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp;

DELETE FROM #PANALES WHERE   FacUnitario is null
--SELECT  sum(VentaDolares)   FROM #PANALES WHERE   FacUnitario is null and RIGHT(Fecha,7) = '07/2022'
--SELECT  distinct  agencia, CodAlicorp  FROM #PANALES WHERE   FacUnitario is null and RIGHT(Fecha,7) = '07/2022' agencia in ('156150253', '156163360', '156131204', '156150076') = '8410177' VentaTon=0 AND VentaDolares= 0 AND Plan_Dol = 0
DELETE FROM #PANALES WHERE CodAlicorp IN ('AD0220', 'AD0221', 'AD0224', 'AD0225', 'AD0226', 'AD0227', 'AD0228', 'AD0229', 'AD0230', 'AD0231', 'AD0232', 'AD0233', 'AD0234', 'AD0241', 'AD0242', 'AD0243', 'AD0246', 'AD0247',
                                          'AD0248', 'Ali001', 'Ali002', 'Ali003', 'Ali005', 'Ali007', 'Ali008', 'Ali009', 'Ali011', 'Ali013', 'Ali015', 'Ali016', 'Ali017', 'Ali10', 'AD0219', 'AD0215', 'AD0218', 'Ali006',
										  'AD0217', 'ESPAPROM', 'AD0103', 'AD239', 'Ali014', 'ALIC063', 'H450C200', 'H523B017', 'H523B222', 'H523B223', 'P.33001461', '617080', '688320', '484168', '29116B', '453-G', '648-001', 'AMB360',
										  'H180-G', 'MY', 'SP', 'TALL', 'AD0058', 'GLL','AD0250', 'AD0249', 'AD0251', 'CL001' )

ALTER TABLE #PANALES ALTER COLUMN Plan_Ton FLOAT;
ALTER TABLE #PANALES ALTER COLUMN VentaTon FLOAT;
ALTER TABLE #PANALES ALTER COLUMN Plan_Dol FLOAT;

--Creo tabla temporal para insertar variables Dummies ya que no todas los sku tienen registros suficientes y asi no se desconfigure el excel

IF OBJECT_ID(N'tempdb..#PANALES_DUMMY1') IS NOT NULL DROP TABLE #PANALES_DUMMY1;

SELECT B.Fecha, A.Agencia, C.CodAlicorp
INTO #PANALES_DUMMY1 
FROM (SELECT DISTINCT Agencia FROM #PANALES) A CROSS JOIN #FECHA B
CROSS JOIN (SELECT DISTINCT CodAlicorp FROM #PANALES) C

--INSERT INTO #PANALES
--SELECT A.Fecha Fecha, A.Agencia Agencia, 'Dummy' CodClienteSellOut, 'Dummy' ClienteSellOut, 'Dummy' Vendedor_Distribuidora, 'Dummy' Tipo_tienda_Distribuidora, A.CodAlicorp CodAlicorp,
--	   0 FacUnitario, 0 TUnidades, 0  Plan_Ton, 0 VentaTon, 0 Plan_Dol, 0 VentaDolares,
--	   'Consumo Masivo' Negocio
--FROM #PANALES_DUMMY1 A


--Ingreso los planes

TRUNCATE TABLE PLAN_PANALES;

BULK INSERT PLAN_PANALES
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_PANALES_JUL.csv'
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
	   WHERE Agencia_Distribuidora IN ('CONTRERAS DELGADO WASHINGTON BENEDI')

--DELETE FROM PLAN_PANALES
--	   WHERE Agencia_Distribuidora IN ('CONTRERAS DELGADO WASHINGTON BENEDI','ATI CAMPAÑA FLAVIA MARINA')
			 


UPDATE PLAN_PANALES
SET CodMarca = RIGHT(CodMarca,1)
WHERE CodMarca LIKE '00%';

UPDATE PLAN_PANALES
SET CodMarca = RIGHT(CodMarca,2)
WHERE CodMarca LIKE '0%';
-- Debido a que cuando subo la información del csv se agrega un cero a la izquierda


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
INSERT INTO #PANALES_DUMMY1
SELECT B.Fecha, A.Agencia, C.CodAlicorp
FROM  (SELECT F.Agencia FROM (SELECT DISTINCT Agencia_Distribuidora FROM PLAN_PANALES) D LEFT JOIN MAESTRO_AGENCIAS F ON D.Agencia_Distribuidora = F.Agencia_Distribuidora)  A CROSS JOIN #FECHA B
CROSS JOIN (SELECT DISTINCT CodAlicorp FROM PLAN_PANALES) C


TRUNCATE TABLE PLAN_2MAYA;

BULK INSERT PLAN_2MAYA
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_2MAYA_JUL.csv'
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
			 IN ('OLGER ARMIJOS DISTRIBUCIONES S.A.S', 'FREDVY S.A.',
			 'PRODISPRO PROVEEDORA Y DISTRIBUIDOR', 'REPRESENTACIONES J.LEONARDO SORIA')

UPDATE PLAN_2MAYA
SET CodMarca = RIGHT(CodMarca,1)
WHERE CodMarca LIKE '00%';

UPDATE PLAN_2MAYA
SET CodMarca = RIGHT(CodMarca,2)
WHERE CodMarca LIKE '0%';
-- Debido a que cuando subo la información del csv se agrega un cero a la izquierda


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

INSERT INTO #PANALES_DUMMY1
SELECT B.Fecha, A.Agencia, C.CodAlicorp
FROM  (SELECT F.Agencia FROM (SELECT DISTINCT Agencia_Distribuidora FROM PLAN_2MAYA) D LEFT JOIN MAESTRO_AGENCIAS F ON D.Agencia_Distribuidora = F.Agencia_Distribuidora)  A CROSS JOIN #FECHA B
CROSS JOIN (SELECT DISTINCT CodAlicorp FROM PLAN_2MAYA) C


INSERT INTO #PANALES
SELECT A.Fecha Fecha, A.Agencia Agencia, 'Dummy' CodClienteSellOut, 'Dummy' ClienteSellOut, 'Dummy' Vendedor_Distribuidora, 'Dummy' Tipo_tienda_Distribuidora, A.CodAlicorp CodAlicorp,
	   0 FacUnitario, 0 TUnidades, 0  Plan_Ton, 0 VentaTon, 0 Plan_Dol, 0 VentaDolares,
	   'Consumo Masivo' Negocio
FROM #PANALES_DUMMY1 A


UPDATE #PANALES 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%'

--------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
-- Para el proyecto de tablero
IF OBJECT_ID('VENTAS_TABLERO') IS NOT NULL DROP TABLE VENTAS_TABLERO;

SELECT F.DES_MES Mes, A.Fecha Dia,
	   M.CodCategoria CodCategoria, M.Categoria Categoria, M.CodFamilia CodFamilia, M.Familia Familia, M.CodAlicorp CodAlicorp, M.Material Material, M.CodMarca CodMarca, M.Marca Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   A.Vendedor_Distribuidora, A.Tipo_tienda_Distribuidora, A.CodClienteSellOut, A.ClienteSellOut,
	   A.Negocio, A.FacUnitario, SUM(ISNULL(A.TUnidades,0)) TUnidades, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL(A.VentaTon,0)) real_ton, SUM(ISNULL(A.Plan_Dol,0)) Plan_Dol, SUM(ISNULL(A.VentaDolares,0)/1000) real_Dolares,
	  M.Plataforma Plataforma
INTO VENTAS_TABLERO
FROM #PANALES A
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.Agencia = AG.Agencia
GROUP BY F.DES_MES, A.Fecha,
	   M.CodCategoria, M.Categoria, M.CodFamilia, M.Familia, M.CodAlicorp, M.Material, M.CodMarca, M.Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   A.Vendedor_Distribuidora, A.Tipo_tienda_Distribuidora, CodClienteSellOut, ClienteSellOut,
	   A.Negocio,A.FacUnitario, M.Plataforma;


--Inserto el Plan de Panales
--Para el proyecto tablero

INSERT INTO VENTAS_TABLERO
SELECT F.DES_MES Mes, A.Fecha Dia,
	   A.CodCategoria CodCategoria, A.Categoria Categoria, A.CodFamilia CodFamilia, A.Familia Familia, A.CodAlicorp CodAlicorp, A.Des_Material Material, A.CodMarca CodMarca, A.Marca Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   'SIN ASIGNAR - PA_PLAN ' Vendedor_Distribuidora, 'SIN ASIGNAR - PA_PLAN ' Tipo_tienda_Distribuidora, 'SIN ASIGNAR - PA_PLAN ' CodClienteSellOut, 'SIN ASIGNAR - PA_PLAN ' ClienteSellOut,
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
INSERT INTO VENTAS_TABLERO
SELECT F.DES_MES Mes, A.Fecha Dia,
	   A.CodCategoria CodCategoria, A.Categoria Categoria, A.CodFamilia CodFamilia, A.Familia Familia, A.CodAlicorp CodAlicorp, A.Des_Material Material, A.CodMarca CodMarca, A.Marca Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   'SIN ASIGNAR - PA_PLAN ' Vendedor_Distribuidora, 'SIN ASIGNAR - PA_PLAN ' Tipo_tienda_Distribuidora, 'SIN ASIGNAR - PA_PLAN ' CodClienteSellOut, 'SIN ASIGNAR - PA_PLAN ' ClienteSellOut,
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

--Coloco el mes en curso
DELETE FROM HULARUSS_HISTORICO WHERE LEFT(Fecha,7) = '2022-07';


--ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN Importe VARCHAR(100);
ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN VentaKilos VARCHAR(100);
ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN importe VARCHAR(100);
ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN Cantidad VARCHAR(100);

DECLARE @HULARUSS VARCHAR(MAX);
SELECT @HULARUSS = BULKCOLUMN FROM 
OPENROWSET(BULK 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\JUL.json', SINGLE_BLOB) JSON;
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
WHERE YEAR(Fecha) = 2022 AND MONTH(Fecha) = 07;


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
--WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 07;

--INSERT INTO VENTAS_HULARUSS
--SELECT *
--FROM HULARUSS_HISTORICO
--WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 06;

------------------USAR CUANDO LLEGUE EL 2023------------------------------------------------------
--INSERT INTO VENTAS_HULARUSS
--SELECT *
--FROM HULARUSS_HISTORICO
--WHERE DATEPART(YEAR,Fecha) = PONER AÑOPASADO AND DATEPART(MONTH,Fecha) = PONER MES DE AÑO PASADO;
-----------------------------------------------------------------------------------------------------------

UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM VENTAS_HULARUSS A;
UPDATE A SET Agencia = TRIM(Agencia) FROM VENTAS_HULARUSS A;
UPDATE A SET Empaque = TRIM(Empaque) FROM VENTAS_HULARUSS A;
UPDATE A SET CodClienteSellOut = TRIM(CodClienteSellOut) FROM VENTAS_HULARUSS A
UPDATE A SET Canal = TRIM(Canal) FROM VENTAS_HULARUSS A

UPDATE VENTAS_HULARUSS SET CodAlicorp = REPLACE(CodAlicorp, 'A', '')



--UPDATE A SET Importe = TRIM(Importe) FROM VENTAS_HULARUSS A;

--UPDATE A SET Importe = REPLACE(Importe,'$','') FROM VENTAS_HULARUSS A;
--UPDATE A SET Importe = REPLACE(Importe,',','') FROM VENTAS_HULARUSS A;
-- Si en en algun momento en algun campo numero no se puede cargar la data repetir el caso de importe

--ALTER TABLE VENTAS_HULARUSS ALTER COLUMN Importe FLOAT;

--DELETE FROM VENTAS_HULARUSS WHERE Importe = 0; Esperar a ver que dice sobre las importes negativos
DELETE FROM VENTAS_HULARUSS WHERE CodAlicorp LIKE '%PROMO%';
DELETE FROM VENTAS_HULARUSS WHERE Importe IS NULL;

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
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;
-- 293369 este error solo sale en la data de ventas de Panales

UPDATE A SET A.Cantidad = A.Cantidad*M.FacUnitario FROM VENTAS_HULARUSS A
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
	WHERE Empaque <> 'Unidad'


UPDATE A SET A.Ventakilos = (A.Cantidad * M.PesoKG) FROM VENTAS_HULARUSS A 
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
	WHERE A.Ventakilos = 0

UPDATE A SET A.Canal = 'MINORISTAS' FROM VENTAS_HULARUSS A 
	WHERE  A.Canal = 'TAT'


--Creo tabla temporal para homologar los campos y darle formato a la fecha, tambien calculo las toneladas
IF OBJECT_ID(N'tempdb..#HULARUSS') IS NOT NULL DROP TABLE #HULARUSS;

SELECT CONVERT(VARCHAR(20), A.Fecha,103) Fecha, A.Agencia Agencia, 'H-SIN ASIGNAR' Vendedor_Distribuidora, 'H-SIN ASIGNAR' Tipo_tienda_Distribuidora, A.CodClienteSellOut, A.CodAlicorp CodAlicorp,
	   M.FacUnitario FacUnitario, A.Cantidad TUnidades, 0  Plan_Ton, VentaKilos VentaKil, 0 Plan_Dol, A.Importe VentaDolares,
	   'Consumo Masivo' Negocio
INTO #HULARUSS
--SELECT *
FROM VENTAS_HULARUSS A
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
WHERE A.Canal = 'MINORISTAS';
--SELECT * FROM #HULARUSS WHERE  FacUnitario is null VentaKil=0 AND VentaDolares= 0 AND Plan_Dol = 0 AND Plan_Ton = 0
--Solo deben salir 28 rows por los datos ficticios simpre y cuando lo corra desde la línea donde se agregan

--Creo tabla temporal para insertar variables Dummies ya que no todas los sku tienen registros suficientes y asi no se desconfigure el excel
IF OBJECT_ID(N'tempdb..#HULARUSS_DUMMY') IS NOT NULL DROP TABLE #HULARUSS_DUMMY;

SELECT B.Fecha, A.Agencia, C.CodAlicorp
INTO #HULARUSS_DUMMY
FROM (SELECT DISTINCT Agencia FROM #HULARUSS) A CROSS JOIN #FECHA B
CROSS JOIN (SELECT DISTINCT CodAlicorp FROM #HULARUSS) C


ALTER TABLE #HULARUSS ALTER COLUMN Plan_Ton FLOAT;
ALTER TABLE #HULARUSS ALTER COLUMN Plan_Dol FLOAT;


--Inserto plan Hularuss
--TRUNCATE TABLE PLAN_HULARUSS;

--BULK INSERT PLAN_HULARUSS
--FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLANES_HULARUSS_JUN.csv'
--WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

--UPDATE A SET Fecha = REPLACE(Fecha, '.', '/') FROM PLAN_HULARUSS A;
--UPDATE A SET Ventas_Reales = 0 FROM PLAN_HULARUSS A;
--UPDATE A SET Ventas_Ton = 0 FROM PLAN_HULARUSS A;

--DELETE PLAN_HULARUSS WHERE Plan_Dol = 0 AND Plan_Ton = 0;
--DELETE FROM PLAN_HULARUSS WHERE Plan_Dol IS NULL AND Plan_Ton IS NULL;
--DELETE FROM PLAN_HULARUSS WHERE Plan_Dol = '' AND Plan_Ton = '';

--UPDATE A SET CodCategoria = TRIM(CodCategoria) FROM PLAN_HULARUSS A;
--UPDATE A SET Categoria = TRIM(Categoria) FROM PLAN_HULARUSS A;
--UPDATE A SET CodMarca = TRIM(CodMarca) FROM PLAN_HULARUSS A;
--UPDATE A SET Marca = TRIM(Marca) FROM PLAN_HULARUSS A;
--UPDATE A SET CodFamilia = TRIM(CodFamilia) FROM PLAN_HULARUSS A;
--UPDATE A SET Familia = TRIM(Familia) FROM PLAN_HULARUSS A;
--UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM PLAN_HULARUSS A;
--UPDATE A SET Des_Material = TRIM(Des_Material) FROM PLAN_HULARUSS A;
--UPDATE A SET NomOficina = TRIM(NomOficina) FROM PLAN_HULARUSS A;
--UPDATE A SET Plataforma = TRIM(Plataforma) FROM PLAN_HULARUSS A;
--UPDATE A SET Cliente = TRIM(Cliente) FROM PLAN_HULARUSS A;

--UPDATE PLAN_HULARUSS
--SET CodMarca = RIGHT(CodMarca,1)
--WHERE CodMarca LIKE '00%';

--UPDATE PLAN_HULARUSS
--SET CodMarca = RIGHT(CodMarca,2)
--WHERE CodMarca LIKE '0%';
---- Debido a que cuando subo la información del csv se agrega un cero a la izquierda


--UPDATE PLAN_HULARUSS 
--SET Fecha = RIGHT(Fecha,9)
--WHERE Fecha LIKE '0_/%'


--UPDATE PLAN_HULARUSS
--SET CodAlicorp = CASE CodAlicorp
--	WHEN '8309000' THEN '8309119'
--	WHEN '8309001' THEN '8309120'
--	WHEN '8309002' THEN '8309121'
--	WHEN '8309003' THEN '8309122'
--	WHEN '8309007' THEN '8309126'
--	WHEN '8309009' THEN '8309128'
--	WHEN '293369' THEN '29369' ELSE CodAlicorp END;
----nuevo
----preguntar hasta cuando sera este update
--UPDATE PLAN_HULARUSS
--SET Cliente = '1000029726'
--WHERE Cliente = '1000029761';

--UPDATE PLAN_HULARUSS
--SET Cliente = '1000029732'
--WHERE Cliente = '1000029671';


--INSERT INTO #HULARUSS_DUMMY
--SELECT B.Fecha, A.Agencia, C.CodAlicorp
--FROM  (SELECT F.Agencia FROM (SELECT DISTINCT Cliente FROM PLAN_HULARUSS) D LEFT JOIN MAESTRO_AGENCIAS F ON D.Cliente = F.CodOficina)  A CROSS JOIN #FECHA B
--CROSS JOIN (SELECT DISTINCT CodAlicorp FROM PLAN_HULARUSS) C




SET LANGUAGE US_ENGLISH;

TRUNCATE TABLE NuevoPlanHularussFormato;

BULK INSERT NuevoPlanHularussFormato
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_HULARUSS_JUL.csv'
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

IF OBJECT_ID(N'tempdb..#HULARUSS_PLAN_NUEVO_MINOR') IS NOT NULL DROP TABLE #HULARUSS_PLAN_NUEVO_MINOR;

SELECT CONVERT(VARCHAR(20),A.Fecha,103) Fecha, A.Canal Canal, A.CodAlicorp CodAlicorp, A.NomOficina, A.MontoCantidad Plan_Ton, B.MontoCantidad Plan_Dol
INTO #HULARUSS_PLAN_NUEVO_MINOR
FROM #HULARUSS_PLAN_NUEVO_TON A 
	LEFT JOIN #HULARUSS_PLAN_NUEVO_DOL B ON A.CodAlicorp = B.CodAlicorp AND A.NomOficina = B.NomOficina AND A.Canal = B.Canal AND A.Fecha = B.Fecha
WHERE A.Canal = 'MINORISTAS'

DELETE #HULARUSS_PLAN_NUEVO_MINOR WHERE Plan_Dol = 0 AND Plan_Ton = 0;

UPDATE #HULARUSS_PLAN_NUEVO_MINOR 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%'

--select * from #HULARUSS_PLAN_NUEVO_MINOR

UPDATE #HULARUSS_PLAN_NUEVO_MINOR
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128'
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;

INSERT INTO #HULARUSS_DUMMY
SELECT B.Fecha, A.Agencia, C.CodAlicorp
FROM  (SELECT F.Agencia FROM (SELECT DISTINCT NomOficina FROM #HULARUSS_PLAN_NUEVO_MINOR) D LEFT JOIN MAESTRO_AGENCIAS F ON D.NomOficina = F.NomOficina)  A CROSS JOIN #FECHA B
CROSS JOIN (SELECT DISTINCT CodAlicorp FROM #HULARUSS_PLAN_NUEVO_MINOR) C



--select SUM(Plan_Ton) FROM #HULARUSS_PLAN_NUEVO_MAYOR


INSERT INTO #HULARUSS
SELECT A.Fecha Fecha, A.Agencia Agencia, 'Dummy' Vendedor_Distribuidora, 'Dummy' Tipo_tienda_Distribuidora, 'Dummy' CodClienteSellOut, A.CodAlicorp CodAlicorp,
	   0 FacUnitario, 0 TUnidades, 0  Plan_Ton, 0 Ventakil, 0 Plan_Dol, 0 VentaDolares,
	   'Consumo Masivo' Negocio
FROM #HULARUSS_DUMMY A


UPDATE #HULARUSS 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%'

-- Para el proyecto de tablero

INSERT INTO VENTAS_TABLERO
SELECT F.DES_MES Mes, A.Fecha Dia,
	   M.CodCategoria CodCategoria, M.Categoria Categoria, M.CodFamilia CodFamilia, M.Familia Familia, A.CodAlicorp CodAlicorp, M.Material Material, M.CodMarca CodMarca, M.Marca Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   A.Vendedor_Distribuidora, A.Tipo_tienda_Distribuidora, A.CodClienteSellOut, 'SIN ASIGNAR - HU ' ClienteSellOut,
	   A.Negocio, A.FacUnitario, SUM(ISNULL(A.TUnidades,0)) TUnidades, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL(A.VentaKil,0)/1000) real_ton, SUM(ISNULL(A.Plan_Dol,0)) Plan_Dol, SUM(ISNULL(A.VentaDolares,0)/1000) real_Dolares,
	  M.Plataforma Plataforma
FROM #HULARUSS A
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.Agencia = AG.Agencia
GROUP BY F.DES_MES, A.Fecha,
	   M.CodCategoria, M.Categoria, M.CodFamilia, M.Familia, A.CodAlicorp, M.Material, M.CodMarca, M.Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   A.Vendedor_Distribuidora, A.Tipo_tienda_Distribuidora, A.CodClienteSellOut,
	   A.Negocio,A.FacUnitario, M.Plataforma;


--Inserto el Plan de Hularuss

------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
--Para el proyecto tablero

--INSERT INTO VENTAS_TABLERO
--SELECT F.DES_MES Mes, A.Fecha Dia,
--	   A.CodCategoria CodCategoria, A.Categoria Categoria, A.CodFamilia CodFamilia, A.Familia Familia, A.CodAlicorp CodAlicorp, A.Des_Material Material, A.CodMarca CodMarca, A.Marca Marca,
--	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
--	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
--	   'SIN ASIGNAR - HU_PLAN ' Vendedor_Distribuidora, 'SIN ASIGNAR - HU_PLAN ' Tipo_tienda_Distribuidora, 'SIN ASIGNAR - HU' CodClienteSellOut, 'SIN ASIGNAR - HU' ClienteSellOut,
--	   'Consumo Masivo' Negocio, 0 FacUnitario, 0 TUnidades, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
--	  SUM(ISNULL(A.Ventas_Ton,0)) real_ton, SUM(ISNULL(A.Plan_Dol,0)) Plan_Dol, SUM(ISNULL(A.Ventas_Reales,0)) real_Dolares,
--	  A.Plataforma Plataforma
--FROM PLAN_HULARUSS A
--	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
--	LEFT JOIN MAESTRO_AGENCIAS AG ON A.Cliente = AG.CodOficina
--GROUP BY F.DES_MES, A.Fecha,
--	   A.CodCategoria, A.Categoria, A.CodFamilia, A.Familia, A.CodAlicorp, A.Des_Material, A.CodMarca, A.Marca,
--	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
--	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
--	   A.Plataforma;




INSERT INTO VENTAS_TABLERO
SELECT F.DES_MES Mes, A.Fecha Dia,
	   M.CodCategoria CodCategoria, M.Categoria Categoria, M.CodFamilia CodFamilia, M.Familia Familia, A.CodAlicorp CodAlicorp, M.Material Material, M.CodMarca CodMarca, M.Marca Marca,
	   AG.ZonaV2, AG.CodOficina, A.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   'SIN ASIGNAR - HU_PLAN ' Vendedor_Distribuidora, 'SIN ASIGNAR - HU_PLAN ' Tipo_tienda_Distribuidora, 'SIN ASIGNAR - HU' CodClienteSellOut, 'SIN ASIGNAR - HU' ClienteSellOut,
	   'Consumo Masivo' Negocio, 0 FacUnitario, 0 TUnidades, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  0 real_ton, SUM(ISNULL(A.Plan_Dol/1000,0)) Plan_Dol, 0 real_Dolares,
	  M.Plataforma Plataforma
FROM #HULARUSS_PLAN_NUEVO_MINOR A
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.NomOficina = AG.NomOficina
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
GROUP BY F.DES_MES, A.Fecha,
	   M.CodCategoria, M.Categoria, M.CodFamilia, M.Familia, A.CodAlicorp, M.Material, M.CodMarca, M.Marca,
	   AG.ZonaV2, AG.CodOficina, A.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   M.Plataforma;
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
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

--IF OBJECT_ID('DBO.TMP_SELL_OUT_21') IS NOT NULL DROP TABLE DBO.TMP_SELL_OUT_21;
----Creo tabla final donde se van a elaborar todos los indicadores
--SELECT *
--INTO TMP_SELL_OUT_21
--FROM (SELECT A.Mes "MES", 'Sem' "Semana", A.DIA DIA, B.DIA_2 dia_2,
--      CONCAT(A.CodCategoria,' ', A.Categoria) "Categoria",
--      A.Negocio Negocio,
--      CONCAT(A.CodFamilia,' ',A.Familia) Familia, CONCAT(A.CodMarca,' ',A.Marca) Marca,
--      A.Oficina_Ventas, A.Grupo_Vendedores, A.Territorio, A.Agrupacion_Distribuidora, A.Agencia_Distribuidora, A.Zona_Clientes, A.Grupo_Condiciones,
--      A.Plan_Ton plan_ton, A.real_ton real_ton, A.Plan_Dol plan_dol, A.real_Dolares real_dol,
--      A.real_ton/@dm1 * @DMAX	 PROY_LIN_TON, A.real_Dolares/@dm1 * @DMAX	PROY_LIN_DOL, 0 PROY_TON, 0 PROY_DOL,
--      B.ANIO ANIO, B.SEM SEM, B.MES MES2,
--      CASE WHEN B.PER=@M1 AND TRY_CONVERT(DATE, A.Dia, 103) <=TRY_CONVERT(DATE,@d1,103) THEN  A.real_ton/@dm1 
--           WHEN B.PER=@M2  AND TRY_CONVERT(date, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN  A.real_ton/@dm2 
--           WHEN B.PER=@M3  AND TRY_CONVERT(date, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  A.real_ton/@dm3 END  PROM_AV,
---- PROMEDIO AL AVANCE TONELADAS
--	  CASE WHEN B.PER=@M1 AND B.SEM LIKE '%1 AL 7%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103) THEN  IIF(@ds1=0,null,A.real_ton/@ds1 )
--		   WHEN B.PER=@M1 AND B.SEM LIKE '%8 AL 14%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103) THEN  IIF(@ds2=0,null,A.real_ton/@ds2 )
--		   WHEN B.PER=@M1 AND B.SEM LIKE '%15 AL 21%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103) THEN  IIF(@ds3=0,null,A.real_ton/@ds3 )
--		   WHEN B.PER=@M1 AND B.SEM LIKE '%22 AL 31%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103) THEN  IIF(@ds4=0,null,A.real_ton/@ds4 )
--		   WHEN B.PER=@M2 AND B.SEM LIKE '%1 AL 7%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN IIF(@ds5=0,null,A.real_ton/@ds5)
--		   WHEN B.PER=@M2 AND B.SEM LIKE '%8 AL 14%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN  IIF(@ds6=0,null,A.real_ton/@ds6 )
--		   WHEN B.PER=@M2 AND B.SEM LIKE '%15 AL 21%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN IIF(@ds7=0,null,A.real_ton/@ds7 )
--		   WHEN B.PER=@M2 AND B.SEM LIKE '%22 AL 31%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN  IIF(@ds8=0,null,A.real_ton/@ds8 )
--		   WHEN B.PER=@M3 AND B.SEM LIKE '%1 AL 7%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  IIF(@ds9=0,null,A.real_ton/@ds9)
--		   WHEN B.PER=@M3 AND B.SEM LIKE '%8 AL 14%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  IIF(@ds10=0,null,A.real_ton/@ds10 )
--		   WHEN B.PER=@M3 AND B.SEM LIKE '%15 AL 21%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  IIF(@ds11=0,null,A.real_ton/@ds11 )
--		   WHEN B.PER=@M3 AND B.SEM LIKE '%22 AL 31%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  IIF(@ds12=0,null,A.real_ton/@ds12 ) END  PROM_SEM,
---- PROMEDIO SEMANAL TONELADAS
--	  CASE WHEN  @DMAX=@dm1 THEN A.Plan_Ton - A.real_ton ELSE (A.Plan_Ton - A.real_ton)/(@DMAX-@dm1) END OBJ_DIA,
---- OBJETIVO DIARIO TONELADAS
--	  CASE WHEN  @DMAX=@dm1 THEN (A.Plan_Ton - A.real_ton) - A.real_ton/@dm1 ELSE (A.Plan_Ton - A.real_ton)/(@DMAX-@dm1) - A.real_ton/@dm1 END INCREMENTO_TON,
----INCREMENTO_TON
--	  CASE WHEN B.PER=@M1  AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103)  THEN  A.real_Dolares/@dm1 
--		   WHEN B.PER=@M2  AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103)  THEN  A.real_Dolares/@dm2 
--		   WHEN B.PER=@M3  AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103)  THEN  A.real_Dolares/@dm3 END  PROM_AV_DOL,
---- PROMEDIO AL AVANCE DOLARES
--	  CASE WHEN B.PER=@M1 AND B.SEM LIKE '%1 AL 7%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103) THEN IIF(@ds1=0,null,A.real_Dolares/@ds1)
--		   WHEN B.PER=@M1 AND B.SEM LIKE '%8 AL 14%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103)THEN  IIF(@ds2=0,null,A.real_Dolares/@ds2)
--		   WHEN B.PER=@M1 AND B.SEM LIKE '%15 AL 21%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103) THEN  IIF(@ds3=0,null,A.real_Dolares/@ds3)
--		   WHEN B.PER=@M1 AND B.SEM LIKE '%22 AL 31%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d1,103) THEN  IIF(@ds4=0,null,A.real_Dolares/@ds4)
--		   WHEN B.PER=@M2 AND B.SEM LIKE '%1 AL 7%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN  IIF(@ds5=0,null,A.real_Dolares/@ds5)
--		   WHEN B.PER=@M2 AND B.SEM LIKE '%8 AL 14%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN  IIF(@ds6=0,null,A.real_Dolares/@ds6)
--		   WHEN B.PER=@M2 AND B.SEM LIKE '%15 AL 21%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN  IIF(@ds7=0,null,A.real_Dolares/@ds7)
--		   WHEN B.PER=@M2 AND B.SEM LIKE '%22 AL 31%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d2,103) THEN  IIF(@ds8=0,null,A.real_Dolares/@ds8)
--		   WHEN B.PER=@M3 AND B.SEM LIKE '%1 AL 7%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  IIF(@ds9=0,null,A.real_Dolares/@ds9)
--		   WHEN B.PER=@M3 AND B.SEM LIKE '%8 AL 14%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  IIF(@ds10=0,null,A.real_Dolares/@ds10)
--		   WHEN B.PER=@M3 AND B.SEM LIKE '%15 AL 21%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  IIF(@ds11=0,null,A.real_Dolares/@ds11)
--		   WHEN B.PER=@M3 AND B.SEM LIKE '%22 AL 31%' AND TRY_CONVERT(DATE, A.Dia,103) <=TRY_CONVERT(DATE,@d3,103) THEN  IIF(@ds12=0,null,A.real_Dolares/@ds12) END  PROM_SEM_DOL,
---- PROMEDIO SEMANAL DOLARES
--	  CASE WHEN  @DMAX=@dm1 THEN A.Plan_Dol - A.real_Dolares ELSE (A.Plan_Dol - A.real_Dolares)/(@DMAX-@dm1) END OBJ_DIA_DOL,
----- OBJETIVO DIARIO DOLARES
--	  CASE WHEN  @DMAX=@dm1 THEN (A.Plan_Dol - A.real_Dolares) - A.real_Dolares/@dm1 ELSE (A.Plan_Dol- A.real_Dolares)/(@DMAX-@dm1) - A.real_Dolares/@dm1 END INCREMENTO_DOL,
----INCREMENTO_DOLARES
--	  CASE WHEN B.PER = @M1 THEN A.real_ton/@dm1 
--		   WHEN B.PER = @M2 THEN A.real_ton/@DMAX2 
--		   WHEN B.PER = @M3 THEN A.real_ton/@DMAX3 END prom_mes,
----VENTA PROMEDIO MENSUAL TONELADAS
--	  CASE WHEN B.PER = @M1 THEN A.real_Dolares/@dm1 
--		   WHEN B.PER = @M2 THEN A.real_Dolares/@DMAX2 
--		   WHEN B.PER = @M3 THEN A.real_Dolares/@DMAX3 END prom_mes_dol,
----VENTA PROMEDIO MENSUAL DOLARES
--	  A.Plataforma as Plataforma
--FROM VENTAS_CONSOLIDADO  A 
--	 LEFT JOIN BD_FECHAS  B ON A.DIA = B.DIA) A 
--WHERE A.ANIO IS NOT NULL ;