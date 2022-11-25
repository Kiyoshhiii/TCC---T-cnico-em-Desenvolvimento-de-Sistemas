CREATE DATABASE  IF NOT EXISTS `medweg` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `medweg`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: medweg
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `cadastro_cliente`
--

DROP TABLE IF EXISTS `cadastro_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadastro_cliente` (
  `nome_cli` varchar(255) NOT NULL,
  `cpf_cli` varchar(17) NOT NULL,
  `data_nasc_cli` date NOT NULL,
  `email_cli` varchar(255) NOT NULL,
  `senha_cli` varchar(255) NOT NULL,
  `celular_cli` varchar(50) NOT NULL,
  `cidade_cli` varchar(255) NOT NULL,
  `estado_cli` char(2) NOT NULL,
  PRIMARY KEY (`cpf_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastro_cliente`
--

LOCK TABLES `cadastro_cliente` WRITE;
/*!40000 ALTER TABLE `cadastro_cliente` DISABLE KEYS */;
INSERT INTO `cadastro_cliente` VALUES ('Lucas','45678912345','2004-09-11','lucas@gmail.com','12345678','43991478569','Londrina','PR');
/*!40000 ALTER TABLE `cadastro_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadastro_farmacia`
--

DROP TABLE IF EXISTS `cadastro_farmacia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadastro_farmacia` (
  `unidade_far` int(20) NOT NULL,
  `senha_far` varchar(255) NOT NULL,
  `empresa_far` varchar(255) NOT NULL,
  `cidade_far` varchar(255) NOT NULL,
  `rua_far` varchar(255) NOT NULL,
  `bairro_far` varchar(255) NOT NULL,
  `estado_far` char(2) NOT NULL,
  `numero_far` varchar(6) NOT NULL,
  `telefone_far` varchar(255) NOT NULL,
  PRIMARY KEY (`unidade_far`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastro_farmacia`
--

LOCK TABLES `cadastro_farmacia` WRITE;
/*!40000 ALTER TABLE `cadastro_farmacia` DISABLE KEYS */;
INSERT INTO `cadastro_farmacia` VALUES (155,'123456678','Drogaraia','Londrina','São João','Centro','PR','169','4333567848'),(178,'12345678','DrogaMais','Londrina','São Luis','Centro','PR','174','4333567849'),(456,'123456789','Pacheco','Londrina','Santos Dumont','Centro','PR','471','4333129685');
/*!40000 ALTER TABLE `cadastro_farmacia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_cli_far`
--

DROP TABLE IF EXISTS `compra_cli_far`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_cli_far` (
  `cod_prod` int(20) NOT NULL,
  `num_tel_comp` varchar(255) NOT NULL,
  `num_casa_comp` varchar(6) NOT NULL,
  `nome_rua_comp` varchar(255) NOT NULL,
  `prim_nome_comp` varchar(255) NOT NULL,
  `sobrenome_comp` varchar(255) NOT NULL,
  `forma_paga` varchar(255) NOT NULL,
  `cpf_comp` varchar(17) NOT NULL,
  `cep_comp` varchar(9) NOT NULL,
  `email_comp` varchar(255) DEFAULT NULL,
  `nome_bairro_comp` varchar(255) DEFAULT NULL,
  `numero_cartao` int(11) DEFAULT NULL,
  `codigo_cartao` int(11) DEFAULT NULL,
  `data_expira` date DEFAULT NULL,
  `contin_unico_reser` varchar(255) DEFAULT NULL,
  `data_reser` date DEFAULT NULL,
  KEY `cod_prod` (`cod_prod`),
  CONSTRAINT `compra_cli_far_ibfk_2` FOREIGN KEY (`cod_prod`) REFERENCES `produto` (`cod_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_cli_far`
--

LOCK TABLES `compra_cli_far` WRITE;
/*!40000 ALTER TABLE `compra_cli_far` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_cli_far` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `cod_prod` int(20) NOT NULL,
  `estoque_prod` int(11) NOT NULL,
  `preco_prod` double(8,2) NOT NULL,
  `nome_prod` varchar(255) NOT NULL,
  `descricao_prod` varchar(255) NOT NULL,
  `tipo_prod` varchar(255) NOT NULL,
  `unidade_far` int(20) DEFAULT NULL,
  PRIMARY KEY (`cod_prod`),
  KEY `unidade_far` (`unidade_far`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`unidade_far`) REFERENCES `cadastro_farmacia` (`unidade_far`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (12,123,2.00,'gustavo','deixar doidao','Medicamento',NULL),(234,234,234.00,'sdf','234','Alimento',NULL),(8679,234,45.00,'jsdfj','rtgfg','Alimento',NULL),(23443,234,2342.00,'4234234','234234','Alimento',NULL),(98767,243,56.00,'asgjd','sfjkdhkajsd','Alimento',NULL),(253345,867,100.00,'Daniel','professor','Higiene',NULL),(6564564,345,45.56,'445345','345345','Alimento',NULL),(234234234,2345,2000.00,'layon','234234234','Beleza',NULL),(435345345,435345,345.46,'345345','345345','Alimento',NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-10 16:37:46
