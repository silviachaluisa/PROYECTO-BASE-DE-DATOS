Use sql5681662;
-- crear loas tablas
create table TipoUsuario{
    Id_Usuario int PRIMARY KEY not null,
    tipo_usuario text not null check(tipo_usuario in ("Administrador", "Ascesor", "Empleado", "Usuario"))

}
create table Usuarios(
    Id_Usuario int primary key AUTO_INCREMENT,
    Nombre VARCHAR(30) not null, 
    Cédula BIGINT not null UNIQUE,
    Contacto BIGINT not null,
    Correo text not null UNIQUE,
    Fecha_Nacimiento date not null,
    Contraseña VARCHAR(50) not NULL,
    Dirección TEXT not null
    tipo_usuario int,
    Foreign Key (tipo_usuario) REFERENCES TipoUsuario(Id_Usuario)
);




create table Vehiculos(
    id_vehiculo int PRIMARY KEY not null,
    marca text not null,
    modelo text not null,
    añio int not null,
    tipo varchar(50) not null,
    color varchar(30) not null,
    placa text not null UNIQUE,
    id_propietario int,
    id_conductor int
    Foreign Key (id_propietario) REFERENCES Propietarios(id_propietario),
    Foreign Key (id_conductor) REFERENCES Conductores(id_conductor)
);

create table Mantenimiento(
    id int PRIMARY KEY not null,
    id_vehiculo int,
    fecha date not null,
    descripcion text not null,
    costo decimal(5, 2) not null,
    piezas_reemplazadas text not null,
    proveedor text not null,
    garantia VARCHAR(5) not null check(garantia in ("si","no")),
    fecha_siguiente_mantenimiento date not null
)