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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',13,'add_group'),(5,'Can change group',13,'change_group'),(6,'Can delete group',13,'delete_group'),(7,'Can add permission',14,'add_permission'),(8,'Can change permission',14,'change_permission'),(9,'Can delete permission',14,'delete_permission'),(10,'Can add content type',2,'add_contenttype'),(11,'Can change content type',2,'change_contenttype'),(12,'Can delete content type',2,'delete_contenttype'),(13,'Can add crop',9,'add_crop'),(14,'Can change crop',9,'change_crop'),(15,'Can delete crop',9,'delete_crop'),(16,'Can add alert',4,'add_alert'),(17,'Can change alert',4,'change_alert'),(18,'Can delete alert',4,'delete_alert'),(19,'Can add inventory',10,'add_inventory'),(20,'Can change inventory',10,'change_inventory'),(21,'Can delete inventory',10,'delete_inventory'),(22,'Can add user',7,'add_user'),(23,'Can change user',7,'change_user'),(24,'Can delete user',7,'delete_user'),(25,'Can add machine',6,'add_machine'),(26,'Can change machine',6,'change_machine'),(27,'Can delete machine',6,'delete_machine'),(28,'Can add trough',11,'add_trough'),(29,'Can change trough',11,'change_trough'),(30,'Can delete trough',11,'delete_trough'),(31,'Can add order',12,'add_order'),(32,'Can change order',12,'change_order'),(33,'Can delete order',12,'delete_order'),(34,'Can add produce',3,'add_produce'),(35,'Can change produce',3,'change_produce'),(36,'Can delete produce',3,'delete_produce'),(37,'Can add cart',5,'add_cart'),(38,'Can change cart',5,'change_cart'),(39,'Can delete cart',5,'delete_cart'),(40,'Can add cart_session',8,'add_cart_session'),(41,'Can change cart_session',8,'change_cart_session'),(42,'Can delete cart_session',8,'delete_cart_session');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-06-26 11:20:54.566142','2','hemang@gmail.com',1,'[{\"added\": {}}]',7,1),(2,'2017-06-26 12:34:51.944903','3','sanket@gmail.com',2,'[{\"changed\": {\"fields\": [\"user_type\"]}}]',7,1),(3,'2017-06-26 12:39:05.226854','1','1',1,'[{\"added\": {}}]',6,1),(4,'2017-06-26 12:39:21.327389','1','1',1,'[{\"added\": {}}]',11,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(13,'auth','group'),(14,'auth','permission'),(2,'contenttypes','contenttype'),(4,'farmapp','alert'),(5,'farmapp','cart'),(8,'farmapp','cart_session'),(9,'farmapp','crop'),(10,'farmapp','inventory'),(6,'farmapp','machine'),(12,'farmapp','order'),(3,'farmapp','produce'),(11,'farmapp','trough'),(7,'farmapp','user');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'farmapp','0001_initial','2017-06-26 11:13:47.394966'),(2,'contenttypes','0001_initial','2017-06-26 11:13:47.442536'),(3,'admin','0001_initial','2017-06-26 11:13:47.529725'),(4,'admin','0002_logentry_remove_auto_add','2017-06-26 11:14:03.131400'),(5,'auth','0001_initial','2017-06-26 11:15:40.495792'),(6,'auth','0002_alter_permission_name_max_length','2017-06-26 11:15:47.970033'),(7,'auth','0003_alter_user_email_max_length','2017-06-26 11:16:13.668560'),(8,'auth','0004_alter_user_username_opts','2017-06-26 11:16:23.783626'),(9,'auth','0005_alter_user_last_login_null','2017-06-26 11:16:37.293600'),(10,'contenttypes','0002_remove_content_type_name','2017-06-26 11:16:45.978844'),(11,'auth','0006_require_contenttypes_0002','2017-06-26 11:16:46.013609'),(12,'auth','0007_alter_validators_add_error_messages','2017-06-26 11:16:53.502022'),(13,'auth','0008_alter_user_username_max_length','2017-06-26 11:17:02.017797'),(14,'sessions','0001_initial','2017-06-26 11:17:32.460202');
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
INSERT INTO `django_session` VALUES ('8azrgiqd16erteg45tc8vu7e0qbl979c','OTM4NWE5OTcxMGVlN2ZhMjZkNmExMjYyNWI3MTVkZTBjYTAyZjRmNDp7ImVtYWlsIjoic2Fua2V0QGdtYWlsLmNvbSIsInBhZ2UiOiIvcHJvZHVjZXIvb3JkZXJzIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjIxYmFkZjc2NTM5OTkyNzYzOWIwODE4MWYwMzljZTAyOTI2NDcxOSIsImxvZ2dlZF9pbiI6dHJ1ZSwidXNlcl9pZCI6MywidXNlcl90eXBlIjoiUHJvZHVjZXIiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-07-10 13:05:55.361829'),('few2m4o55xeb34fqk0g3lwgt89nrmq6q','MDAzNzYzNGY5NDkxYTYyODhkZjY0Y2MzNGJjNzMzMjMwZTkyNTRmZjp7InBhZ2UiOiIvY3JvcHMifQ==','2017-07-10 11:40:07.149300'),('meedhevosdr8u0ktdvdofqr157bp1ztn','MDAzNzYzNGY5NDkxYTYyODhkZjY0Y2MzNGJjNzMzMjMwZTkyNTRmZjp7InBhZ2UiOiIvY3JvcHMifQ==','2017-07-10 11:37:39.710916'),('wja4nbwj9n5zv5civwdleoebsix2ix7q','MDAzNzYzNGY5NDkxYTYyODhkZjY0Y2MzNGJjNzMzMjMwZTkyNTRmZjp7InBhZ2UiOiIvY3JvcHMifQ==','2017-07-10 11:41:46.291356');
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
  PRIMARY KEY (`id`),
  KEY `farmapp_alert_user_id_id_67c2a510_fk_farmapp_user_id` (`user_id_id`),
  CONSTRAINT `farmapp_alert_user_id_id_67c2a510_fk_farmapp_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `farmapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_alert`
--

LOCK TABLES `farmapp_alert` WRITE;
/*!40000 ALTER TABLE `farmapp_alert` DISABLE KEYS */;
INSERT INTO `farmapp_alert` VALUES (1,'Hemang has cancelled his order for 600.0 grams of Lollo Rosso placed on 2017-06-26','2017-06-26 13:03:29.236996',3),(2,'Sanket has rejected your order for 300.0 grams of Lollo Rosso placed on 2017-06-26','2017-06-26 13:05:55.171809',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_cart`
--

LOCK TABLES `farmapp_cart` WRITE;
/*!40000 ALTER TABLE `farmapp_cart` DISABLE KEYS */;
INSERT INTO `farmapp_cart` VALUES (1),(2),(3),(4);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_cart_session`
--

LOCK TABLES `farmapp_cart_session` WRITE;
/*!40000 ALTER TABLE `farmapp_cart_session` DISABLE KEYS */;
INSERT INTO `farmapp_cart_session` VALUES (7,4,19);
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
INSERT INTO `farmapp_crop` VALUES (1,'हरा माठ','Amaranthus Green','AmaranthusG','Amaranthus viridis',48,'crops/amaranthus_green.jpg',0,120),(2,'लाल माठ','Amaranthus Red','AmaranthusR','Amaranthus cruentus',44,'crops/amaranthus_red.jpg',0,90),(3,'शिशु मेथी','Baby Fenugreek','BFenugreek','Trigonella foenum-graecum',48,'crops/baby_fenugreek.jpg',0,24),(4,'तुलसी','Basil','Basil','Ocimum basilicum',40,'crops/basil.jpeg',0,200),(5,'चुकंदर','Beetroot','Beetroot','Beta vulgaris',120,'crops/beetroot.jpg',0,200),(6,'करेला','Bitter Gourd','BitterGourd','Momordica charantia',120,'crops/bitter_gourd.jpg',4446,70),(7,'लौकी','Bottle Gourd','BottleGourd','Lagenaria siceraria',200,'crops/bottle_gourd.jpeg',3470,90),(8,'बैंगन','Brinjal','Brinjal','Solanum melongena',72,'crops/brinjal.jpg',0,60),(9,'गोभी','Cabbage','Cabbage','Brassica oleracea var. capitata',120,'crops/cabbage.jpeg',1941,24),(10,'फूलगोभी','Cauliflower','Cauliflower','Brassica oleracea var. botrytis',120,'crops/cauliflower.jpeg',0,80),(11,'मिर्च','Chilli','Chilli','Capsicum frutescens',320,'crops/chilly.jpeg',0,40),(12,'गवार','Cluster Beans','ClusterBean','Cyamopsis tetragonoloba',48,'crops/cluster_bean.jpg',0,50),(13,'धनिया','Coriander','Coriander','Coriandrum sativum',75,'crops/coriander.jpg',0,20),(14,'ककड़ी','Cucumber','Cucumber','Cucumis sativus',72,'crops/cucumber.jpg',9505,60),(15,'मेंथी','Fenugreek','Fenugreek','Trigonella foenum-graecum',70,'crops/fenugreek.jpeg',2224,60),(16,'हिमशैल सलाद','Iceberg Lettuce','Ice_Lettuce','Lactuca sativa',96,'crops/iceberg_lettuce.jpeg',0,67),(17,'भिन्डी','Ladyfinger','Ladyfinger','Abelmoschus esculentus',96,'crops/ladyfinger.jpeg',3140,60),(18,'नींबू घास','Lemon Grass','Lemon_Grass','Cymbopogon',24,'crops/lemongrass.jpg',0,100),(19,'लोलो रोसो','Lollo Rosso','Lollo_Rosso','Lactuca sativa',100,'crops/lollo_rosso.jpg',4671,300),(20,'मक्का','Maize','Maize','Zea mays',48,'crops/maize.jpg',0,40),(21,'सरसों','Mustard','Mustard','Brassica',48,'crops/mustard.jpg',0,80),(22,'प्याज','Onion','Onion','Allium cepa',96,'crops/onion.jpg',0,50),(23,'अजमोद','Parsley','Parsley','Petroselinum crispum',96,'crops/parsley.jpg',0,70),(24,'मूली','Radish','Radish','Raphanus raphanistrum subsp. sativus',72,'crops/radish.jpeg',2392,70),(25,'तुरई','Ridge Gourd','Ridge_Gourd','Luffa',72,'crops/ridge_gourd.jpg',0,120),(26,'चिचिण्डा','Snake Gourd','Snake_Gourd','Trichosanthes cucumerina',72,'crops/snake_gourd.jpg',0,40),(27,'पालक','Spinach','Spinach','Spinacia oleracea',24,'crops/spinach.jpeg',0,90),(28,'हल्दी पान','Turmeric Leaf','TurmericL','Curcuma longa',72,'crops/termari_leaf.jpg',0,200),(29,'हल्दी','Turmeric','Turmeric','Curcuma longa',960,'crops/turmeric.jpg',0,300),(30,'टमाटर','Tomato','Tomato','Solanum lycopersicum',72,'crops/tomato.jpg',2379,40);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_inventory`
--

LOCK TABLES `farmapp_inventory` WRITE;
/*!40000 ALTER TABLE `farmapp_inventory` DISABLE KEYS */;
INSERT INTO `farmapp_inventory` VALUES (1,4671,0,0,50,600,0,48,19,3);
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
  KEY `farmapp_machine_user_id_id_3e6c5fdf_fk_farmapp_user_id` (`user_id_id`),
  CONSTRAINT `farmapp_machine_user_id_id_3e6c5fdf_fk_farmapp_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `farmapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_order`
--

LOCK TABLES `farmapp_order` WRITE;
/*!40000 ALTER TABLE `farmapp_order` DISABLE KEYS */;
INSERT INTO `farmapp_order` VALUES (1,600,'2017-06-26 12:42:58.217974',NULL,'cancelled',3,19,3,2),(2,300,'2017-06-26 13:03:45.300479',NULL,'rejected',4,19,3,2);
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
  `trough_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `farmapp_produce_crop_id_id_d170d24e_fk_farmapp_crop_crop_id` (`crop_id_id`),
  KEY `farmapp_produce_machine_id_id_b2525ee0_fk_farmapp_m` (`machine_id_id`),
  KEY `farmapp_produce_trough_id_id_a8e49ad8_fk_farmapp_t` (`trough_id_id`),
  CONSTRAINT `farmapp_produce_crop_id_id_d170d24e_fk_farmapp_crop_crop_id` FOREIGN KEY (`crop_id_id`) REFERENCES `farmapp_crop` (`crop_id`),
  CONSTRAINT `farmapp_produce_machine_id_id_b2525ee0_fk_farmapp_m` FOREIGN KEY (`machine_id_id`) REFERENCES `farmapp_machine` (`machine_id`),
  CONSTRAINT `farmapp_produce_trough_id_id_a8e49ad8_fk_farmapp_t` FOREIGN KEY (`trough_id_id`) REFERENCES `farmapp_trough` (`trough_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_produce`
--

LOCK TABLES `farmapp_produce` WRITE;
/*!40000 ALTER TABLE `farmapp_produce` DISABLE KEYS */;
INSERT INTO `farmapp_produce` VALUES (1,'image-2017-06-26T12:41:35.5075161.jpg',4671,'2017-06-26 12:42:06.936785','2017-06-26 12:42:04.000000','2017-06-30 16:42:04.000000',0,0,19,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_trough`
--

LOCK TABLES `farmapp_trough` WRITE;
/*!40000 ALTER TABLE `farmapp_trough` DISABLE KEYS */;
INSERT INTO `farmapp_trough` VALUES (1,1);
/*!40000 ALTER TABLE `farmapp_trough` ENABLE KEYS */;
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
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `address_line1` varchar(100) DEFAULT NULL,
  `address_line2` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `pin_code` varchar(20) DEFAULT NULL,
  `user_type` varchar(20) NOT NULL,
  `contact` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `last_cart_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `farmapp_user_last_cart_id_e22636f5_fk_farmapp_cart_cart_id` (`last_cart_id`),
  CONSTRAINT `farmapp_user_last_cart_id_e22636f5_fk_farmapp_cart_cart_id` FOREIGN KEY (`last_cart_id`) REFERENCES `farmapp_cart` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_user`
--

LOCK TABLES `farmapp_user` WRITE;
/*!40000 ALTER TABLE `farmapp_user` DISABLE KEYS */;
INSERT INTO `farmapp_user` VALUES (1,'bcrypt_sha256$$2b$12$VMu8MYSArKeS0snzAFuK7.PLLqSMTedhEBfQg0irScX9Xw3s6/zsu','2017-06-26 12:52:27.124866','keivan@gmail.com','Keivan','Shah',NULL,NULL,NULL,NULL,NULL,'Consumer','9876543210',1,1,NULL),(2,'bcrypt_sha256$$2b$12$Y7.VE.xaFl6xzk9BQR5WReZvv.MpFCBlYZIH2fq/Yzl17Ssqh9Z42','2017-06-26 12:54:14.217547','hemang@gmail.com','Hemang','Gandhi',NULL,NULL,NULL,NULL,NULL,'Consumer','9876543210',1,0,NULL),(3,'bcrypt_sha256$$2b$12$0SYSbg1SlZNdBSSwYsGMkuVG24YsTcrOEJ7nSEw8nQGYoZ4VE6WJe','2017-06-26 13:05:29.726095','sanket@gmail.com','Sanket','Shanbhag',NULL,NULL,NULL,NULL,NULL,'Producer','9876543210',1,0,NULL);
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

-- Dump completed on 2017-06-26 13:21:35
