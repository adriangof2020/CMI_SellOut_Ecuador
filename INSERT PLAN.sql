/****** Script for SelectTopNRows command from SSMS  ******/
SELECT A.CodAlicorp, B.CodAlicorp C
  FROM PLAN_HULARUSS A LEFT JOIN MAESTRO_ALICORP B ON A.CodAlicorp = B.CodAlicorp WHERE B.CodAlicorp IS NULL

SELECT A.CodAlicorp, B.CodAlicorp C
  FROM PLAN_2MAYA A LEFT JOIN MAESTRO_ALICORP B ON A.CodAlicorp = B.CodAlicorp WHERE B.CodAlicorp IS NULL


SELECT A.CodAlicorp, B.CodAlicorp C
  FROM PLAN_PANALES A LEFT JOIN MAESTRO_ALICORP B ON A.CodAlicorp = B.CodAlicorp WHERE B.CodAlicorp IS NULL

--IF OBJECT_ID(N'tempdb..#PLANES') IS NOT NULL DROP TABLE #PLANES;
--SELECT *
--INTO #PLANES
--FROM PLAN_2MAYA

--INSERT INTO #PLANES
--SELECT *
--FROM PLAN_PANALES

--INSERT INTO #PLANES
--SELECT *
--FROM PLAN_HULARUSS
 
INSERT INTO MAESTRO_ALICORP
SELECT C.*, D.PesoKG, (D.PesoKG/1000) PesoTon, D.FacUnitario
FROM 
--(SELECT	  DISTINCT B.CodAlicorp, B.Des_Material Material, B.CodCategoria, B.Categoria,
					--B.CodFamilia, B.Familia, B.CodMarca, B.Marca, B.Plataforma
					(SELECT DISTINCT B.CodAlicorp, B.Des_Material Material, B.CodCategoria, B.Categoria,
					B.CodFamilia, B.Familia, B.CodMarca, B.Marca, B.Plataforma
					FROM (SELECT * FROM PLAN_HULARUSS 
					UNION ALL SELECT * FROM PLAN_PANALES
					UNION ALL SELECT *  FROM PLAN_2MAYA) B

--FROM    #PLANES B 
WHERE  B.CodAlicorp NOT IN (SELECT DISTINCT CodAlicorp FROM MAESTRO_ALICORP)) C
LEFT JOIN MAESTRO_FERHAWA D ON C.CodAlicorp = D.CodAlicorp

