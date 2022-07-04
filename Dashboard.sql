USE TABLERO_ECUADOR3;


DROP TABLE MAESTRO_ALICORP;

SELECT *
INTO MAESTRO_ALICORP
FROM CmiSellOutEcuador.dbo.MAESTRO_ALICORP;


DROP TABLE MAESTRO_AGENCIAS;

SELECT *
INTO MAESTRO_AGENCIAS
FROM CmiSellOutEcuador.dbo.MAESTRO_AGENCIAS;



DROP TABLE BASE_MOBILVENDOR_AUTOMATICA_1;

SELECT *
INTO BASE_MOBILVENDOR_AUTOMATICA_1
FROM CmiSellOutEcuador.dbo.BASE_PANALES_HISTORICA;


DELETE FROM BASE_MOBILVENDOR_AUTOMATICA_1 WHERE Importe = 0;
DELETE FROM BASE_MOBILVENDOR_AUTOMATICA_1 WHERE Importe IS NULL;


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


IF OBJECT_ID(N'tempdb..#PANALES_D') IS NOT NULL DROP TABLE #PANALES_D;

SELECT CONVERT(VARCHAR(20), A.Fecha,103) Fecha, A.Agencia Agencia, [Codigo Cliente] CodClienteSellOut, [Nombre Cliente] ClienteSellOut, A.CodAlicorp CodAlicorp,
	   M.FacUnitario FacUnitario, A.Cantidad TUnidades, 0  Plan_Ton, (M.PesoTon)*(A.Cantidad) VentaTon, 0 Plan_Dol, A.Importe VentaDolares
INTO #PANALES_D
FROM BASE_MOBILVENDOR_AUTOMATICA_1 A
	 LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp;

DELETE FROM #PANALES_D WHERE CodAlicorp IN ('AD0220', 'AD0221', 'AD0224', 'AD0225', 'AD0226', 'AD0227', 'AD0228', 'AD0229', 'AD0230', 'AD0231', 'AD0232', 'AD0233', 'AD0234', 'AD0241', 'AD0242', 'AD0243', 'AD0246', 'AD0247',
                                          'AD0248', 'Ali001', 'Ali002', 'Ali003', 'Ali005', 'Ali007', 'Ali008', 'Ali009', 'Ali011', 'Ali013', 'Ali015', 'Ali016', 'Ali017', 'Ali10', 'AD0219', 'AD0215', 'AD0218', 'Ali006',
										  'AD0217', 'ESPAPROM', 'AD0103', 'AD239', 'Ali014', 'ALIC063', 'H450C200', 'H523B017', 'H523B222', 'H523B223', 'P.33001461', '617080', '688320', '484168', '29116B', '453-G', '648-001', 'AMB360',
										  'H180-G', 'MY', 'SP', 'TALL', 'AD0058', 'GLL','AD0250', 'AD0249')


ALTER TABLE #PANALES_D ALTER COLUMN Plan_Ton FLOAT;
ALTER TABLE #PANALES_D ALTER COLUMN VentaTon FLOAT;
ALTER TABLE #PANALES_D ALTER COLUMN Plan_Dol FLOAT;

UPDATE #PANALES_D 
SET Fecha = RIGHT(Fecha,9)
WHERE Fecha LIKE '0_/%'

--SELECT * FROM #PANALES_D





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

UPDATE PLAN_PANALES_1
SET CodMarca = RIGHT(CodMarca,1)
WHERE CodMarca LIKE '00%';

UPDATE PLAN_PANALES_1
SET CodMarca = RIGHT(CodMarca,2)
WHERE CodMarca LIKE '0%';
-- Debido a que cuando subo la informaci�n del csv se agrega un cero a la izquierda


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

DELETE FROM PLAN_PANALES_1 WHERE RIGHT(Fecha,7) = '06/2022';
--DELETE FROM PLAN_PANALES WHERE Agencia_Distribuidora IN ('ATI CAMPA�A FLAVIA MARINA', 'MOGRO AVILA FERNANDO PATRICIO', 'CONTRERAS DELGADO WASHINGTON' )

--Si en algun momento se llevan la base a otro servidor cambiarlo
INSERT INTO PLAN_PANALES_1
SELECT *
FROM CmiSellOutEcuador.dbo.PLAN_PANALES;





--Para subir el plan del mes si en el algun momento se mueve la base a otro servidor
--BULK INSERT PLAN_2MAYA_1
--FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_2MAYA_MAY.csv'
--WITH (FIELDTERMINATOR=';', FIRSTROW=2, CODEPAGE='ACP');
--TRUNCATE TABLE PLAN_2MAYA_1
--DELETE FROM PLAN_2MAYA_1 WHERE Agencia_Distribuidora IN ('ALVAREZ','FREDVY S.A.','REPREMARVA CIA. LTDA.', 'PRODISPRO PROVEEDORA Y DISTRIBUIDOR','REPRESENTACIONES J.LEONARDO SORIA', 'BARNUEVO VALAREZO &GCP CIAL LTDA','D LOGIS CODILOGIS CIA LTDA')



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

UPDATE PLAN_2MAYA_1
SET CodMarca = RIGHT(CodMarca,1)
WHERE CodMarca LIKE '00%';

UPDATE PLAN_2MAYA_1
SET CodMarca = RIGHT(CodMarca,2)
WHERE CodMarca LIKE '0%';
-- Debido a que cuando subo la informaci�n del csv se agrega un cero a la izquierda


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



DELETE FROM PLAN_2MAYA_1 WHERE RIGHT(Fecha,7) = '06/2022';


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

--PREGUNTAR POR SI SE PUEDE AGRUPAR O NO
INSERT INTO BASE_FINAL
SELECT AG.Agrupacion_Distribuidora Grupo_Cliente, F.Periodo Periodo,'Real' Tipo, AG.Agencia_Distribuidora Distribuidora, A.CodClienteSellOut Cliente_Dist,
	   M.Plataforma Plataforma, CONCAT(M.CodMarca,' ',M.Marca) Marca, M.CodMarca Marcacod, M.Marca Marcadesc, CONCAT(M.CodFamilia,' ',M.Familia) Familia, M.CodFamilia Familiacod, M.Familia Familiadesc,
	   CONCAT(M.CodCategoria,' ', M.Categoria) Categoria, M.CodCategoria Categoriacod, M.Categoria Categoriadesc, M.Material Material, M.CodAlicorp Materialcod, M.Material Materialdesc,
	   CONVERT(DATE,A.Fecha,103) Fecha, ISNULL(A.VentaDolares,0)/1000 Real_USD, A.Plan_Dol Plan_USD,	 
	   0 Clientes_Activos, 0.96, 0.96
FROM #PANALES_D A
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.Agencia = AG.Agencia
	  
--Inserto plan panales

INSERT INTO BASE_FINAL
SELECT AG.Agrupacion_Distribuidora Grupo_Cliente, F.Periodo Periodo,'Real' Tipo, AG.Agencia_Distribuidora Distribuidora, A.CodClienteSellOut Cliente_Dist,
	   M.Plataforma Plataforma, CONCAT(M.CodMarca,' ',M.Marca) Marca, M.CodMarca Marcacod, M.Marca Marcadesc, CONCAT(M.CodFamilia,' ',M.Familia) Familia, M.CodFamilia Familiacod, M.Familia Familiadesc,
	   CONCAT(M.CodCategoria,' ', M.Categoria) Categoria, M.CodCategoria Categoriacod, M.Categoria Categoriadesc, M.Material Material, M.CodAlicorp Materialcod, M.Material Materialdesc,
	   CONVERT(DATE,A.Fecha,103) Fecha, ISNULL(A.VentaDolares,0)/1000 Real_USD, A.Plan_Dol Plan_USD,	 
	   0 Clientes_Activos, 0.96, 0.96
FROM #PANALES_D A
	LEFT JOIN BD_FECHAS F ON  A.Fecha= F.DIA
	LEFT JOIN MAESTRO_ALICORP M ON A.CodAlicorp = M.CodAlicorp
	LEFT JOIN MAESTRO_AGENCIAS AG ON A.Agencia = AG.Agencia


 INSERT INTO BASE_FINAL(Grupo_Cliente,Periodo,Distribuidora,Categoriadesc,Plan_USD,Clientes_Activos,Plataforma)
 SELECT Grupo_Cliente,periodo,distribuidora,categoria,"plan",clientes_activos, case when (len(isnull(plataforma,''))<=0 and categoria in ('Pastas','Salsas','Galletas')) then 'Foods' 
 when (len(isnull(plataforma,''))<=0 and categoria not in ('Pastas','Salsas','Galletas')) then 'Home Care'
 else plataforma end as plataforma
 --select *
 FROM MAE_PLANES
 --where distribuidora like'%MAR%'
 
 ;
 go

 --alter table MAE_PLANES add Grupo_Cliente varchar(100)

 update a set Fecha=RIGHT(PERIODO,4)+'-0'+LEFT(PERIODO,1)+'-01'
 --select *
 from BASE_FINAL a
 where Cliente_Dist is null;
 go






 UPDATE A SET  DISTRIBUIDORA=CASE 
 WHEN DISTRIBUIDORA IN ('ARISTIDES NORMANDO TAGLE GUERRERO','TAGLE GUERRERO ARISTIDES NORMANDO') THEN 'TAGLE GUERRERO ARISTIDES NORMANDO'
 WHEN DISTRIBUIDORA IN ('COPARESA S.A N 1','COPARESA S.A.') THEN 'COPARESA S.A.'
 WHEN DISTRIBUIDORA IN ('DISTRIBUIDORA DE CONSUMO MASIVO NEOPOR S.A','NEOPOR S.A.') THEN 'NEOPOR S.A.'
 WHEN DISTRIBUIDORA IN ('ESPINOZA ZEAS MANUEL JHON','ESPINOZA ZEAS MANUEL JOHN') THEN 'ESPINOZA ZEAS MANUEL JOHN'
 WHEN DISTRIBUIDORA IN ('GUADALUPE CASTILLO ERNESTO VICEN 2','GUADALUPE CASTILLO ERNESTO VICENTE') THEN 'GUADALUPE CASTILLO ERNESTO VICENTE'
 WHEN DISTRIBUIDORA IN ('HARO','HARO IVAN') THEN 'HARO'
 WHEN DISTRIBUIDORA IN ('JINES CAJAS CESAR XAVIER','JINES CAJAS XAVIER CESAR') THEN 'JINES CAJAS CESAR XAVIER'
 WHEN DISTRIBUIDORA IN ('MARVECOBE','MARVECOBE S.A') THEN 'MARVECOBE S.A'
 WHEN DISTRIBUIDORA IN ('MOREJON QUISPE LUIS ALFREDO','ZAMORA BRIONES MARIA MAGDALENA') THEN 'ZAMORA BRIONES MARIA MAGDALENA'
 WHEN DISTRIBUIDORA IN ('PULLA','PULLA VIMOS LOURDES CATALINA') THEN 'PULLA'
 WHEN DISTRIBUIDORA IN ('XAVIER MORALES DE LA GUERRA','') THEN 'D-MEX CIA.LTDA.'
 WHEN DISTRIBUIDORA IN ('SEGUNDO MIGUEL ALVAREZ TORRES','ALVAREZ TORRES SEGUNDO MIGUEL','ALVAREZ') THEN 'ALVAREZ'
ELSE 'AAA' END
 --SELECT DISTINCT DISTRIBUIDORA
 FROM BASE_FINAL A
;
go



 update a set cliente=CASE 
 WHEN cliente IN ('ARISTIDES NORMANDO TAGLE GUERRERO','TAGLE GUERRERO ARISTIDES NORMANDO') THEN 'TAGLE GUERRERO ARISTIDES NORMANDO'
 WHEN cliente IN ('COPARESA S.A N 1','COPARESA S.A.') THEN 'COPARESA S.A.'
 WHEN cliente IN ('DISTRIBUIDORA DE CONSUMO MASIVO NEOPOR S.A','NEOPOR S.A.') THEN 'NEOPOR S.A.'
 WHEN cliente IN ('ESPINOZA ZEAS MANUEL JHON','ESPINOZA ZEAS MANUEL JOHN') THEN 'ESPINOZA ZEAS MANUEL JOHN'
 WHEN cliente IN ('GUADALUPE CASTILLO ERNESTO VICEN 2','GUADALUPE CASTILLO ERNESTO VICENTE') THEN 'GUADALUPE CASTILLO ERNESTO VICENTE'
 WHEN cliente IN ('HARO','HARO IVAN') THEN 'HARO'
 WHEN cliente IN ('JINES CAJAS CESAR XAVIER','JINES CAJAS XAVIER CESAR') THEN 'JINES CAJAS CESAR XAVIER'
 WHEN cliente IN ('MARVECOBE','MARVECOBE S.A') THEN 'MARVECOBE S.A'
 WHEN cliente IN ('MOREJON QUISPE LUIS ALFREDO','ZAMORA BRIONES MARIA MAGDALENA') THEN 'ZAMORA BRIONES MARIA MAGDALENA'
 WHEN cliente IN ('PULLA','PULLA VIMOS LOURDES CATALINA') THEN 'PULLA'
 WHEN cliente IN ('XAVIER MORALES DE LA GUERRA','') THEN 'D-MEX CIA.LTDA.'
 WHEN cliente IN ('SEGUNDO MIGUEL ALVAREZ TORRES','ALVAREZ TORRES SEGUNDO MIGUEL','ALVAREZ') THEN 'ALVAREZ'
ELSE 'AAA' END
 FROM INDICADORES_KPI a
 WHERE Cliente<>'Todas';
 go



 DELETE
 from INDICADORES_KPI
 where cliente='AAA';