USE bdEstoque

/* 
	Criar um trigger que, ao ser feita uma venda (Insert na tabela
	tbItensVenda), todos os produtos vendidos tenham sua quantidade
	atualizada na tabela tbProduto. Exemplo, se foi feita uma venda de 5
	unidades do produto código 01, na tabela tbProduto a quantidade desse
	produto será a quantidade atual – 5;
*/

CREATE TRIGGER tgAtualizaQuantidade ON tbItensVenda AFTER INSERT
AS
	DECLARE @codProduto	INT, @quantidadeItensVenda INT 

	SET  @codProduto =  (SELECT codProduto FROM INSERTED)
	SET  @quantidadeItensVenda = (SELECT quantidadeItensVenda FROM INSERTED)
	
	UPDATE tbProduto
		SET quantidadeProduto = quantidadeProduto -  @quantidadeItensVenda
		WHERE codProduto = @codProduto

SELECT * FROM tbItensVenda
SELECT * FROM tbProduto
SELECT * FROM tbVenda

INSERT INTO tbItensVenda(codVenda, codProduto, quantidadeItensVenda, subTotalItensVenda)
VALUES (1, 6, 40, 1000)

/*
	Criar uma trigger que, quando for inserida uma nova entrada de produtos
	na tbEntradaProduto, a quantidade desse produto seja atualizada e
	aumentada na tabela tbProduto;
*/

CREATE TRIGGER tgAtualizaQuantidadeProduto ON tbEntradaProduto AFTER INSERT
AS
	DECLARE @codProduto	INT, @quantidadeEntradaProduto INT 
	SET  @codProduto =  (SELECT codProduto FROM INSERTED)
	SET  @quantidadeEntradaProduto = (SELECT quantidadeEntradaProduto FROM INSERTED)
	
	UPDATE tbProduto
	SET quantidadeProduto = quantidadeProduto +  @quantidadeEntradaProduto
	WHERE codProduto = @codProduto

SELECT * FROM tbEntradaProduto
SELECT * FROM tbSaidaProduto

INSERT INTO tbEntradaProduto(dataEntradaProduto, codProduto, quantidadeEntradaProduto )
VALUES (GETDATE(), 6, 40)

/*
	Criar uma trigger que, quando for feita uma venda de um determinado
	produto, seja feito um Insert na tbSaidaProduto.
*/


CREATE TRIGGER tbInsertSaidaProduto ON tbItensVenda AFTER INSERT
AS
	DECLARE @codProduto	INT, @quantidadeItensVenda INT 

	SET  @codProduto =  (SELECT codProduto FROM INSERTED)
	SET  @quantidadeItensVenda = (SELECT quantidadeItensVenda FROM INSERTED)
	
	INSERT INTO tbSaidaProduto(dataSaidaProduto, codProduto, quantidadeSaidaProduto)
	VALUES(GETDATE(), @codProduto, @quantidadeItensVenda)


SELECT * FROM tbItensVenda

INSERT INTO tbItensVenda(codVenda, codProduto, quantidadeItensVenda, subTotalItensVenda)
VALUES (1, 6, 140, 1800)
