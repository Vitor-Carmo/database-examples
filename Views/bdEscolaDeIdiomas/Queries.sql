use bdEscolaIdioma


/*
	Crie uma vis�o �Pre�o_Baixo� que exiba o c�digo, nome do curso, carga hor�ria e o 
	valor do curso de todos os cursos que tenha pre�o inferior ao pre�o m�dio.
*/
CREATE VIEW vwPrecoBaixo as 
SELECT codCurso  'Codigo', nomeCurso  'Nome do Curso', valorCurso 'Pre�o', cargahoraria 'Carga Hor�ria' from tbCurso
WHERE valorCurso < (SELECT AVG(valorCurso) from tbCurso)

SELECT * FROM vwPrecoBaixo


--Usando a vis�o �Pre�o_Baixo�, mostre todos os cursos ordenados por carga hor�ria.
SELECT * FROM vwPrecoBaixo
ORDER BY 'Carga Hor�ria'



--Crie uma vis�o �Alunos_Turma� que exiba o curso e a quantidade de alunos por turma.
CREATE VIEW vwAlunosTurma as
SELECT nomeCurso, COUNT(tbAluno.codAluno) as 'Quantidade_alunos' FROM tbAluno
INNER JOIN tbMatricula
ON tbMatricula.codAluno = tbAluno.codAluno
INNER JOIN tbTurma
ON tbMatricula.codTurma = tbTurma.codTurma
INNER JOIN tbCurso
ON tbCurso.codCurso = tbTurma.codCurso
GROUP BY nomeCurso

select * from vwAlunosTurma


--Usando a vis�o �Alunos_Turma� exiba a turma com maior n�mero de alunos.
SELECT nomeCurso, MAX(Quantidade_alunos) from vwAlunosTurma
GROUP BY nomeCurso


--Crie uma vis�o �Turma_Curso que exiba o curso e a quantidade de turmas.
CREATE VIEW vwTurmaCurso as
SELECT nomeCurso, COUNT(tbTurma.codTurma) 'quantidade de turmas' FROM tbCurso
INNER JOIN tbTurma
ON tbTurma.codCurso = tbCurso.codCurso
GROUP BY nomeCurso

SELECT * FROM vwTurmaCurso

-- Usando a vis�o "Turma_Curso" exiba o curso com menor n�mero de turmas.
SELECT nomeCurso, min([quantidade de turmas]) 'Minima quantidade de turmas' FROM vwTurmaCurso
GROUP BY nomeCurso