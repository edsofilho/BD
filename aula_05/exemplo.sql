create database empresa
create table funcionario(
idfuncionario int not null primary key,
nome varchar(50) null,
endereco varchar(100) null,
cidade varchar(50) null,
estado char(2),
email varchar(50) null unique,
datanascto date not null
);

alter table funcionario add salario decimal(7,2) null, add cargos varchar(2) null;

alter table funcionario add ativo bit;

insert into funcionario (idfuncionario, nome, endereco, cidade, estado, email,datanascto) values
(1,'José da Silva','Av. São Paulo,34','Itu','SP','zesilva@yahoo.com.br','1991-02-24');

insert into funcionario values (2,'João de Oliveira','Rua da Saúde,138','Jundiai','SP','jojo@hotmail.com','1988-01-11',750,'TI',1);

insert into funcionario values (3,'Ana Pimenta','Rua da Saúde,11','Jundiai','SP','pimentinha@hotmail.com','1987-01-01',750,'TI',0),
										 (4,'Mario Lopes','Rua Angelica,143','Jundiai','SP','mlopes@hotmail.com','1985-04-10',750,'TI',0);

insert into funcionario (idfuncionario, nome, endereco, cidade, estado, email, datanascto) values (5,'Carlos Dias','Av.Lapa,121', 'Itu','SP','carlao@gmail.com','1990-03-31'),
										 (6,'Ana Maria da Cunha','Av São Paulo,388','Itu','SP','aninhacunha@gmail.com','1988-04-12'),
										 (7,'Claudia Regina Martins','Rua Holanda,89','Campinas','SP','cregina@gmail.com','1988-12-04'),
										 (8,'Marcela Tatho','Rua Bélgica,43','Campinas','SP','marctatho@gmail.com.br','1987-11-09'),
										 (9,'Jorge Luis Rodrigues','Av. São Paulo,1989','São Paulo','SP','jorgeluis@yahoo.com.br','1990-05-05'),
										 (10,'Ana Paula Camargo','Rua Costa e Silva,33','Jundiai','SP','apcamargo@gmail.com','1991-06-30'),
										 (11,'Ivo Cunha','Av. Raio de Luz,100','Campinas','SP','ivo@bol.com.br','1987-04-11'),
										 (12,'Carlos Luis de Souza','Rua Nicolau Coelho,22','São Paulo','SP','cis@bol.com.br','1988-04-30');
										 
update funcionario set cidade = 'Valinhos' where cidade='Itu';

update funcionario set cargos = 'AI' where cidade = 'Valinhos';
update funcionario set salario = 1100 where cidade = 'Valinhos';

update funcionario set cargos = 'PC' where cidade = 'Campinas';
update funcionario set salario = 1700 where cidade = 'Campinas';

update funcionario set cargos = 'TI' where cidade = 'Jundiai';
update funcionario set salario = 750 where cidade = 'Jundiai';

select nome,cargos from funcionario;
select idfuncionario,email from funcionario where estado = 'SP';

delete from funcionario where idfuncionario = 5;

select cidade,estado from funcionario where cargos = 'PC';

/*Exercicios aritméticos*/
/*1*/select nome,salario *1.30 from funcionario;

/*2*/select nome,salario *0.80 from funcionario where cidade = 'Campinas';

/*3*/select nome,salario from funcionario where salario > 1500;

/*4*/select nome,cidade from funcionario where cidade != 'Valinhos';

/*5*/select idfuncionario,cidade from funcionario where cidade = 'Valinhos' | cidade = 'Campinas';

/*6*/select idfuncionario,cargos,salario from funcionario where cidade != 'São Paulo' and salario >= 1000;

/*7*/select nome from funcionario where cargos is null;

/*8*/select nome,salario from funcionario where salario between 500 and 1500;

/*9*/select nome,email from funcionario where email like '%hotmail%';

/*10*/select nome,email from funcionario where email like '%.br%';

/*11*/select nome,email from funcionario where email not like'%.com%';

/*12*/select nome,email from funcionario where nome like '__r%';

/*aula_4*/

/*1*/select nome, day(datanascto), month(datanascto), year(datanascto) from funcionario;

/*2*/select distinct monthname(datanascto) from funcionario order by month(datanascto);

/*3*/select idfuncionario,nome from funcionario where year(datanascto) = 1987;

/*4*/select nome, day(datanascto) from funcionario where month(datanascto) = 4 and year(datanascto) = 1988;

/*5*/select nome, datediff(curdate(),datanascto) /365 from funcionario;

/*6*/select idfuncionario,nome,year(datanascto) from funcionario where month(datanascto) between 3 and 5 and year(datanascto) = 1990;

/*aula 5*/
select nome,salario+PI() from funcionario;

select sqrt(day(datanascto)) from funcionario;

select log(month(datanascto)) from funcionario;

select nome,day(datanascto) from funcionario where power (day(datanascto),3) >= 1000;

select nome, round (salario* 1.15,0) from funcionario where salario >=  1000;

select abs(1500)-salario from funcionario;

select idfuncionario, datanascto, sqrt(idfuncionario) from funcionario where year(datanascto) < 1989 and month(datanascto) >= 4;

select nome,round(salario*0.35,1) from funcionario;

select log(idfuncionario) from funcionario;

select sqrt(idfuncionario) from funcionario;

select power(idfuncionario,2) from funcionario;

select abs(idfuncionario - 10) from funcionario order by idfuncionario desc;

/* aula 06*/

select upper(nome) from funcionario;

select length(monthname(datanascto)) from funcionario;

select replace(nome,' ','-') from funcionario;

select left(nome,3),right(nome,3) from funcionario;

select sqrt(length(nome)) from funcionario;

select distinct substring(cidade,3,5) from funcionario;

select replace(nome,' ','') from funcionario;

select ascii(idfuncionario) from funcionario where cidade = 'Campinas';

select ascii(nome) from funcionario where day(datanascto) > 20;

select rtrim(left(cidade,4)) from funcionario;

select ltrim(left(cidade,6)) from funcionario;

select distinct lower(cidade) from funcionario;

/*aula 07*/

select max(salario), min(salario) from funcionario;

select sum(salario) from funcionario where nome like'%cunha%';

select avg(salario) from funcionario where email like '%yahoo%';

select count(email) from funcionario where email like '%yahoo%';

select min(datanascto) from funcionario;

select max(datanascto) as "Maior_Nascimento" from funcionario;

select count(cidade) as "Quantidade_Valinhos" from funcionario where cidade = "Valinhos";

select sum(salario) from funcionario where cidade = "Campinas";

select avg(salario) from funcionario where cidade = "São Paulo";

select sum(salario) from funcionario where nome like'%Ana%';

select count(nome) from funcionario where nome like '%Luis%';

select min(salario), max(salario) from funcionario where endereco like '%Av. São Paulo%';

update funcionario set endereco = 'Av. São Paulo,388' where endereco = 'Av. São Paulo';

/*aula 08*/
select cargos, count(cargos)from funcionario group by cargos;

select cargos, count(cargos) from funcionario where not cargos is null group by cargos;

select cargos, avg(salario) as "Media_salario_Cargo" from funcionario group by cargos; 

select cargos, sum(salario) from funcionario group by cargos;

select cargos, sum(salario) from funcionario where estado = 'SP' group by cargos;

/*aula 09*/

select nome from funcionario limit 4;

select * from funcionario where cidade = 'Valinhos' limit 2;

select nome, datanascto from funcionario order by datanascto asc limit 1;

select cidade, count(cidade) from funcionario group by cidade limit 2;

select cargos, count(nome) from funcionario group by cargos limit 2;

select nome, email from funcionario limit 6;

select idfuncionario, salario from funcionario where salario is not null order by salario asc limit 1;

select nome, salario from funcionario order by salario desc limit 1;

select nome, endereco from funcionario limit 1;

select * from funcionario where cidade = 'São Paulo' limit 1;

select * from funcionario where year(datanascto) = 1988 limit 2;