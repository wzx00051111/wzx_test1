-- MySQL dump 10.13  Distrib 8.0.21, for osx10.15 (x86_64)
--
-- Host: localhost    Database: test1_db
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `userDtl`
--

DROP TABLE IF EXISTS `userDtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userDtl` (
  `id` varchar(8) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `phone2` varchar(11) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `password` varchar(18) DEFAULT NULL,
  `loginState` tinyint(1) DEFAULT '0',
  `inService` tinyint(1) DEFAULT '1',
  `admin` tinyint(1) DEFAULT '0',
  `sessionId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userDtl`
--

LOCK TABLES `userDtl` WRITE;
/*!40000 ALTER TABLE `userDtl` DISABLE KEYS */;
/*!40000 ALTER TABLE `userDtl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verificationCode`
--

DROP TABLE IF EXISTS `verificationCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verificationCode` (
  `verificationCode` varchar(4) NOT NULL,
  `sessionId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`verificationCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verificationCode`
--

LOCK TABLES `verificationCode` WRITE;
/*!40000 ALTER TABLE `verificationCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `verificationCode` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-23 18:35:18