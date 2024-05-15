### 5. Requerimientos del módulo de Reportes
#### 5.1. Requerimientos funcionales

a. Usuarios
- Administrador: Puede visualizar todas las pantallas, generar, enviar y programar cualquier reporte.
- Usuario encargado de almacén: Puede visualizar todas las pantallas, generar, enviar y programar cualquier reporte.

b. Casos de uso
Caso de Uso #1: Generar reporte
| Código           | R501                                                                                                                                        |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| Objetivo         | Generar reporte de los ítems existentes en almacén con filtros personalizados y por tipo de ítem.                                           |
| Descripción      | El encargado de almacén en el módulo de reportes, selecciona las columnas que necesita en el card filtros y genera el reporte con el botón. |
| Actor Primario   | Supervisor de Almacén                                                                                                                       |
| Actor Secundario | N/A                                                                                                                                         |
| Precondiciones   | Productos registrados en almacén                                                                                                            |
| Paso             | Acción                                                                                                                                      |
| 1                | El Supervisor de Almacén selecciona el tipo te ítem que requiere para el reporte.                                                           |
| 2                | Selecciona los filtros en el cuadro del lado izquierdo.                                                                                     |
| 3                | Ingresa a generar reporte en opciones.                                                                                                      |
| 4                | Selecciona el tipo de formato para generar el reporte.                                                                                      |
| 5                | Selecciona confirmar para que se descargue el reporte.                                                                                      |

Caso de Uso #2: Programar reporte
| Código           | R502                                                                                                   |
| ---------------- | ------------------------------------------------------------------------------------------------------ |
| Objetivo         | Programar reportes automáticos con una frecuencia, formato y lugar especificado                        | El encargado de almacén en el módulo de reportes, selecciona las columnas que necesita en el card filtros y genera el reporte con el botón. |
| Actor Primario   | Supervisor de Almacén                                                                                  |
| Actor Secundario | N/A                                                                                                    |
| Precondiciones   | Productos registrados en almacén                                                                       |
| Paso             | Acción                                                                                                 |
| 1                | El Supervisor de Almacén selecciona el tipo te ítem que requiere para programar el reporte.            |
| 2                | Selecciona los filtros en el cuadro del lado izquierdo.                                                |
| 3                | Ingresa a programar reporte en opciones.                                                               |
| 4                | Selecciona el tipo de formato para programar el reporte.                                               |
| 5                | Selecciona la frecuencia de programación que puede ser semanal, quincenal, mensual u otro.             |
| 6                | Registra desde que fecha inicia la programación                                                        |
| 7                | Selecciona la duración de la programación, que puede ser permanente, semestral, anual o personalizado. |
| 8                | Selecciona confirmar para programar el reporte.                                                        |

Caso de Uso #3: Enviar reporte

| Código           | R503                                                                                        |
| ---------------- | ------------------------------------------------------------------------------------------- |
| Objetivo         | Enviar un reporte mediante correo electrónico.                                              | Supervisor de Almacén |
| Actor Secundario | N/A                                                                                         |
| Precondiciones   | Productos registrados en almacén                                                            |
| Paso             | Acción                                                                                      |
| 1                | El Supervisor de Almacén selecciona el tipo te ítem que requiere para programar el reporte. |
| 2                | Selecciona los filtros en el cuadro del lado izquierdo.                                     |
| 3                | Ingresa a programar reporte en opciones.                                                    |
| 4                | Selecciona el tipo de formato para enviar el reporte.                                       |
| 5                | Llena los campos del formulario.                                                            |
| 6                | Selecciona la ubicación de los reportes.                                                    |
| 7                | Selecciona confirmar para programar el reporte.                                             |

#### 5.2. Requerimientos de atributos de calidad

- Confiabilidad:

  Los reportes generados deben ser confiables, reflejando con exactitud la información almacenada en el sistema.
  Las gráficas y visualizaciones deben representar los datos de manera precisa y coherente para facilitar la toma de decisiones informadas.

- Rendimiento:

  El sistema debe ser capaz de generar y mostrar reportes de manera rápida y eficiente, incluso cuando se trabaja con grandes volúmenes de datos.
  Las consultas y operaciones de filtrado en la interfaz de usuario deben ejecutarse de manera ágil, sin demoras significativas.

 - Usabilidad:

    La interfaz de usuario debe ser intuitiva y fácil de usar, con una navegación clara y acceso sencillo a las funcionalidades de generación de reportes, programación y filtrado.
    Las gráficas y visualizaciones deben ser legibles y comprensibles, con opciones para personalizar la visualización según las preferencias del usuario.

 - Seguridad:
    Los datos almacenados y los reportes generados deben estar protegidos mediante medidas de seguridad adecuadas, como el control de acceso.
    El sistema debe cumplir con las regulaciones de privacidad de datos y protección de la informaciónl.

#### 5.3. Requerimientos de restricciones
  - El diseño del modelo relacional de datos debe ser compatible con las características y funcionalidades de PostgreSQL.
  - El acceso a la base de datos desde el backend debe realizarse utilizando sentencias SQL nativas de PostgreSQL.

(Unidad -> Unidad de medida)

**Entidad:** ProductoCatalogo 

Semántica: Representa a un producto terminado en la planta

| ATRIBUTO           | NATURALEZA | FORMATO   | VALORES VÁLIDOS | UNIDAD | DERIVADA DE | DESCRIPCIÓN                                                            |
| ------------------ | ---------- | --------- | --------------- | ------ | ----------- | ---------------------------------------------------------------------- |
| Cod_productoCat    | CHAR       | 999999999 | 9 dígitos       | --     | --          | Identificador del producto catalogo.                                   |
| Temperatura_maxima | FLOAT      | 99.99     | No nulo         | --     | --          | Máxima temperatura que resiste el producto terminado para preservarlo. |
| Temperatura_mínima | FLOAT      | 99.99     | No nulo         | --     | --          | Mínima temperatura a la quede mantenerse el producto para preservarlo. |
| Categoría          | CHAR       | X(64)     |                 | --     | --          | Indica a la categoria que pertenece para almacenarlo correctamente     |
| Vida útil          | FLOAT      | 99        | x>0             | --     | --          | Máximo de días en el que el producto es consumible.                    |
| Cod_elementoCat    | CHAR       | 999999999 | 9 dígitos       | --     | --          | Identificador de la entidad elemento categoría                         |

**Entidad:** ElementoCatálogo

Semántica: Representa los productos ofrecidos por sanfernando 

| ATRIBUTO        | NATURALEZA | FORMATO   | VALORES VÁLIDOS | UNIDAD | DERIVADA DE | DESCRIPCIÓN                                   |
| --------------- | ---------- | --------- | --------------- | ------ | ----------- | --------------------------------------------- |
| Cod_elementoCat | CHAR       | 999999999 | 9 dígitos       | --     | --          | Identificador del elemento en el catálogo.    |
| Nombre          | CHAR       | X(128)    | No nulo         | --     | --          | Nombre del elemento en el catálogo.           |
| Descripcion     | CHAR       | X(256)    | No nulo         | --     | --          | Descripción del elemento en el catálogo.      |
| Unidad          | VARCHAR    | X(32)     | No nulo         | --     | --          | Unidad de medida del elemento en el catálogo. |

**Entidad:** PedidoExterno

Semántica: Pedido realizado por un cliente externo

| ATRIBUTO           | NATURALEZA | FORMATO   | VALORES VÁLIDOS | UNIDAD | DERIVADA DE | DESCRIPCIÓN                                     |
| ------------------ | ---------- | --------- | --------------- | ------ | ----------- | ----------------------------------------------- |
| Cod_pedidoExterno  | CHAR       | 999999999 | 9 dígitos       | --     | --          | Identificador del pedido externo en el sistema. |
| Cod_pedido         | CHAR       | 999999999 | 9 dígitos       | --     | --          | Identificador del pedido asociado.              |
| Cod_clienteExterno | CHAR       | 999999999 | 9 dígitos       | --     | --          | Identificador del cliente externo asociado.     |

**Entidad:** PedidoInterno

Semántica: Pedido realizado por un cliente interno

| ATRIBUTO           | NATURALEZA | FORMATO   | VALORES VÁLIDOS | UNIDAD | DERIVADA DE | DESCRIPCIÓN                                     |
| ------------------ | ---------- | --------- | --------------- | ------ | ----------- | ----------------------------------------------- |
| Cod_pedidoInterno  | CHAR       | 999999999 | 9 dígitos       | --     | --          | Identificador del pedido interno en el sistema. |
| Cod_pedido         | CHAR       | 999999999 | 9 dígitos       | --     | --          | Identificador del pedido asociado.              |
| Cod_clienteInterno | CHAR       | 999999999 | 9 dígitos       | --     | --          | Identificador del cliente interno asociado.     |

**Entidad:** Vehículo

Semántica: 

| ATRIBUTO         | NATURALEZA | FORMATO   | VALORES VÁLIDOS  | UNIDAD | DERIVADA DE | DESCRIPCIÓN                                 |
| ---------------- | ---------- | --------- | ---------------- | ------ | ----------- | ------------------------------------------- |
| Cod_vehículo     | CHAR       | 999999999 | 9 dígitos        | --     | --          | Identificador del vehículo en el sistema.   |
| Placa            | CHAR       | XXX999    | Alfanumérico     | --     | --          | Número de placa del vehículo.               |
| Estado           | CHAR       | X(32)     | Activo, Inactivo | --     | --          | Estado actual del vehículo.                 |
| Anio_fabricacion | INTEGER    | 9999      | Año válido       | --     | --          | Año en que fue fabricado el vehículo.       |
| Capacidad_carga  | FLOAT      | 999.99    | x>0              | --     | --          | Capacidad máxima de carga del vehículo.     |
| Modelo           | CHAR       | X(64)     | NO NULO          | --     | --          | Modelo del vehículo.                        |
| Cod_fecha        | CHAR       | 999999999 | 9 dígitos        | --     | --          | Identificador de la entidad fecha asociada. |