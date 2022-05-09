-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (arm64)
--
-- Host: localhost    Database: salaryShareFinalProj
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `COMPANY`
--

DROP TABLE IF EXISTS `COMPANY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `COMPANY` (
  `COMPANY_NAME` varchar(60) NOT NULL,
  `COMPANY_STANDING` text,
  `COMPANY_COUNTRY` varchar(50) NOT NULL,
  `COMPANY_STATE` varchar(50) NOT NULL,
  `COMPANY_FIELD` varchar(50) NOT NULL,
  PRIMARY KEY (`COMPANY_NAME`,`COMPANY_STATE`,`COMPANY_COUNTRY`),
  KEY `COMPANY_COUNTRY` (`COMPANY_COUNTRY`,`COMPANY_STATE`),
  KEY `COMPANY_FIELD` (`COMPANY_FIELD`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`COMPANY_COUNTRY`, `COMPANY_STATE`) REFERENCES `LOCATION` (`COUNTRY`, `STATE`),
  CONSTRAINT `company_ibfk_2` FOREIGN KEY (`COMPANY_FIELD`) REFERENCES `FIELD` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPANY`
--

LOCK TABLES `COMPANY` WRITE;
/*!40000 ALTER TABLE `COMPANY` DISABLE KEYS */;
INSERT INTO `COMPANY` VALUES ('ABC Pizzas',NULL,'Canada','Alberta','Hospitality'),('Amazon','Corporate','United States','Washington State','Technology'),('Apple','Corporate','United States','California','Technology'),('Best Burgers',NULL,'Canada','British Columbia','Hospitality'),('Fixerupper Hospital','Private','United States','New York','Medicine'),('Google','Corporate','United States','California','Technology'),('IBM','Corporate','United States','Georgia','Technology'),('Krispy Krabs',NULL,'United States','Alabama','Hospitality'),('Mayo Clinic','Private','United States','Washington DC','Medicine'),('Meta','Corporate','United States','California','Technology'),('Netflix','Corporate','United States','California','Technology'),('Nice Nachos',NULL,'United States','Alabama','Hospitality'),('Sizzling Steak',NULL,'United States','Alabama','Hospitality'),('Sunshine Hospital','Government','United States','Hawaii','Medicine'),('Washington Hospital','Government','United States','California','Medicine'),('Wicked Waffles',NULL,'United States','Florida','Hospitality');
/*!40000 ALTER TABLE `COMPANY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FIELD`
--

DROP TABLE IF EXISTS `FIELD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `FIELD` (
  `NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`NAME`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIELD`
--

LOCK TABLES `FIELD` WRITE;
/*!40000 ALTER TABLE `FIELD` DISABLE KEYS */;
INSERT INTO `FIELD` VALUES ('Business'),('Construction'),('Education'),('Engineering'),('Hospitality'),('Medicine'),('Military'),('Technology');
/*!40000 ALTER TABLE `FIELD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JOB`
--

DROP TABLE IF EXISTS `JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `JOB` (
  `JOB_ID` int NOT NULL AUTO_INCREMENT,
  `JOB_NAME` varchar(50) NOT NULL,
  `JOB_LEVEL` varchar(50) DEFAULT NULL,
  `JOB_COMMITMENT` varchar(50) DEFAULT NULL,
  `JOB_SHIFT_TIME` varchar(50) DEFAULT NULL,
  `JOB_LOCATION_TYPE` varchar(50) DEFAULT NULL,
  `JOB_FIELD` varchar(50) NOT NULL,
  PRIMARY KEY (`JOB_ID`),
  UNIQUE KEY `JOB_ID` (`JOB_ID`),
  KEY `JOB_FIELD` (`JOB_FIELD`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`JOB_FIELD`) REFERENCES `FIELD` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOB`
--

LOCK TABLES `JOB` WRITE;
/*!40000 ALTER TABLE `JOB` DISABLE KEYS */;
INSERT INTO `JOB` VALUES (1,'Software Developer','Tech Lead','Full-time','Day','On-site','Technology'),(2,'Software Developer','Senior','Full-time','Day','On-site','Technology'),(3,'Software Developer','Staff','Full-time','Day','On-site','Technology'),(4,'Software Developer','Junior','Full-time','Day','On-site','Technology'),(5,'Product Manager','Manager','Full-time','Day','On-site','Technology'),(6,'Systems Architect','Senior','Full-time','Day','On-site','Technology'),(7,'Quality Engineer','Junior','Full-time','Day','On-site','Technology'),(8,'CEO',NULL,'Full-time',NULL,'On-site','Technology'),(9,'Family Physician',NULL,'Full-time','Night','On-site','Medicine'),(10,'Nurse','Senior','Full-time','Night','On-site','Medicine'),(11,'Nurse','Junior','Part-time','Night','On-site','Medicine'),(12,'Nurse','Senior','Full-time','Day','On-site','Medicine'),(13,'Nurse','Junior','Part-time','Day','On-site','Medicine'),(14,'Administrator',NULL,'Full-time','Day','On-site','Medicine'),(15,'Administrator',NULL,'Full-time','Night','On-site','Medicine'),(16,'Waiter','Entry','Part-time','Day','On-site','Hospitality'),(17,'Waiter',NULL,'Full-time','Day','On-site','Hospitality'),(18,'Chef',NULL,'Part-time','Day','On-site','Hospitality'),(19,'Chef',NULL,'Full-time','Day','On-site','Hospitality'),(20,'Manager',NULL,'Part-time','Day','On-site','Hospitality'),(21,'Manager',NULL,'Full-time','Day','On-site','Hospitality'),(22,'Owner',NULL,'Full-time','Day','On-site','Hospitality'),(23,'Human Resource',NULL,'Full-time','Day','On-site','Business');
/*!40000 ALTER TABLE `JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOCATION`
--

DROP TABLE IF EXISTS `LOCATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `LOCATION` (
  `COUNTRY` varchar(50) NOT NULL,
  `STATE` varchar(50) NOT NULL,
  PRIMARY KEY (`COUNTRY`,`STATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOCATION`
--

LOCK TABLES `LOCATION` WRITE;
/*!40000 ALTER TABLE `LOCATION` DISABLE KEYS */;
INSERT INTO `LOCATION` VALUES ('Canada','Alberta'),('Canada','British Columbia'),('Canada','Manitoba'),('Canada','Ontario'),('Canada','Quebec'),('United States','Alabama'),('United States','Alaska'),('United States','California'),('United States','Florida'),('United States','Georgia'),('United States','Hawaii'),('United States','New York'),('United States','Washington DC'),('United States','Washington State');
/*!40000 ALTER TABLE `LOCATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTRY`
--

DROP TABLE IF EXISTS `USER_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `USER_ENTRY` (
  `ENTRY_ID` int NOT NULL AUTO_INCREMENT,
  `USER_INPUT_ID` int NOT NULL,
  PRIMARY KEY (`ENTRY_ID`),
  UNIQUE KEY `ENTRY_ID` (`ENTRY_ID`),
  KEY `USER_INPUT_ID` (`USER_INPUT_ID`),
  CONSTRAINT `user_entry_ibfk_1` FOREIGN KEY (`USER_INPUT_ID`) REFERENCES `USER_INPUT` (`INPUT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTRY`
--

LOCK TABLES `USER_ENTRY` WRITE;
/*!40000 ALTER TABLE `USER_ENTRY` DISABLE KEYS */;
INSERT INTO `USER_ENTRY` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60),(61,61),(62,62),(63,63),(64,64),(65,65),(66,66),(67,67),(68,68),(69,69),(70,70),(71,71),(72,72),(73,73),(74,74),(75,75),(76,76),(77,77),(78,78),(79,79),(80,80),(81,81),(82,82),(83,83),(84,84),(85,85),(86,86),(87,87),(88,88),(89,89),(90,90),(91,91),(92,92),(93,93),(94,94),(95,95),(96,96),(97,97),(98,98),(99,99),(100,100),(101,101),(102,102),(103,103),(104,104),(105,105),(106,106),(107,107),(108,108),(109,109),(110,110),(111,111),(112,112),(113,113),(114,114),(115,115),(116,116),(117,117),(118,118),(119,119),(120,120),(121,121),(122,122),(123,123),(124,124),(125,125),(126,126),(127,127),(128,128),(129,129),(130,130),(131,131),(132,132),(133,133),(134,134),(135,135),(136,136),(137,137),(138,138),(139,139),(140,140),(141,141),(142,142),(143,142),(144,142),(145,142);
/*!40000 ALTER TABLE `USER_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_INPUT`
--

DROP TABLE IF EXISTS `USER_INPUT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `USER_INPUT` (
  `INPUT_ID` int NOT NULL AUTO_INCREMENT,
  `YEARS_WORKING` int NOT NULL,
  `YEARS_AT_COMPANY` int NOT NULL,
  `SALARY` int NOT NULL,
  `NEGOTIATED` varchar(3) DEFAULT NULL,
  `USER_JOB_ID` int NOT NULL,
  `USER_COUNTRY` varchar(50) NOT NULL,
  `USER_STATE` varchar(50) NOT NULL,
  `USER_COMPANY_NAME` varchar(50) NOT NULL,
  `USER_COMPANY_COUNTRY` varchar(50) NOT NULL,
  `USER_COMPANY_STATE` varchar(50) NOT NULL,
  PRIMARY KEY (`INPUT_ID`),
  UNIQUE KEY `INPUT_ID` (`INPUT_ID`),
  UNIQUE KEY `Unique_user_input` (`YEARS_WORKING`,`YEARS_AT_COMPANY`,`SALARY`,`NEGOTIATED`,`USER_JOB_ID`,`USER_COUNTRY`,`USER_STATE`,`USER_COMPANY_NAME`,`USER_COMPANY_STATE`,`USER_COMPANY_COUNTRY`),
  KEY `USER_COUNTRY` (`USER_COUNTRY`,`USER_STATE`),
  KEY `USER_JOB_ID` (`USER_JOB_ID`),
  KEY `USER_COMPANY_NAME` (`USER_COMPANY_NAME`,`USER_COMPANY_STATE`,`USER_COMPANY_COUNTRY`),
  CONSTRAINT `user_input_ibfk_1` FOREIGN KEY (`USER_COUNTRY`, `USER_STATE`) REFERENCES `LOCATION` (`COUNTRY`, `STATE`),
  CONSTRAINT `user_input_ibfk_2` FOREIGN KEY (`USER_JOB_ID`) REFERENCES `JOB` (`JOB_ID`),
  CONSTRAINT `user_input_ibfk_3` FOREIGN KEY (`USER_COMPANY_NAME`, `USER_COMPANY_STATE`, `USER_COMPANY_COUNTRY`) REFERENCES `COMPANY` (`COMPANY_NAME`, `COMPANY_STATE`, `COMPANY_COUNTRY`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_INPUT`
--

LOCK TABLES `USER_INPUT` WRITE;
/*!40000 ALTER TABLE `USER_INPUT` DISABLE KEYS */;
INSERT INTO `USER_INPUT` VALUES (3,1,1,13000,NULL,16,'Canada','British Columbia','Best Burgers','Canada','British Columbia'),(4,1,1,14000,NULL,16,'United States','Florida','Wicked Waffles','United States','Florida'),(8,1,1,26000,NULL,17,'Canada','British Columbia','Best Burgers','Canada','British Columbia'),(23,1,1,29000,NULL,20,'Canada','British Columbia','Best Burgers','Canada','British Columbia'),(14,1,1,30000,NULL,18,'United States','Florida','Wicked Waffles','United States','Florida'),(24,1,1,30000,NULL,20,'United States','Florida','Wicked Waffles','United States','Florida'),(13,1,1,32000,NULL,18,'Canada','British Columbia','Best Burgers','Canada','British Columbia'),(18,1,1,37000,NULL,19,'Canada','British Columbia','Best Burgers','Canada','British Columbia'),(28,1,1,47000,NULL,21,'Canada','British Columbia','Best Burgers','Canada','British Columbia'),(32,1,1,66000,NULL,22,'Canada','British Columbia','Best Burgers','Canada','British Columbia'),(39,1,1,88000,'No',23,'United States','California','Meta','United States','California'),(9,2,1,28000,NULL,17,'United States','Florida','Wicked Waffles','United States','Florida'),(19,2,1,42000,NULL,19,'United States','Florida','Wicked Waffles','United States','Florida'),(40,2,1,45000,'Yes',23,'United States','Alabama','Meta','United States','California'),(29,2,1,48500,NULL,21,'United States','Florida','Wicked Waffles','United States','Florida'),(33,2,1,68000,NULL,22,'United States','Florida','Wicked Waffles','United States','Florida'),(5,2,2,10000,NULL,16,'United States','Alabama','Sizzling Steak','United States','Alabama'),(1,2,2,11000,NULL,16,'Canada','Alberta','ABC Pizzas','Canada','Alberta'),(2,2,2,13000,NULL,16,'Canada','Alberta','ABC Pizzas','Canada','Alberta'),(15,2,2,20000,NULL,18,'United States','Alabama','Sizzling Steak','United States','Alabama'),(25,2,2,20000,NULL,20,'United States','Alabama','Sizzling Steak','United States','Alabama'),(11,2,2,22000,NULL,18,'Canada','Alberta','ABC Pizzas','Canada','Alberta'),(12,2,2,26000,NULL,18,'Canada','Alberta','ABC Pizzas','Canada','Alberta'),(22,2,2,29000,NULL,20,'Canada','Alberta','ABC Pizzas','Canada','Alberta'),(21,2,2,32000,NULL,20,'Canada','Alberta','ABC Pizzas','Canada','Alberta'),(41,3,1,60000,'Yes',23,'United States','New York','Washington Hospital','United States','California'),(67,3,2,150000,NULL,4,'United States','California','Amazon','United States','Washington State'),(79,3,2,200000,NULL,3,'United States','California','Amazon','United States','Washington State'),(55,3,2,250000,NULL,2,'United States','California','Amazon','United States','Washington State'),(42,4,2,62000,'No',23,'United States','New York','Fixerupper Hospital','United States','New York'),(68,4,4,100000,NULL,4,'United States','California','Meta','United States','California'),(80,4,4,150000,NULL,3,'United States','California','Meta','United States','California'),(56,4,4,200000,NULL,2,'United States','California','Meta','United States','California'),(6,5,3,22000,NULL,17,'Canada','Alberta','ABC Pizzas','Canada','Alberta'),(16,5,3,34000,NULL,19,'Canada','Alberta','ABC Pizzas','Canada','Alberta'),(26,5,3,45000,NULL,21,'Canada','Alberta','ABC Pizzas','Canada','Alberta'),(31,5,3,75000,NULL,22,'Canada','Alberta','ABC Pizzas','Canada','Alberta'),(99,5,3,200000,'No',6,'United States','Florida','Amazon','United States','Washington State'),(106,5,3,230000,'No',7,'United States','Florida','Amazon','United States','Washington State'),(49,5,3,300000,'No',1,'United States','Florida','Amazon','United States','Washington State'),(92,5,3,450000,'No',5,'United States','Florida','Amazon','United States','Washington State'),(38,5,4,72000,'Yes',23,'United States','New York','Amazon','United States','Washington State'),(103,5,5,250000,'Yes',7,'United States','Washington State','Apple','United States','California'),(46,5,5,350000,'Yes',1,'United States','Washington State','Apple','United States','California'),(96,5,5,370000,'Yes',6,'United States','Washington State','Apple','United States','California'),(89,5,5,550000,'Yes',5,'United States','Washington State','Apple','United States','California'),(69,6,3,300000,NULL,4,'United States','California','Meta','United States','California'),(81,6,3,350000,NULL,3,'United States','California','Meta','United States','California'),(57,6,3,400000,NULL,2,'United States','California','Meta','United States','California'),(37,7,2,70000,'Yes',23,'United States','New York','Apple','United States','California'),(105,7,2,200000,'No',7,'United States','Washington State','Amazon','United States','Washington State'),(98,7,2,250000,'No',6,'United States','Washington State','Amazon','United States','Washington State'),(48,7,2,400000,'No',1,'United States','Washington State','Amazon','United States','Washington State'),(91,7,2,500000,'No',5,'United States','Washington State','Amazon','United States','Washington State'),(110,7,2,4000000,NULL,8,'United States','Washington State','Amazon','United States','Washington State'),(7,7,4,26000,NULL,17,'Canada','Alberta','ABC Pizzas','Canada','Alberta'),(17,7,4,36000,NULL,19,'Canada','Alberta','ABC Pizzas','Canada','Alberta'),(27,7,4,42000,NULL,21,'Canada','Alberta','ABC Pizzas','Canada','Alberta'),(43,7,5,66000,'Yes',23,'United States','California','Mayo Clinic','United States','Washington DC'),(70,7,5,100000,NULL,4,'United States','New York','Netflix','United States','California'),(82,7,5,150000,NULL,3,'United States','New York','Netflix','United States','California'),(73,7,5,175000,NULL,4,'United States','New York','Google','United States','California'),(58,7,5,200000,NULL,2,'United States','New York','Netflix','United States','California'),(85,7,5,225000,NULL,3,'United States','New York','Google','United States','California'),(61,7,5,275000,NULL,2,'United States','New York','Google','United States','California'),(107,7,7,150000,'No',7,'United States','California','Amazon','United States','Washington State'),(50,7,7,450000,'No',1,'United States','California','Amazon','United States','Washington State'),(93,7,7,450000,'No',5,'United States','California','Amazon','United States','Washington State'),(100,7,7,450000,'No',6,'United States','California','Amazon','United States','Washington State'),(36,8,3,85000,'No',23,'United States','California','Apple','United States','California'),(74,8,3,90000,NULL,4,'United States','Georgia','IBM','United States','Georgia'),(86,8,3,100000,NULL,3,'United States','Georgia','IBM','United States','Georgia'),(62,8,3,120000,NULL,2,'United States','Georgia','IBM','United States','Georgia'),(75,9,2,88000,NULL,4,'United States','Georgia','IBM','United States','Georgia'),(87,9,2,108000,NULL,3,'United States','Georgia','IBM','United States','Georgia'),(63,9,2,118000,NULL,2,'United States','Georgia','IBM','United States','Georgia'),(72,10,2,100000,NULL,4,'United States','California','Google','United States','California'),(84,10,2,150000,NULL,3,'United States','California','Google','United States','California'),(60,10,2,200000,NULL,2,'United States','California','Google','United States','California'),(102,10,2,300000,'Yes',7,'United States','California','Apple','United States','California'),(95,10,2,450000,'Yes',6,'United States','California','Apple','United States','California'),(45,10,2,500000,'Yes',1,'United States','California','Apple','United States','California'),(88,10,2,600000,'Yes',5,'United States','California','Apple','United States','California'),(109,10,2,3200000,NULL,8,'United States','California','Apple','United States','California'),(35,10,5,80000,'Yes',23,'United States','California','Apple','United States','California'),(10,10,10,20000,NULL,17,'United States','Alabama','Sizzling Steak','United States','Alabama'),(20,10,10,35000,NULL,19,'United States','Alabama','Sizzling Steak','United States','Alabama'),(30,10,10,36000,NULL,21,'United States','Alabama','Sizzling Steak','United States','Alabama'),(34,10,10,52000,NULL,22,'United States','Alabama','Sizzling Steak','United States','Alabama'),(113,11,11,5350000,NULL,8,'United States','California','Google','United States','California'),(108,12,3,200000,NULL,8,'United States','California','Meta','United States','California'),(101,12,3,475000,NULL,6,'United States','California','Meta','United States','California'),(51,12,3,500000,NULL,1,'United States','California','Meta','United States','California'),(94,12,3,550000,NULL,5,'United States','California','Meta','United States','California'),(111,12,3,4350000,NULL,8,'United States','California','Meta','United States','California'),(104,12,4,230000,'No',7,'United States','California','Apple','United States','California'),(97,12,4,430000,'No',6,'United States','California','Apple','United States','California'),(47,12,4,530000,'No',1,'United States','California','Apple','United States','California'),(90,12,4,630000,'No',5,'United States','California','Apple','United States','California'),(64,12,5,200000,NULL,4,'United States','California','Apple','United States','California'),(76,12,5,250000,NULL,3,'United States','California','Apple','United States','California'),(52,12,5,300000,NULL,2,'United States','California','Apple','United States','California'),(44,12,6,65000,'No',23,'United States','California','Sunshine Hospital','United States','Hawaii'),(77,12,6,250000,NULL,3,'United States','New York','Apple','United States','California'),(65,12,6,250000,NULL,4,'United States','New York','Apple','United States','California'),(53,12,6,350000,NULL,2,'United States','New York','Apple','United States','California'),(127,12,12,45000,NULL,13,'United States','California','Washington Hospital','United States','California'),(131,12,12,50000,NULL,11,'United States','California','Washington Hospital','United States','California'),(119,12,12,65000,NULL,12,'United States','California','Washington Hospital','United States','California'),(135,12,12,70000,NULL,14,'United States','California','Washington Hospital','United States','California'),(123,12,12,75000,NULL,10,'United States','California','Washington Hospital','United States','California'),(139,12,12,78000,NULL,15,'United States','California','Washington Hospital','United States','California'),(66,12,12,300000,NULL,4,'United States','California','Amazon','United States','Washington State'),(78,12,12,350000,NULL,3,'United States','California','Amazon','United States','Washington State'),(54,12,12,400000,NULL,2,'United States','California','Amazon','United States','Washington State'),(115,12,12,435000,NULL,9,'United States','California','Washington Hospital','United States','California'),(112,12,12,3350000,NULL,8,'United States','California','Netflix','United States','California'),(71,15,2,200000,NULL,4,'United States','California','Netflix','United States','California'),(83,15,2,250000,NULL,3,'United States','California','Netflix','United States','California'),(59,15,2,300000,NULL,2,'United States','California','Netflix','United States','California'),(128,25,25,43000,NULL,13,'United States','New York','Fixerupper Hospital','United States','New York'),(132,25,25,48000,NULL,11,'United States','New York','Fixerupper Hospital','United States','New York'),(136,25,25,72000,NULL,14,'United States','New York','Fixerupper Hospital','United States','New York'),(120,25,25,73000,NULL,12,'United States','New York','Fixerupper Hospital','United States','New York'),(124,25,25,78000,NULL,10,'United States','New York','Fixerupper Hospital','United States','New York'),(140,25,25,82000,NULL,15,'United States','New York','Fixerupper Hospital','United States','New York'),(116,25,25,535000,NULL,9,'United States','New York','Fixerupper Hospital','United States','New York'),(130,28,28,28000,NULL,13,'United States','Hawaii','Sunshine Hospital','United States','Hawaii'),(134,28,28,33000,NULL,11,'United States','Hawaii','Sunshine Hospital','United States','Hawaii'),(122,28,28,45000,NULL,12,'United States','Hawaii','Sunshine Hospital','United States','Hawaii'),(126,28,28,50000,NULL,10,'United States','Hawaii','Sunshine Hospital','United States','Hawaii'),(138,28,28,58000,NULL,14,'United States','Hawaii','Sunshine Hospital','United States','Hawaii'),(142,28,28,64000,NULL,15,'United States','Hawaii','Sunshine Hospital','United States','Hawaii'),(118,28,28,335000,NULL,9,'United States','Hawaii','Sunshine Hospital','United States','Hawaii'),(129,30,30,30000,NULL,13,'United States','Washington DC','Mayo Clinic','United States','Washington DC'),(133,30,30,35000,NULL,11,'United States','Washington DC','Mayo Clinic','United States','Washington DC'),(121,30,30,53000,NULL,12,'United States','Washington DC','Mayo Clinic','United States','Washington DC'),(125,30,30,58000,NULL,10,'United States','Washington DC','Mayo Clinic','United States','Washington DC'),(137,30,30,65000,NULL,14,'United States','Washington DC','Mayo Clinic','United States','Washington DC'),(141,30,30,72000,NULL,15,'United States','Washington DC','Mayo Clinic','United States','Washington DC'),(117,30,30,235000,NULL,9,'United States','Washington DC','Mayo Clinic','United States','Washington DC'),(114,30,30,1350000,NULL,8,'United States','Georgia','IBM','United States','Georgia');
/*!40000 ALTER TABLE `USER_INPUT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'salaryShareFinalProj'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-07 17:00:44
