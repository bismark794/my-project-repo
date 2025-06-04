CREATE DATABASE  IF NOT EXISTS `world` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `world`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: world
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Position to start replication or point-in-time recovery from
--

-- CHANGE MASTER TO MASTER_LOG_FILE='DESKTOP-H0GL39H-bin.000009', MASTER_LOG_POS=157;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `AttendanceID` int NOT NULL AUTO_INCREMENT,
  `MemberID` int NOT NULL,
  `Date` date NOT NULL,
  `CheckInTime` time NOT NULL,
  `CheckOutTime` time NOT NULL,
  PRIMARY KEY (`AttendanceID`),
  KEY `MemberID` (`MemberID`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--
-- ORDER BY:  `AttendanceID`

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
REPLACE  IGNORE INTO `attendance` (`AttendanceID`, `MemberID`, `Date`, `CheckInTime`, `CheckOutTime`) VALUES (1,1,'2024-09-05','08:00:00','10:00:00'),(2,2,'2024-09-10','09:00:00','11:00:00'),(3,3,'2024-09-15','10:00:00','12:00:00'),(4,4,'2024-09-20','08:00:00','10:00:00');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `EquipmentID` int NOT NULL AUTO_INCREMENT,
  `EquipmentName` varchar(100) NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`EquipmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--
-- ORDER BY:  `EquipmentID`

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
REPLACE  IGNORE INTO `equipment` (`EquipmentID`, `EquipmentName`, `Quantity`) VALUES (1,'Treadmill',5),(2,'Bicycle',3),(3,'Dumbbells',10),(4,'Kettlebells',8),(5,'Rowing Machine',2);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `MemberID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `JoinDate` date NOT NULL,
  `MembershipType` varchar(50) NOT NULL,
  PRIMARY KEY (`MemberID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--
-- ORDER BY:  `MemberID`

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
REPLACE  IGNORE INTO `members` (`MemberID`, `Name`, `Email`, `Phone`, `Address`, `JoinDate`, `MembershipType`) VALUES (1,'John Doe','johndoe@example.com','1234567890','123 Main St','2024-09-05','monthly'),(2,'Jane Smith','janesmith@example.com','0987654321','456 Elm St','2024-09-10','yearly'),(3,'Bob Johnson','bobjohnson@example.com','5551234567','789 Oak St','2024-09-15','monthly'),(4,'Mike Davis','mikedavis@example.com','8889997777','901 Pine St','2024-09-25','monthly');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `MembershipID` int NOT NULL AUTO_INCREMENT,
  `MemberID` int NOT NULL,
  `PackageID` int NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  PRIMARY KEY (`MembershipID`),
  KEY `MemberID` (`MemberID`),
  KEY `PackageID` (`PackageID`),
  CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`),
  CONSTRAINT `membership_ibfk_2` FOREIGN KEY (`PackageID`) REFERENCES `packages` (`PackageID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--
-- ORDER BY:  `MembershipID`

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
REPLACE  IGNORE INTO `membership` (`MembershipID`, `MemberID`, `PackageID`, `StartDate`, `EndDate`) VALUES (1,1,1,'2024-09-05','2024-10-05'),(2,2,2,'2024-09-10','2024-12-10'),(3,3,3,'2024-09-15','2025-03-15'),(4,4,1,'2024-09-20','2024-10-20');
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `PackageID` int NOT NULL AUTO_INCREMENT,
  `PackageName` varchar(100) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Duration` varchar(50) NOT NULL,
  PRIMARY KEY (`PackageID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--
-- ORDER BY:  `PackageID`

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
REPLACE  IGNORE INTO `packages` (`PackageID`, `PackageName`, `Price`, `Duration`) VALUES (1,'Basic',50.00,'1 month'),(2,'Premium',100.00,'3 months'),(3,'Elite',200.00,'6 months'),(4,'Pro',150.00,'2 months'),(5,'Starter',30.00,'1 month');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'world'
--

--
-- Dumping routines for database 'world'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-05 20:26:27
