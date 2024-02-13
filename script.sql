Use sql5681662;
-- crear loas tablas
create table Usuarios(
    id int primary key AUTO_INCREMENT,
    usuario VARCHAR(30) not null, 
    contrasena VARCHAR(15) not NULL,
    cedula BIGINT not null UNIQUE,
    correo text not null UNIQUE,
    contacto BIGINT not null,
    fecha_nacimiento date not null,
);