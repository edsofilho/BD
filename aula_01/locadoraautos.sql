create database locadoraAutos
create table usuario(
nome char(50) not null,
email char(100)  not null,
telefone int(13) null,
idade int(2) null,
RG int(9) null,
rua char(50) null,
numero char(4) null,
bairro char(50) null,
cidade char(50) null,
CNH int(10) null primary key
);

create table carro(
chassi int(17) null primary key,
placa char(7) null,
ano int (4) null,
cor char(25) null,
codCategoria char(50) null,
foreign key(codCategoria) references categoria(codigoCategoria)
);

create table oficina(
nome char(50) null,
email char(100) null,
CNPJ int(14) null primary key,
rua char(50) null,
numero int(4) null,
bairro char(50) null,
cidade char(50) null,
telefone int(14) null
);

create table categoria(
precoDiaria float(10) null,
descricao varchar(150) null,
codigoCategoria char(50)null primary key
);

create table aloca(
dia date null,
hora char(5) null,
foreign key(CNH) references usuario(CNH),
foreign key(chassi) references carro(chassi)
)

create table manutençao(
valor float(20) not null,
dia date not null,
descricao char(100),
codigoManutencao char(50) not null primary key
foreign key(chassi) references carro(chassi),
foreign key(CNPJ) references oficina(CNPJ)
)