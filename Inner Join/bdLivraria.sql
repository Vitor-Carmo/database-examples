CREATE DATABASE bdLivrariaBrasileira;

USE bdLivrariaBrasileira;


CREATE TABLE tbAutor(
	codAutor INT PRIMARY KEY IDENTITY(1,1),
	nomeAutor VARCHAR(200)
);

CREATE TABLE tbGenero(
	codGenero INT PRIMARY KEY IDENTITY(1,1),
	nomeGenero VARCHAR(200)
);

CREATE TABLE tbEditora(
	codEditora INT PRIMARY KEY IDENTITY(1,1),
	nomeEditora VARCHAR(200)
);

CREATE TABLE tbLivro(
	codLivro INT PRIMARY KEY IDENTITY(1,1),
	nomeLivro VARCHAR(200),
	numPaginas INT,
	codGenero INT FOREIGN KEY REFERENCES tbGenero(codGenero),
	codAutor INT FOREIGN KEY REFERENCES tbAutor(codAutor),
	codEditora INT FOREIGN KEY REFERENCES tbEditora(codEditora)
);



INSERT INTO tbGenero(nomeGenero)
VALUES 
('Ficção'),
('Romance'),
('Tragédia')



INSERT INTO tbEditora(nomeEditora)
VALUES 
('Melhoramentos'),
('Globo'),
('Ática'),
('Companhia das Letras'),
('Abril')



INSERT INTO tbAutor(nomeAutor)
VALUES 
('Chico Buarque'),
('Jorge Amado'),
('J.K Rowling'),
('William Shakespeare'),
('Monteiro Lobato'),
('Cora Coralina'),
('Clarice Lispector')



INSERT INTO tbLivro(nomeLivro, numPaginas, codGenero,codEditora,codAutor)
VALUES('Budapeste', 176,2,4,1),
('O bicho-da-Seda', 454,2,5,3),
('Gabriela, Cravo e Canela', 214,1,2,2),
('Reinações de Narizinho', 143,2,2,5),
('Romeu e Julieta', 421,1,3,4),
('O Irmão Alemão', 478,1,4,1),
('Terras do Sem-Fim', 125,1,3,2),
('Animais Fantásticos e Onde Habitam', 267,2,4,3)

--a) O total de livros que começam com a letra P
SELECT count(codLivro) FROM tbLivro 
WHERE nomeLivro LIKE 'P%'

--b) O maior número de páginas entre todos os livros
SELECT MAX(numPaginas) Maximo FROM tbLivro 

--c) O menor número de páginas entre todos os livros
SELECT MIN(numPaginas) Minimo FROM tbLivro 

--d) A média de páginas entre todos os livros
SELECT AVG(numPaginas) Media FROM tbLivro 

--e)A soma do número de páginas dos livros de editora código 01
SELECT SUM(numPaginas) FROM tbLivro 
WHERE codEditora = 1

--f) A soma dos números de páginas dos livros que começam com a letra A
SELECT SUM(numPaginas) FROM tbLivro 
WHERE nomeLivro LIKE 'A%'

--g) A média dos números de páginas dos livros que sejam do autor código 03
SELECT AVG(numPaginas) FROM tbLivro 
WHERE codAutor = 3

--h) A quantidade de livros da editora de código 04
SELECT count(numPaginas) FROM tbLivro 
WHERE codEditora = 4

--i) A média do número de páginas dos livros que tenham a palavra “estrela” em seu nome
SELECT AVG(numPaginas) FROM tbLivro 
WHERE nomeLivro LIKE '%estrela%'

--j) A quantidade de livros que tenham a palavra “poema” em seu nome
SELECT COUNT(numPaginas) FROM tbLivro 
WHERE nomeLivro LIKE '%poema%'


--k) A quantidade de livros agrupado pelo nome do gênero
SELECT nomeGenero, count(codLivro) Qtd_Materia FROM tbLivro 
INNER JOIN tbGenero ON tbLivro.codGenero = tbGenero.codGenero
GROUP BY nomeGenero


--l) A soma das páginas agrupada pelo nome do autor
SELECT nomeAutor, SUM(numPaginas) AS 'total páginas' FROM tbLivro 
INNER JOIN tbAutor ON tbAutor.codAutor = tbLivro.codLivro
GROUP BY nomeAutor 

--m) A média de páginas agrupada pelo nome do autor em ordem alfabética (de A a Z)
SELECT nomeAutor, AVG(numPaginas) AS 'Média das pg' FROM tbLivro 
INNER JOIN tbAutor
ON tbAutor.codAutor = tbLivro.codAutor
GROUP BY nomeAutor
ORDER BY nomeAutor


--n) A quantidade de livros agrupada pelo nome da editora em ordem alfabética inversa (de Z a A)
SELECT nomeEditora, COUNT(codLivro) QTD_LIVROS FROM tbLivro 
INNER JOIN tbEditora
ON tbEditora.codEditora = tbLivro.codEditora
GROUP BY nomeEditora
ORDER BY nomeEditora DESC

--o) A soma de páginas dos livros agrupados pelo nome do autor que sejam de autores cujo nome comece com a letra “C”
SELECT nomeAutor, SUM(numPaginas) SOMA_PG FROM tbLivro 
INNER JOIN tbAutor
ON tbAutor.codAutor = tbLivro.codAutor
WHERE nomeAutor LIKE 'C%'
GROUP BY nomeAutor

--p) A quantidade de livros agrupados pelo nome do autor, cujo nome do autor seja “Machado de Assis” ou “Cora Coralina” ou “Graciliano Ramos” ou “Clarice Lispector”
SELECT nomeAutor, SUM(numPaginas) SOMA_PG FROM tbLivro 
INNER JOIN tbAutor
ON tbAutor.codAutor = tbLivro.codAutor
WHERE nomeAutor LIKE 'C%'
GROUP BY nomeAutor


--q) A soma das páginas dos livros agrupadas pelo nome da editora cujo número de páginas esteja entre 200 e 500 (inclusive)SELECT nomeEditora, SUM(numPaginas) QTD_LIVROS FROM tbLivro 
INNER JOIN tbEditora
ON tbEditora.codEditora = tbLivro.codEditora
WHERE numPaginas BETWEEN 200 AND 500
GROUP BY nomeEditora

--r) O nome dos livros ao lado do nome das editoras e do nome dos autores
SELECT nomeLivro, nomeEditora, nomeAutor  FROM tbLivro
INNER JOIN tbEditora
ON tbLivro.codEditora = tbEditora.codEditora
INNER JOIN tbAutor
ON tbAutor.codAutor = tbLivro.codAutor

--s) O nome dos livros ao lado do nome do autor somente daqueles cujo nome da editora for “Cia das Letras”SELECT nomeLivro, nomeAutor, nomeEditora  FROM tbLivro
INNER JOIN tbEditora
ON tbLivro.codEditora = tbEditora.codEditora
INNER JOIN tbAutor
ON tbAutor.codAutor = tbLivro.codAutor
WHERE nomeEditora LIKE 'Cia das Letras'

--t) O nome dos livros ao lado dos nomes dos autores, somente dos livros que não forem do autor “Érico Veríssimo”
SELECT nomeLivro, nomeAutor  FROM tbLivro
INNER JOIN tbAutor
ON tbAutor.codAutor = tbLivro.codAutor
WHERE nomeAutor LIKE 'Érico Veríssimo'


--u) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles que não tem livros cadastrados
SELECT nomeAutor, nomeLivro  FROM tbAutor
LEFT JOIN tbLivro
ON tbAutor.codAutor = tbLivro.codAutor

-- v) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles que não tem autores cadastradosSELECT nomeLivro, nomeAutor   FROM tbLivro
LEFT JOIN tbAutor
ON tbAutor.codAutor = tbLivro.codAutor

-- w) O nome dos autores ao lado dos nomes dos livros, indiferente do autor ter ou não livro publicado, e indiferente do livro pertencer a algum autor
SELECT nomeAutor,nomeLivro   FROM tbLivro
FULL OUTER JOIN tbAutor
ON tbAutor.codAutor = tbLivro.codAutor

-- x) A editora Ática irá publicar todos os títulos dessa livraria. Criar um select que associe os nomes de todos os livros ao lado do nome da editora Ática
SELECT nomeEditora, nomeLivro   FROM tbLivro
JOIN tbEditora
ON nomeEditora LIKE 'Ática'


--y) Somente os nomes dos autores que não tem livros cadastrados
SELECT nomeAutor  FROM tbLivro
RIGHT JOIN tbAutor
ON tbAutor.codAutor = tbLivro.codAutor
WHERE nomeLivro IS NULL

--z) Os nomes dos gêneros que não possuem nenhum livro cadastrado
SELECT nomeGenero  FROM tbLivro
RIGHT JOIN tbGenero
ON tbGenero.codGenero = tbLivro.codGenero
WHERE nomeLivro IS NULL