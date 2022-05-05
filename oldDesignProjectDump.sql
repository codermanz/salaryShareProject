-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (arm64)
--
-- Host: localhost    Database: SalaryShareProject
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPANY` (
  `COMPANY_ID` int NOT NULL AUTO_INCREMENT,
  `COMPANY_STANDING` text,
  `COMPANY_NAME` varchar(60) NOT NULL,
  `COMPANY_COUNTRY` varchar(50) NOT NULL,
  `COMPANY_STATE` varchar(50) NOT NULL,
  `COMPANY_FIELD` varchar(50) NOT NULL,
  PRIMARY KEY (`COMPANY_ID`),
  UNIQUE KEY `COMPANY_ID` (`COMPANY_ID`),
  KEY `COMPANY_COUNTRY` (`COMPANY_COUNTRY`,`COMPANY_STATE`),
  KEY `COMPANY_FIELD` (`COMPANY_FIELD`),
  KEY `COMPANY_NAME` (`COMPANY_NAME`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`COMPANY_COUNTRY`, `COMPANY_STATE`) REFERENCES `LOCATION` (`COUNTRY`, `STATE`),
  CONSTRAINT `company_ibfk_2` FOREIGN KEY (`COMPANY_FIELD`) REFERENCES `FIELD` (`NAME`),
  CONSTRAINT `company_ibfk_3` FOREIGN KEY (`COMPANY_NAME`) REFERENCES `COMPANYNAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPANY`
--

LOCK TABLES `COMPANY` WRITE;
/*!40000 ALTER TABLE `COMPANY` DISABLE KEYS */;
INSERT INTO `COMPANY` VALUES (1,'Corporate','Apple','United States','California','Technology'),(2,'Corporate','Amazon','United States','Washington State','Technology'),(3,'Corporate','Meta','United States','California','Technology'),(4,'Corporate','Netflix','United States','California','Technology'),(5,'Corporate','Google','United States','California','Technology'),(6,'Corporate','IBM','United States','Georgia','Technology'),(7,NULL,'ABC Pizzas','Canada','Alberta','Hospitality'),(8,NULL,'Best Burgers','Canada','British Columbia','Hospitality'),(9,NULL,'Wicked Waffles','United States','Florida','Hospitality'),(10,NULL,'Sizzling Steak','United States','Alabama','Hospitality'),(11,NULL,'Nice Nachos','United States','Alabama','Hospitality'),(12,NULL,'Krispy Krabs','United States','Alabama','Hospitality'),(13,'Government','Washington Hospital','United States','California','Medicine'),(14,'Private','Fixerupper Hospital','United States','New York','Medicine'),(15,'Private','Mayo Clinic','United States','Washington DC','Medicine'),(16,'Government','Sunshine Hospital','United States','Hawaii','Medicine');
/*!40000 ALTER TABLE `COMPANY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPANYNAME`
--

DROP TABLE IF EXISTS `COMPANYNAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPANYNAME` (
  `NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`NAME`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPANYNAME`
--

LOCK TABLES `COMPANYNAME` WRITE;
/*!40000 ALTER TABLE `COMPANYNAME` DISABLE KEYS */;
INSERT INTO `COMPANYNAME` VALUES ('ABC Pizzas'),('Amazon'),('Apple'),('Best Burgers'),('Fixerupper Hospital'),('Google'),('IBM'),('Krispy Krabs'),('Mayo Clinic'),('Meta'),('Netflix'),('Nice Nachos'),('Sizzling Steak'),('Sunshine Hospital'),('Washington Hospital'),('Wicked Waffles');
/*!40000 ALTER TABLE `COMPANYNAME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FIELD`
--

DROP TABLE IF EXISTS `FIELD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FIELD` (
  `NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`NAME`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
  KEY `JOB_NAME` (`JOB_NAME`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`JOB_FIELD`) REFERENCES `FIELD` (`NAME`),
  CONSTRAINT `job_ibfk_2` FOREIGN KEY (`JOB_NAME`) REFERENCES `JOBNAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
-- Table structure for table `JOBNAME`
--

DROP TABLE IF EXISTS `JOBNAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JOBNAME` (
  `NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`NAME`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOBNAME`
--

LOCK TABLES `JOBNAME` WRITE;
/*!40000 ALTER TABLE `JOBNAME` DISABLE KEYS */;
INSERT INTO `JOBNAME` VALUES ('Administrator'),('CEO'),('Chef'),('Family Physician'),('Human Resource'),('Manager'),('Nurse'),('Owner'),('Product Manager'),('Quality Engineer'),('Software Developer'),('Systems Architect'),('Waiter');
/*!40000 ALTER TABLE `JOBNAME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOCATION`
--

DROP TABLE IF EXISTS `LOCATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOCATION` (
  `COUNTRY` varchar(50) NOT NULL,
  `STATE` varchar(50) NOT NULL,
  PRIMARY KEY (`COUNTRY`,`STATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
-- Table structure for table `USER_INPUT`
--

DROP TABLE IF EXISTS `USER_INPUT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_INPUT` (
  `INPUT_ID` int NOT NULL AUTO_INCREMENT,
  `USER_COMPANY_NAME` varchar(50) NOT NULL,
  `USER_JOB_NAME` varchar(50) NOT NULL,
  `USER_COMPANY_ID` int NOT NULL,
  `USER_JOB_ID` int NOT NULL,
  `YEARS_WORKING` int NOT NULL,
  `YEARS_AT_COMPANY` int NOT NULL,
  `SALARY` int NOT NULL,
  `NEGOTIATED` varchar(3) DEFAULT NULL,
  `USER_COUNTRY` varchar(50) NOT NULL,
  `USER_STATE` varchar(50) NOT NULL,
  PRIMARY KEY (`INPUT_ID`),
  UNIQUE KEY `INPUT_ID` (`INPUT_ID`),
  KEY `USER_COUNTRY` (`USER_COUNTRY`,`USER_STATE`),
  KEY `USER_JOB_ID` (`USER_JOB_ID`),
  KEY `USER_COMPANY_ID` (`USER_COMPANY_ID`),
  KEY `USER_COMPANY_NAME` (`USER_COMPANY_NAME`),
  KEY `USER_JOB_NAME` (`USER_JOB_NAME`),
  CONSTRAINT `user_input_ibfk_1` FOREIGN KEY (`USER_COUNTRY`, `USER_STATE`) REFERENCES `LOCATION` (`COUNTRY`, `STATE`),
  CONSTRAINT `user_input_ibfk_2` FOREIGN KEY (`USER_JOB_ID`) REFERENCES `JOB` (`JOB_ID`),
  CONSTRAINT `user_input_ibfk_3` FOREIGN KEY (`USER_COMPANY_ID`) REFERENCES `COMPANY` (`COMPANY_ID`),
  CONSTRAINT `user_input_ibfk_4` FOREIGN KEY (`USER_COMPANY_NAME`) REFERENCES `COMPANY` (`COMPANY_NAME`),
  CONSTRAINT `user_input_ibfk_5` FOREIGN KEY (`USER_JOB_NAME`) REFERENCES `JOB` (`JOB_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_INPUT`
--

LOCK TABLES `USER_INPUT` WRITE;
/*!40000 ALTER TABLE `USER_INPUT` DISABLE KEYS */;
INSERT INTO `USER_INPUT` VALUES (1,'Apple','Human Resource',1,23,10,5,80000,'Yes','United States','California'),(2,'Apple','Human Resource',1,23,8,3,85000,'No','United States','California'),(3,'Apple','Human Resource',1,23,7,2,70000,'Yes','United States','New York'),(4,'Amazon','Human Resource',2,23,5,4,72000,'Yes','United States','New York'),(5,'Meta','Human Resource',3,23,1,1,88000,'No','United States','California'),(6,'Meta','Human Resource',3,23,2,1,45000,'Yes','United States','Alabama'),(7,'Washington Hospital','Human Resource',13,23,3,1,60000,'Yes','United States','New York'),(8,'Fixerupper Hospital','Human Resource',14,23,4,2,62000,'No','United States','New York'),(9,'Mayo Clinic','Human Resource',15,23,7,5,66000,'Yes','United States','California'),(10,'Sunshine Hospital','Human Resource',16,23,12,6,65000,'No','United States','California'),(11,'ABC Pizzas','Waiter',7,16,2,2,11000,NULL,'Canada','Alberta'),(12,'ABC Pizzas','Waiter',7,16,2,2,13000,NULL,'Canada','Alberta'),(13,'Best Burgers','Waiter',8,16,1,1,13000,NULL,'Canada','British Columbia'),(14,'Wicked Waffles','Waiter',9,16,1,1,14000,NULL,'United States','Florida'),(15,'Sizzling Steak','Waiter',10,16,2,2,10000,NULL,'United States','Alabama'),(16,'ABC Pizzas','Waiter',7,17,5,3,22000,NULL,'Canada','Alberta'),(17,'ABC Pizzas','Waiter',7,17,7,4,26000,NULL,'Canada','Alberta'),(18,'Best Burgers','Waiter',8,17,1,1,26000,NULL,'Canada','British Columbia'),(19,'Wicked Waffles','Waiter',9,17,2,1,28000,NULL,'United States','Florida'),(20,'Sizzling Steak','Waiter',10,17,10,10,20000,NULL,'United States','Alabama'),(21,'ABC Pizzas','Chef',7,18,2,2,22000,NULL,'Canada','Alberta'),(22,'ABC Pizzas','Chef',7,18,2,2,26000,NULL,'Canada','Alberta'),(23,'Best Burgers','Chef',8,18,1,1,32000,NULL,'Canada','British Columbia'),(24,'Wicked Waffles','Chef',9,18,1,1,30000,NULL,'United States','Florida'),(25,'Sizzling Steak','Chef',10,18,2,2,20000,NULL,'United States','Alabama'),(26,'ABC Pizzas','Chef',7,19,5,3,34000,NULL,'Canada','Alberta'),(27,'ABC Pizzas','Chef',7,19,7,4,36000,NULL,'Canada','Alberta'),(28,'Best Burgers','Chef',8,19,1,1,37000,NULL,'Canada','British Columbia'),(29,'Wicked Waffles','Chef',9,19,2,1,42000,NULL,'United States','Florida'),(30,'Sizzling Steak','Chef',10,19,10,10,35000,NULL,'United States','Alabama'),(31,'ABC Pizzas','Manager',7,20,2,2,32000,NULL,'Canada','Alberta'),(32,'ABC Pizzas','Manager',7,20,2,2,29000,NULL,'Canada','Alberta'),(33,'Best Burgers','Manager',8,20,1,1,29000,NULL,'Canada','British Columbia'),(34,'Wicked Waffles','Manager',9,20,1,1,30000,NULL,'United States','Florida'),(35,'Sizzling Steak','Manager',10,20,2,2,20000,NULL,'United States','Alabama'),(36,'ABC Pizzas','Manager',7,21,5,3,45000,NULL,'Canada','Alberta'),(37,'ABC Pizzas','Manager',7,21,7,4,42000,NULL,'Canada','Alberta'),(38,'Best Burgers','Manager',8,21,1,1,47000,NULL,'Canada','British Columbia'),(39,'Wicked Waffles','Manager',9,21,2,1,48500,NULL,'United States','Florida'),(40,'Sizzling Steak','Manager',10,21,10,10,36000,NULL,'United States','Alabama'),(41,'ABC Pizzas','Owner',7,22,5,3,75000,NULL,'Canada','Alberta'),(42,'Best Burgers','Owner',8,22,1,1,66000,NULL,'Canada','British Columbia'),(43,'Wicked Waffles','Owner',9,22,2,1,68000,NULL,'United States','Florida'),(44,'Sizzling Steak','Owner',10,22,10,10,52000,NULL,'United States','Alabama'),(45,'Washington Hospital','Family Physician',13,9,12,12,435000,NULL,'United States','California'),(46,'Washington Hospital','Family Physician',13,9,12,12,435000,NULL,'United States','California'),(47,'Fixerupper Hospital','Family Physician',14,9,25,25,535000,NULL,'United States','New York'),(48,'Mayo Clinic','Family Physician',15,9,30,30,235000,NULL,'United States','Washington DC'),(49,'Sunshine Hospital','Family Physician',16,9,28,28,335000,NULL,'United States','Hawaii'),(50,'Washington Hospital','Nurse',13,12,12,12,65000,NULL,'United States','California'),(51,'Fixerupper Hospital','Nurse',14,12,25,25,73000,NULL,'United States','New York'),(52,'Mayo Clinic','Nurse',15,12,30,30,53000,NULL,'United States','Washington DC'),(53,'Sunshine Hospital','Nurse',16,12,28,28,45000,NULL,'United States','Hawaii'),(54,'Washington Hospital','Nurse',13,10,12,12,75000,NULL,'United States','California'),(55,'Fixerupper Hospital','Nurse',14,10,25,25,78000,NULL,'United States','New York'),(56,'Mayo Clinic','Nurse',15,10,30,30,58000,NULL,'United States','Washington DC'),(57,'Sunshine Hospital','Nurse',16,10,28,28,50000,NULL,'United States','Hawaii'),(58,'Washington Hospital','Nurse',13,13,12,12,45000,NULL,'United States','California'),(59,'Fixerupper Hospital','Nurse',14,13,25,25,43000,NULL,'United States','New York'),(60,'Mayo Clinic','Nurse',15,13,30,30,30000,NULL,'United States','Washington DC'),(61,'Sunshine Hospital','Nurse',16,13,28,28,28000,NULL,'United States','Hawaii'),(62,'Washington Hospital','Nurse',13,11,12,12,50000,NULL,'United States','California'),(63,'Fixerupper Hospital','Nurse',14,11,25,25,48000,NULL,'United States','New York'),(64,'Mayo Clinic','Nurse',15,11,30,30,35000,NULL,'United States','Washington DC'),(65,'Sunshine Hospital','Nurse',16,11,28,28,33000,NULL,'United States','Hawaii'),(66,'Washington Hospital','Administrator',13,14,12,12,70000,NULL,'United States','California'),(67,'Fixerupper Hospital','Administrator',14,14,25,25,72000,NULL,'United States','New York'),(68,'Mayo Clinic','Administrator',15,14,30,30,65000,NULL,'United States','Washington DC'),(69,'Sunshine Hospital','Administrator',16,14,28,28,58000,NULL,'United States','Hawaii'),(70,'Washington Hospital','Administrator',13,15,12,12,78000,NULL,'United States','California'),(71,'Fixerupper Hospital','Administrator',14,15,25,25,82000,NULL,'United States','New York'),(72,'Mayo Clinic','Administrator',15,15,30,30,72000,NULL,'United States','Washington DC'),(73,'Sunshine Hospital','Administrator',16,15,28,28,64000,NULL,'United States','Hawaii'),(74,'Apple','Software Developer',1,1,10,2,500000,'Yes','United States','California'),(75,'Apple','Software Developer',1,1,5,5,350000,'Yes','United States','Washington State'),(76,'Apple','Software Developer',1,1,12,4,530000,'No','United States','California'),(77,'Amazon','Software Developer',2,1,7,2,400000,'No','United States','Washington State'),(78,'Amazon','Software Developer',2,1,5,3,300000,'No','United States','Florida'),(79,'Amazon','Software Developer',2,1,7,7,450000,'No','United States','California'),(80,'Meta','Software Developer',3,1,12,3,500000,NULL,'United States','California'),(81,'Apple','Software Developer',1,2,12,5,300000,NULL,'United States','California'),(82,'Apple','Software Developer',1,2,12,6,350000,NULL,'United States','New York'),(83,'Amazon','Software Developer',2,2,12,12,400000,NULL,'United States','California'),(84,'Amazon','Software Developer',2,2,3,2,250000,NULL,'United States','California'),(85,'Meta','Software Developer',3,2,4,4,200000,NULL,'United States','California'),(86,'Meta','Software Developer',3,2,6,3,400000,NULL,'United States','California'),(87,'Netflix','Software Developer',4,2,7,5,200000,NULL,'United States','New York'),(88,'Netflix','Software Developer',4,2,15,2,300000,NULL,'United States','California'),(89,'Google','Software Developer',5,2,10,2,200000,NULL,'United States','California'),(90,'Google','Software Developer',5,2,7,5,275000,NULL,'United States','New York'),(93,'Apple','Software Developer',1,4,12,5,200000,NULL,'United States','California'),(94,'Apple','Software Developer',1,4,12,6,250000,NULL,'United States','New York'),(95,'Amazon','Software Developer',2,4,12,12,300000,NULL,'United States','California'),(96,'Amazon','Software Developer',2,4,3,2,150000,NULL,'United States','California'),(97,'Meta','Software Developer',3,4,4,4,100000,NULL,'United States','California'),(98,'Meta','Software Developer',3,4,6,3,300000,NULL,'United States','California'),(99,'Netflix','Software Developer',4,4,7,5,100000,NULL,'United States','New York'),(100,'Netflix','Software Developer',4,4,15,2,200000,NULL,'United States','California'),(101,'Google','Software Developer',5,4,10,2,100000,NULL,'United States','California'),(102,'Google','Software Developer',5,4,7,5,175000,NULL,'United States','New York'),(105,'Apple','Software Developer',1,3,12,5,250000,NULL,'United States','California'),(106,'Apple','Software Developer',1,3,12,6,250000,NULL,'United States','New York'),(107,'Amazon','Software Developer',2,3,12,12,350000,NULL,'United States','California'),(108,'Amazon','Software Developer',2,3,3,2,200000,NULL,'United States','California'),(109,'Meta','Software Developer',3,3,4,4,150000,NULL,'United States','California'),(110,'Meta','Software Developer',3,3,6,3,350000,NULL,'United States','California'),(111,'Netflix','Software Developer',4,3,7,5,150000,NULL,'United States','New York'),(112,'Netflix','Software Developer',4,3,15,2,250000,NULL,'United States','California'),(113,'Google','Software Developer',5,3,10,2,150000,NULL,'United States','California'),(114,'Google','Software Developer',5,3,7,5,225000,NULL,'United States','New York'),(117,'Apple','Product Manager',1,5,10,2,600000,'Yes','United States','California'),(118,'Apple','Product Manager',1,5,5,5,550000,'Yes','United States','Washington State'),(119,'Apple','Product Manager',1,5,12,4,630000,'No','United States','California'),(120,'Amazon','Product Manager',2,5,7,2,500000,'No','United States','Washington State'),(121,'Amazon','Product Manager',2,5,5,3,450000,'No','United States','Florida'),(122,'Amazon','Product Manager',2,5,7,7,450000,'No','United States','California'),(123,'Meta','Product Manager',3,5,12,3,550000,NULL,'United States','California'),(124,'Apple','Systems Architect',1,6,10,2,450000,'Yes','United States','California'),(125,'Apple','Systems Architect',1,6,5,5,370000,'Yes','United States','Washington State'),(126,'Apple','Systems Architect',1,6,12,4,430000,'No','United States','California'),(127,'Amazon','Systems Architect',2,6,7,2,250000,'No','United States','Washington State'),(128,'Amazon','Systems Architect',2,6,5,3,200000,'No','United States','Florida'),(129,'Amazon','Systems Architect',2,6,7,7,450000,'No','United States','California'),(130,'Meta','Systems Architect',3,6,12,3,475000,NULL,'United States','California'),(131,'Apple','Quality Engineer',1,7,10,2,300000,'Yes','United States','California'),(132,'Apple','Quality Engineer',1,7,5,5,250000,'Yes','United States','Washington State'),(133,'Apple','Quality Engineer',1,7,12,4,230000,'No','United States','California'),(134,'Amazon','Quality Engineer',2,7,7,2,200000,'No','United States','Washington State'),(135,'Amazon','Quality Engineer',2,7,5,3,230000,'No','United States','Florida'),(136,'Amazon','Quality Engineer',2,7,7,7,150000,'No','United States','California'),(137,'Meta','Quality Engineer',3,8,12,3,200000,NULL,'United States','California'),(138,'Apple','CEO',1,8,10,2,3200000,NULL,'United States','California'),(139,'Amazon','CEO',2,8,7,2,4000000,NULL,'United States','Washington State'),(140,'Meta','CEO',3,8,12,3,4350000,NULL,'United States','California'),(141,'Netflix','CEO',4,8,12,12,3350000,NULL,'United States','California'),(142,'Google','CEO',5,8,11,11,5350000,NULL,'United States','California'),(144,'IBM','CEO',6,8,30,30,1350000,NULL,'United States','Georgia'),(145,'IBM','Software Developer',6,3,8,3,100000,NULL,'United States','Georgia'),(146,'IBM','Software Developer',6,3,9,2,108000,NULL,'United States','Georgia'),(147,'IBM','Software Developer',6,4,9,2,88000,NULL,'United States','Georgia'),(148,'IBM','Software Developer',6,4,8,3,90000,NULL,'United States','Georgia'),(149,'IBM','Software Developer',6,2,9,2,118000,NULL,'United States','Georgia'),(150,'IBM','Software Developer',6,2,8,3,120000,NULL,'United States','Georgia');
/*!40000 ALTER TABLE `USER_INPUT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'SalaryShareProject'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-01 15:45:24
