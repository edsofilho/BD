create database Prova
create table AlunoMonitor(
CodigoMatricula varchar(50) not null primary key,
nome varchar(50) not null
);

create table aluno(
nome varchar(50) not null,
email varchar(50) not null,
telefone varchar(13) not null,
altura decimal(2,2) not null,
peso decimal(3,3) not null,
datanascimento date not null,
datamatricula date not null,
codigomatricula varchar(50) not null primary key,
rua varchar(50) not null,
bairro varchar(50) not null,
cidade varchar(50)
);

create table instrutor(
email varchar(50) not null,
nome varchar(50) not null,
rg int(20) not null primary key,
datanascimento date not null,
titulacao varchar(50) not null,
telefone varchar(15)
);

create table turma(
codigoturma varchar(50) not null primary key,
tipoatividade varchar(50) not null,
horarioaula time not null,
datainicial date not null,
datafinal date not null,
numeroalunos int(20) not null,
codigomatricula varchar(50) not null,
rg varchar(20) not null,
foreign key (codigomatricula) references aluno(codigomatricula)
);

create table matricula(
codigomatricula varchar(50) not null,
foreign key (codigomatricula) references aluno(codigomatricula),
codigoturma varchar(50) not null,
foreign key(codigoturma) references turma(codigoturma),
registroausencia varchar(50) not null,
datamatricula date not null 
);