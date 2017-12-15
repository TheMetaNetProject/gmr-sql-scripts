CREATE DATABASE  IF NOT EXISTS `gmr_20` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gmr_20`;
-- MySQL dump 10.13  Distrib 5.6.10, for Win64 (x86_64)
--
-- Host: localhost    Database: gmr_20
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
  `affect_polarity` varchar(45) DEFAULT NULL,
  `affect_intensity` int(11) DEFAULT NULL,
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
  `type` varchar(45) NOT NULL,
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
  `source_owner` varchar(45) NOT NULL,
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
INSERT INTO `source_concept` VALUES (1,'GOV','NULL','ALL','NULL','ALL','NULL','ALL','NULL','ALL'),(2,'GOV','ABYSS','ALL','','ALL','','ALL','','ALL'),(3,'GOV','ABYSS','Type','','','','','',''),(4,'GOV','ABYSS','Depth','','','','','',''),(5,'GOV','ABYSS','Entrance','','','','','',''),(6,'GOV','ABYSS','Exit','','','','','',''),(7,'GOV','BODY_OF_WATER','ALL','','ALL','','ALL','','ALL'),(8,'GOV','BODY_OF_WATER','Type','','','','','',''),(9,'GOV','BODY_OF_WATER','Large_Features','','','','','',''),(10,'GOV','BODY_OF_WATER','Danger','','','','','',''),(11,'GOV','BODY_OF_WATER','Movement','','','','','',''),(12,'GOV','DISEASE','ALL','','ALL','','ALL','','ALL'),(13,'GOV','DISEASE','Type','','','','','',''),(14,'GOV','DISEASE','Symptoms','','','','','',''),(15,'GOV','DISEASE','Treatment','','','','','',''),(16,'GOV','DISEASE','Cure','','','','','',''),(17,'GOV','MEDICINE','ALL','','ALL','','ALL','','ALL'),(18,'GOV','MEDICINE','Adminstration','','','','','',''),(19,'GOV','MEDICINE','Result','','','','','',''),(20,'GOV','CONFINEMENT','ALL','','ALL','','ALL','','ALL'),(21,'GOV','CONFINEMENT','Confined_Space','','','','','',''),(22,'GOV','CONFINEMENT','Exit','','','','','',''),(23,'GOV','CONFINEMENT','Restraints','','','','','',''),(24,'GOV','BUILDING','ALL','','ALL','','ALL','','ALL'),(25,'GOV','BUILDING','Type','','','','','',''),(26,'GOV','BUILDING','Structure','','','','','',''),(27,'GOV','BUILDING','Support','','','','','',''),(28,'GOV','BUILDING','Creation_Destruction','','','','','',''),(29,'GOV','BUILDING','Components','','','','','',''),(30,'GOV','PATHWAY','ALL','','ALL','','ALL','','ALL'),(31,'GOV','PATHWAY','Type','','','','','',''),(32,'GOV','PATHWAY','Open_Path','','','','','',''),(33,'GOV','PATHWAY','Obstructed_Path','','','','','',''),(34,'GOV','MAZE','ALL','','ALL','','ALL','','ALL'),(35,'GOV','MAZE','Navigation','','','','','',''),(36,'GOV','MAZE','Obstruction','','','','','',''),(37,'GOV','MAZE','Confusing_Pathways','','','','','',''),(38,'GOV','PORTAL','ALL','','ALL','','ALL','','ALL'),(39,'GOV','PORTAL','Means_of_Entry','','','','','',''),(40,'GOV','PORTAL','Obstacles','','','','','',''),(41,'GOV','ENSLAVEMENT','ALL','','ALL','','ALL','','ALL'),(42,'GOV','ENSLAVEMENT','Master','','','','','',''),(43,'GOV','ENSLAVEMENT','Servant','','','','','',''),(44,'GOV','ENSLAVEMENT','Oppression','','','','','',''),(45,'GOV','CRIME','ALL','','ALL','','ALL','','ALL'),(46,'GOV','CRIME','Type','','','','','',''),(47,'GOV','CRIME','Punishment','','','','','',''),(48,'GOV','CRIME','Perpetrators','','','','','',''),(49,'GOV','CRIME','Victim','','','','','',''),(50,'GOV','VERTICAL_SCALE','ALL','','ALL','','ALL','','ALL'),(51,'GOV','VERTICAL_SCALE','Position_on_the_Scale','','','','','',''),(52,'GOV','VERTICAL_SCALE','Movement_on_the_Scale','','','','','',''),(53,'GOV','VERTICAL_SCALE','Contrast_of_Positions','','','','','',''),(54,'GOV','MOVEMENT_ON_A_VERTICAL_SCALE','ALL','','ALL','','ALL','','ALL'),(55,'GOV','MOVEMENT_ON_A_VERTICAL_SCALE','Movement','','','','','',''),(56,'GOV','MOVEMENT_ON_A_VERTICAL_SCALE','Calibration','','','','','',''),(57,'GOV','LOW_POINT','ALL','','ALL','','ALL','','ALL'),(58,'GOV','LOW_POINT','Bottom_of_Economic_Scale','','','','','',''),(59,'GOV','LOW_POINT','Movement_Downward','','','','','',''),(60,'GOV','LOW_POINT','Movement_Upward','','','','','',''),(61,'GOV','HIGH_POINT','ALL','','ALL','','ALL','','ALL'),(62,'GOV','HIGH_POINT','Top_of_Economic_Scale','','','','','',''),(63,'GOV','HIGH_POINT','Movement_Backward_Downward','','','','','',''),(64,'GOV','HIGH_POINT','Movement_Forward_Upward','','','','','',''),(65,'GOV','PHYSICAL_OBJECT','ALL','','ALL','','ALL','','ALL'),(66,'GOV','PHYSICAL_OBJECT','Type','','','','','',''),(67,'GOV','PHYSICAL_OBJECT','Possession','','','','','',''),(68,'GOV','PHYSICAL_OBJECT','Transfer','','','','','',''),(69,'GOV','PHYSICAL_BURDEN','ALL','','ALL','','ALL','','ALL'),(70,'GOV','PHYSICAL_BURDEN','Weight','','','','','',''),(71,'GOV','PHYSICAL_BURDEN','Relief','','','','','',''),(72,'GOV','PHYSICAL_BURDEN','Physical_Distress','','','','','',''),(73,'GOV','PHYSICAL_LOCATION','ALL','','ALL','','ALL','','ALL'),(74,'GOV','PHYSICAL_LOCATION','Defined_Region','','','','','',''),(75,'GOV','PHYSICAL_LOCATION','Movement _Into','','','','','',''),(76,'GOV','PHYSICAL_LOCATION','Exit','','','','','',''),(77,'GOV','PHYSICAL_HARM','ALL','','ALL','','ALL','','ALL'),(78,'GOV','PHYSICAL_HARM','Type','','','','','',''),(79,'GOV','PHYSICAL_HARM','Restraint','','','','','',''),(80,'GOV','PHYSICAL_HARM','Protection','','','','','',''),(81,'GOV','NATURAL_PHYSICAL_FORCE','ALL','','ALL','','ALL','','ALL'),(82,'GOV','NATURAL_PHYSICAL_FORCE','Type','','','','','',''),(83,'GOV','NATURAL_PHYSICAL_FORCE','Result','','','','','',''),(84,'GOV','RESOURCE','ALL','','ALL','','ALL','','ALL'),(85,'GOV','RESOURCE','Substance','','','','','',''),(86,'GOV','RESOURCE','Quantity_Size','','','','','',''),(87,'GOV','RESOURCE','Develop_Resources','','','','','',''),(88,'GOV','RESOURCE','Distribution','','','','','',''),(89,'GOV','DARKNESS','ALL','','ALL','','ALL','','ALL'),(90,'GOV','DARKNESS','Dark_End_of_Range_of_Darkness_Light','','','','','',''),(91,'GOV','DARKNESS','Movement_in_the_Range','','','','','',''),(92,'GOV','LIGHT','ALL','','ALL','','ALL','','ALL'),(93,'GOV','LIGHT','Light_End_of_Range_of_Darkness_Light','','','','','',''),(94,'GOV','LIGHT','Illumination','','','','','',''),(95,'GOV','LIGHT','Movement','','','','','',''),(96,'GOV','COMPETITION','ALL','','ALL','','ALL','','ALL'),(97,'GOV','COMPETITION','Component','','','','','',''),(98,'GOV','STRUGGLE','ALL','','ALL','','ALL','','ALL'),(99,'GOV','STRUGGLE','Type','','','','','',''),(100,'GOV','STRUGGLE','Adversary','','','','','',''),(101,'GOV','FOOD','ALL','','ALL','','ALL','','ALL'),(102,'GOV','FOOD','Type','','','','','',''),(103,'GOV','FOOD','Consumption','','','','','',''),(104,'GOV','OBESITY','ALL','','ALL','','ALL','','ALL'),(105,'GOV','OBESITY','Excess_Body_Weight','','','','','',''),(106,'GOV','OBESITY','Excess_Consumption','','','','','',''),(107,'GOV','VISION','ALL','','ALL','','ALL','','ALL'),(108,'GOV','VISION','Blindness','','','','','',''),(109,'GOV','VISION','Seeing','','','','','',''),(110,'GOV','ADDICTION','ALL','','ALL','','ALL','','ALL'),(111,'GOV','ADDICTION','Type','','','','','',''),(112,'GOV','ADDICTION','Compulsion','','','','','',''),(113,'GOV','ADDICTION','Result','','','','','',''),(114,'GOV','BLOOD_SYSTEM','ALL','','ALL','','ALL','','ALL'),(115,'GOV','BLOOD_SYSTEM','Component','','','','','',''),(116,'GOV','BLOOD_SYSTEM','Movement','','','','','',''),(117,'GOV','GOAL_DIRECTED','ALL','','ALL','','ALL','','ALL'),(118,'GOV','GOAL_DIRECTED','Type','','','','','',''),(119,'GOV','GOAL_DIRECTED','Risk','','','','','',''),(120,'GOV','GOAL_DIRECTED','Obstacles','','','','','',''),(121,'GOV','ENERGY','ALL','','ALL','','ALL','','ALL'),(122,'GOV','ENERGY','Type','','','','','',''),(123,'GOV','ENERGY','Result','','','','','',''),(124,'GOV','HUMAN_BODY','ALL','','ALL','','ALL','','ALL'),(125,'GOV','HUMAN_BODY','Component','','','','','',''),(126,'GOV','PARASITE','ALL','','ALL','','ALL','','ALL'),(127,'GOV','PARASITE','Destructive_Being','','','','','',''),(128,'GOV','PARASITE','Action','','','','','',''),(129,'GOV','MONSTER','ALL','','ALL','','ALL','','ALL'),(130,'GOV','MONSTER','Type','','','','','',''),(131,'GOV','MONSTER','Action','','','','','',''),(132,'GOV','FORCEFUL_EXTRACTION','ALL','','ALL','','ALL','','ALL'),(133,'GOV','FORCEFUL_EXTRACTION','Type','','','','','',''),(134,'GOV','MOVEMENT','ALL','','ALL','','ALL','','ALL'),(135,'GOV','MOVEMENT','Movement','','','','','',''),(136,'GOV','GEOGRAPHIC_FEATURE','ALL','','ALL','','ALL','','ALL'),(137,'GOV','GEOGRAPHIC_FEATURE','Type','','','','','',''),(138,'GOV','SCHISM','ALL','','ALL','','ALL','','ALL'),(139,'GOV','SCHISM','Type','','','','','',''),(140,'GOV','SCHISM','Distances','','','','','',''),(141,'GOV','A_GOD','ALL','','ALL','','ALL','','ALL'),(142,'GOV','A_GOD','Type','','','','','',''),(143,'GOV','A_GOD','Veneration','','','','','',''),(144,'GOV','A_RIGHT','ALL','','ALL','','ALL','','ALL'),(145,'GOV','A_RIGHT','Type','','','','','',''),(146,'GOV','MORAL_DUTY','ALL','','ALL','','ALL','','ALL'),(147,'GOV','MORAL_DUTY','Remuneration','','','','','',''),(148,'GOV','ANIMAL','ALL','','ALL','','ALL','','ALL'),(149,'GOV','ANIMAL','Type','','','','','',''),(150,'GOV','ANIMAL','Action','','','','','',''),(151,'GOV','ANIMAL','Component','','','','','',''),(152,'GOV','ANIMAL','Function','','','','','',''),(153,'GOV','MACHINE','ALL','','ALL','','ALL','','ALL'),(154,'GOV','MACHINE','Type','','','','','',''),(155,'GOV','MACHINE','Parts','','','','','',''),(156,'GOV','MACHINE','Function','','','','','',''),(157,'GOV','GAME','ALL','','ALL','','ALL','','ALL'),(158,'GOV','GAME','Type','','','','','',''),(159,'GOV','GAME','Components','','','','','',''),(160,'GOV','GAME','Actions','','','','','',''),(161,'GOV','GAME','Outcomes','','','','','',''),(162,'GOV','CROP','ALL','','ALL','','ALL','','ALL'),(163,'GOV','CROP','Planting','','','','','',''),(164,'GOV','CROP','Cultivation','','','','','',''),(165,'GOV','CROP','Outcome','','','','','',''),(166,'GOV','PLANT','ALL','','ALL','','ALL','','ALL'),(167,'GOV','PLANT','Types','','','','','',''),(168,'GOV','PLANT','Part','','','','','',''),(169,'GOV','PLANT','Change_of_State','','','','','',''),(170,'GOV','DESTROYER','ALL','','ALL','','ALL','','ALL'),(171,'GOV','DESTROYER','Destructive_Force','','','','','',''),(172,'GOV','ENABLER','ALL','','ALL','','ALL','','ALL'),(173,'GOV','ENABLER','Lubricant','','','','','',''),(174,'GOV','ACCIDENT','ALL','','ALL','','ALL','','ALL'),(175,'GOV','IMPURITY','ALL','','ALL','','ALL','','ALL');
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
  `target_owner` varchar(45) NOT NULL,
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
INSERT INTO `target_concept` VALUES (1,1,'GOV','ROOT','ROOT','ROOT','ROOT'),(2,1,'GOV','ECONOMIC_INEQUALITY','','',''),(3,2,'GOV','POVERTY','','',''),(4,2,'GOV','TAXATION','','',''),(5,2,'GOV','WEALTH_AND_SOCIAL_CLASS','','',''),(6,2,'GOV','ACCESS_TO_EDUCATION','','',''),(7,3,'GOV','THE_POOR','','',''),(8,4,'GOV','TAXES','','',''),(9,5,'GOV','THE_RICH','','',''),(10,5,'GOV','WEALTH','','',''),(11,5,'GOV','MONEY','','',''),(12,5,'GOV','DEBT','','',''),(13,5,'GOV','SOCIAL_CLASS','','',''),(14,5,'GOV','THE_MIDDLE_CLASS','','',''),(15,6,'GOV','EDUCATION','','',''),(16,1,'GOV','GOVERNANCE','','',''),(17,16,'GOV','BUREAUCRACY','','',''),(18,16,'GOV','REGULATIONS','','',''),(19,16,'GOV','GOVERNMENT','','',''),(20,16,'GOV','LEADERS','','',''),(21,16,'GOV','POLITICS','','',''),(22,16,'GOV','POLITICIANS','','',''),(23,16,'GOV','LEGISLATION','','',''),(24,16,'GOV','THE_LAW','','','');
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

-- Dump completed on 2013-09-09  8:14:44
