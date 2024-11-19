-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: yii2Diplom
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Название` varchar(255) NOT NULL,
  `Описание` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characteristics`
--

DROP TABLE IF EXISTS `characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characteristics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Название` varchar(255) NOT NULL,
  `Описание` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characteristics`
--

LOCK TABLES `characteristics` WRITE;
/*!40000 ALTER TABLE `characteristics` DISABLE KEYS */;
/*!40000 ALTER TABLE `characteristics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Название` varchar(255) NOT NULL,
  `Страна` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1731982607),('m130524_201442_init',1731982610),('m190124_110200_add_verification_token_column_to_user_table',1731982610),('m241115_014353_SmartWatchMagazine',1731982610);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_characteristics`
--

DROP TABLE IF EXISTS `product_characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_characteristics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `characteristic_id` int NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-product_characteristics-product_id` (`product_id`),
  KEY `fk-product_characteristics-characteristic_id` (`characteristic_id`),
  CONSTRAINT `fk-product_characteristics-characteristic_id` FOREIGN KEY (`characteristic_id`) REFERENCES `characteristics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk-product_characteristics-product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_characteristics`
--

LOCK TABLES `product_characteristics` WRITE;
/*!40000 ALTER TABLE `product_characteristics` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_characteristics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `URL_изображения` varchar(255) NOT NULL,
  `Основное_изображение` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk-product_images-product` (`product_id`),
  CONSTRAINT `fk-product_images-product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Название` varchar(255) NOT NULL,
  `Цена` decimal(10,2) NOT NULL,
  `Описание` text,
  `category_id` int DEFAULT NULL,
  `manufacturer_id` int DEFAULT NULL,
  `Вес` decimal(10,2) DEFAULT NULL,
  `SKU` varchar(100) DEFAULT NULL,
  `Количество_на_складе` int NOT NULL DEFAULT '0',
  `Дата_создания` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Дата_обновления` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk-products-category` (`category_id`),
  KEY `fk-products-manufacturer` (`manufacturer_id`),
  CONSTRAINT `fk-products-category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk-products-manufacturer` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `Оценка` int NOT NULL,
  `Текст` text,
  `Дата` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk-reviews-user` (`user_id`),
  KEY `fk-reviews-product` (`product_id`),
  CONSTRAINT `fk-reviews-product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk-reviews-user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT '10',
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  `verification_token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user1','auth_key_1','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_1','user1@example.com',10,1731900924,1731900924,NULL),(2,'user2','auth_key_2','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_2','user2@example.com',10,1731900924,1731900924,NULL),(3,'user3','auth_key_3','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_3','user3@example.com',10,1731900924,1731900924,NULL),(4,'user4','auth_key_4','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_4','user4@example.com',10,1731900924,1731900924,NULL),(5,'user5','auth_key_5','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_5','user5@example.com',10,1731900924,1731900924,NULL),(6,'user6','auth_key_6','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_6','user6@example.com',10,1731900924,1731900924,NULL),(7,'user7','auth_key_7','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_7','user7@example.com',10,1731900924,1731900924,NULL),(8,'user8','auth_key_8','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_8','user8@example.com',10,1731900924,1731900924,NULL),(9,'user9','auth_key_9','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_9','user9@example.com',10,1731900924,1731900924,NULL),(10,'user10','auth_key_10','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_10','user10@example.com',10,1731900924,1731900924,NULL),(11,'user11','auth_key_11','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_11','user11@example.com',10,1731900924,1731900924,NULL),(12,'user12','auth_key_12','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_12','user12@example.com',10,1731900924,1731900924,NULL),(13,'user13','auth_key_13','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_13','user13@example.com',10,1731900924,1731900924,NULL),(14,'user14','auth_key_14','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_14','user14@example.com',10,1731900924,1731900924,NULL),(15,'user15','auth_key_15','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_15','user15@example.com',10,1731900924,1731900924,NULL),(16,'user16','auth_key_16','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_16','user16@example.com',10,1731900924,1731900924,NULL),(17,'user17','auth_key_17','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_17','user17@example.com',10,1731900924,1731900924,NULL),(18,'user18','auth_key_18','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_18','user18@example.com',10,1731900924,1731900924,NULL),(19,'user19','auth_key_19','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_19','user19@example.com',10,1731900924,1731900924,NULL),(20,'user20','auth_key_20','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_20','user20@example.com',10,1731900924,1731900924,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-19 10:17:23
