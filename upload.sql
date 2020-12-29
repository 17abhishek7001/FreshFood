-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: foodbox
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.2

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
-- Table structure for table `addon_products`
--

DROP TABLE IF EXISTS `addon_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addon_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `addon_id` int NOT NULL,
  `product_id` int NOT NULL,
  `price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_products`
--

LOCK TABLES `addon_products` WRITE;
/*!40000 ALTER TABLE `addon_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons`
--

LOCK TABLES `addons` WRITE;
/*!40000 ALTER TABLE `addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_password_resets`
--

DROP TABLE IF EXISTS `admin_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`),
  KEY `admin_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_password_resets`
--

LOCK TABLES `admin_password_resets` WRITE;
/*!40000 ALTER TABLE `admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Admin',NULL,'admin@foodbox.com','+911234565434','$2y$10$O9AkVVwUCBEhXeC8o49W6OO3nIDN5XRKELd/QT2O8cGXW9LcNgZaG',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `card_type` enum('stripe','braintree') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stripe',
  `last_four` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_addons`
--

DROP TABLE IF EXISTS `cart_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_addons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_cart_id` int NOT NULL,
  `addon_product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_addons`
--

LOCK TABLES `cart_addons` WRITE;
/*!40000 ALTER TABLE `cart_addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT '0',
  `shop_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int DEFAULT NULL,
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,0,1,'Appetizer','special',NULL,'enabled',NULL,NULL,NULL),(2,0,1,'Meat and Game Birds','special',NULL,'enabled',NULL,NULL,NULL),(3,0,1,'Dessert','special',NULL,'enabled',NULL,NULL,NULL),(4,0,2,'Burgers','special',NULL,'enabled',NULL,NULL,NULL),(5,0,2,'Sandwitch','special',NULL,'enabled',NULL,NULL,NULL),(6,0,2,'Snacks','special',NULL,'enabled',NULL,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_images`
--

DROP TABLE IF EXISTS `category_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_images`
--

LOCK TABLES `category_images` WRITE;
/*!40000 ALTER TABLE `category_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_product`
--

DROP TABLE IF EXISTS `category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_product` (
  `category_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_product_category_id_foreign` (`category_id`),
  CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_product`
--

LOCK TABLES `category_product` WRITE;
/*!40000 ALTER TABLE `category_product` DISABLE KEYS */;
INSERT INTO `category_product` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6);
/*!40000 ALTER TABLE `category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuisine_shop`
--

DROP TABLE IF EXISTS `cuisine_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisine_shop` (
  `cuisine_id` int unsigned NOT NULL,
  `shop_id` int unsigned NOT NULL,
  PRIMARY KEY (`shop_id`,`cuisine_id`),
  KEY `cuisine_shop_cuisine_id_foreign` (`cuisine_id`),
  CONSTRAINT `cuisine_shop_cuisine_id_foreign` FOREIGN KEY (`cuisine_id`) REFERENCES `cuisines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cuisine_shop_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisine_shop`
--

LOCK TABLES `cuisine_shop` WRITE;
/*!40000 ALTER TABLE `cuisine_shop` DISABLE KEYS */;
INSERT INTO `cuisine_shop` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `cuisine_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuisines`
--

DROP TABLE IF EXISTS `cuisines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisines` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisines`
--

LOCK TABLES `cuisines` WRITE;
/*!40000 ALTER TABLE `cuisines` DISABLE KEYS */;
INSERT INTO `cuisines` VALUES (1,'INDIAN',NULL,NULL,NULL),(2,'SOUTH INDIAN',NULL,NULL,NULL),(3,'BENGOLI',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cuisines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_pushes`
--

DROP TABLE IF EXISTS `custom_pushes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_pushes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `send_to` enum('ALL','USERS','PROVIDERS') COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition` enum('ACTIVE','LOCATION','RIDES','AMOUNT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition_data` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_to` int NOT NULL DEFAULT '0',
  `schedule_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pushes`
--

LOCK TABLES `custom_pushes` WRITE;
/*!40000 ALTER TABLE `custom_pushes` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_pushes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('DRIVER','VEHICLE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquiry_transporters`
--

DROP TABLE IF EXISTS `enquiry_transporters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enquiry_transporters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquiry_transporters`
--

LOCK TABLES `enquiry_transporters` WRITE;
/*!40000 ALTER TABLE `enquiry_transporters` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquiry_transporters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2015_08_25_172600_create_settings_table',1),(4,'2016_06_01_000001_create_oauth_auth_codes_table',1),(5,'2016_06_01_000002_create_oauth_access_tokens_table',1),(6,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(7,'2016_06_01_000004_create_oauth_clients_table',1),(8,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(9,'2017_01_11_181312_create_cards_table',1),(10,'2017_01_11_182717_create_request_filters_table',1),(11,'2017_06_08_123940_create_admins_table',1),(12,'2017_06_08_123941_create_admin_password_resets_table',1),(13,'2017_06_09_044823_create_shops_table',1),(14,'2017_06_09_044824_create_shop_password_resets_table',1),(15,'2017_06_09_045212_create_transporters_table',1),(16,'2017_06_09_045213_create_transporter_password_resets_table',1),(17,'2017_06_09_102917_create_products_table',1),(18,'2017_06_09_105225_create_categories_table',1),(19,'2017_06_12_064740_create_user_addresses_table',1),(20,'2017_06_12_101042_create_orders_table',1),(21,'2017_06_12_101114_create_order_invoices_table',1),(22,'2017_06_12_101147_create_order_ratings_table',1),(23,'2017_06_12_101212_create_order_disputes_table',1),(24,'2017_06_12_101446_create_surge_pricings_table',1),(25,'2017_06_12_113225_create_notifications_table',1),(26,'2017_06_13_124334_create_zones_table',1),(27,'2017_06_13_125525_create_transporter_documents_table',1),(28,'2017_06_13_130530_create_category_images_table',1),(29,'2017_06_15_115211_create_product_images_table',1),(30,'2017_06_15_115323_create_product_prices_table',1),(31,'2017_06_16_112721_create_user_carts_table',1),(32,'2017_06_23_124807_create_oauth_access_token_guards',1),(33,'2017_08_03_194354_create_custom_pushes_table',1),(34,'2017_09_19_053529_create_cuisines_table',1),(35,'2017_09_19_053543_create_documents_table',1),(36,'2017_09_19_053556_create_order_dispute_comments_table',1),(37,'2017_09_19_053608_create_promocode_usages_table',1),(38,'2017_09_19_053619_create_transporter_vehicles_table',1),(39,'2017_09_19_053635_create_transporter_shifts_table',1),(40,'2017_09_19_053648_create_transporter_shift_timings_table',1),(41,'2017_09_19_053659_create_wallet_passbooks_table',1),(42,'2017_09_19_110911_create_shop_timings_table',1),(43,'2017_09_25_125459_create_transporter_locations_table',1),(44,'2017_10_04_130254_create_order_timings_table',1),(45,'2017_10_07_103112_create_favorites_table',1),(46,'2017_10_12_122111_create_shop_banners_table',1),(47,'2017_10_13_062225_create_notice_boards_table',1),(48,'2017_10_20_070027_create_order_dispute_helps_table',1),(49,'2017_10_21_063643_create_permission_tables',1),(50,'2017_11_06_111106_create_addons_table',1),(51,'2017_11_08_121819_create_cart_addons_table',1),(52,'2017_11_08_133602_create_enquiry_transporters_table',1),(53,'2017_11_09_062754_create_addon_products_table',1),(54,'2017_11_27_142447_create_restuarants_table',1),(55,'2017_11_28_063349_create_newsletters_table',1),(56,'2017_12_05_043339_add_delivery_date_to_orders',2),(57,'2017_12_06_091412_add_schedule_status_to_orders',2),(58,'2018_02_01_105814_create_favourites_table',2),(59,'2018_04_26_125520_create_email_template_table',2),(60,'2018_05_07_111346_create_promocodes_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` int unsigned NOT NULL,
  `model_id` int unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` int unsigned NOT NULL,
  `model_id` int unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,1,'App\\Admin');
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_boards`
--

DROP TABLE IF EXISTS `notice_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_boards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transporter_id` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notice` text COLLATE utf8mb4_unicode_ci,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_boards`
--

LOCK TABLES `notice_boards` WRITE;
/*!40000 ALTER TABLE `notice_boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice_boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `transporter_id` int NOT NULL DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_token_providers`
--

DROP TABLE IF EXISTS `oauth_access_token_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_token_providers` (
  `oauth_access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`oauth_access_token_id`),
  CONSTRAINT `oauth_access_token_providers_oauth_access_token_id_foreign` FOREIGN KEY (`oauth_access_token_id`) REFERENCES `oauth_access_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_token_providers`
--

LOCK TABLES `oauth_access_token_providers` WRITE;
/*!40000 ALTER TABLE `oauth_access_token_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_token_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `client_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `client_id` int NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_dispute_comments`
--

DROP TABLE IF EXISTS `order_dispute_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_dispute_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int NOT NULL,
  `order_dispute_id` int NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_dispute_comments`
--

LOCK TABLES `order_dispute_comments` WRITE;
/*!40000 ALTER TABLE `order_dispute_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_dispute_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_dispute_helps`
--

DROP TABLE IF EXISTS `order_dispute_helps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_dispute_helps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('CANCELLED','COMPLAINED','REFUND','REASSIGN') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_dispute_helps`
--

LOCK TABLES `order_dispute_helps` WRITE;
/*!40000 ALTER TABLE `order_dispute_helps` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_dispute_helps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_disputes`
--

DROP TABLE IF EXISTS `order_disputes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_disputes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `order_disputehelp_id` int NOT NULL DEFAULT '0',
  `user_id` int DEFAULT NULL,
  `transporter_id` int DEFAULT NULL,
  `shop_id` int DEFAULT NULL,
  `type` enum('CANCELLED','COMPLAINED','REFUND','REASSIGN') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` enum('user','shop','transporter') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_to` enum('user','shop','transporter','dispatcher') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('CREATED','RESOLVED') COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_disputes`
--

LOCK TABLES `order_disputes` WRITE;
/*!40000 ALTER TABLE `order_disputes` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_disputes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_invoices`
--

DROP TABLE IF EXISTS `order_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_invoices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `quantity` int NOT NULL,
  `paid` int NOT NULL DEFAULT '0',
  `gross` double(10,2) NOT NULL DEFAULT '0.00',
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `delivery_charge` double(10,2) NOT NULL DEFAULT '0.00',
  `wallet_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `payable` int NOT NULL DEFAULT '0',
  `tax` double(10,2) NOT NULL DEFAULT '0.00',
  `net` int NOT NULL DEFAULT '0',
  `total_pay` double NOT NULL DEFAULT '0',
  `tender_pay` double NOT NULL DEFAULT '0',
  `ripple_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_mode` enum('cash','stripe','paypal','braintree','wallet','ripple','eather','bitcoin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `DestinationTag` text COLLATE utf8mb4_unicode_ci,
  `payment_id` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','processing','failed','success') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_invoices`
--

LOCK TABLES `order_invoices` WRITE;
/*!40000 ALTER TABLE `order_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_ratings`
--

DROP TABLE IF EXISTS `order_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_ratings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `user_rating` int DEFAULT NULL,
  `user_comment` text COLLATE utf8mb4_unicode_ci,
  `transporter_id` int DEFAULT NULL,
  `transporter_rating` int DEFAULT NULL,
  `transporter_comment` text COLLATE utf8mb4_unicode_ci,
  `shop_id` int DEFAULT NULL,
  `shop_rating` int DEFAULT NULL,
  `shop_comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_ratings`
--

LOCK TABLES `order_ratings` WRITE;
/*!40000 ALTER TABLE `order_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_timings`
--

DROP TABLE IF EXISTS `order_timings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_timings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `status` enum('ORDERED','RECEIVED','CANCELLED','ASSIGNED','PROCESSING','REACHED','PICKEDUP','ARRIVED','COMPLETED','SEARCHING') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_timings`
--

LOCK TABLES `order_timings` WRITE;
/*!40000 ALTER TABLE `order_timings` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_timings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `shift_id` int DEFAULT NULL,
  `user_address_id` int NOT NULL,
  `shop_id` int DEFAULT NULL,
  `transporter_id` int DEFAULT NULL,
  `transporter_vehicle_id` int DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `route_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispute` enum('CREATED','RESOLVE','NODISPUTE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NODISPUTE',
  `delivery_date` datetime NOT NULL,
  `order_otp` int NOT NULL,
  `order_ready_time` int NOT NULL DEFAULT '0',
  `order_ready_status` int NOT NULL DEFAULT '0',
  `status` enum('ORDERED','RECEIVED','CANCELLED','ASSIGNED','PROCESSING','SEARCHING','REACHED','PICKEDUP','ARRIVED','COMPLETED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ORDERED',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `schedule_status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_prices`
--

DROP TABLE IF EXISTS `product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `price` int unsigned NOT NULL,
  `orignal_price` double(10,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int unsigned NOT NULL DEFAULT '0',
  `discount_type` enum('percentage','amount') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_prices`
--

LOCK TABLES `product_prices` WRITE;
/*!40000 ALTER TABLE `product_prices` DISABLE KEYS */;
INSERT INTO `product_prices` VALUES (1,1,100,0.00,NULL,0,'percentage',NULL,NULL,NULL),(2,2,100,0.00,NULL,0,'percentage',NULL,NULL,NULL),(3,3,100,0.00,NULL,0,'percentage',NULL,NULL,NULL),(4,4,100,0.00,NULL,0,'percentage',NULL,NULL,NULL),(5,5,100,0.00,NULL,0,'percentage',NULL,NULL,NULL),(6,6,100,0.00,NULL,0,'percentage',NULL,NULL,NULL);
/*!40000 ALTER TABLE `product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT '0',
  `shop_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int DEFAULT NULL,
  `food_type` enum('veg','non-veg') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'veg',
  `avalability` tinyint(1) NOT NULL DEFAULT '0',
  `max_quantity` int NOT NULL DEFAULT '10',
  `featured` int NOT NULL DEFAULT '0',
  `addon_status` int NOT NULL DEFAULT '0',
  `out_of_stock` enum('YES','NO') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NO',
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,0,1,'Crispy farm egg gribs','special',NULL,'veg',0,10,0,0,'NO','enabled',NULL,NULL,NULL),(2,0,1,'Coconut thai curry with shirump','special',NULL,'veg',0,10,0,0,'NO','enabled',NULL,NULL,NULL),(3,0,1,'Baked choclate shuffle','special',NULL,'veg',0,10,0,0,'NO','enabled',NULL,NULL,NULL),(4,0,2,'Big mac','special',NULL,'veg',0,10,0,0,'NO','enabled',NULL,NULL,NULL),(5,0,2,'Chicken Sandwitch','special',NULL,'veg',0,10,0,0,'NO','enabled',NULL,NULL,NULL),(6,0,2,'Apple slice','special',NULL,'veg',0,10,0,0,'NO','enabled',NULL,NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocode_usages`
--

DROP TABLE IF EXISTS `promocode_usages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocode_usages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `promocode_id` int NOT NULL,
  `status` enum('ADDED','USED','EXPIRED') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocode_usages`
--

LOCK TABLES `promocode_usages` WRITE;
/*!40000 ALTER TABLE `promocode_usages` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocode_usages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocodes`
--

DROP TABLE IF EXISTS `promocodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocodes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `promo_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promocode_type` enum('amount','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `coupon_limit` double(10,2) NOT NULL DEFAULT '0.00',
  `coupon_user_limit` double(10,2) NOT NULL DEFAULT '0.00',
  `avail_from` datetime NOT NULL,
  `expiration` datetime NOT NULL,
  `status` enum('ADDED','EXPIRED') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocodes`
--

LOCK TABLES `promocodes` WRITE;
/*!40000 ALTER TABLE `promocodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_filters`
--

DROP TABLE IF EXISTS `request_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_filters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `request_id` int NOT NULL,
  `provider_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_filters`
--

LOCK TABLES `request_filters` WRITE;
/*!40000 ALTER TABLE `request_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restuarants`
--

DROP TABLE IF EXISTS `restuarants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restuarants` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hours_opening` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hours_closing` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `restuarants_email_unique` (`email`),
  UNIQUE KEY `restuarants_phone_unique` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restuarants`
--

LOCK TABLES `restuarants` WRITE;
/*!40000 ALTER TABLE `restuarants` DISABLE KEYS */;
/*!40000 ALTER TABLE `restuarants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','admin',NULL,NULL),(2,'Dispute Manager','admin',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site_title','foodbox'),(2,'site_logo','http://localhost/logo-black.png'),(3,'site_favicon','http://localhost/logo-black.png'),(4,'site_copyright','&copy; 2020 FoodBox'),(5,'delivery_charge','20'),(6,'resturant_response_time','5'),(7,'currency','$'),(8,'currency_code','USD'),(9,'search_distance','10'),(10,'tax','10'),(11,'payment_mode','CASH'),(12,'manual_assign','0'),(13,'transporter_response_time','30'),(14,'GOOGLE_MAP_KEY','AIzaSyBDkKetQwosod2SZ7ZGCpxuJdxY3kxo5Po'),(15,'TWILIO_SID',''),(16,'TWILIO_TOKEN',''),(17,'TWILIO_FROM',''),(18,'PUBNUB_PUB_KEY',''),(19,'PUBNUB_SUB_KEY',''),(20,'stripe_charge','0'),(21,'stripe_publishable_key','pk_test_39kly6aEfUEfvMpRnN6BnxLb'),(22,'stripe_secret_key','sk_test_I1OGCnG8zVIXCC7sSImIJsOy'),(23,'FB_CLIENT_ID','290984818086469'),(24,'FB_CLIENT_SECRET','1f52cb4378e623bb819cd8469e408482'),(25,'FB_REDIRECT','http://localhost'),(26,'GOOGLE_CLIENT_ID','299256700052-rts0nr0a49dutr831oin38aj7mjju2ua.apps.googleusercontent.com'),(27,'GOOGLE_CLIENT_SECRET','FL0YR5dw9RuV6OdI8IkkI9oS'),(28,'GOOGLE_REDIRECT','http://localhost'),(29,'GOOGLE_API_KEY','AIzaSyAKGFZT_5uhpOOkma-GBOPamDw_mRIB-p8'),(30,'ANDROID_ENV','development'),(31,'ANDROID_PUSH_KEY','AIzaSyBzvWOtvpuNXBKp6vxBBRMizNJj_1wIQVg'),(32,'IOS_USER_ENV','development'),(33,'IOS_PROVIDER_ENV','development'),(34,'DEMO_MODE','1'),(35,'SUB_CATEGORY','0'),(36,'SCHEDULE_ORDER','0'),(37,'client_id','2'),(38,'client_secret','0'),(39,'PRODUCT_ADDONS','0'),(40,'BRAINTREE_ENV','sandbox'),(41,'BRAINTREE_MERCHANT_ID','twbd779hfc859jxq'),(42,'BRAINTREE_PUBLIC_KEY','7bn6hystx7vs2g8r'),(43,'BRAINTREE_PRIVATE_KEY','721e48cc74fdf2dfaacc6c3410de2f27'),(44,'RIPPLE_KEY','rEsaDShsYPmMZopoG3nNjutWJCk1Zn9cbX'),(45,'RIPPLE_BARCODE','http://localhost/images/ripple.png'),(46,'ETHER_ADMIN_KEY','0x16abb22fd68c25286d72e77226ddaad87323cbb1'),(47,'ETHER_KEY','R92FW87ER1QZIDYX1UHTVBY625T8HCPKNR'),(48,'ETHER_BARCODE','http://localhost/images/ether.jpeg'),(49,'CLIENT_AUTHORIZATION','sandbox_v5r97hvk_twbd779hfc859jxq'),(50,'SOCIAL_FACEBOOK_LINK','http://facebook.com'),(51,'SOCIAL_TWITTER_LINK','http://twitter.com'),(52,'SOCIAL_G-PLUS_LINK','http://google.com'),(53,'SOCIAL_INSTAGRAM_LINK','http://instagram.com'),(54,'SOCIAL_PINTEREST_LINK','http://pinterest.com'),(55,'SOCIAL_VIMEO_LINK','http://vimeo.com'),(56,'SOCIAL_YOUTUBE_LINK','http://youtube.com'),(57,'COMMISION_OVER_FOOD','5'),(58,'COMMISION_OVER_DELIVERY_FEE','10'),(59,'APP_STORE_LINK','https://itunes.apple.com/us/app/foodbox-express-food-delivery/id1296870125?mt=8'),(60,'GOOGLE_PLAY_LINK','https://play.google.com/store/apps/details?id=com.foodbox.app&hl=en');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_banners`
--

DROP TABLE IF EXISTS `shop_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_banners` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int NOT NULL,
  `product_id` int NOT NULL DEFAULT '0',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL DEFAULT '0',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_banners`
--

LOCK TABLES `shop_banners` WRITE;
/*!40000 ALTER TABLE `shop_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_password_resets`
--

DROP TABLE IF EXISTS `shop_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `shop_password_resets_email_index` (`email`),
  KEY `shop_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_password_resets`
--

LOCK TABLES `shop_password_resets` WRITE;
/*!40000 ALTER TABLE `shop_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_timings`
--

DROP TABLE IF EXISTS `shop_timings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_timings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int NOT NULL,
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` enum('ALL','SUN','MON','TUE','WED','THU','FRI','SAT') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ALL',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_timings`
--

LOCK TABLES `shop_timings` WRITE;
/*!40000 ALTER TABLE `shop_timings` DISABLE KEYS */;
INSERT INTO `shop_timings` VALUES (1,1,'08:00','20:00','ALL',NULL,NULL),(2,2,'08:00','20:00','ALL',NULL,NULL);
/*!40000 ALTER TABLE `shop_timings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_min_amount` double(20,2) DEFAULT '0.00',
  `offer_percent` int DEFAULT '0',
  `estimated_delivery_time` int DEFAULT NULL,
  `otp` int DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maps_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double(15,8) NOT NULL,
  `longitude` double(15,8) NOT NULL,
  `pure_veg` tinyint(1) DEFAULT '0',
  `popular` tinyint(1) DEFAULT '0',
  `rating` int DEFAULT '0',
  `rating_status` int NOT NULL DEFAULT '0',
  `status` enum('onboarding','banned','active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'onboarding',
  `device_type` enum('ios','android') COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_token` text COLLATE utf8mb4_unicode_ci,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shops_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,'Gary danko','demo@foodbox.com','$2y$10$D7jUd0ikvvus/2cP3w1dLeb46X56/DKhZBpzljpPYgItEepxfn9sO','8765654345',NULL,NULL,'good resturant',0.00,0,30,NULL,'Triplicane, Chennai, Tamil Nadu, India','Triplicane, Chennai, Tamil Nadu, India',13.05871070,80.27570630,0,0,0,0,'onboarding','ios',NULL,NULL,NULL,NULL,NULL,NULL),(2,'Mcdonald','demo2@foodbox.com','$2y$10$llnpd14FuAnJqa2sKJFD1e39YKT4HfVOdVmbIF4PERUfODEH98WUO','8768884345',NULL,NULL,'good resturant',0.00,0,30,NULL,'Triplicane, Chennai, Tamil Nadu, India','Triplicane, Chennai, Tamil Nadu, India',13.05871070,80.27570630,0,0,0,0,'onboarding','ios',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surge_pricings`
--

DROP TABLE IF EXISTS `surge_pricings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surge_pricings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surge_pricings`
--

LOCK TABLES `surge_pricings` WRITE;
/*!40000 ALTER TABLE `surge_pricings` DISABLE KEYS */;
/*!40000 ALTER TABLE `surge_pricings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporter_documents`
--

DROP TABLE IF EXISTS `transporter_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporter_documents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transporter_id` int NOT NULL,
  `document_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ASSESSING','ACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporter_documents`
--

LOCK TABLES `transporter_documents` WRITE;
/*!40000 ALTER TABLE `transporter_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `transporter_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporter_locations`
--

DROP TABLE IF EXISTS `transporter_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporter_locations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transporter_id` int NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double(15,8) NOT NULL,
  `longitude` double(15,8) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporter_locations`
--

LOCK TABLES `transporter_locations` WRITE;
/*!40000 ALTER TABLE `transporter_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `transporter_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporter_password_resets`
--

DROP TABLE IF EXISTS `transporter_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporter_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `transporter_password_resets_email_index` (`email`),
  KEY `transporter_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporter_password_resets`
--

LOCK TABLES `transporter_password_resets` WRITE;
/*!40000 ALTER TABLE `transporter_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `transporter_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporter_shift_timings`
--

DROP TABLE IF EXISTS `transporter_shift_timings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporter_shift_timings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transporter_shift_id` int NOT NULL,
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporter_shift_timings`
--

LOCK TABLES `transporter_shift_timings` WRITE;
/*!40000 ALTER TABLE `transporter_shift_timings` DISABLE KEYS */;
/*!40000 ALTER TABLE `transporter_shift_timings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporter_shifts`
--

DROP TABLE IF EXISTS `transporter_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporter_shifts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transporter_id` int NOT NULL,
  `transporter_vehicle_id` int NOT NULL,
  `total_order` int NOT NULL DEFAULT '0',
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporter_shifts`
--

LOCK TABLES `transporter_shifts` WRITE;
/*!40000 ALTER TABLE `transporter_shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `transporter_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporter_vehicles`
--

DROP TABLE IF EXISTS `transporter_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporter_vehicles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transporter_id` int NOT NULL,
  `vehicle_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporter_vehicles`
--

LOCK TABLES `transporter_vehicles` WRITE;
/*!40000 ALTER TABLE `transporter_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `transporter_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporters`
--

DROP TABLE IF EXISTS `transporters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `latitude` double(15,8) NOT NULL DEFAULT '0.00000000',
  `longitude` double(15,8) NOT NULL DEFAULT '0.00000000',
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `rating` int NOT NULL DEFAULT '5',
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` enum('android','ios') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('assessing','banned','online','offline','riding','unsettled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assessing',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transporters_email_unique` (`email`),
  UNIQUE KEY `transporters_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporters`
--

LOCK TABLES `transporters` WRITE;
/*!40000 ALTER TABLE `transporters` DISABLE KEYS */;
INSERT INTO `transporters` VALUES (1,'Demo User','demo@foodbox.com','+919898765654','$2y$10$WlRbh2VQxBU1BSb9HtG.l.5rx6zusmJc0OUPjHpopeR/G9FcyZil6',NULL,NULL,0.00000000,0.00000000,'0',5,NULL,NULL,NULL,'assessing',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `transporters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_addresses`
--

DROP TABLE IF EXISTS `user_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `building` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double(15,8) NOT NULL,
  `longitude` double(15,8) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_addresses`
--

LOCK TABLES `user_addresses` WRITE;
/*!40000 ALTER TABLE `user_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_carts`
--

DROP TABLE IF EXISTS `user_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_carts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `promocode_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `savedforlater` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_carts`
--

LOCK TABLES `user_carts` WRITE;
/*!40000 ALTER TABLE `user_carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` enum('android','ios') COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_by` enum('manual','facebook','google') COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_cust_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_balance` double(8,2) NOT NULL DEFAULT '0.00',
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `braintree_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Demo User','demo@foodbox.com','+915454545454',NULL,'$2y$10$HSkhuWUdIFxRG1.l3gXlPe9pwY23SZitE.DHcKOsD2RiBduLVRonG',NULL,NULL,'ios','manual',NULL,NULL,0.00,'0',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_passbooks`
--

DROP TABLE IF EXISTS `wallet_passbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_passbooks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('CREDITED','DEBITED') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_passbooks`
--

LOCK TABLES `wallet_passbooks` WRITE;
/*!40000 ALTER TABLE `wallet_passbooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_passbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zones` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `north_east_lat` double(15,8) NOT NULL,
  `north_east_lng` double(15,8) NOT NULL,
  `south_west_lat` double(15,8) NOT NULL,
  `south_west_lng` double(15,8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-07 11:16:04
