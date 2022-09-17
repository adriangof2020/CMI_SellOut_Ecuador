USE TABLERO_ECUADOR3;

SET LANGUAGE US_ENGLISH;

DECLARE @dia DATE;
DECLARE @workday INT;
--Dia h�bil de la fecha
DECLARE @workday_MA INT;
--Dia h�bil que hay en el mes anterior
DECLARE @d1 AS VARCHAR(20);

SELECT @dia= DATEADD(DAY,-1,SYSDATETIME());
-- poner el �ltimo d�a de ventas
SELECT @workday = DIA_UTIL FROM BD_FECHAS_1 WHERE TRY_CONVERT(DATE,DIA,103) = @dia
SELECT @workday_MA = DIA_UTIL FROM BD_FECHAS_1 WHERE  TRY_CONVERT(DATE,DIA,103) = EOMONTH(@dia,-1)
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

SELECT @M1= PER FROM BD_FECHAS_1 WHERE TRY_CONVERT(VARCHAR(10),TRY_CONVERT(DATE,DIA,103),103) = @d1;
SELECT @M2= PER FROM BD_FECHAS_1 WHERE TRY_CONVERT(VARCHAR(10),TRY_CONVERT(DATE,DIA,103),103)  = @d2;
SELECT @M3= PER FROM BD_FECHAS_1 WHERE TRY_CONVERT(VARCHAR(10),TRY_CONVERT(DATE,DIA,103),103)  = @d3;
 
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

SELECT @dm1 = DIA_UTIL FROM BD_FECHAS_1
WHERE TRY_CONVERT(DATETIME, DIA,103) = TRY_CONVERT(DATETIME,@d1,103);
SELECT @dm2 = DIA_UTIL  FROM BD_FECHAS_1
WHERE TRY_CONVERT(DATETIME, dia,103) = TRY_CONVERT(DATETIME,@d2,103);
SELECT @dm3 = DIA_UTIL  FROM BD_FECHAS_1
WHERE TRY_CONVERT(DATETIME, dia,103) = TRY_CONVERT(DATETIME,@d3,103);

PRINT 'dm1 ' + TRY_CONVERT(VARCHAR(10),@dm1);
PRINT 'dm2 ' +  TRY_CONVERT(VARCHAR(10),@dm2);
PRINT 'dm3 ' +  TRY_CONVERT(VARCHAR(10),@dm3);

DECLARE @DMAX AS INTEGER;
DECLARE @DMAX2 AS INTEGER;
DECLARE @DMAX3 AS INTEGER;

SELECT @DMAX= MAX(DIA_UTIL) FROM BD_FECHAS_1 
WHERE PER IN  (SELECT PER FROM BD_FECHAS_1 WHERE TRY_CONVERT(VARCHAR(10),TRY_CONVERT(DATE,DIA,103),103)=@d1);
SELECT @DMAX2= MAX(DIA_UTIL) FROM BD_FECHAS_1 
WHERE PER IN  (SELECT PER FROM BD_FECHAS_1 WHERE TRY_CONVERT(VARCHAR(10),TRY_CONVERT(DATE,DIA,103),103)=@d2);
SELECT @DMAX3= MAX(DIA_UTIL) FROM BD_FECHAS_1 
WHERE PER IN  (SELECT PER FROM BD_FECHAS_1 WHERE TRY_CONVERT(VARCHAR(10),TRY_CONVERT(DATE,DIA,103),103)=@d3);

PRINT @DMAX;
PRINT @DMAX2;
PRINT @DMAX3;


DROP TABLE MAESTRO_ALICORP_1;

SELECT *
INTO MAESTRO_ALICORP_1
FROM CmiSellOutEcuador.dbo.MAESTRO_ALICORP;


DROP TABLE MAESTRO_AGENCIAS_1;

SELECT *
INTO MAESTRO_AGENCIAS_1
FROM CmiSellOutEcuador.dbo.MAESTRO_AGENCIAS;

DROP TABLE TABLA_MATERIALES_1;

SELECT *
INTO TABLA_MATERIALES_1
FROM CmiSellOutEcuador.dbo.TABLA_MATERIALES;



--para cargar los planes del kpis
-----------------------------------------------
--TRUNCATE TABLE INDICADORES_KPI;

--BULK INSERT INDICADORES_KPI
--FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\KPIS_MACRO2.0.csv'
--WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');



--PONER ESTE UPDATE CUANDO TENGA EL NUEVO FORMATO DE LA PLANTILLA KPIS
--UPDATE  INDICADORES_KPI SET Cliente = '2MALLA' WHERE Cliente = '_2MALLA'
--UPDATE  INDICADORES_KPI SET Cliente = 'LA FABRIL' WHERE Cliente = 'LA_FABRIL'
--UPDATE  INDICADORES_KPI SET Plataforma = 'Home Care' WHERE Plataforma = 'Home_Care'
--UPDATE  INDICADORES_KPI SET Categoria = 'Limpiadores Light Du' WHERE Categoria = 'Limpiadores_Light_Du'
--UPDATE INDICADORES_KPI SET TipoCliente = TRIM(TipoCliente);
--UPDATE INDICADORES_KPI SET Cliente = TRIM(Cliente);
   


   --sube las ventas de la fabril
DROP TABLE LF_VENTAS_HISTORICO_1;

SELECT *
INTO LF_VENTAS_HISTORICO_1
FROM CmiSellOutEcuador.dbo.LF_VENTAS_HISTORICO
WHERE 1=1
	  AND YEAR(FFactura) = 2022;

DELETE FROM LF_VENTAS_HISTORICO_1 WHERE Kilos = 0 AND Importe = 0;

UPDATE A SET Agencia = TRIM(Agencia) FROM LF_VENTAS_HISTORICO_1 A;
UPDATE A SET CodArticulo = TRIM(CodArticulo) FROM LF_VENTAS_HISTORICO_1 A;
UPDATE A SET GrupoProducto = TRIM(GrupoProducto) FROM LF_VENTAS_HISTORICO_1 A;
UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM LF_VENTAS_HISTORICO_1 A;
UPDATE A SET DesArticulo = TRIM(DesArticulo) FROM LF_VENTAS_HISTORICO_1 A;
UPDATE A SET NSupervisor = TRIM(NSupervisor) FROM LF_VENTAS_HISTORICO_1 A;
UPDATE A SET TVendedor = TRIM(TVendedor) FROM LF_VENTAS_HISTORICO_1 A;
UPDATE A SET Cliente = TRIM(Cliente) FROM LF_VENTAS_HISTORICO_1 A;
UPDATE A SET NomCliente = TRIM(NomCliente) FROM LF_VENTAS_HISTORICO_1 A;

UPDATE LF_VENTAS_HISTORICO_1
SET NSupervisor ='SIN ASIGNAR'
WHERE NSupervisor = ''

UPDATE LF_VENTAS_HISTORICO_1
SET CodAlicorp = CASE CodArticulo
	WHEN '8005777' THEN '8312006'
	WHEN '8005653' THEN '3300123'
	ELSE CodAlicorp	END;

UPDATE LF_VENTAS_HISTORICO_1
SET CodAlicorp = CASE DesArticulo
	WHEN 'NUTREG BOLSA SURTIDA 200G 20BO'	THEN	'4335049'
	WHEN 'NUTREG BOLSA SURTIDA 400G 12BO'	THEN	'4335048'
	ELSE CodAlicorp END;

UPDATE LF_VENTAS_HISTORICO_1
SET	DesArticulo = 'INSECTIC SAPOL MOSC/ZANC 360ML C*12'
WHERE DesArticulo = 'INSECTIC SAPOL MOSC/ZANC 360ML';

UPDATE LF_VENTAS_HISTORICO_1
SET	CodArticulo = '8005796',
	DesArticulo = 'ALACENA MAYONESA EXP 90CC 24DPK'
WHERE CodArticulo = '8005634' AND DesArticulo = 'ALACENA MAYONESA 90CC 24DPK';	

UPDATE LF_VENTAS_HISTORICO_1
SET	CodAlicorp = '3300141'
WHERE CodAlicorp = '3300154';

UPDATE LF_VENTAS_HISTORICO_1
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128' ELSE CodAlicorp END;

--sube las notas de credito de la fabril
DROP TABLE LF_NC_HISTORICO_1
	
SELECT *
INTO LF_NC_HISTORICO_1
FROM CmiSellOutEcuador.dbo.LF_NC_HISTORICO
WHERE 1=1
	  AND YEAR(FNC) = 2022;

DELETE FROM LF_NC_HISTORICO_1 WHERE Importe = 0;

UPDATE A SET CodArticulo = TRIM(CodArticulo) FROM LF_NC_HISTORICO_1 A;
UPDATE A SET Agencia = TRIM(Agencia) FROM LF_NC_HISTORICO_1 A;
UPDATE A SET DesArticulo = TRIM(DesArticulo) FROM LF_NC_HISTORICO_1 A;
UPDATE A SET Cliente = TRIM(Cliente) FROM LF_NC_HISTORICO_1 A;
UPDATE A SET NCliente = TRIM(NCliente) FROM LF_NC_HISTORICO_1 A;

UPDATE LF_NC_HISTORICO_1
SET	CodArticulo = '8005796',
	DesArticulo = 'ALACENA MAYONESA EXP 90CC 24DPK'
WHERE CodArticulo = '8005634' AND DesArticulo = 'ALACENA MAYONESA 90CC 24DPK';

UPDATE LF_NC_HISTORICO_1
SET	DesArticulo = 'INSECTIC SAPOL MOSC/ZANC 360ML C*12'
WHERE DesArticulo = 'INSECTIC SAPOL MOSC/ZANC 360ML';

UPDATE LF_NC_HISTORICO_1
SET	DesArticulo = 'INSECTIC SAPOL PULG/GARR 360ML C*12'
WHERE DesArticulo = 'INSECTIC SAPOL PULG/GARR 360ML';

UPDATE LF_NC_HISTORICO_1
SET	DesArticulo = 'INSECTIC SAPOL MOSC/ZANC 230ML C*12'
WHERE DesArticulo = 'INSECTIC SAPOL MOSC/ZANC 230ML';



UPDATE A
SET A.CodAlicorp = B.CodAlicorp
FROM LF_NC_HISTORICO_1 A
	LEFT JOIN TABLA_MATERIALES_1 B ON A.CodArticulo = B.CodFabril AND A.DesArticulo = B.MaterialLaFabril;  
--Asignamos c�digo Alicorp a las notas de cr�dito
--SELECT * FROM NOTAS_CREDITO WHERE CodAlicorp IS NULL;

UPDATE LF_NC_HISTORICO_1
SET CodAlicorp = CASE CodArticulo
	WHEN '8005777' THEN '8312006'
	WHEN '8005653' THEN '3300123'
	ELSE CodAlicorp	END;

UPDATE LF_NC_HISTORICO_1
SET CodAlicorp = CASE DesArticulo
	WHEN 'NUTREG BOLSA SURTIDA 200G 20BO'	THEN	'4335049'
	WHEN 'NUTREG BOLSA SURTIDA 400G 12BO'	THEN	'4335048'
	ELSE CodAlicorp END;

UPDATE LF_NC_HISTORICO_1
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128' ELSE CodAlicorp END;



--Carga manual del plan historico
--TRUNCATE TABLE PLAN_LA_FABRIL_1;

--BULK INSERT PLAN_LA_FABRIL_1
--FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_LA_FABRIL_MAY.csv'
--WITH (FIELDTERMINATOR=';', FIRSTROW=2, CODEPAGE='ACP');

--DELETE PLAN_LA_FABRIL_1 WHERE Plan_Ton = 0 AND Importe = 0;

--UPDATE PLAN_LA_FABRIL_1 SET Agencia = TRIM(Agencia);
--UPDATE PLAN_LA_FABRIL_1 SET CodAlicorp = TRIM(CodAlicorp);
--UPDATE PLAN_LA_FABRIL_1 SET Fecha = '2022-05-30';


--UPDATE PLAN_LA_FABRIL_1
--SET CodAlicorp = CASE CodAlicorp
--	WHEN '8309000' THEN '8309119'
--	WHEN '8309001' THEN '8309120'
--	WHEN '8309002' THEN '8309121'
--	WHEN '8309003' THEN '8309122'
--	WHEN '8309007' THEN '8309126'
--	WHEN '3300154' THEN '3300141'
--	WHEN '3300155' THEN '3300140'
--	WHEN '8309009' THEN '8309128' ELSE CodAlicorp END;

DELETE FROM PLAN_LA_FABRIL_1 WHERE 1=1
								   AND YEAR(Fecha) = 2022
								   AND MONTH(Fecha) = 09

--borra el plan del mes actual por si hay algun cambio y lo vuelve a subir de la base de datos del so, ya que primero corres el so y luego el dash
INSERT INTO PLAN_LA_FABRIL_1
SELECT *
FROM CmiSellOutEcuador.dbo.PLAN_LA_FABRIL;


IF OBJECT_ID(N'tempdb..#VENTAS_Y_NOTAS_CREDITO_1') IS NOT NULL DROP TABLE #VENTAS_Y_NOTAS_CREDITO_1;
--Creo tabla temporal para unir las ventas, las notas de cr�dito y el plan con los campos que se requiere
SELECT A.FFactura Fecha, A.Agencia Agencia, A.Cliente CodClienteSellOut, A.NomCliente ClienteSellOut,A.NSupervisor Vendedor_Distribuidora, TVendedor Tipo_tienda_Distribuidora, A.CodArticulo CodLaFabril, A.CodAlicorp CodAlicorp,
	   A.FacUnitario, A.TUnidades, 0 Plan_Ton, A.Kilos VentaKil, 0 Plan_Dol, A.Importe VentaDolares
INTO #VENTAS_Y_NOTAS_CREDITO_1 
FROM LF_VENTAS_HISTORICO_1 A;  
--SELECT * FROM #VENTAS_Y_NOTAS_CREDITO_1  WHERE  Plan_Ton =0 AND VentaKil = 0 AND Plan_Dol = 0 AND VentaDolares = 0
--select distinct CodClienteSellOut from #VENTAS_Y_NOTAS_CREDITO_1 where year(Fecha) = 2022 and month(Fecha) = 05 and VentaDolares > 0
INSERT INTO #VENTAS_Y_NOTAS_CREDITO_1 
SELECT A.FNC Fecha, A.Agencia Agencia, A.Cliente CodClienteSellOut, NCliente ClienteSellOut, 'SIN ASIGNAR - NC' Vendedor_Distribuidora,'SIN ASIGNAR - NC' Tipo_tienda_Distribuidora, A.CodArticulo CodLaFabril, A.CodAlicorp CodAlicorp,
		0 FacUnitario, 0 TUnidades, 0 Plan_Ton, 0 VentaKil, 0 Plan_Dol,  A.Importe VentaDolares
FROM LF_NC_HISTORICO_1  A;

ALTER TABLE #VENTAS_Y_NOTAS_CREDITO_1 ALTER COLUMN Plan_Ton FLOAT;
ALTER TABLE #VENTAS_Y_NOTAS_CREDITO_1 ALTER COLUMN Plan_Dol FLOAT;

 INSERT INTO #VENTAS_Y_NOTAS_CREDITO_1
 SELECT P.Fecha Fecha, P.Agencia, 'SIN ASIGNAR - LF_PLAN' CodClienteSellOut, 'SIN ASIGNAR - LF_PLAN' ClienteSellOut, 'SIN ASIGNAR - LF_PLAN' Vendedor_Distribuidora, 'SIN ASIGNAR - LF_PLAN' Tipo_tienda_Distribuidora, 'NC' CodLaFabril, P.CodAlicorp CodAlicorp,
		0 FacUnitario, 0 TUnidades, P.Plan_Ton, 0 VentaKil, P.Importe Plan_Dol , 0 VentaDolares
 FROM PLAN_LA_FABRIL_1 P



--- UPDATE A LAS AGENCIAS QUE NO SE ENCUENTRAN EN EL MAESTRO AGENCIAS
UPDATE #VENTAS_Y_NOTAS_CREDITO_1  
SET Agencia = 'AGG'
WHERE Agencia = 'DCG'

UPDATE #VENTAS_Y_NOTAS_CREDITO_1
SET Agencia = 'AGM'
WHERE Agencia = 'DCM'

UPDATE #VENTAS_Y_NOTAS_CREDITO_1
SET Agencia = 'AGM'
WHERE Agencia = 'PTA'

UPDATE #VENTAS_Y_NOTAS_CREDITO_1
SET Agencia = 'AGA'
WHERE Agencia = 'AMA'
--AMA ES UNA AGENCIA DE AGA


IF OBJECT_ID(N'tempdb..#VENTAS_Y_NOTAS_1') IS NOT NULL DROP TABLE #VENTAS_Y_NOTAS_1;
--Creo tabla temporal para darle formato varchar a la fecha
SELECT CONVERT(VARCHAR(20), V.Fecha,103) Fecha, V.Agencia, V.CodClienteSellOut, V.ClienteSellOut, V.CodAlicorp,
	   V.FacUnitario, V.TUnidades,V.Plan_Ton, V.Ventakil, V.Plan_Dol, V.VentaDolares
INTO #VENTAS_Y_NOTAS_1
FROM #VENTAS_Y_NOTAS_CREDITO_1 V

UPDATE #VENTAS_Y_NOTAS_1 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%';

UPDATE #VENTAS_Y_NOTAS_1
SET Agencia = 'NC'
WHERE Agencia = ''

UPDATE #VENTAS_Y_NOTAS_1
SET Agencia = 'NC'
WHERE Agencia is null;


TRUNCATE TABLE BASE_FINAL;

INSERT INTO BASE_FINAL
SELECT AG.Agrupacion_Distribuidora Grupo_Cliente, F.Periodo Periodo, AG.Agencia_Distribuidora Distribuidora, A.CodClienteSellOut Cliente_Dist,
	   AG.Territorio Territorio, AG.Zona_Clientes Zona_Clientes,
   	   M.Plataforma Plataforma, CONCAT(M.CodMarca,' ',M.Marca) Marca, M.CodMarca Marcacod, M.Marca Marcadesc, CONCAT(M.CodFamilia,' ',M.Familia) Familia, M.CodFamilia Familiacod, M.Familia Familiadesc,
	   CONCAT(M.CodCategoria,' ', M.Categoria) Categoria, M.CodCategoria Categoriacod, M.Categoria Categoriadesc, M.Material Material, A.CodAlicorp Materialcod, M.Material Materialdesc,
	   CONVERT(DATE,A.Fecha,103) Fecha, ISNULL(A.VentaDolares,0) Real_USD, A.Plan_Dol*1000 Plan_USD,	 
	   0 Clientes_Activos, ISNULL(A.VentaDolares,0)/@dm1 * @DMAX	PROY_LIN_DOL, 0.96
--SELECT *
FROM #VENTAS_Y_NOTAS_1 A
	LEFT JOIN BD_FECHAS_1 F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP_1 M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS_1 AG ON A.Agencia = AG.Agencia





	-------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--Hularuss


----Coloco el mes en curso
--DELETE FROM HULARUSS_HISTORICO WHERE LEFT(Fecha,7) = '2022-06';


----ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN Importe VARCHAR(100);
--ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN VentaKilos VARCHAR(100);
--ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN importe VARCHAR(100);
--ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN Cantidad VARCHAR(100);

--DECLARE @HULARUSS VARCHAR(MAX);
--SELECT @HULARUSS = BULKCOLUMN FROM 
--OPENROWSET(BULK 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\junios.json', SINGLE_BLOB) JSON;
--IF (ISJSON(@HULARUSS) = 1)
--INSERT INTO HULARUSS_HISTORICO
--SELECT *
--FROM OPENJSON(@HULARUSS)
--WITH (
--	CanalSR VARCHAR (100),
--	Ruta VARCHAR (100),
--	customernum VARCHAR(100),
--	invoicenum VARCHAR(100),
--	Fecha DATE,
--	status VARCHAR(100),
--	inventorynum VARCHAR(100),
--	description VARCHAR(100),
--	Cantidad VARCHAR(100),
--	Precio VARCHAR(100),
--	Valor VARCHAR(100),
--	Empaque VARCHAR(100),
--	PesoTot VARCHAR(100),
--	Territorio VARCHAR(100),
--	Vendedor VARCHAR(100),
--	Categoria VARCHAR(100)
--)
--WHERE YEAR(Fecha) = 2022 AND MONTH(Fecha) = 06;


----BULK INSERT HULARUSS_HISTORICO
----FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\VentasHularuss_JUN.csv'
----WITH (FIELDTERMINATOR= ';', FIRSTROW=2, CODEPAGE='ACP');


----SET LANGUAGE US_ENGLISH;

--UPDATE HULARUSS_HISTORICO
--SET Cantidad = REPLACE(Cantidad,',','')
--WHERE CHARINDEX(',',Cantidad) > 0;

--UPDATE HULARUSS_HISTORICO
--SET importe = REPLACE(importe,',','')
--WHERE CHARINDEX(',',importe) > 0;

--UPDATE HULARUSS_HISTORICO
--SET VentaKilos = REPLACE(VentaKilos,',','')
--WHERE CHARINDEX(',',VentaKilos) > 0;

--ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN VentaKilos FLOAT;
--ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN importe FLOAT;
--ALTER TABLE HULARUSS_HISTORICO ALTER COLUMN Cantidad DECIMAL (18,2);


DROP TABLE HULARUSS;
--subes la data de ventas historica
 SELECT *
 INTO HULARUSS
 FROM CmiSellOutEcuador.dbo.HULARUSS_HISTORICO

 UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM HULARUSS A;
UPDATE A SET Agencia = TRIM(Agencia) FROM HULARUSS A;
UPDATE A SET Empaque = TRIM(Empaque) FROM HULARUSS A;
UPDATE A SET CodClienteSellOut = TRIM(CodClienteSellOut) FROM HULARUSS A
UPDATE A SET Canal = TRIM(Canal) FROM HULARUSS A

UPDATE HULARUSS SET CodAlicorp = REPLACE(CodAlicorp, 'A', '') WHERE CodAlicorp NOT LIKE '%PROMO%'


--DELETE FROM HULARUSS WHERE CodAlicorp LIKE '%PROMO%';
DELETE FROM HULARUSS WHERE CodAlicorp = 'BNDEO - 002';
DELETE FROM HULARUSS WHERE Importe IS NULL;
DELETE FROM HULARUSS WHERE Canal IS NULL;

DELETE FROM HULARUSS WHERE Importe =0;
--Ver este delete

DELETE FROM HULARUSS WHERE agencia IS NULL; 

UPDATE HULARUSS
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128' 
	WHEN '335015' THEN '4335015' 
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;

UPDATE A SET A.Cantidad = A.Cantidad*M.FacUnitario FROM HULARUSS A
	LEFT JOIN MAESTRO_ALICORP_1 M ON A.CodAlicorp = M.CodAlicorp
	WHERE Empaque <> 'Unidad'
--cuando su empaque no es unidad calculamos la cantidad de unidades compradas

UPDATE A SET A.Ventakilos = (A.Cantidad * M.PesoKG) FROM HULARUSS A 
	LEFT JOIN MAESTRO_ALICORP_1 M ON A.CodAlicorp = M.CodAlicorp
	WHERE A.Ventakilos = 0 OR A.Ventakilos IS NULL
--calculamos los kilos
UPDATE A SET A.Canal = 'MAYORISTAS' FROM HULARUSS A 
	WHERE  A.Canal <> 'TAT'
--tat son minoristas

--Creo tabla temporal para homologar los campos y darle formato a la fecha, tambien calculo las toneladas
IF OBJECT_ID(N'tempdb..#HULARUSS_1') IS NOT NULL DROP TABLE #HULARUSS_1;

SELECT CONVERT(VARCHAR(20), A.Fecha,103) Fecha, A.Agencia Agencia, A.CodClienteSellOut, A.CodAlicorp CodAlicorp,
	   M.FacUnitario FacUnitario, A.Cantidad TUnidades, 0  Plan_Ton, VentaKilos VentaKil, 0 Plan_Dol, A.Importe VentaDolares
INTO #HULARUSS_1
--SELECT *
FROM HULARUSS A
	LEFT JOIN MAESTRO_ALICORP_1 M ON A.CodAlicorp = M.CodAlicorp
WHERE A.Canal = 'MAYORISTAS';
--SELECT * FROM #HULARUSS_1
DELETE FROM #HULARUSS_1 WHERE VentaKil = 0 AND  VentaDolares = 0;
DELETE FROM #HULARUSS_1 WHERE FacUnitario IS NULL;
DELETE FROM #HULARUSS_1 WHERE CodAlicorp LIKE '%PROMO%' AND RIGHT(Fecha,7) IN ('04/2022', '05/2022', '06/2022', '07/2022','08/2022')
--elimina los meses previo al cambio, ya que en estos no se considerara la promociones,,si quisieran en algun momento que se haga quitarlo

ALTER TABLE #HULARUSS_1 ALTER COLUMN Plan_Ton FLOAT;
ALTER TABLE #HULARUSS_1 ALTER COLUMN Plan_Dol FLOAT;

UPDATE #HULARUSS_1
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%'

--SELECT SUM(VentaDolares) FROM #HULARUSS_1 WHERE Fecha LIKE '%/06/2022'
--Inserto plan Hularuss


--TRUNCATE TABLE PLAN_HULARUSS;

--BULK INSERT PLAN_HULARUSS
--FROM 'C:\Proyectos\Ecuador\HULARUSS\NuevoPlanHularussFormato.csv'
--WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

--DELETE FROM NuevoPlanHularussFormato WHERE CodAlicorp LIKE '%TOTAL%'

--UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM NuevoPlanHularussFormato A;
--UPDATE A SET Canal = TRIM(Canal) FROM NuevoPlanHularussFormato A;
--UPDATE NuevoPlanHularussFormato SET CodAlicorp = LEFT(CodAlicorp,CHARINDEX(' ',CodAlicorp)-1);
--UPDATE NuevoPlanHularussFormato SET Fecha = @dia 
--@dia debe ser igual a al mes y a�o al que corresponde el plan

--elimino el plan acutal por si hay algun cambio
DELETE FROM PLAN_HULARUSS WHERE 1=1
								AND YEAR(Fecha) = 2022
								AND MONTH(Fecha) = 09
--lo vuelvo a subir de la base de datos del so, ya que esta se corre primero
INSERT INTO PLAN_HULARUSS
SELECT *
FROM CmiSellOutEcuador.dbo.NuevoPlanHularussFormato


--vuelvo la tabla pivot en un formato tabular
IF OBJECT_ID(N'tempdb..#HULARUSS_PLAN_NUEVO_1') IS NOT NULL DROP TABLE #HULARUSS_PLAN_NUEVO_1;

SELECT Fecha, Canal, CodAlicorp, NomOficina, MontoCantidad
INTO #HULARUSS_PLAN_NUEVO_1
FROM
(SELECT * FROM PLAN_HULARUSS) PLAN_HULARUSS
UNPIVOT
(MontoCantidad FOR NomOficina IN (AMBATO,AMBATO_TN,CHONE,CHONE_TN,CUENCA,CUENCA_TN,ESMERALDAS,ESMERALDAS_TN,GUAYAQUIL,GUAYAQUIL_TN,IBARRA,IBARRA_TN,LOJA,LOJA_TN,MACHALA,MACHALA_TN,
MANABI,MANABI_TN,MILAGRO,MILAGRO_TN,ORIENTE,ORIENTE_TN,QUEVEDO,QUEVEDO_TN,QUITO,QUITO_TN,[SANTA ELENA],[SANTA ELENA_TN],[SANTO DGO],[SANTO DGO_TN])) AS PLAN_UNPIVOT

UPDATE A SET Canal = 'MINORISTAS' FROM #HULARUSS_PLAN_NUEVO_1 A  WHERE Canal = 'TIENDA';

DELETE FROM #HULARUSS_PLAN_NUEVO_1 WHERE NomOficina IN ('CHONE', 'CHONE_TN', 'ORIENTE', 'ORIENTE_TN' )
--se eliminan ya queno se consideraran estas agencias
IF OBJECT_ID(N'tempdb..#HULARUSS_PLAN_NUEVO_TON_1') IS NOT NULL DROP TABLE #HULARUSS_PLAN_NUEVO_TON_1;
--separo lo campos de peso
SELECT *
INTO #HULARUSS_PLAN_NUEVO_TON_1
FROM #HULARUSS_PLAN_NUEVO_1
WHERE NomOficina IN('AMBATO_TN','CHONE_TN','CUENCA_TN','ESMERALDAS_TN','GUAYAQUIL_TN',
'IBARRA_TN','LOJA_TN','MACHALA_TN','MANABI_TN','MILAGRO_TN','ORIENTE_TN','QUEVEDO_TN',
'QUITO_TN','SANTA ELENA_TN','SANTO DGO_TN')

UPDATE A SET NomOficina = LEFT(NomOficina,LEN(NomOficina)-3) FROM #HULARUSS_PLAN_NUEVO_TON_1 A;
--SELECT * FROM #HULARUSS_PLAN_NUEVO_TON WHERE MontoCantidad IS NULL

IF OBJECT_ID(N'tempdb..#HULARUSS_PLAN_NUEVO_DOL_1') IS NOT NULL DROP TABLE #HULARUSS_PLAN_NUEVO_DOL_1;
--separo los campos de dolares
SELECT *
INTO #HULARUSS_PLAN_NUEVO_DOL_1
FROM #HULARUSS_PLAN_NUEVO_1
WHERE NomOficina IN('AMBATO','CHONE','CUENCA','ESMERALDAS','GUAYAQUIL',
'IBARRA','LOJA','MACHALA','MANABI','MILAGRO','ORIENTE','QUEVEDO',
'QUITO','SANTA ELENA','SANTO DGO')

IF OBJECT_ID(N'tempdb..#HULARUSS_PLAN_NUEVO_MAYOR_1') IS NOT NULL DROP TABLE #HULARUSS_PLAN_NUEVO_MAYOR_1;
--uno peso con dolares en una sola tabla
SELECT CONVERT(VARCHAR(20),A.Fecha,103) Fecha, A.Canal Canal, A.CodAlicorp CodAlicorp, A.NomOficina, A.MontoCantidad Plan_Ton, B.MontoCantidad Plan_Dol
INTO #HULARUSS_PLAN_NUEVO_MAYOR_1
FROM #HULARUSS_PLAN_NUEVO_TON_1 A 
	LEFT JOIN #HULARUSS_PLAN_NUEVO_DOL_1 B ON A.CodAlicorp = B.CodAlicorp AND A.NomOficina = B.NomOficina AND A.Canal = B.Canal AND A.Fecha = B.Fecha
WHERE A.Canal = 'MAYORISTAS'

DELETE #HULARUSS_PLAN_NUEVO_MAYOR_1 WHERE Plan_Dol = 0 AND Plan_Ton = 0;

--select SUM(Plan_Ton) FROM #HULARUSS_PLAN_NUEVO_MAYOR

UPDATE #HULARUSS_PLAN_NUEVO_MAYOR_1 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%'

UPDATE #HULARUSS_PLAN_NUEVO_MAYOR_1
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128'
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;

--SELECT * FROM #HULARUSS_PLAN_NUEVO_MAYOR_1 WHERE FECHA = '10/07/2022'
--Inserto Hularuss
--DECLARE @dm1 INT;
--DECLARE @DMAX INT;
--SELECT @dm1 = 26
--SELECT @DMAX = 26

INSERT INTO BASE_FINAL
SELECT AG.Agrupacion_Distribuidora Grupo_Cliente, F.Periodo Periodo, AG.Agencia_Distribuidora Distribuidora, A.CodClienteSellOut Cliente_Dist,
	   AG.Territorio Territorio, AG.Zona_Clientes Zona_Clientes,
	   M.Plataforma Plataforma, CONCAT(M.CodMarca,' ',M.Marca) Marca, M.CodMarca Marcacod, M.Marca Marcadesc, CONCAT(M.CodFamilia,' ',M.Familia) Familia, M.CodFamilia Familiacod, M.Familia Familiadesc,
	   CONCAT(M.CodCategoria,' ', M.Categoria) Categoria, M.CodCategoria Categoriacod, M.Categoria Categoriadesc, M.Material Material, A.CodAlicorp Materialcod, M.Material Materialdesc,
	   CONVERT(DATE,A.Fecha,103) Fecha, ISNULL(A.VentaDolares,0) Real_USD, A.Plan_Dol Plan_USD,	 
	   0 Clientes_Activos, ISNULL(A.VentaDolares,0)/@dm1 * @DMAX	PROY_LIN_DOL, 0.96
--select distinct Fecha
FROM #HULARUSS_1 A
	LEFT JOIN BD_FECHAS_1 F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP_1 M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS_1 AG ON A.Agencia = AG.Agencia
--select SUM(Plan_USD) from BASE_FINAL where Grupo_Cliente = 'la fabril'


--Inserto plan Hularuss

INSERT INTO BASE_FINAL
SELECT AG.Agrupacion_Distribuidora Grupo_Cliente, F.Periodo Periodo, AG.Agencia_Distribuidora Distribuidora, 'SIN ASIGNAR - HU' Cliente_Dist,
	   AG.Territorio Territorio, AG.Zona_Clientes Zona_Clientes,
	   M.Plataforma Plataforma, CONCAT(M.CodMarca,' ',M.Marca) Marca, M.CodMarca Marcacod, M.Marca Marcadesc, CONCAT(M.CodFamilia,' ',M.Familia) Familia, M.CodFamilia Familiacod, M.Familia Familiadesc,
	   CONCAT(M.CodCategoria,' ', M.Categoria) Categoria, M.CodCategoria Categoriacod, M.Categoria Categoriadesc, M.Material Material, A.CodAlicorp Materialcod, M.Material Materialdesc,
	   CONVERT(DATE,A.Fecha,103) Fecha, 0 Real_USD, A.Plan_Dol Plan_USD,	 
	   0 Clientes_Activos, 0, 0
--SELECT *
FROM #HULARUSS_PLAN_NUEVO_MAYOR_1 A
	LEFT JOIN BD_FECHAS_1 F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP_1 M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS_1 AG ON A.NomOficina = AG.NomOficina

--SELECT DISTINCT PERIODO FROM BASE_FINAL WHERE GRUPO_CLIENTE = 'HULARUSS' AND PERIODO = 'NULL'
--SELECT *  FROM BASE_FINAL WHERE GRUPO_CLIENTE = 'HULARUSS' AND PERIODO IS NULL
--SELECT  * FROM BASE_FINAL WHERE Grupo_Cliente IS NULL
--SELECT  * FROM BASE_FINAL WHERE Periodo IS NULL 
--SELECT  * FROM BASE_FINAL WHERE Familia IS NULL
--SELECT  * FROM BASE_FINAL WHERE Materialcod IS NULL
--SELECT  * FROM BASE_FINAL WHERE Plan_USD IS NULL
--SELECT SUM(Real_USD) FROM BASE_FINAL WHERE GRUPO_CLIENTE = 'HULARUSS' AND PERIODO = '6_2022'