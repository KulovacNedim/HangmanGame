-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: hangmen
-- ------------------------------------------------------
-- Server version	5.7.21-log

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

drop database if exists hangmen;

create database hangmen;

use hangmen;
--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `RecordID` int(11) DEFAULT NULL,
  `ImagePath` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'images/1.png'),(2,'images/2.png'),(3,'images/3.png'),(4,'images/4.png'),(5,'images/5.png'),(6,'images/6.png'),(7,'images/7.png'),(8,'images/8.png'),(0,'images/0.png');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `points`
--

DROP TABLE IF EXISTS `points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `points` (
  `RecordID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `Points` int(11) NOT NULL,
  PRIMARY KEY (`RecordID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `points_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `points`
--

LOCK TABLES `points` WRITE;
/*!40000 ALTER TABLE `points` DISABLE KEYS */;
INSERT INTO `points` VALUES (67,2,200),(68,2,100),(69,2,500),(70,2,100),(71,2,100),(72,2,100),(73,2,100),(74,2,100),(75,2,80),(76,2,100),(77,2,170),(78,2,380),(79,2,160),(80,2,500),(81,2,980),(82,2,400);
/*!40000 ALTER TABLE `points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(20) NOT NULL,
  `Password` varchar(70) DEFAULT NULL,
  `Admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'nedim','794878b52cdf68293ccfe2c3ba8e5d758eb4cbf8a32ef9ce7c72ea7e',1),(3,'Some Dude','7e6a4309ddf6e8866679f61ace4f621b0e3455ebac2e831a60f13cd1',0),(5,'nindja','7e6a4309ddf6e8866679f61ace4f621b0e3455ebac2e831a60f13cd1',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wordcategory`
--

DROP TABLE IF EXISTS `wordcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wordcategory` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `Word` varchar(20) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wordcategory`
--

LOCK TABLES `wordcategory` WRITE;
/*!40000 ALTER TABLE `wordcategory` DISABLE KEYS */;
INSERT INTO `wordcategory` VALUES (1,'CITIES'),(2,'COUNTRIES'),(3,'ANIMALS'),(4,'CARS'),(5,'BRANDS'),(6,'COLORS'),(7,'OLYMPIC SPORTS'),(8,'FRUITS'),(10,'HOME DEVICES');
/*!40000 ALTER TABLE `wordcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `words` (
  `RecordID` int(11) NOT NULL AUTO_INCREMENT,
  `Word` varchar(20) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  PRIMARY KEY (`RecordID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `words_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `wordcategory` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
INSERT INTO `words` VALUES (4,'PARIS',1),(5,'FRANKFURT',1),(6,'PASSAT',4),(7,'DENMARK',2),(8,'CANADA',2),(9,'SNAKE',3),(10,'MONKEY',3),(11,'GOLF IV',4),(12,'BRUNO BANANI',5),(13,'TELEFUNKEN',5),(14,'NEW YORK',1),(15,'INDIGO',6),(16,'YELLOW',6),(17,'BANANA',8),(18,'ORANGE',8),(19,'SWIMMING',7),(20,'ATHLETICS',7),(21,'GREEN',6),(22,'ROTERDAM',1),(23,'MALESIA',2),(24,'BERLIN',1),(25,'FRIDGE',10);
/*!40000 ALTER TABLE `words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-10 15:37:48
