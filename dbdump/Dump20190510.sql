CREATE DATABASE  IF NOT EXISTS `laraveltodo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `laraveltodo`;
-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: laraveltodo
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `task_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_created_by_foreign` (`created_by`),
  KEY `comments_task_id_foreign` (`task_id`),
  CONSTRAINT `comments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'2019-05-10 10:30:10','2019-05-10 10:30:10','asfsdf',1,12),(2,'2019-05-10 10:33:16','2019-05-10 10:33:16','hello',1,12),(3,'2019-05-10 10:33:34','2019-05-10 10:33:34','aaaa',1,12),(4,'2019-05-10 10:33:52','2019-05-10 10:33:52','fff',1,12);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_05_09_075447_add_roles_to_users_table',1),(4,'2019_05_09_122209_add_api_tokens_to_user_table',1),(11,'2019_05_09_213833_add_tasks',2),(12,'2019_05_10_060356_add_comments',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `is_complete` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `due_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `assigned_user` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_created_by_foreign` (`created_by`),
  KEY `tasks_assigned_user_foreign` (`assigned_user`),
  CONSTRAINT `tasks_assigned_user_foreign` FOREIGN KEY (`assigned_user`) REFERENCES `users` (`id`),
  CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,0,NULL,NULL,NULL,'2019-05-10 08:19:49','2019-05-10 08:19:49',1,1),(2,0,NULL,NULL,NULL,'2019-05-10 08:19:55','2019-05-10 08:19:55',1,1),(3,0,NULL,NULL,NULL,'2019-05-10 08:23:07','2019-05-10 08:23:07',1,1),(4,0,NULL,NULL,NULL,'2019-05-10 08:23:58','2019-05-10 08:23:58',1,1),(5,1,'on',NULL,NULL,'2019-05-10 08:24:39','2019-05-10 08:29:22',1,1),(6,0,NULL,NULL,NULL,'2019-05-10 08:25:05','2019-05-10 08:25:05',1,1),(7,1,'hello world',NULL,NULL,'2019-05-10 08:31:53','2019-05-10 08:32:34',1,1),(8,1,'here I go again asdf',NULL,NULL,'2019-05-10 08:31:58','2019-05-10 10:43:50',1,1),(9,0,NULL,NULL,NULL,'2019-05-10 08:42:36','2019-05-10 08:42:36',1,1),(10,0,NULL,NULL,NULL,'2019-05-10 09:02:16','2019-05-10 09:02:39',1,1),(11,1,'ok here it is',NULL,NULL,'2019-05-10 09:03:10','2019-05-10 09:57:17',1,2),(12,1,'wow pretty cool oh yeah!',NULL,NULL,'2019-05-10 09:08:33','2019-05-10 10:43:51',1,7),(13,0,NULL,NULL,NULL,'2019-05-10 09:23:29','2019-05-10 09:23:29',1,1),(14,0,NULL,NULL,NULL,'2019-05-10 09:52:55','2019-05-10 09:52:55',1,1),(15,0,'hit the check mark to mark it complete!',NULL,NULL,'2019-05-10 10:41:50','2019-05-10 10:41:58',1,1),(16,0,'check out the user management page!',NULL,NULL,'2019-05-10 10:42:01','2019-05-10 10:43:46',1,1),(17,0,'add a task and post a comment',NULL,NULL,'2019-05-10 10:43:54','2019-05-10 10:44:00',1,1),(18,0,'change assigned to and see reports updated via vuex',NULL,NULL,'2019-05-10 10:44:01','2019-05-10 10:44:48',1,8),(19,0,'hit show completed to see all completed tasks',NULL,NULL,'2019-05-10 10:44:15','2019-05-10 10:44:43',1,7),(20,0,NULL,NULL,NULL,'2019-05-10 10:44:31','2019-05-10 10:44:31',1,1);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'student',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Monzer Hijazi','monzer@exequt.com',NULL,'$2y$10$NvihQ.UhQXJxhl0dmZrmvuBqtz7a/rg/cM.22F2QxeniDV8/fv4S6','Qlt9SZH5gOege3sIREKDdq7mHaSwpBIMlIhJMH6q7YWlnwcr8G7vnsdWLFDS',NULL,'2019-05-09 18:58:20','2019-05-10 02:54:05','admin'),(2,'Monzer Hijazi','monzerstudent@exequt.com',NULL,'asdfghjk',NULL,NULL,'2019-05-09 23:25:59','2019-05-10 00:34:50','student'),(5,'Monzer Hijazi','monzeremployee@gmail.com',NULL,'asdf',NULL,NULL,'2019-05-09 23:37:38','2019-05-10 00:34:33','employee'),(7,'Monzer Hijazi','monzergdgdf@exequt.com',NULL,'asdfghjkl',NULL,NULL,'2019-05-09 23:44:44','2019-05-09 23:44:44','student'),(8,'Monzer Hijazi','monzerasfsadfsdf@exequt.com',NULL,'asdfasdfasdfs',NULL,NULL,'2019-05-09 23:52:02','2019-05-09 23:52:02','student');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-10  2:48:55
