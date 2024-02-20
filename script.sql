Use sql5681662;
-- CREACION TABLES MARCE Y SILVIA
-- crear las tablas
create table TipoUsuario(
    Id_Usuario int PRIMARY KEY not null,
    Tipo_Usuario text not null check(tipo_usuario in ("Administrador", "Ascesor", "Empleado", "Usuario"))
);
create table Clientes(
    Id_Cliente int primary key AUTO_INCREMENT,
    Nombres VARCHAR(255) not null, 
    Apellidos varchar (255),
    Cédula BIGINT not null UNIQUE,
    Contacto BIGINT not null,
    Correo text not null UNIQUE,
    Fecha_Nacimiento date not null,
    Contraseña VARCHAR(50) not NULL,
    Dirección TEXT not null,
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
    Foreign Key (Id_Cliente) REFERENCES Clientes(Id_Cliente)

-- Registros aleatoreos de vehiculos
    DELIMITER $$
CREATE PROCEDURE InsertarRegistrosAleatoriosVehiculos()
BEGIN
    DECLARE contador INT DEFAULT 1;
    DECLARE placa VARCHAR(10);
    DECLARE marca TEXT;
    DECLARE modelo TEXT;
    DECLARE anio INT;
    DECLARE color VARCHAR(30);
    DECLARE id_cliente INT;

    WHILE contador <= 100 DO
        -- Generar valores aleatorios para cada columna
        SET placa = CONCAT('Placa', LPAD(FLOOR(RAND() * 1000), 3, '0'));
        SET marca = CASE FLOOR(RAND() * 3)
                        WHEN 0 THEN 'Toyota'
                        WHEN 1 THEN 'Honda'
                        ELSE 'Ford'
                    END;
        SET modelo = CASE FLOOR(RAND() * 3)
                        WHEN 0 THEN 'Corolla'
                        WHEN 1 THEN 'Civic'
                        ELSE 'Fiesta'
                    END;
        SET anio = YEAR(CURRENT_DATE()) - FLOOR(RAND() * 20); -- Año aleatorio entre 20 años atrás y el año actual
        SET color = CASE FLOOR(RAND() * 5)
                        WHEN 0 THEN 'Rojo'
                        WHEN 1 THEN 'Azul'
                        WHEN 2 THEN 'Blanco'
                        WHEN 3 THEN 'Negro'
                        ELSE 'Gris'
                    END;
        SET id_cliente = FLOOR(RAND() * 100) + 1; -- ID de cliente aleatorio entre 1 y 100

        -- Insertar el registro
        INSERT INTO Vehiculos (Placa, Marca, Modelo, Año, Color, Id_Cliente)
        VALUES (placa, marca, modelo, anio, color, id_cliente);

        SET contador = contador + 1;
    END WHILE;
END$$
DELIMITER ;
CALL InsertarRegistrosAleatoriosVehiculos(); -- Llamada al procedimiento almacenado para insertar registros aleatorios en la tabla
 
SELECT * FROM Vehiculos; -- Consulta para ver los registros insertados en la tabla

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
