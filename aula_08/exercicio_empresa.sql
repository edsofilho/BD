create database empresa2;

create table fornecedores(
codfor int auto_increment primary key,
empresa varchar(40),
contato varchar(30),
cargo varchar (30),
endereco varchar (60),
cidade varchar(15),
cep varchar(10),
pais varchar(15)
);

create table categorias (
codcategoria int auto_increment primary key,
descricao varchar(50)
);

create table cliente (
codclie int auto_increment primary key,
nome varchar(40),
contato varchar(30),
cargo varchar(30),
endereco varchar(60),
cidade varchar(15),
regiao varchar(15),
cep varchar(10),
pais varchar(15),
telefone varchar(24),
celular varchar(16)
);

create table funcionario (
codfun int auto_increment primary key,
sobrenome varchar(20),
nome varchar(10),
cargo varchar(30),
datanasc date,
endereco varchar(60),
cidade varchar(15),
cep varchar(10),
pais varchar(15),
fone varchar(24),
salario decimal(5,2)
);

create table produto (
codproduto int auto_increment primary key,
descr varchar(40),
codfor int,
foreign key(codfor) references fornecedores (codfor),
codcategoria int,
foreign key(codcategoria) references categorias(codcategoria),
preco decimal(5,2),
unidades char,
descontuado char
);

create table pedidos (
numped int primary key,
codclie int,
foreign key(codclie) references cliente(codclie),
codfun int,
foreign key(codfun) references funcionario(codfun),
dataped date,
dataentrega date,
frete decimal (5,2)
);

create table detalhesped(
numped int,
foreign key(numped) references pedidos(numped),
codproduto int,
foreign key(codproduto) references produto(codproduto),
preco decimal(5,2),
qtde int,
desconto decimal(5,2),
primary key(numped,codproduto)
);


/*Aula 12*/

select descr, preco from produto order by preco desc limit 1;

select numped, dataped from pedidos order by frete asc limit 5;

select nome, cargo from cliente where pais = 'reino unido' union select nome, cargo from funcionario where pais = 'reino unido';

select nome, sobrenome, cargo, salario from funcionario order by salario desc limit 3;

select nome, sobrenome from funcionario order by datanasc asc limit 1;

select * from pedidos order by dataped desc limit 5;

select * from pedidos where year(dataped) = 1996 order by dataped desc limit 6;

select nome, cargo from funcionario where pais = 'eua' union select contato, cargo from fornecedores where pais = 'eua';
