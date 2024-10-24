USE GD2C2024
GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(1)ELIMINACION ESQUEMA TABLAS PROCEDURES ----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--borrado de procedures
IF OBJECT_ID('TESLA.migrar_rubros', 'P') IS NOT NULL DROP PROCEDURE TESLA.migrar_rubros
IF OBJECT_ID('TESLA.migrar_marcas', 'P') IS NOT NULL DROP PROCEDURE TESLA.migrar_marcas
IF OBJECT_ID('TESLA.migrar_sub_rubros', 'P') IS NOT NULL DROP PROCEDURE TESLA.migrar_sub_rubros
IF OBJECT_ID('TESLA.migrar_modelos', 'P') IS NOT NULL DROP PROCEDURE TESLA.migrar_modelos
IF OBJECT_ID('TESLA.migrar_provincias', 'P') IS NOT NULL DROP PROCEDURE TESLA.migrar_provincias

--borrado de tablas
IF OBJECT_ID('TESLA.ENVIO', 'U') IS NOT NULL DROP TABLE TESLA.ENVIO
IF OBJECT_ID('TESLA.PAGO', 'U') IS NOT NULL DROP TABLE TESLA.PAGO
IF OBJECT_ID('TESLA.VENTA', 'U') IS NOT NULL DROP TABLE TESLA.VENTA
IF OBJECT_ID('TESLA.DETALLE_VENTA', 'U') IS NOT NULL DROP TABLE TESLA.DETALLE_VENTA
IF OBJECT_ID('TESLA.ITEM_FACTURA', 'U') IS NOT NULL DROP TABLE TESLA.ITEM_FACTURA
IF OBJECT_ID('TESLA.PUBLICACION', 'U') IS NOT NULL DROP TABLE TESLA.PUBLICACION
IF OBJECT_ID('TESLA.ALMACEN', 'U') IS NOT NULL DROP TABLE TESLA.ALMACEN
IF OBJECT_ID('TESLA.FACTURA', 'U') IS NOT NULL DROP TABLE TESLA.FACTURA
IF OBJECT_ID('TESLA.DOMICILIO', 'U') IS NOT NULL DROP TABLE TESLA.DOMICILIO
IF OBJECT_ID('TESLA.USUARIO', 'U') IS NOT NULL DROP TABLE TESLA.USUARIO
IF OBJECT_ID('TESLA.VENDEDOR', 'U') IS NOT NULL DROP TABLE TESLA.VENDEDOR
IF OBJECT_ID('TESLA.CLIENTE', 'U') IS NOT NULL DROP TABLE TESLA.CLIENTE
IF OBJECT_ID('TESLA.MEDIO_DE_PAGO', 'U') IS NOT NULL DROP TABLE TESLA.MEDIO_DE_PAGO
IF OBJECT_ID('TESLA.TIPO_MEDIO_DE_PAGO', 'U') IS NOT NULL DROP TABLE TESLA.TIPO_MEDIO_DE_PAGO
IF OBJECT_ID('TESLA.PRODUCTO', 'U') IS NOT NULL DROP TABLE TESLA.PRODUCTO
IF OBJECT_ID('TESLA.CONCEPTO_FACTURA', 'U') IS NOT NULL DROP TABLE TESLA.CONCEPTO_FACTURA
IF OBJECT_ID('TESLA.TIPO_ENVIO', 'U') IS NOT NULL DROP TABLE TESLA.TIPO_ENVIO
IF OBJECT_ID('TESLA.LOCALIDAD', 'U') IS NOT NULL DROP TABLE TESLA.LOCALIDAD
IF OBJECT_ID('TESLA.PROVINCIA', 'U') IS NOT NULL DROP TABLE TESLA.PROVINCIA
IF OBJECT_ID('TESLA.MODELO', 'U') IS NOT NULL DROP TABLE TESLA.MODELO
IF OBJECT_ID('TESLA.SUB_RUBRO', 'U') IS NOT NULL DROP TABLE TESLA.SUB_RUBRO
IF OBJECT_ID('TESLA.MARCA', 'U') IS NOT NULL DROP TABLE TESLA.MARCA
IF OBJECT_ID('TESLA.RUBRO', 'U') IS NOT NULL DROP TABLE TESLA.RUBRO

--borrado de schema
IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'TESLA') DROP SCHEMA TESLA;
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------(2)CREACION DE ESQUEMA Y TABLAS------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Creación de esquema
CREATE SCHEMA TESLA;
GO
PRINT('SE CREO EL SCHEMA');
GO

-- Creación de tablas
--TABLA RUBRO
CREATE TABLE TESLA.RUBRO(
    rubr_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    rubr_descripcion VARCHAR(50) NULL
);
GO

--TABLA MARCA
CREATE TABLE TESLA.MARCA(
    marca_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    marca_descripcion VARCHAR(50) NULL
);
GO

--TABLA SUB_RUBRO
CREATE TABLE TESLA.SUB_RUBRO(
    sub_rubr_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    sub_rubr_descripcion VARCHAR(50) NULL,
	sub_rubr_rubro DECIMAL(18,0),
    FOREIGN KEY (sub_rubr_rubro) REFERENCES TESLA.RUBRO(rubr_id)
);
GO

--TABLA MODELO
CREATE TABLE TESLA.MODELO(
    model_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    model_codigo VARCHAR(50),
    model_descripcion VARCHAR(50) NULL
);
GO

--TABLA PROVINCIA
CREATE TABLE TESLA.PROVINCIA(
    prov_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    prov_nombre VARCHAR(50) NULL
);
GO

--TABLA LOCALIDAD
CREATE TABLE TESLA.LOCALIDAD(
    loc_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    loc_nombre VARCHAR(50) NULL,
	loc_provincia DECIMAL(18,0),
    FOREIGN KEY (loc_provincia) REFERENCES TESLA.PROVINCIA(prov_id)
);
GO

--TABLA TIPO_ENVIO
CREATE TABLE TESLA.TIPO_ENVIO(
    tipo_envio_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    tipo_envio_descripcion VARCHAR(50) NULL,
);
GO

--TABLA CONCEPTO_FACTURA
CREATE TABLE TESLA.CONCEPTO_FACTURA(
    conc_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    conc_descripcion VARCHAR(50) NULL
);
GO

--TABLA PRODUCTO
CREATE TABLE TESLA.PRODUCTO(
    prod_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    prod_codigo VARCHAR(50) NULL,
    prod_descripcion VARCHAR(50) NULL,
    prod_precio DECIMAL(18,0) NULL,
	prod_marca DECIMAL(18,0),
	prod_sub_rubro DECIMAL(18,0),
	prod_modelo DECIMAL(18,0),
    FOREIGN KEY (prod_marca) REFERENCES TESLA.MARCA(marca_id),
    FOREIGN KEY (prod_sub_rubro) REFERENCES TESLA.SUB_RUBRO(sub_rubr_id),
    FOREIGN KEY (prod_modelo) REFERENCES TESLA.MODELO(model_id)
);
GO

--TABLA TIPO_MEDIO_DE_PAGO
CREATE TABLE TESLA.TIPO_MEDIO_DE_PAGO(
    tipo_medio_de_pago_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    tipo_medio_de_pago_descripcion VARCHAR(50) NULL
);
GO

--TABLA MEDIO_DE_PAGO
CREATE TABLE TESLA.MEDIO_DE_PAGO(
    medio_de_pago_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    medio_de_pago_descripcion VARCHAR(50),
    medio_de_pago_tipo DECIMAL(18,0),
    FOREIGN KEY (medio_de_pago_tipo) REFERENCES TESLA.TIPO_MEDIO_DE_PAGO(tipo_medio_de_pago_id) 
);
GO

--TABLA CLIENTE
CREATE TABLE TESLA.CLIENTE(
    clien_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    clien_nombre VARCHAR(100) NULL,
    clien_apellido VARCHAR(100) NULL,
    clien_fecha_nacimiento DATE NULL,
    clien_mail VARCHAR(100) NULL,
    clien_dni decimal(18,0) NULL,
);
GO

--TABLA VENDEDOR
CREATE TABLE TESLA.VENDEDOR(
    vend_id  DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    vend_cuit  VARCHAR(50),
    vend_razon_social  VARCHAR(50),
    vend_mail  VARCHAR(50)
);
GO

--TABLA USUARIO
CREATE TABLE TESLA.USUARIO(
    usr_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    usr_nombre VARCHAR(100),
    usr_pass VARCHAR(100),
    usr_fecha_creacion DATE,
    usr_vendedor DECIMAL(18,0),
    usr_cliente DECIMAL(18,0),
    FOREIGN KEY (usr_vendedor) REFERENCES TESLA.VENDEDOR(vend_id),
    FOREIGN KEY (usr_cliente) REFERENCES TESLA.CLIENTE(clien_id) 
);
GO

--TABLA DOMICILIO
CREATE TABLE TESLA.DOMICILIO(
    domi_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    domi_calle VARCHAR(100),
    domi_nro_calle DECIMAL(18,0),
    domi_piso DECIMAL(18,0),
    domi_depto  VARCHAR(50),
    domi_cp  VARCHAR(50),
	domi_usuario DECIMAL(18,0),
	domi_localidad DECIMAL(18,0),
    FOREIGN KEY (domi_usuario) REFERENCES TESLA.USUARIO(usr_id),
    FOREIGN KEY (domi_localidad) REFERENCES TESLA.LOCALIDAD(loc_id)
);
GO

--TABLA FACTURA
CREATE TABLE TESLA.FACTURA(
    fact_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    fact_numero DECIMAL(18,0),
    fact_fecha DATE,
    fact_vendedor DECIMAL(18,0),
    fact_total DECIMAL(18,0),
    FOREIGN KEY (fact_vendedor) REFERENCES TESLA.VENDEDOR(vend_id)
    
);
GO

--TABLA ALMACEN
CREATE TABLE TESLA.ALMACEN(
    alm_id  DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    alm_codigo DECIMAL(18,0),
    alm_costo_dia_al DECIMAL(18,0),
	alm_domicilio DECIMAL(18,0),
    FOREIGN KEY (alm_domicilio) REFERENCES TESLA.DOMICILIO(domi_id)
);
GO

--TABLA PUBLICACION
CREATE TABLE TESLA.PUBLICACION(
    publi_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    publi_codigo DECIMAL(18,0),
    publi_descripcion VARCHAR(50) NULL,
    publi_producto DECIMAL(18,0),
    publi_stock DECIMAL(18,0),
    publ_fecha_inicio DATE,
    publ_fecha_fin DATE,
    publ_precio DECIMAL(18,2),
    publ_costo DECIMAL(18,2),
    publ_almacen DECIMAL(18,0),
    FOREIGN KEY (publi_producto) REFERENCES TESLA.PRODUCTO(prod_id),
    FOREIGN KEY (publ_almacen) REFERENCES TESLA.ALMACEN(alm_id)    
);
GO

--TABLA ITEM_FACTURA
CREATE TABLE TESLA.ITEM_FACTURA(
    item_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    item_factura DECIMAL(18,0),
    item_concepto_factura DECIMAL(18,0),
    item_publicacion DECIMAL(18,0),
    item_cantidad DECIMAL(18,0) NULL,
    item_precio DECIMAL(18,2) NULL,
    item_asub_total DECIMAL(18,2) NULL,
    FOREIGN KEY (item_factura) REFERENCES TESLA.FACTURA(fact_id),
    FOREIGN KEY (item_concepto_factura) REFERENCES TESLA.CONCEPTO_FACTURA(conc_id),
    FOREIGN KEY (item_publicacion) REFERENCES TESLA.PUBLICACION(publi_id),
);
GO

--TABLA DETALLE_VENTA
CREATE TABLE TESLA.DETALLE_VENTA(
    det_vent_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    det_vent_cantidad DECIMAL(18,0),
    det_precio DECIMAL(18,0),
    det_vent_subtotal DECIMAL(18,0),
	det_vent_publicacion DECIMAL(18,0)
    FOREIGN KEY (det_vent_publicacion) REFERENCES TESLA.PUBLICACION(publi_id)
);
GO

--TABLA VENTA
CREATE TABLE TESLA.VENTA(
    vent_id  DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    vent_codigo DECIMAL(18,0),
    vent_fecha DATETIME,
    vent_total DECIMAL(18,0),
	vent_cliente DECIMAL(18,0),
	vent_detalle DECIMAL(18,0),
    FOREIGN KEY (vent_cliente) REFERENCES TESLA.CLIENTE(clien_id),
    FOREIGN KEY (vent_detalle) REFERENCES TESLA.DETALLE_VENTA(det_vent_id)
);
GO

--TABLA PAGO
CREATE TABLE TESLA.PAGO(
    pago_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    pago_venta DECIMAL(18,0),
    pago_medio DECIMAL(18,0),
    pago_fecha DATE NULL,
    pago_importe DECIMAL(18,2) NULL,
    pago_nro_tarjeta VARCHAR(50) NULL, 
    pago_fecha_vencimiento_tarjeta DATE NULL,
    pago_cuotas DECIMAL(18,0) NULL
    FOREIGN KEY (pago_venta) REFERENCES TESLA.VENTA(vent_id),
    FOREIGN KEY (pago_medio) REFERENCES TESLA.MEDIO_DE_PAGO(medio_de_pago_id)
);
GO

--TABLA ENVIO
CREATE TABLE TESLA.ENVIO(
    env_id DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
    env_fecha_programada DATE,
    env_horario_inicio TIME,
    env_horario_fin TIME,
    env_costo DECIMAL(18,0),
    env_fecha_entrega DATETIME,
	env_domicilio DECIMAL(18,0),
	env_tipo DECIMAL(18,0),
	env_venta DECIMAL(18,0),
    FOREIGN KEY (env_domicilio) REFERENCES TESLA.DOMICILIO(domi_id),
    FOREIGN KEY (env_tipo) REFERENCES TESLA.TIPO_ENVIO(tipo_envio_id),
    FOREIGN KEY (env_venta) REFERENCES TESLA.VENTA(vent_id)
    
);
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(3)CREACION DE FUNCIONES-------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(4)STORED PROCEDURES--------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* SELECT PARA GUIARSE
SELECT DISTINCT PRODUCTO_RUBRO_DESCRIPCION, PRODUCTO_SUB_RUBRO FROM gd_esquema.Maestra
WHERE PRODUCTO_RUBRO_DESCRIPCION IS NOT NULL
--group by PRODUCTO_RUBRO_DESCRIPCION, PRODUCTO_SUB_RUBRO
ORDER BY 1 --hay 815 subrubros distintos
*/

-- MIGRAR RUBRO
CREATE PROCEDURE TESLA.migrar_rubros
AS
BEGIN
INSERT INTO TESLA.RUBRO(rubr_descripcion) --ponemos los datos que vamos a guardar, menos el pk ya que es autoincremental por el identiti(1,1)
	SELECT DISTINCT PRODUCTO_RUBRO_DESCRIPCION
	FROM gd_esquema.Maestra
	WHERE PRODUCTO_RUBRO_DESCRIPCION IS NOT NULL

	--sirve para saber si estamos migrando elementos a la nueva tabla
	DECLARE @cantRubros NVARCHAR(255)
	SET @cantRubros = (SELECT COUNT(*) FROM TESLA.RUBRO)
	PRINT('Se agregaron ' + @cantRubros + ' rubros') --deben ser 22
END
GO

-- MIGRAR MARCA
CREATE PROCEDURE TESLA.migrar_marcas
AS
BEGIN
INSERT INTO TESLA.MARCA(marca_descripcion)
	SELECT DISTINCT PRODUCTO_MARCA
	FROM gd_esquema.Maestra
	WHERE PRODUCTO_MARCA IS NOT NULL

	DECLARE @cantMarcas NVARCHAR(255)
	SET @cantMarcas = (SELECT COUNT(*) FROM TESLA.MARCA)
	PRINT('Se agregaron ' + @cantMarcas + ' marcas') --deben ser 4
END
GO

-- MIGRAR SUB RUBRO
CREATE PROCEDURE TESLA.migrar_sub_rubros
AS
BEGIN
INSERT INTO TESLA.SUB_RUBRO(sub_rubr_descripcion, sub_rubr_rubro)
	SELECT DISTINCT PRODUCTO_SUB_RUBRO, rubr_id
	FROM gd_esquema.Maestra JOIN TESLA.RUBRO ON PRODUCTO_RUBRO_DESCRIPCION = rubr_descripcion

	DECLARE @cantSubRubros NVARCHAR(255)
	SET @cantSubRubros = (SELECT COUNT(*) FROM TESLA.SUB_RUBRO)
	PRINT('Se agregaron ' + @cantSubRubros + ' sub rubros') --deben ser 815 
	/* 
		si hay SubRubro 1 perteneciente al Rubro X
		si hay SubRubro 2 perteneciente al Rubro X
		si hay SubRubro 3 perteneciente al Rubro X
		si hay SubRubro 1 perteneciente al Rubro Y
		si hay SubRubro 2 perteneciente al Rubro Y
		si hay SubRubro 1 perteneciente al Rubro Y

		Hay tres Rubros "X,Y,Z" 
		Hay seis SubRubros "1,2,3,1,2,1", si bien hay tres subrubros que parecen repetirse ejemplo "1..1.1", pertenecen a rubros distintos, por lo que serian distintos subrubros.  
	*/
END
GO

-- MIGRAR MODELOS
CREATE PROCEDURE TESLA.migrar_modelos
AS
BEGIN
INSERT INTO TESLA.MODELO(model_codigo, model_descripcion)
	SELECT DISTINCT PRODUCTO_MOD_CODIGO, PRODUCTO_DESCRIPCION
	FROM gd_esquema.Maestra
	WHERE PRODUCTO_MOD_CODIGO IS NOT NULL

	DECLARE @cantModelos NVARCHAR(255)
	SET @cantModelos = (SELECT COUNT(*) FROM TESLA.MODELO)
	PRINT('Se agregaron ' + @cantModelos + ' modelos') --deben ser 70
END
GO

-- MIGRAR PROVINCIAS
CREATE PROCEDURE TESLA.migrar_provincias
AS
BEGIN
INSERT INTO TESLA.PROVINCIA(prov_nombre)
	SELECT DISTINCT VEN_USUARIO_DOMICILIO_PROVINCIA
	FROM gd_esquema.Maestra
	WHERE VEN_USUARIO_DOMICILIO_PROVINCIA IS NOT NULL
	UNION
	SELECT DISTINCT ALMACEN_PROVINCIA
	FROM gd_esquema.Maestra
	WHERE ALMACEN_PROVINCIA IS NOT NULL
	UNION
	SELECT DISTINCT CLI_USUARIO_DOMICILIO_PROVINCIA
	FROM gd_esquema.Maestra
	WHERE CLI_USUARIO_DOMICILIO_PROVINCIA IS NOT NULL

	DECLARE @cantprovincias NVARCHAR(255)
	SET @cantprovincias = (SELECT COUNT(*) FROM TESLA.PROVINCIA)
	PRINT('Se agregaron ' + @cantprovincias + ' provincias') --deben ser 70
END
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(5)INDEX--------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(6)EXECUTE------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
BEGIN TRANSACTION
BEGIN
	EXECUTE TESLA.migrar_rubros
	EXECUTE TESLA.migrar_marcas
	EXECUTE TESLA.migrar_sub_rubros
	EXECUTE TESLA.migrar_modelos
	EXECUTE TESLA.migrar_provincias

	PRINT('')
	PRINT('SE LLENARON TODAS LAS TABLAS :)')
END 
