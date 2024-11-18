/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
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

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user1','auth_key_1','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_1','user1@example.com',10,1731900924,1731900924,NULL),(2,'user2','auth_key_2','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_2','user2@example.com',10,1731900924,1731900924,NULL),(3,'user3','auth_key_3','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_3','user3@example.com',10,1731900924,1731900924,NULL),(4,'user4','auth_key_4','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_4','user4@example.com',10,1731900924,1731900924,NULL),(5,'user5','auth_key_5','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_5','user5@example.com',10,1731900924,1731900924,NULL),(6,'user6','auth_key_6','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_6','user6@example.com',10,1731900924,1731900924,NULL),(7,'user7','auth_key_7','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_7','user7@example.com',10,1731900924,1731900924,NULL),(8,'user8','auth_key_8','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_8','user8@example.com',10,1731900924,1731900924,NULL),(9,'user9','auth_key_9','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_9','user9@example.com',10,1731900924,1731900924,NULL),(10,'user10','auth_key_10','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_10','user10@example.com',10,1731900924,1731900924,NULL),(11,'user11','auth_key_11','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_11','user11@example.com',10,1731900924,1731900924,NULL),(12,'user12','auth_key_12','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_12','user12@example.com',10,1731900924,1731900924,NULL),(13,'user13','auth_key_13','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_13','user13@example.com',10,1731900924,1731900924,NULL),(14,'user14','auth_key_14','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_14','user14@example.com',10,1731900924,1731900924,NULL),(15,'user15','auth_key_15','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_15','user15@example.com',10,1731900924,1731900924,NULL),(16,'user16','auth_key_16','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_16','user16@example.com',10,1731900924,1731900924,NULL),(17,'user17','auth_key_17','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_17','user17@example.com',10,1731900924,1731900924,NULL),(18,'user18','auth_key_18','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_18','user18@example.com',10,1731900924,1731900924,NULL),(19,'user19','auth_key_19','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_19','user19@example.com',10,1731900924,1731900924,NULL),(20,'user20','auth_key_20','$2y$10$Kb8e5u5QGJNmB7jwvTcMjJxqgb3JYP3.mnpw/mjcqJpJ.y0t/aJW6','reset_token_20','user20@example.com',10,1731900924,1731900924,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

