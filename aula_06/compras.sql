create database compras;
create table cargo(
idcargo int auto_increment primary key,
sigla char(2) not null,
nome varchar(30) null unique
);

create table cliente(
idCliente int auto_increment primary key,
nome varchar(50),
endereco varchar(50),
cidade varchar(50),
estado char(2)
);

create table produto(
idProduto int auto_increment primary key,
descricao varchar(50),
preco decimal(5,2),
qtde int
);

create table compra(
idCompra int auto_increment primary key,
idCliente int, foreign key (idCliente) references cliente (idCliente),
idProduto int, foreign key (idProduto) references produto (idProduto)
);

insert into cargo (sigla,nome) values ('AI','Auxiliar de Informatica'),('PC','Programador de Computador'),('TI','Técnico de Informática');

alter table cliente add column sexo char(1); 

insert into cliente (idCliente,nome,endereco,estado,cidade,sexo) values
	(1, 'Jose de Oliveira','Av.Jatobã,34','SP','Jundiai','F'),
	(2, 'Maria da Silva','Av. Presidente,12','MG','Itatiba','F'),
	(3, 'Antonio Carlos','R. Florença,5','SP','Jundiai','M'),
	(4, 'Luisa de Souza','Av. Jatobá,45','MG','Jundiai','F'),
	(5, 'Carlos de Souza','Av. Jatobá,45','SP','Jundiai','M');
	
insert into produto (idProduto,descricao,preco,qtde) values 
	(1, 'Lápis', 1.50,20),
	(2, 'Borracha', 1.00,15),
	(3, 'Caneta', 1.75,35),
	(4, 'Compasso', 5.20,10),
	(5, 'Régua', 0.75,16),
	(6, 'Papel Sulfite', 10.50,5);
	
alter table compra add column dataCompra date;

alter table compra add column qtde int(10);
alter table compra add column valor decimal(5,2);

insert into compra (idcompra,idcliente,idproduto,datacompra,qtde,valor) values
	(1,1,1,'2010-12-01',2,1.5),
	(2,2,1,'2010-12-01',5,1.5),
	(3,1,3,'2011-01-01',13,1.75),
	(4,1,4,'2011-01-01',1,5.2),
	(5,3,2,'2011-03-01',7,1.0),
	(6,4,5,'2011-05-01',10,0.75),
	(7,2,6,'2011-06-01',2,10.50),
	(8,5,3,'2011-06-01',2,1.75);
	
update cliente set estado = 'SP' where cidade != 'SP';

select nome,estado from cliente;

update cliente set sexo = 'M' where nome = 'Jose de Oliveira';

select descricao,preco from produto;

delete from compra where idProduto = (select idProduto from produto where descricao = 'Papel Sulfite');
delete from produto where descricao = 'Papel Sulfite';

update produto set qtde = 15 where descricao = 'Lápis';

select lower(descricao) from produto limit 2;

select sum(valor * qtde) from compra where idproduto=1;

select avg(valor * qtde) from compra where idcliente=1;

select nome from cliente where cidade = 'Jundiai';

select idcliente, lower(nome) from cliente where nome like '%Carlos%';

select descricao, preco, qtde from produto where preco > 1 && qtde >= 10;

select * from cliente order by nome;

select cidade,count(nome) from cliente group by cidade desc;

select sum(preco), avg(preco) from produto;

select max(preco),min(preco) from produto order by preco asc limit 1;

select sum(valor) from compra where year(datacompra) = 2010;

select * from compra where year(datacompra) = 2011 order by year(datacompra) asc limit 1;

select nome from cliente where sexo = 'F';

select * from compra where day(datacompra) = 11 and day(datacompra) = 7;

select descricao,preco, preco * 1.10 from produto;

select idcliente, sum(qtde) from compra group by idcliente;

select preco * 0.9 from produto where qtde < 15;

select idproduto, day(datacompra) from compra;

select  sexo,count(sexo) from cliente group by sexo;

delete from compra where idcompra = 1000;

select descricao,power(qtde,2) from produto where qtde > 15 and qtde < 25;

select descricao, sqrt(qtde) from produto where descricao like 'C%';

select nome from cliente where endereco like 'Av. Jatobá%';

select nome, length(nome) from cliente;

select idcompra,valor,valor * 0.80 from compra where idcliente = 2;

select year(datacompra), count(year(datacompra)) from compra group by year(datacompra);

select idcompra, day(datacompra), monthname(datacompra), year(datacompra) from compra;

select idproduto, sum(valor*qtde) from compra where valor > 7 group by idproduto;

delete from compra where idcliente between 3 and 5;

drop table produto;

DROP DATABASE Compras;