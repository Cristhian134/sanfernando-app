DROP TABLE IF EXISTS incidencia;
DROP TABLE IF EXISTS incidencia_tipo;
DROP TABLE IF EXISTS licencia_tipo;
DROP TABLE IF EXISTS norma;
DROP TABLE IF EXISTS norma_tipo;
DROP TABLE IF EXISTS procedimiento;
DROP TABLE IF EXISTS procedimiento_tipo;
DROP TABLE IF EXISTS transportista;
DROP TABLE IF EXISTS transportista_estado;
DROP TABLE IF EXISTS pedido_tipo;
DROP TABLE IF EXISTS vehiculo;
DROP TABLE IF EXISTS vehiculo_estado;
DROP TABLE IF EXISTS vehiculo_modelo;
DROP TABLE IF EXISTS traslado;



CREATE TABLE IF NOT EXISTS incidencia (
 cod_incidencia SERIAL NOT NULL,
 id_traslado INT NOT NULL,
 cod_tipo_incidencia CHAR(1) NOT NULL,
 descripcion VARCHAR(128) NULL DEFAULT NULL,
 fecha_ocurrencia DATE NULL DEFAULT NULL,
 hora_ocurrencia TIME NOT NULL,
 PRIMARY KEY (cod_incidencia),
 CONSTRAINT id_traslado
 FOREIGN KEY (id_traslado)
 REFERENCES traslado (id_traslado),
 CONSTRAINT cod_tipo_incidencia
 FOREIGN KEY (cod_tipo_incidencia)
 REFERENCES incidencia_tipo (cod_tipo_incidencia)
);

CREATE TABLE IF NOT EXISTS incidencia_tipo (
 cod_tipo_incidencia CHAR(1) NOT NULL,
 descripcion VARCHAR(60) NULL DEFAULT NULL,
 PRIMARY KEY (cod_tipo_incidencia)
);

CREATE TABLE IF NOT EXISTS licencia_tipo (
 cod_tipo_licencia CHAR(1) NOT NULL,
 descripcion VARCHAR(20) NULL DEFAULT NULL,
 PRIMARY KEY (cod_tipo_licencia)
);

CREATE TABLE IF NOT EXISTS norma (
cod_norma SERIAL NOT NULL,
cod_incidencia INT NOT NULL,
cod_norma_tipo CHAR(1) NOT NULL,
fecha_emision DATE NOT NULL,
fecha_vigencia DATE NOT NULL,
PRIMARY KEY (cod_norma),
CONSTRAINT cod_incidencia
 FOREIGN KEY (cod_incidencia)
 REFERENCES incidencia (cod_incidencia),
CONSTRAINT cod_norma_tipo
 FOREIGN KEY (cod_norma_tipo)
 REFERENCES norma_tipo (cod_norma_tipo)
);


CREATE TABLE IF NOT EXISTS norma_tipo (
 cod_norma_tipo CHAR(1) NOT NULL,
 descripcion VARCHAR(60) NULL DEFAULT NULL,
 PRIMARY KEY (cod_norma_tipo)
);

CREATE TABLE IF NOT EXISTS procedimiento (
cod_procedimiento SERIAL NOT NULL,
cod_incidencia INT NOT NULL,
cod_tipo_procedimiento CHAR(1) NOT NULL,
nombre VARCHAR(64) NULL DEFAULT NULL,
tiempo_estimado INT NOT NULL CHECK (tiempo_estimado > 0),
PRIMARY KEY (cod_procedimiento),
CONSTRAINT cod_tipo_procedimiento
 FOREIGN KEY (cod_tipo_procedimiento)
 REFERENCES procedimiento_tipo (cod_tipo_procedimiento),
CONSTRAINT cod_incidencia
 FOREIGN KEY (cod_incidencia)
 REFERENCES incidencia (cod_incidencia)
);

CREATE TABLE IF NOT EXISTS procedimiento_tipo (
 cod_tipo_procedimiento CHAR(1) NOT NULL,
 descripcion VARCHAR(60) NULL DEFAULT NULL,
 PRIMARY KEY (cod_tipo_procedimiento)
);

CREATE TABLE IF NOT EXISTS transportista (
cod_transportista SERIAL NOT NULL,
cod_empleado INT NOT NULL,
cod_estado_transportista CHAR(1) DEFAULT NULL,
cod_tipo_licencia CHAR(1) NULL DEFAULT NULL,
num_licencia VARCHAR(7) NULL DEFAULT NULL,
fecha_vencimiento_licencia DATE NOT NULL,
fecha_ultimo_traslado DATE NULL DEFAULT NULL,
hora_ultimo_traslado TIME NOT NULL,
PRIMARY KEY (cod_transportista),
CONSTRAINT cod_empleado
 FOREIGN KEY (cod_empleado)
 REFERENCES empleado (cod_empleado),
CONSTRAINT cod_estado_transportista
 FOREIGN KEY (cod_estado_transportista)
 REFERENCES transportista_estado (cod_estado_transportista),
CONSTRAINT cod_tipo_licencia
 FOREIGN KEY (cod_tipo_licencia)
 REFERENCES licencia_tipo (cod_tipo_licencia)
);


CREATE TABLE IF NOT EXISTS transportista_estado (
 cod_estado_transportista CHAR(1) NOT NULL,
 descripcion VARCHAR(20) NULL DEFAULT NULL,
 PRIMARY KEY (cod_estado_transportista)
);


CREATE TABLE IF NOT EXISTS vehiculo (
 cod_vehiculo SERIAL NOT NULL,
 cod_pedido_tipo CHAR(1) NOT NULL,
 cod_vehiculo_estado CHAR(1) NOT NULL,
 año_fabricacion INT NOT NULL,
 fecha_ultimo_mantenimiento DATE NOT NULL,
 fecha_ultimo_viaje DATE NOT NULL,
 hora_ultimo_viaje TIME NOT NULL, 
 capacidad_carga FLOAT NOT NULL CHECK (capacidad_carga > 0),
 cod_vehiculo_modelo CHAR(1) NOT NULL,
 placa CHAR(7) NOT NULL,
 PRIMARY KEY (cod_vehiculo),
 CONSTRAINT cod_pedido_tipo
 FOREIGN KEY (cod_pedido_tipo)
 REFERENCES tipo_pedido(cod_pedido_tipo),
 CONSTRAINT cod_vehiculo_estado
 FOREIGN KEY (cod_vehiculo_estado)
 REFERENCES vehiculo_estado (cod_vehiculo_estado),
 CONSTRAINT cod_vehiculo_modelo
 FOREIGN KEY (cod_vehiculo_modelo)
 REFERENCES vehiculo_modelo (cod_vehiculo_modelo)
);

CREATE TABLE IF NOT EXISTS vehiculo_estado (
 cod_vehiculo_estado CHAR(1),
 descripcion VARCHAR(20),
 PRIMARY KEY (cod_vehiculo_estado)
);

CREATE TABLE IF NOT EXISTS vehiculo_modelo (
 cod_vehiculo_modelo CHAR(1),
 descripcion VARCHAR(20),
 PRIMARY KEY (cod_vehiculo_modelo)
);

CREATE TABLE IF NOT EXISTS traslado (
 id_traslado SERIAL,
 cod_guia_remision CHAR(21) NOT NULL,
 cod_vehiculo INT NOT NULL,
 cod_ruta INT NOT NULL,
 cod_transportista INT NOT NULL,
 id_operacion_inicia INT NOT NULL,
 id_operacion_termina INT NULL DEFAULT NULL,
 PRIMARY KEY (id_traslado),
 CONSTRAINT id_operacion_inicia
 FOREIGN KEY (id_operacion_inicia)
 REFERENCES operacion (id_operacion),
 CONSTRAINT id_operacion_termina
 FOREIGN KEY (id_operacion_termina)
 REFERENCES operacion (id_operacion),
 CONSTRAINT cod_ruta
 FOREIGN KEY (cod_ruta)
 REFERENCES ruta (cod_ruta),
 CONSTRAINT cod_transportista
 FOREIGN KEY (cod_transportista)
 REFERENCES transportista (cod_transportista),
 CONSTRAINT cod_vehiculo
 FOREIGN KEY (cod_vehiculo)
 REFERENCES vehiculo (cod_vehiculo)
);

CREATE TABLE IF NOT EXISTS pedido_tipo (
 cod_pedido_tipo CHAR(1) NOT NULL,
 tipo_pedido VARCHAR(20) NULL,
 PRIMARY KEY (cod_pedido_tipo)
);


INSERT INTO incidencia_tipo (cod_tipo_incidencia,descripcion) VALUES
  ( 'A',  'Incidencia de tipo A: retrasos en la entrega'),
  ( 'B',  'Incidencia de tipo B: errores en el etiquetado o embalaje'),     
  ( 'C',  'Incidencia de tipo C: fallas en la documentación'),
  ( 'D',  'Incidencia de tipo D: problemas mecánicos con el vehículo'),
  ( 'E',  'Incidencia de tipo E: error en la asignación de ruta');

INSERT INTO incidencia (id_traslado,cod_tipo_incidencia,descripcion,fecha_ocurrencia, hora_ocurrencia) VALUES
  ( 1, 'A', 'La fecha de entrega no coincide con la fecha establecida de llegada','2024-04-24','04:53:21'),
  ( 2, 'B', 'Hay paquetes que no están sellados correctamente', '2024-05-03','04:53:21'),
  ( 2, 'C', 'El transportista no se le dio la documentación correspondiente', '2024-05-05','04:53:21'),
  ( 1, 'D', 'El vehículo asignado no enciende', '2024-04-28','04:53:21'),
  ( 2, 'E', 'La direccion no coincide con el pedido del cliente', '2024-05-08','04:53:21'),
  ( 2, 'C', 'La documentación presenta datos erróneos', '2024-05-10','04:53:21'),
  ( 1, 'D', 'El vehiculo sufrió derrame de aceite ', '2024-04-30', '04:53:21'),
  ( 2, 'E', 'La direccion asignada presenta demasiado tráfico', '2024-05-12','04:53:21'),
  ( 1, 'B', 'El sello del paquete está dañado', '2024-04-30','04:53:21'),
  ( 1, 'A', 'Ocurrió un accidente en la carretera que retrasó la entrega del pedido', '2024-05-02','04:53:21');

INSERT INTO licencia_tipo (cod_tipo_licencia,descripcion) VALUES
 ( 'X', 'A-IIb'),
 ( 'Y', 'A-IIIb');

INSERT INTO norma (cod_norma, cod_incidencia, cod_norma_tipo, fecha_emision, fecha_vigencia) VALUES
  (1, 1, 'X', '2019-01-24', '2025-01-24'),
  (2, 2, 'Y', '2021-02-21', '2029-02-21'),
  (3, 3, 'Z', '2020-02-17', '2026-02-17'),
  (4, 4, 'W', '2017-03-28', '2027-03-28'),
  (5, 5, 'X', '2005-03-15', '2025-01-24'),
  (6, 6, 'Y', '2027-03-21', '2029-02-21'),
  (7, 7, 'W', '2018-02-17', '2026-02-17'),
  (8, 8, 'X', '2015-06-11', '2027-03-28'),
  (9, 9, 'Y', '2018-02-17', '2026-02-17'),
  (10, 10,'X', '2019-01-24', '2025-01-24');

INSERT INTO norma_tipo (cod_norma_tipo,descripcion) VALUES
  ( 'X',  'NTP 209.027'),
  ( 'Y',  'ISO 17712'),     
  ( 'Z',  'ISO 22000'),
  ( 'W',  'ISO 9001');  

INSERT INTO procedimiento (cod_incidencia,cod_tipo_procedimiento,nombre, tiempo_estimado) VALUES
  ( 1,    'A', 'Nro 1:Problema con la entrega',2 ),
  ( 2,    'B', 'Nro 2:Problema con el etiquetado',1),
  ( 3,    'C', 'Nro 3:Problema con la documentacion',4),
  ( 4,    'D', 'Nro 4:Problema con el vehiculo',6),
  ( 5,    'E', 'Nro 5:Problema con la ruta',3),
  ( 6,    'C', 'Nro 6:Problema con el vehiculo',6),
  ( 7,    'D', 'Nro 7:Problema con el vehiculo',6),
  ( 8,    'E', 'Nro 8:Problema con la ruta',3),
  ( 9,    'B', 'Nro 9:Problema con el etiquetado',1),
  (10,   'B', 'Nro 10:Problema con el etiquetado',1);   


INSERT INTO procedimiento_tipo (cod_tipo_procedimiento,descripcion) VALUES
  ( 'A',  'Procedimiento de tipo A: retrasos en la entrega'),
  ( 'B',  'Procedimiento de tipo B: errores en el etiquetado o embalaje'),     
  ( 'C',  'Procedimiento de tipo C: fallas en la documentación'),
  ( 'D',  'Procedimiento de tipo D: problemas mecánicos con el vehículo'),
  ( 'E',  'Procedimiento de tipo E: error en la asignación de ruta');

INSERT INTO transportista (cod_transportista,cod_empleado,cod_estado_transportista,cod_tipo_licencia, num_licencia, fecha_vencimiento_licencia,fecha_ultimo_traslado,hora_ultimo_traslado) VALUES
  ( 1, 6,  'D', 'X','E567890', '2027-01-23', '2024-04-15','04:53:21'),
  ( 2, 12, 'N', 'Y','R487236','2025-01-08', '2024-04-24','04:53:21');

INSERT INTO transportista_estado (cod_estado_transportista,descripcion) VALUES
 ( 'D', 'Disponible'),
 ( 'N', 'No disponible'),
 ( 'C', 'Cuarentena');


INSERT INTO pedido_tipo (cod_pedido_tipo,tipo_pedido) VALUES 
  ('A', 'Abastecimiento'), 
  ('V', 'Venta'); 

INSERT INTO vehiculo (cod_vehiculo, cod_vehiculo_estado,cod_vehiculo_modelo,año_fabricacion, capacidad_carga, fecha_ultimo_mantenimiento,cod_pedido_tipo,fecha_ultimo_viaje, hora_ultimo_viaje,placa) VALUES
  ( 1, 'D', 'F', 2008, 850, '2022-01-10','A','2024-01-24','04:53:21', 'A4E-123'),
  ( 2, 'N', 'C', 2009, 620.5, '2023-02-12','A','2024-02-24','04:53:21','D3F-756'),
  ( 3, 'C', 'S', 2020, 440.2, '2022-03-05','V','2024-03-15','04:53:21','G5I-789'), 
  ( 4, 'D', 'S', 2015, 550, '2021-04-08','V','2024-04-14','04:53:21', 'J4L-223'),
  ( 5, 'N', 'F', 2012, 650, '2023-05-15','A','2024-05-27','04:53:21','M9O-456'),
  ( 6, 'C', 'C', 2021, 600, '2023-06-02','V','2024-06-24', '04:53:21','P3R-789'),
  ( 7, 'C', 'S', 2006, 620.4, '2021-07-18','A','2024-07-24','04:53:21','S5U-123'),
  ( 8, 'D', 'F', 2017, 620.2, '2022-08-10','V','2024-08-24','04:53:21','V4X-456'),
  ( 9, 'N', 'F', 2020, 220, '2023-09-05','V','2024-09-05','04:53:21','Y7A-789'),
  (10, 'C', 'C', 2018, 430, '2022-10-15','A','2024-10-22','04:53:21','B8D-413');

INSERT INTO vehiculo_estado (cod_vehiculo_estado,descripcion) VALUES
 ( 'D', 'Disponible'),
 ( 'N', 'No disponible'),
 ( 'C', 'Cuarentena');


INSERT INTO vehiculo_modelo (cod_vehiculo_modelo,descripcion) VALUES
 ( 'F', 'Furgoneta'),
 ( 'C', 'Camión'),
 ( 'S', 'SUV');


INSERT INTO traslado (id_traslado, cod_guia_remision, cod_vehiculo, cod_ruta, cod_transportista, id_operacion_inicia, id_operacion_termina) VALUES
(1, '000012024040111301200', 2, 2, 2, 5, 6),
(2, '000022024040211301200', 3, 3, 2, 11, 12),
(3, '000032024040212201256', 3, 3, 1, 17, 18),
(4, '000042024040212301300', 3, 3, 2, 23, 24);