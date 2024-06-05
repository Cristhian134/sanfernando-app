DROP TABLE IF EXISTS reporte;
DROP TABLE IF EXISTS programacion_reporte;
DROP TABLE IF EXISTS evidencia;
DROP TABLE IF EXISTS reclamo;
DROP TABLE IF EXISTS seguimiento;
DROP TABLE IF EXISTS norma;
DROP TABLE IF EXISTS procedimiento;
DROP TABLE IF EXISTS incidencia;
DROP TABLE IF EXISTS detalle_ticket_producto;
DROP TABLE IF EXISTS detalle_ticket_traslado;
DROP TABLE IF EXISTS traslado;
DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS detalle_mercancia_stock;
DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS paradero;
DROP TABLE IF EXISTS "local";
DROP TABLE IF EXISTS gps;
DROP TABLE IF EXISTS representante;
DROP TABLE IF EXISTS mercancia;
DROP TABLE IF EXISTS operacion;
DROP TABLE IF EXISTS transportista;
DROP TABLE IF EXISTS empleado;
DROP TABLE IF EXISTS ruta;
DROP TABLE IF EXISTS elemento_catalogo;
DROP TABLE IF EXISTS vehiculo;
DROP TABLE IF EXISTS ticket;
DROP TABLE IF EXISTS ubicacion;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS persona;
DROP TABLE IF EXISTS reporte_formato;
DROP TABLE IF EXISTS reporte_estado;
DROP TABLE IF EXISTS reporte_frecuencia;
DROP TABLE IF EXISTS reporte_tipo;
DROP TABLE IF EXISTS archivo_tipo;
DROP TABLE IF EXISTS evidencia_tipo;
DROP TABLE IF EXISTS nivel_urgencia;
DROP TABLE IF EXISTS estado_reclamo;
DROP TABLE IF EXISTS reclamo_tipo;
DROP TABLE IF EXISTS accion_tipo;
DROP TABLE IF EXISTS norma_tipo;
DROP TABLE IF EXISTS procedimiento_tipo;
DROP TABLE IF EXISTS incidencia_estado;
DROP TABLE IF EXISTS incidencia_tipo;
DROP TABLE IF EXISTS pedido_estado;
DROP TABLE IF EXISTS pedido_tipo;
DROP TABLE IF EXISTS paradero_tipo;
DROP TABLE IF EXISTS local_distrito;
DROP TABLE IF EXISTS local_region;
DROP TABLE IF EXISTS local_tipo;
DROP TABLE IF EXISTS operacion_tipo;
DROP TABLE IF EXISTS licencia_tipo;
DROP TABLE IF EXISTS transportista_estado;
DROP TABLE IF EXISTS empleado_cargo;
DROP TABLE IF EXISTS ruta_tipo;
DROP TABLE IF EXISTS elemento_catalogo_unidad;
DROP TABLE IF EXISTS elemento_catalogo_tipo;
DROP TABLE IF EXISTS segmento;
DROP TABLE IF EXISTS elemento_produccion;
DROP TABLE IF EXISTS vehiculo_modelo;
DROP TABLE IF EXISTS vehiculo_estado;
DROP TABLE IF EXISTS cliente_tipo;
DROP TABLE IF EXISTS cliente_estado;
DROP TABLE IF EXISTS genero;
DROP TABLE IF EXISTS nacionalidad;
DROP TABLE IF EXISTS estado_civil;

/* CREAR LOOKUP TABLES */

CREATE TABLE IF NOT EXISTS estado_civil (
 cod_estado_civil INT NOT NULL,
 descripcion VARCHAR(16),
 PRIMARY KEY (cod_estado_civil)
);

CREATE TABLE IF NOT EXISTS nacionalidad (
 cod_nacionalidad INT NOT NULL,
 descripcion VARCHAR(16),
 PRIMARY KEY (cod_nacionalidad)
);

CREATE TABLE IF NOT EXISTS genero (
 cod_genero INT NOT NULL,
 descripcion VARCHAR(16),
 PRIMARY KEY (cod_genero)
);

CREATE TABLE IF NOT EXISTS cliente_estado (
 cod_cliente_estado CHAR(1) NOT NULL,
 estado_cliente VARCHAR(20) NULL,
 PRIMARY KEY (cod_cliente_estado)

);

CREATE TABLE IF NOT EXISTS cliente_tipo (
 cod_cliente_tipo CHAR(1) NOT NULL,
 tipo_cliente VARCHAR(20) NULL,
 PRIMARY KEY (cod_cliente_tipo)
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

CREATE TABLE IF NOT EXISTS elemento_produccion (
 id_elemento_produccion INT NOT NULL PRIMARY KEY,
 descripcion VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS segmento (
 id_segmento INT NOT NULL PRIMARY KEY,
 descripcion VARCHAR(25) NOT NULL
);

CREATE TABLE IF NOT EXISTS elemento_catalogo_tipo (
 id_elemento_catalogo_tipo INT NOT NULL PRIMARY KEY,
 id_elemento_produccion INT NOT NULL,
 id_segmento INT NOT NULL,
 descripcion VARCHAR(30) NOT NULL,
 FOREIGN KEY (id_elemento_produccion) REFERENCES elemento_produccion (id_elemento_produccion),
 FOREIGN KEY (id_segmento) REFERENCES segmento (id_segmento)
);

CREATE TABLE IF NOT EXISTS elemento_catalogo_unidad (
 cod_unidad INT NOT NULL,
 descripcion VARCHAR(30),
 PRIMARY KEY (cod_unidad)
);

CREATE TABLE IF NOT EXISTS ruta_tipo (
 cod_ruta_tipo INT NOT NULL,
 descripcion VARCHAR(32),
 PRIMARY KEY (cod_ruta_tipo)
);

CREATE TABLE IF NOT EXISTS empleado_cargo (
 cod_empleado_cargo INT NOT NULL,
 descripcion VARCHAR(32),
 PRIMARY KEY (cod_empleado_cargo)
);

CREATE TABLE IF NOT EXISTS transportista_estado (
 cod_estado_transportista CHAR(1) NOT NULL,
 descripcion VARCHAR(20) NULL DEFAULT NULL,
 PRIMARY KEY (cod_estado_transportista)
);

CREATE TABLE IF NOT EXISTS licencia_tipo (
 cod_tipo_licencia CHAR(1) NOT NULL,
 descripcion VARCHAR(20) NULL DEFAULT NULL,
 PRIMARY KEY (cod_tipo_licencia)
);

CREATE TABLE IF NOT EXISTS operacion_tipo (
 cod_tipo_operacion INT NOT NULL,
 descripcion VARCHAR(10),
 PRIMARY KEY (cod_tipo_operacion)
);

CREATE TABLE IF NOT EXISTS local_tipo (
 cod_local_tipo INT NOT NULL,
 descripcion VARCHAR(32),
 PRIMARY KEY (cod_local_tipo)
);

CREATE TABLE IF NOT EXISTS local_region (
 cod_local_region INT NOT NULL,
 descripcion VARCHAR(16),
 PRIMARY KEY (cod_local_region)
);

CREATE TABLE IF NOT EXISTS local_distrito (
 cod_local_distrito INT NOT NULL,
 descripcion VARCHAR(64),
 PRIMARY KEY (cod_local_distrito)
);

CREATE TABLE IF NOT EXISTS paradero_tipo (
 cod_paradero_tipo INT NOT NULL,
 descripcion VARCHAR(32),
 PRIMARY KEY (cod_paradero_tipo)
);

CREATE TABLE IF NOT EXISTS pedido_tipo (
 cod_pedido_tipo CHAR(1) NOT NULL,
 tipo_pedido VARCHAR(20) NULL,
 PRIMARY KEY (cod_pedido_tipo)
);

CREATE TABLE IF NOT EXISTS pedido_estado (
 cod_pedido_estado CHAR(1) NOT NULL,
 estado_pedido VARCHAR(20) NULL,
 PRIMARY KEY (cod_pedido_estado)
);

CREATE TABLE IF NOT EXISTS incidencia_tipo (
 cod_tipo_incidencia CHAR(1) NOT NULL,
 descripcion VARCHAR(60) NULL DEFAULT NULL,
 PRIMARY KEY (cod_tipo_incidencia)
);

CREATE TABLE IF NOT EXISTS incidencia_estado (
 cod_estado_incidencia CHAR(1) NOT NULL,
 descripcion VARCHAR(60) NULL DEFAULT NULL,
 PRIMARY KEY (cod_estado_incidencia)
);

CREATE TABLE IF NOT EXISTS procedimiento_tipo (
 cod_tipo_procedimiento CHAR(1) NOT NULL,
 descripcion VARCHAR(60) NULL DEFAULT NULL,
 PRIMARY KEY (cod_tipo_procedimiento)
);

CREATE TABLE IF NOT EXISTS norma_tipo (
 cod_norma_tipo CHAR(1) NOT NULL,
 descripcion VARCHAR(60) NULL DEFAULT NULL,
 PRIMARY KEY (cod_norma_tipo)
);

CREATE TABLE IF NOT EXISTS accion_tipo (
 cod_tipo_accion CHAR(1) NOT NULL,
 descripcion VARCHAR(60) NULL DEFAULT NULL,
 PRIMARY KEY (cod_tipo_accion)
);

CREATE TABLE IF NOT EXISTS reclamo_tipo (
 cod_tipo_reclamo CHAR(1) NOT NULL,
 descripcion VARCHAR(100) NULL DEFAULT NULL,
 PRIMARY KEY (cod_tipo_reclamo)
);

CREATE TABLE IF NOT EXISTS estado_reclamo (
 cod_estado_reclamo CHAR(1) NOT NULL,
 descripcion VARCHAR(15) NULL DEFAULT NULL,
 PRIMARY KEY (cod_estado_reclamo)
);

CREATE TABLE IF NOT EXISTS nivel_urgencia (
 cod_nivel_urgencia CHAR(1) NOT NULL,
 descripcion VARCHAR(15) NULL DEFAULT NULL,
 PRIMARY KEY (cod_nivel_urgencia)
);

CREATE TABLE IF NOT EXISTS evidencia_tipo (
 cod_tipo_evidencia CHAR(1) NOT NULL,
 descripcion VARCHAR(30) NULL DEFAULT NULL,
 PRIMARY KEY (cod_tipo_evidencia)
);

CREATE TABLE IF NOT EXISTS archivo_tipo (
 cod_tipo_archivo INT NOT NULL,
 descripcion VARCHAR(5) NULL DEFAULT NULL,
 PRIMARY KEY (cod_tipo_archivo)
);

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

/* CREAR TABLAS */

CREATE TABLE IF NOT EXISTS persona (
 cod_persona SERIAL,
 cod_estado_civil INT NOT NULL,
 cod_nacionalidad INT NOT NULL,
 cod_genero INT NOT NULL,
 dni CHAR(8) NOT NULL,
 primer_apellido VARCHAR(32) NULL DEFAULT NULL,
 segundo_apellido VARCHAR(32) NULL DEFAULT NULL,
 prenombre VARCHAR(32) NULL DEFAULT NULL,
 direccion VARCHAR(128) NULL DEFAULT NULL,
 PRIMARY KEY (cod_persona),
 CONSTRAINT cod_estado_civil
 FOREIGN KEY (cod_estado_civil)
 REFERENCES estado_civil (cod_estado_civil),
 CONSTRAINT cod_nacionalidad
 FOREIGN KEY (cod_nacionalidad)
 REFERENCES nacionalidad (cod_nacionalidad),
 CONSTRAINT cod_genero
 FOREIGN KEY (cod_genero)
 REFERENCES genero (cod_genero)
);

CREATE TABLE IF NOT EXISTS cliente (
 cod_cliente SERIAL,
 cod_cliente_tipo CHAR(1) NOT NULL,
 cod_cliente_estado CHAR(1) NOT NULL,
 nombre VARCHAR(32) NOT NULL,
 ruc CHAR(11) NOT NULL,
 razon_social VARCHAR(120) NOT NULL,
 fecha_registro DATE NOT NULL,
 PRIMARY KEY (cod_cliente),
 CONSTRAINT cod_cliente_tipo
 FOREIGN KEY (cod_cliente_tipo)
 REFERENCES cliente_tipo (cod_cliente_tipo),
 CONSTRAINT cod_cliente_estado
 FOREIGN KEY (cod_cliente_estado)
 REFERENCES cliente_estado (cod_cliente_estado)
);

CREATE TABLE IF NOT EXISTS ubicacion (
 cod_ubicacion SERIAL NOT NULL,
 longitud FLOAT NOT NULL,
 latitud FLOAT NOT NULL,
 PRIMARY KEY (cod_ubicacion)
);

CREATE TABLE IF NOT EXISTS ticket (
 cod_ticket SERIAL NOT NULL,
 fecha_entrega DATE NOT NULL,
 PRIMARY KEY (cod_ticket)
);

CREATE TABLE IF NOT EXISTS vehiculo (
 cod_vehiculo SERIAL NOT NULL,
 cod_pedido_tipo CHAR(1) NOT NULL,
 cod_vehiculo_estado CHAR(1) NOT NULL,
 anio_fabricacion INT NOT NULL,
 fecha_ultimo_mantenimiento DATE NOT NULL,
 fecha_ultimo_viaje DATE NOT NULL,
 hora_ultimo_viaje TIME NOT NULL, 
 capacidad_carga FLOAT NOT NULL CHECK (capacidad_carga > 0),
 cod_vehiculo_modelo CHAR(1) NOT NULL,
 placa CHAR(7) NOT NULL,
 PRIMARY KEY (cod_vehiculo),
 CONSTRAINT cod_vehiculo_estado
 FOREIGN KEY (cod_vehiculo_estado)
 REFERENCES vehiculo_estado (cod_vehiculo_estado),
 CONSTRAINT cod_vehiculo_modelo
 FOREIGN KEY (cod_vehiculo_modelo)
 REFERENCES vehiculo_modelo (cod_vehiculo_modelo),
 CONSTRAINT cod_pedido_tipo
 FOREIGN KEY (cod_pedido_tipo)
 REFERENCES pedido_tipo(cod_pedido_tipo)
);

CREATE TABLE IF NOT EXISTS elemento_catalogo (
 id_elemento_catalogo SERIAL NOT NULL,
 nombre VARCHAR(128) NOT NULL,
 id_elemento_catalogo_tipo INT NOT NULL,
 descripcion VARCHAR(256) NOT NULL,
 cod_unidad INT NOT NULL,
 temperatura_minima FLOAT NULL DEFAULT NULL,
 temperatura_maxima FLOAT NULL DEFAULT NULL,
 vida_util FLOAT NULL DEFAULT NULL CHECK (vida_util > 0),
 peso_unitario FLOAT NOT NULL CHECK (peso_unitario > 0),
 PRIMARY KEY (id_elemento_catalogo),
 CONSTRAINT id_elemento_catalogo_tipo
 FOREIGN KEY (id_elemento_catalogo_tipo)
 REFERENCES elemento_catalogo_tipo (id_elemento_catalogo_tipo),
 CONSTRAINT cod_unidad
 FOREIGN KEY (cod_unidad)
 REFERENCES elemento_catalogo_unidad (cod_unidad)
);

CREATE TABLE IF NOT EXISTS ruta (
 cod_ruta SERIAL NOT NULL,
 distancia_total FLOAT NOT NULL CHECK (distancia_total > 0),
 cod_ruta_tipo INT NOT NULL,
 duracion FLOAT NOT NULL CHECK (duracion > 0),
 PRIMARY KEY (cod_ruta),
 CONSTRAINT cod_ruta_tipo
 FOREIGN KEY (cod_ruta_tipo)
 REFERENCES ruta_tipo (cod_ruta_tipo)
);

CREATE TABLE IF NOT EXISTS empleado (
 cod_empleado SERIAL,
 cod_cliente INT NOT NULL,
 cod_persona INT NOT NULL,
 cod_empleado_cargo INT NOT NULL,
 fecha_contrato DATE NOT NULL,
 PRIMARY KEY (cod_empleado),
 CONSTRAINT cod_cliente
 FOREIGN KEY (cod_cliente)
 REFERENCES cliente (cod_cliente),
 CONSTRAINT cod_persona
 FOREIGN KEY (cod_persona)
 REFERENCES persona (cod_persona),
 CONSTRAINT cod_empleado_cargo
 FOREIGN KEY (cod_empleado_cargo)
 REFERENCES empleado_cargo (cod_empleado_cargo)
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

CREATE TABLE IF NOT EXISTS operacion (
 id_operacion SERIAL,
 id_operacion_picking INT NULL DEFAULT NULL,
 cod_empleado_ejecutor INT NOT NULL,
 cod_empleado_supervisor INT NOT NULL,
 fecha DATE NOT NULL,
 hora_inicio TIME NOT NULL,
 hora_fin TIME NOT NULL,
 cod_tipo_operacion INT NOT NULL,
 PRIMARY KEY (id_operacion),
 CONSTRAINT cod_empleado_ejecutor
 FOREIGN KEY (cod_empleado_ejecutor)
 REFERENCES empleado (cod_empleado),
 CONSTRAINT cod_empleado_supervisor
 FOREIGN KEY (cod_empleado_supervisor)
 REFERENCES empleado (cod_empleado),
 CONSTRAINT id_operacion_picking
 FOREIGN KEY (id_operacion_picking)
 REFERENCES operacion (id_operacion),
 CONSTRAINT cod_tipo_operacion
 FOREIGN KEY (cod_tipo_operacion)
 REFERENCES operacion_tipo (cod_tipo_operacion)
);

CREATE TABLE IF NOT EXISTS mercancia (
 id_mercancia SERIAL,
 id_operacion_picking INT NOT NULL,
 nro_precinto CHAR(20) NULL DEFAULT NULL,
 peso_total FLOAT NOT NULL DEFAULT 0,
 PRIMARY KEY (id_mercancia),
 CONSTRAINT id_operacion_picking
 FOREIGN KEY (id_operacion_picking)
 REFERENCES operacion (id_operacion),
 CONSTRAINT uk_nro_precinto UNIQUE (nro_precinto)
);

CREATE TABLE IF NOT EXISTS representante (
 cod_representante SERIAL,
 cod_cliente INT NOT NULL,
 cod_persona INT NOT NULL,
 num_telefono VARCHAR(20) NULL DEFAULT NULL,
 correo_empresarial VARCHAR(50) NULL DEFAULT NULL,
 cargo VARCHAR(40) NULL DEFAULT NULL,
 PRIMARY KEY (cod_representante),
 CONSTRAINT cod_cliente
 FOREIGN KEY (cod_cliente)
 REFERENCES cliente (cod_cliente),
 CONSTRAINT cod_persona
 FOREIGN KEY (cod_persona)
 REFERENCES persona (cod_persona)
);

CREATE TABLE IF NOT EXISTS gps (
 cod_gps SERIAL,
 cod_ubicacion INT NOT NULL,
 cod_vehiculo INT NOT NULL,
 fecha_ubicacion DATE NOT NULL,
 hora_ubicacion TIME NOT NULL,
 PRIMARY KEY (cod_gps),
 CONSTRAINT cod_ubicacion
 FOREIGN KEY (cod_ubicacion)
 REFERENCES ubicacion (cod_ubicacion),
 CONSTRAINT cod_vehiculo
 FOREIGN KEY (cod_vehiculo)
 REFERENCES vehiculo (cod_vehiculo)
);

CREATE TABLE IF NOT EXISTS "local" (
 cod_local SERIAL NOT NULL,
 cod_cliente INT NOT NULL,
 cod_ubicacion INT NOT NULL,
 cod_local_tipo INT NOT NULL,
 cod_local_region INT NOT NULL,
 cod_local_distrito INT NOT NULL,
 calle VARCHAR(64) NULL,
 numero INT NULL,
 pais VARCHAR(8) NOT NULL,
 PRIMARY KEY (cod_local),
 CONSTRAINT cod_cliente
 FOREIGN KEY (cod_cliente)
 REFERENCES cliente (cod_cliente),
 CONSTRAINT cod_ubicacion
 FOREIGN KEY (cod_ubicacion)
 REFERENCES ubicacion (cod_ubicacion),
 CONSTRAINT cod_local_tipo
 FOREIGN KEY (cod_local_tipo)
 REFERENCES local_tipo (cod_local_tipo),
 CONSTRAINT cod_local_region
 FOREIGN KEY (cod_local_region)
 REFERENCES local_region (cod_local_region),
 CONSTRAINT cod_local_distrito
 FOREIGN KEY (cod_local_distrito)
 REFERENCES local_distrito (cod_local_distrito)
);

CREATE TABLE IF NOT EXISTS paradero (
 cod_paradero SERIAL NOT NULL,
 cod_ruta INT NOT NULL,
 cod_local INT NOT NULL,
 cod_paradero_tipo INT NOT NULL,
 orden INT NOT NULL CHECK (orden > 0),
 PRIMARY KEY (cod_paradero),
 CONSTRAINT cod_ruta
 FOREIGN KEY (cod_ruta)
 REFERENCES ruta (cod_ruta),
 CONSTRAINT cod_local
 FOREIGN KEY (cod_local)
 REFERENCES local (cod_local),
 CONSTRAINT cod_paradero_tipo
 FOREIGN KEY (cod_paradero_tipo)
 REFERENCES paradero_tipo (cod_paradero_tipo)
);

CREATE TABLE IF NOT EXISTS stock (
 id_stock SERIAL NOT NULL,
 cod_stock CHAR(17) NOT NULL,
 id_elemento_catalogo INT NOT NULL,
 nro_lote INT NULL DEFAULT NULL,
 fecha_caducidad DATE NOT NULL,
 cantidad_disponible INT NOT NULL CHECK (cantidad_disponible > 0),
 PRIMARY KEY (id_stock),
 CONSTRAINT id_elemento_catalogo
 FOREIGN KEY (id_elemento_catalogo)
 REFERENCES elemento_catalogo (id_elemento_catalogo)
);

CREATE TABLE IF NOT EXISTS detalle_mercancia_stock(
 id_mercancia INT NOT NULL,
 id_stock INT NOT NULL,
 cantidad INT NOT NULL,
 FOREIGN KEY (id_mercancia) REFERENCES mercancia (id_mercancia),
 FOREIGN KEY (id_stock) REFERENCES stock (id_stock),
 PRIMARY KEY (id_mercancia, id_stock)
);

CREATE TABLE IF NOT EXISTS pedido (
 cod_pedido SERIAL,
 cod_representante INT NOT NULL,
 cod_empleado INT NOT NULL,
 cod_pedido_tipo CHAR(1) NULL DEFAULT NULL,
 cod_pedido_estado CHAR(1) NOT NULL,
 fecha_registro DATE NOT NULL,
 cod_ticket INT NOT NULL,
 PRIMARY KEY (cod_pedido),
 CONSTRAINT cod_representante
 FOREIGN KEY (cod_representante)
 REFERENCES representante (cod_representante),
 CONSTRAINT cod_empleado
 FOREIGN KEY (cod_empleado)
 REFERENCES empleado (cod_empleado),
 CONSTRAINT cod_pedido_tipo
 FOREIGN KEY (cod_pedido_tipo)
 REFERENCES pedido_tipo (cod_pedido_tipo),
 CONSTRAINT cod_pedido_estado
 FOREIGN KEY (cod_pedido_estado)
 REFERENCES pedido_estado (cod_pedido_estado),
 CONSTRAINT cod_ticket
 FOREIGN KEY (cod_ticket)
 REFERENCES ticket (cod_ticket)
);

CREATE TABLE IF NOT EXISTS traslado (
 id_traslado SERIAL,
 cod_guia_remision CHAR(21) NULL,
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

CREATE TABLE IF NOT EXISTS detalle_ticket_traslado (
 id_traslado INT NOT NULL,
 cod_ticket INT NOT NULL,
 PRIMARY KEY (id_traslado, cod_ticket),
 CONSTRAINT id_traslado
 FOREIGN KEY (id_traslado)
 REFERENCES traslado (id_traslado),
 CONSTRAINT cod_ticket
 FOREIGN KEY (cod_ticket)
 REFERENCES ticket (cod_ticket)
);


CREATE TABLE IF NOT EXISTS detalle_ticket_producto (
 cod_ticket INT NOT NULL,
 id_elemento_catalogo INT NOT NULL,
 cantidad INT NOT NULL CHECK (cantidad > 0),
 PRIMARY KEY (cod_ticket, id_elemento_catalogo),
 CONSTRAINT cod_ticket
 FOREIGN KEY (cod_ticket)
 REFERENCES ticket (cod_ticket),
 CONSTRAINT id_elemento_catalogo
 FOREIGN KEY (id_elemento_catalogo)
 REFERENCES elemento_catalogo (id_elemento_catalogo)
);

CREATE TABLE IF NOT EXISTS incidencia (
 cod_incidencia SERIAL NOT NULL,
 id_traslado INT NOT NULL,
 cod_tipo_incidencia CHAR(1) NOT NULL,
 descripcion VARCHAR(128) NULL DEFAULT NULL,
 fecha_ocurrencia DATE NULL DEFAULT NULL,
 hora_ocurrencia TIME NOT NULL,
 cod_estado_incidencia CHAR(1) NOT NULL,
 PRIMARY KEY (cod_incidencia),
 CONSTRAINT id_traslado
 FOREIGN KEY (id_traslado)
 REFERENCES traslado (id_traslado),
 CONSTRAINT cod_tipo_incidencia
 FOREIGN KEY (cod_tipo_incidencia)
 REFERENCES incidencia_tipo (cod_tipo_incidencia),
 CONSTRAINT cod_estado_incidencia
 FOREIGN KEY (cod_estado_incidencia)
 REFERENCES incidencia_estado (cod_estado_incidencia)
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

CREATE TABLE IF NOT EXISTS seguimiento (
 cod_seguimiento SERIAL NOT NULL,
 cod_cliente_interno INT NOT NULL,
 cod_tipo_accion CHAR(1) NOT NULL,
 comentario VARCHAR(250) NULL DEFAULT NULL,
 fecha_resolucion DATE NOT NULL,
 numero_caso INT NOT NULL,
 PRIMARY KEY (cod_seguimiento),
 CONSTRAINT cod_cliente_interno
 FOREIGN KEY (cod_cliente_interno)
 REFERENCES cliente (cod_cliente),
 CONSTRAINT cod_tipo_accion
 FOREIGN KEY (cod_tipo_accion)
 REFERENCES accion_tipo (cod_tipo_accion)
);

CREATE TABLE IF NOT EXISTS reclamo (
 cod_reclamo SERIAL NOT NULL,
 cod_representante INT NOT NULL,
 cod_pedido INT NOT NULL,
 cod_seguimiento INT NOT NULL,
 cod_tipo_reclamo CHAR(1) NOT NULL,
 cod_nivel_urgencia CHAR(1) NOT NULL,
 cod_estado_reclamo CHAR(1) NOT NULL,
 comentario VARCHAR(200) NULL DEFAULT NULL,
 fecha_suceso DATE NOT NULL,
 fecha_reclamo DATE NOT NULL,
 PRIMARY KEY (cod_reclamo),
 CONSTRAINT cod_representante
 FOREIGN KEY (cod_representante)
 REFERENCES representante (cod_representante),
 CONSTRAINT cod_pedido
 FOREIGN KEY (cod_pedido)
 REFERENCES pedido (cod_pedido),
 CONSTRAINT cod_seguimiento
 FOREIGN KEY (cod_seguimiento)
 REFERENCES seguimiento (cod_seguimiento),
 CONSTRAINT cod_tipo_reclamo
 FOREIGN KEY (cod_tipo_reclamo)
 REFERENCES reclamo_tipo (cod_tipo_reclamo),
 CONSTRAINT cod_nivel_urgencia
 FOREIGN KEY (cod_nivel_urgencia)
 REFERENCES nivel_urgencia (cod_nivel_urgencia),
 CONSTRAINT cod_estado_reclamo
 FOREIGN KEY (cod_estado_reclamo)
 REFERENCES estado_reclamo (cod_estado_reclamo)
);

CREATE TABLE IF NOT EXISTS evidencia (
 cod_evidencia SERIAL NOT NULL,
 cod_reclamo INT NOT NULL,
 cod_tipo_evidencia CHAR(1) NOT NULL,
 cod_tipo_archivo INT NOT NULL,
 nombre_evidencia VARCHAR(60) NULL DEFAULT NULL,
 PRIMARY KEY (cod_evidencia),
 CONSTRAINT cod_reclamo
 FOREIGN KEY (cod_reclamo)
 REFERENCES reclamo (cod_reclamo),
 CONSTRAINT cod_tipo_evidencia
 FOREIGN KEY (cod_tipo_evidencia)
 REFERENCES evidencia_tipo (cod_tipo_evidencia),
 CONSTRAINT cod_tipo_archivo
 FOREIGN KEY (cod_tipo_archivo)
 REFERENCES archivo_tipo (cod_tipo_archivo)
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

/* LLENAR TABLAS */

INSERT INTO estado_civil( cod_estado_civil, descripcion ) VALUES
 ( 1, 'Soltero'),
 ( 2, 'Casado'),
 ( 3, 'Conviviente'),
 ( 4, 'Divorciado'),
 ( 5, 'Viudo');

INSERT INTO nacionalidad( cod_nacionalidad, descripcion ) VALUES
 ( 1, 'Peruano'),
 ( 2, 'Argentino');

INSERT INTO genero( cod_genero, descripcion ) VALUES
 ( 1, 'Masculino'),
 ( 2, 'Femenino');

INSERT INTO cliente_estado (cod_cliente_estado, estado_cliente) VALUES
 ( 'A', 'Activo'),
 ( 'I', 'Inactivo');

INSERT INTO cliente_tipo (cod_cliente_tipo, tipo_cliente) VALUES
 ( 'I', 'Cliente interno'),
 ( 'E', 'Cliente externo');

INSERT INTO vehiculo_estado (cod_vehiculo_estado,descripcion) VALUES
 ( 'D', 'Disponible'),
 ( 'N', 'No disponible'),
 ( 'C', 'Cuarentena');

INSERT INTO vehiculo_modelo (cod_vehiculo_modelo,descripcion) VALUES
 ( 'F', 'Furgoneta'),
 ( 'C', 'Camión'),
 ( 'S', 'SUV');

INSERT INTO elemento_catalogo_unidad (cod_unidad, descripcion) VALUES
 (1, 'Kilogramo'),
 (2, 'Gramo'),
 (3, 'Litro'),
 (4, 'Mililitro'),
 (5, 'Metro'),
 (6, 'Centímetro'),
 (7, 'Unidad'),
 (8, 'Docena'),
 (9, 'Caja'),
 (10, 'Bolsa'),
 (11, 'Envase'),
 (12, 'Bandeja'),
 (13, 'Paquete'),
 (14, 'Saco'),
 (15, 'Barril'),
 (16, 'Galón');

INSERT INTO elemento_produccion (id_elemento_produccion, descripcion) VALUES
 (1, 'Materia prima'),
 (2, 'Material'),
 (3, 'Producto');

INSERT INTO segmento (id_segmento, descripcion) VALUES
 (1, 'Materiales peligrosos'),
 (2, 'Suministros y repuestos'),
 (3, 'Insumos y etiquetas'),
 (4, 'No aplica');

INSERT INTO elemento_catalogo_tipo (id_elemento_catalogo_tipo, id_elemento_produccion, id_segmento, descripcion) VALUES
 (11, 1, 3, 'Especias y condimentos'),
 (12, 1, 3, 'Aditivos alimentarios'),
 (13, 1, 3, 'Aceites y grasas'),
 (14, 1, 3, 'Harinas'),
 (15, 1, 3, 'Huevos'),
 (16, 1, 3, 'Conservantes'),
 (17, 1, 3, 'Colorantes'),
 (18, 1, 3, 'Emulsionantes'),
 (19, 1, 3, 'Otras materias primas'),
 (21, 2, 2, 'Herramientas'),
 (22, 2, 2, 'Repuestos'),
 (23, 2, 1, 'Químicos'),
 (24, 2, 1, 'Detergentes industriales'),
 (25, 2, 3, 'Etiquetas'),
 (26, 2, 2, 'Otros materiales'),
 (31, 3, 4, 'Pollo congelado'),
 (32, 3, 4, 'Pollo fresco'),
 (33, 3, 4, 'Saborizado');

INSERT INTO ruta_tipo (cod_ruta_tipo,descripcion) VALUES
 ( 1, 'Urbana'),
 ( 2, 'Rural');

INSERT INTO empleado_cargo( cod_empleado_cargo, descripcion ) VALUES
 ( 1, 'Supervisor de Almacén'),
 ( 2, 'Encargado de almacén'),
 ( 3, 'Asistente operativo'),
 ( 4, 'Almacenero'),
 ( 5, 'Transportista'),
 ( 6, 'Técnico de almacén'),
 ( 7, 'Supervisor de producción'),
 ( 8, 'Técnico de mantenimiento');

INSERT INTO transportista_estado (cod_estado_transportista,descripcion) VALUES
 ( 'D', 'Disponible'),
 ( 'N', 'No disponible'),
 ( 'C', 'Cuarentena');

INSERT INTO licencia_tipo (cod_tipo_licencia,descripcion) VALUES
 ( 'X', 'A-IIb'),
 ( 'Y', 'A-IIIb');

INSERT INTO operacion_tipo (cod_tipo_operacion, descripcion) VALUES
 (1, 'Picking'),
 (2, 'Precintado'),
 (3, 'Paletizado'),
 (4, 'Carga'),
 (5, 'Salida'),
 (6, 'Recepción'),
 (7, 'Descarga');

INSERT INTO local_tipo (cod_local_tipo,descripcion) VALUES
 ( 1, 'Almacén'),
 ( 2, 'Recepción'),
 ( 3, 'Venta'),
 ( 4, 'Distribuidora');

INSERT INTO local_region (cod_local_region,descripcion) VALUES
  (1, 'Amazonas'),
  (2, 'Áncash'),
  (3, 'Apurímac'),
  (4, 'Arequipa'),
  (5, 'Ayacucho'),
  (6, 'Cajamarca'),
  (7, 'Callao'),
  (8, 'Cusco'),
  (9, 'Huancavelica'),
  (10, 'Huánuco'),
  (11, 'Ica'),
  (12, 'Junín'),
  (13, 'La Libertad'),
  (14, 'Lambayeque'),
  (15, 'Lima'),
  (16, 'Loreto'),
  (17, 'Madre de Dios'),
  (18, 'Moquegua'),
  (19, 'Pasco'),
  (20, 'Piura'),
  (21, 'Puno'),
  (22, 'San Martín'),
  (23, 'Tacna'),
  (24, 'Tumbes'),
  (25, 'Ucayali');

INSERT INTO local_distrito (cod_local_distrito, descripcion) VALUES
  (1, 'Ancón'),
  (2, 'Ate'),
  (3, 'Barranco'),
  (4, 'Breña'),
  (5, 'Carabayllo'),
  (6, 'Chaclacayo'),
  (7, 'Chorrillos'),
  (8, 'Cieneguilla'),
  (9, 'Comas'),
  (10, 'El Agustino'),
  (11, 'Independencia'),
  (12, 'Jesús María'),
  (13, 'La Molina'),
  (14, 'La Victoria'),
  (15, 'Lima'),
  (16, 'Lince'),
  (17, 'Los Olivos'),
  (18, 'Lurigancho-Chosica'),
  (19, 'Lurín'),
  (20, 'Magdalena del Mar'),
  (21, 'Miraflores'),
  (22, 'Pachacámac'),
  (23, 'Pucusana'),
  (24, 'Pueblo Libre'),
  (25, 'Puente Piedra'),
  (26, 'Punta Hermosa'),
  (27, 'Punta Negra'),
  (28, 'Rímac'),
  (29, 'San Bartolo'),
  (30, 'San Borja'),
  (31, 'San Isidro'),
  (32, 'San Juan de Lurigancho'),
  (33, 'San Juan de Miraflores'),
  (34, 'San Luis'),
  (35, 'San Martín de Porres'),
  (36, 'San Miguel'),
  (37, 'Santa Anita'),
  (38, 'Santa María del Mar'),
  (39, 'Santa Rosa'),
  (40, 'Santiago de Surco'),
  (41, 'Surquillo'),
  (42, 'Villa El Salvador'),
  (43, 'Villa María del Triunfo'),
  (44, 'Huaral'),
  (45, 'Ventanilla'),
  (46, 'Callao');

INSERT INTO paradero_tipo (cod_paradero_tipo,descripcion) VALUES
  ( 1,  'Origen'),
  ( 2,  'Paradero'),
  ( 3,  'Destino');

INSERT INTO pedido_tipo (cod_pedido_tipo,tipo_pedido) VALUES
  ('A', 'Abastecimiento'),
  ('V', 'Venta');

INSERT INTO pedido_estado (cod_pedido_estado, estado_pedido) VALUES
  ('A', 'Aceptado'),
  ('R', 'Rechazado'),
  ('P', 'En proceso'),
  ('F', 'Finalizado');

INSERT INTO incidencia_tipo (cod_tipo_incidencia,descripcion) VALUES
  ( 'A',  'Incidencia de tipo A: retrasos en la entrega'),
  ( 'B',  'Incidencia de tipo B: errores en el etiquetado o embalaje'),
  ( 'C',  'Incidencia de tipo C: fallas en la documentación'),
  ( 'D',  'Incidencia de tipo D: problemas mecánicos con el vehículo'),
  ( 'E',  'Incidencia de tipo E: error en la asignación de ruta');
	
INSERT INTO incidencia_estado (cod_estado_incidencia,descripcion) VALUES
  ( 'S',  'Solucionado'),
  ( 'P',  'Pendiente');   

INSERT INTO procedimiento_tipo (cod_tipo_procedimiento,descripcion) VALUES
  ( 'A',  'Procedimiento de tipo A: retrasos en la entrega'),
  ( 'B',  'Procedimiento de tipo B: errores en el etiquetado o embalaje'),
  ( 'C',  'Procedimiento de tipo C: fallas en la documentación'),
  ( 'D',  'Procedimiento de tipo D: problemas mecánicos con el vehículo'),
  ( 'E',  'Procedimiento de tipo E: error en la asignación de ruta');

INSERT INTO norma_tipo (cod_norma_tipo,descripcion) VALUES
  ( 'X',  'NTP 209.027'),
  ( 'Y',  'ISO 17712'),
  ( 'Z',  'ISO 22000'),
  ( 'W',  'ISO 9001');

INSERT INTO accion_tipo (cod_tipo_accion,descripcion) VALUES
  ('I', 'Investigación'),
  ('E', 'Evaluación'),
  ('R', 'Resarcimiento'),
  ('C', 'Correción');

INSERT INTO reclamo_tipo (cod_tipo_reclamo,descripcion) VALUES
  ( 'A', 'Productos en mal estado o de calidad inferior'),
  ( 'B', 'Cantidad incorrecta de productos recibidos'),
  ( 'C', 'Productos incorrectos o diferentes a los solicitados'),
  ( 'D', 'Embalaje inadecuado que afecta la frescura o la calidad de los productos'),
  ( 'E', 'Retraso en la entrega del pedido'),
  ( 'F', 'Problemas con la facturación o el proceso de pago'),
  ( 'G', 'Problemas relacionados con la limpieza, higiene o seguridad de los productos');

INSERT INTO estado_reclamo (cod_estado_reclamo,descripcion) VALUES
  ( 'A',  'Pendiente'),
  ( 'B', 'En Proceso'),
  ( 'C',   'Resuelto'),
  ( 'D',  'Rechazado');

INSERT INTO nivel_urgencia (cod_nivel_urgencia,descripcion) VALUES
  ( 'B',  'Baja'),
  ( 'M', 'Media'),
  ( 'A',  'Alta');

INSERT INTO evidencia_tipo (cod_tipo_evidencia,descripcion) VALUES
  ( 'C',   'Captura Pantalla'),
  ( 'D',          'Documento'),
  ( 'E',            'Escaneo'),
  ( 'F',         'Fotografía'),
  ( 'G', 'Grabación de audio'),
  ( 'T', 'Testimonio escrito'),
  ( 'V',              'Video');

INSERT INTO archivo_tipo (cod_tipo_archivo, descripcion) VALUES
  ( 1,  'AAC'),
  ( 2,  'AVI'),
  ( 3,  'BMP'),
  ( 4,  'CSV'),
  ( 5, 'DOCX'),
  ( 6, 'FLAC'),
  ( 7,  'GIF'),
  ( 8,  'JPG'),
  ( 9,  'MKV'),
  (10,  'MOV'),
  (11,  'MP3'),
  (12,  'MP4'),
  (13,  'OGG'),
  (14,  'PDF'),
  (15,  'PNG'),
  (16, 'PPTX'),
  (17,  'RTF'),
  (18, 'TIFF'),
  (19,  'TXT'),
  (20,  'WAV'),
  (21, ' WMV'),
  (22, 'XLSX');

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

INSERT INTO persona(cod_estado_civil, cod_nacionalidad, cod_genero, dni, primer_apellido, segundo_apellido, prenombre, direccion ) VALUES
  ( 1,  1,  1,  '77688137',   'López',       'García',     'Juan',      'AV BENAVIDES 1015 MIRAFLORES, Lima'),
  ( 1,  1,  1,  '52359123',   'Mendoza',     'Mendoza',    'Luis',      'Av. Alameda Del Corregidor 3023, Lima'),
  ( 1,  1,  1,  '76464764',   'Rodríguez',   'Valdés',     'Pedro',     'Avenida Heroes Del Cenepa, Lt. 120, Lima'),
  ( 2,  1,  2,  '46729764',   'Martínez',    'Perez',      'Ana',       '2450, Of. 602, Edificio El Dorado, Lima, Trujillo'),
  ( 1,  1,  1,  '79641337',   'Hernández',   'Flores',     'Luis',      'Avenida Los Alamos 345, Chiclayo'),
  ( 3,  1,  2,  '45424873',   'González',    'Martinez',   'Laura',     'Santa Iluminata, Mz. A Lt. 6, Lima'),
  ( 1,  1,  1,  '73283354',   'Ramírez',     'Ramírez',    'Carlos',    'AV DOLORES 119, JOSE LUIS BUSTAMANTE Y RIVERO, Lima'),
  ( 3,  1,  2,  '43783734',   'Vargas',      'Guerrero',   'Diana',     'Avenida Los Cerezos 234, Iquitos'),
  ( 2,  1,  1,  '45373782',   'Paredes',     'Osvaldo',    'Roberto',   'Calle Las Palmeras 567, Tacna'),
  ( 1,  1,  2,  '43787671',   'Torres',      'Lopez',      'Sandra',    'Avenida Los Pinos 890, Puno'),
  ( 2,  1,  1,  '78978464',   'Pérez',       'Alvarez',    'Juan',      'Calle Víctor Reynel, 766, Lima'),
  ( 3,  1,  2,  '75696723',   'García',      'Ruiz',       'Ana',       'Cl 2 Lt 17, Bellavista, Callao'),
  ( 5,  1,  1,  '45396782',   'Rodríguez',   'Jiménez',    'Pedro',     'Cl De La Colina, Narciso Nro 911, Lima'),
  ( 2,  1,  2,  '16786781',   'Fernández',   'Hernández',  'Laura',     'Avenida Trinidad Morán, Mz. J Lt. 2 León Xvi, Arequipa'),
  ( 1,  1,  1,  '16877361',   'Gómez',       'Quispe',     'Miguel',    'Gutiérrez De La Fuente,119,Iv Centenario, Arequipa'),
  ( 2,  1,  2,  '16786455',   'Díaz',        'Navarro',    'Elena',     'LT 25, URB MANUEL AREVALO ETAPA III, LA ESPERANZA, La Libertad'),
  ( 1,  1,  1,  '74524324',   'Sánchez',     'Pérez',      'David',     'AV 13 DE NOVIEMBRE 994 OF 202, EL TAMBO, Junin'),
  ( 4,  1,  2,  '43787353',   'Martín',      'Velázquez',  'Sara',      'Jirón Moquegua, 140, Huanuco'),
  ( 1,  1,  1,  '65775732',   'Ruiz',        'Ruíz',       'Javier',    'Calle Santa Catalina, 384, Cuzco'),
  ( 2,  1,  2,  '86876711',   'Gutiérrez',   'Arroyo',     'Paula',     'AV NICOLAS DE PIEROLA 1518, LA ESPERANZA, La Libertad'),
  ( 3,  1,  1,  '14242781',   'López',       'Cruzado',    'Daniel',    'Isla Sta Cruz Mza C Lt41 Los Cedros de Villa - Chorrillos, Arequipa'),
  ( 2,  1,  2,  '42343272',   'Hernández',   'Flores',     'Lucía',     'CA SANTA MARTA 302 INT 25, AREQUIPA, Arequipa'),
  ( 1,  1,  1,  '78943713',   'Pérez',       'Espinoza',   'Alejandro', 'Av Joaquín Madrid Nro 141, Lima'),
  ( 1,  1,  1,  '78567231',   'Sánchez',     'Chávez',     'David',     'Jirón Sinchi Roca, 310, 376, La Libertad'),
  ( 2,  1,  2,  '20220002',   'Martín',      'Cruz',       'Sara',      'Isla Sta Cruz Mza C Lt41 Los Cedros de Villa - Chorrillos, Arequipa');

INSERT INTO cliente (cod_cliente_tipo, cod_cliente_estado, nombre , ruc , razon_social, fecha_registro) VALUES
  ( 'I', 'A',   'Almacen', '20100154308','SAN FERNANDO S.A.', '2002-06-01'),
  ( 'I', 'A' ,'Atencion al cliente' , '20100154308', 'SAN FERNANDO S.A.', '2002-06-01'),
  ( 'I', 'A' ,'Produccion' , '20100154308', 'SAN FERNANDO S.A.', '2002-06-01'),
  ( 'I', 'A' ,'Mantenimiento' , '20100154308', 'SAN FERNANDO S.A.', '2002-06-01'),
  ( 'E', 'A' ,'PLAZA VEA' , '20100070970', 'SOCIEDAD ANONIMA O S.P.S.A.', '2023-05-15'),
  ( 'E', 'A' ,'Tottus Hipermercado-Tottus' , '20508565934', 'HIPERMERCADOS TOTTUS S.A', '2022-11-28'),
  ( 'E', 'A' ,'Wong & Metro' , '20109072177', 'Cencosud Retail Peru S.A.', '2023-07-03'),
  ( 'E', 'A' ,'Kentucky Fried Chicken' , '20100123330', 'DELOSI S.A.', '2022-10-12'),
  ( 'E', 'A' ,'Pardos Chicken-Planet-Pasquale' , '20510885229', 'SANGUCHES DEL PERU S.A.C', '2024-01-25'),
  ( 'E', 'A' ,'Rockys' , '20513427710', 'Grupo Rokys S.A.C.', '2023-03-08');

INSERT INTO ubicacion (longitud, latitud) VALUES
  ( -11.556595, -77.203523),
  ( -11.501818, -77.226304),
  ( -11.872139, -77.127159),
  ( -11.866499, -77.073656),
  ( -11.518728, -77.205331),
  ( -11.547767, -77.203855),
  ( -11.593654, -77.201504),
  ( -11.728288, -77.165746),
  ( -11.834073, -77.112874),
  ( -11.928733, -77.072607),
  ( -12.007750, -77.056319),
  ( -11.993166, -77.063375),
  ( -12.059688, -77.041633),
  ( -12.089659, -77.023307),
  ( -12.028432, -77.084411),
  ( -12.058004, -77.037207),
  ( -12.051560, -77.031446),
  ( -12.173548, -76.990706),
  ( -12.004222, -77.093759),
  ( -12.034577, -77.047632),
  ( -12.072477, -77.065383),
  ( -12.072888, -77.008987),
  ( -12.049493, -77.112024),
  ( -12.006146, -77.001076),
  ( -12.180751, -77.002283),
  ( -12.169918, -77.023956),
  ( -11.933034, -77.054910),
  ( -12.086610, -77.033145);

INSERT INTO ticket (fecha_entrega) VALUES
  ( '2019-04-27'),
  ( '2021-04-22'),
  ( '2022-01-20'),
  ( '2022-01-22'),
  ( '2022-05-22'),
  ( '2022-11-18'),
  ( '2023-01-20'),
  ( '2023-01-22'),
  ( '2023-03-20'),
  ( '2023-04-20'),
  ( '2023-05-20'),
  ('2023-05-22'),
  ('2023-06-20'),
  ('2023-09-16'),
  ('2023-11-22'),
  ('2023-12-19'),
  ('2024-01-22'),
  ('2024-02-22'),
  ('2024-04-20'),
  ('2024-04-22');

INSERT INTO vehiculo (cod_vehiculo_estado,cod_vehiculo_modelo,anio_fabricacion, capacidad_carga, fecha_ultimo_mantenimiento,cod_pedido_tipo,fecha_ultimo_viaje,hora_ultimo_viaje, placa) VALUES
  ( 'D', 'F', 2008, 850, '2022-01-10','A','2024-01-24','04:53:21', 'A4E-123'),
  ( 'N', 'C', 2009, 620.5, '2023-02-12','A','2024-02-24','04:53:21','D3F-756'),
  ( 'C', 'S', 2020, 440.2, '2022-03-05','V','2024-03-15','04:53:21','G5I-789'), 
  ( 'D', 'S', 2015, 550, '2021-04-08','V','2024-04-14','04:53:21', 'J4L-223'),
  ( 'N', 'F', 2012, 650, '2023-05-15','A','2024-05-27','04:53:21','M9O-456'),
  ( 'C', 'C', 2021, 600, '2023-06-02','V','2024-06-24', '04:53:21','P3R-789'),
  ( 'C', 'S', 2006, 620.4, '2021-07-18','A','2024-07-24','04:53:21','S5U-123'),
  ( 'D', 'F', 2017, 620.2, '2022-08-10','V','2024-08-24','04:53:21','V4X-456'),
  ( 'N', 'F', 2020, 220, '2023-09-05','V','2024-09-05','04:53:21','Y7A-789'),
  ( 'C', 'C', 2018, 430, '2022-10-15','A','2024-10-22','04:53:21','B8D-413');

INSERT INTO elemento_catalogo (nombre, id_elemento_catalogo_tipo, descripcion, cod_unidad, temperatura_maxima, temperatura_minima, vida_util, peso_unitario) VALUES
('Filete de pechuga de pollo San Fernando congelado', 31, 'Filete de pechuga de pollo San Fernando congelado, listo para su uso en la preparación de platos.', 7, -18, -20, 90, 900),
('Pierna de pollo San Fernando congelada', 31, 'Pierna de pollo San Fernando congelada, perfecta para su uso en la elaboración de diversos platos.', 7, -18, -20, 90, 1200),
('Ala de pollo San Fernando congelada', 31, 'Ala de pollo San Fernando congelada, ideal para recetas fáciles y deliciosas.', 7, -18, -20, 90, 800),
('Muslo de pollo San Fernando congelado', 31, 'Muslo de pollo San Fernando congelado, versátil y sabroso para preparaciones culinarias.', 7, -18, -20, 90, 1000),
('Pechuga entera de pollo San Fernando congelada', 31, 'Pechuga entera de pollo San Fernando congelada, fresca y de alta calidad para diversas recetas.', 7, -18, -20, 90, 1500),
('Pierna con encuentro San Fernando fresca', 32, 'Pierna con encuentro de pollo San Fernando fresca, perfecta para asados y platos principales.', 7, 0, -2, 7, 1300),
('Muslo de pollo San Fernando fresco', 32, 'Muslo de pollo San Fernando fresco, jugoso y listo para su uso en una amplia variedad de platos.', 7, 0, -2, 7, 1100),
('Pechuga especial de pollo San Fernando fresca', 32, 'Pechuga especial de pollo San Fernando fresca, de la más alta calidad para platos gourmet.', 7, 0, -2, 7, 1200),
('Pechuga entera de pollo San Fernando fresca', 32, 'Pechuga entera de pollo San Fernando fresca, versátil y perfecta para diversas preparaciones culinarias.', 7, 0, -2, 7, 1400),
('Carne molida de pollo San Fernando fresca', 32, 'Carne molida de pollo San Fernando fresca, ideal para hamburguesas, albóndigas y más.', 7, 0, -2, 7, 900),
('Especias y condimentos Jardín del Sabor para pollo', 11, 'Mezcla de especias y condimentos Jardín del Sabor especialmente seleccionados para realzar el sabor del pollo.', 2, NULL, NULL, 180, 80),
('Aceite de oliva Aceitunas del Sur para cocinar', 13, 'Aceite de oliva Aceitunas del Sur de alta calidad, perfecto para cocinar y aderezar platos.', 4, NULL, NULL, 365, 1000),
('Harina de trigo Trigomar para empanizar', 14, 'Harina de trigo Trigomar ideal para empanizar y darle un acabado crujiente a tus platillos favoritos.', 2, NULL, NULL, 180, 500),
('Huevo fresco Granja Real para rebozar', 15, 'Huevo fresco Granja Real para rebozar y darle un toque especial a tus recetas.', 7, NULL, NULL, 30, 50),
('Conservante natural Biolife para prolongar la vida útil del producto', 16, 'Conservante natural Biolife para prolongar la vida útil del producto, sin aditivos artificiales.', 2, NULL, NULL, 365, 30),
('Colorante natural Chroma para mejorar la apariencia del producto', 17, 'Colorante natural Chroma para mejorar la apariencia del producto, seguro y confiable.', 2, NULL, NULL, 365, 20),
('Emulsionante Quality para mejorar la textura del producto', 18, 'Emulsionante Quality para mejorar la textura del producto, ideal para aplicaciones culinarias.', 2, NULL, NULL, 365, 40),
('Detergente SuperClean', 23, 'Detergente SuperClean para uso industrial, ideal para limpieza profunda y desengrase de equipos y superficies.', 3, NULL, NULL, NULL, 1000),
('Escritorio de oficina', 19, 'Escritorio de oficina, ideal para el área de almacén.', 7, NULL, NULL, NULL, 30000),
('Silla ergonómica', 21, 'Silla ergonómica para atención al cliente, cómoda y resistente.', 7, NULL, NULL, NULL, 8000),
('Ordenador portátil', 21, 'Ordenador portátil para el área de atención al cliente.', 7, NULL, NULL, NULL, 2000),
('Rollos de papel térmico para impresora', 21, 'Rollos de papel térmico para impresora en el área de atención al cliente.', 8, NULL, NULL, NULL, 500),
('Herramientas de mano básica', 21, 'Herramientas de mano básica para el área de mantenimiento.', 7, NULL, NULL, NULL, 1000),
('Teléfono multifuncional', 21, 'Teléfono multifuncional para el área de atención al cliente.', 7, NULL, NULL, NULL, 1500),
('Estanterías metálicas', 21, 'Estanterías metálicas para el área de almacén.', 7, NULL, NULL, NULL, 20000),
('Mascarillas', 21, 'Mascarillas para el área de producción.', 9, NULL, NULL, NULL, 200),
('Caja registradora', 21, 'Caja registradora para el área de atención al cliente.', 7, NULL, NULL, NULL, 5000),
('Repuestos para maquinaria industrial', 21, 'Repuestos para maquinaria industrial en el área de mantenimiento.', 7, NULL, NULL, NULL, 300),
('Guantes Latex', 21, 'Guantes Latex para el área de producción.', 9, NULL, NULL, NULL, 100),
('Carretilla elevadora', 21, 'Carretilla elevadora para el área de almacén.', 7, NULL, NULL, NULL, 150000),
('Indumentaria de protección', 21, 'Indumentaria de protección para el área de producción.', 7, NULL, NULL, NULL, 500),
('Cámara de seguridad', 21, 'Cámara de seguridad para el área de almacén.', 7, NULL, NULL, NULL, 3000),
('Gorros Hipotérmicos', 21, 'Gorros Hipotérmicos para el área de producción.', 7, NULL, NULL, NULL, 150),
('Impresora de etiquetas', 21, 'Impresora de etiquetas para el área de almacén.', 7, NULL, NULL, NULL, 8000),
('Kit de herramientas eléctricas', 21, 'Kit de herramientas eléctricas para el área de mantenimiento.', 7, NULL, NULL, NULL, 3000),
('Material de embalaje', 21, 'Material de embalaje para el área de almacén.', 7, NULL, NULL, NULL, 2000);

INSERT INTO ruta (distancia_total, cod_ruta_tipo, duracion) VALUES
  (70.9, 1, 2.4),
  (23.5, 1, 0.8),
  (12.3, 1, 0.4),
  (70.9, 1, 2.4),
  (5.6, 1, 0.2),
  (11.2, 1, 0.4),
  (23, 1, 0.8),
  (16.4, 1, 0.5),
  (7.3, 1, 0.2),
  ( 34.8, 1, 1.2);

INSERT INTO empleado(cod_cliente, cod_persona, cod_empleado_cargo, fecha_contrato ) VALUES
  ( 1, 11, 1, '2021-04-09'),
  ( 1, 12, 1, '2021-06-17'),
  ( 1, 13, 2, '2022-03-20'),
  ( 1, 14, 3, '2021-01-20'),
  ( 1, 15, 4, '2022-01-07'),
  ( 1, 16, 5, '2021-08-09'),
  ( 1, 17, 6, '2021-11-06'),
  ( 1, 18, 6, '2021-07-09'),
  ( 3, 19, 7, '2021-01-09'),
  ( 4, 20, 8, '2021-02-09'),
  ( 4, 21, 3, '2021-05-18'),
  ( 1, 22, 5, '2021-05-18'),
  ( 1, 23, 5, '2021-05-18');

INSERT INTO transportista (cod_empleado,cod_estado_transportista,cod_tipo_licencia, num_licencia, fecha_vencimiento_licencia,fecha_ultimo_traslado,hora_ultimo_traslado) VALUES
  ( 6,  'D', 'X','E567890', '2027-01-23', '2024-04-15','04:53:21'),
  ( 12, 'N', 'Y','R487236','2025-01-08', '2024-04-24','04:53:21');

INSERT INTO representante (num_telefono,correo_empresarial,cargo,cod_cliente,cod_persona) VALUES
  ('(+51) 943 567 890',              'juan.lopez@sanfernando.com',                 'Gerente de Almacén',  1,  1),
  ('(+51) 976 345 678',            'diana.vargas@sanfernando.com', 'Supervisora de Atención al Cliente',  2,  2),
  ('(+51) 983 912 345',         'roberto.paredes@sanfernando.com',              'Gerente de Producción',  3,  3),
  ('(+51) 944 567 891',           'sandra.torres@sanfernando.com',       'Supervisora de Mantenimiento',  4,  4),
  ('(+51) 981 234 567',  'luis.mendoza@supermercadosperuanos.com',               'Supervisor de Ventas',  5,  5),
  ('(+51) 957 890 123', 'pedro.rodriguez@hipermercadostottus.com',                 'Gerente de Compras',  6,  6),
  ('(+51) 992 456 789',     'ana.martinez@CencosudRetailPeru.com',           'Supervisora de Logística',  7,  7),
  ('(+51) 945 678 901',               'luis.hernandez@delosi.com',             'Gerente de Operaciones',  8,  8),
  ('(+51) 965 123 456',     'laura.gonzalez@sanguchesdelperu.com',             'Supervisora de Compras',  9,  9),
  ('(+51) 954 789 012',           'carlos.ramirez@gruporokys.com',               'Gerente de Logística', 10, 10);

INSERT INTO operacion (id_operacion_picking, cod_empleado_ejecutor, cod_empleado_supervisor, fecha, hora_inicio, hora_fin, cod_tipo_operacion) VALUES
(NULL, 1, 4, '2024-04-01', '08:00:00', '08:30:00', 1),
(1, 1, 4, '2024-04-01', '08:45:00', '09:15:00', 2),
(1, 1, 4, '2024-04-01', '09:30:00', '10:30:00', 3),
(1, 1, 4, '2024-04-01', '10:45:00', '11:15:00', 4),
(1, 1, 4, '2024-04-01', '11:30:00', '12:00:00', 5),
(1, 1, 4, '2024-04-01', '14:00:00', '14:30:00', 6),
(NULL, 13, 4, '2024-04-02', '08:00:00', '08:35:00', 1),
(7, 13, 4, '2024-04-02', '08:45:00', '09:15:00', 2),
(7, 13, 4, '2024-04-02', '09:30:00', '10:30:00', 3),
(7, 13, 4, '2024-04-02', '10:45:00', '11:15:00', 4),
(7, 13, 4, '2024-04-02', '11:30:00', '12:00:00', 5),
(7, 1, 4, '2024-04-02', '17:00:00', '17:18:00', 6),
(NULL, 13, 4, '2024-04-02', '09:15:00', '09:30:00', 1),
(13, 12, 4, '2024-04-02', '09:42:00', '10:10:00', 2),
(13, 12, 4, '2024-04-02', '10:20:00', '11:10:00', 3),
(13, 12, 4, '2024-04-02', '12:15:00', '12:05:00', 4),
(13, 12, 4, '2024-04-02', '12:20:00', '12:56:00', 5),
(13, 1, 4, '2024-04-02', '18:20:00', '18:56:00', 6),
(NULL, 13, 4, '2024-04-02', '10:00:00', '10:35:00', 1),
(19, 13, 4, '2024-04-02', '10:45:00', '10:15:00', 2),
(19, 13, 4, '2024-04-02', '10:30:00', '11:30:00', 3),
(19, 13, 4, '2024-04-02', '11:45:00', '12:15:00', 4),
(19, 13, 4, '2024-04-02', '12:30:00', '13:00:00', 5),
(19, 1, 4, '2024-04-02', '18:20:00', '18:56:00', 6);

INSERT INTO mercancia (id_operacion_picking, nro_precinto, peso_total) VALUES
(1, '00002202404010800011', 12000),
(1, '00002202404010800023', 7500),
(1, '00002202404010800044', 5500),
(7, '00008202404020800055', 13500),
(7, '00008202404020800067', 15000),
(13, '00014202404020900087', 750),
(13, '00014202404020900098', 600),
(19, '00020202404021000019', 18000),
(19, '00020202404021000021', 16500);

INSERT INTO stock (cod_stock, id_elemento_catalogo, nro_lote, fecha_caducidad, cantidad_disponible) VALUES
('00001-00001-00123', 1, 123, '2024-04-01', 1000),
('00002-00002-00124', 2, 124, '2024-04-02', 2000),
('00003-00003-00125', 3, 125, '2024-04-03', 5000),
('00004-00004-00126', 4, 126, '2024-04-04', 3000),
('00005-00005-00127', 5, 127, '2024-04-05', 4000),
('00006-00006-00128', 6, 128, '2024-04-06', 6000),
('00007-00007-00129', 7, 129, '2024-04-07', 7000),
('00008-00008-00130', 8, 130, '2024-04-08', 8000),
('00009-00009-00131', 9, 131, '2024-04-09', 9000),
( '00010-00001-00132', 1, 132, '2024-04-10', 2500),
( '00011-00011-00223', 11, 223, '2024-04-01', 1000),
( '00012-00011-00224', 11, 224, '2024-04-02', 2000),
( '00013-00012-00225', 12, 225, '2024-04-03', 1000),
( '00014-00012-00226', 12, 226, '2024-04-04', 1050),
( '00015-00013-00227', 13, 227, '2024-04-05', 1010),
( '00016-00014-00228', 14, 228, '2024-04-06', 1000),
( '00017-00015-00229', 15, 229, '2024-04-07', 8000),
( '00018-00016-00230', 16, 230, '2024-04-08', 7000),
( '00019-00017-00231', 17, 231, '2024-04-09', 3000),
( '00020-00010-00232', 10, 232, '2024-04-10', 4000),
( '00021-00009-00233', 9, 233, '2024-04-11', 1500),
( '00022-00008-00234', 8, 234, '2024-04-12', 1700),
( '00023-00007-00235', 7, 235, '2024-04-13', 1600),
( '00024-00007-00236', 7, 236, '2024-04-14', 1200),
( '00025-00007-00237', 7, 237, '2024-04-15', 1030);

INSERT INTO traslado (cod_guia_remision, cod_vehiculo, cod_ruta, cod_transportista, id_operacion_inicia, id_operacion_termina) VALUES
('000012024040111301200', 2, 2, 2, 5, 6),
('000022024040211301200', 3, 3, 2, 11, 12),
('000032024040212201256', 3, 3, 1, 17, 18),
('000042024040212301300', 3, 3, 2, 23, 24);

INSERT INTO detalle_mercancia_stock (id_mercancia, id_stock, cantidad) VALUES
(1, 1, 10),
(1, 2, 5),
(1, 3, 15),
(2, 4, 10),
(2, 5, 5),
(3, 6, 10),
(3, 7, 5),
(4, 8, 10),
(4, 9, 5),
(4, 10, 15),
(5, 11, 10),
(5, 12, 5),
(5, 13, 15),
(6, 14, 10),
(6, 15, 5),
(6, 16, 15),
(7, 17, 10),
(7, 18, 5),
(7, 19, 15),
(8, 20, 10),
(8, 21, 5),
(8, 22, 15),
(9, 23, 10),
(9, 24, 5),
(9, 25, 15);

INSERT INTO detalle_ticket_producto (cod_ticket, id_elemento_catalogo, cantidad) VALUES
  (1, 25, 5),
  (1, 19, 2),
  (1, 30, 10),
  (2, 27, 2),
  (3, 20, 6),
  (3, 24, 3),
  (4, 36, 100),
  (4, 32, 1),
  (5, 31, 15),
  (5, 29, 12),
  (6, 33, 12),
  (7, 35, 5),
  (8, 28, 20),
  (8, 23, 2),
  (9, 34, 4),
  (10, 2, 1000),
  (11, 3, 1000),
  (12, 5, 1000),
  (13, 6, 1000),
  (14, 4, 1000),
  (15, 4, 1000),
  (16, 7, 1000),
  (16, 11, 1000),
  (17, 18, 50),
  (18, 1, 1000),
  (18, 15, 1000),
  (19, 9, 1000),
  (20, 14, 1000);

INSERT INTO detalle_ticket_traslado (cod_ticket, id_traslado) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(4, 3 ),
(5, 1),
(6, 2),
(7, 3),
(8, 3),
(9, 3),
(10, 2),
(11,1),
(11, 3),
(12, 2),
(13, 1),
(14, 2),
(15, 4),
(16, 4),
(16, 1),
(17, 4),
(18, 4),
(18, 1),
(19, 4),
(20, 4);

INSERT INTO gps (cod_ubicacion, cod_vehiculo, fecha_ubicacion, hora_ubicacion) VALUES
  (1, 4, '2024-04-20', '04:53:21'),
  (15, 4, '2024-04-20', '09:10:53'),
  (17, 4, '2024-04-20', '11:33:14'),
  (18, 4, '2024-04-20', '13:45:11'),
  (1, 7, '2024-04-22', '05:13:55'),
  (5, 7, '2024-04-22', '07:34:25'),
  (4, 7, '2024-04-22', '10:45:30'),
  (8, 7, '2024-04-22', '11:20:10'),
  (12, 7, '2024-04-22', '11:54:31'),
  ( 10, 7, '2024-04-22', '12:29:30'),
  ( 13, 7, '2024-04-22', '13:04:10'),
  ( 14, 7, '2024-04-22', '13:38:50');

INSERT INTO local (cod_cliente, cod_ubicacion, pais, cod_local_region, cod_local_distrito, calle, numero, cod_local_tipo) VALUES
  (1, 1, 'PER', 15, 44, 'Panamericana Norte', NULL, 1),
  (8, 2, 'PER', 15, 44, 'Av. El Solar', NULL, 2),
  (8, 3, 'PER', 7, 45, 'Av. Néstor Gambetta', 7036, 2),
  (8, 4, 'PER', 15, 25, 'Av. Puente Piedra', 266, 2),
  (7, 10, 'PER', 15, 11, 'Av. Tomás Valle', 1400, 2),
  (6, 12, 'PER', 15, 11, 'Av. Alfredo Mendiola', 3698, 2),
  (2, 15, 'PER', 15, 15, 'Jr. Iquitos', 347, 3),
  (10, 16, 'PER', 15, 15, 'Av. España', 1337, 2),
  (2, 17, 'PER', 15, 15, 'Jr. Puno', 370, 4),
  ( 3, 18, 'PER', 15, 7, 'C. Constelación Austral', 135, 1),
  ( 2, 19, 'PER', 15, 35, 'Tomas Cochrane', NULL, 4),
  ( 2, 20, 'PER', 15, 35, 'Jr. Mártir Olaya', 413, 4),
  ( 2, 21, 'PER', 15, 24, 'Av. Simón Bolívar', 1149, 4),
  ( 2, 22, 'PER', 15, 15, 'Jr. 3 de Febrero', 1234, 4),
  ( 2, 23, 'PER', 7, 46, 'Av. Argentina', 3093, 3),
  ( 2, 24, 'PER', 15, 32, 'Av. 13 de Enero', 1592, 4),
  ( 3, 25, 'PER', 15, 7, 'Av. Los Faisanes', 179, 1),
  ( 2, 26, 'PER', 15, 7, 'Jr. Justo Naveda', 136, 4),
  ( 2, 27, 'PER', 15, 9, 'Av. Universitaria', 7718, 3),
  ( 2, 28, 'PER', 15, 16, 'Av. Petit Thouars', 2260, 3);

INSERT INTO paradero (cod_ruta, cod_local, cod_paradero_tipo, orden) VALUES
  (1, 1, 1, 1),
  (1, 2, 2, 2),
  (1, 4, 2, 3),
  (1, 17, 3, 4),
  (2, 1, 1, 1),
  (2, 16, 3, 2),
  (3, 1, 1, 1),
  (3, 4, 2, 2),
  (3, 5, 2, 3),
  ( 3, 6, 2, 4),
  ( 4, 17, 1, 1),
  ( 4, 1, 3, 2);

INSERT INTO pedido (cod_representante, cod_empleado, cod_pedido_tipo,cod_pedido_estado,fecha_registro, cod_ticket) VALUES
  (1,1,'A', 'P','2019-04-22', 1),
  (2,2,'A', 'P','2021-04-17', 2),
  (2,1,'A', 'P','2022-01-15', 3),
  (1,2,'A', 'P','2022-01-17', 4),
  (3,1,'A', 'P','2022-05-17', 5),
  (3,2,'A', 'P','2022-11-13', 6),
  (4,1,'A', 'P','2023-01-15', 7),
  (4,2,'A', 'P','2023-01-17', 8),
  (4,1,'A', 'P','2023-03-15', 9),
  (5,1,'V', 'P','2023-04-15', 10),
  (5,2,'V', 'P','2023-05-15', 11),
  (6,1,'V', 'P','2023-05-17', 12),
  (7,2,'V', 'P','2023-06-15', 13),
  (8,1,'V', 'P', '2023-09-11',14),
  (8,2,'V', 'P', '2023-11-17', 15),
  (8,1,'V', 'P', '2023-12-14', 16),
  (9,2,'V', 'P', '2024-01-17', 17),
  (10,1,'V', 'P','2024-02-17', 18),
  (9,2,'V', 'P','2024-04-17', 19),
  (10,1,'V', 'P','2024-04-17', 20);

INSERT INTO incidencia (id_traslado,cod_tipo_incidencia,descripcion,fecha_ocurrencia, hora_ocurrencia, cod_estado_incidencia) VALUES
  ( 1, 'A', 'La fecha de entrega no coincide con la fecha establecida de llegada','2024-04-24','04:53:21','S'),
  ( 2, 'B', 'Hay paquetes que no están sellados correctamente', '2024-05-03','04:53:21','P'),
  ( 2, 'C', 'El transportista no se le dio la documentación correspondiente', '2024-05-05','04:53:21','S'),
  ( 1, 'D', 'El vehículo asignado no enciende', '2024-04-28','04:53:21', 'P'),
  ( 2, 'E', 'La direccion no coincide con el pedido del cliente', '2024-05-08','04:53:21','S'),
  ( 2, 'C', 'La documentación presenta datos erróneos', '2024-05-10','04:53:21', 'S'),
  ( 1, 'D', 'El vehiculo sufrió derrame de aceite ', '2024-04-30', '04:53:21', 'S'),
  ( 2, 'E', 'La direccion asignada presenta demasiado tráfico', '2024-05-12','04:53:21','P'),
  ( 1, 'B', 'El sello del paquete está dañado', '2024-04-30','04:53:21','P'),
  ( 1, 'A', 'Ocurrió un accidente en la carretera que retrasó la entrega del pedido', '2024-05-02','04:53:21','S');

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

INSERT INTO norma (cod_incidencia, cod_norma_tipo, fecha_emision, fecha_vigencia) VALUES
  (1, 'X', '2019-01-24', '2025-01-24'),
  (2, 'Y', '2021-02-21', '2029-02-21'),
  (3, 'Z', '2020-02-17', '2026-02-17'),
  (4, 'W', '2017-03-28', '2027-03-28'),
  (5, 'X', '2005-03-15', '2025-01-24'),
  (6, 'Y', '2027-03-21', '2029-02-21'),
  (7, 'W', '2018-02-17', '2026-02-17'),
  (8, 'X', '2015-06-11', '2027-03-28'),
  (9, 'Y', '2018-02-17', '2026-02-17'),
  ( 10,'X', '2019-01-24', '2025-01-24');

INSERT INTO seguimiento (comentario,fecha_resolucion,numero_caso,cod_cliente_interno,cod_tipo_accion) VALUES
  (                                                 'Se está inspeccionando cada pieza de las estanterías afectadas para identificar el alcance del daño y determinar las acciones correctivas necesarias.', '2019-05-11', 0, 4, 'I'),
  (                                                               'Se revisará detalladamente el respaldo de la silla y diagnosticar el problema con el teléfono multifuncional para su pronta reparación.', '2022-02-05', 0, 4, 'C'),
  (                   'Se está coordinando la entrega de una nueva partida de guantes de la talla correcta y reemplazando la indumentaria de protección dañada para garantizar tu seguridad en el trabajo.', '2023-04-30', 0, 1, 'R'),
  (                                                                       'Se ha verificado el inventario de herramientas y se ha iniciado el proceso de envío del taladro faltante para completar el kit.', '2023-06-01', 0, 1, 'E'),
  (                                                                     'Se está realizando pruebas exhaustivas en la impresora para identificar y solucionar los problemas de impresión y funcionamiento.', '2023-06-04', 0, 4, 'I'),
  (                 'Se ha contactado al proveedor para discutir el problema de las alas de pollo y se están revisando los procedimientos de corte para garantizar la calidad y consistencia del producto.', '2023-09-30', 0, 3, 'C'),
  (                                                 'Se ha descartado el lote afectado y se está investigando la cadena de suministro para identificar la causa del problema y evitar futuras incidencias.', '2023-12-29', 0, 1, 'I'),
  (   'Se está evaluando la temperatura de almacenamiento y transporte de los productos congelados para corregir cualquier irregularidad que pueda causar la formación de cristales de hielo en el futuro.', '2024-03-09', 0, 1, 'E'),
  ( 'Se ha iniciado una investigación interna para determinar en qué etapa del proceso de embalaje ocurrió el daño al envase y se está tomando medidas para mejorar el proceso de manipulación y embalaje.', '2024-04-29', 1, 1, 'C'),
  ( 'Se está llevando a cabo una revisión exhaustiva de los procesos de almacenamiento y manipulación de las pechugas de pollo para identificar la fuente del problema y se han reforzado los controles de calidad para evitar errores similares en el futuro.', '2024-05-02', 2, 1, 'I');

INSERT INTO reclamo (comentario,fecha_suceso,fecha_reclamo,cod_representante,cod_pedido,cod_seguimiento,cod_tipo_reclamo,cod_nivel_urgencia,cod_estado_reclamo) VALUES
  (                                                    'Las estanterías metálicas recibidas están oxidadas y algunas piezas están dañadas.', '2019-04-30', '2019-05-01',  1,  1,  1, 'A', 'M', 'C'),
  (                  'La silla ergonómica recibida tiene un defecto en el respaldo y el teléfono multifuncional no funciona correctamente.', '2022-01-23', '2022-01-26',  2,  3,  2, 'C', 'A', 'B'),
  (                           'Los guantes de látex recibidos son de una talla incorrecta y la indumentaria de protección está desgarrada.', '2023-04-20', '2023-04-20',  3,  5,  3, 'C', 'A', 'D'),
  (                                                         'El kit de herramientas eléctricas recibido está incompleto, falta el taladro.', '2023-05-21', '2023-05-22',  4,  7,  4, 'B', 'M', 'A'),
  (                                     'La impresora de etiquetas recibida no imprime correctamente y presenta errores de funcionamiento.', '2023-05-22', '2023-05-22',  5,  9,  5, 'A', 'M', 'D'),
  (                                         'Las alas de pollo congeladas recibidas están mal cortadas y no presentan el tamaño adecuando.', '2023-09-18', '2023-09-20',  6, 11,  6, 'C', 'A', 'A'),
  (                    'Las piernas con encuentros frescas recibidas están vencidas y los muslos de pollos frescos tienen un olor extraño.', '2023-12-19', '2023-12-19',  7, 13,  7, 'A', 'A', 'C'),
  (                                          'El muslo de pollo congelado recibido está congelado en exceso y presenta cristales de hielo.', '2024-02-26', '2024-02-29',  8, 15,  8, 'A', 'A', 'B'),
  (                                         'El detergente SuperClean recibido tiene el envase roto y parte del contenido se ha derramado.', '2024-04-21', '2024-04-22',  9, 17,  9, 'D', 'M', 'C'),
  ( 'Las pechugas enteras de pollos frescas recibidas están en mal estado y los colorantes naturales Chroma no se incluyeron en el pedido.', '2024-04-22', '2024-04-23', 10, 19, 10, 'C', 'A', 'A');

INSERT INTO evidencia (nombre_evidencia, cod_reclamo, cod_tipo_evidencia, cod_tipo_archivo) VALUES
  (          'Captura_estanterias_oxidadas',  1, 'C',  '1'),
  (              'Foto_estanterias_dañadas',  1, 'F',  '8'),
  (            'Documento_silla_defectuosa',  2, 'D',  '5'),
  (        'Grabacion_audio_respaldo_silla',  2, 'G',  '6'),
  (                  'Foto_telefono_dañado',  2, 'F', '15'),
  (    'Documento_guantes_talla_incorrecta',  3, 'D', '14'),
  (          'Foto_indumentaria_desgarrada',  3, 'F',  '7'),
  (   'Fotografia_herramientas_incompletas',  4, 'F', '18'),
  ( 'Documento_lista_faltante_herramientas',  4, 'D', '17'),
  (               'Captura_impresora_error',  5, 'C',  '2'),
  (                  'Foto_impresora_error',  5, 'F',  '9'),
  (           'Foto_alas_pollos_mal_estado',  6, 'F',  '3'),
  (               'Foto_pollo_descongelado',  6, 'F',  '8'),
  (      'Grabacion_audio_piernas_vencidas',  7, 'G', '13'),
  (        'Fotografia_muslos_olor_extraño',  7, 'F', '18'),
  (     'Fotografia_muslo_congelado_exceso',  8, 'F', '20'),
  (             'Documento_cristales_hielo',  8, 'D', '19'),
  (       'Fotografia_detergente_derramado',  9, 'F',  '4'),
  (                 'Documento_envase_roto',  9, 'D', '10'),
  (        'Fotografia_pechugas_mal_estado', 10, 'F', '16'),
  (      'Documento_reclamo_sin_colorantes', 10, 'D', '22');
	
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
