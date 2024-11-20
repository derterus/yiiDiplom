/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
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
  KEY `products_fk5` (`category_id`),
  KEY `products_fk6` (`manufacturer_id`),
  CONSTRAINT `fk-products-category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk-products-manufacturer` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_fk5` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_fk6` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Продукт 1',101.00,'Описание продукта 1',2,2,0.60,'SKU_1',10,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(2,'Продукт 2',102.00,'Описание продукта 2',3,3,0.70,'SKU_2',20,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(3,'Продукт 3',103.00,'Описание продукта 3',4,4,0.80,'SKU_3',30,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(4,'Продукт 4',104.00,'Описание продукта 4',5,5,0.90,'SKU_4',40,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(5,'Продукт 5',105.00,'Описание продукта 5',1,1,1.00,'SKU_5',50,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(6,'Продукт 6',106.00,'Описание продукта 6',2,2,1.10,'SKU_6',60,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(7,'Продукт 7',107.00,'Описание продукта 7',3,3,1.20,'SKU_7',70,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(8,'Продукт 8',108.00,'Описание продукта 8',4,4,1.30,'SKU_8',80,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(9,'Продукт 9',109.00,'Описание продукта 9',5,5,1.40,'SKU_9',90,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(10,'Продукт 10',110.00,'Описание продукта 10',1,1,1.50,'SKU_10',100,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(11,'Продукт 11',111.00,'Описание продукта 11',2,2,1.60,'SKU_11',110,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(12,'Продукт 12',112.00,'Описание продукта 12',3,3,1.70,'SKU_12',120,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(13,'Продукт 13',113.00,'Описание продукта 13',4,4,1.80,'SKU_13',130,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(14,'Продукт 14',114.00,'Описание продукта 14',5,5,1.90,'SKU_14',140,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(15,'Продукт 15',115.00,'Описание продукта 15',1,1,2.00,'SKU_15',150,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(16,'Продукт 16',116.00,'Описание продукта 16',2,2,2.10,'SKU_16',160,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(17,'Продукт 17',117.00,'Описание продукта 17',3,3,2.20,'SKU_17',170,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(18,'Продукт 18',118.00,'Описание продукта 18',4,4,2.30,'SKU_18',180,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(19,'Продукт 19',119.00,'Описание продукта 19',5,5,2.40,'SKU_19',190,'2024-11-17 16:00:00','2024-11-17 16:00:00'),(20,'Продукт 20',120.00,'Описание продукта 20',1,1,2.50,'SKU_20',200,'2024-11-17 16:00:00','2024-11-17 16:00:00');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

