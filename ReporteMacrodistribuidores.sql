DECLARE @ultimoDiaVentas DATE;
SELECT @ultimoDiaVentas = DATEADD(DAY,-1,SYSDATETIME());


EXEC sp_ReporteMacrodistribuidoresSOEcuador
	 @dia = @ultimoDiaVentas
	,@MesAnterior = 'Set-21'
	,@MesAņoAnterior = 'Ago-22'