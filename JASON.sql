/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [CmiSellOutEcuador].[dbo].[BD_FECHAS] FOR JSON AUTO


  DECLARE @HOLI VARCHAR(MAX);
  SELECT @HOLI = '[{"PER":"001.2021","DES_MES":"Ene-21","DIA_2":2},{"PER":"001.2022","DES_MES":"Ene-22"}]';
  SELECT ISJSON(@HOLI);
  
   SELECT * FROM OPENJSON(@HOLI)
  WITH (
  PER VARCHAR(20),
  DES_MES VARCHAR(20),
  DIA_2 VARCHAR(20)
  );

  
  DECLARE @HOLI VARCHAR(MAX);
  SELECT @HOLI = '{"PER":"001.2021","DES_MES":{"PER":"001.2022","DES_MES":"Ene-22"}}';
  SELECT ISJSON(@HOLI);
  SELECT JSON_QUERY(@HOLI,'$.DES_MES')
  
  IF OBJECT_ID(N'tempdb..#JSON') IS NOT NULL DROP TABLE #JSON
  SELECT *
  INTO #JSON
  FROM OPENJSON(@HOLI)
  WITH(
  PER VARCHAR(20),
  DES_MES NVARCHAR(MAX) AS JSON
  );
  SELECT * FROM #JSON
  --PARA INSERTAR UN OBJETO SE DEBE DEFINIR COMO NVARCHAR(MAX) AS JSON
  
 

  SELECT * FROM BD_FECHAS WHERE PER = JSON_VALUE(@HOLI, '$.PER')
  SELECT FirstName, LastName FROM Person.Person
WHERE  BusinessEntityID = JSON_VALUE(@json, '$.BusinessEntityID')






  SELECT * FROM OPENJSON(@json)
WITH (BusinessEntityID int,
   NationalIDNumber int,
   JobTitle varchar(100),
   BirthDate varchar(200),
   Gender varchar(2)
)

DECLARE @HULARUSS VARCHAR(MAX);
SELECT @HULARUSS = BULKCOLUMN FROM 
OPENROWSET(BULK 'C:\Proyectos\Ecuador\HULARUSS\junios.json', SINGLE_BLOB) JSON;
IF (ISJSON(@HULARUSS) = 1)
INSERT INTO 
SELECT * 
FROM OPENJSON(@HULARUSS)
WITH (
	CanalSR VARCHAR (100),
	Ruta  VARCHAR (100),
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
WHERE MONTH(Fecha)=06;