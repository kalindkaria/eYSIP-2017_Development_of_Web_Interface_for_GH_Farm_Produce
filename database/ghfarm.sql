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
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add produce',8,'add_produce'),(23,'Can change produce',8,'change_produce'),(24,'Can delete produce',8,'delete_produce'),(25,'Can add machine',9,'add_machine'),(26,'Can change machine',9,'change_machine'),(27,'Can delete machine',9,'delete_machine'),(28,'Can add cart',12,'add_cart'),(29,'Can change cart',12,'change_cart'),(30,'Can delete cart',12,'delete_cart'),(31,'Can add inventory',11,'add_inventory'),(32,'Can change inventory',11,'change_inventory'),(33,'Can delete inventory',11,'delete_inventory'),(34,'Can add order',13,'add_order'),(35,'Can change order',13,'change_order'),(36,'Can delete order',13,'delete_order'),(37,'Can add cart_session',14,'add_cart_session'),(38,'Can change cart_session',14,'change_cart_session'),(39,'Can delete cart_session',14,'delete_cart_session'),(40,'Can add trough',10,'add_trough'),(41,'Can change trough',10,'change_trough'),(42,'Can delete trough',10,'delete_trough'),(43,'Can add alert',15,'add_alert'),(44,'Can change alert',15,'change_alert'),(45,'Can delete alert',15,'delete_alert'),(46,'Can add crop',16,'add_crop'),(47,'Can change crop',16,'change_crop'),(48,'Can delete crop',16,'delete_crop');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$TR6YgJsS4tGX$Ka6u5PWZdj1Jy4kNmYWUqLiHsMRz1DddfMk3x/zzg/w=','2017-06-19 21:36:26.100780',1,'keivan','','','keivan@gmail.com',1,1,'2017-06-17 15:42:24.068396');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (18,'2017-06-19 21:27:24.360294','5','hemang@gmail.com',1,'[{\"added\": {}}]',7,1),(19,'2017-06-19 21:27:43.300341','6','producer@gmail.com',1,'[{\"added\": {}}]',7,1),(20,'2017-06-19 21:35:49.695501','4','Keivan-Tomato',2,'[{\"changed\": {\"fields\": [\"minimum\", \"maximum\"]}}]',11,1),(21,'2017-06-19 21:36:39.301134','5','hemang@gmail.com',2,'[{\"changed\": {\"fields\": [\"user_type\"]}}]',7,1);
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
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(15,'farmapp','alert'),(12,'farmapp','cart'),(14,'farmapp','cart_session'),(16,'farmapp','crop'),(11,'farmapp','inventory'),(9,'farmapp','machine'),(13,'farmapp','order'),(8,'farmapp','produce'),(10,'farmapp','trough'),(7,'farmapp','user'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-06-17 15:40:46.827378'),(2,'auth','0001_initial','2017-06-17 15:40:54.770450'),(3,'admin','0001_initial','2017-06-17 15:40:56.691977'),(4,'admin','0002_logentry_remove_auto_add','2017-06-17 15:40:56.791169'),(5,'contenttypes','0002_remove_content_type_name','2017-06-17 15:40:57.866010'),(6,'auth','0002_alter_permission_name_max_length','2017-06-17 15:40:57.979863'),(7,'auth','0003_alter_user_email_max_length','2017-06-17 15:40:58.101987'),(8,'auth','0004_alter_user_username_opts','2017-06-17 15:40:58.151842'),(9,'auth','0005_alter_user_last_login_null','2017-06-17 15:40:58.698050'),(10,'auth','0006_require_contenttypes_0002','2017-06-17 15:40:58.733664'),(11,'auth','0007_alter_validators_add_error_messages','2017-06-17 15:40:58.793807'),(12,'auth','0008_alter_user_username_max_length','2017-06-17 15:40:59.175508'),(13,'sessions','0001_initial','2017-06-17 15:41:20.062972'),(14,'farmapp','0001_initial','2017-06-17 15:41:41.029554'),(15,'farmapp','0002_auto_20170619_1014','2017-06-19 11:23:36.090967'),(16,'farmapp','0003_auto_20170619_2121','2017-06-19 21:21:41.498290');
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
INSERT INTO `django_session` VALUES ('3es0z19ohafe2ouqcptcdyytpg08nt35','MDAzNzYzNGY5NDkxYTYyODhkZjY0Y2MzNGJjNzMzMjMwZTkyNTRmZjp7InBhZ2UiOiIvY3JvcHMifQ==','2017-07-03 21:50:44.962919'),('7xrw3xp7exl74z0wqzidgfhwxa7on369','MDAzNzYzNGY5NDkxYTYyODhkZjY0Y2MzNGJjNzMzMjMwZTkyNTRmZjp7InBhZ2UiOiIvY3JvcHMifQ==','2017-07-03 18:21:45.241382');
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
  KEY `farmapp_alert_user_id_id_67c2a510_fk_farmapp_user_user_id` (`user_id_id`),
  CONSTRAINT `farmapp_alert_user_id_id_67c2a510_fk_farmapp_user_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `farmapp_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_alert`
--

LOCK TABLES `farmapp_alert` WRITE;
/*!40000 ALTER TABLE `farmapp_alert` DISABLE KEYS */;
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
  `short_name` varchar(11) NOT NULL,
  `scientific_name` varchar(100) DEFAULT NULL,
  `shelf_life` double NOT NULL,
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
INSERT INTO `farmapp_crop` VALUES (1,'Amaranthus Green','Amaranthus Green','AmaranthusG','Amaranthus viridis',48,'crops/amaranthus_green.jpg',0,120),(2,'Amaranthus Red','Amaranthus Red','AmaranthusR','Amaranthus cruentus',44,'crops/amaranthus_red.jpg',0,90),(3,'Methi','Baby Fenugreek','BFenugreek','Trigonella foenum-graecum',48,'crops/baby_fenugreek.jpg',0,24),(4,'Tulsi','Basil','Basil','Ocimum basilicum',40,'crops/basil.jpeg',0,200),(5,'Chukandar','Beetroot','Beetroot','Beta vulgaris',120,'crops/beetroot.jpg',0,200),(6,'Karela','Bitter Gourd','BitterGourd','Momordica charantia',120,'crops/bitter_gourd.jpg',0,70),(7,'Lauki','Bottle Gourd','BottleGourd','Lagenaria siceraria',200,'crops/bottle_gourd.jpeg',1452,90),(8,'Baingan','Brinjal','Brinjal','Solanum melongena',72,'crops/brinjal.jpg',0,60),(9,'Gobhee','Cabbage','Cabbage','Brassica oleracea var. capitata',120,'crops/cabbage.jpeg',0,24),(10,'Gobhee','Cauliflower','Cauliflower','Brassica oleracea var. botrytis',120,'crops/cauliflower.jpeg',0,80),(11,'Mirch','Chilli','Chilli','Capsicum frutescens',320,'crops/chilly.jpeg',0,40),(12,'Gavar','Cluster Beans','ClusterBean','Cyamopsis tetragonoloba',48,'crops/cluster_bean.jpg',0,50),(13,'Dhaniya','Coriander','Coriander','Coriandrum sativum',75,'crops/coriander.jpg',0,20),(14,'Kheera','Cucumber','Cucumber','Cucumis sativus',72,'crops/cucumber.jpg',6896,60),(15,'Methi','Fenugreek','Fenugreek','Trigonella foenum-graecum',70,'crops/fenugreek.jpeg',2224,60),(16,'Himashail Sabjee','Iceberg Lettuce','Ice_Lettuce','Lactuca sativa',96,'crops/iceberg_lettuce.jpeg',0,67),(17,'Bhindi','Ladyfinger','Ladyfinger','Abelmoschus esculentus',96,'crops/ladyfinger.jpeg',2302,60),(18,'Lemon Grass','Lemon Grass','Lemon_Grass','Cymbopogon',24,'crops/lemongrass.jpg',0,100),(19,'Lollo Rosso','Lollo Rosso','Lollo_Rosso','Lactuca sativa',100,'crops/lollo_rosso.jpg',0,300),(20,'Makka','Maize','Maize','Zea mays',48,'crops/maize.jpg',0,40),(21,'Sarason','Mustard','Mustard','Brassica',48,'crops/mustard.jpg',0,80),(22,'Pyaaj','Onion','Onion','Allium cepa',96,'crops/onion.jpg',0,50),(23,'Ajamod','Parsley','Parsley','Petroselinum crispum',96,'crops/parsley.jpg',0,70),(24,'Moolee','Radish','Radish','Raphanus raphanistrum subsp. sativus',72,'crops/radish.jpeg',0,70),(25,'Turai','Ridge Gourd','Ridge_Gourd','Luffa',72,'crops/ridge_gourd.jpg',0,120),(26,'Padval','Snake Gourd','Snake_Gourd','Trichosanthes cucumerina',72,'crops/snake_gourd.jpg',0,40),(27,'Palak','Spinach','Spinach','Spinacia oleracea',24,'crops/spinach.jpeg',0,90),(28,'Haldi Paan','Termari Leaf','TurmericL','Curcuma longa',72,'crops/termari_leaf.jpg',0,200),(29,'Haldi','Turmeric','Turmeric','Curcuma longa',960,'crops/turmeric.jpg',0,300),(30,'Tamaatar','Tomato','Tomato','Solanum lycopersicum',72,'crops/tomato.jpg',4002,40);
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
  `minimum` double NOT NULL,
  `maximum` double NOT NULL,
  `crop_id_id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `farmapp_inventory_crop_id_id_796a261e_fk_farmapp_crop_crop_id` (`crop_id_id`),
  KEY `farmapp_inventory_user_id_id_bda51212_fk_farmapp_user_user_id` (`user_id_id`),
  CONSTRAINT `farmapp_inventory_crop_id_id_796a261e_fk_farmapp_crop_crop_id` FOREIGN KEY (`crop_id_id`) REFERENCES `farmapp_crop` (`crop_id`),
  CONSTRAINT `farmapp_inventory_user_id_id_bda51212_fk_farmapp_user_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `farmapp_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_inventory`
--

LOCK TABLES `farmapp_inventory` WRITE;
/*!40000 ALTER TABLE `farmapp_inventory` DISABLE KEYS */;
INSERT INTO `farmapp_inventory` VALUES (3,6896,0,0,0,14,1),(4,4002,0,100,1000,30,1),(5,1452,0,0,0,7,1),(6,2224,0,0,0,15,1),(7,2302,0,0,0,17,1);
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
INSERT INTO `farmapp_machine` VALUES (1,'random','ERTS LAB','2017-06-19 09:49:20.000000','1.0','2017-06-19 09:49:25.000000',1);
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
  KEY `farmapp_order_seller_id_5b7e2bce_fk_farmapp_user_user_id` (`seller_id`),
  KEY `farmapp_order_user_id_id_8205f9ff_fk_farmapp_user_user_id` (`user_id_id`),
  CONSTRAINT `farmapp_order_cart_id_id_cb534eca_fk_farmapp_cart_cart_id` FOREIGN KEY (`cart_id_id`) REFERENCES `farmapp_cart` (`cart_id`),
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
  `crop_id_id` int(11) NOT NULL,
  `machine_id_id` int(11) NOT NULL,
  `trough_id_id` int(11) NOT NULL,
  `sold` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `farmapp_produce_crop_id_id_d170d24e_fk_farmapp_crop_crop_id` (`crop_id_id`),
  KEY `farmapp_produce_machine_id_id_b2525ee0_fk_farmapp_m` (`machine_id_id`),
  KEY `farmapp_produce_trough_id_id_a8e49ad8_fk_farmapp_t` (`trough_id_id`),
  CONSTRAINT `farmapp_produce_crop_id_id_d170d24e_fk_farmapp_crop_crop_id` FOREIGN KEY (`crop_id_id`) REFERENCES `farmapp_crop` (`crop_id`),
  CONSTRAINT `farmapp_produce_machine_id_id_b2525ee0_fk_farmapp_m` FOREIGN KEY (`machine_id_id`) REFERENCES `farmapp_machine` (`machine_id`),
  CONSTRAINT `farmapp_produce_trough_id_id_a8e49ad8_fk_farmapp_t` FOREIGN KEY (`trough_id_id`) REFERENCES `farmapp_trough` (`trough_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_produce`
--

LOCK TABLES `farmapp_produce` WRITE;
/*!40000 ALTER TABLE `farmapp_produce` DISABLE KEYS */;
INSERT INTO `farmapp_produce` VALUES (3,'image-2017-06-18T03:25:26.6388371.jpg',1576,'2017-06-19 21:30:53.125842','2017-06-18 03:26:04.000000','2017-06-21 03:26:04.000000',14,1,1,0),(4,'image-2017-06-18T03:27:09.9209621.jpg',2657,'2017-06-19 21:32:25.126628','2017-06-18 03:27:37.000000','2017-06-21 03:27:37.000000',30,1,1,0),(5,'image-2017-06-18T03:27:55.6246041.jpg',1562,'2017-06-19 21:32:55.833240','2017-06-18 03:28:07.000000','2017-06-21 03:28:07.000000',14,1,1,0),(6,'image-2017-06-18T03:24:44.7766431.jpg',1890,'2017-06-19 21:42:13.258450','2017-06-18 03:25:15.000000','2017-06-21 03:25:15.000000',14,1,1,0),(7,'image-2017-06-18T03:25:28.2059221.jpg',1345,'2017-06-19 21:42:40.607978','2017-06-18 03:25:42.000000','2017-06-21 03:25:42.000000',30,1,1,0),(8,'image-2017-06-18T03:25:59.9536611.jpg',1452,'2017-06-19 21:43:18.038924','2017-06-18 03:26:20.000000','2017-06-26 11:26:20.000000',7,1,1,0),(9,'image-2017-06-18T03:25:00.0586191.jpg',1868,'2017-06-19 21:48:35.852239','2017-06-18 03:25:49.000000','2017-06-21 03:25:49.000000',14,1,1,0),(10,'image-2017-06-18T03:26:06.9589231.jpg',880,'2017-06-19 21:49:05.283440','2017-06-18 03:26:19.000000','2017-06-21 01:26:19.000000',15,1,1,0),(11,'image-2017-06-18T03:26:27.8960851.jpg',2302,'2017-06-19 21:49:28.945932','2017-06-18 03:26:42.000000','2017-06-22 03:26:42.000000',17,1,1,0),(12,'image-2017-06-18T03:27:06.0935211.jpg',1344,'2017-06-19 21:50:04.493362','2017-06-18 03:27:18.000000','2017-06-21 01:27:18.000000',15,1,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
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
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  `address_line1` varchar(100) DEFAULT NULL,
  `address_line2` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `pin_code` varchar(20) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `contact` longtext NOT NULL,
  `last_cart_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `farmapp_user_last_cart_id_e22636f5_fk_farmapp_cart_cart_id` (`last_cart_id`),
  CONSTRAINT `farmapp_user_last_cart_id_e22636f5_fk_farmapp_cart_cart_id` FOREIGN KEY (`last_cart_id`) REFERENCES `farmapp_cart` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmapp_user`
--

LOCK TABLES `farmapp_user` WRITE;
/*!40000 ALTER TABLE `farmapp_user` DISABLE KEYS */;
INSERT INTO `farmapp_user` VALUES (1,'keivan@gmail.com','Keivan','Shah','keivan','qwertyuiop','asdfgh','Maharashtra','India','400001','Producer','9876543210',NULL),(3,'sanket@gmail.com','Sanket','Shanbhag','sanket',NULL,NULL,NULL,NULL,NULL,'Consumer','9876543210',NULL),(5,'hemang@gmail.com','Hemang','Gandhi','hemang',NULL,NULL,NULL,NULL,NULL,'Consumer','9876543210',NULL),(6,'producer@gmail.com','Producer','produce','producer',NULL,NULL,NULL,NULL,NULL,'Producer','1234567890',NULL);
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

-- Dump completed on 2017-06-19 21:50:52
