CREATE DATABASE PythonSQL
USE PythonSQL

CREATE TABLE Vendas(
	id_venda INT,
	data_venda DATE,
	cliente VARCHAR(100),
	produto VARCHAR(100),
	preco DECIMAL(10,2),
	quantidade INT
	)

INSERT INTO Vendas(id_venda,data_venda,cliente,produto,preco,quantidade)
VALUES
	(1,'22/04/2022','Ana','Celular',2000,1)

	SELECT * FROM Vendas