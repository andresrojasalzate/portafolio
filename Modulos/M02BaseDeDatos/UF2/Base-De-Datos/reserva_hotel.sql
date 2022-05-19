create database ReservaHotel;
use ReservaHotel;

create table Habitaciones(
NumHabitacion smallint primary key,
Tipo_Habitacion varchar(50) not null
);
insert into Habitaciones(NumHabitacion, Tipo_Habitacion) values (1, 'Cama individual');
insert into Habitaciones(NumHabitacion, Tipo_Habitacion) values (2, 'Cama de matrimonio');
insert into Habitaciones(NumHabitacion, Tipo_Habitacion) values (3, ' 2 camas individuales');
insert into Habitaciones(NumHabitacion, Tipo_Habitacion) values (4, 'Sweet');
insert into Habitaciones(NumHabitacion, Tipo_Habitacion) values (5, 'Cama de matrimonio');

create table Clientes(
Nombre varchar(70) not null,
Apellido varchar(70) not null,
Telefono int(9) not null unique,
DNI varchar(9) primary key
);
insert into Clientes(Nombre, Apellido, Telefono, DNI) values ('Jose', 'Nogales', 123456789, '12345678A');
insert into Clientes(Nombre, Apellido, Telefono, DNI) values ('Peito', 'Garcia', 123456781, '12345678B');
insert into Clientes(Nombre, Apellido, Telefono, DNI) values ('Albert', 'Serrano', 123456782, '12345678C');
insert into Clientes(Nombre, Apellido, Telefono, DNI) values ('Lucas', 'Gomez', 123456783, '12345678D');
insert into Clientes(Nombre, Apellido, Telefono, DNI) values ('Raul', 'Pompeyo', 123456784, '12345678E');

create table TipoReserva(
ID smallint primary key,
Nombre varchar(50) unique not null,
Desayuno enum('Si', 'No') not null,
comida enum('Si', 'No') not null,
Cena enum('Si', 'No') not null,
Bar enum('Si', 'No') not null
);
insert into TipoReserva(ID, Nombre, Desayuno, comida, Cena, Bar) values (01, 'Reserva normal', 'Si', 'No', 'No', 'No');
insert into TipoReserva(ID, Nombre, Desayuno, comida, Cena, Bar) values (02, 'Reserva Premium', 'Si', 'No', 'Si', 'No');
insert into TipoReserva(ID, Nombre, Desayuno, comida, Cena, Bar) values (03, 'Reserva Deluxe', 'Si', 'Si', 'Si', 'Si');
insert into TipoReserva(ID, Nombre, Desayuno, comida, Cena, Bar) values (04, 'Reserva normal 2', 'No', 'Si', 'No', 'No');
insert into TipoReserva(ID, Nombre, Desayuno, comida, Cena, Bar) values (05, 'Reserva normal 3', 'No', 'No', 'Si', 'No');

create table Reserva(
Num_Habitacion smallint,
DNI_Cliente varchar(9),
ID_Tipo_Reserva smallint not null,
Hora_Inicio time not null,
Hora_Fin time not null,
Fecha_Inicio date not null,
Fecha_Fin date not null,
primary key (DNI_Cliente, Num_Habitacion),
foreign key (Num_Habitacion) references Habitaciones(NumHabitacion),
foreign key (DNI_Cliente) references Clientes(DNI)
);
insert into Reserva(Num_Habitacion, DNI_Cliente, ID_Tipo_Reserva, Hora_Inicio, Hora_Fin, Fecha_Inicio, Fecha_Fin) values (1, '12345678A', 01, '13:00:00', '17:00:00', '2021/01/15', '2021/01/16');
insert into Reserva(Num_Habitacion, DNI_Cliente, ID_Tipo_Reserva, Hora_Inicio, Hora_Fin, Fecha_Inicio, Fecha_Fin) values (2, '12345678B', 02, '14:00:00', '12:00:00', '2021/01/12', '2021/01/13');
insert into Reserva(Num_Habitacion, DNI_Cliente, ID_Tipo_Reserva, Hora_Inicio, Hora_Fin, Fecha_Inicio, Fecha_Fin) values (3, '12345678C', 03, '09:00:00', '19:00:00', '2021/01/09', '2021/01/10');
insert into Reserva(Num_Habitacion, DNI_Cliente, ID_Tipo_Reserva, Hora_Inicio, Hora_Fin, Fecha_Inicio, Fecha_Fin) values (4, '12345678D', 04, '15:00:00', '20:00:00', '2021/01/21', '2021/01/22');
insert into Reserva(Num_Habitacion, DNI_Cliente, ID_Tipo_Reserva, Hora_Inicio, Hora_Fin, Fecha_Inicio, Fecha_Fin) values (5, '12345678E', 05, '12:00:00', '15:00:00', '2021/01/02', '2021/01/03');

update Habitaciones set Tipo_Habitacion="Sweet" where NumHabitacion=1;
update Clientes set Nombre="Jeremias" where DNI='12345678B';
update Clientes set Apellido="Navarro" where DNI='12345678E';
update TipoReserva set Desayuno="Si" where ID=02;
update TipoReserva set Cena="No" where ID=03;

alter table Clientes add Segundo_Apellido varchar(50) not null;
alter table Clientes drop Segundo_Apellido;
alter table TipoReserva modify Nombre varchar(70) not null;
alter table Habitaciones change Tipo_Habitacion TipoHabitacion varchar(50) not null;
alter table Reserva rename reserva;


