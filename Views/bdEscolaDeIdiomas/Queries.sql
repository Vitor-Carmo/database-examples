use bdEscolaIdioma


/*
	Crie uma visão “Preço_Baixo” que exiba o código, nome do curso, carga horária e o 
	valor do curso de todos os cursos que tenha preço inferior ao preço médio.
*/
CREATE VIEW vwPrecoBaixo as 
SELECT codCurso  'Codigo', nomeCurso  'Nome do Curso', valorCurso 'Preço', cargahoraria 'Carga Horária' from tbCurso
WHERE valorCurso < (SELECT AVG(valorCurso) from tbCurso)

SELECT * FROM vwPrecoBaixo


--Usando a visão “Preço_Baixo”, mostre todos os cursos ordenados por carga horária.
SELECT * FROM vwPrecoBaixo
ORDER BY 'Carga Horária'



--Crie uma visão “Alunos_Turma” que exiba o curso e a quantidade de alunos por turma.
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


--Usando a visão “Alunos_Turma” exiba a turma com maior número de alunos.
SELECT nomeCurso, MAX(Quantidade_alunos) from vwAlunosTurma
GROUP BY nomeCurso


--Crie uma visão “Turma_Curso que exiba o curso e a quantidade de turmas.
CREATE VIEW vwTurmaCurso as
SELECT nomeCurso, COUNT(tbTurma.codTurma) 'quantidade de turmas' FROM tbCurso
INNER JOIN tbTurma
ON tbTurma.codCurso = tbCurso.codCurso
GROUP BY nomeCurso

SELECT * FROM vwTurmaCurso

-- Usando a visão "Turma_Curso" exiba o curso com menor número de turmas.
SELECT nomeCurso, min([quantidade de turmas]) 'Minima quantidade de turmas' FROM vwTurmaCurso
GROUP BY nomeCurso