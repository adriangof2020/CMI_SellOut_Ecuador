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


--Este código se puede usar si en algún momento descargas la información del b2b en csv
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

--Este código se puede usar si en algún momento descargas la información del b2b en csv
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
--Asignamos código Alicorp a las notas de crédito
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
--Creo tabla temporal para unir las ventas, las notas de crédito y el plan con los campos que se requiere
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
--Le asigno una fecha al plan, puede ser cualquiere dentro del rango de días de venta transcurridos
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
--Debido a que en las notas de crédito algunos rows salen vacios la agencia

---------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
--Tener en cuenta que no hay un campo que separe las la información de las NC , de la información de las Ventas, lo que hay es el campo
--que permite saber que rows de las NC en esta tabla no tiene agencia registrada.. si se deseara se puede incluir
--Para el proyecto de tableros
IF OBJECT_ID('VENTAS_TABLERO') IS NOT NULL DROP TABLE VENTAS_TABLERO;
--Creo tabla donde inserto la información de la tabla temporal #VENTAS_Y_NOTAS agregando los campos que necesito
--En esta tabla se va a insertar la información de todas las distribuidoras
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







-----------------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

IF OBJECT_ID('VENTAS_CONSOLIDADO') IS NOT NULL DROP TABLE VENTAS_CONSOLIDADO;
--Creo tabla donde consolido la información de la tabla tablero
--En esta tabla se va a insertar la información de todas las distribuidoras
SELECT A.Mes, A.Dia,
	   A.CodCategoria, A.Categoria, A.CodFamilia, A.Familia, A.CodMarca, A.Marca,
	   A.ZonaV2, A.CodOficina, A.NomOficina, A.CodTerritorio, A.NomTerritorio, A.CodZona, A.NomZona,
	   A.Oficina_Ventas, A.Grupo_Vendedores, A.Territorio, A.Agrupacion_Distribuidora, A.Agencia_Distribuidora, A.Zona_Clientes, A.Grupo_Condiciones,
	   A.Negocio, SUM(A.Plan_Ton) Plan_Ton,
	  SUM(A.real_ton) real_ton, SUM(A.Plan_Dol) Plan_Dol, SUM(A.real_Dolares) real_Dolares,
	  A.Plataforma Plataforma
INTO VENTAS_CONSOLIDADO
FROM VENTAS_TABLERO A
GROUP BY A.MES, A.Dia,
	   A.CodCategoria, A.Categoria, A.CodFamilia, A.Familia, A.CodMarca, A.Marca,
	   A.ZonaV2, A.CodOficina, A.NomOficina, A.CodTerritorio, A.NomTerritorio, A.CodZona, A.NomZona,
	   A.Oficina_Ventas, A.Grupo_Vendedores, A.Territorio, A.Agrupacion_Distribuidora, A.Agencia_Distribuidora, A.Zona_Clientes, A.Grupo_Condiciones,
	   A.Negocio,
	   A.Plataforma;

------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------



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