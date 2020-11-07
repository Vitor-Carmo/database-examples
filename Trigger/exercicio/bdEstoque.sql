USE bdEstoque

GO 

CREATE TABLE tbSaidaProduto(
	codSaidaProduto INT PRIMARY KEY IDENTITY(1, 1),
	dataSaidaProduto DATE NOT NULL,
	codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto),
	quantidadeSaidaProduto INT NOT NULL,
);


CREATE TABLE tbEntradaProduto(
	codEntradaProduto INT PRIMARY KEY IDENTITY(1, 1),
	dataEntradaProduto DATE NOT NULL,
	codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto),
	quantidadeEntradaProduto INT NOT NULL,
);

SELECT * FROM tbEntradaProduto
SELECT * FROM tbSaidaProduto