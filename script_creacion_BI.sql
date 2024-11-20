USE [GD2C2024]
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(1)ELIMINACION OBJETOS PREVIOS----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- DROP TABLAS
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
  DROP FUNCTION TESLA.ID_TIEMPO;
GO

IF OBJECT_ID('TESLA.OBTENER_ID_UBICACION') IS NOT NULL
  DROP FUNCTION TESLA.ID_UBICACION;
GO

/*IF OBJECT_ID('TESLA.RANGO_EDAD') IS NOT NULL
  DROP FUNCTION TESLA.RANGO_EDAD;
GO


IF OBJECT_ID('TESLA.CUMPLIO_HORARIO') IS NOT NULL
  DROP FUNCTION TESLA.CUMPLIO_HORARIO;
GO

IF OBJECT_ID('TESLA.ID_CUOTA') IS NOT NULL
  DROP FUNCTION TESLA.ID_CUOTA;
GO
*/

--DROP PROCEDURES

IF OBJECT_ID('TESLA.bi_migrar_tiempo') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_tiempo;

IF OBJECT_ID('TESLA.bi_migrar_ubicacion') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_ubicacion;

IF OBJECT_ID('TESLA.bi_migrar_rango_etario') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_rango_etario;

IF OBJECT_ID('TESLA.bi_migrar_tipo_caja') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_tipo_caja;

IF OBJECT_ID('TESLA.bi_migrar_medio_de_pago') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_medio_de_pago;

IF OBJECT_ID('TESLA.bi_migrar_cuota') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_cuota;
  
IF OBJECT_ID('TESLA.bi_migrar_categoria') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_categoria;
 
IF OBJECT_ID('TESLA.bi_migrar_turno') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_turno;
GO

IF OBJECT_ID('TESLA.bi_migrar_venta_x_producto') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_venta_x_producto;
GO

IF OBJECT_ID('TESLA.bi_migrar_venta') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_venta;
GO

IF OBJECT_ID('TESLA.bi_migrar_pago') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_pago;
GO

IF OBJECT_ID('TESLA.bi_migrar_envio') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_envio;
GO

--DROP VIEWS
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

IF OBJECT_ID('TESLA.VW_PROMEDIO_IMPORTE_CUOTA') IS NOT NULL
  DROP VIEW TESLA.VW_PROMEDIO_IMPORTE_CUOTA;

IF OBJECT_ID('TESLA.VW_PORCENTAJE_DESCUENTO_APLICADO_X_MEDIO_PAGO') IS NOT NULL
  DROP VIEW TESLA.VW_PORCENTAJE_DESCUENTO_APLICADO_X_MEDIO_PAGO;
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
    bi_rango_horario_inicio DECIMAL(18,2),
	bi_rango_horario_final DECIMAL(18,2)
);



CREATE TABLE TESLA.BI_TIPO_MEDIO_DE_PAGO (
    bi_tipo_medio_pago_id DECIMAL(18, 0) PRIMARY KEY,
	bi_tipo_medio_pago_descripcion VARCHAR(255),
);

CREATE TABLE TESLA.BI_TIPO_ENVIO (
    bi_tipo_envio_id DECIMAL(18, 0) PRIMARY KEY,
	bi_tipo_envio_descripcion VARCHAR(255),
);

CREATE TABLE TESLA.BI_SUBRUBRO (
    bi_subr_id DECIMAL(18, 0) PRIMARY KEY,
	bi_subr_descripcion VARCHAR(255),
	bi_subr_rubro_descripcion VARCHAR(255)
);

CREATE TABLE TESLA.BI_MARCA (
    bi_marca_id DECIMAL(18, 0) PRIMARY KEY,
	bi_marca_descripcion VARCHAR(255)
);

CREATE TABLE TESLA.BI_CONCEPTO_FACTURA (
    bi_conc_id DECIMAL(18, 0) PRIMARY KEY,
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
    bi_pago_cuotas DECIMAL(18,0),
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

--Dado una hora de finalizacion y una fecha con hora de entrega estimada devuelve "CUMPLIO" o "NO CUMPLIO"
CREATE FUNCTION TESLA.CUMPLIO_HORARIO(@envi_hora_fin DECIMAL(18,0), @envi_fecha_y_hora_entrega DATETIME) RETURNS VARCHAR(255) AS
BEGIN
	DECLARE @hora_fin_programada DECIMAL(18,0);
	DECLARE @resultado VARCHAR(255); 
	SET @hora_fin_programada = DATEPART(HOUR,@envi_fecha_y_hora_entrega);

	IF @envi_hora_fin > @hora_fin_programada
		SET @resultado = 'NO CUMPLIO'
	ELSE
		SET @resultado = 'CUMPLIO'

	RETURN @resultado;
END
GO
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


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(4)STORED PROCEDURES--------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--DIMENSION TIEMPO
CREATE PROCEDURE TESLA.bi_migrar_tiempo AS
BEGIN
	INSERT INTO TESLA.BI_TIEMPO (bi_tiempo_anio,bi_tiempo_mes,bi_tiempo_cuatrimestre)
	SELECT DISTINCT
		YEAR(publi_fecha_inicio),
		MONTH(publi_fecha_inicio),
		TESLA.OBTENER_CUATRIMESTRE(MONTH(publi_fecha_inicio))
	FROM TESLA.PUBLICACION
	UNION ALL
	SELECT DISTINCT
		YEAR(publi_fecha_fin),
		MONTH(publi_fecha_fin),
		TESLA.OBTENER_CUATRIMESTRE(MONTH(publi_fecha_fin))
	FROM TESLA.PUBLICACION
	UNION ALL
	SELECT DISTINCT
		YEAR(vent_fecha),
		MONTH(vent_fecha),
		TESLA.OBTENER_CUATRIMESTRE(MONTH(vent_fecha))
	FROM TESLA.VENTA
	UNION ALL
	SELECT DISTINCT
		YEAR(env_fecha_programada),
		MONTH(env_fecha_programada),
		TESLA.OBTENER_CUATRIMESTRE(MONTH(env_fecha_programada))
	FROM TESLA.ENVIO
	UNION ALL
	SELECT DISTINCT
		YEAR(env_fecha_entrega),
		MONTH(env_fecha_entrega),
		TESLA.OBTENER_CUATRIMESTRE(MONTH(env_fecha_entrega))
	FROM TESLA.ENVIO
	UNION ALL
	SELECT DISTINCT
		YEAR(pago_fecha),
		MONTH(pago_fecha),
		TESLA.OBTENER_CUATRIMESTRE(MONTH(pago_fecha))
	FROM TESLA.PAGO
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
	LEFT JOIN TESLA.PROVINCIA
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
    INSERT INTO TESLA.BI_RANGO_HORARIO_VENTAS(bi_rango_horario_inicio, bi_rango_horario_final)
    VALUES ('00:00 - 06:00'),
           ('06:00 - 12:00'),
		   ('12:00 - 18:00'),
		   ('18:00 - 00:00')
	END
GO
--DIMENSION MEDIO_DE_PAGO 
-- TODO
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

EXEC TESLA.bi_migrar_sucursal;
EXEC TESLA.bi_migrar_tiempo;
EXEC TESLA.bi_migrar_ubicacion;
EXEC TESLA.bi_migrar_rango_etario;
EXEC TESLA.bi_migrar_tipo_caja;
EXEC TESLA.bi_migrar_medio_de_pago;
EXEC TESLA.bi_migrar_cuota;
EXEC TESLA.bi_migrar_categoria;
EXEC TESLA.bi_migrar_turno;
GO
-----------------------------------------------------------------

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
END
GO

SELECT * FROM TESLA.LOCALIDAD order by loc_nombre

--- MIGRAR VENTA
CREATE PROCEDURE TESLA.bi_migrar_venta AS
BEGIN
    INSERT INTO TESLA.BI_HECHO_VENTA(bi_venta_tiempo, bi_venta_ubicacion, bi_venta_subRubro, bi_venta_rango_horario, bi_venta_importe)
    SELECT 
        ,
        tick_sucursal,
        TESLA.RANGO_EDAD(clie_fecha_nacimiento),
        TESLA.ID_UBICACION(loca_nombre),
        SUM(CAST(envi_costo AS DECIMAL(18,2))),
        SUM(CASE WHEN TESLA.CUMPLIO_HORARIO(envi_hora_fin, envi_fecha_y_hora_entrega) = 'CUMPLIO' THEN 1 ELSE 0 END),
        SUM(CASE WHEN TESLA.CUMPLIO_HORARIO(envi_hora_fin, envi_fecha_y_hora_entrega) = 'NO CUMPLIO' THEN 1 ELSE 0 END)
    FROM TESLA.VENTA v
    JOIN TESLA.DETALLE_VENTA dv on v.vent_id = dv.det_vent_venta
	join PUBLICACION p on dv.det_vent_publicacion = p.publi_id

GO

--- MIGRAR ENVIO
CREATE PROCEDURE TESLA.bi_migrar_envio AS
BEGIN
    INSERT INTO TESLA.BI_ENVIO (    bi_envi_tiempo, bi_envi_sucursal, bi_envi_rango_etario_cl, bi_envi_ubicacion,
                                        bi_envi_costo, bi_envi_cumplidas, bi_envi_not_cumplidas)
    SELECT 
        TESLA.ID_TIEMPO(tick_fecha_y_hora),
        tick_sucursal,
        TESLA.RANGO_EDAD(clie_fecha_nacimiento),
        TESLA.ID_UBICACION(loca_nombre),
        SUM(CAST(envi_costo AS DECIMAL(18,2))),
        SUM(CASE WHEN TESLA.CUMPLIO_HORARIO(envi_hora_fin, envi_fecha_y_hora_entrega) = 'CUMPLIO' THEN 1 ELSE 0 END),
        SUM(CASE WHEN TESLA.CUMPLIO_HORARIO(envi_hora_fin, envi_fecha_y_hora_entrega) = 'NO CUMPLIO' THEN 1 ELSE 0 END)
    FROM TESLA.TICKET
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
END
GO

---- MIGRACION PAGO

CREATE PROCEDURE TESLA.bi_migrar_pago AS
BEGIN
    INSERT INTO TESLA.BI_HECHO_PAGO(bi_pago_tipo_medio_de_pago,
                                    bi_pago_tiempo,
                                    bi_pago_ubicacion,
                                    bi_pago_importe,
                                    bi_pago_cuotas
                                    )
    SELECT DISTINCT
        (SELECT bimp.bi_tipo_medio_pago_id FROM TESLA.BI_TIPO_MEDIO_DE_PAGO bimp
		where tmp.tipo_medio_de_pago_descripcion = bimp.bi_tipo_medio_pago_descripcion),
        TESLA.OBTENER_ID_TIEMPO(YEAR(p.pago_fecha), MONTH(p.pago_fecha)),
        TESLA.OBTENER_ID_UBICACION(l.loc_nombre, pv.prov_nombre)--,
        --SUM(tick_total_venta),
        --SUM(tick_total_descuento_medio_pago)

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


 SELECT DISTINCT
        (SELECT bimp.bi_tipo_medio_pago_id FROM TESLA.BI_TIPO_MEDIO_DE_PAGO bimp
		where tmp.tipo_medio_de_pago_descripcion = bimp.bi_tipo_medio_pago_descripcion),
        YEAR(p.pago_fecha), 
		MONTH(p.pago_fecha),
        l.loc_nombre, 
		pv.prov_nombre--,
        --SUM(tick_total_venta),
        --SUM(tick_total_descuento_medio_pago)

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

SELECT * FROM TESLA.LOCALIDAD ORDER BY loc_nombre
--PROCEDURE 
--DIMENSION VENTAXPRODUCTO

CREATE PROCEDURE TESLA.bi_migrar_venta_x_producto AS
BEGIN
    INSERT INTO TESLA.BI_VENTA_X_PRODUCTO(bi_veXpr_tiempo,bi_veXpr_categoria,bi_veXpr_turno,bi_veXpr_descuento_promocion)
    SELECT DISTINCT 
        TESLA.ID_TIEMPO(tick_fecha_y_hora),
        TESLA.OBTENER_CODIGO_CATEGORIA(subc_nombre),
        TESLA.OBTENER_CODIGO_TURNO(tick_fecha_y_hora),
        SUM(promo_descuento_aplicado)

    FROM TESLA.TICKET 
    LEFT JOIN TESLA.ITEM 
        ON tick_codiGO = item_nro_de_ticket 
    LEFT JOIN TESLA.PRODUCTO 
        ON item_prod_codiGO = prod_codiGO
    INNER JOIN TESLA.PROMOCION_ITEM 
        ON item_codiGO = promo_codiGO_item
	INNER JOIN TESLA.SUBCATEGORIA ON prod_subcategoria = subc_codiGO

    GROUP BY     TESLA.ID_TIEMPO(tick_fecha_y_hora),
                TESLA.OBTENER_CODIGO_CATEGORIA(subc_nombre),
                TESLA.OBTENER_CODIGO_TURNO(tick_fecha_y_hora)
END
GO




CREATE PROCEDURE TESLA.bi_migrar_venta AS
BEGIN
    insert into TESLA.BI_VENTA(bi_vent_ubicacion,bi_vent_tiempo,bi_vent_sucursal,bi_vent_turno,bi_vent_rango_etario_empl,bi_vent_tipo_caja,bi_vent_monto,bi_vent_cantidad,bi_vent_descuento_MP,bi_vent_descuento_promocion)
    SELECT distinct
        TESLA.ID_UBICACION(loca_nombre),
        TESLA.ID_TIEMPO(tick_fecha_y_hora),
        tick_sucursal,
        TESLA.OBTENER_CODIGO_TURNO(tick_fecha_y_hora),
        TESLA.RANGO_EDAD(empl_fecha_nacimiento),
        tipo_codigo,
        sum(tick_total_venta),
        COUNT(DISTINCT item_prod_codigo),
        SUM(tick_total_descuento_medio_paGO),
        SUM(tick_total_promociones)

    FROM TESLA.TICKET 
    Left join TESLA.EMPLEADO 
        on tick_empleado = empl_legajo
    Left join TESLA.CAJA  
        on caja_codigo = tick_caja
    Left join TESLA.TIPO_CAJA 
        on caja_tipo = tipo_codigo
    Left join TESLA.SUCURSAL 
        on sucu_numero = tick_sucursal
    Left join TESLA.LOCALIDAD 
        on sucu_localidad = loca_codigo
    Left Join TESLA.ITEM 
        on item_nro_de_ticket = tick_codigo

    group by    TESLA.ID_UBICACION(loca_nombre),
                TESLA.ID_TIEMPO(tick_fecha_y_hora),
                tick_sucursal,
                TESLA.RANGO_EDAD(empl_fecha_nacimiento),
                TESLA.OBTENER_CODIGO_TURNO(tick_fecha_y_hora), 
                tipo_codigo
END

GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(5)EXECUTE FACTS------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


EXEC TESLA.bi_migrar_envio;
EXEC TESLA.bi_migrar_pago;
EXEC TESLA.bi_migrar_venta_x_producto;
EXEC TESLA.bi_migrar_venta;

GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(6)VISTAS------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1

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

-- 9
CREATE VIEW TESLA.VW_LOCALIDADES_MAYOR_COSTO_ENVIO AS
	SELECT TOP 5
		bi_ubic_localidad,
		SUM(bi_envi_costo) as costo_envio
	
	FROM TESLA.BI_ENVIO 
	INNER JOIN TESLA.BI_UBICACION  
		ON bi_envi_ubicacion = bi_ubic_codigo
		
	GROUP BY bi_ubic_localidad, bi_envi_costo
	
	ORDER BY SUM(bi_envi_costo) DESC
GO

-- 10
CREATE VIEW TESLA.VW_SUCURSALES_MAYOR_IMPORTE_EN_CUOTAS AS
	SELECT TOP 3
		bi_pago_sucursal,
		bi_pago_medio_de_pago,
		bi_tiem_mes,
		bi_tiem_anio,
		( 	CASE WHEN bi_pago_cuota IS NOT NULL 
			THEN SUM(bi_pago_monto) 
			ELSE 0 END) as importe_pago
	
	FROM TESLA.BI_PAGO 
	INNER JOIN TESLA.BI_TIEMPO
		ON bi_pago_tiempo = bi_tiem_codigo
	
	GROUP BY bi_pago_sucursal, bi_pago_medio_de_pago, bi_tiem_mes, bi_tiem_anio, bi_pago_cuota
	
	ORDER BY SUM(bi_pago_monto) DESC
GO

-- 11
CREATE VIEW TESLA.VW_PROMEDIO_IMPORTE_CUOTA AS
	SELECT 
		bi_rang_nombre,
		bi_cuota_detalle as cant_cuotas,
		AVG(bi_pago_monto) as promedio_importe
	
	FROM TESLA.BI_PAGO
	INNER JOIN TESLA.BI_RANGO_ETARIO 
        ON bi_pago_rango_etareo_cl = bi_rang_codigo
	INNER JOIN TESLA.BI_CUOTA
		ON bi_cuota_codigo = bi_pago_cuota
	
	GROUP BY bi_rang_nombre, bi_cuota_detalle
GO

-- 12
CREATE VIEW TESLA.VW_PORCENTAJE_DESCUENTO_APLICADO_X_MEDIO_PAGO
AS
	SELECT
		bi_tiem_cuatrimestre,
		( (SUM(bi_pago_descuento_aplicado)) / (SUM(bi_pago_descuento_aplicado) + SUM(bi_pago_monto)) ) as [Porcentaje de descuento]
		
	FROM TESLA.BI_PAGO
	INNER JOIN TESLA.BI_TIEMPO
		ON bi_pago_tiempo = bi_tiem_codigo

	GROUP BY bi_tiem_cuatrimestre
GO