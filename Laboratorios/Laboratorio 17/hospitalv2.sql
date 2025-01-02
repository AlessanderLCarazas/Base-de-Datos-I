-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: hospitalv2
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `atencion`
--

DROP TABLE IF EXISTS `atencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atencion` (
  `id` int NOT NULL,
  `dia` int DEFAULT NULL,
  `mes` varchar(10) DEFAULT NULL,
  `año` year DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atencion`
--

LOCK TABLES `atencion` WRITE;
/*!40000 ALTER TABLE `atencion` DISABLE KEYS */;
/*!40000 ALTER TABLE `atencion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cama`
--

DROP TABLE IF EXISTS `cama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cama` (
  `Codigo` int NOT NULL,
  `material` varchar(30) DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  `codigo_paciente` int DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `codigo_paciente` (`codigo_paciente`),
  CONSTRAINT `cama_ibfk_1` FOREIGN KEY (`codigo_paciente`) REFERENCES `paciente` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cama`
--

LOCK TABLES `cama` WRITE;
/*!40000 ALTER TABLE `cama` DISABLE KEYS */;
INSERT INTO `cama` VALUES (910,'Algodón','2000-12-15',75125898),(911,'Seda','1998-10-08',52142532),(912,'Satén','2001-01-03',21543598),(913,'Algodón','2002-05-18',32456878),(914,'Tencel','2000-06-10',75232152);
/*!40000 ALTER TABLE `cama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cama_cuarto`
--

DROP TABLE IF EXISTS `cama_cuarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cama_cuarto` (
  `Codigo_Cama` int NOT NULL,
  `id_Cuarto` int NOT NULL,
  PRIMARY KEY (`Codigo_Cama`,`id_Cuarto`),
  KEY `id_Cuarto` (`id_Cuarto`),
  CONSTRAINT `cama_cuarto_ibfk_1` FOREIGN KEY (`Codigo_Cama`) REFERENCES `cama` (`Codigo`),
  CONSTRAINT `cama_cuarto_ibfk_2` FOREIGN KEY (`id_Cuarto`) REFERENCES `cuarto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cama_cuarto`
--

LOCK TABLES `cama_cuarto` WRITE;
/*!40000 ALTER TABLE `cama_cuarto` DISABLE KEYS */;
/*!40000 ALTER TABLE `cama_cuarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuarto`
--

DROP TABLE IF EXISTS `cuarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuarto` (
  `id` int NOT NULL,
  `tamaño` varchar(30) DEFAULT NULL,
  `general_cama` varchar(30) DEFAULT NULL,
  `cuidados_intensivos` varchar(30) DEFAULT NULL,
  `codigo_paciente` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_paciente` (`codigo_paciente`),
  CONSTRAINT `cuarto_ibfk_1` FOREIGN KEY (`codigo_paciente`) REFERENCES `paciente` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuarto`
--

LOCK TABLES `cuarto` WRITE;
/*!40000 ALTER TABLE `cuarto` DISABLE KEYS */;
INSERT INTO `cuarto` VALUES (500,'Grande','No','Si',21543598),(501,'Mediana','Si','No',75232152),(502,'Mediana','Si','No',32456878),(503,'Mediana','No','Si',52142532),(504,'Grande','No','Si',75125898);
/*!40000 ALTER TABLE `cuarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermera`
--

DROP TABLE IF EXISTS `enfermera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermera` (
  `id_enfermera` int NOT NULL,
  `nombre_enfermera` varchar(30) DEFAULT NULL,
  `salario` int DEFAULT NULL,
  `fecha_Nacimiento` date DEFAULT NULL,
  `DNI_Paciente` int DEFAULT NULL,
  PRIMARY KEY (`id_enfermera`),
  KEY `DNI_Paciente` (`DNI_Paciente`),
  CONSTRAINT `enfermera_ibfk_1` FOREIGN KEY (`DNI_Paciente`) REFERENCES `paciente` (`DNI`),
  CONSTRAINT `enfermera_ibfk_2` FOREIGN KEY (`DNI_Paciente`) REFERENCES `paciente` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermera`
--

LOCK TABLES `enfermera` WRITE;
/*!40000 ALTER TABLE `enfermera` DISABLE KEYS */;
INSERT INTO `enfermera` VALUES (1322,'Vicenta Montes',1500,'1998-10-15',75232152),(1323,'Fatima Luna',1450,'1997-12-22',52142532),(1324,'Teodora Alvaro',1500,'1996-01-21',75125898),(1325,'Aurora Palazon',1400,'1994-05-13',32456878),(1326,'Salma Dorado',1300,'1993-11-02',21543598);
/*!40000 ALTER TABLE `enfermera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermera_cama`
--

DROP TABLE IF EXISTS `enfermera_cama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermera_cama` (
  `id_Enfermera_re1` int NOT NULL,
  `Codigo_Cama` int NOT NULL,
  `fecha_visita` date DEFAULT NULL,
  `hora_hospital` time DEFAULT NULL,
  `procedimiento` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_Enfermera_re1`,`Codigo_Cama`),
  KEY `Codigo_Cama` (`Codigo_Cama`),
  CONSTRAINT `enfermera_cama_ibfk_1` FOREIGN KEY (`id_Enfermera_re1`) REFERENCES `enfermera` (`id_enfermera`),
  CONSTRAINT `enfermera_cama_ibfk_2` FOREIGN KEY (`Codigo_Cama`) REFERENCES `cama` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermera_cama`
--

LOCK TABLES `enfermera_cama` WRITE;
/*!40000 ALTER TABLE `enfermera_cama` DISABLE KEYS */;
INSERT INTO `enfermera_cama` VALUES (1322,910,'2020-10-02','15:00:00','Inyeccion vitaminas'),(1323,911,'2018-12-15','10:15:00','Inyeccion Covid-19'),(1324,912,'2016-11-10','16:40:00','Costura heridas'),(1325,913,'2012-02-02','20:10:00','Inyeccion vitaminas'),(1326,914,'2021-01-27','13:00:00','Chequeo general');
/*!40000 ALTER TABLE `enfermera_cama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicos` (
  `id_medicos` int NOT NULL,
  `nombre_medicos` varchar(30) DEFAULT NULL,
  `experiencia_años` int DEFAULT NULL,
  `especialidad` varchar(30) DEFAULT NULL,
  `DNI_Paciente` int DEFAULT NULL,
  PRIMARY KEY (`id_medicos`),
  KEY `DNI_Paciente` (`DNI_Paciente`),
  CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`DNI_Paciente`) REFERENCES `paciente` (`DNI`),
  CONSTRAINT `medicos_ibfk_2` FOREIGN KEY (`DNI_Paciente`) REFERENCES `paciente` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` VALUES (101,'Jorge Quispe',10,'Cardiología',75232152),(102,'Deysi Huamani',12,'Dermatología',52142532),(103,'Manuel Socco',15,'Ecografía',75125898),(104,'Peter del Aguila',8,'Endocrinología',32456878),(105,'Ramiro Acero',5,'Gastroenterología',21543598);
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicos_atencion`
--

DROP TABLE IF EXISTS `medicos_atencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicos_atencion` (
  `id_Medicos` int NOT NULL,
  `id_Atencion` int NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `años_hospital` year DEFAULT NULL,
  `hospital_procedencia` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_Medicos`,`id_Atencion`),
  KEY `id_Atencion` (`id_Atencion`),
  CONSTRAINT `medicos_atencion_ibfk_1` FOREIGN KEY (`id_Medicos`) REFERENCES `medicos` (`id_medicos`),
  CONSTRAINT `medicos_atencion_ibfk_2` FOREIGN KEY (`id_Atencion`) REFERENCES `atencion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos_atencion`
--

LOCK TABLES `medicos_atencion` WRITE;
/*!40000 ALTER TABLE `medicos_atencion` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicos_atencion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `DNI` int NOT NULL,
  `nombres` varchar(30) DEFAULT NULL,
  `primer_apellido` varchar(30) DEFAULT NULL,
  `segundo_apellido` varchar(30) DEFAULT NULL,
  `fecha_Nacimiento` date DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (21543598,'Analy Karen','Soncco','Huamani','1995-11-28','F'),(32456878,'Luis Fernando','Mayta','Bustamante','2000-05-02','M'),(52142532,'Victor Jesus','Aguirre','Zapata','1995-12-10','M'),(75125898,'Alejandro','Quispe','Huanca','2002-09-10','M'),(75232152,'Pamela Sarai','Vargas','Mamani','2001-01-27','F');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_correo`
--

DROP TABLE IF EXISTS `paciente_correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente_correo` (
  `DNI_Paciente` int NOT NULL,
  `correo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`DNI_Paciente`),
  CONSTRAINT `paciente_correo_ibfk_1` FOREIGN KEY (`DNI_Paciente`) REFERENCES `paciente` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_correo`
--

LOCK TABLES `paciente_correo` WRITE;
/*!40000 ALTER TABLE `paciente_correo` DISABLE KEYS */;
INSERT INTO `paciente_correo` VALUES (21543598,'asonccounsa.edu.pe@'),(32456878,NULL),(52142532,'asonccounsa.edu.pe'),(75125898,NULL),(75232152,'pam_var@unsa.edu.pe');
/*!40000 ALTER TABLE `paciente_correo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_telefono`
--

DROP TABLE IF EXISTS `paciente_telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente_telefono` (
  `DNI_Paciente` int NOT NULL,
  `telefono` int NOT NULL,
  PRIMARY KEY (`DNI_Paciente`,`telefono`),
  CONSTRAINT `paciente_telefono_ibfk_1` FOREIGN KEY (`DNI_Paciente`) REFERENCES `paciente` (`DNI`),
  CONSTRAINT `paciente_telefono_ibfk_2` FOREIGN KEY (`DNI_Paciente`) REFERENCES `paciente` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_telefono`
--

LOCK TABLES `paciente_telefono` WRITE;
/*!40000 ALTER TABLE `paciente_telefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente_telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practicante`
--

DROP TABLE IF EXISTS `practicante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `practicante` (
  `DNI` int NOT NULL,
  `nombre_pract` varchar(30) DEFAULT NULL,
  `funciones` varchar(30) DEFAULT NULL,
  `hora_inicio_practica` time DEFAULT NULL,
  `hora_fin_practica` time DEFAULT NULL,
  `id_Enfermera_re` int DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  KEY `practicante_ibfk_1` (`id_Enfermera_re`),
  CONSTRAINT `practicante_ibfk_1` FOREIGN KEY (`id_Enfermera_re`) REFERENCES `enfermera` (`id_enfermera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practicante`
--

LOCK TABLES `practicante` WRITE;
/*!40000 ALTER TABLE `practicante` DISABLE KEYS */;
INSERT INTO `practicante` VALUES (32014025,'Herminio González','Ayudar supervisor','13:00:00','18:20:00',1322),(32123657,'Paulina Rivas','Redactar Informes','07:00:00','12:00:00',1326),(52456324,'Rodolfo del Rio','Ayudar doctores','07:30:00','12:30:00',1325),(85478987,'Gladys Esteve','Mantenimiento equipos','12:00:00','16:00:00',1323),(95875324,'Sheila Rojas','Limpieza','06:00:00','13:10:00',1324);
/*!40000 ALTER TABLE `practicante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepcionista`
--

DROP TABLE IF EXISTS `recepcionista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recepcionista` (
  `id` int NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `horas_trabajo` time DEFAULT NULL,
  `organizacion` varchar(30) DEFAULT NULL,
  `id_Atencion` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_Atencion` (`id_Atencion`),
  CONSTRAINT `recepcionista_ibfk_1` FOREIGN KEY (`id_Atencion`) REFERENCES `atencion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcionista`
--

LOCK TABLES `recepcionista` WRITE;
/*!40000 ALTER TABLE `recepcionista` DISABLE KEYS */;
/*!40000 ALTER TABLE `recepcionista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepcionista_cuarto`
--

DROP TABLE IF EXISTS `recepcionista_cuarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recepcionista_cuarto` (
  `id_Recepcionista` int NOT NULL,
  `id_Cuarto` int NOT NULL,
  PRIMARY KEY (`id_Recepcionista`,`id_Cuarto`),
  KEY `id_Cuarto` (`id_Cuarto`),
  CONSTRAINT `recepcionista_cuarto_ibfk_1` FOREIGN KEY (`id_Recepcionista`) REFERENCES `recepcionista` (`id`),
  CONSTRAINT `recepcionista_cuarto_ibfk_2` FOREIGN KEY (`id_Cuarto`) REFERENCES `cuarto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcionista_cuarto`
--

LOCK TABLES `recepcionista_cuarto` WRITE;
/*!40000 ALTER TABLE `recepcionista_cuarto` DISABLE KEYS */;
/*!40000 ALTER TABLE `recepcionista_cuarto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-27 22:06:12
