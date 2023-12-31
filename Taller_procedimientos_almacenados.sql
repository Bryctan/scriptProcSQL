create database laboratorioSQL;
use laboratorioSQL;

create table profesor (
doc_prof varchar (11) primary key,
nom_prof varchar (30), 
ape_prof varchar (30),
cate_prof int,
sal_prof int
);

 
create table curso (
cod_cur int primary key identity, 
nom_cur varchar (100),
horas_cur int,
valor_cur int
);

create table estudiante (
doc_est varchar (11) primary key,
nom_est varchar (30),
ape_est varchar (30),
edad_est int
);

create table estudiante_curso (
cod_cur_estcur int foreign key references curso (cod_cur),
doc_est_estcur varchar (11) foreign key references estudiante (doc_est),
fec_ini_est_cur date 
);

create table cliente (
id_cli varchar (11) primary key, 
nom_cli varchar (30),
ape_cli varchar (30),
dir_cli varchar (100),
dep_cli varchar (20),
mes_cum_cli varchar (10)
);

create table articulo (
id_art int identity primary key,
tit_art varchar (100),
aut_art varchar (100),
edi_art varchar (300),
prec_art int
);

create table pedido (
id_ped int identity primary key, 
id_cli_ped varchar (11) foreign key references cliente (id_cli),
fec_ped date,
val_ped int
);

create table articulo_pedido (
id_ped_artped int foreign key references pedido(id_ped),
id_art_artped int foreign key references articulo(id_art),
can_art_artped int,
val_ven_art_artped int
);

create table compania (
comnit varchar (11),
comnombre varchar (30),
comaniofun int,
comreplegal varchar (100)
);

create table tiposAutomotores (
auttipo int primary key 
);

create table automotores(
autoplaca varchar (6) primary key,
automarca varchar (30),
autotipo int foreign key references tiposAutomotores(auttipo),
automodelo int,
autopasajeros int,
autocilindraje int,
autonumchasis varchar (20)
);

create table aseguramientos (
asecodigo int identity primary key,
asefechainicio date,
asefechaexpiracion date,
asevalorasegurado int,
aseestado varchar(40),
asecosto int ,
aseplaca varchar (6) foreign key references automotores (autoplaca)
);

create table incidentes (
incicodigo int identity primary key,
incifecha date, 
inciplaca varchar (6) foreign key references automotores (autoplaca),
incilugar varchar (40),
inciantheridos int,
incicanfatalidades int,
incicanautosinvolucrados int
);

--- Inserciones profesor
exec sp_help profesor;

alter table profesor drop constraint PK__profesor__08241E30CB5D721F;
alter table profesor alter column doc_prof varchar (15) not null;
alter table profesor add constraint PK__profesor__08241E30CB5D721F primary key (doc_prof);

insert into profesor values
('63.502.720','Martha','Rojas',2,690000),
('91.216.904','Carlos','P�rez',3,950000),
('13.826.789','Maritza','Angarita',1,550000),
('1.098.765.789','Alejandra', 'Torres', 4,1100000)

select * from profesor

set identity_insert curso ON;

insert into curso (cod_cur , nom_cur, horas_cur , valor_cur) values (149842,'Fundamentos de base de datos',40,500000);
insert into curso (cod_cur , nom_cur, horas_cur , valor_cur) values (250067,'Fundamentos de SQL', 20 , 700000);
insert into curso (cod_cur , nom_cur, horas_cur , valor_cur) values (289011, 'Manejo de Mysql', 45 , 550000);
insert into curso (cod_cur , nom_cur, horas_cur , valor_cur) values (345671, 'Fundamentals of Oracle', 60 , 3000000);

select * from curso;

exec sp_help estudiante_curso;
alter table estudiante_curso drop constraint FK__estudiant__doc_e__4F7CD00D;
alter table estudiante_curso alter column doc_est_estcur varchar (15) not null;
exec sp_help estudiante;
alter table estudiante drop constraint PK__estudian__75DA98B0FC6C7629;
alter table estudiante alter column doc_est varchar (15) not null;
alter table estudiante add constraint  PK__estudian__75DA98B0FC6C7629 primary key (doc_est);
alter table estudiante_curso add constraint FK__estudiant__doc_e__4F7CD00D foreign key (doc_est_estcur) references estudiante (doc_est);


insert into estudiante values 
('63.502.720','Mar�a','P�rez',2),
('91.245.678','Carlos Jos�', 'Lop�z',3),
('1.098.098.097','Jonatan', 'Aldila',1),
('1.098.765.679', 'Carlos', 'Mart�nez', 4)

select * from estudiante;

insert into estudiante_curso(cod_cur_estcur, doc_est_estcur, fec_ini_est_cur) values
(289011, '1.098.765.679', '2011-02-01'),
(250067, '63.502.720', '2011-03-01'),
(289011, '1.098.098.097', '2011-02-01'),
(345671, '63.502.720', '2011-04-01');

select * from estudiante_curso;

insert into cliente (id_cli, nom_cli, ape_cli, dir_cli, dep_cli, mes_cum_cli) values
(63502718, 'Maritza', 'Rojas', 'Calle 34 No. 14-45', 'Santander', 'Abril'),
(13890234, 'Roger', 'Ariza', 'Cra 30 No. 13-45', 'Antioquia', 'Junio'),
(77191956, 'Juan Carlos', 'Arenas', 'Diagonal 23 No. 12-34 apto 101', 'Valle', 'Marzo'),
(1098765789, 'Catalina', 'Zapata', 'Av. El Libertador No. 30-14', 'Cauca', 'Marzo');

select * from cliente

insert into articulo values
('Redes cisco', 'Ernesto Arigasello', 'Alfaomega - Rama', 60000),
('Facebook y Twitter para adultos', 'Veloso Claudio', 'Alfaomega',52000),
('Creaci�n de un portal con php y mysql', 'Jacob Pav�n Puertas', 'Alfaomega - Rama', 40000),
('Administraci�n de sistemas operativos', 'Julio G�mez L�pez', 'Alfaomega - Rama', 55000);

select * from articulo;

insert into pedido values
(63502718, '2012-02-25', 120000),
(77191956, '2012-04-30', 55000),
(63502718, '2011-12-10', 260000),
(1098765789, '2012-02-25', 1800000);

select * from pedido;

insert into articulo_pedido
values
(1, 3, 5, 40000),
(1, 4, 12, 55000),
(2, 1, 5, 65000),
(3, 2, 10, 55000),
(3, 3, 12, 45000),
(4, 1, 20, 65000);

select * from articulo_pedido;

insert into compania values 
('800890890-2',  'Seguros Atlantida', 1998, 'Carlos L�pez'),
('899999999-1', 'Aseguradora Rojas', 1991, 'Luis Fernando Rojas'),
('899999999-5', 'Seguros del Estado', 2001, 'Mar�a Margarita P�rez')

select * from compania;

alter table tiposAutomotores add autnombre varchar (25);

insert into tiposAutomotores (auttipo, autnombre) values
(1, 'Autom�viles'),
(2, 'Camperos'),
(3, 'Camiones');

select * from tiposAutomotores;

insert into automotores values
('FLL420', 'chevrolet corsa',1, 2003, 5, 1400, 'wywzzz167kk009d25'),
('DKZ820', 'renault stepway',1, 2008, 5, 1600, 'wywwzz157kk009d45'),
('KJQ920', 'kia sportage' ,2, 2009, 7, 2000, 'wywzzz157kk009d25');

select * from automotores;

insert into aseguramientos values
('2012-09-30', '2013-09-30', 30000000, 'Vigente', 500000, 'FLL420'),
('2012-09-27', '2013-09-27', 35000000, 'Vigente', 600000, 'DKZ820'),
('2011-09-28', '2012-09-28', 50000000, 'Vigente', 800000, 'KJQ920');

select * from aseguramientos;

insert into incidentes values
( '2012-09-30', 'DKZ820', 'Bucaramanga', 0, 0, 2),
( '2012-09-27', 'FLL420', 'Gir�n', 1, 0, 1),
( '2011-09-28', 'FLL420', 'Bucaramanga', 1, 0, 2);

select * from incidentes;

-- 1. Mostrar los salarios de los profesores ordenados por categor�a.
	
	select cate_prof, sal_prof from profesor order by cate_prof asc;

-- 2. Mostrar los cursos cuyo valor sea mayor a $500.000.

	
	select * from curso where valor_cur > 500000;

-- 3. Contar el n�mero de estudiantes cuya edad sea mayor a 22.

	select count(*) from estudiante where edad_est > 22;

-- 4. Mostrar el nombre y la edad del estudiante m�s joven.

	select * from estudiante where edad_est = (select min(edad_est) from estudiante)

-- 5. Calcular el valor promedio de los cursos cuyas horas sean mayores a 40.

	select avg (valor_cur) from curso where horas_cur > 40;

-- 6. Obtener el sueldo promedio de los profesores de la categor�a 1.
	
	select avg(sal_prof) from profesor where cate_prof = 1;

-- 7. Mostrar todos los campos de la tabla curso en orden ascendente seg�n el valor.

	select * from curso order by valor_cur asc;

-- 8. Mostrar el nombre del profesor con menor sueldo.
	
	select * from profesor where sal_prof = (select min(sal_prof) from profesor)

-- 9. Visualizar los profesores cuyo sueldo este entre $500.000 y $700.000.
	
	select * from profesor where sal_prof between 500000 and 700000;

-- 10.Listar todos los pedidos realizados incluyendo el nombre del art�culo.

	select id_ped_artped, id_art_artped,tit_art, can_art_artped, val_ven_art_artped from articulo_pedido join articulo on id_art = id_art_artped;
	
-- 11.Visualizar los clientes que cumplen a�os en marzo.
	
	select * from cliente where mes_cum_cli = 'Marzo';

-- 12.Visualizar los datos del pedido 1, incluyendo el nombre del cliente, la direcci�n del mismo, el nombre y el valor de los art�culos que tiene dicho pedido.

	select nom_cli,dir_cli, tit_art, prec_art from pedido join cliente on id_cli = id_cli_ped join articulo_pedido on id_ped = id_ped_artped join articulo on id_art_artped = id_art;


-- 13.Visualizar el nombre del cliente, la fecha y el valor del pedido m�s costoso.

select nom_cli, fec_ped, val_ped from pedido join cliente on id_cli = id_cli_ped where val_ped = (select max(val_ped) from pedido);


-- 14.Mostrar cuantos art�culos se tienen de cada editorial.

SELECT COUNT(edi_art) FROM articulo;

--15.Mostrar los pedidos con los respectivos art�culos(c�digo, nombre, valor y cantidad pedida).

select id_art, tit_art, prec_art, can_art_artped, val_ven_art_artped from articulo join articulo_pedido on id_art = id_art_artped;


-- 16.Visualizar todos los clientes organizados por apellido.

	select * from cliente order by ape_cli;

-- 17.Visualizar todos los art�culos organizados por autor.

	select * from articulo order by aut_art;

-- 18.Visualizar los pedidos que se han realizado para el articulo con id 2, el listado debe mostrar el nombre y direcci�n del cliente, el respectivo n�mero de pedido y la cantidad solicitada.

	select nom_cli, ape_cli, dir_cli, id_ped, can_art_artped  from pedido join cliente on id_cli = id_cli_ped join articulo_pedido on id_ped = id_ped_artped join articulo on id_art_artped = id_art where id_art_artped = 2;

-- 19.Visualizar los datos de las empresas fundadas entre el a�o 1991 y 1998.

select * from compania where comaniofun between 1991 and 1998;

-- 20.Listar los todos datos de los automotores cuya p�liza expira en octubre de 2013, este reporte debe visualizar la placa, el modelo, la marca, n�mero de pasajeros, cilindraje
-- nombre de automotor, el valor de la p�liza y el valor asegurado.

select autoplaca, automodelo, automarca, autopasajeros, autocilindraje, asecosto from aseguramientos join automotores on aseplaca = autoplaca join  tiposAutomotores on auttipo = autotipo where year(asefechaexpiracion) = 2013 and month(asefechaexpiracion) = 09 

--21.Visualizar los datos de los incidentes ocurridos el 30 de septiembre de 2012, con su respectivo n�mero de p�liza, fecha de inicio de la p�liza, valor asegurado y valor de
--la p�liza.

select asecodigo, asefechainicio, asevalorasegurado, asecosto from incidentes join automotores on autoplaca = inciplaca join aseguramientos on aseplaca = inciplaca where incifecha = '2012-09-30';

--22.Visualizar los datos de los incidentes que han tenido un (1) herido, este reporte debe
--visualizar la placa del automotor, con los respectivos datos de la p�liza como son
--fecha de inicio, valor, estado y valor asegurado.

select autoplaca, asefechainicio, asecosto,aseestado,asevalorasegurado from incidentes join automotores on autoplaca = inciplaca join aseguramientos on aseplaca = inciplaca where inciantheridos = 1;

--23.Visualizar todos los datos de la p�liza m�s costosa.

select * from aseguramientos where asecosto = (select max(asecosto)from aseguramientos)

--24.Visualizar los incidentes con el m�nimo n�mero de autos involucrados, de este incidente

select * from incidentes where incicanautosinvolucrados = (select min (incicanautosinvolucrados )from incidentes);

--25.Visualizar el estado de la p�liza y el valor asegurado.

select aseestado, asevalorasegurado from aseguramientos

--26.Visualizar los incidentes del veh�culo con placas " FLL420", este reporte debe visualizar
--la fecha, el lugar, la cantidad de heridos del incidente, la fecha de inicio la de expiraci�n
--de la p�liza y el valor asegurado.

select incifecha, incilugar, inciantheridos, asefechainicio, asefechaexpiracion, asevalorasegurado from incidentes join aseguramientos on aseplaca = inciplaca where inciplaca = 'FLL420'


--27.Visualizar los datos de la empresa con nit 899999999-5.

select * from compania where comnit = '899999999-5'

--28.Visualizar los datos de la p�liza cuyo valor asegurado es el m�s costoso, este reporte
--adem�s de visualizar todos los datos de la p�liza, debe presentar todos los datos del
--veh�culo que tiene dicha p�liza.

select * from aseguramientos join automotores on aseplaca = autoplaca where asecosto = (select max(asecosto) from aseguramientos);

--29.Visualizar los datos de las p�lizas de los automotores tipo 1, este reporte debe incluir
--placa, marca, modelo, cilindraje del veh�culo junto con la fecha de inicio, de finalizaci�n
--y estado de la p�liza.

select autoplaca, automarca, automodelo, autocilindraje, asefechainicio, asefechaexpiracion from aseguramientos join automotores on autoplaca = aseplaca join tiposAutomotores on autotipo = auttipo where autotipo = 1;

--- a. Dise�a un procedimientos almacenados para crear, editar, eliminar un registro en la tablas Compa�ia, Cliente, CURSO

---Procedimientos de compania ---

create proc insertarCompania
@comnit varchar(11),
@comnombre varchar(30),
@comaniofun int,
@comreplegal varchar(100)
as 
begin
insert into compania values (@comnit,@comnombre,@comaniofun,@comreplegal);
end;

exec insertarCompania '12345678901','InnovaTech Solutions',2020,'Juan Perez';

create proc actualizarCompania
@comnit varchar(11),
@comnombre varchar(30),
@comaniofun int,
@comreplegal varchar(100)
as
begin
update compania set comnombre =@comnombre, comaniofun = @comaniofun, comreplegal = @comreplegal where comnit = @comnit
end

exec actualizarCompania '800890890-2', 'Seguros Colombia', 2001, 'Carlos Martinez'

create proc eliminarCompania 
@comnit varchar(11)
as 
begin
delete from compania where comnit = @comnit  
end

exec eliminarCompania '899999999-1'

----------------------------------------------

---Procedimientos de Cliente ---

create proc insertarCliente
@id_cli varchar (11),
@nom_cli varchar (30),
@ape_cli varchar (30),
@dir_cli varchar (100),
@dep_cli varchar (20),
@mes_cum_cli varchar (10)
as 
begin 
insert into cliente values(@id_cli, @nom_cli,@ape_cli,@dir_cli,@dep_cli,@mes_cum_cli);
end

exec insertarCliente '12345678901','Ana','Gonzalez','Calle Principal #123','Bogot�','Febrero';

create proc actualizarCliente
@id_cli varchar (11),
@nom_cli varchar (30),
@ape_cli varchar (30),
@dir_cli varchar (100),
@dep_cli varchar (20),
@mes_cum_cli varchar (10)
as 
begin 
update cliente set nom_cli = @nom_cli, ape_cli = @ape_cli, dir_cli = @dir_cli, dep_cli = @dep_cli, mes_cum_cli = @mes_cum_cli where id_cli = @id_cli 
end

exec actualizarCliente '13890234','Royer','Julio','Cra 14 No. 85-74','Armenia','Abril';

create proc eliminarCliente
@id_cli varchar (11)
as 
begin 
delete from cliente where id_cli = @id_cli;
end

exec eliminarCliente '12345678901';

-----------------------------------------------------


---Procedimientos de curso ---
set identity_insert curso OFF;

create proc insertarCurso 
@nom_cur varchar(100),
@horas_cur int,
@valor_cur int
as 
begin
insert into curso values (@nom_cur,@horas_cur,@valor_cur)
end

exec insertarCurso 'Programaci�n en Python',40,300000;

create proc actualizarCurso
@cod_cur int,
@nom_cur varchar(100),
@horas_cur int,
@valor_cur int
as 
begin
update curso set nom_cur = @nom_cur, horas_cur = @horas_cur, valor_cur = @valor_cur where cod_cur = @cod_cur
end

exec actualizarCurso 289011,'Manejo de SQL',52,450000;

create proc eliminarCurso
@cod_cur int
as 
begin
delete from curso where cod_cur = @cod_cur
end

exec eliminarCurso 345672;

----------------------------------------------------



--- b. Cree 50 registros para cada una de las tablas con datos variados (para todas).

-- Inserciones en la tabla de profesor 

INSERT INTO profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) VALUES
('12345678901', 'Juan', 'Gonz�lez', 1, 30000),
('23456789012', 'Mar�a', 'L�pez', 2, 40000),
('34567890123', 'Carlos', 'Mart�nez', 3, 50000),
('45678901234', 'Laura', 'Fern�ndez', 2, 45000),
('56789012345', 'Luis', 'P�rez', 1, 32000),
('67890123456', 'Ana', 'Ram�rez', 4, 60000),
('78901234567', 'David', 'Rodr�guez', 3, 52000),
('89012345678', 'Sof�a', 'G�mez', 1, 31000),
('90123456789', 'Diego', 'D�az', 2, 42000),
('01234567890', 'Paula', 'Hern�ndez', 1, 33000),
('11227344559', 'Miguel', 'Torres', 4, 62000),
('91334455611', 'Carmen', 'S�nchez', 3, 54000),
('65445576778', 'Javier', 'L�pez', 2, 43000),
('486377889', 'Elena', 'Guti�rrez', 1, 34000),
('55637728990', 'Pedro', 'Fern�ndez', 3, 52000),
('63778899011', 'Isabel', 'Gonz�lez', 2, 42000),
('72889501122', 'Alejandro', 'P�rez', 1, 33000),
('81990011223', 'Raquel', 'Mart�nez', 4, 64000),
('93001112234', 'Pablo', 'Ram�rez', 3, 55000),
('03111223345', 'Eva', 'Soto', 2, 44000),
('16223344586', 'Jorge', 'L�pez', 1, 35000),
('21334455667', 'Luc�a', 'Torres', 4, 66000),
('32445566778', 'Roberto', 'Garc�a', 3, 57000),
('44556677889', 'Silvia', 'S�nchez', 2, 46000),
('53667788990', 'Fernando', 'D�az', 1, 36000),
('62773899011', 'Patricia', 'Hern�ndez', 3, 54000),
('74889901122', 'Daniel', 'G�mez', 2, 45000),
('83930011223', 'Alicia', 'P�rez', 1, 37000),
('92001112294', 'Andr�s', 'L�pez', 4, 68000),
('04151223345', 'Teresa', 'Fern�ndez', 3, 58000),
('19223344556', 'Ricardo', 'Mart�nez', 2, 47000),
('26394455667', 'Cristina', 'Ram�rez', 1, 38000),
('35445166778', 'V�ctor', 'Gonz�lez', 3, 56000),
('42586677889', 'Beatriz', 'S�nchez', 2, 46000),
('53667688990', 'Joaqu�n', 'D�az', 1, 37000),
('61728899011', 'Marcela', 'L�pez', 4, 70000),
('72819901123', 'H�ctor', 'P�rez', 3, 59000),
('84960011223', 'Carolina', 'Mart�nez', 2, 48000),
('98101112234', 'Roberto', 'Fern�ndez', 1, 39000),
('00121223345', 'Natalia', 'Ram�rez', 3, 57000),
('46223344556', 'Jos�', 'Garc�a', 2, 46000),
('29334455667', 'M�nica', 'Soto', 1, 40000),
('33445556778', 'Federico', 'L�pez', 4, 72000),
('42556677889', 'Lorena', 'Torres', 3, 61000),
('52669788990', 'Federico', 'G�mez', 2, 49000),
('62777899011', 'Liliana', 'P�rez', 1, 41000),
('71888901122', 'Adri�n', 'Mart�nez', 3, 59000),
('82991011223', 'Mariana', 'Fern�ndez', 2, 47000),
('99001112234', 'Gonzalo', 'Ram�rez', 1, 42000),
('14222344559', 'Julieta', 'G�mez', 3, 55000);

-- Inserciones en la tabla de cursos 

INSERT INTO curso (nom_cur, horas_cur, valor_cur) VALUES
('Introducci�n a la Programaci�n', 40, 500),
('Dise�o Web Avanzado', 60, 800),
('Gesti�n de Proyectos', 45, 600),
('Marketing Digital', 50, 700),
('Desarrollo de Aplicaciones M�viles', 55, 900),
('Inteligencia Artificial', 70, 1100),
('Dise�o Gr�fico', 35, 450),
('Ingl�s Avanzado', 80, 1200),
('Dise�o de Interiores', 60, 800),
('Fotograf�a Digital', 30, 400),
('Finanzas Corporativas', 55, 700),
('Cocina Gourmet', 40, 600),
('Rob�tica', 65, 1000),
('Desarrollo de Videojuegos', 50, 750),
('Redes de Computadoras', 45, 550),
('Derecho Laboral', 70, 950),
('Econom�a Global', 40, 600),
('Gesti�n de Recursos Humanos', 60, 800),
('Marketing de Contenidos', 35, 450),
('Arquitectura Sostenible', 65, 950),
('Gesti�n de Proyectos de Construcci�n', 50, 700),
('Dise�o de Moda', 55, 750),
('Big Data Analytics', 75, 1200),
('Psicolog�a del Deporte', 40, 550),
('Dise�o de Jardines', 45, 600),
('Historia del Arte', 30, 400),
('Marketing de Redes Sociales', 50, 700),
('Emprendimiento y Startups', 60, 900),
('Dise�o de Joyer�a', 35, 500),
('Medicina Natural', 80, 1100),
('F�sica Cu�ntica', 70, 1000),
('Cine Documental', 40, 600),
('Neurociencia Cognitiva', 55, 750),
('M�sica Cl�sica', 45, 550),
('Introducci�n a la Astronom�a', 50, 700),
('Nutrici�n y Diet�tica', 60, 800),
('Historia de la Filosof�a', 70, 950),
('M�rketing Deportivo', 35, 450),
('Dise�o de Tatuajes', 65, 900),
('Arqueolog�a Antigua', 40, 600),
('Gastronom�a Molecular', 45, 550),
('Dise�o de Logotipos', 55, 750),
('Introducci�n a la Psicolog�a', 30, 400),
('Dise�o de Interacci�n', 50, 700),
('Dise�o de Mobiliario', 60, 800),
('M�sica Electr�nica', 70, 1000),
('Bioqu�mica Avanzada', 80, 1100),
('Cine Experimental', 40, 600),
('Filosof�a Existencialista', 55, 750),
('Historia Antigua', 35, 500);

-- Inserciones en la tabla de estudiantes 

INSERT INTO estudiante (doc_est, nom_est, ape_est, edad_est) VALUES
('10010010010', 'Juan', 'Gonz�lez', 20),
('20020020020', 'Mar�a', 'L�pez', 22),
('30030030030', 'Carlos', 'Mart�nez', 21),
('40040040040', 'Laura', 'Fern�ndez', 23),
('50050050050', 'Luis', 'P�rez', 19),
('60060060060', 'Ana', 'Ram�rez', 20),
('70070070070', 'David', 'Rodr�guez', 22),
('80080080080', 'Sof�a', 'G�mez', 21),
('90090090090', 'Diego', 'D�az', 19),
('10101010101', 'Paula', 'Hern�ndez', 20),
('11111111111', 'Miguel', 'Torres', 22),
('12121212121', 'Carmen', 'S�nchez', 21),
('13131313131', 'Javier', 'L�pez', 23),
('14141414141', 'Elena', 'Guti�rrez', 19),
('15151515151', 'Pedro', 'Fern�ndez', 20),
('16161616161', 'Isabel', 'Gonz�lez', 22),
('17171717171', 'Alejandro', 'P�rez', 21),
('18181818181', 'Raquel', 'Mart�nez', 23),
('19191919191', 'Pablo', 'Ram�rez', 20),
('20202020202', 'Eva', 'Soto', 22),
('21212121212', 'Jorge', 'L�pez', 21),
('22222222222', 'Luc�a', 'Torres', 19),
('23232323232', 'Roberto', 'Garc�a', 20),
('24242424242', 'Silvia', 'S�nchez', 23),
('25252525252', 'Fernando', 'D�az', 21),
('26262626262', 'Patricia', 'Hern�ndez', 22),
('27272727272', 'Daniel', 'G�mez', 20),
('28282828282', 'Alicia', 'P�rez', 19),
('29292929292', 'Andr�s', 'L�pez', 22),
('30303030303', 'Teresa', 'Fern�ndez', 21),
('31313131313', 'Ricardo', 'Mart�nez', 23),
('32323232323', 'Cristina', 'Ram�rez', 20),
('33333333333', 'V�ctor', 'Gonz�lez', 22),
('34343434343', 'Beatriz', 'S�nchez', 21),
('35353535353', 'Joaqu�n', 'D�az', 19),
('36363636363', 'Marcela', 'L�pez', 20),
('37373737373', 'H�ctor', 'P�rez', 22),
('38383838383', 'Carolina', 'Mart�nez', 21),
('39393939393', 'Roberto', 'Fern�ndez', 23),
('40404040404', 'Natalia', 'Ram�rez', 19),
('41414141414', 'Jos�', 'Garc�a', 20),
('42424242424', 'M�nica', 'Soto', 22),
('43434343434', 'Federico', 'L�pez', 21),
('44444444444', 'Lorena', 'Torres', 23),
('45454545454', 'Federico', 'G�mez', 20),
('46464646464', 'Liliana', 'P�rez', 22),
('47474747474', 'Adri�n', 'Mart�nez', 21),
('48484848484', 'Mariana', 'Fern�ndez', 19),
('49494949494', 'Gonzalo', 'Ram�rez', 20),
('50505050505', 'Camila', 'Mart�nez', 22);


-- Inserciones en la tabla de estudiante_curso 

INSERT INTO estudiante_curso (cod_cur_estcur, doc_est_estcur, fec_ini_est_cur) VALUES
(149842, '1.098.098.097', '2023-09-01'),
(250067, '1.098.765.679', '2023-08-15'),
(345671, '10010010010', '2023-01-20'),
(345671, '10101010101', '2023-07-20'),
(345673, '11111111111', '2023-04-22'),
(345674, '12121212121', '2023-07-21'),
(345675, '13131313131', '2023-03-23'),
(345676, '14141414141', '2023-07-19'),
(345677, '15151515151', '2023-01-20'),
(345678, '16161616161', '2023-07-22'),
(345679, '17171717171', '2023-10-21'),
(345680, '18181818181', '2023-07-23'),
(345681, '19191919191', '2023-08-20'),
(345682, '20020020020', '2023-04-22'),
(345683, '20202020202', '2023-07-22'),
(345684, '21212121212', '2023-07-21'),
(345685, '22222222222', '2023-01-19'),
(345686, '23232323232', '2023-01-20'),
(345687, '24242424242', '2023-07-23'),
(345688, '25252525252', '2023-07-21'),
(345689, '26262626262', '2023-12-20'),
(345690, '27272727272', '2023-07-20'),
(345691, '28282828282', '2023-11-19'),
(345692, '29292929292', '2023-08-22'),
(345693, '30030030030', '2023-07-21'),
(345694, '30303030303', '2023-07-21'),
(345695, '31313131313', '2023-10-23'),
(345696, '32323232323', '2023-07-20'),
(345697, '33333333333', '2023-12-22'),
(345698, '34343434343', '2023-07-21'),
(345699, '35353535353', '2023-11-19'),
(345700, '36363636363', '2023-07-20'),
(345701, '37373737373', '2023-05-22'),
(345702, '38383838383', '2023-09-21'),
(345703, '39393939393', '2023-05-23'),
(345704, '40040040040', '2023-07-23'),
(345705, '40404040404', '2023-02-19'),
(345706, '41414141414', '2023-07-20'),
(345707, '42424242424', '2023-06-22'),
(345708, '43434343434', '2023-09-21'),
(345709, '44444444444', '2023-07-23'),
(345710, '45454545454', '2023-06-20'),
(345711, '46464646464', '2023-07-22'),
(345712, '47474747474', '2023-03-21'),
(345713, '48484848484', '2023-07-19'),
(345714, '49494949494', '2023-04-20'),
(345715, '50050050050', '2023-07-19'),
(345716, '50505050505', '2023-05-22'),
(345717, '60060060060', '2023-06-20'),
(345718, '63.502.720', '2023-08-15'),
(345719, '70070070070', '2023-06-22'),
(345720, '80080080080', '2023-03-21'),
(345721, '90090090090', '2023-02-19'),
(345721, '91.245.678', '2023-01-22');


-- Inserciones en la tabla de clientes 

INSERT INTO cliente (id_cli, nom_cli, ape_cli, dir_cli, dep_cli, mes_cum_cli) VALUES
('10010010010', 'Juan', 'Gonz�lez', '123 Main Street, Apt. 4A', 'New York', 'Enero'),
('20020020020', 'Mar�a', 'L�pez', '456 Elm Street, Suite 301', 'Los Angeles', 'Febrero'),
('30030030030', 'Carlos', 'Mart�nez', '789 Oak Avenue, Unit 2B', 'Chicago', 'Marzo'),
('40040040040', 'Laura', 'Fern�ndez', '321 Pine Lane, #205', 'Houston', 'Abril'),
('50050050050', 'Luis', 'P�rez', '654 Maple Drive, Apt. 6C', 'Miami', 'Mayo'),
('60060060060', 'Ana', 'Ram�rez', '987 Birch Road, Suite 101', 'San Francisco', 'Junio'),
('70070070070', 'David', 'Rodr�guez', '246 Cedar Street, #3D', 'Seattle', 'Julio'),
('80080080080', 'Sof�a', 'G�mez', '753 Spruce Court, Apt. 8E', 'Atlanta', 'Agosto'),
('90090090090', 'Diego', 'D�az', '1357 Redwood Lane, Unit 5F', 'Dallas', 'Septiembre'),
('10101010101', 'Paula', 'Hern�ndez', '489 Oakwood Drive, #202', 'Boston', 'Octubre'),
('11111111111', 'Miguel', 'Torres', '874 Magnolia Avenue, Suite 3G', 'Philadelphia', 'Noviembre'),
('12121212121', 'Carmen', 'S�nchez', '567 Pine Street, Apt. 7H', 'Phoenix', 'Diciembre'),
('13131313131', 'Javier', 'L�pez', '987 Elm Street, Apt. 4A', 'San Diego', 'Enero'),
('14141414141', 'Elena', 'Guti�rrez', '234 Maple Drive, #301', 'Denver', 'Febrero'),
('15151515151', 'Pedro', 'Fern�ndez', '654 Oak Avenue, Unit 2B', 'Detroit', 'Marzo'),
('16161616161', 'Isabel', 'Gonz�lez', '789 Pine Lane, #205', 'Seattle', 'Abril'),
('17171717171', 'Alejandro', 'P�rez', '321 Birch Road, Suite 101', 'Chicago', 'Mayo'),
('18181818181', 'Raquel', 'Mart�nez', '753 Cedar Street, #3D', 'San Francisco', 'Junio'),
('19191919191', 'Pablo', 'Ram�rez', '1357 Spruce Court, Apt. 8E', 'Miami', 'Julio'),
('20202020202', 'Eva', 'Soto', '489 Redwood Lane, Unit 5F', 'Houston', 'Agosto'),
('21212121212', 'Jorge', 'L�pez', '874 Oakwood Drive, #202', 'Los Angeles', 'Septiembre'),
('22222222222', 'Luc�a', 'Torres', '567 Magnolia Avenue, Suite 3G', 'New York', 'Octubre'),
('23232323232', 'Roberto', 'Garc�a', '246 Pine Street, Apt. 7H', 'Boston', 'Noviembre'),
('24242424242', 'Silvia', 'S�nchez', '987 Elm Street, Apt. 4A', 'Dallas', 'Diciembre'),
('25252525252', 'Fernando', 'D�az', '234 Maple Drive, #301', 'Phoenix', 'Enero'),
('26262626262', 'Patricia', 'Hern�ndez', '654 Oak Avenue, Unit 2B', 'Philadelphia', 'Febrero'),
('27272727272', 'Daniel', 'G�mez', '789 Pine Lane, #205', 'Detroit', 'Marzo'),
('28282828282', 'Alicia', 'P�rez', '321 Birch Road, Suite 101', 'Denver', 'Abril'),
('29292929292', 'Andr�s', 'L�pez', '753 Cedar Street, #3D', 'San Diego', 'Mayo'),
('30303030303', 'Teresa', 'Fern�ndez', '1357 Spruce Court, Apt. 8E', 'San Francisco', 'Junio'),
('31313131313', 'Ricardo', 'Mart�nez', '489 Redwood Lane, Unit 5F', 'Seattle', 'Julio'),
('32323232323', 'Cristina', 'Ram�rez', '874 Oakwood Drive, #202', 'Atlanta', 'Agosto'),
('33333333333', 'V�ctor', 'Gonz�lez', '567 Magnolia Avenue, Suite 3G', 'Miami', 'Septiembre'),
('34343434343', 'Beatriz', 'S�nchez', '246 Pine Street, Apt. 7H', 'New York', 'Octubre'),
('35353535353', 'Joaqu�n', 'D�az', '987 Elm Street, Apt. 4A', 'Los Angeles', 'Noviembre'),
('36363636363', 'Marcela', 'L�pez', '234 Maple Drive, #301', 'Chicago', 'Diciembre'),
('37373737373', 'H�ctor', 'P�rez', '654 Oak Avenue, Unit 2B', 'Houston', 'Enero'),
('38383838383', 'Carolina', 'Mart�nez', '789 Pine Lane, #205', 'Miami', 'Febrero'),
('39393939393', 'Roberto', 'Fern�ndez', '321 Birch Road, Suite 101', 'San Francisco', 'Marzo'),
('40404040404', 'Natalia', 'Ram�rez', '753 Cedar Street, #3D', 'Los Angeles', 'Abril'),
('41414141414', 'Jos�', 'Garc�a', '1357 Spruce Court, Apt. 8E', 'Phoenix', 'Mayo'),
('42424242424', 'M�nica', 'Soto', '489 Redwood Lane, Unit 5F', 'San Diego', 'Junio'),
('43434343434', 'Federico', 'L�pez', '874 Oakwood Drive, #202', 'Detroit', 'Julio'),
('44444444444', 'Lorena', 'Torres', '567 Magnolia Avenue, Suite 3G', 'Seattle', 'Agosto'),
('45454545454', 'Federico', 'G�mez', '246 Pine Street, Apt. 7H', 'Denver', 'Septiembre'),
('46464646464', 'Liliana', 'P�rez', '987 Elm Street, Apt. 4A', 'Atlanta', 'Octubre'),
('47474747474', 'Adri�n', 'Mart�nez', '234 Maple Drive, #301', 'Chicago', 'Noviembre'),
('48484848484', 'Mariana', 'Fern�ndez', '654 Oak Avenue, Unit 2B', 'New York', 'Diciembre'),
('49494949494', 'Gonzalo', 'Ram�rez', '789 Pine Lane, #205', 'Los Angeles', 'Enero'),
('50505050505', 'Camila', 'G�mez', '321 Birch Road, Suite 101', 'Chicago', 'Febrero');


-- Inserciones en la tabla de articulo 

INSERT INTO articulo (tit_art, aut_art, edi_art, prec_art) VALUES
('Introducci�n a la Programaci�n en Python', 'Juan P�rez', 'Editorial Pearson', 25000),
('Dise�o Web Avanzado', 'Mar�a L�pez', 'Editorial McGraw-Hill', 35000),
('Gesti�n de Proyectos �giles', 'Carlos Mart�nez', 'Editorial Wiley', 40000),
('Marketing Digital: Estrategias Efectivas', 'Laura Fern�ndez', 'Editorial Springer', 30000),
('Desarrollo de Aplicaciones M�viles', 'Luis P�rez', 'Editorial O Reilly', 45000),
('Inteligencia Artificial para Principiantes', 'Ana Ram�rez', 'Editorial Addison-Wesley', 55000),
('Dise�o Gr�fico Creativo', 'David Rodr�guez', 'Editorial Apress', 35000),
('Ingl�s Avanzado: Conversaci�n y Gram�tica', 'Sof�a G�mez', 'Editorial Cambridge University Press', 40000),
('Dise�o de Interiores: Tendencias Actuales', 'Diego D�az', 'Editorial Taschen', 45000),
('Fotograf�a Digital: T�cnicas y Composici�n', 'Paula Hern�ndez', 'Editorial National Geographic', 30000),
('Finanzas Corporativas: Estrategias Empresariales', 'Miguel Torres', 'Editorial Harvard Business Review', 50000),
('Cocina Gourmet: Recetas de Autor', 'Carmen S�nchez', 'Editorial Random House', 60000),
('Rob�tica: Construye y Programa Tu Robot', 'Javier L�pez', 'Editorial MIT Press', 55000),
('Desarrollo de Videojuegos: Desde Cero', 'Elena Guti�rrez', 'Editorial Ubisoft', 40000),
('Redes de Computadoras: Teor�a y Pr�ctica', 'Pedro Fern�ndez', 'Editorial Cisco Press', 50000),
('Derecho Laboral: Normativas y Casos Pr�cticos', 'Isabel Gonz�lez', 'Editorial West Academic Publishing', 35000),
('Econom�a Global: Perspectivas y An�lisis', 'Alejandro P�rez', 'Editorial Princeton University Press', 45000),
('Marketing de Contenidos: Estrategias Digitales', 'Raquel Mart�nez', 'Editorial John Wiley & Sons', 30000),
('Arquitectura Sostenible: Dise�o Ecol�gico', 'Pablo Ram�rez', 'Editorial Rizzoli', 65000),
('Gesti�n de Proyectos de Construcci�n', 'Eva Soto', 'Editorial Prentice Hall', 55000),
('Dise�o de Moda: Tendencias y Estilos', 'Jorge L�pez', 'Editorial Phaidon', 50000),
('Big Data Analytics: An�lisis de Datos Masivos', 'Luc�a Torres', 'Editorial Springer Nature', 75000),
('Psicolog�a del Deporte: Rendimiento y Motivaci�n', 'Roberto Garc�a', 'Editorial Taylor & Francis', 40000),
('Dise�o de Jardines: Creatividad y Paisajismo', 'Silvia S�nchez', 'Editorial Bloomsbury', 35000),
('Historia del Arte: Grandes �pocas y Movimientos', 'Fernando D�az', 'Editorial Abrams', 55000),
('Marketing de Redes Sociales: Estrategias Digitales', 'Patricia Hern�ndez', 'Editorial Palgrave Macmillan', 30000),
('Emprendimiento y Startups: Claves para el �xito', 'Daniel G�mez', 'Editorial Routledge', 60000),
('Dise�o de Joyer�a: Creaci�n y Estilo', 'Alicia P�rez', 'Editorial Thames & Hudson', 45000),
('Medicina Natural: Terapias y Remedios', 'Andr�s L�pez', 'Editorial Springer', 40000),
('F�sica Cu�ntica: Conceptos y Aplicaciones', 'Teresa Fern�ndez', 'Editorial Princeton University Press', 65000),
('Cine Documental: Realizaci�n y Producci�n', 'Ricardo Mart�nez', 'Editorial Wiley', 50000),
('Neurociencia Cognitiva: Cerebro y Comportamiento', 'Cristina Ram�rez', 'Editorial MIT Press', 55000),
('M�sica Cl�sica: Historia y Compositores', 'V�ctor Gonz�lez', 'Editorial Oxford University Press', 30000),
('Introducci�n a la Astronom�a: El Universo Revelado', 'Beatriz S�nchez', 'Editorial National Geographic', 35000),
('Nutrici�n y Diet�tica: Salud y Bienestar', 'Joaqu�n D�az', 'Editorial Elsevier', 40000),
('Historia de la Filosof�a: Grandes Pensadores', 'Marcela L�pez', 'Editorial Penguin Random House', 45000),
('M�rketing Deportivo: Estrategias y Patrocinio', 'H�ctor P�rez', 'Editorial Pearson', 55000),
('Dise�o de Tatuajes: Arte en la Piel', 'Carolina Mart�nez', 'Editorial Taschen', 60000),
('Arqueolog�a Antigua: Descubrimientos y Culturas', 'Roberto Fern�ndez', 'Editorial Bloomsbury', 50000),
('Gastronom�a Molecular: Ciencia en la Cocina', 'Natalia Ram�rez', 'Editorial Rizzoli', 45000),
('Dise�o de Logotipos: Identidad Corporativa', 'Jos� Garc�a', 'Editorial Prentice Hall', 40000),
('Introducci�n a la Psicolog�a: Conceptos Fundamentales', 'M�nica Soto', 'Editorial Cambridge University Press', 30000),
('Dise�o de Interacci�n: UX y Usabilidad', 'Federico L�pez', 'Editorial Springer Nature', 35000),
('Dise�o de Mobiliario: Creatividad y Funcionalidad', 'Lorena Torres', 'Editorial John Wiley & Sons', 45000),
('M�sica Electr�nica: Creaci�n y Producci�n', 'Federico G�mez', 'Editorial Abrams', 55000),
('Bioqu�mica Avanzada: Ciencia y Descubrimientos', 'Liliana P�rez', 'Editorial Taylor & Francis', 60000),
('Cine Experimental: Vanguardia y Experimentaci�n', 'Adri�n Mart�nez', 'Editorial Palgrave Macmillan', 50000),
('Filosof�a Existencialista: Pensadores y Reflexiones', 'Mariana Fern�ndez', 'Editorial Routledge', 45000),
('Dise�o de Calzado: Estilo y Comodidad', 'Gonzalo Ram�rez', 'Editorial Thames & Hudson', 40000),
('Introducci�n a la Astronom�a: Descubre el Universo', 'Camila G�mez', 'Editorial Wiley', 50000);


-- Inserciones en la tabla de pedidos

INSERT INTO pedido (id_cli_ped, fec_ped, val_ped) VALUES
('10010010010', '2023-01-15', 50000),
('10101010101', '2023-10-10', 75000),
('1098765789', '2023-03-22', 90000),
('11111111111', '2023-11-05', 120000),
('12121212121', '2023-12-30', 60000),
('13131313131', '2023-01-02', 80000),
('13890234', '2023-04-12', 100000),
('14141414141', '2023-02-05', 45000),
('15151515151', '2023-03-20', 70000),
('16161616161', '2023-04-15', 110000),
('17171717171', '2023-05-08', 85000),
('18181818181', '2023-06-01', 60000),
('19191919191', '2023-07-12', 130000),
('20020020020', '2023-02-20', 75000),
('20202020202', '2023-08-05', 95000),
('21212121212', '2023-09-10', 120000),
('22222222222', '2023-10-17', 55000),
('23232323232', '2023-11-22', 70000),
('24242424242', '2023-12-05', 85000),
('25252525252', '2023-01-10', 95000),
('26262626262', '2023-02-15', 80000),
('27272727272', '2023-03-20', 120000),
('28282828282', '2023-04-25', 70000),
('29292929292', '2023-05-30', 110000),
('30030030030', '2023-03-05', 60000),
('30303030303', '2023-06-10', 130000),
('31313131313', '2023-07-15', 95000),
('32323232323', '2023-08-20', 85000),
('33333333333', '2023-09-25', 75000),
('34343434343', '2023-10-30', 60000),
('35353535353', '2023-11-15', 110000),
('36363636363', '2023-12-20', 70000),
('37373737373', '2023-01-25', 120000),
('38383838383', '2023-02-28', 80000),
('39393939393', '2023-03-05', 95000),
('40040040040', '2023-04-10', 70000),
('40404040404', '2023-04-15', 60000),
('41414141414', '2023-05-20', 120000),
('42424242424', '2023-06-25', 70000),
('43434343434', '2023-07-30', 110000),
('44444444444', '2023-08-05', 60000),
('45454545454', '2023-09-10', 120000),
('46464646464', '2023-10-15', 70000),
('47474747474', '2023-11-20', 80000),
('48484848484', '2023-12-25', 110000),
('49494949494', '2023-01-01', 60000),
('50050050050', '2023-05-05', 120000),
('60060060060', '2023-06-10', 70000),
('63502718', '2023-04-02', 90000),
('70070070070', '2023-07-05', 75000),
('77191956', '2023-03-15', 110000),
('80080080080', '2023-08-22', 95000),
('90090090090', '2023-09-17', 80000);


-- Inserciones en la tabla de articulo_pedido

INSERT INTO articulo_pedido (id_ped_artped, id_art_artped, can_art_artped, val_ven_art_artped) VALUES
(1, 1, 5, 250000),
(2, 2, 3, 156000),
(3, 3, 1, 400000),
(4, 4, 2, 110000),
(5, 5, 1, 25000),
(6, 6, 4, 140000),
(7, 7, 7, 280000),
(8, 8, 6, 180000),
(9, 9, 2, 90000),
(10, 10, 5, 275000),
(11, 11, 3, 105000),
(12, 12, 4, 360000),
(13, 13, 4, 160000),
(14, 14, 8, 240000),
(15, 15, 5, 250000),
(16, 16, 7, 420000),
(17, 17, 2, 100000),
(18, 18, 6, 240000),
(19, 19, 4, 200000),
(20, 20, 8, 280000),
(21, 21, 3, 165000),
(22, 22, 4, 280000),
(23, 23, 2, 170000),
(24, 24, 6, 570000),
(25, 25, 1, 50000),
(26, 26, 5, 375000),
(27, 27, 4, 280000),
(28, 28, 7, 385000),
(29, 29, 8, 280000),
(30, 30, 3, 90000),
(31, 31, 5, 275000),
(32, 32, 6, 510000),
(33, 33, 7, 420000),
(34, 34, 2, 120000),
(35, 35, 4, 440000),
(36, 36, 5, 275000),
(37, 37, 2, 108000),
(38, 38, 2, 150000),
(39, 39, 1, 40000),
(40, 40, 6, 240000),
(41, 41, 8, 480000),
(42, 42, 3, 180000),
(43, 43, 4, 200000),
(44, 44, 6, 660000),
(45, 45, 7, 490000),
(46, 46, 8, 240000),
(47, 47, 5, 275000),
(48, 48, 3, 240000),
(49, 49, 7, 385000),
(50, 50, 4, 200000);

-- Inserciones de datos en la tabla compania 

INSERT INTO compania (comnit, comnombre, comaniofun, comreplegal) VALUES
('12345655901', 'Empresas Urbanas', 2000, 'Juan P�rez'),
('98765466109', 'Compa��a de software dist', 1995, 'Ana Rodr�guez'),
('56789077345', 'Corporaci�n sanitas', 2010, 'Carlos S�nchez'),
('32109888543', 'CorpTech Solutions', 2005, 'Mar�a G�mez'),
('23456799012', 'Industrias Alpha', 2002, 'Luis Mart�nez'),
('45678910234', 'Innovate Corp', 2008, 'Elena Ram�rez'),
('89012311678', 'Solutions Inc.', 2012, 'Pedro Vargas'),
('65432222876', 'MegaTech Group', 2007, 'Laura L�pez'),
('43210933654', 'Global Innovations', 2011, 'Ricardo Fern�ndez'),
('78901244567', 'Nueva Empresa Rest SA', 2013, 'Carmen Torres'),
('21098755432', 'Futuro Corp', 2006, 'Roberto Ruiz'),
('98701266567', 'Inversiones Futuras', 2015, 'Sof�a Soto'),
('65432977876', 'Visionary Co.', 2003, 'Alejandro Gonz�lez'),
('54321088765', 'Dynamic Empresarial', 2004, 'Patricia Herrera'),
('34567899123', 'InnovaTech Solutions', 2001, 'Daniel D�az'),
('12345677901', 'EcoCorp', 2009, 'Carolina Castro'),
('43210966654', 'Reful Visi�n SA', 2014, 'Antonio Mendoza'),
('89012355678', 'Prime Innovations', 1998, 'Isabel Navarro'),
('65432644876', 'TechPro Inc.', 2016, 'Hugo Jim�nez'),
('98701233567', 'GlobalTech Group', 1997, 'Monica Rivera'),
('45678922234', 'Colcafe Empresarial', 1999, 'Juan Carlos L�pez'),
('56789011345', 'Nueva Era Corp', 2017, 'Marta Silva'),
('23456700012', 'InnovaSoluciones', 1996, 'Alberto P�rez'),
('78901288567', 'CorpEstrategia', 2018, 'Silvia Ortiz'),
('21098766432', 'VisionCorp', 1994, 'Javier Fern�ndez'),
('54321088765', 'Sistema Global', 1993, 'Andrea S�nchez'),
('98765412109', 'Evoluci�n Empresarial', 1992, 'Rafael L�pez'),
('12345688901', 'Nueva Oportunidad SA', 1991, 'Natalia Garc�a'),
('45678977234', 'CorpTech Solutions', 1990, 'Jorge Torres'),
('65432100876', 'Innovaci�n y C�a', 1989, 'Cecilia Ram�rez'),
('89012311678', 'Solutions Global TIC', 1988, 'Fernando M�ndez'),
('98701222567', 'Empresarios Unidos', 1987, 'Luc�a Gonz�lez'),
('34567833123', 'TechInnovate Inc.', 1986, 'Ra�l Mendoza'),
('23456744012', 'Estrategia Global', 1985, 'M�nica Vargas'),
('43210955654', 'CorpVision', 1984, 'H�ctor Soto'),
('78901266567', 'Tunja Express SA', 1983, 'Carmen Ruiz'),
('21098777432', 'InnovaEmpresarial', 1982, 'Roberto P�rez'),
('98765888109', 'Soluciones Futuras', 1981, 'Sof�a Mart�nez'),
('12345699901', 'Visi�n Futura SA', 1980, 'Luis Gonz�lez'),
('23456719012', 'TechSolutions Corp', 1979, 'Andrea L�pez'),
('54321028765', 'Innovation World Inc.', 1978, 'Carlos Ram�rez'),
('65432139876', 'EcoTech Solutions', 1977, 'Mar�a Silva'),
('98701244567', 'Nueva Innovaci�n SA', 1976, 'Javier Fern�ndez'),
('43210957654', 'Innovaci�n Total', 1975, 'Marta P�rez'),
('78901134567', 'CorpSoluciones', 1974, 'Ricardo Torres'),
('56189012345', 'Solutions Innovate', 1973, 'Ana Mart�nez'),
('34361890123', 'Visionary Solutions', 1972, 'Roberto Garc�a'),
('45558901234', 'GlobalTech Corp', 1971, 'Elena L�pez'),
('89212345678', 'Empresas Unidos SA', 1970, 'Carlos P�rez'),
('65132109876', 'InnovaCorp Solutions', 1969, 'Sof�a Soto');


-- Inserciones para la tabla tiposAutomotores 

INSERT INTO tiposAutomotores (auttipo, autnombre) VALUES
(96, 'Autom�vil Compacto'),
(74, 'SUV Familiar'),
(92, 'Furgoneta de Carga'),
(4, 'Motocicleta Deportiva'),
(5, 'Cami�n de Reparto'),
(6, 'Camioneta Todo Terreno'),
(7, 'Motocicleta Crucero'),
(8, 'Ciclomotor Urbano'),
(9, 'Autob�s Escolar'),
(10, 'Cami�n de Volteo'),
(11, 'Autom�vil El�ctrico'),
(12, 'SUV de Lujo'),
(13, 'Camioneta Deportiva'),
(14, 'Motocicleta Caf� Racer'),
(15, 'Cami�n Refrigerado'),
(16, 'Autom�vil H�brido'),
(17, 'SUV Compacto'),
(18, 'Motocicleta de Turismo'),
(19, 'Cami�n de Bomberos'),
(20, 'Camioneta Familiar'),
(21, 'Tractor Agr�cola'),
(22, 'Motocicleta Scooter'),
(23, 'Autom�vil Familiar'),
(24, 'SUV Compacto'),
(25, 'Cami�n de Recolecci�n'),
(26, 'Camioneta H�brida'),
(27, 'Motocicleta de Enduro'),
(28, 'Cami�n Cisterna'),
(29, 'Autob�s de Turismo'),
(30, 'Camioneta Todo Terreno'),
(31, 'Motocicleta de Carreras'),
(32, 'Ciclomotor de Ciudad'),
(33, 'Autom�vil Deportivo'),
(34, 'SUV Deportivo'),
(35, 'Cami�n de Mudanza'),
(36, 'Motocicleta Cl�sica'),
(37, 'Cami�n de Construcci�n'),
(38, 'Camioneta de Pasajeros'),
(39, 'Tractor de Jard�n'),
(40, 'Motocicleta Off-Road'),
(41, 'Autom�vil de Lujo'),
(42, 'SUV Todoterreno'),
(43, 'Cami�n de Plataforma'),
(44, 'Camioneta Todoterreno'),
(45, 'Autob�s Interurbano'),
(46, 'Cami�n de Basura'),
(47, 'Motocicleta de Aventura'),
(48, 'Cami�n de montacarga'),
(49, 'Autom�vil Cl�sico'),
(50, 'SUV Compacto H�brido');

-- Inserciones en la tabla automotores

INSERT INTO automotores (autoplaca, automarca, autotipo, automodelo, autopasajeros, autocilindraje, autonumchasis) VALUES
('ABC129', 'Toyota', 1, 2020, 5, 2000, '123456789012'),
('XYZ788', 'Honda', 2, 2019, 5, 2200, '09876543210987'),
('LMN456', 'Ford', 3, 2022, 2, 2500, '98765432109'),
('JKL321', 'Suzuki', 4, 2021, 1, 1000, '2345678901234'),
('PQR654', 'Chevrolet', 5, 2018, 3, 3500, '34567890'),
('DEF987', 'Nissan', 6, 2023, 7, 2800, '4567890123456'),
('GHI651', 'Kia', 7, 2017, 4, 1600, '5678901234567'),
('UVW123', 'BMW', 8, 2020, 2, 1500, '6789012345678'),
('TUV890', 'Mercedes-Benz', 9, 2019, 10, 4500, '789012345678'),
('MNO987', 'Mazda', 10, 2022, 8, 3200, '8901234567890'),
('CDE456', 'Audi', 11, 2021, 2, 1800, '90123456789012'),
('STU321', 'Volkswagen', 12, 2018, 6, 2600, '01234567890'),
('JKL654', 'Subaru', 13, 2023, 5, 2400, '123456789012'),
('XYZ123', 'Ferrari', 14, 2017, 2, 5000, '234567890123'),
('PQR321', 'Lamborghini', 15, 2016, 2, 6500, '345678901'),
('ABC456', 'Porsche', 16, 2020, 5, 3500, '4567890123'),
('DEF654', 'Jeep', 17, 2019, 4, 3200, '56789012345678'),
('TUV329', 'Lexus', 18, 2021, 2, 2200, '678901234'),
('MNO133', 'Land Rover', 19, 2022, 7, 4000, '789012345678'),
('LMN789', 'Volvo', 20, 2015, 6, 3800, '8901234567'),
('GHI123', 'Hyundai', 21, 2023, 3, 1700, '90123456789'),
('UVW456', 'Aston Martin', 22, 2017, 2, 4000, '01234567890'),
('CDE123', 'Bentley', 23, 2018, 2, 6200, '12345678901'),
('STU654', 'Bugatti', 24, 2020, 2, 8000, '234567890123'),
('ABC789', 'Cadillac', 25, 2021, 4, 4400, '345678901234'),
('XYZ456', 'Chrysler', 26, 2019, 5, 3600, '456789012345678'),
('JKL123', 'Citroen', 27, 2018, 3, 1800, '5678901234567'),
('PQR789', 'Dodge', 28, 2022, 6, 3200, '67890123456789'),
('LMN321', 'Fiat', 29, 2023, 4, 1500, '7890123456789'),
('DEF123', 'Infiniti', 30, 2016, 3, 2200, '89012345678901'),
('TUV456', 'Jaguar', 31, 2017, 2, 2400, '90123456789012'),
('MNO789', 'Mini', 32, 2021, 2, 1800, '01234567890123'),
('GHI456', 'Mitsubishi', 33, 2019, 3, 2200, '123456789'),
('STU123', 'Pagani', 34, 2020, 2, 6700, '23456789012345'),
('CDE789', 'Ram', 35, 2022, 5, 5200, '345678901234567894'),
('UVW789', 'Rolls-Royce', 36, 2021, 2, 6700, '45678901234'),
('TUV173', 'Tesla', 37, 2018, 2, 2200, '567890123456'),
('PQR456', 'McLaren', 38, 2023, 2, 3700, '6789012345678'),
('GHI789', 'Alfa Romeo', 39, 2017, 2, 2900, '7890123456789'),
('DEF789', 'Buggie', 40, 2022, 2, 1500, '890123456789012'),
('ABC654', 'GMC', 41, 2019, 6, 3900, '9012345678901234'),
('MNO456', 'Koenigsegg', 42, 2020, 2, 5700, '01234567890'),
('XYZ789', 'Lotus', 43, 2021, 2, 2200, '1234567890123456'),
('STU789', 'Peugeot', 44, 2016, 2, 2100, '23456789012345'),
('LMN654', 'Polestar', 45, 2022, 4, 3000, '34567890123456'),
('TUV589', 'Scion', 46, 2023, 2, 2200, '456789012345678'),
('PQR123', 'Spyker', 47, 2018, 2, 2400, '567890123456781'),
('DEF456', 'Zenvo', 48, 2021, 2, 5000, '67890123456789'),
('GHI654', 'Chery', 49, 2019, 4, 2600, '78901234567890'),
('ABC123', 'Smart', 50, 2020, 2, 1000, '890123456789');


-- Inserciones en la tabla aseguramientos

INSERT INTO aseguramientos (asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto, aseplaca) VALUES
('2022-01-10', '2021-01-10', 25000, 'Expirado', 50000, 'ABC123'),
('2022-02-15', '2023-02-15', 30000, 'Vigente', 60000, 'ABC129'),
('2022-03-20', '2023-03-20', 40000, 'Vigente', 80000, 'ABC456'),
('2022-04-25', '2023-04-25', 35000, 'Vigente', 70000 , 'ABC654'),
('2022-05-30', '2023-05-30', 45000, 'Vigente', 90000, 'ABC789'),
('2022-06-01', '2023-06-01', 50000, 'Vigente', 100000, 'CDE123'),
('2022-07-05', '2023-07-05', 28000, 'Vigente', 560000, 'CDE456'),
('2022-08-10', '2023-08-10', 42000, 'Vigente', 840000, 'CDE789'),
('2022-09-15', '2023-09-15', 22000, 'Vigente', 44000, 'DEF123'),
('2022-10-20', '2021-10-20', 60000, 'Expirado', 12000, 'DEF456'),
('2022-11-22', '2023-11-22', 35000, 'Vigente', 70000, 'DEF654'),
('2022-12-05', '2023-12-05', 48000, 'Vigente', 96000, 'DEF789'),
('2023-01-01', '2024-01-01', 70000, 'Vigente', 14000, 'DEF987'),
('2023-02-10', '2024-02-10', 65000, 'Vigente', 13000, 'DKZ820'),
('2023-03-15', '2024-03-15', 14000, 'Vigente', 280000, 'FLL420'),
('2023-04-20', '2024-04-20', 51000, 'Vigente', 102000, 'GHI123'),
('2023-05-25', '2024-05-25', 33000, 'Vigente', 660000, 'GHI456'),
('2023-06-30', '2024-06-30', 32000, 'Vigente', 640000, 'GHI651'),
('2023-07-05', '2024-07-05', 52000, 'Vigente', 104000, 'GHI654'),
('2023-08-10', '2024-08-10', 29000, 'Vigente', 580000, 'GHI789'),
('2023-09-15', '2024-09-15', 48000, 'Vigente', 960000, 'JKL123'),
('2023-10-17', '2024-10-17', 20000, 'Vigente', 400000, 'JKL321'),
('2023-11-22', '2024-11-22', 24000, 'Vigente', 480000, 'JKL654'),
('2023-12-05', '2024-12-05', 21000, 'Vigente', 42000, 'KJQ920'),
('2024-01-01', '2025-01-01', 45000, 'Vigente', 90000, 'LMN321'),
('2024-02-10', '2025-02-10', 45000, 'Vigente', 20000, 'LMN456'),
('2024-03-15', '2022-03-15', 91100, 'Expirado', 100000, 'LMN654'),
('2024-04-20', '2025-04-20', 96500, 'Vigente', 60000, 'LMN789'),
('2024-05-25', '2025-05-25', 63000, 'Vigente', 30000, 'MNO133'),
('2024-06-30', '2025-06-30', 74000, 'Vigente', 40000, 'MNO456'),
('2024-07-05', '2025-07-05', 85000, 'Vigente', 90000, 'MNO789'),
('2024-08-10', '2025-08-10', 96000, 'Vigente', 80000, 'MNO987'),
('2024-09-17', '2025-09-17', 12000, 'Vigente', 20000, 'PQR123'),
('2024-10-20', '2025-10-20', 96000, 'Vigente', 88000, 'PQR321'),
('2024-11-15', '2020-11-15', 74000, 'Expirado', 920000, 'PQR456'),
('2024-12-20', '2025-12-20', 24000, 'Vigente', 865468, 'PQR654'),
('2025-01-25', '2026-01-25', 85000, 'Vigente', 351485, 'PQR789'),
('2025-02-28', '2026-02-28', 69000, 'Vigente', 845452, 'STU123'),
('2025-03-05', '2026-03-05', 85000, 'Vigente', 200000, 'STU321'),
('2025-04-10', '2026-04-10', 45000, 'Vigente', 90000, 'STU654'),
('2025-05-15', '2026-05-15', 52000, 'Vigente', 900621, 'STU789'),
('2025-06-20', '2026-06-20', 96000, 'Vigente', 900400, 'TUV173'),
('2025-07-25', '2021-07-25', 31000, 'Expirado', 100100, 'TUV329'),
('2025-08-30', '2026-08-30', 45000, 'Vigente', 666600, 'TUV456'),
('2026-04-10', '2027-04-10', 41000, 'Vigente', 500111, 'XYZ788'),
('2026-05-15', '2027-05-15', 24000, 'Vigente', 700452, 'XYZ789'),
('2026-06-22', '2027-06-22', 35000, 'Vigente', 700548, 'CDE123'),
('2026-07-27', '2027-07-27', 46000, 'Vigente', 920151, 'STU789'),
('2026-08-30', '2027-08-30', 28000, 'Vigente', 56087, 'XYZ123'),
('2026-09-05', '2027-09-05', 32000, 'Vigente', 64021, 'ABC129'),
('2026-10-10', '2027-10-10', 29000, 'Vigente', 580965, 'TUV589');


-- Inserciones en la tabla incidentes

INSERT INTO incidentes (incifecha, inciplaca, incilugar, inciantheridos, incicanfatalidades, incicanautosinvolucrados) VALUES
('2023-11-01', 'ABC123', 'Avenida Libertador', 2, 0, 2),
('2007-01-02', 'DEF456', 'Calle 27 de Febrero', 1, 0, 1),
('2023-12-03', 'GHI789', 'Carretera Panamericana', 3, 0, 4),
('2023-09-04', 'JKL654', 'Calle del Mar', 0, 0, 2),
('2006-11-05', 'MNO987', 'Avenida Las Am�ricas', 2, 0, 3),
('2023-02-06', 'PQR321', 'Calle Sarmiento', 1, 0, 2),
('2023-06-07', 'STU789', 'Autopista del Sol', 4, 1, 5),
('2023-07-08', 'TUV456', 'Cruce de Caminos', 0, 0, 2),
('2022-04-09', 'UVW123', 'Carretera del Norte', 1, 0, 2),
('2001-01-10', 'XYZ123', 'Avenida Principal', 2, 0, 3),
('2022-02-11', 'ABC456', 'Calle 7 de Agosto', 3, 0, 4),
('2022-11-12', 'CDE123', 'Intersecci�n Humboldt', 1, 0, 2),
('2021-11-13', 'DEF654', 'Cruce de Caminos', 2, 0, 3),
('2021-06-14', 'GHI123', 'Avenida Yulima', 0, 0, 1),
('2021-11-15', 'JKL123', 'Avenida San Jos�', 2, 0, 3),
('2021-11-16', 'MNO456', 'Carretera 28 de Julio', 3, 1, 4),
('2011-06-17', 'PQR456', 'Calle 8', 1, 0, 2),
('2022-01-18', 'STU123', 'Intersecci�n Gonz�lez', 0, 0, 2),
('2023-11-19', 'TUV890', 'Cruce de Caminos', 4, 0, 5),
('2022-01-20', 'UVW789', 'Autopista 3-85', 2, 0, 3),
('2023-06-21', 'XYZ456', 'Avenida 54', 1, 0, 2),
('2011-02-22', 'ABC129', 'Avenida Huila', 0, 0, 1),
('2023-02-23', 'CDE456', 'Carretera Pereira', 5, 2, 6),
('2001-11-24', 'DEF789', 'Intersecci�n 2', 2, 0, 3),
('2011-11-25', 'GHI456', 'Calle 9', 1, 0, 2),
('2023-06-26', 'JKL321', 'Cruce de Caminos 2', 0, 0, 2),
('2014-01-27', 'MNO133', 'Avenida 7', 3, 1, 4),
('2023-11-28', 'PQR321', 'Autopista 4', 0, 0, 2),
('2019-11-14', 'STU321', 'Carretera 4', 1, 0, 2),
('2023-06-02', 'TUV173', 'Calle 10', 4, 0, 5),
('2022-11-17', 'UVW456', 'Calle Risaralda', 2, 0, 3),
('2023-06-14', 'XYZ788', 'Avenida 8', 0, 0, 1),
('2004-01-23', 'ABC654', 'Calle 11', 3, 0, 4),
('2011-11-01', 'CDE789', 'Cruce de Caminos #1', 1, 0, 2),
('2023-12-31', 'DEF987', 'Carretera Tulip�n', 2, 0, 3),
('2023-11-06', 'GHI651', 'Avenida A1', 0, 0, 1),
('2011-01-17', 'JKL654', 'Autopista Nepal', 5, 2, 6),
('2001-02-21', 'MNO456', 'Calle 12-41', 3, 0, 4),
('2023-11-11', 'PQR654', 'Intersecci�n Julio', 1, 0, 2),
('2025-06-25', 'STU654', 'Cruce de Caminos 4', 0, 0, 2),
('2023-11-21', 'TUV329', 'Carretera 6', 2, 0, 3),
('2023-06-12', 'UVW456', 'Avenida 10', 0, 0, 1),
('2024-11-23', 'XYZ123', 'Autopista 6', 3, 1, 4),
('2023-01-24', 'ABC789', 'Calle 13', 1, 0, 2),
('2023-06-25', 'CDE123', 'Retorno 74 Y', 0, 0, 2),
('2011-02-26', 'DEF456', 'Cruce de Caminos A1', 4, 0, 5),
('2023-11-17', 'GHI789', 'Carretera 7', 2, 0, 3),
('2006-11-18', 'JKL123', 'Avenida 11', 1, 0, 2),
('2023-01-19', 'MNO789', 'Autopista 7', 0, 0, 1),
('2002-06-05', 'PQR123', 'Calle 14', 2, 0, 3),
('2004-01-01', 'STU123', 'Intersecci�n 6', 3, 1, 4);


-- i. Visualizar los clientes que cumplen a�os seg�n un mes ingresado por par�metros.

create procedure cumplea�osClientes 
@mes_cum_cli varchar (10)
as 
begin
select * from cliente where mes_cum_cli = @mes_cum_cli
end

exec cumplea�osClientes 'Enero'

-- ii. Visualizar el nombre del cliente, la fecha y el valor seg�n id del cliente ingresado.

create procedure datosDelCliente 
@id_cli varchar (11)
as 
begin
select nom_cli,ape_cli, fec_ped, val_ped from cliente inner join pedido on id_cli = id_cli_ped where id_cli = @id_cli;
end

exec datosDelCliente '11111111111'


-- iii. Visualizar los datos de las empresas fundadas seg�n a�o ingresado.

create procedure fundacionCompania 
@comaniofun int
as 
begin
select * from compania where comaniofun = @comaniofun;
end

exec fundacionCompania 2001


-- iv. Visualizar los datos de la empresa seg�n nit ingresado.

create procedure datosCompania 
@comnit varchar (11)
as 
begin
select * from compania where comnit = @comnit;
end

exec datosCompania '65432109876'

-- v. Visualizar los pedidos que se han realizado seg�n id de articulo ingresado, el
-- listado debe mostrar el nombre y direcci�n del cliente, el respectivo n�mero de
-- pedido y la cantidad solicitada.

create procedure visualizarPedidos 
@id_art int
as 
begin
select nom_cli, dir_cli, id_ped_artped, can_art_artped, id_art_artped from articulo 
inner join articulo_pedido on id_art = id_art_artped
inner join pedido on id_ped = id_ped_artped 
inner join cliente on id_cli = id_cli_ped where id_art_artped = @id_art;
end

exec visualizarPedidos 1;