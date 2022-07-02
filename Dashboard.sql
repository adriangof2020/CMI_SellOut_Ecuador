USE TABLERO_ECUADOR3;

DROP TABLE MAESTRO_ALICORP;

SELECT *
INTO MAESTRO_ALICORP
FROM CmiSellOutEcuador.dbo.MAESTRO_ALICORP;


DROP TABLE MAESTRO_AGENCIAS;

SELECT *
INTO MAESTRO_AGENCIAS
FROM CmiSellOutEcuador.dbo.MAESTRO_AGENCIAS;



DROP TABLE BASE_MOBILVENDOR_AUTOMATICA;

SELECT *
INTO BASE_MOBILVENDOR_AUTOMATICA
FROM CmiSellOutEcuador.dbo.BASE_PANALES_HISTORICA;

--Para subir el plan del mes si en el algun momento se mueve la base a otro servidor
--BULK INSERT PLAN_PANALES
--FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_PANALES_MAY.csv'
--WITH (FIELDTERMINATOR=';', FIRSTROW=2, CODEPAGE='ACP');


--PLAN PANALES
--cambiar cada cierre de mes



UPDATE A SET Fecha = REPLACE(Fecha, '.', '/') FROM PLAN_PANALES A;
UPDATE A SET Ventas_Reales = 0 FROM PLAN_PANALES A;
UPDATE A SET Ventas_Ton = 0 FROM PLAN_PANALES A;




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

DELETE FROM PLAN_PANALES WHERE RIGHT(Fecha,7) = '06/2022';
--DELETE FROM PLAN_PANALES WHERE Agencia_Distribuidora IN ('ATI CAMPA�A FLAVIA MARINA', 'MOGRO AVILA FERNANDO PATRICIO', 'CONTRERAS DELGADO WASHINGTON' )

--Si en algun momento se llevan la base a otro servidor cambiarlo
INSERT INTO PLAN_PANALES
SELECT *
FROM CmiSellOutEcuador.dbo.PLAN_PANALES;





--Para subir el plan del mes si en el algun momento se mueve la base a otro servidor
--BULK INSERT PLAN_2MAYA
--FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_2MAYA_MAY.csv'
--WITH (FIELDTERMINATOR=';', FIRSTROW=2, CODEPAGE='ACP');
--TRUNCATE TABLE PLAN_2MAYA
--DELETE FROM PLAN_2MAYA WHERE Agencia_Distribuidora IN ('ALVAREZ','FREDVY S.A.','REPREMARVA CIA. LTDA.', 'PRODISPRO PROVEEDORA Y DISTRIBUIDOR','REPRESENTACIONES J.LEONARDO SORIA', 'BARNUEVO VALAREZO &GCP CIAL LTDA','D LOGIS CODILOGIS CIA LTDA')



--PLAN 2MAYA
--cambiar cada cierre de mes SI SE MUEVE LA BASE A OTRO SERVIDOR VER


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



DELETE FROM PLAN_2MAYA WHERE RIGHT(Fecha,7) = '06/2022';


INSERT INTO PLAN_2MAYA
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
--	ELSE Agencia_Distribuidora END FROM PLAN_2MAYA A WHERE FECHA = '1/05/2022'

--SELECT DISTINCT Agencia_Distribuidora FROM PLAN_2MAYA WHERE FECHA = '1/05/2022'