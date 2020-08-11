create database bdEstoque;

use bdEstoque;

create table tbFornecedor(
	codFornecedor int primary key identity(1,1)
	,nomeFornecedor varchar(20) not null
	,contatoFornecedor varchar(30) not null
) 

create table tbCliente(
	codCliente int primary key identity(1,1)
	,nomeCliente varchar(30) not null
	,cpfCliente char(11) not null
	,emailCliente varchar(30) not null
	,sexoCliente char(1) not null
	,dataNacsimentoCliente smalldatetime not null
)

create table tbFabricante(
	codFabricante int primary key identity(1,1)
	,nomeFabricante varchar(30) not null
)

create table tbVenda(
	codVenda int primary key identity(1,1)
	,dataVenda char(10) not null
	,valorTotalVenda int not null
	,codCliente int foreign key references tbCliente(codCliente)
)


create table tbProduto(
	codProduto int primary key identity(1,1)
	,descricaoProduto varchar(60) not null
	,valorProduto smallmoney not null
	,quantidadeProduto smallint not null
	,codFabricante int foreign key references tbFabricante(codFabricante)
	,codFornecedor int foreign key references tbFornecedor(codFornecedor)
)

create table tbItensVenda(
	codItensVenda int primary key identity(1,1)
	,codVenda int foreign key references tbVenda(codVenda)
	,codProduto int foreign key references tbProduto(codProduto)
	,quantidadeItensVenda smallint not null
	,subTotalItensVenda  smallmoney not null
)


insert into tbCliente(nomeCliente,cpfCliente,emailCliente,sexoCliente,dataNacsimentoCliente)
values ('Amando José Santana',	'12345678900'	,'amandojsantana@outlook.com','m',1905-04-23),
       ('Shela Carvalho Leal', '45678909823','scarvalho@g.com.br','f',1978-09-13),
	   ('Carlos Henrique Souza', '76598278299','chenrique@ig.com.br','m',1981-09-08),
	   ('Maria Aparecida Souza', '87365309899','mapdasouza@outlook.com','f',1962-07-07),
	   ('Adriana Nogueira Silva', '76354309388','drica1977@ig.com.br','f',1977-04-09),
	   ('Paulo Henrique Silva', '87390123111','phsilva80@hotmail.com','m',1987-02-02)


insert into tbFabricante(nomeFabricante)
values('Unilever'),('P&G'),('Bunge')


insert into tbFornecedor(nomeFornecedor, contatoFornecedor)
values('Atacadão','Carlos'),('Assai', 'Maria Stella'),('Roldão', 'Paulo César')


insert into tbProduto(descricaoProduto, valorProduto, quantidadeProduto,codFabricante, codFornecedor)
values ('Amaciante Downy', 5.76, 1500, 2, 1),
       ('Amaciante Comfort', 5.45, 2300, 1, 1),
	   ('Sabão em pó OMO', 5.99, 1280, 1, 2),
	   ('Salsicha Hot Dog Sadia', 6.78, 2900, 3, 2),
	   ('Hamburger Sadia', 9.89, 1600, 3, 1),
	   ('Fralda Pampers', 36.00, 340, 2, 3),
	   ('Xampu Seda', 5.89, 800, 1, 2),
	   ('Condicionador Seda', 4.76, 2500, 3, 1)


insert into tbVenda(dataVenda,valorTotalVenda, codCliente)
values('01/02/2014', 4500.00, 1),
	  ('03/02/2014', 3400.00, 1),
	  ('10/02/2014', 2100.00, 2),
	  ('15/02/2014', 2700.00, 3),
	  ('17/03/2014', 560.00, 5),
	  ('09/04/2014', 1200.00, 4),
	  ('07/05/2014', 3500.00, 1),
	  ('07/05/2014', 3400.00, 1),
	  ('05/05/2014', 4000.00, 2)


insert into tbItensVenda(codVenda, codProduto,quantidadeItensVenda, subTotalItensVenda)
values(1,1,200,1500.00),
	  (1,2,300,3000.00),
	  (2,4,120,1400.00),
	  (2,2,200,1000.00),
	  (2,3,130,1000.00),
	  (3,5,200,2100.00),
	  (4,4,120,1000.00),
	  (4,5,450,700.00),
	  (5,5,200,560.00),
	  (6,7,200,600.00),
	  (6,6,300,600.00),
	  (7,1,300,2500.00),/* tem um erro por aqui, comparar com a tabela do professor*/
	  (7,2,200,1000.00),			/*comparar com a tabela do professor*/
	  (8,6,200,1700.00),
	  (8,5,200,1700.00),
	  (9,4,1000,4000.00)




-- Fixação agregação
/* exe 1 */
select nomefabricante, sum(valorProduto) as 'Soma dos Produtos'
from tbProduto
inner JOIN tbFabricante
on tbFabricante.codfabricante = tbProduto.codfabricante
group by nomeFabricante

/* ex2 */
select sum(quantidadeProduto) as 'Total de produtos no estoque' 
from tbProduto

/* ex3 */
select avg(valorProduto) as 'Valor médio dos produtos' from tbProduto




/* ex4 */
select top(1)
descricaoProduto, max(valorProduto)
from tbProduto
group by descricaoProduto
order by max(valorProduto) desc

/* ex5 */
select top(1)
descricaoProduto, min(valorProduto) 
from tbProduto
group by descricaoProduto
order by min(valorProduto)

/* ex6 */
-- count(distinct DATEPART(MONTH, dataVenda))
/*select distinct DATEPART(MONTH, dataVenda) from tbCliente
inner join tbVenda
on tbCliente.codCliente = tbVenda.codCliente*/

select count(codCliente) from tbVendas
where DATEPART(month, dataVenda) = 6



