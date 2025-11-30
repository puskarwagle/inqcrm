-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: inqcrm
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.22.04.2

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `additional` json DEFAULT NULL,
  `schedule_from` datetime DEFAULT NULL,
  `schedule_to` datetime DEFAULT NULL,
  `is_done` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'Created','system',NULL,NULL,NULL,NULL,1,2,'2025-11-15 04:49:06','2025-11-15 04:49:06',NULL),(2,'Updated Job Title','system',NULL,'{\"new\": {\"label\": \"Manager\", \"value\": \"Manager\"}, \"old\": {\"label\": null, \"value\": null}, \"attribute\": \"Job Title\"}',NULL,NULL,1,2,'2025-11-15 04:49:06','2025-11-15 04:49:06',NULL),(3,'Created','system',NULL,NULL,NULL,NULL,1,0,'2025-11-15 04:50:53','2025-11-15 04:50:53',NULL),(4,'Created','system',NULL,NULL,NULL,NULL,1,0,'2025-11-15 04:50:53','2025-11-15 04:50:53',NULL),(5,'Created','system',NULL,NULL,NULL,NULL,1,0,'2025-11-15 04:50:53','2025-11-15 04:50:53',NULL),(6,'Created','system',NULL,NULL,NULL,NULL,1,0,'2025-11-15 04:50:53','2025-11-15 04:50:53',NULL),(7,'Created','system',NULL,NULL,NULL,NULL,1,0,'2025-11-15 04:50:53','2025-11-15 04:50:53',NULL),(8,'Created','system',NULL,NULL,NULL,NULL,1,0,'2025-11-15 05:02:11','2025-11-15 05:02:11',NULL),(9,'Created','system',NULL,NULL,NULL,NULL,1,0,'2025-11-15 05:02:11','2025-11-15 05:02:11',NULL),(10,'Created','system',NULL,NULL,NULL,NULL,1,0,'2025-11-15 05:02:11','2025-11-15 05:02:11',NULL),(11,'Created','system',NULL,NULL,NULL,NULL,1,0,'2025-11-15 05:02:11','2025-11-15 05:02:11',NULL),(12,'Created','system',NULL,NULL,NULL,NULL,1,0,'2025-11-15 05:02:11','2025-11-15 05:02:11',NULL),(13,'Created','system',NULL,NULL,NULL,NULL,1,0,'2025-11-15 05:02:37','2025-11-15 05:02:37',NULL),(14,'Created','system',NULL,NULL,NULL,NULL,1,0,'2025-11-15 05:02:37','2025-11-15 05:02:37',NULL),(15,'Created','system',NULL,NULL,NULL,NULL,1,0,'2025-11-15 05:02:37','2025-11-15 05:02:37',NULL),(16,'Created','system',NULL,NULL,NULL,NULL,1,0,'2025-11-15 05:02:37','2025-11-15 05:02:37',NULL),(17,'Created','system',NULL,NULL,NULL,NULL,1,0,'2025-11-15 05:02:37','2025-11-15 05:02:37',NULL);
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_files`
--

DROP TABLE IF EXISTS `activity_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_files_activity_id_foreign` (`activity_id`),
  CONSTRAINT `activity_files_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_files`
--

LOCK TABLES `activity_files` WRITE;
/*!40000 ALTER TABLE `activity_files` DISABLE KEYS */;
INSERT INTO `activity_files` VALUES (1,'activity_file_1.txt','activity_files/file_1.txt',3,'2025-11-15 05:05:21','2025-11-15 05:05:21'),(2,'activity_file_2.txt','activity_files/file_2.txt',4,'2025-11-15 05:05:21','2025-11-15 05:05:21'),(3,'activity_file_3.txt','activity_files/file_3.txt',5,'2025-11-15 05:05:21','2025-11-15 05:05:21'),(4,'activity_file_4.txt','activity_files/file_4.txt',6,'2025-11-15 05:05:21','2025-11-15 05:05:21'),(5,'activity_file_5.txt','activity_files/file_5.txt',7,'2025-11-15 05:05:21','2025-11-15 05:05:21');
/*!40000 ALTER TABLE `activity_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_participants`
--

DROP TABLE IF EXISTS `activity_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_participants` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `person_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_participants_activity_id_foreign` (`activity_id`),
  KEY `activity_participants_user_id_foreign` (`user_id`),
  KEY `activity_participants_person_id_foreign` (`person_id`),
  CONSTRAINT `activity_participants_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `activity_participants_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `activity_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_participants`
--

LOCK TABLES `activity_participants` WRITE;
/*!40000 ALTER TABLE `activity_participants` DISABLE KEYS */;
INSERT INTO `activity_participants` VALUES (1,3,1,1),(2,4,1,1),(3,5,1,1),(4,6,1,1),(5,7,1,1);
/*!40000 ALTER TABLE `activity_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_options`
--

DROP TABLE IF EXISTS `attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `attribute_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_options`
--

LOCK TABLES `attribute_options` WRITE;
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
INSERT INTO `attribute_options` VALUES (1,'Option 1',1,13),(2,'Option 2',2,11),(3,'Option 3',3,10),(4,'Option 4',4,12),(5,'Option 5',5,9);
/*!40000 ALTER TABLE `attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_values`
--

DROP TABLE IF EXISTS `attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_values` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'leads',
  `text_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int DEFAULT NULL,
  `float_value` double DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` json DEFAULT NULL,
  `entity_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  `unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entity_type_attribute_value_index_unique` (`entity_type`,`entity_id`,`attribute_id`),
  UNIQUE KEY `attribute_values_unique_id_unique` (`unique_id`),
  KEY `attribute_values_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_values`
--

LOCK TABLES `attribute_values` WRITE;
/*!40000 ALTER TABLE `attribute_values` DISABLE KEYS */;
INSERT INTO `attribute_values` VALUES (1,'organizations',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,14,'1|14'),(2,'persons','Manager',NULL,NULL,NULL,NULL,NULL,NULL,1,15,'1|15'),(3,'persons',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,16,'1|16');
/*!40000 ALTER TABLE `attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lookup_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  `validation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `quick_add` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_code_entity_type_unique` (`code`,`entity_type`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (7,'expected_close_date','Expected Close Date','date',NULL,'leads',8,NULL,0,0,1,0,'2025-11-15 03:46:22','2025-11-15 03:46:22'),(8,'name','Name','text',NULL,'warehouses',1,NULL,1,0,1,0,'2025-11-15 03:52:08','2025-11-15 03:52:08'),(9,'description','Description','textarea',NULL,'warehouses',2,NULL,0,0,1,0,'2025-11-15 03:52:08','2025-11-15 03:52:08'),(10,'contact_name','Contact Name','text',NULL,'warehouses',3,NULL,1,0,1,0,'2025-11-15 03:52:08','2025-11-15 03:52:08'),(11,'contact_emails','Contact Emails','email',NULL,'warehouses',4,NULL,1,1,1,0,'2025-11-15 03:52:08','2025-11-15 03:52:08'),(12,'contact_numbers','Contact Numbers','phone',NULL,'warehouses',5,'numeric',0,1,1,0,'2025-11-15 03:52:08','2025-11-15 03:52:08'),(13,'contact_address','Contact Address','address',NULL,'warehouses',6,NULL,1,0,1,0,'2025-11-15 03:52:08','2025-11-15 03:52:08'),(14,'user_id','Sales Owner','lookup','users','organizations',5,NULL,0,0,1,0,'2025-11-15 03:54:37','2025-11-15 03:54:37'),(15,'job_title','Job Title','text',NULL,'persons',4,NULL,0,0,1,0,'2025-11-15 03:54:37','2025-11-15 03:54:37'),(16,'user_id','Sales Owner','lookup','users','persons',5,NULL,0,0,1,0,'2025-11-15 03:54:37','2025-11-15 03:54:37'),(17,'lead_pipeline_id','Pipeline','lookup','lead_pipelines','leads',9,NULL,1,0,1,0,'2025-11-15 04:04:01','2025-11-15 04:04:01'),(18,'lead_pipeline_stage_id','Stage','lookup','lead_pipeline_stages','leads',10,NULL,1,0,1,0,'2025-11-15 04:04:01','2025-11-15 04:04:01');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config`
--

DROP TABLE IF EXISTS `core_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config`
--

LOCK TABLES `core_config` WRITE;
/*!40000 ALTER TABLE `core_config` DISABLE KEYS */;
INSERT INTO `core_config` VALUES (1,'config_code_1','config_value_1','2025-11-15 05:02:05','2025-11-15 05:02:05'),(2,'config_code_2','config_value_2','2025-11-15 05:02:05','2025-11-15 05:02:05'),(3,'config_code_3','config_value_3','2025-11-15 05:02:05','2025-11-15 05:02:05'),(4,'config_code_4','config_value_4','2025-11-15 05:02:05','2025-11-15 05:02:05'),(5,'config_code_5','config_value_5','2025-11-15 05:02:05','2025-11-15 05:02:05'),(6,'general.general.locale_settings.locale','en','2025-11-16 10:09:07','2025-11-16 10:09:07'),(7,'general.general.admin_logo.logo_image','configuration/gIpKZzJ4U3QIyzqr9j2gHcjA4H2XWe5XzK4SDxA1.svg','2025-11-16 10:09:08','2025-11-16 10:09:24');
/*!40000 ALTER TABLE `core_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan'),(2,'AX','Åland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua & Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BA','Bosnia & Herzegovina'),(29,'BW','Botswana'),(30,'BV','Bouvet Island'),(31,'BR','Brazil'),(32,'IO','British Indian Ocean Territory'),(33,'BN','Brunei'),(34,'BG','Bulgaria'),(35,'BF','Burkina Faso'),(36,'BI','Burundi'),(37,'CV','Cabo Verde'),(38,'KH','Cambodia'),(39,'CM','Cameroon'),(40,'CA','Canada'),(41,'KY','Cayman Islands'),(42,'CF','Central African Republic'),(43,'TD','Chad'),(44,'CL','Chile'),(45,'CN','China'),(46,'CX','Christmas Island'),(47,'CC','Cocos (Keeling) Islands'),(48,'CO','Colombia'),(49,'KM','Comoros'),(50,'CD','Congo - Kinshasa'),(51,'CG','Congo - Brazzaville'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'CI','Côte d’Ivoire'),(55,'HR','Croatia'),(56,'CU','Cuba'),(57,'CW','Curaçao'),(58,'CY','Cyprus'),(59,'CZ','Czechia'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'EC','Ecuador'),(65,'EG','Egypt'),(66,'SV','El Salvador'),(67,'GQ','Equatorial Guinea'),(68,'ER','Eritrea'),(69,'EE','Estonia'),(70,'SZ','Eswatini'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard & McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong SAR China'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'JM','Jamaica'),(111,'JP','Japan'),(112,'JE','Jersey'),(113,'JO','Jordan'),(114,'KZ','Kazakhstan'),(115,'KE','Kenya'),(116,'KI','Kiribati'),(117,'KP','Korea - North'),(118,'KR','Korea - South'),(119,'XK','Kosovo'),(120,'KW','Kuwait'),(121,'KG','Kyrgyzstan'),(122,'LA','Laos'),(123,'LV','Latvia'),(124,'LB','Lebanon'),(125,'LS','Lesotho'),(126,'LR','Liberia'),(127,'LY','Libya'),(128,'LI','Liechtenstein'),(129,'LT','Lithuania'),(130,'LU','Luxembourg'),(131,'MO','Macao SAR China'),(132,'MK','North Macedonia'),(133,'MG','Madagascar'),(134,'MW','Malawi'),(135,'MY','Malaysia'),(136,'MV','Maldives'),(137,'ML','Mali'),(138,'MT','Malta'),(139,'MH','Marshall Islands'),(140,'MQ','Martinique'),(141,'MR','Mauritania'),(142,'MU','Mauritius'),(143,'YT','Mayotte'),(144,'MX','Mexico'),(145,'FM','Micronesia'),(146,'MD','Moldova'),(147,'MC','Monaco'),(148,'MN','Mongolia'),(149,'ME','Montenegro'),(150,'MS','Montserrat'),(151,'MA','Morocco'),(152,'MZ','Mozambique'),(153,'MM','Myanmar'),(154,'NA','Namibia'),(155,'NR','Nauru'),(156,'NP','Nepal'),(157,'NL','Netherlands'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'MP','Northern Mariana Islands'),(166,'NO','Norway'),(167,'OM','Oman'),(168,'PK','Pakistan'),(169,'PW','Palau'),(170,'PS','Palestinian Territories'),(171,'PA','Panama'),(172,'PG','Papua New Guinea'),(173,'PY','Paraguay'),(174,'PE','Peru'),(175,'PH','Philippines'),(176,'PN','Pitcairn Islands'),(177,'PL','Poland'),(178,'PT','Portugal'),(179,'PR','Puerto Rico'),(180,'QA','Qatar'),(181,'RE','Réunion'),(182,'RO','Romania'),(183,'RU','Russia'),(184,'RW','Rwanda'),(185,'BL','Saint Barthélemy'),(186,'SH','Saint Helena'),(187,'KN','Saint Kitts & Nevis'),(188,'LC','Saint Lucia'),(189,'MF','Saint Martin'),(190,'PM','Saint Pierre & Miquelon'),(191,'VC','Saint Vincent & Grenadines'),(192,'WS','Samoa'),(193,'SM','San Marino'),(194,'ST','Sao Tome & Principe'),(195,'SA','Saudi Arabia'),(196,'SN','Senegal'),(197,'RS','Serbia'),(198,'SC','Seychelles'),(199,'SL','Sierra Leone'),(200,'SG','Singapore'),(201,'SX','Sint Maarten'),(202,'SK','Slovakia'),(203,'SI','Slovenia'),(204,'SB','Solomon Islands'),(205,'SO','Somalia'),(206,'ZA','South Africa'),(207,'GS','South Georgia & South Sandwich Islands'),(208,'SS','South Sudan'),(209,'ES','Spain'),(210,'LK','Sri Lanka'),(211,'SD','Sudan'),(212,'SR','Suriname'),(213,'SJ','Svalbard & Jan Mayen'),(214,'SE','Sweden'),(215,'CH','Switzerland'),(216,'SY','Syria'),(217,'TW','Taiwan'),(218,'TJ','Tajikistan'),(219,'TZ','Tanzania'),(220,'TH','Thailand'),(221,'TL','Timor-Leste'),(222,'TG','Togo'),(223,'TK','Tokelau'),(224,'TO','Tonga'),(225,'TT','Trinidad & Tobago'),(226,'TN','Tunisia'),(227,'TR','Turkey'),(228,'TM','Turkmenistan'),(229,'TC','Turks & Caicos Islands'),(230,'TV','Tuvalu'),(231,'UG','Uganda'),(232,'UA','Ukraine'),(233,'AE','United Arab Emirates'),(234,'GB','United Kingdom'),(235,'US','United States'),(236,'UM','United States Minor Outlying Islands'),(237,'UY','Uruguay'),(238,'UZ','Uzbekistan'),(239,'VU','Vanuatu'),(240,'VA','Vatican City'),(241,'VE','Venezuela'),(242,'VN','Vietnam'),(243,'VG','British Virgin Islands'),(244,'VI','U.S. Virgin Islands'),(245,'WF','Wallis & Futuna'),(246,'EH','Western Sahara'),(247,'YE','Yemen'),(248,'ZM','Zambia'),(249,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_states`
--

DROP TABLE IF EXISTS `country_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_states` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_states_country_id_foreign` (`country_id`),
  CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_states`
--

LOCK TABLES `country_states` WRITE;
/*!40000 ALTER TABLE `country_states` DISABLE KEYS */;
INSERT INTO `country_states` VALUES (1,'AF','ST1','State 1',1),(2,'AX','ST2','State 2',2),(3,'AL','ST3','State 3',3),(4,'DZ','ST4','State 4',4),(5,'AS','ST5','State 5',5);
/*!40000 ALTER TABLE `country_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datagrid_saved_filters`
--

DROP TABLE IF EXISTS `datagrid_saved_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datagrid_saved_filters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `datagrid_saved_filters_user_id_name_src_unique` (`user_id`,`name`,`src`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datagrid_saved_filters`
--

LOCK TABLES `datagrid_saved_filters` WRITE;
/*!40000 ALTER TABLE `datagrid_saved_filters` DISABLE KEYS */;
INSERT INTO `datagrid_saved_filters` VALUES (1,1,'My Saved Filter 1','leads','{\"status\": \"new\"}','2025-11-15 05:05:11','2025-11-15 05:05:11'),(2,1,'My Saved Filter 2','leads','{\"status\": \"new\"}','2025-11-15 05:05:11','2025-11-15 05:05:11'),(3,1,'My Saved Filter 3','leads','{\"status\": \"new\"}','2025-11-15 05:05:11','2025-11-15 05:05:11'),(4,1,'My Saved Filter 4','leads','{\"status\": \"new\"}','2025-11-15 05:05:11','2025-11-15 05:05:11'),(5,1,'My Saved Filter 5','leads','{\"status\": \"new\"}','2025-11-15 05:05:11','2025-11-15 05:05:11');
/*!40000 ALTER TABLE `datagrid_saved_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_attachments`
--

DROP TABLE IF EXISTS `email_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int DEFAULT NULL,
  `content_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email_attachments_email_id_foreign` (`email_id`),
  CONSTRAINT `email_attachments_email_id_foreign` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_attachments`
--

LOCK TABLES `email_attachments` WRITE;
/*!40000 ALTER TABLE `email_attachments` DISABLE KEYS */;
INSERT INTO `email_attachments` VALUES (1,'attachment_1.txt','email_attachments/attachment_1.txt',1024,'text/plain','content_id_1',1,'2025-11-15 05:04:34','2025-11-15 05:04:34'),(2,'attachment_2.txt','email_attachments/attachment_2.txt',1024,'text/plain','content_id_2',2,'2025-11-15 05:04:34','2025-11-15 05:04:34'),(3,'attachment_3.txt','email_attachments/attachment_3.txt',1024,'text/plain','content_id_3',3,'2025-11-15 05:04:34','2025-11-15 05:04:34'),(4,'attachment_4.txt','email_attachments/attachment_4.txt',1024,'text/plain','content_id_4',4,'2025-11-15 05:04:34','2025-11-15 05:04:34'),(5,'attachment_5.txt','email_attachments/attachment_5.txt',1024,'text/plain','content_id_5',5,'2025-11-15 05:04:34','2025-11-15 05:04:34'),(6,'attachment_1.txt','email_attachments/2_69180f2ce0b2a.txt',37,'text/plain','content_id_69180f2ce0bcd',4,'2025-11-15 05:12:08','2025-11-15 05:12:08'),(7,'attachment_2.txt','email_attachments/1_69180f2ce0fd1.txt',37,'text/plain','content_id_69180f2ce1051',5,'2025-11-15 05:12:08','2025-11-15 05:12:08'),(8,'attachment_3.txt','email_attachments/5_69180f2ce12b8.txt',37,'text/plain','content_id_69180f2ce1322',1,'2025-11-15 05:12:08','2025-11-15 05:12:08'),(9,'attachment_4.txt','email_attachments/4_69180f2ce158f.txt',37,'text/plain','content_id_69180f2ce15ef',4,'2025-11-15 05:12:08','2025-11-15 05:12:08'),(10,'attachment_5.txt','email_attachments/4_69180f2ce1832.txt',37,'text/plain','content_id_69180f2ce188c',2,'2025-11-15 05:12:08','2025-11-15 05:12:08');
/*!40000 ALTER TABLE `email_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_tags`
--

DROP TABLE IF EXISTS `email_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_tags` (
  `tag_id` int unsigned NOT NULL,
  `email_id` int unsigned NOT NULL,
  KEY `email_tags_tag_id_foreign` (`tag_id`),
  KEY `email_tags_email_id_foreign` (`email_id`),
  CONSTRAINT `email_tags_email_id_foreign` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE,
  CONSTRAINT `email_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_tags`
--

LOCK TABLES `email_tags` WRITE;
/*!40000 ALTER TABLE `email_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_templates_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES (1,'Email Template 1','Subject for Email Template 1','Content for Email Template 1','2025-11-15 05:01:42','2025-11-15 05:01:42'),(2,'Email Template 2','Subject for Email Template 2','Content for Email Template 2','2025-11-15 05:01:43','2025-11-15 05:01:43'),(3,'Email Template 3','Subject for Email Template 3','Content for Email Template 3','2025-11-15 05:01:43','2025-11-15 05:01:43'),(4,'Email Template 4','Subject for Email Template 4','Content for Email Template 4','2025-11-15 05:01:43','2025-11-15 05:01:43'),(5,'Email Template 5','Subject for Email Template 5','Content for Email Template 5','2025-11-15 05:01:43','2025-11-15 05:01:43');
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emails` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `folders` json DEFAULT NULL,
  `from` json DEFAULT NULL,
  `sender` json DEFAULT NULL,
  `reply_to` json DEFAULT NULL,
  `cc` json DEFAULT NULL,
  `bcc` json DEFAULT NULL,
  `unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_ids` json DEFAULT NULL,
  `person_id` int unsigned DEFAULT NULL,
  `lead_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emails_message_id_unique` (`message_id`),
  UNIQUE KEY `emails_unique_id_unique` (`unique_id`),
  KEY `emails_person_id_foreign` (`person_id`),
  KEY `emails_lead_id_foreign` (`lead_id`),
  KEY `emails_parent_id_foreign` (`parent_id`),
  CONSTRAINT `emails_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `emails_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE,
  CONSTRAINT `emails_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` VALUES (1,'Email Subject 1','inbox','admin','Sender 1','Reply content 1',0,'[\"inbox\"]','{\"name\": \"Sender 1\", \"email\": \"sender1@example.com\"}','{\"name\": \"Sender 1\", \"email\": \"sender1@example.com\"}','{\"name\": \"Reply To 1\", \"email\": \"replyto1@example.com\"}','[]','[]','69180d5b5501b','<message1@example.com>','[]',1,4,'2025-11-15 05:04:23','2025-11-15 05:04:23',NULL),(2,'Email Subject 2','inbox','admin','Sender 2','Reply content 2',0,'[\"inbox\"]','{\"name\": \"Sender 2\", \"email\": \"sender2@example.com\"}','{\"name\": \"Sender 2\", \"email\": \"sender2@example.com\"}','{\"name\": \"Reply To 2\", \"email\": \"replyto2@example.com\"}','[]','[]','69180d5b5547f','<message2@example.com>','[]',1,2,'2025-11-15 05:04:23','2025-11-15 05:04:23',NULL),(3,'Email Subject 3','inbox','admin','Sender 3','Reply content 3',0,'[\"inbox\"]','{\"name\": \"Sender 3\", \"email\": \"sender3@example.com\"}','{\"name\": \"Sender 3\", \"email\": \"sender3@example.com\"}','{\"name\": \"Reply To 3\", \"email\": \"replyto3@example.com\"}','[]','[]','69180d5b55826','<message3@example.com>','[]',1,5,'2025-11-15 05:04:23','2025-11-15 05:04:23',NULL),(4,'Email Subject 4','inbox','admin','Sender 4','Reply content 4',0,'[\"inbox\"]','{\"name\": \"Sender 4\", \"email\": \"sender4@example.com\"}','{\"name\": \"Sender 4\", \"email\": \"sender4@example.com\"}','{\"name\": \"Reply To 4\", \"email\": \"replyto4@example.com\"}','[]','[]','69180d5b55baf','<message4@example.com>','[]',1,1,'2025-11-15 05:04:23','2025-11-15 05:04:23',NULL),(5,'Email Subject 5','inbox','admin','Sender 5','Reply content 5',0,'[\"inbox\"]','{\"name\": \"Sender 5\", \"email\": \"sender5@example.com\"}','{\"name\": \"Sender 5\", \"email\": \"sender5@example.com\"}','{\"name\": \"Reply To 5\", \"email\": \"replyto5@example.com\"}','[]','[]','69180d5b55ef0','<message5@example.com>','[]',1,4,'2025-11-15 05:04:23','2025-11-15 05:04:23',NULL);
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Group 1','Description for Group 1','2025-11-15 05:01:32','2025-11-15 05:01:32'),(2,'Group 2','Description for Group 2','2025-11-15 05:01:32','2025-11-15 05:01:32'),(3,'Group 3','Description for Group 3','2025-11-15 05:01:32','2025-11-15 05:01:32'),(4,'Group 4','Description for Group 4','2025-11-15 05:01:32','2025-11-15 05:01:32'),(5,'Group 5','Description for Group 5','2025-11-15 05:01:32','2025-11-15 05:01:32');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_batches`
--

DROP TABLE IF EXISTS `import_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_batches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `data` json NOT NULL,
  `summary` json DEFAULT NULL,
  `import_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `import_batches_import_id_foreign` (`import_id`),
  CONSTRAINT `import_batches_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_batches`
--

LOCK TABLES `import_batches` WRITE;
/*!40000 ALTER TABLE `import_batches` DISABLE KEYS */;
INSERT INTO `import_batches` VALUES (1,'completed','{\"row_data\": \"data_1\"}','{\"created\": 1, \"updated\": 0}',1),(2,'completed','{\"row_data\": \"data_2\"}','{\"created\": 1, \"updated\": 0}',2),(3,'completed','{\"row_data\": \"data_3\"}','{\"created\": 1, \"updated\": 0}',3),(4,'completed','{\"row_data\": \"data_4\"}','{\"created\": 1, \"updated\": 0}',4),(5,'completed','{\"row_data\": \"data_5\"}','{\"created\": 1, \"updated\": 0}',5);
/*!40000 ALTER TABLE `import_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `process_in_queue` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation_strategy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_errors` int NOT NULL DEFAULT '0',
  `processed_rows_count` int NOT NULL DEFAULT '0',
  `invalid_rows_count` int NOT NULL DEFAULT '0',
  `errors_count` int NOT NULL DEFAULT '0',
  `errors` json DEFAULT NULL,
  `field_separator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `error_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` json DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
INSERT INTO `imports` VALUES (1,'completed',0,'product','create','skip_errors',0,100,0,0,'[]',',','imports/product_import_1.csv',NULL,'{\"created\": 100, \"deleted\": 0, \"updated\": 0}','2025-11-15 10:49:40','2025-11-15 10:49:40','2025-11-15 05:04:40','2025-11-15 05:04:40'),(2,'completed',0,'product','create','skip_errors',0,100,0,0,'[]',',','imports/product_import_2.csv',NULL,'{\"created\": 100, \"deleted\": 0, \"updated\": 0}','2025-11-15 10:49:40','2025-11-15 10:49:40','2025-11-15 05:04:40','2025-11-15 05:04:40'),(3,'completed',0,'product','create','skip_errors',0,100,0,0,'[]',',','imports/product_import_3.csv',NULL,'{\"created\": 100, \"deleted\": 0, \"updated\": 0}','2025-11-15 10:49:40','2025-11-15 10:49:40','2025-11-15 05:04:40','2025-11-15 05:04:40'),(4,'completed',0,'product','create','skip_errors',0,100,0,0,'[]',',','imports/product_import_4.csv',NULL,'{\"created\": 100, \"deleted\": 0, \"updated\": 0}','2025-11-15 10:49:40','2025-11-15 10:49:40','2025-11-15 05:04:40','2025-11-15 05:04:40'),(5,'completed',0,'product','create','skip_errors',0,100,0,0,'[]',',','imports/product_import_5.csv',NULL,'{\"created\": 100, \"deleted\": 0, \"updated\": 0}','2025-11-15 10:49:40','2025-11-15 10:49:40','2025-11-15 05:04:40','2025-11-15 05:04:40');
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_activities`
--

DROP TABLE IF EXISTS `lead_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_activities` (
  `activity_id` int unsigned NOT NULL,
  `lead_id` int unsigned NOT NULL,
  KEY `lead_activities_activity_id_foreign` (`activity_id`),
  KEY `lead_activities_lead_id_foreign` (`lead_id`),
  CONSTRAINT `lead_activities_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lead_activities_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_activities`
--

LOCK TABLES `lead_activities` WRITE;
/*!40000 ALTER TABLE `lead_activities` DISABLE KEYS */;
INSERT INTO `lead_activities` VALUES (13,1),(14,2),(15,3),(16,4),(17,5);
/*!40000 ALTER TABLE `lead_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_pipeline_stages`
--

DROP TABLE IF EXISTS `lead_pipeline_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_pipeline_stages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `probability` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  `lead_pipeline_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lead_pipeline_stages_code_lead_pipeline_id_unique` (`code`,`lead_pipeline_id`),
  UNIQUE KEY `lead_pipeline_stages_name_lead_pipeline_id_unique` (`name`,`lead_pipeline_id`),
  KEY `lead_pipeline_stages_lead_pipeline_id_foreign` (`lead_pipeline_id`),
  CONSTRAINT `lead_pipeline_stages_lead_pipeline_id_foreign` FOREIGN KEY (`lead_pipeline_id`) REFERENCES `lead_pipelines` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_pipeline_stages`
--

LOCK TABLES `lead_pipeline_stages` WRITE;
/*!40000 ALTER TABLE `lead_pipeline_stages` DISABLE KEYS */;
INSERT INTO `lead_pipeline_stages` VALUES (1,'new','New',100,1,1),(2,'follow-up','Follow Up',100,2,1),(3,'prospect','Prospect',100,3,1),(4,'negotiation','Negotiation',100,4,1),(5,'won','Won',100,5,1),(6,'lost','Lost',0,6,1);
/*!40000 ALTER TABLE `lead_pipeline_stages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_pipelines`
--

DROP TABLE IF EXISTS `lead_pipelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_pipelines` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `rotten_days` int NOT NULL DEFAULT '30',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lead_pipelines_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_pipelines`
--

LOCK TABLES `lead_pipelines` WRITE;
/*!40000 ALTER TABLE `lead_pipelines` DISABLE KEYS */;
INSERT INTO `lead_pipelines` VALUES (1,'Default Pipeline',1,30,'2025-11-15 01:46:32','2025-11-15 01:46:32');
/*!40000 ALTER TABLE `lead_pipelines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_products`
--

DROP TABLE IF EXISTS `lead_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL DEFAULT '0',
  `price` decimal(12,4) DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT NULL,
  `lead_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_products_lead_id_foreign` (`lead_id`),
  KEY `lead_products_product_id_foreign` (`product_id`),
  CONSTRAINT `lead_products_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lead_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_products`
--

LOCK TABLES `lead_products` WRITE;
/*!40000 ALTER TABLE `lead_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_quotes`
--

DROP TABLE IF EXISTS `lead_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_quotes` (
  `quote_id` int unsigned NOT NULL,
  `lead_id` int unsigned NOT NULL,
  KEY `lead_quotes_quote_id_foreign` (`quote_id`),
  KEY `lead_quotes_lead_id_foreign` (`lead_id`),
  CONSTRAINT `lead_quotes_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lead_quotes_quote_id_foreign` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_quotes`
--

LOCK TABLES `lead_quotes` WRITE;
/*!40000 ALTER TABLE `lead_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_sources`
--

DROP TABLE IF EXISTS `lead_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_sources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_sources`
--

LOCK TABLES `lead_sources` WRITE;
/*!40000 ALTER TABLE `lead_sources` DISABLE KEYS */;
INSERT INTO `lead_sources` VALUES (1,'Email','2025-11-15 01:46:34','2025-11-15 01:46:34'),(2,'Web','2025-11-15 01:46:34','2025-11-15 01:46:34'),(3,'Web Form','2025-11-15 01:46:34','2025-11-15 01:46:34'),(4,'Phone','2025-11-15 01:46:34','2025-11-15 01:46:34'),(5,'Direct','2025-11-15 01:46:34','2025-11-15 01:46:34');
/*!40000 ALTER TABLE `lead_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_stages`
--

DROP TABLE IF EXISTS `lead_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_stages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_stages`
--

LOCK TABLES `lead_stages` WRITE;
/*!40000 ALTER TABLE `lead_stages` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_stages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_tags`
--

DROP TABLE IF EXISTS `lead_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_tags` (
  `tag_id` int unsigned NOT NULL,
  `lead_id` int unsigned NOT NULL,
  KEY `lead_tags_tag_id_foreign` (`tag_id`),
  KEY `lead_tags_lead_id_foreign` (`lead_id`),
  CONSTRAINT `lead_tags_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lead_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_tags`
--

LOCK TABLES `lead_tags` WRITE;
/*!40000 ALTER TABLE `lead_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_types`
--

DROP TABLE IF EXISTS `lead_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_types`
--

LOCK TABLES `lead_types` WRITE;
/*!40000 ALTER TABLE `lead_types` DISABLE KEYS */;
INSERT INTO `lead_types` VALUES (1,'Lead Type 1','2025-11-15 05:02:33','2025-11-15 05:02:33'),(2,'Lead Type 2','2025-11-15 05:02:33','2025-11-15 05:02:33'),(3,'Lead Type 3','2025-11-15 05:02:33','2025-11-15 05:02:33'),(4,'Lead Type 4','2025-11-15 05:02:33','2025-11-15 05:02:33'),(5,'Lead Type 5','2025-11-15 05:02:33','2025-11-15 05:02:33');
/*!40000 ALTER TABLE `lead_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `lead_value` decimal(12,4) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `lost_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `closed_at` datetime DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `person_id` int unsigned DEFAULT NULL,
  `lead_source_id` int unsigned DEFAULT NULL,
  `lead_type_id` int unsigned DEFAULT NULL,
  `lead_pipeline_id` int unsigned DEFAULT NULL,
  `lead_pipeline_stage_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expected_close_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leads_lead_pipeline_id_foreign` (`lead_pipeline_id`),
  KEY `leads_lead_pipeline_stage_id_foreign` (`lead_pipeline_stage_id`),
  KEY `leads_user_id_foreign` (`user_id`),
  KEY `leads_person_id_foreign` (`person_id`),
  KEY `leads_lead_source_id_foreign` (`lead_source_id`),
  KEY `leads_lead_type_id_foreign` (`lead_type_id`),
  CONSTRAINT `leads_lead_pipeline_id_foreign` FOREIGN KEY (`lead_pipeline_id`) REFERENCES `lead_pipelines` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leads_lead_pipeline_stage_id_foreign` FOREIGN KEY (`lead_pipeline_stage_id`) REFERENCES `lead_pipeline_stages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `leads_lead_source_id_foreign` FOREIGN KEY (`lead_source_id`) REFERENCES `lead_sources` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `leads_lead_type_id_foreign` FOREIGN KEY (`lead_type_id`) REFERENCES `lead_types` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `leads_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `leads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
INSERT INTO `leads` VALUES (1,'Lead 1','Description for Lead 1',1100.0000,0,NULL,NULL,1,1,3,3,1,4,'2025-11-15 05:02:37','2025-11-15 05:02:37','2025-11-16'),(2,'Lead 2','Description for Lead 2',1200.0000,0,NULL,NULL,1,1,2,1,1,5,'2025-11-15 05:02:37','2025-11-15 05:02:37','2025-11-17'),(3,'Lead 3','Description for Lead 3',1300.0000,0,NULL,NULL,1,1,5,5,1,6,'2025-11-15 05:02:37','2025-11-15 05:02:37','2025-11-18'),(4,'Lead 4','Description for Lead 4',1400.0000,0,NULL,NULL,1,1,5,3,1,1,'2025-11-15 05:02:37','2025-11-15 05:02:37','2025-11-19'),(5,'Lead 5','Description for Lead 5',1500.0000,0,NULL,NULL,1,1,3,1,1,5,'2025-11-15 05:02:37','2025-11-15 05:02:37','2025-11-20');
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_campaigns`
--

DROP TABLE IF EXISTS `marketing_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_campaigns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spooling` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marketing_template_id` int unsigned DEFAULT NULL,
  `marketing_event_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`),
  CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `email_templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_campaigns`
--

LOCK TABLES `marketing_campaigns` WRITE;
/*!40000 ALTER TABLE `marketing_campaigns` DISABLE KEYS */;
INSERT INTO `marketing_campaigns` VALUES (1,'Campaign 1','Subject for Campaign 1',0,'','','queue',4,4,'2025-11-15 05:04:01','2025-11-15 05:04:01'),(2,'Campaign 2','Subject for Campaign 2',0,'','','queue',1,4,'2025-11-15 05:04:01','2025-11-15 05:04:01'),(3,'Campaign 3','Subject for Campaign 3',0,'','','queue',1,2,'2025-11-15 05:04:01','2025-11-15 05:04:01'),(4,'Campaign 4','Subject for Campaign 4',0,'','','queue',5,4,'2025-11-15 05:04:01','2025-11-15 05:04:01'),(5,'Campaign 5','Subject for Campaign 5',0,'','','queue',1,1,'2025-11-15 05:04:01','2025-11-15 05:04:01');
/*!40000 ALTER TABLE `marketing_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_events`
--

DROP TABLE IF EXISTS `marketing_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_events`
--

LOCK TABLES `marketing_events` WRITE;
/*!40000 ALTER TABLE `marketing_events` DISABLE KEYS */;
INSERT INTO `marketing_events` VALUES (1,'Event 1','Description for Event 1','2025-11-16','2025-11-15 05:03:57','2025-11-15 05:03:57'),(2,'Event 2','Description for Event 2','2025-11-17','2025-11-15 05:03:57','2025-11-15 05:03:57'),(3,'Event 3','Description for Event 3','2025-11-18','2025-11-15 05:03:57','2025-11-15 05:03:57'),(4,'Event 4','Description for Event 4','2025-11-19','2025-11-15 05:03:57','2025-11-15 05:03:57'),(5,'Event 5','Description for Event 5','2025-11-20','2025-11-15 05:03:57','2025-11-15 05:03:57');
/*!40000 ALTER TABLE `marketing_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_08_19_000000_create_failed_jobs_table',1),(2,'2019_12_14_000001_create_personal_access_tokens_table',1),(3,'2021_03_12_060658_create_core_config_table',1),(4,'2021_03_12_074578_create_groups_table',1),(5,'2021_03_12_074597_create_roles_table',1),(6,'2021_03_12_074857_create_users_table',1),(7,'2021_03_12_074867_create_user_groups_table',1),(8,'2021_03_12_074957_create_user_password_resets_table',1),(9,'2021_04_02_080709_create_attributes_table',1),(10,'2021_04_02_080837_create_attribute_options_table',1),(11,'2021_04_06_122751_create_attribute_values_table',1),(12,'2021_04_09_051326_create_organizations_table',1),(13,'2021_04_09_065617_create_persons_table',1),(14,'2021_04_09_065617_create_products_table',1),(15,'2021_04_12_173232_create_countries_table',1),(16,'2021_04_12_173344_create_country_states_table',1),(17,'2021_04_21_172825_create_lead_sources_table',1),(18,'2021_04_21_172847_create_lead_types_table',1),(19,'2021_04_22_153258_create_lead_stages_table',1),(20,'2021_04_22_155706_create_lead_pipelines_table',1),(21,'2021_04_22_155838_create_lead_pipeline_stages_table',1),(22,'2021_04_22_164215_create_leads_table',1),(23,'2021_04_22_171805_create_lead_products_table',1),(24,'2021_05_12_150329_create_activities_table',1),(25,'2021_05_12_150329_create_lead_activities_table',1),(26,'2021_05_15_151855_create_activity_files_table',1),(27,'2021_05_20_141230_create_tags_table',1),(28,'2021_05_20_141240_create_lead_tags_table',1),(29,'2021_05_24_075618_create_emails_table',1),(30,'2021_05_25_072700_create_email_attachments_table',1),(31,'2021_06_07_162808_add_lead_view_permission_column_in_users_table',1),(32,'2021_07_01_230345_create_quotes_table',1),(33,'2021_07_01_231317_create_quote_items_table',1),(34,'2021_07_02_201822_create_lead_quotes_table',1),(35,'2021_07_28_142453_create_activity_participants_table',1),(36,'2021_08_26_133538_create_workflows_table',1),(37,'2021_09_03_172713_create_email_templates_table',1),(38,'2021_09_22_194103_add_unique_index_to_name_in_organizations_table',1),(39,'2021_09_22_194622_add_unique_index_to_name_in_groups_table',1),(40,'2021_09_23_221138_add_column_expected_close_date_in_leads_table',1),(41,'2021_09_30_135857_add_column_rotten_days_in_lead_pipelines_table',1),(42,'2021_09_30_154222_alter_lead_pipeline_stages_table',1),(43,'2021_09_30_161722_alter_leads_table',1),(44,'2021_09_30_183825_change_user_id_to_nullable_in_leads_table',1),(45,'2021_10_02_170105_insert_expected_closed_date_column_in_attributes_table',1),(46,'2021_11_11_180804_change_lead_pipeline_stage_id_constraint_in_leads_table',1),(47,'2021_11_12_171510_add_image_column_in_users_table',1),(48,'2021_11_17_190943_add_location_column_in_activities_table',1),(49,'2021_12_14_213049_create_web_forms_table',1),(50,'2021_12_14_214923_create_web_form_attributes_table',1),(51,'2024_01_11_154640_create_imports_table',1),(52,'2024_01_11_154741_create_import_batches_table',1),(53,'2024_05_10_152848_create_saved_filters_table',1),(54,'2024_06_21_160707_create_warehouses_table',1),(55,'2024_06_21_160735_create_warehouse_locations_table',1),(56,'2024_06_24_174241_insert_warehouse_attributes_in_attributes_table',1),(57,'2024_06_28_154009_create_product_inventories_table',1),(58,'2024_07_24_150821_create_webhooks_table',1),(59,'2024_07_31_092951_add_job_title_in_persons_table',1),(60,'2024_07_31_093603_add_organization_sales_owner_attribute_in_attributes_table',1),(61,'2024_07_31_093605_add_person_job_title_attribute_in_attributes_table',1),(62,'2024_07_31_093605_add_person_sales_owner_attribute_in_attributes_table',1),(63,'2024_08_06_145943_create_person_tags_table',1),(64,'2024_08_06_161212_create_person_activities_table',1),(65,'2024_08_10_100329_create_warehouse_activities_table',1),(66,'2024_08_10_100340_create_warehouse_tags_table',1),(67,'2024_08_10_150329_create_product_activities_table',1),(68,'2024_08_10_150340_create_product_tags_table',1),(69,'2024_08_14_102116_add_user_id_column_in_persons_table',1),(70,'2024_08_14_102136_add_user_id_column_in_organizations_table',1),(71,'2024_08_21_153011_add_leads_stage_and_pipeline_attributes',1),(72,'2024_08_27_091619_create_email_tags_table',1),(73,'2024_09_06_065808_alter_product_inventories_table',1),(74,'2024_09_09_094040_create_job_batches_table',1),(75,'2024_09_09_094042_create_jobs_table',1),(76,'2024_09_09_112201_add_unique_id_to_person_table',1),(77,'2024_10_29_044744_create_marketing_events_table',1),(78,'2024_11_04_122500_create_marketing_campaigns_table',1),(79,'2024_11_29_120302_modify_foreign_keys_in_leads_table',1),(80,'2025_01_17_151632_alter_activities_table',1),(96,'2025_01_29_133500_update_text_column_type_in_core_config_table',2),(97,'2025_03_19_132236_update_organization_id_column_in_persons_table',2),(98,'2025_07_01_133612_alter_lead_pipelines_table',2),(99,'2025_07_02_191710_alter_attribute_values_table',2),(100,'2025_07_09_133553_alter_email_templates_table',2),(101,'2025_11_15_000000_create_participants_table',3),(102,'2025_11_15_000001_create_ndis_plans_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ndis_plans`
--

DROP TABLE IF EXISTS `ndis_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ndis_plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `participant_id` bigint unsigned NOT NULL,
  `ndis_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_start_date` date NOT NULL,
  `plan_end_date` date NOT NULL,
  `plan_manager` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_budget` double(8,2) NOT NULL,
  `used_budget` double(8,2) NOT NULL DEFAULT '0.00',
  `support_coordination_budget` double(8,2) DEFAULT NULL,
  `support_coordination_used` double(8,2) NOT NULL DEFAULT '0.00',
  `plan_document_id` bigint unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ndis_plans_ndis_number_unique` (`ndis_number`),
  KEY `ndis_plans_participant_id_index` (`participant_id`),
  KEY `ndis_plans_plan_start_date_index` (`plan_start_date`),
  KEY `ndis_plans_plan_end_date_index` (`plan_end_date`),
  CONSTRAINT `ndis_plans_participant_id_foreign` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ndis_plans`
--

LOCK TABLES `ndis_plans` WRITE;
/*!40000 ALTER TABLE `ndis_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `ndis_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_name_unique` (`name`),
  KEY `organizations_user_id_foreign` (`user_id`),
  CONSTRAINT `organizations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,'',NULL,'2025-11-15 04:47:57','2025-11-15 04:47:57',NULL);
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant_preferences`
--

DROP TABLE IF EXISTS `participant_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participant_preferences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `participant_id` bigint unsigned NOT NULL,
  `preference_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `preference_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `participant_preferences_participant_id_preference_key_unique` (`participant_id`,`preference_key`),
  KEY `participant_preferences_category_index` (`category`),
  CONSTRAINT `participant_preferences_participant_id_foreign` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_preferences`
--

LOCK TABLES `participant_preferences` WRITE;
/*!40000 ALTER TABLE `participant_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `participant_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `ndis_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `emergency_contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disabilities` json DEFAULT NULL,
  `preferences` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `participants_ndis_number_unique` (`ndis_number`),
  KEY `participants_user_id_foreign` (`user_id`),
  KEY `participants_contact_id_user_id_index` (`contact_id`,`user_id`),
  KEY `participants_created_at_index` (`created_at`),
  CONSTRAINT `participants_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `persons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_activities`
--

DROP TABLE IF EXISTS `person_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_activities` (
  `activity_id` int unsigned NOT NULL,
  `person_id` int unsigned NOT NULL,
  KEY `person_activities_activity_id_foreign` (`activity_id`),
  KEY `person_activities_person_id_foreign` (`person_id`),
  CONSTRAINT `person_activities_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `person_activities_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_activities`
--

LOCK TABLES `person_activities` WRITE;
/*!40000 ALTER TABLE `person_activities` DISABLE KEYS */;
INSERT INTO `person_activities` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `person_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_tags`
--

DROP TABLE IF EXISTS `person_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_tags` (
  `tag_id` int unsigned NOT NULL,
  `person_id` int unsigned NOT NULL,
  KEY `person_tags_tag_id_foreign` (`tag_id`),
  KEY `person_tags_person_id_foreign` (`person_id`),
  CONSTRAINT `person_tags_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `person_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_tags`
--

LOCK TABLES `person_tags` WRITE;
/*!40000 ALTER TABLE `person_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `emails` json NOT NULL,
  `contact_numbers` json DEFAULT NULL,
  `organization_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `job_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persons_unique_id_unique` (`unique_id`),
  KEY `persons_user_id_foreign` (`user_id`),
  KEY `persons_organization_id_foreign` (`organization_id`),
  CONSTRAINT `persons_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE SET NULL,
  CONSTRAINT `persons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES (1,'','null',NULL,NULL,'2025-11-15 04:49:06','2025-11-15 04:49:06','Manager',NULL,'');
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_activities`
--

DROP TABLE IF EXISTS `product_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_activities` (
  `activity_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  KEY `product_activities_activity_id_foreign` (`activity_id`),
  KEY `product_activities_product_id_foreign` (`product_id`),
  CONSTRAINT `product_activities_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_activities_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_activities`
--

LOCK TABLES `product_activities` WRITE;
/*!40000 ALTER TABLE `product_activities` DISABLE KEYS */;
INSERT INTO `product_activities` VALUES (3,1),(4,2),(5,3),(6,4),(7,5);
/*!40000 ALTER TABLE `product_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventories`
--

DROP TABLE IF EXISTS `product_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `in_stock` int NOT NULL DEFAULT '0',
  `allocated` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `warehouse_id` int unsigned DEFAULT NULL,
  `warehouse_location_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_inventories_product_id_foreign` (`product_id`),
  KEY `product_inventories_warehouse_id_foreign` (`warehouse_id`),
  KEY `product_inventories_warehouse_location_id_foreign` (`warehouse_location_id`),
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_warehouse_location_id_foreign` FOREIGN KEY (`warehouse_location_id`) REFERENCES `warehouse_locations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventories`
--

LOCK TABLES `product_inventories` WRITE;
/*!40000 ALTER TABLE `product_inventories` DISABLE KEYS */;
INSERT INTO `product_inventories` VALUES (1,100,10,1,1,1,'2025-11-15 05:04:55','2025-11-15 05:04:55'),(2,110,11,2,2,2,'2025-11-15 05:04:55','2025-11-15 05:04:55'),(3,120,12,3,3,3,'2025-11-15 05:04:55','2025-11-15 05:04:55'),(4,130,13,4,4,4,'2025-11-15 05:04:55','2025-11-15 05:04:55'),(5,140,14,5,5,5,'2025-11-15 05:04:55','2025-11-15 05:04:55');
/*!40000 ALTER TABLE `product_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tags`
--

DROP TABLE IF EXISTS `product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tags` (
  `tag_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  KEY `product_tags_tag_id_foreign` (`tag_id`),
  KEY `product_tags_product_id_foreign` (`product_id`),
  CONSTRAINT `product_tags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tags`
--

LOCK TABLES `product_tags` WRITE;
/*!40000 ALTER TABLE `product_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `price` decimal(12,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'PROD1','Product 1','Description for Product 1',11,101.0000,'2025-11-15 04:50:53','2025-11-15 04:50:53'),(2,'PROD2','Product 2','Description for Product 2',12,102.0000,'2025-11-15 04:50:53','2025-11-15 04:50:53'),(3,'PROD3','Product 3','Description for Product 3',13,103.0000,'2025-11-15 04:50:53','2025-11-15 04:50:53'),(4,'PROD4','Product 4','Description for Product 4',14,104.0000,'2025-11-15 04:50:53','2025-11-15 04:50:53'),(5,'PROD5','Product 5','Description for Product 5',15,105.0000,'2025-11-15 04:50:53','2025-11-15 04:50:53');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_items`
--

DROP TABLE IF EXISTS `quote_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quote_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned NOT NULL,
  `quote_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quote_items_quote_id_foreign` (`quote_id`),
  CONSTRAINT `quote_items_quote_id_foreign` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_items`
--

LOCK TABLES `quote_items` WRITE;
/*!40000 ALTER TABLE `quote_items` DISABLE KEYS */;
INSERT INTO `quote_items` VALUES (1,'SKU1','Quote Item 1',1,100.0000,NULL,0.0000,0.0000,0.0000,0.0000,100.0000,1,1,'2025-11-15 05:02:51','2025-11-15 05:02:51'),(2,'SKU2','Quote Item 2',1,110.0000,NULL,0.0000,0.0000,0.0000,0.0000,110.0000,2,2,'2025-11-15 05:02:51','2025-11-15 05:02:51'),(3,'SKU3','Quote Item 3',1,120.0000,NULL,0.0000,0.0000,0.0000,0.0000,120.0000,3,3,'2025-11-15 05:02:51','2025-11-15 05:02:51'),(4,'SKU4','Quote Item 4',1,130.0000,NULL,0.0000,0.0000,0.0000,0.0000,130.0000,4,4,'2025-11-15 05:02:51','2025-11-15 05:02:51'),(5,'SKU5','Quote Item 5',1,140.0000,NULL,0.0000,0.0000,0.0000,0.0000,140.0000,5,5,'2025-11-15 05:02:51','2025-11-15 05:02:51');
/*!40000 ALTER TABLE `quote_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` json DEFAULT NULL,
  `shipping_address` json DEFAULT NULL,
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT NULL,
  `tax_amount` decimal(12,4) DEFAULT NULL,
  `adjustment_amount` decimal(12,4) DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `person_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quotes_person_id_foreign` (`person_id`),
  KEY `quotes_user_id_foreign` (`user_id`),
  CONSTRAINT `quotes_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quotes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES (1,'Quote 1','Description for Quote 1','{\"address\": \"Billing Address 1\"}','{\"address\": \"Shipping Address 1\"}',0.0000,0.0000,0.0000,0.0000,1100.0000,1100.0000,'2025-12-15 10:47:44',1,1,'2025-11-15 05:02:44','2025-11-15 05:02:44'),(2,'Quote 2','Description for Quote 2','{\"address\": \"Billing Address 2\"}','{\"address\": \"Shipping Address 2\"}',0.0000,0.0000,0.0000,0.0000,1200.0000,1200.0000,'2025-12-15 10:47:44',1,1,'2025-11-15 05:02:44','2025-11-15 05:02:44'),(3,'Quote 3','Description for Quote 3','{\"address\": \"Billing Address 3\"}','{\"address\": \"Shipping Address 3\"}',0.0000,0.0000,0.0000,0.0000,1300.0000,1300.0000,'2025-12-15 10:47:44',1,1,'2025-11-15 05:02:44','2025-11-15 05:02:44'),(4,'Quote 4','Description for Quote 4','{\"address\": \"Billing Address 4\"}','{\"address\": \"Shipping Address 4\"}',0.0000,0.0000,0.0000,0.0000,1400.0000,1400.0000,'2025-12-15 10:47:44',1,1,'2025-11-15 05:02:44','2025-11-15 05:02:44'),(5,'Quote 5','Description for Quote 5','{\"address\": \"Billing Address 5\"}','{\"address\": \"Shipping Address 5\"}',0.0000,0.0000,0.0000,0.0000,1500.0000,1500.0000,'2025-12-15 10:47:44',1,1,'2025-11-15 05:02:44','2025-11-15 05:02:44');
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator','Administrator Role','all',NULL,NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_user_id_foreign` (`user_id`),
  CONSTRAINT `tags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (2,'Tag 1',NULL,1,'2025-11-15 05:00:43','2025-11-15 05:00:43'),(3,'Tag 2',NULL,1,'2025-11-15 05:00:43','2025-11-15 05:00:43'),(4,'Tag 3',NULL,1,'2025-11-15 05:00:43','2025-11-15 05:00:43'),(5,'Tag 4',NULL,1,'2025-11-15 05:00:43','2025-11-15 05:00:43'),(6,'Tag 5',NULL,1,'2025-11-15 05:00:43','2025-11-15 05:00:43');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_groups` (
  `group_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  KEY `user_groups_group_id_foreign` (`group_id`),
  KEY `user_groups_user_id_foreign` (`user_id`),
  CONSTRAINT `user_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_password_resets`
--

DROP TABLE IF EXISTS `user_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `user_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_password_resets`
--

LOCK TABLES `user_password_resets` WRITE;
/*!40000 ALTER TABLE `user_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `view_permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'global',
  `role_id` int unsigned NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Example Admin','admin@example.com','$2y$10$omtxk7pDeqvmVmFI7K21buTkZCNa2j2wSuwr3ofANLQWMiqlpbUtG',1,'global',1,NULL,'2025-11-15 01:46:34','2025-11-15 01:46:34',NULL),(2,'Test User','test@example.com','$2y$10$XpvZZttn4bvM5sbhzCcGpeP5pFustiaWsSCXtOZSa5PNKrxFPwbxK',1,'global',1,NULL,'2025-11-15 04:46:24','2025-11-15 04:46:24',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_activities`
--

DROP TABLE IF EXISTS `warehouse_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_activities` (
  `activity_id` int unsigned NOT NULL,
  `warehouse_id` int unsigned NOT NULL,
  KEY `warehouse_activities_activity_id_foreign` (`activity_id`),
  KEY `warehouse_activities_warehouse_id_foreign` (`warehouse_id`),
  CONSTRAINT `warehouse_activities_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `warehouse_activities_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_activities`
--

LOCK TABLES `warehouse_activities` WRITE;
/*!40000 ALTER TABLE `warehouse_activities` DISABLE KEYS */;
INSERT INTO `warehouse_activities` VALUES (8,1),(9,2),(10,3),(11,4),(12,5);
/*!40000 ALTER TABLE `warehouse_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_locations`
--

DROP TABLE IF EXISTS `warehouse_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_locations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `warehouse_locations_warehouse_id_name_unique` (`warehouse_id`,`name`),
  CONSTRAINT `warehouse_locations_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_locations`
--

LOCK TABLES `warehouse_locations` WRITE;
/*!40000 ALTER TABLE `warehouse_locations` DISABLE KEYS */;
INSERT INTO `warehouse_locations` VALUES (1,'Location 1',1,'2025-11-15 05:02:18','2025-11-15 05:02:18'),(2,'Location 2',2,'2025-11-15 05:02:18','2025-11-15 05:02:18'),(3,'Location 3',3,'2025-11-15 05:02:18','2025-11-15 05:02:18'),(4,'Location 4',4,'2025-11-15 05:02:18','2025-11-15 05:02:18'),(5,'Location 5',5,'2025-11-15 05:02:18','2025-11-15 05:02:18');
/*!40000 ALTER TABLE `warehouse_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_tags`
--

DROP TABLE IF EXISTS `warehouse_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_tags` (
  `tag_id` int unsigned NOT NULL,
  `warehouse_id` int unsigned NOT NULL,
  KEY `warehouse_tags_tag_id_foreign` (`tag_id`),
  KEY `warehouse_tags_warehouse_id_foreign` (`warehouse_id`),
  CONSTRAINT `warehouse_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `warehouse_tags_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_tags`
--

LOCK TABLES `warehouse_tags` WRITE;
/*!40000 ALTER TABLE `warehouse_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehouse_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_emails` json NOT NULL,
  `contact_numbers` json NOT NULL,
  `contact_address` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouses`
--

LOCK TABLES `warehouses` WRITE;
/*!40000 ALTER TABLE `warehouses` DISABLE KEYS */;
INSERT INTO `warehouses` VALUES (1,'Warehouse 1','Description for Warehouse 1','Contact 1','[\"contact1@example.com\"]','[\"1234567891\"]','[\"Address 1\"]','2025-11-15 05:02:11','2025-11-15 05:02:11'),(2,'Warehouse 2','Description for Warehouse 2','Contact 2','[\"contact2@example.com\"]','[\"1234567892\"]','[\"Address 2\"]','2025-11-15 05:02:11','2025-11-15 05:02:11'),(3,'Warehouse 3','Description for Warehouse 3','Contact 3','[\"contact3@example.com\"]','[\"1234567893\"]','[\"Address 3\"]','2025-11-15 05:02:11','2025-11-15 05:02:11'),(4,'Warehouse 4','Description for Warehouse 4','Contact 4','[\"contact4@example.com\"]','[\"1234567894\"]','[\"Address 4\"]','2025-11-15 05:02:11','2025-11-15 05:02:11'),(5,'Warehouse 5','Description for Warehouse 5','Contact 5','[\"contact5@example.com\"]','[\"1234567895\"]','[\"Address 5\"]','2025-11-15 05:02:11','2025-11-15 05:02:11');
/*!40000 ALTER TABLE `warehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_form_attributes`
--

DROP TABLE IF EXISTS `web_form_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_form_attributes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `attribute_id` int unsigned NOT NULL,
  `web_form_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_form_attributes_attribute_id_foreign` (`attribute_id`),
  KEY `web_form_attributes_web_form_id_foreign` (`web_form_id`),
  CONSTRAINT `web_form_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `web_form_attributes_web_form_id_foreign` FOREIGN KEY (`web_form_id`) REFERENCES `web_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_form_attributes`
--

LOCK TABLES `web_form_attributes` WRITE;
/*!40000 ALTER TABLE `web_form_attributes` DISABLE KEYS */;
INSERT INTO `web_form_attributes` VALUES (1,'Web Form Attribute 1','Placeholder 1',1,0,1,13,1),(2,'Web Form Attribute 2','Placeholder 2',0,1,2,11,2),(3,'Web Form Attribute 3','Placeholder 3',0,0,3,10,3),(4,'Web Form Attribute 4','Placeholder 4',0,0,4,12,4),(5,'Web Form Attribute 5','Placeholder 5',0,0,5,9,5);
/*!40000 ALTER TABLE `web_form_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_forms`
--

DROP TABLE IF EXISTS `web_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_forms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `form_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `submit_button_label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `submit_success_action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `submit_success_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_lead` tinyint(1) NOT NULL DEFAULT '0',
  `background_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_background_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_title_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_submit_button_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_label_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_forms_form_id_unique` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_forms`
--

LOCK TABLES `web_forms` WRITE;
/*!40000 ALTER TABLE `web_forms` DISABLE KEYS */;
INSERT INTO `web_forms` VALUES (1,'form_1','Web Form 1','Description for Web Form 1','Submit 1','message','Thank you for submitting form 1',1,'#FFFFFF','#F0F0F0','#333333','#007BFF','#555555','2025-11-15 05:04:08','2025-11-15 05:04:08'),(2,'form_2','Web Form 2','Description for Web Form 2','Submit 2','message','Thank you for submitting form 2',1,'#FFFFFF','#F0F0F0','#333333','#007BFF','#555555','2025-11-15 05:04:08','2025-11-15 05:04:08'),(3,'form_3','Web Form 3','Description for Web Form 3','Submit 3','message','Thank you for submitting form 3',1,'#FFFFFF','#F0F0F0','#333333','#007BFF','#555555','2025-11-15 05:04:08','2025-11-15 05:04:08'),(4,'form_4','Web Form 4','Description for Web Form 4','Submit 4','message','Thank you for submitting form 4',1,'#FFFFFF','#F0F0F0','#333333','#007BFF','#555555','2025-11-15 05:04:08','2025-11-15 05:04:08'),(5,'form_5','Web Form 5','Description for Web Form 5','Submit 5','message','Thank you for submitting form 5',1,'#FFFFFF','#F0F0F0','#333333','#007BFF','#555555','2025-11-15 05:04:08','2025-11-15 05:04:08');
/*!40000 ALTER TABLE `web_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhooks`
--

DROP TABLE IF EXISTS `webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhooks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `query_params` json DEFAULT NULL,
  `headers` json DEFAULT NULL,
  `payload_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `raw_payload_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhooks`
--

LOCK TABLES `webhooks` WRITE;
/*!40000 ALTER TABLE `webhooks` DISABLE KEYS */;
INSERT INTO `webhooks` VALUES (1,'Webhook 1','lead','Description for Webhook 1','POST','https://example.com/webhook/1','{\"param\": \"value1\"}','{\"Content-Type\": \"application/json\"}','json','json','{\"data\": \"payload_data_1\"}','2025-11-15 05:03:40','2025-11-15 05:03:40'),(2,'Webhook 2','lead','Description for Webhook 2','POST','https://example.com/webhook/2','{\"param\": \"value2\"}','{\"Content-Type\": \"application/json\"}','json','json','{\"data\": \"payload_data_2\"}','2025-11-15 05:03:40','2025-11-15 05:03:40'),(3,'Webhook 3','lead','Description for Webhook 3','POST','https://example.com/webhook/3','{\"param\": \"value3\"}','{\"Content-Type\": \"application/json\"}','json','json','{\"data\": \"payload_data_3\"}','2025-11-15 05:03:40','2025-11-15 05:03:40'),(4,'Webhook 4','lead','Description for Webhook 4','POST','https://example.com/webhook/4','{\"param\": \"value4\"}','{\"Content-Type\": \"application/json\"}','json','json','{\"data\": \"payload_data_4\"}','2025-11-15 05:03:40','2025-11-15 05:03:40'),(5,'Webhook 5','lead','Description for Webhook 5','POST','https://example.com/webhook/5','{\"param\": \"value5\"}','{\"Content-Type\": \"application/json\"}','json','json','{\"data\": \"payload_data_5\"}','2025-11-15 05:03:40','2025-11-15 05:03:40');
/*!40000 ALTER TABLE `webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflows`
--

DROP TABLE IF EXISTS `workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'and',
  `conditions` json DEFAULT NULL,
  `actions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflows`
--

LOCK TABLES `workflows` WRITE;
/*!40000 ALTER TABLE `workflows` DISABLE KEYS */;
INSERT INTO `workflows` VALUES (1,'Workflow 1','Description for Workflow 1','lead','lead.created','all','[{\"value\": 1000, \"operator\": \">=\", \"attribute\": \"lead_value\"}]','[{\"type\": \"send_email\", \"value\": \"admin@example.com\"}]','2025-11-15 05:03:46','2025-11-15 05:03:46'),(2,'Workflow 2','Description for Workflow 2','lead','lead.created','all','[{\"value\": 1000, \"operator\": \">=\", \"attribute\": \"lead_value\"}]','[{\"type\": \"send_email\", \"value\": \"admin@example.com\"}]','2025-11-15 05:03:46','2025-11-15 05:03:46'),(3,'Workflow 3','Description for Workflow 3','lead','lead.created','all','[{\"value\": 1000, \"operator\": \">=\", \"attribute\": \"lead_value\"}]','[{\"type\": \"send_email\", \"value\": \"admin@example.com\"}]','2025-11-15 05:03:46','2025-11-15 05:03:46'),(4,'Workflow 4','Description for Workflow 4','lead','lead.created','all','[{\"value\": 1000, \"operator\": \">=\", \"attribute\": \"lead_value\"}]','[{\"type\": \"send_email\", \"value\": \"admin@example.com\"}]','2025-11-15 05:03:46','2025-11-15 05:03:46'),(5,'Workflow 5','Description for Workflow 5','lead','lead.created','all','[{\"value\": 1000, \"operator\": \">=\", \"attribute\": \"lead_value\"}]','[{\"type\": \"send_email\", \"value\": \"admin@example.com\"}]','2025-11-15 05:03:46','2025-11-15 05:03:46');
/*!40000 ALTER TABLE `workflows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-30 12:36:39
