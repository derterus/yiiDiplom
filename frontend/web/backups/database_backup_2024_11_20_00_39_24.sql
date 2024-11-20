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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Категория 1','Описание категории 1'),(2,'Категория 2','Описание категории 2'),(3,'Категория 3','Описание категории 3'),(4,'Категория 4','Описание категории 4'),(5,'Категория 5','Описание категории 5'),(6,'Категория 6','Описание категории 6'),(7,'Категория 7','Описание категории 7'),(8,'Категория 8','Описание категории 8'),(9,'Категория 9','Описание категории 9'),(10,'Категория 10','Описание категории 10'),(11,'Категория 11','Описание категории 11'),(12,'Категория 12','Описание категории 12'),(13,'Категория 13','Описание категории 13'),(14,'Категория 14','Описание категории 14'),(15,'Категория 15','Описание категории 15'),(16,'Категория 16','Описание категории 16'),(17,'Категория 17','Описание категории 17'),(18,'Категория 18','Описание категории 18'),(19,'Категория 19','Описание категории 19'),(20,'Категория 20','Описание категории 20');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characteristics`
--

LOCK TABLES `characteristics` WRITE;
/*!40000 ALTER TABLE `characteristics` DISABLE KEYS */;
INSERT INTO `characteristics` VALUES (1,'Характеристика 1','Описание характеристики 1'),(2,'Характеристика 2','Описание характеристики 2'),(3,'Характеристика 3','Описание характеристики 3'),(4,'Характеристика 4','Описание характеристики 4'),(5,'Характеристика 5','Описание характеристики 5'),(6,'Характеристика 6','Описание характеристики 6'),(7,'Характеристика 7','Описание характеристики 7'),(8,'Характеристика 8','Описание характеристики 8'),(9,'Характеристика 9','Описание характеристики 9'),(10,'Характеристика 10','Описание характеристики 10'),(11,'Характеристика 11','Описание характеристики 11'),(12,'Характеристика 12','Описание характеристики 12'),(13,'Характеристика 13','Описание характеристики 13'),(14,'Характеристика 14','Описание характеристики 14'),(15,'Характеристика 15','Описание характеристики 15'),(16,'Характеристика 16','Описание характеристики 16'),(17,'Характеристика 17','Описание характеристики 17'),(18,'Характеристика 18','Описание характеристики 18'),(19,'Характеристика 19','Описание характеристики 19'),(20,'Характеристика 20','Описание характеристики 20');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (1,'Производитель 1','Страна 1'),(2,'Производитель 2','Страна 2'),(3,'Производитель 3','Страна 3'),(4,'Производитель 4','Страна 4'),(5,'Производитель 5','Страна 5'),(6,'Производитель 6','Страна 6'),(7,'Производитель 7','Страна 7'),(8,'Производитель 8','Страна 8'),(9,'Производитель 9','Страна 9'),(10,'Производитель 10','Страна 10'),(11,'Производитель 11','Страна 11'),(12,'Производитель 12','Страна 12'),(13,'Производитель 13','Страна 13'),(14,'Производитель 14','Страна 14'),(15,'Производитель 15','Страна 15'),(16,'Производитель 16','Страна 16'),(17,'Производитель 17','Страна 17'),(18,'Производитель 18','Страна 18'),(19,'Производитель 19','Страна 19'),(20,'Производитель 20','Страна 20');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_characteristics`
--

LOCK TABLES `product_characteristics` WRITE;
/*!40000 ALTER TABLE `product_characteristics` DISABLE KEYS */;
INSERT INTO `product_characteristics` VALUES (1,1,2,'Значение 1'),(2,2,3,'Значение 2'),(3,3,4,'Значение 3'),(4,4,5,'Значение 4'),(5,5,1,'Значение 5'),(6,6,2,'Значение 6'),(7,7,3,'Значение 7'),(8,8,4,'Значение 8'),(9,9,5,'Значение 9'),(10,10,1,'Значение 10'),(11,11,2,'Значение 11'),(12,12,3,'Значение 12'),(13,13,4,'Значение 13'),(14,14,5,'Значение 14'),(15,15,1,'Значение 15'),(16,16,2,'Значение 16'),(17,17,3,'Значение 17'),(18,18,4,'Значение 18'),(19,19,5,'Значение 19'),(20,20,1,'Значение 20');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,1,'image_1.png',0),(2,2,'image_2.png',0),(3,3,'image_3.png',0),(4,4,'image_4.png',0),(5,5,'image_5.png',0),(6,6,'image_6.png',0),(7,7,'image_7.png',0),(8,8,'image_8.png',0),(9,9,'image_9.png',0),(10,10,'image_10.png',0),(11,11,'image_11.png',0),(12,12,'image_12.png',0),(13,13,'image_13.png',0),(14,14,'image_14.png',0),(15,15,'image_15.png',0),(16,16,'image_16.png',0),(17,17,'image_17.png',0),(18,18,'image_18.png',0),(19,19,'image_19.png',0),(20,20,'image_20.png',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Продукт 1',101.00,'Описание продукта 1',2,2,0.60,'SKU_1',10,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(2,'Продукт 2',102.00,'Описание продукта 2',3,3,0.70,'SKU_2',20,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(3,'Продукт 3',103.00,'Описание продукта 3',4,4,0.80,'SKU_3',30,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(4,'Продукт 4',104.00,'Описание продукта 4',5,5,0.90,'SKU_4',40,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(5,'Продукт 5',105.00,'Описание продукта 5',1,1,1.00,'SKU_5',50,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(6,'Продукт 6',106.00,'Описание продукта 6',2,2,1.10,'SKU_6',60,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(7,'Продукт 7',107.00,'Описание продукта 7',3,3,1.20,'SKU_7',70,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(8,'Продукт 8',108.00,'Описание продукта 8',4,4,1.30,'SKU_8',80,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(9,'Продукт 9',109.00,'Описание продукта 9',5,5,1.40,'SKU_9',90,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(10,'Продукт 10',110.00,'Описание продукта 10',1,1,1.50,'SKU_10',100,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(11,'Продукт 11',111.00,'Описание продукта 11',2,2,1.60,'SKU_11',110,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(12,'Продукт 12',112.00,'Описание продукта 12',3,3,1.70,'SKU_12',120,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(13,'Продукт 13',113.00,'Описание продукта 13',4,4,1.80,'SKU_13',130,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(14,'Продукт 14',114.00,'Описание продукта 14',5,5,1.90,'SKU_14',140,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(15,'Продукт 15',115.00,'Описание продукта 15',1,1,2.00,'SKU_15',150,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(16,'Продукт 16',116.00,'Описание продукта 16',2,2,2.10,'SKU_16',160,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(17,'Продукт 17',117.00,'Описание продукта 17',3,3,2.20,'SKU_17',170,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(18,'Продукт 18',118.00,'Описание продукта 18',4,4,2.30,'SKU_18',180,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(19,'Продукт 19',119.00,'Описание продукта 19',5,5,2.40,'SKU_19',190,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(20,'Продукт 20',120.00,'Описание продукта 20',1,1,2.50,'SKU_20',200,'2024-11-17 16:00:00','2024-11-17 16:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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

-- Dump completed on 2024-11-20  8:39:24
