USE [GD2C2024]
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(1)ELIMINACION OBJETOS PREVIOS----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- DROPS TABLAS HECHOS
IF OBJECT_ID('TESLA.BI_HECHO_FACTURACION ','U') IS NOT NULL
    DROP TABLE TESLA.BI_HECHO_FACTURACION

IF OBJECT_ID('TESLA.BI_HECHO_ENVIO','U') IS NOT NULL
    DROP TABLE TESLA.BI_HECHO_ENVIO;

IF OBJECT_ID('TESLA.BI_HECHO_PAGO ','U') IS NOT NULL
    DROP TABLE TESLA.BI_HECHO_PAGO

IF OBJECT_ID('TESLA.BI_HECHO_VENTA','U') IS NOT NULL
    DROP TABLE TESLA.BI_HECHO_VENTA;

IF OBJECT_ID('TESLA.BI_HECHO_PUBLICACION','U') IS NOT NULL
    DROP TABLE TESLA.BI_HECHO_PUBLICACION;

--DROPS TABLAS DIMENSIONES

IF OBJECT_ID('TESLA.BI_CONCEPTO_FACTURA','U') IS NOT NULL
    DROP TABLE TESLA.BI_CONCEPTO_FACTURA;

IF OBJECT_ID('TESLA.BI_MARCA','U') IS NOT NULL
    DROP TABLE TESLA.BI_MARCA;

IF OBJECT_ID('TESLA.BI_SUBRUBRO','U') IS NOT NULL
    DROP TABLE TESLA.BI_SUBRUBRO;

IF OBJECT_ID('TESLA.BI_TIPO_ENVIO','U') IS NOT NULL
    DROP TABLE TESLA.BI_TIPO_ENVIO;

IF OBJECT_ID('TESLA.BI_TIPO_MEDIO_DE_PAGO','U') IS NOT NULL
    DROP TABLE TESLA.BI_TIPO_MEDIO_DE_PAGO;

IF OBJECT_ID('TESLA.BI_RANGO_HORARIO_VENTAS','U') IS NOT NULL
    DROP TABLE TESLA.BI_RANGO_HORARIO_VENTAS;

IF OBJECT_ID('TESLA.BI_RANGO_ETARIO_CLIENTES','U') IS NOT NULL
    DROP TABLE TESLA.BI_RANGO_ETARIO_CLIENTES;

IF OBJECT_ID('TESLA.BI_UBICACION','U') IS NOT NULL
    DROP TABLE TESLA.BI_UBICACION;

IF OBJECT_ID('TESLA.BI_TIEMPO','U') IS NOT NULL
    DROP TABLE TESLA.BI_TIEMPO;

---DROP FUNCIONES
IF OBJECT_ID('TESLA.OBTENER_CUATRIMESTRE') IS NOT NULL
  DROP FUNCTION TESLA.OBTENER_CUATRIMESTRE;
GO

IF OBJECT_ID('TESLA.OBTENER_ID_TIEMPO') IS NOT NULL
  DROP FUNCTION TESLA.OBTENER_ID_TIEMPO;
GO

IF OBJECT_ID('TESLA.OBTENER_ID_UBICACION') IS NOT NULL
  DROP FUNCTION TESLA.OBTENER_ID_UBICACION;
GO

IF OBJECT_ID('TESLA.CUMPLIO_HORARIO') IS NOT NULL
  DROP FUNCTION TESLA.CUMPLIO_HORARIO;
GO

IF OBJECT_ID('TESLA.OBTENER_ID_UBICACION_VENDEDOR') IS NOT NULL
  DROP FUNCTION TESLA.OBTENER_ID_UBICACION_VENDEDOR;
GO
/*IF OBJECT_ID('TESLA.RANGO_EDAD') IS NOT NULL
  DROP FUNCTION TESLA.RANGO_EDAD;
GO




IF OBJECT_ID('TESLA.ID_CUOTA') IS NOT NULL
  DROP FUNCTION TESLA.ID_CUOTA;
GO
*/

--DROPS MIGRACIONES DIMENSIONES
IF OBJECT_ID('TESLA.bi_migrar_tiempo') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_tiempo;
GO

IF OBJECT_ID('TESLA.bi_migrar_ubicacion') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_ubicacion;
GO

IF OBJECT_ID('TESLA.bi_migrar_rango_etario_clientes') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_rango_etario_clientes;
GO

IF OBJECT_ID('TESLA.bi_migrar_rango_horario_ventas') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_rango_horario_ventas;
GO

IF OBJECT_ID('TESLA.bi_migrar_tipo_medio_de_pago') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_tipo_medio_de_pago;
GO

IF OBJECT_ID('TESLA.bi_migrar_tipo_envio') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_tipo_envio;
GO 

IF OBJECT_ID('TESLA.bi_migrar_subrubro') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_subrubro;
GO

IF OBJECT_ID('TESLA.bi_migrar_marca') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_marca;
GO

IF OBJECT_ID('TESLA.bi_migrar_concepto_factura') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_concepto_factura;
GO

-- DROPS MIGRACIONES TABLAS HECHOS

IF OBJECT_ID('TESLA.bi_migrar_venta') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_venta;
GO

IF OBJECT_ID('TESLA.bi_migrar_pago') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_pago;
GO

IF OBJECT_ID('TESLA.bi_migrar_envio') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_envio;
GO

IF OBJECT_ID('TESLA.bi_migrar_facturacion') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_facturacion;
GO

--DROP VIEWS
/* TODO VIWS
IF OBJECT_ID('TESLA.VW_TICKET_PROMEDIO_MENSUAL') IS NOT NULL
  DROP VIEW TESLA.VW_TICKET_PROMEDIO_MENSUAL;
  
IF OBJECT_ID('TESLA.VW_CANTIDAD_UNIDADES_PROMEDIO') IS NOT NULL
  DROP VIEW TESLA.VW_CANTIDAD_UNIDADES_PROMEDIO;

IF OBJECT_ID('TESLA.VW_PORCENTAJE_ANUAL_VENTAS') IS NOT NULL
  DROP VIEW TESLA.VW_PORCENTAJE_ANUAL_VENTAS;

IF OBJECT_ID('TESLA.VW_CANTIDAD_VENTAS_X_TURNO') IS NOT NULL
  DROP VIEW TESLA.VW_CANTIDAD_VENTAS_X_TURNO;

IF OBJECT_ID('TESLA.VW_PORCENTAJE_DESCUENTO_APLICADO') IS NOT NULL
  DROP VIEW TESLA.VW_PORCENTAJE_DESCUENTO_APLICADO;

IF OBJECT_ID('TESLA.VW_PRODUCTOS_MAYOR_DESCUENTO_APLICADO') IS NOT NULL
  DROP VIEW TESLA.VW_PRODUCTOS_MAYOR_DESCUENTO_APLICADO;

IF OBJECT_ID('TESLA.VW_PORCENTAJE_DE_CUMPLIMIENTO_DE_ENVIOS') IS NOT NULL
  DROP VIEW TESLA.VW_PORCENTAJE_DE_CUMPLIMIENTO_DE_ENVIOS;

IF OBJECT_ID('TESLA.VW_CANTIDAD_DE_ENVIOS_POR_RANGO_ETARIO_DE_CLIENTES') IS NOT NULL
  DROP VIEW TESLA.VW_CANTIDAD_DE_ENVIOS_POR_RANGO_ETARIO_DE_CLIENTES;

IF OBJECT_ID('TESLA.VW_LOCALIDADES_MAYOR_COSTO_ENVIO') IS NOT NULL
  DROP VIEW TESLA.VW_LOCALIDADES_MAYOR_COSTO_ENVIO;

IF OBJECT_ID('TESLA.VW_SUCURSALES_MAYOR_IMPORTE_EN_CUOTAS') IS NOT NULL
  DROP VIEW TESLA.VW_SUCURSALES_MAYOR_IMPORTE_EN_CUOTAS;
*/
IF OBJECT_ID('TESLA.VW_PORCENTAJE_FACTURACION_X_CONCEPTO') IS NOT NULL
  DROP VIEW TESLA.VW_PORCENTAJE_FACTURACION_X_CONCEPTO;

IF OBJECT_ID('TESLA.VW_FACTURACION_X_PROVINCIA') IS NOT NULL
  DROP VIEW TESLA.VW_FACTURACION_X_PROVINCIA;
GO



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------(2)CREACION DE ESQUEMA Y TABLAS------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE TESLA.BI_TIEMPO (
    bi_tiempo_id DECIMAL(18, 0) IDENTITY(1,1) PRIMARY KEY,
    bi_tiempo_anio DECIMAL(4, 0),
    bi_tiempo_mes DECIMAL(2, 0),
    bi_tiempo_cuatrimestre DECIMAL(1, 0)
);

CREATE TABLE TESLA.BI_UBICACION (
    bi_ubic_id DECIMAL(18, 0) IDENTITY(1,1) PRIMARY KEY,
    bi_ubic_provincia varchar(255),
    bi_ubic_localidad varchar(255)
	
);

CREATE TABLE TESLA.BI_RANGO_ETARIO_CLIENTES (
    bi_rango_etario_id DECIMAL(18, 0) IDENTITY(1,1) PRIMARY KEY,
    bi_rango_etario_nombre VARCHAR(255)
);

CREATE TABLE TESLA.BI_RANGO_HORARIO_VENTAS (
    bi_rango_horario_id DECIMAL(18, 0) IDENTITY(1,1) PRIMARY KEY,
    bi_rango_horario_nombre VARCHAR(100)
);



CREATE TABLE TESLA.BI_TIPO_MEDIO_DE_PAGO (
    bi_tipo_medio_pago_id DECIMAL(18, 0) IDENTITY(1,1) PRIMARY KEY,
	bi_tipo_medio_pago_descripcion VARCHAR(255),
);

CREATE TABLE TESLA.BI_TIPO_ENVIO (
    bi_tipo_envio_id DECIMAL(18, 0) IDENTITY(1,1) PRIMARY KEY,
	bi_tipo_envio_descripcion VARCHAR(255),
);

CREATE TABLE TESLA.BI_SUBRUBRO (
    bi_subr_id DECIMAL(18, 0) IDENTITY(1,1) PRIMARY KEY,
	bi_subr_descripcion VARCHAR(255),
	bi_subr_rubro_descripcion VARCHAR(255)
);

CREATE TABLE TESLA.BI_MARCA (
    bi_marca_id DECIMAL(18, 0) IDENTITY(1,1) PRIMARY KEY,
	bi_marca_descripcion VARCHAR(255)
);

CREATE TABLE TESLA.BI_CONCEPTO_FACTURA (
    bi_conc_id DECIMAL(18, 0) IDENTITY(1,1) PRIMARY KEY,
	bi_conc_descripcion VARCHAR(255)
);

-- TABLAS DE HECHOS

CREATE TABLE TESLA.BI_HECHO_PUBLICACION (
    bi_publicacion_id DECIMAL(18, 0) 			IDENTITY(1,1) PRIMARY KEY,
    bi_publicacion_fecha_inicio DECIMAL(18, 0),
    bi_publicacion_fecha_final DECIMAL(18, 0),
    bi_publicacion_subRubro DECIMAL(18, 0),
    bi_publicacion_marca DECIMAL(18, 0),
    bi_publicacion_stock DECIMAL(18, 0),
    FOREIGN KEY (bi_publicacion_fecha_inicio) 		REFERENCES TESLA.BI_UBICACION(bi_ubic_id),
	FOREIGN KEY (bi_publicacion_fecha_final) 		REFERENCES TESLA.BI_UBICACION(bi_ubic_id),
	FOREIGN KEY (bi_publicacion_subRubro) 	REFERENCES TESLA.BI_SUBRUBRO(bi_subr_id),
	FOREIGN KEY (bi_publicacion_marca) 	REFERENCES TESLA.BI_MARCA(bi_marca_id),
);

CREATE TABLE TESLA.BI_HECHO_VENTA (
    bi_venta_id DECIMAL(18, 0) 			IDENTITY(1,1) PRIMARY KEY,
    bi_venta_ubicacion DECIMAL(18, 0),
    bi_venta_tiempo DECIMAL(18, 0),
    bi_venta_rango_horario DECIMAL(18, 0),
    bi_venta_subRubro decimal(18,0),
	bi_venta_importe decimal(18,0)
    FOREIGN KEY (bi_venta_ubicacion) 		REFERENCES TESLA.BI_UBICACION(bi_ubic_id),
    FOREIGN KEY (bi_venta_tiempo) 			REFERENCES TESLA.BI_TIEMPO(bi_tiempo_id),
    FOREIGN KEY (bi_venta_rango_horario) 	REFERENCES TESLA.BI_RANGO_HORARIO_VENTAS(bi_rango_horario_id),
    FOREIGN KEY (bi_venta_subRubro)			REFERENCES TESLA.BI_SUBRUBRO(bi_subr_id),
);

CREATE TABLE TESLA.BI_HECHO_PAGO (
    bi_pago_id DECIMAL(18,0) 			IDENTITY(1,1) PRIMARY KEY,
    bi_pago_tiempo DECIMAL(18,0),
	bi_pago_ubicacion DECIMAL(18,0),
	bi_pago_tipo_medio_de_pago DECIMAL(18,0),
    bi_pago_importe DECIMAL(18,2)
    FOREIGN KEY (bi_pago_tiempo) 				REFERENCES TESLA.BI_TIEMPO(bi_tiempo_id),
    FOREIGN KEY (bi_pago_ubicacion) 			REFERENCES TESLA.BI_UBICACION(bi_ubic_id),
	FOREIGN KEY (bi_pago_tipo_medio_de_pago)	REFERENCES TESLA.BI_TIPO_MEDIO_DE_PAGO(bi_tipo_medio_pago_id),
);
GO

CREATE TABLE TESLA.BI_HECHO_ENVIO (
    bi_envio_id DECIMAL(18, 0) 			IDENTITY(1,1) PRIMARY KEY,
    bi_envio_tiempo DECIMAL(18, 0),
    bi_envio_ubicacion DECIMAL(18, 0),
    bi_envio_costo DECIMAL(18, 2),
    bi_envio_cumplidas DECIMAL(18,0),
	bi_envi_not_cumplidas DECIMAL(18,0),
    FOREIGN KEY (bi_envio_tiempo) 			REFERENCES TESLA.BI_TIEMPO(bi_tiempo_id),
    FOREIGN KEY (bi_envio_ubicacion) 		REFERENCES TESLA.BI_UBICACION(bi_ubic_id)
);

CREATE TABLE TESLA.BI_HECHO_FACTURACION (
    bi_facturacion_id DECIMAL(18, 0) 			IDENTITY(1,1) PRIMARY KEY,
    bi_facturacion_tiempo DECIMAL(18, 0),
    bi_facturacion_ubicacion DECIMAL(18, 0),
    bi_facturacion_concepto DECIMAL(18,0),
    bi_facturacion_total DECIMAL(18,0),
    FOREIGN KEY (bi_facturacion_tiempo) 			REFERENCES TESLA.BI_TIEMPO(bi_tiempo_id),
    FOREIGN KEY (bi_facturacion_ubicacion) 			REFERENCES TESLA.BI_UBICACION(bi_ubic_id),
	FOREIGN KEY (bi_facturacion_concepto) 			REFERENCES TESLA.BI_CONCEPTO_FACTURA(bi_conc_id)
);
GO


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(3)CREACION DE FUNCIONES-------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----- FUNCIONES
-- Dado un mes devuelve cuatrimestre
CREATE FUNCTION TESLA.OBTENER_CUATRIMESTRE(@mes DECIMAL(2,0)) RETURNS DECIMAL(1,0) AS
BEGIN

	RETURN CASE
		WHEN @mes BETWEEN 1 AND 4 THEN 1
		WHEN @mes BETWEEN 5 AND 8 THEN 2
		WHEN @mes BETWEEN 9 AND 12 THEN 3
		ELSE 0 END
END
GO

--Dado una localidad devuelve un id_bi_ubicacion
CREATE FUNCTION TESLA.OBTENER_ID_UBICACION(@localidad VARCHAR(255), @provincia varchar(255)) RETURNS DECIMAL(18,0) AS
BEGIN
	DECLARE @id_ubicacion DECIMAL(18,0);

	SELECT @id_ubicacion = bi_ubic_id
	FROM TESLA.BI_UBICACION
	WHERE bi_ubic_localidad = @localidad 
	and bi_ubic_provincia = @provincia

	RETURN @id_ubicacion
END
GO

--Dado un año y un mes devuelve un id_tiempo
create FUNCTION TESLA.OBTENER_ID_TIEMPO(@anio int, @mes int) RETURNS DECIMAL(18,0) AS
BEGIN
    DECLARE @id_tiempo DECIMAL(18,0)

    SELECT @id_tiempo = bi_tiempo_id
    FROM TESLA.BI_TIEMPO
    WHERE TESLA.BI_TIEMPO.bi_tiempo_anio = @anio
    AND TESLA.BI_TIEMPO.bi_tiempo_mes = @mes

    RETURN @id_tiempo
END
GO

--Dado una hora de finalizacion y una fecha con hora de entrega estimada devuelve "CUMPLIO" o "NO CUMPLIO"
CREATE FUNCTION TESLA.CUMPLIO_HORARIO(@hora_entrega_programada DECIMAL(18,0), @envio_fecha_entrega DATETIME) RETURNS VARCHAR(255) AS
BEGIN
	DECLARE @hora_entrega_real DECIMAL(18,0);
	DECLARE @resultado VARCHAR(255); 
	SET @hora_entrega_real = DATEPART(HOUR,@envio_fecha_entrega);

	IF @hora_entrega_real > @hora_entrega_programada
		SET @resultado = 'NO CUMPLIO'
	ELSE
		SET @resultado = 'CUMPLIO'

	RETURN @resultado;
END
GO

-- TODO VER FUNCIONES

--Dado un id_vendedor devuelve un bi_ubic_id
CREATE FUNCTION TESLA.OBTENER_ID_UBICACION_VENDEDOR(@vendedor_id DECIMAL(18,0)) RETURNS DECIMAL(18,0) AS
BEGIN

    DECLARE @localidad VARCHAR(255);
    DECLARE @provincia varchar(255);
    SELECT
        @localidad  = l.loc_nombre,
        @provincia = pv.prov_nombre
    FROM TESLA.USUARIO v
    JOIN TESLA.DOMICILIO d ON d.domi_usuario = v.usr_vendedor
    join TESLA.LOCALIDAD l on d.domi_localidad = l.loc_id
    join TESLA.PROVINCIA pv on l.loc_provincia = pv.prov_id
        WHERE v.usr_vendedor = @vendedor_id

    RETURN TESLA.OBTENER_ID_UBICACION(@localidad,@provincia )
END
GO



--Dado un subrubro y un rubro devuelve un id_subrubro
create FUNCTION TESLA.OBTENER_ID_SUBRUBRO(@subrubro varchar(50), @rubro varchar(50)) RETURNS DECIMAL(18,0) AS
BEGIN

          DECLARE @id_subrubro DECIMAL(18,0)

    SELECT @id_subrubro = sb.bi_subr_id
    FROM TESLA.BI_SUBRUBRO sb
	where sb.bi_subr_descripcion = @subrubro
	and sb.bi_subr_rubro_descripcion = @rubro

    RETURN @id_subrubro
END
GO

/*
--Dado una fecha de nacimiento, devuelve el rango de edad
CREATE FUNCTION TESLA.RANGO_EDAD(@fecha_nacimiento DATE) RETURNS DECIMAL(18) AS
BEGIN
	DECLARE @id_rango_edad DECIMAL(18,0);
	DECLARE @HOY DATE;
	DECLARE @EDAD INT;
	SET @HOY = GETDATE();
	SET @EDAD = DATEDIFF(YEAR, @fecha_nacimiento, GETDATE()) - 
                  CASE 
                      WHEN MONTH(@fecha_nacimiento) > MONTH(GETDATE()) OR 
                           (MONTH(@fecha_nacimiento) = MONTH(GETDATE()) AND DAY(@fecha_nacimiento) > DAY(GETDATE()))
                      THEN 1 
                      ELSE 0 
                  END;

	IF @EDAD BETWEEN 0 AND 24
		SELECT @id_rango_edad = rec.bi_rango_etario_id
		FROM TESLA.BI_RANGO_ETARIO_CLIENTES rec
		WHERE rec.bi_rango_etario_nombre = '< 25'
		
	ELSE IF @EDAD BETWEEN 25 AND 35
		SELECT @id_rango_edad = rec.bi_rango_etario_id
		FROM TESLA.BI_RANGO_ETARIO_CLIENTES rec
		WHERE rec.bi_rango_etario_nombre = '25 - 35'
	
	ELSE IF @EDAD BETWEEN 35 AND 50
		SELECT @id_rango_edad = rec.bi_rango_etario_id 
		FROM TESLA.BI_RANGO_ETARIO_CLIENTES rec
		WHERE rec.bi_rango_etario_nombre = '35 - 50'
		
	ELSE
		SELECT @id_rango_edad = rec.bi_rango_etario_id 
		FROM TESLA.BI_RANGO_ETARIO_CLIENTES rec
		WHERE rec.bi_rango_etario_nombre = '> 50'


	RETURN @id_rango_edad;

END
GO

CREATE FUNCTION TESLA.OBTENER_CODIGO_TURNO (@fecha_y_hora DATETIME)
RETURNS INT
AS
BEGIN
	DECLARE @tiempo TIME;
    DECLARE @codigo_turno INT;
	set @tiempo = CAST(@fecha_y_hora AS TIME);
    SELECT TOP 1 @codigo_turno = bi_turno_codigo
    FROM TESLA.BI_TURNO
    WHERE 
        (@tiempo >= '08:00' AND @tiempo < '12:00' AND bi_turno_rango = '08:00 - 12:00') OR
        (@tiempo >= '12:00' AND @tiempo < '16:00' AND bi_turno_rango = '12:00 - 16:00') OR
        (@tiempo >= '16:00' AND @tiempo < '20:00' AND bi_turno_rango = '16:00 - 20:00');

    RETURN @codigo_turno;
END;
GO
*/

/*
-- Dado una cantidad de cuotas devuelve un codigo de cuota
CREATE FUNCTION TESLA.ID_CUOTA(@deta_cuotas DECIMAL(18,0)) RETURNS DECIMAL(18,0) AS
BEGIN
    DECLARE @id_cuota DECIMAL(18,0);

    SELECT @id_cuota = bi_cuota_codigo
	FROM TESLA.BI_CUOTA
	WHERE bi_cuota_detalle = @deta_cuotas

    RETURN @id_cuota;
END;
GO

--Dado una categoria devuelve su codigo
CREATE FUNCTION TESLA.OBTENER_CODIGO_CATEGORIA(@categoria varchar(255)) RETURNS DECIMAL(18,0) AS
BEGIN
	DECLARE @codigo_categoria decimal(18,0)
	SELECT @codigo_categoria = bi_cate_codigo from TESLA.BI_CATEGORIA
	where bi_cate_detalle = @categoria

	RETURN @codigo_categoria
END
GO

--Dado un mes, anio y cuatrimestre, devuelve el codigo del tiempo
CREATE FUNCTION TESLA.OBTENER_CODIGO_TIEMPO(@anio DECIMAL(4, 0),@mes DECIMAL(2, 0),@cuatrimestre DECIMAL(1, 0)) 
RETURNS DECIMAL(18,0) AS
BEGIN
	DECLARE @codigo_tiempo decimal(18,0)
	SELECT @codigo_tiempo = bi_tiem_codigo from TESLA.BI_TIEMPO
	where bi_tiem_anio = @anio and bi_tiem_mes = @mes and bi_tiem_cuatrimestre = @cuatrimestre

	RETURN @codigo_tiempo
END
GO

*/

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(4)MIGRACIONES DIMENSIONES--------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
GO
--DIMENSION TIEMPO
CREATE PROCEDURE TESLA.bi_migrar_tiempo AS
BEGIN
    -- Insertar desde TESLA.PUBLICACION (publi_fecha_inicio)
    INSERT INTO TESLA.BI_TIEMPO (bi_tiempo_anio, bi_tiempo_mes, bi_tiempo_cuatrimestre)
    SELECT DISTINCT
        YEAR(publi_fecha_inicio),
        MONTH(publi_fecha_inicio),
        TESLA.OBTENER_CUATRIMESTRE(MONTH(publi_fecha_inicio))
    FROM TESLA.PUBLICACION
    WHERE publi_fecha_inicio IS NOT NULL
      AND NOT EXISTS (
          SELECT 1
          FROM TESLA.BI_TIEMPO bt
          WHERE bt.bi_tiempo_anio = YEAR(publi_fecha_inicio)
            AND bt.bi_tiempo_mes = MONTH(publi_fecha_inicio)
            AND bt.bi_tiempo_cuatrimestre = TESLA.OBTENER_CUATRIMESTRE(MONTH(publi_fecha_inicio))
      );

    -- Insertar desde TESLA.PUBLICACION (publi_fecha_fin)
    INSERT INTO TESLA.BI_TIEMPO (bi_tiempo_anio, bi_tiempo_mes, bi_tiempo_cuatrimestre)
    SELECT DISTINCT
        YEAR(publi_fecha_fin),
        MONTH(publi_fecha_fin),
        TESLA.OBTENER_CUATRIMESTRE(MONTH(publi_fecha_fin))
    FROM TESLA.PUBLICACION
    WHERE publi_fecha_fin IS NOT NULL
      AND NOT EXISTS (
          SELECT 1
          FROM TESLA.BI_TIEMPO bt
          WHERE bt.bi_tiempo_anio = YEAR(publi_fecha_fin)
            AND bt.bi_tiempo_mes = MONTH(publi_fecha_fin)
            AND bt.bi_tiempo_cuatrimestre = TESLA.OBTENER_CUATRIMESTRE(MONTH(publi_fecha_fin))
      );

    -- Insertar desde TESLA.VENTA
    INSERT INTO TESLA.BI_TIEMPO (bi_tiempo_anio, bi_tiempo_mes, bi_tiempo_cuatrimestre)
    SELECT DISTINCT
        YEAR(vent_fecha),
        MONTH(vent_fecha),
        TESLA.OBTENER_CUATRIMESTRE(MONTH(vent_fecha))
    FROM TESLA.VENTA
    WHERE vent_fecha IS NOT NULL
      AND NOT EXISTS (
          SELECT 1
          FROM TESLA.BI_TIEMPO bt
          WHERE bt.bi_tiempo_anio = YEAR(vent_fecha)
            AND bt.bi_tiempo_mes = MONTH(vent_fecha)
            AND bt.bi_tiempo_cuatrimestre = TESLA.OBTENER_CUATRIMESTRE(MONTH(vent_fecha))
      );

    -- Insertar desde TESLA.ENVIO (env_fecha_programada)
    INSERT INTO TESLA.BI_TIEMPO (bi_tiempo_anio, bi_tiempo_mes, bi_tiempo_cuatrimestre)
    SELECT DISTINCT
        YEAR(env_fecha_programada),
        MONTH(env_fecha_programada),
        TESLA.OBTENER_CUATRIMESTRE(MONTH(env_fecha_programada))
    FROM TESLA.ENVIO
    WHERE env_fecha_programada IS NOT NULL
      AND NOT EXISTS (
          SELECT 1
          FROM TESLA.BI_TIEMPO bt
          WHERE bt.bi_tiempo_anio = YEAR(env_fecha_programada)
            AND bt.bi_tiempo_mes = MONTH(env_fecha_programada)
            AND bt.bi_tiempo_cuatrimestre = TESLA.OBTENER_CUATRIMESTRE(MONTH(env_fecha_programada))
      );

    -- Insertar desde TESLA.ENVIO (env_fecha_entrega)
    INSERT INTO TESLA.BI_TIEMPO (bi_tiempo_anio, bi_tiempo_mes, bi_tiempo_cuatrimestre)
    SELECT DISTINCT
        YEAR(env_fecha_entrega),
        MONTH(env_fecha_entrega),
        TESLA.OBTENER_CUATRIMESTRE(MONTH(env_fecha_entrega))
    FROM TESLA.ENVIO
    WHERE env_fecha_entrega IS NOT NULL
      AND NOT EXISTS (
          SELECT 1
          FROM TESLA.BI_TIEMPO bt
          WHERE bt.bi_tiempo_anio = YEAR(env_fecha_entrega)
            AND bt.bi_tiempo_mes = MONTH(env_fecha_entrega)
            AND bt.bi_tiempo_cuatrimestre = TESLA.OBTENER_CUATRIMESTRE(MONTH(env_fecha_entrega))
      );

    -- Insertar desde TESLA.PAGO
    INSERT INTO TESLA.BI_TIEMPO (bi_tiempo_anio, bi_tiempo_mes, bi_tiempo_cuatrimestre)
    SELECT DISTINCT
        YEAR(pago_fecha),
        MONTH(pago_fecha),
        TESLA.OBTENER_CUATRIMESTRE(MONTH(pago_fecha))
    FROM TESLA.PAGO
    WHERE pago_fecha IS NOT NULL
      AND NOT EXISTS (
          SELECT 1
          FROM TESLA.BI_TIEMPO bt
          WHERE bt.bi_tiempo_anio = YEAR(pago_fecha)
            AND bt.bi_tiempo_mes = MONTH(pago_fecha)
            AND bt.bi_tiempo_cuatrimestre = TESLA.OBTENER_CUATRIMESTRE(MONTH(pago_fecha))
      );
END
GO

--DIMENSION UBICACION
CREATE PROCEDURE TESLA.bi_migrar_ubicacion AS
BEGIN
	INSERT INTO TESLA.BI_UBICACION (bi_ubic_provincia,bi_ubic_localidad)
	SELECT DISTINCT
		prov_nombre,
		loc_nombre
	FROM TESLA.LOCALIDAD
	 JOIN TESLA.PROVINCIA
		ON prov_id = loc_provincia
END
GO

--DIMENSION RANGO_ETARIO
CREATE PROCEDURE TESLA.bi_migrar_rango_etario_clientes AS
BEGIN
	INSERT INTO TESLA.BI_RANGO_ETARIO_CLIENTES(bi_rango_etario_nombre)
	VALUES	('< 25'),
			('25 - 35'),
            ('35 - 50'),
			('> 50')
END
GO


--DIMENSION RANGO HORARIO VENTAS
CREATE PROCEDURE TESLA.bi_migrar_rango_horario_ventas AS
BEGIN
    INSERT INTO TESLA.BI_RANGO_HORARIO_VENTAS(bi_rango_horario_nombre)
    VALUES ('00:00 - 06:00'),
           ('06:00 - 12:00'),
		   ('12:00 - 18:00'),
		   ('18:00 - 00:00')
	END
GO
--DIMENSION MEDIO_DE_PAGO 
CREATE PROCEDURE TESLA.bi_migrar_tipo_medio_de_pago AS
BEGIN
	INSERT INTO TESLA.BI_TIPO_MEDIO_DE_PAGO(bi_tipo_medio_pago_descripcion)
	SELECT
		tipo_medio_de_pago_descripcion
	FROM TESLA.TIPO_MEDIO_DE_PAGO
END
GO


--DIMENSION TIPO ENVIO
CREATE PROCEDURE TESLA.bi_migrar_tipo_envio AS
BEGIN
    INSERT INTO TESLA.BI_TIPO_ENVIO(bi_tipo_envio_descripcion)
    SELECT 
         tipo_envio_descripcion
    FROM TESLA.TIPO_ENVIO
    
END
GO

--DIMENSION SUBRUBRO
CREATE PROCEDURE TESLA.bi_migrar_subrubro AS
BEGIN
    INSERT INTO TESLA.BI_SUBRUBRO(bi_subr_descripcion,bi_subr_rubro_descripcion)
    SELECT DISTINCT 
        sub_rubr_descripcion,
		rubr_descripcion
    FROM TESLA.SUB_RUBRO
	join TESLA.RUBRO on sub_rubr_rubro = rubr_id
END
GO

--DIMENSION MARCA
CREATE PROCEDURE TESLA.bi_migrar_marca AS
BEGIN
    INSERT INTO TESLA.BI_MARCA(bi_marca_descripcion)
    SELECT DISTINCT 
		marca_descripcion
    FROM TESLA.MARCA
END
GO


--DIMENSION CONCEPTO FACTURA
CREATE PROCEDURE TESLA.bi_migrar_concepto_factura AS
BEGIN
    INSERT INTO TESLA.BI_CONCEPTO_FACTURA(bi_conc_descripcion)
    SELECT DISTINCT 
		conc_descripcion
    FROM TESLA.CONCEPTO_FACTURA
END
GO


-----------------------------------------------------------------
-----------(4.1)EXEC DIMENSIONES---------------------------------
-----------------------------------------------------------------

EXEC TESLA.bi_migrar_tiempo;
EXEC TESLA.bi_migrar_ubicacion;
EXEC TESLA.bi_migrar_rango_etario_clientes;
EXEC TESLA.bi_migrar_rango_horario_ventas;
EXEC TESLA.bi_migrar_tipo_medio_de_pago;
EXEC TESLA.bi_migrar_tipo_envio;
EXEC TESLA.bi_migrar_subrubro;
EXEC TESLA.bi_migrar_marca;
EXEC TESLA.bi_migrar_concepto_factura;
GO

-----------------------------------------------------------------
-----------(4.2)MIGRACIONES HECHOS---------------------------------
-----------------------------------------------------------------


/*

SELECT publi_fecha_inicio, publi_fecha_fin,DATEDIFF(DAY,publi_fecha_inicio, publi_fecha_fin) FROM TESLA.PUBLICACION
WHERE MONTH(publi_fecha_fin) > MONTH(publi_fecha_inicio)
order by 3 desc
--- MIGRAR PUBLICACION
CREATE PROCEDURE TESLA.bi_migrar_publicacion AS
BEGIN
    INSERT INTO TESLA.BI_HECHO_PUBLICACION(bi_publicacion_fecha_inicio, bi_publicacion_fecha_final, bi_publicacion_subRubro,
											bi_publicacion_marca, bi_publicacion_stock
											)
    SELECT 
        TESLA.ID_TIEMPO(publi_fecha_inicio),
		TESLA.ID_TIEMPO(publi_fecha_fin),

        tick_sucursal,
        TESLA.RANGO_EDAD(clie_fecha_nacimiento),
        TESLA.ID_UBICACION(loca_nombre),
        SUM(CAST(envi_costo AS DECIMAL(18,2))),
        SUM(CASE WHEN TESLA.CUMPLIO_HORARIO(envi_hora_fin, envi_fecha_y_hora_entrega) = 'CUMPLIO' THEN 1 ELSE 0 END),
        SUM(CASE WHEN TESLA.CUMPLIO_HORARIO(envi_hora_fin, envi_fecha_y_hora_entrega) = 'NO CUMPLIO' THEN 1 ELSE 0 END)
    FROM TESLA.PUBLICACION
    LEFT JOIN TESLA.ENVIO e
        ON envi_codigo_ticket = tick_codigo
    LEFT JOIN TESLA.CLIENTE
        ON clie_codigo = envi_cliente
    LEFT JOIN TESLA.LOCALIDAD
        ON loca_codigo = clie_localidad
    GROUP BY      TESLA.ID_TIEMPO(tick_fecha_y_hora),
                tick_sucursal,
                TESLA.RANGO_EDAD(clie_fecha_nacimiento),
                TESLA.ID_UBICACION(loca_nombre)
END*/
GO


--- MIGRAR VENTA
CREATE PROCEDURE TESLA.bi_migrar_venta AS
BEGIN
    INSERT INTO TESLA.BI_HECHO_VENTA(bi_venta_tiempo, bi_venta_ubicacion, bi_venta_subRubro, bi_venta_rango_horario, bi_venta_importe)
    SELECT 
        TESLA.OBTENER_ID_TIEMPO(YEAR(v.vent_fecha), MONTH(v.vent_fecha)),
        TESLA.OBTENER_ID_UBICACION(l.loc_nombre, pv.prov_nombre),
        TESLA.OBTENER_ID_SUBRUBRO(sr.sub_rubr_descripcion, r.rubr_descripcion),
		1, -- TODO RANGO HORARIO ??? ,
        SUM(v.vent_total)
    FROM TESLA.VENTA v
    JOIN TESLA.DETALLE_VENTA dv on v.vent_id = dv.det_vent_venta
	join TESLA.PUBLICACION p on dv.det_vent_publicacion = p.publi_id
	join TESLA.ALMACEN a on p.publi_almacen = a.alm_id
	join TESLA.DOMICILIO d on a.alm_id = d.domi_almacen
	join TESLA.LOCALIDAD l on d.domi_localidad = l.loc_id
	join TESLA.PROVINCIA pv on l.loc_provincia = pv.prov_id
--TODO: MUCHOS JOINS, VER SI SE PUEDE HACER CON MENOS O SI SE PUEDE HACER OTRA COSA

	join TESLA.PRODUCTO pr on p.publi_producto = pr.prod_id
	join TESLA.SUB_RUBRO sr on pr.prod_sub_rubro = sr.sub_rubr_id
	join TESLA.RUBRO r on sr.sub_rubr_rubro = r.rubr_id

	group by YEAR(v.vent_fecha), MONTH(v.vent_fecha), pv.prov_nombre, r.rubr_descripcion
END
GO

--- MIGRAR ENVIO
CREATE PROCEDURE TESLA.bi_migrar_envio AS
BEGIN
    INSERT INTO TESLA.BI_HECHO_ENVIO(bi_envio_tiempo , bi_envio_ubicacion, bi_envio_costo, bi_envio_cumplidas, bi_envi_not_cumplidas)
    SELECT 
       TESLA.OBTENER_ID_TIEMPO(YEAR(e.env_fecha_programada), MONTH(e.env_fecha_programada)),
        TESLA.OBTENER_ID_UBICACION(l.loc_nombre, pv.prov_nombre),
        AVG(e.env_costo),
        SUM(CASE WHEN TESLA.CUMPLIO_HORARIO(e.env_horario_fin, e.env_fecha_entrega) = 'CUMPLIO' THEN 1 ELSE 0 END),
        SUM(CASE WHEN TESLA.CUMPLIO_HORARIO(e.env_horario_fin, e.env_fecha_entrega) = 'NO CUMPLIO' THEN 1 ELSE 0 END)

		from TESLA.ENVIO e
		join TESLA.DOMICILIO d on e.env_domicilio = d.domi_id
		join TESLA.LOCALIDAD l on d.domi_localidad = l.loc_id
		join TESLA.PROVINCIA pv on l.loc_provincia = pv.prov_id

		group by YEAR(e.env_fecha_programada), MONTH(e.env_fecha_programada),
		l.loc_nombre, pv.prov_nombre
 END
GO

---- MIGRACION PAGO

CREATE PROCEDURE TESLA.bi_migrar_pago AS
BEGIN
    INSERT INTO TESLA.BI_HECHO_PAGO(bi_pago_tipo_medio_de_pago,
                                    bi_pago_tiempo,
                                    bi_pago_ubicacion,
                                    bi_pago_importe)
    SELECT DISTINCT
        (SELECT bimp.bi_tipo_medio_pago_id FROM TESLA.BI_TIPO_MEDIO_DE_PAGO bimp
		where tmp.tipo_medio_de_pago_descripcion = bimp.bi_tipo_medio_pago_descripcion),
        TESLA.OBTENER_ID_TIEMPO(YEAR(p.pago_fecha), MONTH(p.pago_fecha)),
        TESLA.OBTENER_ID_UBICACION(l.loc_nombre, pv.prov_nombre),
        SUM(p.pago_importe)

        FROM TESLA.PAGO p
		join TESLA.MEDIO_DE_PAGO mp on p.pago_medio = mp.medio_de_pago_id
		JOIN TESLA.TIPO_MEDIO_DE_PAGO tmp on tmp.tipo_medio_de_pago_id = mp.medio_de_pago_tipo
		join TESLA.VENTA v on p.pago_venta = v.vent_id
		join TESLA.ENVIO e on e.env_venta = v.vent_id
		join TESLA.DOMICILIO d on e.env_domicilio = d.domi_id
		join TESLA.LOCALIDAD l on d.domi_localidad = l.loc_id
		join TESLA.PROVINCIA pv on l.loc_provincia = pv.prov_id

		group by tmp.tipo_medio_de_pago_descripcion, YEAR(p.pago_fecha), MONTH(p.pago_fecha), 
				l.loc_nombre, pv.prov_nombre

END
GO

---- MIGRACION FACTURACION

CREATE PROCEDURE TESLA.bi_migrar_facturacion AS
BEGIN
    INSERT INTO TESLA.BI_HECHO_FACTURACION(bi_facturacion_tiempo, bi_facturacion_ubicacion, bi_facturacion_concepto, bi_facturacion_total)
    SELECT DISTINCT
        TESLA.OBTENER_ID_TIEMPO(YEAR(f.fact_fecha), MONTH(f.fact_fecha)),
        TESLA.OBTENER_ID_UBICACION_VENDEDOR(f.fact_vendedor),
		(SELECT bcf.bi_conc_id FROM TESLA.BI_CONCEPTO_FACTURA bcf
		where cf.conc_descripcion = bcf.bi_conc_descripcion),
        SUM(IT.item_sub_total)

        FROM TESLA.ITEM_FACTURA IT
		JOIN TESLA.CONCEPTO_FACTURA cf on IT.item_concepto_factura = cf.conc_id
		JOIN TESLA.FACTURA f on IT.item_factura = f.fact_id
		

		group by cf.conc_descripcion, YEAR(f.fact_fecha), MONTH(f.fact_fecha), 
				f.fact_vendedor

END
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(5)EXEC HECHOS------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


EXEC TESLA.bi_migrar_envio;
EXEC TESLA.bi_migrar_pago;
EXEC TESLA.bi_migrar_facturacion;

GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(6)VISTAS------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1

/*
TODO VISTAS
CREATE VIEW TESLA.VW_TICKET_PROMEDIO_MENSUAL AS
	SELECT 
		bi_ubic_localidad AS Localidad,
		bi_tiem_anio AS Anio,
		bi_tiem_mes AS Mes,
		( ( SUM(bi_vent_monto) ) / ( COUNT(bi_vent_codigo) ) ) AS Ticket_Promedio
		
	FROM TESLA.BI_VENTA 
	INNER JOIN TESLA.BI_UBICACION 
		ON bi_vent_ubicacion = bi_ubic_codigo
	INNER JOIN TESLA.BI_TIEMPO 
		ON bi_vent_tiempo = bi_tiem_codigo
		
	GROUP BY bi_ubic_localidad, bi_tiem_anio, bi_tiem_mes
GO


-- 2
CREATE VIEW TESLA.VW_CANTIDAD_UNIDADES_PROMEDIO AS
	SELECT 
		bi_tiem_cuatrimestre,
		bi_tiem_anio,
		bi_turno_rango,
		( ( SUM(bi_vent_cantidad) ) / ( COUNT(bi_vent_codigo) ) ) as promedio_venta_sobre_anio
		
	FROM TESLA.BI_VENTA
	INNER JOIN TESLA.BI_TIEMPO
		ON bi_tiem_codigo = bi_vent_tiempo
	INNER JOIN TESLA.BI_TURNO
		ON bi_turno_codigo = bi_vent_turno
	
	GROUP BY bi_tiem_cuatrimestre, bi_tiem_anio, bi_turno_rango
GO


-- 3
CREATE VIEW TESLA.VW_PORCENTAJE_ANUAL_VENTAS AS
	SELECT 
		bi_rang_nombre,
		bi_tipo_caja_nombre,
		t1.bi_tiem_cuatrimestre,
        t1.bi_tiem_anio,
		( ( SUM(bi_vent_cantidad) ) / (	SELECT SUM(v2.bi_vent_cantidad) 
										FROM TESLA.BI_VENTA v2
										LEFT JOIN TESLA.BI_TIEMPO t2
											ON t2.bi_tiem_codigo = v2.bi_vent_tiempo
										WHERE t2.bi_tiem_anio = t1.bi_tiem_anio	) ) as porcentaje_anual_ventas
		
	FROM TESLA.BI_VENTA v1
	LEFT JOIN TESLA.BI_RANGO_ETARIO
		ON bi_rang_codigo = v1.bi_vent_rango_etario_empl
	LEFT JOIN TESLA.BI_TIPO_CAJA
		ON bi_tipo_caja_codigo = v1.bi_vent_tipo_caja
	LEFT JOIN TESLA.BI_TIEMPO t1
		ON t1.bi_tiem_codigo = v1.bi_vent_tiempo
        
    GROUP BY bi_rang_nombre,bi_tipo_caja_nombre,t1.bi_tiem_cuatrimestre,t1.bi_tiem_anio
GO

-- 4
CREATE VIEW TESLA.VW_CANTIDAD_VENTAS_X_TURNO AS
    SELECT 
        bi_ubic_localidad AS Localidad,
        bi_tiem_anio AS A�o,
        bi_tiem_mes AS Mes,
		bi_turno_rango,
        COUNT(bi_vent_codigo) AS [Cantidad de ventas]
		
    FROM TESLA.BI_VENTA 
    INNER JOIN TESLA.BI_UBICACION  
        ON bi_vent_ubicacion = bi_ubic_codigo
    INNER JOIN TESLA.BI_TIEMPO  
        ON bi_vent_tiempo = bi_tiem_codigo
	INNER JOIN TESLA.BI_TURNO
		ON bi_turno_codigo = bi_vent_turno
		
    GROUP BY bi_ubic_localidad, bi_tiem_anio, bi_tiem_mes,bi_turno_rango
GO


-- 5
CREATE VIEW TESLA.VW_PORCENTAJE_DESCUENTO_APLICADO AS
    SELECT 
		bi_tiem_anio AS A�o,
		bi_tiem_mes AS Mes,
		( ( SUM(bi_vent_descuento_promocion) ) / ( COUNT(bi_vent_codigo) ) ) as porcentaje_desc_aplicado
		
    FROM TESLA.BI_VENTA
    INNER JOIN TESLA.BI_TIEMPO  
        ON bi_vent_tiempo = bi_tiem_codigo
	
    GROUP BY bi_tiem_anio, bi_tiem_mes
GO

-- 6
CREATE VIEW TESLA.VW_PRODUCTOS_MAYOR_DESCUENTO_APLICADO AS
    SELECT TOP 3
        bi_cate_detalle, 
        bi_tiem_cuatrimestre, 
        bi_tiem_anio, 
        SUM(bi_veXpr_descuento_promocion) as descuento_aplicado

    FROM TESLA.BI_VENTA_X_PRODUCTO 
    INNER join TESLA.BI_TIEMPO  
		ON bi_veXpr_tiempo = bi_tiem_codigo
	INNER JOIN TESLA.BI_CATEGORIA
		ON bi_veXpr_categoria = bi_cate_codigo

    GROUP BY bi_cate_detalle, bi_tiem_cuatrimestre, bi_tiem_anio
	
    ORDER BY SUM(bi_veXpr_descuento_promocion) DESC
GO

-- 7
CREATE VIEW TESLA.VW_PORCENTAJE_DE_CUMPLIMIENTO_DE_ENVIOS AS
    SELECT
        ( SUM(bi_envi_cumplidas) / ( SUM(bi_envi_cumplidas) + SUM(bi_envi_not_cumplidas) ) * 100 ) AS 'Porcentaje_Cumplimiento_Envio',
        bi_tiem_anio AS 'A�o',
        bi_tiem_mes AS 'Mes',
        bi_sucu_numero AS 'Sucursal'

    FROM TESLA.BI_ENVIO
    INNER JOIN BI_TIEMPO 
		ON bi_tiem_codigo = bi_envi_tiempo
    INNER JOIN BI_SUCURSAL 
		ON bi_sucu_numero = bi_envi_sucursal
		
    GROUP BY bi_tiem_anio, bi_tiem_mes, bi_sucu_numero
GO 

-- 8 
CREATE VIEW TESLA.VW_CANTIDAD_DE_ENVIOS_POR_RANGO_ETARIO_DE_CLIENTES AS 
    SELECT 
        COUNT(bi_envi_codigo) AS 'Cantidad_De_Envios',
        bi_rang_nombre AS 'Rango_Etario',
    	bi_tiem_cuatrimestre 'Cuatrimestre',
        bi_tiem_anio 'A�o'

    FROM TESLA.BI_ENVIO
    INNER JOIN BI_RANGO_ETARIO 
        ON bi_envi_rango_etario_cl = bi_rang_codigo
    INNER JOIN BI_TIEMPO 
        ON bi_envi_tiempo = bi_tiem_codigo

    GROUP BY bi_rang_nombre, bi_tiem_cuatrimestre, bi_tiem_anio
GO
*/
-- 9
CREATE VIEW TESLA.VW_PORCENTAJE_FACTURACION_X_CONCEPTO AS
	SELECT
	ti.bi_tiempo_mes as Mes,
	ti.bi_tiempo_anio as [Año],
	cf.bi_conc_descripcion as [Concepto Factura],
	FORMAT(
	sum(FC.bi_facturacion_total)*100
	/
	(SELECT SUM(FC.bi_facturacion_total)
	FROM TESLA.BI_HECHO_FACTURACION FC
	join TESLA.BI_TIEMPO ti2 on FC.bi_facturacion_tiempo = ti2.bi_tiempo_id
	where ti2.bi_tiempo_mes = ti.bi_tiempo_mes 
	and ti2.bi_tiempo_anio = ti.bi_tiempo_anio), 'N2') + '%' as [Porcentaje Facturado]

	FROM TESLA.BI_HECHO_FACTURACION FC
	join TESLA.BI_TIEMPO ti on FC.bi_facturacion_tiempo = ti.bi_tiempo_id
	join TESLA.BI_CONCEPTO_FACTURA cf on FC.bi_facturacion_concepto = cf.bi_conc_id
	group by ti.bi_tiempo_mes, ti.bi_tiempo_anio, cf.bi_conc_descripcion
GO

-- 10
CREATE VIEW TESLA.VW_FACTURACION_X_PROVINCIA AS
	SELECT 
	ti.bi_tiempo_cuatrimestre as Cuatrimestre,
	ti.bi_tiempo_anio as [Año],
	ub.bi_ubic_provincia as Provincia,
	FORMAT(SUM(FC.bi_facturacion_total), 'N2', 'es-ES') as [Total Facturado]
	FROM TESLA.BI_HECHO_FACTURACION FC
	join TESLA.BI_UBICACION ub on FC.bi_facturacion_ubicacion = ub.bi_ubic_id
	join TESLA.BI_TIEMPO ti on FC.bi_facturacion_tiempo = ti.bi_tiempo_id

	group by ti.bi_tiempo_cuatrimestre, ti.bi_tiempo_anio, ub.bi_ubic_provincia
GO
