CREATE DATABASE  IF NOT EXISTS `seafood_service_v4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `seafood_service_v4`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: seafood_service_v4
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_name` varchar(64) NOT NULL,
  PRIMARY KEY (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('Fresh'),('Frozen'),('Non-Refrigerated');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `coupon_code` varchar(10) NOT NULL,
  `coupon_discount_amt` float NOT NULL DEFAULT '0.1',
  `coupon_expiration_date` date DEFAULT NULL,
  `coupon_description` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES ('Fall2023',0.1,NULL,NULL),('ISF2023',0.1,NULL,NULL),('SANTA',0.1,NULL,NULL),('Summer2024',0.1,NULL,NULL);
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `c_fname` varchar(64) NOT NULL,
  `c_lname` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `pwd` varchar(64) NOT NULL,
  `phone` char(11) NOT NULL,
  `street` varchar(64) NOT NULL,
  `apt` varchar(8) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `zip` char(5) NOT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'user2','user1lname','zyx@123.com','234423','123123123','st123','5','Bos','02114');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `order_id` int NOT NULL,
  `delivery_partner_id` int NOT NULL,
  `expected_delivery_date` date NOT NULL,
  `delivery_status` enum('placed','in-transit','delivered') DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `delivery_partner_id` (`delivery_partner_id`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_invoice` (`order_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`delivery_partner_id`) REFERENCES `delivery_partner` (`partner_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,1,'2023-12-06','placed');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_partner`
--

DROP TABLE IF EXISTS `delivery_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_partner` (
  `partner_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `phone` char(11) NOT NULL,
  PRIMARY KEY (`partner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_partner`
--

LOCK TABLES `delivery_partner` WRITE;
/*!40000 ALTER TABLE `delivery_partner` DISABLE KEYS */;
INSERT INTO `delivery_partner` VALUES (1,'delivery_1','delivery_last','12784'),(2,'delivery_2','delivery_last2','12784454');
/*!40000 ALTER TABLE `delivery_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_zone`
--

DROP TABLE IF EXISTS `delivery_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_zone` (
  `zipcode` char(5) NOT NULL,
  `partner_id` int NOT NULL,
  PRIMARY KEY (`zipcode`),
  KEY `partner_id` (`partner_id`),
  CONSTRAINT `delivery_zone_ibfk_1` FOREIGN KEY (`partner_id`) REFERENCES `delivery_partner` (`partner_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_zone`
--

LOCK TABLES `delivery_zone` WRITE;
/*!40000 ALTER TABLE `delivery_zone` DISABLE KEYS */;
INSERT INTO `delivery_zone` VALUES ('02114',1),('02115',2);
/*!40000 ALTER TABLE `delivery_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_invoice`
--

DROP TABLE IF EXISTS `order_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_invoice` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `payment_type` varchar(16) NOT NULL,
  `coupon_code` varchar(10) DEFAULT NULL,
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `payment_type` (`payment_type`),
  KEY `coupon_code` (`coupon_code`),
  CONSTRAINT `order_invoice_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_invoice_ibfk_2` FOREIGN KEY (`payment_type`) REFERENCES `payment` (`payment_type`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `order_invoice_ibfk_3` FOREIGN KEY (`coupon_code`) REFERENCES `coupon` (`coupon_code`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_invoice`
--

LOCK TABLES `order_invoice` WRITE;
/*!40000 ALTER TABLE `order_invoice` DISABLE KEYS */;
INSERT INTO `order_invoice` VALUES (1,1,'Credit/Debit','ISF2023','2023-12-05 19:31:21');
/*!40000 ALTER TABLE `order_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `order_id` int NOT NULL,
  `p_name` varchar(64) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`order_id`,`p_name`),
  KEY `p_name` (`p_name`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_invoice` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`p_name`) REFERENCES `product` (`p_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,'scallop sashimi 1lb',3);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_type` varchar(16) NOT NULL,
  `img` varchar(64) DEFAULT NULL,
  `payment_text` varchar(64) DEFAULT NULL,
  `bg_color` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('Credit/Debit',NULL,NULL,NULL),('PayPal',NULL,NULL,NULL),('Venmo',NULL,NULL,NULL),('Zelle',NULL,NULL,NULL);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `p_name` varchar(64) NOT NULL,
  `category` varchar(64) NOT NULL,
  `sell_price` int NOT NULL,
  `p_description` varchar(64) DEFAULT NULL,
  `qty_in_stock` int NOT NULL DEFAULT '0',
  `product_img` varchar(64) NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `p_name` (`p_name`),
  KEY `category` (`category`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`category_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'scallop sashimi 1lb','Frozen',30,NULL,25,'dummy_url'),(2,'maine uni 150g','Fresh',28,NULL,50,'dummy_url');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `vendor_id` int NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `phone_number` int NOT NULL,
  `steet_number` int NOT NULL,
  `street_name` varchar(64) NOT NULL,
  `city` varchar(25) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip` int NOT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_supplies_seafood_product`
--

DROP TABLE IF EXISTS `vendor_supplies_seafood_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_supplies_seafood_product` (
  `vendor_id` int NOT NULL,
  `pid` int NOT NULL AUTO_INCREMENT,
  `price_per_qty` float NOT NULL,
  PRIMARY KEY (`vendor_id`,`pid`),
  KEY `pid` (`pid`),
  CONSTRAINT `vendor_supplies_seafood_product_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `vendor_supplies_seafood_product_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_supplies_seafood_product`
--

LOCK TABLES `vendor_supplies_seafood_product` WRITE;
/*!40000 ALTER TABLE `vendor_supplies_seafood_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_supplies_seafood_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'seafood_service_v4'
--
/*!50003 DROP PROCEDURE IF EXISTS `begin_delivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `begin_delivery`(
    IN c_order_id INT
)
BEGIN
	DECLARE order_id_exists INT;
    DECLARE cid_exists CHAR(5);
	DECLARE partner_ids INT;
    DECLARE count_items INT;
    DECLARE delivery_date DATE;

	SELECT customer_id INTO order_id_exists FROM order_invoice WHERE order_id = c_order_id;
    SELECT zip INTO cid_exists from customer WHERE cid = order_id_exists;
    select partner_id INTO partner_ids from delivery_zone where zipcode = (select zip from customer where cid = order_id_exists);
    SELECT COUNT(*) INTO count_items from order_item where order_id = c_order_id;
    select cid_exists;
    
	SET delivery_date = CASE
		WHEN count_items < 5 THEN DATE_ADD(NOW(), INTERVAL 1 DAY)
		WHEN count_items <= 10 THEN DATE_ADD(NOW(), INTERVAL 2 DAY)
		ELSE DATE_ADD(NOW(), INTERVAL 5 DAY)
	END;
    
    INSERT INTO delivery(order_id, delivery_partner_id, expected_delivery_date, delivery_status) 
    VALUES(c_order_id, partner_ids, delivery_date, 'placed');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-05 19:42:29
