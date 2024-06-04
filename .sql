DROP TABLE IF EXISTS reporte;
DROP TABLE IF EXISTS programacion_reporte;

DROP TABLE IF EXISTS reporte_formato;
DROP TABLE IF EXISTS reporte_estado;
DROP TABLE IF EXISTS reporte_frecuencia;
DROP TABLE IF EXISTS reporte_tipo;

CREATE TABLE IF NOT EXISTS reporte_formato (
 cod_reporte_formato INT NOT NULL,
 descripcion VARCHAR(10),
 PRIMARY KEY (cod_reporte_formato)
);

CREATE TABLE IF NOT EXISTS reporte_estado (
 cod_reporte_estado INT NOT NULL,
 descripcion VARCHAR(16),
 PRIMARY KEY (cod_reporte_estado)
);

CREATE TABLE IF NOT EXISTS reporte_frecuencia (
 cod_reporte_frecuencia INT NOT NULL,
 descripcion VARCHAR(16),
 cantidad_tiempo INT NOT NULL,
 unidad_tiempo VARCHAR(16),
 PRIMARY KEY (cod_reporte_frecuencia)
);

CREATE TABLE IF NOT EXISTS reporte_tipo(
 cod_reporte_tipo INT NOT NULL,
 descripcion VARCHAR(16) NOT NULL,
 PRIMARY KEY (cod_reporte_tipo)
);

CREATE TABLE IF NOT EXISTS programacion_reporte (
 cod_programacion_reporte SERIAL NOT NULL,
 cod_representante INT NOT NULL,
 cod_reporte_formato INT NOT NULL,
 cod_reporte_estado INT NULL DEFAULT NULL,
 cod_reporte_tipo INT NOT NULL,
 cod_reporte_frecuencia INT NULL DEFAULT NULL,
 fecha_inicio DATE NOT NULL,
 fecha_fin DATE NOT NULL,
 PRIMARY KEY (cod_programacion_reporte),
 CONSTRAINT cod_representante
  FOREIGN KEY (cod_representante)
  REFERENCES representante (cod_representante),
 CONSTRAINT cod_reporte_formato
  FOREIGN KEY (cod_reporte_formato)
  REFERENCES reporte_formato (cod_reporte_formato),
 CONSTRAINT cod_reporte_estado
  FOREIGN KEY (cod_reporte_estado)
  REFERENCES reporte_estado (cod_reporte_estado),
 CONSTRAINT cod_reporte_frecuencia
  FOREIGN KEY (cod_reporte_frecuencia)
  REFERENCES reporte_frecuencia (cod_reporte_frecuencia),
 CONSTRAINT cod_reporte_tipo
  FOREIGN KEY (cod_reporte_tipo)
  REFERENCES reporte_tipo (cod_reporte_tipo)
);

CREATE TABLE IF NOT EXISTS reporte (
 cod_reporte SERIAL NOT NULL,
 cod_representante INT NOT NULL,
 cod_reporte_formato INT NOT NULL,
 cod_reporte_tipo INT NOT NULL,
 fecha_generacion DATE NOT NULL,
 hora_generacion TIME NOT NULL,
 PRIMARY KEY (cod_reporte),
 CONSTRAINT cod_reporte_formato
  FOREIGN KEY (cod_reporte_formato)
  REFERENCES reporte_formato (cod_reporte_formato),
 CONSTRAINT cod_reporte_tipo
  FOREIGN KEY (cod_reporte_tipo)
  REFERENCES reporte_tipo (cod_reporte_tipo),
 CONSTRAINT cod_representante
  FOREIGN KEY (cod_representante)
  REFERENCES representante (cod_representante)
);


INSERT INTO reporte_frecuencia (cod_reporte_frecuencia,descripcion,cantidad_tiempo,unidad_tiempo) VALUES
  ( 1,  'Diario'    ,         1,  'dia'),
  ( 2,  'Semanal'   ,         7,  'dia'), 
  ( 3,  'Quincenal' ,         15, 'dia'),
  ( 4,  'Mensual'   ,         1,  'mes'),
  ( 5,  'Trimestral',         3,  'mes'),
  ( 6,  'Semestral' ,         6,  'mes'),
  ( 7,  'Prueba (5 seg)'    , 5,  'segundo');

INSERT INTO reporte_formato (cod_reporte_formato,descripcion) VALUES
  ( 1,  'docx'),
  ( 2,  'pdf'), 
  ( 3,  'xlsx'),
  ( 4,  'csv');

INSERT INTO reporte_tipo (cod_reporte_tipo,descripcion) VALUES
  ( 1,  'General'),
  ( 2,  'Reclamos'), 
  ( 3,  'Pedidos'),
  ( 4,  'Almacen'),
  ( 5,  'Seguimiento');

INSERT INTO reporte_estado (cod_reporte_estado,descripcion) VALUES
  ( 1,  'Activo'),
  ( 2,  'Inactivo');  

INSERT INTO programacion_reporte (cod_representante, cod_reporte_formato, cod_reporte_estado, cod_reporte_tipo, cod_reporte_frecuencia, fecha_inicio, fecha_fin) VALUES
  (1, 1, 1, 1, 1, '2024-01-01', '2024-12-31'),
  (2, 2, 1, 2, 2, '2024-02-01', '2024-10-31'),
  (3, 3, 2, 3, 3, '2024-03-01', '2024-12-31'),
  (4, 4, 1, 4, 4, '2024-04-01', '2024-06-30'),
  (1, 2, 1, 1, 5, '2024-05-01', '2024-08-31'),
  (2, 3, 2, 1, 6, '2024-06-01', '2024-12-31'),
  (3, 4, 1, 2, 7, '2024-07-01', '2024-10-31'),
  (4, 1, 2, 3, 1, '2024-08-01', '2024-11-30'),
  (1, 3, 1, 4, 2, '2024-09-01', '2024-12-31'),
  (2, 4, 2, 2, 3, '2024-10-01', '2024-12-31'),
  (3, 1, 1, 1, 4, '2024-11-01', '2024-12-31'),
  (4, 2, 1, 2, 5, '2024-12-01', '2024-12-31'),
  (1, 4, 2, 3, 6, '2024-01-15', '2024-04-30'),
  (2, 1, 1, 4, 7, '2024-02-15', '2024-12-31'),
  (3, 2, 1, 2, 1, '2024-03-15', '2024-04-30'),
  (4, 3, 2, 1, 2, '2024-04-15', '2024-12-31'),
  (1, 4, 1, 2, 3, '2024-05-15', '2024-05-31'),
  (2, 3, 1, 3, 4, '2024-06-15', '2024-12-31'),
  (3, 1, 2, 4, 5, '2024-07-15', '2024-12-31'),
  (4, 2, 1, 3, 6, '2024-08-15', '2024-09-30'),
  (1, 3, 2, 1, 7, '2024-09-15', '2024-12-31'),
  (2, 4, 1, 2, 1, '2024-10-15', '2024-12-31'),
  (3, 2, 2, 3, 2, '2024-11-15', '2024-12-31'),
  (4, 1, 1, 4, 3, '2024-12-15', '2024-12-31'),
  (1, 2, 1, 4, 4, '2024-01-31', '2024-02-28');

INSERT INTO reporte (cod_representante, cod_reporte_formato, cod_reporte_tipo, fecha_generacion, hora_generacion) VALUES
  (1, 1, 1, '2024-06-01', '08:00:00'),
  (2, 2, 2, '2024-06-02', '09:00:00'),
  (3, 3, 3, '2024-06-03', '10:00:00'),
  (4, 4, 4, '2024-06-04', '11:00:00'),
  (1, 2, 1, '2024-06-05', '12:00:00'),
  (2, 3, 1, '2024-06-06', '13:00:00'),
  (3, 4, 2, '2024-06-07', '14:00:00'),
  (4, 1, 3, '2024-06-08', '15:00:00'),
  (1, 3, 4, '2024-06-09', '16:00:00'),
  (2, 4, 2, '2024-06-10', '17:00:00'),
  (3, 1, 1, '2024-06-11', '18:00:00'),
  (4, 2, 2, '2024-06-12', '19:00:00'),
  (1, 4, 3, '2024-06-13', '20:00:00'),
  (2, 1, 4, '2024-06-14', '21:00:00'),
  (3, 2, 3, '2024-06-15', '22:00:00'),
  (4, 3, 1, '2024-06-16', '23:00:00'),
  (1, 4, 2, '2024-06-17', '00:00:00'),
  (2, 3, 3, '2024-06-18', '01:00:00'),
  (3, 1, 4, '2024-06-19', '02:00:00'),
  (4, 2, 1, '2024-06-20', '03:00:00'),
  (1, 3, 1, '2024-06-21', '04:00:00'),
  (2, 4, 2, '2024-06-22', '05:00:00'),
  (3, 2, 3, '2024-06-23', '06:00:00'),
  (4, 1, 4, '2024-06-24', '07:00:00'),
  (1, 2, 1, '2024-06-25', '08:00:00');