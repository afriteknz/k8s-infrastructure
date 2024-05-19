CREATE DATABASE  IF NOT EXISTS `frampoldb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `frampoldb`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: frampoldb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domains` (
  `dom_id` int unsigned NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(45) NOT NULL,
  PRIMARY KEY (`dom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domains`
--

LOCK TABLES `domains` WRITE;
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;
INSERT INTO `domains` VALUES (1,'@ispcustomer.co.zw');
/*!40000 ALTER TABLE `domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `plan_id` int unsigned NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(45) NOT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (1,'30_MEG_UP_30_MEG_DOWN'),(2,'50_MEG_UP_50_MEG_DOWN');
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber`
--

DROP TABLE IF EXISTS `subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriber` (
  `sub_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(45) NOT NULL,
  `attribute` varchar(45) NOT NULL,
  `plan_id` int unsigned NOT NULL,
  `dom_id` int unsigned NOT NULL,
  PRIMARY KEY (`sub_id`,`plan_id`,`dom_id`) USING BTREE,
  KEY `FK_subscriber_PLAN` (`plan_id`),
  KEY `FK_subscriber_DOMAINS` (`dom_id`),
  CONSTRAINT `FK_subscriber_DOMAINS` FOREIGN KEY (`dom_id`) REFERENCES `domains` (`dom_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_subscriber_PLAN` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`plan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber`
--

LOCK TABLES `subscriber` WRITE;
/*!40000 ALTER TABLE `subscriber` DISABLE KEYS */;
INSERT INTO `subscriber` VALUES (5,'10.10.10.25',':=set_attribute',1,1),(6,'10.10.10.26',':=set_attribute',2,1),(7,'10.10.10.30',':=set_attribute',2,1),(8,'192.168.1.10',':=set_attribute',1,1),(10,'11.11.11.12',':=set_attribute',2,1);
/*!40000 ALTER TABLE `subscriber` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-09 16:30:34
