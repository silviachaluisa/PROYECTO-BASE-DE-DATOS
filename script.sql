Use sql5681662;
-- crear las tablas
create table TipoUsuario{
    Id_Usuario int PRIMARY KEY not null,
    Tipo_Usuario text not null check(tipo_usuario in ("Administrador", "Ascesor", "Empleado", "Usuario"))

}
create table Clientes(
    Id_Cliente int primary key AUTO_INCREMENT,
    Nombre VARCHAR(30) not null, 
    Cédula BIGINT not null UNIQUE,
    Contacto BIGINT not null,
    Correo text not null UNIQUE,
    Fecha_Nacimiento date not null,
    Contraseña VARCHAR(50) not NULL,
    Dirección TEXT not null
    Tipo_Usuario int,
    Foreign Key (Tipo_Usuario) REFERENCES TipoUsuario(Id_Usuario)
);




create table Vehiculos(
    Placa varchar(10) PRIMARY KEY not null,
    Marca text not null,
    Modelo text not null,
    Año int not null,
    Color varchar(30) not null,
    Id_Cliente int,
    Foreign Key (Id_Cliente) REFERENCES Clientes(Id_Cliente),
    
);

create table Mantenimiento(
    Id_Mantenimiento int PRIMARY KEY not null,
    Placa varchar(10),
    Fecha_Mantenimiento date not null,
    Descripcion text not null,
    Costo decimal(5, 2) not null,
    Garantia VARCHAR(5) not null check(garantia in ("si","no")),
    Fecha_Siguiente_Mantenimiento date not null
)