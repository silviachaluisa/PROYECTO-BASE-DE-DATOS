
Use sql5681662;
--CREACION TABLES MARCE Y SILVIA
-- crear las tablas
create table TipoUsuario{
    Id_Usuario int PRIMARY KEY not null,
    Tipo_Usuario text not null check(tipo_usuario in ("Administrador", "Ascesor", "Empleado", "Usuario"))

}
create table Clientes(
    Id_Cliente int primary key AUTO_INCREMENT,
    Nombres VARCHAR(255) not null, 
    Apellidos varchar (255)
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

--INSERTAR REGISTROS EN LAS TABLES
-- Insertar registros en Clientes (--Silvia)
INSERT INTO Clientes (Nombre, Cédula, Contacto, Correo, Fecha_Nacimiento, Contraseña, Dirección, Tipo_Usuario) VALUES

("Juan Perez", 123456789, 987654321, "juan@email.com","1990-01-01", "contrasena1", "Calle Principal 123", "Usuario"), --1)
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", "Usuario"), --2)
("Leandra Alban", 1721495255, 0960779342, "Leandra@email.com", "1984-12-08", "contrasena3", "Sangolquí","Usuario"),--3
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4), --4
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),
("Maria Rodriguez", 987654321, 123456789, "maria@email.com", "1985-05-15", "contrasena2", "Avenida Central 456", 4),






-- Insertar registros en Vehiculos
INSERT INTO Vehiculos (Placa, Marca, Modelo, Año, Color, Id_Cliente) VALUES
("ABC123", "Toyota", "Corolla", 2020, "Rojo", 1),
("XYZ789", "Honda", "Civic", 2018, "Azul", 2),


-- Insertar registros en Mantenimiento
INSERT INTO Mantenimiento (Id_Mantenimiento, Placa, Fecha_Mantenimiento, Descripcion, Costo, Garantia, Fecha_Siguiente_Mantenimiento) VALUES
(1, "ABC123", "2022-01-15", "Cambio de aceite", 50.00, "si", "2022-07-15"),
(2, "XYZ789", "2022-02-20", "Revisión de frenos", 80.00, "no", "2022-08-20");
