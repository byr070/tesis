-- MySQL dump 10.13  Distrib 5.6.16, for Linux (i686)
--
-- Host: localhost    Database: tesis
-- ------------------------------------------------------
-- Server version	5.6.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Alimentacion`
--

DROP TABLE IF EXISTS `Alimentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alimentacion` (
  `aliId` int(11) NOT NULL,
  `aliNombre` varchar(15) NOT NULL,
  `aliHoraInicio` time NOT NULL,
  `alHoraFin` time NOT NULL,
  `Organizacion_orgId` int(11) NOT NULL,
  PRIMARY KEY (`aliId`),
  KEY `Alimentacion_Organizacion` (`Organizacion_orgId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alimentacion`
--

LOCK TABLES `Alimentacion` WRITE;
/*!40000 ALTER TABLE `Alimentacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Alimentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feriado`
--

DROP TABLE IF EXISTS `Feriado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Feriado` (
  `ferId` int(11) NOT NULL,
  `ferNombre` int(11) NOT NULL,
  `ferDia` int(11) NOT NULL,
  PRIMARY KEY (`ferId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feriado`
--

LOCK TABLES `Feriado` WRITE;
/*!40000 ALTER TABLE `Feriado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Feriado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Objetos`
--

DROP TABLE IF EXISTS `Objetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Objetos` (
  `obj_id` int(11) NOT NULL AUTO_INCREMENT,
  `obj_nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`obj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Objetos`
--

LOCK TABLES `Objetos` WRITE;
/*!40000 ALTER TABLE `Objetos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Objetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Permisos`
--

DROP TABLE IF EXISTS `Permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Permisos` (
  `rol_id` int(11) NOT NULL,
  `obj_id` int(11) NOT NULL,
  `perm_ver` tinyint(1) NOT NULL,
  PRIMARY KEY (`rol_id`,`obj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Permisos`
--

LOCK TABLES `Permisos` WRITE;
/*!40000 ALTER TABLE `Permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autologin_usuario`
--

DROP TABLE IF EXISTS `autologin_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autologin_usuario` (
  `key_id` char(32) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) NOT NULL,
  `last_ip` varchar(40) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`key_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autologin_usuario`
--

LOCK TABLES `autologin_usuario` WRITE;
/*!40000 ALTER TABLE `autologin_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `autologin_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canton`
--

DROP TABLE IF EXISTS `canton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canton` (
  `cnt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cnt_nombre` varchar(60) NOT NULL,
  `prv_id` int(11) NOT NULL,
  PRIMARY KEY (`cnt_id`),
  UNIQUE KEY `fk_canton_provincia` (`prv_id`),
  CONSTRAINT `fk_canton_provincia` FOREIGN KEY (`prv_id`) REFERENCES `provincia` (`prv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canton`
--

LOCK TABLES `canton` WRITE;
/*!40000 ALTER TABLE `canton` DISABLE KEYS */;
/*!40000 ALTER TABLE `canton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `crg_id` int(11) NOT NULL AUTO_INCREMENT,
  `crg_nombre` varchar(30) NOT NULL,
  `sal_id` int(11) NOT NULL,
  PRIMARY KEY (`crg_id`),
  KEY `fk_cargo_salario` (`sal_id`),
  CONSTRAINT `fk_cargo_salario` FOREIGN KEY (`sal_id`) REFERENCES `salario` (`sal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('0eec0ae0d095e376755d6b30180fe453','93.115.89.126','Mozilla/5.0 (Windows; U; Windows NT 6.1; de-DE) AppleWebKit/533.21.1 (KHTML, like Gecko) Version/5.0.5 Safari/533.21.1',1410371374,'');
INSERT INTO `ci_sessions` VALUES ('34fdea2a517b74d3f17771f1c762ec71','173.252.120.119','facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)',1410370583,'');
INSERT INTO `ci_sessions` VALUES ('9f4affa3f433111ae289ade9dfb32e4b','201.183.168.244','Mozilla/5.0 (Linux; U; Android 2.3.6; en-us; GT-S5830i Build/GINGERBREAD) AppleWebKit/533.1 (KHTML, like Gecko) Version/',1410371704,'a:4:{s:9:\"user_data\";s:0:\"\";s:6:\"usu_id\";s:1:\"1\";s:9:\"usu_email\";s:5:\"admin\";s:10:\"usu_status\";s:1:\"1\";}');
INSERT INTO `ci_sessions` VALUES ('a6d8f69c760937ac0520e598ce03922d','127.0.0.1','Mozilla/5.0 (X11; Linux i686; rv:27.0) Gecko/20100101 Firefox/27.0',1410373481,'a:3:{s:6:\"usu_id\";s:1:\"1\";s:9:\"usu_email\";s:5:\"admin\";s:10:\"usu_status\";s:1:\"1\";}');
INSERT INTO `ci_sessions` VALUES ('da5b2b26ae8d86e155d37ad500c440c9','69.171.248.7','facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)',1410370586,'');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_hor`
--

DROP TABLE IF EXISTS `emp_hor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_hor` (
  `Empleado_emp_id` int(11) NOT NULL,
  `Horario_hor_id` int(11) NOT NULL,
  PRIMARY KEY (`Empleado_emp_id`,`Horario_hor_id`),
  KEY `EmpHor_Horario` (`Horario_hor_id`),
  CONSTRAINT `fk_emp_hor_empleado` FOREIGN KEY (`Empleado_emp_id`) REFERENCES `empleado` (`emp_id`),
  CONSTRAINT `fk_emp_hor_horario` FOREIGN KEY (`Horario_hor_id`) REFERENCES `horario_trabajo` (`hor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_hor`
--

LOCK TABLES `emp_hor` WRITE;
/*!40000 ALTER TABLE `emp_hor` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_hor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_nombre_completo` varchar(20) NOT NULL,
  `emp_numero_cedula` varchar(30) NOT NULL,
  `emp_fecha_nacimiento` date DEFAULT '0000-00-00',
  `emp_lugar_nacimiento` int(11) NOT NULL,
  `emp_provincia_residencia` int(11) NOT NULL,
  `Organizacion_org_id` int(11) NOT NULL DEFAULT '1',
  `Cargo_crg_id` int(11) DEFAULT NULL,
  `Jornada_jor_id` int(11) DEFAULT NULL,
  `Tipo_tip_id` int(11) DEFAULT NULL,
  `Tarjeta_tar_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `Empleado_Cargo` (`Cargo_crg_id`),
  KEY `Empleado_Jornada` (`Jornada_jor_id`),
  KEY `Empleado_Organización` (`Organizacion_org_id`),
  KEY `Empleado_Tarjeta` (`Tarjeta_tar_id`),
  KEY `Empleado_Tipo` (`Tipo_tip_id`),
  KEY `fk_empleado_parroquia` (`emp_lugar_nacimiento`),
  KEY `fk_empleado_provincia` (`emp_provincia_residencia`),
  CONSTRAINT `fk_empleado_cargo` FOREIGN KEY (`Cargo_crg_id`) REFERENCES `cargo` (`crg_id`),
  CONSTRAINT `fk_empleado_jornada` FOREIGN KEY (`Jornada_jor_id`) REFERENCES `jornada` (`jor_id`),
  CONSTRAINT `fk_empleado_organizacion` FOREIGN KEY (`Organizacion_org_id`) REFERENCES `organizacion` (`org_id`),
  CONSTRAINT `fk_empleado_tarjeta` FOREIGN KEY (`Tarjeta_tar_id`) REFERENCES `tarjeta` (`tar_id`),
  CONSTRAINT `fk_empleado_tipo` FOREIGN KEY (`Tipo_tip_id`) REFERENCES `tipo` (`tip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'xx yy','1','0000-00-00',0,0,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario_trabajo`
--

DROP TABLE IF EXISTS `horario_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario_trabajo` (
  `hor_id` int(11) NOT NULL AUTO_INCREMENT,
  `hor_hora_inicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hor_hora_fin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`hor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_trabajo`
--

LOCK TABLES `horario_trabajo` WRITE;
/*!40000 ALTER TABLE `horario_trabajo` DISABLE KEYS */;
INSERT INTO `horario_trabajo` VALUES (1,'2014-09-09 07:00:00','2014-09-09 17:00:00');
/*!40000 ALTER TABLE `horario_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intentos_login`
--

DROP TABLE IF EXISTS `intentos_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intentos_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(40) NOT NULL,
  `login` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intentos_login`
--

LOCK TABLES `intentos_login` WRITE;
/*!40000 ALTER TABLE `intentos_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `intentos_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jornada`
--

DROP TABLE IF EXISTS `jornada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jornada` (
  `jor_id` int(11) NOT NULL AUTO_INCREMENT,
  `jor_dias_trabajo` int(11) NOT NULL,
  `jor_dias_descanso` int(11) NOT NULL,
  PRIMARY KEY (`jor_id`),
  UNIQUE KEY `Jornada_ak_1` (`jor_dias_trabajo`,`jor_dias_descanso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jornada`
--

LOCK TABLES `jornada` WRITE;
/*!40000 ALTER TABLE `jornada` DISABLE KEYS */;
/*!40000 ALTER TABLE `jornada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizacion`
--

DROP TABLE IF EXISTS `organizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizacion` (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_nombre` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizacion`
--

LOCK TABLES `organizacion` WRITE;
/*!40000 ALTER TABLE `organizacion` DISABLE KEYS */;
INSERT INTO `organizacion` VALUES (1,'XYZ');
/*!40000 ALTER TABLE `organizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parroquia`
--

DROP TABLE IF EXISTS `parroquia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parroquia` (
  `parr_id` int(11) NOT NULL AUTO_INCREMENT,
  `parr_nombre` varchar(60) NOT NULL,
  `cnt_id` int(11) NOT NULL,
  PRIMARY KEY (`parr_id`),
  UNIQUE KEY `fk_parroquia_canton` (`cnt_id`),
  CONSTRAINT `fk_parroquia_canton` FOREIGN KEY (`cnt_id`) REFERENCES `canton` (`cnt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parroquia`
--

LOCK TABLES `parroquia` WRITE;
/*!40000 ALTER TABLE `parroquia` DISABLE KEYS */;
/*!40000 ALTER TABLE `parroquia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo_salida`
--

DROP TABLE IF EXISTS `periodo_salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodo_salida` (
  `sld_id` int(11) NOT NULL AUTO_INCREMENT,
  `sld_inicio` datetime NOT NULL,
  `sld_fin` datetime NOT NULL,
  `sld_estado` varchar(20) NOT NULL,
  `Empleado_emp_id` int(11) DEFAULT NULL,
  `Tipo_salida_tip_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sld_id`),
  UNIQUE KEY `fk_salida_tipo` (`Tipo_salida_tip_id`),
  KEY `fk_salida_empleado` (`Empleado_emp_id`),
  CONSTRAINT `fk_periodo_salida_tipo` FOREIGN KEY (`Tipo_salida_tip_id`) REFERENCES `tipo_salida` (`tip_id`),
  CONSTRAINT `fk_periodo_salida_empleado` FOREIGN KEY (`Empleado_emp_id`) REFERENCES `empleado` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo_salida`
--

LOCK TABLES `periodo_salida` WRITE;
/*!40000 ALTER TABLE `periodo_salida` DISABLE KEYS */;
INSERT INTO `periodo_salida` VALUES (1,'2014-09-11 07:00:00','2014-09-11 11:00:00','',1,NULL);
/*!40000 ALTER TABLE `periodo_salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_emp`
--

DROP TABLE IF EXISTS `pro_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_emp` (
  `Proyecto_pro_id` int(11) NOT NULL,
  `Empleado_emp_id` int(11) NOT NULL,
  PRIMARY KEY (`Proyecto_pro_id`,`Empleado_emp_id`),
  KEY `ProEmp_Empleado` (`Empleado_emp_id`),
  CONSTRAINT `fk_pro_emp_empleado` FOREIGN KEY (`Empleado_emp_id`) REFERENCES `empleado` (`emp_id`),
  CONSTRAINT `fk_pro_emp_proyecto` FOREIGN KEY (`Proyecto_pro_id`) REFERENCES `proyecto` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_emp`
--

LOCK TABLES `pro_emp` WRITE;
/*!40000 ALTER TABLE `pro_emp` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincia` (
  `prv_id` int(11) NOT NULL AUTO_INCREMENT,
  `prv_nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`prv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `rol_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(20) NOT NULL,
  `usu_id` int(11) NOT NULL,
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salario`
--

DROP TABLE IF EXISTS `salario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salario` (
  `sal_id` int(11) NOT NULL,
  `sal_valor` int(11) NOT NULL,
  PRIMARY KEY (`sal_id`),
  KEY `Salario_Empleado` (`sal_valor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salario`
--

LOCK TABLES `salario` WRITE;
/*!40000 ALTER TABLE `salario` DISABLE KEYS */;
/*!40000 ALTER TABLE `salario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salida_anual`
--

DROP TABLE IF EXISTS `salida_anual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salida_anual` (
  `Empleado_emp_id` int(11) NOT NULL,
  `Tipo_salida_tip_id` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  PRIMARY KEY (`Empleado_emp_id`,`Tipo_salida_tip_id`,`anio`),
  KEY `Salida_TipoSalida` (`Tipo_salida_tip_id`),
  CONSTRAINT `fk_salida_empleado` FOREIGN KEY (`Empleado_emp_id`) REFERENCES `empleado` (`emp_id`),
  CONSTRAINT `fk_salida_tipo` FOREIGN KEY (`Tipo_salida_tip_id`) REFERENCES `tipo_salida` (`tip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida_anual`
--

LOCK TABLES `salida_anual` WRITE;
/*!40000 ALTER TABLE `salida_anual` DISABLE KEYS */;
/*!40000 ALTER TABLE `salida_anual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarjeta` (
  `tar_id` int(11) NOT NULL,
  `tar_valor` char(32) NOT NULL,
  PRIMARY KEY (`tar_id`),
  UNIQUE KEY `Tarjeta_ak_1` (`tar_valor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefono` (
  `tlf_id` int(11) NOT NULL AUTO_INCREMENT,
  `tlf_numero` varchar(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  PRIMARY KEY (`tlf_id`),
  KEY `fk_telefono_empleado` (`emp_id`),
  CONSTRAINT `fk_telefono_empleado` FOREIGN KEY (`emp_id`) REFERENCES `empleado` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `tip_id` int(11) NOT NULL AUTO_INCREMENT,
  `tip_nombre` varchar(10) NOT NULL,
  PRIMARY KEY (`tip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_salida`
--

DROP TABLE IF EXISTS `tipo_salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_salida` (
  `tip_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`tip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_salida`
--

LOCK TABLES `tipo_salida` WRITE;
/*!40000 ALTER TABLE `tipo_salida` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `usu_id` int(11) NOT NULL AUTO_INCREMENT,
  `usu_email` varchar(100) NOT NULL,
  `usu_clave` varchar(255) NOT NULL,
  `usu_activado` tinyint(1) NOT NULL DEFAULT '1',
  `usu_bloqueado` tinyint(1) NOT NULL DEFAULT '0',
  `usu_razon_bloqueo` varchar(255) DEFAULT NULL,
  `usu_nueva_clave_key` varchar(50) DEFAULT NULL,
  `usu_nueva_clave_peticion` datetime DEFAULT NULL,
  `usu_nuevo_email` varchar(100) DEFAULT NULL,
  `usu_nuevo_email_key` varchar(50) DEFAULT NULL,
  `usu_ultima_ip` varchar(40) NOT NULL,
  `usu_ultimo_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `usu_creado` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `usu_modificado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`usu_id`),
  UNIQUE KEY `usu_usuario` (`usu_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','$2a$08$eVXzluuYrIvVkKUObQR1C.8VXiKm/1L/FboCsnK.P9pJLPWSDEjiS',1,0,NULL,NULL,NULL,NULL,NULL,'201.183.168.244','2014-09-10 19:55:27','2014-08-19 17:05:26','2014-09-10 17:55:27');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-10 18:33:35
