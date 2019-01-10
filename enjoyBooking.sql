-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: enjoyBooking
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.17.10.1

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
-- Current Database: `enjoyBooking`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `enjoyBooking` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `enjoyBooking`;

--
-- Table structure for table `accommodation_accommodation`
--

DROP TABLE IF EXISTS `accommodation_accommodation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accommodation_accommodation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `country` varchar(85) NOT NULL,
  `city` varchar(85) NOT NULL,
  `address` varchar(100) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `latitude` decimal(19,15) DEFAULT NULL,
  `longitude` decimal(19,15) DEFAULT NULL,
  `publication_date` datetime(6) NOT NULL,
  `beds` smallint(5) unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` longtext NOT NULL,
  `services` varchar(2040) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `seller_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accommodation_accomm_seller_id_b7b02983_fk_accounts_` (`seller_id`),
  CONSTRAINT `accommodation_accomm_seller_id_b7b02983_fk_accounts_` FOREIGN KEY (`seller_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation_accommodation`
--

LOCK TABLES `accommodation_accommodation` WRITE;
/*!40000 ALTER TABLE `accommodation_accommodation` DISABLE KEYS */;
INSERT INTO `accommodation_accommodation` VALUES (1,'La reggia modenese','italy','modena','via newton 45','41120',0.000000000000000,0.000000000000000,'2019-01-09 18:59:41.492668',3,35.00,'semplice bilocale ottimo per 3 persone.','wifi,doccia,cucina',1,1),(2,'in the wild','norway','oslo','street flashlight 2332','34332a',0.000000000000000,0.000000000000000,'2019-01-09 19:08:56.307239',4,68.00,'two word...no noise!','spa,relax zone,kitchen',1,1),(3,'city way','italy','milan','stada galileo 2131','3421',0.000000000000000,0.000000000000000,'2019-01-09 19:11:04.418372',2,75.00,'nel mezzo di milano al centro delle comodità','wifi,tv,cucina,sala da pranzo,bagno,doccia',1,1),(4,'casa di legno sperduta','germany','Berlin','rue ljkadljfnndszszzz','343sd4',0.000000000000000,0.000000000000000,'2019-01-09 21:08:49.778479',6,106.00,'amazing wood house in the middle of the berlin mountain','spa,kitchen,wifi,sauna,bagno turco',1,1),(5,'white palace','USA','washington','34 street','334d3',0.000000000000000,0.000000000000000,'2019-01-09 21:17:38.033400',10,348.23,'awesome structure in the center og washington','spa,kitchen,wifi,sauna,bagno turco,wifi,tv,phone',1,2),(6,'small house','usa','california','street long lagon','34f312',0.000000000000000,0.000000000000000,'2019-01-09 21:21:39.781353',4,121.43,'fantastic house near the desert.','wifi,tv,doccia,cucina',1,2),(7,'casa sull\'albero','italy','cimone','via cimone 23','123',0.000000000000000,0.000000000000000,'2019-01-10 17:58:49.080877',3,235.00,'stupenda','spa,bagno,cucina,sala da pranzo',1,3),(8,'chiesa diroccata','italy','bologna','via asdafs 23','134',0.000000000000000,0.000000000000000,'2019-01-10 18:00:19.178772',6,345.00,'stupenda chiesa abbandonata','wifi,crocefisso,panche,letti',1,3),(9,'old style home','mexico','messico','street akjdkasj','3434',0.000000000000000,0.000000000000000,'2019-01-10 18:52:58.970807',4,23.00,'stile molto retro ma confortevole all\'interno.\r\nsul mare con vista meravigliosa','bagno,doccia,cucina',1,7),(10,'palazzo torino','italy','torino','via cavour 34','12321',0.000000000000000,0.000000000000000,'2019-01-10 18:55:58.750411',40,798.00,'mastodontico palazzo nel cuore di torino','wifi,cucina,bagno,arredo antico,argenteria',1,7);
/*!40000 ALTER TABLE `accommodation_accommodation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accommodation_accommodationimage`
--

DROP TABLE IF EXISTS `accommodation_accommodationimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accommodation_accommodationimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `accommodation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accommodation_accomm_accommodation_id_4b43eea4_fk_accommoda` (`accommodation_id`),
  CONSTRAINT `accommodation_accomm_accommodation_id_4b43eea4_fk_accommoda` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodation_accommodation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation_accommodationimage`
--

LOCK TABLES `accommodation_accommodationimage` WRITE;
/*!40000 ALTER TABLE `accommodation_accommodationimage` DISABLE KEYS */;
INSERT INTO `accommodation_accommodationimage` VALUES (1,'accommodationImage/1/images.jpeg',1),(2,'accommodationImage/2/scenic-millhouse-with-rushing-water_800.jpg',2),(3,'accommodationImage/2/75907eda-38db-4ebc-b5b9-a9144985978a.1.10.jpeg',2),(4,'accommodationImage/3/21_Vertical_House.jpg',3),(5,'accommodationImage/3/cabin-room-with-furnishings_800.jpg',3),(6,'accommodationImage/4/148591038.jpg',4),(7,'accommodationImage/4/cabin-room-with-furnishings_800.jpg',4),(8,'accommodationImage/4/arkansas-hot-springs-another-bathing-room_800.jpg',4),(9,'accommodationImage/4/worcester-guildhall-mayors-parlour-room-england_800.jpg',4),(10,'accommodationImage/5/malacanag-palace-the-residence-of-the-president-of-the-philippines_800.jpg',5),(11,'accommodationImage/5/harewood-house-library_800.jpg',5),(12,'accommodationImage/5/bathroom_800.jpg',5),(13,'accommodationImage/5/minnesota-split-rock-lighthouse-bathroom_800.jpg',5),(14,'accommodationImage/6/architecture-bungalow-daylight-1396122.jpg',6),(15,'accommodationImage/6/architecture-building-driveway-186077.jpg',6),(16,'accommodationImage/6/small-kitchen-in-house_800.jpg',6),(18,'accommodationImage/7/casa-sullalbero-italia-la-piantata-cop.jpg',7),(19,'accommodationImage/8/san-agustin-church-in-manila-philippines_800.jpg',8),(20,'accommodationImage/9/shore-side-house-in-maine_800.jpg',9),(21,'accommodationImage/10/Palazzo_di_Città_Torino.jpg',10),(22,'accommodationImage/10/harewood-house-library_800.jpg',10);
/*!40000 ALTER TABLE `accommodation_accommodationimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accommodation_reservation`
--

DROP TABLE IF EXISTS `accommodation_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accommodation_reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkin` date NOT NULL,
  `checkout` date NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `accommodation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accommodation_reserv_accommodation_id_039faa78_fk_accommoda` (`accommodation_id`),
  KEY `accommodation_reserv_user_id_1230f7e8_fk_accounts_` (`user_id`),
  CONSTRAINT `accommodation_reserv_accommodation_id_039faa78_fk_accommoda` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodation_accommodation` (`id`),
  CONSTRAINT `accommodation_reserv_user_id_1230f7e8_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation_reservation`
--

LOCK TABLES `accommodation_reservation` WRITE;
/*!40000 ALTER TABLE `accommodation_reservation` DISABLE KEYS */;
INSERT INTO `accommodation_reservation` VALUES (1,'2019-01-16','2019-01-21',1,375.00,3,1),(2,'2019-01-09','2019-01-11',1,150.00,3,1),(3,'2019-01-10','2019-01-13',1,105.00,1,1),(4,'2019-03-22','2019-03-28',1,408.00,2,2),(5,'2019-01-24','2019-01-26',1,150.00,3,2),(6,'2019-01-31','2019-02-08',1,544.00,2,2),(7,'2019-10-16','2019-10-31',1,1590.00,4,2),(8,'2019-01-11','2019-01-12',1,75.00,3,2),(9,'2019-01-25','2019-01-27',1,696.46,5,2),(10,'2019-01-30','2019-01-31',1,121.43,6,1),(11,'2019-02-14','2019-02-22',1,600.00,3,3),(12,'2019-02-11','2019-02-17',1,2089.38,5,3),(13,'2019-03-26','2019-03-28',1,470.00,7,3),(14,'2019-02-13','2019-02-14',1,345.00,8,3),(15,'2019-02-14','2019-02-16',1,46.00,9,7),(16,'2019-01-30','2019-02-02',1,2394.00,10,7);
/*!40000 ALTER TABLE `accommodation_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_avatar`
--

DROP TABLE IF EXISTS `accounts_avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_avatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_avatar_user_id_3d8a660c_fk_accounts_customuser_id` (`user_id`),
  CONSTRAINT `accounts_avatar_user_id_3d8a660c_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_avatar`
--

LOCK TABLES `accounts_avatar` WRITE;
/*!40000 ALTER TABLE `accounts_avatar` DISABLE KEYS */;
INSERT INTO `accounts_avatar` VALUES (1,'profileImage/7/pippo.png',7),(3,'profileImage/3/pluto.jpg',3),(10,'profileImage/1/san-agustin-church-in-manila-philippines_800_KflgZpa.jpg',1),(11,'profileImage/2/received_267212843932071.png',2),(12,'/static/image/defaultProfile.png',1);
/*!40000 ALTER TABLE `accounts_avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser`
--

DROP TABLE IF EXISTS `accounts_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_customuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `city` varchar(85) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `phone` varchar(17) DEFAULT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser`
--

LOCK TABLES `accounts_customuser` WRITE;
/*!40000 ALTER TABLE `accounts_customuser` DISABLE KEYS */;
INSERT INTO `accounts_customuser` VALUES (1,'pbkdf2_sha256$100000$RpfbbBt5AN9b$f+Diq3FxFBnIXIljnn/+MYXev8KPSeeUYsn/1Yh+xe4=','enjoy@enjoybooking.com','enjoy','booking',NULL,NULL,NULL,NULL,NULL,'2019-01-09 17:16:09.000000','2019-01-10 16:44:11.249036',1,1),(2,'pbkdf2_sha256$100000$qT61d7OiD4qf$RejFcBfkL/lUev1c2PJJ6g0E4drst7iSm3viovRfZjc=','guerzoni@gmail.com','giacomo','guerzo','1992-08-18','modena','via castello 123','41013','12333222223','2019-01-09 21:12:45.751607','2019-01-09 21:12:45.825574',1,0),(3,'pbkdf2_sha256$100000$ufUnZnEy1XhF$d+kgEHTWdtA+KLoNi1p285yDDW+kEU5ODYdvdc2K7YE=','pluto@gmail.com','pluto','disney','2010-04-24','usa',NULL,NULL,NULL,'2019-01-09 21:43:31.709729','2019-01-10 17:57:08.562189',1,0),(7,'pbkdf2_sha256$100000$CKc6s8iwLH8V$mjuYmmV322Ab8RTcHVxtFgQNA0sZSRo88RGyS0/66ws=','pippo@gmail.com','pippo','disney','2019-01-07',NULL,NULL,NULL,NULL,'2019-01-10 16:37:12.366506','2019-01-10 18:51:05.077717',1,0);
/*!40000 ALTER TABLE `accounts_customuser` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add accommodation',6,'add_accommodation'),(17,'Can change accommodation',6,'change_accommodation'),(18,'Can delete accommodation',6,'delete_accommodation'),(19,'Can add accommodation image',7,'add_accommodationimage'),(20,'Can change accommodation image',7,'change_accommodationimage'),(21,'Can delete accommodation image',7,'delete_accommodationimage'),(22,'Can add reservation',8,'add_reservation'),(23,'Can change reservation',8,'change_reservation'),(24,'Can delete reservation',8,'delete_reservation'),(25,'Can add custom user',9,'add_customuser'),(26,'Can change custom user',9,'change_customuser'),(27,'Can delete custom user',9,'delete_customuser'),(28,'Can add avatar',10,'add_avatar'),(29,'Can change avatar',10,'change_avatar'),(30,'Can delete avatar',10,'delete_avatar');
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
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-01-09 17:32:04.160965','1','enjoy@enjoybooking.com',2,'[{\"changed\": {\"fields\": [\"avatar\"]}}]',9,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'accommodation','accommodation'),(7,'accommodation','accommodationimage'),(8,'accommodation','reservation'),(10,'accounts','avatar'),(9,'accounts','customuser'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'accounts','0001_initial','2019-01-09 17:12:30.945712'),(2,'accommodation','0001_initial','2019-01-09 17:12:31.143918'),(3,'contenttypes','0001_initial','2019-01-09 17:12:31.184762'),(4,'admin','0001_initial','2019-01-09 17:12:31.288647'),(5,'admin','0002_logentry_remove_auto_add','2019-01-09 17:12:31.309262'),(6,'contenttypes','0002_remove_content_type_name','2019-01-09 17:12:31.383133'),(7,'auth','0001_initial','2019-01-09 17:12:31.602924'),(8,'auth','0002_alter_permission_name_max_length','2019-01-09 17:12:31.614018'),(9,'auth','0003_alter_user_email_max_length','2019-01-09 17:12:31.621437'),(10,'auth','0004_alter_user_username_opts','2019-01-09 17:12:31.628979'),(11,'auth','0005_alter_user_last_login_null','2019-01-09 17:12:31.637807'),(12,'auth','0006_require_contenttypes_0002','2019-01-09 17:12:31.641572'),(13,'auth','0007_alter_validators_add_error_messages','2019-01-09 17:12:31.648214'),(14,'auth','0008_alter_user_username_max_length','2019-01-09 17:12:31.655521'),(15,'auth','0009_alter_user_last_name_max_length','2019-01-09 17:12:31.662877'),(16,'sessions','0001_initial','2019-01-09 17:12:31.687561'),(17,'accounts','0002_auto_20190110_1656','2019-01-10 15:56:36.414988');
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
INSERT INTO `django_session` VALUES ('k4vvmde76mflc723wi0r7tcb57eaqs5f','ZWYzMWJjZGUwMzU0MGIwODQ2YmU2ZGFiMDNhYmM3M2JjMzU0MmY2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMWMwZjA5Y2FlMGNkMjVmMDYyODZkMmIwNzMyNTBmNTYwMzhiYmMxIn0=','2019-01-23 19:39:04.975912'),('k6jrn5xg9lmui4wpsz8e7p1c9x45xb4h','ZWYzMWJjZGUwMzU0MGIwODQ2YmU2ZGFiMDNhYmM3M2JjMzU0MmY2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMWMwZjA5Y2FlMGNkMjVmMDYyODZkMmIwNzMyNTBmNTYwMzhiYmMxIn0=','2019-01-23 19:35:20.844827'),('l2i0uvt1w6mh3iny34duqhvohybn13ap','MmZhY2M4Njc3YzI1ZDU2NmI1NGIxMmIwMjllMzllMzE4ZjYwZDUzMTp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmVmM2E1ODk1ODhmNzQyNWJjMTFkM2Y0N2JiODU3NTIwNzkwYTY5In0=','2019-01-24 18:56:09.891723');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-10 19:57:57
