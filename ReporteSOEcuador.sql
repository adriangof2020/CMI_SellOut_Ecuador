DECLARE @ultimoDiaVentas DATE;
SELECT @ultimoDiaVentas = DATEADD(DAY,-1,SYSDATETIME());


EXEC sp_ReporteSOEcuador
	 @dia = @ultimoDiaVentas
	,@MesAnterior = 'Ago-22'
	,@MesAņoAnterior = 'Set-21'
	,@TipoDistribuidor = 'MINORISTAS'