/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: database
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `kader`
--

DROP TABLE IF EXISTS `kader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `kader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kader`
--

LOCK TABLES `kader` WRITE;
/*!40000 ALTER TABLE `kader` DISABLE KEYS */;
INSERT INTO `kader` VALUES
(1,'Abdullah Alsalloum'),
(2,'Amer Ramadhan Omar'),
(3,'Andy Schulz'),
(4,'Boy Bröckler'),
(5,'Fabian Lehmann'),
(6,'Falk Jöns-Anders'),
(7,'Finn Bargiel'),
(8,'Hauke Güntrath-Lorenzen'),
(9,'Ismail Bakkar'),
(10,'Jakob Lange'),
(11,'Jan Pohlke'),
(12,'Joe Hoffmann'),
(13,'Kevin Raabe'),
(14,'Kjell Boiesen'),
(15,'Lasse Petersen'),
(16,'Leon Henning'),
(17,'Malte Klang'),
(18,'Mario Perivolaris'),
(19,'Mattes Nissen'),
(20,'Nick Nerenberg'),
(21,'Nik Plöger'),
(22,'Paul Pompetzki'),
(23,'Peer Hoffmann'),
(24,'Steffen Schmück'),
(25,'Sven Andresen'),
(26,'Thies Freese'),
(27,'Thomas Erichsen'),
(28,'Thomas Schulz'),
(29,'Tim Hinrichsen'),
(30,'Timo Stroschein'),
(31,'Tjark Stroschein'),
(32,'Yannik Mahler'),
(33,'Tom Meyer'),
(98,'Marc Stroschein'),
(99,'Carlo Secci'),
(100,'Khalid Idahmedali'),
(101,'Alen Dušinovic');
/*!40000 ALTER TABLE `kader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `spielerId` int(11) DEFAULT NULL,
  `flaschen` int(11) DEFAULT NULL,
  `musikbox` int(11) DEFAULT NULL,
  `bälle` int(11) DEFAULT NULL,
  `jacken` int(11) DEFAULT NULL,
  KEY `spielerId` (`spielerId`),
  CONSTRAINT `material_ibfk_1` FOREIGN KEY (`spielerId`) REFERENCES `kader` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES
(1,NULL,NULL,NULL,NULL),
(2,NULL,NULL,NULL,NULL),
(3,NULL,NULL,NULL,NULL),
(4,NULL,NULL,NULL,NULL),
(5,NULL,NULL,NULL,NULL),
(6,NULL,NULL,NULL,NULL),
(7,NULL,NULL,NULL,NULL),
(8,NULL,NULL,NULL,NULL),
(9,NULL,NULL,NULL,NULL),
(10,NULL,NULL,NULL,NULL),
(11,NULL,NULL,NULL,NULL),
(12,NULL,NULL,NULL,NULL),
(13,NULL,NULL,NULL,NULL),
(14,NULL,NULL,NULL,NULL),
(15,NULL,NULL,NULL,NULL),
(16,NULL,NULL,NULL,NULL),
(17,NULL,NULL,NULL,NULL),
(18,NULL,NULL,1,NULL),
(19,NULL,NULL,NULL,NULL),
(20,NULL,NULL,NULL,NULL),
(21,NULL,NULL,NULL,NULL),
(22,NULL,NULL,NULL,NULL),
(23,NULL,3,NULL,NULL),
(24,NULL,NULL,NULL,NULL),
(25,1,NULL,NULL,NULL),
(26,NULL,NULL,NULL,NULL),
(27,NULL,NULL,NULL,NULL),
(28,NULL,NULL,NULL,NULL),
(29,NULL,NULL,1,NULL),
(30,NULL,NULL,NULL,NULL),
(31,NULL,NULL,NULL,NULL),
(32,NULL,NULL,NULL,NULL),
(33,NULL,NULL,NULL,NULL),
(100,NULL,NULL,NULL,NULL),
(101,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spieler_strafen`
--

DROP TABLE IF EXISTS `spieler_strafen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spieler_strafen` (
  `spielerId` int(11) DEFAULT NULL,
  `geld` int(11) DEFAULT NULL,
  `kiste` int(11) DEFAULT NULL,
  KEY `spielerId` (`spielerId`),
  CONSTRAINT `spieler_strafen_ibfk_1` FOREIGN KEY (`spielerId`) REFERENCES `kader` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spieler_strafen`
--

LOCK TABLES `spieler_strafen` WRITE;
/*!40000 ALTER TABLE `spieler_strafen` DISABLE KEYS */;
INSERT INTO `spieler_strafen` VALUES
(1,0,0),
(2,0,0),
(3,0,0),
(4,0,0),
(5,0,0),
(6,0,0),
(7,0,0),
(8,0,1),
(9,15,0),
(10,0,0),
(11,0,1),
(12,6,0),
(13,0,0),
(14,0,0),
(15,21,0),
(16,0,0),
(17,0,0),
(18,0,0),
(19,0,0),
(20,0,0),
(21,0,0),
(22,4,0),
(23,0,0),
(24,0,0),
(25,8,0),
(26,0,0),
(27,0,0),
(28,0,0),
(29,0,0),
(30,2,0),
(31,2,0),
(32,0,0),
(33,0,0),
(98,0,0),
(99,0,0),
(100,0,1),
(101,0,1);
/*!40000 ALTER TABLE `spieler_strafen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spieltag`
--

DROP TABLE IF EXISTS `spieltag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spieltag` (
  `spielerId` int(11) NOT NULL,
  UNIQUE KEY `spielerId` (`spielerId`),
  CONSTRAINT `spieltag_ibfk_1` FOREIGN KEY (`spielerId`) REFERENCES `kader` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spieltag`
--

LOCK TABLES `spieltag` WRITE;
/*!40000 ALTER TABLE `spieltag` DISABLE KEYS */;
INSERT INTO `spieltag` VALUES
(5),
(10),
(11),
(13),
(14),
(15),
(16),
(19),
(22),
(24),
(25),
(26),
(28),
(29),
(100),
(101);
/*!40000 ALTER TABLE `spieltag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strafen`
--

DROP TABLE IF EXISTS `strafen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `strafen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `strafe` varchar(255) DEFAULT NULL,
  `pro_x_text` varchar(255) DEFAULT NULL,
  `wert_geld` int(11) DEFAULT NULL,
  `wert_kiste` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strafen`
--

LOCK TABLES `strafen` WRITE;
/*!40000 ALTER TABLE `strafen` DISABLE KEYS */;
INSERT INTO `strafen` VALUES
(1,'zu spät beim Training','pro 5 min',2,NULL),
(2,'zu spät beim Spiel','pro 5 min',3,NULL),
(3,'unentschuldigtes Fehlen beim Training',NULL,15,NULL),
(4,'unentschuldigtes Fehlen beim Spiel',NULL,25,1),
(5,'unnötige gelbe Karte',NULL,5,NULL),
(6,'unnötige gelb-rote Karte',NULL,15,NULL),
(7,'unnötige rote Karte',NULL,50,1),
(8,'Sachen am Spieltag vergessen','pro Teil',NULL,1),
(9,'Material vergessen','pro Teil',5,NULL),
(10,'Kiste oder Softdrinks vergessen',NULL,NULL,1),
(11,'Während der Trainersprache am Handy',NULL,2,NULL),
(12,'Vereinskleidung wird zu Spielen nicht getragen','pro Teil',2,NULL),
(13,'Spielkleidung wird zum Training getragen','pro Teil',2,NULL),
(14,'Rauchen im Trikot',NULL,2,NULL);
/*!40000 ALTER TABLE `strafen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strafkisten`
--

DROP TABLE IF EXISTS `strafkisten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `strafkisten` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `strafe` varchar(255) DEFAULT NULL,
  `einmal` enum('TRUE','FALSE') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strafkisten`
--

LOCK TABLES `strafkisten` WRITE;
/*!40000 ALTER TABLE `strafkisten` DISABLE KEYS */;
INSERT INTO `strafkisten` VALUES
(1,'1. mal Kapitän','TRUE'),
(2,'1. Tor in Blau','TRUE'),
(3,'1. Tor in Rot','TRUE'),
(4,'1. Tor in Weiß','TRUE'),
(5,'Doppelpack','FALSE'),
(6,'Hattrick','FALSE'),
(7,'Neue Bolzer','FALSE'),
(8,'Geburtstag','TRUE'),
(9,'Zu früh Bier geöffnet','FALSE'),
(10,'Bier verschüttet','FALSE');
/*!40000 ALTER TABLE `strafkisten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strafkisten_log`
--

DROP TABLE IF EXISTS `strafkisten_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `strafkisten_log` (
  `spielerId` int(11) DEFAULT NULL,
  `strafkistenId` int(11) DEFAULT NULL,
  KEY `spielerId` (`spielerId`),
  KEY `strafkistenId` (`strafkistenId`),
  CONSTRAINT `strafkisten_log_ibfk_1` FOREIGN KEY (`spielerId`) REFERENCES `kader` (`id`),
  CONSTRAINT `strafkisten_log_ibfk_2` FOREIGN KEY (`strafkistenId`) REFERENCES `strafkisten` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strafkisten_log`
--

LOCK TABLES `strafkisten_log` WRITE;
/*!40000 ALTER TABLE `strafkisten_log` DISABLE KEYS */;
INSERT INTO `strafkisten_log` VALUES
(101,2),
(100,8),
(8,8),
(11,9);
/*!40000 ALTER TABLE `strafkisten_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `training` (
  `spielerId` int(11) NOT NULL,
  UNIQUE KEY `spielerId` (`spielerId`),
  CONSTRAINT `training_ibfk_1` FOREIGN KEY (`spielerId`) REFERENCES `kader` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES
(5),
(8),
(9),
(11),
(16),
(20),
(22),
(25),
(26),
(29),
(31),
(101);
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tunnel`
--

DROP TABLE IF EXISTS `tunnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tunnel` (
  `spielerId` int(11) NOT NULL,
  `tunnel` int(11) DEFAULT NULL,
  UNIQUE KEY `spielerId` (`spielerId`),
  CONSTRAINT `tunnel_ibfk_1` FOREIGN KEY (`spielerId`) REFERENCES `kader` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tunnel`
--

LOCK TABLES `tunnel` WRITE;
/*!40000 ALTER TABLE `tunnel` DISABLE KEYS */;
INSERT INTO `tunnel` VALUES
(1,1),
(2,1),
(3,1),
(4,2),
(5,4),
(6,2),
(7,0),
(8,5),
(9,0),
(10,1),
(11,2),
(12,2),
(13,0),
(14,0),
(15,1),
(16,4),
(17,0),
(18,5),
(19,1),
(20,5),
(21,0),
(22,0),
(23,3),
(24,0),
(25,1),
(26,0),
(27,0),
(28,3),
(29,3),
(30,3),
(31,5),
(32,2),
(33,5),
(100,0),
(101,0);
/*!40000 ALTER TABLE `tunnel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-17 11:42:44
