DROP DATABASE IF EXISTS ABP;

CREATE DATABASE IF NOT EXISTS ABP;

USE ABP;

CREATE TABLE IF NOT EXISTS ROL(
  ID int(225) AUTO_INCREMENT NOT NULL,
  NOMBRE varchar(25) NOT NULL,
  PRIMARY KEY(ID)
);

CREATE TABLE IF NOT EXISTS USUARIO(
  LOGIN varchar(25) NOT NULL,
  PASSWORD varchar(50) NOT NULL,
  NOMBRE varchar(25) NOT NULL,
  APELLIDOS  varchar(50) NOT NULL,
  GENERO char(1) NOT NULL,
  PRIMARY KEY(LOGIN)
);

CREATE TABLE IF NOT EXISTS USUARIO_ROL(
  ID int(225) AUTO_INCREMENT NOT NULL,
  LOGIN varchar(25) NOT NULL,
  ROL_ID int(225) NOT NULL,
  PRIMARY KEY(ID),
  FOREIGN KEY (LOGIN) REFERENCES USUARIO (LOGIN),
  FOREIGN KEY (ROL_ID) REFERENCES ROL (ID)
);

CREATE TABLE IF NOT EXISTS PAREJA(
  ID int(225) AUTO_INCREMENT NOT NULL,
  JUGADOR_1 varchar(25) NOT NULL,
  JUGADOR_2 varchar(25) NOT NULL,
  CAPITAN varchar(25) NOT NULL,
  PRIMARY KEY(ID),
  FOREIGN KEY (JUGADOR_1) REFERENCES USUARIO (LOGIN),
  FOREIGN KEY (JUGADOR_2) REFERENCES USUARIO (LOGIN),
  FOREIGN KEY (CAPITAN) REFERENCES USUARIO (LOGIN)
);

CREATE TABLE IF NOT EXISTS PISTA(
  ID int(225) AUTO_INCREMENT NOT NULL ,
  NOMBRE varchar(25) NOT NULL,
  TIPO varchar(25) NOT NULL,
  PRIMARY KEY(ID)
);

CREATE TABLE IF NOT EXISTS CAMPEONATO(
  ID int(225) AUTO_INCREMENT NOT NULL,
  NOMBRE varchar(50) NOT NULL,
  FECHA date NOT NULL,
  PRIMARY KEY(ID)
);

CREATE TABLE IF NOT EXISTS CLASIFICACION(
  ID int(225) AUTO_INCREMENT NOT NULL,
  PAREJA_ID int(225) NOT NULL,
  PUESTO int(225) NOT NULL,
  PUNTOS int(225) NOT NULL,
  CAMPEONATO_ID int(225) NOT NULL,
  PRIMARY KEY(ID),
  FOREIGN KEY (CAMPEONATO_ID) REFERENCES CAMPEONATO (ID),
  FOREIGN KEY (PAREJA_ID) REFERENCES PAREJA (ID)
);

CREATE TABLE IF NOT EXISTS INSCRIPCION(
  ID int(225) AUTO_INCREMENT NOT NULL ,
  NIVEL varchar(10) NOT NULL,
  GENERO char(1) NOT NULL,
  GRUPO char(1),
  PAREJA_ID int(225) NOT NULL,
  CAMPEONATO_ID int(225) NOT NULL,
  PRIMARY KEY(ID),
  FOREIGN KEY (PAREJA_ID) REFERENCES PAREJA (ID),
  FOREIGN KEY (CAMPEONATO_ID) REFERENCES CAMPEONATO (ID)
);

CREATE TABLE IF NOT EXISTS RESERVA(
  ID int(225) AUTO_INCREMENT NOT NULL ,
  USUARIO_LOGIN varchar(25) NOT NULL,
  PISTA_ID int(225) NOT NULL,
  FECHA date NOT NULL,
  PRIMARY KEY(ID),
  FOREIGN KEY (USUARIO_LOGIN) REFERENCES USUARIO (LOGIN),
  FOREIGN KEY (PISTA_ID) REFERENCES PISTA (ID)
);

CREATE TABLE IF NOT EXISTS ENFRENTAMIENTO(
  ID int(225) AUTO_INCREMENT NOT NULL,
  FECHA date NOT NULL,
  NIVEL varchar(10) NOT NULL,
  GENERO char(1) NOT NULL,
  GRUPO char(1) NOT NULL,
  RESULTADO varchar(25),
  PAREJA_1 int(225) NOT NULL,
  PAREJA_2 int(225) NOT NULL,
  RESERVA_ID int(255) NOT NULL,
  PRIMARY KEY(ID),
  FOREIGN KEY (PAREJA_1) REFERENCES PAREJA (ID),
  FOREIGN KEY (PAREJA_2) REFERENCES PAREJA (ID),
  FOREIGN KEY (RESERVA_ID) REFERENCES RESERVA (ID)
);

CREATE TABLE IF NOT EXISTS HUECO(
  ID int(225) AUTO_INCREMENT NOT NULL ,
  FECHA date NOT NULL,
  ENFRENTAMIENTO_ID int(225) NOT NULL,
  PAREJA_ID int (255) NOT NULL,
  PRIMARY KEY(ID),
  FOREIGN KEY (PAREJA_ID) REFERENCES PAREJA (ID),
  FOREIGN KEY (ENFRENTAMIENTO_ID) REFERENCES ENFRENTAMIENTO (ID)
);

CREATE TABLE IF NOT EXISTS PARTIDO(
  ID int(225) AUTO_INCREMENT NOT NULL ,
  FECHA date NOT NULL,
  RESERVA_ID int(255),
  PRIMARY KEY(ID),
  FOREIGN KEY (RESERVA_ID) REFERENCES RESERVA (ID)
);

CREATE TABLE IF NOT EXISTS USUARIO_PARTIDO(
  ID int(225) AUTO_INCREMENT NOT NULL ,
  USUARIO_LOGIN varchar(25) NOT NULL,
  PARTIDO_ID int(255) NOT NULL,
  PRIMARY KEY(ID),
  FOREIGN KEY (USUARIO_LOGIN) REFERENCES USUARIO (LOGIN),
  FOREIGN KEY (PARTIDO_ID) REFERENCES PARTIDO (ID)
);



-- INSERTS DE EJEMPLO PARA RELLENAR LA BASE DE DATOS DE FORMA INICIAL

INSERT INTO ROL (ID, NOMBRE) VALUES
(1, 'admin'),
(2, 'deportista');

INSERT INTO USUARIO (LOGIN, PASSWORD, NOMBRE, APELLIDOS, GENERO) VALUES
('mpegea','password','Martin','Puga Egea','h'),
('sabio','password','Federico','Sanchez','h'),
('cemento','password','Cristina','Cervantes','m'),
('phill','password','Peter','Hill','h'),
('muecas','password','Jose','Rodriguez','h'),
('mf25','password','Manuel','Fernandez','h'),
('aglua','password','Ana','Lua','m'),
('ivandd','password','Ivan','De Dios','h'),
('dgonzalez','password','Diego','Gonzalez','h'),
('garluis','password','Ushia','Garcia','m'),
('pemento','password','Sin','Chan','h');

INSERT INTO USUARIO_ROL (ID, LOGIN, ROL_ID) VALUES
(1,'mpegea',1),
(2,'mpegea',2),
(3,'sabio',2),
(4,'sabio',2),
(5,'cemento',2),
(6,'phill',2),
(7,'muecas',2),
(8,'mf25',2),
(9,'aglua',2),
(10,'ivandd',2),
(11,'dgonzalez',2),
(12,'garluis',2),
(13,'pemento',2);

INSERT INTO PAREJA (ID, JUGADOR_1, JUGADOR_2, CAPITAN) VALUES
(1,'mpegea','ivandd','mpegea'),
(2,'mpegea','cemento','cemento'),
(3,'ivandd','cemento','ivandd'),
(4,'phill','ivandd','phill'),
(5,'aglua','dgonzalez','aglua'),
(6,'garluis','mpegea','garluis'),
(7,'pemento','cemento','pemento'),
(8,'mf25','ivandd','mf25'),
(9,'muecas','cemento','muecas'),
(10,'sabio','ivandd','sabio');

INSERT INTO PISTA (ID, NOMBRE, TIPO) VALUES
(1,'A1','Moqueta'),
(2,'A2','Moqueta'),
(3,'A3','Moqueta'),
(4,'A4','Moqueta'),
(5,'A5','Moqueta'),
(6,'B1','Hierba'),
(7,'B2','Hierba'),
(8,'B3','Hierba'),
(9,'C1','Hormigon'),
(10,'C2','Hormigon');

INSERT INTO CAMPEONATO (ID, NOMBRE, FECHA) VALUES
(1,'PADEL WORLD CUP ESEI','2019-01-24');

INSERT INTO CLASIFICACION (ID, PAREJA_ID, PUESTO, PUNTOS, CAMPEONATO_ID) VALUES
(1, 1, 1, 15, 1),
(2, 3, 2, 14, 1),
(3, 5, 3, 10, 1),
(4, 6, 4, 9, 1),
(5, 7, 5, 1, 1);

INSERT INTO INSCRIPCION (ID, NIVEL, GENERO, GRUPO, PAREJA_ID, CAMPEONATO_ID) VALUES
(1,1,'m',NULL,1,1),
(2,1,'x',NULL,3,1),
(3,1,'x',NULL,5,1),
(4,1,'x',NULL,6,1),
(5,1,'x',NULL,7,1);

INSERT INTO RESERVA (ID, USUARIO_LOGIN, PISTA_ID, FECHA) VALUES
(1,'mpegea',1,'2019-01-24'),
(2,'mpegea',2,'2019-01-24'),
(3,'mpegea',3,'2019-01-24'),
(4,'mpegea',4,'2019-01-24'),
(5,'mpegea',5,'2019-01-24'),
(6,'mpegea',6,'2019-01-24'),
(7,'mpegea',7,'2019-01-24'),
(8,'mpegea',8,'2019-01-24'),
(9,'mpegea',9,'2019-01-24'),
(10,'mpegea',10,'2019-01-24');


INSERT INTO ENFRENTAMIENTO (ID, FECHA, NIVEL, GENERO, GRUPO, RESULTADO, PAREJA_1, PAREJA_2, RESERVA_ID) VALUES
(1,'2019-01-24',1,'x','A','2-1',1,3,1),
(2,'2019-01-24',1,'x','A','2-1',3,1,2),
(3,'2019-01-24',1,'x','A','1-2',1,5,3),
(4,'2019-01-24',1,'x','A','1-2',5,1,4),
(5,'2019-01-24',1,'x','A','2-1',3,5,5),
(6,'2019-01-24',1,'x','A','2-1',5,3,6),
(7,'2019-01-24',1,'x','A','1-2',5,6,7),
(8,'2019-01-24',1,'x','A','2-1',6,5,8),
(9,'2019-01-24',1,'x','A','2-1',6,7,9),
(10,'2019-01-24',1,'x','A','1-2',7,6,10);

INSERT INTO HUECO (ID, FECHA, ENFRENTAMIENTO_ID, PAREJA_ID) VALUES
(1,'2019-01-24',1,1),
(2,'2019-01-25',1,1),
(3,'2019-01-26',1,1),
(4,'2019-01-27',1,1),
(5,'2019-01-28',1,1),
(7,'2019-01-29',1,1),
(8,'2019-01-30',1,1),
(9,'2019-01-31',1,1),
(10,'2019-01-01',1,1);

INSERT INTO PARTIDO (ID , FECHA, RESERVA_ID) VALUES
(1,'2019-10-28',NULL),
(2,'2019-10-28',NULL),
(3,'2019-10-28',NULL),
(4,'2019-10-28',NULL),
(5,'2019-10-28',NULL),
(6,'2019-10-28',NULL),
(7,'2019-10-28',NULL),
(8,'2019-10-28',NULL),
(9,'2019-10-28',NULL),
(10,'2019-10-28',NULL);

INSERT INTO USUARIO_PARTIDO (ID, USUARIO_LOGIN, PARTIDO_ID) VALUES
(1,'mpegea',1),
(2,'ivandd',1),
(3,'phill',1),
(4,'cemento',1),
(5,'mf25',2),
(6,'muecas',2),
(7,'aglua',2),
(8,'dgonzalez',2),
(9,'mpegea',3),
(10,'ivandd',3);
