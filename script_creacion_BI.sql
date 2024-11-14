USE [GD2C2024]
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------(1)ELIMINACION OBJETOS PREVIOS----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---DROP FUNCIONES

IF OBJECT_ID('TESLA.OBTENER_CODIGO_CATEGORIA') IS NOT NULL
  DROP FUNCTION TESLA.OBTENER_CODIGO_CATEGORIA;
GO

IF OBJECT_ID('TESLA.OBTENER_CODIGO_TURNO') IS NOT NULL
  DROP FUNCTION TESLA.OBTENER_CODIGO_TURNO;
GO

IF OBJECT_ID('TESLA.OBTENER_CUATRIMESTRE') IS NOT NULL
  DROP FUNCTION TESLA.OBTENER_CUATRIMESTRE;
GO

IF OBJECT_ID('TESLA.ID_TIEMPO') IS NOT NULL
  DROP FUNCTION TESLA.ID_TIEMPO;
GO

IF OBJECT_ID('TESLA.RANGO_EDAD') IS NOT NULL
  DROP FUNCTION TESLA.RANGO_EDAD;
GO

IF OBJECT_ID('TESLA.ID_UBICACION') IS NOT NULL
  DROP FUNCTION TESLA.ID_UBICACION;
GO

IF OBJECT_ID('TESLA.CUMPLIO_HORARIO') IS NOT NULL
  DROP FUNCTION TESLA.CUMPLIO_HORARIO;
GO

IF OBJECT_ID('TESLA.ID_CUOTA') IS NOT NULL
  DROP FUNCTION TESLA.ID_CUOTA;
GO

IF OBJECT_ID('TESLA.OBTENER_CODIGO_TIEMPO') IS NOT NULL
  DROP FUNCTION TESLA.OBTENER_CODIGO_TIEMPO;
GO

--DROP PROCEDURES
IF OBJECT_ID('TESLA.bi_migrar_sucursal') IS NOT NULL
  DROP PROCEDURE TESLA.bi_migrar_sucursal;

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

-- DROP TABLAS
IF OBJECT_ID('TESLA.BI_PAGO ','U') IS NOT NULL
    DROP TABLE TESLA.BI_PAGO;

IF OBJECT_ID('TESLA.BI_ENVIO','U') IS NOT NULL
    DROP TABLE TESLA.BI_ENVIO;

IF OBJECT_ID('TESLA.BI_VENTA_X_PRODUCTO','U') IS NOT NULL
    DROP TABLE TESLA.BI_VENTA_X_PRODUCTO;

IF OBJECT_ID('TESLA.BI_VENTA','U') IS NOT NULL
    DROP TABLE TESLA.BI_VENTA;

IF OBJECT_ID('TESLA.BI_TURNO','U') IS NOT NULL
    DROP TABLE TESLA.BI_TURNO;

IF OBJECT_ID('TESLA.BI_CATEGORIA','U') IS NOT NULL
    DROP TABLE TESLA.BI_CATEGORIA;

IF OBJECT_ID('TESLA.BI_CUOTA','U') IS NOT NULL
    DROP TABLE TESLA.BI_CUOTA;

IF OBJECT_ID('TESLA.BI_MEDIO_DE_PAGO','U') IS NOT NULL
    DROP TABLE TESLA.BI_MEDIO_DE_PAGO;

IF OBJECT_ID('TESLA.BI_TIPO_CAJA','U') IS NOT NULL
    DROP TABLE TESLA.BI_TIPO_CAJA;

IF OBJECT_ID('TESLA.BI_RANGO_ETARIO','U') IS NOT NULL
    DROP TABLE TESLA.BI_RANGO_ETARIO;

IF OBJECT_ID('TESLA.BI_UBICACION','U') IS NOT NULL
    DROP TABLE TESLA.BI_UBICACION;

IF OBJECT_ID('TESLA.BI_TIEMPO','U') IS NOT NULL
    DROP TABLE TESLA.BI_TIEMPO;

IF OBJECT_ID('TESLA.BI_SUCURSAL','U') IS NOT NULL
    DROP TABLE TESLA.BI_SUCURSAL;
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


CREATE TABLE TESLA.BI_VENTA (
    bi_vent_codigo DECIMAL(18, 0) 			IDENTITY(1,1) PRIMARY KEY,
    bi_vent_ubicacion DECIMAL(18, 0),
    bi_vent_tiempo DECIMAL(18, 0),
    bi_vent_sucursal DECIMAL(18, 0),
    bi_vent_turno DECIMAL(18, 0),
    bi_vent_rango_etario_empl DECIMAL(18, 0),
    bi_vent_tipo_caja DECIMAL(18, 0),
    bi_vent_monto DECIMAL(18, 2),
    bi_vent_cantidad DECIMAL(18, 0),
    bi_vent_descuento_MP DECIMAL(18, 2),
    bi_vent_descuento_promocion DECIMAL(18, 2),
    FOREIGN KEY (bi_vent_ubicacion) 		REFERENCES TESLA.BI_UBICACION(bi_ubic_codigo),
    FOREIGN KEY (bi_vent_tiempo) 			REFERENCES TESLA.BI_TIEMPO(bi_tiem_codigo),
    FOREIGN KEY (bi_vent_sucursal) 			REFERENCES TESLA.BI_SUCURSAL(bi_sucu_numero),
    FOREIGN KEY (bi_vent_turno) 			REFERENCES TESLA.BI_TIPO_CAJA(bi_tipo_caja_codigo),
    FOREIGN KEY (bi_vent_rango_etario_empl) REFERENCES TESLA.BI_RANGO_ETARIO(bi_rang_codigo),
    FOREIGN KEY (bi_vent_tipo_caja) 		REFERENCES TESLA.BI_TIPO_CAJA(bi_tipo_caja_codigo)
);


CREATE TABLE TESLA.BI_VENTA_X_PRODUCTO (
    bi_veXpr_codigo DECIMAL(18, 0) 		IDENTITY(1,1) PRIMARY KEY,
    bi_veXpr_tiempo DECIMAL(18, 0),
    bi_veXpr_categoria DECIMAL(18, 0),
    bi_veXpr_descuento_promocion DECIMAL(18, 2),
	bi_veXpr_turno DECIMAL(18,0),
    FOREIGN KEY (bi_veXpr_tiempo) 		REFERENCES TESLA.BI_TIEMPO(bi_tiem_codigo),
    FOREIGN KEY (bi_veXpr_categoria) 	REFERENCES TESLA.BI_CATEGORIA(bi_cate_codigo),
	FOREIGN KEY (bi_veXpr_turno) 	REFERENCES TESLA.BI_TURNO(bi_turno_codigo)
);


CREATE TABLE TESLA.BI_ENVIO (
    bi_envi_codigo DECIMAL(18, 0) 			IDENTITY(1,1) PRIMARY KEY,
    bi_envi_tiempo DECIMAL(18, 0),
    bi_envi_sucursal DECIMAL(18, 0),
    bi_envi_rango_etario_cl DECIMAL(18, 0),
    bi_envi_ubicacion DECIMAL(18, 0),
    bi_envi_costo DECIMAL(18, 2),
    bi_envi_cumplidas DECIMAL(18,0),
	bi_envi_not_cumplidas DECIMAL(18,0),
    FOREIGN KEY (bi_envi_tiempo) 			REFERENCES TESLA.BI_TIEMPO(bi_tiem_codigo),
    FOREIGN KEY (bi_envi_sucursal) 			REFERENCES TESLA.BI_SUCURSAL(bi_sucu_numero),
    FOREIGN KEY (bi_envi_rango_etario_cl) 	REFERENCES TESLA.BI_RANGO_ETARIO(bi_rang_codigo),
    FOREIGN KEY (bi_envi_ubicacion) 		REFERENCES TESLA.BI_UBICACION(bi_ubic_codigo)
);


CREATE TABLE TESLA.BI_PAGO (
    bi_pago_codigo DECIMAL(18,0) 			IDENTITY(1,1) PRIMARY KEY,
    bi_pago_sucursal DECIMAL(18,0),
    bi_pago_medio_de_pago DECIMAL(18,0),
    bi_pago_tiempo DECIMAL(18,0),
    bi_pago_rango_etareo_cl DECIMAL(18,0),
    bi_pago_monto DECIMAL(18,0),
    bi_pago_cuota DECIMAL(18,0),
    bi_pago_descuento_aplicado DECIMAL(18,2),
    FOREIGN KEY (bi_pago_sucursal) 			REFERENCES TESLA.BI_SUCURSAL(bi_sucu_numero),
    FOREIGN KEY (bi_pago_rango_etareo_cl) 	REFERENCES TESLA.BI_RANGO_ETARIO(bi_rang_codigo),
    FOREIGN KEY (bi_pago_cuota) 			REFERENCES TESLA.BI_CUOTA(bi_cuota_codigo),
    FOREIGN KEY (bi_pago_medio_de_pago) 	REFERENCES TESLA.BI_MEDIO_DE_PAGO(bi_medi_codigo),
    FOREIGN KEY (bi_pago_tiempo) 			REFERENCES TESLA.BI_TIEMPO(bi_tiem_codigo)
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
CREATE FUNCTION TESLA.ID_UBICACION(@localidad VARCHAR(255)) RETURNS DECIMAL(18,0) AS
BEGIN
	DECLARE @id_ubicacion DECIMAL(18,0);

	SELECT @id_ubicacion = bi_ubic_codigo
	FROM TESLA.BI_UBICACION
	WHERE bi_ubic_localidad = @localidad

	RETURN @id_ubicacion
END
GO
--Dado una fecha devuelve un id_tiempo
create FUNCTION TESLA.ID_TIEMPO(@fecha DATETIME) RETURNS DECIMAL(18,0) AS
BEGIN
    DECLARE @anio DECIMAL(4,0),
            @mes DECIMAL(2,0),
            @id_tiempo DECIMAL(18,0)

    SET @anio  = DATEPART(yyyy, @fecha)
    SET @mes  = DATEPART(mm, @fecha)

    SELECT @id_tiempo = bi_tiem_codigo
    FROM TESLA.BI_TIEMPO
    WHERE TESLA.BI_TIEMPO.bi_tiem_anio = @anio
    AND TESLA.BI_TIEMPO.bi_tiem_mes = @mes

    RETURN @id_tiempo
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
		SELECT @id_rango_edad = bi_rang_codigo 
		FROM TESLA.BI_RANGO_ETARIO 
		WHERE bi_rang_nombre = '< 25'
		
	ELSE IF @EDAD BETWEEN 25 AND 35
		SELECT @id_rango_edad = bi_rang_codigo 
		FROM TESLA.BI_RANGO_ETARIO 
		WHERE bi_rang_nombre = '25 - 35'
	
	ELSE IF @EDAD BETWEEN 35 AND 50
		SELECT @id_rango_edad = bi_rang_codigo 
		FROM TESLA.BI_RANGO_ETARIO 
		WHERE bi_rang_nombre = '35 - 50'
		
	ELSE
		SELECT @id_rango_edad = bi_rang_codigo 
		FROM TESLA.BI_RANGO_ETARIO
		WHERE bi_rang_nombre = '> 50'


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

--DIMENSION SUCURSAL
CREATE PROCEDURE TESLA.bi_migrar_sucursal AS
BEGIN
	INSERT INTO TESLA.BI_SUCURSAL (bi_sucu_numero, bi_sucu_nombre)
	SELECT DISTINCT
		sucu_numero,
		sucu_nombre
	FROM TESLA.SUCURSAL
END
GO

--DIMENSION TIEMPO
CREATE PROCEDURE TESLA.bi_migrar_tiempo AS
BEGIN
	INSERT INTO TESLA.BI_TIEMPO (bi_tiem_anio,bi_tiem_mes,bi_tiem_cuatrimestre)
	SELECT DISTINCT
		YEAR(tick_fecha_y_hora),
		MONTH(tick_fecha_y_hora),
		TESLA.OBTENER_CUATRIMESTRE(MONTH(tick_fecha_y_hora))
	FROM TESLA.TICKET
END
GO

--DIMENSION UBICACION
CREATE PROCEDURE TESLA.bi_migrar_ubicacion AS
BEGIN
	INSERT INTO TESLA.BI_UBICACION (bi_ubic_provincia,bi_ubic_localidad)
	SELECT DISTINCT
		prov_nombre,
		loca_nombre
	FROM TESLA.LOCALIDAD
	LEFT JOIN TESLA.PROVINCIA
		ON prov_codigo = loca_provincia
END
GO

--DIMENSION RANGO_ETARIO
CREATE PROCEDURE TESLA.bi_migrar_rango_etario AS
BEGIN
	INSERT INTO TESLA.BI_RANGO_ETARIO (bi_rang_nombre)
	VALUES	('< 25'),
			('25 - 35'),
            ('35 - 50'),
			('> 50')
END
GO

--DIMENSION TIPO_CAJA
CREATE PROCEDURE TESLA.bi_migrar_tipo_caja AS
BEGIN
	INSERT INTO TESLA.BI_TIPO_CAJA (bi_tipo_caja_codigo,bi_tipo_caja_nombre)
	SELECT DISTINCT
		tipo_codigo,
		tipo_nombre
	FROM TESLA.TIPO_CAJA
END
GO

--DIMENSION MEDIO_DE_PAGO
CREATE PROCEDURE TESLA.bi_migrar_medio_de_pago AS
BEGIN
	INSERT INTO TESLA.BI_MEDIO_DE_PAGO (bi_medi_codigo,bi_medi_tipo_descripcion,bi_medi_descripcion)
	SELECT DISTINCT
		medi_codigo,
		tipo_medio_descripcion,
		medi_descripcion
	FROM TESLA.MEDIO_DE_PAGO
	LEFT JOIN TIPO_MEDIO_DE_PAGO
		ON tipo_medio_codigo = medi_codigo
END
GO

--DIMENSION TURNO
CREATE PROCEDURE TESLA.bi_migrar_turno AS
BEGIN
    INSERT INTO TESLA.BI_TURNO (bi_turno_rango)
    VALUES ('08:00 - 12:00'),
           ('12:00 - 16:00'),
           ('16:00 - 20:00')
END
GO

--DIMENSION CATEGORIA
CREATE PROCEDURE TESLA.bi_migrar_categoria AS
BEGIN
    INSERT INTO TESLA.BI_CATEGORIA (bi_cate_detalle)
    SELECT DISTINCT 
        cate_detalle 
    FROM TESLA.CATEGORIA
    UNION ALL
    SELECT DISTINCT 
        subc_nombre 
    FROM TESLA.SUBCATEGORIA
END
GO

--DIMENSION CUOTA
CREATE PROCEDURE TESLA.bi_migrar_cuota AS
BEGIN
    INSERT INTO TESLA.BI_CUOTA (bi_cuota_detalle)
    SELECT DISTINCT 
        ISNULL(deta_cuotas,0)
    FROM TESLA.DETALLE_PAGO

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
    INSERT INTO TESLA.BI_PAGO (bi_pago_sucursal,
                                    bi_pago_medio_de_pago,
                                    bi_pago_tiempo,
                                    bi_pago_rango_etareo_cl,
                                    bi_pago_cuota,
                                    bi_pago_monto,
                                    bi_pago_descuento_aplicado)
    SELECT DISTINCT
        tick_sucursal,
        medi_codigo,
        TESLA.ID_TIEMPO(tick_fecha_y_hora),
        TESLA.RANGO_EDAD(clie_fecha_nacimiento),
        TESLA.ID_CUOTA(deta_cuotas),
        SUM(tick_total_venta),
        SUM(tick_total_descuento_medio_pago)

        from TESLA.TICKET
        INNER JOIN TESLA.CLIENTE
            ON clie_codigo = tick_cliente
        INNER JOIN TESLA.DETALLE_PAGO
            ON deta_cliente = clie_codigo
        INNER JOIN TESLA.PAGO
            ON pago_detalle = deta_codigo
        INNER JOIN TESLA.MEDIO_DE_PAGO
            ON medi_codigo = pago_medio_pago


        GROUP BY     tick_sucursal,
                     medi_codigo,
                    TESLA.ID_TIEMPO(tick_fecha_y_hora),
                    TESLA.RANGO_EDAD(clie_fecha_nacimiento),
                    TESLA.ID_CUOTA(deta_cuotas)

END
GO

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
        bi_tiem_anio AS Año,
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
		bi_tiem_anio AS Año,
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
        bi_tiem_anio AS 'Año',
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
        bi_tiem_anio 'Año'

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