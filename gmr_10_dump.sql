CREATE DATABASE  IF NOT EXISTS `gmr_10` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gmr_10`;
-- MySQL dump 10.13  Distrib 5.6.10, for Win64 (x86_64)
--
-- Host: localhost    Database: gmr_10
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `cm_en`
--

DROP TABLE IF EXISTS `cm_en`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_en` (
  `target_concept` int(11) NOT NULL,
  `source_concept` int(11) NOT NULL,
  PRIMARY KEY (`target_concept`,`source_concept`),
  KEY `target_concept_idx` (`target_concept`),
  KEY `source_concept_idx` (`source_concept`),
  CONSTRAINT `cm_target_concept` FOREIGN KEY (`target_concept`) REFERENCES `target_concept` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cm_source_concept` FOREIGN KEY (`source_concept`) REFERENCES `source_concept` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_en`
--

LOCK TABLES `cm_en` WRITE;
/*!40000 ALTER TABLE `cm_en` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_en` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lm_en`
--

DROP TABLE IF EXISTS `lm_en`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm_en` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lm_sentence` int(11) NOT NULL,
  `lm_target` varchar(45) NOT NULL,
  `lm_source` varchar(45) NOT NULL,
  `target_concept` int(11) NOT NULL,
  `source_concept` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `source_concept_idx` (`source_concept`),
  KEY `target_concept_idx` (`target_concept`),
  KEY `lm_sentence` (`lm_sentence`),
  CONSTRAINT `lm_sentence` FOREIGN KEY (`lm_sentence`) REFERENCES `lm_sentence_en` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lm_source_concept` FOREIGN KEY (`source_concept`) REFERENCES `source_concept` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lm_target_concept` FOREIGN KEY (`target_concept`) REFERENCES `target_concept` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm_en`
--

LOCK TABLES `lm_en` WRITE;
/*!40000 ALTER TABLE `lm_en` DISABLE KEYS */;
/*!40000 ALTER TABLE `lm_en` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lm_sentence_en`
--

DROP TABLE IF EXISTS `lm_sentence_en`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm_sentence_en` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` mediumtext NOT NULL,
  `url` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm_sentence_en`
--

LOCK TABLES `lm_sentence_en` WRITE;
/*!40000 ALTER TABLE `lm_sentence_en` DISABLE KEYS */;
/*!40000 ALTER TABLE `lm_sentence_en` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_concept`
--

DROP TABLE IF EXISTS `source_concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_concept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_concept_en` varchar(45) NOT NULL,
  `source_dimension_en` varchar(45) NOT NULL,
  `source_concept_es` varchar(45) DEFAULT NULL,
  `source_dimension_es` varchar(45) DEFAULT NULL,
  `source_concept_fa` varchar(45) DEFAULT NULL,
  `source_dimension_fa` varchar(45) DEFAULT NULL,
  `source_concept_ru` varchar(45) DEFAULT NULL,
  `source_dimension_ru` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_concept`
--

LOCK TABLES `source_concept` WRITE;
/*!40000 ALTER TABLE `source_concept` DISABLE KEYS */;
INSERT INTO `source_concept` VALUES (1,'ABYSS','ALL','','ALL','','ALL','','ALL'),(2,'ABYSS','Type','','','','','',''),(3,'ABYSS','Depth','','','','','',''),(4,'ABYSS','Entrance','','','','','',''),(5,'ABYSS','Exit','','','','','',''),(6,'BODY_OF_WATER','ALL','','ALL','','ALL','','ALL'),(7,'BODY_OF_WATER','Type','','','','','',''),(8,'BODY_OF_WATER','Large_Features','','','','','',''),(9,'BODY_OF_WATER','Danger','','','','','',''),(10,'BODY_OF_WATER','Movement','','','','','',''),(11,'DISEASE','ALL','','ALL','','ALL','','ALL'),(12,'DISEASE','Type','','','','','',''),(13,'DISEASE','Symptoms','','','','','',''),(14,'DISEASE','Treatment','','','','','',''),(15,'DISEASE','Cure','','','','','',''),(16,'MEDICINE','ALL','','ALL','','ALL','','ALL'),(17,'MEDICINE','Adminstration','','','','','',''),(18,'CONFINEMENT','ALL','','ALL','','ALL','','ALL'),(19,'CONFINEMENT','Confined_Space','','','','','',''),(20,'CONFINEMENT','Exit','','','','','',''),(21,'CONFINEMENT','Restraints','','','','','',''),(22,'BUILDING','ALL','','ALL','','ALL','','ALL'),(23,'BUILDING','Type','','','','','',''),(24,'BUILDING','Structure','','','','','',''),(25,'BUILDING','Support','','','','','',''),(26,'BUILDING','Creation','','','','','',''),(27,'BUILDING','Components','','','','','',''),(28,'PATHWAY','ALL','','ALL','','ALL','','ALL'),(29,'PATHWAY','Type','','','','','',''),(30,'PATHWAY','Open_Path','','','','','',''),(31,'PATHWAY','Obstructed_Path','','','','','',''),(32,'MAZE','ALL','','ALL','','ALL','','ALL'),(33,'MAZE','Navigation','','','','','',''),(34,'MAZE','Obstruction','','','','','',''),(35,'MAZE','Confusing_Pathways','','','','','',''),(36,'PORTAL','ALL','','ALL','','ALL','','ALL'),(37,'PORTAL','Means_of_Entry','','','','','',''),(38,'PORTAL','Obstacles','','','','','',''),(39,'ENSLAVEMENT','ALL','','ALL','','ALL','','ALL'),(40,'ENSLAVEMENT','Master','','','','','',''),(41,'ENSLAVEMENT','Servant','','','','','',''),(42,'ENSLAVEMENT','Oppression','','','','','',''),(43,'CRIME','ALL','','ALL','','ALL','','ALL'),(44,'CRIME','Type','','','','','',''),(45,'CRIME','Punishment','','','','','',''),(46,'CRIME','Perpetrators','','','','','',''),(47,'VERTICAL_SCALE','ALL','','ALL','','ALL','','ALL'),(48,'VERTICAL_SCALE','Position_on_the_Scale','','','','','',''),(49,'VERTICAL_SCALE','Movement_on_the_Scale','','','','','',''),(50,'VERTICAL_SCALE','Contrast_of_Positions','','','','','',''),(51,'MOVEMENT_ON_A_VERTICAL_SCALE','ALL','','ALL','','ALL','','ALL'),(52,'MOVEMENT_ON_A_VERTICAL_SCALE','Movement','','','','','',''),(53,'MOVEMENT_ON_A_VERTICAL_SCALE','Calibration','','','','','',''),(54,'LOW_POINT','ALL','','ALL','','ALL','','ALL'),(55,'LOW_POINT','Bottom_of_Economic_Scale','','','','','',''),(56,'LOW_POINT','Movement_Downward','','','','','',''),(57,'LOW_POINT','Movement_Upward','','','','','',''),(58,'HIGH_POINT','ALL','','ALL','','ALL','','ALL'),(59,'HIGH_POINT','Top_of_Economic_Scale','','','','','',''),(60,'HIGH_POINT','Movement_Backward_Downward','','','','','',''),(61,'HIGH_POINT','Movement_Forward_Upward','','','','','',''),(62,'PHYSICAL_OBJECT','ALL','','ALL','','ALL','','ALL'),(63,'PHYSICAL_OBJECT','Type','','','','','',''),(64,'PHYSICAL_OBJECT','Possession','','','','','',''),(65,'PHYSICAL_OBJECT','Transfer','','','','','',''),(66,'PHYSICAL_BURDEN','ALL','','ALL','','ALL','','ALL'),(67,'PHYSICAL_BURDEN','Weight','','','','','',''),(68,'PHYSICAL_BURDEN','Relief','','','','','',''),(69,'PHYSICAL_BURDEN','Physical_Distress','','','','','',''),(70,'PHYSICAL_LOCATION','ALL','','ALL','','ALL','','ALL'),(71,'PHYSICAL_LOCATION','Defined_Region','','','','','',''),(72,'PHYSICAL_LOCATION','Movement _Into','','','','','',''),(73,'PHYSICAL_LOCATION','Exit','','','','','',''),(74,'PHYSICAL_HARM','ALL','','ALL','','ALL','','ALL'),(75,'PHYSICAL_HARM','Type','','','','','',''),(76,'PHYSICAL_HARM','Restraint','','','','','',''),(77,'PHYSICAL_HARM','Protection','','','','','',''),(78,'NATURAL_PHYSICAL_FORCE','ALL','','ALL','','ALL','','ALL'),(79,'NATURAL_PHYSICAL_FORCE','Type','','','','','',''),(80,'NATURAL_PHYSICAL_FORCE','Result','','','','','',''),(81,'RESOURCE','ALL','','ALL','','ALL','','ALL'),(82,'RESOURCE','Substance','','','','','',''),(83,'RESOURCE','Quantity_Size','','','','','',''),(84,'RESOURCE','Develop_Resources','','','','','',''),(85,'RESOURCE','Distribution','','','','','',''),(86,'DARKNESS','ALL','','ALL','','ALL','','ALL'),(87,'DARKNESS','Dark_End_of_Range_of_Darkness_Light','','','','','',''),(88,'DARKNESS','Movement_in_the_Range','','','','','',''),(89,'LIGHT','ALL','','ALL','','ALL','','ALL'),(90,'LIGHT','Light_End_of_Range_of_Darkness_Light','','','','','',''),(91,'LIGHT','Illumination','','','','','',''),(92,'LIGHT','Movement','','','','','',''),(93,'COMPETITION','ALL','','ALL','','ALL','','ALL'),(94,'COMPETITION','Component','','','','','',''),(95,'STRUGGLE','ALL','','ALL','','ALL','','ALL'),(96,'STRUGGLE','Type','','','','','',''),(97,'STRUGGLE','Adversary','','','','','',''),(98,'FOOD','ALL','','ALL','','ALL','','ALL'),(99,'FOOD','Type','','','','','',''),(100,'FOOD','Consumption','','','','','',''),(101,'OBESITY','ALL','','ALL','','ALL','','ALL'),(102,'OBESITY','Excess_Body_Weight','','','','','',''),(103,'OBESITY','Excess_Consumption','','','','','',''),(104,'VISION','ALL','','ALL','','ALL','','ALL'),(105,'VISION','Blindness','','','','','',''),(106,'VISION','Seeing','','','','','',''),(107,'ADDICTION','ALL','','ALL','','ALL','','ALL'),(108,'ADDICTION','Type','','','','','',''),(109,'ADDICTION','Compulsion','','','','','',''),(110,'ADDICTION','Result','','','','','',''),(111,'BLOOD_SYSTEM','ALL','','ALL','','ALL','','ALL'),(112,'BLOOD_SYSTEM','Component','','','','','',''),(113,'BLOOD_SYSTEM','Movement','','','','','',''),(114,'GOAL_DIRECTED','ALL','','ALL','','ALL','','ALL'),(115,'GOAL_DIRECTED','Type','','','','','',''),(116,'GOAL_DIRECTED','Risk','','','','','',''),(117,'GOAL_DIRECTED','Obstacles','','','','','',''),(118,'ENERGY','ALL','','ALL','','ALL','','ALL'),(119,'ENERGY','Type','','','','','',''),(120,'ENERGY','Result','','','','','',''),(121,'HUMAN_BODY','ALL','','ALL','','ALL','','ALL'),(122,'HUMAN_BODY','Component','','','','','',''),(123,'PARASITE','ALL','','ALL','','ALL','','ALL'),(124,'PARASITE','Destructive_Being','','','','','',''),(125,'MONSTER','ALL','','ALL','','ALL','','ALL'),(126,'MONSTER','Type','','','','','',''),(127,'FORCEFUL_EXTRACTION','ALL','','ALL','','ALL','','ALL'),(128,'FORCEFUL_EXTRACTION','Type','','','','','',''),(129,'MOVEMENT','ALL','','ALL','','ALL','','ALL'),(130,'MOVEMENT','Movement','','','','','',''),(131,'GEOGRAPHIC_FEATURE','ALL','','ALL','','ALL','','ALL'),(132,'GEOGRAPHIC_FEATURE','Type','','','','','',''),(133,'SCHISM','ALL','','ALL','','ALL','','ALL'),(134,'SCHISM','Type','','','','','',''),(135,'A_GOD','ALL','','ALL','','ALL','','ALL'),(136,'A_GOD','Type','','','','','',''),(137,'A_GOD','Veneration','','','','','',''),(138,'A_RIGHT','ALL','','ALL','','ALL','','ALL'),(139,'A_RIGHT','Type','','','','','',''),(140,'MORAL_DUTY','ALL','','ALL','','ALL','','ALL'),(141,'MORAL_DUTY','Remuneration','','','','','','');
/*!40000 ALTER TABLE `source_concept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target_concept`
--

DROP TABLE IF EXISTS `target_concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target_concept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `target_concept_en` varchar(45) NOT NULL,
  `target_concept_es` varchar(45) DEFAULT NULL,
  `target_concept_fa` varchar(45) DEFAULT NULL,
  `target_concept_ru` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `parent_target_concept_idx` (`parent_id`),
  CONSTRAINT `parent_target_concept` FOREIGN KEY (`parent_id`) REFERENCES `target_concept` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_concept`
--

LOCK TABLES `target_concept` WRITE;
/*!40000 ALTER TABLE `target_concept` DISABLE KEYS */;
INSERT INTO `target_concept` VALUES (1,1,'ROOT','ROOT','ROOT','ROOT'),(2,1,'ECONOMIC_INEQUALITY','','',''),(3,2,'POVERTY','','',''),(4,2,'TAXATION','','',''),(5,2,'WEALTH_AND_SOCIAL_CLASS','','',''),(6,2,'ACCESS_TO_EDUCATION','','',''),(7,3,'THE_POOR','','',''),(8,4,'TAXES','','',''),(9,5,'THE_RICH','','',''),(10,5,'WEALTH','','',''),(11,5,'MONEY','','',''),(12,5,'DEBT','','',''),(13,5,'SOCIAL_CLASS','','',''),(14,5,'THE_MIDDLE_CLASS','','',''),(15,6,'EDUCATION','','',''),(16,1,'GOVERNANCE','','',''),(17,16,'BUREAUCRACY','','',''),(18,16,'REGULATIONS','','',''),(19,16,'GOVERNMENT','','',''),(20,16,'LEADERS','','',''),(21,16,'POLITICS','','',''),(22,16,'POLITICIANS','','',''),(23,16,'LEGISLATION','','',''),(24,16,'THE_LAW','','','');
/*!40000 ALTER TABLE `target_concept` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-25 13:54:42
