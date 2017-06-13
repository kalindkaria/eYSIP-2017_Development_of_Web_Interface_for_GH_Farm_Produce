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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$9FZpMkQsQXQA$YjuFel1LiAh7eNdhgTgXSR5+dvwluUL2lWtm/Vvwhhg=','2017-06-13 06:34:38.746560',1,'keivan','','','keivanshahh@gmail.com',1,1,'2017-06-02 11:29:55.386698');
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
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-06-03 05:23:51.076952','1','keivan@gmail.com',1,'[{\"added\": {}}]',12,1),(2,'2017-06-03 10:32:19.390456','2','hemang@gmail.com',1,'[{\"added\": {}}]',12,1),(3,'2017-06-04 17:13:31.779765','1','Okra',1,'[{\"added\": {}}]',14,1),(4,'2017-06-04 17:13:56.336695','1','Okra',3,'',14,1),(5,'2017-06-05 14:14:29.409539','1','Amaranthus Green',1,'[{\"added\": {}}]',14,1),(6,'2017-06-05 14:16:43.098236','2','Amaranthus Red',1,'[{\"added\": {}}]',14,1),(7,'2017-06-05 14:21:28.867423','3','Baby Fenugreek',1,'[{\"added\": {}}]',14,1),(8,'2017-06-05 14:23:25.460027','4','Basil',1,'[{\"added\": {}}]',14,1),(9,'2017-06-05 14:27:28.507468','5','Beetroot',1,'[{\"added\": {}}]',14,1),(10,'2017-06-05 14:31:51.291882','6','Bitter Gourd',1,'[{\"added\": {}}]',14,1),(11,'2017-06-05 14:33:40.722572','7','Bottle Gourd',1,'[{\"added\": {}}]',14,1),(12,'2017-06-05 14:35:36.592024','8','Brinjal',1,'[{\"added\": {}}]',14,1),(13,'2017-06-05 14:37:13.209764','9','Cabbage',1,'[{\"added\": {}}]',14,1),(14,'2017-06-05 14:39:05.700575','10','Cauliflower',1,'[{\"added\": {}}]',14,1),(15,'2017-06-05 14:41:22.868041','11','Chilli',1,'[{\"added\": {}}]',14,1),(16,'2017-06-05 14:42:30.084867','12','Cluster Beans',1,'[{\"added\": {}}]',14,1),(17,'2017-06-05 14:44:17.495813','13','Coriander',1,'[{\"added\": {}}]',14,1),(18,'2017-06-05 14:49:19.875812','14','Cucumber',1,'[{\"added\": {}}]',14,1),(19,'2017-06-05 14:50:57.292677','15','Fenugreek',1,'[{\"added\": {}}]',14,1),(20,'2017-06-05 14:54:23.549381','16','Iceberg Lettuce',1,'[{\"added\": {}}]',14,1),(21,'2017-06-05 14:56:03.301715','17','Ladyfinger',1,'[{\"added\": {}}]',14,1),(22,'2017-06-05 14:59:17.215708','18','Lemon Grass',1,'[{\"added\": {}}]',14,1),(23,'2017-06-05 15:01:26.547751','19','Lollo Rosso',1,'[{\"added\": {}}]',14,1),(24,'2017-06-05 15:02:37.957663','20','Maize',1,'[{\"added\": {}}]',14,1),(25,'2017-06-05 15:03:56.224182','21','Mustard',1,'[{\"added\": {}}]',14,1),(26,'2017-06-05 15:06:11.180921','22','Onion',1,'[{\"added\": {}}]',14,1),(27,'2017-06-05 15:07:41.004611','23','Parsley',1,'[{\"added\": {}}]',14,1),(28,'2017-06-05 15:09:33.993421','24','Radish',1,'[{\"added\": {}}]',14,1),(29,'2017-06-05 15:11:45.037777','25','Ridge Gourd',1,'[{\"added\": {}}]',14,1),(30,'2017-06-05 15:13:51.813113','26','Snake Gourd',1,'[{\"added\": {}}]',14,1),(31,'2017-06-05 15:15:10.663952','27','Spinach',1,'[{\"added\": {}}]',14,1),(32,'2017-06-05 15:17:52.294698','28','Termari Leaf',1,'[{\"added\": {}}]',14,1),(33,'2017-06-05 15:19:53.360778','29','Turmeric',1,'[{\"added\": {}}]',14,1),(34,'2017-06-05 15:20:56.948492','30','Tomato',1,'[{\"added\": {}}]',14,1),(35,'2017-06-06 04:15:13.814920','1','1',1,'[{\"added\": {}}]',11,1),(36,'2017-06-06 04:15:44.496001','2','2',1,'[{\"added\": {}}]',11,1),(37,'2017-06-06 04:16:20.909769','1','1',1,'[{\"added\": {}}]',13,1),(38,'2017-06-06 04:16:30.461053','2','1',1,'[{\"added\": {}}]',13,1),(39,'2017-06-06 04:16:35.784983','3','2',1,'[{\"added\": {}}]',13,1),(40,'2017-06-06 04:16:41.416461','4','2',1,'[{\"added\": {}}]',13,1),(41,'2017-06-06 04:29:31.342209','2','hemang@gmail.com',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',12,1),(42,'2017-06-06 04:29:47.639292','1','keivan@gmail.com',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',12,1),(43,'2017-06-12 09:29:35.925744','28','TurmericL',2,'[{\"changed\": {\"fields\": [\"english_name\"]}}]',14,1),(44,'2017-06-12 09:30:43.329783','28','Termari Leaf',2,'[{\"changed\": {\"fields\": [\"english_name\"]}}]',14,1),(45,'2017-06-12 09:45:16.590814','30','Tomato',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(46,'2017-06-12 09:45:25.485346','29','Turmeric',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(47,'2017-06-12 09:45:49.507720','28','Termari Leaf',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(48,'2017-06-12 09:45:57.659011','27','Spinach',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(49,'2017-06-12 09:46:15.053951','26','Snake Gourd',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(50,'2017-06-12 09:46:26.433624','25','Ridge Gourd',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(51,'2017-06-12 09:46:34.141902','24','Radish',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(52,'2017-06-12 09:46:44.444769','23','Parsley',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(53,'2017-06-12 09:46:53.470349','22','Onion',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(54,'2017-06-12 09:47:03.122045','21','Mustard',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(55,'2017-06-12 09:47:12.293474','20','Maize',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(56,'2017-06-12 09:47:22.142996','19','Lollo Rosso',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(57,'2017-06-12 09:47:32.100310','18','Lemon Grass',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(58,'2017-06-12 09:47:41.235856','17','Ladyfinger',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(59,'2017-06-12 09:47:52.667232','16','Iceberg Lettuce',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(60,'2017-06-12 09:48:01.316302','15','Fenugreek',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(61,'2017-06-12 09:48:11.909945','14','Cucumber',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(62,'2017-06-12 09:48:21.801580','13','Coriander',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(63,'2017-06-12 09:48:37.258878','12','Cluster Beans',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(64,'2017-06-12 09:48:46.964564','11','Chilli',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(65,'2017-06-12 09:48:55.738418','10','Cauliflower',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(66,'2017-06-12 09:49:04.968990','9','Cabbage',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(67,'2017-06-12 09:49:18.781886','10','Cauliflower',2,'[]',14,1),(68,'2017-06-12 09:49:25.562150','9','Cabbage',2,'[]',14,1),(69,'2017-06-12 09:49:35.199338','8','Brinjal',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(70,'2017-06-12 09:49:45.732030','7','Bottle Gourd',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(71,'2017-06-12 09:49:55.210229','6','Bitter Gourd',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(72,'2017-06-12 09:50:04.817430','5','Beetroot',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(73,'2017-06-12 09:50:13.114751','4','Basil',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(74,'2017-06-12 09:51:08.900645','3','Baby Fenugreek',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(75,'2017-06-12 09:51:20.106365','2','Amaranthus Red',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(76,'2017-06-12 09:51:29.485627','1','Amaranthus Green',2,'[{\"changed\": {\"fields\": [\"short_name\"]}}]',14,1),(77,'2017-06-13 06:34:53.841410','15','Hemang - Coriander',3,'',9,1),(78,'2017-06-13 06:34:53.907491','14','Hemang - Ladyfinger',3,'',9,1),(79,'2017-06-13 06:34:53.951972','13','Hemang - Coriander',3,'',9,1),(80,'2017-06-13 06:34:53.996332','12','Hemang - Spinach',3,'',9,1),(81,'2017-06-13 06:34:54.040783','11','Hemang - Onion',3,'',9,1),(82,'2017-06-13 06:34:54.085158','10','Hemang - Spinach',3,'',9,1),(83,'2017-06-13 06:34:54.129464','9','Hemang - Coriander',3,'',9,1),(84,'2017-06-13 06:34:54.173889','8','Hemang - Ladyfinger',3,'',9,1),(85,'2017-06-13 06:34:54.218280','7','Hemang - Ladyfinger',3,'',9,1),(86,'2017-06-13 06:34:54.263262','6','Hemang - Ladyfinger',3,'',9,1),(87,'2017-06-13 06:34:54.351849','5','Hemang - Ladyfinger',3,'',9,1),(88,'2017-06-13 06:34:54.440693','4','Hemang - Ladyfinger',3,'',9,1),(89,'2017-06-13 06:34:54.485111','3','Hemang - Brinjal',3,'',9,1),(90,'2017-06-13 06:34:54.529550','2','Hemang - Cabbage',3,'',9,1),(91,'2017-06-13 06:34:54.574038','1','Hemang - Baby Fenugreek',3,'',9,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'farm','0001_initial','2017-05-30 10:01:02.963687'),(2,'contenttypes','0001_initial','2017-05-31 05:13:49.555143'),(3,'auth','0001_initial','2017-05-31 05:13:56.890595'),(4,'admin','0001_initial','2017-05-31 05:13:58.513280'),(5,'admin','0002_logentry_remove_auto_add','2017-05-31 05:13:58.634160'),(6,'contenttypes','0002_remove_content_type_name','2017-05-31 05:13:59.632479'),(7,'auth','0002_alter_permission_name_max_length','2017-05-31 05:13:59.744892'),(8,'auth','0003_alter_user_email_max_length','2017-05-31 05:13:59.867378'),(9,'auth','0004_alter_user_username_opts','2017-05-31 05:13:59.924420'),(10,'auth','0005_alter_user_last_login_null','2017-05-31 05:14:00.434010'),(11,'auth','0006_require_contenttypes_0002','2017-05-31 05:14:00.478645'),(12,'auth','0007_alter_validators_add_error_messages','2017-05-31 05:14:00.537815'),(13,'auth','0008_alter_user_username_max_length','2017-05-31 05:14:00.909947'),(14,'farmapp','0001_initial','2017-05-31 05:14:14.382672'),(15,'sessions','0001_initial','2017-05-31 05:14:14.924702'),(16,'farmapp','0002_auto_20170604_1137','2017-06-04 17:10:55.690374'),(17,'farmapp','0003_auto_20170605_1930','2017-06-05 14:01:06.600454'),(18,'farmapp','0004_crop_imagepath','2017-06-05 14:03:28.658675'),(19,'farmapp','0005_auto_20170607_1313','2017-06-12 07:10:24.006452'),(20,'farmapp','0006_crop_availabilty','2017-06-12 07:10:25.084966'),(21,'farmapp','0007_auto_20170607_1612','2017-06-12 07:10:25.262608'),(22,'farmapp','0008_auto_20170608_1530','2017-06-12 07:10:25.563715'),(23,'farmapp','0009_auto_20170612_1512','2017-06-12 09:44:40.205132');
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
INSERT INTO `django_session` VALUES ('qy5mnizf5l4ddg6dyp0frefd29an6pf3','MmJjNzUzMGNkMjY1MjdhNDJjNGFhZDM4NjE1NDlmZWE2NGFkNWQzYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwibG9nZ2VkX2luIjp0cnVlLCJfYXV0aF91c2VyX2hhc2giOiJmYmJhMTRjMGFhMTYxMDRlMTVkNzliM2VlMGI4MDllMGFmYWIzMjg4IiwidXNlcl9pZCI6MiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJlbWFpbCI6ImhlbWFuZ0BnbWFpbC5jb20iLCJ1c2VyX3R5cGUiOiJQcm9kdWNlciJ9','2017-06-26 08:46:05.844144'),('w3t361qlrmvomi5i9166wjmzclufgl9g','ZmI0ZjljN2FmY2M5ZjBiMTk2MWI1NzQ3ODM0MDk0ODNhYzU2YzVkYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZmJiYTE0YzBhYTE2MTA0ZTE1ZDc5YjNlZTBiODA5ZTBhZmFiMzI4OCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-06-20 11:31:10.702269'),('xwc8fpolvyuz99h4aq6bodnpb9cmv3cg','YzY4YjNhYjUwMzk5ZmQ4MmIxYWQ2MTg3NjBlZjRlMjIyOTMyMmM0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiYmExNGMwYWExNjEwNGUxNWQ3OWIzZWUwYjgwOWUwYWZhYjMyODgiLCJ1c2VyX3R5cGUiOiJQcm9kdWNlciIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiZW1haWwiOiJoZW1hbmdAZ21haWwuY29tIiwidXNlcl9pZCI6MiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJsb2dnZWRfaW4iOnRydWV9','2017-06-27 06:34:38.791471');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_cart`
--

LOCK TABLES `farmapp_cart` WRITE;
/*!40000 ALTER TABLE `farmapp_cart` DISABLE KEYS */;
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
  `weight` double NOT NULL,
  `time` datetime(6) NOT NULL,
  `cart_id_id` int(11) NOT NULL,
  `crop_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `farmapp_cart_session_cart_id_id_4dabe9fb_fk_farmapp_cart_cart_id` (`cart_id_id`),
  KEY `farmapp_cart_session_crop_id_id_e003bfe0_fk_farmapp_crop_crop_id` (`crop_id_id`),
  CONSTRAINT `farmapp_cart_session_cart_id_id_4dabe9fb_fk_farmapp_cart_cart_id` FOREIGN KEY (`cart_id_id`) REFERENCES `farmapp_cart` (`cart_id`),
  CONSTRAINT `farmapp_cart_session_crop_id_id_e003bfe0_fk_farmapp_crop_crop_id` FOREIGN KEY (`crop_id_id`) REFERENCES `farmapp_crop` (`crop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_cart_session`
--

LOCK TABLES `farmapp_cart_session` WRITE;
/*!40000 ALTER TABLE `farmapp_cart_session` DISABLE KEYS */;
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
INSERT INTO `farmapp_crop` VALUES (1,'Amaranthus Green','Amaranthus Green','Amaranthus viridis',48,120,'crops/amaranthus_green.jpg',0,'AmaranthusG'),(2,'Amaranthus Red','Amaranthus Red','Amaranthus cruentus',44,90,'crops/amaranthus_red.jpg',0,'AmaranthusR'),(3,'Methi','Baby Fenugreek','Trigonella foenum-graecum',48,24,'crops/baby_fenugreek.jpg',0,'BFenugreek'),(4,'Tulsi','Basil','Ocimum basilicum',40,200,'crops/basil.jpeg',0,'Basil'),(5,'Chukandar','Beetroot','Beta vulgaris',120,200,'crops/beetroot.jpg',0,'Beetroot'),(6,'Karela','Bitter Gourd','Momordica charantia',120,70,'crops/bitter_gourd.jpg',0,'BitterGourd'),(7,'Lauki','Bottle Gourd','Lagenaria siceraria',200,90,'crops/bottle_gourd.jpeg',0,'BottleGourd'),(8,'Baingan','Brinjal','Solanum melongena',72,60,'crops/brinjal.jpg',0,'Brinjal'),(9,'Gobhee','Cabbage','Brassica oleracea var. capitata',120,24,'crops/cabbage.jpeg',0,'Cabbage'),(10,'Gobhee','Cauliflower','Brassica oleracea var. botrytis',120,80,'crops/cauliflower.jpeg',0,'Cauliflower'),(11,'Mirch','Chilli','Capsicum frutescens',320,40,'crops/chilly.jpeg',0,'Chilli'),(12,'Gavar','Cluster Beans','Cyamopsis tetragonoloba',48,50,'crops/cluster_bean.jpg',0,'ClusterBean'),(13,'Dhaniya','Coriander','Coriandrum sativum',75,20,'crops/coriander.jpg',0,'Coriander'),(14,'Kheera','Cucumber','Cucumis sativus',72,60,'crops/cucumber.jpg',0,'Cucumber'),(15,'Methi','Fenugreek','Trigonella foenum-graecum',70,60,'crops/fenugreek.jpeg',0,'Fenugreek'),(16,'Himashail Sabjee','Iceberg Lettuce','Lactuca sativa',96,67,'crops/iceberg_lettuce.jpeg',0,'Ice Lettuce'),(17,'Bhindi','Ladyfinger','Abelmoschus esculentus',96,60,'crops/ladyfinger.jpeg',0,'Ladyfinger'),(18,'Lemon Grass','Lemon Grass','Cymbopogon',24,100,'crops/lemongrass.jpg',0,'Lemon Grass'),(19,'Lollo Rosso','Lollo Rosso','Lactuca sativa',100,300,'crops/lollo_rosso.jpg',0,'Lollo Rosso'),(20,'Makka','Maize','Zea mays',48,40,'crops/maize.jpg',0,'Maize'),(21,'Sarason','Mustard','Brassica',48,80,'crops/mustard.jpg',0,'Mustard'),(22,'Pyaaj','Onion','Allium cepa',96,50,'crops/onion.jpg',0,'Onion'),(23,'Ajamod','Parsley','Petroselinum crispum',96,70,'crops/parsley.jpg',0,'Parsley'),(24,'Moolee','Radish','Raphanus raphanistrum subsp. sativus',72,70,'crops/radish.jpeg',0,'Radish'),(25,'Turai','Ridge Gourd','Luffa',72,120,'crops/ridge_gourd.jpg',0,'Ridge Gourd'),(26,'Padval','Snake Gourd','Trichosanthes cucumerina',72,40,'crops/snake_gourd.jpg',0,'Snake Gourd'),(27,'Palak','Spinach','Spinacia oleracea',24,90,'crops/spinach.jpeg',0,'Spinach'),(28,'Haldi Paan','Termari Leaf','Curcuma longa',72,200,'crops/termari_leaf.jpg',0,'TurmericL'),(29,'Haldi','Turmeric','Curcuma longa',960,300,'crops/turmeric.jpg',0,'Turmeric'),(30,'Tamaatar','Tomato','Solanum lycopersicum',72,40,'crops/tomato.jpg',0,'Tomato');
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
  PRIMARY KEY (`id`),
  KEY `farmapp_inventory_crop_id_id_796a261e_fk_farmapp_crop_crop_id` (`crop_id_id`),
  KEY `farmapp_inventory_user_id_id_bda51212_fk_farmapp_user_user_id` (`user_id_id`),
  CONSTRAINT `farmapp_inventory_crop_id_id_796a261e_fk_farmapp_crop_crop_id` FOREIGN KEY (`crop_id_id`) REFERENCES `farmapp_crop` (`crop_id`),
  CONSTRAINT `farmapp_inventory_user_id_id_bda51212_fk_farmapp_user_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `farmapp_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_inventory`
--

LOCK TABLES `farmapp_inventory` WRITE;
/*!40000 ALTER TABLE `farmapp_inventory` DISABLE KEYS */;
INSERT INTO `farmapp_inventory` VALUES (1,354,3,2),(2,196,9,2),(3,211,8,2),(4,2664,17,2),(5,1312,17,2),(6,1275,17,2),(7,1300,17,2),(8,1299,17,2),(9,112,13,2),(10,72,27,2),(11,77,22,2),(12,36,27,2),(13,36,13,2),(14,37,17,2),(15,104,13,2),(16,43,5,2),(17,41,9,2),(18,37,22,2),(19,37,9,2),(20,36,17,2),(21,26,9,2),(22,36,30,2);
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
  `cart_id_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `farmapp_order_cart_id_id_cb534eca_fk_farmapp_cart_cart_id` (`cart_id_id`),
  KEY `farmapp_order_seller_id_5b7e2bce_fk_farmapp_user_user_id` (`seller_id`),
  KEY `farmapp_order_user_id_id_8205f9ff_fk_farmapp_user_user_id` (`user_id_id`),
  CONSTRAINT `farmapp_order_cart_id_id_cb534eca_fk_farmapp_cart_session_id` FOREIGN KEY (`cart_id_id`) REFERENCES `farmapp_cart_session` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_produce`
--

LOCK TABLES `farmapp_produce` WRITE;
/*!40000 ALTER TABLE `farmapp_produce` DISABLE KEYS */;
INSERT INTO `farmapp_produce` VALUES (16,'image-2017-06-07T17:18:55.8360831.jpg',43,'2017-06-13 06:35:38.703725','2017-06-07 11:49:13.000000','2017-06-12 11:49:13.000000',0,5,1,1),(17,'image-2017-06-07T17:19:31.0693011.jpg',41,'2017-06-13 06:37:15.801405','2017-06-07 11:50:50.000000','2017-06-12 11:50:50.000000',0,9,1,1),(18,'image-2017-06-07T17:22:35.0084101.jpg',37,'2017-06-13 06:39:53.764841','2017-06-07 11:53:27.000000','2017-06-11 11:53:27.000000',0,22,1,1),(19,'image-2017-06-07T17:24:40.2124661.jpg',37,'2017-06-13 06:41:56.269329','2017-06-07 11:55:20.000000','2017-06-12 11:55:20.000000',0,9,1,1),(20,'image-2017-06-07T17:25:38.1284491.jpg',36,'2017-06-13 06:42:41.147639','2017-06-07 11:56:04.000000','2017-06-11 11:56:04.000000',0,17,1,1),(21,'image-2017-06-07T17:33:27.0063551.jpg',26,'2017-06-13 06:51:41.480049','2017-06-07 12:05:15.000000','2017-06-12 12:05:15.000000',0,9,1,1),(22,'image-2017-06-07T17:37:09.1372901.jpg',36,'2017-06-13 06:55:00.552039','2017-06-07 12:08:34.000000','2017-06-10 12:08:34.000000',0,30,1,1);
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
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_user`
--

LOCK TABLES `farmapp_user` WRITE;
/*!40000 ALTER TABLE `farmapp_user` DISABLE KEYS */;
INSERT INTO `farmapp_user` VALUES (1,'keivan@gmail.com','keivan','qwerty','asdfgh','zxcvbn','poiuyt','123456','Consumer','9876541345','Keivan','Shah'),(2,'hemang@gmail.com','hemang','qwertyuiop','asdfghjkl','zxcvbnm,','lkjhgfdsa','1234567890','Producer','9876543210','Hemang','Gandhi');
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

-- Dump completed on 2017-06-13 12:37:03
