SELECT Territorio, CodFamilia, Familia, CodCategoria, Categoria, real_Dolares, real_ton FROM VENTAS_CONSOLIDADO WHERE Dia LIKE '%07/2022' AND ClienteSellOut <> 'Dummy'

select SUM(real_dolares) from VENTAS_CONSOLIDADO WHERE Dia LIKE '%07/2022' AND ClienteSellOut <> 'Dummy'
