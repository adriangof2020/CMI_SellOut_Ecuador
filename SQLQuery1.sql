USE [CmiSellOutEcuador]

set language us_english

CREATE TABLE [dbo].prueba33(
	
	[FFactura] [date] NULL,
	)
	truncate table prueba33
	BULK INSERT prueba33
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\prueba.csv'
WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');
 
select * from prueba33
set language spanish
UPDATE prueba33 SET FFactura = TRIM(FFactura)
UPDATE prueba33 SET FFactura = CONVERT(DATE,FFactura,107)

select  UPPER(LEFT('hola ',1))+RIGHT('hola',LEN('hola')-1)
set language spanish
--Select CONVERT(DATE,'2022-03-01',103) VER ESTE CASO LUEGO QUE FORMATO ES
Select CONVERT(DATE,'ene 4, 2021',107)  ene 4, 2021 mar 25, 2021
--cuando quieres que un string se vuelva date, el string debe tener algun formato date permitido, luego 
--puedes usar convert y en la parte del formato indicar que formato tiene el string,, luego 
-- la funcion lo vuelve date con el formato yyyy-mm-dd a partir de ahi le puedes dar el formato date
--que desees 

'Mar 25, 2021'

