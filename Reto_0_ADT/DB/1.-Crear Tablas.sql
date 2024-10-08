DROP DATABASE IF EXISTS EXAMENDB;
CREATE DATABASE IF NOT EXISTS EXAMENDB;
USE EXAMENDB;

CREATE TABLE UNIDADDIDACTICA (
ID INT PRIMARY KEY,
ACRONIMO VARCHAR(50),
TITULO VARCHAR(100),
EVALUACION VARCHAR(50),
DESCRIPCION VARCHAR(150)
);


CREATE TABLE ENUNCIADO (
ID INT PRIMARY KEY,
DESCRIPCION VARCHAR(50),
NIVEL ENUM('ALTA', 'MEDIA', 'BAJA'),
DISPONIBLE BOOL,
RUTA VARCHAR(50)
);


CREATE TABLE UNIDADENUNCIADO (
UNIDADID INT,
ENUNCIADOID INT,
PRIMARY KEY (UNIDADID,ENUNCIADOID),
FOREIGN KEY (UNIDADID) REFERENCES UNIDADDIDACTICA(ID) ON DELETE CASCADE,
FOREIGN KEY (ENUNCIADOID) REFERENCES ENUNCIADO(ID) ON DELETE CASCADE
);


CREATE TABLE CONVOCATORIAEXAMEN (
ID INT PRIMARY KEY,
CONVOCATORIA VARCHAR(50),
DESCRIPCION VARCHAR(50),
FECHA DATE,
CURSO VARCHAR(50),
ENUNCIADOID INT,
FOREIGN KEY (ENUNCIADOID) REFERENCES ENUNCIADO(ID) ON DELETE CASCADE
);

-- Insertar registros en UNIDADDIDACTICA
INSERT INTO UNIDADDIDACTICA (ID, ACRONIMO, TITULO, EVALUACION, DESCRIPCION) VALUES
(1, 'UD1', 'Unidad Didáctica 1', 'Examen', 'Descripción de la Unidad Didáctica 1'),
(2, 'UD2', 'Unidad Didáctica 2', 'Práctica', 'Descripción de la Unidad Didáctica 2');

-- Insertar registros en ENUNCIADO
INSERT INTO ENUNCIADO (ID, DESCRIPCION, NIVEL, DISPONIBLE, RUTA) VALUES
(1, 'Enunciado 1', 'ALTA', TRUE, 'doc/Enunciado01.docx'),
(2, 'Enunciado 2', 'MEDIA', TRUE, 'doc/Enunciado02.docx');

-- Insertar registros en UNIDADENUNCIADO
INSERT INTO UNIDADENUNCIADO (UNIDADID, ENUNCIADOID) VALUES
(1, 1),  -- Relaciona Unidad Didáctica 1 con Enunciado 1
(1, 2),  -- Relaciona Unidad Didáctica 1 con Enunciado 2
(2, 1),  -- Relaciona Unidad Didáctica 2 con Enunciado 1
(2, 2);  -- Relaciona Unidad Didáctica 2 con Enunciado 2

-- Insertar registros en CONVOCATORIAEXAMEN
INSERT INTO CONVOCATORIAEXAMEN (ID, CONVOCATORIA, DESCRIPCION, FECHA, CURSO, ENUNCIADOID) VALUES
(1, 'Convocatoria 1', 'Descripción Convocatoria 1', '2024-10-01', 'Curso 1', 1),  -- Enunciado 1
(2, 'Convocatoria 2', 'Descripción Convocatoria 2', '2024-10-15', 'Curso 2', 2);  -- Enunciado 2
