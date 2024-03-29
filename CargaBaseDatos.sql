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

TRUNCATE TABLE PLAN_LA_FABRIL;

BULK INSERT PLAN_LA_FABRIL
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_LA_FABRIL_JUN.csv'
WITH (FIELDTERMINATOR=';', FIRSTROW=2, CODEPAGE='ACP');

DELETE [PLAN_LA_FABRIL] WHERE Plan_Ton = 0 AND Importe = 0;

UPDATE PLAN_LA_FABRIL SET Agencia = TRIM(Agencia);
UPDATE PLAN_LA_FABRIL SET CodAlicorp = TRIM(CodAlicorp);


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
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\BDPRUEBAVENTAS_JUN.csv'
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
DELETE FROM LF_VENTAS_HISTORICO WHERE LEFT(FFactura,7) = '2022-06';

INSERT INTO LF_VENTAS_HISTORICO
SELECT *
FROM BASE_INICIAL_CARGA;

SET LANGUAGE US_ENGLISH;

--Colocar los meses que deseamos comparar con el mes actual
TRUNCATE TABLE BASE_INICIAL_VENTAS;

INSERT INTO BASE_INICIAL_VENTAS
SELECT *
FROM LF_VENTAS_HISTORICO
WHERE DATEPART(YEAR, FFactura)= 2022 AND DATEPART(MONTH, FFactura) = 06

INSERT INTO BASE_INICIAL_VENTAS
SELECT *
FROM LF_VENTAS_HISTORICO
WHERE DATEPART(YEAR, FFactura)= 2021 AND DATEPART(MONTH, FFactura) = 06

INSERT INTO BASE_INICIAL_VENTAS
SELECT *
FROM LF_VENTAS_HISTORICO
WHERE DATEPART(YEAR, FFactura)= 2022 AND DATEPART(MONTH, FFactura) = 05


--Este c�digo se puede usar si en alg�n momento descargas la informaci�n del b2b en csv
--BULK INSERT [LF_VENTAS_HISTORICO]
--FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\BDPRUEBAVENTAS.csv'
--WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

--DELETE FROM [LF_VENTAS_HISTORICO] WHERE Regional ='Regional'

--SET LANGUAGE spanish
--UPDATE [LF_VENTAS_HISTORICO] SET FFactura = TRIM(FFactura)
--UPDATE [LF_VENTAS_HISTORICO] SET FFactura = CONVERT(DATE,FFactura,107)
--SET LANGUAGE us_english

--UPDATE LF_VENTAS_HISTORICO SET Kilos = TRIM(Kilos);
--UPDATE LF_VENTAS_HISTORICO SET Importe = TRIM(Importe);
--UPDATE LF_VENTAS_HISTORICO SET Cajas = TRIM(Cajas);
--UPDATE LF_VENTAS_HISTORICO SET FacUnitario = TRIM(FacUnitario);
--UPDATE LF_VENTAS_HISTORICO SET FactKilos = TRIM(FactKilos);
--UPDATE LF_VENTAS_HISTORICO SET TUnidades = TRIM(TUnidades);

--Reemplazamos los separadores de miles que son . por nada
--UPDATE LF_VENTAS_HISTORICO
--SET Kilos = REPLACE(Kilos,'.','')
--WHERE CHARINDEX('.',Kilos) > 0;

--UPDATE LF_VENTAS_HISTORICO
--SET Importe = REPLACE(Importe,'.','')
--WHERE CHARINDEX('.',Importe) > 0;

--UPDATE LF_VENTAS_HISTORICO
--SET Cajas = REPLACE(Cajas,'.','')
--WHERE CHARINDEX('.',Cajas) > 0;

--UPDATE LF_VENTAS_HISTORICO
--SET FacUnitario = REPLACE(FacUnitario,'.','')
--WHERE CHARINDEX('.',FacUnitario) > 0;

--UPDATE LF_VENTAS_HISTORICO
--SET FactKilos = REPLACE(FactKilos,'.','')
--WHERE CHARINDEX('.',FactKilos) > 0;

--UPDATE LF_VENTAS_HISTORICO
--SET TUnidades = REPLACE(TUnidades,'.','')
--WHERE CHARINDEX('.',TUnidades) > 0;

--Remplazo los las comas separadores de decimales  por puntos
--UPDATE LF_VENTAS_HISTORICO
--SET Kilos = REPLACE(Kilos,',','.')
--WHERE CHARINDEX(',',Kilos) > 0;

--UPDATE LF_VENTAS_HISTORICO
--SET Importe = REPLACE(Importe,',','.')
--WHERE CHARINDEX(',',Importe) > 0;

--UPDATE LF_VENTAS_HISTORICO
--SET Cajas = REPLACE(Cajas,',','.')
--WHERE CHARINDEX(',',Cajas) > 0;

--UPDATE LF_VENTAS_HISTORICO
--SET FacUnitario = REPLACE(FacUnitario,',','.')
--WHERE CHARINDEX(',',FacUnitario) > 0;

--UPDATE LF_VENTAS_HISTORICO
--SET FactKilos = REPLACE(FactKilos,',','.')
--WHERE CHARINDEX(',',FactKilos) > 0;

--UPDATE LF_VENTAS_HISTORICO
--SET TUnidades = REPLACE(TUnidades,',','.')
--WHERE CHARINDEX(',',TUnidades) > 0;

--Cajas es la cantidad de material comprado
--FacUnitario es la cantidad de sku que viene en cada material
--FactKilos es la cantidad de kilos que pesa cada sku
--TUnidades es la cantdad de sku comprados
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
DELETE FROM LF_NC_HISTORICO WHERE LEFT(FNC,7) = '2022-06';

ALTER TABLE LF_NC_HISTORICO ALTER COLUMN Importe VARCHAR(100)

BULK INSERT LF_NC_HISTORICO
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\BDPRUEBA_JUN.csv'
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
WHERE DATEPART(YEAR, FNC)= 2022 AND DATEPART(MONTH, FNC) = 06;


INSERT INTO NOTAS_CREDITO
SELECT *
FROM LF_NC_HISTORICO
WHERE DATEPART(YEAR, FNC)= 2021 AND DATEPART(MONTH, FNC) = 06;

INSERT INTO NOTAS_CREDITO
SELECT *
FROM LF_NC_HISTORICO
WHERE DATEPART(YEAR, FNC)= 2022 AND DATEPART(MONTH, FNC) = 05;

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
 SELECT @dia Fecha, P.Agencia, 'SIN ASIGNAR - LF_PLAN ' CodClienteSellOut, 'SIN ASIGNAR - LF_PLAN ' ClienteSellOut, 'SIN ASIGNAR - LF_PLAN ' Vendedor_Distribuidora, 'SIN ASIGNAR - LF_PLAN' Tipo_tienda_Distribuidora, 'NC' CodLaFabril, P.CodAlicorp CodAlicorp,
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
IF OBJECT_ID(N'tempdb..#LAFABRIL_DUMMY') IS NOT NULL DROP TABLE #LAFABRIL_DUMMY;

SELECT B.Fecha, A.Agencia, C.CodAlicorp
INTO #LAFABRIL_DUMMY
FROM (SELECT DISTINCT Agencia FROM #VENTAS_Y_NOTAS) A CROSS JOIN #FECHA B
CROSS JOIN (SELECT DISTINCT CodAlicorp FROM #VENTAS_Y_NOTAS) C


INSERT INTO #VENTAS_Y_NOTAS
SELECT A.Fecha Fecha, A.Agencia Agencia, 'Dummy' CodClienteSellOut, 'Dummy' ClienteSellOut, 'Dummy' Vendedor_Distribuidora, 'Dummy' Tipo_tienda_Distribuidora, 'Dummy' CodLaFabril,  A.CodAlicorp CodAlicorp,
	   0 FacUnitario, 0 TUnidades, 0  Plan_Ton, 0 Ventakil, 0 Plan_Dol, 0 VentaDolares,
	   'MARCAS TERCEROS' TipoProducto
FROM #LAFABRIL_DUMMY A





UPDATE #VENTAS_Y_NOTAS 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%';

UPDATE #VENTAS_Y_NOTAS
SET Agencia = 'NC'
WHERE Agencia = ''

UPDATE #VENTAS_Y_NOTAS
SET Agencia = 'NC'
WHERE Agencia is null;
--Debido a que en las notas de cr�dito algunos rows salen vacios la agencia

---------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
--Tener en cuenta que no hay un campo que separe las la informaci�n de las NC , de la informaci�n de las Ventas, lo que hay es el campo
--que permite saber que rows de las NC en esta tabla no tiene agencia registrada.. si se deseara se puede incluir
--Para el proyecto de tableros
IF OBJECT_ID('VENTAS_TABLERO') IS NOT NULL DROP TABLE VENTAS_TABLERO;
--Creo tabla donde inserto la informaci�n de la tabla temporal #VENTAS_Y_NOTAS agregando los campos que necesito
--En esta tabla se va a insertar la informaci�n de todas las distribuidoras
SELECT F.DES_MES Mes, A.Fecha Dia,
	   M.CodCategoria CodCategoria, M.Categoria Categoria, M.CodFamilia CodFamilia, M.Familia Familia, A.CodAlicorp CodAlicorp, M.Material Material,  M.CodMarca CodMarca, M.Marca Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	  A.Vendedor_Distribuidora, A.Tipo_tienda_Distribuidora, A.CodClienteSellOut, A.ClienteSellOut,
	  IIF(A.TipoProducto='MARCAS TERCEROS','Consumo Masivo',A.TipoProducto) Negocio, A.FacUnitario, SUM(ISNULL(A.TUnidades,0)) TUnidades, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL(A.VentaKil,0)/1000) real_ton, SUM(ISNULL(A.Plan_Dol,0)) Plan_Dol, SUM(ISNULL(A.VentaDolares,0)/1000) real_Dolares,
	  M.Plataforma Plataforma
INTO VENTAS_TABLERO
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
DELETE FROM BASE_PANALES_HISTORICA WHERE LEFT(Fecha,7) = '2022-06';

BULK INSERT BASE_PANALES_HISTORICA
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\Panales_JUN.txt'
WITH (FIELDTERMINATOR='|',FIRSTROW=2,CODEPAGE='ACP');

--Colocar los meses que deseamos comparar con el mes actual
TRUNCATE TABLE BASE_MOBILVENDOR_AUTOMATICA;

INSERT INTO BASE_MOBILVENDOR_AUTOMATICA
SELECT *
FROM BASE_PANALES_HISTORICA
WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 06;

INSERT INTO BASE_MOBILVENDOR_AUTOMATICA
SELECT *
FROM BASE_PANALES_HISTORICA
WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 05;

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
UPDATE A SET [Codigo 2 Cliente] = TRIM([Codigo 2 Cliente]) FROM BASE_MOBILVENDOR_AUTOMATICA A;
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

---------------------------------------------------CODIFY-----------------------------------




--DELETE FROM BASE_MOBILVENDOR_AUTOMATICA WHERE Agencia IN ( )
--DELETE FROM BASE_MOBILVENDOR_AUTOMATICA WHERE Agencia  NOT IN ('156150253', '156163360', '156131204', '156150076', '156148774', '156117292')
--('156150253', '156163360', '156131204', '156150076')
--PREGUNTAR A DIEGO HASTA CUANDO SERA HARA

--Creo tabla temporal para homologar los campos y darle formato a la fecha, tambien calculo las toneladas
IF OBJECT_ID(N'tempdb..#PANALES') IS NOT NULL DROP TABLE #PANALES;

SELECT CONVERT(VARCHAR(20), A.Fecha,103) Fecha, A.Agencia Agencia, [Codigo 2 Cliente] CodClienteSellOut, [Nombre Cliente] ClienteSellOut, V.Nombre Vendedor_Distribuidora, A.TipoNegocio Tipo_tienda_Distribuidora, A.CodAlicorp CodAlicorp,
	   M.FacUnitario FacUnitario, A.Cantidad TUnidades, 0  Plan_Ton, (M.PesoTon)*(A.Cantidad) VentaTon, 0 Plan_Dol, A.Importe VentaDolares,
	   'Consumo Masivo' Negocio
INTO #PANALES
FROM BASE_MOBILVENDOR_AUTOMATICA A
	LEFT JOIN VENDEDORES_PANALES V ON A.Usuario = V.Codigo
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp;

--DELETE FROM #PANALES WHERE   FacUnitario is null

--SELECT  distinct CodAlicorp  FROM #PANALES WHERE   FacUnitario is null and RIGHT(Fecha,7) = '06/2022' agencia in ('156150253', '156163360', '156131204', '156150076') = '8410177' VentaTon=0 AND VentaDolares= 0 AND Plan_Dol = 0
DELETE FROM #PANALES WHERE CodAlicorp IN ('AD0220', 'AD0221', 'AD0224', 'AD0225', 'AD0226', 'AD0227', 'AD0228', 'AD0229', 'AD0230', 'AD0231', 'AD0232', 'AD0233', 'AD0234', 'AD0241', 'AD0242', 'AD0243', 'AD0246', 'AD0247',
                                          'AD0248', 'Ali001', 'Ali002', 'Ali003', 'Ali005', 'Ali007', 'Ali008', 'Ali009', 'Ali011', 'Ali013', 'Ali015', 'Ali016', 'Ali017', 'Ali10', 'AD0219', 'AD0215', 'AD0218', 'Ali006',
										  'AD0217', 'ESPAPROM', 'AD0103', 'AD239', 'Ali014', 'ALIC063', 'H450C200', 'H523B017', 'H523B222', 'H523B223', 'P.33001461', '617080', '688320', '484168', '29116B', '453-G', '648-001', 'AMB360',
										  'H180-G', 'MY', 'SP', 'TALL', 'AD0058', 'GLL')

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
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_PANALES_JUN.csv'
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
UPDATE A SET NomOficina = TRIM(NomOficina) FROM PLAN_PANALES A;
UPDATE A SET Plataforma = TRIM(Plataforma) FROM PLAN_PANALES A;

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
UPDATE PLAN_PANALES
SET NomOficina = CASE NomOficina
	WHEN 'JINES CAJAS CESAR XAVIER' THEN 'JINES CAJAS XAVIER CESAR'
	WHEN 'ZAMORA BRIONES MARIA MAGDALENA' THEN 'MOREJON QUISPE LUIS ALFREDO'
	WHEN 'ESPINOZA ZEAS MANUEL JOHN' THEN 'ESPINOZA ZEAS MANUEL JHON'
	WHEN 'GUADALUPE CASTILLO ERNESTO VICENTE' THEN 'GUADALUPE CASTILLO ERNESTO VICEN 2'
	WHEN 'COPARESA S.A.' THEN 'COPARESA'
	WHEN 'COPARESA S.A N 1' THEN 'COPARESA'
	WHEN 'TAGLE GUERRERO ARISTIDES NORMANDO' THEN 'ARISTIDES NORMANDO TAGLE GUERRERO'
	ELSE NomOficina END


--Inserto data dummy
INSERT INTO #PANALES_DUMMY1
SELECT B.Fecha, A.Agencia, C.CodAlicorp
FROM  (SELECT F.Agencia FROM (SELECT DISTINCT NomOficina FROM PLAN_PANALES) D LEFT JOIN MAESTRO_AGENCIAS F ON D.NomOficina = F.NomOficina)  A CROSS JOIN #FECHA B
CROSS JOIN (SELECT DISTINCT CodAlicorp FROM PLAN_PANALES) C


TRUNCATE TABLE PLAN_2MAYA;

BULK INSERT PLAN_2MAYA
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_2MAYA_JUN.csv'
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
UPDATE A SET NomOficina = TRIM(NomOficina) FROM PLAN_2MAYA A;
UPDATE A SET Plataforma = TRIM(Plataforma) FROM PLAN_2MAYA A;

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
UPDATE PLAN_2MAYA
SET NomOficina = CASE NomOficina
	WHEN 'NEOPOR S.A.' THEN 'DISTRIBUIDORA DE CONSUMO MASIVO NEOPOR S.A'
	WHEN 'PULLA' THEN 'PULLA VIMOS LOURDES CATALINA'
	WHEN 'MARVECOBE S.A' THEN 'MARVECOBE'
	WHEN 'HARO' THEN 'HARO IVAN'   
	WHEN 'ALVAREZ' THEN 'ALVAREZ TORRES SEGUNDO MIGUEL'
	ELSE NomOficina END

--Inserto data dummy

INSERT INTO #PANALES_DUMMY1
SELECT B.Fecha, A.Agencia, C.CodAlicorp
FROM  (SELECT F.Agencia FROM (SELECT DISTINCT NomOficina FROM PLAN_2MAYA) D LEFT JOIN MAESTRO_AGENCIAS F ON D.NomOficina = F.NomOficina)  A CROSS JOIN #FECHA B
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
INSERT INTO VENTAS_TABLERO
SELECT F.DES_MES Mes, A.Fecha Dia,
	   M.CodCategoria CodCategoria, M.Categoria Categoria, M.CodFamilia CodFamilia, M.Familia Familia, M.CodAlicorp CodAlicorp, M.Material Material, M.CodMarca CodMarca, M.Marca Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   A.Vendedor_Distribuidora, A.Tipo_tienda_Distribuidora, CodClienteSellOut, ClienteSellOut,
	   A.Negocio, A.FacUnitario, SUM(ISNULL(A.TUnidades,0)) TUnidades, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL(A.VentaTon,0)) real_ton, SUM(ISNULL(A.Plan_Dol,0)) Plan_Dol, SUM(ISNULL(A.VentaDolares,0)/1000) real_Dolares,
	  M.Plataforma Plataforma
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
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.NomOficina = AG.NomOficina
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
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.NomOficina = AG.NomOficina
GROUP BY F.DES_MES, A.Fecha,
	   A.CodCategoria, A.Categoria, A.CodFamilia, A.Familia, A.CodAlicorp, A.Des_Material, A.CodMarca, A.Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   A.Plataforma;



--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--Hularruss


--SET LANGUAGE SPANISH;

--Coloco el mes en curso
DELETE FROM HULARUSS_HISTORICO WHERE LEFT(Fecha,7) = '2022-06';


--ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN Importe VARCHAR(100);
ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN VentaKilos VARCHAR(100);
ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN importe VARCHAR(100);
ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN Cantidad VARCHAR(100);


DECLARE @HULARUSS VARCHAR(MAX);
SELECT @HULARUSS = BULKCOLUMN FROM 
OPENROWSET(BULK 'C:\Proyectos\Ecuador\HULARUSS\junios.json', SINGLE_BLOB) JSON;
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
WHERE YEAR(Fecha) = 2022 AND MONTH(Fecha) = 06;
 

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
WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 06;

INSERT INTO VENTAS_HULARUSS
SELECT *
FROM HULARUSS_HISTORICO
WHERE DATEPART(YEAR,Fecha) = 2022 AND DATEPART(MONTH,Fecha) = 05;

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


--Creo tabla temporal para homologar los campos y darle formato a la fecha, tambien calculo las toneladas
IF OBJECT_ID(N'tempdb..#HULARUSS') IS NOT NULL DROP TABLE #HULARUSS;

SELECT CONVERT(VARCHAR(20), A.Fecha,103) Fecha, A.Agencia Agencia, 'H-SIN ASIGNAR' Vendedor_Distribuidora, 'H-SIN ASIGNAR' Tipo_tienda_Distribuidora, A.CodClienteSellOut, A.CodAlicorp CodAlicorp,
	   M.FacUnitario FacUnitario, A.Cantidad TUnidades, 0  Plan_Ton, VentaKilos VentaKil, 0 Plan_Dol, A.Importe VentaDolares,
	   'Consumo Masivo' Negocio
INTO #HULARUSS
FROM VENTAS_HULARUSS A
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp;
--SELECT * FROM #HULARUSS WHERE  FacUnitario is null VentaKil=0 AND VentaDolares= 0 AND Plan_Dol = 0 AND Plan_Ton = 0
--Solo deben salir 28 rows por los datos ficticios simpre y cuando lo corra desde la l�nea donde se agregan

--Creo tabla temporal para insertar variables Dummies ya que no todas los sku tienen registros suficientes y asi no se desconfigure el excel
IF OBJECT_ID(N'tempdb..#HULARUSS_DUMMY') IS NOT NULL DROP TABLE #HULARUSS_DUMMY;

SELECT B.Fecha, A.Agencia, C.CodAlicorp
INTO #HULARUSS_DUMMY
FROM (SELECT DISTINCT Agencia FROM #HULARUSS) A CROSS JOIN #FECHA B
CROSS JOIN (SELECT DISTINCT CodAlicorp FROM #HULARUSS) C


ALTER TABLE #HULARUSS ALTER COLUMN Plan_Ton FLOAT;
ALTER TABLE #HULARUSS ALTER COLUMN Plan_Dol FLOAT;


--Inserto plan Hularuss
TRUNCATE TABLE PLAN_HULARUSS;

BULK INSERT PLAN_HULARUSS
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLANES_HULARUSS_JUN.csv'
WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

UPDATE A SET Fecha = REPLACE(Fecha, '.', '/') FROM PLAN_HULARUSS A;
UPDATE A SET Ventas_Reales = 0 FROM PLAN_HULARUSS A;
UPDATE A SET Ventas_Ton = 0 FROM PLAN_HULARUSS A;

DELETE PLAN_HULARUSS WHERE Plan_Dol = 0 AND Plan_Ton = 0;
DELETE FROM PLAN_HULARUSS WHERE Plan_Dol IS NULL AND Plan_Ton IS NULL;
DELETE FROM PLAN_HULARUSS WHERE Plan_Dol = '' AND Plan_Ton = '';

UPDATE A SET CodCategoria = TRIM(CodCategoria) FROM PLAN_HULARUSS A;
UPDATE A SET Categoria = TRIM(Categoria) FROM PLAN_HULARUSS A;
UPDATE A SET CodMarca = TRIM(CodMarca) FROM PLAN_HULARUSS A;
UPDATE A SET Marca = TRIM(Marca) FROM PLAN_HULARUSS A;
UPDATE A SET CodFamilia = TRIM(CodFamilia) FROM PLAN_HULARUSS A;
UPDATE A SET Familia = TRIM(Familia) FROM PLAN_HULARUSS A;
UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM PLAN_HULARUSS A;
UPDATE A SET Des_Material = TRIM(Des_Material) FROM PLAN_HULARUSS A;
UPDATE A SET NomOficina = TRIM(NomOficina) FROM PLAN_HULARUSS A;
UPDATE A SET Plataforma = TRIM(Plataforma) FROM PLAN_HULARUSS A;
UPDATE A SET Cliente = TRIM(Cliente) FROM PLAN_HULARUSS A;

UPDATE PLAN_HULARUSS
SET CodMarca = RIGHT(CodMarca,1)
WHERE CodMarca LIKE '00%';

UPDATE PLAN_HULARUSS
SET CodMarca = RIGHT(CodMarca,2)
WHERE CodMarca LIKE '0%';
-- Debido a que cuando subo la informaci�n del csv se agrega un cero a la izquierda


UPDATE PLAN_HULARUSS 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%'


UPDATE PLAN_HULARUSS
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128'
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;
--nuevo
--preguntar hasta cuando sera este update
UPDATE PLAN_HULARUSS
SET Cliente = '1000029726'
WHERE Cliente = '1000029761';

UPDATE PLAN_HULARUSS
SET Cliente = '1000029732'
WHERE Cliente = '1000029671';


INSERT INTO #HULARUSS_DUMMY
SELECT B.Fecha, A.Agencia, C.CodAlicorp
FROM  (SELECT F.Agencia FROM (SELECT DISTINCT Cliente FROM PLAN_HULARUSS) D LEFT JOIN MAESTRO_AGENCIAS F ON D.Cliente = F.CodOficina)  A CROSS JOIN #FECHA B
CROSS JOIN (SELECT DISTINCT CodAlicorp FROM PLAN_HULARUSS) C


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

INSERT INTO VENTAS_TABLERO
SELECT F.DES_MES Mes, A.Fecha Dia,
	   A.CodCategoria CodCategoria, A.Categoria Categoria, A.CodFamilia CodFamilia, A.Familia Familia, A.CodAlicorp CodAlicorp, A.Des_Material Material, A.CodMarca CodMarca, A.Marca Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   'SIN ASIGNAR - HU_PLAN ' Vendedor_Distribuidora, 'SIN ASIGNAR - HU_PLAN ' Tipo_tienda_Distribuidora, 'SIN ASIGNAR - HU' CodClienteSellOut, 'SIN ASIGNAR - HU' ClienteSellOut,
	   'Consumo Masivo' Negocio, 0 FacUnitario, 0 TUnidades, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL(A.Ventas_Ton,0)) real_ton, SUM(ISNULL(A.Plan_Dol,0)) Plan_Dol, SUM(ISNULL(A.Ventas_Reales,0)) real_Dolares,
	  A.Plataforma Plataforma
FROM PLAN_HULARUSS A
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.Cliente = AG.CodOficina
GROUP BY F.DES_MES, A.Fecha,
	   A.CodCategoria, A.Categoria, A.CodFamilia, A.Familia, A.CodAlicorp, A.Des_Material, A.CodMarca, A.Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   A.Plataforma;
-----------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--PYDACO
-- Usar cada vez para cargar meses nuevo al hist�rico
--SET LANGUAGE SPANISH;

--BULK INSERT PYDACO_HISTORICO
--FROM 'C:\Proyectos\Ecuador\PYDACO\MAYO2022.csv'
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

--Reemplazamos a los dias h�biles sin ventas por el promedio
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

--Cargo la informaci�n del Sell In
SET LANGUAGE SPANISH;

TRUNCATE TABLE VENTAS_PYDACO;

--ALTER TABLE VENTAS_PYDACO ALTER COLUMN Fecha VARCHAR(100);

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
-- Debido a que cuando subo la informaci�n del csv se agrega un cero a la izquierda


UPDATE VENTAS_PYDACO
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128'
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;


--Creo tabla temporal para darle los campos y el formato a la informaci�n que viene del Sell In
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

INSERT INTO VENTAS_TABLERO
SELECT F.DES_MES Mes, A.Fecha Dia,
	   M.CodCategoria CodCategoria, M.Categoria Categoria, M.CodFamilia CodFamilia, M.Familia Familia, A.CodAlicorp CodAlicorp, M.Material Material, M.CodMarca CodMarca, M.Marca Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   AG.Oficina_Ventas, AG.Grupo_Vendedores, AG.Territorio, AG.Agrupacion_Distribuidora, AG.Agencia_Distribuidora, AG.Zona_Clientes, AG.Grupo_Condiciones,
	   A.Vendedor_Distribuidora, A.Tipo_tienda_Distribuidora, A.CodClienteSellOut, A.ClienteSellOut,
	   'Consumo Masivo' Negocio, M.FacUnitario, SUM(ISNULL(A.TUnidades,0)) TUnidades, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL((A.TUnidades*M.PesoTon),0)) real_ton, SUM(ISNULL(A.Plan_Dol,0)) Plan_Dol, SUM(ISNULL(A.real_Dolares/1000,0)) real_Dolares,
	  M.Plataforma Plataforma
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