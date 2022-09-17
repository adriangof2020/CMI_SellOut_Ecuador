--TRUNCATE TABLE STAYING_SO_ECUADOR;
--SELECT @@TRANCOUNT
--TtansaccionesAbiertas
--DECLARE @ultimoDiaVentas DATE;
--SELECT @ultimoDiaVentas = DATEADD(DAY,-17,SYSDATETIME());

EXEC sp_CargaVentasPydacoSOEcuador
	--@dia = @ultimoDiaVentas