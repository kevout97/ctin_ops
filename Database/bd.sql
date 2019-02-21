CREATE DATABASE api;

USE api; 


DROP TABLE IF EXISTS `causes`;
CREATE TABLE `causes` (
  `ID_CAUSE` int(11) NOT NULL AUTO_INCREMENT,
  `CAUSE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_CAUSE`)
);


DROP TABLE IF EXISTS `incidents`;
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
);


DROP TABLE IF EXISTS `owner`;
CREATE TABLE `owner` (
  `ID_OWNER` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_OWNER`)
);

DROP TABLE IF EXISTS `queues`;
CREATE TABLE `queues` (
  `ID_queues` int(11) NOT NULL,
  `QUEUES` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_queues`)
);

DROP TABLE IF EXISTS `cause_inci`;
CREATE TABLE `cause_inci` (
  `ID_G` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CAUSE` int(11) NOT NULL,
  `ID_INCI` int(11) NOT NULL,
  PRIMARY KEY (`ID_G`),
  KEY `ID_CAUSE` (`ID_CAUSE`),
  KEY `ID_INCI` (`ID_INCI`),
  CONSTRAINT `cause_inci_ibfk_1` FOREIGN KEY (`ID_CAUSE`) REFERENCES `causes` (`ID_CAUSE`),
  CONSTRAINT `cause_inci_ibfk_2` FOREIGN KEY (`ID_INCI`) REFERENCES `incidents` (`ID_INCI`)
);

DROP TABLE IF EXISTS `own_inci`;
CREATE TABLE `own_inci` (
  `ID_G` int(11) NOT NULL AUTO_INCREMENT,
  `ID_OWNER` int(11) NOT NULL,
  `ID_INCI` int(11) NOT NULL,
  PRIMARY KEY (`ID_G`),
  KEY `ID_OWNER` (`ID_OWNER`),
  KEY `ID_INCI` (`ID_INCI`),
  CONSTRAINT `own_inci_ibfk_1` FOREIGN KEY (`ID_OWNER`) REFERENCES `owner` (`ID_OWNER`),
  CONSTRAINT `own_inci_ibfk_2` FOREIGN KEY (`ID_INCI`) REFERENCES `incidents` (`ID_INCI`)
);

DROP TABLE IF EXISTS `queue_inci`;
CREATE TABLE `queue_inci` (
  `ID_G` int(11) NOT NULL AUTO_INCREMENT,
  `ID_queues` int(11) NOT NULL,
  `ID_INCI` int(11) NOT NULL,
  PRIMARY KEY (`ID_G`),
  KEY `ID_queues` (`ID_queues`),
  KEY `ID_INCI` (`ID_INCI`),
  CONSTRAINT `queue_inci_ibfk_1` FOREIGN KEY (`ID_queues`) REFERENCES `queues` (`ID_queues`),
  CONSTRAINT `queue_inci_ibfk_2` FOREIGN KEY (`ID_INCI`) REFERENCES `incidents` (`ID_INCI`)
);

INSERT INTO causes(CAUSE) VALUES('Capacitacion'), ('Documentacion'), ('Error humano');
INSERT INTO owner(ID_OWNER,NAME) VALUES(6, 'Jose Villa'),(7, 'Metztli Alonso'),(8, 'Eduardo Sanchez'),(9, 'Axl Lopez'),(10, 'Oscar Meza'),(11, 'Magali Lopez');
INSERT INTO queues(ID_queues, QUEUES) VALUES(9, 'AMX-Capacitacion'),(29, 'AMX-ClaroMusica-dla'),(27, 'AMX-ClaroPagos'),(14, 'AMX-Claroshop'),(33, 'AMX-Claroshop::amx-arladm'),
(20, 'AMX-eCommerce'),(8, 'AMX-GI-Administracion-Interna'),(12, 'AMX-Intermediacion-Terceros'),(18, 'AMX-Intermediacion-Terceros::amx-triara-fw'),(5, 'AMX-Portales Comerciales'),
(10, 'AMX-Portales Comerciales::amx-casos'),(26, 'AMX-Portales Comerciales::amx-ssgt'),(25, 'AMX-Portales Comerciales::ClaroChile'),(24, 'AMX-Portales Comerciales::ClaroPeru'),
(11, 'AMX-Portales Comerciales::Ecuador'),(21, 'AMX-Portales-Cloud'),(17, 'AMX-Proyectos Generales-TyP'),(28,'AMX-Sears-Legacy'),(23, 'AMX-SelfService-CENAM'),(22, 'AMX-SelfService-Chile'),
(15, 'AMX-SelfService-Colombia'),(16,'AMX-UNOTV'),(32,'AMX-USA');