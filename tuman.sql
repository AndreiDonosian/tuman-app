-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: tuman_db
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('userDefault',2,1589042454);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `group_code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  KEY `fk_auth_item_group_code` (`group_code`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_auth_item_group_code` FOREIGN KEY (`group_code`) REFERENCES `auth_item_group` (`code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('/*',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('//*',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('//controller',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('//crud',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('//extension',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('//form',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('//index',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('//model',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('//module',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/asset/*',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/asset/compress',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/asset/template',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/cache/*',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/cache/flush',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/cache/flush-all',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/cache/flush-schema',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/cache/index',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/debug/*',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/debug/default/*',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/debug/default/db-explain',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/debug/default/download-mail',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/debug/default/index',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/debug/default/toolbar',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/debug/default/view',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/debug/user/*',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/debug/user/reset-identity',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/debug/user/set-identity',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/fixture/*',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/fixture/load',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/fixture/unload',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/gii/*',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/gii/default/*',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/gii/default/action',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/gii/default/diff',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/gii/default/index',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/gii/default/preview',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/gii/default/view',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/hello/*',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/hello/index',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/help/*',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/help/index',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/help/list',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/help/list-action-options',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/help/usage',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/message/*',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/message/config',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/message/config-template',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/message/extract',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/migrate/*',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/migrate/create',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/migrate/down',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/migrate/fresh',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/migrate/history',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/migrate/mark',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/migrate/new',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/migrate/redo',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/migrate/to',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/migrate/up',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/serve/*',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/serve/index',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/site/*',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/site/about',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/site/captcha',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/site/contact',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/site/error',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/site/index',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/site/login',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/site/logout',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/*',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/user-management/auth-item-group/*',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth-item-group/bulk-activate',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth-item-group/bulk-deactivate',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth-item-group/bulk-delete',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth-item-group/create',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth-item-group/delete',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth-item-group/grid-page-size',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth-item-group/grid-sort',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth-item-group/index',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth-item-group/toggle-attribute',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth-item-group/update',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth-item-group/view',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth/*',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth/captcha',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth/change-own-password',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/user-management/auth/confirm-email',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth/confirm-email-receive',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth/confirm-registration-email',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth/login',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth/logout',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth/password-recovery',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth/password-recovery-receive',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/auth/registration',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/permission/*',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/permission/bulk-activate',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/permission/bulk-deactivate',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/permission/bulk-delete',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/permission/create',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/permission/delete',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/permission/grid-page-size',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/permission/grid-sort',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/permission/index',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/permission/refresh-routes',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/permission/set-child-permissions',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/permission/set-child-routes',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/permission/toggle-attribute',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/permission/update',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/permission/view',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/role/*',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/role/bulk-activate',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/role/bulk-deactivate',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/role/bulk-delete',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/role/create',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/role/delete',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/role/grid-page-size',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/role/grid-sort',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/role/index',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/role/set-child-permissions',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/role/set-child-roles',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/role/toggle-attribute',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/role/update',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/role/view',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/user-permission/*',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/user-permission/set',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/user-management/user-permission/set-roles',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/user-management/user-visit-log/*',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/user-visit-log/bulk-activate',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/user-visit-log/bulk-deactivate',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/user-visit-log/bulk-delete',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/user-visit-log/create',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/user-visit-log/delete',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/user-visit-log/grid-page-size',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/user-visit-log/grid-sort',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/user-visit-log/index',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/user-visit-log/toggle-attribute',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/user-visit-log/update',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/user-visit-log/view',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/user/*',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/user/bulk-activate',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/user-management/user/bulk-deactivate',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/user-management/user/bulk-delete',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/user-management/user/change-password',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/user-management/user/create',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/user-management/user/delete',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/user-management/user/grid-page-size',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/user-management/user/grid-sort',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/user/index',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/user-management/user/toggle-attribute',3,NULL,NULL,NULL,1589042423,1589042423,NULL),('/user-management/user/update',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('/user-management/user/view',3,NULL,NULL,NULL,1589040857,1589040857,NULL),('Admin',1,'Admin',NULL,NULL,1589040857,1589040857,NULL),('assignRolesToUsers',2,'Assign roles to users',NULL,NULL,1589040857,1589040857,'userManagement'),('bindUserToIp',2,'Bind user to IP',NULL,NULL,1589040857,1589040857,'userManagement'),('changeOwnPassword',2,'Change own password',NULL,NULL,1589040857,1589040857,'userCommonPermissions'),('changeUserPassword',2,'Change user password',NULL,NULL,1589040857,1589040857,'userManagement'),('commonPermission',2,'Common permission',NULL,NULL,1589040857,1589040857,NULL),('createUsers',2,'Create users',NULL,NULL,1589040857,1589040857,'userManagement'),('deleteUsers',2,'Delete users',NULL,NULL,1589040857,1589040857,'userManagement'),('editUserEmail',2,'Edit user email',NULL,NULL,1589040857,1589040857,'userManagement'),('editUsers',2,'Edit users',NULL,NULL,1589040857,1589040857,'userManagement'),('uploadFiles',2,'Upload Files',NULL,NULL,1589042121,1589042121,'userCommonPermissions'),('userDefault',1,'User',NULL,NULL,1589042290,1589042290,NULL),('viewRegistrationIp',2,'View registration IP',NULL,NULL,1589040857,1589040857,'userManagement'),('viewUserEmail',2,'View user email',NULL,NULL,1589040857,1589040857,'userManagement'),('viewUserRoles',2,'View user roles',NULL,NULL,1589040857,1589040857,'userManagement'),('viewUsers',2,'View users',NULL,NULL,1589040857,1589040857,'userManagement'),('viewVisitLog',2,'View visit log',NULL,NULL,1589040857,1589040857,'userManagement');
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('uploadFiles','/site/*'),('changeOwnPassword','/user-management/auth/change-own-password'),('assignRolesToUsers','/user-management/user-permission/set'),('assignRolesToUsers','/user-management/user-permission/set-roles'),('editUsers','/user-management/user/bulk-activate'),('editUsers','/user-management/user/bulk-deactivate'),('deleteUsers','/user-management/user/bulk-delete'),('changeUserPassword','/user-management/user/change-password'),('createUsers','/user-management/user/create'),('deleteUsers','/user-management/user/delete'),('viewUsers','/user-management/user/grid-page-size'),('viewUsers','/user-management/user/index'),('editUsers','/user-management/user/update'),('viewUsers','/user-management/user/view'),('Admin','assignRolesToUsers'),('Admin','changeOwnPassword'),('userDefault','changeOwnPassword'),('Admin','changeUserPassword'),('Admin','createUsers'),('Admin','deleteUsers'),('Admin','editUsers'),('userDefault','uploadFiles'),('editUserEmail','viewUserEmail'),('assignRolesToUsers','viewUserRoles'),('Admin','viewUsers'),('assignRolesToUsers','viewUsers'),('changeUserPassword','viewUsers'),('createUsers','viewUsers'),('deleteUsers','viewUsers'),('editUsers','viewUsers');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_group`
--

DROP TABLE IF EXISTS `auth_item_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_item_group` (
  `code` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_group`
--

LOCK TABLES `auth_item_group` WRITE;
/*!40000 ALTER TABLE `auth_item_group` DISABLE KEYS */;
INSERT INTO `auth_item_group` VALUES ('userCommonPermissions','User common permission',1589040857,1589040857),('userManagement','User management',1589040857,1589040857);
/*!40000 ALTER TABLE `auth_item_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pin_hash` text,
  `userid` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  `deleted` tinyint(4) DEFAULT '0',
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `file_real_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'0001_you_p.json','application/json','51848','15901593605ec7e800492c98.22752953.json'),(2,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'AGENDA-practica-de-specialitate_TI.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','26222','15901593605ec7e80062af70.68628276.docx'),(3,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'table-18.csv','text/csv','71531','15901593605ec7e8007aea68.56004607.csv'),(4,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'2237-7-132208059.html','text/html','120708','15901593605ec7e80098b7f2.28285677.html'),(5,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'testing1.txt','text/plain','228','15901593605ec7e800b7c758.41874113.txt'),(6,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'_76720045_20190101_.pdf','application/pdf','386516','15901593605ec7e800d43966.92250370.pdf'),(7,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'_q_5IJbJ65E.jpg','image/jpeg','426978','15901593605ec7e800f1da91.00627951.jpg'),(8,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'telegram-cloud-document-2-5467577622181446955.mp4','video/mp4','376273','15901593615ec7e8011dcc42.87256601.mp4'),(9,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15901471115ec7b827603f39.78000476.gz','application/x-gzip','31511','15901593945ec7e822172991.25693279.gz'),(10,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'2020-01-02_date-stats.csv','text/csv','3168','15902459855ec93a61d0b108.88894611.csv'),(11,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'2237-7-132208059.html','text/html','120708','15902459855ec93a61ec2e74.49021414.html'),(12,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15148.jpg','image/jpeg','150653','15902459865ec93a620f6170.03143294.jpg'),(13,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'14511.jpg','image/jpeg','205529','15902459865ec93a622f0259.95039457.jpg'),(14,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'11457.jpg','image/jpeg','273487','15902459865ec93a624d9be7.57424468.jpg'),(15,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15340-2.jpg','image/jpeg','198134','15902459865ec93a626f0605.72849657.jpg'),(16,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15335.jpg','image/jpeg','297933','15902459865ec93a628a9027.86501122.jpg'),(17,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'180P_225K_272765091.webm','application/octet-stream','316709','15902461355ec93af7d3ab56.86167328.webm'),(18,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'2020-01-02_date-stats.csv','text/csv','3168','15902461355ec93af7efdc86.29998765.csv'),(19,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'2237-7-132208059.html','text/html','120708','15902461365ec93af815d400.74610646.html'),(20,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'811.jpg','image/jpeg','280830','15902461365ec93af83421d2.79201918.jpg'),(21,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'11457.jpg','image/jpeg','273487','15902461365ec93af85250a1.30661418.jpg'),(22,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'14511.jpg','image/jpeg','205529','15902461365ec93af86e2427.94772282.jpg'),(23,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15148.jpg','image/jpeg','150653','15902461365ec93af88c5349.13557611.jpg'),(24,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15335.jpg','image/jpeg','297933','15902461365ec93af8a96780.69449045.jpg'),(25,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'2020-01-02_date-stats.csv','text/csv','3168','15902461895ec93b2d1121b8.09229213.csv'),(26,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'2237-7-132208059.html','text/html','120708','15902461895ec93b2d32a195.46986865.html'),(27,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'811.jpg','image/jpeg','280830','15902461895ec93b2d528902.44354902.jpg'),(28,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'11457.jpg','image/jpeg','273487','15902461895ec93b2d766fc9.66345183.jpg'),(29,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'14511.jpg','image/jpeg','205529','15902461895ec93b2d9ed326.78088310.jpg'),(30,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15148.jpg','image/jpeg','150653','15902461895ec93b2dc7cd46.20053251.jpg'),(31,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15340-2.jpg','image/jpeg','198134','15902461895ec93b2dec97c4.94534462.jpg'),(32,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15335.jpg','image/jpeg','297933','15902461905ec93b2e188b65.22140897.jpg'),(33,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15340.jpg','image/jpeg','198134','15902461905ec93b2e35fd04.77364918.jpg'),(34,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15925.jpg','image/jpeg','206589','15902461905ec93b2e548520.14333979.jpg'),(35,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15351.jpg','image/jpeg','411753','15902461905ec93b2e724b22.52463141.jpg'),(36,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'16039.jpg','image/jpeg','348705','15902461905ec93b2e903850.99327861.jpg'),(37,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'17418.jpg','image/jpeg','122548','15902461905ec93b2eaf5294.91108806.jpg'),(38,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'16044.jpg','image/jpeg','370574','15902461905ec93b2ed02955.97580879.jpg'),(39,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'17325.jpg','image/jpeg','243809','15902461905ec93b2ef0e002.35622196.jpg'),(40,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'17582.jpg','image/jpeg','197223','15902461915ec93b2f1caf66.34006564.jpg'),(41,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'17423.jpg','image/jpeg','279693','15902461915ec93b2f3afa18.88048577.jpg'),(42,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'17422.jpg','image/jpeg','407955','15902461915ec93b2f58af71.40916204.jpg'),(43,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'19464.jpg','image/jpeg','238181','15902461915ec93b2f7affc8.58920585.jpg'),(44,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'21505-2.jpg','image/jpeg','132491','15902461915ec93b2f971e15.77081641.jpg'),(45,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'19935.jpg','image/jpeg','212582','15902461915ec93b2fb37679.50860786.jpg'),(46,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'0000135506.fid alias','application/octet-stream','852','15902461915ec93b2fce94e8.76139756.fid alias'),(47,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'19398.jpg','image/jpeg','387772','15902461915ec93b2fe6ed26.90228418.jpg'),(48,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'21505.jpg','image/jpeg','132491','15902461925ec93b300b2859.09390877.jpg'),(49,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'237094.pdf','application/pdf','44414','15902461925ec93b3023dbe6.23974595.pdf'),(50,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'190509_2003_180P_225K_222361031.webm','application/octet-stream','599771','15902461925ec93b303f9725.64301061.webm'),(51,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'560420.jpg','image/jpeg','730457','15902461925ec93b305aa958.30110327.jpg'),(52,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'2506709-10l.jpg','image/jpeg','10569','15902461925ec93b30743c83.56844364.jpg'),(53,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'1226404797_preview_1119379893_preview_Forest River.jpg','image/jpeg','643907','15902461925ec93b3093c1f1.59938260.jpg'),(54,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'3707100400_1b9480a0ab_z.jpg','image/jpeg','74385','15902461925ec93b30b1da87.32597799.jpg'),(55,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15901471115ec7b827603f39.78000476.gz','application/x-gzip','31511','15902461925ec93b30d14393.58608918.gz'),(56,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15901591745ec7e746bad062.65901518.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','31532','15902461925ec93b30f12186.96968492.docx'),(57,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'20170313140526043.pdf','application/pdf','128725','15902461935ec93b3119fe60.31188288.pdf'),(58,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'adam_eva.sql','application/octet-stream','5093','15902461935ec93b313744a3.47032745.sql'),(59,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'AGENDA-practica-de-specialitate_TI.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','26222','15902461935ec93b3155cf43.64776329.docx'),(60,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'aHyw2kpfIu4.jpg','image/jpeg','182407','15902461935ec93b3172bcc4.88889395.jpg'),(61,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'Analytics www.tnaflix.com Channels 20191212-20191223.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','11515','15902461935ec93b31903f53.13278284.xlsx'),(62,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'Analytics www.tnaflix.com Landing Pages 20191212-20191223.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','127689','15902461935ec93b31adaa62.49661751.xlsx'),(63,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'Analytics www.tnaflix.com Страницы входа 20191212-20191219.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','71504','15902461935ec93b31cce8c0.83675364.xlsx'),(64,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'back.png','image/png','20453','15902461935ec93b31e8ac47.57276289.png'),(65,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'BlankThumbs.txt','text/plain','7532','15902461945ec93b3212fc75.59967970.txt'),(66,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'BoardingCard_215153479_PRG_LTN.pdf','application/pdf','191930','15902461945ec93b322c8d65.82333446.pdf'),(67,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'BoardingCard_215153480_PRG_LTN.pdf','application/pdf','191645','15902461945ec93b3249f179.77665920.pdf'),(68,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'browse_sitemap001.xml-2.gz','application/x-gzip','62007','15902461945ec93b32668959.96233532.gz'),(69,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'browse_sitemap001.xml.gz','application/x-gzip','62004','15902461945ec93b32852b32.61518547.gz'),(70,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'bsoc.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','290220','15902461945ec93b32a49016.86073787.xlsx'),(71,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'category-info-html-changes.rtf','text/rtf','666','15902461945ec93b32c21f68.28588533.rtf'),(72,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'Certificate Manager','application/octet-stream','1132','15902461945ec93b32de3c80.49800227.'),(73,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'contractDonosian.pdf','application/pdf','120765','15902461955ec93b33054432.71807211.pdf'),(74,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'Curriculum EL TI.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','51015','15902461955ec93b3320c479.38387377.docx'),(75,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'data.txt','text/plain','8763','15902461965ec93b34087453.51050328.txt'),(76,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'data.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','14799','15902461965ec93b3427e4f5.05657852.xlsx'),(77,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'Default-presentation-Fizica-si-Inginerie-Varianta-Finala-Updated.ppt','application/vnd.ms-powerpoint','466944','15902461965ec93b34b1a495.73859212.ppt'),(78,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'detailed.jpg','image/jpeg','1041185','15902461965ec93b34df0736.36078604.jpg'),(79,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'doc.png','image/png','35081','15902461975ec93b35091932.95796195.png'),(80,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'811.jpg','image/jpeg','280830','15902463045ec93ba043eb33.54706617.jpg'),(81,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'2020-01-02_date-stats.csv','text/csv','3168','15902463045ec93ba0620563.57895862.csv'),(82,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'2237-7-132208059.html','text/html','120708','15902463045ec93ba07b77c6.80911277.html'),(83,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'14511.jpg','image/jpeg','205529','15902463045ec93ba09b05e3.02798302.jpg'),(84,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'11457.jpg','image/jpeg','273487','15902463045ec93ba0baa359.56687842.jpg'),(85,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15148.jpg','image/jpeg','150653','15902463045ec93ba0d77b15.52295198.jpg'),(86,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15340-2.jpg','image/jpeg','198134','15902463055ec93ba1035855.31307920.jpg'),(87,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15340.jpg','image/jpeg','198134','15902463055ec93ba122ee41.26253653.jpg'),(88,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'15335.jpg','image/jpeg','297933','15902463055ec93ba13de793.93320436.jpg'),(89,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,1,0,'15335.jpg','image/jpeg','297933','15902787335ec9ba4d0763f6.53428491.jpg'),(90,'aa9b202be940332879ca8ba3758dc909eb59c932a4234486ff2e86a9e913f059',2,1,0,'2020-01-02_date-stats.csv','text/csv','3168','15905715755ece3237119b25.47591255.csv'),(91,'aa9b202be940332879ca8ba3758dc909eb59c932a4234486ff2e86a9e913f059',2,1,0,'2237-7-132208059.html','text/html','120708','15905715755ece32372e7632.28574207.html'),(92,'aa9b202be940332879ca8ba3758dc909eb59c932a4234486ff2e86a9e913f059',2,1,0,'14511.jpg','image/jpeg','205529','15905715755ece3237484857.89625521.jpg'),(93,'aa9b202be940332879ca8ba3758dc909eb59c932a4234486ff2e86a9e913f059',2,1,0,'811.jpg','image/jpeg','280830','15905715755ece3237634861.33126080.jpg'),(94,'aa9b202be940332879ca8ba3758dc909eb59c932a4234486ff2e86a9e913f059',2,1,0,'11457.jpg','image/jpeg','273487','15905715755ece32377e3738.01558539.jpg'),(95,'aa9b202be940332879ca8ba3758dc909eb59c932a4234486ff2e86a9e913f059',2,1,0,'15148.jpg','image/jpeg','150653','15905715755ece323799d564.36477152.jpg'),(96,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'photo_2020-06-15 20.51.48.jpeg','image/jpeg','44455','15925125305eebd012cab639.78082763.jpeg'),(97,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'Ooooo.jpg','image/jpeg','35608','15925125765eebd04053e148.66726323.jpg'),(98,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,0,1,'Sza.pdf','application/pdf','168571','15925125865eebd04a313c63.29521229.pdf'),(99,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,1,0,'Declarație_Anexa 1.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','14605','15925468215eec5605acfc79.19955311.docx'),(100,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,1,0,'folder.jpg','image/jpeg','22854','15925468215eec5605d44b56.71689422.jpg'),(101,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,1,0,'requirements.txt','text/plain','57','15925468225eec56060ed564.28295512.txt'),(102,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,1,0,'Ooooo.jpg','image/jpeg','35608','15925468225eec5606374803.65722500.jpg'),(103,'435a9f689af66283b86f11fcf09f8a0092e932c73d2bfbec55ef9bf0cf66a00d',2,1,0,'main.jpg','image/jpeg','954198','15925468225eec56067bc8a3.92297121.jpg');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1589040316),('m140608_173539_create_user_table',1589040856),('m140611_133903_init_rbac',1589040856),('m140808_073114_create_auth_item_group_table',1589040856),('m140809_072112_insert_superadmin_to_user',1589040856),('m140809_073114_insert_common_permisison_to_auth_item',1589040857),('m141023_141535_create_user_visit_log',1589040857),('m141116_115804_add_bind_to_ip_and_registration_ip_to_user',1589040857),('m141121_194858_split_browser_and_os_column',1589040857),('m141201_220516_add_email_and_email_confirmed_to_user',1589040857),('m141207_001649_create_basic_user_permissions',1589040857);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pin`
--

DROP TABLE IF EXISTS `pin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pin` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pin`
--

LOCK TABLES `pin` WRITE;
/*!40000 ALTER TABLE `pin` DISABLE KEYS */;
INSERT INTO `pin` VALUES (1,32123,2),(2,324234,2),(3,111,2),(4,123,2),(5,1234,2),(6,12345,2),(7,1,2),(8,3383,2),(9,9,2),(10,676,2),(11,656,2),(12,12,2),(13,67,2),(14,1232,2),(15,8989,2);
/*!40000 ALTER TABLE `pin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `superadmin` smallint(6) DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `registration_ip` varchar(15) DEFAULT NULL,
  `bind_to_ip` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `email_confirmed` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'superadmin','-GrZJDFfDuqaImDUg6yUjQIHM5aawFIH','$2y$13$ex33RouYN6hOQymhmg173eK3brSBvyjc92JYw47BKvYDxQaDvqSDG',NULL,1,1,1589040856,1589040856,NULL,NULL,NULL,0),(2,'bem1','g5I446OJYQNaqkBDBGePFVyET6p_qPCU','$2y$13$uWIT7/cQjHolJ6vphKKiDeegSSevmITnCzzoSRB7Y2HbzZbN6weoO',NULL,1,0,1589041304,1589041304,'::1','',NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_visit_log`
--

DROP TABLE IF EXISTS `user_visit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_visit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `language` char(2) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `visit_time` int(11) NOT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `os` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_visit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_visit_log`
--

LOCK TABLES `user_visit_log` WRITE;
/*!40000 ALTER TABLE `user_visit_log` DISABLE KEYS */;
INSERT INTO `user_visit_log` VALUES (1,'5eb6d76880755','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',1,1589041000,'Safari','mac'),(2,'5eb6d7a73c359','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',1,1589041063,'Safari','mac'),(3,'5eb6d89865d75','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',2,1589041304,'Safari','mac'),(4,'5eb6d9ec0c20e','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',2,1589041644,'Safari','mac'),(5,'5eb6db12acbe7','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',1,1589041938,'Safari','mac'),(6,'5eb6dd268e0c3','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',2,1589042470,'Safari','mac'),(7,'5eb6dd3023d0e','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',2,1589042480,'Safari','mac'),(8,'5eb6e1432cdd9','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',2,1589043523,'Safari','mac'),(9,'5eb6e3c82ea3a','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',2,1589044168,'Safari','mac'),(10,'5ebeedf3eb83c','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',2,1589571059,'Safari','mac'),(11,'5ec7b419c1977','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',2,1590146073,'Safari','mac'),(12,'5ec7b923ba198','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',2,1590147363,'Safari','mac'),(13,'5ec7e007d4c67','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',2,1590157319,'Safari','mac'),(14,'5ec7e02e4b42e','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',2,1590157358,'Safari','mac'),(15,'5ec9b9be07ac1','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',2,1590278590,'Safari','mac'),(16,'5ece322b5faa4','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',2,1590571563,'Safari','mac'),(17,'5ee7dc778f1df','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',2,1592253559,'Safari','mac'),(18,'5eebcffa6ecb5','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',2,1592512506,'Safari','mac'),(19,'5eec55f806284','::1','en','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15',2,1592546808,'Safari','mac');
/*!40000 ALTER TABLE `user_visit_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-16 15:44:55
