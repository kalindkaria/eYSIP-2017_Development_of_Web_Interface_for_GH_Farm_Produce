-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: ghfarm
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add cart',7,'add_cart'),(20,'Can change cart',7,'change_cart'),(21,'Can delete cart',7,'delete_cart'),(22,'Can add order',8,'add_order'),(23,'Can change order',8,'change_order'),(24,'Can delete order',8,'delete_order'),(25,'Can add produce',9,'add_produce'),(26,'Can change produce',9,'change_produce'),(27,'Can delete produce',9,'delete_produce'),(28,'Can add producer',10,'add_producer'),(29,'Can change producer',10,'change_producer'),(30,'Can delete producer',10,'delete_producer'),(31,'Can add machine',11,'add_machine'),(32,'Can change machine',11,'change_machine'),(33,'Can delete machine',11,'delete_machine'),(34,'Can add user',12,'add_user'),(35,'Can change user',12,'change_user'),(36,'Can delete user',12,'delete_user'),(37,'Can add trough',13,'add_trough'),(38,'Can change trough',13,'change_trough'),(39,'Can delete trough',13,'delete_trough'),(40,'Can add crop',14,'add_crop'),(41,'Can change crop',14,'change_crop'),(42,'Can delete crop',14,'delete_crop'),(43,'Can add inventory',15,'add_inventory'),(44,'Can change inventory',15,'change_inventory'),(45,'Can delete inventory',15,'delete_inventory'),(46,'Can add cart_session',16,'add_cart_session'),(47,'Can change cart_session',16,'change_cart_session'),(48,'Can delete cart_session',16,'delete_cart_session');
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
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$9FZpMkQsQXQA$YjuFel1LiAh7eNdhgTgXSR5+dvwluUL2lWtm/Vvwhhg=','2017-06-13 08:31:48.926971',1,'keivan','Keivan','Shah','keivanshahh@gmail.com',1,1,'2017-06-02 11:29:55.000000'),(2,'pbkdf2_sha256$36000$mzznPbAdh8Wo$xue2TEyxD7+ftkue5I8/LZv7lvBj/CHINUWgoZjLRBk=',NULL,1,'hemang','Hemang','Gandhi','gandhihemang97@gmail.com',1,1,'2017-06-13 07:18:44.000000'),(3,'pbkdf2_sha256$36000$EcZ8h9N7kcMz$zy45qBhuHZxT4Lnzp3+28Idsyz916RAW6JKNVkoaGMI=',NULL,1,'sanket','Sanket','Shanbhag','sanketshanbhag@gmail.com',1,1,'2017-06-13 07:19:08.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'farmapp','cart'),(16,'farmapp','cart_session'),(14,'farmapp','crop'),(15,'farmapp','inventory'),(11,'farmapp','machine'),(8,'farmapp','order'),(9,'farmapp','produce'),(10,'farmapp','producer'),(13,'farmapp','trough'),(12,'farmapp','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'farm','0001_initial','2017-05-30 10:01:02.963687'),(2,'contenttypes','0001_initial','2017-05-31 05:13:49.555143'),(3,'auth','0001_initial','2017-05-31 05:13:56.890595'),(4,'admin','0001_initial','2017-05-31 05:13:58.513280'),(5,'admin','0002_logentry_remove_auto_add','2017-05-31 05:13:58.634160'),(6,'contenttypes','0002_remove_content_type_name','2017-05-31 05:13:59.632479'),(7,'auth','0002_alter_permission_name_max_length','2017-05-31 05:13:59.744892'),(8,'auth','0003_alter_user_email_max_length','2017-05-31 05:13:59.867378'),(9,'auth','0004_alter_user_username_opts','2017-05-31 05:13:59.924420'),(10,'auth','0005_alter_user_last_login_null','2017-05-31 05:14:00.434010'),(11,'auth','0006_require_contenttypes_0002','2017-05-31 05:14:00.478645'),(12,'auth','0007_alter_validators_add_error_messages','2017-05-31 05:14:00.537815'),(13,'auth','0008_alter_user_username_max_length','2017-05-31 05:14:00.909947'),(14,'farmapp','0001_initial','2017-05-31 05:14:14.382672'),(15,'sessions','0001_initial','2017-05-31 05:14:14.924702'),(16,'farmapp','0002_auto_20170604_1137','2017-06-04 17:10:55.690374'),(17,'farmapp','0003_auto_20170605_1930','2017-06-05 14:01:06.600454'),(18,'farmapp','0004_crop_imagepath','2017-06-05 14:03:28.658675'),(19,'farmapp','0005_auto_20170607_1313','2017-06-12 07:10:24.006452'),(20,'farmapp','0006_crop_availabilty','2017-06-12 07:10:25.084966'),(21,'farmapp','0007_auto_20170607_1612','2017-06-12 07:10:25.262608'),(22,'farmapp','0008_auto_20170608_1530','2017-06-12 07:10:25.563715'),(23,'farmapp','0009_auto_20170612_1512','2017-06-12 09:44:40.205132'),(24,'farmapp','0010_auto_20170612_1543','2017-06-13 09:56:31.440437'),(25,'farmapp','0011_auto_20170613_1016','2017-06-13 09:56:36.149891'),(26,'farmapp','0012_auto_20170613_1019','2017-06-13 09:56:37.734650'),(27,'farmapp','0013_auto_20170613_1026','2017-06-13 09:56:40.687904');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9q3ovxzurflbcuyt7qbodjq43tfgebol','NGM0MDg1MWQ0YjEyNzZlYzM3MGYwOWZkOGQ3MGE0MjdkYzkyMmUyNDp7ImVtYWlsIjoia2VpdmFuQGdtYWlsLmNvbSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiY2FydF9pZCI6MSwiX2F1dGhfdXNlcl9oYXNoIjoiZmJiYTE0YzBhYTE2MTA0ZTE1ZDc5YjNlZTBiODA5ZTBhZmFiMzI4OCIsInBhZ2UiOiIvYWJvdXQiLCJsb2dnZWRfaW4iOnRydWUsImNhcnRfY291bnQiOjIsInVzZXJfdHlwZSI6IkNvbnN1bWVyIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJ1c2VyX2lkIjoxfQ==','2017-06-27 10:19:38.707972'),('qy5mnizf5l4ddg6dyp0frefd29an6pf3','MmJjNzUzMGNkMjY1MjdhNDJjNGFhZDM4NjE1NDlmZWE2NGFkNWQzYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwibG9nZ2VkX2luIjp0cnVlLCJfYXV0aF91c2VyX2hhc2giOiJmYmJhMTRjMGFhMTYxMDRlMTVkNzliM2VlMGI4MDllMGFmYWIzMjg4IiwidXNlcl9pZCI6MiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJlbWFpbCI6ImhlbWFuZ0BnbWFpbC5jb20iLCJ1c2VyX3R5cGUiOiJQcm9kdWNlciJ9','2017-06-26 08:46:05.844144'),('w3t361qlrmvomi5i9166wjmzclufgl9g','ZmI0ZjljN2FmY2M5ZjBiMTk2MWI1NzQ3ODM0MDk0ODNhYzU2YzVkYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZmJiYTE0YzBhYTE2MTA0ZTE1ZDc5YjNlZTBiODA5ZTBhZmFiMzI4OCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-06-20 11:31:10.702269'),('xwc8fpolvyuz99h4aq6bodnpb9cmv3cg','YzY4YjNhYjUwMzk5ZmQ4MmIxYWQ2MTg3NjBlZjRlMjIyOTMyMmM0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiYmExNGMwYWExNjEwNGUxNWQ3OWIzZWUwYjgwOWUwYWZhYjMyODgiLCJ1c2VyX3R5cGUiOiJQcm9kdWNlciIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiZW1haWwiOiJoZW1hbmdAZ21haWwuY29tIiwidXNlcl9pZCI6MiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJsb2dnZWRfaW4iOnRydWV9','2017-06-27 06:34:38.791471');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmapp_cart`
--

DROP TABLE IF EXISTS `farmapp_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmapp_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_cart`
--

LOCK TABLES `farmapp_cart` WRITE;
/*!40000 ALTER TABLE `farmapp_cart` DISABLE KEYS */;
INSERT INTO `farmapp_cart` VALUES (1);
/*!40000 ALTER TABLE `farmapp_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmapp_cart_session`
--

DROP TABLE IF EXISTS `farmapp_cart_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmapp_cart_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime(6) NOT NULL,
  `cart_id_id` int(11) NOT NULL,
  `crop_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `farmapp_cart_session_cart_id_id_4dabe9fb_fk_farmapp_cart_cart_id` (`cart_id_id`),
  KEY `farmapp_cart_session_crop_id_id_e003bfe0_fk_farmapp_crop_crop_id` (`crop_id_id`),
  CONSTRAINT `farmapp_cart_session_cart_id_id_4dabe9fb_fk_farmapp_cart_cart_id` FOREIGN KEY (`cart_id_id`) REFERENCES `farmapp_cart` (`cart_id`),
  CONSTRAINT `farmapp_cart_session_crop_id_id_e003bfe0_fk_farmapp_crop_crop_id` FOREIGN KEY (`crop_id_id`) REFERENCES `farmapp_crop` (`crop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_cart_session`
--

LOCK TABLES `farmapp_cart_session` WRITE;
/*!40000 ALTER TABLE `farmapp_cart_session` DISABLE KEYS */;
INSERT INTO `farmapp_cart_session` VALUES (6,'2017-06-13 10:06:48.086043',1,30),(7,'2017-06-13 10:06:48.086043',1,17);
/*!40000 ALTER TABLE `farmapp_cart_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmapp_crop`
--

DROP TABLE IF EXISTS `farmapp_crop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmapp_crop` (
  `crop_id` int(11) NOT NULL AUTO_INCREMENT,
  `local_name` varchar(100) DEFAULT NULL,
  `english_name` varchar(100) DEFAULT NULL,
  `scientific_name` varchar(100) DEFAULT NULL,
  `shelf_life` double NOT NULL,
  `price` double NOT NULL,
  `imagepath` varchar(100) DEFAULT NULL,
  `availability` double NOT NULL,
  `short_name` varchar(11) NOT NULL,
  PRIMARY KEY (`crop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_crop`
--

LOCK TABLES `farmapp_crop` WRITE;
/*!40000 ALTER TABLE `farmapp_crop` DISABLE KEYS */;
INSERT INTO `farmapp_crop` VALUES (1,'Amaranthus Green','Amaranthus Green','Amaranthus viridis',48,120,'crops/amaranthus_green.jpg',0,'AmaranthusG'),(2,'Amaranthus Red','Amaranthus Red','Amaranthus cruentus',44,90,'crops/amaranthus_red.jpg',0,'AmaranthusR'),(3,'Methi','Baby Fenugreek','Trigonella foenum-graecum',48,24,'crops/baby_fenugreek.jpg',0,'BFenugreek'),(4,'Tulsi','Basil','Ocimum basilicum',40,200,'crops/basil.jpeg',0,'Basil'),(5,'Chukandar','Beetroot','Beta vulgaris',120,200,'crops/beetroot.jpg',470,'Beetroot'),(6,'Karela','Bitter Gourd','Momordica charantia',120,70,'crops/bitter_gourd.jpg',0,'BitterGourd'),(7,'Lauki','Bottle Gourd','Lagenaria siceraria',200,90,'crops/bottle_gourd.jpeg',0,'BottleGourd'),(8,'Baingan','Brinjal','Solanum melongena',72,60,'crops/brinjal.jpg',0,'Brinjal'),(9,'Gobhee','Cabbage','Brassica oleracea var. capitata',120,24,'crops/cabbage.jpeg',0,'Cabbage'),(10,'Gobhee','Cauliflower','Brassica oleracea var. botrytis',120,80,'crops/cauliflower.jpeg',0,'Cauliflower'),(11,'Mirch','Chilli','Capsicum frutescens',320,40,'crops/chilly.jpeg',0,'Chilli'),(12,'Gavar','Cluster Beans','Cyamopsis tetragonoloba',48,50,'crops/cluster_bean.jpg',0,'ClusterBean'),(13,'Dhaniya','Coriander','Coriandrum sativum',75,20,'crops/coriander.jpg',0,'Coriander'),(14,'Kheera','Cucumber','Cucumis sativus',72,60,'crops/cucumber.jpg',0,'Cucumber'),(15,'Methi','Fenugreek','Trigonella foenum-graecum',70,60,'crops/fenugreek.jpeg',0,'Fenugreek'),(16,'Himashail Sabjee','Iceberg Lettuce','Lactuca sativa',96,67,'crops/iceberg_lettuce.jpeg',0,'Ice Lettuce'),(17,'Bhindi','Ladyfinger','Abelmoschus esculentus',96,60,'crops/ladyfinger.jpeg',679,'Ladyfinger'),(18,'Lemon Grass','Lemon Grass','Cymbopogon',24,100,'crops/lemongrass.jpg',0,'Lemon Grass'),(19,'Lollo Rosso','Lollo Rosso','Lactuca sativa',100,300,'crops/lollo_rosso.jpg',0,'Lollo Rosso'),(20,'Makka','Maize','Zea mays',48,40,'crops/maize.jpg',0,'Maize'),(21,'Sarason','Mustard','Brassica',48,80,'crops/mustard.jpg',0,'Mustard'),(22,'Pyaaj','Onion','Allium cepa',96,50,'crops/onion.jpg',0,'Onion'),(23,'Ajamod','Parsley','Petroselinum crispum',96,70,'crops/parsley.jpg',0,'Parsley'),(24,'Moolee','Radish','Raphanus raphanistrum subsp. sativus',72,70,'crops/radish.jpeg',0,'Radish'),(25,'Turai','Ridge Gourd','Luffa',72,120,'crops/ridge_gourd.jpg',0,'Ridge Gourd'),(26,'Padval','Snake Gourd','Trichosanthes cucumerina',72,40,'crops/snake_gourd.jpg',0,'Snake Gourd'),(27,'Palak','Spinach','Spinacia oleracea',24,90,'crops/spinach.jpeg',0,'Spinach'),(28,'Haldi Paan','Termari Leaf','Curcuma longa',72,200,'crops/termari_leaf.jpg',0,'TurmericL'),(29,'Haldi','Turmeric','Curcuma longa',960,300,'crops/turmeric.jpg',0,'Turmeric'),(30,'Tamaatar','Tomato','Solanum lycopersicum',72,40,'crops/tomato.jpg',7988,'Tomato');
/*!40000 ALTER TABLE `farmapp_crop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmapp_inventory`
--

DROP TABLE IF EXISTS `farmapp_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmapp_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weight` double NOT NULL,
  `crop_id_id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  `maximum` double NOT NULL,
  `minimum` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `farmapp_inventory_crop_id_id_796a261e_fk_farmapp_crop_crop_id` (`crop_id_id`),
  KEY `farmapp_inventory_user_id_id_bda51212_fk_farmapp_user_user_id` (`user_id_id`),
  CONSTRAINT `farmapp_inventory_crop_id_id_796a261e_fk_farmapp_crop_crop_id` FOREIGN KEY (`crop_id_id`) REFERENCES `farmapp_crop` (`crop_id`),
  CONSTRAINT `farmapp_inventory_user_id_id_bda51212_fk_farmapp_user_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `farmapp_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_inventory`
--

LOCK TABLES `farmapp_inventory` WRITE;
/*!40000 ALTER TABLE `farmapp_inventory` DISABLE KEYS */;
INSERT INTO `farmapp_inventory` VALUES (23,1070,17,2,0,0),(24,291,13,2,0,0),(25,7988,30,2,0,0),(26,470,5,2,0,0);
/*!40000 ALTER TABLE `farmapp_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmapp_machine`
--

DROP TABLE IF EXISTS `farmapp_machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmapp_machine` (
  `machine_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(20) NOT NULL,
  `location` varchar(255) NOT NULL,
  `date_of_manufacture` datetime(6) NOT NULL,
  `version` varchar(20) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`machine_id`),
  KEY `farmapp_machine_user_id_id_3e6c5fdf_fk_farmapp_user_user_id` (`user_id_id`),
  CONSTRAINT `farmapp_machine_user_id_id_3e6c5fdf_fk_farmapp_user_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `farmapp_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_machine`
--

LOCK TABLES `farmapp_machine` WRITE;
/*!40000 ALTER TABLE `farmapp_machine` DISABLE KEYS */;
INSERT INTO `farmapp_machine` VALUES (1,'random','IIT B GH','2017-06-06 04:15:00.000000','1.0','2017-06-06 04:15:07.000000',2),(2,'random','ERTS LAB','2017-06-06 04:15:34.000000','1.0','2017-06-06 04:15:40.000000',2);
/*!40000 ALTER TABLE `farmapp_machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmapp_order`
--

DROP TABLE IF EXISTS `farmapp_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmapp_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_date` datetime(6) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  `crop_id_id` int(11) NOT NULL,
  `weight` double NOT NULL,
  `cart_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `farmapp_order_seller_id_5b7e2bce_fk_farmapp_user_user_id` (`seller_id`),
  KEY `farmapp_order_user_id_id_8205f9ff_fk_farmapp_user_user_id` (`user_id_id`),
  KEY `farmapp_order_crop_id_id_81eaee8e_fk_farmapp_crop_crop_id` (`crop_id_id`),
  KEY `farmapp_order_cart_id_id_cb534eca_fk_farmapp_cart_session_id` (`cart_id_id`),
  CONSTRAINT `farmapp_order_cart_id_id_cb534eca_fk_farmapp_cart_session_id` FOREIGN KEY (`cart_id_id`) REFERENCES `farmapp_cart_session` (`id`),
  CONSTRAINT `farmapp_order_crop_id_id_81eaee8e_fk_farmapp_crop_crop_id` FOREIGN KEY (`crop_id_id`) REFERENCES `farmapp_crop` (`crop_id`),
  CONSTRAINT `farmapp_order_seller_id_5b7e2bce_fk_farmapp_user_user_id` FOREIGN KEY (`seller_id`) REFERENCES `farmapp_user` (`user_id`),
  CONSTRAINT `farmapp_order_user_id_id_8205f9ff_fk_farmapp_user_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `farmapp_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_order`
--

LOCK TABLES `farmapp_order` WRITE;
/*!40000 ALTER TABLE `farmapp_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `farmapp_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmapp_produce`
--

DROP TABLE IF EXISTS `farmapp_produce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmapp_produce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `weight` double NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `date_of_produce` datetime(6) NOT NULL,
  `date_of_expiry` datetime(6) NOT NULL,
  `status` double NOT NULL,
  `crop_id_id` int(11) NOT NULL,
  `machine_id_id` int(11) NOT NULL,
  `trough_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `farmapp_produce_crop_id_id_d170d24e_fk_farmapp_crop_crop_id` (`crop_id_id`),
  KEY `farmapp_produce_machine_id_id_b2525ee0_fk_farmapp_m` (`machine_id_id`),
  KEY `farmapp_produce_trough_id_id_a8e49ad8_fk_farmapp_t` (`trough_id_id`),
  CONSTRAINT `farmapp_produce_crop_id_id_d170d24e_fk_farmapp_crop_crop_id` FOREIGN KEY (`crop_id_id`) REFERENCES `farmapp_crop` (`crop_id`),
  CONSTRAINT `farmapp_produce_machine_id_id_b2525ee0_fk_farmapp_m` FOREIGN KEY (`machine_id_id`) REFERENCES `farmapp_machine` (`machine_id`),
  CONSTRAINT `farmapp_produce_trough_id_id_a8e49ad8_fk_farmapp_t` FOREIGN KEY (`trough_id_id`) REFERENCES `farmapp_trough` (`trough_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_produce`
--

LOCK TABLES `farmapp_produce` WRITE;
/*!40000 ALTER TABLE `farmapp_produce` DISABLE KEYS */;
INSERT INTO `farmapp_produce` VALUES (23,'image-2017-06-07T18:42:56.3957421.jpg',391,'2017-06-13 08:43:28.491281','2017-06-07 13:13:27.000000','2017-06-11 13:13:27.000000',0,17,1,1),(24,'image-2017-06-07T18:48:58.3630431.jpg',291,'2017-06-13 08:49:45.342774','2017-06-07 13:19:45.000000','2017-06-10 16:19:45.000000',0,13,1,1),(25,'image-2017-06-07T18:58:33.5621691.jpg',211,'2017-06-13 08:59:00.047003','2017-06-07 13:29:00.000000','2017-06-10 13:29:00.000000',0,30,1,1),(26,'image-2017-06-07T18:59:36.5141051.jpg',7018,'2017-06-13 08:59:49.304080','2017-06-07 13:29:48.000000','2017-06-10 13:29:48.000000',0,30,1,1),(27,'image-2017-06-07T19:00:46.3416791.jpg',679,'2017-06-13 09:01:04.300740','2017-06-07 13:31:02.000000','2017-06-11 13:31:02.000000',0,17,1,1),(28,'image-2017-06-07T19:01:11.9693711.jpg',759,'2017-06-13 09:01:35.655640','2017-06-07 13:31:35.000000','2017-06-10 13:31:35.000000',0,30,1,1),(29,'image-2017-06-07T19:34:04.5776211.jpg',0,'2017-06-13 09:34:20.079939','2017-06-07 14:04:20.000000','2017-06-11 14:04:20.000000',0,17,1,1),(30,'image-2017-06-07T19:29:40.2742591.jpg',470,'2017-06-13 09:49:08.361967','2017-06-07 13:59:50.000000','2017-06-12 13:59:50.000000',0,5,1,1),(31,'image-2017-06-07T19:45:17.8524611.jpg',0,'2017-06-13 09:49:13.903236','2017-06-07 14:15:50.000000','2017-06-10 14:15:50.000000',0,30,1,2);
/*!40000 ALTER TABLE `farmapp_produce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmapp_trough`
--

DROP TABLE IF EXISTS `farmapp_trough`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmapp_trough` (
  `trough_id` int(11) NOT NULL AUTO_INCREMENT,
  `machine_id_id` int(11) NOT NULL,
  PRIMARY KEY (`trough_id`),
  KEY `farmapp_trough_machine_id_id_e0fc7ec1_fk_farmapp_m` (`machine_id_id`),
  CONSTRAINT `farmapp_trough_machine_id_id_e0fc7ec1_fk_farmapp_m` FOREIGN KEY (`machine_id_id`) REFERENCES `farmapp_machine` (`machine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_trough`
--

LOCK TABLES `farmapp_trough` WRITE;
/*!40000 ALTER TABLE `farmapp_trough` DISABLE KEYS */;
INSERT INTO `farmapp_trough` VALUES (1,1),(2,1),(3,2),(4,2);
/*!40000 ALTER TABLE `farmapp_trough` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmapp_user`
--

DROP TABLE IF EXISTS `farmapp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmapp_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `password` varchar(20) NOT NULL,
  `address_line1` varchar(100) NOT NULL,
  `address_line2` varchar(100) DEFAULT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `pin_code` varchar(20) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `contact` longtext NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `last_cart_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `farmapp_user_last_cart_id_e22636f5_fk_farmapp_cart_cart_id` (`last_cart_id`),
  CONSTRAINT `farmapp_user_last_cart_id_e22636f5_fk_farmapp_cart_cart_id` FOREIGN KEY (`last_cart_id`) REFERENCES `farmapp_cart` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_user`
--

LOCK TABLES `farmapp_user` WRITE;
/*!40000 ALTER TABLE `farmapp_user` DISABLE KEYS */;
INSERT INTO `farmapp_user` VALUES (1,'keivan@gmail.com','keivan','qwerty','asdfgh','zxcvbn','poiuyt','123456','Consumer','9876541345','Keivan','Shah',NULL),(2,'hemang@gmail.com','hemang','qwertyuiop','asdfghjkl','zxcvbnm,','lkjhgfdsa','1234567890','Producer','9876543210','Hemang','Gandhi',NULL),(3,'producer@gmail.com','produce','IIT B','Powai, Mumbai','Maharashtra','India','400067','Producer','9876543210','Producer','produce',NULL),(4,'consumer@gmail.com','consumer','Guest House','IIT B, Powai','Maharashtra','India','400001','Consumer','1234567890','Consumer','Consume',NULL);
/*!40000 ALTER TABLE `farmapp_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-13 16:00:10
