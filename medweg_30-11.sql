CREATE DATABASE  IF NOT EXISTS `medweg` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `medweg`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: medweg
-- ------------------------------------------------------
-- Server version	8.0.29

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
INSERT INTO `cadastro_cliente` VALUES ('Coronado','12754878963','2005-10-05','coronado@gmail.com','12345678','43991332334','Londrina','PR'),('Lucas','45678912345','2004-09-11','lucas@gmail.com','12345678','43991478569','Londrina','PR');
/*!40000 ALTER TABLE `cadastro_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadastro_farmacia`
--

DROP TABLE IF EXISTS `cadastro_farmacia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadastro_farmacia` (
  `unidade_far` int NOT NULL,
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
INSERT INTO `cadastro_farmacia` VALUES (1,'12345678','A Botica Drogaria','Londrina','Santos Dumont','Centro','PR','100','4333147589'),(2,'12345678','Avenida Drogaria','Londrina','Inglaterra','Centro','PR','101','4333147545'),(3,'12345678','BioVida Comércio Pharmacêutico','Londrina','Santos Dumont','Centro','PR','102','4333144517'),(4,'12345678','BioVida Farmácias','Londrina','Souza Naves','Centro','PR','103','4333687598'),(5,'12345678','Boticário Pharma','Londrina','São João','Centro','PR','104','4333967585'),(6,'12345678','Casa do Farmacêutico','Londrina','Souza Naves','Centro','PR','105','4333146974'),(7,'12345678','Comercial Drugstore','Londrina','Robert Koch','Centro','PR','107','4333471245'),(8,'12345678','Droga Alpha','Londrina','Santos Dumont','Centro','PR','109','4333698514'),(9,'12345678','Central dos Medicamentos','Londrina','Robert Koch','Centro','PR','110','4333636547'),(10,'12345678','Drogacity Drogarias','Londrina','Juscelino Kubitschek','Centro','PR','111','4333686396'),(11,'12345678','Drogaria Atacado','Londrina','Juscelino Kubitschek','Centro','PR','121','4333258974');
/*!40000 ALTER TABLE `cadastro_farmacia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_cli_far`
--

DROP TABLE IF EXISTS `compra_cli_far`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_cli_far` (
  `cod_prod` int NOT NULL,
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
  `numero_cartao` int DEFAULT NULL,
  `codigo_cartao` int DEFAULT NULL,
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
  `cod_prod` int NOT NULL,
  `estoque_prod` int NOT NULL,
  `preco_prod` double(8,2) NOT NULL,
  `nome_prod` varchar(255) NOT NULL,
  `descricao_prod` varchar(255) NOT NULL,
  `tipo_prod` varchar(255) NOT NULL,
  `unidade_far` int DEFAULT NULL,
  `link_prod` varchar(15000) DEFAULT NULL,
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
INSERT INTO `produto` VALUES (10,23,20.00,'Dipirona','Para dores','Medicamento',1,'http://www.farmace.com.br/images/2019/05/18/butil-escop+dipir-monoid-6,67+333,4mg,mL.png'),(11,13,25.00,'Paracetamol','Alivia a dor','Medicamento',1,'https://santaluciadrogaria.vtexassets.com/arquivos/ids/164573/7896112149705.png?v=637638166257400000'),(12,4,90.00,'Fralda Pampers','Fralda Pampers Ajuste Total','Higiene',1,'https://images.ctfassets.net/nhtsjibbyili/95d21df583f55faeead2ef0741321e9a5208c84e537038d78d2f936b523f5445/385e1da56ea856679accded92c7b60ce/Ehub_PampersBR_Power-Images-560x390_CFS-Pants.png'),(13,3,35.00,'Batom Vult 3 Unidades','Batom Vult cores vermelho escuro, claro, forte','Beleza',1,'https://res.cloudinary.com/beleza-na-web/image/upload/w_1500,f_auto,fl_progressive,q_auto:eco,w_800/v1/imagens/product/81162/87867414-78d6-4bf8-b4c0-e49789b268aa-81162-pai-69422-69423-69424.png'),(20,5,7.00,'Escova de Dente OralB','Escova Ortodôntica 1 unidade','Higiene',2,'https://images.ctfassets.net/ynyrv8292f9c/4GcNH1W3Vpd0sHFe5NAvtN/c3b10b5577911780904016481172643c/file.png'),(21,7,8.00,'Creme Dental Colgate','Máxima Proteção Anticáries','Higiene',2,'https://superprix.vteximg.com.br/arquivos/ids/169474-600-600/Creme-Dental-Colgate-Maxima-Protecao-Anticaries-Menta-90g.jpg?v=636094510213870000'),(22,10,50.00,'Autoteste Nasal Covid-19 Polimix','1 unidade, teste rápido','Medicamento',2,'https://dmvfarma.vtexassets.com/arquivos/ids/199132/MicrosoftTeams-image--19-.png?v=637834835033600000'),(23,5,10.00,'Desodorante Nivea','Black and White','Higiene',2,'https://farmaciaindiana.vteximg.com.br/arquivos/ids/225816/4005900036728.png?v=637324207228930000'),(30,5,7.00,'Sabonete Líquido Lux','Sabonete Líquido Lavanda Lux','Higiene',3,'https://giassi.vtexassets.com/arquivos/ids/504577/Sabonete-Liquido-Lavanda-Lux-Botanicals-Sache-200ml-Refil.png?v=637994693242230000'),(31,6,15.00,'Aspirina','Aspirina Bayer','Medicamento',3,'https://guiadafarmacia.com.br/consulta-medicamentos/wp-content/uploads/2021/07/7891106004213.png'),(32,4,90.00,'Whey Bar Probiótica','Barra de Proteína 24 unidades','Alimento',3,'https://www.madrugaosuplementos.com.br/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/w/h/whey-bar-creamy-amendoim-com-caramelo_2.png'),(33,7,20.00,'Shampoo INFANTIL JOHNSONS','Shampoo BABY REGULAR 200ML','Higiene',3,'https://giassi.vtexassets.com/arquivos/ids/513531/Shampoo-de-Glicerina-Johnson-s-Baby-Frasco-200ml-.png?v=637995142445130000');
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

-- Dump completed on 2022-11-30 20:10:58
