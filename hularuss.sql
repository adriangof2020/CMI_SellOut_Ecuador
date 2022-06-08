/****** Script for SelectTopNRows command from SSMS  ******/
SET LANGUAGE US_ENGLISH
TRUNCATE TABLE [VentasHularuss]
BULK INSERT [VentasHularuss]
  FROM 'C:\Proyectos\Ecuador\HULARUSS\VentasHularuss.csv'
WITH (FIELDTERMINATOR= ';', FIRSTROW=2, CODEPAGE='ACP');

UPDATE [VentasHularuss]
SET Cantidad = REPLACE(Cantidad,',','')
WHERE CHARINDEX(',',Cantidad) > 0;

UPDATE [VentasHularuss]
SET importe = REPLACE(importe,',','')
WHERE CHARINDEX(',',importe) > 0;

UPDATE [VentasHularuss]
SET VentaKilos = REPLACE(VentaKilos,',','')
WHERE CHARINDEX(',',VentaKilos) > 0;

ALTER TABLE [VentasHularuss] ALTER COLUMN VentaKilos FLOAT;
ALTER TABLE [VentasHularuss] ALTER COLUMN importe FLOAT;
ALTER TABLE [VentasHularuss] ALTER COLUMN Cantidad DECIMAL (18,0);
SELECT * FROM [VentasHularuss] WHERE importe > 1000
