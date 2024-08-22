create database lojapecas

create table cliente(
CPF int(15) not null primary key,
nome varchar(200) not null,
Rua varchar(50) not null,
bairro varchar(50) not null,
cidade varchar(50) not null,
RG int(20) not null
);

create table pedido(
notafiscal int(15) not null primary key,
precototal decimal(5,2) not null,
datapedido date not null,
CPF integer (15) not null,
foreign key(CPF) references cliente(CPF)
);

create table mercadoria(
codigo int(20) not null primary key,
descricao varchar(50) not null,
preco decimal(5,2) not null,
quantidadeestoque int(5)
);

create table itenspedidos(
notafiscal int(15) not null,
codigo int(20) not null,
foreign key(notafiscal) references pedido(notafiscal),
foreign key(codigo) references mercadoria(codigo),
quantidade int(5),
codigoitem int(10) not null primary key
);

create table fornecedores(
codigointerno int(15) not null primary key,
nome varchar(200) not null,
rua varchar(50) not null,
bairro varchar(50) not null,
cidade varchar(50) not null
);

create table mercadoriasfornecidas(
codigo int(20) not null,
codigointerno int(15) not null,
foreign key(codigo) references mercadoria(codigo),
foreign key(codigointerno) references fornecedores (codigointerno)
);

create table telefonefornecedores(
codtelefone int(10) not null primary key,
codigointerno int(15) not null,
foreign key(codigointerno) references fornecedores(codigointerno),
telefonefornecedores varchar(30)  not null
);

create table internacionais(
codigointerno int(15) not null primary key,
foreign key(codigointerno) references fornecedores(codigointerno),
transporte varchar(40)not null ,
pais varchar(30) not null,
moeda varchar(30) not null
);

create table nacionais(
codigointerno int(15) not null,
foreign key(codigointerno) references fornecedores(codigointerno),
cidade varchar(50),
CNPJ int(15) not null primary key
);

create table emailcliente(
codemail int(10) not null primary key,
email varchar(30) not null,
CPF int(15) not null,
foreign key(CPF) references cliente(CPF)
);



