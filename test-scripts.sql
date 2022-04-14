-- Recuperar todos los formatos de un cliente (ENTRADA: CLAVE DEL CLIENTE
SELECT FC.CVE_FORMATO_CLIENTE, F.NOMBRE, F.DESCRIPCION, EF.DESCRIPCION AS ESTATUS_FORMATO 
FROM formato_cliente FC
INNER JOIN FORMATO F
ON FC.CVE_FORMATO = F.CVE_FORMATO
INNER JOIN CAT_ESTATUS_FORMATO EF
ON FC.CVE_ESTATUS_FORMATO = EF.CVE_ESTATUS_FORMATO
INNER JOIN APP_CLIENTE CT
ON FC.CVE_CLIENTE = CT.CVE_CLIENTE
WHERE FC.CVE_CLIENTE ='CT1';

-- Recuperar todos los campos de UN formato de un cliente (ENTRADA: CLAVE DEL FORMATO CON SUS CAMPOS)
-- SELECT F.NOMBRE AS NOMBRE_FORMATO, C.NOMBRE AS NOMBRE_CAMPO,C.TIPO_DATO,FC.VALOR 
SELECT C.CVE_CAT_CAMPO, C.NOMBRE AS NOMBRE_CAMPO,C.TIPO_DATO,FC.VALOR 
FROM formato_campo FC
INNER JOIN formato_cliente FCLIENTE
ON FC.CVE_FORMATO_CLIENTE = FCLIENTE.CVE_FORMATO_CLIENTE
INNER JOIN FORMATO F
ON FCLIENTE.CVE_FORMATO = F.CVE_FORMATO
INNER JOIN cat_campo C
ON FC.CVE_CAMPO = C.CVE_CAT_CAMPO
WHERE FC.CVE_FORMATO_CLIENTE ='FC1';