--2 - Crear una tabla (create table - sp_tables - sp_columns - drop table)
--problema 1

if object_id('agenda') is not null
  drop table agenda;

create table /agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
);

create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
);

exec sp_tables @table_owner='dbo'

exec sp_columns agenda;

drop table agenda;

--problema 2
if object_id('libros') is not null
  drop table libros;

exec sp_tables @table_owner='dbo';

create table libros(
	titulo varchar(20), 
	autor varchar(30),
	editorial varchar(15)
);

exec sp_tables @table_owner='dbo';

exec sp_columns libros;

drop table libros;

--3 - Insertar y recuperar registros de una tabla (insert into - select)
--problema 1
if object_id('agenda') is not null
  drop table agenda;

create table agenda(
	apellido varchar(30), 
	nombre varchar(20), 
	domicilio varchar(30),
	telefono varchar(11)
);

exec sp_tables @table_owner='dbo';

exec sp_columns agenda;

 insert into agenda (apellido, nombre, domicilio, telefono) values
	('Moreno','Alberto','Colon 123','4234567'),
	('Torres','Juan','Avellaneda 135','4458787');

 select * from agenda;

 drop table agenda;

 --problema 2
  if object_id('libros') is not null
  drop table libros;

create table libros(
	titulo varchar(20), 
	autor varchar(30),
	editorial varchar(15)
);

exec sp_tables @table_owner='dbo';

exec sp_columns libros;

 insert into libros (titulo,autor,editorial) values
	('El aleph','Borges','Planeta'),
	('Martin Fierro','Jose Hernandez','Emece'),
	('Aprenda PHP','Mario Molina','Emece');

select *from libros;

--4 - Tipos de datos básicos
--problema 1
if object_id('peliculas')is not null
  drop table peliculas;


create table peliculas(
  nombre varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
);

exec sp_columns peliculas;


 insert into peliculas (nombre, actor, duracion, cantidad) values
	('Mision imposible','Tom Cruise',128,3),
	('Mision imposible 2','Tom Cruise',130,2),
	('Mujer bonita','Julia Roberts',118,3),
	('Elsa y Fred','China Zorrilla',110,2);

select *from peliculas;

--problema 2

 if object_id('empleados') is not null
  drop table empleados;


 create table empleados(
  nombre varchar(20),
  documento varchar(8),
  sexo varchar(1),
  domicilio varchar(30),
  sueldobasico float
 );

exec sp_columns empleados;

 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico) values
	('Juan Perez','22333444','m','Sarmiento 123',500),
	('Ana Acosta','24555666','f','Colon 134',650),
	('Bartolome Barrios','27888999','m','Urquiza 479',800);

select *from empleados;

--5 - Recuperar algunos campos (select)
--problema 1
 if object_id('peliculas') is not null
  drop table peliculas;


 create table peliculas(
  titulo varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 );

 
exec sp_columns peliculas;

insert into peliculas (titulo, actor, duracion, cantidad) values
	('Mision imposible','Tom Cruise',180,3),
	('Mision imposible 2','Tom Cruise',190,2),
	('Mujer bonita','Julia Roberts',118,3),
	('Elsa y Fred','China Zorrilla',110,2);

select titulo, actor from peliculas;

select titulo, duracion from peliculas;

select titulo, cantidad from peliculas;

--problema 2
if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  nombre varchar(20),
  documento varchar(8) primary key, 
  sexo varchar(1),
  domicilio varchar(30),
  sueldo float
);

 exec sp_columns empleados;

 insert into empleados (nombre, documento, sexo, domicilio, sueldo) values
	('Juan Juarez','22333444','m','Sarmiento 123',500),
	('Ana Acosta','27888999','f','Colon 134',700),
	('Carlos Caseres','31222333','m','Urquiza 479',850);

select *from empleados;

select nombre, documento, domicilio from empleados;

select documento, sexo, sueldo from empleados;

--6 - Recuperar algunos registros (where)
--problema 1
if object_id('agenda') is not null
  drop table agenda;

create table agenda(
	apellido varchar(30), 
	nombre varchar(20), 
	domicilio varchar(30),
	telefono varchar(11)
);

exec sp_columns agenda;

insert into agenda values
 ('Acosta', 'Ana', 'Colon 123', '4234567'),
 ('Bustamante', 'Betina', 'Avellaneda 135', '4458787'),
 ('Lopez', 'Hector', 'Salta 545', '4887788'), 
 ('Lopez', 'Luis', 'Urquiza 333', '4545454'),
 ('Lopez', 'Marisa', 'Urquiza 333', '4545454');

select *from agenda;

select *from agenda
	where nombre = 'marisa';

select nombre, domicilio from agenda
	where apellido = 'lopez';

select nombre, domicilio from agenda
	where telefono = '4545454';

--problema 2
if object_id('libros') is not null
  drop table libros;

create table libros (
  titulo varchar(20),
  autor varchar(30),
  editorial varchar(15)
);


exec sp_columns libros;

insert into libros values
 ('El aleph','Borges','Emece'),
 ('Martin Fierro','Jose Hernandez','Emece'),
 ('Martin Fierro','Jose Hernandez','Planeta'),
 ('Aprenda PHP','Mario Molina','Siglo XXI');

select *from libros
	where autor = 'borges';

select *from libros
	where editorial = 'Emece';

select editorial from libros
	where titulo = 'Martin Fierro';

--7 - Operadores relacionales
--problema 1
 if object_id('articulos') is not null
  drop table articulos;

 create table articulos(
  codigo integer,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad integer
);

exec sp_columns articulos;


 insert into articulos (codigo, nombre, descripcion, precio,cantidad) values
	 (1,'impresora','Epson Stylus C45',400.80,20),
	 (2,'impresora','Epson Stylus C85',500,30),
	 (3,'monitor','Samsung 14',800,10),
	 (4,'teclado','ingles Biswal',100,50),
	 (5,'teclado','español Biswal',90,50);

select *from articulos
	where nombre = 'impresora';

select *from articulos
	where precio >= 400;

select codigo, nombre from articulos
	where cantidad < 30;

select nombre, descripcion from articulos
	where precio <> 100;

--problema 2
 if object_id('peliculas') is not null
  drop table peliculas;

create table peliculas(
  titulo varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
);


 insert into peliculas (titulo, actor, duracion, cantidad) values
	('Mision imposible','Tom Cruise',120,3),
	('Mision imposible 2','Tom Cruise',180,4),
	('Mujer bonita','Julia R.',90,1),
	('Elsa y Fred','China Zorrilla',80,2);

select *from peliculas
	where duracion <= 90;

select titulo from peliculas
	where actor <> 'tom cruise';

select titulo, actor, cantidad from peliculas
	where cantidad > 2;

--8 - Borrar registros (delete)
--problema 1

 if object_id('agenda') is not null
  drop table agenda;

 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

 insert into agenda values
 ('Alvarez','Alberto','Colon 123','4234567'),
 ('Juarez','Juan','Avellaneda 135','4458787'),
 ('Lopez','Maria','Urquiza 333','4545454'),
 ('Lopez','Jose','Urquiza 333','4545454'),
 ('Salas','Susana','Gral. Paz 1234','4123456');

delete agenda
	where nombre = 'juan';

delete agenda
	where telefono = '4545454';

select *from agenda;

delete agenda;

select *from agenda;

--problema 2

if object_id('articulos') is not null
  drop table articulos;

 create table articulos(
  codigo integer,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad integer
 );

exec sp_columns articulos;

 insert into articulos (codigo, nombre, descripcion, precio,cantidad) values
	(1,'impresora','Epson Stylus C45',400.80,20),
	(2,'impresora','Epson Stylus C85',500,30),
	(3,'monitor','Samsung 14',800,10),
	(4,'teclado','ingles Biswal',100,50),
	(5,'teclado','español Biswal',90,50);

delete from articulos
  where precio >= 500;

delete from articulos
  where nombre = 'impresora';

delete from articulos
  where codigo <> 4;

select *from articulos;


--9 - Actualizar registros (update)
--problema 1
if object_id('agenda') is not null
  drop table agenda;

 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

 insert into agenda (apellido,nombre,domicilio,telefono) values
	('Acosta','Alberto','Colon 123','4234567'),
	('Juarez','Juan','Avellaneda 135','4458787'),
	('Lopez','Maria','Urquiza 333','4545454'),
	('Lopez','Jose','Urquiza 333','4545454'),
	('Suarez','Susana','Gral. Paz 1234','4123456');

update agenda set nombre = 'Juan Jose'
	where nombre = 'juan';

update agenda set telefono = '4445566' 
	where telefono = '4545454';

update agenda set nombre = 'Juan Jose'
	where nombre = 'juan';

select *from agenda;

--problema 2

if object_id('libros') is not null
  drop table libros;

 create table libros (
  titulo varchar(30),
  autor varchar(20),
  editorial varchar(15),
  precio float
 );

 insert into libros (titulo, autor, editorial, precio) values
	('El aleph','Borges','Emece',25.00),
	('Martin Fierro','Jose Hernandez','Planeta',35.50),
	('Aprenda PHP','Mario Molina','Emece',45.50),
	('Cervantes y el quijote','Borges','Emece',25),
	('Matematica estas ahi','Paenza','Siglo XXI',15);

 select * from libros;

 update libros set autor='Adrian Paenza'
	where autor='Paenza';

 update libros set autor='Adrian Paenza'
	where autor='Paenza';

update libros set precio=27
	where autor='Mario Molina';

 update libros set editorial='Emece S.A.'
  where editorial='Emece';

select *from libros;

--11 - Valores null (is null)
--problema 1

if object_id('medicamentos') is not null
   drop table medicamentos;

 create table medicamentos(
  codigo integer not null,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer not null
 );


exec sp_columns medicamentos;

 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values
	(1,'Sertal gotas',null,null,100),
	(2,'Sertal compuesto',null,8.90,150),
	(3,'Buscapina','Roche',null,200);

 select * from medicamentos;

insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values
	(null,'Amoxidal jarabe','Bayer',25,120);

insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values
	(4,'Bayaspirina','',0,150),
	(0,'','Bayer',15.60,0);

select *from medicamentos;


select *from medicamentos
	where laboratorio is null;
select *from medicamentos 
	where laboratorio = '';

select *from medicamentos
	where precio is null;
select *from medicamentos 
	where precio = '';

select *from medicamentos
	where laboratorio is not null;
select *from medicamentos 
	where laboratorio <> '';

select *from medicamentos
	where precio is not null;
select *from medicamentos 
	where precio <> 0;

--problema 2
if object_id('peliculas') is not null
  drop table peliculas;

 create table peliculas(
  codigo int not null,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion int
 );

 exec sp_columns peliculas;


 insert into peliculas (codigo,titulo,actor,duracion) values
	(1,'Mision imposible','Tom Cruise',120),
	(2,'Harry Potter y la piedra filosofal',null,180),
	(3,'Harry Potter y la camara secreta','Daniel R.',null),
	(0,'Mision imposible 2','',150),
	(4,'','L. Di Caprio',220),
	(5,'Mujer bonita','R. Gere-J. Roberts',0);

 select * from peliculas;

 insert into peliculas (codigo,titulo,actor,duracion)
	values(null,'Mujer bonita','R. Gere-J. Roberts',190);

select *from peliculas 
	where actor is null;

select *from peliculas
	where actor = '';
 
update peliculas set duracion = 120
	where duracion is null;

update peliculas set actor = 'desconocido'
	where actor = '';

select *from peliculas;

delete peliculas
	where titulo = '';

--12 - Clave primaria

if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int primary key,
  titulo varchar(40) not null,
  autor varchar(20),
  editorial varchar(15),
 );

 insert into libros (codigo,titulo,autor,editorial) values
	 (1,'El aleph','Borges','Emece'),
	 (2,'Martin Fierro','Jose Hernandez','Planeta'),
	 (3,'Aprenda PHP','Mario Molina','Nuevo Siglo');

insert into libros (codigo,titulo,autor,editorial) values
	 (1,'El aleph','Borges','Emece')

insert into libros (codigo,titulo,autor,editorial) values
	 (null,'El aleph','Borges','Emece')

update libros set codigo = 1
	where titulo = 'martin fierro';

--problema 2

 if object_id('alumnos') is not null
  drop table alumnos;

 create table alumnos(
  legajo varchar(4) primary key,
  documento varchar(8) primary key,
  nombre varchar(30),
  domicilio varchar(30),
 );

 create table alumnos(
  legajo varchar(4) not null,
  documento varchar(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );

 exec sp_columns alumnos;

 insert into alumnos (legajo,documento,nombre,domicilio) values
 ('A233','22345345','Perez Mariana','Colon 234'),
 ('A567','23545345','Morales Marcos','Avellaneda 348');

 insert into alumnos (legajo,documento,nombre,domicilio) values
 ('A233','22345345','Perez Mariana','Colon 234');

 insert into alumnos (legajo,documento,nombre,domicilio) values
 ('A233','null','Perez Mariana','Colon 234');

--13 - Campo con atributo Identity
--problema 1
if object_id('medicamentos') is not null
  drop table medicamentos;

 create table medicamentos(
  codigo int identity,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
);

 exec sp_columns medicamentos;

 insert into medicamentos (nombre, laboratorio,precio,cantidad) values
	('Sertal','Roche',5.2,100),
	('Buscapina','Roche',4.10,200),
	('Amoxidal 500','Bayer',15.60,100);

 select * from medicamentos;

 insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values
	(2,'Sertal','Roche',5.2,100);

update medicamentos set codigo = 9
	where codigo = 1;

delete medicamentos
	where codigo = 3;

 insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Amoxilina 500','Bayer',15.60,100);

 select * from medicamentos;

--problema 2

if object_id('peliculas') is not null
  drop table peliculas;


 create table peliculas(
  codigo int identity,
  titulo varchar(40),
  actor varchar(20),
  duracion int,
  primary key(codigo)
 );

 exec sp_columns peliculas;

insert into peliculas (titulo,actor,duracion) values
	('Mision imposible','Tom Cruise',120),
	('Harry Potter y la piedra filosofal','Daniel R.',180),
	('Harry Potter y la camara secreta','Daniel R.',190),
	('Mision imposible 2','Tom Cruise',120),
	('La vida es bella','zzz',220);

 select * from peliculas;

update peliculas set codigo = 10
	where codigo = 1; 

delete peliculas	
	where titulo = 'la vida es bella';

insert into peliculas values
('Los grandes', 'Clavo man', 200);

 select * from peliculas;

 --14 - Otras características del atributo Identity
 --problema 1
 if object_id('medicamentos') is not null
  drop table medicamentos;

 create table medicamentos(
  codigo integer identity(10,1),
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
 );

 insert into medicamentos (nombre, laboratorio,precio,cantidad) values
	('Sertal','Roche',5.2,100),
	('Buscapina','Roche',4.10,200),
	('Amoxidal 500','Bayer',15.60,100);

select *from medicamentos;

 insert into medicamentos (codigo, nombre, laboratorio, precio, cantidad)
	values (5,'Sertal','Roche',5.2,100);

set identity_insert medicamentos on;

insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Amoxilina 500','Bayer',15.60,100);

insert into medicamentos (codigo, nombre, laboratorio, precio, cantidad)
	values (2,'Sertal','Roche',5.2,100);

select ident_seed('medicamentos');

select ident_incr('medicamentos');

--problema 2
 if object_id('peliculas') is not null
  drop table peliculas;

 create table peliculas(
  codigo int identity (50,3),
  titulo varchar(40),
  actor varchar(20),
  duracion int
 );

 insert into peliculas (titulo,actor,duracion) values
	('Mision imposible','Tom Cruise',120),
	('Harry Potter y la piedra filosofal','Daniel R.',180),
	('Harry Potter y la camara secreta','Daniel R.',190);

 select * from peliculas;

 set identity_insert peliculas on;

 insert into peliculas (codigo,titulo,actor,duracion)
	values(20,'Mision imposible 2','Tom Cruise',120);

 insert into peliculas (codigo, titulo,actor,duracion)
	values(80,'La vida es bella','zzz',220);

 select ident_seed('peliculas');

 select ident_incr('peliculas');

 insert into peliculas
	values('Elsa y Fred','China Zorrilla',90);

 set identity_insert peliculas off; 

 insert into peliculas
	values('Elsa y Fred','China Zorrilla',90);

 select * from peliculas;

 --truncate table
 --problema 1
 if object_id('alumnos') is not null
  drop table alumnos;

 create table alumnos(
  legajo int identity,
  documento varchar(8),
  nombre varchar(30),
  domicilio varchar(30)
 );


 insert into alumnos (documento,nombre,domicilio) values
	('22345345','Perez Mariana','Colon 234'),
	('23545345','Morales Marcos','Avellaneda 348'),
	('24356345','Gonzalez Analia','Caseros 444'),
	('25666777','Torres Ramiro','Dinamarca 209');

delete alumnos;

 insert into alumnos (documento,nombre,domicilio) values
	('22345345','Perez Mariana','Colon 234'),
	('23545345','Morales Marcos','Avellaneda 348'),
	('24356345','Gonzalez Analia','Caseros 444'),
	('25666777','Torres Ramiro','Dinamarca 209');

 select * from alumnos;

truncate table alumnos;

 insert into alumnos (documento,nombre,domicilio) values
	('22345345','Perez Mariana','Colon 234'),
	('23545345','Morales Marcos','Avellaneda 348'),
	('24356345','Gonzalez Analia','Caseros 444'),
	('25666777','Torres Ramiro','Dinamarca 209');

 select * from alumnos;

 --problema 2

if object_id('articulos') is not null
  drop table articulos;


 create table articulos(
  codigo integer identity,
  nombre varchar(20),
  descripcion varchar(30),
  precio float
);


 insert into articulos (nombre, descripcion, precio) values 
	('impresora','Epson Stylus C45',400.80),
	('impresora','Epson Stylus C85',500);

truncate table articulos;

 insert into articulos (nombre, descripcion, precio) values
	('monitor','Samsung 14',800),
	('teclado','ingles Biswal',100),
	('teclado','español Biswal',90);

select * from articulos;

delete articulos;

 insert into articulos (nombre, descripcion, precio) values
	 ('monitor','Samsung 14',800),
	 ('teclado','ingles Biswal',100),
	 ('teclado','español Biswal',90);

 select * from articulos;

 --17 - Tipo de dato (texto)
 --problema 1
 if object_id('autos') is not null
  drop table autos;

 create table autos(
  patente char(6) primary key,
  marca varchar(20),
  modelo char(4),
  precio float,
 );

 insert into autos values
	('ACD123','Fiat 128','1970',15000),
	('ACG234','Renault 11','1990',40000),
	('BCD333','Peugeot 505','1990',80000),
	('GCD123','Renault Clio','1990',70000),
	('BCC333','Renault Megane','1998',95000),
	('BVF543','Fiat 128','1975',20000);


select * from autos
	where modelo = '1990';

--problema 2

if object_id('clientes') is not null
  drop table clientes;

 create table clientes(
  documento char(8),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar (11)
);

insert into clientes values
	('2233344','Perez','Juan','Sarmiento 980','4342345'),
	('2433344','Garcia','Luis','Avellaneda 1454','4558877'),
	('2533344','Juarez','Ana','Urquiza 444','4789900'),
	('2333344','Perez','Ana','Colon 234', null);

select * from clientes
	where apellido='Perez';

--18 - Tipo de dato (numérico)
--problema 1
if object_id('cuentas') is not null
  drop table cuentas;

create table cuentas(
	numero int primary key,
	documento char(8) not null,
	nombre varchar(30),
	saldo money
);

insert into cuentas(numero,documento,nombre,saldo) values
	('1234','25666777','Pedro Perez',500000.60),
	('2234','27888999','Juan Lopez',-250000),
	('3344','27888999','Juan Lopez',4000.50),
	('3346','32111222','Susana Molina',1000);

select *from cuentas
	where saldo > 4000;

select numero from cuentas
	where nombre = 'juan lopez';

select *from cuentas	
	where saldo < 0;

select * from cuentas
	where numero >= 3000;

--PROBLEMA 2

 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  nombre varchar(30),
  documento char(8),
  sexo char(1),
  domicilio varchar(30),
  sueldobasico decimal(7,2),
  cantidadhijos tinyint
 );

 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos) Values
	('Juan Perez','22333444','m','Sarmiento 123',500,2),
	('Ana Acosta','24555666','f','Colon 134',850,0),
	('Bartolome Barrios','27888999','m','Urquiza 479',10000.80,4);

insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Susana Molina','29000555','f','Salta 876',800.888,3);

insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
	values ('Juan Perez','38098565','M','Palo 784',7888778.22,50);

select *from empleados
	where sueldobasico <= 900;

select nombre from empleados
	where cantidadhijos > 0;

--19 - Tipo de dato (fecha y hora)
if object_id('alumnos') is not null
  drop table alumnos;


 create table alumnos(
  apellido varchar(30),
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso datetime,
  fechanacimiento datetime
);


set dateformat 'dmy';

insert into alumnos values 
	('Gonzalez','Ana','22222222','Colon 123','10-08-1990','15/02/1972'),
	('Juarez','Bernardo','25555555','Sucre 456','03-03-1991','15/02/1972'),
	('Perez','Laura','26666666','Bulnes 345','03-03-91',null);

insert into alumnos value
	('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);

select *from alumnos
	where fechaingreso < '1-1-91';

 select *from alumnos
	where fechanacimiento is null;

insert into alumnos
	values('Rosas','Romina','28888888','Avellaneda 487','03-15-1990',null);

set dateformat 'mdy';

insert into alumnos
	values('Rosas','Romina','28888888','Avellaneda 487','03-15-1990',null);

--20 - Ingresar algunos campos (insert into)
 if object_id('cuentas') is not null
  drop table cuentas;

 create table cuentas(
  numero int identity,
  documento char(8) not null,
  nombre varchar(30),
  saldo money
);

 insert into cuentas
  values (1,'25666777','Juan Perez',2500.50);

 insert into cuentas
  values ('25666777','Juan Perez',2500.50);

insert into cuentas (documento, nombre, saldo)
  values ('25666777','Juan Perez');


insert into cuentas (numero,documento,nombre,saldo)
  values (5,'28999777','Luis Lopez',34000);

insert into cuentas (documento, nombre, saldo)
  values ('25661234','Pedi cure', 15475, 457);

insert into cuentas (nombre, saldo)
  values ('Pedrosa', 12345);

 select * from libros;

--21 - Valores por defecto (default)
--problema 1
if object_id('visitantes') is not null
  drop table visitantes;

 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
);

 exec sp_columns visitantes;

insert into visitantes (nombre, domicilio, montocompra)
	values ('Susana Molina','Colon 123',59.80);

insert into visitantes (nombre, edad, ciudad, mail)
	values ('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com');
 
select * from visitantes;

insert into visitantes 
	values('David', 20, 'M', 'Javiela 82', default, '8297925856', default, null);

insert into visitantes default values;

--problema 2

 if object_id('prestamos') is not null
  drop table prestamos;

 create table prestamos(
  titulo varchar(40) not null,
  documento char(8) not null,
  fechaprestamo datetime not null,
  fechadevolucion datetime,
  devuelto char(1) default 'n'
 );

insert into prestamos (titulo,documento,fechaprestamo,fechadevolucion) values
	 ('Manual de 1 grado','23456789','2006-12-15','2006-12-18'),
	 ('El aleph','22543987','2006-12-16','2006-08-19');

insert into prestamos (titulo,documento,fechaprestamo)
  values ('Alicia en el pais de las maravillas','23456789','2006-12-16');

insert into prestamos (titulo,documento,fechaprestamo,devuelto)
  values ('Manual de geografia 5 grado','25555666','2006-12-18','s');

select * from prestamos;

insert into prestamos 
	values ('Julian en el bosque','123456','2006-12-15','2006-12-18',default);

insert into prestamos default values;

--22 - Columnas calculadas (operadores aritméticos y de concatenación)
 if object_id ('articulos') is not null
  drop table articulos;

 create table articulos(
  codigo int identity primary key,
  nombre varchar(20),
  descripcion varchar(30),
  precio smallmoney,
  cantidad tinyint default 0,
 );

 insert into articulos (nombre, descripcion, precio,cantidad) values
	('impresora','Epson Stylus C45',400.80,20),
	('impresora','Epson Stylus C85',500, default),
	('monitor','Samsung 14',800, default),
	('teclado','ingles Biswal',100,50);

update articulos set precio *= 1.15;

select * from articulos;

select nombre + ' ,' + descripcion AS 'NOMBRE Y DESCRIPCION' from articulos;

update articulos set cantidad -= 5
	where codigo = 4;

---23 - Alias
if object_id ('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity primary key,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad tinyint default 0,
 );

 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25);

 insert into libros (titulo,autor,editorial,precio,cantidad) values
	 ('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100),
	 ('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

select codigo, titulo, autor, editorial, precio, cantidad, precio * cantidad AS 'MONTO TOTAL'from libros

select titulo, autor, precio, precio * 0.10 AS DESCUENTO, precio * 0.90 AS 'PRECIO FINAL' from libros
	where editorial = 'emece';

select titulo+ ' ,'+ autor AS 'TITULO Y AUTOR' from libros;

--27 - Funciones para el uso de fechas y horas
if object_id ('empleados') is not null
  drop table empleados;

 create table empleados(
  nombre varchar(30) not null,
  apellido varchar(20) not null,
  documento char(8) primary key,
  fechanacimiento datetime,
  fechaingreso datetime,
  sueldo decimal(6,2)
);

insert into empleados values
	('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50),
	('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309),
	('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68),
	('Gabriela','Garcia','30000000','1985/10/25','2000/12/22',300.25),
	('Luis','Lopez','31111111','1987/02/10','2000/08/21',350.98);

select nombre+ ' ' +upper(apellido), 'DNI Nº '+documento AS DOCUMENTO, stuff(sueldo, 1, 0, '$ ') from empleados; 

select documento, stuff(ceiling(sueldo), 1, 0, '$ ') from empleados;

select nombre, apellido from empleados
	where month(fechanacimiento) = 10;

select nombre, apellido from empleados
	where year(fechanacimiento) = 1987;

----28 - Ordenar registros (order by)
if object_id('visitas') is not null
  drop table visitas;

create table visitas (
  numero int identity primary key,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fecha datetime
);

 insert into visitas (nombre,mail,pais,fecha) values
	('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10'),
	('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30'),
	('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45'),
	('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15'),
	('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45'),
	('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20'),
	('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

select *from visitas
	order by fecha desc;

select nombre, pais, datename(month, fecha) AS MES from visitas
	order by pais asc, MES desc;

select pais, datename(month, fecha) AS MES, datename(day, fecha) AS DIA , datename(hour, fecha) AS Hora from visitas
	order by MES, DIA, Hora;

select mail, pais from visitas
	where datename(month, fecha) = 'october'
	order by pais;

--29 - Operadores lógicos ( and - or - not)
if object_id('medicamentos') is not null
  drop table medicamentos;

 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
);

 insert into medicamentos values
	('Sertal','Roche',5.2,100),
	('Buscapina','Roche',4.10,200),
	('Amoxidal 500','Bayer',15.60,100),
	('Paracetamol 500','Bago',1.90,200),
	('Bayaspirina','Bayer',2.10,150),
	('Amoxidal jarabe','Bayer',5.10,250); 

select codigo, nombre from medicamentos	
	where (laboratorio = 'roche') and (precio < 5);

select * from medicamentos
	where (laboratorio = 'Roche') or (precio<5);

select *from medicamentos
	where not (laboratorio = 'bayer') and (cantidad = 100);

 select * from medicamentos
	where laboratorio='Bayer' and not cantidad=100;

delete medicamentos
	where laboratorio = 'bayer' and precio > 10;

update medicamentos set cantidad = 200
	where laboratorio = 'roche' and precio > 5;

delete medicamentos
	where laboratorio = 'bayer' or precio < 3;

--problema 2
if object_id('peliculas') is not null
  drop table peliculas;

create table peliculas(
  codigo int identity,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion tinyint,
  primary key (codigo)
 );

 insert into peliculas values
	('Mision imposible','Tom Cruise',120),
	('Harry Potter y la piedra filosofal','Daniel R.',180),
	('Harry Potter y la camara secreta','Daniel R.',190),
	('Mision imposible 2','Tom Cruise',120),
	('Mujer bonita','Richard Gere',120),
	('Tootsie','D. Hoffman',90),
	('Un oso rojo','Julio Chavez',100),
	('Elsa y Fred','China Zorrilla',110);

select *from peliculas
	where actor in ('tom cruise', 'richard gere');

select *from peliculas
	where actor = 'tom cruise' and duracion < 100;

update peliculas set duracion = 200
	where actor = 'daniel r.' and duracion = 180; 

delete peliculas
	where not actor = 'tom cruis' and duracion <= 100; 

--30 - Otros operadores relacionales (is null)

if object_id('peliculas') is not null
  drop table peliculas;

 create table peliculas(
  codigo int identity,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion tinyint,
  primary key (codigo)
 );

insert into peliculas values
	('Mision imposible','Tom Cruise',120),
	('Harry Potter y la piedra filosofal','Daniel R.',null),
	('Harry Potter y la camara secreta','Daniel R.',190),
	('Mision imposible 2','Tom Cruise',120),
	('Mujer bonita',null,120),
	('Tootsie','D. Hoffman',90);

insert into peliculas (titulo)
  values('Un oso rojo');

select *from peliculas
	where actor is null;

update peliculas set duracion = 0
	where duracion is null;

delete peliculas 
	where actor is null and duracion = 0


---31 - Otros operadores relacionales (between)

if object_id('visitas') is not null
  drop table visitas;

 create table visitas (
  numero int identity,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fechayhora datetime,
  primary key(numero)
);

 insert into visitas (nombre,mail,pais,fechayhora) values
	('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10'),
	('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30'),
	('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45'),
	('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15'),
	('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45'),
	('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20'),
	('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

 insert into visitas (nombre,mail,pais)
  values ('Federico1','federicogarcia@xaxamail.com','Argentina');

select *from visitas
	where fechayhora between '2006-09-12' and '2006-10-11';

select *from visitas
	where numero between 2 and 5;

--problema 2

if object_id('autos') is not null
  drop table autos;

 create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio decimal(8,2),
  primary key(patente)
 );

 insert into autos values
	('ACD123','Fiat 128','1970',15000),
	('ACG234','Renault 11','1980',40000),
	('BCD333','Peugeot 505','1990',80000),
	('GCD123','Renault Clio','1995',70000),
	('BCC333','Renault Megane','1998',95000),
	('BVF543','Fiat 128','1975',20000);

select *from autos
	where modelo between 1970 and 1990
	order by modelo desc;

select *from autos
	where precio between 50000 and 100000;


---32 - Otros operadores relacionales (in)

if object_id('medicamentos') is not null
  drop table medicamentos;

 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  primary key(codigo)
 );

insert into medicamentos values
	('Sertal','Roche',5.2,1,'2015-02-01'),
	('Buscapina','Roche',4.10,3,'2016-03-01'),
	('Amoxidal 500','Bayer',15.60,100,'2017-05-01'),
	('Paracetamol 500','Bago',1.90,20,'2018-02-01'),
	('Bayaspirina','Bayer',2.10,150,'2019-12-01'),
	('Amoxidal jarabe','Bayer',5.10,250,'2020-10-01'); 

select nombre, precio from medicamentos
	where laboratorio in ('bayer', 'Bago');

select * from medicamentos
  where cantidad between 1 and 5;

select * from medicamentos
  where cantidad in (1,2,3,4,5);

--33 - Búsqueda de patrones (like - not like)

if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  nombre varchar(30),
  documento char(8) primary key,
  domicilio varchar(30),
  fechaingreso datetime,
  seccion varchar(20),
  sueldo decimal(6,2),
 );

 insert into empleados values
	('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50),
	('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30),
	('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790),
	('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550),
	('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70),
	('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400),
	('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);

select *from empleados
	where nombre like '%perez';

select *from empleados
	where domicilio like 'co%8%';

select *from empleados
	where documento like '%[02468]';

select *from empleados
	where documento not like '[13]%' 
		and nombre like '%ez';

select nombre from empleados
	where nombre like '%[yj]%';

select nombre, seccion from empleados
	where seccion like '[SG]%' and len(seccion) = 8;

select nombre, seccion from empleados
	where seccion not like '[sg]%';

select nombre, sueldo from empleados
	where sueldo like '%.[1-99]%';

select *from empleados
	where year(fechaingreso) = 1990;

--34 - Contar registros (count)

if object_id('medicamentos') is not null
  drop table medicamentos;

 create table medicamentos(
  codigo int identity primary key,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  numerolote int default null,
 );

 insert into medicamentos values
	('Sertal','Roche',5.2,1,'2015-02-01',null),
	('Buscapina','Roche',4.10,3,'2016-03-01',null),
	('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null),
	('Paracetamol 500','Bago',1.90,20,'2018-02-01',null),
	('Bayaspirina',null,2.10,null,'2019-12-01',null),
	('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null); 

select count(*) AS CANTIDAD from medicamentos;

select count(laboratorio) AS CANTIDAD from medicamentos;

select count(precio) AS 'MEDICAMENTOS CON PRECIO', count(cantidad) as 'Cantidad no null' from medicamentos;

select count(precio) as 'Cantidad con precio' from medicamentos
	where laboratorio like 'b%';

select count(numerolote) as 'Cantidad con lotes' from medicamentos;

---35 - Contar registros (count_big)

if object_id('medicamentos') is not null
  drop table medicamentos;

 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  numerolote int default null,
  primary key(codigo)
 );


 insert into medicamentos values
	('Sertal','Roche',5.2,1,'2015-02-01',null),
	('Buscapina','Roche',4.10,3,'2016-03-01',null),
	('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null),
	('Paracetamol 500','Bago',1.90,20,'2018-02-01',null),
	('Bayaspirina',null,2.10,null,'2019-12-01',null),
	('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null); 

select COUNT_BIG(*) from medicamentos;

select count_big(distinct laboratorio) as cantidad from medicamentos;

select count_big(precio) AS 'CANTIDAD CON PRECIO', count_big(cantidad) as 'CANTIDAD CON CANTIDAD' from medicamentos;


---36 - Funciones de agrupamiento (count - sum - min - max - avg)
if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  primary key(documento)
 );

 insert into empleados values
	('Juan Perez','22333444','Colon 123','Gerencia',5000,2),
	('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0),
	('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1),
	('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3),
	('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0),
	('Yolanda Perez','35111222','Colon 180','Administracion',3200,1),
	('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3),
	('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4),
	('Andres Costa','28444555',default,'Secretaria',null,null);

select count(*) AS CANTIDAD from empleados; 

select count(sueldo) AS CANTIDAD from empleados
	where seccion = 'secretaria';

select max(sueldo) AS MAXIMO, min(sueldo) AS MINIMO from empleados;

select max(cantidadhijos) AS CANTIDAD from empleados
	where nombre like '%perez';


select avg(sueldo) AS PROMEDIO from empleados;

select avg(sueldo) AS PROMEDIO from empleados	
	where seccion = 'secretaria';

select avg(cantidadhijos) from empleados		
	where seccion = 'sistemas';

---37 - Agrupar registros (group by)
--problema 1
if object_id('visitantes') is not null
  drop table visitantes;

 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
 );

 insert into visitantes values
	 ('Susana Molina',35,default,'Colon 123',default,null,null,59.80),
	 ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50),
	 ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90),
	 ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85),
	('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);

insert into visitantes (nombre, edad,sexo,telefono, mail)
  values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
insert into visitantes (nombre, ciudad, montocompra)
  values ('Alejandra Gonzalez','La Falda',280.50);
insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
  values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);

select count(*) as CANTIDAD from visitantes
	group by ciudad;

select ciudad, count(telefono) AS cantidad from visitantes
	group by ciudad;

select sexo, SUM(montocompra) as TOTAL from visitantes
	where sexo is not null
	group by sexo;

select upper(sexo) AS SEXO, ciudad, stuff(max(montocompra),1,0,'$ ') as MAXIMO, stuff(min(montocompra),1,0,'$ ') as MINIMO  from visitantes
	where sexo is not null
	group by sexo, ciudad;

select ciudad ,avg(montocompra) AS PROMEDIO from visitantes	
	group by ciudad;

select ciudad ,count(*) AS CANTIDAD from visitantes
	where mail is not null and not mail = 'no tiene'
	group by ciudad;

select ciudad ,count(*) AS CANTIDAD from visitantes
	where mail is not null and not mail = 'no tiene'
	group by all ciudad;

---problema 2

if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  nombre varchar(30),
  documento char(8) primary key,
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  fechaingreso datetime
 );

 insert into empleados values
	('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'1980-05-10'),
	('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'1980-10-12'),
	('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,'1985-05-25'),
	('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,'1990-06-25'),
	('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'1996-05-01'),
	('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'1996-05-01'),
	('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,'1996-05-01'),
	('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'2000-09-01'),
	('Andres Costa','28444555',default,'Secretaria',null,null,null);

select seccion,count(*) AS CANTIDAD from empleados
	group by seccion;

select seccion, avg(cantidadhijos) AS CANTIDAD from empleados
	group by seccion;

select year(fechaingreso) AS FECHA, count(*) AS CANTIDAD from empleados	
	where year(fechaingreso) is not null
	group by year(fechaingreso);

select seccion, avg(sueldo) AS PROMEDIO from empleados
	where cantidadhijos > 0
	group by seccion;

select seccion, avg(sueldo) AS PROMEDIO from empleados
	group by seccion;

---38 - Seleccionar grupos (having)

if object_id('clientes') is not null
  drop table clientes;

 create table clientes (
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  telefono varchar(11),
  primary key(codigo)
);


 insert into clientes values
	('Lopez Marcos','Colon 111','Cordoba','Cordoba','null'),
	('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585'),
	('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445'),
	('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null),
	('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685'),
	('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525'),
	('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455'),
	('Lopez Carlos',null,'Cruz del Eje','Cordoba',null),
	('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366'),
	('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');

select ciudad, provincia, count(*) as CANTIDAD from clientes
	group by ciudad, provincia;

select ciudad, provincia, count(*) AS CANTIDAD from clientes
	group by ciudad, provincia
	having count(*) >= 2;

select provincia, ciudad, count(*) CANTIDAD from clientes
	where domicilio like '%san martin%' 
	group by all provincia, ciudad
	having count(*) < 2 and ciudad not like 'cordoba';

--problema 2


 if object_id('visitantes') is not null
  drop table visitantes;

 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra decimal(6,2) not null
 );

 insert into visitantes values
	('Susana Molina',28,'f',null,'Cordoba',null,45.50), 
	('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40),
	('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25), 
	('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120),
	('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20),
	('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95),
	('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50),
	('Roxana Lopez',20,'f','null','Alta Gracia',null,240),
	('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48),
	('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

select ciudad, sexo, sum(montocompra) AS TOTAL from visitantes
	group by ciudad, sexo
	having sum(montocompra) > 50;

select ciudad, sexo, sum(montocompra) as TOTAL from visitantes
	where telefono is not null and ciudad not like 'cordoba'
	group by all ciudad, sexo
	having ciudad not like 'cordoba' and sum(montocompra) > 50
	order by ciudad;  

select ciudad, max(montocompra) as MONTO from visitantes
	where domicilio is not null and sexo = 'f'
	group by ciudad
	having max(montocompra) > 50;

select ciudad, sexo, count(*) as VISITANTES, stuff(sum(montocompra),1,0,'$ ') as MONTO, stuff(avg(montocompra),1,0,'$ ') as PROMEDIO from visitantes
	group by ciudad, sexo
	having avg(montocompra) > 30
	order by MONTO;


---43 - Registros duplicados (distinct)
--problema 1
if object_id('clientes') is not null
  drop table clientes;

 create table clientes (
  codigo int identity primary key,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20)
);

 insert into clientes values
	('Lopez Marcos','Colon 111','Cordoba','Cordoba'),
	('Perez Ana','San Martin 222','Cruz del Eje','Cordoba'),
	('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba'),
	('Perez Luis','Sarmiento 444','Rosario','Santa Fe'),
	('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba'),
	('Gomez Ines','San Martin 666','Santa Fe','Santa Fe'),
	('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba'),
	('Lopez Carlos',null,'Cruz del Eje','Cordoba'),
	('Ramos Betina','San Martin 999','Cordoba','Cordoba'),
	('Lopez Lucas','San Martin 1010','Posadas','Misiones');

select distinct provincia as PROVINCIAS from clientes;

select count(distinct provincia) as 'CANTIDAD DE PROVINCIAS' from clientes;

select distinct ciudad from clientes; 

select count(distinct ciudad) AS CANTIDAD from clientes; 

select distinct ciudad from clientes
	where provincia like 'cordoba'; 

select upper(provincia) as PROVINCIA,count(distinct ciudad) AS CANTIDAD from clientes
	group by provincia;


----44 - Cláusula top
if object_id('empleados') is not null
  drop table empleados;

 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  estadocivil char(1),
  seccion varchar(20)
 );

 insert into empleados values
	('22222222','Alberto Lopez','c','Sistemas'),
	('23333333','Beatriz Garcia','c','Administracion'),
	('24444444','Carlos Fuentes','s','Administracion'),
	('25555555','Daniel Garcia','s','Sistemas'),
	('26666666','Ester Juarez','c','Sistemas'),
	('27777777','Fabian Torres','s','Sistemas'),
	('28888888','Gabriela Lopez',null,'Sistemas'),
	('29999999','Hector Garcia',null,'Administracion');

select top 5 *from empleados;

select top 4 nombre, seccion from empleados;

select nombre, seccion from empleados;

select top 4 nombre, estadocivil, seccion from empleados
order by estadocivil, seccion

select nombre, estadocivil, seccion from empleados
order by estadocivil, seccion

---53 - Eliminar restricciones (alter table - drop)

if object_id('vehiculos') is not null
  drop table vehiculos;

 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 );

alter table vehiculos
 add constraint CK_vehiculos_tipo
 check (tipo in ('a','m'));

alter table vehiculos
  add constraint DF_vehiculos_tipo
  default 'a'
  for tipo;

alter table vehiculos
 add constraint CK_vehiculos_patente_patron
 check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

alter table vehiculos
 add constraint PK_vehiculos_patentellegada
 primary key(patente,horallegada);


insert into vehiculos values
	('SDR456','a','2005/10/10 10:10',null),
	('SDR457','m','2005/10/10 10:10',null),
	('SDR458','m','2005/10/10 12:10',null),
	('SDR111','m','2005/10/10 10:10',null);

exec sp_helpconstraint vehiculos;

alter table vehiculos
  drop DF_vehiculos_tipo;

exec sp_helpconstraint vehiculos;

alter table vehiculos
  drop PK_vehiculos_patentellegada, CK_vehiculos_patente_patron;

exec sp_helpconstraint vehiculos;

---66 - Combinación interna (inner join)

if (object_id('clientes')) is not null
   drop table clientes;
 
if (object_id('provincias')) is not null
   drop table provincias;

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into provincias (nombre) values
	('Cordoba'),
	('Santa Fe'),
	('Corrientes');

 insert into clientes values 
('Lopez Marcos','Colon 111','Córdoba',1),
('Perez Ana','San Martin 222','Cruz del Eje',1),
('Garcia Juan','Rivadavia 333','Villa Maria',1),
('Perez Luis','Sarmiento 444','Rosario',2),
('Pereyra Lucas','San Martin 555','Cruz del Eje',1),
('Gomez Ines','San Martin 666','Santa Fe',2),
('Torres Fabiola','Alem 777','Ibera',3);

select c.nombre,domicilio,ciudad,p.nombre as Provincia
  from clientes as c
  inner join provincias as p
  on c.codigoprovincia=p.codigo;

select c.nombre,domicilio,ciudad,p.nombre as Provincia
  from clientes as c
  inner join provincias as p
  on c.codigoprovincia=p.codigo
  order by Provincia;

select c.nombre,domicilio,ciudad,p.nombre as Provincia
  from clientes as c
  inner join provincias as p
  on c.codigoprovincia=p.codigo
  where p.nombre like 'santa fe';

--problema 2
if (object_id('inscriptos')) is not null
  drop table inscriptos;

if (object_id('inasistencias')) is not null
  drop table inasistencias;

 create table inscriptos(
  nombre varchar(30),
  documento char(8),
  deporte varchar(15),
  matricula char(1), --'s'=paga 'n'=impaga
  primary key(documento,deporte)
 );

 create table inasistencias(
  documento char(8),
  deporte varchar(15),
  fecha datetime
 );


insert into inscriptos values
	('Juan Perez','22222222','tenis','s'),
	('Maria Lopez','23333333','tenis','s'),
	('Agustin Juarez','24444444','tenis','n'),
	('Marta Garcia','25555555','natacion','s'),
	('Juan Perez','22222222','natacion','s'),
	('Maria Lopez','23333333','natacion','n');

insert into inasistencias values
	('22222222','tenis','2006-12-01'),
	('22222222','tenis','2006-12-08'),
	('23333333','tenis','2006-12-01'),
	('24444444','tenis','2006-12-08'),
	('22222222','natacion','2006-12-02'),
	('23333333','natacion','2006-12-02');

select nombre, i.deporte, i.fecha as fecha from inscriptos as ins
	inner join inasistencias as i
	on ins.documento = i.documento and ins.deporte = i.deporte
	order by ins.nombre, ins.deporte;
	 
select nombre, i.deporte, i.fecha from inasistencias as i
	inner join inscriptos as ins
	on i.documento = ins.documento and i.deporte = ins.deporte; 

select nombre, i.deporte, i.fecha from inasistencias as i
	inner join inscriptos as ins
	on i.documento = ins.documento and i.deporte = ins.deporte
	where ins.matricula like 's';

---67 - Combinación externa izquierda (left join)

if (object_id('clientes')) is not null
   drop table clientes;
  if (object_id('provincias')) is not null
   drop table provincias;

 create table clientes (
  codigo int identity primary key,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,

 );

 create table provincias(
  codigo tinyint identity primary key,
  nombre varchar(20)
 );

 insert into provincias (nombre) values
	('Cordoba'),
	('Santa Fe'),
	('Corrientes');

 insert into clientes values 
	('Lopez Marcos','Colon 111','Córdoba',1),
	('Perez Ana','San Martin 222','Cruz del Eje',1),
	('Garcia Juan','Rivadavia 333','Villa Maria',1),
	('Perez Luis','Sarmiento 444','Rosario',2),
	('Gomez Ines','San Martin 666','Santa Fe',2),
	('Torres Fabiola','Alem 777','La Plata',4),
	('Garcia Luis','Sucre 475','Santa Rosa',5);


 select c.nombre,domicilio,ciudad, p.nombre from clientes as c
  left join provincias as p
  on c.codigoprovincia = p.codigo;


 select c.nombre,domicilio,ciudad, p.nombre from provincias as p
  left join clientes as c
  on c.codigoprovincia = p.codigo;


 select c.nombre,domicilio,ciudad, p.nombre from clientes as c
  left join provincias as p
  on c.codigoprovincia = p.codigo
  where p.codigo is not null;


 select c.nombre,domicilio,ciudad, p.nombre from clientes as c
  left join provincias as p
  on c.codigoprovincia = p.codigo
  where p.codigo is null
  order by c.nombre;


 select c.nombre,domicilio,ciudad, p.nombre from clientes as c
  left join provincias as p
  on c.codigoprovincia = p.codigo
  where p.nombre='Cordoba';

---68 - Combinación externa derecha (right join)
if (object_id('clientes')) is not null
   drop table clientes;

if (object_id('provincias')) is not null
   drop table provincias;

 create table clientes (
  codigo int identity primary key,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null
 );

 create table provincias(
  codigo tinyint identity primary key,
  nombre varchar(20)
 );

 insert into provincias (nombre) values
	('Cordoba'),
	('Santa Fe'),
	('Corrientes');

 insert into clientes values
	('Lopez Marcos','Colon 111','Córdoba',1),
	('Perez Ana','San Martin 222','Cruz del Eje',1),
	('Garcia Juan','Rivadavia 333','Villa Maria',1),
	('Perez Luis','Sarmiento 444','Rosario',2),
	('Gomez Ines','San Martin 666','Santa Fe',2),
	('Torres Fabiola','Alem 777','La Plata',4),
	('Garcia Luis','Sucre 475','Santa Rosa',5);

select c.codigo, c.nombre, domicilio, ciudad, p.nombre from clientes as c
right join provincias as p
on c.codigoprovincia = p.codigo;

select c.codigo, c.nombre, domicilio, ciudad, p.nombre from clientes as c
left join provincias as p
on c.codigoprovincia = p.codigo;

select c.codigo, c.nombre, domicilio, ciudad, p.nombre from clientes as c
right join provincias as p
on c.codigoprovincia = p.codigo
where c.codigoprovincia = p.codigo;

select  c.nombre, c.codigo, domicilio, ciudad, p.nombre as PROVINCIA from provincias as p
right join clientes as c
on p.codigo = c.codigoprovincia 
where p.codigo is null
order by ciudad;

--69 - Combinación externa completa (full join)

if (object_id('deportes')) is not null
  drop table deportes;

if (object_id('inscriptos')) is not null
  drop table inscriptos;

create table deportes(
  codigo tinyint identity primary key,
  nombre varchar(30),
  profesor varchar(30)
 );

 create table inscriptos(
  documento char(8),
  codigodeporte tinyint not null,
  matricula char(1) --'s'=paga 'n'=impaga
 );

 insert into deportes values
	('tenis','Marcelo Roca'),
	('natacion','Marta Torres'),
	('basquet','Luis Garcia'),
	('futbol','Marcelo Roca');
 
 insert into inscriptos values
	('22222222',3,'s'),
	('23333333',3,'s'),
	('24444444',3,'n'),
	('22222222',2,'s'),
	('23333333',2,'s'),
	('22222222',4,'n'),
	('22222222',5,'n'); 

select documento, d.nombre AS DEPORTE, matricula from inscriptos as i
join deportes as d
on i.codigodeporte = d.codigo;

select documento, d.nombre AS DEPORTE, matricula from inscriptos as i
left join deportes as d
on i.codigodeporte = d.codigo;

select documento, d.nombre AS DEPORTE, matricula from inscriptos as i
right join deportes as d
on i.codigodeporte = d.codigo;

select codigo, d.nombre, profesor from deportes as d
left join inscriptos as i
on i.codigodeporte = d.codigo
where i.codigodeporte is null;

select documento, d.nombre AS DEPORTE, matricula from inscriptos as i
left join deportes as d
on i.codigodeporte = d.codigo
where d.codigo is null;

select *from inscriptos as i
full join deportes as d
on i.codigodeporte = d.codigo;

---70 - Combinaciones cruzadas (cross join)

if object_id('mujeres') is not null
  drop table mujeres;

if object_id('varones') is not null
  drop table varones;

 create table mujeres(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );

 create table varones(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );

 insert into mujeres values
	('Maria Lopez','Colon 123',45),
	('Liliana Garcia','Sucre 456',35),
	('Susana Lopez','Avellaneda 98',41);

 insert into varones values
	('Juan Torres','Sarmiento 755',44),
	('Marcelo Oliva','San Martin 874',56),
	('Federico Pereyra','Colon 234',38),
	('Juan Garcia','Peru 333',50);

select *from varones
cross join mujeres

select *from varones
cross join mujeres
where (mujeres.edad > 40) and (varones.edad > 40)

select *from varones
cross join mujeres
where mujeres.edad-varones.edad between -10 and 10;

--problema 2

if object_id('guardias') is not null
  drop table guardias;

if object_id('tareas') is not null
  drop table tareas;

 create table guardias(
  documento char(8) primary key,
  nombre varchar(30),
  sexo char(1),
  domicilio varchar(30)
 );

 create table tareas(
  codigo tinyint identity primary key,
  domicilio varchar(30),
  descripcion varchar(30),
  horario char(2),
);

 insert into guardias values
	('22333444','Juan Perez','m','Colon 123'),
	('24333444','Alberto Torres','m','San Martin 567'),
	('25333444','Luis Ferreyra','m','Chacabuco 235'),
	('23333444','Lorena Viale','f','Sarmiento 988'),
	('26333444','Irma Gonzalez','f','Mariano Moreno 111');

 insert into tareas values
	('Colon 1111','vigilancia exterior','AM'),
	('Urquiza 234','vigilancia exterior','PM'),
	('Peru 345','vigilancia interior','AM'),
	('Avellaneda 890','vigilancia interior','PM');

select nombre, t.domicilio, descripcion, horario from guardias as g
cross join tareas as t
order by t.descripcion, g.nombre;

select nombre, t.domicilio, descripcion, horario from guardias as g
cross join tareas as t
where (g.sexo = 'f' and t.descripcion = 'vigilancia interior') 
or (g.sexo = 'm' and t.descripcion = 'vigilancia exterior')
order by t.descripcion, g.nombre;


---73 - Combinación de más de dos tablas

if object_id('socios') is not null
  drop table socios;
 
 if object_id('deportes') is not null
  drop table deportes;
 
 if object_id('inscriptos') is not null
  drop table inscriptos;

 create table socios(
  documento char(8) primary key, 
  nombre varchar(30),
  domicilio varchar(30)
 );

 create table deportes(
  codigo tinyint identity primary key,
  nombre varchar(20),
  profesor varchar(15)
 );

 create table inscriptos(
  documento char(8) not null, 
  codigodeporte tinyint not null,
  anio char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,anio)
 );

 insert into socios values
	('22222222','Ana Acosta','Avellaneda 111'),
	('23333333','Betina Bustos','Bulnes 222'),
	('24444444','Carlos Castro','Caseros 333'),
	('25555555','Daniel Duarte','Dinamarca 44');

 insert into deportes values
	('basquet','Juan Juarez'),
	('futbol','Pedro Perez'),
	('natacion','Marina Morales'),
	('tenis','Marina Morales');

 insert into inscriptos values 
	('22222222',3,'2006','s'),
	('23333333',3,'2006','s'),
	('24444444',3,'2006','n'), 
	('22222222',3,'2005','s'),
	('22222222',3,'2007','n'),
	 ('24444444',1,'2006','s'),
	('24444444',2,'2006','s'),
	('26666666',0,'2006','s');

select s.nombre, d.nombre as deporte, i.anio as año from socios as s
inner join inscriptos as i 
on i.documento = s.documento
inner join deportes as d
on d.codigo = i.codigodeporte;

select i.documento, s.nombre,anio,d.nombre as deporte, matricula from inscriptos as i
full join deportes as d 
on d.codigo = i.codigodeporte
full join socios as s
on s.documento = i.documento;

select s.nombre, d.nombre as deporte, i.anio as año from socios as s
inner join inscriptos as i 
on i.documento = s.documento
inner join deportes as d
on d.codigo = i.codigodeporte
where i.documento = '22222222';

---82 - Unión

if object_id('clientes') is not null
  drop table clientes;

if object_id('proveedores') is not null
  drop table proveedores;
 
if object_id('empleados') is not null
  drop table empleados;

 create table proveedores(
  codigo int identity,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(codigo)
 );

 create table clientes(
  codigo int identity,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(codigo)
 );

 create table empleados(
  documento char(8) not null,
  nombre varchar(20),
  apellido varchar(20),
  domicilio varchar(30),
  primary key(documento)
 );

 insert into proveedores values
	('Bebida cola','Colon 123'),
	('Carnes Unica','Caseros 222'),
	('Lacteos Blanca','San Martin 987');

 insert into clientes values
	('Supermercado Lopez','Avellaneda 34'),
	('Almacen Anita','Colon 987'),
	('Garcia Juan','Sucre 345');
 
 insert into empleados values
	('23333333','Federico','Lopez','Colon 987'),
	('28888888','Ana','Marquez','Sucre 333'),
	('30111111','Luis','Perez','Caseros 956');

select nombre, domicilio from proveedores
union 
select nombre, domicilio from clientes
union 
select nombre, domicilio from empleados;

select nombre, domicilio, 'proveedor' as TIPO from proveedores
union 
select nombre, domicilio, 'cliente' from clientes
union 
select nombre, domicilio, 'empleado' from empleados;

--83 - Agregar y eliminar campos ( alter table - add - drop)
if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  fechaingreso datetime
);
 insert into empleados(apellido,nombre) values ('Rodriguez','Pablo');

alter table empleados add
sueldo decimal(5,2);

exec sp_columns empleados;

alter table empleados add
codigo int identity;

alter table empleados add
documento int not null;

alter table empleados
  add documento char(8) not null default '00000000';

exec sp_columns empleados;

alter table empleados drop column sueldo;

exec sp_columns empleados;

alter table empleados drop column documento;

alter table empleados drop column codigo, fechaingreso;

exec sp_columns empleados;

--84 - Alterar campos (alter table - alter)
if object_id('empleados') is not null
  drop table empleados;

create table empleados(
  legajo int not null,
  documento char(7) not null,
  nombre varchar(10),
  domicilio varchar(30),
  ciudad varchar(20) default 'Buenos Aires',
  sueldo decimal(6,2),
  cantidadhijos tinyint default 0,
  primary key(legajo)
);

alter table empleados
alter column nombre varchar(15) not null;

exec sp_columns empleados;

alter table empleados
alter column sueldo decimal(6,2) not null;

alter table empleados
alter column documento char(8) not null;

alter table empleados
alter column legajo tinyint not null;

insert into empleados values
	(1,'22222222','Juan Perez','Colon 123','Cordoba',500,3),
	(2,'30000000',null,'Sucre 456','Cordoba',600,2);

 alter table empleados
 alter column nombre varchar(30) not null;

delete from empleados where nombre is null;
	alter table empleados
	alter column nombre varchar(30) not null;

alter table empleados
 alter column ciudad varchar(10);

insert into empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);

alter table empleados
 alter column ciudad varchar(15);

insert into empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);

alter table empleados
 alter column legajo int identity;

 --86 - Campos calculados

 if object_id('articulos') is not null
  drop table articulos;

 create table articulos(
  codigo int identity,
  descripcion varchar(30),
  precio decimal(5,2) not null,
  cantidad smallint not null default 0,
  montototal as precio *cantidad
 );

insert into articulos 
values('birome',1.5,100,150);

insert into articulos values
	('birome',1.5,100),
	('cuaderno 12 hojas',4.8,150),
	('lapices x 12',5,200);

select * from articulos;

update articulos set precio=2 where descripcion='birome';
 
select * from articulos;

update articulos set cantidad=200 where descripcion='birome';
 
select * from articulos;

update articulos set montototal=300 where descripcion='birome';

--92 - Subconsultas como expresión
if object_id('alumnos') is not null
  drop table alumnos;

create table alumnos(
  documento char(8) primary key,
  nombre varchar(30),
  nota decimal(4,2),
  constraint CK_alumnos_nota_valores check (nota>=0 and nota <=10)
 );

 insert into alumnos values
	('30111111','Ana Algarbe',5.1),
	('30222222','Bernardo Bustamante',3.2),
	('30333333','Carolina Conte',4.5),
	('30444444','Diana Dominguez',9.7),
	('30555555','Fabian Fuentes',8.5),
	('30666666','Gaston Gonzalez',9.70);

select *from alumnos
where nota = (select max(nota) from alumnos);

select *from alumnos
where nota = (select max(nota), nombre from alumnos);

select nota, (select avg(nota) from alumnos) - nota as diferencia from alumnos
where nota < (select avg(nota) from alumnos);

update alumnos set nota = 4
where nota = (select min(nota) from alumnos);

delete alumnos
where nota < (select avg(nota) from alumnos);

--93 - Subconsultas con in
if (object_id('ciudades')) is not null
   drop table ciudades;

if (object_id('clientes')) is not null
   drop table clientes;

 create table ciudades(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  codigociudad tinyint not null,
  primary key(codigo),
  constraint FK_clientes_ciudad
   foreign key (codigociudad)
   references ciudades(codigo)
   on update cascade,
 );

 insert into ciudades (nombre) values
		('Cordoba'),
		('Cruz del Eje'),
		('Carlos Paz'),
		('La Falda'),
		('Villa Maria');

 insert into clientes values
	('Lopez Marcos','Colon 111',1),
	('Lopez Hector','San Martin 222',1),
	('Perez Ana','San Martin 333',2),
	('Garcia Juan','Rivadavia 444',3),
	('Perez Luis','Sarmiento 555',3),
	('Gomez Ines','San Martin 666',4),
	('Torres Fabiola','Alem 777',5),
	('Garcia Luis','Sucre 888',5);

select nombre from ciudades
where codigo in (select codigociudad from clientes where domicilio like '%san martin%');

select ciud.nombre from ciudades as ciud
inner join clientes
on ciud.codigo = clientes.codigociudad
where domicilio like '%san martin%';

select nombre from ciudades
where codigo not in (select codigociudad from clientes where nombre like 'l%');

select codigociudad from clientes where nombre like 'l%'

---94 - Subconsultas any - some - all
if object_id('inscriptos') is not null
  drop table inscriptos;

if object_id('socios') is not null
  drop table socios;

create table socios(
  numero int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
);
 
 create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas tinyint
  constraint CK_inscriptos_cuotas
   check (cuotas>=0 and cuotas<=10)
  constraint DF_inscriptos_cuotas default 0,
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
   foreign key (numerosocio)
   references socios(numero)
   on update cascade
   on delete cascade,
);

insert into socios values
	('23333333','Alberto Paredes','Colon 111'),
	('24444444','Carlos Conte','Sarmiento 755'),
	('25555555','Fabian Fuentes','Caseros 987'),
	('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values
	(1,'tenis',1),
	(1,'basquet',2),
	(1,'natacion',1),
	(2,'tenis',9),
	(2,'natacion',1),
	(2,'basquet',default),
	(2,'futbol',2),
	(3,'tenis',8),
	(3,'basquet',9),
	(3,'natacion',0),
	(4,'basquet',10);

select numerosocio, s.nombre, deporte from socios as s
inner join inscriptos as i
on i.numerosocio = s.numero;

select nombre from socios
join inscriptos as i
on numero = numerosocio
where deporte = any(select deporte from inscriptos where deporte='natacion') 
and numero = any(select numerosocio from inscriptos where deporte='tenis');

select deporte from inscriptos
where numerosocio = 1 and deporte = any(select deporte from inscriptos where numerosocio = 2) 

select ins.deporte from inscriptos ins
join inscriptos as i
on ins.deporte = i.deporte
where ins.numerosocio like 1 and i.numerosocio like 2; 

select deporte from inscriptos as i
 where numerosocio = 2 and cuotas > any(select cuotas from inscriptos where numerosocio = 1);

select deporte from inscriptos
where numerosocio = 2 and cuotas > all(select cuotas from inscriptos where numerosocio = 1);

delete from inscriptos
 where numerosocio = any(select numerosocio from inscriptos where cuotas=0);

---95 - Subconsultas correlacionadas
if object_id('inscriptos') is not null
  drop table inscriptos;

if object_id('socios') is not null
  drop table socios;

 create table socios(
  numero int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
 );
 
 create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas tinyint
  constraint CK_inscriptos_cuotas
   check (cuotas>=0 and cuotas<=10)
  constraint DF_inscriptos_cuotas default 0,
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
   foreign key (numerosocio)
   references socios(numero)
   on update cascade
   on delete cascade,
 );

 insert into socios values
	('23333333','Alberto Paredes','Colon 111'),
	('24444444','Carlos Conte','Sarmiento 755'),
	('25555555','Fabian Fuentes','Caseros 987'),
	('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values
	(1,'tenis',1),
	(1,'basquet',2),
	(1,'natacion',1),
	(2,'tenis',9),
	(2,'natacion',1),
	(2,'basquet',default),
	(2,'futbol',2),
	(3,'tenis',8),
	(3,'basquet',9),
	(3,'natacion',0),
	(4,'basquet',10);

select nombre,domicilio, (select count(*) from inscriptos where s.numero = numerosocio) as deportes from socios as s;

select nombre, (select count(*) * 10 from inscriptos where s.numero = numerosocio) as total, 
(select sum(cuotas) from inscriptos where s.numero = numerosocio) as pagadas from socios as s;

 select nombre, count(i.deporte) * 10 as total, sum(i.cuotas) as pagadas from socios as s
 join inscriptos as i
 on numero = numerosocio
 group by nombre;

 
---96 - Subconsulta - Exists y Not Exists

 if object_id('inscriptos') is not null
  drop table inscriptos;

 if object_id('socios') is not null
  drop table socios;

 create table socios(
  numero int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
 );
 
 create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas tinyint
  constraint CK_inscriptos_cuotas
   check (cuotas>=0 and cuotas<=10)
  constraint DF_inscriptos_cuotas default 0,
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
   foreign key (numerosocio)
   references socios(numero)
   on update cascade
   on delete cascade
 );

insert into socios values
	('23333333','Alberto Paredes','Colon 111'),
	('24444444','Carlos Conte','Sarmiento 755'),
	('25555555','Fabian Fuentes','Caseros 987'),
	('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values
	(1,'tenis',1),
	(1,'basquet',2),
	(1,'natacion',1),
	(2,'tenis',9),
	(2,'natacion',1),
	(2,'basquet',default),
	(2,'futbol',2),
	(3,'tenis',8),
	(3,'basquet',9),
	(3,'natacion',0),
	(4,'basquet',10);

select nombre from socios
where exists (select *from inscriptos where socios.numero = numerosocio and deporte like 'basquet');

select nombre from socios
where not exists (select *from inscriptos where socios.numero = numerosocio and deporte like 'tenis');

select *from socios
where exists (select *from inscriptos where numero = numerosocio and cuotas = 10);

--98 - Subconsulta en lugar de una tabla
if object_id('inscriptos') is not null
  drop table inscriptos;
 
if object_id('socios') is not null
  drop table socios;
 
if object_id('deportes') is not null
  drop table deportes;

 create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );

 create table deportes(
  codigo tinyint identity,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo)
 );

 create table inscriptos(
  documento char(8) not null, 
  codigodeporte tinyint not null,
  año char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,año),
  constraint FK_inscriptos_socio
   foreign key (documento)
   references socios(documento)
   on update cascade
   on delete cascade
 );

 insert into socios values
	('22222222','Ana Acosta','Avellaneda 111'),
	('23333333','Betina Bustos','Bulnes 222'),
	('24444444','Carlos Castro','Caseros 333'),
	('25555555','Daniel Duarte','Dinamarca 44');

 insert into deportes values
	('basquet','Juan Juarez'),
	('futbol','Pedro Perez'),
	('natacion','Marina Morales'),
	('tenis','Marina Morales');

 insert into inscriptos values
	('22222222',3,'2006','s'),
	('23333333',3,'2006','s'),
	('24444444',3,'2006','n'),
	('22222222',3,'2005','s'),
	('22222222',3,'2007','n'),
	('24444444',1,'2006','s'),
	('24444444',2,'2006','s');

select documento, codigodeporte, año, matricula, d.nombre, d.profesor from inscriptos
inner join deportes as d
on d.codigo = codigodeporte;

select s.nombre, c.nombre, c.año, c.profesor, c.matricula from socios as s
inner join (select documento, codigodeporte, año, matricula, d.nombre, d.profesor from inscriptos
inner join deportes as d
on d.codigo = codigodeporte) as c
on c.documento = s.documento

--99 - Subconsulta (update - delete)

if object_id('inscriptos') is not null
  drop table inscriptos;

if object_id('socios') is not null
  drop table socios;

 create table socios(
  numero int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
 );
 
 create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  matricula char(1),-- 'n' o 's'
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
   foreign key (numerosocio)
   references socios(numero)
 );

 insert into socios values
	('23333333','Alberto Paredes','Colon 111'),
	('24444444','Carlos Conte','Sarmiento 755'),
	('25555555','Fabian Fuentes','Caseros 987'),
	('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values
	(1,'tenis','s'),
	(1,'basquet','s'),
	(1,'natacion','s'),
	(2,'tenis','s'),
	(2,'natacion','s'),
	(2,'basquet','n'),
	(2,'futbol','n'),
	(3,'tenis','s'),
	(3,'basquet','s'),
	(3,'natacion','n'),
	(4,'basquet','n');

update inscriptos set matricula = 's'
where numerosocio = (select numero from socios where documento = '23333333');

delete inscriptos 
where numerosocio in (select numero from socios join inscriptos on numerosocio = numero where matricula = 'n');

--100 - Subconsulta (insert)

if object_id('facturas') is not null
  drop table facturas;

if object_id('clientes') is not null
  drop table clientes;

 if object_id ('clientespref') is not null
  drop table clientespref; 

 create table clientes(
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  primary key(codigo)
 );

 create table facturas(
  numero int not null,
  fecha datetime,
  codigocliente int not null,
  total decimal(6,2),
  primary key(numero),
  constraint FK_facturas_cliente
   foreign key (codigocliente)
   references clientes(codigo)
   on update cascade
 );

create table clientespref(
  nombre varchar(30),
  domicilio varchar(30)
 );

insert into clientes values
	('Juan Lopez','Colon 123'),
	('Luis Torres','Sucre 987'),
	('Ana Garcia','Sarmiento 576'),
	('Susana Molina','San Martin 555');

 insert into facturas values
	(1200,'2007-01-15',1,300),
	(1201,'2007-01-15',2,550),
	(1202,'2007-01-15',3,150),
	(1300,'2007-01-20',1,350),
	(1310,'2007-01-22',3,100);

insert into clientespref select nombre, domicilio from clientes
	where codigo in (select codigocliente from clientes as c 
	join facturas as fac on codigocliente = codigo
	group by codigocliente);

 select * from clientespref;

 --101 - Crear tabla a partir de otra (select - into)

if object_id('empleados')is not null
  drop table empleados;
 
if object_id('sucursales')is not null
  drop table sucursales;


 create table sucursales( 
  codigo int identity,
  ciudad varchar(30) not null,
  primary key(codigo)
 ); 


 create table empleados( 
  documento char(8) not null,
  nombre varchar(30) not null,
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  codigosucursal int,
  primary key(documento),
  constraint FK_empleados_sucursal
   foreign key (codigosucursal)
   references sucursales(codigo)
   on update cascade
 ); 

insert into sucursales values
	('Cordoba'),
	('Villa Maria'),
	('Carlos Paz'),
	('Cruz del Eje');

 insert into empleados values
	('22222222','Ana Acosta','Avellaneda 111','Secretaria',500,1),
	('23333333','Carlos Caseros','Colon 222','Sistemas',800,1),
	('24444444','Diana Dominguez','Dinamarca 333','Secretaria',550,2),
	('25555555','Fabiola Fuentes','Francia 444','Sistemas',750,2),
	('26666666','Gabriela Gonzalez','Guemes 555','Secretaria',580,3),
	('27777777','Juan Juarez','Jujuy 777','Secretaria',500,4),
	('28888888','Luis Lopez','Lules 888','Sistemas',780,4),
	('29999999','Maria Morales','Marina 999','Contaduria',670,4);

select documento,nombre,domicilio,seccion,sueldo,ciudad
  from empleados
  join sucursales on codigosucursal=codigo;

if object_id('secciones') is not null
  drop table secciones;

 select distinct seccion as nombre
  into secciones
  from empleados;

select *from secciones;

if object_id('sueldosxseccion') is not null
  drop table sueldosxseccion;

 select seccion, sum(sueldo) as total
  into sueldosxseccion
  from empleados
  group by seccion;

 select *from sueldosxseccion;

 if object_id('maximossueldos') is not null
  drop table maximossueldos;

  select top 3 *
  into maximossueldos
  from empleados
  order by sueldo;

 select *from maximossueldos;

 if object_id('sucursalCordoba') is not null
  drop table sucursalCordoba;

select nombre,ciudad into sucursalCordoba from empleados
join sucursales
on codigosucursal=codigo
where ciudad='Cordoba';

 select *from sucursalCordoba;

 ---103 - Vistas

if object_id('inscriptos') is not null  
  drop table inscriptos;

if object_id('socios') is not null  
  drop table socios;
 
if object_id('profesores') is not null  
  drop table profesores; 

if object_id('cursos') is not null  
  drop table cursos;

 create table socios(
  documento char(8) not null,
  nombre varchar(40),
  domicilio varchar(30),
  constraint PK_socios_documento
   primary key (documento)
 );

 create table profesores(
  documento char(8) not null,
  nombre varchar(40),
  domicilio varchar(30),
  constraint PK_profesores_documento
   primary key (documento)
 );

 create table cursos(
  numero tinyint identity,
  deporte varchar(20),
  dia varchar(15),
   constraint CK_inscriptos_dia check (dia in('lunes','martes','miercoles','jueves','viernes','sabado')),
  documentoprofesor char(8),
  constraint PK_cursos_numero
   primary key (numero),
 );

 create table inscriptos(
  documentosocio char(8) not null,
  numero tinyint not null,
  matricula char(1),
  constraint CK_inscriptos_matricula check (matricula in('s','n')),
  constraint PK_inscriptos_documento_numero
   primary key (documentosocio,numero)
 );


 insert into socios values
	('30000000','Fabian Fuentes','Caseros 987'),
	('31111111','Gaston Garcia','Guemes 65'),
	('32222222','Hector Huerta','Sucre 534'),
	('33333333','Ines Irala','Bulnes 345');

 insert into profesores values
	('22222222','Ana Acosta','Avellaneda 231'),
	('23333333','Carlos Caseres','Colon 245'),
	('24444444','Daniel Duarte','Sarmiento 987'),
	('25555555','Esteban Lopez','Sucre 1204');

 insert into cursos values
	('tenis','lunes','22222222'),
	('tenis','martes','22222222'),
	('natacion','miercoles','22222222'),
	('natacion','jueves','23333333'),
	('natacion','viernes','23333333'),
	('futbol','sabado','24444444'),
	('futbol','lunes','24444444'),
	('basquet','martes','24444444');

 insert into inscriptos values
	('30000000',1,'s'),
	('30000000',3,'n'),
	('30000000',6,null),
	('31111111',1,'s'),
	('31111111',4,'s'),
	('32222222',8,'s');

if object_id('vista') is not null drop view vista;

create view vista as 
	select s.nombre, s.documento, c.deporte, c.dia, p.nombre as profesor, matricula from socios as s
	full join inscriptos as i
	on i.documentosocio = s.documento
	full join cursos as c
	on c.numero = i.numero
	full join profesores as p
	on p.documento = c.documentoprofesor

select *from vista;

select deporte ,count(*) as cantidad from vista
	group by deporte
	order by cantidad desc;

select deporte , dia from vista
	where deporte is not null and documento is null;

select nombre from vista
	where documento is not null and deporte is null;

select profesor from vista
	where profesor is not null and deporte is null;

select nombre, documento from vista
	where matricula = 'n'

select profesor, dia from vista
	where profesor is not null and dia is not null;

select profesor, dia from vista
	where profesor is not null and dia is not null
	order by dia;

select nombre from vista
	where deporte like 'tenis' and dia = 'lunes';

if object_id('vista') is not null drop view vista;

create view vista as 
	select deporte,dia, (select count(*) from inscriptos where numero = cursos.numero) as cantidad from cursos;

select *from vista;

--110 - Lenguaje de control de flujo (case)
if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  sexo char(1),
  fechanacimiento datetime,
  fechaingreso datetime,
  cantidadhijos tinyint,
  sueldo decimal(5,2),
  primary key(documento)
);

 insert into empleados values
	('22333111','Juan Perez','m','1970-05-10','1987-04-05',2,550),
	('25444444','Susana Morales','f','1975-11-06','1990-04-04',0,650),
	('20111222','Hector Pereyra','m','1965-03-25','1997-04-12',3,510),
	('30000222','Luis LUque','m','1980-03-29','1999-11-06',1,700),
	('20555444','Laura Torres','f','1965-12-22','2003-11-06',3,400),
	('30000234','Alberto Soto','m','1989-10-10','1999-11-06',2,420),
	('20125478','Ana Gomez','f','1976-09-21','1998-11-06',3,350),
	('24154269','Ofelia Garcia','f','1974-05-12','1990-11-06',0,390),
	('30415426','Oscar Torres','m','1978-05-02','1997-11-06',1,400);

select count(*) as cantidad, regalo = case
	when sexo = 'f' then 'Rosas'
	when sexo = 'm' then 'Cobartas'
	else 'Sin sexo'
	end
from empleados
where datepart(month,fechanacimiento) = 5
group by sexo;

select nombre,datediff(year,fechaingreso, getdate())as 'años en servicio', regalo = case
	when datediff(year,fechaingreso, getdate()) like '10-20-30-40' then 'Placa'
	else 'No cumple los requisitos'
	end
from empleados
where datepart(month,fechaingreso) = 4;

 select nombre,sueldo,cantidadhijos, 'Por hijo' = case
 when sueldo > 500 then 100
 else 200
 end, 
 'Salario Familiar' =  case
	when sueldo > 500 then cantidadhijos * 100
	else cantidadhijos * 200
	end, 
'Salario Final' =  case
		when sueldo > 500 then sueldo + (cantidadhijos * 100)
		else
		sueldo + (cantidadhijos * 200)
		end
  from empleados
  order by 'Salario Final';

---111 - Lenguaje de control de flujo (if)
if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  sexo char(1),
  fechanacimiento datetime,
  sueldo decimal(5,2),
  primary key(documento)
);

 insert into empleados values 
	('22333111','Juan Perez','m','1970-05-10',550),
	('25444444','Susana Morales','f','1975-11-06',650),
	('20111222','Hector Pereyra','m','1965-03-25',510),
	('30000222','Luis LUque','m','1980-03-29',700),
	('20555444','Laura Torres','f','1965-12-22',400),
	('30000234','Alberto Soto','m','1989-10-10',420),
	('20125478','Ana Gomez','f','1976-09-21',350),
	('24154269','Ofelia Garcia','f','1974-05-12',390),
	('30415426','Oscar Torres','m','1978-05-02',400);

if exists(select * from empleados where datepart(month,fechanacimiento)=5)
  (select regalo = case
  when sexo = 'f' then 'Rosas'
  else 'Cobartas'
  end,
  count(*) as cantidad 
  from empleados
  where datepart(month,fechanacimiento)=5
  group by sexo)


--120 - Procedimientos almacenados (crear - ejecutar)
if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  seccion varchar(20),
  primary key(documento)
 );

 insert into empleados values
	('22222222','Juan','Perez',300,2,'Contaduria'),
	('22333333','Luis','Lopez',300,0,'Contaduria'),
	('22444444','Marta','Perez',500,1,'Sistemas'),
	('22555555','Susana','Garcia',400,2,'Secretaria'),
	('22666666','Jose Maria','Morales',400,3,'Secretaria');

if object_id('pa_empleados_sueldo') is not null
  drop procedure pa_empleados_sueldo;

create procedure pa_empleados_sueldo as
select nombre, apellido, sueldo from empleados;

exec pa_empleados_sueldo;

create procedure pa_empleados_sueldo as
select nombre, apellido, sueldo from empleados;

if object_id('pa_empleados_hijos') is not null
  drop procedure pa_empleados_hijos;

create procedure pa_empleados_hijos as
select nombre, apellido, cantidadhijos from empleados
	where cantidadhijos > 0;

exec pa_empleados_hijos;

update empleados set cantidadhijos = 4
where documento = 22333333;

exec pa_empleados_hijos;

--135 - Funciones escalares (crear y llamar)
 if object_id('consultas') is not null
  drop table consultas;

 if object_id('medicos') is not null
  drop table medicos;

 create table medicos (
  documento char(8) not null,
  nombre varchar(30),
  constraint PK_medicos 
   primary key clustered (documento)
 );

 create table consultas(
  fecha datetime,
  medico char(8) not null,
  paciente varchar(30),
  constraint PK_consultas
   primary key (fecha,medico),
  constraint FK_consultas_medico
   foreign key (medico)
   references medicos(documento)
   on update cascade
   on delete cascade
 );


 insert into medicos values
	('22222222','Alfredo Acosta'),
	('23333333','Pedro Perez'),
	('24444444','Marcela Morales');

 insert into consultas values
	('2007/03/26 8:00','22222222','Juan Juarez'),
	('2007/03/26 8:00','23333333','Gaston Gomez'),
	('2007/03/26 8:30','22222222','Nora Norte'),
	('2007/03/28 9:00','22222222','Juan Juarez'),
	('2007/03/29 8:00','24444444','Nora Norte'),
	('2007/03/24 8:30','22222222','Hector Huerta'), 
	('2007/03/24 9:30','23333333','Hector Huerta');

if object_id('f_nombreDia') is not null
  drop function f_nombreDia;

create function f_nombreDia(@dia varchar(10))
returns varchar(10)
as 
begin 
	declare @diaES varchar(10)
	set @diaES = case @dia
	when 'monday' then 'lunes'
	when 'tuesday' then 'martes'
	when 'wednesday' then 'miercoles'
	when 'thursday' then 'jueves'
	when 'friday' then 'viernes'
	when 'saturday' then 'sabado'
	when 'sunday' then 'domingo'
	end 
	return @diaEs
end;

select dbo.f_nombreDia(datename(weekday,getdate()));

if object_id('f_horario') is not null
  drop function f_horario;

create function f_horario(@fecha datetime)
returns varchar(7)
as 
begin 
	 
	return CONVERT(VARCHAR(7), CAST(@fecha AS TIME), 0)
end;

select dbo.f_horario(getdate());
 
if object_id('f_fecha') is not null
  drop function f_fecha;

create function f_fecha(@fecha datetime)
returns varchar(10)
as 
begin 
	
	return format(convert(date, @fecha), 'dd-MM-yyyy')
end;

select dbo.f_fecha(getdate());

select m.nombre as medico, dbo.f_nombreDia(c.fecha), dbo.f_fecha(c.fecha), dbo.f_horario(c.fecha) from consultas as c
join medicos as m
on m.nombre = 'alfredo acosta';

select fecha, m.nombre from consultas as c
join medicos as m
 on m.documento = c.medico
where dbo.f_nombredia(fecha)='sabado';

declare @valor char(30)
 set @valor= getdate()
 select dbo.f_nombreDia(@valor);

 --136 - Funciones de tabla de varias instrucciones

  if object_id('empleados') is not null
  drop table empleados;

create table empleados(
  documento char(8) not null,
  apellido varchar(30) not null,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(30),
  fechanacimiento datetime,
  constraint PK_empleados
   primary key(documento)
);

 insert into empleados values
	('22222222','Acosta','Ana','Avellaneda 123','Cordoba','1970/10/10'),
	('23333333','Bustos','Bernardo','Bulnes 234','Cordoba','1972/05/15'),
	('24444444','Caseros','Carlos','Colon 356','Carlos Paz','1980/02/25'),
	('25555555','Fuentes','Fabiola','Fragueiro 987','Jesus Maria','1984/06/12');

if object_id('f_empleados') is not null
  drop function f_empleados;


create function f_empleados(@opcion varchar(12))
returns @empleados table(
	documento char(8),
	apellido varchar(30),
	nombre varchar(30),
	domicilio varchar(30),
	ciudad varchar(30),
	fechanacimiento datetime)
as 
begin 
	if @opcion not in ('total', 'parcial')
		set @opcion = 'parcial'
	if @opcion = 'total'
		insert @empleados select *from empleados;
	else 
		insert @empleados select documento, apellido , nombre from empleados;
	
	return 
end;

select *from dbo.f_empleados('total');

select *from dbo.f_empleados();

select *from dbo.f_empleados('');

select *from dbo.f_empleados('parcial')
  where domicilio='Cordoba';