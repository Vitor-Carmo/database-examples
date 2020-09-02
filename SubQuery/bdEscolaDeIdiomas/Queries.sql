use bdEscolaIdioma


/*
	1 - Criar uma consulta que retorne o nome e o preço dos cursos que custem abaixo do valor médio
*/
SELECT nomeCurso, valorCurso FROM tbCurso
WHERE valorCurso < (SELECT AVG(valorCurso) FROM tbCurso)



/*
	2 - Criar uma consulta que retorne o nome e o rg do aluno mais novo
*/
SELECT nomeAluno, rgAluno FROM tbAluno
WHERE dataNascimento = (SELECT MAX(dataNascimento) FROM tbAluno)



/*
	3 - Criar uma consulta que retorne o nome do aluno mais velho
*/
SELECT nomeAluno FROM tbAluno
WHERE dataNascimento = (SELECT MIN(dataNascimento) FROM tbAluno)



/*
	4 - Criar uma consulta que retorne o nome e o valor do curso mais caro
*/
SELECT nomeCurso, valorCurso FROM tbCurso
WHERE valorCurso = (SELECT MAX(valorCurso) FROM tbCurso)



/*
	5 - Criar uma consulta que retorne o nome do aluno e o nome do curso, 
		do aluno que fez a última matrícula
*/
SELECT nomeAluno, nomeCurso FROM tbAluno
INNER JOIN tbMatricula
ON tbMatricula.codAluno = tbAluno.codAluno
INNER JOIN tbTurma
ON tbMatricula.codTurma = tbTurma.codTurma
INNER JOIN tbCurso
ON tbTurma.codCurso = tbCurso.codCurso
WHERE dataMatricula = (SELECT MAX(dataMatricula) FROM tbMatricula)



/*
	6 - Criar uma consulta que retorne o nome do primeiro aluno a ser matriculado na escola de Idiomas
*/
SELECT nomeAluno FROM tbAluno
INNER JOIN tbMatricula
ON tbMatricula.codAluno = tbAluno.codAluno
WHERE dataMatricula = (SELECT MIN(dataMatricula) FROM tbMatricula)



/*
	7 - Criar uma consulta que retorne o nome, rg e data de nascimento de todos 
		os alunos que estejam matriculados no curso de inglês
*/
SELECT nomeAluno, rgAluno, dataNascimento FROM tbAluno
INNER JOIN tbMatricula
ON tbMatricula.codAluno = tbAluno.codAluno
INNER JOIN tbTurma
ON tbMatricula.codTurma = tbTurma.codTurma
INNER JOIN tbCurso
ON tbTurma.codCurso = tbCurso.codCurso
WHERE nomeCurso = 'Inglês'