Use sql5681662;


create table TipoUsuario(
    Id_Usuario int PRIMARY KEY not null,
    Tipo_Usuario VARCHAR(255) not null check(Tipo_usuario in ("Administrador", "Ascesor", "Empleado", "Usuario"))
);
--CREAR TABLA USUARIOS---------------------------------------------------------------------------------
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

DELIMITER $$
CREATE PROCEDURE InsertarRegistrosAleatoriosUsuarios()
BEGIN
    DECLARE contador INT DEFAULT 1;
    DECLARE nombres VARCHAR(255);
    DECLARE apellidos VARCHAR(255);
    DECLARE cedula BIGINT;
    DECLARE contacto BIGINT;
    DECLARE correo TEXT;
    DECLARE fecha_nacimiento DATE;
    DECLARE contraseña VARCHAR(50);
    DECLARE direccion TEXT;
    DECLARE tipo_usuario INT;

    WHILE contador <= 100 DO
        -- Generar valores aleatorios para cada columna
        SET nombres = CONCAT('Usuario', LPAD(FLOOR(RAND() * 1000), 3, '0'));
        SET apellidos = CONCAT('Apellido', LPAD(FLOOR(RAND() * 1000), 3, '0'));
        SET cedula = FLOOR(RAND() * 1000000000) + 1000000000;
        SET contacto = FLOOR(RAND() * 1000000000) + 1000000000;
        SET correo = CONCAT('usuario', contador, '@dominio.com');
        SET fecha_nacimiento = DATE_ADD(CURRENT_DATE(), INTERVAL -FLOOR(RAND() * 365 * 30) DAY);
        SET contraseña = CONCAT('Contraseña', LPAD(FLOOR(RAND() * 1000), 3, '0'));
        SET direccion = CONCAT('Dirección', LPAD(FLOOR(RAND() * 1000), 3, '0'));
        SET tipo_usuario = FLOOR(RAND() * 3) + 1; 

     
        INSERT INTO Clientes (Nombres, Apellidos, Cédula, Contacto, Correo, Fecha_Nacimiento, Contraseña, Dirección, Tipo_Usuario)
        VALUES (nombres, apellidos, cedula, contacto, correo, fecha_nacimiento, contraseña, direccion, tipo_usuario);

        SET contador = contador + 1;
    END WHILE;
END$$
DELIMITER ;

-- Llamar al procedimiento para insertar registros aleatorios en la tabla de usuarios
CALL InsertarRegistrosAleatoriosUsuarios();
------------------------------------------------------------------------------------------------------------------------
--CREAR TABLA VEHICULOS
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

--CREAR TABLA MANTENIMIENTO

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
