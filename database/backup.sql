-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: harmony_hub
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_1_cart`
--

DROP TABLE IF EXISTS `app_1_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_1_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `app_1_cart_user_id_c5b82b19_fk_app_1_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `app_1_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_1_cart`
--

LOCK TABLES `app_1_cart` WRITE;
/*!40000 ALTER TABLE `app_1_cart` DISABLE KEYS */;
INSERT INTO `app_1_cart` VALUES (5,'2025-04-09 18:37:30.079256',18),(6,'2025-04-11 03:54:38.102128',26),(9,'2025-04-16 17:44:20.023733',34);
/*!40000 ALTER TABLE `app_1_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_1_cartitem`
--

DROP TABLE IF EXISTS `app_1_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_1_cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `cart_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_1_cartitem_cart_id_0baa68fc_fk_app_1_cart_id` (`cart_id`),
  KEY `app_1_cartitem_product_id_6e01b8ee_fk_app_1_products_id` (`product_id`),
  CONSTRAINT `app_1_cartitem_cart_id_0baa68fc_fk_app_1_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `app_1_cart` (`id`),
  CONSTRAINT `app_1_cartitem_product_id_6e01b8ee_fk_app_1_products_id` FOREIGN KEY (`product_id`) REFERENCES `app_1_products` (`id`),
  CONSTRAINT `app_1_cartitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_1_cartitem`
--

LOCK TABLES `app_1_cartitem` WRITE;
/*!40000 ALTER TABLE `app_1_cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_1_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_1_customuser`
--

DROP TABLE IF EXISTS `app_1_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_1_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `address` longtext,
  `phone_number` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `app_1_customuser_email_0d30b659_uniq` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_1_customuser`
--

LOCK TABLES `app_1_customuser` WRITE;
/*!40000 ALTER TABLE `app_1_customuser` DISABLE KEYS */;
INSERT INTO `app_1_customuser` VALUES (18,'pbkdf2_sha256$1000000$9UJcJl4QYf2GGKhYasbNbz$nIfjmiwQw3735oeozAUTv8h1QmNApPjvj4hf7HXqJdk=','2025-04-16 17:53:00.442098',1,'Kavitha','Kavitha','Kidambi','kavithahaimakidambi0613@gmail.com',1,1,'2025-04-09 18:00:32.829680','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089','7674936510'),(21,'pbkdf2_sha256$1000000$6uu0pR0JHCjEdkIMQNFghD$e2qrGNmxBPalnLUwkesXOYg3xedqr+AbDeRRf+FMTOU=','2025-04-09 18:39:33.542919',0,'Savitha','Savitha','Kidambi','savithakidambi6@gmail.com',0,1,'2025-04-09 18:39:01.885662','Jaihind Valley, Manikonda','9550241171'),(26,'pbkdf2_sha256$1000000$u8S9PYtg6BJKfo5mNE18if$IpJ5S71InUM8cMMatGOUrS1sXT1iK0hvVo5Li7n6Kdo=','2025-04-11 03:50:07.172184',0,'musicalmagic','musicalmagic','','ilovemyfamily1701@gmail.com',0,1,'2025-04-11 03:48:56.713370','doksdok','9483948473'),(34,'pbkdf2_sha256$1000000$YglxrIh9FFsP75Qq08kyLs$IcSMsCbdMvsRVVXPbiangBfSvcU4rYZrHbHwStfuk9o=','2025-04-16 17:59:48.808122',0,'kavitha_1701','Kavitha','Kidambi','2411cs020689@mallareddyuniversity.ac.in',0,1,'2025-04-16 17:39:00.210019','Somewhere','7674936510');
/*!40000 ALTER TABLE `app_1_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_1_customuser_groups`
--

DROP TABLE IF EXISTS `app_1_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_1_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_1_customuser_groups_customuser_id_group_id_32237d6c_uniq` (`customuser_id`,`group_id`),
  KEY `app_1_customuser_groups_group_id_821548ee_fk_auth_group_id` (`group_id`),
  CONSTRAINT `app_1_customuser_gro_customuser_id_a70d3b3e_fk_app_1_cus` FOREIGN KEY (`customuser_id`) REFERENCES `app_1_customuser` (`id`),
  CONSTRAINT `app_1_customuser_groups_group_id_821548ee_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_1_customuser_groups`
--

LOCK TABLES `app_1_customuser_groups` WRITE;
/*!40000 ALTER TABLE `app_1_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_1_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_1_customuser_user_permissions`
--

DROP TABLE IF EXISTS `app_1_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_1_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_1_customuser_user_pe_customuser_id_permission_f191829c_uniq` (`customuser_id`,`permission_id`),
  KEY `app_1_customuser_use_permission_id_60e447e4_fk_auth_perm` (`permission_id`),
  CONSTRAINT `app_1_customuser_use_customuser_id_cced004c_fk_app_1_cus` FOREIGN KEY (`customuser_id`) REFERENCES `app_1_customuser` (`id`),
  CONSTRAINT `app_1_customuser_use_permission_id_60e447e4_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_1_customuser_user_permissions`
--

LOCK TABLES `app_1_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `app_1_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_1_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_1_faq`
--

DROP TABLE IF EXISTS `app_1_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_1_faq` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `answer` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_1_faq`
--

LOCK TABLES `app_1_faq` WRITE;
/*!40000 ALTER TABLE `app_1_faq` DISABLE KEYS */;
INSERT INTO `app_1_faq` VALUES (1,'❓Q: How do I place an order?','A: Simply browse the products, add items to your cart, and proceed to checkout. You can choose to pay online or opt for Cash on Delivery.'),(2,'❓Q: Can I return or cancel a product after ordering?','A: Yes, you can cancel orders before they are shipped. If your product is delivered, you can initiate a return request from your order history.'),(3,'❓Q: What payment methods are supported?','A: We support both Cash on Delivery and online card payments. Online payments simulate success or failure based on random outcomes for demo purposes.'),(4,'❓Q: I forgot my password. What should I do?','A: Click on “Forgot Password” on the login page. A reset link will be sent to your registered email address.'),(5,'❓Q: Can I update my address or profile info later?','A: Absolutely. Just head to the “Settings” page after logging in to update your name, address, phone number, or password.'),(6,'❓Q: What happens if my online payment fails?','A: You’ll see a message with the reason for failure and an option to retry the payment. Don’t worry — your cart will stay intact.'),(7,'❓Q: How do I leave a review for a product?','A: After purchasing, visit the product page while logged in and you’ll be able to submit a rating and comment.');
/*!40000 ALTER TABLE `app_1_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_1_order`
--

DROP TABLE IF EXISTS `app_1_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_1_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_date` datetime(6) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `address` longtext NOT NULL,
  `user_id` bigint NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `reason` longtext NOT NULL DEFAULT (_utf8mb4'Something went wrong. Please try again.'),
  PRIMARY KEY (`id`),
  KEY `app_1_order_user_id_8c7ffdf6_fk_app_1_customuser_id` (`user_id`),
  CONSTRAINT `app_1_order_user_id_8c7ffdf6_fk_app_1_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `app_1_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_1_order`
--

LOCK TABLES `app_1_order` WRITE;
/*!40000 ALTER TABLE `app_1_order` DISABLE KEYS */;
INSERT INTO `app_1_order` VALUES (41,'2025-04-09 18:07:53.336669',22499.00,'Confirmed','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'COD','Something went wrong. Please try again.'),(42,'2025-04-10 20:10:34.331088',19000.00,'Processing Return','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'Online','Something went wrong. Please try again.'),(43,'2025-04-11 03:37:04.667641',34500.00,'Processing Return','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'Online','Something went wrong. Please try again.'),(44,'2025-04-11 03:55:50.016349',48000.00,'Cancelled','doksdok',26,'Online','Something went wrong. Please try again.'),(45,'2025-04-11 03:57:47.190259',24000.00,'Confirmed','#402 d block',26,'COD','Something went wrong. Please try again.'),(46,'2025-04-11 06:40:56.208065',31000.00,'Cancelled','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'Online','Something went wrong. Please try again.'),(47,'2025-04-11 08:28:41.865337',55000.00,'Confirmed','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'COD','Something went wrong. Please try again.'),(48,'2025-04-12 05:07:33.768153',29000.00,'Failed','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'Online','Something went wrong. Please try again.'),(49,'2025-04-12 05:09:37.448222',0.00,'Shipped','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'Online','Something went wrong. Please try again.'),(50,'2025-04-12 05:13:24.371160',96000.00,'Cancelled','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'Online','Something went wrong. Please try again.'),(51,'2025-04-12 05:23:00.480876',31000.00,'Failed','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'Online','Something went wrong. Please try again.'),(52,'2025-04-12 05:26:39.100273',32000.00,'Failed','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'Online','There was a server issue. Please try again.'),(53,'2025-04-12 05:29:36.667390',9500.00,'Failed','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'Online','There was a server issue. Please try again.'),(54,'2025-04-12 05:44:19.734681',32000.00,'Failed','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'Online','There was a network issue. Please check your connectivity and try again.'),(55,'2025-04-12 05:54:51.791647',16500.00,'Failed','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'Online','There was a server issue. Please try again.'),(56,'2025-04-12 05:56:37.651687',14500.00,'Failed','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'Online','The server is busy. Please try again later.'),(57,'2025-04-12 06:07:07.962541',32000.00,'Failed','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'Online','The server is busy. Please try again later.'),(58,'2025-04-12 06:08:12.090987',16500.00,'Failed','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'Online','There was a network issue. Please check your connectivity and try again.'),(59,'2025-04-12 06:35:29.684078',72000.00,'Failed','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'Online','There was a network issue. Please check your connectivity and try again.'),(60,'2025-04-12 07:00:26.869997',24000.00,'Failed','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'Online','There was a network issue. Please check your connectivity and try again.'),(61,'2025-04-12 07:01:25.330746',32000.00,'Confirmed','#402, D Block, Jaihind Valley, Beside DSE Manikonda, Andhra Bank Circle - 500089',18,'Online','Something went wrong. Please try again.'),(67,'2025-04-16 17:47:04.129835',9500.00,'Cancelled','tyuihuyftygh',34,'Online','Something went wrong. Please try again.'),(68,'2025-04-16 17:47:04.134483',9500.00,'Processing Return','tyuihuyftygh',34,'Online','Something went wrong. Please try again.'),(69,'2025-04-16 17:50:12.379675',80000.00,'Cancelled','Somewhere',34,'COD','Something went wrong. Please try again.');
/*!40000 ALTER TABLE `app_1_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_1_orderitem`
--

DROP TABLE IF EXISTS `app_1_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_1_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_1_orderitem_order_id_4b236add_fk_app_1_order_id` (`order_id`),
  KEY `app_1_orderitem_product_id_6c4a93fa_fk_app_1_products_id` (`product_id`),
  CONSTRAINT `app_1_orderitem_order_id_4b236add_fk_app_1_order_id` FOREIGN KEY (`order_id`) REFERENCES `app_1_order` (`id`),
  CONSTRAINT `app_1_orderitem_product_id_6c4a93fa_fk_app_1_products_id` FOREIGN KEY (`product_id`) REFERENCES `app_1_products` (`id`),
  CONSTRAINT `app_1_orderitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_1_orderitem`
--

LOCK TABLES `app_1_orderitem` WRITE;
/*!40000 ALTER TABLE `app_1_orderitem` DISABLE KEYS */;
INSERT INTO `app_1_orderitem` VALUES (59,1,68,463),(60,1,67,463),(61,1,69,464),(62,2,69,465);
/*!40000 ALTER TABLE `app_1_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_1_products`
--

DROP TABLE IF EXISTS `app_1_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_1_products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=552 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_1_products`
--

LOCK TABLES `app_1_products` WRITE;
/*!40000 ALTER TABLE `app_1_products` DISABLE KEYS */;
INSERT INTO `app_1_products` VALUES (458,'Akai MPK Mini MK3','MIDI Keyboard',14500.00,'products/mk5.jpeg','Compact, expressive, and great for producers on the move.',21),(459,'AKG C214','Condenser Microphone',31000.00,'products/cm4.jpeg','Detailed warm sound ideal for vocals and acoustic instruments.',20),(460,'Alesis V49','MIDI Keyboard',16500.00,'products/mk4.jpeg','A full-sized MIDI keyboard controller with pads and knobs.',11),(461,'Arturia MatrixBrute','Analog Synthesizer',155000.00,'products/as5.jpeg','A beastly analog synth with massive patching potential.',8),(462,'Arturia MiniLab 3','MIDI Keyboard',12500.00,'products/mk2.jpeg','An expressive MIDI controller with great DAW integration.',22),(463,'Audio-Technica AT2020','Condenser Microphone',9500.00,'products/cm1.jpg','A sensitive microphone ideal for vocals and instruments.',31),(464,'Behringer Neutron','Analog Synthesizer',32000.00,'products/as2.jpeg','A classic analog synth with fat tones and hands-on control.',20),(465,'Bharat Musicals Pro Concert Sitar','Sitar',24000.00,'products/st6.jpeg','Concert-grade instrument with seasoned toomba and khunti.',9),(466,'Bhargava Tabla Studio Set','Tabla',13200.00,'products/tb5.jpeg','Premium tabla with heavy copper bayan and clean dayan.',14),(467,'Blackstar ID:Core 10','Guitar Amp',8500.00,'products/ga4.jpeg','Affordable stereo combo amp with built-in effects.',19),(468,'Blue Yeti Pro','Condenser Microphone',24000.00,'products/cm5.jpeg','USB/XLR hybrid mic with high-resolution recording quality.',18),(469,'Boss RC-1','Loop Station',11000.00,'products/ls1.jpeg','A simple yet powerful looping pedal for performance.',12),(470,'Bugera V5 Infinium','Guitar Amp',15500.00,'products/ga5.jpeg','Tube-driven amp with vintage warmth in a compact frame.',14),(471,'Carlsbro CSD130','Electronic Drum Kit',29000.00,'products/eds5.jpeg','Lightweight and portable kit ideal for beginners.',27),(472,'Casio CDP-S150','Digital Piano',32000.00,'products/dp2.jpeg','A versatile digital piano with realistic touch and tone.',25),(473,'Cecilio CVN-500 Violin Set','Violin',14500.00,'products/v6.jpeg','Balanced tone and great for intermediate players.',25),(474,'Chennai Mridangam Student Model','Mridangam',11500.00,'products/mdg3.jpeg','Lightweight and tuned for easy practice.',16),(475,'Cort X100','Electric Guitar',18000.00,'products/eg7.jpeg','High-speed neck and aggressive pickups for metal and shred.',18),(476,'Cremona SV-130 Premier','Violin',13500.00,'products/v4.jpeg','Complete kit with bow and case  great for learners.',12),(477,'Dayan & Bayan Deluxe Tabla','Tabla',11800.00,'products/tb3.jpeg','A trusted name in tabla craftsmanship with great sustain.',18),(478,'Dev Bansuri Transverse C Sharp','Flute',1800.00,'products/ft5.webp','Entry-level bansuri with easy fingering and sound.',11),(479,'Donner DEP-20','Digital Piano',29500.00,'products/dp6.jpeg','A budget digital piano with impressive sound variety.',25),(480,'DW Collector Series','Acoustic Drum Kit',58000.00,'products/ads3.jpeg','A premium acoustic drum kit with high-quality components for studio and stage.',15),(481,'Elektron Analog Four','Analog Synthesizer',125000.00,'products/as6.jpeg','Powerful analog architecture with sequencer-driven sound design.',11),(482,'ESP LTD EC-10','Electric Guitar',21000.00,'products/eg5.jpeg','Entry-level rock machine with aggressive tone.',24),(483,'Fender CD-60S #788','Acoustic Guitar',7200.00,'products/ag6.jpeg','Perfect for beginners and pros alike with its smooth action.',23),(484,'Fender FA-125','Acoustic Guitar',7500.00,'products/ag3.jpeg','A beautifully crafted acoustic guitar with warm rich tones.',18),(485,'Fender Mustang LT25','Guitar Amp',11000.00,'products/ga2.jpeg','A powerful amp for practice or small gigs.',20),(486,'Fender Player Stratocaster','Electric Guitar',60000.00,'products/eg2.webp','A sleek electric guitar perfect for rock and metal tones.',18),(487,'Fiddlerman Artist Violin','Violin',17500.00,'products/v5.jpeg','Solid construction and ebony fittings for clean tone.',20),(488,'Focusrite Scarlett 2i2','Audio Interface',21000.00,'products/ai1.jpeg','A compact and reliable audio interface for all setups.',24),(489,'Gibson Les Paul Studio','Electric Guitar',85000.00,'products/eg4.jpeg','A sleek electric guitar perfect for rock and metal tones.',12),(490,'Gretsch Catalina #823','Acoustic Drum Kit',35000.00,'products/ads6.jpeg','This kit combines retro charm with modern playability and warm tones.',19),(491,'Guild D-240E #613','Acoustic Guitar',8800.00,'products/ag5.jpeg','A solid performer with rich lows and crystal-clear highs.',21),(492,'Hamsapriya Wooden Veena','Veena',22500.00,'products/vn5.jpeg','Handcrafted teakwood body and intricate detailing.',18),(493,'Hari Prasad Signature Bansuri','Flute',3500.00,'products/ft1.jpeg','Premium bamboo flute tuned to perfection in C scale.',21),(494,'Haridas Sitar Student Model','Sitar',15000.00,'products/st5.jpeg','Beginner-friendly sitar with solid tuning and resonance.',10),(495,'Ibanez GRX70QA','Electric Guitar',13500.00,'products/eg1.jpeg','A sleek electric guitar perfect for rock and metal tones.',30),(496,'Ibanez SR300E','Bass Guitar',40000.00,'products/bg1.jpg','A modern bass with deep tone and smooth playability.',14),(497,'Kalalaya Deluxe Wooden Veena','Veena',33000.00,'products/vn4.jpeg','Electric-acoustic veena perfect for stage fusion.',10),(498,'Kawai ES110','Digital Piano',49000.00,'products/dp4.png','Realistic key action and beautiful tone in a compact design.',19),(499,'RPJ 24 Pro','Studio Monitor',29000.00,'products/sm1.jpeg','Accurate and punchy monitors for mixing and production.',14),(500,'Korg B2SP','Digital Piano',37000.00,'products/dp5.jpeg','An elegant beginner-friendly digital piano with full-sized keys.',23),(501,'Korg Kross 2','Keyboard Synthesizer',62000.00,'products/ks1.jpeg','A versatile synth keyboard for stage and studio.',10),(502,'Korg Monologue','Analog Synthesizer',27000.00,'products/as3.jpeg','A classic analog synth with fat tones and hands-on control.',22),(503,'KRK Rokit 5 G4','Studio Monitor',35000.00,'products/sm2.jpeg','Accurate and punchy monitors for mixing and production.',6),(504,'Ludwig Classic Maple #452','Acoustic Drum Kit',42000.00,'products/ads4.jpeg','The Ludwig Classic Maple #452 delivers professional-grade tone and durability.',22),(505,'Mapex Armory #391','Acoustic Drum Kit',39000.00,'products/ads5.jpeg','The Mapex Armory #391 offers dynamic sound for all playing styles.',28),(506,'Marshall MG15G',' Guitar Amp',10500.00,'products/ga1.jpeg','A powerful amp for practice or small gigs.',25),(507,'Martin D-28 #542','Acoustic Guitar',9600.00,'products/ag4.jpeg','Known for its balanced tone and projection,  this guitar suits any genre.',26),(508,'Mohan Lal Sharma Vilayat Khan Style','Sitar',26000.00,'products/st4.jpeg','Modeled after the legendary Vilayat Khanna\'s specifications.',12),(509,'Monoj Kumar Sardar Tabla','Tabla',9500.00,'products/tb4.jpeg','Great for learners and home recording use.',18),(510,'Moog Subsequent 37','Analog Synthesizer',150000.00,'products/as1.jpeg','A classic analog synth with fat tones and hands-on control.',12),(511,'Mumtaz Tabla Professional Set','Tabla',14500.00,'products/tb2.jpeg','Leather-strapped tabla set with deep resonant bass.',20),(512,'Nadabrahma Mridangam Tanjore Style','Mridangam',14500.00,'products/mdg1.jpeg','Made with seasoned jackwood and traditional valan.',12),(513,'Narendra Babu Sitar Custom Carved','Sitar',28500.00,'products/st1.jpeg','Highly decorated sitar with custom inlays and pegs.',8),(514,'Nektar Impact LX61+','MIDI Keyboard',19500.00,'products/mk3.jpeg','An expressive MIDI controller with great DAW integration.',15),(515,'Neumann TLM 103','Condenser Microphone',75000.00,'products/cm3.jpeg','A sensitive microphone ideal for vocals and instruments.',10),(516,'Novation Launchkey 49','MIDI Keyboard',22000.00,'products/mk1.jpeg','An expressive MIDI controller with great DAW integration.',18),(517,'NUX DM-7X','Electronic Drum Kit',52000.00,'products/eds6.jpeg','Mesh heads and realistic feel for practice and play.',16),(518,'Orange Crush 20RT','Guitar Amp',13500.00,'products/ga3.jpeg','A powerful amp for practice or small gigs.',15),(519,'Paloma Sitar Fusion Edition','Sitar',19500.00,'products/st7.jpeg','Designed for fusion and contemporary performance.',18),(520,'Pearl Roadshow','Acoustic Drum Kit',23000.00,'products/ads2.jpeg','A premium acoustic drum kit with high-quality components for studio and stage.',30),(521,'Pudukottai Mridangam Concert Model','Mridangam',16500.00,'products/mdg2.jpeg','Concert-quality mridangam with strong bass.',9),(522,'Punam Bansuri Professional','Flute',4200.00,'products/ft2.jpeg','Handcrafted for concert use with deep mellow tone.',24),(523,'Radha Krishna Sharma Sitar Deluxe','Sitar',22000.00,'products/st3.jpeg','Deluxe sitar with rich tone and intricate carving.',19),(524,'Ravi & Sons Mridangam Fiberskin','Mridangam',13200.00,'products/mdg6.jpeg','Durable with synthetic skin and wooden body.',14),(525,'Reed & Wind Fiber Bansuri','Flute',2800.00,'products/ft4.jpeg','Durable fiber body for all-weather outdoor performance.',20),(526,'Rikhi Ram Sitar Classic','Sitar',18000.00,'products/st2.jpeg','Handcrafted sitar with traditional jawari and fine woodwork.',8),(527,'Rode NT1-A','Condenser Microphone',18000.00,'products/cm2.jpeg','A sensitive microphone ideal for vocals and instruments.',15),(528,'Roland Fantom-06','Keyboard Synthesizer',120000.00,'products/ks2.jpeg','A versatile synth keyboard for stage and studio.',12),(529,'Roland FP-30X','Digital Piano',65000.00,'products/dp3.jpeg','A versatile digital piano with realistic touch and tone.',18),(530,'Roland TD-1DMK','Electronic Drum Kit',55000.00,'products/eds2.jpeg','A compact electronic drum kit with responsive pads.',18),(531,'Samson Carbon 61','MIDI Keyboard',18500.00,'products/mk6.jpeg','Simple and affordable keyboard with plug-and-play connectivity.',15),(532,'Shree Lalita Concert Veena','Veena',35000.00,'products/vn1.jpeg','Flamed maple back and antique finish for stage appeal.',18),(533,'Shure SM27','Condenser Microphone',28000.00,'products/cm6.jpeg','A rugged condenser mic with a natural sound profile.',16),(534,'Sri Ganapathy Mridangam Deluxe','Mridangam',15800.00,'products/mdg4.jpeg','Premium finish with excellent tonal balance.',13),(535,'Stentor Student II Violin 4/4','Violin',8700.00,'products/v1.jpeg','Tuned in C# with excellent balance and clarity.',10),(536,'Stradivari Replica Violin','Violin',15500.00,'products/v2.jpeg','Ideal for beginners with good tone and playability.',15),(537,'Subhash Bansuri Concert G Scale','Flute',3900.00,'products/ft3.png','G-scale flute with rich tonal clarity and precise tuning.',15),(538,'Subramaniam Student Veena','Veena',19000.00,'products/vn2.jpeg','Concert-grade veena with rich acoustic projection.',20),(539,'Swara Vani Electric Veena','Veena',41000.00,'products/vn3.jpeg','Built for beginners with good sustain and balance.',12),(540,'Tama Imperialstar','Acoustic Drum Kit',37000.00,'products/ads1.jpeg','A premium acoustic drum kit with high-quality components for studio and stage.',20),(541,'Tanjavur Mridangam Pro Classic','Mridangam',17500.00,'products/mdg5.jpeg','Crafted in Tanjavur with traditional methods.',10),(542,'Taylor 214ce','Acoustic Guitar',10000.00,'products/ag2.jpg','A beautifully crafted acoustic guitar with warm rich tones.',35),(543,'VOX VT20X','Guitar Amp',13800.00,'products/ga6.jpeg','Modeling amp with tube sound and modern flexibility.',20),(544,'Waldorf Blofeld','Analog Synthesizer',42000.00,'products/as4.jpeg','A rich-sounding compact synth with deep modulation options.',17),(545,'Yamaha DTX402K','Electronic Drum Kit',37000.00,'products/eds1.jpeg','A compact electronic drum kit with responsive pads.',20),(546,'Yamaha FG800','Acoustic Guitar',2500.00,'products/ag1.jpg','A beautifully crafted acoustic guitar with warm rich tones.',25),(547,'Yamaha HS7','Tabla',12500.00,'products/tb1.jpeg','Balanced tone and handmade puddis for clear sound.',7),(548,'Yamaha MX49','Keyboard Synthesizer',58000.00,'products/ks3.jpeg','A versatile synth keyboard for stage and studio.',20),(549,'Yamaha P-125','Digital Piano',45000.00,'products/dp1.jpeg','A versatile digital piano with realistic touch and tone.',20),(550,'Yamaha TRBX304','Bass Guitar',36000.00,'products/bg2.jpg','A modern bass with deep tone and smooth playability.',17),(551,'Yamaha V3SKA Violin Outfit','Violin',21000.00,'products/v3.jpeg','Inspired by the Stradivarius design for warm tone.',10);
/*!40000 ALTER TABLE `app_1_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_1_query`
--

DROP TABLE IF EXISTS `app_1_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_1_query` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_1_query_user_id_e8669944_fk_app_1_customuser_id` (`user_id`),
  CONSTRAINT `app_1_query_user_id_e8669944_fk_app_1_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `app_1_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_1_query`
--

LOCK TABLES `app_1_query` WRITE;
/*!40000 ALTER TABLE `app_1_query` DISABLE KEYS */;
INSERT INTO `app_1_query` VALUES (30,'Query','This is a test query','2025-04-11 03:44:07.614013',18),(31,'ggggg','ggggg','2025-04-12 05:13:53.753593',18),(33,'test','hiiiiiii','2025-04-16 18:04:30.449786',34),(34,'test','hiiiiii this is test','2025-04-16 18:06:32.993636',34),(35,'test','hiiiiii this is test','2025-04-16 18:06:34.380477',34);
/*!40000 ALTER TABLE `app_1_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_1_review`
--

DROP TABLE IF EXISTS `app_1_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_1_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL,
  `comment` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_1_review_product_id_8366bbbe_fk_app_1_products_id` (`product_id`),
  KEY `app_1_review_user_id_1ee63949_fk_app_1_customuser_id` (`user_id`),
  CONSTRAINT `app_1_review_product_id_8366bbbe_fk_app_1_products_id` FOREIGN KEY (`product_id`) REFERENCES `app_1_products` (`id`),
  CONSTRAINT `app_1_review_user_id_1ee63949_fk_app_1_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `app_1_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_1_review`
--

LOCK TABLES `app_1_review` WRITE;
/*!40000 ALTER TABLE `app_1_review` DISABLE KEYS */;
INSERT INTO `app_1_review` VALUES (7,5,'nice','2025-04-16 17:43:27.946003',463,34);
/*!40000 ALTER TABLE `app_1_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_1_wishlist`
--

DROP TABLE IF EXISTS `app_1_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_1_wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `app_1_wishlist_user_id_9ebb0fb9_fk_app_1_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `app_1_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_1_wishlist`
--

LOCK TABLES `app_1_wishlist` WRITE;
/*!40000 ALTER TABLE `app_1_wishlist` DISABLE KEYS */;
INSERT INTO `app_1_wishlist` VALUES (1,'2025-04-10 15:31:53.609466',18),(2,'2025-04-11 03:51:33.420014',26),(5,'2025-04-16 17:43:57.306523',34);
/*!40000 ALTER TABLE `app_1_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_1_wishlistitem`
--

DROP TABLE IF EXISTS `app_1_wishlistitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_1_wishlistitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `added_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `wishlist_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_1_wishlistitem_product_id_970336d4_fk_app_1_products_id` (`product_id`),
  KEY `app_1_wishlistitem_wishlist_id_254e0eee_fk_app_1_wishlist_id` (`wishlist_id`),
  CONSTRAINT `app_1_wishlistitem_product_id_970336d4_fk_app_1_products_id` FOREIGN KEY (`product_id`) REFERENCES `app_1_products` (`id`),
  CONSTRAINT `app_1_wishlistitem_wishlist_id_254e0eee_fk_app_1_wishlist_id` FOREIGN KEY (`wishlist_id`) REFERENCES `app_1_wishlist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_1_wishlistitem`
--

LOCK TABLES `app_1_wishlistitem` WRITE;
/*!40000 ALTER TABLE `app_1_wishlistitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_1_wishlistitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add products',6,'add_products'),(22,'Can change products',6,'change_products'),(23,'Can delete products',6,'delete_products'),(24,'Can view products',6,'view_products'),(25,'Can add user',7,'add_customuser'),(26,'Can change user',7,'change_customuser'),(27,'Can delete user',7,'delete_customuser'),(28,'Can view user',7,'view_customuser'),(29,'Can add cart',8,'add_cart'),(30,'Can change cart',8,'change_cart'),(31,'Can delete cart',8,'delete_cart'),(32,'Can view cart',8,'view_cart'),(33,'Can add order',9,'add_order'),(34,'Can change order',9,'change_order'),(35,'Can delete order',9,'delete_order'),(36,'Can view order',9,'view_order'),(37,'Can add order item',10,'add_orderitem'),(38,'Can change order item',10,'change_orderitem'),(39,'Can delete order item',10,'delete_orderitem'),(40,'Can view order item',10,'view_orderitem'),(41,'Can add cart item',11,'add_cartitem'),(42,'Can change cart item',11,'change_cartitem'),(43,'Can delete cart item',11,'delete_cartitem'),(44,'Can view cart item',11,'view_cartitem'),(45,'Can add query',12,'add_query'),(46,'Can change query',12,'change_query'),(47,'Can delete query',12,'delete_query'),(48,'Can view query',12,'view_query'),(49,'Can add review',13,'add_review'),(50,'Can change review',13,'change_review'),(51,'Can delete review',13,'delete_review'),(52,'Can view review',13,'view_review'),(53,'Can add faq',14,'add_faq'),(54,'Can change faq',14,'change_faq'),(55,'Can delete faq',14,'delete_faq'),(56,'Can view faq',14,'view_faq'),(57,'Can add wishlist',15,'add_wishlist'),(58,'Can change wishlist',15,'change_wishlist'),(59,'Can delete wishlist',15,'delete_wishlist'),(60,'Can view wishlist',15,'view_wishlist'),(61,'Can add wishlist item',16,'add_wishlistitem'),(62,'Can change wishlist item',16,'change_wishlistitem'),(63,'Can delete wishlist item',16,'delete_wishlistitem'),(64,'Can view wishlist item',16,'view_wishlistitem');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_app_1_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app_1_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `app_1_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (49,'2025-04-09 18:01:47.278310','17','Seungmin',3,'',7,18),(50,'2025-04-09 18:01:47.278978','16','1234',3,'',7,18),(51,'2025-04-09 18:01:47.279012','14','musicalmagic_17',3,'',7,18),(52,'2025-04-09 18:01:47.279035','13','kavitha@1234',3,'',7,18),(53,'2025-04-09 18:01:47.279053','12','unique',3,'',7,18),(54,'2025-04-09 18:01:47.279070','4','kavitha_1701',3,'',7,18),(55,'2025-04-09 18:25:48.578124','20','ak@123',3,'',7,18),(56,'2025-04-09 18:25:48.578238','19','savitha123',3,'',7,18),(57,'2025-04-10 03:05:24.978327','1','❓Q: How do I place an order?',1,'[{\"added\": {}}]',14,18),(58,'2025-04-10 03:05:49.702659','2','❓Q: Can I return or cancel a product after ordering?',1,'[{\"added\": {}}]',14,18),(59,'2025-04-10 03:06:00.583244','3','❓Q: What payment methods are supported?',1,'[{\"added\": {}}]',14,18),(60,'2025-04-10 03:06:14.591029','4','❓Q: I forgot my password. What should I do?',1,'[{\"added\": {}}]',14,18),(61,'2025-04-10 03:07:23.618194','5','❓Q: Can I update my address or profile info later?',1,'[{\"added\": {}}]',14,18),(62,'2025-04-10 03:07:46.701233','6','❓Q: What happens if my online payment fails?',1,'[{\"added\": {}}]',14,18),(63,'2025-04-10 03:08:04.513965','7','❓Q: How do I leave a review for a product?',1,'[{\"added\": {}}]',14,18),(64,'2025-04-10 14:23:52.630108','22','musical_magic',3,'',7,18),(65,'2025-04-11 03:48:07.129121','25','musicalmagic',3,'',7,18),(66,'2025-04-14 06:08:00.284650','28','kavitha_1701',3,'',7,18),(67,'2025-04-16 14:08:22.052636','29','kavitha_1701',3,'',7,18),(68,'2025-04-16 14:38:51.633901','30','kavitha_1706',3,'',7,18),(69,'2025-04-16 15:44:19.060852','31','kavitha_1706',3,'',7,18),(70,'2025-04-16 16:51:25.153006','32','kavitha_1706',3,'',7,18);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(8,'app_1','cart'),(11,'app_1','cartitem'),(7,'app_1','customuser'),(14,'app_1','faq'),(9,'app_1','order'),(10,'app_1','orderitem'),(6,'app_1','products'),(12,'app_1','query'),(13,'app_1','review'),(15,'app_1','wishlist'),(16,'app_1','wishlistitem'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-03-27 11:19:38.150866'),(2,'contenttypes','0002_remove_content_type_name','2025-03-27 11:19:38.757067'),(3,'auth','0001_initial','2025-03-27 11:19:39.411655'),(4,'auth','0002_alter_permission_name_max_length','2025-03-27 11:19:39.504627'),(5,'auth','0003_alter_user_email_max_length','2025-03-27 11:19:39.511628'),(6,'auth','0004_alter_user_username_opts','2025-03-27 11:19:39.523620'),(7,'auth','0005_alter_user_last_login_null','2025-03-27 11:19:39.545323'),(8,'auth','0006_require_contenttypes_0002','2025-03-27 11:19:39.549382'),(9,'auth','0007_alter_validators_add_error_messages','2025-03-27 11:19:39.556747'),(10,'auth','0008_alter_user_username_max_length','2025-03-27 11:19:39.566317'),(11,'auth','0009_alter_user_last_name_max_length','2025-03-27 11:19:39.576746'),(12,'auth','0010_alter_group_name_max_length','2025-03-27 11:19:39.605121'),(13,'auth','0011_update_proxy_permissions','2025-03-27 11:19:39.620999'),(14,'auth','0012_alter_user_first_name_max_length','2025-03-27 11:19:39.628090'),(15,'app_1','0001_initial','2025-03-27 11:19:40.955979'),(16,'admin','0001_initial','2025-03-27 11:19:41.335389'),(17,'admin','0002_logentry_remove_auto_add','2025-03-27 11:19:41.349077'),(18,'admin','0003_logentry_add_action_flag_choices','2025-03-27 11:19:41.368736'),(19,'sessions','0001_initial','2025-03-27 11:19:41.462521'),(20,'app_1','0002_order_payment_method_alter_products_stock','2025-04-07 17:53:55.575034'),(21,'app_1','0003_alter_order_status','2025-04-08 02:53:08.939160'),(22,'app_1','0004_query','2025-04-08 05:58:02.966933'),(23,'app_1','0005_review','2025-04-08 08:29:10.766887'),(24,'app_1','0006_alter_customuser_email','2025-04-09 18:30:26.573741'),(25,'app_1','0007_faq','2025-04-10 02:43:53.253819'),(26,'app_1','0008_wishlist_wishlistitem','2025-04-10 15:03:20.765830'),(27,'app_1','0009_alter_customuser_phone_number','2025-04-11 07:30:08.470265'),(28,'app_1','0010_alter_customuser_phone_number','2025-04-11 07:30:08.804526'),(29,'app_1','0011_alter_customuser_phone_number','2025-04-12 03:38:09.092332'),(30,'app_1','0012_order_reason','2025-04-12 05:25:50.655362');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('82krbbcdmphn8wch0x71lfk90pn4jjlf','.eJxVjMsOwiAQRf-FtSHDowx16d5vIAwDUjU0Ke3K-O_apAvd3nPOfYkQt7WGreclTCzOQqE4_Y4U0yO3nfA9ttss09zWZSK5K_KgXV5nzs_L4f4d1Njrt0ZliovKFzO6ISVlKLKHPDCw8RqQ0GrOZIAcAVoGAjc6nagAImYr3h8A1TfJ:1u2EYh:4jngaGVghqngdj9YBJ68hN8zIjpl9FnlOG1nhh9XHS8','2025-04-22 19:24:31.241376'),('8xl2e5x1ht00oysfiygprd3l9jrhhtbp','.eJxVjDsOwjAQBe_iGllrx1l7Kek5g7X-4QBypDipEHeHSCmgfTPzXsLztla_9bz4KYmzGMTpdwscH7ntIN253WYZ57YuU5C7Ig_a5XVO-Xk53L-Dyr1-a7AlOtbZkCVMURGB0ykCmxFdQYWFEB2MVEoKDhQVg5TNwADB6mjF-wPQMDc4:1u2ESa:CbER5OOfA2caTBqoQ4T7yUMTA4VT1QMR-3bM05TqhUg','2025-04-22 19:18:12.222061'),('aeo58dbre34izzd06j2czu0sw8b8m7qu','.eJxVjDELwjAUhP9LZinJS9M2joKzk3O45L3Qoi2ltZP4301BQeGWu_vunipge_RhW2UJA6ujolYdfsOIdJNpbzDPwVQyYrh_0-q8u8tyLeSEUU4f-O-hx9qXubOIHjDMxkMTuVxr7esuO-pAbKy3XNQmidxAJFknzuRkkQixgXq9AUBzOSo:1u4CSt:0ME3aw7j1Ya1hZ2BMBofR1rFLwEbTlG0JwPsBRxglj8','2025-04-28 05:34:39.834926'),('g8aokiy0vmgiha5x6rw23jy4jitbp5jy','.eJxVjMsOwiAQRf-FtSG8EZfu-w2EzjBSNZCUdmX8dyXpQrf3nHNfLKZ9K3HveY0LsgvT7PS7zQkeuQ6A91RvjUOr27rMfCj8oJ1PDfPzerh_ByX1MupElrwH-iZo9NmQC-RhBqsNeanQQcheBKEdopCEYLPyJmkISsqs2fsDFzU4nA:1u21SR:xl5FuTG1cwr-OEf-oJxwl-ltiv_bMXDct1wjnOgUKcM','2025-04-22 05:25:11.579943'),('h17fzeklz87mtcb1svvlaskf45m93t18','.eJxVjMsOwiAQRf-FtSFQYWBcuu83kBkeUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSpiQuwonT78YUH7ntIN2p3WYZ57YuE8tdkQftcpxTfl4P9--gUq_fekAgayPkIRYuGpFA-eIKJIhoC7B1ymuPkDIb9myVSsYY786aGVGL9wfqITea:1u1cGN:5k0nC3xClXi4Phlja8bLkxSRtKN36QVKXsL7BYwrwqg','2025-04-21 02:31:03.758516'),('iixztns7lfhi1bzt7vt7xqufsh6fttbs','.eJxVjDsOwjAQBe_iGllrx1l7Kek5g7X-4QBypDipEHeHSCmgfTPzXsLztla_9bz4KYmzGMTpdwscH7ntIN253WYZ57YuU5C7Ig_a5XVO-Xk53L-Dyr1-a7AlOtbZkCVMURGB0ykCmxFdQYWFEB2MVEoKDhQVg5TNwADB6mjF-wPQMDc4:1u2ESg:yLuDEzswPJt-bK2vIfxi5dpI--CnEUr7rjAotlc2yJA','2025-04-22 19:18:18.927946'),('iqs111p4j9kdy9bvboqmf9znn3vt46az','.eJxVjMEKwjAQRP8lZynNZkkaj4LnnjyHaXalRVtKa0_iv5uCgh7nzZt5moTt0adt1SUNYo7GNubwCzvkm057g3lOttIRw_1Lq_Oe2uVSzAmjnj7y30OPtS_zSN6p1UAk0tXkggoYdQYJN9QE9jZyzHURFCzqIvyVXJaOEeCCeb0BLuc4Rg:1u53QY:HAQcLR0XBCtG9MftOCXZufZLvTw28BC6QgP6ToFcZOo','2025-04-30 14:07:46.097271'),('ir0cqu9zjatz2xrkrwq0c09o118qgrfq','.eJxVjDsOwyAQRO9CHSHA_Jwyvc-AlmUdnEQgGbuKcvdgyUVSjfTmzbxZgH3LYW-0hiWxKxvZ5ZdFwCeVo0gPKPfKsZZtXSI_FH62jU810et2un8HGVruaxCOZglm8GDtAA4VaiMIEZxFo7y3ZlBi1tEpij0lJKnBpBE68lGyzxfpVDfz:1u1drF:NaQbuasfPsVPykYXKrp-HW58zl8BwvqmUPsbwU4tpZM','2025-04-21 04:13:13.602912'),('o1y1nztueutc0xn4mm7q8x7xonzpas00','.eJxVjMsKwjAURP8layl5NE3iUnDtynWY3NyQoi2ltSvx321BQZdz5sw8RcT6qHFdeI59FkehvDj8wgS68bg3mKaoGh7Q37-0Oe_pMl83c8TAp4_891Cx1G0uWRICVJHWWuNCK5NzymnSZLhQ4EzovNPeSkPZF8_oZGLPrUaGhni9ATg1ONw:1u37ae:yPhyMTncLi1XZPTEF4SLKst2jtkCp54PzqclfbkjelA','2025-04-25 06:10:12.656877'),('o9dcemgs61na59vmd3c0z06gfm6bjolk','.eJxVjLsKwkAQRf9lawmZfcwaS8HaynqZ2ZmwQRNCYirx33VBQct77uE8TKLtXtK26pIGMQfjvNn9QqZ81ak-NM8JGh1puH1pc6rrvFze5kSjHj_yX6HQWmpYxZNDFeydY09Z2KL6VgBR0EIMoe0xe9bIvHdkIYAHG2MAFuo683wBSGs4QQ:1u575y:ngNZ_btX01p6To7Gop2JxaDgYUHfw8AYVrGJ0lcagkk','2025-04-30 18:02:46.653153'),('qehv9dxzsgalenlgjzddb3f7id7l0zpn','.eJxVjDELwjAUhP9LZinJS9M2joKzk3O45L3Qoi2ltZP4301BQeGWu_vunipge_RhW2UJA6ujolYdfsOIdJNpbzDPwVQyYrh_0-q8u8tyLeSEUU4f-O-hx9qXubOIHjDMxkMTuVxr7esuO-pAbKy3XNQmidxAJFknzuRkkQixgXq9AUBzOSo:1u4CSu:9ARdx40mF0vh5QVByiqnhvGK4euuCmf7fLzvIkLWwnE','2025-04-28 05:34:40.173104'),('vdj5dhcl2269ozo9rckn29co4xs38rhk','.eJxVjDsOwjAQBe_iGllrx1l7Kek5g7X-4QBypDipEHeHSCmgfTPzXsLztla_9bz4KYmzGMTpdwscH7ntIN253WYZ57YuU5C7Ig_a5XVO-Xk53L-Dyr1-a7AlOtbZkCVMURGB0ykCmxFdQYWFEB2MVEoKDhQVg5TNwADB6mjF-wPQMDc4:1u2RFN:71EQm2dg9rHBmnDYr1CWmzqpBuCCbTnmrC2_GCrgUKo','2025-04-23 08:57:25.788857');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-17  0:08:38
