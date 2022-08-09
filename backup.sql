-- MySQL dump 10.13  Distrib 5.7.35-38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cn73530_lcmotors
-- ------------------------------------------------------
-- Server version	5.7.35-38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add token',8,'add_tokenproxy'),(30,'Can change token',8,'change_tokenproxy'),(31,'Can delete token',8,'delete_tokenproxy'),(32,'Can view token',8,'view_tokenproxy'),(33,'Can add category',9,'add_category'),(34,'Can change category',9,'change_category'),(35,'Can delete category',9,'delete_category'),(36,'Can view category',9,'view_category'),(37,'Can add category field',10,'add_categoryfield'),(38,'Can change category field',10,'change_categoryfield'),(39,'Can delete category field',10,'delete_categoryfield'),(40,'Can view category field',10,'view_categoryfield'),(41,'Can add product',11,'add_product'),(42,'Can change product',11,'change_product'),(43,'Can delete product',11,'delete_product'),(44,'Can view product',11,'view_product'),(45,'Can add sub category',12,'add_subcategory'),(46,'Can change sub category',12,'change_subcategory'),(47,'Can delete sub category',12,'delete_subcategory'),(48,'Can view sub category',12,'view_subcategory'),(49,'Can add product price',13,'add_productprice'),(50,'Can change product price',13,'change_productprice'),(51,'Can delete product price',13,'delete_productprice'),(52,'Can view product price',13,'view_productprice'),(53,'Can add product image',14,'add_productimage'),(54,'Can change product image',14,'change_productimage'),(55,'Can delete product image',14,'delete_productimage'),(56,'Can view product image',14,'view_productimage'),(57,'Can add product field',15,'add_productfield'),(58,'Can change product field',15,'change_productfield'),(59,'Can delete product field',15,'delete_productfield'),(60,'Can view product field',15,'view_productfield');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$zF1EBGWY6j4rD5n0IjSCmi$CHdDN4cvjDG+HyTqTAlWE6+QWC0E+H++Mo4pFhlDawY=','2022-06-28 18:46:50.319783',1,'berzezek','','','',1,1,'2022-06-12 07:26:22.300524');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-06-12 07:33:17.724444','2','Buses',2,'[{\"changed\": {\"fields\": [\"Image\", \"Thumbnail\", \"Webp\"]}}]',9,1),(2,'2022-06-19 18:22:54.497450','7','Cars',3,'',9,1),(3,'2022-06-19 18:22:54.498267','6','Cars',3,'',9,1),(4,'2022-06-19 18:22:54.498720','5','Cars',3,'',9,1),(5,'2022-06-19 18:22:54.499620','4','Bikes',3,'',9,1),(6,'2022-06-19 18:22:54.500010','3','Parts',3,'',9,1),(7,'2022-06-19 18:22:54.500341','2','Buses',3,'',9,1),(8,'2022-06-19 18:22:54.500677','1','Cars',3,'',9,1),(9,'2022-06-19 18:23:27.189817','8','Cars',1,'[{\"added\": {}}]',9,1),(10,'2022-06-19 18:24:14.282550','9','Buses',1,'[{\"added\": {}}]',9,1),(11,'2022-06-19 18:24:33.313459','10','Parts',1,'[{\"added\": {}}]',9,1),(12,'2022-06-19 18:25:16.880074','11','Bikes',1,'[{\"added\": {}}]',9,1),(13,'2022-06-19 18:39:27.031255','4','Audi',1,'[{\"added\": {}}]',12,1),(14,'2022-06-19 18:39:51.072232','4','R8',1,'[{\"added\": {}}]',11,1),(15,'2022-06-19 19:04:24.060597','8','ProductImage object (8)',1,'[{\"added\": {}}]',14,1),(16,'2022-06-19 19:05:55.582386','9','R8 - images/pexels-akbar-nemati-7530997.jpg',1,'[{\"added\": {}}]',14,1),(17,'2022-06-19 19:07:40.329016','4','Audi',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',12,1),(18,'2022-06-19 19:10:08.757246','4','Audi',2,'[]',12,1),(19,'2022-06-19 19:10:33.037880','4','Audi',3,'',12,1),(20,'2022-06-19 19:11:06.796305','5','Audi',1,'[{\"added\": {}}]',12,1),(21,'2022-06-19 19:11:31.802042','5','R8',1,'[{\"added\": {}}]',11,1),(22,'2022-06-19 19:12:41.623559','10','R8 - images/pexels-stephan-louis-7012892.jpg',1,'[{\"added\": {}}]',14,1),(23,'2022-06-19 19:13:02.536401','11','R8 - images/pexels-mike-b-7762717.jpg',1,'[{\"added\": {}}]',14,1),(24,'2022-06-19 19:13:16.117066','12','R8 - images/pexels-akbar-nemati-7530997_3CfzHww.jpg',1,'[{\"added\": {}}]',14,1),(25,'2022-06-19 19:15:34.806750','1','miliage',1,'[{\"added\": {}}]',10,1),(26,'2022-06-19 19:15:56.040202','2','max_speed',1,'[{\"added\": {}}]',10,1),(27,'2022-06-19 19:16:34.168980','3','state',1,'[{\"added\": {}}]',10,1),(28,'2022-06-19 19:16:47.748661','4','color',1,'[{\"added\": {}}]',10,1),(29,'2022-06-19 19:17:14.055461','1','R8 - miliage - 150000',1,'[{\"added\": {}}]',15,1),(30,'2022-06-19 19:17:30.147839','2','R8 - max_speed - 225',1,'[{\"added\": {}}]',15,1),(31,'2022-06-19 19:17:41.672863','3','R8 - state - new',1,'[{\"added\": {}}]',15,1),(32,'2022-06-19 19:17:53.017788','4','R8 - color - white',1,'[{\"added\": {}}]',15,1),(33,'2022-06-20 12:16:13.729496','12','Foo',1,'[{\"added\": {}}]',9,1),(34,'2022-06-20 12:17:33.377268','12','Foo',2,'[{\"changed\": {\"fields\": [\"Thumbnail\", \"Webp\"]}}]',9,1),(35,'2022-06-20 12:18:18.792425','12','Foo',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(36,'2022-06-20 17:06:27.847864','12','Foo',3,'',9,1),(37,'2022-06-20 17:07:05.223141','11','Bikes',2,'[{\"changed\": {\"fields\": [\"Image\", \"Thumbnail\", \"Webp\"]}}]',9,1),(38,'2022-06-28 18:48:14.222270','6','Nissan',1,'[{\"added\": {}}]',11,1),(39,'2022-06-28 18:49:01.652340','13','Nissan - images/photo_2021-10-28_05-01-47.jpg',1,'[{\"added\": {}}]',14,1),(40,'2022-06-28 18:49:36.560645','14','Nissan - images/photo_2021-10-28_05-01-46.jpg',1,'[{\"added\": {}}]',14,1),(41,'2022-06-28 19:27:15.666054','10','R8 - images/pexels-stephan-louis-7012892.jpg',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',14,1),(42,'2022-06-28 19:27:23.634191','11','R8 - images/pexels-mike-b-7762717.jpg',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',14,1),(43,'2022-06-28 19:27:31.690644','12','R8 - images/pexels-akbar-nemati-7530997_3CfzHww.jpg',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',14,1),(44,'2022-06-28 19:27:39.438893','13','Nissan - images/photo_2021-10-28_05-01-47.jpg',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',14,1),(45,'2022-06-28 19:27:47.936659','14','Nissan - images/photo_2021-10-28_05-01-46.jpg',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',14,1),(46,'2022-07-02 05:20:55.316467','10','R8 - images/pexels-stephan-louis-7012892.jpg',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',14,1),(47,'2022-07-02 05:21:03.331887','11','R8 - images/pexels-mike-b-7762717.jpg',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',14,1),(48,'2022-07-02 05:21:10.953103','12','R8 - images/pexels-akbar-nemati-7530997_3CfzHww.jpg',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',14,1),(49,'2022-07-02 05:21:20.213873','13','Nissan - images/photo_2021-10-28_05-01-47.jpg',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',14,1),(50,'2022-07-02 05:21:38.216528','14','Nissan - images/photo_2021-10-28_05-01-46.jpg',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',14,1),(51,'2022-07-02 07:37:16.445609','6','Kia',1,'[{\"added\": {}}]',12,1),(52,'2022-07-02 07:38:59.436629','7','Niro',1,'[{\"added\": {}}]',11,1),(53,'2022-07-02 07:39:59.238391','15','Niro - images/pexels-mike-b-7290410.jpg',1,'[{\"added\": {}}]',14,1),(54,'2022-07-02 07:59:24.782410','16','Niro - images/pexels-mike-b-7290402.jpg',1,'[{\"added\": {}}]',14,1),(55,'2022-07-02 08:00:32.455586','17','Niro - images/pexels-mike-b-7290399.jpg',1,'[{\"added\": {}}]',14,1),(56,'2022-07-02 08:02:56.786957','8','Sorento',1,'[{\"added\": {}}]',11,1),(57,'2022-07-02 08:04:30.658119','18','Sorento - images/pexels-julia-avamotive-8305336.jpg',1,'[{\"added\": {}}]',14,1),(58,'2022-07-02 08:05:16.089411','19','Sorento - images/pexels-hyundai-motor-group-11589799.jpg',1,'[{\"added\": {}}]',14,1),(59,'2022-07-02 08:05:54.857824','20','Sorento - images/pexels-hyundai-motor-group-11320632.jpg',1,'[{\"added\": {}}]',14,1),(60,'2022-07-02 08:08:02.756674','9','Soul',1,'[{\"added\": {}}]',11,1),(61,'2022-07-02 08:09:21.463805','21','Soul - images/pexels-alteredsnaps-12032748.jpg',1,'[{\"added\": {}}]',14,1),(62,'2022-07-02 08:10:43.703151','22','Soul - images/pexels-alteredsnaps-12032746.jpg',1,'[{\"added\": {}}]',14,1),(63,'2022-07-02 08:11:56.985789','23','Soul - images/pexels-alteredsnaps-11816506.jpg',1,'[{\"added\": {}}]',14,1),(64,'2022-07-02 08:15:34.093182','7','BMW',1,'[{\"added\": {}}]',12,1),(65,'2022-07-02 08:16:24.724424','8','Hyndai',1,'[{\"added\": {}}]',12,1),(66,'2022-07-02 08:17:41.294719','9','Nissan',1,'[{\"added\": {}}]',12,1),(67,'2022-07-02 08:18:39.676029','10','Mercedes',1,'[{\"added\": {}}]',12,1),(68,'2022-07-02 08:19:23.642089','10','Moto',1,'[{\"added\": {}}]',11,1),(69,'2022-07-02 08:20:25.051243','24','Moto - images/pexels-suman-choudhury-5774969.jpg',1,'[{\"added\": {}}]',14,1),(70,'2022-07-02 08:21:03.165111','25','Moto - images/pexels-erik-mclean-12072285.jpg',1,'[{\"added\": {}}]',14,1),(71,'2022-07-02 08:21:51.145440','26','Moto - images/pexels-erik-mclean-4077265.jpg',1,'[{\"added\": {}}]',14,1),(72,'2022-07-02 08:22:56.588034','11','Galo',1,'[{\"added\": {}}]',11,1),(73,'2022-07-02 08:25:03.962000','27','Galo - images/pexels-denniz-futalan-5049270.jpg',1,'[{\"added\": {}}]',14,1),(74,'2022-07-02 08:25:50.725632','28','Galo - images/pexels-erik-mclean-4674370.jpg',1,'[{\"added\": {}}]',14,1),(75,'2022-07-02 08:27:13.696741','29','Galo - images/pexels-albin-berlin-905554.jpg',1,'[{\"added\": {}}]',14,1),(76,'2022-07-02 08:28:09.915736','12','Damiak',1,'[{\"added\": {}}]',11,1),(77,'2022-07-02 08:29:10.799085','30','Damiak - images/pexels-jacob-moore-11913285.jpg',1,'[{\"added\": {}}]',14,1),(78,'2022-07-02 08:30:05.736827','31','Damiak - images/pexels-damian-barczak-8310757.jpg',1,'[{\"added\": {}}]',14,1),(79,'2022-07-02 08:30:50.310634','32','Damiak - images/pexels-damian-barczak-8310756.jpg',1,'[{\"added\": {}}]',14,1),(80,'2022-07-02 08:31:34.764980','13','Futura',1,'[{\"added\": {}}]',11,1),(81,'2022-07-02 08:32:29.786518','33','Futura - images/pexels-maria-geller-2127012.jpg',1,'[{\"added\": {}}]',14,1),(82,'2022-07-02 08:33:10.101018','34','Futura - images/pexels-mike-b-1030766.jpg',1,'[{\"added\": {}}]',14,1),(83,'2022-07-02 08:34:04.679945','35','Futura - images/pexels-matt-weissinger-8909235.jpg',1,'[{\"added\": {}}]',14,1),(84,'2022-07-02 08:35:12.860288','36','Futura - images/pexels-spicy-photographer-7387470.jpg',1,'[{\"added\": {}}]',14,1),(85,'2022-07-02 08:35:50.593089','14','X6',1,'[{\"added\": {}}]',11,1),(86,'2022-07-02 08:36:36.860245','37','X6 - images/pexels-alex-kviatkouski-8662677.jpg',1,'[{\"added\": {}}]',14,1),(87,'2022-07-02 08:37:13.111923','38','X6 - images/pexels-jarne-aerts-5976597.jpg',1,'[{\"added\": {}}]',14,1),(88,'2022-07-02 08:38:15.176344','39','X6 - images/pexels-stephan-louis-5431711.jpg',1,'[{\"added\": {}}]',14,1),(89,'2022-07-02 08:39:32.091525','40','X6 - images/pexels-stephan-louis-5431711_wHz1I4W.jpg',1,'[{\"added\": {}}]',14,1),(90,'2022-07-02 08:40:40.221201','41','X6 - images/pexels-piccinng-3923522.jpg',1,'[{\"added\": {}}]',14,1),(91,'2022-07-02 08:42:52.930625','15','Micro',1,'[{\"added\": {}}]',11,1),(92,'2022-07-02 08:43:44.884730','42','Micro - images/pexels-hyundai-motor-group-11159106.jpg',1,'[{\"added\": {}}]',14,1),(93,'2022-07-02 08:45:06.254918','43','Micro - images/pexels-hyundai-motor-group-12261765.jpg',1,'[{\"added\": {}}]',14,1),(94,'2022-07-02 08:46:00.721556','44','Micro - images/pexels-louis-de-gonzague-kubwimana-9521979.jpg',1,'[{\"added\": {}}]',14,1),(95,'2022-07-02 08:47:14.576495','16','Spectra',1,'[{\"added\": {}}]',11,1),(96,'2022-07-02 08:48:16.539239','45','Spectra - images/pexels-kelvin-linhares-6761169.jpg',1,'[{\"added\": {}}]',14,1),(97,'2022-07-02 08:49:33.626929','46','Spectra - images/pexels-juan-mendez-11493468.jpg',1,'[{\"added\": {}}]',14,1),(98,'2022-07-02 08:51:10.469330','47','Spectra - images/pexels-juan-mendez-9495714.jpg',1,'[{\"added\": {}}]',14,1),(99,'2022-07-02 08:51:57.876155','17','Gelentwagen',1,'[{\"added\": {}}]',11,1),(100,'2022-07-02 08:53:04.839212','48','Gelentwagen - images/pexels-lloyd-freeman-1429775.jpg',1,'[{\"added\": {}}]',14,1),(101,'2022-07-02 08:53:44.656481','49','Gelentwagen - images/pexels-jan-rechenberg-2464748.jpg',1,'[{\"added\": {}}]',14,1),(102,'2022-07-02 08:55:06.322541','50','Gelentwagen - images/pexels-jae-park-4149331.jpg',1,'[{\"added\": {}}]',14,1),(103,'2022-07-02 08:55:33.417109','18','SLC 300',1,'[{\"added\": {}}]',11,1),(104,'2022-07-02 08:56:15.058175','51','SLC 300 - images/pexels-mike-b-5212752.jpg',1,'[{\"added\": {}}]',14,1),(105,'2022-07-02 08:56:56.722197','52','SLC 300 - images/pexels-mike-b-195631.jpg',1,'[{\"added\": {}}]',14,1),(106,'2022-07-02 08:57:52.007336','53','SLC 300 - images/pexels-mike-b-195631_IMVPOZs.jpg',1,'[{\"added\": {}}]',14,1),(107,'2022-07-02 08:58:38.889830','54','SLC 300 - images/pexels-mike-b-193999.jpg',1,'[{\"added\": {}}]',14,1),(108,'2022-07-02 08:59:31.246703','55','SLC 300 - images/pexels-mike-b-136872.jpg',1,'[{\"added\": {}}]',14,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'authtoken','token'),(8,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(9,'ecommerce','category'),(10,'ecommerce','categoryfield'),(11,'ecommerce','product'),(15,'ecommerce','productfield'),(14,'ecommerce','productimage'),(13,'ecommerce','productprice'),(12,'ecommerce','subcategory'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-06-11 20:52:08.693136'),(2,'auth','0001_initial','2022-06-11 20:52:16.611320'),(3,'admin','0001_initial','2022-06-11 20:52:18.550440'),(4,'admin','0002_logentry_remove_auto_add','2022-06-11 20:52:18.558684'),(5,'admin','0003_logentry_add_action_flag_choices','2022-06-11 20:52:18.565949'),(6,'contenttypes','0002_remove_content_type_name','2022-06-11 20:52:18.607650'),(7,'auth','0002_alter_permission_name_max_length','2022-06-11 20:52:18.627030'),(8,'auth','0003_alter_user_email_max_length','2022-06-11 20:52:18.637552'),(9,'auth','0004_alter_user_username_opts','2022-06-11 20:52:18.644352'),(10,'auth','0005_alter_user_last_login_null','2022-06-11 20:52:18.665273'),(11,'auth','0006_require_contenttypes_0002','2022-06-11 20:52:18.667337'),(12,'auth','0007_alter_validators_add_error_messages','2022-06-11 20:52:18.674121'),(13,'auth','0008_alter_user_username_max_length','2022-06-11 20:52:18.691085'),(14,'auth','0009_alter_user_last_name_max_length','2022-06-11 20:52:18.708230'),(15,'auth','0010_alter_group_name_max_length','2022-06-11 20:52:18.717133'),(16,'auth','0011_update_proxy_permissions','2022-06-11 20:52:18.723363'),(17,'auth','0012_alter_user_first_name_max_length','2022-06-11 20:52:18.741357'),(18,'authtoken','0001_initial','2022-06-11 20:52:19.513659'),(19,'authtoken','0002_auto_20160226_1747','2022-06-11 20:52:19.533743'),(20,'authtoken','0003_tokenproxy','2022-06-11 20:52:19.535892'),(21,'ecommerce','0001_initial','2022-06-11 20:52:27.426556'),(22,'ecommerce','0002_category_is_available_category_webp_and_more','2022-06-11 20:52:29.118778'),(23,'sessions','0001_initial','2022-06-11 20:52:29.850520');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0xqqudqxxjpfku8jmg0dltrati7c5ecf','.eJxVjMsOwiAQRf-FtSG8KS7d-w1kBgapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKc2ZlJdvrdENKD2g7yHdqt89TbuszId4UfdPBrz_S8HO7fQYVRv7XyZKwLQmRS1pigXZYF0HrwWIxVZHBSDiRQMjIhpiBs1gW0UDQRInt_ANevOE4:1o6GEc:z3boojVEcGcBpd_ty1ILMIf3XPRI5fZMbnIoY1ETgvg','2022-07-12 18:46:50.321653'),('70up0eukx0akfbwyhp7tjcwew3pd0tuq','.eJxVjMsOwiAQRf-FtSG8KS7d-w1kBgapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKc2ZlJdvrdENKD2g7yHdqt89TbuszId4UfdPBrz_S8HO7fQYVRv7XyZKwLQmRS1pigXZYF0HrwWIxVZHBSDiRQMjIhpiBs1gW0UDQRInt_ANevOE4:1o0HzQ:ICuX6_Uy9V_uqf4WG2raMmA4R3m-nW8Aop-HWEZa1wQ','2022-06-26 07:26:28.588734'),('e026e0r8cgfhw7sj2jviug2vro5o9vif','.eJxVjMsOwiAQRf-FtSG8KS7d-w1kBgapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKc2ZlJdvrdENKD2g7yHdqt89TbuszId4UfdPBrz_S8HO7fQYVRv7XyZKwLQmRS1pigXZYF0HrwWIxVZHBSDiRQMjIhpiBs1gW0UDQRInt_ANevOE4:1o3GII:HJlqom6yEtD3wraAAfKwIGap-vVvcvaT7KwzGCv2tTc','2022-07-04 12:14:14.853672');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_category`
--

DROP TABLE IF EXISTS `ecommerce_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecommerce_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `image` varchar(100) NOT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL,
  `webp` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_category`
--

LOCK TABLES `ecommerce_category` WRITE;
/*!40000 ALTER TABLE `ecommerce_category` DISABLE KEYS */;
INSERT INTO `ecommerce_category` VALUES (8,'Cars','','images/bg_lamo.jpg','images/images/bg_lamo.jpg',1,'images/images/bg_lamo.webp'),(9,'Buses','','images/buses_new.jpg','images/images/buses_new.jpg',1,'images/images/buses_new.webp'),(10,'Parts','','images/parts.jpg','images/images/parts.jpg',1,'images/images/parts.webp'),(11,'Bikes','','images/main.jpg','images/images/main.jpg',1,'images/images/main.webp');
/*!40000 ALTER TABLE `ecommerce_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_categoryfield`
--

DROP TABLE IF EXISTS `ecommerce_categoryfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecommerce_categoryfield` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_categoryfi_category_id_1cd6141f_fk_ecommerce` (`category_id`),
  CONSTRAINT `ecommerce_categoryfi_category_id_1cd6141f_fk_ecommerce` FOREIGN KEY (`category_id`) REFERENCES `ecommerce_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_categoryfield`
--

LOCK TABLES `ecommerce_categoryfield` WRITE;
/*!40000 ALTER TABLE `ecommerce_categoryfield` DISABLE KEYS */;
INSERT INTO `ecommerce_categoryfield` VALUES (1,'miliage','km',8),(2,'max_speed','km/h',8),(3,'state',NULL,8),(4,'color',NULL,8);
/*!40000 ALTER TABLE `ecommerce_categoryfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_product`
--

DROP TABLE IF EXISTS `ecommerce_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecommerce_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `price_in_USD` decimal(10,2) NOT NULL,
  `subcategory_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `sold_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_product_subcategory_id_9a98383c_fk_ecommerce` (`subcategory_id`),
  CONSTRAINT `ecommerce_product_subcategory_id_9a98383c_fk_ecommerce` FOREIGN KEY (`subcategory_id`) REFERENCES `ecommerce_subcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_product`
--

LOCK TABLES `ecommerce_product` WRITE;
/*!40000 ALTER TABLE `ecommerce_product` DISABLE KEYS */;
INSERT INTO `ecommerce_product` VALUES (5,'R8','',15000.00,5,'2022-06-19 19:11:31.800528',1,NULL),(6,'Nissan','',25000.00,5,'2022-06-28 18:48:14.220693',1,NULL),(7,'Niro','',7800.00,6,'2022-07-02 07:38:59.435077',1,NULL),(8,'Sorento','',8400.00,6,'2022-07-02 08:02:56.785348',1,NULL),(9,'Soul','',6500.00,6,'2022-07-02 08:08:02.754411',1,NULL),(10,'Moto','',14800.00,8,'2022-07-02 08:19:23.640288',1,NULL),(11,'Galo','',6950.00,9,'2022-07-02 08:22:56.586126',1,NULL),(12,'Damiak','',24000.00,9,'2022-07-02 08:28:09.913915',1,NULL),(13,'Futura','',38000.00,7,'2022-07-02 08:31:34.763123',1,NULL),(14,'X6','',38000.00,7,'2022-07-02 08:35:50.591239',1,NULL),(15,'Micro','',8650.00,9,'2022-07-02 08:42:52.928919',1,NULL),(16,'Spectra','',11400.00,8,'2022-07-02 08:47:14.574880',1,NULL),(17,'Gelentwagen','',19800.00,10,'2022-07-02 08:51:57.874617',1,NULL),(18,'SLC 300','',32000.00,10,'2022-07-02 08:55:33.415384',1,NULL);
/*!40000 ALTER TABLE `ecommerce_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_productfield`
--

DROP TABLE IF EXISTS `ecommerce_productfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecommerce_productfield` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  `category_field_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_productfie_category_field_id_acf41236_fk_ecommerce` (`category_field_id`),
  KEY `ecommerce_productfield_product_id_c7265566` (`product_id`),
  CONSTRAINT `ecommerce_productfie_category_field_id_acf41236_fk_ecommerce` FOREIGN KEY (`category_field_id`) REFERENCES `ecommerce_categoryfield` (`id`),
  CONSTRAINT `ecommerce_productfie_product_id_c7265566_fk_ecommerce` FOREIGN KEY (`product_id`) REFERENCES `ecommerce_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_productfield`
--

LOCK TABLES `ecommerce_productfield` WRITE;
/*!40000 ALTER TABLE `ecommerce_productfield` DISABLE KEYS */;
INSERT INTO `ecommerce_productfield` VALUES (1,'150000',1,5),(2,'225',2,5),(3,'new',3,5),(4,'white',4,5);
/*!40000 ALTER TABLE `ecommerce_productfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_productimage`
--

DROP TABLE IF EXISTS `ecommerce_productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecommerce_productimage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_productima_product_id_fb355be3_fk_ecommerce` (`product_id`),
  CONSTRAINT `ecommerce_productima_product_id_fb355be3_fk_ecommerce` FOREIGN KEY (`product_id`) REFERENCES `ecommerce_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_productimage`
--

LOCK TABLES `ecommerce_productimage` WRITE;
/*!40000 ALTER TABLE `ecommerce_productimage` DISABLE KEYS */;
INSERT INTO `ecommerce_productimage` VALUES (10,'images/pexels-stephan-louis-7012892.jpg','images/images/pexels-stephan-louis-7012892.webp',5),(11,'images/pexels-mike-b-7762717.jpg','images/images/pexels-mike-b-7762717.webp',5),(12,'images/pexels-akbar-nemati-7530997_3CfzHww.jpg','images/images/pexels-akbar-nemati-7530997_3CfzHww.webp',5),(13,'images/photo_2021-10-28_05-01-47.jpg','images/images/photo_2021-10-28_05-01-47.webp',6),(14,'images/photo_2021-10-28_05-01-46.jpg','images/images/photo_2021-10-28_05-01-46.webp',6),(15,'images/pexels-mike-b-7290410.jpg','images/images/pexels-mike-b-7290410.webp',7),(16,'images/pexels-mike-b-7290402.jpg','images/images/pexels-mike-b-7290402.webp',7),(17,'images/pexels-mike-b-7290399.jpg','images/images/pexels-mike-b-7290399.webp',7),(18,'images/pexels-julia-avamotive-8305336.jpg','images/images/pexels-julia-avamotive-8305336.webp',8),(19,'images/pexels-hyundai-motor-group-11589799.jpg','images/images/pexels-hyundai-motor-group-11589799.webp',8),(20,'images/pexels-hyundai-motor-group-11320632.jpg','images/images/pexels-hyundai-motor-group-11320632.webp',8),(21,'images/pexels-alteredsnaps-12032748.jpg','images/images/pexels-alteredsnaps-12032748.webp',9),(22,'images/pexels-alteredsnaps-12032746.jpg','images/images/pexels-alteredsnaps-12032746.webp',9),(23,'images/pexels-alteredsnaps-11816506.jpg','images/images/pexels-alteredsnaps-11816506.webp',9),(24,'images/pexels-suman-choudhury-5774969.jpg','images/images/pexels-suman-choudhury-5774969.webp',10),(25,'images/pexels-erik-mclean-12072285.jpg','images/images/pexels-erik-mclean-12072285.webp',10),(26,'images/pexels-erik-mclean-4077265.jpg','images/images/pexels-erik-mclean-4077265.webp',10),(27,'images/pexels-denniz-futalan-5049270.jpg','images/images/pexels-denniz-futalan-5049270.webp',11),(28,'images/pexels-erik-mclean-4674370.jpg','images/images/pexels-erik-mclean-4674370.webp',11),(29,'images/pexels-albin-berlin-905554.jpg','images/images/pexels-albin-berlin-905554.webp',11),(30,'images/pexels-jacob-moore-11913285.jpg','images/images/pexels-jacob-moore-11913285.webp',12),(31,'images/pexels-damian-barczak-8310757.jpg','images/images/pexels-damian-barczak-8310757.webp',12),(32,'images/pexels-damian-barczak-8310756.jpg','images/images/pexels-damian-barczak-8310756.webp',12),(33,'images/pexels-maria-geller-2127012.jpg','images/images/pexels-maria-geller-2127012.webp',13),(34,'images/pexels-mike-b-1030766.jpg','images/images/pexels-mike-b-1030766.webp',13),(35,'images/pexels-matt-weissinger-8909235.jpg','images/images/pexels-matt-weissinger-8909235.webp',13),(36,'images/pexels-spicy-photographer-7387470.jpg','images/images/pexels-spicy-photographer-7387470.webp',13),(37,'images/pexels-alex-kviatkouski-8662677.jpg','images/images/pexels-alex-kviatkouski-8662677.webp',14),(38,'images/pexels-jarne-aerts-5976597.jpg','images/images/pexels-jarne-aerts-5976597.webp',14),(39,'images/pexels-stephan-louis-5431711.jpg','images/images/pexels-stephan-louis-5431711.webp',14),(40,'images/pexels-stephan-louis-5431711_wHz1I4W.jpg','images/images/pexels-stephan-louis-5431711_wHz1I4W.webp',14),(41,'images/pexels-piccinng-3923522.jpg','images/images/pexels-piccinng-3923522.webp',14),(42,'images/pexels-hyundai-motor-group-11159106.jpg','images/images/pexels-hyundai-motor-group-11159106.webp',15),(43,'images/pexels-hyundai-motor-group-12261765.jpg','images/images/pexels-hyundai-motor-group-12261765.webp',15),(44,'images/pexels-louis-de-gonzague-kubwimana-9521979.jpg','images/images/pexels-louis-de-gonzague-kubwimana-9521979.webp',15),(45,'images/pexels-kelvin-linhares-6761169.jpg','images/images/pexels-kelvin-linhares-6761169.webp',16),(46,'images/pexels-juan-mendez-11493468.jpg','images/images/pexels-juan-mendez-11493468.webp',16),(47,'images/pexels-juan-mendez-9495714.jpg','images/images/pexels-juan-mendez-9495714.webp',16),(48,'images/pexels-lloyd-freeman-1429775.jpg','images/images/pexels-lloyd-freeman-1429775.webp',17),(49,'images/pexels-jan-rechenberg-2464748.jpg','images/images/pexels-jan-rechenberg-2464748.webp',17),(50,'images/pexels-jae-park-4149331.jpg','images/images/pexels-jae-park-4149331.webp',17),(51,'images/pexels-mike-b-5212752.jpg','images/images/pexels-mike-b-5212752.webp',18),(52,'images/pexels-mike-b-195631.jpg','images/images/pexels-mike-b-195631.webp',18),(53,'images/pexels-mike-b-195631_IMVPOZs.jpg','images/images/pexels-mike-b-195631_IMVPOZs.webp',18),(54,'images/pexels-mike-b-193999.jpg','images/images/pexels-mike-b-193999.webp',18),(55,'images/pexels-mike-b-136872.jpg','images/images/pexels-mike-b-136872.webp',18);
/*!40000 ALTER TABLE `ecommerce_productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_productprice`
--

DROP TABLE IF EXISTS `ecommerce_productprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecommerce_productprice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency` varchar(100) NOT NULL,
  `currency_rate` decimal(10,2) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`),
  CONSTRAINT `ecommerce_productpri_product_id_32e571a6_fk_ecommerce` FOREIGN KEY (`product_id`) REFERENCES `ecommerce_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_productprice`
--

LOCK TABLES `ecommerce_productprice` WRITE;
/*!40000 ALTER TABLE `ecommerce_productprice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_productprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_subcategory`
--

DROP TABLE IF EXISTS `ecommerce_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecommerce_subcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `image` varchar(100) NOT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_subcategor_category_id_c79fda85_fk_ecommerce` (`category_id`),
  CONSTRAINT `ecommerce_subcategor_category_id_c79fda85_fk_ecommerce` FOREIGN KEY (`category_id`) REFERENCES `ecommerce_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_subcategory`
--

LOCK TABLES `ecommerce_subcategory` WRITE;
/*!40000 ALTER TABLE `ecommerce_subcategory` DISABLE KEYS */;
INSERT INTO `ecommerce_subcategory` VALUES (5,'Audi','','images/pexels-vlad-alexandru-popa-1402787_7ewXAxS.jpg','images/images/pexels-vlad-alexandru-popa-1402787_7ewXAxS.jpg',8),(6,'Kia','','images/Kia.jpg','images/images/Kia.webp',8),(7,'BMW','','images/BMW.jpg','images/images/BMW.webp',8),(8,'Hyndai','','images/Hyndai.jpg','images/images/Hyndai.webp',8),(9,'Nissan','','images/Nissan.jpg','images/images/Nissan.webp',8),(10,'Mercedes','','images/Mercedes.jpg','images/images/Mercedes.webp',8);
/*!40000 ALTER TABLE `ecommerce_subcategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-02 11:04:37
