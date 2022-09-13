USE TABLERO_ECUADOR3;

SET LANGUAGE US_ENGLISH;

DECLARE @dia DATE;
DECLARE @workday INT;
--Dia hábil de la fecha
DECLARE @workday_MA INT;
--Dia hábil que hay en el mes anterior
DECLARE @d1 AS VARCHAR(20);

SELECT @dia= DATEADD(DAY,-1,SYSDATETIME());
-- poner el último día de ventas
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



--TRUNCATE TABLE KPIS;
 
--BULK INSERT KPIS
--FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\KPIS_JUL.csv'
--WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

--PONER EL PERIODO
--UPDATE KPIS SET Periodo = '7_2022' WHERE 1=1
--AND Periodo IS NULL

--------------------------------------------------------------------------------------------------------------
--codigo de formato anterior
--UPDATE KPIS SET Agencia_Distribuidora = CASE Agencia_Distribuidora
--WHEN 'Xavier Morales' THEN 'D-MEX CIA.LTDA.'
--WHEN 'PULLA VIMOS LOURDES CATALINA' THEN 'PULLA'
--WHEN 'HARO ZAMORA IVAN' THEN 'HARO'
--WHEN 'BARNUEVO VALAREZO & GCP CIA LTDA' THEN 'BARNUEVO VALAREZO &GCP CIAL LTDA'
--WHEN 'D LOGIS CODILOGIS CIA. LTDA.' THEN 'D LOGIS CODILOGIS CIA LTDA'
--WHEN 'MARVECOBE S.A 'THEN 'MARVECOBE S.A'
--WHEN 'SEGUNDO MIGUEL ALVAREZ TORRES' THEN 'ALVAREZ' ELSE Agencia_Distribuidora END

--UPDATE KPIS SET Agrupacion_Distribuidora = CASE Agrupacion_Distribuidora
--WHEN 'Panal' THEN 'PANALES'
--WHEN 'SM' THEN '2MALLA'
--WHEN 'MD' THEN 'HULARUSS' ELSE Agrupacion_Distribuidora END

--UPDATE KPIS SET Territorio = 'Todas' WHERE Territorio IS NULL;

--UPDATE KPIS SET Agencia_Distribuidora = 'Todas' WHERE Agencia_Distribuidora like 'tota%'

 
--UPDATE A SET A.Territorio = M.Territorio
--FROM KPIS A JOIN MAESTRO_AGENCIAS_1 M ON A.Agencia_Distribuidora = M.Agencia_Distribuidora

--UPDATE A SET A.[Zona_Clientes] = M.[Zona_Clientes]
--FROM KPIS A JOIN MAESTRO_AGENCIAS_1 M ON A.Agencia_Distribuidora = M.Agencia_Distribuidora

--UPDATE KPIS SET [Plataforma] = CASE [Plataforma]
--WHEN 'HC' THEN 'Home Care'
--WHEN 'FOOD' THEN 'Foods' ELSE [Plataforma] END

--UPDATE KPIS SET Plataforma = TRIM(Plataforma);
--UPDATE KPIS SET Categoria = TRIM(Categoria);
--UPDATE KPIS SET Canal = TRIM(Canal);
--UPDATE KPIS SET Agrupacion_Distribuidora = TRIM(Agrupacion_Distribuidora);
--UPDATE KPIS SET Territorio = TRIM(Territorio);
--UPDATE KPIS SET Agencia_Distribuidora = TRIM(Agencia_Distribuidora);
--UPDATE KPIS SET Zona_Clientes = TRIM(Zona_Clientes);
--UPDATE KPIS SET Familia = TRIM(Familia);


--UPDATE KPIS SET [Categoria] = CASE [Categoria]
--WHEN 'PASTAS' THEN 'Pastas'
--WHEN 'SALSAS' THEN 'Salsas'
--WHEN 'DESINFECTANTES' THEN 'Limpiadores Light Du'
--WHEN 'DESINFECTANTE' THEN 'Limpiadores Light Du'
--WHEN 'INSECTICIDAS' THEN 'Insecticidas'
--WHEN 'LEJIAS' THEN 'Lejias'
--WHEN 'LAVAVAJILLAS' THEN 'Lavavajillas'
--WHEN 'DETERGENTE' THEN 'Lavavajillas'
--WHEN 'DETERGENTES' THEN 'Detergentes' ELSE [Categoria] END


--UPDATE KPIS SET Zona_Clientes = 'Todas' WHERE Zona_Clientes = 'NACIONAL';
--UPDATE KPIS SET Plataforma = 'Todas' WHERE Plataforma = 'TODAS';
--UPDATE KPIS SET Categoria = 'Todas' WHERE Categoria = 'TODAS';

--IF OBJECT_ID('KPI_1') IS NOT NULL DROP TABLE KPI_1;

--SELECT  Periodo, [Agrupacion_Distribuidora]  Grupo_Cliente
--	  ,[Agencia_Distribuidora] Cliente
--      ,[Territorio]
--      ,[Zona_Clientes] Zona_Clientes
--      ,[Plataforma]
--      ,[Categoria]
--      ,[Clientes con Compra]
--      ,[Ticket promedio]
--      ,[Mix de Categoria]
--      ,[Mix de Familia]    
--INTO KPI_1
--FROM KPIS A
--WHERE Canal = 'Tienda'
----Tienda es Minoristas


--UPDATE KPI_1  SET [Clientes con Compra] = REPLACE([Clientes con Compra],',','')
--UPDATE KPI_1  SET [Ticket promedio] = REPLACE([Ticket promedio],',','')

--DELETE FROM KPI_1 WHERE Cliente IN  ('Representaciones J.Leonardo Soria ',
--             'PRODISPRO CIA.LTDA', 'OLGER ARMIJOS DISTRIBUCIONES S.A.S ','FREDVY S.A.', 'CONTRERAS DELGADO WASHINGTON')

--ALTER TABLE KPI_1 ALTER COLUMN [Clientes con Compra]  FLOAT;
--ALTER TABLE KPI_1 ALTER COLUMN [Ticket promedio]  FLOAT;

----SELECT * FROM [INDICADORES_KPI]

--TRUNCATE TABLE INDICADORES_KPI;

--INSERT INTO INDICADORES_KPI
--SELECT A.Periodo, A.Grupo_Cliente, A.Cliente, A.Territorio,
--      A.Zona_Clientes, A.Plataforma, A.Categoria, MAX(A.[Clientes con Compra]),
--		MAX(A.[Ticket promedio]), MAX(A.[Mix de Categoria]),MAX(A.[Mix de Familia])
--FROM KPI_1 A
--GROUP BY A.Periodo, A.Grupo_Cliente, A.Cliente, A.Territorio, A.Zona_Clientes, A.Plataforma, A.Categoria
----------------------------------------------------------------------------


---REFORMULAR CARGA DE KPIS
--TRUNCATE TABLE INDICADORES_KPI;


-----------------------------------------------------------------------------------
---------------------------------------------------------------------------------
--Usar este código cuando suba nuevo mes

--BULK INSERT INDICADORES_KPI
--FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\KPIS_AGO.csv'
--WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

--DELETE FROM INDICADORES_KPI WHERE Cliente = 'COPARESA S.A.';


----PONER ESTE UPDATE CUANDO TENGA EL NUEVO FORMATO DE LA PLANTILLA KPIS
--UPDATE  INDICADORES_KPI SET Grupo_Cliente = '2MALLA' WHERE Grupo_Cliente = '_2MALLA'
--UPDATE  INDICADORES_KPI SET Grupo_Cliente = 'LA FABRIL' WHERE Grupo_Cliente = 'LA_FABRIL'
--UPDATE  INDICADORES_KPI SET Plataforma = 'Home Care' WHERE Plataforma = 'Home_Care'
--UPDATE  INDICADORES_KPI SET Categoria = 'Limpiadores Light Du' WHERE Categoria = 'Limpiadores_Light_Du'

----Hacer este update hasta el proximo mes que lo corrijan
--UPDATE  INDICADORES_KPI SET Cliente =  CASE Cliente
--								WHEN 'SEGUNDO MIGUEL ALVAREZ TORRES' THEN 'ALVAREZ'
--								WHEN 'BARNUEVO VALAREZO & GCP CIA LTDA' THEN 'BARNUEVO VALAREZO &GCP CIAL LTDA'
--								WHEN 'D LOGIS CODILOGIS CIA. LTDA.' THEN 'D LOGIS CODILOGIS CIA LTDA'
--								WHEN 'HARO ZAMORA IVAN' THEN 'HARO'
--								WHEN 'MARVECOBE S.A ' THEN 'MARVECOBE S.A'
--								WHEN 'PULLA VIMOS LOURDES CATALINA' THEN 'PULLA' ELSE Cliente END;

--UPDATE INDICADORES_KPI SET TipoCliente = TRIM(TipoCliente);
--UPDATE INDICADORES_KPI SET Cliente = TRIM(Cliente);
   
								
-----------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------



--Inserto Codify


DROP TABLE CODIFY_HISTORICA_1;

SELECT *
INTO CODIFY_HISTORICA_1
FROM CmiSellOutEcuador.dbo.CODIFY_HISTORICA;

--SET LANGUAGE SPANISH;

--DELETE FROM CODIFY_HISTORICA WHERE LEFT(Fecha,7) = '2022-07';

--BULK INSERT CODIFY_HISTORICA_1
--FROM 'C:\Proyectos\Ecuador\PANALES\CODIFY_julio.csv'
--WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

DELETE FROM CODIFY_HISTORICA_1 WHERE CodAlicorp IS NULL;



UPDATE CODIFY_HISTORICA_1
SET VentaDolares = REPLACE(VentaDolares,',','')
WHERE CHARINDEX(',', VentaDolares) > 0;

UPDATE CODIFY_HISTORICA_1
SET VentaTon = REPLACE(VentaTon,',','')
WHERE CHARINDEX(',', VentaTon) > 0;

UPDATE CODIFY_HISTORICA_1
SET VentaDolares = REPLACE(VentaDolares,'$','')
WHERE CHARINDEX('$', VentaDolares) > 0;


ALTER TABLE CODIFY_HISTORICA_1 ALTER COLUMN VentaDolares FLOAT;
ALTER TABLE CODIFY_HISTORICA_1 ALTER COLUMN VentaTon FLOAT;


--SET LANGUAGE US_ENGLISH;

DELETE CODIFY_HISTORICA_1 WHERE CodAlicorp IS NULL;
DELETE CODIFY_HISTORICA_1 WHERE CodAlicorp = '';
DELETE FROM CODIFY_HISTORICA_1 WHERE VentaDolares = 0;
DELETE FROM CODIFY_HISTORICA_1 WHERE VentaDolares IS NULL;

UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM CODIFY_HISTORICA_1 A;
UPDATE A SET CodClienteSellOut = TRIM(CodClienteSellOut) FROM CODIFY_HISTORICA_1 A;
UPDATE A SET Agencia = TRIM(Agencia) FROM CODIFY_HISTORICA_1 A;

UPDATE CODIFY_HISTORICA_1
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128' 
	WHEN 'P.3300147' THEN '3300147'
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;










DROP TABLE BASE_MOBILVENDOR_AUTOMATICA_1;

SELECT *
INTO BASE_MOBILVENDOR_AUTOMATICA_1
FROM CmiSellOutEcuador.dbo.BASE_PANALES_HISTORICA;


DELETE FROM BASE_MOBILVENDOR_AUTOMATICA_1 WHERE Importe = 0;
DELETE FROM BASE_MOBILVENDOR_AUTOMATICA_1 WHERE Importe IS NULL;
--DELETE FROM BASE_MOBILVENDOR_AUTOMATICA_1 WHERE Fecha = '2022-09-13';

UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = [Codigo Articulo] WHERE CodAlicorp IS NULL;
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = [Codigo Articulo] WHERE CodAlicorp = 'null';
UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM BASE_MOBILVENDOR_AUTOMATICA_1 A;
UPDATE A SET Agencia = TRIM(Agencia) FROM BASE_MOBILVENDOR_AUTOMATICA_1 A;
UPDATE A SET Usuario = TRIM(Usuario) FROM BASE_MOBILVENDOR_AUTOMATICA_1 A;
UPDATE A SET TipoNegocio = TRIM(TipoNegocio) FROM BASE_MOBILVENDOR_AUTOMATICA_1 A;
UPDATE A SET [Codigo Cliente] = TRIM([Codigo Cliente]) FROM BASE_MOBILVENDOR_AUTOMATICA_1 A;
UPDATE A SET [Nombre Cliente] = TRIM([Nombre Cliente]) FROM BASE_MOBILVENDOR_AUTOMATICA_1 A;

DELETE FROM BASE_MOBILVENDOR_AUTOMATICA_1 WHERE Agencia IS NULL; 
--PREGUNTAR HASTA CUANDO ES ESTE UPDATE

UPDATE BASE_MOBILVENDOR_AUTOMATICA_1
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

UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '29113' WHERE CodAlicorp = 'AD0237';
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '29135' WHERE CodAlicorp = 'AD0239';
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8410094' WHERE CodAlicorp = 'AD0236';
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8410093' WHERE CodAlicorp = 'AD0235';
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '29121' WHERE CodAlicorp = 'AD0238';
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '3300176' WHERE CodAlicorp = 'AD0245';
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '4302037' WHERE CodAlicorp = 'AD0240';
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8325017' WHERE CodAlicorp = 'AD0222';
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8325021' WHERE CodAlicorp = 'AD0223';
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '3300063' WHERE CodAlicorp = 'AD0244';
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8305209' WHERE CodAlicorp = '83052090';

UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '4302045' WHERE CodAlicorp = '4302045-1';

----cambios solo para agosto 2022

UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '3300222' WHERE CodAlicorp = '0861' AND Agencia = '1000027692';
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '3305229' WHERE CodAlicorp = '2560' AND Agencia = '1000027692';
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '3300222' WHERE CodAlicorp = '0044' AND Agencia = '1000027692';
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '3300222' WHERE CodAlicorp = '0045' AND Agencia = '1000027692';
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8320003' WHERE CodAlicorp = '0885' AND Agencia = '1000027692';	
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '4302044' WHERE CodAlicorp = '0064' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8320032' WHERE CodAlicorp = '0992' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8320031' WHERE CodAlicorp = '0991' AND Agencia = '1000027692';			
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '4504072' WHERE CodAlicorp = '1967' AND Agencia = '1000027692';	
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '4504048' WHERE CodAlicorp = '0076' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '4504047' WHERE CodAlicorp = '0077' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '4527198' WHERE CodAlicorp = '1966' AND Agencia = '1000027692';			
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '9051019' WHERE CodAlicorp = '0876' AND Agencia = '1000027692';	
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8317130' WHERE CodAlicorp = '0771' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '9051020' WHERE CodAlicorp = '0878' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '9051021' WHERE CodAlicorp = '0877' AND Agencia = '1000027692';			
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8315000' WHERE CodAlicorp = '2377' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8317131' WHERE CodAlicorp = '0768' AND Agencia = '1000027692';			
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8305218' WHERE CodAlicorp = '0763' AND Agencia = '1000027692';	
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8305215' WHERE CodAlicorp = '0829' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8317133' WHERE CodAlicorp = '0769' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8317145' WHERE CodAlicorp = '2050' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8305211' WHERE CodAlicorp = '0875' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8303007' WHERE CodAlicorp = '0737' AND Agencia = '1000027692';			
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8317144' WHERE CodAlicorp = '2051' AND Agencia = '1000027692';	
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8305222' WHERE CodAlicorp = '1904' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8305223' WHERE CodAlicorp = '1905' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8305224' WHERE CodAlicorp = '1906' AND Agencia = '1000027692';	
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8315031' WHERE CodAlicorp = '1050' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8309126' WHERE CodAlicorp = '1052' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8315044' WHERE CodAlicorp = '1003' AND Agencia = '1000027692';			
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '4335030' WHERE CodAlicorp = '2637' AND Agencia = '1000027692';	
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '4335041' WHERE CodAlicorp = '2570' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '4335038' WHERE CodAlicorp = '2562' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '4335039' WHERE CodAlicorp = '2569' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '4335025' WHERE CodAlicorp = '2565' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '4335022' WHERE CodAlicorp = '2564' AND Agencia = '1000027692';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8325013' WHERE CodAlicorp = '1903' AND Agencia = '1000027692';		

UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8309128' WHERE CodAlicorp = 'ALH36' AND Agencia = '1000027653';	
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8410174' WHERE CodAlicorp = 'ALH01' AND Agencia = '1000027653';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8410115' WHERE CodAlicorp = 'ALH043' AND Agencia = '1000027653';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '4302053' WHERE CodAlicorp = 'AL03' AND Agencia = '1000027653';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '29337' WHERE CodAlicorp = 'AL19' AND Agencia = '1000027653';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8325017' WHERE CodAlicorp = 'ALH10' AND Agencia = '1000027653';		
UPDATE BASE_MOBILVENDOR_AUTOMATICA_1 SET CodAlicorp = '8305220' WHERE CodAlicorp = 'ALH272' AND Agencia = '1000027653';		
--	------------------------------------------------------solo agosto 2022------------------------


DELETE FROM BASE_MOBILVENDOR_AUTOMATICA_1 WHERE Agencia IN ('1000026571')
--preguntar hasta cuando se elimina coparesa


IF OBJECT_ID(N'tempdb..#PANALES_D') IS NOT NULL DROP TABLE #PANALES_D;

SELECT CONVERT(VARCHAR(20), A.Fecha,103) Fecha, A.Agencia Agencia, [Codigo Cliente] CodClienteSellOut, [Nombre Cliente] ClienteSellOut, A.CodAlicorp CodAlicorp,
	   M.FacUnitario FacUnitario, A.Cantidad TUnidades, 0  Plan_Ton, (M.PesoTon)*(A.Cantidad) VentaTon, 0 Plan_Dol, A.Importe VentaDolares
INTO #PANALES_D
FROM BASE_MOBILVENDOR_AUTOMATICA_1 A
	 LEFT JOIN MAESTRO_ALICORP_1 M ON A.CodAlicorp = M.CodAlicorp;




--DELETE FROM #PANALES_D WHERE CodAlicorp IN ('AD0220', 'AD0221', 'AD0224', 'AD0225', 'AD0226', 'AD0227', 'AD0228', 'AD0229', 'AD0230', 'AD0231', 'AD0232', 'AD0233', 'AD0234', 'AD0241', 'AD0242', 'AD0243', 'AD0246', 'AD0247',
--                                          'AD0248', 'Ali001', 'Ali002', 'Ali003', 'Ali005', 'Ali007', 'Ali008', 'Ali009', 'Ali011', 'Ali013', 'Ali015', 'Ali016', 'Ali017', 'Ali10', 'AD0219', 'AD0215', 'AD0218', 'Ali006',
--										  'AD0217', 'ESPAPROM', 'AD0103', 'AD239', 'Ali014', 'ALIC063', 'H450C200', 'H523B017', 'H523B222', 'H523B223', 'P.33001461', '617080', '688320', '484168', '29116B', '453-G', '648-001', 'AMB360',
--										  'H180-G', 'MY', 'SP', 'TALL', 'AD0058', 'GLL','AD0250', 'AD0249', 'AD0251', 'CL001' )


INSERT INTO #PANALES_D
SELECT CONVERT(VARCHAR(20), A.Fecha,103) Fecha, A.Agencia Agencia, A.CodClienteSellOut CodClienteSellOut, 'SIN ASIGNAR - CODIFY' ClienteSellOut, A.CodAlicorp CodAlicorp,
	   M.FacUnitario FacUnitario, A.TUnidades TUnidades, 0  Plan_Ton, A.VentaTon VentaTon, 0 Plan_Dol, A.VentaDolares VentaDolares	   
FROM CODIFY_HISTORICA_1 A
   	 LEFT JOIN MAESTRO_ALICORP_1 M ON A.CodAlicorp = M.CodAlicorp;

DELETE FROM #PANALES_D WHERE   FacUnitario is null

ALTER TABLE #PANALES_D ALTER COLUMN Plan_Ton FLOAT;
ALTER TABLE #PANALES_D ALTER COLUMN VentaTon FLOAT;
ALTER TABLE #PANALES_D ALTER COLUMN Plan_Dol FLOAT;

UPDATE #PANALES_D 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%'

--SELECT * FROM #PANALES_D where Cliente_Dist = 'SIN ASIGNAR - CODIFY'





--Para subir el plan del mes si en el algun momento se mueve la base a otro servidor
--BULK INSERT PLAN_PANALES_1
--FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_PANALES_MAY.csv'
--WITH (FIELDTERMINATOR=';', FIRSTROW=2, CODEPAGE='ACP');


--PLAN PLAN_PANALES_1
--cambiar cada cierre de mes



UPDATE A SET Fecha = REPLACE(Fecha, '.', '/') FROM PLAN_PANALES_1 A;
UPDATE A SET Ventas_Reales = 0 FROM PLAN_PANALES_1 A;
UPDATE A SET Ventas_Ton = 0 FROM PLAN_PANALES_1 A;




DELETE PLAN_PANALES_1 WHERE Plan_Dol = 0 AND Plan_Ton = 0;
DELETE FROM PLAN_PANALES_1 WHERE Plan_Dol IS NULL AND Plan_Ton IS NULL;
DELETE FROM PLAN_PANALES_1 WHERE Plan_Dol = '' AND Plan_Ton = '';


UPDATE A SET CodCategoria = TRIM(CodCategoria) FROM PLAN_PANALES_1 A;
UPDATE A SET Categoria = TRIM(Categoria) FROM PLAN_PANALES_1 A;
UPDATE A SET CodMarca = TRIM(CodMarca) FROM PLAN_PANALES_1 A;
UPDATE A SET Marca = TRIM(Marca) FROM PLAN_PANALES_1 A;
UPDATE A SET CodFamilia = TRIM(CodFamilia) FROM PLAN_PANALES_1 A;
UPDATE A SET Familia = TRIM(Familia) FROM PLAN_PANALES_1 A;
UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM PLAN_PANALES_1 A;
UPDATE A SET Des_Material = TRIM(Des_Material) FROM PLAN_PANALES_1 A;
UPDATE A SET Agencia_Distribuidora = TRIM(Agencia_Distribuidora) FROM PLAN_PANALES_1 A;
UPDATE A SET Plataforma = TRIM(Plataforma) FROM PLAN_PANALES_1 A;

DELETE FROM PLAN_PANALES_1
	   WHERE Agencia_Distribuidora  IN ('CONTRERAS DELGADO WASHINGTON BENEDI', 'COPARESA S.A.')

--preguntar hasta cuando se elimina coparesa

UPDATE PLAN_PANALES_1
SET CodMarca = RIGHT(CodMarca,1)
WHERE CodMarca LIKE '00%';

UPDATE PLAN_PANALES_1
SET CodMarca = RIGHT(CodMarca,2)
WHERE CodMarca LIKE '0%';
-- Debido a que cuando subo la información del csv se agrega un cero a la izquierda


UPDATE PLAN_PANALES_1 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%';


UPDATE PLAN_PANALES_1
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128'
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;

DELETE FROM PLAN_PANALES_1 WHERE RIGHT(Fecha,7) = '09/2022';
--DELETE FROM PLAN_PANALES_1 WHERE Agencia_Distribuidora IN ('ATI CAMPAÑA FLAVIA MARINA', 'MOGRO AVILA FERNANDO PATRICIO', 'CONTRERAS DELGADO WASHINGTON' )

--Si en algun momento se llevan la base a otro servidor cambiarlo
INSERT INTO PLAN_PANALES_1
SELECT *
FROM CmiSellOutEcuador.dbo.PLAN_PANALES;





--Para subir el plan del mes si en el algun momento se mueve la base a otro servidor
--BULK INSERT PLAN_2MAYA_1
--FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_2MAYA_MAY.csv'
--WITH (FIELDTERMINATOR=';', FIRSTROW=2, CODEPAGE='ACP');
--TRUNCATE TABLE PLAN_2MAYA_1
--DELETE FROM PLAN_2MAYA_1 WHERE Agencia_Distribuidora IN ('ALVAREZ','FREDVY S.A.', 'PRODISPRO PROVEEDORA Y DISTRIBUIDOR','REPRESENTACIONES J.LEONARDO SORIA', 'BARNUEVO VALAREZO &GCP CIAL LTDA','D LOGIS CODILOGIS CIA LTDA')



--PLAN PLAN_2MAYA_1
--cambiar cada cierre de mes SI SE MUEVE LA BASE A OTRO SERVIDOR VER


UPDATE A SET Fecha = REPLACE(Fecha, '.', '/') FROM PLAN_2MAYA_1 A;
UPDATE A SET Ventas_Reales = 0 FROM PLAN_2MAYA_1 A;
UPDATE A SET Ventas_Ton = 0 FROM PLAN_2MAYA_1 A;

DELETE PLAN_2MAYA_1 WHERE Plan_Dol = 0 AND Plan_Ton = 0;
DELETE FROM PLAN_2MAYA_1 WHERE Plan_Dol IS NULL AND Plan_Ton IS NULL;
DELETE FROM PLAN_2MAYA_1 WHERE Plan_Dol = '' AND Plan_Ton = '';

--Cada vez que haya una nueva agencia incluirlo aca que se considerara en el reporte incluirla aca
--DELETE FROM PLAN_2MAYA_1 WHERE NomOficina NOT IN ('NEOPOR S.A.', 'PULLA', 'MARVECOBE S.A', 'HARO')
--DELETE FROM PLAN_2MAYA_1 WHERE NomOficina NOT IN ('NEOPOR S.A.', 'PULLA', 'MARVECOBE S.A', 'HARO', 'ALVAREZ') 
--PREGUNTAR HASTA CUANDO SERA ESTO

UPDATE A SET CodCategoria = TRIM(CodCategoria) FROM PLAN_2MAYA_1 A;
UPDATE A SET Categoria = TRIM(Categoria) FROM PLAN_2MAYA_1 A;
UPDATE A SET CodMarca = TRIM(CodMarca) FROM PLAN_2MAYA_1 A;
UPDATE A SET Marca = TRIM(Marca) FROM PLAN_2MAYA_1 A;
UPDATE A SET CodFamilia = TRIM(CodFamilia) FROM PLAN_2MAYA_1 A;
UPDATE A SET Familia = TRIM(Familia) FROM PLAN_2MAYA_1 A;
UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM PLAN_2MAYA_1 A;
UPDATE A SET Des_Material = TRIM(Des_Material) FROM PLAN_2MAYA_1 A;
UPDATE A SET Agencia_Distribuidora = TRIM(Agencia_Distribuidora) FROM PLAN_2MAYA_1 A;
UPDATE A SET Plataforma = TRIM(Plataforma) FROM PLAN_2MAYA_1 A;


DELETE FROM PLAN_2MAYA_1
	   WHERE Agencia_Distribuidora
			 IN ('FREDVY S.A.', 'REPRESENTACIONES J.LEONARDO SORIA')

UPDATE PLAN_2MAYA_1
SET CodMarca = RIGHT(CodMarca,1)
WHERE CodMarca LIKE '00%';

UPDATE PLAN_2MAYA_1
SET CodMarca = RIGHT(CodMarca,2)
WHERE CodMarca LIKE '0%';
-- Debido a que cuando subo la información del csv se agrega un cero a la izquierda


UPDATE PLAN_2MAYA_1 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%';
	 

UPDATE PLAN_2MAYA_1
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128'
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;



DELETE FROM PLAN_2MAYA_1 WHERE RIGHT(Fecha,7) = '09/2022';


INSERT INTO PLAN_2MAYA_1
SELECT *
FROM CmiSellOutEcuador.dbo.PLAN_2MAYA;


--UPDATE A
--SET Agencia_Distribuidora = CASE Agencia_Distribuidora
--	WHEN 'ARISTIDES NORMANDO TAGLE GUERRERO' THEN 'TAGLE GUERRERO ARISTIDES NORMANDO'
--	WHEN 'COPARESA' THEN 'COPARESA S.A.'
--	WHEN 'ESPINOZA ZEAS MANUEL JHON' THEN 'ESPINOZA ZEAS MANUEL JOHN'
--	WHEN 'GUADALUPE CASTILLO ERNESTO VICEN 2' THEN 'GUADALUPE CASTILLO ERNESTO VICENTE'
--	WHEN 'JINES CAJAS XAVIER CESAR' THEN 'JINES CAJAS CESAR XAVIER'
--	WHEN 'MOREJON QUISPE LUIS ALFREDO' THEN 'ZAMORA BRIONES MARIA MAGDALENA'
--	WHEN 'XAVIER MORALES DE LA GUERRA' THEN 'D-MEX CIA.LTDA.'
--	ELSE Agencia_Distribuidora END FROM PLAN_2MAYA_1 A WHERE FECHA = '1/05/2022'

--SELECT DISTINCT Agencia_Distribuidora FROM PLAN_2MAYA_1 WHERE FECHA = '1/05/2022'








TRUNCATE TABLE BASE_FINAL;


INSERT INTO BASE_FINAL
SELECT AG.Agrupacion_Distribuidora Grupo_Cliente, F.Periodo Periodo, AG.Agencia_Distribuidora Distribuidora, A.CodClienteSellOut Cliente_Dist,
	   AG.Territorio Territorio, AG.Zona_Clientes,
	   M.Plataforma Plataforma, CONCAT(M.CodMarca,' ',M.Marca) Marca, M.CodMarca Marcacod, M.Marca Marcadesc, CONCAT(M.CodFamilia,' ',M.Familia) Familia, M.CodFamilia Familiacod, M.Familia Familiadesc,
	   CONCAT(M.CodCategoria,' ', M.Categoria) Categoria, M.CodCategoria Categoriacod, M.Categoria Categoriadesc, M.Material Material, A.CodAlicorp Materialcod, M.Material Materialdesc,
	   CONVERT(DATE,A.Fecha,103) Fecha, ISNULL(A.VentaDolares,0) Real_USD, A.Plan_Dol Plan_USD,	 
	   0 Clientes_Activos, (ISNULL(A.VentaDolares,0))/@dm1 * @DMAX	PROY_LIN_DOL, 0.96
FROM #PANALES_D A
	LEFT JOIN BD_FECHAS_1 F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP_1 M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS_1 AG ON A.Agencia = AG.Agencia
	  
--Inserto plan panales

INSERT INTO BASE_FINAL
SELECT AG.Agrupacion_Distribuidora Grupo_Cliente, F.Periodo Periodo, AG.Agencia_Distribuidora Distribuidora, 'SIN ASIGNAR - PA_PLAN ' Cliente_Dist,
	   AG.Territorio Territorio, AG.Zona_Clientes,
	   M.Plataforma Plataforma, CONCAT(M.CodMarca,' ',M.Marca) Marca, M.CodMarca Marcacod, M.Marca Marcadesc, CONCAT(M.CodFamilia,' ',M.Familia) Familia, M.CodFamilia Familiacod, M.Familia Familiadesc,
	   CONCAT(M.CodCategoria,' ', M.Categoria) Categoria, M.CodCategoria Categoriacod, M.Categoria Categoriadesc, M.Material Material, A.CodAlicorp Materialcod, M.Material Materialdesc,
	   CONVERT(DATE,A.Fecha,103) Fecha, A.Ventas_Reales Real_USD, A.Plan_Dol*1000 Plan_USD,	 
	   0 Clientes_Activos, 0, 0
--SELECT *
FROM PLAN_PANALES_1 A
	LEFT JOIN BD_FECHAS_1 F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP_1 M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS_1 AG ON A.Agencia_Distribuidora = AG.Agencia_Distribuidora
--SELECT * FROM BASE_FINAL

--Inserto plan 2Maya

INSERT INTO BASE_FINAL
SELECT AG.Agrupacion_Distribuidora Grupo_Cliente, F.Periodo Periodo, AG.Agencia_Distribuidora Distribuidora, 'SIN ASIGNAR - 2MAY_PLAN ' Cliente_Dist,
	   AG.Territorio Territorio, AG.Zona_Clientes,
	   M.Plataforma Plataforma, CONCAT(M.CodMarca,' ',M.Marca) Marca, M.CodMarca Marcacod, M.Marca Marcadesc, CONCAT(M.CodFamilia,' ',M.Familia) Familia, M.CodFamilia Familiacod, M.Familia Familiadesc,
	   CONCAT(M.CodCategoria,' ', M.Categoria) Categoria, M.CodCategoria Categoriacod, M.Categoria Categoriadesc, M.Material Material, A.CodAlicorp Materialcod, M.Material Materialdesc,
	   CONVERT(DATE,A.Fecha,103) Fecha, A.Ventas_Reales Real_USD, A.Plan_Dol*1000 Plan_USD,	 
	   0 Clientes_Activos, 0, 0
--SELECT *
FROM PLAN_2MAYA_1 A
	LEFT JOIN BD_FECHAS_1 F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP_1 M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS_1 AG ON A.Agencia_Distribuidora = AG.Agencia_Distribuidora



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

 SELECT *
 INTO HULARUSS
 FROM CmiSellOutEcuador.dbo.HULARUSS_HISTORICO

 UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM HULARUSS A;
UPDATE A SET Agencia = TRIM(Agencia) FROM HULARUSS A;
UPDATE A SET Empaque = TRIM(Empaque) FROM HULARUSS A;
UPDATE A SET CodClienteSellOut = TRIM(CodClienteSellOut) FROM HULARUSS A
UPDATE A SET Canal = TRIM(Canal) FROM HULARUSS A

UPDATE HULARUSS SET CodAlicorp = REPLACE(CodAlicorp, 'A', '')


DELETE FROM HULARUSS WHERE CodAlicorp LIKE '%PROMO%';
DELETE FROM HULARUSS WHERE CodAlicorp = 'BNDEO - 002';
DELETE FROM HULARUSS WHERE Importe IS NULL;

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


UPDATE A SET A.Ventakilos = (A.Cantidad * M.PesoKG) FROM HULARUSS A 
	LEFT JOIN MAESTRO_ALICORP_1 M ON A.CodAlicorp = M.CodAlicorp
	WHERE A.Ventakilos = 0

UPDATE A SET A.Canal = 'MINORISTAS' FROM HULARUSS A 
	WHERE  A.Canal = 'TAT'


--Creo tabla temporal para homologar los campos y darle formato a la fecha, tambien calculo las toneladas
IF OBJECT_ID(N'tempdb..#HULARUSS_1') IS NOT NULL DROP TABLE #HULARUSS_1;

SELECT CONVERT(VARCHAR(20), A.Fecha,103) Fecha, A.Agencia Agencia, A.CodClienteSellOut, A.CodAlicorp CodAlicorp,
	   M.FacUnitario FacUnitario, A.Cantidad TUnidades, 0  Plan_Ton, VentaKilos VentaKil, 0 Plan_Dol, A.Importe VentaDolares
INTO #HULARUSS_1
--SELECT *
FROM HULARUSS A
	LEFT JOIN MAESTRO_ALICORP_1 M ON A.CodAlicorp = M.CodAlicorp
WHERE A.Canal = 'MINORISTAS';
--SELECT * FROM #HULARUSS_1
 
ALTER TABLE #HULARUSS_1 ALTER COLUMN Plan_Ton FLOAT;
ALTER TABLE #HULARUSS_1 ALTER COLUMN Plan_Dol FLOAT;

UPDATE #HULARUSS_1
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%'


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
--@dia debe ser igual a al mes y año al que corresponde el plan


DELETE FROM PLAN_HULARUSS WHERE 1=1
								AND YEAR(Fecha) = 2022
								AND MONTH(Fecha) = 09

INSERT INTO PLAN_HULARUSS
SELECT *
FROM CmiSellOutEcuador.dbo.NuevoPlanHularussFormato



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

IF OBJECT_ID(N'tempdb..#HULARUSS_PLAN_NUEVO_TON_1') IS NOT NULL DROP TABLE #HULARUSS_PLAN_NUEVO_TON_1;

SELECT *
INTO #HULARUSS_PLAN_NUEVO_TON_1
FROM #HULARUSS_PLAN_NUEVO_1
WHERE NomOficina IN('AMBATO_TN','CHONE_TN','CUENCA_TN','ESMERALDAS_TN','GUAYAQUIL_TN',
'IBARRA_TN','LOJA_TN','MACHALA_TN','MANABI_TN','MILAGRO_TN','ORIENTE_TN','QUEVEDO_TN',
'QUITO_TN','SANTA ELENA_TN','SANTO DGO_TN')

UPDATE A SET NomOficina = LEFT(NomOficina,LEN(NomOficina)-3) FROM #HULARUSS_PLAN_NUEVO_TON_1 A;
--SELECT * FROM #HULARUSS_PLAN_NUEVO_TON WHERE MontoCantidad IS NULL

IF OBJECT_ID(N'tempdb..#HULARUSS_PLAN_NUEVO_DOL_1') IS NOT NULL DROP TABLE #HULARUSS_PLAN_NUEVO_DOL_1;

SELECT *
INTO #HULARUSS_PLAN_NUEVO_DOL_1
FROM #HULARUSS_PLAN_NUEVO_1
WHERE NomOficina IN('AMBATO','CHONE','CUENCA','ESMERALDAS','GUAYAQUIL',
'IBARRA','LOJA','MACHALA','MANABI','MILAGRO','ORIENTE','QUEVEDO',
'QUITO','SANTA ELENA','SANTO DGO')

IF OBJECT_ID(N'tempdb..#HULARUSS_PLAN_NUEVO_MINOR_1') IS NOT NULL DROP TABLE #HULARUSS_PLAN_NUEVO_MINOR_1;

SELECT CONVERT(VARCHAR(20),A.Fecha,103) Fecha, A.Canal Canal, A.CodAlicorp CodAlicorp, A.NomOficina, A.MontoCantidad Plan_Ton, B.MontoCantidad Plan_Dol
INTO #HULARUSS_PLAN_NUEVO_MINOR_1
FROM #HULARUSS_PLAN_NUEVO_TON_1 A 
	LEFT JOIN #HULARUSS_PLAN_NUEVO_DOL_1 B ON A.CodAlicorp = B.CodAlicorp AND A.NomOficina = B.NomOficina AND A.Canal = B.Canal AND A.Fecha = B.Fecha
WHERE A.Canal = 'MINORISTAS'

DELETE #HULARUSS_PLAN_NUEVO_MINOR_1 WHERE Plan_Dol = 0 AND Plan_Ton = 0;

UPDATE #HULARUSS_PLAN_NUEVO_MINOR_1
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%'

--select * from #HULARUSS_PLAN_NUEVO_MINOR

UPDATE #HULARUSS_PLAN_NUEVO_MINOR_1
SET CodAlicorp = CASE CodAlicorp
	WHEN '8309000' THEN '8309119'
	WHEN '8309001' THEN '8309120'
	WHEN '8309002' THEN '8309121'
	WHEN '8309003' THEN '8309122'
	WHEN '8309007' THEN '8309126'
	WHEN '8309009' THEN '8309128'
	WHEN '293369' THEN '29369' ELSE CodAlicorp END;


--Inserto Hularuss
--DECLARE @dm1 INT;
--DECLARE @DMAX INT;
--SELECT @dm1 = 26
--SELECT @DMAX = 26

INSERT INTO BASE_FINAL
SELECT AG.Agrupacion_Distribuidora Grupo_Cliente, F.Periodo Periodo, AG.Agencia_Distribuidora Distribuidora, A.CodClienteSellOut Cliente_Dist,
	   AG.Territorio Territorio, AG.Zona_Clientes,
	   M.Plataforma Plataforma, CONCAT(M.CodMarca,' ',M.Marca) Marca, M.CodMarca Marcacod, M.Marca Marcadesc, CONCAT(M.CodFamilia,' ',M.Familia) Familia, M.CodFamilia Familiacod, M.Familia Familiadesc,
	   CONCAT(M.CodCategoria,' ', M.Categoria) Categoria, M.CodCategoria Categoriacod, M.Categoria Categoriadesc, M.Material Material, A.CodAlicorp Materialcod, M.Material Materialdesc,
	   CONVERT(DATE,A.Fecha,103) Fecha, ISNULL(A.VentaDolares,0) Real_USD, A.Plan_Dol Plan_USD,	 
	   0 Clientes_Activos, (ISNULL(A.VentaDolares,0))/@dm1 * @DMAX	PROY_LIN_DOL, 0.96
FROM #HULARUSS_1 A
	LEFT JOIN BD_FECHAS_1 F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP_1 M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS_1 AG ON A.Agencia = AG.Agencia


--Inserto plan Hularuss

INSERT INTO BASE_FINAL
SELECT AG.Agrupacion_Distribuidora Grupo_Cliente, F.Periodo Periodo, AG.Agencia_Distribuidora Distribuidora, 'SIN ASIGNAR - HU' Cliente_Dist,
	   AG.Territorio Territorio, AG.Zona_Clientes,
	   M.Plataforma Plataforma, CONCAT(M.CodMarca,' ',M.Marca) Marca, M.CodMarca Marcacod, M.Marca Marcadesc, CONCAT(M.CodFamilia,' ',M.Familia) Familia, M.CodFamilia Familiacod, M.Familia Familiadesc,
	   CONCAT(M.CodCategoria,' ', M.Categoria) Categoria, M.CodCategoria Categoriacod, M.Categoria Categoriadesc, M.Material Material, A.CodAlicorp Materialcod, M.Material Materialdesc,
	   CONVERT(DATE,A.Fecha,103) Fecha, 0 Real_USD, A.Plan_Dol Plan_USD,	 
	   0 Clientes_Activos, 0, 0
--SELECT *
FROM #HULARUSS_PLAN_NUEVO_MINOR_1 A
	LEFT JOIN BD_FECHAS_1 F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP_1 M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS_1 AG ON A.NomOficina = AG.NomOficina

--SELECT DISTINCT Periodo FROM BASE_FINAL
--SELECT  * FROM BASE_FINAL WHERE Grupo_Cliente IS NULL
--SELECT  * FROM BASE_FINAL WHERE Periodo IS NULL 
--SELECT  * FROM BASE_FINAL WHERE Familia IS NULL
--SELECT  * FROM BASE_FINAL WHERE Materialcod IS NULL
--SELECT  * FROM BASE_FINAL WHERE Plan_USD IS NULL
