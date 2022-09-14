USE CmiSellOutEcuador;

SET LANGUAGE US_ENGLISH;

TRUNCATE TABLE NuevoPlanHularussFormato;

BULK INSERT NuevoPlanHularussFormato
FROM 'C:\Proyectos\Ecuador\CMI_SellOut_Ecuador\BaseDatos\PLAN_HULARUSS.csv'
WITH (FIELDTERMINATOR=';',FIRSTROW=2,CODEPAGE='ACP');

DECLARE @dia DATE;
SELECT @dia= DATEADD(DAY,-1,SYSDATETIME());

DELETE FROM NuevoPlanHularussFormato WHERE CodAlicorp LIKE '%TOTAL%'

UPDATE A SET CodAlicorp = TRIM(CodAlicorp) FROM NuevoPlanHularussFormato A;
UPDATE A SET Canal = TRIM(Canal) FROM NuevoPlanHularussFormato A;
UPDATE NuevoPlanHularussFormato SET CodAlicorp = LEFT(CodAlicorp,CHARINDEX(' ',CodAlicorp)-1);
UPDATE NuevoPlanHularussFormato SET Fecha = @dia
