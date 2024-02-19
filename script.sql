
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
create INDEX idx_placa ON Vehiculos(Placa);

create table Mantenimiento(
    Id_Mantenimiento int PRIMARY KEY not null,
    Placa varchar(10),
    Fecha_Mantenimiento date not null,
    Descripcion text not null,
    Costo decimal(5, 2) not null,
    Garantia VARCHAR(5) not null check(garantia in ("si","no")),
    Fecha_Siguiente_Mantenimiento date not null
)



-- Generar 100 registros aleatorios
DELIMITER $$
CREATE PROCEDURE InsertarRegistrosAleatorios()
BEGIN
    DECLARE contador INT DEFAULT 1;
    DECLARE placa VARCHAR(10);
    DECLARE fecha_mantenimiento DATE;
    DECLARE descripcion TEXT;
    DECLARE costo DECIMAL(5, 2);
    DECLARE garantia VARCHAR(5);
    DECLARE fecha_siguiente_mantenimiento DATE;

    WHILE contador <= 100 DO
        -- Generar valores aleatorios para cada columna
        SET placa = CONCAT('Placa', LPAD(FLOOR(RAND() * 1000), 3, '0'));
        SET fecha_mantenimiento = DATE_ADD(CURRENT_DATE(), INTERVAL -FLOOR(RAND() * 365) DAY);
        SET descripcion = CONCAT('Mantenimiento para vehículo con placa ', placa);
        SET costo = ROUND(RAND() * 1000, 2);
        SET garantia = IF(RAND() < 0.5, 'si', 'no');
        SET fecha_siguiente_mantenimiento = DATE_ADD(fecha_mantenimiento, INTERVAL FLOOR(RAND() * 365) DAY);

        -- Insertar el registro
        INSERT INTO Mantenimiento (Id_Mantenimiento, Placa, Fecha_Mantenimiento, Descripcion, Costo, Garantia, Fecha_Siguiente_Mantenimiento)
        VALUES (contador, placa, fecha_mantenimiento, descripcion, costo, garantia, fecha_siguiente_mantenimiento);

        SET contador = contador + 1;
    END WHILE;
END$$
DELIMITER ;

-- Llamar al procedimiento para insertar registros aleatorios
CALL InsertarRegistrosAleatorios();
