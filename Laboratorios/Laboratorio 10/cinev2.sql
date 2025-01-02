-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: cinev2
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
-- Table structure for table `actores_principales`
--

DROP TABLE IF EXISTS `actores_principales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actores_principales` (
  `codigo` int NOT NULL,
  `nombres` varchar(30) DEFAULT NULL,
  `primer_apellido` varchar(30) DEFAULT NULL,
  `segundo_apellido` varchar(30) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `genero` varchar(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actores_principales`
--

LOCK TABLES `actores_principales` WRITE;
/*!40000 ALTER TABLE `actores_principales` DISABLE KEYS */;
INSERT INTO `actores_principales` VALUES (112,'Matthew','Raymond','Dillon','New Rochelle, Nueva York, EEUU','M','1964-02-18'),(113,'Gal','Gadot','Varsano','Petaj Tikva (Israel)','F','1985-04-30'),(114,'Jeremy','Lee','Renner','Modesto (Estados Unidos)','M','1971-01-07'),(115,'Joseph','Frank','Pesci',' Nueva Jersey, EEUU','M','1943-02-09'),(116,'Rachel','Anne','Zegler','Hackensack, Nueva Jersey, EEUU','F','2001-05-03');
/*!40000 ALTER TABLE `actores_principales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actores_principales_pelicula`
--

DROP TABLE IF EXISTS `actores_principales_pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actores_principales_pelicula` (
  `codigo_Actores_principales` int NOT NULL,
  `codigo_Pelicula` int NOT NULL,
  PRIMARY KEY (`codigo_Actores_principales`,`codigo_Pelicula`),
  KEY `codigo_Pelicula` (`codigo_Pelicula`),
  CONSTRAINT `actores_principales_pelicula_ibfk_1` FOREIGN KEY (`codigo_Actores_principales`) REFERENCES `actores_principales` (`codigo`),
  CONSTRAINT `actores_principales_pelicula_ibfk_2` FOREIGN KEY (`codigo_Pelicula`) REFERENCES `pelicula` (`codigo_peli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actores_principales_pelicula`
--

LOCK TABLES `actores_principales_pelicula` WRITE;
/*!40000 ALTER TABLE `actores_principales_pelicula` DISABLE KEYS */;
/*!40000 ALTER TABLE `actores_principales_pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `codigo` int NOT NULL,
  `nombres` varchar(30) DEFAULT NULL,
  `primer_apellido` varchar(30) DEFAULT NULL,
  `segundo_apellido` varchar(30) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `genero` varchar(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (123,'Steven','Allan','Spielberg','Cincinnati(Ohio, EEUU)','M','1946-12-18'),(124,'Martin','Charles','Scorsese','Queens (EEUU)','M','1942-11-17'),(125,'Kathryn','Ann','Bigelow','San Carlos, California, EEUU','F','1951-12-27'),(126,'Lars','von','Trier',' Copenhague, Dinamarca','M','1956-04-30'),(127,'Patricia','Lea','Jenkins','EEUU, California, Victorville','F','1971-07-23');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `ID` int NOT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `dia` int DEFAULT NULL,
  `mes` int DEFAULT NULL,
  `año` year DEFAULT NULL,
  `codigo_Pelicula` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `codigo_Pelicula` (`codigo_Pelicula`),
  CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `sala` (`codigo`),
  CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`codigo_Pelicula`) REFERENCES `pelicula` (`codigo_peli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (201,'15:00:00','16:40:00',20,12,2020,11125),(202,'17:30:00','19:10:00',15,1,2016,11127),(203,'20:00:00','22:00:00',8,10,2015,11126),(204,'16:40:00','18:20:00',12,9,2018,11123),(205,'18:10:00','19:50:00',5,5,2020,11124);
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula` (
  `codigo_peli` int NOT NULL,
  `director` varchar(30) DEFAULT NULL,
  `actores_principales` varchar(30) DEFAULT NULL,
  `año_lanzamien` year DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `sipnosis` varchar(300) DEFAULT NULL,
  `nombre_original` varchar(30) DEFAULT NULL,
  `nombre_español` varchar(30) DEFAULT NULL,
  `codigo_Director` int DEFAULT NULL,
  `codigo_Sala` int DEFAULT NULL,
  PRIMARY KEY (`codigo_peli`),
  KEY `codigo_Sala` (`codigo_Sala`),
  KEY `codigo_Director` (`codigo_Director`),
  CONSTRAINT `pelicula_ibfk_1` FOREIGN KEY (`codigo_Sala`) REFERENCES `sala` (`codigo`),
  CONSTRAINT `pelicula_ibfk_2` FOREIGN KEY (`codigo_Director`) REFERENCES `director` (`codigo`),
  CONSTRAINT `pelicula_ibfk_3` FOREIGN KEY (`codigo_Director`) REFERENCES `director` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES (11123,'Lars von Trier','Matthew Raymond Dillon',2018,'Suspenso','Jack, un prolífico asesino serial y frustrado arquitecto en el Washington de los 80s, recuenta 5 de sus crímenes a Virgilio','The House That Jack Built','La casa de Jack',126,201),(11124,'Patty Jenkins','Gal Gadot',2017,'Accion','Diana, hija de dioses y princesa de las amazonas, nunca ha salido de su isla. ','Wonder Woman','Mujer Maravilla',127,202),(11125,'Kathryn Bigelow','Jeremy Renner',2008,'Bélico','Los integrantes de un comando especializado en desactivación de explosivos durante la guerra de Irak, deben hacer frente a situaciones extremas que pondrán a prueba muchas de sus facultades.','The Hurt Locker','Vivir al límite',125,203),(11126,'Martin Scorsese','Joe Pesci',2019,'Crimen','Frank Sheeran, veterano de la Segunda Guerra Mundial, estafador y asesino a sueldo recuerda su participación en el asesinato de Jimmy Hoffa.','The Irishman','El irlandés',124,204),(11127,'Steven Spielberg','Rachel Zegler',2021,'Musical','Dos adolescentes de diferentes raíces étnicas se enamoran en la ciudad de Nueva York de los años 50. Nueva versión del legendario musical West Side Story sobre el enfrentamiento entre dos bandas callejeras de Nueva York, adaptación de una famosa obra de teatro de Broadway.','West Side Story','Amor sin barreras',123,205);
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `codigo` int NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `capacidad` int DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (201,'Sala 1',150),(202,'Sala 2',200),(203,'Sala 3',100),(204,'Sala 4',300),(205,'Sala 5',150);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-17 23:41:02
