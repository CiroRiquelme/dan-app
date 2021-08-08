CREATE DATABASE  IF NOT EXISTS `ms_pedidos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ms_pedidos`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ms_pedidos
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `id_det_ped` int(11) NOT NULL AUTO_INCREMENT,
  `can_det_ped` int(11) NOT NULL,
  `prec_det_ped` double NOT NULL,
  `id_prod` int(11) DEFAULT NULL,
  `id_ped` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_det_ped`),
  KEY `FKbl5xtiqrosjg6my2fsser8w0s` (`id_prod`),
  KEY `FKt395ib6ar76g7l6ff4wi8dhwk` (`id_ped`),
  CONSTRAINT `FKbl5xtiqrosjg6my2fsser8w0s` FOREIGN KEY (`id_prod`) REFERENCES `producto` (`id_prod`),
  CONSTRAINT `FKt395ib6ar76g7l6ff4wi8dhwk` FOREIGN KEY (`id_ped`) REFERENCES `pedido` (`id_ped`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,10,10,1,1),(2,20,20,2,1),(3,10,10,1,2),(4,20,20,2,2),(5,10,10,1,3),(6,20,30,3,3);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_pedido`
--

DROP TABLE IF EXISTS `estado_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_pedido` (
  `id_est_ped` int(11) NOT NULL,
  `desc_estado` varchar(255) NOT NULL,
  PRIMARY KEY (`id_est_ped`),
  UNIQUE KEY `UK_lik9qxuqollulcbl22j676yws` (`desc_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_pedido`
--

LOCK TABLES `estado_pedido` WRITE;
/*!40000 ALTER TABLE `estado_pedido` DISABLE KEYS */;
INSERT INTO `estado_pedido` VALUES (5,'ACEPTADO'),(4,'CANCELADO'),(2,'CONFIRMADO'),(7,'EN PREPARACION'),(8,'ENTREGADO'),(1,'NUEVO'),(3,'PENDIENTE'),(6,'RECHAZADO');
/*!40000 ALTER TABLE `estado_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obra`
--

DROP TABLE IF EXISTS `obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obra` (
  `id_obra` int(11) NOT NULL,
  `desc_obra` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_obra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obra`
--

LOCK TABLES `obra` WRITE;
/*!40000 ALTER TABLE `obra` DISABLE KEYS */;
INSERT INTO `obra` VALUES (1,'Obra 1'),(2,'Obra 2'),(3,'Obra 3');
/*!40000 ALTER TABLE `obra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_ped` int(11) NOT NULL AUTO_INCREMENT,
  `fec_ped` datetime(6) DEFAULT NULL,
  `id_est_ped` int(11) DEFAULT NULL,
  `id_obra` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ped`),
  KEY `FK3mgg0u46x92w6g6rci1g7hn9e` (`id_est_ped`),
  KEY `FKmtnlpv8yx33wfgetcgeuatap0` (`id_obra`),
  CONSTRAINT `FK3mgg0u46x92w6g6rci1g7hn9e` FOREIGN KEY (`id_est_ped`) REFERENCES `estado_pedido` (`id_est_ped`),
  CONSTRAINT `FKmtnlpv8yx33wfgetcgeuatap0` FOREIGN KEY (`id_obra`) REFERENCES `obra` (`id_obra`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2020-01-01 10:10:10.000000',5,1),(2,'2020-01-01 10:10:10.000000',5,2),(3,'2020-01-01 10:10:10.000000',5,3);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_prod` int(11) NOT NULL,
  `desc_prod` varchar(255) DEFAULT NULL,
  `prec_prod` double DEFAULT NULL,
  PRIMARY KEY (`id_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Ladrillo',10),(2,'Cemento',20),(3,'Yeso',30);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-27  0:42:08
CREATE DATABASE  IF NOT EXISTS `ms_material` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ms_material`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ms_material
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `id_det_ped` int(11) NOT NULL,
  `can_det_ped` int(11) NOT NULL,
  `id_mat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_det_ped`),
  KEY `FK48b0y31g2i4k683qbx3q5avu8` (`id_mat`),
  CONSTRAINT `FK48b0y31g2i4k683qbx3q5avu8` FOREIGN KEY (`id_mat`) REFERENCES `material` (`id_mat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_provision`
--

DROP TABLE IF EXISTS `detalle_provision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_provision` (
  `id_det_prov` int(11) NOT NULL AUTO_INCREMENT,
  `cant_mat` int(11) DEFAULT NULL,
  `id_mat` int(11) DEFAULT NULL,
  `id_prov` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_det_prov`),
  KEY `FKoxqy676dfcy9o6b237oy2h4go` (`id_mat`),
  KEY `FKhj8uccqgcird2eimn25vyon10` (`id_prov`),
  CONSTRAINT `FKhj8uccqgcird2eimn25vyon10` FOREIGN KEY (`id_prov`) REFERENCES `provision` (`id_prov`),
  CONSTRAINT `FKoxqy676dfcy9o6b237oy2h4go` FOREIGN KEY (`id_mat`) REFERENCES `material` (`id_mat`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_provision`
--

LOCK TABLES `detalle_provision` WRITE;
/*!40000 ALTER TABLE `detalle_provision` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_provision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (17);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `id_mat` int(11) NOT NULL AUTO_INCREMENT,
  `desc_mat` varchar(255) DEFAULT NULL,
  `nom_mat` varchar(255) DEFAULT NULL,
  `prec_mat` double DEFAULT NULL,
  `stock_act_mat` int(11) DEFAULT NULL,
  `stock_min_mat` int(11) DEFAULT NULL,
  `id_uni` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_mat`),
  UNIQUE KEY `UK_4uvq07dkhl7krqab8s3pjccd1` (`nom_mat`),
  KEY `FKtllv8q99kv3xma9h5hix19at3` (`id_uni`),
  CONSTRAINT `FKtllv8q99kv3xma9h5hix19at3` FOREIGN KEY (`id_uni`) REFERENCES `unidad` (`id_uni`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'Ladrillos Huecos baratos','Ladrillo',5,180,5,1),(2,'Descripcion cemento','Cemento',20,180,10,4),(3,'Descripcion yeso','Yeso',30,300,10,4);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento_stock`
--

DROP TABLE IF EXISTS `movimiento_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento_stock` (
  `id_mov_stock` int(11) NOT NULL,
  `cant_ent_mov_stock` int(11) DEFAULT NULL,
  `cant_sal_mov_stock` int(11) DEFAULT NULL,
  `fec_mov_stock` datetime(6) DEFAULT NULL,
  `id_det_ped` int(11) DEFAULT NULL,
  `id_det_prov` int(11) DEFAULT NULL,
  `id_mat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_mov_stock`),
  KEY `FK23vqq419jllpguoaok7jokdsl` (`id_det_ped`),
  KEY `FK7m7ljijh3e5rm0fo5e169kgp7` (`id_det_prov`),
  KEY `FKj99roxvusihlpqxwsmtghc3a2` (`id_mat`),
  CONSTRAINT `FK23vqq419jllpguoaok7jokdsl` FOREIGN KEY (`id_det_ped`) REFERENCES `detalle_pedido` (`id_det_ped`),
  CONSTRAINT `FK7m7ljijh3e5rm0fo5e169kgp7` FOREIGN KEY (`id_det_prov`) REFERENCES `detalle_provision` (`id_det_prov`),
  CONSTRAINT `FKj99roxvusihlpqxwsmtghc3a2` FOREIGN KEY (`id_mat`) REFERENCES `material` (`id_mat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento_stock`
--

LOCK TABLES `movimiento_stock` WRITE;
/*!40000 ALTER TABLE `movimiento_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provision`
--

DROP TABLE IF EXISTS `provision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provision` (
  `id_prov` int(11) NOT NULL AUTO_INCREMENT,
  `fec_prov` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id_prov`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provision`
--

LOCK TABLES `provision` WRITE;
/*!40000 ALTER TABLE `provision` DISABLE KEYS */;
INSERT INTO `provision` VALUES (1,'2021-05-29 21:45:17.964000');
/*!40000 ALTER TABLE `provision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad`
--

DROP TABLE IF EXISTS `unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad` (
  `id_uni` int(11) NOT NULL,
  `desc_uni` varchar(255) NOT NULL,
  PRIMARY KEY (`id_uni`),
  UNIQUE KEY `UK_mr0c5qogrfcwcs73nyu5ffcvi` (`desc_uni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad`
--

LOCK TABLES `unidad` WRITE;
/*!40000 ALTER TABLE `unidad` DISABLE KEYS */;
INSERT INTO `unidad` VALUES (4,'KILOS'),(3,'LITROS'),(2,'METROS'),(1,'UNIDADES');
/*!40000 ALTER TABLE `unidad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-27  0:42:09
