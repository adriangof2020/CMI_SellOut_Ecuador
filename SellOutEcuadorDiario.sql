USE [CmiSellOutEcuador];
DROP TABLE NOTAS_CREDITO;
CREATE TABLE NOTAS_CREDITO(
	TTransaccion VARCHAR(100) NULL,
	NDoc VARCHAR(100) NULL,
	Cliente VARCHAR(100) NULL,
	NCliente VARCHAR(100) NULL,
	OVenta VARCHAR(100) NULL,
	Pos VARCHAR(100) NULL,
	CodArticulo VARCHAR(100) NULL,
	Cntr VARCHAR(100) NULL,
	SKU VARCHAR(100) NULL,
	DesArticulo VARCHAR(100) NULL,
	Agencia VARCHAR(100) NULL,
	FNC DATE,
	TTrans VARCHAR(100) NULL,
	NFactura VARCHAR(100) NULL,
	Referencia VARCHAR(100) NULL,
	Importe FLOAT NULL,
	CodAlicorp VARCHAR(100) NULL
	);

IF OBJECT_ID(N'tempdb..#Prueba1') IS NOT NULL DROP TABLE #Prueba1;

SELECT Regional
INTO #Prueba1
FROM NOTAS_CREDITO;


	--COMENZAMOS CON DROP
	LUEGO EN LA TABLA TEMPORRAL ALTERAMOS
