
-- Host: localhost    Database: formatos_db
-- ------------------------------------------------------

DROP TABLE IF EXISTS `app_cliente`;
CREATE TABLE `app_cliente` (
  `cve_cliente` varchar(20) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cve_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `app_cliente` VALUES ('CT1','JORGE'),('CT2','CARLOS'),('CT3','GONZ');

--
-- Table structure for table `cat_campo`
--
DROP TABLE IF EXISTS `cat_campo`;
CREATE TABLE `cat_campo` (
  `cve_cat_campo` varchar(20) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `tipo_dato` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cve_cat_campo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `cat_campo` VALUES ('C1','NUMERO_POLIZA','STRING'),('C2','AFECTADO_MISMO_TITULAR','BOOLEAN'),('C3','CERTIFICADO_ASEGURADO_AFECTADO','STRING'),('C4','AFECTADO_MISMO_CONTRATANTE','BOOLEAN'),('C5','NOMBRE_ASEGURADO','STRING');

--
-- Table structure for table `cat_estatus_formato`
--
DROP TABLE IF EXISTS `cat_estatus_formato`;
CREATE TABLE `cat_estatus_formato` (
  `CVE_ESTATUS_FORMATO` varchar(20) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CVE_ESTATUS_FORMATO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `cat_estatus_formato` VALUES ('EF1','Sin firma'),('EF2','Generado y firmado'),('EF3','Capturado incompleto');

--
-- Table structure for table `formato`
--
DROP TABLE IF EXISTS `formato`;
CREATE TABLE `formato` (
  `cve_formato` varchar(20) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cve_formato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `formato` VALUES ('F1','Reembolso de accidentes y/o enfermedad',NULL),('F2','Formato Unico de informacion bancaria',NULL),('F3','Aviso de accidente o enfermedad',NULL),('F4','Informe medico',NULL);

--
-- Table structure for table `formato_campo`
--
DROP TABLE IF EXISTS `formato_campo`;
CREATE TABLE `formato_campo` (
  `cve_formato_campo` varchar(20) NOT NULL,
  `cve_formato_cliente` varchar(20) DEFAULT NULL,
  `cve_campo` varchar(20) DEFAULT NULL,
  `valor` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`cve_formato_campo`),
  KEY `fk_campo_idx` (`cve_campo`),
  KEY `fk_formato_campo_formato_idx` (`cve_formato_cliente`),
  CONSTRAINT `fk_formato_campo_campo` FOREIGN KEY (`cve_campo`) REFERENCES `cat_campo` (`cve_cat_campo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_formato_campo_formato_cliente` FOREIGN KEY (`cve_formato_cliente`) REFERENCES `formato_cliente` (`cve_formato_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `formato_campo` VALUES ('FFC1','FC1','C1','54352334'),('FFC2','FC1','C2','0'),('FFC3','FC2','C4','1'),('FFC4','FC4','C3','45633254732');


DROP TABLE IF EXISTS `formato_cliente`;
CREATE TABLE `formato_cliente` (
  `cve_formato_cliente` varchar(20) NOT NULL,
  `cve_formato` varchar(20) DEFAULT NULL,
  `cve_cliente` varchar(20) DEFAULT NULL,
  `cve_estatus_formato` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cve_formato_cliente`),
  KEY `fk_formato_idx` (`cve_formato`),
  KEY `fk_cliente_idx` (`cve_cliente`),
  KEY `fk_estatus_formato_idx` (`cve_estatus_formato`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`cve_cliente`) REFERENCES `app_cliente` (`cve_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estatus_formato` FOREIGN KEY (`cve_estatus_formato`) REFERENCES `cat_estatus_formato` (`CVE_ESTATUS_FORMATO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_formato` FOREIGN KEY (`cve_formato`) REFERENCES `formato` (`cve_formato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `formato_cliente` VALUES ('FC1','F1','CT1','EF1'),('FC2','F2','CT1','EF3'),('FC3','F1','CT1','EF2'),('FC4','F1','CT2','EF1'),('FC5','F2','CT2','EF2'),('FC6','F3','CT2','EF3');
