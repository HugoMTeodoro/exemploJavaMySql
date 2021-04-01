-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: db_avicao
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `aviao`
--

DROP TABLE IF EXISTS `aviao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aviao` (
  `prefixo_aeronautico` varchar(6) NOT NULL,
  `modelo` varchar(20) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `assentos` int DEFAULT NULL,
  `capacidade_tanque` int DEFAULT NULL,
  `id_revisao` int DEFAULT NULL,
  PRIMARY KEY (`prefixo_aeronautico`),
  KEY `id_revisao` (`id_revisao`),
  CONSTRAINT `aviao_ibfk_1` FOREIGN KEY (`id_revisao`) REFERENCES `revisao` (`id_revisao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aviao`
--

LOCK TABLES `aviao` WRITE;
/*!40000 ALTER TABLE `aviao` DISABLE KEYS */;
INSERT INTO `aviao` VALUES ('18BOP','BOEING 77',15,15,1500,NULL),('FA07','12',12,90,15000,NULL),('FI09','BOEING 77',15,95,20000,NULL),('HUG007','BEING89',20,1,15000,NULL),('HUG008','AIRBUS',15,100,14000,NULL),('LAA067','airbus',15,100,500,NULL);
/*!40000 ALTER TABLE `aviao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itinerario`
--

DROP TABLE IF EXISTS `itinerario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itinerario` (
  `id_itinerario` int NOT NULL AUTO_INCREMENT,
  `local_partida` varchar(255) DEFAULT NULL,
  `desvios` varchar(255) DEFAULT NULL,
  `rota` varchar(255) DEFAULT NULL,
  `hora_partida` time DEFAULT NULL,
  `hora_chegada` time DEFAULT NULL,
  PRIMARY KEY (`id_itinerario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itinerario`
--

LOCK TABLES `itinerario` WRITE;
/*!40000 ALTER TABLE `itinerario` DISABLE KEYS */;
INSERT INTO `itinerario` VALUES (1,NULL,NULL,'Ouro Branco para Sao Paulo',NULL,NULL);
/*!40000 ALTER TABLE `itinerario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passageiro`
--

DROP TABLE IF EXISTS `passageiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passageiro` (
  `nome` varchar(50) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `cpf` varchar(11) NOT NULL,
  `passaporte` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passageiro`
--

LOCK TABLES `passageiro` WRITE;
/*!40000 ALTER TABLE `passageiro` DISABLE KEYS */;
INSERT INTO `passageiro` VALUES ('hugo',1,'1','1'),('vinicius',1,'2','1'),('Felipe',1,'3','1'),('Mauro',1,'4','1'),('Hugo',1,'5','1'),('Hugo',17,'6','123456');
/*!40000 ALTER TABLE `passageiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passagem`
--

DROP TABLE IF EXISTS `passagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passagem` (
  `id_passagem` int NOT NULL AUTO_INCREMENT,
  `preco` double DEFAULT NULL,
  `poltrona` int DEFAULT NULL,
  `classe` char(1) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `id_voo` int DEFAULT NULL,
  PRIMARY KEY (`id_passagem`),
  KEY `fk_cpf` (`cpf`),
  KEY `fk_id_voo` (`id_voo`),
  CONSTRAINT `fk_cpf` FOREIGN KEY (`cpf`) REFERENCES `passageiro` (`cpf`),
  CONSTRAINT `fk_id_voo` FOREIGN KEY (`id_voo`) REFERENCES `voo` (`id_voo`),
  CONSTRAINT `passagem_ibfk_1` FOREIGN KEY (`id_voo`) REFERENCES `voo` (`id_voo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passagem`
--

LOCK TABLES `passagem` WRITE;
/*!40000 ALTER TABLE `passagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `passagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piloto`
--

DROP TABLE IF EXISTS `piloto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piloto` (
  `habilitacao` varchar(6) NOT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `experiencia` int DEFAULT NULL,
  PRIMARY KEY (`habilitacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piloto`
--

LOCK TABLES `piloto` WRITE;
/*!40000 ALTER TABLE `piloto` DISABLE KEYS */;
INSERT INTO `piloto` VALUES ('123',NULL,'vinicius',NULL,NULL);
/*!40000 ALTER TABLE `piloto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piloto_copiloto`
--

DROP TABLE IF EXISTS `piloto_copiloto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piloto_copiloto` (
  `id_piloto_copiloto` int NOT NULL AUTO_INCREMENT,
  `habilitacao1` varchar(6) DEFAULT NULL,
  `habilitacao2` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id_piloto_copiloto`),
  KEY `fk_habilitacao1` (`habilitacao1`),
  KEY `fk_habilitacao2` (`habilitacao2`),
  CONSTRAINT `fk_habilitacao1` FOREIGN KEY (`habilitacao1`) REFERENCES `piloto` (`habilitacao`),
  CONSTRAINT `fk_habilitacao2` FOREIGN KEY (`habilitacao2`) REFERENCES `piloto` (`habilitacao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piloto_copiloto`
--

LOCK TABLES `piloto_copiloto` WRITE;
/*!40000 ALTER TABLE `piloto_copiloto` DISABLE KEYS */;
INSERT INTO `piloto_copiloto` VALUES (1,'123','123');
/*!40000 ALTER TABLE `piloto_copiloto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisao`
--

DROP TABLE IF EXISTS `revisao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisao` (
  `id_revisao` int NOT NULL AUTO_INCREMENT,
  `revisor` varchar(50) DEFAULT NULL,
  `data_revisao` date DEFAULT NULL,
  `data_abastecimento` date DEFAULT NULL,
  `litragem_abastecimento` int DEFAULT NULL,
  PRIMARY KEY (`id_revisao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisao`
--

LOCK TABLES `revisao` WRITE;
/*!40000 ALTER TABLE `revisao` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tripulacao`
--

DROP TABLE IF EXISTS `tripulacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tripulacao` (
  `id_tripulacao` int NOT NULL AUTO_INCREMENT,
  `cpf_navegador` varchar(11) DEFAULT NULL,
  `cpf_radiooperador` varchar(11) DEFAULT NULL,
  `cpf_comissario` varchar(11) DEFAULT NULL,
  `id_piloto_copiloto` int DEFAULT NULL,
  `cpf_mecanico` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_tripulacao`),
  KEY `fk_id_piloto_copiloto` (`id_piloto_copiloto`),
  KEY `fk_cpf_navegador` (`cpf_navegador`),
  KEY `fk_cpf_radiooperador` (`cpf_radiooperador`),
  KEY `fk_cpf_comissario` (`cpf_comissario`),
  KEY `fk_cpf_mecanico` (`cpf_mecanico`),
  CONSTRAINT `fk_cpf_comissario` FOREIGN KEY (`cpf_comissario`) REFERENCES `tripulante` (`cpf`),
  CONSTRAINT `fk_cpf_mecanico` FOREIGN KEY (`cpf_mecanico`) REFERENCES `tripulante` (`cpf`),
  CONSTRAINT `fk_cpf_navegador` FOREIGN KEY (`cpf_navegador`) REFERENCES `tripulante` (`cpf`),
  CONSTRAINT `fk_cpf_radiooperador` FOREIGN KEY (`cpf_radiooperador`) REFERENCES `tripulante` (`cpf`),
  CONSTRAINT `fk_id_piloto_copiloto` FOREIGN KEY (`id_piloto_copiloto`) REFERENCES `piloto_copiloto` (`id_piloto_copiloto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tripulacao`
--

LOCK TABLES `tripulacao` WRITE;
/*!40000 ALTER TABLE `tripulacao` DISABLE KEYS */;
INSERT INTO `tripulacao` VALUES (3,'123','123','123',1,'123');
/*!40000 ALTER TABLE `tripulacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tripulante`
--

DROP TABLE IF EXISTS `tripulante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tripulante` (
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cargo` varchar(30) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `experiencia` int DEFAULT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tripulante`
--

LOCK TABLES `tripulante` WRITE;
/*!40000 ALTER TABLE `tripulante` DISABLE KEYS */;
INSERT INTO `tripulante` VALUES ('123','hugo',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tripulante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voo`
--

DROP TABLE IF EXISTS `voo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voo` (
  `id_voo` int NOT NULL AUTO_INCREMENT,
  `horario` time DEFAULT NULL,
  `destino` varchar(100) DEFAULT NULL,
  `prefixo_aeronautico` varchar(6) DEFAULT NULL,
  `habilitacao` varchar(6) DEFAULT NULL,
  `dia` date DEFAULT NULL,
  `id_itinerario` int DEFAULT NULL,
  `id_tripulacao` int DEFAULT NULL,
  PRIMARY KEY (`id_voo`),
  KEY `fk_aviao` (`prefixo_aeronautico`),
  KEY `fk_piloto` (`habilitacao`),
  KEY `id_itinerario` (`id_itinerario`),
  KEY `id_tripulacao` (`id_tripulacao`),
  CONSTRAINT `fk_aviao` FOREIGN KEY (`prefixo_aeronautico`) REFERENCES `aviao` (`prefixo_aeronautico`),
  CONSTRAINT `fk_piloto` FOREIGN KEY (`habilitacao`) REFERENCES `piloto` (`habilitacao`),
  CONSTRAINT `voo_ibfk_1` FOREIGN KEY (`id_itinerario`) REFERENCES `itinerario` (`id_itinerario`),
  CONSTRAINT `voo_ibfk_2` FOREIGN KEY (`id_tripulacao`) REFERENCES `tripulacao` (`id_tripulacao`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voo`
--

LOCK TABLES `voo` WRITE;
/*!40000 ALTER TABLE `voo` DISABLE KEYS */;
INSERT INTO `voo` VALUES (30,'12:00:00','Boston','LAA067',NULL,'2000-09-21',1,3),(39,'13:00:00','SP','FI09',NULL,'2020-10-21',1,3),(40,'13:00:00','Sete lagoas','HUG008',NULL,'2020-10-25',1,3);
/*!40000 ALTER TABLE `voo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-01 11:03:02
