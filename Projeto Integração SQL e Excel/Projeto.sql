-- Total de Vendas por categoria no ano de 2013.

-- Receita total de pedido de internet por mês do ano de 2013.

-- Receita e Custo total de Internet por País no ano de 2013.

-- Total de Vendas de Internet por sexo no ano de 2013

-- Código corrigido.


CREATE OR ALTER VIEW VENDAS_INTERNET AS
SELECT
	s.SalesOrderNumber AS 'N° do Pedido',
	s.OrderDate AS 'Data Pedido',
	cat.EnglishProductCategoryName AS 'Categoria Produto',
	cliente.FirstName + ' ' + LastName AS 'Nome Cliente',
	Gender AS 'SEXO',
	ter.SalesTerritoryCountry AS 'País',
	s.OrderQuantity AS 'Qtd. Vendida',
	s.TotalProductCost AS 'Custo da Venda',
	s.SalesAmount AS 'Receita da Venda'
FROM
	FactInternetSales s
INNER JOIN DimProduct p ON p.ProductKey = s.ProductKey
	INNER JOIN DimProductSubcategory sub ON p.ProductSubcategoryKey = sub.ProductSubcategoryKey
		INNER JOIN DimProductCategory cat ON sub.ProductCategoryKey = cat.ProductCategoryKey
		
INNER JOIN DimCustomer cliente ON s.CustomerKey = cliente.CustomerKey
INNER JOIN DimSalesTerritory ter ON s.SalesTerritoryKey = ter.SalesTerritoryKey
WHERE YEAR(OrderDate) = 2013 

-- Caso faça alguma ateração aqui, é só atualizar "TUDO" no Excel. 