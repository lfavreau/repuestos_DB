-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-09-18 14:10:00 CLST
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cliente (
    id_rut    INTEGER NOT NULL,
    nombre    VARCHAR2(50 BYTE) NOT NULL,
    apellido  VARCHAR2(50 BYTE) NOT NULL,
    domicilio VARCHAR2(100 BYTE),
    contacto  VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_rut );

CREATE TABLE det_orden (
    id_detalle           INTEGER NOT NULL,
    repuesto             VARCHAR2(50 BYTE) NOT NULL,
    costo                NUMBER(1),
    orden_id_orden       INTEGER,
    servicio_id_servicio INTEGER NOT NULL
);

ALTER TABLE det_orden ADD CONSTRAINT det_orden_pk PRIMARY KEY ( id_detalle );

CREATE TABLE det_repuesto (
    id_detalle_repuesto  INTEGER NOT NULL,
    det_orden_id_detalle INTEGER,
    repuesto_id_repuesto INTEGER
);

ALTER TABLE det_repuesto ADD CONSTRAINT det_repuesto_pk PRIMARY KEY ( id_detalle_repuesto );

CREATE TABLE estado (
    id_estado   VARCHAR2(30 BYTE) NOT NULL,
    descripcion CLOB
);

ALTER TABLE estado ADD CONSTRAINT estado_pk PRIMARY KEY ( id_estado );

CREATE TABLE historial (
    id_historial     INTEGER NOT NULL,
    fecha            DATE NOT NULL,
    orden_id_orden   INTEGER,
    estado_id_estado VARCHAR2(30 BYTE) NOT NULL
);

ALTER TABLE historial ADD CONSTRAINT historial_pk PRIMARY KEY ( id_historial );

CREATE TABLE orden (
    id_orden            INTEGER NOT NULL,
    fecha_creacion      DATE NOT NULL,
    tipo_servicio       VARCHAR2(50 BYTE) NOT NULL,
    cliente_id_rut      INTEGER,
    vehiculo_id_patente VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE orden ADD CONSTRAINT orden_pk PRIMARY KEY ( id_orden );

CREATE TABLE repuesto (
    id_repuesto         INTEGER NOT NULL,
    nombre              VARCHAR2(50 BYTE),
    precio              NUMBER(1) NOT NULL,
    id_detalle_repuesto INTEGER
);

ALTER TABLE repuesto ADD CONSTRAINT repuesto_pk PRIMARY KEY ( id_repuesto );

CREATE TABLE seguimiento (
    id_seguimiento INTEGER NOT NULL,
    estado         VARCHAR2(30 BYTE) NOT NULL,
    fecha          DATE NOT NULL,
    orden_id_orden INTEGER NOT NULL
);

ALTER TABLE seguimiento ADD CONSTRAINT seguimiento_pk PRIMARY KEY ( id_seguimiento );

CREATE TABLE servicio (
    id_servicio INTEGER NOT NULL,
    descripcion CLOB,
    costo       NUMBER(1) NOT NULL
);

ALTER TABLE servicio ADD CONSTRAINT servicio_pk PRIMARY KEY ( id_servicio );

CREATE TABLE validacion (
    id_validacion  INTEGER NOT NULL,
    costo_hombre   NUMBER(1) NOT NULL,
    repuestos      VARCHAR2(100 BYTE) NOT NULL,
    fecha_entrega  DATE,
    orden_id_orden INTEGER
);

ALTER TABLE validacion ADD CONSTRAINT validacion_pk PRIMARY KEY ( id_validacion );

CREATE TABLE vehiculo (
    id_patente     VARCHAR2(10 BYTE) NOT NULL,
    marca          VARCHAR2(50 BYTE) NOT NULL,
    modelo         VARCHAR2(50 BYTE) NOT NULL,
    anio           VARCHAR2(50 BYTE) NOT NULL,
    color          VARCHAR2(50 BYTE) NOT NULL,
    cliente_id_rut INTEGER NOT NULL
);

ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_pk PRIMARY KEY ( id_patente );

ALTER TABLE det_orden
    ADD CONSTRAINT det_orden_orden_fk FOREIGN KEY ( orden_id_orden )
        REFERENCES orden ( id_orden );

ALTER TABLE det_orden
    ADD CONSTRAINT det_orden_servicio_fk FOREIGN KEY ( servicio_id_servicio )
        REFERENCES servicio ( id_servicio );

ALTER TABLE det_repuesto
    ADD CONSTRAINT det_repuesto_det_orden_fk FOREIGN KEY ( det_orden_id_detalle )
        REFERENCES det_orden ( id_detalle );

ALTER TABLE det_repuesto
    ADD CONSTRAINT det_repuesto_repuesto_fk FOREIGN KEY ( repuesto_id_repuesto )
        REFERENCES repuesto ( id_repuesto );

ALTER TABLE historial
    ADD CONSTRAINT historial_estado_fk FOREIGN KEY ( estado_id_estado )
        REFERENCES estado ( id_estado );

ALTER TABLE historial
    ADD CONSTRAINT historial_orden_fk FOREIGN KEY ( orden_id_orden )
        REFERENCES orden ( id_orden );

ALTER TABLE orden
    ADD CONSTRAINT orden_cliente_fk FOREIGN KEY ( cliente_id_rut )
        REFERENCES cliente ( id_rut );

ALTER TABLE orden
    ADD CONSTRAINT orden_vehiculo_fk FOREIGN KEY ( vehiculo_id_patente )
        REFERENCES vehiculo ( id_patente );

ALTER TABLE seguimiento
    ADD CONSTRAINT seguimiento_orden_fk FOREIGN KEY ( orden_id_orden )
        REFERENCES orden ( id_orden );

ALTER TABLE validacion
    ADD CONSTRAINT validacion_orden_fk FOREIGN KEY ( orden_id_orden )
        REFERENCES orden ( id_orden );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_cliente_fk FOREIGN KEY ( cliente_id_rut )
        REFERENCES cliente ( id_rut );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             22
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
