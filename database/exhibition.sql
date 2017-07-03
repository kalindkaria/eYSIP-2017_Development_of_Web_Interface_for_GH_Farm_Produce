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
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',13,'add_group'),(5,'Can change group',13,'change_group'),(6,'Can delete group',13,'delete_group'),(7,'Can add permission',14,'add_permission'),(8,'Can change permission',14,'change_permission'),(9,'Can delete permission',14,'delete_permission'),(10,'Can add content type',2,'add_contenttype'),(11,'Can change content type',2,'change_contenttype'),(12,'Can delete content type',2,'delete_contenttype'),(13,'Can add crop',9,'add_crop'),(14,'Can change crop',9,'change_crop'),(15,'Can delete crop',9,'delete_crop'),(16,'Can add alert',4,'add_alert'),(17,'Can change alert',4,'change_alert'),(18,'Can delete alert',4,'delete_alert'),(19,'Can add inventory',10,'add_inventory'),(20,'Can change inventory',10,'change_inventory'),(21,'Can delete inventory',10,'delete_inventory'),(22,'Can add user',7,'add_user'),(23,'Can change user',7,'change_user'),(24,'Can delete user',7,'delete_user'),(25,'Can add machine',6,'add_machine'),(26,'Can change machine',6,'change_machine'),(27,'Can delete machine',6,'delete_machine'),(28,'Can add trough',11,'add_trough'),(29,'Can change trough',11,'change_trough'),(30,'Can delete trough',11,'delete_trough'),(31,'Can add order',12,'add_order'),(32,'Can change order',12,'change_order'),(33,'Can delete order',12,'delete_order'),(34,'Can add produce',3,'add_produce'),(35,'Can change produce',3,'change_produce'),(36,'Can delete produce',3,'delete_produce'),(37,'Can add cart',5,'add_cart'),(38,'Can change cart',5,'change_cart'),(39,'Can delete cart',5,'delete_cart'),(40,'Can add cart_session',8,'add_cart_session'),(41,'Can change cart_session',8,'change_cart_session'),(42,'Can delete cart_session',8,'delete_cart_session'),(43,'Can add session',15,'add_session'),(44,'Can change session',15,'change_session'),(45,'Can delete session',15,'delete_session'),(46,'Can add review',16,'add_review'),(47,'Can change review',16,'change_review'),(48,'Can delete review',16,'delete_review');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (26,'2017-06-30 00:40:21.794625','17','producer@gmail.com',2,'[{\"changed\": {\"fields\": [\"user_type\"]}}]',7,1),(27,'2017-06-30 09:51:46.776333','19','Lollo Rosso',2,'[{\"changed\": {\"fields\": [\"availability\"]}}]',9,1),(28,'2017-06-30 09:52:16.510317','17','Ladyfinger',2,'[{\"changed\": {\"fields\": [\"availability\"]}}]',9,1),(29,'2017-06-30 09:53:22.135043','8','Brinjal',2,'[{\"changed\": {\"fields\": [\"availability\"]}}]',9,1),(30,'2017-06-30 09:58:11.526794','10','Sanket - Ladyfinger',3,'',3,1),(31,'2017-06-30 09:58:11.659442','9','Sanket - Ladyfinger',3,'',3,1),(32,'2017-06-30 09:58:11.726719','8','Sanket - Radish',3,'',3,1),(33,'2017-06-30 09:58:11.759923','7','Sanket - Brinjal',3,'',3,1),(34,'2017-06-30 09:58:11.793047','6','Sanket - Lemon Grass',3,'',3,1),(35,'2017-06-30 09:58:11.826306','5','Sanket - Ladyfinger',3,'',3,1),(36,'2017-06-30 09:58:11.859376','4','Sanket - Ladyfinger',3,'',3,1),(37,'2017-06-30 09:58:11.892479','3','Sanket - Fenugreek',3,'',3,1),(38,'2017-06-30 09:58:11.925140','2','Sanket - Snake Gourd',3,'',3,1),(39,'2017-06-30 09:58:11.958981','1','Sanket - Lollo Rosso',3,'',3,1),(40,'2017-06-30 09:58:34.283730','7','Sanket-Radish',3,'',10,1),(41,'2017-06-30 09:58:34.362473','6','Sanket-Brinjal',3,'',10,1),(42,'2017-06-30 09:58:34.395658','5','Sanket-Lemon Grass',3,'',10,1),(43,'2017-06-30 09:58:34.428303','4','Sanket-Ladyfinger',3,'',10,1),(44,'2017-06-30 09:58:34.461317','2','Sanket-Snake Gourd',3,'',10,1),(45,'2017-06-30 09:58:34.494573','1','Sanket-Lollo Rosso',3,'',10,1),(46,'2017-06-30 09:59:12.427286','7','hema-Sanket-Ladyfinger',3,'',12,1),(47,'2017-06-30 09:59:12.532315','6','Keivan-Sanket-Fenugreek',3,'',12,1),(48,'2017-06-30 09:59:12.565843','5','Keivan-Sanket-Lollo Rosso',3,'',12,1),(49,'2017-06-30 09:59:12.598452','4','Keivan-Sanket-Fenugreek',3,'',12,1),(50,'2017-06-30 09:59:12.664198','3','Keivan-Sanket-Lollo Rosso',3,'',12,1),(51,'2017-06-30 09:59:12.730800','2','Hemang-Sanket-Lollo Rosso',3,'',12,1),(52,'2017-06-30 09:59:12.764529','1','Hemang-Sanket-Lollo Rosso',3,'',12,1),(53,'2017-06-30 10:40:56.894291','3','sanket@gmail.com',2,'[{\"changed\": {\"fields\": [\"is_admin\"]}}]',7,1);
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
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(13,'auth','group'),(14,'auth','permission'),(2,'contenttypes','contenttype'),(4,'farmapp','alert'),(5,'farmapp','cart'),(8,'farmapp','cart_session'),(9,'farmapp','crop'),(10,'farmapp','inventory'),(6,'farmapp','machine'),(12,'farmapp','order'),(3,'farmapp','produce'),(16,'farmapp','review'),(11,'farmapp','trough'),(7,'farmapp','user'),(15,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'farmapp','0001_initial','2017-06-26 11:13:47.394966'),(2,'contenttypes','0001_initial','2017-06-26 11:13:47.442536'),(3,'admin','0001_initial','2017-06-26 11:13:47.529725'),(4,'admin','0002_logentry_remove_auto_add','2017-06-26 11:14:03.131400'),(5,'auth','0001_initial','2017-06-26 11:15:40.495792'),(6,'auth','0002_alter_permission_name_max_length','2017-06-26 11:15:47.970033'),(7,'auth','0003_alter_user_email_max_length','2017-06-26 11:16:13.668560'),(8,'auth','0004_alter_user_username_opts','2017-06-26 11:16:23.783626'),(9,'auth','0005_alter_user_last_login_null','2017-06-26 11:16:37.293600'),(10,'contenttypes','0002_remove_content_type_name','2017-06-26 11:16:45.978844'),(11,'auth','0006_require_contenttypes_0002','2017-06-26 11:16:46.013609'),(12,'auth','0007_alter_validators_add_error_messages','2017-06-26 11:16:53.502022'),(13,'auth','0008_alter_user_username_max_length','2017-06-26 11:17:02.017797'),(14,'sessions','0001_initial','2017-06-26 11:17:32.460202'),(15,'farmapp','0002_auto_20170627_1204','2017-06-27 12:04:36.401120'),(16,'farmapp','0003_produce_show_image','2017-06-27 14:21:51.051259'),(17,'farmapp','0004_review','2017-06-28 22:12:58.205524'),(18,'farmapp','0005_auto_20170628_1410','2017-06-28 22:12:59.101112'),(19,'farmapp','0006_auto_20170628_1623','2017-06-28 22:13:01.532758'),(20,'farmapp','0007_user_login_count','2017-06-29 17:05:02.530390'),(21,'farmapp','0008_auto_20170630_0008','2017-06-30 00:08:16.880156'),(22,'farmapp','0009_auto_20170630_0032','2017-06-30 00:32:23.072709'),(23,'farmapp','0010_auto_20170630_0044','2017-06-30 00:44:56.040142');
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
INSERT INTO `django_session` VALUES ('0i9ywgeo36a6o7rb8pf5nrqjyi5mlmh8','OThlYjE5MDA0ZDg2MzkzYWQxZDEzMjM5MDYwZDBmZWU0Yjc4ZWZiMzp7ImxvZ2dlZF9pbiI6dHJ1ZSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJlbWFpbCI6ImhlbWFuZ0BnbWFpbC5jb20iLCJfYXV0aF91c2VyX2lkIjoiMiIsInBhZ2UiOiIvY3JvcHMiLCJjYXJ0X2lkIjoxNCwidXNlcl9pZCI6MiwiY2FydF9jb3VudCI6MywidXNlcl90eXBlIjoiQ29uc3VtZXIiLCJfYXV0aF91c2VyX2hhc2giOiIzMWVjNzE4MjljYmJkMmU0MjI5NzY4MmQ3YzhiNmJjZTRiMGJmNDk5In0=','2017-07-13 14:27:45.509850'),('47fie3eujqz5n5wkewmk06o79z6jybvx','MDAzNzYzNGY5NDkxYTYyODhkZjY0Y2MzNGJjNzMzMjMwZTkyNTRmZjp7InBhZ2UiOiIvY3JvcHMifQ==','2017-07-12 11:42:13.140419'),('5sfjeno9qx7g724qquusbjai024b3113','MDAzNzYzNGY5NDkxYTYyODhkZjY0Y2MzNGJjNzMzMjMwZTkyNTRmZjp7InBhZ2UiOiIvY3JvcHMifQ==','2017-07-12 12:19:40.128642'),('75w8c2w361kswv7q5ai398p7bfd6z7bd','Mjc2Njk2OGZjZGI2MmVhYmY3NTA0NjY2M2Y0NmY3NzVjODYzZDQxZjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiY2FydF9jb3VudCI6MCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNDBlOTJhMzUzMzJmMDRkZjU2MTVjOWFhZDczYTcxODFlNDI1N2QwIiwicGFnZSI6Ii9jcm9wcyIsImVtYWlsIjoic3Vwcml5YS5zdXJlc2hAdmVzLmFjLmluIiwidXNlcl90eXBlIjoiQ29uc3VtZXIiLCJsb2dnZWRfaW4iOnRydWUsInVzZXJfaWQiOjV9','2017-07-12 15:31:29.073650'),('cama9urjhbdqxq9kguiumhudozrcmfz5','YThjN2Y2MWJmZmU2MWZkMzk2NWMxOWY5YzA0YWIyMTlhM2I3ZWQwMDp7InVzZXJfaWQiOjIsImNhcnRfY291bnQiOjAsInVzZXJfdHlwZSI6IkNvbnN1bWVyIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJsb2dnZWRfaW4iOnRydWUsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwicGFnZSI6Ii9jcm9wcyIsIl9hdXRoX3VzZXJfaGFzaCI6IjMxZWM3MTgyOWNiYmQyZTQyMjk3NjgyZDdjOGI2YmNlNGIwYmY0OTkiLCJlbWFpbCI6ImhlbWFuZ0BnbWFpbC5jb20ifQ==','2017-07-14 17:34:20.830593'),('few2m4o55xeb34fqk0g3lwgt89nrmq6q','MDAzNzYzNGY5NDkxYTYyODhkZjY0Y2MzNGJjNzMzMjMwZTkyNTRmZjp7InBhZ2UiOiIvY3JvcHMifQ==','2017-07-10 11:40:07.149300'),('ffzrmm9rf5522cnd7vaqpa0wx3np5m0l','M2E1ZjYzYmM5ZGZiMDVjNGQ1NTY1YTI2MTM4ZGEzMzViYTMxYTIwNDp7ImNhcnRfY291bnQiOjIsInVzZXJfaWQiOjIsInVzZXJfdHlwZSI6IkNvbnN1bWVyIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJsb2dnZWRfaW4iOnRydWUsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwicGFnZSI6Ii9jcm9wcyIsIl9hdXRoX3VzZXJfaGFzaCI6IjMxZWM3MTgyOWNiYmQyZTQyMjk3NjgyZDdjOGI2YmNlNGIwYmY0OTkiLCJjYXJ0X2lkIjoyOCwiZW1haWwiOiJoZW1hbmdAZ21haWwuY29tIn0=','2017-07-14 13:57:56.913647'),('jjptzob53j9hwsl3pcqe3yicr68aqmc2','MjYxYTk4OGYzNGVmMTYxMTE4NzY2M2RiY2Y0YmJkZTU2MGM0NWEzYzp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsImNhcnRfY291bnQiOjAsIl9hdXRoX3VzZXJfaGFzaCI6IjA2MGIwYTM3MDIxMDgzZTUxNGI3OGI0ZjExZDUyMmNmZGU2NjIwZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsImVtYWlsIjoiaWhhdGViaGluZGlAbm9iaGluZGkuY29tIiwicGFnZSI6Ii9jcm9wcyIsInVzZXJfaWQiOjE0LCJ1c2VyX3R5cGUiOiJDb25zdW1lciIsImxvZ2dlZF9pbiI6dHJ1ZX0=','2017-07-13 16:19:14.205064'),('meedhevosdr8u0ktdvdofqr157bp1ztn','MDAzNzYzNGY5NDkxYTYyODhkZjY0Y2MzNGJjNzMzMjMwZTkyNTRmZjp7InBhZ2UiOiIvY3JvcHMifQ==','2017-07-10 11:37:39.710916'),('wja4nbwj9n5zv5civwdleoebsix2ix7q','MDAzNzYzNGY5NDkxYTYyODhkZjY0Y2MzNGJjNzMzMjMwZTkyNTRmZjp7InBhZ2UiOiIvY3JvcHMifQ==','2017-07-10 11:41:46.291356'),('x5icwnrbmfn90vwxeblm6i9mynup0kzw','MDAzNzYzNGY5NDkxYTYyODhkZjY0Y2MzNGJjNzMzMjMwZTkyNTRmZjp7InBhZ2UiOiIvY3JvcHMifQ==','2017-07-13 16:53:31.450538'),('xwz91kluboc6ysr5tc6nsckhfhjsec9i','YzBiODgzNTFiYmYwNmQ5MDFiZGY1YzljNGFiOTRlYmYzODUxNmQ1ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImYyMWJhZGY3NjUzOTk5Mjc2MzliMDgxODFmMDM5Y2UwMjkyNjQ3MTkiLCJ1c2VyX2lkIjozLCJjYXJ0X2NvdW50IjoyLCJfYXV0aF91c2VyX2lkIjoiMyIsInVzZXJfdHlwZSI6IlByb2R1Y2VyIiwiY2FydF9pZCI6NDYsInBhZ2UiOiIvY3JvcHMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsImxvZ2dlZF9pbiI6dHJ1ZSwiZW1haWwiOiJzYW5rZXRAZ21haWwuY29tIn0=','2017-07-14 17:53:24.764348'),('zrgz93pzdbctktlx1ufy7h6v5j3pgxyt','ZWMxODQ3YzlhMGY1NmEzY2ZkZWU4MjBkMmRlZTFmNTNhYWYyMDU0Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwicGFnZSI6Ii9jcm9wcyIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiY2FydF9jb3VudCI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiOWJlZGJkMzIzZmEwN2IzYWZmZmQxZDRhNDU1ZjQzNzM3NjJkODI5MCJ9','2017-07-14 09:54:55.139373');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmapp_alert`
--

DROP TABLE IF EXISTS `farmapp_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmapp_alert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `farmapp_alert_user_id_id_67c2a510_fk_farmapp_user_id` (`user_id_id`),
  CONSTRAINT `farmapp_alert_user_id_id_67c2a510_fk_farmapp_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `farmapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_alert`
--

LOCK TABLES `farmapp_alert` WRITE;
/*!40000 ALTER TABLE `farmapp_alert` DISABLE KEYS */;
INSERT INTO `farmapp_alert` VALUES (1,'Hemang has cancelled his order for 600.0 grams of Lollo Rosso placed on 2017-06-26','2017-06-26 13:03:29.236996',3,'unknown'),(2,'Sanket has rejected your order for 300.0 grams of Lollo Rosso placed on 2017-06-26','2017-06-26 13:05:55.171809',2,'unknown'),(3,'Your produce of Snake Gourd of weight 2151.0 logged on 2017-06-27 10:13:40 has expired on 2017-06-22 10:13:40','2017-06-27 12:29:23.744139',3,'unknown'),(4,'Your produce of Snake Gourd of weight 2151.0 logged on 2017-06-27 10:13:40 has expired on 2017-06-22 10:13:40','2017-06-27 12:50:47.676395',3,'unknown'),(5,'Your produce of Snake Gourd of weight 2151.0 logged on 2017-06-27 10:13:40 has expired on 2017-06-22 10:13:40','2017-06-27 12:51:39.750471',3,'unknown'),(6,'Your produce of Snake Gourd of weight 2151.0 logged on 2017-06-27 10:13:40 has expired on 2017-06-22 10:13:40','2017-06-27 12:51:44.982074',3,'unknown'),(7,'Keivan has cancelled his order for 600.0 grams of Lollo Rosso placed on 2017-06-27','2017-06-27 14:06:51.970143',3,'unknown'),(8,'Keivan has cancelled his order for 600.0 grams of Fenugreek placed on 2017-06-27','2017-06-27 14:06:53.916999',3,'unknown'),(9,'Keivan has cancelled his order for 600.0 grams of Lollo Rosso placed on 2017-06-27','2017-06-27 14:51:20.825078',3,'unknown'),(10,'Hi Supriya! Please Update your Address Details to let the producers                                know where to deliver your orders.','2017-06-28 11:47:12.000214',5,'start_message'),(11,'Your produce of Fenugreek of weight 2006.0 logged on 2017-06-27 10:14:04 has expired on 2017-06-22 08:14:04','2017-06-28 11:58:11.666465',3,'unknown'),(12,'Your produce of Fenugreek of weight 2006.0 logged on 2017-06-27 10:14:04 has expired on 2017-06-22 08:14:04','2017-06-28 11:58:21.117823',3,'unknown'),(13,'Sanket has delivered your order for 600.0 grams of Fenugreek placed on 2017-06-27','2017-06-28 12:00:36.528033',1,'unknown'),(14,'Your produce of Radish of weight 3000.0 logged on 2017-06-28 19:00:46 has expired on 2017-06-22 19:00:50','2017-06-28 22:07:30.112080',3,'unknown'),(24,'Your order for Ladyfinger of quantity 600.0 g from producer Sanket was successfully placed on 2017-06-29','2017-06-29 22:31:06.362750',16,'ordered'),(25,'You have received an order for Ladyfinger of quantity 600.0 g from hema on 2017-06-29','2017-06-29 22:31:06.394941',3,'ordered'),(26,'Hi Producer! Please Update your Address Details to let the producers                            know where to deliver your orders. You can update the your profile <a href=\"../profile\">here</a>','2017-06-29 22:53:23.821588',17,'start_message'),(27,'Hi Consumer! Please Update your Address Details to let the producers                            know where to deliver your orders. You can update the your profile <a href=\"../profile\">here</a>','2017-06-30 00:00:46.544697',18,'start_message'),(28,'Your order for Cucumber of quantity 50.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 10:38:37.704942',2,'ordered'),(29,'You have received an order for Cucumber of quantity 50.0 g from Hemang on 2017-06-30','2017-06-30 10:38:37.735978',3,'ordered'),(30,'Your order for Basil of quantity 50.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 10:38:37.824182',2,'ordered'),(31,'You have received an order for Basil of quantity 50.0 g from Hemang on 2017-06-30','2017-06-30 10:38:37.857492',3,'ordered'),(32,'Sanket has delivered your order for 50.0 grams of Cucumber placed on 2017-06-30','2017-06-30 10:43:19.361754',2,'delivered'),(33,'Sanket has delivered your order for 50.0 grams of Basil placed on 2017-06-30','2017-06-30 10:43:19.443140',2,'delivered'),(34,'Your order for Cucumber of quantity 250.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 10:44:02.514693',2,'ordered'),(35,'You have received an order for Cucumber of quantity 250.0 g from Hemang on 2017-06-30','2017-06-30 10:44:02.608456',3,'ordered'),(36,'Your order for Cabbage of quantity 150.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 10:44:02.804940',2,'ordered'),(37,'You have received an order for Cabbage of quantity 150.0 g from Hemang on 2017-06-30','2017-06-30 10:44:02.839175',3,'ordered'),(39,'Your order for Bitter Gourd of quantity 200.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 11:03:04.028716',19,'ordered'),(40,'You have received an order for Bitter Gourd of quantity 200.0 g from Rutuja on 2017-06-30','2017-06-30 11:03:04.065832',3,'ordered'),(41,'Your order for Ladyfinger of quantity 250.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 11:43:25.635841',2,'ordered'),(42,'You have received an order for Ladyfinger of quantity 250.0 g from Hemang on 2017-06-30','2017-06-30 11:43:25.667910',3,'ordered'),(43,'Your order for Cucumber of quantity 250.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 11:43:25.788190',2,'ordered'),(44,'You have received an order for Cucumber of quantity 250.0 g from Hemang on 2017-06-30','2017-06-30 11:43:25.855000',3,'ordered'),(45,'Hemang has cancelled his order for 250.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 11:45:58.546070',3,'cancelled'),(46,'Hemang has cancelled his order for 250.0 grams of Cucumber placed on 2017-06-30','2017-06-30 11:46:00.542775',3,'cancelled'),(48,'Your order for Ladyfinger of quantity 350.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 11:58:03.625049',2,'ordered'),(49,'You have received an order for Ladyfinger of quantity 350.0 g from Hemang on 2017-06-30','2017-06-30 11:58:03.653046',3,'ordered'),(50,'Hemang has cancelled his order for 350.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 11:59:02.736141',3,'cancelled'),(51,'Your order for Ladyfinger of quantity 100.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 12:12:41.157834',2,'ordered'),(52,'You have received an order for Ladyfinger of quantity 100.0 g from Hemang on 2017-06-30','2017-06-30 12:12:41.201214',3,'ordered'),(53,'Your order for Cucumber of quantity 200.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 12:12:41.345217',2,'ordered'),(54,'You have received an order for Cucumber of quantity 200.0 g from Hemang on 2017-06-30','2017-06-30 12:12:41.410360',3,'ordered'),(55,'Hemang has cancelled his order for 100.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 12:14:05.401425',3,'cancelled'),(56,'Hemang has cancelled his order for 200.0 grams of Cucumber placed on 2017-06-30','2017-06-30 12:14:06.888729',3,'cancelled'),(57,'Your order for Ladyfinger of quantity 250.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 12:29:19.598587',2,'ordered'),(58,'You have received an order for Ladyfinger of quantity 250.0 g from Hemang on 2017-06-30','2017-06-30 12:29:19.630913',3,'ordered'),(59,'Your order for Cucumber of quantity 250.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 12:29:19.750522',2,'ordered'),(60,'You have received an order for Cucumber of quantity 250.0 g from Hemang on 2017-06-30','2017-06-30 12:29:19.818267',3,'ordered'),(61,'Sanket has delivered your order for 250.0 grams of Cucumber placed on 2017-06-30','2017-06-30 12:29:33.395290',2,'delivered'),(62,'Sanket has delivered your order for 150.0 grams of Cabbage placed on 2017-06-30','2017-06-30 12:29:33.476720',2,'delivered'),(63,'Your order for Cucumber of quantity 100.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 12:54:38.186489',2,'ordered'),(64,'You have received an order for Cucumber of quantity 100.0 g from Hemang on 2017-06-30','2017-06-30 12:54:38.219083',3,'ordered'),(65,'Your order for Ladyfinger of quantity 200.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 12:54:38.303079',2,'ordered'),(66,'You have received an order for Ladyfinger of quantity 200.0 g from Hemang on 2017-06-30','2017-06-30 12:54:38.340651',3,'ordered'),(67,'Sanket has rejected your order for 200.0 grams of Bitter Gourd placed on 2017-06-30','2017-06-30 13:07:14.358160',19,'cancelled'),(68,'Sanket has delivered your order for 250.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 13:07:40.987132',2,'delivered'),(69,'Sanket has delivered your order for 250.0 grams of Cucumber placed on 2017-06-30','2017-06-30 13:07:41.058105',2,'delivered'),(71,'Your order for Bottle Gourd of quantity 150.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 14:01:39.915659',2,'ordered'),(72,'You have received an order for Bottle Gourd of quantity 150.0 g from Hemang on 2017-06-30','2017-06-30 14:01:39.977408',3,'ordered'),(73,'Your order for Basil of quantity 200.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 14:01:40.064533',2,'ordered'),(74,'You have received an order for Basil of quantity 200.0 g from Hemang on 2017-06-30','2017-06-30 14:01:40.131589',3,'ordered'),(75,'Sanket has delivered your order for 100.0 grams of Cucumber placed on 2017-06-30','2017-06-30 14:02:11.974113',2,'delivered'),(76,'Sanket has delivered your order for 200.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 14:02:12.050471',2,'delivered'),(77,'Sanket has delivered your order for 150.0 grams of Bottle Gourd placed on 2017-06-30','2017-06-30 14:20:35.356756',2,'delivered'),(78,'Sanket has delivered your order for 200.0 grams of Basil placed on 2017-06-30','2017-06-30 14:20:35.480219',2,'delivered'),(79,'Your order for Ladyfinger of quantity 400.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 14:30:31.867307',2,'ordered'),(80,'You have received an order for Ladyfinger of quantity 400.0 g from Hemang on 2017-06-30','2017-06-30 14:30:31.896759',3,'ordered'),(81,'Your order for Cucumber of quantity 50.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 14:30:32.018740',2,'ordered'),(82,'You have received an order for Cucumber of quantity 50.0 g from Hemang on 2017-06-30','2017-06-30 14:30:32.083928',3,'ordered'),(83,'Your order for Bottle Gourd of quantity 550.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 14:30:32.203568',2,'ordered'),(84,'You have received an order for Bottle Gourd of quantity 550.0 g from Hemang on 2017-06-30','2017-06-30 14:30:32.261450',3,'ordered'),(85,'Sanket has delivered your order for 400.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 14:35:53.435688',2,'delivered'),(86,'Sanket has delivered your order for 50.0 grams of Cucumber placed on 2017-06-30','2017-06-30 14:35:53.518221',2,'delivered'),(87,'Sanket has delivered your order for 550.0 grams of Bottle Gourd placed on 2017-06-30','2017-06-30 14:35:53.607669',2,'delivered'),(88,'Your order for Ladyfinger of quantity 200.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 14:49:25.864196',2,'ordered'),(89,'You have received an order for Ladyfinger of quantity 200.0 g from Hemang on 2017-06-30','2017-06-30 14:49:25.895196',3,'ordered'),(90,'Your order for Cucumber of quantity 50.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 14:49:26.017522',2,'ordered'),(91,'You have received an order for Cucumber of quantity 50.0 g from Hemang on 2017-06-30','2017-06-30 14:49:26.093474',3,'ordered'),(92,'Your order for Ladyfinger of quantity 400.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 15:05:53.484452',2,'ordered'),(93,'You have received an order for Ladyfinger of quantity 400.0 g from Hemang on 2017-06-30','2017-06-30 15:05:53.531722',3,'ordered'),(94,'Your order for Cucumber of quantity 500.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 15:05:53.680176',2,'ordered'),(95,'You have received an order for Cucumber of quantity 500.0 g from Hemang on 2017-06-30','2017-06-30 15:05:53.730226',3,'ordered'),(96,'Hemang has cancelled his order for 400.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 15:06:24.278382',3,'cancelled'),(97,'Sanket has delivered your order for 200.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 15:12:37.072184',2,'delivered'),(98,'Sanket has delivered your order for 50.0 grams of Cucumber placed on 2017-06-30','2017-06-30 15:12:37.141691',2,'delivered'),(99,'Sanket has rejected your order for 500.0 grams of Cucumber placed on 2017-06-30','2017-06-30 15:13:28.354324',2,'cancelled'),(100,'Your order for Cucumber of quantity 100.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 15:23:06.348128',2,'ordered'),(101,'You have received an order for Cucumber of quantity 100.0 g from Hemang on 2017-06-30','2017-06-30 15:23:06.383089',3,'ordered'),(102,'Your order for Ladyfinger of quantity 100.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 15:26:59.195689',2,'ordered'),(103,'You have received an order for Ladyfinger of quantity 100.0 g from Hemang on 2017-06-30','2017-06-30 15:26:59.236278',3,'ordered'),(104,'Your order for Cucumber of quantity 250.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 15:26:59.324499',2,'ordered'),(105,'You have received an order for Cucumber of quantity 250.0 g from Hemang on 2017-06-30','2017-06-30 15:26:59.357393',3,'ordered'),(106,'Sanket has delivered your order for 100.0 grams of Cucumber placed on 2017-06-30','2017-06-30 15:27:29.499159',2,'delivered'),(107,'Your order for Ladyfinger of quantity 50.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 15:33:28.992725',2,'ordered'),(108,'You have received an order for Ladyfinger of quantity 50.0 g from Hemang on 2017-06-30','2017-06-30 15:33:29.027333',3,'ordered'),(109,'Your order for Cucumber of quantity 200.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 15:33:29.116386',2,'ordered'),(110,'You have received an order for Cucumber of quantity 200.0 g from Hemang on 2017-06-30','2017-06-30 15:33:29.148884',3,'ordered'),(111,'Your order for Ladyfinger of quantity 50.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 15:40:11.354651',2,'ordered'),(112,'You have received an order for Ladyfinger of quantity 50.0 g from Hemang on 2017-06-30','2017-06-30 15:40:11.419323',3,'ordered'),(113,'Your order for Cucumber of quantity 50.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 15:40:11.536179',2,'ordered'),(114,'You have received an order for Cucumber of quantity 50.0 g from Hemang on 2017-06-30','2017-06-30 15:40:11.574901',3,'ordered'),(115,'Sanket has delivered your order for 100.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 15:40:39.177692',2,'delivered'),(116,'Sanket has delivered your order for 250.0 grams of Cucumber placed on 2017-06-30','2017-06-30 15:40:39.267835',2,'delivered'),(117,'Sanket has rejected your order for 50.0 grams of Cucumber placed on 2017-06-30','2017-06-30 15:52:03.930385',2,'cancelled'),(118,'Sanket has rejected your order for 200.0 grams of Cucumber placed on 2017-06-30','2017-06-30 15:52:06.379290',2,'cancelled'),(119,'Sanket has rejected your order for 50.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 15:52:08.417677',2,'cancelled'),(120,'Sanket has rejected your order for 50.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 15:52:09.816649',2,'cancelled'),(121,'Your order for Ladyfinger of quantity 100.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 16:00:04.083916',2,'ordered'),(122,'You have received an order for Ladyfinger of quantity 100.0 g from Hemang on 2017-06-30','2017-06-30 16:00:04.123208',3,'ordered'),(123,'Your order for Cucumber of quantity 250.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 16:00:04.210251',2,'ordered'),(124,'You have received an order for Cucumber of quantity 250.0 g from Hemang on 2017-06-30','2017-06-30 16:00:04.246572',3,'ordered'),(125,'Sanket has delivered your order for 100.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 16:00:30.967139',2,'delivered'),(126,'Sanket has delivered your order for 250.0 grams of Cucumber placed on 2017-06-30','2017-06-30 16:00:31.046533',2,'delivered'),(127,'Your order for Ladyfinger of quantity 50.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 16:04:32.144447',2,'ordered'),(128,'You have received an order for Ladyfinger of quantity 50.0 g from Hemang on 2017-06-30','2017-06-30 16:04:32.187428',3,'ordered'),(129,'Your order for Cucumber of quantity 100.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 16:04:32.353636',2,'ordered'),(130,'You have received an order for Cucumber of quantity 100.0 g from Hemang on 2017-06-30','2017-06-30 16:04:32.387900',3,'ordered'),(131,'Sanket has rejected your order for 100.0 grams of Cucumber placed on 2017-06-30','2017-06-30 16:05:09.238532',2,'cancelled'),(132,'Sanket has delivered your order for 50.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 16:05:37.467166',2,'delivered'),(133,'Your order for Ladyfinger of quantity 50.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 16:28:23.655856',2,'ordered'),(134,'You have received an order for Ladyfinger of quantity 50.0 g from Hemang on 2017-06-30','2017-06-30 16:28:23.695738',3,'ordered'),(135,'Your order for Cucumber of quantity 100.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 16:28:23.847751',2,'ordered'),(136,'You have received an order for Cucumber of quantity 100.0 g from Hemang on 2017-06-30','2017-06-30 16:28:23.894700',3,'ordered'),(137,'Sanket has delivered your order for 50.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 16:28:47.560222',2,'delivered'),(138,'Sanket has delivered your order for 100.0 grams of Cucumber placed on 2017-06-30','2017-06-30 16:28:47.647553',2,'delivered'),(139,'Your order for Ladyfinger of quantity 50.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 16:38:15.394057',2,'ordered'),(140,'You have received an order for Ladyfinger of quantity 50.0 g from Hemang on 2017-06-30','2017-06-30 16:38:15.425010',3,'ordered'),(141,'Your order for Cucumber of quantity 200.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 16:38:15.508218',2,'ordered'),(142,'You have received an order for Cucumber of quantity 200.0 g from Hemang on 2017-06-30','2017-06-30 16:38:15.546383',3,'ordered'),(143,'Sanket has delivered your order for 50.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 16:39:15.626770',2,'delivered'),(144,'Sanket has delivered your order for 200.0 grams of Cucumber placed on 2017-06-30','2017-06-30 16:39:15.725976',2,'delivered'),(145,'Your order for Cucumber of quantity 500.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 16:58:47.621272',2,'ordered'),(146,'You have received an order for Cucumber of quantity 500.0 g from Hemang on 2017-06-30','2017-06-30 16:58:47.657267',3,'ordered'),(147,'Sanket has delivered your order for 500.0 grams of Cucumber placed on 2017-06-30','2017-06-30 16:59:22.678791',2,'delivered'),(148,'Your order for Bitter Gourd of quantity 50.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 17:04:03.368527',2,'ordered'),(149,'You have received an order for Bitter Gourd of quantity 50.0 g from Hemang on 2017-06-30','2017-06-30 17:04:03.400093',3,'ordered'),(150,'Your order for Ladyfinger of quantity 100.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 17:04:03.514827',2,'ordered'),(151,'You have received an order for Ladyfinger of quantity 100.0 g from Hemang on 2017-06-30','2017-06-30 17:04:03.554427',3,'ordered'),(152,'Sanket has delivered your order for 50.0 grams of Bitter Gourd placed on 2017-06-30','2017-06-30 17:04:34.467396',2,'delivered'),(153,'Sanket has delivered your order for 100.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 17:04:34.549643',2,'delivered'),(154,'Your order for Ladyfinger of quantity 100.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 17:11:00.477261',2,'ordered'),(155,'You have received an order for Ladyfinger of quantity 100.0 g from Hemang on 2017-06-30','2017-06-30 17:11:00.508017',3,'ordered'),(156,'Sanket has delivered your order for 100.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 17:12:03.333344',2,'delivered'),(157,'Your order for Ladyfinger of quantity 150.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 17:32:12.245685',2,'ordered'),(158,'You have received an order for Ladyfinger of quantity 150.0 g from Hemang on 2017-06-30','2017-06-30 17:32:12.287391',3,'ordered'),(159,'Your order for Bitter Gourd of quantity 50.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 17:32:12.371817',2,'ordered'),(160,'You have received an order for Bitter Gourd of quantity 50.0 g from Hemang on 2017-06-30','2017-06-30 17:32:12.442793',3,'ordered'),(161,'Your order for Cucumber of quantity 150.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 17:32:12.561757',2,'ordered'),(162,'You have received an order for Cucumber of quantity 150.0 g from Hemang on 2017-06-30','2017-06-30 17:32:12.597463',3,'ordered'),(163,'Sanket has delivered your order for 150.0 grams of Ladyfinger placed on 2017-06-30','2017-06-30 17:33:11.073849',2,'delivered'),(164,'Sanket has delivered your order for 50.0 grams of Bitter Gourd placed on 2017-06-30','2017-06-30 17:33:11.161071',2,'delivered'),(165,'Sanket has delivered your order for 150.0 grams of Cucumber placed on 2017-06-30','2017-06-30 17:33:11.230405',2,'delivered'),(166,'Your order for Ladyfinger of quantity 100.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 17:44:50.937712',2,'ordered'),(167,'You have received an order for Ladyfinger of quantity 100.0 g from Hemang on 2017-06-30','2017-06-30 17:44:50.973377',3,'ordered'),(168,'Your order for Bitter Gourd of quantity 100.0 g from producer Sanket was successfully placed on 2017-06-30. The produce should be delivered to you by the next working day.','2017-06-30 17:44:51.057715',2,'ordered'),(169,'You have received an order for Bitter Gourd of quantity 100.0 g from Hemang on 2017-06-30','2017-06-30 17:44:51.094812',3,'ordered');
/*!40000 ALTER TABLE `farmapp_alert` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_cart`
--

LOCK TABLES `farmapp_cart` WRITE;
/*!40000 ALTER TABLE `farmapp_cart` DISABLE KEYS */;
INSERT INTO `farmapp_cart` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46);
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
  `cart_id_id` int(11) NOT NULL,
  `crop_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `farmapp_cart_session_cart_id_id_4dabe9fb_fk_farmapp_cart_cart_id` (`cart_id_id`),
  KEY `farmapp_cart_session_crop_id_id_e003bfe0_fk_farmapp_crop_crop_id` (`crop_id_id`),
  CONSTRAINT `farmapp_cart_session_cart_id_id_4dabe9fb_fk_farmapp_cart_cart_id` FOREIGN KEY (`cart_id_id`) REFERENCES `farmapp_cart` (`cart_id`),
  CONSTRAINT `farmapp_cart_session_crop_id_id_e003bfe0_fk_farmapp_crop_crop_id` FOREIGN KEY (`crop_id_id`) REFERENCES `farmapp_crop` (`crop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_cart_session`
--

LOCK TABLES `farmapp_cart_session` WRITE;
/*!40000 ALTER TABLE `farmapp_cart_session` DISABLE KEYS */;
INSERT INTO `farmapp_cart_session` VALUES (7,4,19),(8,5,19),(9,5,15),(10,6,19),(11,6,15),(12,7,19),(13,7,15),(14,8,19),(16,9,19),(18,10,19),(20,11,19),(21,12,24),(22,12,19),(24,14,19),(25,14,17),(26,14,24),(27,15,17),(28,16,14),(29,16,4),(30,17,14),(31,17,9),(33,19,6),(35,21,17),(36,21,14),(37,22,14),(38,23,17),(39,24,17),(40,24,14),(41,25,17),(42,25,14),(44,26,14),(45,26,17),(46,27,17),(47,27,14),(48,28,17),(49,28,14),(51,29,7),(52,29,4),(55,30,17),(56,30,14),(57,30,7),(59,31,17),(60,31,14),(62,32,17),(63,32,14),(68,33,14),(69,34,17),(70,34,14),(71,35,17),(72,35,14),(73,36,17),(74,36,14),(77,37,17),(78,37,14),(79,38,17),(80,38,14),(81,39,17),(82,39,14),(85,40,17),(86,40,14),(87,41,14),(88,42,6),(89,42,17),(90,43,17),(94,44,17),(95,44,6),(96,44,14),(97,45,17),(98,45,6),(99,46,17),(100,46,6);
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
  `local_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `english_name` varchar(100) DEFAULT NULL,
  `short_name` varchar(11) NOT NULL,
  `scientific_name` varchar(100) DEFAULT NULL,
  `shelf_life` int(11) NOT NULL,
  `imagepath` varchar(100) DEFAULT NULL,
  `availability` double NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`crop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_crop`
--

LOCK TABLES `farmapp_crop` WRITE;
/*!40000 ALTER TABLE `farmapp_crop` DISABLE KEYS */;
INSERT INTO `farmapp_crop` VALUES (1,'हरा माठ','Amaranthus Green','AmaranthusG','Amaranthus viridis',48,'crops/amaranthus_green.jpg',0,120),(2,'लाल माठ','Amaranthus Red','AmaranthusR','Amaranthus cruentus',44,'crops/amaranthus_red.jpg',0,90),(3,'शिशु मेथी','Baby Fenugreek','BFenugreek','Trigonella foenum-graecum',48,'crops/baby_fenugreek.jpg',0,24),(4,'तुलसी','Basil','Basil','Ocimum basilicum',40,'crops/basil.jpeg',3267,200),(5,'चुकंदर','Beetroot','Beetroot','Beta vulgaris',120,'crops/beetroot.jpg',0,200),(6,'करेला','Bitter Gourd','BitterGourd','Momordica charantia',120,'crops/bitter_gourd.jpg',7423,70),(7,'लौकी','Bottle Gourd','BottleGourd','Lagenaria siceraria',200,'crops/bottle_gourd.jpeg',6518,90),(8,'बैंगन','Brinjal','Brinjal','Solanum melongena',72,'crops/brinjal.jpg',0,60),(9,'गोभी','Cabbage','Cabbage','Brassica oleracea var. capitata',120,'crops/cabbage.jpeg',1228,24),(10,'फूलगोभी','Cauliflower','Cauliflower','Brassica oleracea var. botrytis',120,'crops/cauliflower.jpeg',0,80),(11,'मिर्च','Chilli','Chilli','Capsicum frutescens',320,'crops/chilly.jpeg',0,40),(12,'गवार','Cluster Beans','ClusterBean','Cyamopsis tetragonoloba',48,'crops/cluster_bean.jpg',0,50),(13,'धनिया','Coriander','Coriander','Coriandrum sativum',75,'crops/coriander.jpg',0,20),(14,'ककड़ी','Cucumber','Cucumber','Cucumis sativus',72,'crops/cucumber.jpg',6380,60),(15,'मेंथी','Fenugreek','Fenugreek','Trigonella foenum-graecum',70,'crops/fenugreek.jpeg',0,60),(16,'हिमशैल सलाद','Iceberg Lettuce','Ice_Lettuce','Lactuca sativa',96,'crops/iceberg_lettuce.jpeg',0,67),(17,'भिन्डी','Ladyfinger','Ladyfinger','Abelmoschus esculentus',96,'crops/ladyfinger.jpeg',14051,60),(18,'नींबू घास','Lemon Grass','Lemon_Grass','Cymbopogon',24,'crops/lemongrass.jpg',0,100),(19,'लोलो रोसो','Lollo Rosso','Lollo_Rosso','Lactuca sativa',100,'crops/lollo_rosso.jpg',0,300),(20,'मक्का','Maize','Maize','Zea mays',48,'crops/maize.jpg',0,40),(21,'सरसों','Mustard','Mustard','Brassica',48,'crops/mustard.jpg',0,80),(22,'प्याज','Onion','Onion','Allium cepa',96,'crops/onion.jpg',419,50),(23,'अजमोद','Parsley','Parsley','Petroselinum crispum',96,'crops/parsley.jpg',0,70),(24,'मूली','Radish','Radish','Raphanus raphanistrum subsp. sativus',72,'crops/radish.jpeg',0,70),(25,'तुरई','Ridge Gourd','Ridge_Gourd','Luffa',72,'crops/ridge_gourd.jpg',0,120),(26,'चिचिण्डा','Snake Gourd','Snake_Gourd','Trichosanthes cucumerina',72,'crops/snake_gourd.jpg',0,40),(27,'पालक','Spinach','Spinach','Spinacia oleracea',24,'crops/spinach.jpeg',0,90),(28,'हल्दी पान','Turmeric Leaf','TurmericL','Curcuma longa',72,'crops/termari_leaf.jpg',0,200),(29,'हल्दी','Turmeric','Turmeric','Curcuma longa',960,'crops/turmeric.jpg',0,300),(30,'टमाटर','Tomato','Tomato','Solanum lycopersicum',72,'crops/tomato.jpg',1798,40);
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
  `sold` double NOT NULL,
  `wasted` double NOT NULL,
  `minimum` double NOT NULL,
  `maximum` double NOT NULL,
  `price` double NOT NULL,
  `shelf_life` int(11) NOT NULL,
  `crop_id_id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `farmapp_inventory_crop_id_id_796a261e_fk_farmapp_crop_crop_id` (`crop_id_id`),
  KEY `farmapp_inventory_user_id_id_bda51212_fk_farmapp_user_id` (`user_id_id`),
  CONSTRAINT `farmapp_inventory_crop_id_id_796a261e_fk_farmapp_crop_crop_id` FOREIGN KEY (`crop_id_id`) REFERENCES `farmapp_crop` (`crop_id`),
  CONSTRAINT `farmapp_inventory_user_id_id_bda51212_fk_farmapp_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `farmapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_inventory`
--

LOCK TABLES `farmapp_inventory` WRITE;
/*!40000 ALTER TABLE `farmapp_inventory` DISABLE KEYS */;
INSERT INTO `farmapp_inventory` VALUES (8,15901,1850,0,50,350,0,48,17,3),(9,3517,250,0,50,600,0,48,4,3),(10,7218,700,0,50,600,0,48,7,3),(11,7623,200,0,50,600,0,48,6,3),(12,8680,2300,0,50,600,0,48,14,3),(13,1378,150,0,50,600,0,48,9,3),(14,0,0,0,50,600,0,48,5,3),(15,1798,0,0,50,600,0,48,30,3),(16,419,0,0,50,600,0,48,22,3);
/*!40000 ALTER TABLE `farmapp_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmapp_machine`
--

DROP TABLE IF EXISTS `farmapp_machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmapp_machine` (
  `machine_id` int(11) NOT NULL,
  `password` varchar(20) NOT NULL,
  `location` varchar(255) NOT NULL,
  `date_of_manufacture` datetime(6) NOT NULL,
  `version` varchar(20) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`machine_id`),
  KEY `farmapp_machine_user_id_id_3e6c5fdf_fk_farmapp_user_id` (`user_id_id`),
  CONSTRAINT `farmapp_machine_user_id_id_3e6c5fdf_fk_farmapp_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `farmapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_machine`
--

LOCK TABLES `farmapp_machine` WRITE;
/*!40000 ALTER TABLE `farmapp_machine` DISABLE KEYS */;
INSERT INTO `farmapp_machine` VALUES (1,'random','ERTS LAB','2017-06-26 12:38:50.000000','1.0','2017-06-26 12:38:54.000000',3);
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
  `weight` double NOT NULL,
  `time` datetime(6) NOT NULL,
  `delivery_date` datetime(6) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `cart_id_id` int(11) NOT NULL,
  `crop_id_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `farmapp_order_cart_id_id_cb534eca_fk_farmapp_cart_cart_id` (`cart_id_id`),
  KEY `farmapp_order_crop_id_id_81eaee8e_fk_farmapp_crop_crop_id` (`crop_id_id`),
  KEY `farmapp_order_seller_id_5b7e2bce_fk_farmapp_user_id` (`seller_id`),
  KEY `farmapp_order_user_id_id_8205f9ff_fk_farmapp_user_id` (`user_id_id`),
  CONSTRAINT `farmapp_order_cart_id_id_cb534eca_fk_farmapp_cart_cart_id` FOREIGN KEY (`cart_id_id`) REFERENCES `farmapp_cart` (`cart_id`),
  CONSTRAINT `farmapp_order_crop_id_id_81eaee8e_fk_farmapp_crop_crop_id` FOREIGN KEY (`crop_id_id`) REFERENCES `farmapp_crop` (`crop_id`),
  CONSTRAINT `farmapp_order_seller_id_5b7e2bce_fk_farmapp_user_id` FOREIGN KEY (`seller_id`) REFERENCES `farmapp_user` (`id`),
  CONSTRAINT `farmapp_order_user_id_id_8205f9ff_fk_farmapp_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `farmapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_order`
--

LOCK TABLES `farmapp_order` WRITE;
/*!40000 ALTER TABLE `farmapp_order` DISABLE KEYS */;
INSERT INTO `farmapp_order` VALUES (8,50,'2017-06-30 10:38:37.225837','2017-06-30 10:43:19.358072','delivered',16,14,3,2),(9,50,'2017-06-30 10:38:37.233554','2017-06-30 10:43:19.435199','delivered',16,4,3,2),(10,250,'2017-06-30 10:44:02.194540','2017-06-30 12:29:33.392146','delivered',17,14,3,2),(11,150,'2017-06-30 10:44:02.208109','2017-06-30 12:29:33.470327','delivered',17,9,3,2),(12,200,'2017-06-30 11:03:03.892776',NULL,'rejected',19,6,3,19),(13,250,'2017-06-30 11:43:25.396719',NULL,'cancelled',21,17,3,2),(14,250,'2017-06-30 11:43:25.473547',NULL,'cancelled',21,14,3,2),(15,350,'2017-06-30 11:58:03.407187',NULL,'cancelled',23,17,3,2),(16,100,'2017-06-30 12:12:40.987034',NULL,'cancelled',24,17,3,2),(17,200,'2017-06-30 12:12:40.994468',NULL,'cancelled',24,14,3,2),(18,250,'2017-06-30 12:29:19.267346','2017-06-30 13:07:40.984912','delivered',25,17,3,2),(19,250,'2017-06-30 12:29:19.400743','2017-06-30 13:07:41.050655','delivered',25,14,3,2),(20,100,'2017-06-30 12:54:37.962864','2017-06-30 14:02:11.971579','delivered',26,14,3,2),(21,200,'2017-06-30 12:54:37.972146','2017-06-30 14:02:12.044514','delivered',26,17,3,2),(22,150,'2017-06-30 14:01:39.715723','2017-06-30 14:20:35.352449','delivered',29,7,3,2),(23,200,'2017-06-30 14:01:39.725796','2017-06-30 14:20:35.474925','delivered',29,4,3,2),(24,400,'2017-06-30 14:30:31.566335','2017-06-30 14:35:53.433459','delivered',30,17,3,2),(25,50,'2017-06-30 14:30:31.647125','2017-06-30 14:35:53.511130','delivered',30,14,3,2),(26,550,'2017-06-30 14:30:31.659599','2017-06-30 14:35:53.599565','delivered',30,7,3,2),(27,200,'2017-06-30 14:49:25.602988','2017-06-30 15:12:37.070002','delivered',31,17,3,2),(28,50,'2017-06-30 14:49:25.610926','2017-06-30 15:12:37.135805','delivered',31,14,3,2),(29,400,'2017-06-30 15:05:53.301396',NULL,'cancelled',32,17,3,2),(30,500,'2017-06-30 15:05:53.310820',NULL,'rejected',32,14,3,2),(31,100,'2017-06-30 15:23:06.194646','2017-06-30 15:27:29.491899','delivered',33,14,3,2),(32,100,'2017-06-30 15:26:58.855151','2017-06-30 15:40:39.174305','delivered',34,17,3,2),(33,250,'2017-06-30 15:26:58.985369','2017-06-30 15:40:39.259926','delivered',34,14,3,2),(34,50,'2017-06-30 15:33:28.833820',NULL,'rejected',35,17,3,2),(35,200,'2017-06-30 15:33:28.841003',NULL,'rejected',35,14,3,2),(36,50,'2017-06-30 15:40:11.100959',NULL,'rejected',36,17,3,2),(37,50,'2017-06-30 15:40:11.192626',NULL,'rejected',36,14,3,2),(38,100,'2017-06-30 16:00:03.895099','2017-06-30 16:00:30.963893','delivered',37,17,3,2),(39,250,'2017-06-30 16:00:03.905022','2017-06-30 16:00:31.041190','delivered',37,14,3,2),(40,50,'2017-06-30 16:04:31.917536','2017-06-30 16:05:37.463932','delivered',38,17,3,2),(41,100,'2017-06-30 16:04:31.926063',NULL,'rejected',38,14,3,2),(42,50,'2017-06-30 16:28:23.477480','2017-06-30 16:28:47.557773','delivered',39,17,3,2),(43,100,'2017-06-30 16:28:23.485786','2017-06-30 16:28:47.640423','delivered',39,14,3,2),(44,50,'2017-06-30 16:38:15.241424','2017-06-30 16:39:15.624641','delivered',40,17,3,2),(45,200,'2017-06-30 16:38:15.249525','2017-06-30 16:39:15.721634','delivered',40,14,3,2),(46,500,'2017-06-30 16:58:47.381557','2017-06-30 16:59:22.675768','delivered',41,14,3,2),(47,50,'2017-06-30 17:04:03.207938','2017-06-30 17:04:34.463198','delivered',42,6,3,2),(48,100,'2017-06-30 17:04:03.216079','2017-06-30 17:04:34.542454','delivered',42,17,3,2),(49,100,'2017-06-30 17:11:00.297986','2017-06-30 17:12:03.329949','delivered',43,17,3,2),(50,150,'2017-06-30 17:32:11.952766','2017-06-30 17:33:11.069941','delivered',44,17,3,2),(51,50,'2017-06-30 17:32:11.961308','2017-06-30 17:33:11.156757','delivered',44,6,3,2),(52,150,'2017-06-30 17:32:11.969062','2017-06-30 17:33:11.223342','delivered',44,14,3,2),(53,100,'2017-06-30 17:44:50.756018',NULL,'pending',45,17,3,2),(54,100,'2017-06-30 17:44:50.765602',NULL,'pending',45,6,3,2);
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
  `sold` double NOT NULL,
  `wasted` double NOT NULL,
  `crop_id_id` int(11) NOT NULL,
  `machine_id_id` int(11) NOT NULL,
  `show_image` tinyint(1) NOT NULL,
  `farm_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `farmapp_produce_crop_id_id_d170d24e_fk_farmapp_crop_crop_id` (`crop_id_id`),
  KEY `farmapp_produce_machine_id_id_b2525ee0_fk` (`machine_id_id`),
  CONSTRAINT `farmapp_produce_crop_id_id_d170d24e_fk_farmapp_crop_crop_id` FOREIGN KEY (`crop_id_id`) REFERENCES `farmapp_crop` (`crop_id`),
  CONSTRAINT `farmapp_produce_machine_id_id_b2525ee0_fk` FOREIGN KEY (`machine_id_id`) REFERENCES `farmapp_machine` (`machine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_produce`
--

LOCK TABLES `farmapp_produce` WRITE;
/*!40000 ALTER TABLE `farmapp_produce` DISABLE KEYS */;
INSERT INTO `farmapp_produce` VALUES (11,'image-2017-06-29T15:37:17.8093371.jpg',369,'2017-06-30 10:33:24.428021','2017-06-29 15:37:29.000000','2017-07-01 15:37:29.000000',369,0,17,1,1,2),(12,'image-2017-06-29T15:38:00.3290721.jpg',114,'2017-06-30 10:34:21.034530','2017-06-29 15:38:26.000000','2017-07-01 15:38:26.000000',50,0,4,1,1,1),(13,'image-2017-06-29T15:38:47.0928291.jpg',1302,'2017-06-30 10:34:56.137900','2017-06-29 15:39:01.000000','2017-07-01 15:39:01.000000',0,0,7,1,1,1),(14,'image-2017-06-29T15:39:16.2177571.jpg',982,'2017-06-30 10:35:25.068978','2017-06-29 15:39:30.000000','2017-07-01 15:39:30.000000',126,0,6,1,1,1),(15,'image-2017-06-29T15:39:36.4820891.jpg',181,'2017-06-30 10:35:48.850326','2017-06-29 15:39:53.000000','2017-07-01 15:39:53.000000',181,0,14,1,1,1),(16,'image-2017-06-29T15:40:05.2454881.jpg',1378,'2017-06-30 10:36:31.949757','2017-06-29 15:40:36.000000','2017-07-01 15:40:36.000000',150,0,9,1,1,1),(17,'image-2017-06-29T15:40:59.8283821.jpg',3308,'2017-06-30 10:37:13.609935','2017-06-29 15:41:18.000000','2017-07-01 15:41:18.000000',36,0,14,1,1,5),(18,'image-2017-06-29T15:41:34.2217251.jpg',1805,'2017-06-30 10:37:44.252409','2017-06-29 15:41:49.000000','2017-07-01 15:41:49.000000',0,0,4,1,1,1),(19,'image-2017-06-29T15:42:17.4051491.jpg',4762,'2017-06-30 10:38:26.461382','2017-06-29 15:42:30.000000','2017-07-01 15:42:30.000000',270,0,17,1,1,44),(20,'image-2017-06-29T15:18:15.8978771.jpg',125,'2017-06-30 10:47:26.391207','2017-06-29 15:18:53.000000','2017-07-01 15:18:53.000000',125,0,17,1,1,1),(21,'image-2017-06-29T15:20:01.8310891.jpg',127,'2017-06-30 10:48:56.495103','2017-06-29 15:20:24.000000','2017-07-01 15:20:24.000000',127,0,17,1,1,1),(22,'image-2017-06-29T15:22:10.1968721.jpg',376,'2017-06-30 10:51:12.762439','2017-06-29 15:22:40.000000','2017-07-01 15:22:40.000000',376,0,7,1,1,1),(23,'image-2017-06-29T15:22:56.3910091.jpg',1856,'2017-06-30 10:52:44.144549','2017-06-29 15:24:12.000000','2017-07-01 15:24:12.000000',1856,0,14,1,1,1),(24,'image-2017-06-29T15:26:06.5001381.jpg',125,'2017-06-30 10:55:14.622711','2017-06-29 15:26:42.000000','2017-07-01 15:26:42.000000',125,0,17,1,1,1),(25,'image-2017-06-29T15:26:54.9554111.jpg',0,'2017-06-30 10:56:01.359016','2017-06-29 15:27:29.000000','2017-07-01 15:27:29.000000',0,0,5,1,1,5),(26,'image-2017-06-29T15:27:45.8606931.jpg',48,'2017-06-30 10:56:54.893616','2017-06-29 15:28:22.000000','2017-07-01 15:28:22.000000',48,0,6,1,1,1),(27,'image-2017-06-29T15:29:06.4541471.jpg',169,'2017-06-30 10:57:55.970785','2017-06-29 15:29:23.000000','2017-07-01 15:29:23.000000',169,0,4,1,1,1),(28,'image-2017-06-29T15:29:32.9214211.jpg',168,'2017-06-30 10:58:30.175580','2017-06-29 15:29:57.000000','2017-07-01 15:29:57.000000',31,0,4,1,1,1),(29,'image-2017-06-29T15:30:03.9977421.jpg',172,'2017-06-30 10:59:00.508776','2017-06-29 15:30:28.000000','2017-07-01 15:30:28.000000',0,0,4,1,1,1),(30,'image-2017-06-29T15:30:34.0626221.jpg',278,'2017-06-30 10:59:26.069743','2017-06-29 15:30:53.000000','2017-07-01 15:30:53.000000',278,0,17,1,1,4),(31,'image-2017-06-29T15:30:58.5689541.jpg',26,'2017-06-30 10:59:49.075469','2017-06-29 15:31:16.000000','2017-07-01 15:31:16.000000',26,0,6,1,1,4),(32,'image-2017-06-29T15:31:20.5406651.jpg',227,'2017-06-30 11:00:05.234948','2017-06-29 15:31:32.000000','2017-07-01 15:31:32.000000',227,0,14,1,1,4),(33,'image-2017-06-29T15:31:39.9136041.jpg',522,'2017-06-30 11:00:47.164367','2017-06-29 15:32:14.000000','2017-07-01 15:32:14.000000',127,0,7,1,1,4),(34,'image-2017-06-29T15:32:21.9487651.jpg',521,'2017-06-30 11:01:22.451883','2017-06-29 15:32:50.000000','2017-07-01 15:32:50.000000',0,0,7,1,1,1),(35,'image-2017-06-29T15:19:55.8974521.jpg',0,'2017-06-30 11:06:49.560292','2017-06-29 15:20:50.000000','2017-07-01 15:20:50.000000',0,0,17,1,1,1),(36,'image-2017-06-29T15:29:48.7780041.jpg',279,'2017-06-30 11:16:18.660499','2017-06-29 15:30:19.000000','2017-07-01 15:30:19.000000',279,0,17,1,1,1),(37,'image-2017-06-29T15:31:33.3004481.jpg',197,'2017-06-30 11:17:56.926523','2017-06-29 15:31:57.000000','2017-07-01 15:31:57.000000',197,0,7,1,1,1),(38,'image-2017-06-29T15:40:26.2789551.jpg',277,'2017-06-30 11:26:46.965321','2017-06-29 15:40:47.000000','2017-07-01 15:40:47.000000',277,0,17,1,1,1),(39,'image-2017-06-29T15:41:00.0035601.jpg',229,'2017-06-30 11:27:17.830729','2017-06-29 15:41:18.000000','2017-07-01 15:41:18.000000',0,0,14,1,1,2),(40,'image-2017-06-29T15:44:53.4033531.jpg',279,'2017-06-30 11:31:31.384952','2017-06-29 15:45:31.000000','2017-07-01 15:45:31.000000',0,0,17,1,1,1),(41,'image-2017-06-29T15:53:53.2615741.jpg',277,'2017-06-30 11:40:41.162875','2017-06-29 15:54:41.000000','2017-07-01 15:54:41.000000',0,0,17,1,1,1),(42,'image-2017-06-29T16:08:04.3037621.jpg',372,'2017-06-30 11:54:31.057372','2017-06-29 16:08:31.000000','2017-07-01 16:08:31.000000',0,0,17,1,1,1),(43,'image-2017-06-29T16:08:35.8764321.jpg',14,'2017-06-30 11:54:52.409035','2017-06-29 16:08:52.000000','2017-07-01 16:08:52.000000',0,0,17,1,1,1),(44,'image-2017-06-29T16:09:03.6864481.jpg',47,'2017-06-30 11:55:22.215641','2017-06-29 16:09:22.000000','2017-07-01 16:09:22.000000',0,0,6,1,1,1),(45,'image-2017-06-29T16:09:48.7290031.jpg',372,'2017-06-30 11:56:26.641832','2017-06-29 16:10:26.000000','2017-07-01 16:10:26.000000',0,0,17,1,1,1),(46,'image-2017-06-29T16:16:40.4142321.jpg',520,'2017-06-30 12:03:16.307337','2017-06-29 16:17:16.000000','2017-07-01 16:17:16.000000',0,0,7,1,1,2),(47,'image-2017-06-29T16:17:22.4993211.jpg',754,'2017-06-30 12:03:44.883190','2017-06-29 16:17:45.000000','2017-07-01 16:17:45.000000',0,0,7,1,1,1),(48,'image-2017-06-29T16:17:48.8923571.jpg',763,'2017-06-30 12:04:03.528343','2017-06-29 16:18:03.000000','2017-07-01 16:18:03.000000',0,0,14,1,1,1),(49,'image-2017-06-29T16:18:09.6372041.jpg',814,'2017-06-30 12:04:27.030435','2017-06-29 16:18:27.000000','2017-07-01 16:18:27.000000',0,0,14,1,1,1),(50,'image-2017-06-29T16:18:29.9817981.jpg',65,'2017-06-30 12:04:43.595066','2017-06-29 16:18:43.000000','2017-07-01 16:18:43.000000',0,0,6,1,1,1),(51,'image-2017-06-29T16:18:47.5403241.jpg',55,'2017-06-30 12:04:58.710682','2017-06-29 16:18:58.000000','2017-07-01 16:18:58.000000',0,0,6,1,1,1),(52,'image-2017-06-29T16:23:36.7246061.jpg',375,'2017-06-30 12:10:08.857783','2017-06-29 16:24:08.000000','2017-07-01 16:24:08.000000',0,0,17,1,1,1),(53,'image-2017-06-29T16:38:12.8863921.jpg',369,'2017-06-30 12:24:50.239511','2017-06-29 16:38:49.000000','2017-07-01 16:38:49.000000',0,0,17,1,1,1),(54,'image-2017-06-29T16:58:05.0422871.jpg',21,'2017-06-30 12:44:16.644624','2017-06-29 16:58:16.000000','2017-07-01 16:58:16.000000',0,0,6,1,1,1),(55,'image-2017-06-29T16:58:20.1574551.jpg',512,'2017-06-30 12:46:21.341116','2017-06-29 17:00:22.000000','2017-07-01 17:00:22.000000',0,0,7,1,1,2),(56,'image-2017-06-29T17:00:26.4911401.jpg',75,'2017-06-30 12:46:58.207847','2017-06-29 17:00:59.000000','2017-07-01 17:00:59.000000',0,0,17,1,1,1),(57,'image-2017-06-29T17:01:07.3559531.jpg',218,'2017-06-30 12:49:32.139326','2017-06-29 17:03:33.000000','2017-07-01 17:03:33.000000',0,0,14,1,1,4),(58,'image-2017-06-29T17:03:41.2263911.jpg',2,'2017-06-30 12:50:03.919108','2017-06-29 17:04:04.000000','2017-07-01 17:04:04.000000',0,0,14,1,1,1),(59,'image-2017-06-29T17:04:27.2819781.jpg',514,'2017-06-30 12:51:10.068371','2017-06-29 17:05:10.000000','2017-07-01 17:05:10.000000',0,0,7,1,1,1),(60,'image-2017-06-29T17:05:29.4505611.jpg',509,'2017-06-30 12:51:47.876997','2017-06-29 17:05:48.000000','2017-07-01 17:05:48.000000',0,0,7,1,1,2),(61,'image-2017-06-29T17:05:54.8829651.jpg',528,'2017-06-30 12:52:17.614468','2017-06-29 17:06:18.000000','2017-07-01 17:06:18.000000',0,0,7,1,1,5),(62,'image-2017-06-29T16:18:51.5158921.jpg',26,'2017-06-30 12:54:54.675444','2017-06-29 16:19:05.000000','2017-07-01 16:19:05.000000',0,0,6,1,1,1),(63,'image-2017-06-29T16:18:10.5305491.jpg',395,'2017-06-30 13:02:59.573845','2017-06-29 16:18:51.000000','2017-07-01 16:18:51.000000',0,0,17,1,1,1),(64,'image-2017-06-29T16:30:10.5740631.jpg',0,'2017-06-30 13:19:02.187340','2017-06-29 16:34:54.000000','2017-07-01 16:34:54.000000',0,0,6,1,1,1),(65,'image-2017-06-29T16:35:00.4819521.jpg',209,'2017-06-30 13:38:34.932649','2017-06-29 16:54:27.000000','2017-07-01 16:54:27.000000',0,0,30,1,1,1),(66,'image-2017-06-29T16:54:36.2926351.jpg',253,'2017-06-30 13:39:35.109149','2017-06-29 16:55:27.000000','2017-07-01 16:55:27.000000',0,0,17,1,1,1),(67,'image-2017-06-29T16:55:32.7841431.jpg',0,'2017-06-30 13:40:07.937054','2017-06-29 16:56:00.000000','2017-07-01 16:56:00.000000',0,0,17,1,1,1),(68,'image-2017-06-29T16:56:06.2642851.jpg',0,'2017-06-30 13:40:26.962240','2017-06-29 16:56:19.000000','2017-07-01 16:56:19.000000',0,0,6,1,1,1),(69,'image-2017-06-29T16:56:33.5022731.jpg',387,'2017-06-30 13:41:16.107860','2017-06-29 16:57:08.000000','2017-07-01 16:57:08.000000',0,0,7,1,1,1),(70,'image-2017-06-29T17:10:17.2909311.jpg',249,'2017-06-30 13:54:54.329637','2017-06-29 17:10:46.000000','2017-07-01 17:10:46.000000',0,0,17,1,1,1),(71,'image-2017-06-29T17:12:20.8788161.jpg',321,'2017-06-30 13:56:44.394280','2017-06-29 17:12:36.000000','2017-07-01 17:12:36.000000',0,0,17,1,1,1),(72,'image-2017-06-29T17:12:49.4306681.jpg',0,'2017-06-30 13:57:16.457316','2017-06-29 17:13:08.000000','2017-07-01 17:13:08.000000',0,0,6,1,1,1),(73,'image-2017-06-29T17:17:35.1695671.jpg',188,'2017-06-30 14:02:22.542544','2017-06-29 17:18:14.000000','2017-07-01 17:18:14.000000',0,0,17,1,1,1),(74,'image-2017-06-29T17:36:36.8862011.jpg',23,'2017-06-30 14:20:59.125112','2017-06-29 17:36:50.000000','2017-07-01 17:36:50.000000',0,0,4,1,1,4),(75,'image-2017-06-29T17:36:57.8289071.jpg',0,'2017-06-30 14:21:16.935978','2017-06-29 17:37:08.000000','2017-07-01 17:37:08.000000',0,0,4,1,1,4),(76,'image-2017-06-29T17:37:11.6980531.jpg',0,'2017-06-30 14:21:33.664645','2017-06-29 17:37:24.000000','2017-07-01 17:37:24.000000',0,0,4,1,1,4),(77,'image-2017-06-29T17:37:32.3868371.jpg',1022,'2017-06-30 14:21:58.275499','2017-06-29 17:37:50.000000','2017-07-01 17:37:50.000000',0,0,4,1,1,4),(78,'image-2017-06-29T17:37:55.6269041.jpg',23,'2017-06-30 14:22:25.430683','2017-06-29 17:38:17.000000','2017-07-01 17:38:17.000000',0,0,4,1,1,4),(79,'image-2017-06-29T17:38:19.2191261.jpg',21,'2017-06-30 14:22:41.300778','2017-06-29 17:38:33.000000','2017-07-01 17:38:33.000000',0,0,4,1,1,4),(80,'image-2017-06-29T17:43:31.2239791.jpg',185,'2017-06-30 14:28:07.766550','2017-06-29 17:43:59.000000','2017-07-01 17:43:59.000000',0,0,17,1,1,1),(81,'image-2017-06-29T17:55:52.8929421.jpg',185,'2017-06-30 14:40:38.502661','2017-06-29 17:56:30.000000','2017-07-01 17:56:30.000000',0,0,17,1,1,1),(82,'image-2017-06-29T18:03:05.7572481.jpg',184,'2017-06-30 14:48:06.820539','2017-06-29 18:03:58.000000','2017-07-01 18:03:58.000000',0,0,17,1,1,2),(83,'image-2017-06-29T18:04:44.8654941.jpg',0,'2017-06-30 14:53:46.720370','2017-06-29 18:09:38.000000','2017-07-01 18:09:38.000000',0,0,6,1,1,4),(84,'image-2017-06-29T18:10:31.1450161.jpg',294,'2017-06-30 14:55:10.062435','2017-06-29 18:11:01.000000','2017-07-01 18:11:01.000000',0,0,17,1,1,1),(85,'image-2017-06-29T18:16:53.9736011.jpg',51,'2017-06-30 15:01:36.197797','2017-06-29 18:17:27.000000','2017-07-01 18:17:27.000000',0,0,6,1,1,1),(86,'image-2017-06-29T18:30:57.4762861.jpg',160,'2017-06-30 15:15:23.819661','2017-06-29 18:31:15.000000','2017-07-01 18:31:15.000000',0,0,17,1,1,1),(87,'image-2017-06-29T18:31:47.0201611.jpg',161,'2017-06-30 15:16:28.485065','2017-06-29 18:32:20.000000','2017-07-01 18:32:20.000000',0,0,17,1,1,1),(88,'image-2017-06-29T18:32:26.8921511.jpg',481,'2017-06-30 15:17:04.672805','2017-06-29 18:32:56.000000','2017-07-01 18:32:56.000000',0,0,17,1,1,1),(89,'image-2017-06-29T18:34:00.2785581.jpg',419,'2017-06-30 15:18:44.076790','2017-06-29 18:34:35.000000','2017-07-01 18:34:35.000000',0,0,22,1,1,1),(90,'image-2017-06-29T18:34:39.0040121.jpg',203,'2017-06-30 15:18:59.254303','2017-06-29 18:34:50.000000','2017-07-01 18:34:50.000000',0,0,14,1,1,1),(91,'image-2017-06-29T18:34:53.1916151.jpg',205,'2017-06-30 15:19:31.418345','2017-06-29 18:35:23.000000','2017-07-01 18:35:23.000000',0,0,14,1,1,1),(92,'image-2017-06-29T18:35:27.7686531.jpg',257,'2017-06-30 15:19:53.044603','2017-06-29 18:35:44.000000','2017-07-01 18:35:44.000000',0,0,17,1,1,1),(93,'image-2017-06-29T18:35:56.2231191.jpg',286,'2017-06-30 15:20:35.719368','2017-06-29 18:36:27.000000','2017-07-01 18:36:27.000000',0,0,17,1,1,1),(94,'image-2017-06-29T18:37:22.6124881.jpg',283,'2017-06-30 15:21:59.804079','2017-06-29 18:37:51.000000','2017-07-01 18:37:51.000000',0,0,17,1,1,2),(95,'image-2017-06-29T18:40:35.6305581.jpg',285,'2017-06-30 15:25:29.063909','2017-06-29 18:41:20.000000','2017-07-01 18:41:20.000000',0,0,17,1,1,2),(96,'image-2017-06-29T18:21:44.8699601.jpg',0,'2017-06-30 15:31:42.769702','2017-06-29 18:22:09.000000','2017-07-01 18:22:09.000000',0,0,14,1,1,11),(97,'image-2017-06-29T18:28:36.3002171.jpg',130,'2017-06-30 15:38:44.070525','2017-06-29 18:29:10.000000','2017-07-01 18:29:10.000000',0,0,17,1,1,1),(98,'image-2017-06-29T18:36:48.8763241.jpg',570,'2017-06-30 15:46:44.570164','2017-06-29 18:37:10.000000','2017-07-01 18:37:10.000000',0,0,6,1,1,1),(99,'image-2017-06-29T18:37:15.2736061.jpg',304,'2017-06-30 15:47:54.244485','2017-06-29 18:38:20.000000','2017-07-01 18:38:20.000000',0,0,30,1,1,11),(100,'image-2017-06-29T18:40:46.0150441.jpg',0,'2017-06-30 15:50:46.594210','2017-06-29 18:41:12.000000','2017-07-01 18:41:12.000000',0,0,14,1,1,1),(101,'image-2017-06-29T18:48:30.3326191.jpg',0,'2017-06-30 15:58:40.791498','2017-06-29 18:49:06.000000','2017-07-01 18:49:06.000000',0,0,17,1,1,1),(102,'image-2017-06-29T18:58:33.9468151.jpg',161,'2017-06-30 16:08:58.691642','2017-06-29 18:59:24.000000','2017-07-01 18:59:24.000000',0,0,17,1,1,1),(103,'image-2017-06-29T19:14:05.0465121.jpg',159,'2017-06-30 16:24:46.190332','2017-06-29 19:15:12.000000','2017-07-01 19:15:12.000000',0,0,17,1,1,1),(104,'image-2017-06-29T19:16:35.1054871.jpg',159,'2017-06-30 16:26:33.861608','2017-06-29 19:16:59.000000','2017-07-01 19:16:59.000000',0,0,17,1,1,1),(105,'image-2017-06-29T19:20:18.6019671.jpg',159,'2017-06-30 16:30:30.465574','2017-06-29 19:20:56.000000','2017-07-01 19:20:56.000000',0,0,17,1,1,1),(106,'image-2017-06-29T19:25:56.6379791.jpg',8,'2017-06-30 16:36:28.067739','2017-06-29 19:26:54.000000','2017-07-01 19:26:54.000000',0,0,14,1,1,1),(107,'image-2017-06-29T19:36:59.1396761.jpg',154,'2017-06-30 16:47:08.601793','2017-06-29 19:37:34.000000','2017-07-01 19:37:34.000000',0,0,17,1,1,1),(108,'image-2017-06-29T19:39:29.7083651.jpg',0,'2017-06-30 16:49:38.780575','2017-06-29 19:40:04.000000','2017-07-01 19:40:04.000000',0,0,6,1,1,1),(109,'image-2017-06-29T19:40:33.4804691.jpg',2283,'2017-06-30 16:50:24.078247','2017-06-29 19:40:50.000000','2017-07-01 19:40:50.000000',0,0,6,1,1,1),(110,'image-2017-06-29T19:40:55.6786821.jpg',3449,'2017-06-30 16:50:56.237695','2017-06-29 19:41:22.000000','2017-07-01 19:41:22.000000',0,0,6,1,1,4),(111,'image-2017-06-29T19:42:11.4827481.jpg',159,'2017-06-30 16:52:31.977442','2017-06-29 19:42:57.000000','2017-07-01 19:42:57.000000',0,0,17,1,1,1),(112,'image-2017-06-29T19:45:04.7905041.jpg',161,'2017-06-30 16:55:31.038679','2017-06-29 19:45:56.000000','2017-07-01 19:45:56.000000',0,0,17,1,1,1),(113,'image-2017-06-29T19:51:20.9773551.jpg',159,'2017-06-30 17:01:23.874024','2017-06-29 19:51:49.000000','2017-07-01 19:51:49.000000',0,0,17,1,1,1),(114,'image-2017-06-29T19:59:23.7948171.jpg',0,'2017-06-30 17:09:31.765816','2017-06-29 19:59:57.000000','2017-07-01 19:59:57.000000',0,0,17,1,1,1),(115,'image-2017-06-29T20:13:14.7622491.jpg',369,'2017-06-30 17:24:06.547963','2017-06-29 20:14:32.000000','2017-07-01 20:14:32.000000',0,0,17,1,1,2),(116,'image-2017-06-29T20:14:39.1462711.jpg',222,'2017-06-30 17:24:36.942704','2017-06-29 20:15:02.000000','2017-07-01 20:15:02.000000',0,0,14,1,1,1),(117,'image-2017-06-29T20:17:33.3373711.jpg',222,'2017-06-30 17:27:42.307118','2017-06-29 20:18:08.000000','2017-07-01 20:18:08.000000',0,0,14,1,1,1),(118,'image-2017-06-29T20:18:13.2881681.jpg',373,'2017-06-30 17:28:01.615294','2017-06-29 20:18:27.000000','2017-07-01 20:18:27.000000',0,0,17,1,1,1),(119,'image-2017-06-29T20:30:04.3650321.jpg',371,'2017-06-30 17:40:09.991247','2017-06-29 20:30:36.000000','2017-07-01 20:30:36.000000',0,0,17,1,1,1),(120,'image-2017-06-29T20:30:39.6048191.jpg',373,'2017-06-30 17:45:31.445294','2017-06-29 20:35:57.000000','2017-07-01 20:35:57.000000',0,0,17,1,1,1),(121,'image-2017-06-29T20:37:30.4418191.jpg',372,'2017-06-30 17:48:05.183237','2017-06-29 20:38:31.000000','2017-07-01 20:38:31.000000',0,0,17,1,1,1),(122,'image-2017-06-29T20:38:39.5909761.jpg',222,'2017-06-30 17:49:04.591136','2017-06-29 20:39:30.000000','2017-07-01 20:39:30.000000',0,0,14,1,1,1),(123,'image-2017-06-29T20:42:44.7289951.jpg',518,'2017-06-30 17:53:00.635443','2017-06-29 20:43:26.000000','2017-07-01 20:43:26.000000',0,0,7,1,1,1),(124,'image-2017-07-03T10:32:25.6146711.jpg',58,'2017-07-03 10:43:20.415850','2017-07-03 10:33:20.000000','2017-07-05 10:33:20.000000',0,0,7,1,1,1),(125,'image-2017-07-03T10:40:30.6629751.jpg',1285,'2017-07-03 10:43:22.202045','2017-07-03 10:41:23.000000','2017-07-05 10:41:23.000000',0,0,30,1,1,1);
/*!40000 ALTER TABLE `farmapp_produce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmapp_review`
--

DROP TABLE IF EXISTS `farmapp_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmapp_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` double NOT NULL,
  `review` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `cart_id_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `farmapp_review_cart_id_id_cfef5f69_fk_farmapp_cart_cart_id` (`cart_id_id`),
  KEY `farmapp_review_customer_id_83a44691_fk_farmapp_user_id` (`customer_id`),
  KEY `farmapp_review_user_id_id_46a76167_fk_farmapp_user_id` (`user_id_id`),
  CONSTRAINT `farmapp_review_cart_id_id_cfef5f69_fk_farmapp_cart_cart_id` FOREIGN KEY (`cart_id_id`) REFERENCES `farmapp_cart` (`cart_id`),
  CONSTRAINT `farmapp_review_customer_id_83a44691_fk_farmapp_user_id` FOREIGN KEY (`customer_id`) REFERENCES `farmapp_user` (`id`),
  CONSTRAINT `farmapp_review_user_id_id_46a76167_fk_farmapp_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `farmapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_review`
--

LOCK TABLES `farmapp_review` WRITE;
/*!40000 ALTER TABLE `farmapp_review` DISABLE KEYS */;
INSERT INTO `farmapp_review` VALUES (1,5,'nice..','2017-06-30 10:54:42.516383',16,2,3),(2,5,'nice..\r\n','2017-06-30 12:29:54.540066',17,2,3),(3,4,'ok','2017-06-30 13:08:14.391612',25,2,3),(4,5,'good produce','2017-06-30 14:21:28.412230',29,2,3);
/*!40000 ALTER TABLE `farmapp_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmapp_user`
--

DROP TABLE IF EXISTS `farmapp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmapp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `address_line1` varchar(100) DEFAULT NULL,
  `address_line2` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `pin_code` varchar(20) DEFAULT NULL,
  `user_type` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `last_cart_id` int(11) DEFAULT NULL,
  `login_count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `farmapp_user_last_cart_id_e22636f5_fk_farmapp_cart_cart_id` (`last_cart_id`),
  CONSTRAINT `farmapp_user_last_cart_id_e22636f5_fk_farmapp_cart_cart_id` FOREIGN KEY (`last_cart_id`) REFERENCES `farmapp_cart` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_user`
--

LOCK TABLES `farmapp_user` WRITE;
/*!40000 ALTER TABLE `farmapp_user` DISABLE KEYS */;
INSERT INTO `farmapp_user` VALUES (1,'bcrypt_sha256$$2b$12$z9qlsOpomO8NEg48cge3Y.b9OBrQ0rvfF3IKWZgOZRB4fMS8FOKI6','2017-06-30 10:40:32.493594','keivan@gmail.com','Keivan','Shah','Guest House','IIT B, Powai','Maharashtra','India','400001','Consumer','9876543210',1,1,12,4),(2,'bcrypt_sha256$$2b$12$Y7.VE.xaFl6xzk9BQR5WReZvv.MpFCBlYZIH2fq/Yzl17Ssqh9Z42','2017-06-30 17:44:15.363263','hemang@gmail.com','Hemang','Gandhi','401 Trishala CHS , Charkop sector 2,','Kandivali West ,Mumbai','Maharashtra','India','400067','Consumer','9876543210',1,0,NULL,13),(3,'bcrypt_sha256$$2b$12$0SYSbg1SlZNdBSSwYsGMkuVG24YsTcrOEJ7nSEw8nQGYoZ4VE6WJe','2017-06-30 17:53:24.729448','sanket@gmail.com','Sanket','Shanbhag','IIT B','Powai, Mumbai','Maharashtra','India','400001','Producer','9876543210',1,1,NULL,5),(5,'bcrypt_sha256$$2b$12$9tf4rdMT8FzAyHDWJPUI2uvLooaeOl4rKaXwI/eS/HiFa1TgWtuXq','2017-06-28 11:52:57.674091','supriya.suresh@ves.ac.in','Supriya','Suresh','IIT Bombay','Hostel 10, N309','Maharashtra','India','400031','Consumer','9969515159',1,0,9,1),(15,'bcrypt_sha256$$2b$12$13KKp4leVsC3K7uNBUAqkevidlYEvBgaVK9Xo0UY/bWw4.s0yXbiW','2017-06-29 16:34:36.542413','keivan.shah@gmail.com','Keivan','Shah','qwerty','asdfghjk','Maharashtra','India','123456789','Consumer','9757230590',1,0,NULL,1),(16,'bcrypt_sha256$$2b$12$aZFiZBT/8sWGSgv6ZhV6suoh3wc8fvgrXdUzA9q2vlRz1v.Zp7sAG','2017-06-29 22:27:05.676472','hema@wric.ac.in','hema','shah','aaaaaa','bbbbb','maha','india','400001','Consumer','02226534631',1,0,NULL,1),(17,'bcrypt_sha256$$2b$12$rst0dYYluWVJmSz6lktpW.wbU6MPA1es87sM6KJtKDEn.J9EBsQN2','2017-06-29 23:18:14.796684','producer@gmail.com','Producer','produce',NULL,NULL,NULL,NULL,NULL,'Producer','9876543210',1,0,NULL,2),(18,'bcrypt_sha256$$2b$12$DBXRvx6doW97PGUlTcygEOWo2KKSjXtskNDhfgRNtcDwCD7rnj2UW','2017-06-30 00:04:22.817901','consumer@gmail.com','Consumer','consume',NULL,NULL,NULL,NULL,NULL,'Consumer','9876543210',1,0,NULL,2),(19,'bcrypt_sha256$$2b$12$B2rhASN8xEgCRNVj.Gsy6upYF0byGnzY3yCd.wIJZrWCK/LwfnZj.','2017-06-30 11:00:16.346290','rattzzz07@gmail.com','Rutuja','Ekatpure','ERTS Lab','IIT Powai','Maharashtra','India','400076','Consumer','9665924979',1,0,NULL,1),(20,'bcrypt_sha256$$2b$12$xrVa/Il1/dhDgXYDwYO1deVdzS43UTG.DyOxG/OF/LaA.wKj2un3y','2017-06-30 11:50:57.784592','lohit@e-yantra.org','Lohit','Penubaku','SIC 102, KReSIT Building','IIT Bombay','Maharashtra','India','400076','Consumer','9886845123',1,0,22,1),(21,'bcrypt_sha256$$2b$12$l.zuOOrjs1f2qyt1UrddaOVn3w7gRDXiD2XWsfxwXT8BWlAh3mcLS','2017-06-30 13:09:36.724018','adityapanwar01@gmail.com','Aditya','Panwar',NULL,NULL,NULL,NULL,NULL,'Consumer','7977628948',1,0,NULL,1);
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

-- Dump completed on 2017-07-03 10:48:58
