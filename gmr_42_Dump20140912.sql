-- MySQL dump 10.13  Distrib 5.6.20, for Win64 (x86_64)
--
-- Host: localhost    Database: gmr_42
-- ------------------------------------------------------
-- Server version	5.6.20

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
  `schema_version` decimal(3,2) NOT NULL DEFAULT '4.20',
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
-- Table structure for table `case`
--

DROP TABLE IF EXISTS `case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case`
--

LOCK TABLES `case` WRITE;
/*!40000 ALTER TABLE `case` DISABLE KEYS */;
INSERT INTO `case` VALUES (1,'GENERAL','A placeholder used with non case specific LMs and CMs.'),(2,'GUN_OVERSIGHT','The US national debate on guns is a cultural debate about the proper balance between the rights of the individual citizen and the needs of the majority as represented by the Federal Government.');
/*!40000 ALTER TABLE `case` ENABLE KEYS */;
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
  `cm_source_id` int(11) NOT NULL,
  `protagonist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `cm_source_idx` (`cm_source_id`),
  KEY `protagonist_idx` (`protagonist_id`),
  CONSTRAINT `cm_source_cm` FOREIGN KEY (`cm_source_id`) REFERENCES `cm_source` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `protagonist_cm` FOREIGN KEY (`protagonist_id`) REFERENCES `protagonist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `cm2cm_target_case`
--

DROP TABLE IF EXISTS `cm2cm_target_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm2cm_target_case` (
  `cm_id` int(11) NOT NULL,
  `cm_target_case_id` int(11) NOT NULL,
  PRIMARY KEY (`cm_id`,`cm_target_case_id`),
  KEY `cm_target_case_idx` (`cm_target_case_id`),
  CONSTRAINT `cm_case` FOREIGN KEY (`cm_id`) REFERENCES `cm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cm_target_case` FOREIGN KEY (`cm_target_case_id`) REFERENCES `cm_target_case` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm2cm_target_case`
--

LOCK TABLES `cm2cm_target_case` WRITE;
/*!40000 ALTER TABLE `cm2cm_target_case` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm2cm_target_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm2cm_target_general`
--

DROP TABLE IF EXISTS `cm2cm_target_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm2cm_target_general` (
  `cm_id` int(11) NOT NULL,
  `cm_target_general_id` int(11) NOT NULL,
  PRIMARY KEY (`cm_id`,`cm_target_general_id`),
  KEY `cm_target_general_idx` (`cm_target_general_id`),
  CONSTRAINT `cm_general` FOREIGN KEY (`cm_id`) REFERENCES `cm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cm_target_general` FOREIGN KEY (`cm_target_general_id`) REFERENCES `cm_target_general` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm2cm_target_general`
--

LOCK TABLES `cm2cm_target_general` WRITE;
/*!40000 ALTER TABLE `cm2cm_target_general` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm2cm_target_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_property`
--

DROP TABLE IF EXISTS `cm_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cm_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `cm_property_idx` (`cm_id`),
  CONSTRAINT `cm_property` FOREIGN KEY (`cm_id`) REFERENCES `cm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_property`
--

LOCK TABLES `cm_property` WRITE;
/*!40000 ALTER TABLE `cm_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_property` ENABLE KEYS */;
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
  `source_definition` text NOT NULL,
  `source_family` varchar(45) DEFAULT NULL,
  `source_name_es` varchar(45) DEFAULT NULL,
  `source_name_fa` varchar(45) DEFAULT NULL,
  `source_name_ru` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_source`
--

LOCK TABLES `cm_source` WRITE;
/*!40000 ALTER TABLE `cm_source` DISABLE KEYS */;
INSERT INTO `cm_source` VALUES (1,'GOV','A_GOD','A supreme being; to regard or treat as a god; deify; idolize. ',NULL,NULL,NULL,NULL),(2,'GOV','A_RIGHT','That which is due to anyone by just claim, legal guarantees, moral principles, etc.',NULL,NULL,NULL,NULL),(3,'GOV','ABYSS','A deep, immeasurable space, gulf, or cavity; vast chasm; anything profound, unfathomable, or infinite.',NULL,NULL,NULL,NULL),(4,'GOV','ACCIDENT','An unforeseen and unplanned event or circumstance. ',NULL,NULL,NULL,NULL),(5,'GOV','ADDICTION','The state of being enslaved to a habit or practice or to something that is psychologically or physically habit-forming, as narcotics, to such an extent that its cessation causes severe trauma. ',NULL,NULL,NULL,NULL),(6,'GOV','ANIMAL','Any such living thing other than a human being.',NULL,NULL,NULL,NULL),(7,'GOV','BACKWARD_MOVEMENT','Movement to or toward what is behind.',NULL,NULL,NULL,NULL),(8,'GOV','BARRIER','Anything used or acting to block someone from going somewhere or from doing something, or to block something from happening.',NULL,NULL,NULL,NULL),(9,'GOV','BLOOD_STREAM','The flowing blood in a circulatory system; a mainstream of power or vitality.',NULL,NULL,NULL,NULL),(10,'GOV','BODY_OF_WATER','The part of the earth\'s surface covered with water (such as a river or lake or ocean).',NULL,NULL,NULL,NULL),(11,'GOV','BUILDING','A relatively permanent enclosed construction over a plot of land, having a roof and usually windows and often more than one level; anything built or constructed.',NULL,NULL,NULL,NULL),(12,'GOV','BUSINESS','The activity of making, buying, or selling goods or providing services in exchange for money.',NULL,NULL,NULL,NULL),(13,'GOV','CLOTHING','The things that people wear to cover their bodies.',NULL,NULL,NULL,NULL),(14,'GOV','COMPETITION','Rivalry between two or more persons or groups for an object',NULL,NULL,NULL,NULL),(15,'GOV','CONFINEMENT','To enclose within bounds; limit or restrict; to shut or keep in; prevent from leaving a place.',NULL,NULL,NULL,NULL),(16,'GOV','CONTAINER','An object (such as a box or can) that can hold something; a receptacle (as a box or jar) for holding goods.',NULL,NULL,NULL,NULL),(17,'GOV','CONTAMINATION','To make something less pure or make it poisonous; make (something) impure by exposure to or addition of a poisonous or polluting substance.',NULL,NULL,NULL,NULL),(18,'GOV','CRIME','Any unlawful offense, serious wrongdoing.',NULL,NULL,NULL,NULL),(19,'GOV','CROP','The cultivated produce of the ground, while growing or when gathered; the yield of such produce for a particular season; cultivated plant that is grown.',NULL,NULL,NULL,NULL),(20,'GOV','DARKNESS','With little or no light, or having little brightness; the partial or total absence of light.',NULL,NULL,NULL,NULL),(21,'GOV','DISEASE','A disordered or incorrectly functioning organ, part, structure, or system of the body resulting from the effect of genetic or developmental errors, infection, poisons, nutritional deficiency or imbalance, toxicity, or unfavorable environmental factors; illness; sickness; ailment.',NULL,NULL,NULL,NULL),(22,'GOV','DOWNWARD_MOVEMENT','Movement from a higher place or level to a lower place or level.',NULL,NULL,NULL,NULL),(23,'GOV','EMOTION_EXPERIENCER','A conscious mental reaction (as anger or fear) subjectively experienced as strong feeling usually directed toward a specific object and typically accompanied by physiological and behavioral changes in the body.',NULL,NULL,NULL,NULL),(24,'GOV','ENERGY','A capacity to perform work (such as causing motion).',NULL,NULL,NULL,NULL),(25,'GOV','ENSLAVEMENT','To make a slave of; reduce to slavery; control, dominate.',NULL,NULL,NULL,NULL),(26,'GOV','FABRIC','Woven or knitted material; the basic structure of something.',NULL,NULL,NULL,NULL),(27,'GOV','FACTORY','A building or group of buildings where products are made..',NULL,NULL,NULL,NULL),(28,'GOV','FAMILY','A group of people who are related to each other.',NULL,NULL,NULL,NULL),(29,'GOV','FIRE','The light and heat and especially the flame produced by burning.',NULL,NULL,NULL,NULL),(30,'GOV','FOOD','Any nourishing substance that is eaten, drunk, or otherwise taken into the body to sustain life, provide energy, promote growth, etc. ',NULL,NULL,NULL,NULL),(31,'GOV','FORCEFUL_EXTRACTION','To get, pull, or draw out, usually with special effort, skill, or force.',NULL,NULL,NULL,NULL),(32,'GOV','FORWARD_MOVEMENT','Movement to or toward what is in front.',NULL,NULL,NULL,NULL),(33,'GOV','GAME','A competitive activity involving skill, chance, or endurance on the part of two or more persons who play according to a set of rules, usually for their own amusement or for that of spectators. ',NULL,NULL,NULL,NULL),(34,'GOV','HAZARDOUS_GEOGRAPHIC_FEATURE','Potentially dangerous topographical aspects of the earth.',NULL,NULL,NULL,NULL),(35,'GOV','HIGH_LOCATION','Situated or passing above the normal level, surface, base of measurement, or elevation; located far above the ground or another surface.',NULL,NULL,NULL,NULL),(36,'GOV','HUMAN_BODY','The entire physical structure of a human being.',NULL,NULL,NULL,NULL),(37,'GOV','JOURNEY','An act or instance of traveling from one place to another.',NULL,NULL,NULL,NULL),(38,'GOV','LEADER','A person who manages or controls other people, esp. because of his or her ability or position.',NULL,NULL,NULL,NULL),(39,'GOV','LIFE_STAGE','One of the series of stages through which a living thing passes from the beginning of its life until its death.',NULL,NULL,NULL,NULL),(40,'GOV','LIGHT','The natural agent that stimulates sight and makes things visible; source of illumination.',NULL,NULL,NULL,NULL),(41,'GOV','LOW_LOCATION','Situated or passing below the normal level, surface, or base of measurement; marking a nadir or bottom; not located far above the ground or another surface.',NULL,NULL,NULL,NULL),(42,'GOV','MACHINE','An apparatus consisting of interrelated parts with separate functions, used in the performance of some kind of work.',NULL,NULL,NULL,NULL),(43,'GOV','MAZE','A confusing network of intercommunicating paths or passages; labyrinth; any complex system or arrangement that causes bewilderment, confusion, or perplexity.',NULL,NULL,NULL,NULL),(44,'GOV','MEDICINE','Any substance or substances used in treating disease or illness; medicament; remedy.',NULL,NULL,NULL,NULL),(45,'GOV','MONSTER','A legendary animal combining features of animal and human form or having the forms of various animals in combination; any creature so ugly or monstrous as to frighten people; any animal or human grotesquely deviating from the normal shape, behavior, or character.',NULL,NULL,NULL,NULL),(46,'GOV','MORAL_DUTY','Something that you must do because it is morally right.',NULL,NULL,NULL,NULL),(47,'GOV','MOVEMENT','To pass from one place or position to another.',NULL,NULL,NULL,NULL),(48,'GOV','NATURAL_PHYSICAL_FORCE','Uncontrollable force of nature that poses potential harm; [nature:  all the animals and plants in the world and all the features, forces, and processes that exist or happen independently of people, such as the weather, the sea, mountains, reproduction, and growth]; circumstances beyond one\'s control; a any event or force of nature that has catastrophic consequences, such as avalanche, earthquake, flood, forest fire, hurricane, lightning, tornado, tsunami, and volcanic eruption.',NULL,NULL,NULL,NULL),(49,'GOV','OBESITY','A condition characterized by the excessive accumulation and storage of fat in the body; Excessive body fat. It is usually caused by sedentary habits and a diet high in fat, alcohol, or total calories.',NULL,NULL,NULL,NULL),(50,'GOV','PARASITE','An animal or plant that lives in or on another animal or plant and gets food or protection from it;  person or thing that takes something from someone or something else and does not do anything to earn it or deserve it.',NULL,NULL,NULL,NULL),(51,'GOV','PATHWAY','A path, course, route, or way; a route to or way of access to; way of reaching or achieving something .',NULL,NULL,NULL,NULL),(52,'GOV','PHYSICAL_BURDEN','That which is borne with difficulty.',NULL,NULL,NULL,NULL),(53,'GOV','PHYSICAL_HARM','Physical injury or damage.',NULL,NULL,NULL,NULL),(54,'GOV','PHYSICAL_LOCATION','A place of settlement, activity, or residence; a place or situation occupied.',NULL,NULL,NULL,NULL),(55,'GOV','PLANT_','A living thing that usually produces seeds and typically has a stem, leaves, branches, roots, and sometimes flowers.',NULL,NULL,NULL,NULL),(56,'GOV','PORTAL','A door, gate, or entrance, especially one of imposing appearance.',NULL,NULL,NULL,NULL),(57,'GOV','PROTECTION','Something that prevents somebody or something from being harmed or damaged; the act of preventing somebody or something from being harmed or damaged, or the state of being kept safe.',NULL,NULL,NULL,NULL),(58,'GOV','RESOURCE','A place or thing that provides something useful.',NULL,NULL,NULL,NULL),(59,'GOV','RULE_ENFORCER','A person or entity that controls (something) by making sure that rules and regulations are being followed.',NULL,NULL,NULL,NULL),(60,'GOV','SCIENCE','Knowledge about or study of the natural world based on facts learned through experiments and observation.',NULL,NULL,NULL,NULL),(61,'GOV','SERVANT','One that serves others; especially, one that performs duties about the person or home of a master or personal employer.',NULL,NULL,NULL,NULL),(62,'GOV','STRUGGLE','To contend with an adversary or opposing force.',NULL,NULL,NULL,NULL),(63,'GOV','TEMPERATURE','A measurement that indicates how hot or cold something is; a measurement in degrees showing the heat of something (such as air or water).',NULL,NULL,NULL,NULL),(64,'GOV','THEFT','The felonious taking and removing of personal property with intent to deprive the rightful owner of it.',NULL,NULL,NULL,NULL),(65,'GOV','UPWARD_MOVEMENT','Movement from a lower place or level to a higher place or level.',NULL,NULL,NULL,NULL),(66,'GOV','VEHICLE','Something used to transport people or goods, esp. something used on land or roads.',NULL,NULL,NULL,NULL),(67,'GOV','WAR','A conflict carried on by force of arms, as between nations or between parties within a nation; warfare, as by land, sea, or air; a contest carried on by force of arms, as in a series of battles or campaigns.',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cm_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_target_case`
--

DROP TABLE IF EXISTS `cm_target_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_target_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_owner` enum('GOV','ALB','ICSI','USC') NOT NULL,
  `target_concept` varchar(45) NOT NULL,
  `case_concept` enum('GUN_OVERSIGHT') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_target_case`
--

LOCK TABLES `cm_target_case` WRITE;
/*!40000 ALTER TABLE `cm_target_case` DISABLE KEYS */;
INSERT INTO `cm_target_case` VALUES (1,'GOV','GUNS','GUN_OVERSIGHT'),(2,'GOV','CONTROL_OF_GUNS','GUN_OVERSIGHT'),(3,'GOV','GUN_RIGHTS','GUN_OVERSIGHT');
/*!40000 ALTER TABLE `cm_target_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_target_general`
--

DROP TABLE IF EXISTS `cm_target_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_target_general` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_owner` enum('GOV','ALB','ICSI','USC') NOT NULL,
  `target_concept` varchar(45) NOT NULL,
  `cultural_concept` enum('GOVERNANCE','ECONOMIC_INEQUALITY','DEMOCRACY') NOT NULL,
  `target_name_es` varchar(45) DEFAULT NULL,
  `target_name_fa` varchar(45) DEFAULT NULL,
  `target_name_ru` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_target_general`
--

LOCK TABLES `cm_target_general` WRITE;
/*!40000 ALTER TABLE `cm_target_general` DISABLE KEYS */;
INSERT INTO `cm_target_general` VALUES (1,'GOV','BUREAUCRACY','GOVERNANCE',NULL,NULL,NULL),(2,'GOV','GOVERNMENT','GOVERNANCE',NULL,NULL,NULL),(3,'GOV','POVERTY','ECONOMIC_INEQUALITY',NULL,NULL,NULL),(4,'GOV','TAXATION','ECONOMIC_INEQUALITY',NULL,NULL,NULL),(5,'GOV','WEALTH','ECONOMIC_INEQUALITY',NULL,NULL,NULL),(6,'GOV','DEMOCRACY','DEMOCRACY',NULL,NULL,NULL),(7,'GOV','ELECTIONS','DEMOCRACY',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cm_target_general` ENABLE KEYS */;
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
  `lm_source_lemma` varchar(45) NOT NULL,
  `lm_sentence_id` int(11) NOT NULL,
  `protagonist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `protagonist_idx` (`protagonist_id`),
  KEY `lm_sentence` (`lm_sentence_id`),
  CONSTRAINT `lm_sentence` FOREIGN KEY (`lm_sentence_id`) REFERENCES `lm_sentence` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `protagonist_lm` FOREIGN KEY (`protagonist_id`) REFERENCES `protagonist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `confidence` enum('HIGH','MEDIUM','LOW') NOT NULL DEFAULT 'HIGH',
  PRIMARY KEY (`lm_id`,`cm_source_id`),
  KEY `lm_idx` (`lm_id`),
  KEY `cm_source_idx` (`cm_source_id`),
  CONSTRAINT `cm_source` FOREIGN KEY (`cm_source_id`) REFERENCES `cm_source` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lm` FOREIGN KEY (`lm_id`) REFERENCES `lm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `lm2cm_target_case`
--

DROP TABLE IF EXISTS `lm2cm_target_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm2cm_target_case` (
  `lm_id` int(11) NOT NULL,
  `cm_target_case_id` int(11) NOT NULL,
  PRIMARY KEY (`lm_id`,`cm_target_case_id`),
  KEY `target_case_idx` (`cm_target_case_id`),
  CONSTRAINT `lm_case` FOREIGN KEY (`lm_id`) REFERENCES `lm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `target_case` FOREIGN KEY (`cm_target_case_id`) REFERENCES `cm_target_case` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm2cm_target_case`
--

LOCK TABLES `lm2cm_target_case` WRITE;
/*!40000 ALTER TABLE `lm2cm_target_case` DISABLE KEYS */;
/*!40000 ALTER TABLE `lm2cm_target_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lm2cm_target_general`
--

DROP TABLE IF EXISTS `lm2cm_target_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm2cm_target_general` (
  `lm_id` int(11) NOT NULL,
  `cm_target_general_id` int(11) NOT NULL,
  PRIMARY KEY (`cm_target_general_id`,`lm_id`),
  KEY `lm_general_idx` (`lm_id`),
  CONSTRAINT `lm_general` FOREIGN KEY (`lm_id`) REFERENCES `lm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `target_general` FOREIGN KEY (`cm_target_general_id`) REFERENCES `cm_target_general` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm2cm_target_general`
--

LOCK TABLES `lm2cm_target_general` WRITE;
/*!40000 ALTER TABLE `lm2cm_target_general` DISABLE KEYS */;
/*!40000 ALTER TABLE `lm2cm_target_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lm_property`
--

DROP TABLE IF EXISTS `lm_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lm_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `lm_property_idx` (`lm_id`),
  CONSTRAINT `lm_property` FOREIGN KEY (`lm_id`) REFERENCES `lm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm_property`
--

LOCK TABLES `lm_property` WRITE;
/*!40000 ALTER TABLE `lm_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `lm_property` ENABLE KEYS */;
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
  `doc_date` date NOT NULL,
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

--
-- Table structure for table `protagonist`
--

DROP TABLE IF EXISTS `protagonist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protagonist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` mediumtext NOT NULL,
  `case_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `case_idx` (`case_id`),
  CONSTRAINT `case` FOREIGN KEY (`case_id`) REFERENCES `case` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protagonist`
--

LOCK TABLES `protagonist` WRITE;
/*!40000 ALTER TABLE `protagonist` DISABLE KEYS */;
INSERT INTO `protagonist` VALUES (1,'GENERAL','A dummy used with non case specific LMs and CMs.',1),(2,'INDIVIDUAL_OVERSIGHT','Those in favor of individual oversight.',2),(3,'GOVERNMENT_OVERSIGHT','Those in favor of Federal Government oversight.',2);
/*!40000 ALTER TABLE `protagonist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-14  8:49:12
