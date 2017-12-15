CREATE DATABASE  IF NOT EXISTS `gmr_31` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gmr_31`;
-- MySQL dump 10.13  Distrib 5.6.16, for Win64 (x86_64)
--
-- Host: localhost    Database: gmr_31
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `owner` enum('GOV','ALB','ICSI','USC') NOT NULL,
  `schema_version` decimal(3,2) NOT NULL,
  `date` date NOT NULL,
  `comments` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm`
--

DROP TABLE IF EXISTS `cm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` enum('EN','ES','FA','RU') NOT NULL,
  `cm_target_id` int(11) NOT NULL,
  `cm_source_id` int(11) NOT NULL,
  PRIMARY KEY (`language`,`cm_target_id`,`cm_source_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `cm_target_idx` (`cm_target_id`),
  KEY `cm_source_idx` (`cm_source_id`),
  CONSTRAINT `cm_target_cm` FOREIGN KEY (`cm_target_id`) REFERENCES `cm_target` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cm_source_cm` FOREIGN KEY (`cm_source_id`) REFERENCES `cm_source` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm`
--

LOCK TABLES `cm` WRITE;
/*!40000 ALTER TABLE `cm` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_source`
--

DROP TABLE IF EXISTS `cm_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_owner` enum('GOV','ALB','ICSI','USC') NOT NULL,
  `source_concept` varchar(45) NOT NULL,
  `source_name_es` varchar(45) DEFAULT NULL,
  `source_name_fa` varchar(45) DEFAULT NULL,
  `source_name_ru` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_source`
--

LOCK TABLES `cm_source` WRITE;
/*!40000 ALTER TABLE `cm_source` DISABLE KEYS */;
INSERT INTO `cm_source` VALUES (1,'GOV','A_GOD',NULL,NULL,NULL),(2,'GOV','A_RIGHT',NULL,NULL,NULL),(3,'GOV','ABYSS',NULL,NULL,NULL),(4,'GOV','ADDICTION',NULL,NULL,NULL),(5,'GOV','ANIMAL',NULL,NULL,NULL),(6,'GOV','BATTLE',NULL,NULL,NULL),(7,'GOV','BLOOD_STREAM',NULL,NULL,NULL),(8,'GOV','BODY_OF_WATER',NULL,NULL,NULL),(9,'GOV','BUILDING',NULL,NULL,NULL),(10,'GOV','COMPETITION',NULL,NULL,NULL),(11,'GOV','CONFINEMENT',NULL,NULL,NULL),(12,'GOV','CRIME',NULL,NULL,NULL),(13,'GOV','CROP',NULL,NULL,NULL),(14,'GOV','DARKNESS',NULL,NULL,NULL),(15,'GOV','DESTROYER ',NULL,NULL,NULL),(16,'GOV','DISEASE',NULL,NULL,NULL),(17,'GOV','ENERGY',NULL,NULL,NULL),(18,'GOV','ENSLAVEMENT',NULL,NULL,NULL),(19,'GOV','FOOD',NULL,NULL,NULL),(20,'GOV','FORCEFUL_EXTRACTION',NULL,NULL,NULL),(21,'GOV','GAME',NULL,NULL,NULL),(22,'GOV','GAP',NULL,NULL,NULL),(23,'GOV','GEOGRAPHIC_FEATURE',NULL,NULL,NULL),(24,'GOV','GREED',NULL,NULL,NULL),(25,'GOV','HUMAN_BODY',NULL,NULL,NULL),(26,'GOV','IMPURITY',NULL,NULL,NULL),(27,'GOV','LIGHT',NULL,NULL,NULL),(28,'GOV','MACHINE',NULL,NULL,NULL),(29,'GOV','MAZE',NULL,NULL,NULL),(30,'GOV','MEDICINE',NULL,NULL,NULL),(31,'GOV','MONSTER',NULL,NULL,NULL),(32,'GOV','MORAL_DUTY',NULL,NULL,NULL),(33,'GOV','MOVEMENT',NULL,NULL,NULL),(34,'GOV','NATURAL_PHYSICAL_FORCE',NULL,NULL,NULL),(35,'GOV','OBESITY',NULL,NULL,NULL),(36,'GOV','PARASITE',NULL,NULL,NULL),(37,'GOV','PATHWAY',NULL,NULL,NULL),(38,'GOV','PHYSICAL_BURDEN',NULL,NULL,NULL),(39,'GOV','PHYSICAL_HARM',NULL,NULL,NULL),(40,'GOV','PHYSICAL_LOCATION',NULL,NULL,NULL),(41,'GOV','PLANT',NULL,NULL,NULL),(42,'GOV','PORTAL',NULL,NULL,NULL),(43,'GOV','POSITION_AND_CHANGE_OF_POSITION_ON_A_SCALE',NULL,NULL,NULL),(44,'GOV','RACE',NULL,NULL,NULL),(45,'GOV','RESOURCE',NULL,NULL,NULL),(46,'GOV','STAGE',NULL,NULL,NULL),(47,'GOV','STRUGGLE',NULL,NULL,NULL),(48,'GOV','THEFT',NULL,NULL,NULL),(49,'GOV','VISION',NULL,NULL,NULL),(50,'GOV','WAR',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cm_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_target`
--

DROP TABLE IF EXISTS `cm_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_owner` enum('GOV','ALB','ICSI','USC') NOT NULL,
  `target_concept` varchar(45) NOT NULL,
  `target_domain` enum('GOVERNANCE','ECONOMIC_INEQUALITY','DEMOCRACY') NOT NULL,
  `target_name_es` varchar(45) DEFAULT NULL,
  `target_name_fa` varchar(45) DEFAULT NULL,
  `target_name_ru` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_target`
--

LOCK TABLES `cm_target` WRITE;
/*!40000 ALTER TABLE `cm_target` DISABLE KEYS */;
INSERT INTO `cm_target` VALUES (1,'GOV','BUREAUCRACY','GOVERNANCE',NULL,NULL,NULL),(2,'GOV','GOVERNMENT','GOVERNANCE',NULL,NULL,NULL),(3,'GOV','POVERTY','ECONOMIC_INEQUALITY',NULL,NULL,NULL),(4,'GOV','TAXATION','ECONOMIC_INEQUALITY',NULL,NULL,NULL),(5,'GOV','WEALTH','ECONOMIC_INEQUALITY',NULL,NULL,NULL),(6,'GOV','DEMOCRACY','DEMOCRACY',NULL,NULL,NULL),(7,'GOV','ELECTIONS','DEMOCRACY',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cm_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lm`
--

DROP TABLE IF EXISTS `lm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` enum('EN','ES','FA','RU') NOT NULL,
  `lm_target` varchar(45) NOT NULL,
  `lm_source` varchar(45) NOT NULL,
  `cm_target_id` int(11) NOT NULL,
  `lm_sentence_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `cm_target_idx` (`cm_target_id`),
  KEY `lm_sentence` (`lm_sentence_id`),
  CONSTRAINT `lm_sentence` FOREIGN KEY (`lm_sentence_id`) REFERENCES `lm_sentence` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cm_target` FOREIGN KEY (`cm_target_id`) REFERENCES `cm_target` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm`
--

LOCK TABLES `lm` WRITE;
/*!40000 ALTER TABLE `lm` DISABLE KEYS */;
/*!40000 ALTER TABLE `lm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lm2cm_source`
--

DROP TABLE IF EXISTS `lm2cm_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm2cm_source` (
  `lm_id` int(11) NOT NULL,
  `cm_source_id` int(11) NOT NULL,
  PRIMARY KEY (`lm_id`,`cm_source_id`),
  KEY `lm_idx` (`lm_id`),
  KEY `cm_source_idx` (`cm_source_id`),
  CONSTRAINT `lm` FOREIGN KEY (`lm_id`) REFERENCES `lm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cm_source` FOREIGN KEY (`cm_source_id`) REFERENCES `cm_source` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm2cm_source`
--

LOCK TABLES `lm2cm_source` WRITE;
/*!40000 ALTER TABLE `lm2cm_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `lm2cm_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lm_sentence`
--

DROP TABLE IF EXISTS `lm_sentence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm_sentence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` enum('EN','ES','FA','RU') NOT NULL,
  `text` mediumtext NOT NULL,
  `url` varchar(120) NOT NULL,
  `type` enum('NEWSPAPER','MAGAZINE','BLOG','TRANSCRIPT','SOCIAL_MEDIA','OFFICIAL_DOCUMENT','OTHER') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm_sentence`
--

LOCK TABLES `lm_sentence` WRITE;
/*!40000 ALTER TABLE `lm_sentence` DISABLE KEYS */;
/*!40000 ALTER TABLE `lm_sentence` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-05 14:10:46
