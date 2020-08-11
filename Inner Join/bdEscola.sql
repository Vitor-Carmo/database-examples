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

INSERT INTO tbAluno(nomeAluno,dataNascimentoAluno,rgAluno,naturalidadeAluno)
VALUES ('Paulo Santos',2000-03-10,'82.282.122-0','SP'),
        ('Maria da Gloria',1999-10-03 ,'45.233.123-0','SP'),
        ('Pedro Nogueira da Silva',1998-04-04,'23.533.211-9','SP'),
        ('Gilson Barros Silva',1995-09-09 ,'34.221.111-x','PE'),
        ('Mariana Barbosa Santos',2001-10-10 ,'54.222.122-9','RJ'),
        ('Alessandro Pereira',2003-10-11,'24.402.454-9','ES'),
        ('Aline Melo',2001-10-08,'88.365.012-3','RJ');
        
select * from tbAluno


INSERT INTO tbCurso(nomeCurso,cargaHorariaCurso,valorcurso)
VALUES ('Inglês',2000,356.00),
       ('Alemão',3000,478.00),
       ('Espanhol',4000,500.00);

select * from tbCurso

INSERT INTO tbTurma(nomeTurma,codCurso,horarioTurma)
VALUES('1A',1,'1900-01-01 12:00:00'),
      ('1C',3,'1900-01-01 18:00:00'),
      ('1B',1,'1900-01-01 18:00:00'),
      ('1AA',2,'1900-01-01 19:00:00');

select * from tbTurma     

INSERT INTO tbMatricula(dataMatricula,codAluno,codTurma)
VALUES('2015-10-03',1,1),
      ('2014-05-04',2,1),
      ('2014-05-04',2,4),
      ('2012-05-03',3,2),
      ('2016-03-03',1,3),
      ('2015-05-07',4,2),
      ('2015-07-05',4,3);

select * from tbMatricula   


/*  Eu usei um script de banco antigo que eu já tinha para criado para as tabelas, 
	então uma coisinha ou outra pode ta diferente ,porém, nada de mais
*/

--1) Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem;
select nomeAluno as Aluno, nomeCurso as Curso from tbAluno
inner join tbMatricula
on tbMatricula.codAluno = tbAluno.codAluno
inner Join tbTurma
on tbTurma.codTurma = tbMatricula.codTurma
inner join tbCurso 
on tbCurso.codCurso = tbTurma.codCurso


--2) Apresentar a quantidade de alunos matriculados por nome do curso;
select nomeCurso as Curso, count(nomeALuno) as 'Alunos matriculados' from tbAluno
inner join tbMatricula
on tbMatricula.codAluno = tbAluno.codAluno
inner Join tbTurma
on tbTurma.codTurma = tbMatricula.codTurma
inner join tbCurso 
on tbCurso.codCurso = tbTurma.codCurso
group by nomeCurso


--3) Apresentar a quantidade de alunos matriculados por nome da turma;
select nomeTurma as Turma, count(codAluno) as 'Alunos Matriculados' from tbTurma
inner join tbMatricula
on tbMatricula.codTurma = tbTurma.codTurma
group by nomeTurma


--4) Apresentar a quantidade de alunos que fizeram matricula em maio de 2016;
select dataMatricula as 'Data Matricula', count(dataMatricula) as 'Matricula em maio de 2016' from tbMatricula
where DATEPART(MONTH, dataMatricula) = 5 and DATEPART(YEAR, dataMatricula) = 2016
group by dataMatricula


--5) Apresentar o nome dos alunos em ordem alfabética ao lado do nome das turmas em que estão matriculados
select nomeAluno, nomeTurma from tbAluno
inner join tbMatricula
on tbAluno.codAluno = tbMatricula.codAluno
inner join tbTurma 
on tbTurma.codTurma = tbMatricula.codTurma
order by nomeALuno


--6) Apresentar o nome dos cursos e os horários em que eles são oferecidos
select nomeCurso, horarioTurma from tbCurso
inner join tbTurma
on tbTurma.codCurso = tbCurso.codCurso


--7) Apresentar a quantidade de alunos nascidos por estado
select naturalidadeAluno, count(codAluno) from tbAluno
group by naturalidadeAluno


--8) Apresentar o nome dos alunos ao lado da data de matrícula no formato dd/mm/aaaa
select nomeAluno, FORMAT(dataMatricula, 'dd/MM/yyyy') AS [data da matricula] from tbAluno
inner join tbMatricula
on tbMatricula.codAluno = tbAluno.codAluno

--9) Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de inglês
select nomeALuno as Aluno, nomeCurso as Curso from tbAluno
inner join tbMatricula
on tbMatricula.codAluno = tbAluno.codAluno
inner join tbTurma
on tbTurma.codTurma = tbMatricula.codTurma
inner join tbCurso
on tbCurso.codCurso = tbTurma.codCurso 
where nomeCurso = 'Inglês' and nomeALuno like 'A%'  -- não voltou nenhuma query mas aparentemente ta certo mesmo


--10) Apresentar a quantidade de matriculas feitas no ano de 2016
select count(codMatricula) as 'Quantidade de matriculas do ano de 2016'
from tbMatricula
where DATEPART(YEAR, dataMatricula) = 2016
