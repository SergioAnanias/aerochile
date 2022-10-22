-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: aero_chile
-- ------------------------------------------------------
-- Server version	5.7.24

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
  `name` varchar(150) NOT NULL,
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add plane',1,'add_plane'),(2,'Can change plane',1,'change_plane'),(3,'Can delete plane',1,'delete_plane'),(4,'Can view plane',1,'view_plane'),(5,'Can add user',2,'add_user'),(6,'Can change user',2,'change_user'),(7,'Can delete user',2,'delete_user'),(8,'Can view user',2,'view_user'),(9,'Can add vaccine',3,'add_vaccine'),(10,'Can change vaccine',3,'change_vaccine'),(11,'Can delete vaccine',3,'delete_vaccine'),(12,'Can view vaccine',3,'view_vaccine'),(13,'Can add travel',4,'add_travel'),(14,'Can change travel',4,'change_travel'),(15,'Can delete travel',4,'delete_travel'),(16,'Can view travel',4,'view_travel'),(17,'Can add passenger',5,'add_passenger'),(18,'Can change passenger',5,'change_passenger'),(19,'Can delete passenger',5,'delete_passenger'),(20,'Can view passenger',5,'view_passenger'),(21,'Can add log entry',6,'add_logentry'),(22,'Can change log entry',6,'change_logentry'),(23,'Can delete log entry',6,'delete_logentry'),(24,'Can view log entry',6,'view_logentry'),(25,'Can add permission',7,'add_permission'),(26,'Can change permission',7,'change_permission'),(27,'Can delete permission',7,'delete_permission'),(28,'Can view permission',7,'view_permission'),(29,'Can add group',8,'add_group'),(30,'Can change group',8,'change_group'),(31,'Can delete group',8,'delete_group'),(32,'Can view group',8,'view_group'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user'),(37,'Can add content type',10,'add_contenttype'),(38,'Can change content type',10,'change_contenttype'),(39,'Can delete content type',10,'delete_contenttype'),(40,'Can view content type',10,'view_contenttype'),(41,'Can add session',11,'add_session'),(42,'Can change session',11,'change_session'),(43,'Can delete session',11,'delete_session'),(44,'Can view session',11,'view_session');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$LZl0SOC4hCTO64sqTwwIkP$WGdLbJ44ThP+IUL1Febasp0Wu8jOqkwgFeZwKmYukbs=','2021-09-25 18:34:14.623222',1,'admin','','','admin@admin.com',1,1,'2021-09-25 14:49:59.624073');
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-09-25 14:50:38.353242','1','Plane object (1)',1,'[{\"added\": {}}]',1,1),(2,'2021-09-25 14:50:40.420113','2','Plane object (2)',1,'[{\"added\": {}}]',1,1),(3,'2021-09-25 14:50:42.787956','3','Plane object (3)',1,'[{\"added\": {}}]',1,1),(4,'2021-09-25 14:50:46.100980','4','Plane object (4)',1,'[{\"added\": {}}]',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'admin','logentry'),(8,'auth','group'),(7,'auth','permission'),(9,'auth','user'),(10,'contenttypes','contenttype'),(5,'main','passenger'),(1,'main','plane'),(4,'main','travel'),(2,'main','user'),(3,'main','vaccine'),(11,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-09-25 14:44:57.939090'),(2,'auth','0001_initial','2021-09-25 14:44:58.522058'),(3,'admin','0001_initial','2021-09-25 14:44:58.662878'),(4,'admin','0002_logentry_remove_auto_add','2021-09-25 14:44:58.669881'),(5,'admin','0003_logentry_add_action_flag_choices','2021-09-25 14:44:58.677897'),(6,'contenttypes','0002_remove_content_type_name','2021-09-25 14:44:58.774154'),(7,'auth','0002_alter_permission_name_max_length','2021-09-25 14:44:58.789938'),(8,'auth','0003_alter_user_email_max_length','2021-09-25 14:44:58.807938'),(9,'auth','0004_alter_user_username_opts','2021-09-25 14:44:58.814936'),(10,'auth','0005_alter_user_last_login_null','2021-09-25 14:44:58.867596'),(11,'auth','0006_require_contenttypes_0002','2021-09-25 14:44:58.870597'),(12,'auth','0007_alter_validators_add_error_messages','2021-09-25 14:44:58.877596'),(13,'auth','0008_alter_user_username_max_length','2021-09-25 14:44:58.893598'),(14,'auth','0009_alter_user_last_name_max_length','2021-09-25 14:44:58.908596'),(15,'auth','0010_alter_group_name_max_length','2021-09-25 14:44:58.925441'),(16,'auth','0011_update_proxy_permissions','2021-09-25 14:44:58.932420'),(17,'auth','0012_alter_user_first_name_max_length','2021-09-25 14:44:58.948035'),(18,'main','0001_initial','2021-09-25 14:44:59.246796'),(19,'main','0002_rename_date_travel_flightdate','2021-09-25 14:44:59.262783'),(20,'sessions','0001_initial','2021-09-25 14:44:59.319626'),(21,'main','0003_auto_20210925_1220','2021-09-25 15:20:51.325413'),(22,'main','0004_rename_travels_passenger_travel','2021-09-25 17:20:50.398456');
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
INSERT INTO `django_session` VALUES ('vupffwd1l4bdhr3swt1v0j68cwijypfn','.eJxVjLEOgzAMRP_FcxWRxNCYsTvfgBzsFNoKJAJT1X8vkVgY7927-8KedYXW3aDnfRv7EvtJoAULFxZ5eOtcCnnx_FzMsMzbOkVTFHO22XSL6OdxupeDkfN4rPEuiMIcAjeVkEvO2ip6tagkisH7OlLyKSWiunY2oY2qxAdvmAaE3x-vRzp6:1mUCV4:JbxukDsbA1Ni2CxaGk1jok_Ji2JIybzlbKgZObxruHI','2021-10-09 18:34:14.629221');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_passenger`
--

DROP TABLE IF EXISTS `main_passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_passenger` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `rut` varchar(10) NOT NULL,
  `birthday` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `travel_id` bigint(20) DEFAULT NULL,
  `vaccine_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `main_passenger_vaccine_id_cbb1f8ea_fk_main_vaccine_id` (`vaccine_id`),
  KEY `main_passenger_travel_id_63f60d70_fk_main_travel_id` (`travel_id`),
  CONSTRAINT `main_passenger_travel_id_63f60d70_fk_main_travel_id` FOREIGN KEY (`travel_id`) REFERENCES `main_travel` (`id`),
  CONSTRAINT `main_passenger_vaccine_id_cbb1f8ea_fk_main_vaccine_id` FOREIGN KEY (`vaccine_id`) REFERENCES `main_vaccine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_passenger`
--

LOCK TABLES `main_passenger` WRITE;
/*!40000 ALTER TABLE `main_passenger` DISABLE KEYS */;
INSERT INTO `main_passenger` VALUES (2,'Lissette CAntinallo','14459042-2','1995-05-10 00:00:00.000000','2021-09-25 17:31:17.775166','2021-09-25 17:31:17.775166',7,1),(3,'Sergio Antonio Ananias Ortega','18430912-1','1995-05-10 00:00:00.000000','2021-09-25 17:45:23.602077','2021-09-25 17:45:23.602077',7,1),(4,'Sergio Antonio Ananias Ortega','18854342-1','1995-03-10 00:00:00.000000','2021-09-25 18:01:57.525047','2021-09-25 18:01:57.525047',10,1),(5,'Cupertina Ortega Melo','9583402-2','1960-05-10 00:00:00.000000','2021-09-25 18:07:02.524050','2021-09-25 18:07:02.524050',8,1),(6,'Sergio Antonio Ananias Ortega','18875581-1','1995-03-10 00:00:00.000000','2021-09-25 18:24:18.012885','2021-09-25 18:24:18.012885',10,2),(7,'Victoria Meza Urrutia','18875581-1','1995-03-10 00:00:00.000000','2021-09-25 18:24:40.439478','2021-09-25 18:24:40.440004',10,3);
/*!40000 ALTER TABLE `main_passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_plane`
--

DROP TABLE IF EXISTS `main_plane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_plane` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `model` varchar(45) NOT NULL,
  `enrollment` varchar(45) NOT NULL,
  `current_city` varchar(45) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enrollment` (`enrollment`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_plane`
--

LOCK TABLES `main_plane` WRITE;
/*!40000 ALTER TABLE `main_plane` DISABLE KEYS */;
INSERT INTO `main_plane` VALUES (1,'Airbus A320 Neo','1','SCL','2021-09-25 14:50:38.353242','2021-09-25 14:50:38.353242'),(2,'Airbus A320 Neo','2','LIM','2021-09-25 14:50:40.419113','2021-09-25 18:25:01.253265'),(3,'Airbus A320 Neo','3','LIM','2021-09-25 14:50:42.787956','2021-09-25 18:23:58.338651'),(4,'Airbus A320 Neo','4','SCL','2021-09-25 14:50:46.099983','2021-09-25 18:08:12.183260');
/*!40000 ALTER TABLE `main_plane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_travel`
--

DROP TABLE IF EXISTS `main_travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_travel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `origin` varchar(45) NOT NULL,
  `flightdate` datetime(6) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `planes_id` bigint(20) DEFAULT NULL,
  `completed` tinyint(1) NOT NULL,
  `scheduled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `main_travel_planes_id_016a7017_fk_main_plane_id` (`planes_id`),
  CONSTRAINT `main_travel_planes_id_016a7017_fk_main_plane_id` FOREIGN KEY (`planes_id`) REFERENCES `main_plane` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_travel`
--

LOCK TABLES `main_travel` WRITE;
/*!40000 ALTER TABLE `main_travel` DISABLE KEYS */;
INSERT INTO `main_travel` VALUES (7,'alksjdoiqw','SCL','2022-05-10 00:00:00.000000','AEP','2021-09-25 15:47:51.742190','2021-09-25 17:53:45.839816',4,1,0),(8,'LAO20','AEP','2021-12-10 00:00:00.000000','SCL','2021-09-25 17:55:17.367501','2021-09-25 18:08:12.180263',4,1,0),(9,'SCL102AEP','SCL','2021-09-28 00:00:00.000000','AEP','2021-09-25 17:57:26.484765','2021-09-25 18:01:10.919272',2,1,0),(10,'AEP102LIM','AEP','2022-05-10 00:00:00.000000','LIM','2021-09-25 18:01:30.508930','2021-09-25 18:25:01.251266',2,1,0),(11,'SCL101AEP','SCL','2022-12-10 00:00:00.000000','AEP','2021-09-25 18:08:46.589627','2021-09-25 18:08:46.589627',1,0,1),(12,'SCL103LIM','SCL','2022-05-10 00:00:00.000000','LIM','2021-09-25 18:23:53.383231','2021-09-25 18:23:58.335651',3,1,0);
/*!40000 ALTER TABLE `main_travel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_user`
--

DROP TABLE IF EXISTS `main_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dateborn` date NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_user`
--

LOCK TABLES `main_user` WRITE;
/*!40000 ALTER TABLE `main_user` DISABLE KEYS */;
INSERT INTO `main_user` VALUES (1,'Sergio Antonio','Ananias Ortega','sergio.ananias.o@gmail.com','$2b$12$PeKeQxxZyTgkP8C10XGA4e6sffGrZRkXau5bVytwTgMLIWl7Qw0u6','1995-03-10','2021-09-25 14:51:17.158149','2021-09-25 14:51:17.158149'),(2,'operario prueba','operario prueba','operario1@prueba.com','$2b$12$UyhELkGh/4jbcG2BmH4gOe/77FecGt57.54zLj0MR2zAIMZImC2MW','1995-03-12','2021-09-25 18:33:44.252318','2021-09-25 18:33:44.252318');
/*!40000 ALTER TABLE `main_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_vaccine`
--

DROP TABLE IF EXISTS `main_vaccine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_vaccine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_vaccine`
--

LOCK TABLES `main_vaccine` WRITE;
/*!40000 ALTER TABLE `main_vaccine` DISABLE KEYS */;
INSERT INTO `main_vaccine` VALUES (1,'Sinovac','2021-09-25 17:26:01.024987','2021-09-25 17:26:01.024987'),(2,'Cancino','2021-09-25 18:24:18.010884','2021-09-25 18:24:18.010884'),(3,'SPUTNIK','2021-09-25 18:24:40.437479','2021-09-25 18:24:40.437479');
/*!40000 ALTER TABLE `main_vaccine` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-25 15:36:02
