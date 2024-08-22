create database teste;

create table beneficio (idbeneficio int auto_increment,
								nome varchar(50) not null, 
								primary key(idbeneficio));
								
create table instituicao(
idinstituicao int auto_increment,
nome varchar(50) not null,
contato varchar(50),
telefone varchar(15),
idbeneficio int,
primary key(idinstituicao),
foreign key (idbeneficio) references beneficio(idbeneficio)
);

insert into beneficio (nome) values ('Cursos Técnicos');

insert into instituicao(nome,contato,telefone,idbeneficio) values ('EtecVav', 'Helenice Antonio','11-4527-3093',1);

delete from beneficio where idbeneficio = 1;

create table transporte (
idtransporte int auto_increment,
empresa varchar(100) not null,
percentualDesconto decimal (5,2),
idbeneficio int,
primary key(idtransporte),
foreign key(idbeneficio) references beneficio(idbeneficio)
on delete cascade
);

insert into beneficio(nome) values ('Transporte em grupo até 12 pessoas');

insert into transporte (empresa,percentualdesconto,idbeneficio) values ('Van Vai-Volta',15,2);

delete from beneficio where idbeneficio = 2;

create table planodesaude (
idplanodesaude int auto_increment,
empresa varchar(100) not null,
telefone varchar(15),
idbeneficio int,
primary key(idplanodesaude),
foreign key(idbeneficio) references beneficio(idbeneficio) on delete set null
);

insert into beneficio (nome) values ('Saúde');

insert into planodesaude (empresa,telefone,idbeneficio) values ('Unimed','11-3416-2121',3);

delete from beneficio where idbeneficio = 3;