create database bdEscolaIdioma
go

use bdEscolaIdioma

create table tbAluno (
	codAluno int primary key identity (1,1),
	nomeAluno varchar (50) not null,
	rgAluno varchar (15) not null,
	cpfAluno varchar(14) not null,
	logradouro varchar (50) not null,
	numero int not null,
	complemento varchar(10),
	cep varchar(9) not null,
	bairro varchar(50) not null,
	cidade varchar(50) not null,
	dataNascimento smalldatetime not null,
)
create table tbTelefoneAluno(
	codTel int primary key identity (1,1),
	numTelAluno varchar(10) not null,
	codAluno int foreign key references tbAluno(codAluno)
)
create table tbCurso (
	codCurso int primary key identity (1,1),
	nomeCurso varchar (50) not null,
	valorCurso smallmoney not null
)
create table tbNivel (
	codNivel int primary key identity (1,1),
	descricaoNivel varchar(50)
)
create table tbPeriodo (
	codPeriodo int primary key identity (1,1),
	descricaoPeriodo varchar(50)
)
create table tbTurma (
	codTurma int primary key identity (1,1),
	descricaoTurma varchar (50) not null,
	codCurso int foreign key references tbCurso (codCurso),
	codNivel int foreign key references tbNivel (codNivel),
	codPeriodo int foreign key references tbPeriodo (codPeriodo),
	horario time not null,
	diaDaSemana varchar(7) not null,
)
create table tbMatricula (
	codMatricula int primary key identity (1,1),
	dataMatricula smalldatetime not null,
	codAluno int foreign key references tbAluno (codAluno),
	codTurma int foreign key references tbTurma (codTurma),
	
)