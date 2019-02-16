CREATE DATABASE api;

USE api; 
--
-- Table structure for table `cause_inci`
--

DROP TABLE IF EXISTS `cause_inci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cause_inci` (
  `ID_G` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CAUSE` int(11) NOT NULL,
  `ID_INCI` int(11) NOT NULL,
  PRIMARY KEY (`ID_G`),
  KEY `ID_CAUSE` (`ID_CAUSE`),
  KEY `ID_INCI` (`ID_INCI`),
  CONSTRAINT `cause_inci_ibfk_1` FOREIGN KEY (`ID_CAUSE`) REFERENCES `causes` (`ID_CAUSE`),
  CONSTRAINT `cause_inci_ibfk_2` FOREIGN KEY (`ID_INCI`) REFERENCES `incidents` (`ID_INCI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cause_inci`
--

LOCK TABLES `cause_inci` WRITE;
/*!40000 ALTER TABLE `cause_inci` DISABLE KEYS */;
/*!40000 ALTER TABLE `cause_inci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `causes`
--

DROP TABLE IF EXISTS `causes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `causes` (
  `ID_CAUSE` int(11) NOT NULL AUTO_INCREMENT,
  `CAUSE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_CAUSE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `causes`
--

LOCK TABLES `causes` WRITE;
/*!40000 ALTER TABLE `causes` DISABLE KEYS */;
/*!40000 ALTER TABLE `causes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `incidents` (
  `ID_INCI` int(11) NOT NULL AUTO_INCREMENT,
  `ID_OWNER` int(11) NOT NULL,
  `ID_QUEUE` int(11) NOT NULL,
  `ID_CAUSE` int(11) NOT NULL,
  `DATE` timestamp NOT NULL,
  `TICKET_NUM` int(11) DEFAULT NULL,
  `TICKET_ID` int(11) DEFAULT NULL,
  `COMMENTS` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_INCI`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents`
--

LOCK TABLES `incidents` WRITE;
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` VALUES (1,1,1,1,'2038-01-19 03:14:07',1,1,'olis');
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `own_inci`
--

DROP TABLE IF EXISTS `own_inci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `own_inci` (
  `ID_G` int(11) NOT NULL AUTO_INCREMENT,
  `ID_OWNER` int(11) NOT NULL,
  `ID_INCI` int(11) NOT NULL,
  PRIMARY KEY (`ID_G`),
  KEY `ID_OWNER` (`ID_OWNER`),
  KEY `ID_INCI` (`ID_INCI`),
  CONSTRAINT `own_inci_ibfk_1` FOREIGN KEY (`ID_OWNER`) REFERENCES `owner` (`ID_OWNER`),
  CONSTRAINT `own_inci_ibfk_2` FOREIGN KEY (`ID_INCI`) REFERENCES `incidents` (`ID_INCI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `own_inci`
--

LOCK TABLES `own_inci` WRITE;
/*!40000 ALTER TABLE `own_inci` DISABLE KEYS */;
/*!40000 ALTER TABLE `own_inci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `owner` (
  `ID_OWNER` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_OWNER`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,'pablo');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_inci`
--

DROP TABLE IF EXISTS `queue_inci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `queue_inci` (
  `ID_G` int(11) NOT NULL AUTO_INCREMENT,
  `ID_queues` int(11) NOT NULL,
  `ID_INCI` int(11) NOT NULL,
  PRIMARY KEY (`ID_G`),
  KEY `ID_queues` (`ID_queues`),
  KEY `ID_INCI` (`ID_INCI`),
  CONSTRAINT `queue_inci_ibfk_1` FOREIGN KEY (`ID_queues`) REFERENCES `queues` (`ID_queues`),
  CONSTRAINT `queue_inci_ibfk_2` FOREIGN KEY (`ID_INCI`) REFERENCES `incidents` (`ID_INCI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_inci`
--

LOCK TABLES `queue_inci` WRITE;
/*!40000 ALTER TABLE `queue_inci` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_inci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queues`
--

DROP TABLE IF EXISTS `queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `queues` (
  `ID_queues` int(11) NOT NULL AUTO_INCREMENT,
  `QUEUES` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_queues`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queues`
--

LOCK TABLES `queues` WRITE;
/*!40000 ALTER TABLE `queues` DISABLE KEYS */;
/*!40000 ALTER TABLE `queues` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
