-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: credit_card
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) NOT NULL,
  `transaction_amount` double NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'sjtamim',2222),(2,'sjtamim',1212),(3,'sjtamim',2323),(4,'sjtofayel',3434),(5,'sjtofayel',1212),(6,'sjtofayel',2456),(7,'sjtofayel',5678),(8,'sjtamim',1256),(9,'sjtofayel',4321),(10,'sjtamim',5432),(11,'sjtamim',5455),(12,'sjtofayel',1234),(13,'sjtamim',6576),(14,'sjtofayel',4567),(15,'sjtamim',6543),(16,'sjtofayel',2345),(17,'sjtamim',3345),(18,'sjtofayel',3098),(19,'sjtamim',1657),(20,'sjtofayel',4343),(21,'sjtofayel',5555),(22,'sjtamim',3333),(23,'sjtamim',5454),(24,'sjtamim',6666),(25,'sjtamim',200),(26,'sjtamim',6654),(27,'sjtamim',6666),(28,'sjtamim',5678),(29,'sjtamim',6565),(30,'sjtamim',6565),(31,'sjtamim',5656),(32,'sjtamim',6565),(33,'sjtamim',6565),(34,'sjtamim',6565),(35,'sjtamim',1111),(36,'sjtamim',4567),(37,'sjtamim',4567),(38,'sjtamim',4343),(39,'sjtamim',6565),(40,'sjtamim',6565),(41,'sjtamim',6565),(42,'sjtamim',6565),(43,'sjtamim',5656),(44,'sjtamim',5454),(46,'sjtofayel',4000),(47,'sjtamim',5454),(48,'sjtamim',6565),(49,'sjtofayel',30000),(50,'sjtofayel',30000);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `pin_number` varchar(30) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `date_of_birth` varchar(20) NOT NULL,
  `marital_status` varchar(30) NOT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `current_address` varchar(200) NOT NULL,
  `parmanent_address` varchar(200) NOT NULL,
  `city` varchar(30) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `profession` varchar(20) NOT NULL,
  `card_type` varchar(10) NOT NULL,
  `security_question_1` varchar(50) DEFAULT NULL,
  `security_question_2` varchar(50) DEFAULT NULL,
  `balance` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `pin_number` (`pin_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'saif','tamim','sjtamim','sjtamim.gfn@gmail.com','1234','0987','01929470274','02-09-1990','Single','M','Dhaka','Mymensingh','Mymensingh','Bangladesh','Nai','Platinum','How Are You?','I\'m fine.',60000),(3,'Sajid ','Tofayel','sjtofayel','sjtofayel@gmail.com','1234','4321','01918489473','09-07-2000','Single','M','Mymensingh','Mymensingh','Mymensingh','Bangladesh','Student','Platinum','7890','I\'m fine.',60000);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-28 23:04:38
