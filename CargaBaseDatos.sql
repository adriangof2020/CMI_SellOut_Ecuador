USE CmiSellOutEcuador;

DECLARE @dia DATE;
DECLARE @d1 AS VARCHAR(20);

SELECT @dia= DATEADD(DAY,-2,SYSDATETIME());
-- poner el �ltimo d�a de ventas
SELECT @d1= TRY_CONVERT(VARCHAR(20), TRY_CONVERT(DATE, @dia,103),103);

PRINT @dia;
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

print @ds1;
print @ds2;
print @ds3;
print @ds4;
print @ds5;
print @ds6;
PRINT @ds7;
PRINT @ds8;
PRINT @ds9;
PRINT @ds10;
print @ds11;
print @ds12;

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

TRUNCATE TABLE TABLA_MATERIALES;
--En esta base la llave es CodLaFabril&Descripcion de la Fabril
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
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_LA_FABRIL.csv'
WITH (FIELDTERMINATOR=';', FIRSTROW=2, CODEPAGE='ACP');

DELETE [PLAN_LA_FABRIL] WHERE Kilos = 0 AND Cajas = 0  AND Importe = 0;

UPDATE PLAN_LA_FABRIL SET OficinaVentas = TRIM(OficinaVentas);
UPDATE PLAN_LA_FABRIL SET CodAlicorp = TRIM(CodAlicorp);

UPDATE PLAN_LA_FABRIL
SET OficinaVentas = CASE OficinaVentas
	WHEN 'EC - Machala' THEN '700 EC - Guayaquil'
	WHEN 'EC - Ibarra' THEN '701 EC - Quito'
	ELSE OficinaVentas END;

UPDATE PLAN_LA_FABRIL
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128' ELSE CodAlicorp END;
--Cambiamos los codigos antiguos por los nuevos codigos afo

TRUNCATE TABLE BASE_INICIAL_VENTAS;

BULK INSERT BASE_INICIAL_VENTAS
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\BDPRUEBAVENTAS.csv'
WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

UPDATE A SET Agencia = TRIM(Agencia) FROM BASE_INICIAL_VENTAS A;
UPDATE A SET CodArticulo = TRIM(CodArticulo) FROM BASE_INICIAL_VENTAS A;
UPDATE A SET GrupoProducto = TRIM(GrupoProducto) FROM BASE_INICIAL_VENTAS A;
UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM BASE_INICIAL_VENTAS A;
UPDATE A SET DesArticulo = TRIM(DesArticulo) FROM BASE_INICIAL_VENTAS A;

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
SET	CodArticulo = '8005796',
	DesArticulo = 'ALACENA MAYONESA EXP 90CC 24DPK'
WHERE CodArticulo = '8005634' AND DesArticulo = 'ALACENA MAYONESA 90CC 24DPK';	

UPDATE BASE_INICIAL_VENTAS
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128' ELSE CodAlicorp END;
--Cambiamos los codigos antiguos por los nuevos codigos afo

TRUNCATE TABLE NOTAS_CREDITO;

BULK INSERT NOTAS_CREDITO
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\BDPRUEBA.csv'
WITH (FIELDTERMINATOR=';', FIRSTROW=2, CODEPAGE='ACP');

UPDATE A SET CodArticulo = TRIM(CodArticulo) FROM NOTAS_CREDITO A;
UPDATE A SET Agencia = TRIM(Agencia) FROM NOTAS_CREDITO A;
UPDATE A SET DesArticulo = TRIM(DesArticulo) FROM NOTAS_CREDITO A;

UPDATE NOTAS_CREDITO
SET	CodArticulo = '8005796',
	DesArticulo = 'ALACENA MAYONESA EXP 90CC 24DPK'
WHERE CodArticulo = '8005634' AND DesArticulo = 'ALACENA MAYONESA 90CC 24DPK';

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

TRUNCATE TABLE MAESTRO_AGENCIAS;
 
BULK INSERT MAESTRO_AGENCIAS
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\MAESTRO_AGENCIAS.csv'
WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

UPDATE MAESTRO_AGENCIAS SET Agencia = TRIM(Agencia);
UPDATE MAESTRO_AGENCIAS SET NomOficina = TRIM(NomOficina);


IF OBJECT_ID(N'tempdb..#PLAN') IS NOT NULL DROP TABLE #PLAN;

SELECT LEFT(OficinaVentas,3) CodOficina, RIGHT(OficinaVentas, LEN(OficinaVentas)-4) NomOficina , CodAlicorp, Kilos, Importe
INTO #PLAN
FROM PLAN_LA_FABRIL
--Creo tabla temporal para homologar campos con la tablas NOTAS_CREDITO y BASE_INICIAL_VENTAS
--SELECT * FROM #PLAN  A LEFT JOIN [dbo].[TABLA_MATERIALES] B ON A.CodAlicorp = B.CodAlicorp WHERE A.CodAlicorp IS  NULL

IF OBJECT_ID(N'tempdb..#VENTAS_Y_NOTAS_CREDITO') IS NOT NULL DROP TABLE #VENTAS_Y_NOTAS_CREDITO;
--Creo tabla temporal para unir las ventas, las notas de cr�dito y el plan con los campos que se requiere
SELECT A.FFactura Fecha, A.Agencia Agencia, A.CodArticulo CodLaFabril, A.CodAlicorp CodAlicorp, 0 Plan_Ton, A.Kilos VentaKil, 0 Plan_Dol, A.Importe VentaDolares, A.GrupoProducto TipoProducto
INTO #VENTAS_Y_NOTAS_CREDITO 
FROM BASE_INICIAL_VENTAS A;

INSERT INTO #VENTAS_Y_NOTAS_CREDITO 
SELECT A.FNC Fecha, A.Agencia Agencia, A.CodArticulo CodLaFabril, A.CodAlicorp CodAlicorp, 0 Plan_Ton, 0 VentaKil, 0 Plan_Dol,  A.Importe VentaDolares, 'MARCAS TERCEROS' TipoProducto
FROM NOTAS_CREDITO  A;

ALTER TABLE #VENTAS_Y_NOTAS_CREDITO ALTER COLUMN Plan_Ton FLOAT;
ALTER TABLE #VENTAS_Y_NOTAS_CREDITO ALTER COLUMN Plan_Dol FLOAT;

 INSERT INTO #VENTAS_Y_NOTAS_CREDITO
 SELECT @dia Fecha, AG.Agencia Agencia,'NC' CodLaFabril, P.CodAlicorp CodAlicorp, P.Kilos Plan_Ton, 0 VentaKil, P.Importe Plan_Dol , 0 VentaDolares, 'MARCAS TERCEROS' TipoProducto
 FROM #PLAN P
	LEFT JOIN MAESTRO_AGENCIAS AG ON P.CodOficina = AG.CodOficina
--Le asigno una fecha al plan, puede ser cualquiere dentro del rango de d�as de venta transcurridos
--El campo CodLaFabril a este punto ya no es necesario por eso le asignamos un valor NC
	
-- UPDATE A LAS AGENCIAS QUE NO SE ENCUENTRAN EN EL MAESTRO AGENCIAS
UPDATE #VENTAS_Y_NOTAS_CREDITO  
SET Agencia = 'AGG'
WHERE Agencia = 'DCG'

UPDATE #VENTAS_Y_NOTAS_CREDITO 
SET Agencia = 'AGM'
WHERE Agencia = 'DCM'

UPDATE #VENTAS_Y_NOTAS_CREDITO
SET Agencia = 'AGM'
WHERE Agencia = 'PTA'

-- UPDATE AGENCIAS ( IBAARA VAN HACIA QUITO Y AGENCIA MACHALA A GUAYAQUIL)

UPDATE #VENTAS_Y_NOTAS_CREDITO 
SET Agencia = 'AGT'
WHERE Agencia = 'AGI' 
-- AGT ES TUCAN PORQUE ACASO NO ERA QUITO?

UPDATE #VENTAS_Y_NOTAS_CREDITO 
SET Agencia = 'AGG'
WHERE Agencia = 'AGMCH'

IF OBJECT_ID(N'tempdb..#VENTAS_Y_NOTAS') IS NOT NULL DROP TABLE #VENTAS_Y_NOTAS;
--Creo tabla temporal para darle formato varchar a la fecha
SELECT CONVERT(VARCHAR(20), V.Fecha,103) Fecha, V.Agencia, V.CodLaFabril, V.CodAlicorp, V.Plan_Ton, V.Ventakil, V.Plan_Dol, V.VentaDolares, V.TipoProducto
INTO #VENTAS_Y_NOTAS
FROM #VENTAS_Y_NOTAS_CREDITO V
--SELECT * FROM #VENTAS_Y_NOTAS WHERE CodAlicorp = '';
--SELECT * FROM #VENTAS_Y_NOTAS WHERE CodAlicorp IS NULL;

UPDATE #VENTAS_Y_NOTAS 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%';

UPDATE #VENTAS_Y_NOTAS
SET Agencia = 'NC'
WHERE Agencia = ''
--Debido a que en las notas de cr�dito algunos rows salen vacios la agencia
	 
IF OBJECT_ID('VENTAS_CONSOLIDADO') IS NOT NULL DROP TABLE VENTAS_CONSOLIDADO;
--Creo tabla donde consolido la informaci�n de la tabla temporal #VENTAS_Y_NOTAS agregando los campos que necesito
--En esta tabla se va a insertar la informaci�n de todas las distribuidoras
SELECT F.DES_MES Mes, A.Fecha Dia,
	   M.CodCategoria CodCategoria, M.Categoria Categoria, M.CodFamilia CodFamilia, M.Familia Familia, M.CodMarca CodMarca, M.Marca Marca,
	   AG.ZonaV2 Grupo_Condiciones, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	  'La Fabril S.A.' DEX, IIF(A.TipoProducto='MARCAS TERCEROS','Consumo Masivo',A.TipoProducto) Negocio, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL(A.VentaKil,0)/1000) real_ton, SUM(ISNULL(A.Plan_Dol,0)/1000) Plan_Dol, SUM(ISNULL(A.VentaDolares,0)/1000) real_Dolares,
	  M.Plataforma Plataforma
INTO VENTAS_CONSOLIDADO
FROM #VENTAS_Y_NOTAS A
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.Agencia = AG.Agencia
GROUP BY F.DES_MES, A.Fecha,
	   M.CodCategoria, M.Categoria, M.CodFamilia, M.Familia, M.CodMarca, M.Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   IIF(A.TipoProducto='MARCAS TERCEROS','Consumo Masivo',A.TipoProducto),
	   M.Plataforma;


---------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
--Para el proyecto de tableros de Valery, pendiente quitar agrupadores no son necesarios por ejemplo sumar
IF OBJECT_ID('VENTAS_TABLERO') IS NOT NULL DROP TABLE VENTAS_TABLERO;
--Creo tabla donde consolido la informaci�n de la tabla temporal #VENTAS_Y_NOTAS agregando los campos que necesito
--En esta tabla se va a insertar la informaci�n de todas las distribuidoras
SELECT F.DES_MES Mes, A.Fecha Dia,
	   M.CodCategoria CodCategoria, M.Categoria Categoria, M.CodFamilia CodFamilia, M.Familia Familia, M.CodAlicorp CodAlicorp, M.Material Material,  M.CodMarca CodMarca, M.Marca Marca,
	   AG.ZonaV2 Grupo_Condiciones, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	  'La Fabril S.A.' DEX, IIF(A.TipoProducto='MARCAS TERCEROS','Consumo Masivo',A.TipoProducto) Negocio, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL(A.VentaKil,0)/1000) real_ton, SUM(ISNULL(A.Plan_Dol,0)/1000) Plan_Dol, SUM(ISNULL(A.VentaDolares,0)/1000) real_Dolares,
	  M.Plataforma Plataforma
INTO VENTAS_TABLERO
FROM #VENTAS_Y_NOTAS A
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.Agencia = AG.Agencia
GROUP BY F.DES_MES, A.Fecha,
	   M.CodCategoria, M.Categoria, M.CodFamilia, M.Familia, M.CodAlicorp, M.Material , M.CodMarca, M.Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   IIF(A.TipoProducto='MARCAS TERCEROS','Consumo Masivo',A.TipoProducto),
	   M.Plataforma;
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
--Panales
TRUNCATE TABLE BASE_MOBILVENDOR_AUTOMATICA;

BULK INSERT BASE_MOBILVENDOR_AUTOMATICA
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\Panales_FEB.txt'
WITH (FIELDTERMINATOR='|',FIRSTROW=2,CODEPAGE='ACP');

BULK INSERT BASE_MOBILVENDOR_AUTOMATICA
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\Panales_MAR.txt'
WITH (FIELDTERMINATOR='|',FIRSTROW=2,CODEPAGE='ACP');

DELETE FROM [BASE_MOBILVENDOR_AUTOMATICA] WHERE Importe = 0;
DELETE FROM [BASE_MOBILVENDOR_AUTOMATICA] WHERE Importe IS NULL;
UPDATE BASE_MOBILVENDOR_AUTOMATICA SET CodAlicorp = [Codigo Articulo] WHERE CodAlicorp IS NULL;
UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM BASE_MOBILVENDOR_AUTOMATICA A;
UPDATE A SET Agencia = TRIM(Agencia) FROM BASE_MOBILVENDOR_AUTOMATICA A;
--UPDATE A SET PesoKG = TRIM(PesoKG) FROM BASE_MOBILVENDOR_AUTOMATICA A;
--UPDATE A SET PesoTon = TRIM(PesoTon) FROM BASE_MOBILVENDOR_AUTOMATICA A;

UPDATE BASE_MOBILVENDOR_AUTOMATICA
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128' 
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;
-- 293369 este error solo sale en la data de ventas de Panales

TRUNCATE TABLE PLAN_PANALES;

BULK INSERT PLAN_PANALES
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_PANALES.csv'
WITH (FIELDTERMINATOR=';', FIRSTROW=2, CODEPAGE='ACP');

DELETE PLAN_PANALES WHERE Plan_Dol = 0 AND Plan_Ton = 0;
DELETE FROM PLAN_PANALES WHERE Plan_Dol IS NULL AND Plan_Ton IS NULL;

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
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128'
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;

UPDATE PLAN_PANALES
SET NomOficina = CASE NomOficina
	WHEN 'JINES CAJAS CESAR XAVIER' THEN 'JINES CAJAS XAVIER CESAR'
	WHEN 'ZAMORA BRIONES MARIA MAGDALENA' THEN 'MOREJON QUISPE LUIS ALFREDO'
	WHEN 'ESPINOZA ZEAS MANUEL JOHN' THEN 'ESPINOZA ZEAS MANUEL JHON' ELSE NomOficina END

--Creo tabla temporal para homologar los campos y darle formato a la fecha, tambien calculo las toneladas
IF OBJECT_ID(N'tempdb..#PANALES') IS NOT NULL DROP TABLE #PANALES;

SELECT CONVERT(VARCHAR(20), A.Fecha,103) Fecha, A.Agencia Agencia, A.CodAlicorp CodAlicorp, 0  Plan_Ton, (M.PesoTon)*(A.Cantidad)*(A.UnidadCaja) VentaTon, 0 Plan_Dol, A.Importe VentaDolares,
	   'MARCAS TERCEROS' TipoProducto
INTO #PANALES
FROM BASE_MOBILVENDOR_AUTOMATICA A
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp;
--SELECT SUM(VentaTon) FROM #PANALES

ALTER TABLE #PANALES ALTER COLUMN Plan_Ton FLOAT;
ALTER TABLE #PANALES ALTER COLUMN VentaTon FLOAT;
ALTER TABLE #PANALES ALTER COLUMN Plan_Dol FLOAT;

--Inserto informaci�n ficticia del a�o pasado para que no altere el reporte de excel
INSERT INTO #PANALES VALUES (@d3,'156150076','8410177',0,0,0,0,'MARCAS TERCEROS');
INSERT INTO #PANALES VALUES (@d3,'156131204','8410177',0,0,0,0,'MARCAS TERCEROS');
INSERT INTO #PANALES VALUES (@d3,'156163360','8410177',0,0,0,0,'MARCAS TERCEROS');

--INSERT INTO #PANALES VALUES (@d3,'156150076','8410177',0,0,0,0.000001,'MARCAS TERCEROS');
--INSERT INTO #PANALES VALUES (@d3,'156131204','8410177',0,0,0,0.000001,'MARCAS TERCEROS');
--INSERT INTO #PANALES VALUES (@d3,'156163360','8410177',0,0,0,0.000001,'MARCAS TERCEROS');
UPDATE #PANALES 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%'

--Inserto la ventas de Panales
INSERT INTO VENTAS_CONSOLIDADO
SELECT F.DES_MES Mes, A.Fecha Dia,
	   M.CodCategoria CodCategoria, M.Categoria Categoria, M.CodFamilia CodFamilia, M.Familia Familia, M.CodMarca CodMarca, M.Marca Marca,
	   AG.ZonaV2 Grupo_Condiciones, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	  'Panales' DEX, IIF(A.TipoProducto='MARCAS TERCEROS','Consumo Masivo',A.TipoProducto) Negocio, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL(A.VentaTon,0)) real_ton, SUM(ISNULL(A.Plan_Dol,0)) Plan_Dol, SUM(ISNULL(A.VentaDolares,0)/1000) real_Dolares,
	  M.Plataforma Plataforma
FROM #PANALES A
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.Agencia = AG.Agencia
GROUP BY F.DES_MES, A.Fecha,
	   M.CodCategoria, M.Categoria, M.CodFamilia, M.Familia, M.CodMarca, M.Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   IIF(A.TipoProducto='MARCAS TERCEROS','Consumo Masivo',A.TipoProducto),
	   M.Plataforma;

--------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
-- Para el proyecto de tablero de Valery
INSERT INTO VENTAS_TABLERO
SELECT F.DES_MES Mes, A.Fecha Dia,
	   M.CodCategoria CodCategoria, M.Categoria Categoria, M.CodFamilia CodFamilia, M.Familia Familia, M.CodAlicorp CodAlicorp, M.Material Material, M.CodMarca CodMarca, M.Marca Marca,
	   AG.ZonaV2 Grupo_Condiciones, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	  'Panales' DEX, IIF(A.TipoProducto='MARCAS TERCEROS','Consumo Masivo',A.TipoProducto) Negocio, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL(A.VentaTon,0)) real_ton, SUM(ISNULL(A.Plan_Dol,0)) Plan_Dol, SUM(ISNULL(A.VentaDolares,0)/1000) real_Dolares,
	  M.Plataforma Plataforma
FROM #PANALES A
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.Agencia = AG.Agencia
GROUP BY F.DES_MES, A.Fecha,
	   M.CodCategoria, M.Categoria, M.CodFamilia, M.Familia, M.CodAlicorp, M.Material, M.CodMarca, M.Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   IIF(A.TipoProducto='MARCAS TERCEROS','Consumo Masivo',A.TipoProducto),
	   M.Plataforma;

--Inserto el Plan de Panales

INSERT INTO VENTAS_CONSOLIDADO
SELECT F.DES_MES Mes, A.Fecha Dia,
	   A.CodCategoria CodCategoria, A.Categoria Categoria, A.CodFamilia CodFamilia, A.Familia Familia, A.CodMarca CodMarca, A.Marca Marca,
	   AG.ZonaV2 Grupo_Condiciones, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	  'Panales' DEX, 'Consumo Masivo' Negocio, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL(A.Ventas_Ton,0)) real_ton, SUM(ISNULL(A.Plan_Dol,0)) Plan_Dol, SUM(ISNULL(A.Ventas_Reales,0)) real_Dolares,
	  A.Plataforma Plataforma
FROM PLAN_PANALES A
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.NomOficina = AG.NomOficina
GROUP BY F.DES_MES, A.Fecha,
	   A.CodCategoria, A.Categoria, A.CodFamilia, A.Familia,  A.CodMarca, A.Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   A.Plataforma;
--------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
--Para el proyecto tablero de Valery

INSERT INTO VENTAS_TABLERO
SELECT F.DES_MES Mes, A.Fecha Dia,
	   A.CodCategoria CodCategoria, A.Categoria Categoria, A.CodFamilia CodFamilia, A.Familia Familia, A.CodAlicorp CodAlicorp, A.Des_Material Material, A.CodMarca CodMarca, A.Marca Marca,
	   AG.ZonaV2 Grupo_Condiciones, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	  'Panales' DEX, 'Consumo Masivo' Negocio, SUM(ISNULL(A.Plan_Ton,0)) Plan_Ton,
	  SUM(ISNULL(A.Ventas_Ton,0)) real_ton, SUM(ISNULL(A.Plan_Dol,0)) Plan_Dol, SUM(ISNULL(A.Ventas_Reales,0)) real_Dolares,
	  A.Plataforma Plataforma
FROM PLAN_PANALES A
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.NomOficina = AG.NomOficina
GROUP BY F.DES_MES, A.Fecha,
	   A.CodCategoria, A.Categoria, A.CodFamilia, A.Familia, A.CodAlicorp, A.Des_Material, A.CodMarca, A.Marca,
	   AG.ZonaV2, AG.CodOficina, AG.NomOficina, AG.CodTerritorio, AG.NomTerritorio, AG.CodZona, AG.NomZona,
	   A.Plataforma;

IF OBJECT_ID('DBO.TMP_SELL_OUT_21') IS NOT NULL DROP TABLE DBO.TMP_SELL_OUT_21;
--Creo tabla final donde se van a elaborar todos los indicadores
SELECT *
INTO TMP_SELL_OUT_21 FROM 
(SELECT 
A.Mes "MES",
'Sem' "Semana",
A.DIA DIA,
B.DIA_2 dia_2,
CONCAT(A.CodCategoria,' ', A.Categoria) "Categoria",
A.Negocio Negocio,
CONCAT(A.CodFamilia,' ',A.Familia) Familia,
CONCAT(A.CodMarca,' ',A.Marca) Marca,
A.Grupo_Condiciones "Grupo_Condiciones",
CONCAT(A.CodOficina,' ',A.NomOficina) "Oficina_Ventas",
CONCAT(A.CodTerritorio,' ',A.NomTerritorio) "Grupo_Vendedores",
CONCAT(A.CodZona,' ',A.NomZona) "Zona_Clientes",
A.DEX "DEX",
A.Plan_Ton plan_ton,
A.real_ton real_ton,
A.Plan_Dol plan_dol,
A.real_Dolares real_dol,
A.real_ton/@dm1 * @DMAX	 PROY_LIN_TON,
A.real_Dolares/@dm1 * @DMAX	PROY_LIN_DOL,
0 PROY_TON,
0 PROY_DOL,
B.ANIO ANIO,
B.SEM SEM,
B.MES MES2,
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
WHEN B.PER = @M3 THEN A.real_ton/@DMAX3
END prom_mes,
--VENTA PROMEDIO MENSUAL TONELADAS
CASE WHEN B.PER = @M1 THEN A.real_Dolares/@dm1 
WHEN B.PER = @M2 THEN A.real_Dolares/@DMAX2 
WHEN B.PER = @M3 THEN A.real_Dolares/@DMAX3
END prom_mes_dol,
--VENTA PROMEDIO MENSUAL DOLARES
A.Plataforma as Plataforma
FROM VENTAS_CONSOLIDADO  A 
left JOIN BD_FECHAS  B ON A.DIA = B.DIA) A WHERE A.ANIO IS NOT NULL ;

