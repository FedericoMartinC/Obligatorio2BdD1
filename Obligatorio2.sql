
DROP TABLE Compra;
DROP TABLE TIENE;
DROP TABLE Usuario;
DROP TABLE Configuraci�n;
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

CREATE TABLE Configuraci�n (
    idConfiguracion INT NOT NULL PRIMARY KEY,
    ropa VARCHAR2(50) NOT NULL CHECK (ropa IN ('Verano', 'Primavera', 'Anime', 'Oficina', 'Fiesta', 'Deporte', 'Camisetas')),
    interes VARCHAR2(50) NOT NULL CHECK (interes IN ('Juegos', 'Deportes', 'Historia', 'Moda')),
    rasgo VARCHAR2(50) NOT NULL CHECK (rasgo IN ('Seguro', 'T�mido', 'Energ�tico', 'Pr�ctico', 'So�ador', 'Art�stico', 'L�gico')),
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
    rangoEdad VARCHAR2(10) CHECK (rangoEdad IN ('18-24', '25-34', '35-44', '45-54', '55-64', '65 o m�s')),
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

