-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: acore_auth
-- ------------------------------------------------------
-- Server version	8.4.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` binary(32) NOT NULL,
  `verifier` binary(32) NOT NULL,
  `session_key` binary(40) DEFAULT NULL,
  `totp_secret` varbinary(128) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reg_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `last_attempt_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int unsigned NOT NULL DEFAULT '0',
  `locked` tinyint unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00',
  `last_login` timestamp NULL DEFAULT NULL,
  `online` int unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint unsigned NOT NULL DEFAULT '2',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `mutetime` bigint NOT NULL DEFAULT '0',
  `mutereason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `muteby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enUS',
  `os` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `recruiter` int unsigned NOT NULL DEFAULT '0',
  `totaltime` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Account System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'ADMIN',_binary '\Þè›³ß¦aù\'\\—,,¶\è\æy8\ô{\ß~¼xv\ÊbG9b\ò',_binary '\ì©û† \õj)¼Ë®Àc\ZUûªü‚IT\r\\µ\ÜÞµ\Ì',_binary 'À¨\Å\ë¶7\è\ëv.\ãi7\ðX“pÀþ\Ï*\ó\ß\ÎÚ–®4 \ñU—ýÀ¸D4û',NULL,'','','2026-10-20 19:55:29','172.18.0.1','172.18.0.1',0,0,'00','2026-10-21 15:44:45',0,2,1,0,'','','esMX','Win',0,18444);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_access`
--

DROP TABLE IF EXISTS `account_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_access` (
  `id` int unsigned NOT NULL,
  `gmlevel` tinyint unsigned NOT NULL,
  `RealmID` int NOT NULL DEFAULT '-1',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_access`
--

LOCK TABLES `account_access` WRITE;
/*!40000 ALTER TABLE `account_access` DISABLE KEYS */;
INSERT INTO `account_access` VALUES (1,3,-1,'');
/*!40000 ALTER TABLE `account_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_banned`
--

DROP TABLE IF EXISTS `account_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_banned` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int unsigned NOT NULL DEFAULT '0',
  `unbandate` int unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banreason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Ban List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_banned`
--

LOCK TABLES `account_banned` WRITE;
/*!40000 ALTER TABLE `account_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_muted`
--

DROP TABLE IF EXISTS `account_muted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_muted` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mutedate` int unsigned NOT NULL DEFAULT '0',
  `mutetime` int unsigned NOT NULL DEFAULT '0',
  `mutedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mutereason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`guid`,`mutedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='mute List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_muted`
--

LOCK TABLES `account_muted` WRITE;
/*!40000 ALTER TABLE `account_muted` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_muted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autobroadcast`
--

DROP TABLE IF EXISTS `autobroadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autobroadcast` (
  `realmid` int NOT NULL DEFAULT '-1',
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `weight` tinyint unsigned DEFAULT '1',
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`realmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autobroadcast`
--

LOCK TABLES `autobroadcast` WRITE;
/*!40000 ALTER TABLE `autobroadcast` DISABLE KEYS */;
/*!40000 ALTER TABLE `autobroadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autobroadcast_locale`
--

DROP TABLE IF EXISTS `autobroadcast_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autobroadcast_locale` (
  `realmid` int NOT NULL,
  `id` int NOT NULL,
  `locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`realmid`,`id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autobroadcast_locale`
--

LOCK TABLES `autobroadcast_locale` WRITE;
/*!40000 ALTER TABLE `autobroadcast_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `autobroadcast_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_info`
--

DROP TABLE IF EXISTS `build_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `build_info` (
  `build` int NOT NULL,
  `majorVersion` int DEFAULT NULL,
  `minorVersion` int DEFAULT NULL,
  `bugfixVersion` int DEFAULT NULL,
  `hotfixVersion` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `winAuthSeed` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `win64AuthSeed` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mac64AuthSeed` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `winChecksumSeed` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `macChecksumSeed` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_info`
--

LOCK TABLES `build_info` WRITE;
/*!40000 ALTER TABLE `build_info` DISABLE KEYS */;
INSERT INTO `build_info` VALUES (5875,1,12,1,NULL,NULL,NULL,NULL,'95EDB27C7823B363CBDDAB56A392E7CB73FCCA20','8D173CC381961EEBABF336F5E6675B101BB513E5'),(6005,1,12,2,NULL,NULL,NULL,NULL,NULL,NULL),(6141,1,12,3,NULL,NULL,NULL,NULL,NULL,NULL),(8606,2,4,3,NULL,NULL,NULL,NULL,'319AFAA3F2559682F9FF658BE01456255F456FB1','D8B0ECFE534BC1131E19BAD1D4C0E813EEE4994F'),(9947,3,1,3,NULL,NULL,NULL,NULL,NULL,NULL),(10505,3,2,2,'a',NULL,NULL,NULL,NULL,NULL),(11159,3,3,0,'a',NULL,NULL,NULL,NULL,NULL),(11403,3,3,2,NULL,NULL,NULL,NULL,NULL,NULL),(11723,3,3,3,'a',NULL,NULL,NULL,NULL,NULL),(12340,3,3,5,'a',NULL,NULL,NULL,'CDCBBD5188315E6B4D19449D492DBCFAF156A347','B706D13FF2F4018839729461E3F8A0E2B5FDC034'),(13930,3,3,5,'a',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `build_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_banned`
--

DROP TABLE IF EXISTS `ip_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_banned` (
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `bandate` int unsigned NOT NULL,
  `unbandate` int unsigned NOT NULL,
  `bannedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Banned IPs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_banned`
--

LOCK TABLES `ip_banned` WRITE;
/*!40000 ALTER TABLE `ip_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `time` int unsigned NOT NULL,
  `realm` int unsigned NOT NULL,
  `type` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `string` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_ip_actions`
--

DROP TABLE IF EXISTS `logs_ip_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_ip_actions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique Identifier',
  `account_id` int unsigned NOT NULL COMMENT 'Account ID',
  `character_guid` int unsigned NOT NULL COMMENT 'Character Guid',
  `type` tinyint unsigned NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `systemnote` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Notes inserted by system',
  `unixtime` int unsigned NOT NULL COMMENT 'Unixtime',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Allows users to add a comment',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Used to log ips of individual actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_ip_actions`
--

LOCK TABLES `logs_ip_actions` WRITE;
/*!40000 ALTER TABLE `logs_ip_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs_ip_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motd`
--

DROP TABLE IF EXISTS `motd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motd` (
  `realmid` int NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`realmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motd`
--

LOCK TABLES `motd` WRITE;
/*!40000 ALTER TABLE `motd` DISABLE KEYS */;
INSERT INTO `motd` VALUES (-1,'Welcome to an AzerothCore server.');
/*!40000 ALTER TABLE `motd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motd_localized`
--

DROP TABLE IF EXISTS `motd_localized`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motd_localized` (
  `realmid` int NOT NULL,
  `locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`realmid`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motd_localized`
--

LOCK TABLES `motd_localized` WRITE;
/*!40000 ALTER TABLE `motd_localized` DISABLE KEYS */;
/*!40000 ALTER TABLE `motd_localized` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_account_permissions`
--

DROP TABLE IF EXISTS `rbac_account_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_account_permissions` (
  `accountId` int unsigned NOT NULL COMMENT 'Account id',
  `permissionId` int unsigned NOT NULL COMMENT 'Permission id',
  `granted` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Granted = 1, Denied = 0',
  `realmId` int NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`permissionId`,`realmId`),
  KEY `fk__rbac_account_roles__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_account_permissions__account` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_account_roles__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Account-Permission relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_account_permissions`
--

LOCK TABLES `rbac_account_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_account_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `rbac_account_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_default_permissions`
--

DROP TABLE IF EXISTS `rbac_default_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_default_permissions` (
  `secId` int unsigned NOT NULL COMMENT 'Security Level id',
  `permissionId` int unsigned NOT NULL COMMENT 'permission id',
  `realmId` int NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`secId`,`permissionId`,`realmId`),
  KEY `fk__rbac_default_permissions__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_default_permissions__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Default permission to assign to different account security levels';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_default_permissions`
--

LOCK TABLES `rbac_default_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_default_permissions` DISABLE KEYS */;
INSERT INTO `rbac_default_permissions` VALUES (3,192,-1),(2,193,-1),(1,194,-1),(0,195,-1);
/*!40000 ALTER TABLE `rbac_default_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_linked_permissions`
--

DROP TABLE IF EXISTS `rbac_linked_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_linked_permissions` (
  `id` int unsigned NOT NULL COMMENT 'Permission id',
  `linkedId` int unsigned NOT NULL COMMENT 'Linked Permission id',
  PRIMARY KEY (`id`,`linkedId`),
  KEY `fk__rbac_linked_permissions__rbac_permissions1` (`id`),
  KEY `fk__rbac_linked_permissions__rbac_permissions2` (`linkedId`),
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions1` FOREIGN KEY (`id`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions2` FOREIGN KEY (`linkedId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Permission - Linked Permission relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_linked_permissions`
--

LOCK TABLES `rbac_linked_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_linked_permissions` DISABLE KEYS */;
INSERT INTO `rbac_linked_permissions` VALUES (192,7),(192,21),(192,42),(192,43),(192,193),(192,196),(193,45),(193,48),(193,52),(193,53),(193,194),(193,197),(194,1),(194,2),(194,9),(194,11),(194,13),(194,14),(194,15),(194,16),(194,17),(194,18),(194,19),(194,20),(194,22),(194,23),(194,25),(194,26),(194,27),(194,28),(194,29),(194,30),(194,31),(194,32),(194,33),(194,34),(194,35),(194,36),(194,37),(194,38),(194,39),(194,40),(194,41),(194,44),(194,46),(194,47),(194,51),(194,195),(194,198),(194,632),(194,798),(195,3),(195,4),(195,5),(195,6),(195,24),(195,49),(195,199),(196,200),(196,201),(196,202),(196,203),(196,204),(196,205),(196,206),(196,219),(196,220),(196,224),(196,226),(196,227),(196,228),(196,229),(196,258),(196,259),(196,260),(196,261),(196,262),(196,265),(196,266),(196,278),(196,281),(196,282),(196,289),(196,290),(196,350),(196,351),(196,352),(196,353),(196,354),(196,355),(196,356),(196,357),(196,359),(196,360),(196,361),(196,362),(196,363),(196,364),(196,365),(196,366),(196,463),(196,464),(196,465),(196,503),(196,511),(196,524),(196,607),(196,608),(196,609),(196,610),(196,611),(196,612),(196,613),(196,614),(196,615),(196,616),(196,617),(196,618),(196,619),(196,620),(196,621),(196,622),(196,623),(196,624),(196,625),(196,626),(196,627),(196,629),(196,630),(196,631),(196,633),(196,634),(196,635),(196,636),(196,637),(196,638),(196,639),(196,640),(196,641),(196,642),(196,643),(196,644),(196,645),(196,646),(196,647),(196,648),(196,649),(196,650),(196,651),(196,652),(196,653),(196,654),(196,655),(196,656),(196,657),(196,658),(196,659),(196,660),(196,661),(196,662),(196,663),(196,664),(196,665),(196,666),(196,667),(196,668),(196,669),(196,670),(196,671),(196,672),(196,673),(196,674),(196,675),(196,676),(196,677),(196,678),(196,679),(196,680),(196,681),(196,682),(196,683),(196,684),(196,685),(196,686),(196,687),(196,688),(196,689),(196,690),(196,691),(196,692),(196,693),(196,694),(196,695),(196,696),(196,697),(196,698),(196,699),(196,701),(196,702),(196,703),(196,704),(196,706),(196,707),(196,708),(196,709),(196,710),(196,711),(196,712),(196,713),(196,714),(196,715),(196,716),(196,717),(196,718),(196,719),(196,720),(196,721),(196,722),(196,723),(196,724),(196,726),(196,727),(196,728),(196,729),(196,730),(196,731),(196,732),(196,733),(196,734),(196,735),(196,736),(196,748),(196,753),(196,757),(196,773),(196,777),(196,779),(196,780),(196,781),(196,782),(196,783),(196,784),(196,785),(196,786),(196,787),(196,788),(196,789),(196,790),(196,791),(196,792),(196,793),(196,839),(196,840),(196,843),(196,866),(196,867),(196,872),(196,873),(196,880),(196,881),(196,886),(196,887),(196,888),(196,891),(196,894),(196,896),(196,905),(196,906),(196,907),(196,908),(196,912),(196,915),(196,922),(196,927),(196,928),(196,929),(196,932),(196,939),(196,943),(196,944),(197,231),(197,232),(197,233),(197,234),(197,235),(197,236),(197,237),(197,238),(197,267),(197,268),(197,269),(197,270),(197,271),(197,272),(197,274),(197,275),(197,276),(197,279),(197,280),(197,283),(197,284),(197,285),(197,286),(197,287),(197,292),(197,293),(197,294),(197,295),(197,296),(197,297),(197,298),(197,299),(197,300),(197,343),(197,344),(197,346),(197,347),(197,367),(197,368),(197,369),(197,370),(197,371),(197,372),(197,373),(197,376),(197,377),(197,388),(197,389),(197,390),(197,391),(197,392),(197,393),(197,394),(197,396),(197,397),(197,398),(197,399),(197,401),(197,402),(197,403),(197,404),(197,405),(197,406),(197,407),(197,409),(197,410),(197,411),(197,413),(197,414),(197,415),(197,416),(197,417),(197,419),(197,420),(197,421),(197,422),(197,423),(197,424),(197,425),(197,426),(197,427),(197,428),(197,429),(197,431),(197,432),(197,433),(197,434),(197,435),(197,436),(197,437),(197,438),(197,439),(197,440),(197,441),(197,445),(197,448),(197,449),(197,451),(197,452),(197,453),(197,454),(197,457),(197,458),(197,460),(197,461),(197,472),(197,473),(197,474),(197,475),(197,476),(197,477),(197,478),(197,479),(197,480),(197,481),(197,482),(197,483),(197,484),(197,485),(197,486),(197,487),(197,488),(197,489),(197,490),(197,491),(197,492),(197,493),(197,494),(197,495),(197,497),(197,498),(197,499),(197,500),(197,502),(197,504),(197,506),(197,508),(197,509),(197,512),(197,513),(197,514),(197,516),(197,518),(197,519),(197,520),(197,521),(197,522),(197,523),(197,526),(197,527),(197,528),(197,529),(197,530),(197,531),(197,533),(197,535),(197,536),(197,537),(197,538),(197,539),(197,540),(197,541),(197,542),(197,543),(197,544),(197,545),(197,546),(197,547),(197,548),(197,549),(197,550),(197,551),(197,552),(197,553),(197,554),(197,555),(197,556),(197,557),(197,558),(197,559),(197,560),(197,561),(197,562),(197,563),(197,564),(197,565),(197,566),(197,567),(197,568),(197,569),(197,571),(197,572),(197,573),(197,574),(197,575),(197,576),(197,577),(197,578),(197,579),(197,580),(197,581),(197,582),(197,583),(197,584),(197,585),(197,586),(197,587),(197,588),(197,589),(197,590),(197,591),(197,592),(197,593),(197,594),(197,595),(197,596),(197,597),(197,598),(197,599),(197,600),(197,601),(197,602),(197,603),(197,604),(197,605),(197,606),(197,737),(197,738),(197,739),(197,740),(197,741),(197,762),(197,763),(197,764),(197,766),(197,767),(197,768),(197,769),(197,770),(197,771),(197,772),(197,774),(197,794),(197,795),(197,796),(197,798),(197,837),(197,838),(197,841),(197,856),(197,857),(197,858),(197,859),(197,860),(197,861),(197,862),(197,863),(197,864),(197,865),(197,868),(197,874),(197,875),(197,876),(197,877),(197,884),(197,885),(197,889),(197,890),(197,892),(197,893),(197,895),(197,897),(197,909),(197,910),(197,911),(197,913),(197,916),(197,917),(197,918),(197,919),(197,923),(197,924),(197,925),(197,926),(197,930),(197,931),(197,933),(197,934),(197,935),(197,936),(197,937),(197,938),(197,940),(197,941),(197,942),(197,945),(198,240),(198,241),(198,242),(198,243),(198,245),(198,246),(198,247),(198,249),(198,250),(198,251),(198,253),(198,254),(198,255),(198,256),(198,462),(198,466),(198,467),(198,468),(198,469),(198,470),(198,510),(198,515),(198,517),(198,532),(198,632),(198,742),(198,743),(198,744),(198,745),(198,746),(198,747),(198,749),(198,750),(198,751),(198,752),(198,754),(198,755),(198,756),(198,758),(198,759),(198,760),(198,914),(199,217),(199,218),(199,221),(199,222),(199,223),(199,225),(199,263),(199,374),(199,375),(199,442),(199,443),(199,444),(199,446),(199,447),(199,450),(199,455),(199,456),(199,459),(199,496),(199,501),(199,505),(199,507),(199,525),(199,534),(199,725),(199,797),(199,898),(199,899),(199,900),(199,901),(199,902),(199,903),(199,904),(300,920),(300,921);
/*!40000 ALTER TABLE `rbac_linked_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_permissions`
--

DROP TABLE IF EXISTS `rbac_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_permissions` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Permission id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Permission name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Permission List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_permissions`
--

LOCK TABLES `rbac_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_permissions` DISABLE KEYS */;
INSERT INTO `rbac_permissions` VALUES (1,'Instant logout'),(2,'Skip Queue'),(3,'Join Normal Battleground'),(4,'Join Random Battleground'),(5,'Join Arenas'),(6,'Join Dungeon Finder'),(7,'Skip idle connection check'),(8,'Cannot earn achievements'),(9,'Cannot earn realm first achievements'),(11,'Log GM trades'),(13,'Skip Instance required bosses check'),(14,'Skip character creation team mask check'),(15,'Skip character creation class mask check'),(16,'Skip character creation race mask check'),(17,'Skip character creation reserved name check'),(18,'Skip character creation death knight min level check'),(19,'Skip needed requirements to use channel check'),(20,'Skip disable map check'),(21,'Skip reset talents when used more than allowed check'),(22,'Skip spam chat check'),(23,'Skip over-speed ping check'),(24,'Two side faction characters on the same account'),(25,'Allow say chat between factions'),(26,'Allow channel chat between factions'),(27,'Two side mail interaction'),(28,'See two side who list'),(29,'Add friends of other faction'),(30,'Save character without delay with .save command'),(31,'Use params with .unstuck command'),(32,'Can be assigned tickets with .assign ticket command'),(33,'Notify if a command was not found'),(34,'Check if should appear in list using .gm ingame command'),(35,'See all security levels with who command'),(36,'Filter whispers'),(37,'Use staff badge in chat'),(38,'Resurrect with full Health Points'),(39,'Restore saved gm setting states'),(40,'Allows to add a gm to friend list'),(41,'Use Config option START_GM_LEVEL to assign new character level'),(42,'Allows to use CMSG_WORLD_TELEPORT opcode'),(43,'Allows to use CMSG_WHOIS opcode'),(44,'Receive global GM messages/texts'),(45,'Join channels without announce'),(46,'Change channel settings without being channel moderator'),(47,'Can ignore lower security checks'),(48,'Enable IP, Last Login and EMail output in pinfo'),(49,'Forces to enter the email for confirmation on password change'),(50,'Allow user to check his own email with .account'),(51,'Allow trading between factions'),(52,'No battleground deserter debuff'),(53,'Can be AFK on the battleground'),(192,'Role: Sec Level Administrator'),(193,'Role: Sec Level Gamemaster'),(194,'Role: Sec Level Moderator'),(195,'Role: Sec Level Player'),(196,'Role: Administrator Commands'),(197,'Role: Gamemaster Commands'),(198,'Role: Moderator Commands'),(199,'Role: Player Commands'),(200,'Command: rbac'),(201,'Command: rbac account'),(202,'Command: rbac account list'),(203,'Command: rbac account grant'),(204,'Command: rbac account deny'),(205,'Command: rbac account revoke'),(206,'Command: rbac list'),(217,'Command: account'),(218,'Command: account addon'),(219,'Command: account create'),(220,'Command: account delete'),(221,'Command: account lock'),(222,'Command: account lock country'),(223,'Command: account lock ip'),(224,'Command: account onlinelist'),(225,'Command: account password'),(226,'Command: account set'),(227,'Command: account set addon'),(228,'Command: account set gmlevel'),(229,'Command: account set password'),(231,'Command: achievement add'),(232,'Command: achievement checkall'),(233,'Command: arena captain'),(234,'Command: arena create'),(235,'Command: arena disband'),(236,'Command: arena info'),(237,'Command: arena lookup'),(238,'Command: arena rename'),(240,'Command: ban account'),(241,'Command: ban character'),(242,'Command: ban ip'),(243,'Command: ban playeraccount'),(245,'Command: baninfo account'),(246,'Command: baninfo character'),(247,'Command: baninfo ip'),(249,'Command: banlist account'),(250,'Command: banlist character'),(251,'Command: banlist ip'),(253,'Command: unban account'),(254,'Command: unban character'),(255,'Command: unban ip'),(256,'Command: unban playeraccount'),(258,'Command: bf start'),(259,'Command: bf stop'),(260,'Command: bf switch'),(261,'Command: bf timer'),(262,'Command: bf enable'),(263,'Command: account email'),(265,'Command: account set sec email'),(266,'Command: account set sec regmail'),(267,'Command: cast'),(268,'Command: cast back'),(269,'Command: cast dist'),(270,'Command: cast self'),(271,'Command: cast target'),(272,'Command: cast dest'),(274,'Command: character customize'),(275,'Command: character changefaction'),(276,'Command: character changerace'),(278,'Command: character deleted delete'),(279,'Command: character deleted list'),(280,'Command: character deleted restore'),(281,'Command: character deleted old'),(282,'Command: character erase'),(283,'Command: character level'),(284,'Command: character rename'),(285,'Command: character reputation'),(286,'Command: character titles'),(287,'Command: levelup'),(289,'Command: pdump load'),(290,'Command: pdump write'),(292,'Command: cheat casttime'),(293,'Command: cheat cooldown'),(294,'Command: cheat explore'),(295,'Command: cheat god'),(296,'Command: cheat power'),(297,'Command: cheat status'),(298,'Command: cheat taxi'),(299,'Command: cheat waterwalk'),(300,'Command: debug'),(343,'Command: deserter bg add'),(344,'Command: deserter bg remove'),(346,'Command: deserter instance add'),(347,'Command: deserter instance remove'),(350,'Command: disable add achievement_criteria'),(351,'Command: disable add battleground'),(352,'Command: disable add map'),(353,'Command: disable add mmap'),(354,'Command: disable add outdoorpvp'),(355,'Command: disable add quest'),(356,'Command: disable add spell'),(357,'Command: disable add vmap'),(359,'Command: disable remove achievement_criteria'),(360,'Command: disable remove battleground'),(361,'Command: disable remove map'),(362,'Command: disable remove mmap'),(363,'Command: disable remove outdoorpvp'),(364,'Command: disable remove quest'),(365,'Command: disable remove spell'),(366,'Command: disable remove vmap'),(367,'Command: event info'),(368,'Command: event activelist'),(369,'Command: event start'),(370,'Command: event stop'),(371,'Command: gm'),(372,'Command: gm chat'),(373,'Command: gm fly'),(374,'Command: gm ingame'),(375,'Command: gm list'),(376,'Command: gm visible'),(377,'Command: go'),(388,'Command: gobject activate'),(389,'Command: gobject add'),(390,'Command: gobject add temp'),(391,'Command: gobject delete'),(392,'Command: gobject info'),(393,'Command: gobject move'),(394,'Command: gobject near'),(396,'Command: gobject set phase'),(397,'Command: gobject set state'),(398,'Command: gobject target'),(399,'Command: gobject turn'),(401,'Command: guild'),(402,'Command: guild create'),(403,'Command: guild delete'),(404,'Command: guild invite'),(405,'Command: guild uninvite'),(406,'Command: guild rank'),(407,'Command: guild rename'),(409,'Command: honor add'),(410,'Command: honor add kill'),(411,'Command: honor update'),(413,'Command: instance listbinds'),(414,'Command: instance unbind'),(415,'Command: instance stats'),(416,'Command: instance savedata'),(417,'Command: learn'),(419,'Command: learn all my'),(420,'Command: learn all my class'),(421,'Command: learn my pettalents'),(422,'Command: learn all my spells'),(423,'Command: learn all talents'),(424,'Command: learn all gm'),(425,'Command: learn all crafts'),(426,'Command: learn all default'),(427,'Command: learn all lang'),(428,'Command: learn all recipes'),(429,'Command: unlearn'),(431,'Command: lfg player'),(432,'Command: lfg group'),(433,'Command: lfg queue'),(434,'Command: lfg clean'),(435,'Command: lfg options'),(436,'Command: lfg cooldown'),(437,'Command: list creature'),(438,'Command: list item'),(439,'Command: list object'),(440,'Command: list auras'),(441,'Command: list mail'),(442,'Command: lookup'),(443,'Command: lookup area'),(444,'Command: lookup creature'),(445,'Command: lookup event'),(446,'Command: lookup faction'),(447,'Command: lookup item'),(448,'Command: lookup itemset'),(449,'Command: lookup object'),(450,'Command: lookup quest'),(451,'Command: lookup player'),(452,'Command: lookup player ip'),(453,'Command: lookup player account'),(454,'Command: lookup player email'),(455,'Command: lookup skill'),(456,'Command: lookup spell'),(457,'Command: lookup spell id'),(458,'Command: lookup taxinode'),(459,'Command: lookup tele'),(460,'Command: lookup title'),(461,'Command: lookup map'),(462,'Command: announce'),(463,'Command: channel'),(464,'Command: channel set'),(465,'Command: channel set ownership'),(466,'Command: gmannounce'),(467,'Command: gmnameannounce'),(468,'Command: gmnotify'),(469,'Command: nameannounce'),(470,'Command: notify'),(472,'Command: group'),(473,'Command: group leader'),(474,'Command: group disband'),(475,'Command: group remove'),(476,'Command: group join'),(477,'Command: group list'),(478,'Command: group summon'),(479,'Command: pet'),(480,'Command: pet create'),(481,'Command: pet learn'),(482,'Command: pet unlearn'),(483,'Command: send'),(484,'Command: send items'),(485,'Command: send mail'),(486,'Command: send message'),(487,'Command: send money'),(488,'Command: additem'),(489,'Command: additemset'),(490,'Command: appear'),(491,'Command: aura'),(492,'Command: bank'),(493,'Command: bindsight'),(494,'Command: combatstop'),(495,'Command: cometome'),(496,'Command: commands'),(497,'Command: cooldown'),(498,'Command: damage'),(499,'Command: dev'),(500,'Command: die'),(501,'Command: dismount'),(502,'Command: distance'),(503,'Command: flusharenapoints'),(504,'Command: freeze'),(505,'Command: gps'),(506,'Command: guid'),(507,'Command: help'),(508,'Command: hidearea'),(509,'Command: itemmove'),(510,'Command: kick'),(511,'Command: linkgrave'),(512,'Command: listfreeze'),(513,'Command: maxskill'),(514,'Command: movegens'),(515,'Command: mute'),(516,'Command: neargrave'),(517,'Command: pinfo'),(518,'Command: playall'),(519,'Command: possess'),(520,'Command: recall'),(521,'Command: repairitems'),(522,'Command: respawn'),(523,'Command: revive'),(524,'Command: saveall'),(525,'Command: save'),(526,'Command: setskill'),(527,'Command: showarea'),(528,'Command: summon'),(529,'Command: unaura'),(530,'Command: unbindsight'),(531,'Command: unfreeze'),(532,'Command: unmute'),(533,'Command: unpossess'),(534,'Command: unstuck'),(535,'Command: wchange'),(536,'Command: mmap'),(537,'Command: mmap loadedtiles'),(538,'Command: mmap loc'),(539,'Command: mmap path'),(540,'Command: mmap stats'),(541,'Command: mmap testarea'),(542,'Command: morph'),(543,'Command: demorph'),(544,'Command: modify'),(545,'Command: modify arenapoints'),(546,'Command: modify bit'),(547,'Command: modify drunk'),(548,'Command: modify energy'),(549,'Command: modify faction'),(550,'Command: modify gender'),(551,'Command: modify honor'),(552,'Command: modify hp'),(553,'Command: modify mana'),(554,'Command: modify money'),(555,'Command: modify mount'),(556,'Command: modify phase'),(557,'Command: modify rage'),(558,'Command: modify reputation'),(559,'Command: modify runicpower'),(560,'Command: modify scale'),(561,'Command: modify speed'),(562,'Command: modify speed all'),(563,'Command: modify speed backwalk'),(564,'Command: modify speed fly'),(565,'Command: modify speed walk'),(566,'Command: modify speed swim'),(567,'Command: modify spell'),(568,'Command: modify standstate'),(569,'Command: modify talentpoints'),(571,'Command: npc add'),(572,'Command: npc add formation'),(573,'Command: npc add item'),(574,'Command: npc add move'),(575,'Command: npc add temp'),(576,'Command: npc delete'),(577,'Command: npc delete item'),(578,'Command: npc follow'),(579,'Command: npc follow stop'),(580,'Command: npc set'),(581,'Command: npc set allowmove'),(582,'Command: npc set entry'),(583,'Command: npc set factionid'),(584,'Command: npc set flag'),(585,'Command: npc set level'),(586,'Command: npc set link'),(587,'Command: npc set model'),(588,'Command: npc set movetype'),(589,'Command: npc set phase'),(590,'Command: npc set spawndist'),(591,'Command: npc set spawntime'),(592,'Command: npc set data'),(593,'Command: npc info'),(594,'Command: npc near'),(595,'Command: npc move'),(596,'Command: npc playemote'),(597,'Command: npc say'),(598,'Command: npc textemote'),(599,'Command: npc whisper'),(600,'Command: npc yell'),(601,'Command: npc tame'),(602,'Command: quest'),(603,'Command: quest add'),(604,'Command: quest complete'),(605,'Command: quest remove'),(606,'Command: quest reward'),(607,'Command: reload'),(608,'Command: reload access_requirement'),(609,'Command: reload achievement_criteria_data'),(610,'Command: reload achievement_reward'),(611,'Command: reload all'),(612,'Command: reload all achievement'),(613,'Command: reload all area'),(614,'Command: reload broadcast_text'),(615,'Command: reload all gossips'),(616,'Command: reload all item'),(617,'Command: reload all locales'),(618,'Command: reload all loot'),(619,'Command: reload all npc'),(620,'Command: reload all quest'),(621,'Command: reload all scripts'),(622,'Command: reload all spell'),(623,'Command: reload areatrigger_involvedrelation'),(624,'Command: reload areatrigger_tavern'),(625,'Command: reload areatrigger_teleport'),(626,'Command: reload auctions'),(627,'Command: reload autobroadcast'),(629,'Command: reload conditions'),(630,'Command: reload config'),(631,'Command: reload battleground_template'),(632,'Command: mutehistory'),(633,'Command: reload creature_linked_respawn'),(634,'Command: reload creature_loot_template'),(635,'Command: reload creature_onkill_reputation'),(636,'Command: reload creature_questender'),(637,'Command: reload creature_queststarter'),(638,'Command: reload creature_summon_groups'),(639,'Command: reload creature_template'),(640,'Command: reload creature_text'),(641,'Command: reload disables'),(642,'Command: reload disenchant_loot_template'),(643,'Command: reload event_scripts'),(644,'Command: reload fishing_loot_template'),(645,'Command: reload graveyard_zone'),(646,'Command: reload game_tele'),(647,'Command: reload gameobject_questender'),(648,'Command: reload gameobject_quest_loot_template'),(649,'Command: reload gameobject_queststarter'),(650,'Command: reload gm_tickets'),(651,'Command: reload gossip_menu'),(652,'Command: reload gossip_menu_option'),(653,'Command: reload item_enchantment_template'),(654,'Command: reload item_loot_template'),(655,'Command: reload item_set_names'),(656,'Command: reload lfg_dungeon_rewards'),(657,'Command: reload achievement_reward_locale'),(658,'Command: reload creature_template_locale'),(659,'Command: reload creature_text_locale'),(660,'Command: reload gameobject_template_locale'),(661,'Command: reload gossip_menu_option_locale'),(662,'Command: reload item_template_locale'),(663,'Command: reload item_set_name_locale'),(664,'Command: reload npc_text_locale'),(665,'Command: reload page_text_locale'),(666,'Command: reload points_of_interest_locale'),(667,'Command: reload quest_template_locale'),(668,'Command: reload mail_level_reward'),(669,'Command: reload mail_loot_template'),(670,'Command: reload milling_loot_template'),(671,'Command: reload npc_spellclick_spells'),(672,'Command: reload trainer'),(673,'Command: reload npc_vendor'),(674,'Command: reload page_text'),(675,'Command: reload pickpocketing_loot_template'),(676,'Command: reload points_of_interest'),(677,'Command: reload prospecting_loot_template'),(678,'Command: reload quest_poi'),(679,'Command: reload quest_template'),(680,'Command: reload rbac'),(681,'Command: reload reference_loot_template'),(682,'Command: reload reserved_name'),(683,'Command: reload reputation_reward_rate'),(684,'Command: reload reputation_spillover_template'),(685,'Command: reload skill_discovery_template'),(686,'Command: reload skill_extra_item_template'),(687,'Command: reload skill_fishing_base_level'),(688,'Command: reload skinning_loot_template'),(689,'Command: reload smart_scripts'),(690,'Command: reload spell_required'),(691,'Command: reload spell_area'),(692,'Command: reload spell_bonus_data'),(693,'Command: reload spell_group'),(694,'Command: reload spell_learn_spell'),(695,'Command: reload spell_loot_template'),(696,'Command: reload spell_linked_spell'),(697,'Command: reload spell_pet_auras'),(698,'Command: character changeaccount'),(699,'Command: reload spell_proc'),(701,'Command: reload spell_target_position'),(702,'Command: reload spell_threats'),(703,'Command: reload spell_group_stack_rules'),(704,'Command: reload acore_string'),(706,'Command: reload waypoint_scripts'),(707,'Command: reload waypoint_data'),(708,'Command: reload vehicle_accessory'),(709,'Command: reload vehicle_template_accessory'),(710,'Command: reset'),(711,'Command: reset achievements'),(712,'Command: reset honor'),(713,'Command: reset level'),(714,'Command: reset spells'),(715,'Command: reset stats'),(716,'Command: reset talents'),(717,'Command: reset all'),(718,'Command: server'),(719,'Command: server corpses'),(720,'Command: server exit'),(721,'Command: server idlerestart'),(722,'Command: server idlerestart cancel'),(723,'Command: server idleshutdown'),(724,'Command: server idleshutdown cancel'),(725,'Command: server info'),(726,'Command: server plimit'),(727,'Command: server restart'),(728,'Command: server restart cancel'),(729,'Command: server set'),(730,'Command: server set closed'),(731,'Command: server set difftime'),(732,'Command: server set loglevel'),(733,'Command: server set motd'),(734,'Command: server shutdown'),(735,'Command: server shutdown cancel'),(736,'Command: server motd'),(737,'Command: tele'),(738,'Command: tele add'),(739,'Command: tele del'),(740,'Command: tele name'),(741,'Command: tele group'),(742,'Command: ticket'),(743,'Command: ticket assign'),(744,'Command: ticket close'),(745,'Command: ticket closedlist'),(746,'Command: ticket comment'),(747,'Command: ticket complete'),(748,'Command: ticket delete'),(749,'Command: ticket escalate'),(750,'Command: ticket escalatedlist'),(751,'Command: ticket list'),(752,'Command: ticket onlinelist'),(753,'Command: ticket reset'),(754,'Command: ticket response'),(755,'Command: ticket response append'),(756,'Command: ticket response appendln'),(757,'Command: ticket togglesystem'),(758,'Command: ticket unassign'),(759,'Command: ticket viewid'),(760,'Command: ticket viewname'),(762,'Command: titles add'),(763,'Command: titles current'),(764,'Command: titles remove'),(766,'Command: titles set mask'),(767,'Command: wp'),(768,'Command: wp add'),(769,'Command: wp event'),(770,'Command: wp load'),(771,'Command: wp modify'),(772,'Command: wp unload'),(773,'Command: wp reload'),(774,'Command: wp show'),(777,'Command: mailbox'),(779,'Command: ahbot items'),(780,'Command: ahbot items gray'),(781,'Command: ahbot items white'),(782,'Command: ahbot items green'),(783,'Command: ahbot items blue'),(784,'Command: ahbot items purple'),(785,'Command: ahbot items orange'),(786,'Command: ahbot items yellow'),(787,'Command: ahbot ratio'),(788,'Command: ahbot ratio alliance'),(789,'Command: ahbot ratio horde'),(790,'Command: ahbot ratio neutral'),(791,'Command: ahbot rebuild'),(792,'Command: ahbot reload'),(793,'Command: ahbot status'),(794,'Command: guild info'),(795,'Command: instance setbossstate'),(796,'Command: instance getbossstate'),(797,'Command: pvpstats'),(798,'Command: modify xp'),(837,'Command: npc evade'),(838,'Command: pet level'),(839,'Command: server shutdown force'),(840,'Command: server restart force'),(841,'Command: neargraveyard'),(843,'Command: reload quest_greeting'),(856,'Command: npc spawngroup'),(857,'Command: npc despawngroup'),(858,'Command: gobject spawngroup'),(859,'Command: gobject despawngroup'),(860,'Command: list respawns'),(861,'Command: group set'),(862,'Command: group set assistant'),(863,'Command: group set maintank'),(864,'Command: group set mainassist'),(865,'Command: npc showloot'),(866,'Command: list spawnpoints'),(867,'Command: reload quest_greeting_locale'),(868,'Command: group revive'),(872,'Command: server debug'),(873,'Command: reload creature_movement_override'),(874,'Command: settings announcer'),(875,'Command: lookup map id'),(876,'Command: lookup item id'),(877,'Command: lookup quest id'),(880,'Command: pdump copy'),(881,'Command: reload vehicle_template'),(884,'Command: bg start'),(885,'Command: bg stop'),(886,'Command: item restore'),(887,'Command: item restore list'),(888,'Command: item refund'),(889,'Command: commentator'),(890,'Command: skirmish'),(891,'Command: string'),(892,'Command: opendoor'),(893,'Command: beastmaster'),(894,'Command: packetlog'),(895,'Command: aura stack'),(896,'Command: respawn all'),(897,'Command: gear repair'),(898,'Command: gear stats'),(899,'Command: spect'),(900,'Command: spect version'),(901,'Command: spect reset'),(902,'Command: spect spectate'),(903,'Command: spect watch'),(904,'Command: spect leave'),(905,'Command: arena season state'),(906,'Command: arena season reward'),(907,'Command: arena season deleteteams'),(908,'Command: arena season start'),(909,'Command: character check bank'),(910,'Command: character check bag'),(911,'Command: character check profession'),(912,'Command: gobject load'),(913,'Command: bf queue'),(914,'Command: pet list'),(915,'Command: pet delete'),(916,'Command: respawn creature guid'),(917,'Command: respawn gameobject guid'),(918,'Command: respawn creature entry'),(919,'Command: respawn gameobject entry'),(920,'Command: debug info'),(921,'Command: debug cosmetic'),(922,'Command: pet rename'),(923,'Command: chatfilter list'),(924,'Command: chatfilter add'),(925,'Command: chatfilter remove'),(926,'Command: autobroadcast list'),(927,'Command: autobroadcast add'),(928,'Command: autobroadcast locale'),(929,'Command: autobroadcast remove'),(930,'Command: mail list'),(931,'Command: mail return'),(932,'Command: npc load'),(933,'Command: pool info'),(934,'Command: pool lookup'),(935,'Command: spellinfo attributes'),(936,'Command: spellinfo effects'),(937,'Command: spellinfo targets'),(938,'Command: spellinfo all'),(939,'Command: server set security'),(940,'Command: group invites'),(941,'Command: account flag'),(942,'Command: account flag list'),(943,'Command: account flag add'),(944,'Command: account flag remove'),(945,'Command: account info');
/*!40000 ALTER TABLE `rbac_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmcharacters`
--

DROP TABLE IF EXISTS `realmcharacters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realmcharacters` (
  `realmid` int unsigned NOT NULL DEFAULT '0',
  `acctid` int unsigned NOT NULL,
  `numchars` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Realm Character Tracker';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmcharacters`
--

LOCK TABLES `realmcharacters` WRITE;
/*!40000 ALTER TABLE `realmcharacters` DISABLE KEYS */;
INSERT INTO `realmcharacters` VALUES (1,1,3);
/*!40000 ALTER TABLE `realmcharacters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmlist`
--

DROP TABLE IF EXISTS `realmlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realmlist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `localAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `localSubnetMask` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '255.255.255.0',
  `port` smallint unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint unsigned NOT NULL DEFAULT '0',
  `flag` tinyint unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `population` float NOT NULL DEFAULT '0',
  `gamebuild` int unsigned NOT NULL DEFAULT '12340',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`),
  CONSTRAINT `realmlist_chk_1` CHECK ((`population` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Realm System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmlist`
--

LOCK TABLES `realmlist` WRITE;
/*!40000 ALTER TABLE `realmlist` DISABLE KEYS */;
INSERT INTO `realmlist` VALUES (1,'AzerothCore','127.0.0.1','127.0.0.1','255.255.255.0',8085,0,2,1,0,0,12340);
/*!40000 ALTER TABLE `realmlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secret_digest`
--

DROP TABLE IF EXISTS `secret_digest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secret_digest` (
  `id` int unsigned NOT NULL,
  `digest` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secret_digest`
--

LOCK TABLES `secret_digest` WRITE;
/*!40000 ALTER TABLE `secret_digest` DISABLE KEYS */;
/*!40000 ALTER TABLE `secret_digest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `updates` (
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'filename with extension of the update.',
  `hash` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'sha1 hash of the sql file.',
  `state` enum('RELEASED','CUSTOM','MODULE','ARCHIVED','PENDING') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when the query was applied.',
  `speed` int unsigned NOT NULL DEFAULT '0' COMMENT 'time the query takes to apply in ms.',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of all applied updates in this database.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates`
--

LOCK TABLES `updates` WRITE;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
INSERT INTO `updates` VALUES ('2023_04_24_00.sql','D164A70B22B2462464484614018C3218B3259AE4','ARCHIVED','2024-01-20 14:23:45',26),('2024_01_20_00.sql','41678119235D993DEF719C168B20867F781A3A5F','ARCHIVED','2024-01-20 14:23:45',36),('2024_11_15_00.sql','7F15CD3FF0C3D98918DA8860BC3CFB6B9D5146BB','ARCHIVED','2024-12-17 21:51:20',93),('2024_12_15_00.sql','8CC811CF48ADF26D279E4A8F2D06AD94C11F43BE','ARCHIVED','2024-12-17 21:55:57',133),('2025_01_26_00.sql','CA6884F4BDBBC60C08CD52480FD4B3FAC945C3CF','ARCHIVED','2025-07-19 10:16:14',166),('2025_02_16_00.sql','D59DF568B412F0A17B0ACC5C350420B81C87AAB2','ARCHIVED','2025-07-19 10:16:15',148),('2025_02_16_01.sql','6788795A29BFD097EE5D00E548EFF3831F9CFBCF','ARCHIVED','2025-07-19 10:16:15',103),('2025_07_03_00.sql','C28996618006B516134EC7FA4E1D58F2DF410548','ARCHIVED','2025-07-19 10:16:15',135),('2025_07_24_00.sql','FCC937F180EFFAA5B991D9B7CF9E2223B6C0C4D3','ARCHIVED','2025-12-29 17:51:44',34),('2026_05_01_00.sql','66CFB76A3289DF9F2C10DAFEB39828665B075AB4','RELEASED','2026-06-01 22:32:00',125),('2026_05_03_00.sql','3815EC8BE2EBA3E7E2D620B5D613B5E448DD017D','RELEASED','2026-06-01 22:32:00',30),('2026_05_09_00.sql','9C9A0E11BED930ED368362224A85213751407D14','RELEASED','2026-06-01 22:32:00',30),('2026_05_14_00.sql','8918B1D9F35208FCE290A7AD72CD6465F3F017F2','RELEASED','2026-06-01 22:32:00',36),('2026_05_17_00.sql','5159474DB3F4D94B13C17139632B5EB55B323716','RELEASED','2026-06-01 22:32:00',60),('2026_05_24_00.sql','65815FE616DE9ACF14671FA5F28854D953C1FFF1','RELEASED','2026-06-01 22:32:00',28),('2026_06_01_00.sql','F6EA2C0136B1C8E97DCABC0FAE37451EFA8E8F64','RELEASED','2026-06-01 22:32:00',29),('2026_07_15_00.sql','7F0B0E436DDF0975424BA001CA9046B0A2D136EB','RELEASED','2026-10-20 19:48:56',49),('2026_07_18_00.sql','FDDC753428C7C84691730FA711C2C170A5BEE4A5','RELEASED','2026-10-20 19:48:56',34),('2026_07_18_01.sql','FE82BF5B73441EF4408B5316B31D18DA32A683FD','RELEASED','2026-10-20 19:48:56',32),('2026_07_19_00.sql','DE3C449EC9E0FF73DD9AE37E297CD892AE343387','RELEASED','2026-10-20 19:48:56',36),('2026_07_22_00.sql','382BCD3B16E0628521360ACDAA50F83C4F6190E8','RELEASED','2026-10-20 19:48:56',25),('2026_08_16_00.sql','CC5ACE6BDDF8BBB2D0A08C013B2558EDFAFD7295','RELEASED','2026-10-20 19:48:56',33),('2026_09_27_00.sql','01C67BE51A76FD5B2C9A9F9031C4FCEB78C4056A','RELEASED','2026-10-20 19:48:56',45),('2026_10_15_00.sql','B941B268F829C7B67FC1E8E3509565792AEDC45A','RELEASED','2026-10-20 19:48:56',71);
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates_include`
--

DROP TABLE IF EXISTS `updates_include`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `updates_include` (
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED','CUSTOM','PENDING') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of directories where we want to include sql updates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates_include`
--

LOCK TABLES `updates_include` WRITE;
/*!40000 ALTER TABLE `updates_include` DISABLE KEYS */;
INSERT INTO `updates_include` VALUES ('$/data/sql/archive/db_auth','ARCHIVED'),('$/data/sql/custom/db_auth','CUSTOM'),('$/data/sql/updates/db_auth','RELEASED'),('$/data/sql/updates/pending_db_auth','PENDING');
/*!40000 ALTER TABLE `updates_include` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uptime`
--

DROP TABLE IF EXISTS `uptime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uptime` (
  `realmid` int unsigned NOT NULL,
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `uptime` int unsigned NOT NULL DEFAULT '0',
  `EndTime` int unsigned DEFAULT NULL,
  `maxplayers` smallint unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AzerothCore',
  `ShutdownType` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0 = unknown, 1 = shutdown, 2 = restart, 3 = error',
  `ExitCode` tinyint unsigned DEFAULT NULL,
  `ShutdownReason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Uptime system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uptime`
--

LOCK TABLES `uptime` WRITE;
/*!40000 ALTER TABLE `uptime` DISABLE KEYS */;
INSERT INTO `uptime` VALUES (1,1780345921,0,1780345921,0,'AzerothCore rev. 8b8ba243d8f7 2026-06-01 22:26:28 +0200 (master branch) (Win64, RelWithDebInfo, Static)',0,NULL,''),(1,1792525773,30440,1792556214,1,'AzerothCore rev. aa921a00a278+ 2026-10-19 18:13:22 -0300 (master branch) (Unix, RelWithDebInfo, Static)',1,0,''),(1,1792597269,232,1792597502,1,'AzerothCore rev. aa921a00a278+ 2026-10-19 18:13:22 -0300 (master branch) (Unix, RelWithDebInfo, Static)',1,0,'');
/*!40000 ALTER TABLE `uptime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'acore_auth'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-21 10:15:59
