
DROP TABLE Compra;
DROP TABLE Usuario;
DROP TABLE Configuracion;
DROP TABLE AsignaRol;
DROP TABLE Rol;
DROP TABLE Asistente;
 
CREATE TABLE Asistente (
    idAsistente INT NOT NULL PRIMARY KEY,
    nombre VARCHAR2(255) NOT NULL,
    genero VARCHAR2(50) NOT NULL CHECK (genero IN ('Femenino', 'Masculino', 'No binario'))
);
 
CREATE TABLE Rol (
    idRol INT NOT NULL PRIMARY KEY,
    tipo VARCHAR2(50) NOT NULL CHECK (tipo IN ('Tutor', 'Amigo', 'Coach'))
);
  
CREATE TABLE AsignaRol (
    idAsistente INT NOT NULL,
    idRol INT NOT NULL, 
    PRIMARY KEY (idAsistente, idRol),
    FOREIGN KEY (idAsistente) REFERENCES ASISTENTE(idAsistente),
    FOREIGN KEY (idRol) REFERENCES ROL(idRol) 
);

CREATE TABLE Configuracion (
    idConfiguracion INT NOT NULL PRIMARY KEY,
    ropa VARCHAR2(50) NOT NULL CHECK (ropa IN ('Verano', 'Primavera', 'Anime', 'Oficina', 'Fiesta', 'Deporte', 'Camisetas')),
    interes VARCHAR2(50) NOT NULL CHECK (interes IN ('Juegos', 'Deportes', 'Historia', 'Moda')),
    rasgo VARCHAR2(50) NOT NULL CHECK (rasgo IN ('Seguro', 'Tímido', 'Energético', 'Práctico', 'Soñador', 'Artístico', 'Lógico')),
    voz VARCHAR2(50) NOT NULL CHECK (voz IN ('Femenina', 'Masculina')),
    costoGemas INT,
    costoMonenas INT,
    idAsistente INT NOT NULL,
    vigente CHAR(1) NOT NULL CHECK (vigente IN ('S', 'N')),
    FOREIGN KEY (idAsistente) REFERENCES ASISTENTE(idAsistente)
);

CREATE TABLE Usuario (
    email VARCHAR2(255) NOT NULL PRIMARY KEY,
    nombre VARCHAR2(255),
    rangoEdad VARCHAR2(10) CHECK (rangoEdad IN ('18-24', '25-34', '35-44', '45-54', '55-64', '65 o más')),
    fechaRegistro DATE NOT NULL,
    saldoGemas INT,
    saldoMonedas INT,
    idAsistente INT NOT NULL,
    FOREIGN KEY (idAsistente) REFERENCES ASISTENTE(idAsistente)  
);


CREATE TABLE Compra (
    idConfiguracion INT NOT NULL,
    email VARCHAR2(255) NOT NULL,
    fechaCompra DATE NOT NULL,
    totalGemas INT NOT NULL,
    totalMonedas INT NOT NULL,
    PRIMARY KEY (idConfiguracion, email, fechaCompra),
    FOREIGN KEY (idConfiguracion) REFERENCES CONFIGURACION(idConfiguracion),
    FOREIGN KEY (email) REFERENCES USUARIO(email)
);


-- Insertar datos en la tabla Asistente
INSERT INTO Asistente (idAsistente, nombre, genero) 
VALUES (1, 'Alexa', 'Femenino');


INSERT INTO Asistente (idAsistente, nombre, genero) 
VALUES (2, 'Siri', 'Femenino');


INSERT INTO Asistente (idAsistente, nombre, genero) 
VALUES (3, 'Cortana', 'Femenino');


INSERT INTO Asistente (idAsistente, nombre, genero) 
VALUES (4, 'Google Assistant', 'No binario');


INSERT INTO Asistente (idAsistente, nombre, genero) 
VALUES (5, 'Jarvis', 'Masculino');


-- Insertar datos en la tabla Rol
INSERT INTO Rol (idRol, tipo) 
VALUES (1, 'Tutor');


INSERT INTO Rol (idRol, tipo) 
VALUES (2, 'Amigo');


INSERT INTO Rol (idRol, tipo) 
VALUES (3, 'Coach');


-- Insertar datos en la tabla AsignaRol
INSERT INTO AsignaRol (idAsistente, idRol) 
VALUES (1, 1); -- Alexa como Tutor


INSERT INTO AsignaRol (idAsistente, idRol) 
VALUES (2, 2); -- Siri como Amigo


INSERT INTO AsignaRol (idAsistente, idRol) 
VALUES (3, 3); -- Cortana como Coach


INSERT INTO AsignaRol (idAsistente, idRol) 
VALUES (4, 1); -- Google Assistant como Tutor


INSERT INTO AsignaRol (idAsistente, idRol) 
VALUES (5, 2); -- Jarvis como Amigo


-- Insertar datos en la tabla Configuracion
INSERT INTO Configuracion (idConfiguracion, ropa, interes, rasgo, voz, costoGemas, costoMonenas, idAsistente, vigente) 
VALUES (1, 'Verano', 'Juegos', 'Seguro', 'Femenina', 100, 200, 1, 'S'); -- Configuración para Alexa


INSERT INTO Configuracion (idConfiguracion, ropa, interes, rasgo, voz, costoGemas, costoMonenas, idAsistente, vigente) 
VALUES (2, 'Deporte', 'Deportes', 'Energético', 'Femenina', 150, 250, 2, 'N'); -- Configuración para Siri


INSERT INTO Configuracion (idConfiguracion, ropa, interes, rasgo, voz, costoGemas, costoMonenas, idAsistente, vigente) 
VALUES (3, 'Primavera', 'Historia', 'Práctico', 'Femenina', 200, 300, 3, 'S'); -- Configuración para Cortana


INSERT INTO Configuracion (idConfiguracion, ropa, interes, rasgo, voz, costoGemas, costoMonenas, idAsistente, vigente) 
VALUES (4, 'Anime', 'Moda', 'Artístico', 'Masculina', 120, 180, 4, 'N'); -- Configuración para Google Assistant


INSERT INTO Configuracion (idConfiguracion, ropa, interes, rasgo, voz, costoGemas, costoMonenas, idAsistente, vigente) 
VALUES (5, 'Fiesta', 'Juegos', 'Soñador', 'Masculina', 170, 210, 5, 'S'); -- Configuración para Jarvis


-- Insertar datos en la tabla Usuario
INSERT INTO Usuario (email, nombre, rangoEdad, fechaRegistro, saldoGemas, saldoMonedas, idAsistente) 
VALUES ('juan.perez@example.com', 'Juan Perez', '25-34', TO_DATE('2024-03-15', 'YYYY-MM-DD'), 500, 1000, 1); -- Usuario asociado a Alexa


INSERT INTO Usuario (email, nombre, rangoEdad, fechaRegistro, saldoGemas, saldoMonedas, idAsistente) 
VALUES ('maria.gomez@example.com', 'Maria Gomez', '35-44', TO_DATE('2024-04-20', 'YYYY-MM-DD'), 600, 800, 2); -- Usuario asociado a Siri


INSERT INTO Usuario (email, nombre, rangoEdad, fechaRegistro, saldoGemas, saldoMonedas, idAsistente) 
VALUES ('ana.lopez@example.com', 'Ana Lopez', '18-24', TO_DATE('2024-06-30', 'YYYY-MM-DD'), 300, 1200, 3); -- Usuario asociado a Cortana


INSERT INTO Usuario (email, nombre, rangoEdad, fechaRegistro, saldoGemas, saldoMonedas, idAsistente) 
VALUES ('pedro.ramos@example.com', 'Pedro Ramos', '45-54', TO_DATE('2024-05-10', 'YYYY-MM-DD'), 400, 700, 4); -- Usuario asociado a Google Assistant


INSERT INTO Usuario (email, nombre, rangoEdad, fechaRegistro, saldoGemas, saldoMonedas, idAsistente) 
VALUES ('lucia.sanchez@example.com', 'Lucia Sanchez', '55-64', TO_DATE('2024-02-28', 'YYYY-MM-DD'), 200, 500, 5); -- Usuario asociado a Jarvis


-- Insertar datos en la tabla Compra
INSERT INTO Compra (idConfiguracion, email, fechaCompra, totalGemas, totalMonedas) 
VALUES (1, 'juan.perez@example.com', TO_DATE('2024-03-16', 'YYYY-MM-DD'), 100, 200); -- Compra realizada por Juan Perez


INSERT INTO Compra (idConfiguracion, email, fechaCompra, totalGemas, totalMonedas) 
VALUES (2, 'maria.gomez@example.com', TO_DATE('2024-04-21', 'YYYY-MM-DD'), 150, 250); -- Compra realizada por Maria Gomez


INSERT INTO Compra (idConfiguracion, email, fechaCompra, totalGemas, totalMonedas) 
VALUES (3, 'ana.lopez@example.com', TO_DATE('2024-07-01', 'YYYY-MM-DD'), 200, 300); -- Compra realizada por Ana Lopez


INSERT INTO Compra (idConfiguracion, email, fechaCompra, totalGemas, totalMonedas) 
VALUES (4, 'pedro.ramos@example.com', TO_DATE('2024-05-11', 'YYYY-MM-DD'), 120, 180); -- Compra realizada por Pedro Ramos


INSERT INTO Compra (idConfiguracion, email, fechaCompra, totalGemas, totalMonedas) 
VALUES (5, 'lucia.sanchez@example.com', TO_DATE('2024-03-01', 'YYYY-MM-DD'), 170, 210); -- Compra realizada por Lucia Sanchez



