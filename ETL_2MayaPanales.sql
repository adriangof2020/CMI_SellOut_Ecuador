--TRUNCATE TABLE STAYING_SO_ECUADOR;
--SELECT @@TRANCOUNT
--TtansaccionesAbiertas
DECLARE @ultimoDiaVentas DATE;
SELECT @ultimoDiaVentas = DATEADD(DAY,-1,SYSDATETIME());

EXEC sp_CargaVentasPanales2MayaSOEcuador
	@dia = @ultimoDiaVentas