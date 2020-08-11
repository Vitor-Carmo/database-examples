create database bdVendas

use bdVendas

create table tbFabricante(
	codFabricante int primary key identity(1,1)
	,nomeFabricante varchar(30) not null
	,cnpjFabricante char(18) not null
)


create table tbProduto(
	codProduto int primary key identity(1000,1)
	,nomeProduto varchar(30) not null
	,precoProduto smallmoney not null
	,pesoProduto decimal not null
	,codFabricante int foreign key references tbFabricante(codFabricante)
)


insert tbFabricante(nomeFabricante, cnpjFabricante)
values  ('Visconti', '12.345.878/0001-90'),
		('Lacta','34.567.989/0001-34'),
		('Garoto','56.784.564/0001-93'),
		('Nestle','98.543.234/0001-03'),
		('Arcor','14.545.765/0002-65'),
		('Topcau', '43.876.543/0001-76')


insert tbProduto(nomeProduto, precoProduto,pesoProduto, codFabricante)
values  ('Ovo ao leite', 19.50,300,1),
		('Ovo Bis',22.90, 400, 2),
		('Ovo laka', 21.98, 400, 2),
		('Ovo Shot', 24.56, 400, 2),
		('Ovo battom ao leite', 26.70, 500, 3),
		('Ovo Batom branco',28.90, 500,3),
		('Ovo Tortuguita morango', 18.90, 400, 4),
		('Ovo Aerado', 19.00, 400, 4),
		('Ovo Twist', 19.90, 400, 4),
		('Ovo Toy Story', 12.50, 100, 5)

/* 1 exercicio*/

update tbFabricante
set nomeFabricante = 'Bauducco'
where nomeFabricante = 'Visconti'

/* 2 exercicio*/
update tbProduto
set precoProduto = precoProduto*1.2
where precoProduto < 19.00

/* 3 exercicio*/
update tbProduto
set precoProduto = precoProduto * 0.95
where precoProduto >= 19.00

/* 4 exercicio*/
update tbProduto
set nomeProduto = 'Ovo Tradicional'
where codProduto = 1000

/* 5 exercicio*/
delete from tbProduto
where codProduto > 1005 and codProduto < 1008


/* 6 exercicio*/
delete from tbProduto 
where pesoProduto < 400 and codFabricante != 2

select * from tbFabricante
select * from tbProduto