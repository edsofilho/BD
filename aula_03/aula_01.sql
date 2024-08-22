create database HotelDicionario;
 create table cliente(
 RG int(50) not null primary key,
 nome varchar(50) not null,
 rua varchar(60) not null,
 bairro varchar(30) not null,
 cidade varchar(30) not null,
 telefone varchar(50) not null,
 sexo booleano(2) not null
 );
 
 create table quarto(
 numero int(50) not null primary key,
 andar int(20) not null,
 RG int(50) not null,
 foreign key(RG) references cliente(RG),
 preco decimal(4,2) not null,
 descricao varchar(250) not null,
 tipo varchar(60) not null
 );
 
 create table quartoocupado(
 codigoocupacao int(50) not null primary key,
 numero int(50) not null,
 foreign key(numero) references quarto(numero),
 hora time not null,
 dataentrada date not null,
 datasaida date not null
 );
 
 create table quartoreservado(
 codigoreservado int(50) not null primary key,
 numero int(50) not null,
 foreign key(numero) references quarto(numero),
 qtdedias int(6) not null,
 datareserva date not null
 );
 
 create table servico(
 codigoservico int(50) not null primary key,
 descricao varchar(250) not null,
 tipo varchar(100) not null,
 valor decimal(4,2) not null
 );
 
 create table pagamento(
 codigoocupacao int(50) not null,
 foreign key(codigoocupacao) references quartoocupado(codigoocupacao),
 codigoservico int(50) not null,
 foreign key(codigoservico) references servico(codigoservico),
 valortotal decimal(4,2) not null
 );