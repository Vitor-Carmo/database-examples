use bdEscola


-- 1 Criar uma stored procedure “Busca_Aluno” que receba o código do aluno e retorne seu nome e data de nascimento.

CREATE PROCEDURE spBusca_Aluno
	@cod_aluno INT
	AS
		SELECT nomeAluno, dataNascimentoAluno FROM tbAluno
		WHERE codAluno = @cod_aluno

EXEC spBusca_Aluno 1



-- 2 Criar uma stored procedure “Insere_Aluno” que insira um registro na tabela de Alunos.

CREATE PROCEDURE spInsere_Aluno
	@nome VARCHAR(30),
	@dataNascimento DATETIME,
	@rgAluno CHAR(12),
	@naturalidade CHAR(2)

AS 
	INSERT INTO tbAluno(nomeALuno, dataNascimentoAluno,rgAluno,naturalidadeAluno)
	VALUES (@nome, @dataNascimento, @rgAluno, @naturalidade)

EXEC spInsere_Aluno 'Vitor Carmo', '2002-01-03', '111.222.333-0', 'SP'


-- 3 Criar uma stored procedure “Aumenta_Preco” que, dados o nome do curso e um percentual,
--	 aumente o valor do curso com a porcentagem informada

SELECT * FROM tbCurso

CREATE PROCEDURE spAumenta_Preco
	@nomeCurso VARCHAR(30),
	@porcentual FLOAT
AS
	UPDATE tbCurso
	SET valorCurso = valorCurso + (valorCurso * (@porcentual / 100))
	WHERE nomeCurso = @nomeCurso;

EXEC spAumenta_Preco 'Espanhol', 100

-- 4 Criar uma stored procedure “Exibe_Turma” que,
-- dado o nome da turma exiba todas as informações dela.CREATE PROCEDURE spExibe_Turma
	@nomeTurma VARCHAR(30)
AS
	SELECT * FROM tbTurma
	WHERE nomeTurma = @nomeTurma	

EXEC spExibe_Turma '1A'


-- 5  Criar uma stored procedure “Exibe_AlunosdaTurma” que, 
--    dado o nome da turma exiba os seus alunos.

CREATE PROCEDURE spExibe_AlunosdaTurma
	@nomeTurma VARCHAR(30)
AS
	SELECT nomeALuno FROM tbTurma
	INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
	INNER JOIN tbAluno ON tbAluno.codAluno = tbMatricula.codAluno
	WHERE nomeTurma = @nomeTurma

EXEC spExibe_AlunosdaTurma '1A'


--6- Criar uma stored procedure para inserir alunos, verificando pelo cpf se o aluno existe ou não, 
--   e informar essa condição via mensagem


ALTER TABLE tbAluno
ADD cpfAluno CHAR(14);


select * from tbAluno


CREATE PROCEDURE spInserindo_Aluno
	@nome VARCHAR(30),
	@dataNascimento DATETIME,
	@rgAluno CHAR(12),
	@naturalidade CHAR(2),
	@cpfAluno CHAR(14)
AS 
	BEGIN
		IF EXISTS ( SELECT codAluno from tbAluno WHERE cpfAluno like @cpfAluno)
			BEGIN 
				print('Impossivel Cadastrar. Ja existe o cpf '+ @cpfAluno + ' Cadastrado')
			END
		ELSE
			BEGIN
				INSERT INTO tbAluno(nomeALuno, dataNascimentoAluno,rgAluno,naturalidadeAluno, cpfAluno)
				VALUES (@nome, @dataNascimento, @rgAluno, @naturalidade, @cpfAluno)
			
				print('Aluno ' + @nome + ' foi cadastrado com sucesso') 
			END	
	END

EXEC spInserindo_Aluno 'Vitória Santos', '2006-05-03', '111.222.333-0', 'SP', '111.222.333-11'


-- 7 Criar uma stored procedure que receba o nome do curso e o nome
-- do aluno e matricule o mesmo no
-- curso pretendido

CREATE PROCEDURE spMatriculaAluno
	@nomeAluno VARCHAR(30),
	@nomeCurso VARCHAR(30)

AS	
	IF EXISTS(SELECT codAluno FROM tbAluno WHERE nomeALuno Like @nomeAluno) and
		EXISTS(SELECT TOP 1 codTurma FROM tbCurso
				INNER JOIN tbTurma ON tbTurma.codCurso = tbCurso.codCurso
				WHERE nomeCurso Like @nomeCurso)
		BEGIN
			declare @codAluno int = (SELECT codAluno FROM tbAluno WHERE nomeALuno Like @nomeAluno)
			declare @codTurma int = (SELECT TOP 1 codTurma FROM tbCurso 
										INNER JOIN tbTurma ON tbTurma.codCurso = tbCurso.codCurso
										WHERE nomeCurso Like @nomeCurso )

			INSERT INTO tbMatricula(dataMatricula, codAluno, codTurma)
			VALUES( GETDATE(), @codAluno, @codTurma)
			print(@nomeAluno+' Foi cadastrado com sucesso no curso de' +@nomeCurso+'.')		

		END
	ELSE
		BEGIN
			print('Nenhum Aluno ou Curso foi encontrado com esses parâmetros!')		
		END

EXEC spMatriculaAluno 'Vitor Carmo', 'Espanhol'
EXEC spMatriculaAluno 'Vitor Carmo', 'Alemão'
EXEC spMatriculaAluno 'Vitor Carmo', 'Inglês'
EXEC spMatriculaAluno 'Aline Mendonça', 'Alemão' -- retorna "nenhum Aluno ..."
