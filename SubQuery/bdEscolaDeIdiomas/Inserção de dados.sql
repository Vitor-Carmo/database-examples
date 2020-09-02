use bdEscolaIdioma

insert into tbCurso (nomeCurso, valorCurso)
values
	('Inglês', 356),
	('Alemão', 450),
	('Espanhol', 433)
	
insert into tbAluno (nomeAluno, rgAluno,cpfAluno,logradouro, numero, complemento, cep, bairro, cidade, dataNascimento)
values
	('José Carlos', '5.553.45-56', '452.984.517-53', 'Rua Severino Solto Maior', '5', 'Bloco B', '46464-451', 'Cidade Tiradentes', 'São Paulo', 2002/01/03),
	('Lucas Silva', '78.858.16-84', '123.456.789-10', 'Rua Taboa', 19, '', '12345-678', 'Vila Yolanda II', 'São Paulo', 2000/04/27),
	('Tio Baú', '12.345.67-89', '455.451.545-50', 'Rua Taboa', 17, '', '12345-678', 'Vila Yolanda II', 'São Paulo', 1989/05/05)
	
insert into tbNivel (descricaoNivel)
values
	('Basico'),
	('Médio'),
	('Avançado')
	
insert into tbPeriodo (descricaoPeriodo)
values
	('Manhã'),
	('Tarde'),
	('Noite')
	
insert into tbTurma (descricaoTurma, horario, diaDaSemana, codCurso, codNivel, codPeriodo)
values
	('1A', '09:00', 'Sexta', 1, 3, 1),
	('1B', '14:00', 'Sabado', 2, 2, 2)
	
insert into tbMatricula (dataMatricula, codAluno, codTurma)
values
	(2019/05/05, 3, 2),
	(2019/05/05, 2, 2),
	(2019/04/05, 1, 1)
