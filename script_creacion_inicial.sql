USE GD2C2024
GO


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(1)ELIMINACION OBJETOS PREVIOS----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------(2)CREACION DE ESQUEMA Y TABLAS------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Creación de esquema

CREATE SCHEMA TESLA;
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
    FOREIGN KEY (usr_vendedor) REFERENCES TESLA.VENDEDOR(ven_id),
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
-- SELECT PARA GUIARSE
SELECT DISTINCT PRODUCTO_RUBRO_DESCRIPCION, PRODUCTO_SUB_RUBRO FROM gd_esquema.Maestra
WHERE PRODUCTO_RUBRO_DESCRIPCION IS NOT NULL
--group by PRODUCTO_RUBRO_DESCRIPCION, PRODUCTO_SUB_RUBRO
ORDER BY 2

-- MIGRAR RUBRO
CREATE PROCEDURE TESLA.migrar_rubro AS
BEGIN
	INSERT INTO TESLA.RUBRO ()
	SELECT DISTINCT 
		
	FROM 
END
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(5)INDEX--------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(6)EXECUTE------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------