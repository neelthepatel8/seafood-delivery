-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: db-mysql-nyc1-26951-do-user-14685697-0.c.db.ondigitalocean.com    Database: seafood_service_v4
-- ------------------------------------------------------
-- Server version	8.0.30

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'c9fea61c-9478-11ee-abe8-82f6459b7568:1-2200';

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
INSERT INTO `category` VALUES ('Fresh'),('Frozen'),('Non-Refrigerated'),('Refrigerated');
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
INSERT INTO `coupon` VALUES ('',0,'9999-01-01','Default empty coupon.'),('Easter30',30,'2023-04-09','30% off for Easter'),('Fall10',10,'2023-09-30','10% off for the autumn season'),('Happy25',25,'2023-06-30','25% off, enjoy your summer!'),('July4th15',15,'2023-07-04','15% off for Independence Day'),('LaborDay10',10,'2023-09-04','10% off for Labor Day'),('NewYear20',20,'2024-01-01','20% off to celebrate the New Year'),('Spring20',20,'2023-04-15','20% off to welcome the spring'),('Summer10',10,'2023-07-31','10% off for early summer days'),('Thanks20',20,'2023-11-24','20% off for Thanksgiving'),('Winter15',15,'2023-12-25','15% off for winter holidays');
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
  `state` varchar(64) NOT NULL,
  `zip` char(5) NOT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Phillip','Mercer','stephanie93@example.net','_9#U9gHI!vI_','2836699123','47922 Mary Summit','apt 46','Oklahoma','02192'),(2,'Melissa','Rodgers','floresjason@example.com','dh2JrC+D)t76','5726474315','31801 Hall Parkways Suite 081','apt 22','Massachusetts','15848'),(3,'George','Hampton','davidnewton@example.net','^sN2BTkF8XBy','4311294352','64680 Laura Course','apt 58','Ohio','88889'),(4,'Calvin','Bentley','pwalters@example.com',')x%0X7Th5T0K','0203238875','585 Hardin Meadow','apt 56','Arkansas','53335'),(5,'Teresa','French','patrickpierce@example.net','#)1GJnY!2%6J','1917157930','4204 Davis Field','apt 31','Wyoming','73386'),(6,'Isaac','Martin','waynecruz@example.net','^OXZAe$iUJQ0','2444350088','5902 Amber Run','apt 15','Alaska','14759'),(7,'Danielle','Patel','sfreeman@example.com','o7(0hCGdeS#I','6559772503','2037 Hernandez Road','apt 1','Ohio','72411'),(8,'Mary','Miller','glassvictor@example.net','#D@^$Tan3)4%','9239567493','57294 Bridget Estates Suite 308','apt 89','Pennsylvania','85418'),(9,'Brenda','Perez','uavila@example.com','+VGHcYpX*9#)','4439275088','9050 Horne Cape','apt 10','Iowa','34986'),(10,'Jeffrey','Collins','grahamtodd@example.org','#803mRfn6%PX','4435771338','586 Kelly Cove','apt 20','Missouri','43556'),(11,'Brian','Evans','jodythompson@example.net','yy+ZTFxa$6*U','9301788665','07979 Reynolds Lights','apt 90','Ohio','28315'),(12,'Robyn','Hamilton','edwardssandra@example.net','1)E^&gD3YJ2o','7962741209','55167 Martinez Isle','apt 62','Nebraska','77343'),(13,'Henry','Chaney','charles44@example.com','&2k7)P*muCVB','1213438358','35124 Morton Run Suite 724','apt 91','Washington','63944'),(14,'Sarah','Harris','justinflowers@example.com','3tcoC9UhA$&4','4420330740','26443 Ruth Unions Suite 957','apt 1','New Jersey','19616'),(15,'Paul','Elliott','haley74@example.net','VI)9AHFk^Bjn','5656532178','573 Justin Ports','apt 9','Massachusetts','45867'),(16,'Briana','Holder','gdrake@example.org','$t9rzw)30XFD','2379733768','96524 Matthew Pike Apt. 088','apt 7','Alaska','23415'),(17,'Bonnie','Jacobson','ryankent@example.net','#68EUsrj#qKM','5322232051','47790 Bowman Parks Suite 741','apt 20','Iowa','19283'),(18,'Kelly','Nguyen','bullockaustin@example.net','Ub3zClKu*4f3','0351424201','543 John Lane Apt. 634','apt 93','Tennessee','26750'),(19,'Christina','Dyer','fmartinez@example.net','EC9^tSwu!(1Z','6549265079','432 Johnston Mills Apt. 900','apt 90','Kentucky','02347'),(20,'Randall','Duffy','cruzkathy@example.org','#z1jYyda6O1A','4894485333','76710 Miles Keys','apt 24','Missouri','72676'),(21,'Kelly','Riley','ericnewman@example.com','*5gRjU@6ojOI','3413541393','845 Eric Camp Apt. 976','apt 27','South Dakota','79376'),(22,'Scott','Carey','samantha31@example.com','+EqfhOkHZ2oX','2496685271','185 Jennifer Neck','apt 46','Mississippi','58384'),(23,'Steven','Giles','bradleyhill@example.com','X0)mokhC&9Rn','1863113304','09838 Steven Isle','apt 91','New Jersey','91151'),(24,'Marcus','Perez','beckjonathan@example.com','2e0U_TJu__Ru','1988676088','993 Cruz Isle','apt 18','Minnesota','26011'),(25,'Eric','Johnson','reednathan@example.net','%+Ya6&wmOj4W','9778387595','9957 Carr Plaza Apt. 066','apt 92','Kansas','32085'),(26,'Jennifer','Coleman','hughesshawn@example.com','ZlbF&t_8@24o','4658011417','46843 Brandy Mountain Suite 602','apt 35','Ohio','51246'),(27,'Michael','Olson','clairepalmer@example.com','z5F$lAXz#^9G','7278829324','3874 Christopher Lodge Apt. 295','apt 22','South Carolina','50320'),(28,'Manuel','Barker','stevenbuckley@example.com','@o1vNERgj(hz','1132452603','33158 Wiley Canyon Suite 659','apt 86','Maryland','66011'),(29,'Jerome','Martinez','kkrueger@example.org','aS!0RjUgUql@','4124179861','60420 Leslie Corner','apt 68','Minnesota','95165'),(30,'Jerry','Roberson','kphillips@example.com','%18Od@rx+(KX','4529554364','35940 Brian Inlet Apt. 664','apt 10','Kentucky','95244'),(31,'Jessica','Cobb','downsrobert@example.com','QkFWA^Hfs!G4','5892911574','88937 Goodman Coves','apt 27','Indiana','26910'),(32,'Damon','Lee','john77@example.org','yav1qNlaobW$','3006942625','5520 White Trace Suite 433','apt 54','Missouri','71498'),(33,'Adam','Hardy','sanderson@example.net','5QLW43Xn@W$m','4873267997','3705 Angela Route','apt 17','Wyoming','45716'),(34,'Charlene','Robinson','scottsean@example.net','($HBj^mu$8va','0688812848','730 Timothy Summit','apt 55','Montana','55588'),(35,'Jenny','Williams','joanne94@example.org','_Dz*hNZb8(A9','7975306872','0102 Ernest Lakes','apt 30','South Dakota','48877'),(36,'Jennifer','Ross','christopherstewart@example.org','L8C18B5xIdV@','8249373083','50806 Rachel Path','apt 97','Maine','68142'),(37,'Steven','Grant','bennetttyrone@example.org','_l7MJn%EzUz*','4054485498','0791 Miller Way Apt. 285','apt 43','Minnesota','52558'),(38,'Jacqueline','Miller','gary53@example.net','$2AJlFG&4*Jh','4932323243','6233 Morales Stream','apt 73','New Jersey','73640'),(39,'Heidi','Dunn','wellstimothy@example.com','t2m!v*pc8$5Z','0431185518','69423 Shepherd Garden Suite 788','apt 11','North Dakota','76997'),(40,'Deanna','Bailey','bpierce@example.net','_$BMnuY5w6FE','1959748002','638 Ashley Route Suite 969','apt 31','Alaska','55213'),(41,'April','Cameron','phayes@example.org','_LvikW6r)6qF','5970942961','474 Shannon Estate Apt. 738','apt 32','Colorado','26121'),(42,'Sara','Nelson','chavezashley@example.org','xG47vplo&(8d','4017093589','9394 Michele Fort Apt. 229','apt 76','West Virginia','33586'),(43,'Kiara','Allen','vanessamarsh@example.com','1L0C9^nQ^fHC','7874116892','34594 Francisco Canyon Suite 473','apt 98','Colorado','44655'),(44,'Aaron','Mccoy','collinsteresa@example.org','I*6!Bz17^1Gi','1572510017','96090 Anderson Fords','apt 99','Wyoming','83354'),(45,'John','Church','donna99@example.com','X)4&nlmbLqPS','7204739761','03107 Christopher Walk','apt 1','Vermont','47777'),(46,'Kevin','Rice','xmoore@example.net','!8UDU$we_kv6','6274145088','724 Louis Prairie Apt. 333','apt 56','Arizona','85270'),(47,'Tracy','Meyer','pittsclaire@example.net','XhPJ21XzC(aZ','1840909270','0567 Anthony Course Suite 709','apt 69','Florida','36142'),(48,'Ian','Ortiz','zacharylopez@example.net','_iLXKjeA_)W4','4665609220','8064 Taylor Curve Suite 429','apt 18','Alaska','54982'),(49,'Edward','Vazquez','michaelbradley@example.com','bj23Ezllj$6L','5753259003','855 Sandra Parks','apt 96','Tennessee','25238'),(50,'David','Fitzgerald','ctorres@example.org','0Iw$L69PtrNj','0168569437','7026 Gomez Gateway','apt 37','Louisiana','62064'),(51,'Kimberly','Rogers','drakejohn@example.org','!2q9ez4$)4FN','6010028816','9927 Adams Fort Apt. 616','apt 50','Minnesota','88560'),(52,'Anthony','Johnson','adam83@example.org','JnBpVz&l^3bT','2341762846','630 Kerry Mount','apt 47','Illinois','80961'),(53,'Mark','Floyd','jessica63@example.com','D#TlE4Oaux@0','0550179384','56044 Perry Light Apt. 687','apt 93','Rhode Island','81895'),(54,'Joan','Chapman','georgebenjamin@example.org','!*3MxlnK0CG3','8710862542','47307 Bennett Cliffs Suite 677','apt 50','West Virginia','94706'),(55,'Kathryn','Lewis','eric58@example.org','$zS3pKNZ%7nT','9133695501','887 Chandler Summit Suite 697','apt 33','South Dakota','95066'),(56,'Jill','Wang','pottertodd@example.com','^75kTyOnVuk!','5588875947','7316 Curtis Shore','apt 79','Vermont','86407'),(57,'Kathryn','Smith','benjamin22@example.com','&__STMc!*58c','9917588470','8174 Stephanie Field','apt 71','West Virginia','62626'),(58,'Matthew','Roberts','rweeks@example.com','hkVvP@BW#1xl','2657586724','60320 Amber Creek','apt 73','Georgia','32910'),(59,'Kelly','Gates','paul96@example.net','!9S2AjE^2P9k','6190131952','8762 Webster Square Suite 192','apt 27','Missouri','98066'),(60,'John','Bauer','dianehenderson@example.com','!ZNMdIIu_9aC','1131495940','408 Danielle Corners','apt 61','New York','35532'),(61,'Bianca','Davis','franklinbrandon@example.org','Fg^3yHmc7@y@','3068193845','95203 Mcdowell Inlet Suite 017','apt 49','Missouri','28031'),(62,'Tina','Gordon','gwhite@example.net','aVK^Xhigd(X2','7675791100','98511 Cox Ramp Suite 762','apt 52','South Dakota','06743'),(63,'John','White','blackemily@example.org','8QHutEd6*nLu','2552372484','49525 Smith Freeway','apt 53','Virginia','22056'),(64,'George','Lopez','aoconnor@example.net','jV03EBgk()+q','6808231319','757 Devin Plains','apt 25','Maine','27864'),(65,'John','Harris','victoria40@example.net','78^XKS7n6CQ$','2261246419','72017 Heidi Manor','apt 1','Virginia','77637'),(66,'Michael','Thornton','angelmorgan@example.org','T59$cMHoHz(D','6314869593','238 Woods Unions','apt 38','Florida','01879'),(67,'Susan','Cervantes','pamelaaguilar@example.net','600DjpPt#!m*','7440239444','7243 Spencer Heights','apt 31','Ohio','68367'),(68,'Thomas','Schultz','susan36@example.org','uLPRnV#S$1)H','4280934300','756 David Terrace Suite 231','apt 82','California','22139'),(69,'Charles','Glenn','terrycourtney@example.net','@4vcZ!cx^TP4','4341722924','083 Heather Cove Suite 216','apt 42','Georgia','86902'),(70,'Amber','Martinez','trobinson@example.net','!gj5Au*Oy8eG','0900074335','3504 Jessica Causeway Apt. 373','apt 28','Michigan','70979'),(71,'Devon','Santos','jonesdevin@example.com','_%jkq!cA8rQj','5408055092','35814 Michael Wall Apt. 434','apt 15','Washington','37892'),(72,'Nicole','King','donaldmiller@example.com','x8L_MZUc(uqY','3162534352','548 Johnson Vista','apt 29','Wisconsin','94475'),(73,'Brandon','Green','lpeterson@example.net','an%4h6QWU42X','7551832813','638 Randy Station Apt. 410','apt 79','Iowa','57130'),(74,'Nicholas','Franco','josephmendoza@example.net','$ToX7bOtAAN3','0284852382','0567 Mandy Trace Suite 501','apt 4','West Virginia','72048'),(75,'Nathaniel','Garcia','mark30@example.com','%80bdoOATo0X','1766892622','940 Craig Turnpike Suite 108','apt 91','Illinois','87855'),(76,'Brenda','Holt','jamiebeck@example.org','7OX$7Is%mjAw','3029629081','95666 Gary Causeway Suite 403','apt 8','Wyoming','42378'),(77,'Elizabeth','Hunter','ebooth@example.com','NxhBMkgv4)M%','3626193131','9001 Spencer Springs','apt 68','Montana','48740'),(78,'Jacqueline','Sanchez','chentracy@example.org','1+R7TDYi*LVs','6065244915','765 Heather Walk','apt 94','Virginia','70179'),(79,'Andrea','Baird','wheelerrenee@example.org','G73*$F*wi%GJ','6129826812','464 Powell Fords Suite 472','apt 62','West Virginia','82563'),(80,'Stephen','Moore','david05@example.org','(0LisZFXBtLh','5318301286','4188 Brown Groves','apt 29','Alaska','66249'),(81,'Bianca','Juarez','zwilliams@example.org','@55QfYnnyjs(','3517051891','5189 Ortiz Centers','apt 41','Hawaii','43596'),(82,'Tina','Mccormick','zsmith@example.org','d%0zVWwT^X18','8932909087','3532 Schneider Square Apt. 330','apt 23','Tennessee','43033'),(83,'Jonathan','Gallegos','jasonbright@example.net','OEllxHKR%p2R','1044940466','236 West Dam','apt 19','Oklahoma','05116'),(84,'Richard','Owen','bortiz@example.net','lUM%Vs%Q@9Pt','4607610846','4244 Jeffery Branch','apt 71','Maine','45616'),(85,'John','Perez','nicholas88@example.net','!IIOk+9UD&8_','3803984488','630 Jeremy Locks','apt 92','West Virginia','50175'),(86,'Joseph','Gray','ybranch@example.com','V0!6Cgsc^Lo(','1375875629','594 James Locks','apt 86','Utah','19503'),(87,'Michelle','Thomas','jeffreyhess@example.net','%2peXk%cEaPZ','0355870115','43582 Calvin Garden','apt 52','South Carolina','43031'),(88,'Leonard','White','griffithteresa@example.net','%!dul!g@lw5S','8591140764','993 Bennett Fords','apt 49','Hawaii','59093'),(89,'Olivia','Hanson','gabrielle68@example.org','06#*IGxbDZLS','0925568457','711 Jones Creek Apt. 930','apt 93','West Virginia','89826'),(90,'Kathleen','Vance','scummings@example.net','SX1qQam^f+ZO','4309205315','410 Goodman Square','apt 75','Iowa','04486'),(91,'Andrew','Higgins','andrew32@example.com','V8Pg5Pum$6Q5','8790227705','506 Brown Coves','apt 61','New Mexico','45847'),(92,'Jeanne','Mayer','gabriella75@example.net','p$cKAQdzHbT4','4632075027','865 Richard Mews Suite 079','apt 71','Idaho','73663'),(93,'Jacob','Blair','bcook@example.com',')+N)lVCm_B1q','0232260427','0891 Young Valleys Suite 264','apt 99','Oklahoma','76771'),(94,'Tara','Sharp','gateskaren@example.net','x*&4W^&qp!56','9310550302','039 Jasmine Harbors','apt 87','South Carolina','60323'),(95,'Danielle','Cruz','tyler85@example.com','k@7q4fp@bx8I','1379984431','421 Hanson Fords','apt 9','Delaware','96571'),(96,'Manuel','Alexander','fisherbrandon@example.com','f#YO8J9wb^oe','4134570517','36411 Park Flat Suite 965','apt 62','North Dakota','27102'),(97,'Gabriel','Stuart','mccoydwayne@example.org','$5RCv^4o@IIw','5764896473','68932 Adams Isle','apt 86','California','53838'),(98,'Philip','Howell','osmith@example.org','%hb8sguUc56U','4803334885','5465 Carol River Apt. 405','apt 44','Iowa','27524'),(99,'Jaime','Caldwell','thomashoward@example.com','!BcWYsyib07U','4650019598','726 Danny Row','apt 55','Connecticut','46992'),(100,'Jeffrey','Moore','carlosmiller@example.net','f@86gUi(@BNv','7090838153','55464 Kenneth Crossing Apt. 515','apt 71','Illinois','10109');
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
  `status_update_trigger` int DEFAULT '0',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_partner`
--

LOCK TABLES `delivery_partner` WRITE;
/*!40000 ALTER TABLE `delivery_partner` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_invoice`
--

LOCK TABLES `order_invoice` WRITE;
/*!40000 ALTER TABLE `order_invoice` DISABLE KEYS */;
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
INSERT INTO `payment` VALUES ('Cash','/lobster.png','text-black','bg-pink-500'),('Credit/Debit','/credit.png','text-black','bg-green-200'),('PayPal','/paypal.png','text-black','bg-yellow-400'),('Venmo','/venmo.png','text-white','bg-blue-600'),('Zelle','/zelle.png','text-white','bg-purple-600');
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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Squid','Frozen',13,'A organic Squid smoked, perfect for any seafood dish.',122,'https://picsum.photos/200/300?random=705'),(2,'Prawns','Non-Refrigerated',16,'A wild-caught Prawns sliced, perfect for any seafood dish.',184,'https://picsum.photos/200/300?random=652'),(3,'Mantis Shrimp','Non-Refrigerated',13,'A delicate Mantis Shrimp sliced, perfect for any seafood dish.',103,'https://picsum.photos/200/300?random=267'),(4,'Pink Salmon','Non-Refrigerated',17,'A frozen Pink Salmon filet, perfect for any seafood dish.',124,'https://picsum.photos/200/300?random=949'),(5,'Shrimp','Non-Refrigerated',18,'A sustainable Shrimp grilled, perfect for any seafood dish.',22,'https://picsum.photos/200/300?random=610'),(6,'Carp','Fresh',9,'A delicate Carp whole, perfect for any seafood dish.',44,'https://picsum.photos/200/300?random=772'),(7,'Arctic Char','Frozen',19,'A wild-caught Arctic Char whole, perfect for any seafood dish.',41,'https://picsum.photos/200/300?random=131'),(8,'Abalone','Fresh',19,'A sustainable Abalone fried, perfect for any seafood dish.',139,'https://picsum.photos/200/300?random=126'),(9,'Tuna','Fresh',11,'A tasty Tuna whole, perfect for any seafood dish.',153,'https://picsum.photos/200/300?random=591'),(10,'Halibut','Non-Refrigerated',17,'A wild-caught Halibut filet, perfect for any seafood dish.',168,'https://picsum.photos/200/300?random=218'),(11,'Mackerel','Fresh',9,'A sustainable Mackerel sliced, perfect for any seafood dish.',104,'https://picsum.photos/200/300?random=195'),(12,'Limpet','Frozen',20,'A fresh Limpet baked, perfect for any seafood dish.',47,'https://picsum.photos/200/300?random=739'),(13,'Grouper','Non-Refrigerated',19,'A frozen Grouper diced, perfect for any seafood dish.',36,'https://picsum.photos/200/300?random=223'),(14,'King Crab','Fresh',17,'A wild-caught King Crab diced, perfect for any seafood dish.',119,'https://picsum.photos/200/300?random=664'),(15,'Cuttlefish','Frozen',20,'A juicy Cuttlefish sliced, perfect for any seafood dish.',96,'https://picsum.photos/200/300?random=260'),(16,'Hake','Non-Refrigerated',13,'A flavorful Hake grilled, perfect for any seafood dish.',192,'https://picsum.photos/200/300?random=678'),(17,'Pompano','Frozen',20,'A tasty Pompano filet, perfect for any seafood dish.',61,'https://picsum.photos/200/300?random=649'),(18,'Snapper','Fresh',12,'A juicy Snapper grilled, perfect for any seafood dish.',164,'https://picsum.photos/200/300?random=246'),(19,'Trout','Frozen',12,'A premium Trout steamed, perfect for any seafood dish.',192,'https://picsum.photos/200/300?random=371'),(20,'Lobster','Non-Refrigerated',11,'A organic Lobster diced, perfect for any seafood dish.',79,'https://picsum.photos/200/300?random=154'),(22,'Crayfish','Fresh',18,'A juicy Crayfish diced, perfect for any seafood dish.',37,'https://picsum.photos/200/300?random=299'),(23,'Snow Crab','Fresh',11,'A organic Snow Crab roasted, perfect for any seafood dish.',189,'https://picsum.photos/200/300?random=471'),(24,'Bream','Frozen',17,'A tasty Bream whole, perfect for any seafood dish.',17,'https://picsum.photos/200/300?random=604'),(26,'Catfish','Non-Refrigerated',9,'A delicate Catfish smoked, perfect for any seafood dish.',123,'https://picsum.photos/200/300?random=17'),(28,'Mullet','Fresh',14,'A wild-caught Mullet sliced, perfect for any seafood dish.',36,'https://picsum.photos/200/300?random=138'),(29,'Turbot','Fresh',12,'A wild-caught Turbot grilled, perfect for any seafood dish.',159,'https://picsum.photos/200/300?random=292'),(30,'Cod','Fresh',18,'A premium Cod whole, perfect for any seafood dish.',102,'https://picsum.photos/200/300?random=27'),(31,'Swordfish','Non-Refrigerated',11,'A fresh Swordfish sliced, perfect for any seafood dish.',130,'https://picsum.photos/200/300?random=432'),(32,'Opah','Fresh',18,'A tasty Opah baked, perfect for any seafood dish.',100,'https://picsum.photos/200/300?random=587'),(33,'Sea Squirt','Frozen',16,'A organic Sea Squirt filet, perfect for any seafood dish.',97,'https://picsum.photos/200/300?random=643'),(35,'Wahoo','Frozen',8,'A sustainable Wahoo whole, perfect for any seafood dish.',58,'https://picsum.photos/200/300?random=397'),(39,'Geoduck','Frozen',13,'A fresh Geoduck steamed, perfect for any seafood dish.',127,'https://picsum.photos/200/300?random=701'),(40,'Oysters','Non-Refrigerated',13,'A premium Oysters grilled, perfect for any seafood dish.',109,'https://picsum.photos/200/300?random=71'),(41,'Butterfish','Fresh',10,'A juicy Butterfish smoked, perfect for any seafood dish.',18,'https://picsum.photos/200/300?random=131'),(44,'Sablefish','Fresh',11,'A juicy Sablefish steamed, perfect for any seafood dish.',164,'https://picsum.photos/200/300?random=503'),(45,'Cockles','Frozen',10,'A juicy Cockles baked, perfect for any seafood dish.',95,'https://picsum.photos/200/300?random=862'),(46,'Conch','Fresh',18,'A flavorful Conch whole, perfect for any seafood dish.',138,'https://picsum.photos/200/300?random=311'),(47,'Clams','Fresh',16,'A fresh Clams grilled, perfect for any seafood dish.',3,'https://picsum.photos/200/300?random=663'),(49,'Sardines','Non-Refrigerated',12,'A sustainable Sardines fried, perfect for any seafood dish.',150,'https://picsum.photos/200/300?random=568'),(50,'Sea Sponge','Frozen',16,'A sustainable Sea Sponge baked, perfect for any seafood dish.',97,'https://picsum.photos/200/300?random=62'),(51,'Tilefish','Frozen',15,'A delicate Tilefish diced, perfect for any seafood dish.',149,'https://picsum.photos/200/300?random=464'),(53,'Amberjack','Frozen',9,'A sustainable Amberjack smoked, perfect for any seafood dish.',158,'https://picsum.photos/200/300?random=8'),(58,'Redfish','Frozen',14,'A premium Redfish fried, perfect for any seafood dish.',189,'https://picsum.photos/200/300?random=265'),(59,'Whitefish','Fresh',10,'A flavorful Whitefish filet, perfect for any seafood dish.',132,'https://picsum.photos/200/300?random=209'),(62,'Soft-shell Crab','Frozen',15,'A tasty Soft-shell Crab diced, perfect for any seafood dish.',186,'https://picsum.photos/200/300?random=38'),(67,'Caviar','Frozen',8,'A juicy Caviar baked, perfect for any seafood dish.',35,'https://picsum.photos/200/300?random=523'),(69,'Haddock','Non-Refrigerated',18,'A tasty Haddock baked, perfect for any seafood dish.',105,'https://picsum.photos/200/300?random=315'),(70,'Barnacle','Frozen',12,'A juicy Barnacle smoked, perfect for any seafood dish.',43,'https://picsum.photos/200/300?random=168'),(71,'Barramundi','Non-Refrigerated',9,'A juicy Barramundi baked, perfect for any seafood dish.',149,'https://picsum.photos/200/300?random=106'),(72,'Eel','Frozen',13,'A premium Eel filet, perfect for any seafood dish.',50,'https://picsum.photos/200/300?random=514'),(75,'Bluefish','Frozen',18,'A flavorful Bluefish filet, perfect for any seafood dish.',165,'https://picsum.photos/200/300?random=269'),(79,'Anchovies','Non-Refrigerated',20,'A fresh Anchovies diced, perfect for any seafood dish.',108,'https://picsum.photos/200/300?random=635'),(81,'Sea Cucumber','Fresh',9,'A organic Sea Cucumber roasted, perfect for any seafood dish.',160,'https://picsum.photos/200/300?random=934'),(86,'Yellowtail','Non-Refrigerated',18,'A organic Yellowtail fried, perfect for any seafood dish.',147,'https://picsum.photos/200/300?random=44'),(88,'Octopus','Fresh',11,'A flavorful Octopus whole, perfect for any seafood dish.',66,'https://picsum.photos/200/300?random=635'),(90,'Mahi Mahi','Non-Refrigerated',14,'A premium Mahi Mahi steamed, perfect for any seafood dish.',28,'https://picsum.photos/200/300?random=473'),(91,'Surimi','Non-Refrigerated',12,'A organic Surimi smoked, perfect for any seafood dish.',125,'https://picsum.photos/200/300?random=520'),(96,'Herring','Non-Refrigerated',15,'A flavorful Herring smoked, perfect for any seafood dish.',161,'https://picsum.photos/200/300?random=105');
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
/*!50003 DROP PROCEDURE IF EXISTS `add_item_to_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "add_item_to_order"(
	IN c_order_id INT,
    IN c_pname VARCHAR(64),
    in c_quantity INT
)
BEGIN
	DECLARE order_exists INT;
    
    SELECT COUNT(*) into order_exists FROM order_invoice
    WHERE order_id = c_order_id;
    
    IF order_exists = 0 THEN
		SIGNAL SQLSTATE '45012' SET MESSAGE_TEXT = 'order id doesnt exist';
	ELSE
		INSERT INTO order_item(order_id, p_name, quantity)
        VALUES(c_order_id, c_pname, c_quantity);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `begin_delivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "begin_delivery"(
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
/*!50003 DROP PROCEDURE IF EXISTS `convert_email_to_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "convert_email_to_id"(
	IN c_email VARCHAR(64)
)
BEGIN
	select cid from customer where email = c_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "get_all_inventory"(
    IN c_pname VARCHAR(64) 
)
BEGIN
        DECLARE product_name VARCHAR(64);
        DECLARE product_count INT;
        
        IF c_pname IS NULL or c_pname = '' THEN
			SELECT * FROM product;
		ELSE
			SELECT COUNT(*) INTO product_count FROM product WHERE p_name = c_pname;
		
        IF product_count = 0 THEN
			SIGNAL SQLSTATE '45008' SET MESSAGE_TEXT = 'product does not exist'; # 45008: product != exist
		ELSE
			SELECT * FROM product where p_name = c_pname;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_delivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "get_delivery"(
    IN param_order_id INT
)
BEGIN
    DECLARE current_status VARCHAR(20);
    DECLARE new_status_index INT;

    -- Return the updated status
    SELECT * FROM delivery WHERE order_id = param_order_id;
    
    -- Get the current status
    SELECT delivery_status INTO current_status FROM delivery WHERE order_id = param_order_id;

    -- Calculate the new status index
    SET new_status_index = FIND_IN_SET(current_status, 'placed,in-transit,delivered') + 1;

    -- Update the status if it's within the valid range
    IF new_status_index <= 3 THEN
        UPDATE delivery 
        SET delivery_status = ELT(new_status_index, 'placed', 'in-transit', 'delivered')
        WHERE order_id = param_order_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_partner_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "get_partner_info"(
    IN param_partner_id INT
)
BEGIN

   select * from delivery_partner where partner_id = param_partner_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_payment_methods` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "get_payment_methods"()
BEGIN
	SELECT * from payment;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_promo_codes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "get_promo_codes"(
    IN c_cid INT,
    IN c_coupon_code VARCHAR(10)
)
BEGIN
    DECLARE cid_exists INT;
	DECLARE coupon_available INT;
    SELECT COUNT(*) INTO cid_exists FROM customer
    WHERE cid = c_cid;

    IF cid_exists = 0 THEN
        SIGNAL SQLSTATE '45009' SET MESSAGE_TEXT = 'customer id not found';
    ELSE
        IF c_coupon_code = '' THEN
            SELECT c.coupon_code
            FROM coupon c
            WHERE NOT EXISTS (
                SELECT 1
                FROM order_invoice o
                WHERE o.customer_id = c_cid AND o.coupon_code = c.coupon_code
            );
        ELSE
            SELECT COUNT(*) INTO coupon_available
            FROM coupon c
            WHERE c.coupon_code = c_coupon_code
              AND NOT EXISTS (
                SELECT 1
                FROM order_invoice o
                WHERE o.customer_id = c_cid AND o.coupon_code = c.coupon_code
            );

            IF coupon_available = 0 THEN
                SIGNAL SQLSTATE '45006' SET MESSAGE_TEXT = 'coupon not available';
            ELSE
                SELECT c.coupon_code
                FROM coupon c
                WHERE c.coupon_code = c_coupon_code;
            END IF;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "insert_category"(IN cat_name VARCHAR(64))
BEGIN
    INSERT INTO category (category_name) VALUES (cat_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_coupon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "insert_coupon"(
    IN p_coupon_code VARCHAR(10), IN p_coupon_discount_amt FLOAT, IN p_coupon_expiration_date DATE, IN p_coupon_description VARCHAR(64))
BEGIN
    INSERT INTO coupon (coupon_code, coupon_discount_amt, coupon_expiration_date, coupon_description)
    VALUES (p_coupon_code, p_coupon_discount_amt, p_coupon_expiration_date, p_coupon_description);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_delivery_partner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "insert_delivery_partner"(
    IN fname VARCHAR(15), IN lname VARCHAR(15), IN phone CHAR(11))
BEGIN
    INSERT INTO delivery_partner (first_name, last_name, phone)
    VALUES (fname, lname, phone);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_delivery_zone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "insert_delivery_zone"(IN z_code CHAR(5), IN partner_id INT)
BEGIN
    INSERT INTO delivery_zone (zipcode, partner_id) VALUES (z_code, partner_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_payment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "insert_payment"(
    IN p_type VARCHAR(16), IN img VARCHAR(64), 
    IN p_text VARCHAR(64), IN bg_color VARCHAR(64))
BEGIN
    INSERT INTO payment (payment_type, img, payment_text, bg_color)
    VALUES (p_type, img, p_text, bg_color);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "insert_product"(
    IN pname VARCHAR(64), IN cat VARCHAR(64), IN price INT, 
    IN p_desc VARCHAR(64), IN qty INT, IN p_img VARCHAR(64))
BEGIN
    INSERT INTO product (p_name, category, sell_price, p_description, qty_in_stock, product_img)
    VALUES (pname, cat, price, p_desc, qty, p_img);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_vendor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "insert_vendor"(
    IN v_id INT, IN fname VARCHAR(64), IN lname VARCHAR(64), 
    IN phone INT, IN street_num INT, IN street_name VARCHAR(64), 
    IN city VARCHAR(25), IN state VARCHAR(2), IN zip INT)
BEGIN
    INSERT INTO vendor (vendor_id, first_name, last_name, phone_number, steet_number, street_name, city, state, zip)
    VALUES (v_id, fname, lname, phone, street_num, street_name, city, state, zip);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_vendor_supply` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "insert_vendor_supply"(IN v_id INT, IN p_id INT, IN price_per_qty FLOAT)
BEGIN
    INSERT INTO vendor_supplies_seafood_product (vendor_id, pid, price_per_qty)
    VALUES (v_id, p_id, price_per_qty);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `place_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "place_order"(
	IN c_customer_id INT,
    IN c_payment_type VARCHAR(16),
    IN c_coupon_code VARCHAR(10)
)
BEGIN
	DECLARE customer_exists INT;
    DECLARE payment_type_exists VARCHAR(16);
    DECLARE coupon_code_exists VARCHAR(10);
	
    
    SELECT COUNT(*) INTO customer_exists FROM customer
    WHERE cid = c_customer_id;
    
    SELECT payment_type INTO payment_type_exists FROM payment
    WHERE payment_type = c_payment_type;
    
    SELECT coupon_code INTO coupon_code_exists FROM coupon
    WHERE coupon_code = c_coupon_code;
    
    IF customer_exists = 0 THEN
		SIGNAL SQLSTATE '45010' SET MESSAGE_TEXT = 'customer not found';
	ELSEIF payment_type_exists IS NULL THEN
		SIGNAL SQLSTATE '45011' SET MESSAGE_TEXT = 'payment doesnt exist';
	ELSEIF coupon_code_exists IS NULL AND c_coupon_code <> '' THEN
		SIGNAL SQLSTATE '45005' SET MESSAGE_TEXT = 'coupon not found';
	ELSE
		SET @set_order_date = CURRENT_TIMESTAMP;
        
        INSERT INTO order_invoice (customer_id, payment_type, coupon_code, order_date)
        VALUES (c_customer_id, c_payment_type, c_coupon_code, @set_order_date);
        
        -- Adding this line so that we can get the order_id that was just created	
        select last_insert_id() as order_id;
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "register_user"(
	IN c_fname VARCHAR(64), 
    IN c_lname VARCHAR(64), 
    IN c_email VARCHAR(64), 
    IN c_pwd VARCHAR(64), 
    IN c_phone CHAR(11), 
    IN c_street VARCHAR(64), 
    IN c_apt VARCHAR(8), 
    IN c_state VARCHAR(64), 
    IN c_zip CHAR(5)
    )
BEGIN
		DECLARE email_already_exist VARCHAR(64);
        
		SELECT email INTO email_already_exist FROM customer 
        WHERE email = c_email 
        LIMIT 1;
        
        IF email_already_exist IS NOT NULL THEN
			SIGNAL SQLSTATE '45007' SET MESSAGE_TEXT = 'This email already exists';
		
		ELSE 
			INSERT INTO customer(c_fname, c_lname, email, pwd, phone, street, apt, state, zip)
			VALUES (c_fname, c_lname, c_email, c_pwd, c_phone, c_street, c_apt, c_state, c_zip);
		END IF;
		SELECT NULL;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_item_from_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "remove_item_from_inventory"(
	IN c_pid INT,
    IN c_qty INT
)
BEGIN
    DECLARE pid_exists INT;
    DECLARE c_qty_exists INT;
    
	SELECT COUNT(*) INTO pid_exists FROM product
    WHERE pid = c_pid;
    
    IF pid_exists = 0 THEN
		SIGNAL SQLSTATE '45002' SET MESSAGE_TEXT = 'product not found';
	ELSE
		SELECT qty_in_stock INTO c_qty_exists FROM product
		WHERE pid = c_pid;
	
		IF c_qty_exists < c_qty THEN
			SIGNAL SQLSTATE '45003' SET MESSAGE_TEXT = 'Not enough qty in stock';
		ELSE
			UPDATE product SET qty_in_stock = qty_in_stock - c_qty
            WHERE pid = c_pid;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="doadmin"@"%" PROCEDURE "user_login"(
	IN c_email VARCHAR(64),
    IN c_pwd VARCHAR(64)
)
BEGIN
		DECLARE email_exist VARCHAR(64);
        DECLARE pwd_exists VARCHAR(64);
        DECLARE check_pwd_un INT;
        
        select count(*) into check_pwd_un from customer where email = c_email and pwd = c_pwd;
        
        SELECT email INTO email_exist FROM customer
        WHERE email = c_email
        LIMIT 1;

        IF email_exist IS NULL THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = "email does not match";
		ELSEIF 
			check_pwd_un = 0 THEN
				SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'email or pw wrong';
        END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-06 17:21:30
