DECLARE @dia DATE;
SELECT @dia = DATEADD(DAY,-1,SYSDATETIME());


SET LANGUAGE SPANISH;

TRUNCATE TABLE PLAN_2MAYA;

BULK INSERT PLAN_2MAYA
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_2MAYA.csv'
WITH (FIELDTERMINATOR=';', FIRSTROW=2, CODEPAGE='ACP');

UPDATE A SET Fecha = REPLACE(Fecha, '.', '/') FROM PLAN_2MAYA A;
UPDATE A SET Ventas_Reales = 0 FROM PLAN_2MAYA A;
UPDATE A SET Ventas_Ton = 0 FROM PLAN_2MAYA A;


ALTER TABLE PLAN_2MAYA ALTER COLUMN Fecha DATE NOT NULL;

SET LANGUAGE US_ENGLISH;

UPDATE PLAN_2MAYA SET Fecha = CASE WHEN Fecha > @dia THEN @dia ELSE Fecha END;

IF OBJECT_ID(N'tempdb..#2MAYA') IS NOT NULL DROP TABLE #2MAYA;

SELECT [Sociedad] ,[Ejercicio_Per_odo] , CONVERT(VARCHAR(20), Fecha, 103) Fecha ,[Lista_Precios] ,[Negocio] ,[Des_Negocio] ,[Sub_Negocio] ,[CodCategoria] ,[Categoria] ,[Sector]
      ,[Des_Sector] ,[Grupo_Clientes] ,[Des_Grupo_Clientes] ,[Grupo_Precios] ,[Des_Grupo_Precios] ,[CodMarca] ,[Marca] ,[CodFamilia] ,[Familia]
      ,[CodAlicorp] ,[Des_Material] ,[Oficina_ventas] ,[Des_Oficina_ventas] ,[Gpo_vendedores] ,[Des_Gpo_vendedores] ,[Gpo_condiciones1] ,[Des_Gpo_condiciones1]
      ,[Cliente]  ,[Agencia_Distribuidora] ,[Zona] ,[Des_Zona] ,[Territorio] ,[Des_territorio] ,[Destinatario_mc_a] ,[Desmercancia] ,[CodPlataforma]
      ,[Plataforma] ,[Plan_Dol] ,[Ventas_Reales] ,[Plan_Ton] ,[Ventas_Ton]
INTO #2MAYA
FROM PLAN_2MAYA

--SELECT * FROM #PANALES

ALTER TABLE PLAN_2MAYA ALTER COLUMN Fecha VARCHAR(20)

TRUNCATE TABLE PLAN_2MAYA;


INSERT INTO PLAN_2MAYA
SELECT *
FROM #2MAYA




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


--Ingreso los planes
SET LANGUAGE SPANISH;

TRUNCATE TABLE PLAN_PANALES;



BULK INSERT PLAN_PANALES
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_PANALES.csv'
WITH (FIELDTERMINATOR=';', FIRSTROW=2, CODEPAGE='ACP');

UPDATE A SET Fecha = REPLACE(Fecha, '.', '/') FROM PLAN_PANALES A;
UPDATE A SET Ventas_Reales = 0 FROM PLAN_PANALES A;
UPDATE A SET Ventas_Ton = 0 FROM PLAN_PANALES A;

ALTER TABLE PLAN_PANALES ALTER COLUMN Fecha DATE NOT NULL;

SET LANGUAGE US_ENGLISH;

UPDATE PLAN_PANALES SET Fecha = CASE WHEN Fecha > @dia THEN @dia ELSE Fecha END;

IF OBJECT_ID(N'tempdb..#PANALES') IS NOT NULL DROP TABLE #PANALES;

SELECT [Sociedad] ,[Ejercicio_Per_odo] , CONVERT(VARCHAR(20), Fecha, 103) Fecha ,[Lista_Precios] ,[Negocio] ,[Des_Negocio] ,[Sub_Negocio] ,[CodCategoria] ,[Categoria] ,[Sector]
      ,[Des_Sector] ,[Grupo_Clientes] ,[Des_Grupo_Clientes] ,[Grupo_Precios] ,[Des_Grupo_Precios] ,[CodMarca] ,[Marca] ,[CodFamilia] ,[Familia]
      ,[CodAlicorp] ,[Des_Material] ,[Oficina_ventas] ,[Des_Oficina_ventas] ,[Gpo_vendedores] ,[Des_Gpo_vendedores] ,[Gpo_condiciones1] ,[Des_Gpo_condiciones1]
      ,[Cliente]  ,[Agencia_Distribuidora] ,[Zona] ,[Des_Zona] ,[Territorio] ,[Des_territorio] ,[Destinatario_mc_a] ,[Desmercancia] ,[CodPlataforma]
      ,[Plataforma] ,[Plan_Dol] ,[Ventas_Reales] ,[Plan_Ton] ,[Ventas_Ton]
INTO #PANALES
FROM PLAN_PANALES

--SELECT * FROM #PANALES

ALTER TABLE PLAN_PANALES ALTER COLUMN Fecha VARCHAR(20)

TRUNCATE TABLE PLAN_PANALES;


INSERT INTO PLAN_PANALES
SELECT *
FROM #PANALES



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
