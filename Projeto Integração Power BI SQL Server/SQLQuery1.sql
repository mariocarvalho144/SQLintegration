
SELECT * FROM FactInternetSales
SELECT * FROM DimProduct
SELECT * FROM DimProductCategory
SELECT * FROM DimCustomer
SELECT * FROM DimGeography

CREATE OR ALTER VIEW RESULTADOS_ADW AS
SELECT
	fs.SalesOrderLineNumber AS 'N° da Venda',
	fs.OrderDate AS 'Data da Compra',
	cat.EnglishProductCategoryName AS 'Nome da Categoria',
	c.CustomerKey AS 'ID Cliente',
	c.FirstName + ' ' + c.LastName AS 'Name',
	REPLACE(REPLACE(c.Gender,'M','Masculino'),'F','Feminino') AS 'Gênero',
	g.EnglishCountryRegionName AS 'Nome da Região',
	fs.OrderQuantity AS 'Qtd. Pedido',
	fs.SalesAmount AS 'Valor da Venda',
	fs.TotalProductCost AS 'Valor Total do Produto',
	fs.SalesAmount - TotalProductCost AS 'Lucro'

FROM FactInternetSales fs
INNER JOIN DimCustomer c ON c.CustomerKey = fs.CustomerKey
	INNER JOIN DimGeography g ON c.GeographyKey = g.GeographyKey

INNER JOIN DimProduct p ON fs.ProductKey = p.ProductKey
	INNER JOIN DimProductSubcategory sc ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey
		INNER JOIN DimProductCategory cat ON sc.ProductCategoryKey = cat.ProductCategoryKey

SELECT * FROM RESULTADOS_ADW