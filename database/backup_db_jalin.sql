-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: jalin
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `client_code` varchar(45) NOT NULL,
  `trx_date` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `nominal` decimal(10,0) DEFAULT NULL,
  `admin` decimal(10,0) DEFAULT NULL,
  `trx_amount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`client_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_a`
--

DROP TABLE IF EXISTS `table_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_a` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cardnumber` varchar(45) DEFAULT NULL,
  `iss` varchar(45) DEFAULT NULL,
  `acq` varchar(45) DEFAULT NULL,
  `dest` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_a`
--

LOCK TABLES `table_a` WRITE;
/*!40000 ALTER TABLE `table_a` DISABLE KEYS */;
INSERT INTO `table_a` VALUES (1,'123','MDR','BNI','MDR','1');
/*!40000 ALTER TABLE `table_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_b`
--

DROP TABLE IF EXISTS `table_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_b` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cardnumber` varchar(45) DEFAULT NULL,
  `iss` varchar(45) DEFAULT NULL,
  `acq` varchar(45) DEFAULT NULL,
  `dest` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `source` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_b`
--

LOCK TABLES `table_b` WRITE;
/*!40000 ALTER TABLE `table_b` DISABLE KEYS */;
INSERT INTO `table_b` VALUES (1,'123','MDR','BNI','MDR','0','MDR'),(2,'123','MDR','BNI','MDR','1','BNI');
/*!40000 ALTER TABLE `table_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_c`
--

DROP TABLE IF EXISTS `table_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_c` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cardnumber` varchar(45) DEFAULT NULL,
  `iss` varchar(45) DEFAULT NULL,
  `acq` varchar(45) DEFAULT NULL,
  `dest` varchar(45) DEFAULT NULL,
  `status_a` varchar(45) DEFAULT NULL,
  `status_iss` varchar(45) DEFAULT NULL,
  `status_acq` varchar(45) DEFAULT NULL,
  `status_dest` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_c`
--

LOCK TABLES `table_c` WRITE;
/*!40000 ALTER TABLE `table_c` DISABLE KEYS */;
INSERT INTO `table_c` VALUES (2,'123','MDR','BNI','MDR','1','0','1','0');
/*!40000 ALTER TABLE `table_c` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-07 21:04:38
