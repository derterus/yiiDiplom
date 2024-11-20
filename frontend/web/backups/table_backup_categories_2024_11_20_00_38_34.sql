/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
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

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Категория 1','Описание категории 1'),(2,'Категория 2','Описание категории 2'),(3,'Категория 3','Описание категории 3'),(4,'Категория 4','Описание категории 4'),(5,'Категория 5','Описание категории 5'),(6,'Категория 6','Описание категории 6'),(7,'Категория 7','Описание категории 7'),(8,'Категория 8','Описание категории 8'),(9,'Категория 9','Описание категории 9'),(10,'Категория 10','Описание категории 10'),(11,'Категория 11','Описание категории 11'),(12,'Категория 12','Описание категории 12'),(13,'Категория 13','Описание категории 13'),(14,'Категория 14','Описание категории 14'),(15,'Категория 15','Описание категории 15'),(16,'Категория 16','Описание категории 16'),(17,'Категория 17','Описание категории 17'),(18,'Категория 18','Описание категории 18'),(19,'Категория 19','Описание категории 19'),(20,'Категория 20','Описание категории 20');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

