CREATE DATABASE bdEscola

USE bdEscola

CREATE TABLE tbCurso(
	codCurso  INT PRIMARY KEY IDENTITY(1,1)
	,nomeCurso VARCHAR(30) NOT NULL
	,cargaHorariaCurso INT NOT NULL
	,valorCurso SMALLMONEY NOT NULL
);

CREATE TABLE tbAluno(
	codAluno INT PRIMARY KEY IDENTITY(1,1)
	,nomeALuno VARCHAR(30) NOT NULL
	,dataNascimentoAluno DATETIME NOT NULL
	,rgAluno CHAR(12) NOT NULL
	,naturalidadeAluno CHAR(2)
);



CREATE TABLE tbTurma(
	codTurma INT PRIMARY KEY IDENTITY(1,1)
	,nomeTurma varchar(30)
	,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso)
	,horarioTurma DATETIME
);

CREATE TABLE tbMatricula(
	codMatricula INT PRIMARY KEY IDENTITY(1,1),
	dataMatricula DATETIME NOT NULL
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
	,codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma)
);



INSERT tbCurso(nomeCurso, cargaHorariaCurso, valorCurso)
VALUES ('Inglês', 2000, 356.00)
		,('Alemão', 3000, 478.00)

select * from tbCurso

INSERT tbAluno(nomeALuno, dataNascimentoAluno, rgAluno, naturalidadeAluno)
VALUES ('Paulo Santos', '2000-10-03', '82.292.122-0', 'SP')
		,('Maria da Gloria', '1999-03-10', '45.233.123-0', 'SP')
		,('Perla Nogueira Silva', '1998-04-04', '23.533.211-9', 'SP')
		,('Gilson Barros Silva', '1995-09-09', '34.221.111-x', 'PE')
		,('Mariana Barbosa Santos', '2001-10-10', '54.222.122-9', 'RJ')

select * from tbAluno


INSERT tbTurma(nomeTurma, codCurso, horarioTurma)
VALUES ('1IA', 1, '1900-01-01 12:00:00')
		,('1IB', 1, '1900-01-01 18:00:00')
		,('1AA', 2, '1900-01-01 19:00:00')

select * from tbTurma


INSERT tbMatricula(dataMatricula, codAluno, codTurma)
VALUES ('2015-03-10', 1, 1)
		,('2014-04-05', 2, 1)
		,('2012-03-05', 3, 2)
		,('2016-03-03', 1, 3)
		,('2015-07-05', 4, 2)
		,('2015-05-07', 4, 3)
		,('2015-06-06', 5, 1)
		,('2015-05-05', 5, 3)

select * from tbMatricula


/* ex 1 */
select nomeAluno as 'Nome', rgAluno as 'RG', dataNascimentoAluno as 'Data de Aniversário' from tbAluno
where naturalidadeAluno  = 'SP'

/* ex 2 */
select nomeAluno as 'Nome', rgAluno as 'RG' from tbAluno
where nomeALuno like 'P%'

/* ex 3 */
select nomeCurso as 'Nome' from tbCurso
where cargaHorariaCurso > 2000

/* ex 4 */
select nomeAluno, rgAluno from tbAluno
where nomeALuno like '%silva%'

/* ex 5 */
select nomeAluno as 'Nome', dataNascimentoAluno as 'Data Nascimento' from tbAluno
where DATEPART(MONTH, dataNascimentoAluno) = 3

/* ex 6 */
select codAluno as 'Código do Alunos', dataMatricula as 'Data da Matricula' from tbMatricula
where DATEPART(MONTH, dataMatricula) = 5

/* ex 7 */
select codAluno as 'Código Alunos'from tbMatricula
where codTurma = 1 or codTurma = 2

/* ex 8 */
select codAluno as 'Código Alunos' from tbMatricula
where codTurma = 3

/* ex 9 */
select * from tbAluno

/* ex 10 */
select * from tbTurma

/* ex 11 */
select * from tbAluno
where nomeALuno like 'A%'

/* ex 12 */
select * from tbAluno
where DATEPART(YEAR, dataNascimentoAluno) >= 1990 and DATEPART(YEAR, dataNascimentoAluno) <= 1999

/* ex 13 */
select * from tbAluno
where not naturalidadeAluno = 'SP'


/*  ex 14 
 *
 *	Ta de sacanagem, professor! tive que pesquisar
 *	Join na documentação do SQL SERVER
 */
SELECT * FROM tbAluno
JOIN tbMatricula 
    ON (tbMatricula.codAluno = tbAluno.codAluno)
WHERE tbMatricula.codTurma != 1;


/* ex 15 */
select * from tbTurma
where DATEPART(HOUR, horarioTurma) >= 18

