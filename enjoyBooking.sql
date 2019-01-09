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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation_accommodation`
--

LOCK TABLES `accommodation_accommodation` WRITE;
/*!40000 ALTER TABLE `accommodation_accommodation` DISABLE KEYS */;
INSERT INTO `accommodation_accommodation` VALUES (41,'ciao','ciao','ciao','ciao','123',0.000000000000000,0.000000000000000,'2018-10-07 05:29:05.375897',213,123.00,'ojsjndkjgn','akdasjlkjd,asd,asda',1,1),(42,'American House','USA','Jersey','25th Street','2324',0.000000000000000,0.000000000000000,'2018-11-19 15:57:07.357554',7,342.45,'awsome hose near jearsy but in the countryside so no smog e no noise!','wifi,tv,cucina,caricatore cellulare,spa',1,1),(43,'test per le immagini con titolo lungo per vedere se rompe qualcosa','asdasfa','cittanuova','asdads','2131',0.000000000000000,0.000000000000000,'2018-11-19 17:45:29.880607',34,1234.00,'ojfnijrgjbgqjwbgrqkjergkjgskjdskjfskjfhsdkj','anfafka,sfafsda,dasddfdaa,spa',1,1),(44,'test','test','test','test','234',0.000000000000000,0.000000000000000,'2018-11-28 16:45:12.966934',12,123.00,'kslgjflgkjnkljnfglkjaengkgjqneògkjneòwgnòjgnwjegnòwg','ciao',1,2),(45,'baita del lupo','italy','via piccola 35','montecreto','12341',0.000000000000000,0.000000000000000,'2018-12-12 17:08:36.546785',5,200.00,'stupendissima casa di monstagna appena ristrutturata!','spa,wifi,phon,tv,microwave',1,1),(46,'pioppa incantata','france','nizza','trois rue','1432',0.000000000000000,0.000000000000000,'2018-12-15 21:44:18.300957',4,350.00,'howsome house on a fantastic treee!','view,amaca,wifi',1,1),(47,'test','italy','modena','via campi 13','324',0.000000000000000,0.000000000000000,'2019-01-09 15:45:08.298724',20,34.00,'test','wifi',1,1),(48,'palazzo1','italy','castalfranco emilia','via commenda 43','41013',0.000000000000000,0.000000000000000,'2019-01-09 15:49:45.775679',5,123.00,'test','wifi',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation_accommodationimage`
--

LOCK TABLES `accommodation_accommodationimage` WRITE;
/*!40000 ALTER TABLE `accommodation_accommodationimage` DISABLE KEYS */;
INSERT INTO `accommodation_accommodationimage` VALUES (8,'accommodationImage/41/ringzero.png',41),(9,'accommodationImage/41/hackthebox.jpeg',41),(10,'accommodationImage/42/apartment-architecture-carpet-584399.jpg',42),(11,'accommodationImage/42/apartment-bedroom-ceiling-1082355.jpg',42),(12,'accommodationImage/42/architecture-beautiful-exterior-106399.jpg',42),(13,'accommodationImage/42/architecture-bungalow-daylight-1396122.jpg',42),(14,'accommodationImage/42/architecture-city-clouds-889851.jpg',42),(15,'accommodationImage/43/images.jpeg',43),(16,'accommodationImage/43/architecture-city-clouds-889851.jpg',43),(17,'accommodationImage/43/apartment-architecture-carpet-584399.jpg',43),(18,'accommodationImage/43/architecture-building-driveway-186077.jpg',43),(19,'accommodationImage/43/21_Vertical_House.jpg',43),(20,'accommodationImage/43/architecture-beautiful-exterior-106399.jpg',43),(21,'accommodationImage/43/architecture-building-driveway-186077_ADvqG8A.jpg',43),(22,'accommodationImage/43/images_esnS40D.jpeg',43),(23,'accommodationImage/43/21_Vertical_House_LKEP9iD.jpg',43),(24,'accommodationImage/43/architecture-city-clouds-889851_EgjmusD.jpg',43),(25,'accommodationImage/43/21_Vertical_House_TCk37Mt.jpg',43),(26,'accommodationImage/44/architecture-beautiful-exterior-106399.jpg',44),(27,'accommodationImage/44/architecture-city-clouds-889851.jpg',44),(28,'accommodationImage/44/architecture-building-driveway-186077.jpg',44),(29,'accommodationImage/45/148591038.jpg',45),(30,'accommodationImage/45/75907eda-38db-4ebc-b5b9-a9144985978a.1.10.jpeg',45),(31,'accommodationImage/46/casa-sullalbero-italia-la-piantata-cop.jpg',46),(32,'accommodationImage/46/78664743.jpg',46),(33,'accommodationImage/47/78664743.jpg',47),(34,'accommodationImage/48/21_Vertical_House.jpg',48);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation_reservation`
--

LOCK TABLES `accommodation_reservation` WRITE;
/*!40000 ALTER TABLE `accommodation_reservation` DISABLE KEYS */;
INSERT INTO `accommodation_reservation` VALUES (9,'2018-11-28','2018-11-29',1,342.45,42,1),(10,'2018-11-28','2018-12-06',1,9872.00,43,1),(11,'2018-11-28','2018-12-06',1,9872.00,43,1),(12,'2018-11-29','2019-03-22',1,38696.85,42,1),(14,'2018-11-29','2019-03-22',1,38696.85,42,1),(15,'2018-11-13','2018-11-23',1,1230.00,44,2),(20,'2018-11-29','2018-11-30',1,123.00,44,2),(22,'2018-11-30','2018-12-08',1,2739.60,42,1),(24,'2018-12-10','2018-12-20',1,12340.00,43,1),(32,'2018-12-29','2018-12-31',1,2468.00,43,1),(33,'2018-12-27','2018-12-28',1,200.00,45,1),(34,'2018-12-16','2018-12-19',1,600.00,45,1),(35,'2018-12-19','2018-12-27',1,984.00,41,1),(36,'2018-12-27','2018-12-28',1,350.00,46,1),(37,'2019-01-16','2019-01-18',1,2468.00,43,1),(38,'2019-01-31','2019-02-03',1,3702.00,43,1),(40,'2019-01-23','2019-01-26',1,600.00,45,1),(41,'2019-01-25','2019-01-26',1,1234.00,43,1),(42,'2019-01-15','2019-01-21',1,1200.00,45,1),(43,'2019-01-23','2019-01-24',1,1234.00,43,1),(44,'2019-01-19','2019-01-20',1,1234.00,43,1);
/*!40000 ALTER TABLE `accommodation_reservation` ENABLE KEYS */;
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
  `avatar` varchar(100) DEFAULT NULL,
  `phone` varchar(17) DEFAULT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser`
--

LOCK TABLES `accounts_customuser` WRITE;
/*!40000 ALTER TABLE `accounts_customuser` DISABLE KEYS */;
INSERT INTO `accounts_customuser` VALUES (1,'pbkdf2_sha256$100000$e1Abc9KwxXZl$mwGBmBZb/o5sBNxdKzsGv2nQB6Q8kxrNUeNmZn59W00=','guerzonigiacom95@gmail.com','giacomo','guerzoni','1995-08-10','Castelfranco Emilia','via monte cosika 30',NULL,'profileImage/1/ctf_CBRameE.jpg','121212121','2018-08-02 16:03:21.000000','2019-01-07 17:46:01.225340',1,1),(2,'pbkdf2_sha256$100000$ARp2fxWnKw2N$ip3g1YN0g6qM5elfCRjl6E0/szOzyg9Qq1wZIdZMY4A=','enjoy@enjoybooking.com','enjoy','booking',NULL,NULL,NULL,NULL,'',NULL,'2018-08-03 09:30:07.803112','2018-11-29 22:18:23.185701',1,1),(3,'pbkdf2_sha256$100000$1ecREQRjTumP$dbnaFwaivXh6ykNeEPQBIHlSeFG3dwza/oesZOptcPI=','piero@pippo.com','piero','pippo','2018-03-21',NULL,NULL,NULL,'profileImage/piero_pippo.com/Schermata_da_2018-07-28_19-18-17.png',NULL,'2018-08-03 10:41:56.000000','2018-08-03 10:41:56.000000',1,0),(4,'pbkdf2_sha256$100000$HfImK3bICour$W/i8YzAw93nyoWAsUrrQxUeOkfIhh54xlaSMUIj7HKQ=','batman@gmail.com','bat','man','2000-09-10',NULL,NULL,NULL,'',NULL,'2018-09-28 15:11:35.651500','2018-09-28 15:11:35.717544',1,0),(5,'pbkdf2_sha256$100000$zN8aE4eVBm4E$tQ2x9VuaxcoBdn0DQZ/Ww9ywNmNpWPsoyWT4pn/fq6U=','pluto@gmail.com','pluto','pluto','1999-05-20',NULL,'via bolzano nord 22','1313567','/static/image/defaultProfile.png',NULL,'2018-09-30 15:12:02.015307','2018-09-30 15:12:02.085403',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add accommodation',6,'add_accommodation'),(17,'Can change accommodation',6,'change_accommodation'),(18,'Can delete accommodation',6,'delete_accommodation'),(19,'Can add accommodation image',7,'add_accommodationimage'),(20,'Can change accommodation image',7,'change_accommodationimage'),(21,'Can delete accommodation image',7,'delete_accommodationimage'),(22,'Can add reservation',8,'add_reservation'),(23,'Can change reservation',8,'change_reservation'),(24,'Can delete reservation',8,'delete_reservation'),(25,'Can add custom user',9,'add_customuser'),(26,'Can change custom user',9,'change_customuser'),(27,'Can delete custom user',9,'delete_customuser');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-08-03 09:34:11.210134','1','guerzonigiacom95@gmail.com',2,'[{\"changed\": {\"fields\": [\"is_admin\"]}}]',9,2),(2,'2018-08-03 10:36:00.668062','1','metatino',1,'[{\"added\": {}}]',6,2),(3,'2018-08-03 10:38:42.406716','1','AccommodationImage object (1)',1,'[{\"added\": {}}]',7,2),(4,'2018-08-03 10:41:56.389588','3','piero@pippo.com',1,'[{\"added\": {}}]',9,2),(5,'2018-08-03 10:42:49.964891','3','piero@pippo.com',2,'[{\"changed\": {\"fields\": [\"avatar\"]}}]',9,2),(6,'2018-09-25 12:15:31.633495','1','guerzonigiacom95@gmail.com',2,'[{\"changed\": {\"fields\": [\"avatar\"]}}]',9,1),(7,'2018-09-25 13:44:10.968469','1','guerzonigiacom95@gmail.com',2,'[{\"changed\": {\"fields\": [\"avatar\"]}}]',9,1),(8,'2018-10-07 06:58:05.622808','1','guerzonigiacom95@gmail.com',2,'[{\"changed\": {\"fields\": [\"avatar\"]}}]',9,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'accommodation','accommodation'),(7,'accommodation','accommodationimage'),(8,'accommodation','reservation'),(9,'accounts','customuser'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
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
INSERT INTO `django_migrations` VALUES (1,'accounts','0001_initial','2018-08-02 15:59:22.876669'),(2,'accommodation','0001_initial','2018-08-02 15:59:23.074846'),(3,'contenttypes','0001_initial','2018-08-02 15:59:23.110965'),(4,'admin','0001_initial','2018-08-02 15:59:23.208153'),(5,'admin','0002_logentry_remove_auto_add','2018-08-02 15:59:23.228805'),(6,'contenttypes','0002_remove_content_type_name','2018-08-02 15:59:23.296712'),(7,'auth','0001_initial','2018-08-02 15:59:23.508050'),(8,'auth','0002_alter_permission_name_max_length','2018-08-02 15:59:23.527553'),(9,'auth','0003_alter_user_email_max_length','2018-08-02 15:59:23.541644'),(10,'auth','0004_alter_user_username_opts','2018-08-02 15:59:23.556198'),(11,'auth','0005_alter_user_last_login_null','2018-08-02 15:59:23.567496'),(12,'auth','0006_require_contenttypes_0002','2018-08-02 15:59:23.569825'),(13,'auth','0007_alter_validators_add_error_messages','2018-08-02 15:59:23.576719'),(14,'auth','0008_alter_user_username_max_length','2018-08-02 15:59:23.582599'),(15,'auth','0009_alter_user_last_name_max_length','2018-08-02 15:59:23.588062'),(16,'sessions','0001_initial','2018-08-02 15:59:23.615420'),(17,'accommodation','0002_auto_20181005_1800','2018-10-05 16:01:10.986769');
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
INSERT INTO `django_session` VALUES ('0ctk0tjdrufq73qbkni07wo4sx2c3ghn','MjY0ZmU3MDdiODc4NmRkMmM0NDQwZTNjZjhkYTNkNGRiZWI2NmNjOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2QyM2YzZTE0NzM3ZTg5MDhlMjA3YmFkNmFlOWIyOWQxY2M1N2ZmIn0=','2018-10-09 14:41:16.067309'),('3yv10mddpwe4pc93hk6gfvy3ledaohrr','MjY0ZmU3MDdiODc4NmRkMmM0NDQwZTNjZjhkYTNkNGRiZWI2NmNjOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2QyM2YzZTE0NzM3ZTg5MDhlMjA3YmFkNmFlOWIyOWQxY2M1N2ZmIn0=','2018-10-16 06:27:34.182961'),('50ujbpqadt7ld2phn4ovgrtf0qq8t802','MjY0ZmU3MDdiODc4NmRkMmM0NDQwZTNjZjhkYTNkNGRiZWI2NmNjOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2QyM2YzZTE0NzM3ZTg5MDhlMjA3YmFkNmFlOWIyOWQxY2M1N2ZmIn0=','2018-10-02 10:22:46.190282'),('9hojcw1ln9m2veih6p90z7716xg95uil','YzJlYzFmMGYzMTliYWQzODc1ZDMwY2Y1ZGZkY2Y3MzliNDUxMTM2YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2QyM2YzZTE0NzM3ZTg5MDhlMjA3YmFkNmFlOWIyOWQxY2M1N2ZmIiwicHJvcGVydHlfaWQiOjQxfQ==','2018-10-21 05:29:05.458221'),('izts1oc5dc2h646gvnidtty6u0h29ulq','MjY0ZmU3MDdiODc4NmRkMmM0NDQwZTNjZjhkYTNkNGRiZWI2NmNjOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2QyM2YzZTE0NzM3ZTg5MDhlMjA3YmFkNmFlOWIyOWQxY2M1N2ZmIn0=','2018-10-16 06:30:49.351714'),('j9ufwiegt6mrisft85fonc1h4winy8l8','OTAwNjc5N2VmMzJlOWZkZTZkMTA4NDE5MmVkYjY4NWU5MzRlNDc1Yzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZWE0ODE4ZjZiNjhiMzdmOWM4MTQ2ZDBkM2M5Mzc1NGNjZmQ2MDJlIn0=','2018-08-17 09:30:34.339694'),('mj91z3dtk3mjs9twuyxa98vevlpd64s2','MjY0ZmU3MDdiODc4NmRkMmM0NDQwZTNjZjhkYTNkNGRiZWI2NmNjOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2QyM2YzZTE0NzM3ZTg5MDhlMjA3YmFkNmFlOWIyOWQxY2M1N2ZmIn0=','2018-12-29 22:06:40.602611'),('ox83aprkq4aza9lw7q6axn52pyrxrmok','MjY0ZmU3MDdiODc4NmRkMmM0NDQwZTNjZjhkYTNkNGRiZWI2NmNjOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2QyM2YzZTE0NzM3ZTg5MDhlMjA3YmFkNmFlOWIyOWQxY2M1N2ZmIn0=','2018-12-03 16:40:33.713816'),('r146o6eliwtrl6nvfyrh6s43xnq5f1g8','MjY0ZmU3MDdiODc4NmRkMmM0NDQwZTNjZjhkYTNkNGRiZWI2NmNjOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2QyM2YzZTE0NzM3ZTg5MDhlMjA3YmFkNmFlOWIyOWQxY2M1N2ZmIn0=','2018-10-09 12:14:52.935802'),('s77jj8l9l64xdfdmmxiiy86pspxvjgyz','MjY0ZmU3MDdiODc4NmRkMmM0NDQwZTNjZjhkYTNkNGRiZWI2NmNjOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2QyM2YzZTE0NzM3ZTg5MDhlMjA3YmFkNmFlOWIyOWQxY2M1N2ZmIn0=','2018-10-09 14:03:21.884066'),('t2lcxnkvc1a2m0unl46y505plkpddeg7','MjY0ZmU3MDdiODc4NmRkMmM0NDQwZTNjZjhkYTNkNGRiZWI2NmNjOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2QyM2YzZTE0NzM3ZTg5MDhlMjA3YmFkNmFlOWIyOWQxY2M1N2ZmIn0=','2018-11-04 09:44:07.413570'),('te7k3f61xhgiqy13z0bzsx0cvzdgzrd1','YTdlNTdiY2RjODViNzI0MzBiMDI3M2M4OTQ2NjRjODE0MGZjNjU3NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2QyM2YzZTE0NzM3ZTg5MDhlMjA3YmFkNmFlOWIyOWQxY2M1N2ZmIiwicHJvcGVydHlfaWQiOm51bGx9','2018-10-20 18:57:58.052932'),('xryaqfhv5b4dt4d4xzzba0k14xhz5hb1','MjY0ZmU3MDdiODc4NmRkMmM0NDQwZTNjZjhkYTNkNGRiZWI2NmNjOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2QyM2YzZTE0NzM3ZTg5MDhlMjA3YmFkNmFlOWIyOWQxY2M1N2ZmIn0=','2019-01-23 15:49:59.087368');
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

-- Dump completed on 2019-01-09 17:09:06
