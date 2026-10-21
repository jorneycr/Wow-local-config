-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: acore_characters
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
-- Table structure for table `account_data`
--

DROP TABLE IF EXISTS `account_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_data` (
  `accountId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `time` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`accountId`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_data`
--

LOCK TABLES `account_data` WRITE;
/*!40000 ALTER TABLE `account_data` DISABLE KEYS */;
INSERT INTO `account_data` VALUES (1,0,1792555871,_binary 'SET flaggedTutorials \"v##M##%##&##$##(##:##Z##1##9##I##D##0##J##V##[##+##;##A##B##7##,##)##F##K##X##\\##O##Y##^##=\"\nSET alwaysShowActionBars \"1\"\nSET UnitNameOwn \"1\"\nSET UnitNameNPC \"1\"\nSET xpBarText \"1\"\nSET playerStatusText \"1\"\nSET petStatusText \"1\"\nSET partyStatusText \"1\"\nSET targetStatusText \"1\"\nSET cameraDistanceMaxFactor \"1\"\nSET talentFrameShown \"1\"\nSET ShowAllSpellRanks \"0\"\n');
/*!40000 ALTER TABLE `account_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_instance_times`
--

DROP TABLE IF EXISTS `account_instance_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_instance_times` (
  `accountId` int unsigned NOT NULL,
  `instanceId` int unsigned NOT NULL DEFAULT '0',
  `releaseTime` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`,`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_instance_times`
--

LOCK TABLES `account_instance_times` WRITE;
/*!40000 ALTER TABLE `account_instance_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_instance_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_tutorial`
--

DROP TABLE IF EXISTS `account_tutorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_tutorial` (
  `accountId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `tut0` int unsigned NOT NULL DEFAULT '0',
  `tut1` int unsigned NOT NULL DEFAULT '0',
  `tut2` int unsigned NOT NULL DEFAULT '0',
  `tut3` int unsigned NOT NULL DEFAULT '0',
  `tut4` int unsigned NOT NULL DEFAULT '0',
  `tut5` int unsigned NOT NULL DEFAULT '0',
  `tut6` int unsigned NOT NULL DEFAULT '0',
  `tut7` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_tutorial`
--

LOCK TABLES `account_tutorial` WRITE;
/*!40000 ALTER TABLE `account_tutorial` DISABLE KEYS */;
INSERT INTO `account_tutorial` VALUES (1,1659384247,99879653,0,0,0,0,0,0);
/*!40000 ALTER TABLE `account_tutorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_arena_season`
--

DROP TABLE IF EXISTS `active_arena_season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_arena_season` (
  `season_id` tinyint unsigned NOT NULL,
  `season_state` tinyint unsigned NOT NULL COMMENT 'Supported 2 states: 0 - disabled; 1 - in progress.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_arena_season`
--

LOCK TABLES `active_arena_season` WRITE;
/*!40000 ALTER TABLE `active_arena_season` DISABLE KEYS */;
INSERT INTO `active_arena_season` VALUES (8,1);
/*!40000 ALTER TABLE `active_arena_season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons` (
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `crc` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Addons';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons`
--

LOCK TABLES `addons` WRITE;
/*!40000 ALTER TABLE `addons` DISABLE KEYS */;
INSERT INTO `addons` VALUES ('Blizzard_AchievementUI',1276933997),('Blizzard_ArenaUI',1276933997),('Blizzard_AuctionUI',1276933997),('Blizzard_BarbershopUI',1276933997),('Blizzard_BattlefieldMinimap',1276933997),('Blizzard_BindingUI',1276933997),('Blizzard_Calendar',1276933997),('Blizzard_CombatLog',1276933997),('Blizzard_CombatText',1276933997),('Blizzard_DebugTools',1276933997),('Blizzard_GlyphUI',1276933997),('Blizzard_GMChatUI',1276933997),('Blizzard_GMSurveyUI',1276933997),('Blizzard_GuildBankUI',1276933997),('Blizzard_InspectUI',1276933997),('Blizzard_ItemSocketingUI',1276933997),('Blizzard_MacroUI',1276933997),('Blizzard_RaidUI',1276933997),('Blizzard_TalentUI',1276933997),('Blizzard_TimeManager',1276933997),('Blizzard_TokenUI',1276933997),('Blizzard_TradeSkillUI',1276933997),('Blizzard_TrainerUI',1276933997);
/*!40000 ALTER TABLE `addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arena_team`
--

DROP TABLE IF EXISTS `arena_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arena_team` (
  `arenaTeamId` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `captainGuid` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `rating` smallint unsigned NOT NULL DEFAULT '0',
  `seasonGames` smallint unsigned NOT NULL DEFAULT '0',
  `seasonWins` smallint unsigned NOT NULL DEFAULT '0',
  `weekGames` smallint unsigned NOT NULL DEFAULT '0',
  `weekWins` smallint unsigned NOT NULL DEFAULT '0',
  `rank` int unsigned NOT NULL DEFAULT '0',
  `backgroundColor` int unsigned NOT NULL DEFAULT '0',
  `emblemStyle` tinyint unsigned NOT NULL DEFAULT '0',
  `emblemColor` int unsigned NOT NULL DEFAULT '0',
  `borderStyle` tinyint unsigned NOT NULL DEFAULT '0',
  `borderColor` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenaTeamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arena_team`
--

LOCK TABLES `arena_team` WRITE;
/*!40000 ALTER TABLE `arena_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `arena_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arena_team_member`
--

DROP TABLE IF EXISTS `arena_team_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arena_team_member` (
  `arenaTeamId` int unsigned NOT NULL DEFAULT '0',
  `guid` int unsigned NOT NULL DEFAULT '0',
  `weekGames` smallint unsigned NOT NULL DEFAULT '0',
  `weekWins` smallint unsigned NOT NULL DEFAULT '0',
  `seasonGames` smallint unsigned NOT NULL DEFAULT '0',
  `seasonWins` smallint unsigned NOT NULL DEFAULT '0',
  `personalRating` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenaTeamId`,`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arena_team_member`
--

LOCK TABLES `arena_team_member` WRITE;
/*!40000 ALTER TABLE `arena_team_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `arena_team_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auctionhouse`
--

DROP TABLE IF EXISTS `auctionhouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctionhouse` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `houseid` tinyint unsigned NOT NULL DEFAULT '7',
  `itemguid` int unsigned NOT NULL DEFAULT '0',
  `itemowner` int unsigned NOT NULL DEFAULT '0',
  `buyoutprice` int unsigned NOT NULL DEFAULT '0',
  `time` int unsigned NOT NULL DEFAULT '0',
  `buyguid` int unsigned NOT NULL DEFAULT '0',
  `lastbid` int unsigned NOT NULL DEFAULT '0',
  `startbid` int unsigned NOT NULL DEFAULT '0',
  `deposit` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_guid` (`itemguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctionhouse`
--

LOCK TABLES `auctionhouse` WRITE;
/*!40000 ALTER TABLE `auctionhouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `auctionhouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banned_addons`
--

DROP TABLE IF EXISTS `banned_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banned_addons` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `idx_name_ver` (`Name`,`Version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banned_addons`
--

LOCK TABLES `banned_addons` WRITE;
/*!40000 ALTER TABLE `banned_addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `banned_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battleground_deserters`
--

DROP TABLE IF EXISTS `battleground_deserters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battleground_deserters` (
  `guid` int unsigned NOT NULL COMMENT 'characters.guid',
  `type` tinyint unsigned NOT NULL COMMENT 'type of the desertion',
  `datetime` datetime NOT NULL COMMENT 'datetime of the desertion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battleground_deserters`
--

LOCK TABLES `battleground_deserters` WRITE;
/*!40000 ALTER TABLE `battleground_deserters` DISABLE KEYS */;
/*!40000 ALTER TABLE `battleground_deserters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugreport`
--

DROP TABLE IF EXISTS `bugreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugreport` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `State` tinyint NOT NULL DEFAULT '1',
  `Assignee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Debug System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugreport`
--

LOCK TABLES `bugreport` WRITE;
/*!40000 ALTER TABLE `bugreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_events`
--

DROP TABLE IF EXISTS `calendar_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_events` (
  `id` bigint unsigned NOT NULL DEFAULT '0',
  `creator` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` tinyint unsigned NOT NULL DEFAULT '4',
  `dungeon` int NOT NULL DEFAULT '-1',
  `eventtime` int unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  `time2` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_events`
--

LOCK TABLES `calendar_events` WRITE;
/*!40000 ALTER TABLE `calendar_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_invites`
--

DROP TABLE IF EXISTS `calendar_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_invites` (
  `id` bigint unsigned NOT NULL DEFAULT '0',
  `event` bigint unsigned NOT NULL DEFAULT '0',
  `invitee` int unsigned NOT NULL DEFAULT '0',
  `sender` int unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `statustime` int unsigned NOT NULL DEFAULT '0',
  `rank` tinyint unsigned NOT NULL DEFAULT '0',
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_invites`
--

LOCK TABLES `calendar_invites` WRITE;
/*!40000 ALTER TABLE `calendar_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `channelId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `team` int unsigned NOT NULL,
  `announce` tinyint unsigned NOT NULL DEFAULT '1',
  `ownership` tinyint unsigned NOT NULL DEFAULT '1',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastUsed` int unsigned NOT NULL,
  PRIMARY KEY (`channelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Channel System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels_bans`
--

DROP TABLE IF EXISTS `channels_bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels_bans` (
  `channelId` int unsigned NOT NULL,
  `playerGUID` int unsigned NOT NULL,
  `banTime` int unsigned NOT NULL,
  PRIMARY KEY (`channelId`,`playerGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels_bans`
--

LOCK TABLES `channels_bans` WRITE;
/*!40000 ALTER TABLE `channels_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `channels_bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels_rights`
--

DROP TABLE IF EXISTS `channels_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels_rights` (
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `flags` int unsigned NOT NULL,
  `speakdelay` int unsigned NOT NULL,
  `joinmessage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `delaymessage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `moderators` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels_rights`
--

LOCK TABLES `channels_rights` WRITE;
/*!40000 ALTER TABLE `channels_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `channels_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_account_data`
--

DROP TABLE IF EXISTS `character_account_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_account_data` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `time` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`guid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_account_data`
--

LOCK TABLES `character_account_data` WRITE;
/*!40000 ALTER TABLE `character_account_data` DISABLE KEYS */;
INSERT INTO `character_account_data` VALUES (1,1,1792597490,_binary 'SET questLogCollapseFilter \"-1\"\nSET trackedQuests \"v\"\nSET trackedAchievements \"v\"\nSET cameraSavedDistance \"13.000801\"\nSET cameraSavedPitch \"10.950007\"\nSET playerStatLeftDropdown \"PLAYERSTAT_BASE_STATS\"\nSET playerStatRightDropdown \"PLAYERSTAT_MELEE_COMBAT\"\n'),(1,7,1792597491,_binary 'VERSION 5\n\nADDEDVERSION 13\n\nOPTION_GUILD_RECRUITMENT_CHANNEL AUTO\n\nCHANNELS\nEND\n\nZONECHANNELS 52428803\n\nCOLORS\nSYSTEM 255 255 0 N\nSAY 255 255 255 N\nPARTY 170 170 255 N\nRAID 255 127 0 N\nGUILD 64 255 64 N\nOFFICER 64 192 64 N\nYELL 255 64 64 N\nWHISPER 255 128 255 N\nWHISPER_FOREIGN 255 128 255 N\nWHISPER_INFORM 255 128 255 N\nEMOTE 255 128 64 N\nTEXT_EMOTE 255 128 64 N\nMONSTER_SAY 255 255 159 N\nMONSTER_PARTY 170 170 255 N\nMONSTER_YELL 255 64 64 N\nMONSTER_WHISPER 255 181 235 N\nMONSTER_EMOTE 255 128 64 N\nCHANNEL 255 192 192 N\nCHANNEL_JOIN 192 128 128 N\nCHANNEL_LEAVE 192 128 128 N\nCHANNEL_LIST 192 128 128 N\nCHANNEL_NOTICE 192 192 192 N\nCHANNEL_NOTICE_USER 192 192 192 N\nAFK 255 128 255 N\nDND 255 128 255 N\nIGNORED 255 0 0 N\nSKILL 85 85 255 N\nLOOT 0 170 0 N\nMONEY 255 255 0 N\nOPENING 128 128 255 N\nTRADESKILLS 255 255 255 N\nPET_INFO 128 128 255 N\nCOMBAT_MISC_INFO 128 128 255 N\nCOMBAT_XP_GAIN 111 111 255 N\nCOMBAT_HONOR_GAIN 224 202 10 N\nCOMBAT_FACTION_CHANGE 128 128 255 N\nBG_SYSTEM_NEUTRAL 255 120 10 N\nBG_SYSTEM_ALLIANCE 0 174 239 N\nBG_SYSTEM_HORDE 255 0 0 N\nRAID_LEADER 255 72 9 N\nRAID_WARNING 255 72 0 N\nRAID_BOSS_EMOTE 255 221 0 N\nRAID_BOSS_WHISPER 255 221 0 N\nFILTERED 255 0 0 N\nBATTLEGROUND 255 127 0 N\nBATTLEGROUND_LEADER 255 219 183 N\nRESTRICTED 255 0 0 N\nBATTLENET 255 255 255 N\nACHIEVEMENT 255 255 0 N\nGUILD_ACHIEVEMENT 64 255 64 N\nARENA_POINTS 255 255 255 N\nPARTY_LEADER 118 200 255 N\nTARGETICONS 255 255 0 N\nBN_WHISPER 0 255 246 N\nBN_WHISPER_INFORM 0 255 246 N\nBN_CONVERSATION 0 177 240 N\nBN_CONVERSATION_NOTICE 0 177 240 N\nBN_CONVERSATION_LIST 0 177 240 N\nBN_INLINE_TOAST_ALERT 130 197 255 N\nBN_INLINE_TOAST_BROADCAST 130 197 255 N\nBN_INLINE_TOAST_BROADCAST_INFORM 130 197 255 N\nBN_INLINE_TOAST_CONVERSATION 130 197 255 N\nCHANNEL1 255 192 192 N\nCHANNEL2 255 192 192 N\nCHANNEL3 255 192 192 N\nCHANNEL4 255 192 192 N\nCHANNEL5 255 192 192 N\nCHANNEL6 255 192 192 N\nCHANNEL7 255 192 192 N\nCHANNEL8 255 192 192 N\nCHANNEL9 255 192 192 N\nCHANNEL10 255 192 192 N\nEND\n\nWINDOW 1\nNAME General\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 1\nSHOWN 1\nMESSAGES\nSYSTEM\nSYSTEM_NOMENU\nSAY\nEMOTE\nYELL\nWHISPER\nPARTY\nPARTY_LEADER\nRAID\nRAID_LEADER\nRAID_WARNING\nBATTLEGROUND\nBATTLEGROUND_LEADER\nGUILD\nOFFICER\nMONSTER_SAY\nMONSTER_YELL\nMONSTER_EMOTE\nMONSTER_WHISPER\nMONSTER_BOSS_EMOTE\nMONSTER_BOSS_WHISPER\nERRORS\nAFK\nDND\nIGNORED\nBG_HORDE\nBG_ALLIANCE\nBG_NEUTRAL\nCOMBAT_FACTION_CHANGE\nSKILL\nLOOT\nMONEY\nCHANNEL\nACHIEVEMENT\nGUILD_ACHIEVEMENT\nTARGETICONS\nBN_WHISPER\nBN_WHISPER_INFORM\nBN_CONVERSATION\nBN_INLINE_TOAST_ALERT\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 18874371\n\nEND\n\nWINDOW 2\nNAME Registro de combate\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 2\nSHOWN 0\nMESSAGES\nOPENING\nTRADESKILLS\nPET_INFO\nCOMBAT_XP_GAIN\nCOMBAT_HONOR_GAIN\nCOMBAT_MISC_INFO\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 3\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 4\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 5\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 6\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 7\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 8\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 9\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 10\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\n'),(3,1,1792550485,_binary 'SET questLogCollapseFilter \"-1\"\nSET trackedQuests \"v\"\nSET trackedAchievements \"v\"\nSET cameraSavedDistance \"15.000000\"\nSET cameraSavedPitch \"16.950023\"\nSET nameplateShowEnemies \"1\"\nSET nameplateShowFriends \"1\"\nSET playerStatLeftDropdown \"PLAYERSTAT_BASE_STATS\"\nSET playerStatRightDropdown \"PLAYERSTAT_SPELL_COMBAT\"\nSET showTokenFrame \"1\"\n'),(3,7,1792550486,_binary 'VERSION 5\n\nADDEDVERSION 13\n\nOPTION_GUILD_RECRUITMENT_CHANNEL AUTO\n\nCHANNELS\nEND\n\nZONECHANNELS 52428803\n\nCOLORS\nSYSTEM 255 255 0 N\nSAY 255 255 255 N\nPARTY 170 170 255 N\nRAID 255 127 0 N\nGUILD 64 255 64 N\nOFFICER 64 192 64 N\nYELL 255 64 64 N\nWHISPER 255 128 255 N\nWHISPER_FOREIGN 255 128 255 N\nWHISPER_INFORM 255 128 255 N\nEMOTE 255 128 64 N\nTEXT_EMOTE 255 128 64 N\nMONSTER_SAY 255 255 159 N\nMONSTER_PARTY 170 170 255 N\nMONSTER_YELL 255 64 64 N\nMONSTER_WHISPER 255 181 235 N\nMONSTER_EMOTE 255 128 64 N\nCHANNEL 255 192 192 N\nCHANNEL_JOIN 192 128 128 N\nCHANNEL_LEAVE 192 128 128 N\nCHANNEL_LIST 192 128 128 N\nCHANNEL_NOTICE 192 192 192 N\nCHANNEL_NOTICE_USER 192 192 192 N\nAFK 255 128 255 N\nDND 255 128 255 N\nIGNORED 255 0 0 N\nSKILL 85 85 255 N\nLOOT 0 170 0 N\nMONEY 255 255 0 N\nOPENING 128 128 255 N\nTRADESKILLS 255 255 255 N\nPET_INFO 128 128 255 N\nCOMBAT_MISC_INFO 128 128 255 N\nCOMBAT_XP_GAIN 111 111 255 N\nCOMBAT_HONOR_GAIN 224 202 10 N\nCOMBAT_FACTION_CHANGE 128 128 255 N\nBG_SYSTEM_NEUTRAL 255 120 10 N\nBG_SYSTEM_ALLIANCE 0 174 239 N\nBG_SYSTEM_HORDE 255 0 0 N\nRAID_LEADER 255 72 9 N\nRAID_WARNING 255 72 0 N\nRAID_BOSS_EMOTE 255 221 0 N\nRAID_BOSS_WHISPER 255 221 0 N\nFILTERED 255 0 0 N\nBATTLEGROUND 255 127 0 N\nBATTLEGROUND_LEADER 255 219 183 N\nRESTRICTED 255 0 0 N\nBATTLENET 255 255 255 N\nACHIEVEMENT 255 255 0 N\nGUILD_ACHIEVEMENT 64 255 64 N\nARENA_POINTS 255 255 255 N\nPARTY_LEADER 118 200 255 N\nTARGETICONS 255 255 0 N\nBN_WHISPER 0 255 246 N\nBN_WHISPER_INFORM 0 255 246 N\nBN_CONVERSATION 0 177 240 N\nBN_CONVERSATION_NOTICE 0 177 240 N\nBN_CONVERSATION_LIST 0 177 240 N\nBN_INLINE_TOAST_ALERT 130 197 255 N\nBN_INLINE_TOAST_BROADCAST 130 197 255 N\nBN_INLINE_TOAST_BROADCAST_INFORM 130 197 255 N\nBN_INLINE_TOAST_CONVERSATION 130 197 255 N\nCHANNEL1 255 192 192 N\nCHANNEL2 255 192 192 N\nCHANNEL3 255 192 192 N\nCHANNEL4 255 192 192 N\nCHANNEL5 255 192 192 N\nCHANNEL6 255 192 192 N\nCHANNEL7 255 192 192 N\nCHANNEL8 255 192 192 N\nCHANNEL9 255 192 192 N\nCHANNEL10 255 192 192 N\nEND\n\nWINDOW 1\nNAME General\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 1\nSHOWN 1\nMESSAGES\nSYSTEM\nSYSTEM_NOMENU\nSAY\nEMOTE\nYELL\nWHISPER\nPARTY\nPARTY_LEADER\nRAID\nRAID_LEADER\nRAID_WARNING\nBATTLEGROUND\nBATTLEGROUND_LEADER\nGUILD\nOFFICER\nMONSTER_SAY\nMONSTER_YELL\nMONSTER_EMOTE\nMONSTER_WHISPER\nMONSTER_BOSS_EMOTE\nMONSTER_BOSS_WHISPER\nERRORS\nAFK\nDND\nIGNORED\nBG_HORDE\nBG_ALLIANCE\nBG_NEUTRAL\nCOMBAT_FACTION_CHANGE\nSKILL\nLOOT\nMONEY\nCHANNEL\nACHIEVEMENT\nGUILD_ACHIEVEMENT\nTARGETICONS\nBN_WHISPER\nBN_WHISPER_INFORM\nBN_CONVERSATION\nBN_INLINE_TOAST_ALERT\nEND\n\nCHANNELS\nBuscarGrupo\nEND\n\nZONECHANNELS 18874371\n\nEND\n\nWINDOW 2\nNAME Registro de combate\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 2\nSHOWN 0\nMESSAGES\nOPENING\nTRADESKILLS\nPET_INFO\nCOMBAT_XP_GAIN\nCOMBAT_HONOR_GAIN\nCOMBAT_MISC_INFO\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 3\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 4\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 5\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 6\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 7\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 8\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 9\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 10\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\n'),(4,1,1792555872,_binary 'SET questLogCollapseFilter \"-1\"\nSET trackedQuests \"v\"\nSET trackedAchievements \"v\"\nSET cameraSavedDistance \"13.546801\"\nSET cameraSavedPitch \"28.449994\"\nSET playerStatLeftDropdown \"PLAYERSTAT_BASE_STATS\"\nSET playerStatRightDropdown \"PLAYERSTAT_MELEE_COMBAT\"\n'),(4,7,1792555873,_binary 'VERSION 5\n\nADDEDVERSION 13\n\nOPTION_GUILD_RECRUITMENT_CHANNEL AUTO\n\nCHANNELS\nEND\n\nZONECHANNELS 52428803\n\nCOLORS\nSYSTEM 255 255 0 N\nSAY 255 255 255 N\nPARTY 170 170 255 N\nRAID 255 127 0 N\nGUILD 64 255 64 N\nOFFICER 64 192 64 N\nYELL 255 64 64 N\nWHISPER 255 128 255 N\nWHISPER_FOREIGN 255 128 255 N\nWHISPER_INFORM 255 128 255 N\nEMOTE 255 128 64 N\nTEXT_EMOTE 255 128 64 N\nMONSTER_SAY 255 255 159 N\nMONSTER_PARTY 170 170 255 N\nMONSTER_YELL 255 64 64 N\nMONSTER_WHISPER 255 181 235 N\nMONSTER_EMOTE 255 128 64 N\nCHANNEL 255 192 192 N\nCHANNEL_JOIN 192 128 128 N\nCHANNEL_LEAVE 192 128 128 N\nCHANNEL_LIST 192 128 128 N\nCHANNEL_NOTICE 192 192 192 N\nCHANNEL_NOTICE_USER 192 192 192 N\nAFK 255 128 255 N\nDND 255 128 255 N\nIGNORED 255 0 0 N\nSKILL 85 85 255 N\nLOOT 0 170 0 N\nMONEY 255 255 0 N\nOPENING 128 128 255 N\nTRADESKILLS 255 255 255 N\nPET_INFO 128 128 255 N\nCOMBAT_MISC_INFO 128 128 255 N\nCOMBAT_XP_GAIN 111 111 255 N\nCOMBAT_HONOR_GAIN 224 202 10 N\nCOMBAT_FACTION_CHANGE 128 128 255 N\nBG_SYSTEM_NEUTRAL 255 120 10 N\nBG_SYSTEM_ALLIANCE 0 174 239 N\nBG_SYSTEM_HORDE 255 0 0 N\nRAID_LEADER 255 72 9 N\nRAID_WARNING 255 72 0 N\nRAID_BOSS_EMOTE 255 221 0 N\nRAID_BOSS_WHISPER 255 221 0 N\nFILTERED 255 0 0 N\nBATTLEGROUND 255 127 0 N\nBATTLEGROUND_LEADER 255 219 183 N\nRESTRICTED 255 0 0 N\nBATTLENET 255 255 255 N\nACHIEVEMENT 255 255 0 N\nGUILD_ACHIEVEMENT 64 255 64 N\nARENA_POINTS 255 255 255 N\nPARTY_LEADER 118 200 255 N\nTARGETICONS 255 255 0 N\nBN_WHISPER 0 255 246 N\nBN_WHISPER_INFORM 0 255 246 N\nBN_CONVERSATION 0 177 240 N\nBN_CONVERSATION_NOTICE 0 177 240 N\nBN_CONVERSATION_LIST 0 177 240 N\nBN_INLINE_TOAST_ALERT 130 197 255 N\nBN_INLINE_TOAST_BROADCAST 130 197 255 N\nBN_INLINE_TOAST_BROADCAST_INFORM 130 197 255 N\nBN_INLINE_TOAST_CONVERSATION 130 197 255 N\nCHANNEL1 255 192 192 N\nCHANNEL2 255 192 192 N\nCHANNEL3 255 192 192 N\nCHANNEL4 255 192 192 N\nCHANNEL5 255 192 192 N\nCHANNEL6 255 192 192 N\nCHANNEL7 255 192 192 N\nCHANNEL8 255 192 192 N\nCHANNEL9 255 192 192 N\nCHANNEL10 255 192 192 N\nEND\n\nWINDOW 1\nNAME General\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 1\nSHOWN 1\nMESSAGES\nSYSTEM\nSYSTEM_NOMENU\nSAY\nEMOTE\nYELL\nWHISPER\nPARTY\nPARTY_LEADER\nRAID\nRAID_LEADER\nRAID_WARNING\nBATTLEGROUND\nBATTLEGROUND_LEADER\nGUILD\nOFFICER\nMONSTER_SAY\nMONSTER_YELL\nMONSTER_EMOTE\nMONSTER_WHISPER\nMONSTER_BOSS_EMOTE\nMONSTER_BOSS_WHISPER\nERRORS\nAFK\nDND\nIGNORED\nBG_HORDE\nBG_ALLIANCE\nBG_NEUTRAL\nCOMBAT_FACTION_CHANGE\nSKILL\nLOOT\nMONEY\nCHANNEL\nACHIEVEMENT\nGUILD_ACHIEVEMENT\nTARGETICONS\nBN_WHISPER\nBN_WHISPER_INFORM\nBN_CONVERSATION\nBN_INLINE_TOAST_ALERT\nEND\n\nCHANNELS\nBuscarGrupo\nEND\n\nZONECHANNELS 52428803\n\nEND\n\nWINDOW 2\nNAME Registro de combate\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 2\nSHOWN 0\nMESSAGES\nOPENING\nTRADESKILLS\nPET_INFO\nCOMBAT_XP_GAIN\nCOMBAT_HONOR_GAIN\nCOMBAT_MISC_INFO\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 3\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 4\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 5\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 6\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 7\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 8\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 9\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 10\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\n');
/*!40000 ALTER TABLE `character_account_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_achievement`
--

DROP TABLE IF EXISTS `character_achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_achievement` (
  `guid` int unsigned NOT NULL,
  `achievement` smallint unsigned NOT NULL,
  `date` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`achievement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_achievement`
--

LOCK TABLES `character_achievement` WRITE;
/*!40000 ALTER TABLE `character_achievement` DISABLE KEYS */;
INSERT INTO `character_achievement` VALUES (1,889,1792543148),(1,891,1792543148),(2,457,1792537464),(2,464,1792537464),(2,1408,1792537464),(3,2256,1792553968),(4,6,1792555869),(4,7,1792555869),(4,8,1792555869),(4,9,1792555869),(4,10,1792555869),(4,11,1792555961),(4,12,1792555961),(4,13,1792555961),(4,131,1792555869),(4,132,1792555869),(4,133,1792555869),(4,457,1792555961),(4,461,1792555961),(4,889,1792555898),(4,891,1792555898),(4,1409,1792555961);
/*!40000 ALTER TABLE `character_achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_achievement_offline_updates`
--

DROP TABLE IF EXISTS `character_achievement_offline_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_achievement_offline_updates` (
  `guid` int unsigned NOT NULL COMMENT 'Character''s GUID',
  `update_type` tinyint unsigned NOT NULL COMMENT 'Supported types: 1 - COMPLETE_ACHIEVEMENT; 2 - UPDATE_CRITERIA',
  `arg1` int unsigned NOT NULL COMMENT 'For type 1: achievement ID; for type 2: ACHIEVEMENT_CRITERIA_TYPE',
  `arg2` int unsigned DEFAULT NULL COMMENT 'For type 2: miscValue1 for updating achievement criteria',
  `arg3` int unsigned DEFAULT NULL COMMENT 'For type 2: miscValue2 for updating achievement criteria',
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Stores updates to character achievements when the character was offline';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_achievement_offline_updates`
--

LOCK TABLES `character_achievement_offline_updates` WRITE;
/*!40000 ALTER TABLE `character_achievement_offline_updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_achievement_offline_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_achievement_progress`
--

DROP TABLE IF EXISTS `character_achievement_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_achievement_progress` (
  `guid` int unsigned NOT NULL,
  `criteria` smallint unsigned NOT NULL,
  `counter` int unsigned NOT NULL,
  `date` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_achievement_progress`
--

LOCK TABLES `character_achievement_progress` WRITE;
/*!40000 ALTER TABLE `character_achievement_progress` DISABLE KEYS */;
INSERT INTO `character_achievement_progress` VALUES (1,34,1,1792531313),(1,35,1,1792531313),(1,36,1,1792531313),(1,37,1,1792531313),(1,38,1,1792531313),(1,39,1,1792531313),(1,40,1,1792531313),(1,41,1,1792531313),(1,167,1,1792531313),(1,655,1,1792531313),(1,753,1,1792531313),(1,755,50,1792542581),(1,756,1,1792531313),(1,1508,1,1792531380),(1,1871,150,1792543148),(1,1873,150,1792543148),(1,3354,1607,1792542308),(1,3506,1607,1792542308),(1,3507,1607,1792542308),(1,3510,1607,1792542308),(1,3511,1607,1792542308),(1,3512,1607,1792542308),(1,4093,1607,1792542308),(1,4224,674562868,1792542308),(1,4787,7,1792543148),(1,4944,3,1792542586),(1,4946,2,1792542586),(1,4953,2,1792542586),(1,4958,1,1792531597),(1,5212,1,1792531313),(1,5215,1,1792531313),(1,5230,1,1792531313),(1,5529,3,1792542586),(1,5531,1,1792531597),(1,5532,2,1792542586),(1,5576,1,1792531313),(1,5577,50,1792542581),(1,5580,1,1792531313),(1,5589,1,1792531313),(1,7550,7,1792543148),(1,7551,7,1792543148),(1,7552,7,1792543148),(1,9224,7,1792543148),(1,9598,1,1792531313),(1,12698,20,1792543148),(3,34,1,1792541784),(3,35,1,1792541784),(3,36,1,1792541784),(3,37,1,1792541784),(3,38,1,1792541784),(3,39,1,1792541784),(3,40,1,1792541784),(3,41,1,1792541784),(3,167,1,1792541784),(3,655,1,1792541784),(3,657,1,1792541784),(3,756,1,1792541784),(3,757,1,1792541784),(3,3354,196150,1792554121),(3,3506,196150,1792554121),(3,3507,196150,1792554121),(3,3510,196150,1792554121),(3,3511,196150,1792554121),(3,3512,196150,1792554121),(3,4093,196150,1792554121),(3,4224,1000000000,1792543624),(3,4944,18,1792554590),(3,4946,18,1792554590),(3,4953,3,1792553934),(3,4955,15,1792554590),(3,5212,1,1792541784),(3,5216,1,1792541784),(3,5233,1,1792541784),(3,5529,18,1792554590),(3,5532,18,1792554590),(3,5580,1,1792541784),(3,5586,1,1792541784),(3,5589,1,1792541784),(3,5591,1,1792541784),(3,8102,1,1792553968),(3,9598,1,1792541784),(3,12698,10,1792553968),(4,167,270,1792555869),(4,641,270,1792555869),(4,656,270,1792555869),(4,753,270,1792555869),(4,754,270,1792555869),(4,755,270,1792555869),(4,756,270,1792555869),(4,843,300,1792555869),(4,844,300,1792555869),(4,1871,150,1792555898),(4,1873,150,1792555898),(4,2356,1,1792556115),(4,3737,1,1792556115),(4,4224,100002000,1792555937),(4,4787,1,1792555898),(4,5249,270,1792555869),(4,5562,270,1792555869),(4,5576,270,1792555869),(4,5577,270,1792555869),(4,5578,270,1792555869),(4,5579,270,1792555869),(4,5589,270,1792555869),(4,5590,270,1792555869),(4,5592,270,1792555869),(4,6141,1,1792556111),(4,6394,12,1792555869),(4,7222,12,1792555869),(4,7550,1,1792555898),(4,7551,1,1792555898),(4,7552,1,1792555898),(4,9223,1,1792555898),(4,9598,55,1792555869),(4,12698,130,1792555961);
/*!40000 ALTER TABLE `character_achievement_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_action`
--

DROP TABLE IF EXISTS `character_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_action` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `spec` tinyint unsigned NOT NULL DEFAULT '0',
  `button` tinyint unsigned NOT NULL DEFAULT '0',
  `action` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spec`,`button`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_action`
--

LOCK TABLES `character_action` WRITE;
/*!40000 ALTER TABLE `character_action` DISABLE KEYS */;
INSERT INTO `character_action` VALUES (1,0,0,35395,0),(1,0,1,53385,0),(1,0,2,53407,0),(1,0,3,20271,0),(1,0,4,53408,0),(1,0,5,48801,0),(1,0,7,48806,0),(1,0,8,1044,0),(1,0,9,48819,0),(1,0,10,31884,0),(1,0,11,28730,0),(1,0,35,61447,0),(1,0,46,61230,0),(1,0,47,60116,0),(1,0,60,27261,0),(1,0,61,21084,0),(1,0,62,25780,0),(1,0,63,48932,0),(1,0,64,53601,0),(1,0,65,48782,0),(1,0,66,48785,0),(1,0,67,10278,0),(1,0,68,498,0),(1,0,69,4987,0),(3,0,0,27261,0),(3,0,1,48123,0),(3,0,2,2053,0),(3,0,4,48063,0),(3,0,9,59752,0),(3,0,33,59791,0),(3,0,34,58983,0),(3,0,35,61425,0),(3,0,46,61229,0),(3,0,47,60114,0),(3,0,48,33206,0),(3,0,60,27261,0),(3,0,62,48158,0),(3,0,63,48125,0),(3,0,64,48300,0),(3,0,65,64044,0),(3,0,66,586,0),(3,0,67,48066,0),(3,0,68,53007,0),(3,0,70,48073,0),(3,0,71,48161,0),(3,0,72,48160,0),(3,0,73,48127,0),(3,0,74,48156,0),(4,0,0,6603,0),(4,0,1,49576,0),(4,0,2,49909,0),(4,0,3,49921,0),(4,0,4,49930,0),(4,0,5,49895,0),(4,0,10,58984,0);
/*!40000 ALTER TABLE `character_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_arena_stats`
--

DROP TABLE IF EXISTS `character_arena_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_arena_stats` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `slot` tinyint unsigned NOT NULL DEFAULT '0',
  `matchMakerRating` smallint unsigned NOT NULL DEFAULT '0',
  `maxMMR` smallint NOT NULL,
  PRIMARY KEY (`guid`,`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_arena_stats`
--

LOCK TABLES `character_arena_stats` WRITE;
/*!40000 ALTER TABLE `character_arena_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_arena_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_aura`
--

DROP TABLE IF EXISTS `character_aura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_aura` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `casterGuid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `itemGuid` bigint unsigned NOT NULL DEFAULT '0',
  `spell` int unsigned NOT NULL DEFAULT '0',
  `effectMask` tinyint unsigned NOT NULL DEFAULT '0',
  `recalculateMask` tinyint unsigned NOT NULL DEFAULT '0',
  `stackCount` tinyint unsigned NOT NULL DEFAULT '1',
  `amount0` int NOT NULL DEFAULT '0',
  `amount1` int NOT NULL DEFAULT '0',
  `amount2` int NOT NULL DEFAULT '0',
  `base_amount0` int NOT NULL DEFAULT '0',
  `base_amount1` int NOT NULL DEFAULT '0',
  `base_amount2` int NOT NULL DEFAULT '0',
  `maxDuration` int NOT NULL DEFAULT '0',
  `remainTime` int NOT NULL DEFAULT '0',
  `remainCharges` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`casterGuid`,`itemGuid`,`spell`,`effectMask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_aura`
--

LOCK TABLES `character_aura` WRITE;
/*!40000 ALTER TABLE `character_aura` DISABLE KEYS */;
INSERT INTO `character_aura` VALUES (1,1,0,1908,1,1,1,100,0,0,99,0,0,-1,-1,0),(1,1,0,21084,7,7,1,0,0,20187,-1,-1,20186,1800000,1567085,0),(1,1,0,25780,3,3,1,80,-6,0,79,-1,0,-1,-1,0),(1,1,0,38734,7,7,1,220,18,10,219,17,9,-1,-1,0),(1,1,0,48932,3,3,1,687,687,0,549,549,0,600000,372507,0),(1,1,0,54043,7,7,1,174,0,0,111,-1,-1,-1,-1,0),(1,1,0,57340,1,1,1,43,0,0,42,0,0,-1,-1,0),(1,1,0,60116,3,3,1,0,100,0,0,99,0,-1,-1,0),(1,1,0,63510,6,6,1,0,-30,-30,0,-1,-1,-1,-1,0),(1,1,0,63514,2,2,1,0,6,0,0,-1,0,-1,-1,0),(1,1,0,63531,6,6,1,0,3,3,0,-1,-1,-1,-1,0),(3,3,0,1908,1,1,1,100,0,0,99,0,0,-1,-1,0),(3,3,0,15473,7,7,1,0,15,-15,0,14,-16,-1,-1,0),(3,3,0,18209,1,1,1,10,0,0,9,0,0,604800000,604610806,0),(3,3,0,35912,7,7,1,54,49,10,53,48,9,-1,-1,0),(3,3,0,45659,1,1,1,190,0,0,189,0,0,600000,373771,0),(3,3,0,45813,1,1,1,100000,0,0,99999,0,0,-1,-1,0),(3,3,0,48073,1,1,1,80,0,0,79,0,0,1800000,1361191,0),(3,3,0,48161,1,1,1,214,0,0,164,0,0,1800000,1365525,0),(3,3,0,48169,1,1,1,130,0,0,129,0,0,600000,15529,0),(4,4,0,48263,7,7,1,60,45,-10,59,44,-9,-1,-1,0),(4,4,0,49772,1,1,1,15,0,0,14,0,0,-1,-1,0),(4,4,0,57340,1,1,1,43,0,0,42,0,0,-1,-1,0),(4,4,0,61261,3,3,1,8,600,0,7,599,0,-1,-1,0),(4,4,0,63611,2,2,1,0,4,0,0,3,0,-1,-1,0),(4,17379391512953013826,0,61834,3,2,1,0,0,0,0,0,0,30000,15100,0);
/*!40000 ALTER TABLE `character_aura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_banned`
--

DROP TABLE IF EXISTS `character_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_banned` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bandate` int unsigned NOT NULL DEFAULT '0',
  `unbandate` int unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banreason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Ban List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_banned`
--

LOCK TABLES `character_banned` WRITE;
/*!40000 ALTER TABLE `character_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_battleground_random`
--

DROP TABLE IF EXISTS `character_battleground_random`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_battleground_random` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_battleground_random`
--

LOCK TABLES `character_battleground_random` WRITE;
/*!40000 ALTER TABLE `character_battleground_random` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_battleground_random` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_brew_of_the_month`
--

DROP TABLE IF EXISTS `character_brew_of_the_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_brew_of_the_month` (
  `guid` int unsigned NOT NULL,
  `lastEventId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_brew_of_the_month`
--

LOCK TABLES `character_brew_of_the_month` WRITE;
/*!40000 ALTER TABLE `character_brew_of_the_month` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_brew_of_the_month` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_declinedname`
--

DROP TABLE IF EXISTS `character_declinedname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_declinedname` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `genitive` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dative` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `accusative` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instrumental` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `prepositional` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_declinedname`
--

LOCK TABLES `character_declinedname` WRITE;
/*!40000 ALTER TABLE `character_declinedname` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_declinedname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_entry_point`
--

DROP TABLE IF EXISTS `character_entry_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_entry_point` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `joinX` float NOT NULL DEFAULT '0',
  `joinY` float NOT NULL DEFAULT '0',
  `joinZ` float NOT NULL DEFAULT '0',
  `joinO` float NOT NULL DEFAULT '0',
  `joinMapId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `taxiPath0` int unsigned NOT NULL DEFAULT '0',
  `taxiPath1` int unsigned NOT NULL DEFAULT '0',
  `mountSpell` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_entry_point`
--

LOCK TABLES `character_entry_point` WRITE;
/*!40000 ALTER TABLE `character_entry_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_entry_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_equipmentsets`
--

DROP TABLE IF EXISTS `character_equipmentsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_equipmentsets` (
  `guid` int NOT NULL DEFAULT '0',
  `setguid` bigint NOT NULL AUTO_INCREMENT,
  `setindex` tinyint unsigned NOT NULL DEFAULT '0',
  `name` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iconname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ignore_mask` int unsigned NOT NULL DEFAULT '0',
  `item0` int unsigned NOT NULL DEFAULT '0',
  `item1` int unsigned NOT NULL DEFAULT '0',
  `item2` int unsigned NOT NULL DEFAULT '0',
  `item3` int unsigned NOT NULL DEFAULT '0',
  `item4` int unsigned NOT NULL DEFAULT '0',
  `item5` int unsigned NOT NULL DEFAULT '0',
  `item6` int unsigned NOT NULL DEFAULT '0',
  `item7` int unsigned NOT NULL DEFAULT '0',
  `item8` int unsigned NOT NULL DEFAULT '0',
  `item9` int unsigned NOT NULL DEFAULT '0',
  `item10` int unsigned NOT NULL DEFAULT '0',
  `item11` int unsigned NOT NULL DEFAULT '0',
  `item12` int unsigned NOT NULL DEFAULT '0',
  `item13` int unsigned NOT NULL DEFAULT '0',
  `item14` int unsigned NOT NULL DEFAULT '0',
  `item15` int unsigned NOT NULL DEFAULT '0',
  `item16` int unsigned NOT NULL DEFAULT '0',
  `item17` int unsigned NOT NULL DEFAULT '0',
  `item18` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`setguid`),
  UNIQUE KEY `idx_set` (`guid`,`setguid`,`setindex`),
  KEY `Idx_setindex` (`setindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_equipmentsets`
--

LOCK TABLES `character_equipmentsets` WRITE;
/*!40000 ALTER TABLE `character_equipmentsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_equipmentsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_gifts`
--

DROP TABLE IF EXISTS `character_gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_gifts` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `item_guid` int unsigned NOT NULL DEFAULT '0',
  `entry` int unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_gifts`
--

LOCK TABLES `character_gifts` WRITE;
/*!40000 ALTER TABLE `character_gifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_gifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_glyphs`
--

DROP TABLE IF EXISTS `character_glyphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_glyphs` (
  `guid` int unsigned NOT NULL,
  `talentGroup` tinyint unsigned NOT NULL DEFAULT '0',
  `glyph1` smallint unsigned DEFAULT '0',
  `glyph2` smallint unsigned DEFAULT '0',
  `glyph3` smallint unsigned DEFAULT '0',
  `glyph4` smallint unsigned DEFAULT '0',
  `glyph5` smallint unsigned DEFAULT '0',
  `glyph6` smallint unsigned DEFAULT '0',
  PRIMARY KEY (`guid`,`talentGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_glyphs`
--

LOCK TABLES `character_glyphs` WRITE;
/*!40000 ALTER TABLE `character_glyphs` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_glyphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_homebind`
--

DROP TABLE IF EXISTS `character_homebind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_homebind` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mapId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_homebind`
--

LOCK TABLES `character_homebind` WRITE;
/*!40000 ALTER TABLE `character_homebind` DISABLE KEYS */;
INSERT INTO `character_homebind` VALUES (1,530,3431,10349.6,-6357.29,33.4026),(3,0,12,-8949.95,-132.493,83.5312),(4,0,4342,2359.64,-5662.41,382.261);
/*!40000 ALTER TABLE `character_homebind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_instance`
--

DROP TABLE IF EXISTS `character_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_instance` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `instance` int unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint unsigned NOT NULL DEFAULT '0',
  `extended` tinyint unsigned NOT NULL,
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_instance`
--

LOCK TABLES `character_instance` WRITE;
/*!40000 ALTER TABLE `character_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_inventory`
--

DROP TABLE IF EXISTS `character_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_inventory` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bag` int unsigned NOT NULL DEFAULT '0',
  `slot` tinyint unsigned NOT NULL DEFAULT '0',
  `item` int unsigned NOT NULL DEFAULT '0' COMMENT 'Item Global Unique Identifier',
  PRIMARY KEY (`item`),
  UNIQUE KEY `guid` (`guid`,`bag`,`slot`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_inventory`
--

LOCK TABLES `character_inventory` WRITE;
/*!40000 ALTER TABLE `character_inventory` DISABLE KEYS */;
INSERT INTO `character_inventory` VALUES (1,0,0,25),(1,0,1,23),(1,0,2,28),(1,0,4,35),(1,0,5,31),(1,0,6,26),(1,0,7,32),(1,0,8,33),(1,0,9,36),(1,0,10,30),(1,0,11,107),(1,0,12,108),(1,0,13,109),(1,0,14,24),(1,0,15,106),(1,0,17,27),(1,0,18,34),(1,0,23,10),(1,0,24,44),(1,0,27,21),(1,0,30,12),(1,0,31,38),(1,0,32,39),(1,0,33,40),(1,0,34,41),(1,0,35,42),(1,0,36,43),(1,0,37,37),(3,0,0,71),(3,0,1,90),(3,0,2,73),(3,0,4,75),(3,0,5,86),(3,0,6,74),(3,0,7,87),(3,0,8,85),(3,0,9,72),(3,0,10,80),(3,0,11,82),(3,0,12,83),(3,0,13,84),(3,0,14,89),(3,0,15,79),(3,0,17,76),(3,0,18,88),(3,0,23,70),(3,0,24,103),(3,0,25,68),(3,0,27,62),(3,0,28,60),(3,0,29,105),(3,0,118,95),(4,0,0,111),(4,0,1,129),(4,0,2,113),(4,0,4,117),(4,0,5,123),(4,0,6,125),(4,0,7,127),(4,0,8,119),(4,0,9,121),(4,0,10,131),(4,0,11,141),(4,0,14,115),(4,0,15,145),(4,0,19,133),(4,0,20,135),(4,0,21,137),(4,0,22,139),(4,0,23,143);
/*!40000 ALTER TABLE `character_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_pet`
--

DROP TABLE IF EXISTS `character_pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_pet` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `entry` int unsigned NOT NULL DEFAULT '0',
  `owner` int unsigned NOT NULL DEFAULT '0',
  `modelid` int unsigned DEFAULT '0',
  `CreatedBySpell` int unsigned DEFAULT '0',
  `PetType` tinyint unsigned NOT NULL DEFAULT '0',
  `level` smallint unsigned NOT NULL DEFAULT '1',
  `exp` int unsigned NOT NULL DEFAULT '0',
  `Reactstate` tinyint unsigned NOT NULL DEFAULT '0',
  `name` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pet',
  `renamed` tinyint unsigned NOT NULL DEFAULT '0',
  `slot` tinyint unsigned NOT NULL DEFAULT '0',
  `curhealth` int unsigned NOT NULL DEFAULT '1',
  `curmana` int unsigned NOT NULL DEFAULT '0',
  `curhappiness` int unsigned NOT NULL DEFAULT '0',
  `savetime` int unsigned NOT NULL DEFAULT '0',
  `abdata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `idx_slot` (`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Pet System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_pet`
--

LOCK TABLES `character_pet` WRITE;
/*!40000 ALTER TABLE `character_pet` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_pet_declinedname`
--

DROP TABLE IF EXISTS `character_pet_declinedname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_pet_declinedname` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `owner` int unsigned NOT NULL DEFAULT '0',
  `genitive` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dative` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `accusative` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instrumental` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `prepositional` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `owner_key` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_pet_declinedname`
--

LOCK TABLES `character_pet_declinedname` WRITE;
/*!40000 ALTER TABLE `character_pet_declinedname` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_pet_declinedname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_queststatus`
--

DROP TABLE IF EXISTS `character_queststatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_queststatus` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `explored` tinyint unsigned NOT NULL DEFAULT '0',
  `timer` int unsigned NOT NULL DEFAULT '0',
  `mobcount1` smallint unsigned NOT NULL DEFAULT '0',
  `mobcount2` smallint unsigned NOT NULL DEFAULT '0',
  `mobcount3` smallint unsigned NOT NULL DEFAULT '0',
  `mobcount4` smallint unsigned NOT NULL DEFAULT '0',
  `itemcount1` smallint unsigned NOT NULL DEFAULT '0',
  `itemcount2` smallint unsigned NOT NULL DEFAULT '0',
  `itemcount3` smallint unsigned NOT NULL DEFAULT '0',
  `itemcount4` smallint unsigned NOT NULL DEFAULT '0',
  `itemcount5` smallint unsigned NOT NULL DEFAULT '0',
  `itemcount6` smallint unsigned NOT NULL DEFAULT '0',
  `playercount` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_queststatus`
--

LOCK TABLES `character_queststatus` WRITE;
/*!40000 ALTER TABLE `character_queststatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_queststatus_daily`
--

DROP TABLE IF EXISTS `character_queststatus_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_queststatus_daily` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `time` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_queststatus_daily`
--

LOCK TABLES `character_queststatus_daily` WRITE;
/*!40000 ALTER TABLE `character_queststatus_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_queststatus_monthly`
--

DROP TABLE IF EXISTS `character_queststatus_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_queststatus_monthly` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_queststatus_monthly`
--

LOCK TABLES `character_queststatus_monthly` WRITE;
/*!40000 ALTER TABLE `character_queststatus_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_queststatus_rewarded`
--

DROP TABLE IF EXISTS `character_queststatus_rewarded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_queststatus_rewarded` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_queststatus_rewarded`
--

LOCK TABLES `character_queststatus_rewarded` WRITE;
/*!40000 ALTER TABLE `character_queststatus_rewarded` DISABLE KEYS */;
INSERT INTO `character_queststatus_rewarded` VALUES (3,24811,1);
/*!40000 ALTER TABLE `character_queststatus_rewarded` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_queststatus_seasonal`
--

DROP TABLE IF EXISTS `character_queststatus_seasonal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_queststatus_seasonal` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `event` int unsigned NOT NULL DEFAULT '0' COMMENT 'Event Identifier',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_queststatus_seasonal`
--

LOCK TABLES `character_queststatus_seasonal` WRITE;
/*!40000 ALTER TABLE `character_queststatus_seasonal` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_seasonal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_queststatus_weekly`
--

DROP TABLE IF EXISTS `character_queststatus_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_queststatus_weekly` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_queststatus_weekly`
--

LOCK TABLES `character_queststatus_weekly` WRITE;
/*!40000 ALTER TABLE `character_queststatus_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_reputation`
--

DROP TABLE IF EXISTS `character_reputation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_reputation` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `faction` smallint unsigned NOT NULL DEFAULT '0',
  `standing` int NOT NULL DEFAULT '0',
  `flags` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`faction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_reputation`
--

LOCK TABLES `character_reputation` WRITE;
/*!40000 ALTER TABLE `character_reputation` DISABLE KEYS */;
INSERT INTO `character_reputation` VALUES (1,21,0,64),(1,46,0,4),(1,47,0,6),(1,54,0,6),(1,59,0,16),(1,67,0,25),(1,68,0,17),(1,69,0,6),(1,70,0,2),(1,72,0,6),(1,76,0,17),(1,81,0,17),(1,83,0,4),(1,86,0,4),(1,87,0,2),(1,92,0,2),(1,93,0,2),(1,169,0,12),(1,270,0,16),(1,289,0,4),(1,349,0,0),(1,369,0,64),(1,469,0,14),(1,470,0,64),(1,471,0,22),(1,509,0,2),(1,510,0,16),(1,529,0,0),(1,530,0,17),(1,549,0,4),(1,550,0,4),(1,551,0,4),(1,569,0,4),(1,570,0,4),(1,571,0,4),(1,574,0,4),(1,576,0,2),(1,577,0,64),(1,589,0,6),(1,609,0,0),(1,729,0,16),(1,730,0,2),(1,749,0,0),(1,809,0,16),(1,889,0,16),(1,890,0,6),(1,891,0,0),(1,892,0,24),(1,909,0,16),(1,910,0,2),(1,911,0,17),(1,922,0,16),(1,930,0,6),(1,932,0,80),(1,933,0,16),(1,934,0,80),(1,935,0,16),(1,936,0,28),(1,941,0,16),(1,942,0,16),(1,946,0,2),(1,947,0,16),(1,948,0,8),(1,949,0,24),(1,952,0,0),(1,967,0,16),(1,970,0,0),(1,978,0,2),(1,980,0,0),(1,989,0,16),(1,990,0,16),(1,1005,0,4),(1,1011,0,16),(1,1012,0,16),(1,1015,0,2),(1,1031,0,16),(1,1037,0,4),(1,1038,0,16),(1,1050,0,6),(1,1052,0,152),(1,1064,0,16),(1,1067,0,16),(1,1068,0,6),(1,1073,0,16),(1,1077,0,16),(1,1082,0,2),(1,1085,0,16),(1,1090,0,17),(1,1091,0,16),(1,1094,0,6),(1,1097,0,0),(1,1098,0,16),(1,1104,0,0),(1,1105,0,0),(1,1106,0,16),(1,1117,0,12),(1,1118,0,12),(1,1119,0,2),(1,1124,0,16),(1,1126,0,2),(1,1136,0,4),(1,1137,0,4),(1,1154,0,4),(1,1155,0,4),(1,1156,0,16),(3,21,0,64),(3,46,0,4),(3,47,0,17),(3,54,0,17),(3,59,0,16),(3,67,0,14),(3,68,0,6),(3,69,0,17),(3,70,0,2),(3,72,0,17),(3,76,0,6),(3,81,0,6),(3,83,0,4),(3,86,0,4),(3,87,0,2),(3,92,0,2),(3,93,0,2),(3,169,0,12),(3,270,0,16),(3,289,0,4),(3,349,0,0),(3,369,0,64),(3,469,0,25),(3,470,0,64),(3,471,0,20),(3,509,0,16),(3,510,0,2),(3,529,0,0),(3,530,0,6),(3,549,0,4),(3,550,0,4),(3,551,0,4),(3,569,0,4),(3,570,0,4),(3,571,0,4),(3,574,0,4),(3,576,0,2),(3,577,0,64),(3,589,0,0),(3,609,0,0),(3,729,0,2),(3,730,0,16),(3,749,0,0),(3,809,0,16),(3,889,0,6),(3,890,0,16),(3,891,0,24),(3,892,0,14),(3,909,0,16),(3,910,0,2),(3,911,0,6),(3,922,0,6),(3,930,0,17),(3,932,0,80),(3,933,0,16),(3,934,0,80),(3,935,0,16),(3,936,0,28),(3,941,0,6),(3,942,0,16),(3,946,0,16),(3,947,0,2),(3,948,0,8),(3,949,0,24),(3,952,0,0),(3,967,0,16),(3,970,0,0),(3,978,0,16),(3,980,0,0),(3,989,0,16),(3,990,0,16),(3,1005,0,4),(3,1011,0,16),(3,1012,0,16),(3,1015,0,2),(3,1031,0,16),(3,1037,0,136),(3,1038,0,16),(3,1050,0,16),(3,1052,0,2),(3,1064,0,6),(3,1067,0,2),(3,1068,0,16),(3,1073,0,16),(3,1077,0,16),(3,1082,0,4),(3,1085,0,6),(3,1090,0,17),(3,1091,0,16),(3,1094,0,16),(3,1097,0,0),(3,1098,0,16),(3,1104,0,0),(3,1105,0,0),(3,1106,0,16),(3,1117,0,12),(3,1118,0,12),(3,1119,0,2),(3,1124,0,6),(3,1126,0,16),(3,1136,0,4),(3,1137,0,4),(3,1154,0,4),(3,1155,0,4),(3,1156,0,16),(4,21,0,64),(4,46,0,4),(4,47,0,17),(4,54,0,17),(4,59,0,16),(4,67,0,14),(4,68,0,6),(4,69,0,17),(4,70,0,2),(4,72,0,17),(4,76,0,6),(4,81,0,6),(4,83,0,4),(4,86,0,4),(4,87,0,2),(4,92,0,2),(4,93,0,2),(4,169,0,12),(4,270,0,16),(4,289,0,4),(4,349,0,0),(4,369,0,64),(4,469,0,25),(4,470,0,64),(4,471,0,20),(4,509,0,16),(4,510,0,2),(4,529,0,0),(4,530,0,6),(4,549,0,4),(4,550,0,4),(4,551,0,4),(4,569,0,4),(4,570,0,4),(4,571,0,4),(4,574,0,4),(4,576,0,2),(4,577,0,64),(4,589,0,0),(4,609,0,0),(4,729,0,2),(4,730,0,16),(4,749,0,0),(4,809,0,16),(4,889,0,6),(4,890,0,16),(4,891,0,24),(4,892,0,14),(4,909,0,16),(4,910,0,0),(4,911,0,6),(4,922,0,6),(4,930,0,17),(4,932,0,80),(4,933,0,16),(4,934,0,80),(4,935,0,16),(4,936,0,28),(4,941,0,6),(4,942,0,16),(4,946,0,16),(4,947,0,0),(4,948,0,8),(4,949,0,24),(4,952,0,0),(4,967,0,16),(4,970,0,0),(4,978,0,16),(4,980,0,0),(4,989,0,16),(4,990,0,16),(4,1005,0,0),(4,1011,0,16),(4,1012,0,16),(4,1015,0,2),(4,1031,0,16),(4,1037,0,136),(4,1038,0,16),(4,1050,0,16),(4,1052,0,0),(4,1064,0,6),(4,1067,0,0),(4,1068,0,16),(4,1073,0,16),(4,1077,0,16),(4,1082,0,4),(4,1085,0,6),(4,1090,0,16),(4,1091,0,16),(4,1094,0,16),(4,1097,0,0),(4,1098,0,16),(4,1104,0,0),(4,1105,0,0),(4,1106,0,16),(4,1117,0,12),(4,1118,0,12),(4,1119,0,0),(4,1124,0,6),(4,1126,0,16),(4,1136,0,4),(4,1137,0,4),(4,1154,0,4),(4,1155,0,4),(4,1156,0,16);
/*!40000 ALTER TABLE `character_reputation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_settings`
--

DROP TABLE IF EXISTS `character_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_settings` (
  `guid` int unsigned NOT NULL,
  `source` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`guid`,`source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player Settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_settings`
--

LOCK TABLES `character_settings` WRITE;
/*!40000 ALTER TABLE `character_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_skills`
--

DROP TABLE IF EXISTS `character_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_skills` (
  `guid` int unsigned NOT NULL COMMENT 'Global Unique Identifier',
  `skill` smallint unsigned NOT NULL,
  `value` smallint unsigned NOT NULL,
  `max` smallint unsigned NOT NULL,
  PRIMARY KEY (`guid`,`skill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_skills`
--

LOCK TABLES `character_skills` WRITE;
/*!40000 ALTER TABLE `character_skills` DISABLE KEYS */;
INSERT INTO `character_skills` VALUES (1,43,400,400),(1,44,400,400),(1,54,400,400),(1,55,400,400),(1,95,400,400),(1,98,300,300),(1,109,300,300),(1,111,300,300),(1,113,300,300),(1,115,300,300),(1,137,300,300),(1,138,300,300),(1,139,300,300),(1,140,300,300),(1,141,300,300),(1,162,400,400),(1,172,400,400),(1,183,400,400),(1,184,400,400),(1,267,400,400),(1,293,1,1),(1,313,300,300),(1,315,300,300),(1,413,1,1),(1,414,1,1),(1,415,1,1),(1,433,1,1),(1,594,400,400),(1,673,300,300),(1,756,400,400),(1,759,300,300),(1,762,300,300),(1,769,400,400),(1,777,400,400),(1,778,400,400),(3,54,400,400),(3,56,400,400),(3,78,400,400),(3,95,400,400),(3,98,300,300),(3,109,300,300),(3,111,300,300),(3,113,300,300),(3,115,300,300),(3,129,450,450),(3,136,400,400),(3,137,300,300),(3,138,300,300),(3,139,300,300),(3,140,300,300),(3,141,300,300),(3,162,400,400),(3,164,450,450),(3,165,450,450),(3,171,450,450),(3,183,400,400),(3,185,450,450),(3,197,450,450),(3,202,450,450),(3,228,400,400),(3,313,300,300),(3,315,300,300),(3,333,450,450),(3,415,1,1),(3,613,400,400),(3,673,300,300),(3,754,400,400),(3,755,450,450),(3,759,300,300),(3,762,300,300),(3,769,400,400),(3,773,450,450),(3,777,400,400),(3,778,400,400),(4,43,400,400),(4,44,400,400),(4,55,400,400),(4,95,400,400),(4,98,300,300),(4,109,300,300),(4,111,300,300),(4,113,300,300),(4,115,300,300),(4,118,400,400),(4,126,400,400),(4,129,270,300),(4,137,300,300),(4,138,300,300),(4,139,300,300),(4,140,300,300),(4,141,300,300),(4,162,400,400),(4,172,400,400),(4,183,400,400),(4,229,400,400),(4,293,1,1),(4,313,300,300),(4,315,300,300),(4,413,1,1),(4,414,1,1),(4,415,1,1),(4,673,300,300),(4,759,300,300),(4,762,150,150),(4,770,400,400),(4,771,400,400),(4,772,400,400),(4,777,400,400),(4,778,400,400);
/*!40000 ALTER TABLE `character_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_social`
--

DROP TABLE IF EXISTS `character_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_social` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `friend` int unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Global Unique Identifier',
  `flags` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Flags',
  `note` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Friend Note',
  PRIMARY KEY (`guid`,`friend`,`flags`),
  KEY `friend` (`friend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_social`
--

LOCK TABLES `character_social` WRITE;
/*!40000 ALTER TABLE `character_social` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_spell`
--

DROP TABLE IF EXISTS `character_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_spell` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` int unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `specMask` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_spell`
--

LOCK TABLES `character_spell` WRITE;
/*!40000 ALTER TABLE `character_spell` DISABLE KEYS */;
INSERT INTO `character_spell` VALUES (1,5,255),(1,196,255),(1,197,255),(1,265,255),(1,465,255),(1,498,255),(1,633,255),(1,639,255),(1,642,255),(1,643,255),(1,647,255),(1,668,255),(1,670,255),(1,671,255),(1,672,255),(1,750,255),(1,814,255),(1,815,255),(1,816,255),(1,817,255),(1,853,255),(1,879,255),(1,1022,255),(1,1026,255),(1,1032,255),(1,1038,255),(1,1042,255),(1,1044,255),(1,1152,255),(1,1908,255),(1,2800,255),(1,2812,255),(1,3127,255),(1,3472,255),(1,4987,255),(1,5502,255),(1,5588,255),(1,5589,255),(1,5599,255),(1,5614,255),(1,5615,255),(1,6560,255),(1,6940,255),(1,7294,255),(1,7328,255),(1,7340,255),(1,7341,255),(1,7482,255),(1,8295,255),(1,10073,255),(1,10278,255),(1,10290,255),(1,10291,255),(1,10292,255),(1,10293,255),(1,10298,255),(1,10299,255),(1,10300,255),(1,10301,255),(1,10308,255),(1,10310,255),(1,10312,255),(1,10313,255),(1,10314,255),(1,10318,255),(1,10322,255),(1,10324,255),(1,10326,255),(1,10328,255),(1,10329,255),(1,11821,255),(1,13819,255),(1,17737,255),(1,18209,255),(1,18210,255),(1,18389,255),(1,19740,255),(1,19742,255),(1,19746,255),(1,19750,255),(1,19752,255),(1,19834,255),(1,19835,255),(1,19836,255),(1,19837,255),(1,19838,255),(1,19850,255),(1,19852,255),(1,19853,255),(1,19854,255),(1,19876,255),(1,19888,255),(1,19891,255),(1,19895,255),(1,19896,255),(1,19897,255),(1,19898,255),(1,19899,255),(1,19900,255),(1,19901,255),(1,19939,255),(1,19940,255),(1,19941,255),(1,19942,255),(1,19943,255),(1,20066,1),(1,20116,255),(1,20164,255),(1,20165,255),(1,20166,255),(1,20217,255),(1,20271,255),(1,20375,1),(1,20772,255),(1,20773,255),(1,20911,1),(1,20922,255),(1,20923,255),(1,20924,255),(1,23214,255),(1,23789,255),(1,24239,255),(1,24274,255),(1,24275,255),(1,25290,255),(1,25291,255),(1,25292,255),(1,25565,255),(1,25780,255),(1,25782,255),(1,25894,255),(1,25898,255),(1,25899,1),(1,25916,255),(1,25918,255),(1,26368,255),(1,26573,255),(1,27135,255),(1,27136,255),(1,27137,255),(1,27138,255),(1,27139,255),(1,27140,255),(1,27141,255),(1,27142,255),(1,27143,255),(1,27149,255),(1,27150,255),(1,27151,255),(1,27152,255),(1,27153,255),(1,27154,255),(1,27173,255),(1,27180,255),(1,27254,255),(1,27255,255),(1,27258,255),(1,27261,255),(1,29932,255),(1,31789,255),(1,31821,1),(1,31842,1),(1,31884,255),(1,32223,255),(1,33153,255),(1,33388,255),(1,33391,255),(1,34090,255),(1,34091,255),(1,34767,255),(1,34769,255),(1,35182,255),(1,35395,1),(1,35886,255),(1,35912,255),(1,36356,255),(1,38505,255),(1,38734,255),(1,39258,255),(1,45645,255),(1,45646,255),(1,45647,255),(1,45648,255),(1,45649,255),(1,45650,255),(1,45659,255),(1,45813,255),(1,48781,255),(1,48782,255),(1,48784,255),(1,48785,255),(1,48788,255),(1,48800,255),(1,48801,255),(1,48805,255),(1,48806,255),(1,48816,255),(1,48817,255),(1,48818,255),(1,48819,255),(1,48931,255),(1,48932,255),(1,48933,255),(1,48934,255),(1,48935,255),(1,48936,255),(1,48937,255),(1,48938,255),(1,48941,255),(1,48942,255),(1,48943,255),(1,48945,255),(1,48947,255),(1,48949,255),(1,48950,255),(1,53385,1),(1,53407,255),(1,53408,255),(1,53563,1),(1,53595,1),(1,53600,255),(1,53601,255),(1,53736,255),(1,54043,255),(1,54197,255),(1,54428,255),(1,60116,255),(1,61230,255),(1,61411,255),(1,61447,255),(1,62124,255),(1,64205,1),(3,5,255),(3,17,255),(3,139,255),(3,265,255),(3,453,255),(3,527,255),(3,528,255),(3,552,255),(3,586,255),(3,588,255),(3,589,255),(3,591,255),(3,592,255),(3,594,255),(3,596,255),(3,598,255),(3,600,255),(3,602,255),(3,605,255),(3,669,255),(3,670,255),(3,671,255),(3,672,255),(3,724,1),(3,813,255),(3,814,255),(3,815,255),(3,816,255),(3,817,255),(3,970,255),(3,976,255),(3,984,255),(3,988,255),(3,992,255),(3,996,255),(3,1004,255),(3,1006,255),(3,1243,255),(3,1244,255),(3,1245,255),(3,1706,255),(3,1908,255),(3,2006,255),(3,2010,255),(3,2018,255),(3,2052,255),(3,2053,255),(3,2054,255),(3,2055,255),(3,2060,255),(3,2061,255),(3,2096,255),(3,2108,255),(3,2153,255),(3,2158,255),(3,2159,255),(3,2160,255),(3,2161,255),(3,2162,255),(3,2163,255),(3,2164,255),(3,2165,255),(3,2166,255),(3,2167,255),(3,2168,255),(3,2169,255),(3,2259,255),(3,2331,255),(3,2332,255),(3,2333,255),(3,2334,255),(3,2335,255),(3,2336,255),(3,2337,255),(3,2385,255),(3,2386,255),(3,2389,255),(3,2392,255),(3,2393,255),(3,2394,255),(3,2395,255),(3,2396,255),(3,2397,255),(3,2399,255),(3,2401,255),(3,2402,255),(3,2403,255),(3,2406,255),(3,2539,255),(3,2541,255),(3,2542,255),(3,2543,255),(3,2544,255),(3,2545,255),(3,2546,255),(3,2547,255),(3,2548,255),(3,2549,255),(3,2550,255),(3,2661,255),(3,2662,255),(3,2664,255),(3,2665,255),(3,2666,255),(3,2667,255),(3,2668,255),(3,2670,255),(3,2671,255),(3,2672,255),(3,2673,255),(3,2674,255),(3,2675,255),(3,2737,255),(3,2738,255),(3,2739,255),(3,2740,255),(3,2741,255),(3,2742,255),(3,2767,255),(3,2791,255),(3,2795,255),(3,2944,255),(3,2964,255),(3,3100,255),(3,3101,255),(3,3102,255),(3,3104,255),(3,3116,255),(3,3117,255),(3,3170,255),(3,3171,255),(3,3172,255),(3,3173,255),(3,3174,255),(3,3175,255),(3,3176,255),(3,3177,255),(3,3188,255),(3,3230,255),(3,3273,255),(3,3274,255),(3,3276,255),(3,3277,255),(3,3278,255),(3,3292,255),(3,3293,255),(3,3294,255),(3,3295,255),(3,3296,255),(3,3297,255),(3,3319,255),(3,3320,255),(3,3321,255),(3,3323,255),(3,3324,255),(3,3325,255),(3,3326,255),(3,3328,255),(3,3330,255),(3,3331,255),(3,3333,255),(3,3334,255),(3,3336,255),(3,3337,255),(3,3370,255),(3,3371,255),(3,3372,255),(3,3373,255),(3,3376,255),(3,3377,255),(3,3397,255),(3,3398,255),(3,3399,255),(3,3400,255),(3,3413,255),(3,3447,255),(3,3448,255),(3,3449,255),(3,3450,255),(3,3451,255),(3,3452,255),(3,3453,255),(3,3454,255),(3,3464,255),(3,3491,255),(3,3492,255),(3,3493,255),(3,3494,255),(3,3495,255),(3,3496,255),(3,3497,255),(3,3498,255),(3,3500,255),(3,3501,255),(3,3502,255),(3,3503,255),(3,3504,255),(3,3505,255),(3,3506,255),(3,3507,255),(3,3508,255),(3,3511,255),(3,3513,255),(3,3515,255),(3,3538,255),(3,3747,255),(3,3753,255),(3,3755,255),(3,3756,255),(3,3757,255),(3,3758,255),(3,3759,255),(3,3760,255),(3,3761,255),(3,3762,255),(3,3763,255),(3,3764,255),(3,3765,255),(3,3766,255),(3,3767,255),(3,3768,255),(3,3769,255),(3,3770,255),(3,3771,255),(3,3772,255),(3,3773,255),(3,3774,255),(3,3775,255),(3,3776,255),(3,3777,255),(3,3778,255),(3,3779,255),(3,3780,255),(3,3811,255),(3,3813,255),(3,3816,255),(3,3817,255),(3,3818,255),(3,3839,255),(3,3840,255),(3,3841,255),(3,3842,255),(3,3843,255),(3,3844,255),(3,3845,255),(3,3847,255),(3,3848,255),(3,3849,255),(3,3850,255),(3,3851,255),(3,3852,255),(3,3854,255),(3,3855,255),(3,3856,255),(3,3857,255),(3,3858,255),(3,3859,255),(3,3860,255),(3,3861,255),(3,3862,255),(3,3863,255),(3,3864,255),(3,3865,255),(3,3866,255),(3,3868,255),(3,3869,255),(3,3870,255),(3,3871,255),(3,3872,255),(3,3873,255),(3,3908,255),(3,3909,255),(3,3910,255),(3,3914,255),(3,3922,255),(3,3923,255),(3,3924,255),(3,3925,255),(3,3926,255),(3,3928,255),(3,3929,255),(3,3930,255),(3,3931,255),(3,3932,255),(3,3933,255),(3,3934,255),(3,3936,255),(3,3937,255),(3,3938,255),(3,3939,255),(3,3940,255),(3,3941,255),(3,3942,255),(3,3944,255),(3,3945,255),(3,3946,255),(3,3947,255),(3,3949,255),(3,3950,255),(3,3952,255),(3,3953,255),(3,3954,255),(3,3955,255),(3,3956,255),(3,3957,255),(3,3958,255),(3,3959,255),(3,3960,255),(3,3961,255),(3,3962,255),(3,3963,255),(3,3965,255),(3,3966,255),(3,3967,255),(3,3968,255),(3,3969,255),(3,3971,255),(3,3972,255),(3,3973,255),(3,3977,255),(3,3978,255),(3,3979,255),(3,4036,255),(3,4037,255),(3,4038,255),(3,4094,255),(3,4096,255),(3,4097,255),(3,4508,255),(3,4942,255),(3,5244,255),(3,6060,255),(3,6063,255),(3,6064,255),(3,6065,255),(3,6066,255),(3,6074,255),(3,6075,255),(3,6076,255),(3,6077,255),(3,6078,255),(3,6346,255),(3,6412,255),(3,6413,255),(3,6414,255),(3,6415,255),(3,6416,255),(3,6417,255),(3,6418,255),(3,6419,255),(3,6458,255),(3,6499,255),(3,6500,255),(3,6501,255),(3,6517,255),(3,6518,255),(3,6521,255),(3,6560,255),(3,6617,255),(3,6618,255),(3,6624,255),(3,6661,255),(3,6686,255),(3,6688,255),(3,6690,255),(3,6692,255),(3,6693,255),(3,6695,255),(3,6702,255),(3,6703,255),(3,6704,255),(3,6705,255),(3,7128,255),(3,7133,255),(3,7135,255),(3,7147,255),(3,7149,255),(3,7151,255),(3,7153,255),(3,7156,255),(3,7179,255),(3,7181,255),(3,7213,255),(3,7221,255),(3,7222,255),(3,7223,255),(3,7224,255),(3,7255,255),(3,7256,255),(3,7257,255),(3,7258,255),(3,7259,255),(3,7340,255),(3,7341,255),(3,7408,255),(3,7411,255),(3,7412,255),(3,7413,255),(3,7420,255),(3,7426,255),(3,7430,255),(3,7443,255),(3,7454,255),(3,7457,255),(3,7482,255),(3,7623,255),(3,7624,255),(3,7629,255),(3,7630,255),(3,7633,255),(3,7636,255),(3,7639,255),(3,7643,255),(3,7745,255),(3,7748,255),(3,7751,255),(3,7752,255),(3,7753,255),(3,7754,255),(3,7755,255),(3,7766,255),(3,7771,255),(3,7776,255),(3,7779,255),(3,7782,255),(3,7786,255),(3,7788,255),(3,7793,255),(3,7795,255),(3,7817,255),(3,7818,255),(3,7827,255),(3,7828,255),(3,7836,255),(3,7837,255),(3,7841,255),(3,7845,255),(3,7857,255),(3,7859,255),(3,7861,255),(3,7863,255),(3,7867,255),(3,7892,255),(3,7893,255),(3,7924,255),(3,7928,255),(3,7929,255),(3,7934,255),(3,7935,255),(3,7953,255),(3,7954,255),(3,7955,255),(3,8092,255),(3,8102,255),(3,8103,255),(3,8104,255),(3,8105,255),(3,8106,255),(3,8122,255),(3,8124,255),(3,8129,255),(3,8238,255),(3,8240,255),(3,8243,255),(3,8295,255),(3,8322,255),(3,8334,255),(3,8339,255),(3,8366,255),(3,8367,255),(3,8368,255),(3,8465,255),(3,8467,255),(3,8483,255),(3,8489,255),(3,8607,255),(3,8758,255),(3,8760,255),(3,8762,255),(3,8764,255),(3,8766,255),(3,8768,255),(3,8770,255),(3,8772,255),(3,8774,255),(3,8776,255),(3,8778,255),(3,8780,255),(3,8782,255),(3,8784,255),(3,8786,255),(3,8789,255),(3,8791,255),(3,8793,255),(3,8795,255),(3,8797,255),(3,8799,255),(3,8802,255),(3,8804,255),(3,8880,255),(3,8895,255),(3,9060,255),(3,9062,255),(3,9064,255),(3,9065,255),(3,9068,255),(3,9070,255),(3,9072,255),(3,9074,255),(3,9145,255),(3,9146,255),(3,9147,255),(3,9148,255),(3,9149,255),(3,9193,255),(3,9194,255),(3,9195,255),(3,9196,255),(3,9197,255),(3,9198,255),(3,9201,255),(3,9202,255),(3,9206,255),(3,9207,255),(3,9208,255),(3,9269,255),(3,9271,255),(3,9273,255),(3,9472,255),(3,9473,255),(3,9474,255),(3,9484,255),(3,9485,255),(3,9513,255),(3,9785,255),(3,9787,255),(3,9788,255),(3,9811,255),(3,9813,255),(3,9814,255),(3,9818,255),(3,9820,255),(3,9916,255),(3,9918,255),(3,9920,255),(3,9921,255),(3,9926,255),(3,9928,255),(3,9931,255),(3,9933,255),(3,9935,255),(3,9937,255),(3,9939,255),(3,9942,255),(3,9945,255),(3,9950,255),(3,9952,255),(3,9954,255),(3,9957,255),(3,9959,255),(3,9961,255),(3,9964,255),(3,9966,255),(3,9968,255),(3,9970,255),(3,9972,255),(3,9974,255),(3,9979,255),(3,9980,255),(3,9983,255),(3,9985,255),(3,9986,255),(3,9987,255),(3,9993,255),(3,9995,255),(3,9997,255),(3,10001,255),(3,10003,255),(3,10005,255),(3,10007,255),(3,10009,255),(3,10011,255),(3,10013,255),(3,10015,255),(3,10073,255),(3,10482,255),(3,10487,255),(3,10490,255),(3,10499,255),(3,10507,255),(3,10509,255),(3,10511,255),(3,10516,255),(3,10518,255),(3,10520,255),(3,10525,255),(3,10529,255),(3,10531,255),(3,10533,255),(3,10542,255),(3,10544,255),(3,10546,255),(3,10548,255),(3,10550,255),(3,10552,255),(3,10554,255),(3,10556,255),(3,10558,255),(3,10560,255),(3,10562,255),(3,10564,255),(3,10566,255),(3,10568,255),(3,10570,255),(3,10572,255),(3,10574,255),(3,10619,255),(3,10621,255),(3,10630,255),(3,10632,255),(3,10647,255),(3,10650,255),(3,10656,255),(3,10658,255),(3,10660,255),(3,10662,255),(3,10840,255),(3,10841,255),(3,10846,255),(3,10880,255),(3,10881,255),(3,10888,255),(3,10890,255),(3,10892,255),(3,10893,255),(3,10894,255),(3,10898,255),(3,10899,255),(3,10900,255),(3,10901,255),(3,10909,255),(3,10915,255),(3,10916,255),(3,10917,255),(3,10927,255),(3,10928,255),(3,10929,255),(3,10933,255),(3,10934,255),(3,10937,255),(3,10938,255),(3,10945,255),(3,10946,255),(3,10947,255),(3,10951,255),(3,10952,255),(3,10955,255),(3,10957,255),(3,10958,255),(3,10960,255),(3,10961,255),(3,10963,255),(3,10964,255),(3,10965,255),(3,11448,255),(3,11449,255),(3,11450,255),(3,11451,255),(3,11452,255),(3,11453,255),(3,11454,255),(3,11456,255),(3,11457,255),(3,11458,255),(3,11459,255),(3,11460,255),(3,11461,255),(3,11464,255),(3,11465,255),(3,11466,255),(3,11467,255),(3,11468,255),(3,11472,255),(3,11473,255),(3,11476,255),(3,11477,255),(3,11478,255),(3,11479,255),(3,11480,255),(3,11611,255),(3,11643,255),(3,11821,255),(3,12045,255),(3,12046,255),(3,12047,255),(3,12048,255),(3,12049,255),(3,12050,255),(3,12052,255),(3,12053,255),(3,12055,255),(3,12056,255),(3,12059,255),(3,12060,255),(3,12061,255),(3,12062,255),(3,12063,255),(3,12064,255),(3,12065,255),(3,12066,255),(3,12067,255),(3,12068,255),(3,12069,255),(3,12070,255),(3,12071,255),(3,12072,255),(3,12073,255),(3,12074,255),(3,12075,255),(3,12076,255),(3,12077,255),(3,12078,255),(3,12079,255),(3,12080,255),(3,12081,255),(3,12082,255),(3,12083,255),(3,12084,255),(3,12085,255),(3,12086,255),(3,12087,255),(3,12088,255),(3,12089,255),(3,12090,255),(3,12091,255),(3,12092,255),(3,12093,255),(3,12180,255),(3,12259,255),(3,12584,255),(3,12585,255),(3,12586,255),(3,12587,255),(3,12589,255),(3,12590,255),(3,12591,255),(3,12594,255),(3,12595,255),(3,12596,255),(3,12597,255),(3,12599,255),(3,12603,255),(3,12607,255),(3,12609,255),(3,12614,255),(3,12615,255),(3,12616,255),(3,12617,255),(3,12618,255),(3,12619,255),(3,12620,255),(3,12621,255),(3,12622,255),(3,12624,255),(3,12656,255),(3,12715,255),(3,12716,255),(3,12717,255),(3,12718,255),(3,12720,255),(3,12722,255),(3,12754,255),(3,12755,255),(3,12758,255),(3,12759,255),(3,12760,255),(3,12895,255),(3,12897,255),(3,12899,255),(3,12900,255),(3,12902,255),(3,12903,255),(3,12904,255),(3,12905,255),(3,12906,255),(3,12907,255),(3,12908,255),(3,13028,255),(3,13240,255),(3,13378,255),(3,13380,255),(3,13419,255),(3,13421,255),(3,13464,255),(3,13485,255),(3,13501,255),(3,13503,255),(3,13522,255),(3,13529,255),(3,13536,255),(3,13538,255),(3,13607,255),(3,13612,255),(3,13617,255),(3,13620,255),(3,13622,255),(3,13626,255),(3,13628,255),(3,13631,255),(3,13635,255),(3,13637,255),(3,13640,255),(3,13642,255),(3,13644,255),(3,13646,255),(3,13648,255),(3,13653,255),(3,13655,255),(3,13657,255),(3,13659,255),(3,13661,255),(3,13663,255),(3,13687,255),(3,13689,255),(3,13693,255),(3,13695,255),(3,13698,255),(3,13700,255),(3,13702,255),(3,13746,255),(3,13794,255),(3,13815,255),(3,13817,255),(3,13822,255),(3,13836,255),(3,13841,255),(3,13846,255),(3,13858,255),(3,13868,255),(3,13882,255),(3,13887,255),(3,13890,255),(3,13898,255),(3,13905,255),(3,13915,255),(3,13917,255),(3,13920,255),(3,13931,255),(3,13933,255),(3,13935,255),(3,13937,255),(3,13939,255),(3,13941,255),(3,13943,255),(3,13945,255),(3,13947,255),(3,13948,255),(3,14293,255),(3,14379,255),(3,14380,255),(3,14751,1),(3,14752,255),(3,14807,255),(3,14809,255),(3,14810,255),(3,14818,255),(3,14819,255),(3,14914,255),(3,14930,255),(3,14932,255),(3,15237,255),(3,15255,255),(3,15261,255),(3,15262,255),(3,15263,255),(3,15264,255),(3,15265,255),(3,15266,255),(3,15267,255),(3,15286,1),(3,15292,255),(3,15293,255),(3,15294,255),(3,15295,255),(3,15296,255),(3,15407,1),(3,15430,255),(3,15431,255),(3,15473,1),(3,15596,255),(3,15628,255),(3,15633,255),(3,15833,255),(3,15853,255),(3,15855,255),(3,15856,255),(3,15861,255),(3,15863,255),(3,15865,255),(3,15906,255),(3,15910,255),(3,15915,255),(3,15933,255),(3,15935,255),(3,15972,255),(3,15973,255),(3,16056,255),(3,16639,255),(3,16640,255),(3,16641,255),(3,16642,255),(3,16643,255),(3,16644,255),(3,16645,255),(3,16646,255),(3,16647,255),(3,16648,255),(3,16649,255),(3,16650,255),(3,16651,255),(3,16652,255),(3,16653,255),(3,16654,255),(3,16655,255),(3,16656,255),(3,16657,255),(3,16658,255),(3,16659,255),(3,16660,255),(3,16661,255),(3,16662,255),(3,16663,255),(3,16664,255),(3,16665,255),(3,16667,255),(3,16724,255),(3,16725,255),(3,16726,255),(3,16728,255),(3,16729,255),(3,16730,255),(3,16731,255),(3,16732,255),(3,16741,255),(3,16742,255),(3,16744,255),(3,16745,255),(3,16746,255),(3,16960,255),(3,16965,255),(3,16967,255),(3,16969,255),(3,16970,255),(3,16971,255),(3,16973,255),(3,16978,255),(3,16980,255),(3,16983,255),(3,16984,255),(3,16985,255),(3,16986,255),(3,16987,255),(3,16988,255),(3,16990,255),(3,16991,255),(3,16992,255),(3,16993,255),(3,16994,255),(3,16995,255),(3,17039,255),(3,17040,255),(3,17041,255),(3,17180,255),(3,17181,255),(3,17187,255),(3,17311,1),(3,17312,1),(3,17313,1),(3,17314,1),(3,17551,255),(3,17552,255),(3,17553,255),(3,17554,255),(3,17555,255),(3,17556,255),(3,17557,255),(3,17559,255),(3,17560,255),(3,17561,255),(3,17562,255),(3,17563,255),(3,17564,255),(3,17565,255),(3,17566,255),(3,17570,255),(3,17571,255),(3,17572,255),(3,17573,255),(3,17574,255),(3,17575,255),(3,17576,255),(3,17577,255),(3,17578,255),(3,17579,255),(3,17580,255),(3,17632,255),(3,17634,255),(3,17635,255),(3,17636,255),(3,17637,255),(3,17638,255),(3,17737,255),(3,18209,255),(3,18210,255),(3,18238,255),(3,18239,255),(3,18240,255),(3,18241,255),(3,18242,255),(3,18243,255),(3,18244,255),(3,18245,255),(3,18246,255),(3,18247,255),(3,18260,255),(3,18389,255),(3,18401,255),(3,18402,255),(3,18403,255),(3,18404,255),(3,18405,255),(3,18406,255),(3,18407,255),(3,18408,255),(3,18409,255),(3,18410,255),(3,18411,255),(3,18412,255),(3,18413,255),(3,18414,255),(3,18415,255),(3,18416,255),(3,18417,255),(3,18418,255),(3,18419,255),(3,18420,255),(3,18421,255),(3,18422,255),(3,18423,255),(3,18424,255),(3,18434,255),(3,18436,255),(3,18437,255),(3,18438,255),(3,18439,255),(3,18440,255),(3,18441,255),(3,18442,255),(3,18444,255),(3,18445,255),(3,18446,255),(3,18447,255),(3,18448,255),(3,18449,255),(3,18450,255),(3,18451,255),(3,18452,255),(3,18453,255),(3,18454,255),(3,18455,255),(3,18456,255),(3,18457,255),(3,18458,255),(3,18560,255),(3,18629,255),(3,18630,255),(3,18807,1),(3,19047,255),(3,19048,255),(3,19049,255),(3,19050,255),(3,19051,255),(3,19052,255),(3,19053,255),(3,19054,255),(3,19055,255),(3,19058,255),(3,19059,255),(3,19060,255),(3,19061,255),(3,19062,255),(3,19063,255),(3,19064,255),(3,19065,255),(3,19066,255),(3,19067,255),(3,19068,255),(3,19070,255),(3,19071,255),(3,19072,255),(3,19073,255),(3,19074,255),(3,19075,255),(3,19076,255),(3,19077,255),(3,19078,255),(3,19079,255),(3,19080,255),(3,19081,255),(3,19082,255),(3,19083,255),(3,19084,255),(3,19085,255),(3,19086,255),(3,19087,255),(3,19088,255),(3,19089,255),(3,19090,255),(3,19091,255),(3,19092,255),(3,19093,255),(3,19094,255),(3,19095,255),(3,19097,255),(3,19098,255),(3,19100,255),(3,19101,255),(3,19102,255),(3,19103,255),(3,19104,255),(3,19106,255),(3,19107,255),(3,19236,1),(3,19238,1),(3,19240,1),(3,19241,1),(3,19242,1),(3,19243,1),(3,19276,255),(3,19277,255),(3,19278,255),(3,19279,255),(3,19280,255),(3,19435,255),(3,19567,255),(3,19666,255),(3,19667,255),(3,19668,255),(3,19669,255),(3,19788,255),(3,19790,255),(3,19791,255),(3,19792,255),(3,19793,255),(3,19794,255),(3,19795,255),(3,19796,255),(3,19799,255),(3,19800,255),(3,19814,255),(3,19815,255),(3,19819,255),(3,19825,255),(3,19830,255),(3,19831,255),(3,19833,255),(3,19901,255),(3,20008,255),(3,20009,255),(3,20010,255),(3,20011,255),(3,20012,255),(3,20013,255),(3,20014,255),(3,20015,255),(3,20016,255),(3,20017,255),(3,20020,255),(3,20023,255),(3,20024,255),(3,20025,255),(3,20026,255),(3,20028,255),(3,20029,255),(3,20030,255),(3,20031,255),(3,20032,255),(3,20033,255),(3,20034,255),(3,20035,255),(3,20036,255),(3,20051,255),(3,20201,255),(3,20219,255),(3,20222,255),(3,20626,255),(3,20648,255),(3,20649,255),(3,20650,255),(3,20770,255),(3,20848,255),(3,20849,255),(3,20853,255),(3,20854,255),(3,20855,255),(3,20872,255),(3,20873,255),(3,20874,255),(3,20876,255),(3,20890,255),(3,20897,255),(3,20916,255),(3,21143,255),(3,21144,255),(3,21161,255),(3,21175,255),(3,21562,255),(3,21564,255),(3,21913,255),(3,21923,255),(3,21931,255),(3,21940,255),(3,21943,255),(3,21945,255),(3,22331,255),(3,22480,255),(3,22704,255),(3,22711,255),(3,22727,255),(3,22732,255),(3,22749,255),(3,22750,255),(3,22757,255),(3,22759,255),(3,22761,255),(3,22793,255),(3,22795,255),(3,22797,255),(3,22808,255),(3,22813,255),(3,22815,255),(3,22866,255),(3,22867,255),(3,22868,255),(3,22869,255),(3,22870,255),(3,22902,255),(3,22921,255),(3,22922,255),(3,22923,255),(3,22926,255),(3,22927,255),(3,22928,255),(3,23066,255),(3,23067,255),(3,23068,255),(3,23069,255),(3,23070,255),(3,23071,255),(3,23077,255),(3,23078,255),(3,23079,255),(3,23080,255),(3,23081,255),(3,23082,255),(3,23096,255),(3,23129,255),(3,23190,255),(3,23399,255),(3,23486,255),(3,23489,255),(3,23507,255),(3,23628,255),(3,23629,255),(3,23632,255),(3,23633,255),(3,23636,255),(3,23637,255),(3,23638,255),(3,23639,255),(3,23650,255),(3,23652,255),(3,23653,255),(3,23662,255),(3,23663,255),(3,23664,255),(3,23665,255),(3,23666,255),(3,23667,255),(3,23703,255),(3,23704,255),(3,23705,255),(3,23706,255),(3,23707,255),(3,23708,255),(3,23709,255),(3,23710,255),(3,23787,255),(3,23789,255),(3,23799,255),(3,23800,255),(3,23801,255),(3,23802,255),(3,23803,255),(3,23804,255),(3,24091,255),(3,24092,255),(3,24093,255),(3,24121,255),(3,24122,255),(3,24123,255),(3,24124,255),(3,24125,255),(3,24136,255),(3,24137,255),(3,24138,255),(3,24139,255),(3,24140,255),(3,24141,255),(3,24266,255),(3,24356,255),(3,24357,255),(3,24365,255),(3,24366,255),(3,24367,255),(3,24368,255),(3,24399,255),(3,24418,255),(3,24654,255),(3,24655,255),(3,24703,255),(3,24801,255),(3,24846,255),(3,24847,255),(3,24848,255),(3,24849,255),(3,24850,255),(3,24851,255),(3,24901,255),(3,24902,255),(3,24903,255),(3,24912,255),(3,24913,255),(3,24914,255),(3,24940,255),(3,25072,255),(3,25073,255),(3,25074,255),(3,25078,255),(3,25079,255),(3,25080,255),(3,25081,255),(3,25082,255),(3,25083,255),(3,25084,255),(3,25086,255),(3,25124,255),(3,25125,255),(3,25126,255),(3,25127,255),(3,25128,255),(3,25129,255),(3,25130,255),(3,25146,255),(3,25210,255),(3,25213,255),(3,25217,255),(3,25218,255),(3,25221,255),(3,25222,255),(3,25229,255),(3,25230,255),(3,25233,255),(3,25235,255),(3,25278,255),(3,25280,255),(3,25283,255),(3,25284,255),(3,25287,255),(3,25305,255),(3,25308,255),(3,25312,255),(3,25314,255),(3,25315,255),(3,25316,255),(3,25317,255),(3,25318,255),(3,25320,255),(3,25321,255),(3,25323,255),(3,25331,255),(3,25339,255),(3,25363,255),(3,25364,255),(3,25367,255),(3,25368,255),(3,25372,255),(3,25375,255),(3,25384,255),(3,25387,1),(3,25389,255),(3,25392,255),(3,25431,255),(3,25433,255),(3,25435,255),(3,25437,1),(3,25467,255),(3,25490,255),(3,25498,255),(3,25565,255),(3,25610,255),(3,25612,255),(3,25613,255),(3,25614,255),(3,25615,255),(3,25617,255),(3,25618,255),(3,25619,255),(3,25620,255),(3,25621,255),(3,25622,255),(3,25659,255),(3,25704,255),(3,25954,255),(3,26011,255),(3,26085,255),(3,26086,255),(3,26087,255),(3,26277,255),(3,26279,255),(3,26368,255),(3,26403,255),(3,26407,255),(3,26416,255),(3,26417,255),(3,26418,255),(3,26420,255),(3,26421,255),(3,26422,255),(3,26423,255),(3,26424,255),(3,26425,255),(3,26426,255),(3,26427,255),(3,26428,255),(3,26442,255),(3,26443,255),(3,26656,255),(3,26745,255),(3,26746,255),(3,26747,255),(3,26749,255),(3,26750,255),(3,26751,255),(3,26752,255),(3,26753,255),(3,26754,255),(3,26755,255),(3,26756,255),(3,26757,255),(3,26758,255),(3,26759,255),(3,26760,255),(3,26761,255),(3,26762,255),(3,26763,255),(3,26764,255),(3,26765,255),(3,26770,255),(3,26771,255),(3,26772,255),(3,26773,255),(3,26774,255),(3,26775,255),(3,26776,255),(3,26777,255),(3,26778,255),(3,26779,255),(3,26780,255),(3,26781,255),(3,26782,255),(3,26783,255),(3,26784,255),(3,26790,255),(3,26797,255),(3,26798,255),(3,26801,255),(3,26872,255),(3,26873,255),(3,26874,255),(3,26875,255),(3,26876,255),(3,26878,255),(3,26880,255),(3,26881,255),(3,26882,255),(3,26883,255),(3,26885,255),(3,26887,255),(3,26896,255),(3,26897,255),(3,26900,255),(3,26902,255),(3,26903,255),(3,26906,255),(3,26907,255),(3,26908,255),(3,26909,255),(3,26910,255),(3,26911,255),(3,26912,255),(3,26914,255),(3,26915,255),(3,26916,255),(3,26918,255),(3,26920,255),(3,26926,255),(3,26927,255),(3,26928,255),(3,27028,255),(3,27032,255),(3,27033,255),(3,27254,255),(3,27255,255),(3,27258,255),(3,27261,255),(3,27585,255),(3,27586,255),(3,27587,255),(3,27588,255),(3,27589,255),(3,27590,255),(3,27658,255),(3,27659,255),(3,27660,255),(3,27681,255),(3,27683,255),(3,27724,255),(3,27725,255),(3,27799,255),(3,27800,255),(3,27801,255),(3,27829,255),(3,27830,255),(3,27832,255),(3,27837,255),(3,27841,255),(3,27870,1),(3,27871,1),(3,27899,255),(3,27905,255),(3,27906,255),(3,27911,255),(3,27913,255),(3,27914,255),(3,27917,255),(3,27920,255),(3,27924,255),(3,27926,255),(3,27927,255),(3,27944,255),(3,27945,255),(3,27946,255),(3,27947,255),(3,27948,255),(3,27950,255),(3,27951,255),(3,27954,255),(3,27957,255),(3,27958,255),(3,27960,255),(3,27961,255),(3,27962,255),(3,27967,255),(3,27968,255),(3,27971,255),(3,27972,255),(3,27975,255),(3,27977,255),(3,27981,255),(3,27982,255),(3,27984,255),(3,28003,255),(3,28004,255),(3,28016,255),(3,28019,255),(3,28021,255),(3,28022,255),(3,28027,255),(3,28028,255),(3,28029,255),(3,28205,255),(3,28207,255),(3,28208,255),(3,28209,255),(3,28210,255),(3,28219,255),(3,28220,255),(3,28221,255),(3,28222,255),(3,28223,255),(3,28224,255),(3,28242,255),(3,28243,255),(3,28244,255),(3,28267,255),(3,28275,1),(3,28327,255),(3,28461,255),(3,28462,255),(3,28463,255),(3,28472,255),(3,28473,255),(3,28474,255),(3,28480,255),(3,28481,255),(3,28482,255),(3,28543,255),(3,28544,255),(3,28545,255),(3,28546,255),(3,28549,255),(3,28550,255),(3,28551,255),(3,28552,255),(3,28553,255),(3,28554,255),(3,28555,255),(3,28556,255),(3,28557,255),(3,28558,255),(3,28562,255),(3,28563,255),(3,28564,255),(3,28565,255),(3,28566,255),(3,28567,255),(3,28568,255),(3,28569,255),(3,28570,255),(3,28571,255),(3,28572,255),(3,28573,255),(3,28575,255),(3,28576,255),(3,28577,255),(3,28578,255),(3,28579,255),(3,28580,255),(3,28581,255),(3,28582,255),(3,28583,255),(3,28584,255),(3,28585,255),(3,28586,255),(3,28587,255),(3,28588,255),(3,28589,255),(3,28590,255),(3,28591,255),(3,28596,255),(3,28672,255),(3,28675,255),(3,28677,255),(3,28894,255),(3,28895,255),(3,28897,255),(3,28903,255),(3,28905,255),(3,28906,255),(3,28907,255),(3,28910,255),(3,28912,255),(3,28914,255),(3,28915,255),(3,28916,255),(3,28917,255),(3,28918,255),(3,28924,255),(3,28925,255),(3,28927,255),(3,28933,255),(3,28936,255),(3,28938,255),(3,28944,255),(3,28947,255),(3,28948,255),(3,28950,255),(3,28953,255),(3,28955,255),(3,28957,255),(3,29545,255),(3,29547,255),(3,29548,255),(3,29549,255),(3,29550,255),(3,29551,255),(3,29552,255),(3,29553,255),(3,29556,255),(3,29557,255),(3,29558,255),(3,29565,255),(3,29566,255),(3,29568,255),(3,29569,255),(3,29571,255),(3,29603,255),(3,29605,255),(3,29606,255),(3,29608,255),(3,29610,255),(3,29611,255),(3,29613,255),(3,29614,255),(3,29615,255),(3,29616,255),(3,29617,255),(3,29619,255),(3,29620,255),(3,29621,255),(3,29622,255),(3,29628,255),(3,29629,255),(3,29630,255),(3,29642,255),(3,29643,255),(3,29645,255),(3,29648,255),(3,29649,255),(3,29654,255),(3,29656,255),(3,29657,255),(3,29658,255),(3,29662,255),(3,29663,255),(3,29664,255),(3,29668,255),(3,29669,255),(3,29671,255),(3,29672,255),(3,29688,255),(3,29692,255),(3,29693,255),(3,29694,255),(3,29695,255),(3,29696,255),(3,29697,255),(3,29698,255),(3,29699,255),(3,29700,255),(3,29728,255),(3,29729,255),(3,29844,255),(3,29932,255),(3,30303,255),(3,30304,255),(3,30305,255),(3,30306,255),(3,30307,255),(3,30308,255),(3,30309,255),(3,30310,255),(3,30311,255),(3,30312,255),(3,30313,255),(3,30314,255),(3,30315,255),(3,30316,255),(3,30317,255),(3,30318,255),(3,30325,255),(3,30329,255),(3,30332,255),(3,30334,255),(3,30337,255),(3,30341,255),(3,30342,255),(3,30343,255),(3,30344,255),(3,30346,255),(3,30347,255),(3,30348,255),(3,30349,255),(3,30350,255),(3,30547,255),(3,30548,255),(3,30549,255),(3,30551,255),(3,30552,255),(3,30556,255),(3,30558,255),(3,30560,255),(3,30561,255),(3,30563,255),(3,30565,255),(3,30566,255),(3,30568,255),(3,30569,255),(3,30570,255),(3,30573,255),(3,30574,255),(3,30575,255),(3,31048,255),(3,31049,255),(3,31050,255),(3,31051,255),(3,31052,255),(3,31053,255),(3,31054,255),(3,31055,255),(3,31056,255),(3,31057,255),(3,31058,255),(3,31060,255),(3,31061,255),(3,31062,255),(3,31063,255),(3,31064,255),(3,31065,255),(3,31066,255),(3,31067,255),(3,31068,255),(3,31070,255),(3,31071,255),(3,31072,255),(3,31076,255),(3,31077,255),(3,31078,255),(3,31079,255),(3,31080,255),(3,31081,255),(3,31082,255),(3,31083,255),(3,31084,255),(3,31085,255),(3,31087,255),(3,31088,255),(3,31089,255),(3,31090,255),(3,31091,255),(3,31092,255),(3,31094,255),(3,31095,255),(3,31096,255),(3,31097,255),(3,31098,255),(3,31099,255),(3,31100,255),(3,31101,255),(3,31102,255),(3,31103,255),(3,31104,255),(3,31105,255),(3,31106,255),(3,31107,255),(3,31108,255),(3,31109,255),(3,31110,255),(3,31111,255),(3,31112,255),(3,31113,255),(3,31149,255),(3,31252,255),(3,31373,255),(3,31430,255),(3,31431,255),(3,31432,255),(3,31433,255),(3,31434,255),(3,31435,255),(3,31437,255),(3,31438,255),(3,31440,255),(3,31441,255),(3,31442,255),(3,31443,255),(3,31444,255),(3,31448,255),(3,31449,255),(3,31450,255),(3,31451,255),(3,31452,255),(3,31453,255),(3,31454,255),(3,31455,255),(3,31456,255),(3,31459,255),(3,31460,255),(3,31461,255),(3,32178,255),(3,32179,255),(3,32284,255),(3,32285,255),(3,32375,255),(3,32379,255),(3,32454,255),(3,32455,255),(3,32456,255),(3,32457,255),(3,32458,255),(3,32461,255),(3,32462,255),(3,32463,255),(3,32464,255),(3,32465,255),(3,32466,255),(3,32467,255),(3,32468,255),(3,32469,255),(3,32470,255),(3,32471,255),(3,32472,255),(3,32473,255),(3,32478,255),(3,32479,255),(3,32480,255),(3,32481,255),(3,32482,255),(3,32485,255),(3,32487,255),(3,32488,255),(3,32489,255),(3,32490,255),(3,32493,255),(3,32494,255),(3,32495,255),(3,32496,255),(3,32497,255),(3,32498,255),(3,32499,255),(3,32500,255),(3,32501,255),(3,32502,255),(3,32503,255),(3,32546,255),(3,32549,255),(3,32655,255),(3,32656,255),(3,32657,255),(3,32664,255),(3,32665,255),(3,32667,255),(3,32765,255),(3,32766,255),(3,32801,255),(3,32807,255),(3,32808,255),(3,32809,255),(3,32810,255),(3,32814,255),(3,32866,255),(3,32867,255),(3,32868,255),(3,32869,255),(3,32870,255),(3,32871,255),(3,32872,255),(3,32873,255),(3,32874,255),(3,32996,255),(3,32999,255),(3,33076,255),(3,33153,255),(3,33206,1),(3,33276,255),(3,33277,255),(3,33278,255),(3,33279,255),(3,33284,255),(3,33285,255),(3,33286,255),(3,33287,255),(3,33288,255),(3,33289,255),(3,33290,255),(3,33291,255),(3,33292,255),(3,33293,255),(3,33294,255),(3,33295,255),(3,33296,255),(3,33359,255),(3,33388,255),(3,33391,255),(3,33732,255),(3,33733,255),(3,33738,255),(3,33740,255),(3,33741,255),(3,33990,255),(3,33991,255),(3,33992,255),(3,33993,255),(3,33994,255),(3,33995,255),(3,33996,255),(3,33997,255),(3,33999,255),(3,34001,255),(3,34002,255),(3,34003,255),(3,34004,255),(3,34005,255),(3,34006,255),(3,34007,255),(3,34008,255),(3,34009,255),(3,34010,255),(3,34069,255),(3,34090,255),(3,34091,255),(3,34433,255),(3,34529,255),(3,34530,255),(3,34533,255),(3,34534,255),(3,34535,255),(3,34537,255),(3,34538,255),(3,34540,255),(3,34541,255),(3,34542,255),(3,34543,255),(3,34544,255),(3,34545,255),(3,34546,255),(3,34547,255),(3,34548,255),(3,34590,255),(3,34607,255),(3,34608,255),(3,34861,1),(3,34863,1),(3,34864,1),(3,34865,1),(3,34866,1),(3,34914,1),(3,34916,1),(3,34917,1),(3,34955,255),(3,34959,255),(3,34960,255),(3,34961,255),(3,34979,255),(3,34981,255),(3,34982,255),(3,34983,255),(3,35182,255),(3,35520,255),(3,35521,255),(3,35522,255),(3,35523,255),(3,35524,255),(3,35525,255),(3,35526,255),(3,35527,255),(3,35528,255),(3,35529,255),(3,35530,255),(3,35531,255),(3,35532,255),(3,35533,255),(3,35534,255),(3,35535,255),(3,35536,255),(3,35537,255),(3,35538,255),(3,35539,255),(3,35540,255),(3,35543,255),(3,35544,255),(3,35549,255),(3,35554,255),(3,35555,255),(3,35557,255),(3,35558,255),(3,35559,255),(3,35560,255),(3,35561,255),(3,35562,255),(3,35563,255),(3,35564,255),(3,35567,255),(3,35568,255),(3,35572,255),(3,35573,255),(3,35574,255),(3,35575,255),(3,35576,255),(3,35577,255),(3,35580,255),(3,35582,255),(3,35584,255),(3,35585,255),(3,35587,255),(3,35588,255),(3,35589,255),(3,35590,255),(3,35591,255),(3,35886,255),(3,35912,255),(3,36074,255),(3,36075,255),(3,36076,255),(3,36077,255),(3,36078,255),(3,36079,255),(3,36122,255),(3,36124,255),(3,36125,255),(3,36126,255),(3,36128,255),(3,36129,255),(3,36130,255),(3,36131,255),(3,36133,255),(3,36134,255),(3,36135,255),(3,36136,255),(3,36137,255),(3,36210,255),(3,36256,255),(3,36257,255),(3,36258,255),(3,36259,255),(3,36260,255),(3,36261,255),(3,36262,255),(3,36263,255),(3,36315,255),(3,36316,255),(3,36317,255),(3,36318,255),(3,36349,255),(3,36351,255),(3,36352,255),(3,36353,255),(3,36355,255),(3,36356,255),(3,36357,255),(3,36358,255),(3,36359,255),(3,36389,255),(3,36390,255),(3,36391,255),(3,36392,255),(3,36523,255),(3,36524,255),(3,36525,255),(3,36526,255),(3,36665,255),(3,36667,255),(3,36668,255),(3,36669,255),(3,36670,255),(3,36672,255),(3,36686,255),(3,36954,255),(3,36955,255),(3,37818,255),(3,37836,255),(3,37855,255),(3,37873,255),(3,37882,255),(3,37883,255),(3,37884,255),(3,38068,255),(3,38070,255),(3,38175,255),(3,38473,255),(3,38475,255),(3,38476,255),(3,38477,255),(3,38478,255),(3,38479,255),(3,38503,255),(3,38504,255),(3,38505,255),(3,38734,255),(3,38867,255),(3,38868,255),(3,38960,255),(3,38961,255),(3,38962,255),(3,39258,255),(3,39374,255),(3,39451,255),(3,39452,255),(3,39455,255),(3,39458,255),(3,39462,255),(3,39463,255),(3,39466,255),(3,39467,255),(3,39470,255),(3,39471,255),(3,39636,255),(3,39637,255),(3,39638,255),(3,39639,255),(3,39705,255),(3,39706,255),(3,39710,255),(3,39711,255),(3,39712,255),(3,39713,255),(3,39714,255),(3,39715,255),(3,39716,255),(3,39717,255),(3,39718,255),(3,39719,255),(3,39720,255),(3,39721,255),(3,39722,255),(3,39723,255),(3,39724,255),(3,39725,255),(3,39727,255),(3,39728,255),(3,39729,255),(3,39730,255),(3,39731,255),(3,39732,255),(3,39733,255),(3,39734,255),(3,39735,255),(3,39736,255),(3,39737,255),(3,39738,255),(3,39739,255),(3,39740,255),(3,39741,255),(3,39742,255),(3,39895,255),(3,39961,255),(3,39963,255),(3,39971,255),(3,39973,255),(3,39997,255),(3,40001,255),(3,40002,255),(3,40003,255),(3,40004,255),(3,40005,255),(3,40006,255),(3,40020,255),(3,40021,255),(3,40023,255),(3,40024,255),(3,40033,255),(3,40034,255),(3,40035,255),(3,40036,255),(3,40060,255),(3,40192,255),(3,40514,255),(3,41132,255),(3,41133,255),(3,41134,255),(3,41135,255),(3,41156,255),(3,41157,255),(3,41158,255),(3,41160,255),(3,41161,255),(3,41162,255),(3,41163,255),(3,41164,255),(3,41205,255),(3,41206,255),(3,41207,255),(3,41208,255),(3,41307,255),(3,41320,255),(3,41321,255),(3,41414,255),(3,41415,255),(3,41418,255),(3,41420,255),(3,41429,255),(3,41458,255),(3,41500,255),(3,41501,255),(3,41502,255),(3,41503,255),(3,42296,255),(3,42302,255),(3,42305,255),(3,42546,255),(3,42558,255),(3,42588,255),(3,42589,255),(3,42590,255),(3,42591,255),(3,42592,255),(3,42593,255),(3,42613,255),(3,42615,255),(3,42620,255),(3,42662,255),(3,42688,255),(3,42731,255),(3,42736,255),(3,42974,255),(3,43493,255),(3,43549,255),(3,43676,255),(3,43688,255),(3,43707,255),(3,43758,255),(3,43761,255),(3,43765,255),(3,43772,255),(3,43779,255),(3,43846,255),(3,44155,255),(3,44157,255),(3,44343,255),(3,44344,255),(3,44359,255),(3,44383,255),(3,44391,255),(3,44483,255),(3,44484,255),(3,44488,255),(3,44489,255),(3,44492,255),(3,44494,255),(3,44500,255),(3,44506,255),(3,44508,255),(3,44509,255),(3,44510,255),(3,44513,255),(3,44524,255),(3,44528,255),(3,44529,255),(3,44555,255),(3,44556,255),(3,44575,255),(3,44576,255),(3,44582,255),(3,44584,255),(3,44588,255),(3,44589,255),(3,44590,255),(3,44591,255),(3,44592,255),(3,44593,255),(3,44595,255),(3,44596,255),(3,44598,255),(3,44612,255),(3,44616,255),(3,44621,255),(3,44623,255),(3,44625,255),(3,44629,255),(3,44630,255),(3,44631,255),(3,44633,255),(3,44635,255),(3,44636,255),(3,44645,255),(3,44768,255),(3,44770,255),(3,44794,255),(3,44950,255),(3,44953,255),(3,44958,255),(3,44970,255),(3,45022,255),(3,45061,255),(3,45100,255),(3,45117,255),(3,45357,255),(3,45358,255),(3,45359,255),(3,45360,255),(3,45361,255),(3,45363,255),(3,45542,255),(3,45545,255),(3,45546,255),(3,45549,255),(3,45550,255),(3,45551,255),(3,45552,255),(3,45553,255),(3,45554,255),(3,45555,255),(3,45556,255),(3,45557,255),(3,45558,255),(3,45559,255),(3,45560,255),(3,45561,255),(3,45562,255),(3,45563,255),(3,45564,255),(3,45565,255),(3,45566,255),(3,45567,255),(3,45568,255),(3,45569,255),(3,45570,255),(3,45571,255),(3,45645,255),(3,45646,255),(3,45647,255),(3,45648,255),(3,45649,255),(3,45650,255),(3,45659,255),(3,45695,255),(3,45765,255),(3,45813,255),(3,46108,255),(3,46111,255),(3,46122,255),(3,46123,255),(3,46124,255),(3,46125,255),(3,46126,255),(3,46127,255),(3,46128,255),(3,46129,255),(3,46130,255),(3,46131,255),(3,46132,255),(3,46133,255),(3,46134,255),(3,46135,255),(3,46136,255),(3,46137,255),(3,46138,255),(3,46139,255),(3,46140,255),(3,46141,255),(3,46142,255),(3,46144,255),(3,46403,255),(3,46404,255),(3,46405,255),(3,46578,255),(3,46594,255),(3,46597,255),(3,46601,255),(3,46684,255),(3,46688,255),(3,46697,255),(3,46775,255),(3,46776,255),(3,46777,255),(3,46778,255),(3,46779,255),(3,46803,255),(3,47046,255),(3,47048,255),(3,47049,255),(3,47050,255),(3,47051,255),(3,47053,255),(3,47054,255),(3,47055,255),(3,47056,255),(3,47280,255),(3,47540,1),(3,47585,1),(3,47672,255),(3,47766,255),(3,47788,1),(3,47898,255),(3,47899,255),(3,47900,255),(3,47901,255),(3,48040,255),(3,48045,255),(3,48062,255),(3,48063,255),(3,48065,255),(3,48066,255),(3,48067,255),(3,48068,255),(3,48070,255),(3,48071,255),(3,48072,255),(3,48073,255),(3,48074,255),(3,48077,255),(3,48078,255),(3,48086,1),(3,48087,1),(3,48088,1),(3,48089,1),(3,48112,255),(3,48113,255),(3,48119,255),(3,48120,255),(3,48121,255),(3,48122,255),(3,48123,255),(3,48124,255),(3,48125,255),(3,48126,255),(3,48127,255),(3,48134,255),(3,48135,255),(3,48155,1),(3,48156,1),(3,48157,255),(3,48158,255),(3,48159,1),(3,48160,1),(3,48161,255),(3,48162,255),(3,48168,255),(3,48169,255),(3,48170,255),(3,48171,255),(3,48172,1),(3,48173,1),(3,48247,255),(3,48248,255),(3,48299,255),(3,48300,255),(3,48789,255),(3,49677,255),(3,50194,255),(3,50598,255),(3,50599,255),(3,50600,255),(3,50601,255),(3,50602,255),(3,50603,255),(3,50604,255),(3,50605,255),(3,50606,255),(3,50607,255),(3,50608,255),(3,50609,255),(3,50610,255),(3,50611,255),(3,50612,255),(3,50614,255),(3,50616,255),(3,50617,255),(3,50618,255),(3,50619,255),(3,50620,255),(3,50644,255),(3,50647,255),(3,50936,255),(3,50938,255),(3,50939,255),(3,50940,255),(3,50941,255),(3,50942,255),(3,50943,255),(3,50944,255),(3,50945,255),(3,50946,255),(3,50947,255),(3,50948,255),(3,50949,255),(3,50950,255),(3,50951,255),(3,50952,255),(3,50953,255),(3,50954,255),(3,50955,255),(3,50956,255),(3,50957,255),(3,50958,255),(3,50959,255),(3,50960,255),(3,50961,255),(3,50962,255),(3,50963,255),(3,50964,255),(3,50965,255),(3,50966,255),(3,50967,255),(3,50970,255),(3,50971,255),(3,51296,255),(3,51300,255),(3,51302,255),(3,51304,255),(3,51306,255),(3,51309,255),(3,51311,255),(3,51313,255),(3,51568,255),(3,51569,255),(3,51570,255),(3,51571,255),(3,51572,255),(3,52175,255),(3,52567,255),(3,52568,255),(3,52569,255),(3,52570,255),(3,52571,255),(3,52572,255),(3,52733,255),(3,52739,255),(3,52840,255),(3,52843,255),(3,53005,1),(3,53006,1),(3,53007,1),(3,53023,255),(3,53042,255),(3,53056,255),(3,53281,255),(3,53462,255),(3,53771,255),(3,53773,255),(3,53774,255),(3,53775,255),(3,53776,255),(3,53777,255),(3,53779,255),(3,53780,255),(3,53781,255),(3,53782,255),(3,53783,255),(3,53784,255),(3,53812,255),(3,53830,255),(3,53831,255),(3,53832,255),(3,53834,255),(3,53835,255),(3,53836,255),(3,53837,255),(3,53838,255),(3,53839,255),(3,53840,255),(3,53841,255),(3,53842,255),(3,53843,255),(3,53844,255),(3,53845,255),(3,53847,255),(3,53848,255),(3,53852,255),(3,53853,255),(3,53854,255),(3,53855,255),(3,53856,255),(3,53857,255),(3,53859,255),(3,53860,255),(3,53861,255),(3,53862,255),(3,53863,255),(3,53864,255),(3,53865,255),(3,53866,255),(3,53867,255),(3,53868,255),(3,53869,255),(3,53870,255),(3,53871,255),(3,53872,255),(3,53873,255),(3,53874,255),(3,53875,255),(3,53876,255),(3,53877,255),(3,53878,255),(3,53879,255),(3,53880,255),(3,53881,255),(3,53882,255),(3,53883,255),(3,53884,255),(3,53885,255),(3,53886,255),(3,53887,255),(3,53888,255),(3,53889,255),(3,53890,255),(3,53891,255),(3,53892,255),(3,53893,255),(3,53894,255),(3,53895,255),(3,53898,255),(3,53899,255),(3,53900,255),(3,53901,255),(3,53902,255),(3,53903,255),(3,53904,255),(3,53905,255),(3,53916,255),(3,53917,255),(3,53918,255),(3,53919,255),(3,53920,255),(3,53921,255),(3,53922,255),(3,53923,255),(3,53924,255),(3,53925,255),(3,53926,255),(3,53927,255),(3,53928,255),(3,53929,255),(3,53930,255),(3,53931,255),(3,53932,255),(3,53933,255),(3,53934,255),(3,53936,255),(3,53937,255),(3,53938,255),(3,53939,255),(3,53940,255),(3,53941,255),(3,53942,255),(3,53943,255),(3,53945,255),(3,53946,255),(3,53947,255),(3,53948,255),(3,53949,255),(3,53950,255),(3,53951,255),(3,53952,255),(3,53953,255),(3,53954,255),(3,53955,255),(3,53956,255),(3,53957,255),(3,53958,255),(3,53959,255),(3,53960,255),(3,53961,255),(3,53962,255),(3,53963,255),(3,53964,255),(3,53965,255),(3,53966,255),(3,53967,255),(3,53968,255),(3,53969,255),(3,53970,255),(3,53971,255),(3,53972,255),(3,53973,255),(3,53974,255),(3,53975,255),(3,53976,255),(3,53977,255),(3,53978,255),(3,53979,255),(3,53980,255),(3,53981,255),(3,53982,255),(3,53983,255),(3,53984,255),(3,53985,255),(3,53986,255),(3,53987,255),(3,53988,255),(3,53989,255),(3,53990,255),(3,53991,255),(3,53992,255),(3,53993,255),(3,53994,255),(3,53995,255),(3,53996,255),(3,53997,255),(3,53998,255),(3,54000,255),(3,54001,255),(3,54002,255),(3,54003,255),(3,54004,255),(3,54005,255),(3,54006,255),(3,54007,255),(3,54008,255),(3,54009,255),(3,54010,255),(3,54011,255),(3,54012,255),(3,54013,255),(3,54014,255),(3,54017,255),(3,54019,255),(3,54020,255),(3,54023,255),(3,54197,255),(3,54213,255),(3,54218,255),(3,54220,255),(3,54221,255),(3,54222,255),(3,54353,255),(3,54550,255),(3,54551,255),(3,54552,255),(3,54553,255),(3,54554,255),(3,54555,255),(3,54556,255),(3,54557,255),(3,54736,255),(3,54793,255),(3,54917,255),(3,54918,255),(3,54941,255),(3,54944,255),(3,54945,255),(3,54946,255),(3,54947,255),(3,54948,255),(3,54949,255),(3,54978,255),(3,54979,255),(3,54980,255),(3,54981,255),(3,54998,255),(3,54999,255),(3,55002,255),(3,55013,255),(3,55014,255),(3,55015,255),(3,55016,255),(3,55017,255),(3,55055,255),(3,55056,255),(3,55057,255),(3,55058,255),(3,55174,255),(3,55177,255),(3,55179,255),(3,55181,255),(3,55182,255),(3,55183,255),(3,55184,255),(3,55185,255),(3,55186,255),(3,55187,255),(3,55199,255),(3,55200,255),(3,55201,255),(3,55202,255),(3,55203,255),(3,55204,255),(3,55206,255),(3,55243,255),(3,55252,255),(3,55298,255),(3,55300,255),(3,55301,255),(3,55302,255),(3,55303,255),(3,55304,255),(3,55305,255),(3,55306,255),(3,55307,255),(3,55308,255),(3,55309,255),(3,55310,255),(3,55311,255),(3,55312,255),(3,55369,255),(3,55370,255),(3,55371,255),(3,55372,255),(3,55373,255),(3,55374,255),(3,55375,255),(3,55376,255),(3,55377,255),(3,55384,255),(3,55386,255),(3,55387,255),(3,55388,255),(3,55389,255),(3,55390,255),(3,55392,255),(3,55393,255),(3,55394,255),(3,55395,255),(3,55396,255),(3,55397,255),(3,55398,255),(3,55399,255),(3,55400,255),(3,55401,255),(3,55402,255),(3,55403,255),(3,55404,255),(3,55405,255),(3,55407,255),(3,55534,255),(3,55628,255),(3,55641,255),(3,55642,255),(3,55656,255),(3,55732,255),(3,55769,255),(3,55777,255),(3,55834,255),(3,55835,255),(3,55839,255),(3,55898,255),(3,55899,255),(3,55900,255),(3,55901,255),(3,55902,255),(3,55903,255),(3,55904,255),(3,55906,255),(3,55907,255),(3,55908,255),(3,55910,255),(3,55911,255),(3,55913,255),(3,55914,255),(3,55919,255),(3,55920,255),(3,55921,255),(3,55922,255),(3,55923,255),(3,55924,255),(3,55925,255),(3,55941,255),(3,55943,255),(3,55993,255),(3,55994,255),(3,55995,255),(3,55996,255),(3,55997,255),(3,55998,255),(3,55999,255),(3,56000,255),(3,56001,255),(3,56002,255),(3,56003,255),(3,56004,255),(3,56005,255),(3,56006,255),(3,56007,255),(3,56008,255),(3,56009,255),(3,56010,255),(3,56011,255),(3,56014,255),(3,56015,255),(3,56016,255),(3,56017,255),(3,56018,255),(3,56019,255),(3,56020,255),(3,56021,255),(3,56022,255),(3,56023,255),(3,56024,255),(3,56025,255),(3,56026,255),(3,56027,255),(3,56028,255),(3,56029,255),(3,56030,255),(3,56031,255),(3,56034,255),(3,56039,255),(3,56048,255),(3,56049,255),(3,56052,255),(3,56053,255),(3,56054,255),(3,56055,255),(3,56056,255),(3,56074,255),(3,56076,255),(3,56077,255),(3,56079,255),(3,56081,255),(3,56083,255),(3,56084,255),(3,56085,255),(3,56086,255),(3,56087,255),(3,56088,255),(3,56089,255),(3,56193,255),(3,56194,255),(3,56195,255),(3,56196,255),(3,56197,255),(3,56199,255),(3,56201,255),(3,56202,255),(3,56203,255),(3,56205,255),(3,56206,255),(3,56208,255),(3,56234,255),(3,56273,255),(3,56280,255),(3,56349,255),(3,56357,255),(3,56400,255),(3,56459,255),(3,56460,255),(3,56461,255),(3,56462,255),(3,56463,255),(3,56464,255),(3,56465,255),(3,56466,255),(3,56467,255),(3,56468,255),(3,56469,255),(3,56470,255),(3,56471,255),(3,56472,255),(3,56473,255),(3,56474,255),(3,56475,255),(3,56476,255),(3,56477,255),(3,56478,255),(3,56479,255),(3,56484,255),(3,56496,255),(3,56497,255),(3,56498,255),(3,56499,255),(3,56500,255),(3,56501,255),(3,56514,255),(3,56519,255),(3,56530,255),(3,56531,255),(3,56549,255),(3,56550,255),(3,56551,255),(3,56552,255),(3,56553,255),(3,56554,255),(3,56555,255),(3,56556,255),(3,56943,255),(3,56944,255),(3,56945,255),(3,56946,255),(3,56947,255),(3,56948,255),(3,56949,255),(3,56950,255),(3,56951,255),(3,56952,255),(3,56953,255),(3,56954,255),(3,56955,255),(3,56956,255),(3,56957,255),(3,56958,255),(3,56959,255),(3,56960,255),(3,56961,255),(3,56963,255),(3,56965,255),(3,56968,255),(3,56971,255),(3,56972,255),(3,56973,255),(3,56974,255),(3,56975,255),(3,56976,255),(3,56977,255),(3,56978,255),(3,56979,255),(3,56980,255),(3,56981,255),(3,56982,255),(3,56983,255),(3,56984,255),(3,56985,255),(3,56986,255),(3,56987,255),(3,56988,255),(3,56989,255),(3,56990,255),(3,56991,255),(3,56994,255),(3,56995,255),(3,56996,255),(3,56997,255),(3,56998,255),(3,56999,255),(3,57000,255),(3,57001,255),(3,57002,255),(3,57003,255),(3,57004,255),(3,57005,255),(3,57006,255),(3,57007,255),(3,57008,255),(3,57009,255),(3,57010,255),(3,57011,255),(3,57012,255),(3,57013,255),(3,57014,255),(3,57019,255),(3,57020,255),(3,57021,255),(3,57022,255),(3,57023,255),(3,57024,255),(3,57025,255),(3,57026,255),(3,57027,255),(3,57028,255),(3,57029,255),(3,57030,255),(3,57031,255),(3,57032,255),(3,57033,255),(3,57034,255),(3,57035,255),(3,57036,255),(3,57112,255),(3,57113,255),(3,57114,255),(3,57115,255),(3,57116,255),(3,57117,255),(3,57119,255),(3,57120,255),(3,57121,255),(3,57122,255),(3,57123,255),(3,57124,255),(3,57125,255),(3,57126,255),(3,57127,255),(3,57128,255),(3,57129,255),(3,57130,255),(3,57131,255),(3,57132,255),(3,57133,255),(3,57151,255),(3,57152,255),(3,57153,255),(3,57154,255),(3,57155,255),(3,57156,255),(3,57157,255),(3,57158,255),(3,57159,255),(3,57160,255),(3,57161,255),(3,57162,255),(3,57163,255),(3,57164,255),(3,57165,255),(3,57166,255),(3,57167,255),(3,57168,255),(3,57169,255),(3,57170,255),(3,57172,255),(3,57181,255),(3,57183,255),(3,57184,255),(3,57185,255),(3,57186,255),(3,57187,255),(3,57188,255),(3,57189,255),(3,57190,255),(3,57191,255),(3,57192,255),(3,57193,255),(3,57194,255),(3,57195,255),(3,57196,255),(3,57197,255),(3,57198,255),(3,57199,255),(3,57200,255),(3,57201,255),(3,57202,255),(3,57207,255),(3,57208,255),(3,57209,255),(3,57210,255),(3,57211,255),(3,57212,255),(3,57213,255),(3,57214,255),(3,57215,255),(3,57216,255),(3,57217,255),(3,57218,255),(3,57219,255),(3,57220,255),(3,57221,255),(3,57222,255),(3,57223,255),(3,57224,255),(3,57225,255),(3,57226,255),(3,57227,255),(3,57228,255),(3,57229,255),(3,57230,255),(3,57231,255),(3,57232,255),(3,57233,255),(3,57234,255),(3,57235,255),(3,57236,255),(3,57237,255),(3,57238,255),(3,57239,255),(3,57240,255),(3,57241,255),(3,57242,255),(3,57243,255),(3,57244,255),(3,57245,255),(3,57246,255),(3,57247,255),(3,57248,255),(3,57249,255),(3,57250,255),(3,57251,255),(3,57252,255),(3,57253,255),(3,57257,255),(3,57258,255),(3,57259,255),(3,57260,255),(3,57261,255),(3,57262,255),(3,57263,255),(3,57264,255),(3,57265,255),(3,57266,255),(3,57267,255),(3,57268,255),(3,57269,255),(3,57270,255),(3,57271,255),(3,57272,255),(3,57273,255),(3,57274,255),(3,57275,255),(3,57276,255),(3,57277,255),(3,57421,255),(3,57423,255),(3,57425,255),(3,57427,255),(3,57433,255),(3,57434,255),(3,57435,255),(3,57436,255),(3,57437,255),(3,57438,255),(3,57439,255),(3,57440,255),(3,57441,255),(3,57442,255),(3,57443,255),(3,57690,255),(3,57691,255),(3,57692,255),(3,57694,255),(3,57696,255),(3,57699,255),(3,57701,255),(3,57703,255),(3,57704,255),(3,57706,255),(3,57707,255),(3,57708,255),(3,57709,255),(3,57710,255),(3,57711,255),(3,57712,255),(3,57713,255),(3,57714,255),(3,57715,255),(3,57716,255),(3,57719,255),(3,58065,255),(3,58141,255),(3,58142,255),(3,58143,255),(3,58144,255),(3,58145,255),(3,58146,255),(3,58147,255),(3,58148,255),(3,58149,255),(3,58150,255),(3,58286,255),(3,58287,255),(3,58288,255),(3,58289,255),(3,58296,255),(3,58297,255),(3,58298,255),(3,58299,255),(3,58300,255),(3,58301,255),(3,58302,255),(3,58303,255),(3,58305,255),(3,58306,255),(3,58307,255),(3,58308,255),(3,58310,255),(3,58311,255),(3,58312,255),(3,58313,255),(3,58314,255),(3,58315,255),(3,58316,255),(3,58317,255),(3,58318,255),(3,58319,255),(3,58320,255),(3,58321,255),(3,58322,255),(3,58323,255),(3,58324,255),(3,58325,255),(3,58326,255),(3,58327,255),(3,58328,255),(3,58329,255),(3,58330,255),(3,58331,255),(3,58332,255),(3,58333,255),(3,58336,255),(3,58337,255),(3,58338,255),(3,58339,255),(3,58340,255),(3,58341,255),(3,58342,255),(3,58343,255),(3,58344,255),(3,58345,255),(3,58346,255),(3,58347,255),(3,58472,255),(3,58473,255),(3,58476,255),(3,58478,255),(3,58480,255),(3,58481,255),(3,58482,255),(3,58483,255),(3,58484,255),(3,58485,255),(3,58486,255),(3,58487,255),(3,58488,255),(3,58489,255),(3,58490,255),(3,58491,255),(3,58492,255),(3,58507,255),(3,58512,255),(3,58521,255),(3,58523,255),(3,58525,255),(3,58527,255),(3,58528,255),(3,58565,255),(3,58868,255),(3,58871,255),(3,58954,255),(3,58983,255),(3,59315,255),(3,59326,255),(3,59338,255),(3,59339,255),(3,59340,255),(3,59387,255),(3,59390,255),(3,59405,255),(3,59406,255),(3,59436,255),(3,59438,255),(3,59440,255),(3,59441,255),(3,59442,255),(3,59475,255),(3,59478,255),(3,59480,255),(3,59484,255),(3,59486,255),(3,59487,255),(3,59488,255),(3,59489,255),(3,59490,255),(3,59491,255),(3,59493,255),(3,59494,255),(3,59495,255),(3,59496,255),(3,59497,255),(3,59498,255),(3,59499,255),(3,59500,255),(3,59501,255),(3,59502,255),(3,59503,255),(3,59504,255),(3,59559,255),(3,59560,255),(3,59561,255),(3,59582,255),(3,59583,255),(3,59584,255),(3,59585,255),(3,59586,255),(3,59587,255),(3,59588,255),(3,59589,255),(3,59619,255),(3,59621,255),(3,59625,255),(3,59636,255),(3,59759,255),(3,59791,255),(3,60114,255),(3,60336,255),(3,60337,255),(3,60350,255),(3,60354,255),(3,60355,255),(3,60356,255),(3,60357,255),(3,60365,255),(3,60366,255),(3,60367,255),(3,60396,255),(3,60403,255),(3,60405,255),(3,60583,255),(3,60584,255),(3,60599,255),(3,60600,255),(3,60601,255),(3,60604,255),(3,60605,255),(3,60606,255),(3,60607,255),(3,60608,255),(3,60609,255),(3,60611,255),(3,60613,255),(3,60616,255),(3,60619,255),(3,60620,255),(3,60621,255),(3,60622,255),(3,60623,255),(3,60624,255),(3,60627,255),(3,60629,255),(3,60630,255),(3,60631,255),(3,60637,255),(3,60640,255),(3,60643,255),(3,60645,255),(3,60647,255),(3,60649,255),(3,60651,255),(3,60652,255),(3,60653,255),(3,60655,255),(3,60658,255),(3,60660,255),(3,60663,255),(3,60665,255),(3,60666,255),(3,60668,255),(3,60669,255),(3,60671,255),(3,60691,255),(3,60692,255),(3,60697,255),(3,60702,255),(3,60703,255),(3,60704,255),(3,60705,255),(3,60706,255),(3,60707,255),(3,60711,255),(3,60712,255),(3,60714,255),(3,60715,255),(3,60716,255),(3,60718,255),(3,60720,255),(3,60721,255),(3,60723,255),(3,60725,255),(3,60727,255),(3,60728,255),(3,60729,255),(3,60730,255),(3,60731,255),(3,60732,255),(3,60734,255),(3,60735,255),(3,60737,255),(3,60743,255),(3,60746,255),(3,60747,255),(3,60748,255),(3,60749,255),(3,60750,255),(3,60751,255),(3,60752,255),(3,60754,255),(3,60755,255),(3,60756,255),(3,60757,255),(3,60758,255),(3,60759,255),(3,60760,255),(3,60761,255),(3,60763,255),(3,60767,255),(3,60874,255),(3,60893,255),(3,60969,255),(3,60971,255),(3,60990,255),(3,60993,255),(3,60994,255),(3,60996,255),(3,60997,255),(3,60998,255),(3,60999,255),(3,61000,255),(3,61002,255),(3,61008,255),(3,61009,255),(3,61010,255),(3,61117,255),(3,61118,255),(3,61119,255),(3,61120,255),(3,61177,255),(3,61229,255),(3,61288,255),(3,61425,255),(3,61471,255),(3,61677,255),(3,62044,255),(3,62045,255),(3,62049,255),(3,62050,255),(3,62051,255),(3,62162,255),(3,62176,255),(3,62177,255),(3,62202,255),(3,62213,255),(3,62242,255),(3,62256,255),(3,62257,255),(3,62350,255),(3,62409,255),(3,62410,255),(3,62448,255),(3,62941,255),(3,62948,255),(3,62959,255),(3,63182,255),(3,63187,255),(3,63188,255),(3,63189,255),(3,63190,255),(3,63191,255),(3,63192,255),(3,63194,255),(3,63195,255),(3,63196,255),(3,63197,255),(3,63198,255),(3,63199,255),(3,63200,255),(3,63201,255),(3,63203,255),(3,63204,255),(3,63205,255),(3,63206,255),(3,63732,255),(3,63742,255),(3,63743,255),(3,63746,255),(3,63750,255),(3,63765,255),(3,63770,255),(3,63924,255),(3,64044,1),(3,64051,255),(3,64053,255),(3,64054,255),(3,64246,255),(3,64247,255),(3,64248,255),(3,64249,255),(3,64250,255),(3,64251,255),(3,64252,255),(3,64253,255),(3,64254,255),(3,64255,255),(3,64256,255),(3,64257,255),(3,64258,255),(3,64259,255),(3,64260,255),(3,64261,255),(3,64262,255),(3,64266,255),(3,64267,255),(3,64268,255),(3,64270,255),(3,64271,255),(3,64273,255),(3,64274,255),(3,64275,255),(3,64276,255),(3,64277,255),(3,64278,255),(3,64279,255),(3,64280,255),(3,64281,255),(3,64282,255),(3,64283,255),(3,64284,255),(3,64285,255),(3,64286,255),(3,64287,255),(3,64288,255),(3,64289,255),(3,64291,255),(3,64294,255),(3,64295,255),(3,64296,255),(3,64297,255),(3,64298,255),(3,64299,255),(3,64300,255),(3,64302,255),(3,64303,255),(3,64304,255),(3,64305,255),(3,64307,255),(3,64308,255),(3,64309,255),(3,64310,255),(3,64311,255),(3,64312,255),(3,64313,255),(3,64314,255),(3,64315,255),(3,64316,255),(3,64317,255),(3,64318,255),(3,64358,255),(3,64441,255),(3,64579,255),(3,64661,255),(3,64725,255),(3,64726,255),(3,64727,255),(3,64728,255),(3,64729,255),(3,64730,255),(3,64843,255),(3,64901,255),(3,65245,255),(3,65454,255),(3,66034,255),(3,66035,255),(3,66036,255),(3,66037,255),(3,66038,255),(3,66338,255),(3,66428,255),(3,66429,255),(3,66430,255),(3,66431,255),(3,66432,255),(3,66433,255),(3,66434,255),(3,66435,255),(3,66436,255),(3,66437,255),(3,66438,255),(3,66439,255),(3,66440,255),(3,66441,255),(3,66442,255),(3,66443,255),(3,66444,255),(3,66445,255),(3,66446,255),(3,66447,255),(3,66448,255),(3,66449,255),(3,66450,255),(3,66451,255),(3,66452,255),(3,66453,255),(3,66497,255),(3,66498,255),(3,66499,255),(3,66500,255),(3,66501,255),(3,66502,255),(3,66503,255),(3,66504,255),(3,66505,255),(3,66506,255),(3,66553,255),(3,66554,255),(3,66555,255),(3,66556,255),(3,66557,255),(3,66558,255),(3,66559,255),(3,66560,255),(3,66561,255),(3,66562,255),(3,66563,255),(3,66564,255),(3,66565,255),(3,66566,255),(3,66567,255),(3,66568,255),(3,66569,255),(3,66570,255),(3,66571,255),(3,66572,255),(3,66573,255),(3,66574,255),(3,66575,255),(3,66576,255),(3,66577,255),(3,66578,255),(3,66579,255),(3,66580,255),(3,66581,255),(3,66582,255),(3,66583,255),(3,66584,255),(3,66585,255),(3,66586,255),(3,66587,255),(3,66658,255),(3,66659,255),(3,66660,255),(3,66662,255),(3,66663,255),(3,66664,255),(3,67025,255),(3,67064,255),(3,67065,255),(3,67066,255),(3,67079,255),(3,67080,255),(3,67081,255),(3,67082,255),(3,67083,255),(3,67084,255),(3,67085,255),(3,67086,255),(3,67087,255),(3,67091,255),(3,67092,255),(3,67093,255),(3,67094,255),(3,67095,255),(3,67096,255),(3,67130,255),(3,67131,255),(3,67132,255),(3,67133,255),(3,67134,255),(3,67135,255),(3,67136,255),(3,67137,255),(3,67138,255),(3,67139,255),(3,67140,255),(3,67141,255),(3,67142,255),(3,67143,255),(3,67144,255),(3,67145,255),(3,67146,255),(3,67147,255),(3,67326,255),(3,67600,255),(3,67790,255),(3,67839,255),(3,67920,255),(3,68067,255),(3,68166,255),(3,68253,255),(3,69385,255),(3,69386,255),(3,69388,255),(3,69412,255),(3,70550,255),(3,70551,255),(3,70552,255),(3,70553,255),(3,70554,255),(3,70555,255),(3,70556,255),(3,70557,255),(3,70558,255),(3,70559,255),(3,70560,255),(3,70561,255),(3,70562,255),(3,70563,255),(3,70565,255),(3,70566,255),(3,70567,255),(3,70568,255),(3,71015,255),(3,71101,255),(3,71102,255),(3,71692,255),(3,72952,255),(3,72953,255),(3,75597,255),(4,669,255),(4,670,255),(4,672,255),(4,813,255),(4,814,255),(4,815,255),(4,816,255),(4,817,255),(4,3714,255),(4,7340,255),(4,7341,255),(4,17737,255),(4,29932,255),(4,33391,255),(4,42650,255),(4,43265,255),(4,45463,255),(4,45524,255),(4,45529,255),(4,46584,255),(4,47476,255),(4,47528,255),(4,47568,255),(4,48263,255),(4,48265,255),(4,48707,255),(4,48721,255),(4,48743,255),(4,48778,255),(4,48792,255),(4,48982,1),(4,49005,1),(4,49016,1),(4,49020,255),(4,49028,1),(4,49039,1),(4,49143,1),(4,49158,1),(4,49184,1),(4,49203,1),(4,49206,1),(4,49222,1),(4,49796,1),(4,49892,255),(4,49893,255),(4,49894,255),(4,49895,255),(4,49896,255),(4,49903,255),(4,49904,255),(4,49909,255),(4,49917,255),(4,49918,255),(4,49919,255),(4,49920,255),(4,49921,255),(4,49923,255),(4,49924,255),(4,49926,255),(4,49927,255),(4,49928,255),(4,49929,255),(4,49930,255),(4,49936,255),(4,49937,255),(4,49938,255),(4,49939,255),(4,49940,255),(4,49941,255),(4,49998,255),(4,49999,255),(4,50842,255),(4,50977,255),(4,51052,1),(4,51271,1),(4,51325,1),(4,51326,1),(4,51327,1),(4,51328,1),(4,51409,1),(4,51410,1),(4,51411,1),(4,51416,1),(4,51417,1),(4,51418,1),(4,51419,1),(4,51423,255),(4,51424,255),(4,51425,255),(4,53323,255),(4,53331,255),(4,53341,255),(4,53342,255),(4,53343,255),(4,53344,255),(4,54446,255),(4,54447,255),(4,55050,1),(4,55090,1),(4,55233,1),(4,55258,1),(4,55259,1),(4,55260,1),(4,55261,1),(4,55262,1),(4,55265,1),(4,55268,1),(4,55270,1),(4,55271,1),(4,56222,255),(4,56815,255),(4,57330,255),(4,57623,255),(4,61999,255),(4,62158,255),(4,63560,1),(4,70164,255);
/*!40000 ALTER TABLE `character_spell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_spell_cooldown`
--

DROP TABLE IF EXISTS `character_spell_cooldown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_spell_cooldown` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` int unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `category` int unsigned DEFAULT '0',
  `item` int unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  `time` int unsigned NOT NULL DEFAULT '0',
  `needSend` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_spell_cooldown`
--

LOCK TABLES `character_spell_cooldown` WRITE;
/*!40000 ALTER TABLE `character_spell_cooldown` DISABLE KEYS */;
INSERT INTO `character_spell_cooldown` VALUES (3,64843,0,0,1792554863,1);
/*!40000 ALTER TABLE `character_spell_cooldown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_stats`
--

DROP TABLE IF EXISTS `character_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_stats` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `maxhealth` int unsigned NOT NULL DEFAULT '0',
  `maxpower1` int unsigned NOT NULL DEFAULT '0',
  `maxpower2` int unsigned NOT NULL DEFAULT '0',
  `maxpower3` int unsigned NOT NULL DEFAULT '0',
  `maxpower4` int unsigned NOT NULL DEFAULT '0',
  `maxpower5` int unsigned NOT NULL DEFAULT '0',
  `maxpower6` int unsigned NOT NULL DEFAULT '0',
  `maxpower7` int unsigned NOT NULL DEFAULT '0',
  `strength` int unsigned NOT NULL DEFAULT '0',
  `agility` int unsigned NOT NULL DEFAULT '0',
  `stamina` int unsigned NOT NULL DEFAULT '0',
  `intellect` int unsigned NOT NULL DEFAULT '0',
  `spirit` int unsigned NOT NULL DEFAULT '0',
  `armor` int unsigned NOT NULL DEFAULT '0',
  `resHoly` int unsigned NOT NULL DEFAULT '0',
  `resFire` int unsigned NOT NULL DEFAULT '0',
  `resNature` int unsigned NOT NULL DEFAULT '0',
  `resFrost` int unsigned NOT NULL DEFAULT '0',
  `resShadow` int unsigned NOT NULL DEFAULT '0',
  `resArcane` int unsigned NOT NULL DEFAULT '0',
  `blockPct` float NOT NULL DEFAULT '0',
  `dodgePct` float NOT NULL DEFAULT '0',
  `parryPct` float NOT NULL DEFAULT '0',
  `critPct` float NOT NULL DEFAULT '0',
  `rangedCritPct` float NOT NULL DEFAULT '0',
  `spellCritPct` float NOT NULL DEFAULT '0',
  `attackPower` int unsigned NOT NULL DEFAULT '0',
  `rangedAttackPower` int unsigned NOT NULL DEFAULT '0',
  `spellPower` int unsigned NOT NULL DEFAULT '0',
  `resilience` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  CONSTRAINT `character_stats_chk_1` CHECK (((`blockPct` >= 0) and (`dodgePct` >= 0) and (`parryPct` >= 0) and (`critPct` >= 0) and (`rangedCritPct` >= 0) and (`spellCritPct` >= 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_stats`
--

LOCK TABLES `character_stats` WRITE;
/*!40000 ALTER TABLE `character_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_talent`
--

DROP TABLE IF EXISTS `character_talent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_talent` (
  `guid` int unsigned NOT NULL,
  `spell` int unsigned NOT NULL,
  `specMask` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_talent`
--

LOCK TABLES `character_talent` WRITE;
/*!40000 ALTER TABLE `character_talent` DISABLE KEYS */;
INSERT INTO `character_talent` VALUES (1,20045,1),(1,20057,1),(1,20064,1),(1,20066,1),(1,20100,1),(1,20105,1),(1,20113,1),(1,20121,1),(1,20135,1),(1,20140,1),(1,20147,1),(1,20175,1),(1,20182,1),(1,20198,1),(1,20208,1),(1,20215,1),(1,20235,1),(1,20239,1),(1,20245,1),(1,20256,1),(1,20261,1),(1,20266,1),(1,20332,1),(1,20337,1),(1,20361,1),(1,20375,1),(1,20470,1),(1,20488,1),(1,20911,1),(1,25829,1),(1,25836,1),(1,25957,1),(1,25988,1),(1,26016,1),(1,26023,1),(1,31821,1),(1,31823,1),(1,31826,1),(1,31830,1),(1,31836,1),(1,31841,1),(1,31842,1),(1,31849,1),(1,31852,1),(1,31860,1),(1,31868,1),(1,31869,1),(1,31872,1),(1,31878,1),(1,31881,1),(1,33776,1),(1,35395,1),(1,35397,1),(1,53376,1),(1,53382,1),(1,53385,1),(1,53488,1),(1,53503,1),(1,53519,1),(1,53530,1),(1,53553,1),(1,53557,1),(1,53563,1),(1,53585,1),(1,53592,1),(1,53595,1),(1,53648,1),(1,53661,1),(1,53696,1),(1,54155,1),(1,63650,1),(1,64205,1),(3,724,1),(3,14751,1),(3,14767,1),(3,14769,1),(3,14771,1),(3,14772,1),(3,14774,1),(3,14777,1),(3,14781,1),(3,14785,1),(3,14791,1),(3,15011,1),(3,15012,1),(3,15014,1),(3,15018,1),(3,15031,1),(3,15286,1),(3,15310,1),(3,15311,1),(3,15316,1),(3,15317,1),(3,15320,1),(3,15328,1),(3,15332,1),(3,15336,1),(3,15338,1),(3,15356,1),(3,15363,1),(3,15407,1),(3,15448,1),(3,15473,1),(3,17191,1),(3,17323,1),(3,18535,1),(3,18555,1),(3,19236,1),(3,20711,1),(3,27790,1),(3,27816,1),(3,27840,1),(3,27904,1),(3,33146,1),(3,33154,1),(3,33162,1),(3,33172,1),(3,33190,1),(3,33193,1),(3,33202,1),(3,33206,1),(3,33215,1),(3,33225,1),(3,33371,1),(3,34860,1),(3,34861,1),(3,34910,1),(3,34914,1),(3,45244,1),(3,47508,1),(3,47515,1),(3,47517,1),(3,47537,1),(3,47540,1),(3,47560,1),(3,47567,1),(3,47570,1),(3,47582,1),(3,47585,1),(3,47788,1),(3,51167,1),(3,52800,1),(3,52803,1),(3,57472,1),(3,63506,1),(3,63543,1),(3,63574,1),(3,63627,1),(3,63737,1),(3,64044,1),(3,64129,1),(4,48982,1),(4,49005,1),(4,49016,1),(4,49028,1),(4,49039,1),(4,49143,1),(4,49158,1),(4,49184,1),(4,49194,1),(4,49203,1),(4,49206,1),(4,49222,1),(4,49393,1),(4,49395,1),(4,49480,1),(4,49483,1),(4,49489,1),(4,49491,1),(4,49497,1),(4,49504,1),(4,49509,1),(4,49530,1),(4,49534,1),(4,49538,1),(4,49543,1),(4,49562,1),(4,49565,1),(4,49568,1),(4,49572,1),(4,49589,1),(4,49599,1),(4,49611,1),(4,49628,1),(4,49632,1),(4,49638,1),(4,49655,1),(4,49657,1),(4,49664,1),(4,49789,1),(4,49791,1),(4,49796,1),(4,50029,1),(4,50034,1),(4,50043,1),(4,50115,1),(4,50121,1),(4,50130,1),(4,50138,1),(4,50147,1),(4,50150,1),(4,50152,1),(4,50191,1),(4,50371,1),(4,50385,1),(4,50392,1),(4,50887,1),(4,51052,1),(4,51109,1),(4,51130,1),(4,51161,1),(4,51267,1),(4,51271,1),(4,51456,1),(4,51465,1),(4,51473,1),(4,51746,1),(4,52143,1),(4,53138,1),(4,54637,1),(4,55050,1),(4,55062,1),(4,55090,1),(4,55108,1),(4,55133,1),(4,55136,1),(4,55226,1),(4,55233,1),(4,55237,1),(4,55610,1),(4,55623,1),(4,55667,1),(4,56835,1),(4,59057,1),(4,61158,1),(4,62908,1),(4,63560,1),(4,66192,1),(4,66817,1);
/*!40000 ALTER TABLE `character_talent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `account` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `gender` tinyint unsigned NOT NULL DEFAULT '0',
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `xp` int unsigned NOT NULL DEFAULT '0',
  `money` int unsigned NOT NULL DEFAULT '0',
  `skin` tinyint unsigned NOT NULL DEFAULT '0',
  `face` tinyint unsigned NOT NULL DEFAULT '0',
  `hairStyle` tinyint unsigned NOT NULL DEFAULT '0',
  `hairColor` tinyint unsigned NOT NULL DEFAULT '0',
  `facialStyle` tinyint unsigned NOT NULL DEFAULT '0',
  `bankSlots` tinyint unsigned NOT NULL DEFAULT '0',
  `restState` tinyint unsigned NOT NULL DEFAULT '0',
  `playerFlags` int unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `map` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `instance_id` int unsigned NOT NULL DEFAULT '0',
  `instance_mode_mask` tinyint unsigned NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `taximask` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `online` tinyint unsigned NOT NULL DEFAULT '0',
  `cinematic` tinyint unsigned NOT NULL DEFAULT '0',
  `totaltime` int unsigned NOT NULL DEFAULT '0',
  `leveltime` int unsigned NOT NULL DEFAULT '0',
  `logout_time` int unsigned NOT NULL DEFAULT '0',
  `is_logout_resting` tinyint unsigned NOT NULL DEFAULT '0',
  `rest_bonus` float NOT NULL DEFAULT '0',
  `resettalents_cost` int unsigned NOT NULL DEFAULT '0',
  `resettalents_time` int unsigned NOT NULL DEFAULT '0',
  `trans_x` float NOT NULL DEFAULT '0',
  `trans_y` float NOT NULL DEFAULT '0',
  `trans_z` float NOT NULL DEFAULT '0',
  `trans_o` float NOT NULL DEFAULT '0',
  `transguid` int DEFAULT '0',
  `extra_flags` smallint unsigned NOT NULL DEFAULT '0',
  `stable_slots` tinyint unsigned NOT NULL DEFAULT '0',
  `at_login` smallint unsigned NOT NULL DEFAULT '0',
  `zone` smallint unsigned NOT NULL DEFAULT '0',
  `death_expire_time` int unsigned NOT NULL DEFAULT '0',
  `taxi_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `arenaPoints` int unsigned NOT NULL DEFAULT '0',
  `totalHonorPoints` int unsigned NOT NULL DEFAULT '0',
  `todayHonorPoints` int unsigned NOT NULL DEFAULT '0',
  `yesterdayHonorPoints` int unsigned NOT NULL DEFAULT '0',
  `totalKills` int unsigned NOT NULL DEFAULT '0',
  `todayKills` smallint unsigned NOT NULL DEFAULT '0',
  `yesterdayKills` smallint unsigned NOT NULL DEFAULT '0',
  `chosenTitle` int unsigned NOT NULL DEFAULT '0',
  `knownCurrencies` bigint unsigned NOT NULL DEFAULT '0',
  `watchedFaction` int unsigned NOT NULL DEFAULT '0',
  `drunk` tinyint unsigned NOT NULL DEFAULT '0',
  `health` int unsigned NOT NULL DEFAULT '0',
  `power1` int unsigned NOT NULL DEFAULT '0',
  `power2` int unsigned NOT NULL DEFAULT '0',
  `power3` int unsigned NOT NULL DEFAULT '0',
  `power4` int unsigned NOT NULL DEFAULT '0',
  `power5` int unsigned NOT NULL DEFAULT '0',
  `power6` int unsigned NOT NULL DEFAULT '0',
  `power7` int unsigned NOT NULL DEFAULT '0',
  `latency` int unsigned DEFAULT '0',
  `talentGroupsCount` tinyint unsigned NOT NULL DEFAULT '1',
  `activeTalentGroup` tinyint unsigned NOT NULL DEFAULT '0',
  `exploredZones` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `equipmentCache` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ammoId` int unsigned NOT NULL DEFAULT '0',
  `knownTitles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `actionBars` tinyint unsigned NOT NULL DEFAULT '0',
  `grantableLevels` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleteInfos_Account` int unsigned DEFAULT NULL,
  `deleteInfos_Name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleteDate` int unsigned DEFAULT NULL,
  `innTriggerId` int unsigned NOT NULL,
  `extraBonusTalentCount` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_account` (`account`),
  KEY `idx_online` (`online`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,1,'Jorney',10,2,0,80,0,674560868,2,7,7,6,6,0,2,40,1941.62,-4674.79,25.8088,1,0,0,1.89984,'0 0 131072 4 0 0 1048576 0 0 2097152 0 0 0 0 ',0,1,11061,9910,1792597501,1,0,0,0,0,0,0,0,0,1,0,0,1637,0,'',0,0,0,0,0,0,0,0,0,4294967295,0,37764,6244,0,0,100,0,0,0,0,1,0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 16384 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 512 0 0 0 0 0 0 0 0 0 268435456 8388608 32776 0 0 512 4194304 0 0 0 0 0 0 0 0 0 67108864 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','51476 0 51353 0 51479 0 0 0 51474 0 51362 0 51477 0 51363 0 51364 0 51475 0 51358 0 50622 0 50363 0 50706 0 51354 0 49623 0 0 0 51478 0 51534 0 0 0 0 0 0 0 0 0 ',0,'0 0 0 0 0 0 ',15,0,NULL,'2026-10-20 21:21:53',NULL,NULL,NULL,5327,0),(3,1,'Daniel',1,5,0,80,0,709656150,0,11,1,0,4,0,2,32,5802.76,628.909,647.437,571,0,0,2.222,'2 0 0 8 0 0 1048576 0 0 0 0 0 0 0 ',0,1,5259,5182,1792554682,1,0,0,0,0,0,0,0,0,64,0,0,4395,0,'',0,0,0,0,0,0,0,110,512,4294967295,0,26440,35458,0,0,100,0,0,0,3,1,0,'0 0 0 536870912 0 0 0 0 2048 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 33554432 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 512 0 0 0 0 0 0 2099848 0 0 268435456 0 32776 524288 0 512 4194304 0 0 0 0 0 0 0 0 0 67108864 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','51255 0 50182 0 51257 0 0 0 51259 0 50613 0 51258 0 50699 0 54582 0 51256 0 54585 0 50610 0 54588 0 54590 0 54583 0 50731 0 0 0 50684 0 52252 0 0 0 0 0 0 0 0 0 ',0,'0 32768 0 16384 16384 0 ',15,0,NULL,'2026-10-21 00:16:24',NULL,NULL,NULL,5327,0),(4,1,'Perdido',4,6,0,80,0,100002000,7,17,3,4,2,0,2,32,5797.5,631.916,647.414,571,0,0,5.24578,'4294967295 4093640703 830406655 8 16384 1310944 3251642388 73752 896 67111952 2281701376 4190109713 1049856 12582912 ',0,1,310,220,1792556181,1,0,0,0,0,0,0,0,0,1024,0,0,4395,0,'',0,0,0,0,0,0,0,0,0,4294967295,0,13031,0,0,0,100,0,0,0,0,1,0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 512 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4194304 0 0 0 0 0 0 0 0 0 67108864 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','34652 0 34657 0 34655 0 0 0 34650 0 34651 0 34656 0 34648 0 34653 0 34649 0 34658 0 38147 0 0 0 0 0 34659 0 49623 0 0 0 0 0 0 0 38145 0 38145 0 38145 0 38145 0 ',0,'0 0 0 0 0 0 ',0,0,NULL,'2026-10-21 04:11:09',NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_filter`
--

DROP TABLE IF EXISTS `chat_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_filter` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_filter`
--

LOCK TABLES `chat_filter` WRITE;
/*!40000 ALTER TABLE `chat_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corpse`
--

DROP TABLE IF EXISTS `corpse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corpse` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `phaseMask` int unsigned NOT NULL DEFAULT '1',
  `displayId` int unsigned NOT NULL DEFAULT '0',
  `itemCache` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bytes1` int unsigned NOT NULL DEFAULT '0',
  `bytes2` int unsigned NOT NULL DEFAULT '0',
  `guildId` int unsigned NOT NULL DEFAULT '0',
  `flags` tinyint unsigned NOT NULL DEFAULT '0',
  `dynFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `time` int unsigned NOT NULL DEFAULT '0',
  `corpseType` tinyint unsigned NOT NULL DEFAULT '0',
  `instanceId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Identifier',
  PRIMARY KEY (`guid`),
  KEY `idx_type` (`corpseType`),
  KEY `idx_instance` (`instanceId`),
  KEY `idx_time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Death System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corpse`
--

LOCK TABLES `corpse` WRITE;
/*!40000 ALTER TABLE `corpse` DISABLE KEYS */;
/*!40000 ALTER TABLE `corpse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_respawn`
--

DROP TABLE IF EXISTS `creature_respawn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_respawn` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawnTime` int unsigned NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0',
  `instanceId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Identifier',
  PRIMARY KEY (`guid`,`instanceId`),
  KEY `idx_instance` (`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Grid Loading System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creature_respawn`
--

LOCK TABLES `creature_respawn` WRITE;
/*!40000 ALTER TABLE `creature_respawn` DISABLE KEYS */;
INSERT INTO `creature_respawn` VALUES (44457,1792597629,571,0),(45145,1792597608,0,0),(54000,1792598057,0,0),(81032,1792597638,0,0),(86520,1792597839,530,0),(98439,1792556791,571,0),(98442,1792556771,571,0),(98446,1792556758,571,0),(98470,1792556300,571,0),(98488,1792556589,571,0),(98513,1792556328,571,0),(98517,1792556628,571,0),(98518,1792556499,571,0),(98519,1792556507,571,0),(98523,1792556490,571,0),(98524,1792556378,571,0),(98525,1792556724,571,0),(98824,1792598010,571,0),(98926,1792556227,571,0),(98934,1792556527,571,0),(99607,1792597668,571,0),(100170,1792597766,571,0),(100206,1792597752,571,0),(102735,1792598062,571,0),(108613,1792597509,571,0),(111172,1792597758,571,0),(111318,1792597794,571,0),(111429,1792597976,571,0),(111849,1792597997,571,0),(112894,1792597604,571,0),(112895,1792597599,571,0),(112898,1792597621,571,0),(112900,1792597608,571,0),(112901,1792597601,571,0),(112903,1792597597,571,0),(112956,1792597967,571,0),(112957,1792597973,571,0),(112958,1792597970,571,0),(112959,1792597958,571,0),(112960,1792597961,571,0),(112961,1792597927,571,0),(113432,1792597934,571,0),(113435,1792597922,571,0),(113644,1792597779,571,0),(115913,1792597699,571,0),(115914,1792597695,571,0),(115915,1792597734,571,0),(115916,1792597697,571,0),(117593,1792597758,571,0),(118064,1792597703,571,0),(118492,1792598013,571,0),(118493,1792597993,571,0),(118546,1792598000,571,0),(118547,1792597970,571,0),(119082,1792597668,571,0),(119148,1792597668,571,0),(128899,1792556472,609,0),(128914,1792556261,609,0),(128917,1792556237,609,0),(128926,1792556254,609,0),(128930,1792556289,609,0),(128960,1792556237,609,0),(128979,1792556247,609,0),(128992,1792556296,609,0),(129500,1792556237,609,0),(129502,1792556232,609,0),(129530,1792556238,609,0),(129546,1792556238,609,0),(130558,1792556221,609,0),(130567,1792556362,609,0),(130577,1792556233,609,0),(130609,1792556384,609,0),(130613,1792556251,609,0),(130615,1792556246,609,0),(130618,1792556240,609,0),(130619,1792556254,609,0),(130642,1792556541,609,0),(130656,1792556383,609,0),(130661,1792556274,609,0),(130662,1792556230,609,0),(130666,1792556228,609,0),(130667,1792556389,609,0),(130682,1792556268,609,0),(130716,1792556373,609,0),(130719,1792556228,609,0),(130734,1792556361,609,0),(130746,1792556227,609,0),(130749,1792556228,609,0),(130750,1792556241,609,0),(130753,1792556228,609,0),(130788,1792556371,609,0),(130789,1792556377,609,0),(130794,1792556316,609,0),(130796,1792556282,609,0),(130798,1792556292,609,0),(130799,1792556217,609,0),(130806,1792556256,609,0),(130827,1792556299,609,0),(130829,1792556262,609,0),(130830,1792556271,609,0),(130988,1792597894,571,0),(130998,1792597929,571,0),(130999,1792597801,571,0),(133242,1792597852,571,0),(133331,1792597843,571,0),(133377,1792597828,571,0),(133378,1792597825,571,0),(133379,1792597827,571,0),(133380,1792597825,571,0),(133436,1792597836,571,0),(133437,1792597822,571,0),(133481,1792597826,571,0),(133483,1792597826,571,0),(133485,1792597834,571,0),(133659,1792597826,571,0),(133660,1792597821,571,0),(133736,1792597819,571,0),(133737,1792597822,571,0),(133874,1792597854,571,0),(133878,1792597834,571,0),(133881,1792597834,571,0),(133882,1792597841,571,0),(133885,1792597834,571,0),(1975716,1792597531,571,0),(1975717,1792597512,571,0),(1975720,1792597533,571,0),(1975721,1792597579,571,0),(1976472,1792598092,571,0),(1976474,1792598064,571,0),(1976479,1792598099,571,0),(1977144,1792597790,571,0),(1977145,1792597800,571,0),(1977146,1792597766,571,0),(1977147,1792597688,571,0),(1977148,1792597742,571,0),(1977149,1792597716,571,0),(1977150,1792597701,571,0),(1977151,1792597745,571,0),(1977152,1792597730,571,0),(1977153,1792597686,571,0),(1977154,1792597670,571,0),(1977155,1792597737,571,0),(1977156,1792597813,571,0),(1977161,1792597749,571,0),(1977162,1792597760,571,0),(1977163,1792597730,571,0),(1977164,1792597703,571,0),(1977165,1792597692,571,0);
/*!40000 ALTER TABLE `creature_respawn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_event_condition_save`
--

DROP TABLE IF EXISTS `game_event_condition_save`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_condition_save` (
  `eventEntry` tinyint unsigned NOT NULL,
  `condition_id` int unsigned NOT NULL DEFAULT '0',
  `done` float DEFAULT '0',
  PRIMARY KEY (`eventEntry`,`condition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_event_condition_save`
--

LOCK TABLES `game_event_condition_save` WRITE;
/*!40000 ALTER TABLE `game_event_condition_save` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_condition_save` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_event_save`
--

DROP TABLE IF EXISTS `game_event_save`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_save` (
  `eventEntry` tinyint unsigned NOT NULL,
  `state` tinyint unsigned NOT NULL DEFAULT '1',
  `next_start` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_event_save`
--

LOCK TABLES `game_event_save` WRITE;
/*!40000 ALTER TABLE `game_event_save` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_save` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameobject_respawn`
--

DROP TABLE IF EXISTS `gameobject_respawn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_respawn` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawnTime` int unsigned NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0',
  `instanceId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Identifier',
  PRIMARY KEY (`guid`,`instanceId`),
  KEY `idx_instance` (`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Grid Loading System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameobject_respawn`
--

LOCK TABLES `gameobject_respawn` WRITE;
/*!40000 ALTER TABLE `gameobject_respawn` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject_respawn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_subsurvey`
--

DROP TABLE IF EXISTS `gm_subsurvey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gm_subsurvey` (
  `surveyId` int unsigned NOT NULL AUTO_INCREMENT,
  `questionId` int unsigned NOT NULL DEFAULT '0',
  `answer` int unsigned NOT NULL DEFAULT '0',
  `answerComment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`surveyId`,`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_subsurvey`
--

LOCK TABLES `gm_subsurvey` WRITE;
/*!40000 ALTER TABLE `gm_subsurvey` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_subsurvey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_survey`
--

DROP TABLE IF EXISTS `gm_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gm_survey` (
  `surveyId` int unsigned NOT NULL AUTO_INCREMENT,
  `guid` int unsigned NOT NULL DEFAULT '0',
  `mainSurvey` int unsigned NOT NULL DEFAULT '0',
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createTime` int unsigned NOT NULL DEFAULT '0',
  `maxMMR` smallint NOT NULL,
  PRIMARY KEY (`surveyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_survey`
--

LOCK TABLES `gm_survey` WRITE;
/*!40000 ALTER TABLE `gm_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gm_ticket`
--

DROP TABLE IF EXISTS `gm_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gm_ticket` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0 open, 1 closed, 2 character deleted',
  `playerGuid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier of ticket creator',
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of ticket creator',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createTime` int unsigned NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `lastModifiedTime` int unsigned NOT NULL DEFAULT '0',
  `closedBy` int NOT NULL DEFAULT '0' COMMENT '-1 Closed by Console, >0 GUID of GM',
  `assignedTo` int unsigned NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint unsigned NOT NULL DEFAULT '0',
  `escalated` tinyint unsigned NOT NULL DEFAULT '0',
  `viewed` tinyint unsigned NOT NULL DEFAULT '0',
  `needMoreHelp` tinyint unsigned NOT NULL DEFAULT '0',
  `resolvedBy` int NOT NULL DEFAULT '0' COMMENT '-1 Resolved by Console, >0 GUID of GM',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gm_ticket`
--

LOCK TABLES `gm_ticket` WRITE;
/*!40000 ALTER TABLE `gm_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `gm_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_member`
--

DROP TABLE IF EXISTS `group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_member` (
  `guid` int unsigned NOT NULL,
  `memberGuid` int unsigned NOT NULL,
  `memberFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `subgroup` tinyint unsigned NOT NULL DEFAULT '0',
  `roles` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`memberGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_member`
--

LOCK TABLES `group_member` WRITE;
/*!40000 ALTER TABLE `group_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `guid` int unsigned NOT NULL,
  `leaderGuid` int unsigned NOT NULL,
  `lootMethod` tinyint unsigned NOT NULL,
  `looterGuid` int unsigned NOT NULL,
  `lootThreshold` tinyint unsigned NOT NULL,
  `icon1` bigint unsigned NOT NULL,
  `icon2` bigint unsigned NOT NULL,
  `icon3` bigint unsigned NOT NULL,
  `icon4` bigint unsigned NOT NULL,
  `icon5` bigint unsigned NOT NULL,
  `icon6` bigint unsigned NOT NULL,
  `icon7` bigint unsigned NOT NULL,
  `icon8` bigint unsigned NOT NULL,
  `groupType` tinyint unsigned NOT NULL,
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `raidDifficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `masterLooterGuid` int unsigned NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `leaderGuid` (`leaderGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild`
--

DROP TABLE IF EXISTS `guild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild` (
  `guildid` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `leaderguid` int unsigned NOT NULL DEFAULT '0',
  `EmblemStyle` tinyint unsigned NOT NULL DEFAULT '0',
  `EmblemColor` tinyint unsigned NOT NULL DEFAULT '0',
  `BorderStyle` tinyint unsigned NOT NULL DEFAULT '0',
  `BorderColor` tinyint unsigned NOT NULL DEFAULT '0',
  `BackgroundColor` tinyint unsigned NOT NULL DEFAULT '0',
  `info` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `motd` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createdate` int unsigned NOT NULL DEFAULT '0',
  `BankMoney` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Guild System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild`
--

LOCK TABLES `guild` WRITE;
/*!40000 ALTER TABLE `guild` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_bank_eventlog`
--

DROP TABLE IF EXISTS `guild_bank_eventlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild_bank_eventlog` (
  `guildid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Guild Identificator',
  `LogGuid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Log record identificator - auxiliary column',
  `TabId` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Guild bank TabId',
  `EventType` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Event type',
  `PlayerGuid` int unsigned NOT NULL DEFAULT '0',
  `ItemOrMoney` int unsigned NOT NULL DEFAULT '0',
  `ItemStackCount` smallint unsigned NOT NULL DEFAULT '0',
  `DestTabId` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Destination Tab Id',
  `TimeStamp` int unsigned NOT NULL DEFAULT '0' COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`,`TabId`),
  KEY `guildid_key` (`guildid`),
  KEY `Idx_PlayerGuid` (`PlayerGuid`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_bank_eventlog`
--

LOCK TABLES `guild_bank_eventlog` WRITE;
/*!40000 ALTER TABLE `guild_bank_eventlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_bank_eventlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_bank_item`
--

DROP TABLE IF EXISTS `guild_bank_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild_bank_item` (
  `guildid` int unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint unsigned NOT NULL DEFAULT '0',
  `SlotId` tinyint unsigned NOT NULL DEFAULT '0',
  `item_guid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`SlotId`),
  KEY `guildid_key` (`guildid`),
  KEY `Idx_item_guid` (`item_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_bank_item`
--

LOCK TABLES `guild_bank_item` WRITE;
/*!40000 ALTER TABLE `guild_bank_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_bank_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_bank_right`
--

DROP TABLE IF EXISTS `guild_bank_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild_bank_right` (
  `guildid` int unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint unsigned NOT NULL DEFAULT '0',
  `rid` tinyint unsigned NOT NULL DEFAULT '0',
  `gbright` tinyint unsigned NOT NULL DEFAULT '0',
  `SlotPerDay` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`rid`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_bank_right`
--

LOCK TABLES `guild_bank_right` WRITE;
/*!40000 ALTER TABLE `guild_bank_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_bank_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_bank_tab`
--

DROP TABLE IF EXISTS `guild_bank_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild_bank_tab` (
  `guildid` int unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint unsigned NOT NULL DEFAULT '0',
  `TabName` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `TabIcon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `TabText` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`guildid`,`TabId`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_bank_tab`
--

LOCK TABLES `guild_bank_tab` WRITE;
/*!40000 ALTER TABLE `guild_bank_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_bank_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_eventlog`
--

DROP TABLE IF EXISTS `guild_eventlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild_eventlog` (
  `guildid` int unsigned NOT NULL COMMENT 'Guild Identificator',
  `LogGuid` int unsigned NOT NULL COMMENT 'Log record identificator - auxiliary column',
  `EventType` tinyint unsigned NOT NULL COMMENT 'Event type',
  `PlayerGuid1` int unsigned NOT NULL COMMENT 'Player 1',
  `PlayerGuid2` int unsigned NOT NULL COMMENT 'Player 2',
  `NewRank` tinyint unsigned NOT NULL COMMENT 'New rank(in case promotion/demotion)',
  `TimeStamp` int unsigned NOT NULL COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`),
  KEY `Idx_PlayerGuid1` (`PlayerGuid1`),
  KEY `Idx_PlayerGuid2` (`PlayerGuid2`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Guild Eventlog';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_eventlog`
--

LOCK TABLES `guild_eventlog` WRITE;
/*!40000 ALTER TABLE `guild_eventlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_eventlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_member`
--

DROP TABLE IF EXISTS `guild_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild_member` (
  `guildid` int unsigned NOT NULL COMMENT 'Guild Identificator',
  `guid` int unsigned NOT NULL,
  `rank` tinyint unsigned NOT NULL,
  `pnote` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `offnote` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `guid_key` (`guid`),
  KEY `guildid_key` (`guildid`),
  KEY `guildid_rank_key` (`guildid`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Guild System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_member`
--

LOCK TABLES `guild_member` WRITE;
/*!40000 ALTER TABLE `guild_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_member_withdraw`
--

DROP TABLE IF EXISTS `guild_member_withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild_member_withdraw` (
  `guid` int unsigned NOT NULL,
  `tab0` int unsigned NOT NULL DEFAULT '0',
  `tab1` int unsigned NOT NULL DEFAULT '0',
  `tab2` int unsigned NOT NULL DEFAULT '0',
  `tab3` int unsigned NOT NULL DEFAULT '0',
  `tab4` int unsigned NOT NULL DEFAULT '0',
  `tab5` int unsigned NOT NULL DEFAULT '0',
  `money` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Guild Member Daily Withdraws';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_member_withdraw`
--

LOCK TABLES `guild_member_withdraw` WRITE;
/*!40000 ALTER TABLE `guild_member_withdraw` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_member_withdraw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_rank`
--

DROP TABLE IF EXISTS `guild_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild_rank` (
  `guildid` int unsigned NOT NULL DEFAULT '0',
  `rid` tinyint unsigned NOT NULL,
  `rname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rights` int unsigned DEFAULT '0',
  `BankMoneyPerDay` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`rid`),
  KEY `Idx_rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Guild System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_rank`
--

LOCK TABLES `guild_rank` WRITE;
/*!40000 ALTER TABLE `guild_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance`
--

DROP TABLE IF EXISTS `instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instance` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `map` smallint unsigned NOT NULL DEFAULT '0',
  `resettime` int unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `completedEncounters` int unsigned NOT NULL DEFAULT '0',
  `data` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `map` (`map`),
  KEY `resettime` (`resettime`),
  KEY `difficulty` (`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance`
--

LOCK TABLES `instance` WRITE;
/*!40000 ALTER TABLE `instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_reset`
--

DROP TABLE IF EXISTS `instance_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instance_reset` (
  `mapid` smallint unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `resettime` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mapid`,`difficulty`),
  KEY `difficulty` (`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_reset`
--

LOCK TABLES `instance_reset` WRITE;
/*!40000 ALTER TABLE `instance_reset` DISABLE KEYS */;
INSERT INTO `instance_reset` VALUES (249,0,1792814400),(249,1,1792814400),(269,1,1792641600),(309,0,1792641600),(409,0,1792814400),(469,0,1792814400),(509,0,1792641600),(531,0,1792814400),(532,0,1792814400),(533,0,1792814400),(533,1,1792814400),(534,0,1792814400),(540,1,1792641600),(542,1,1792641600),(543,1,1792641600),(544,0,1792814400),(545,1,1792641600),(546,1,1792641600),(547,1,1792641600),(548,0,1792814400),(550,0,1792814400),(552,1,1792641600),(553,1,1792641600),(554,1,1792641600),(555,1,1792641600),(556,1,1792641600),(557,1,1792641600),(558,1,1792641600),(560,1,1792641600),(564,0,1792814400),(565,0,1792814400),(568,0,1792641600),(574,1,1792641600),(575,1,1792641600),(576,1,1792641600),(578,1,1792641600),(580,0,1792814400),(585,1,1792641600),(595,1,1792641600),(598,1,1792641600),(599,1,1792641600),(600,1,1792641600),(601,1,1792641600),(602,1,1792641600),(603,0,1792814400),(603,1,1792814400),(604,1,1792641600),(608,1,1792641600),(615,0,1792814400),(615,1,1792814400),(616,0,1792814400),(616,1,1792814400),(619,1,1792641600),(624,0,1792814400),(624,1,1792814400),(631,0,1792814400),(631,1,1792814400),(631,2,1792814400),(631,3,1792814400),(632,1,1792641600),(649,0,1792814400),(649,1,1792814400),(649,2,1792814400),(649,3,1792814400),(650,1,1792641600),(658,1,1792641600),(668,1,1792641600),(724,0,1792814400),(724,1,1792814400),(724,2,1792814400),(724,3,1792814400);
/*!40000 ALTER TABLE `instance_reset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_saved_go_state_data`
--

DROP TABLE IF EXISTS `instance_saved_go_state_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instance_saved_go_state_data` (
  `id` int unsigned NOT NULL COMMENT 'instance.id',
  `guid` int unsigned NOT NULL COMMENT 'gameobject.guid',
  `state` tinyint unsigned DEFAULT '0' COMMENT 'gameobject.state',
  PRIMARY KEY (`id`,`guid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_saved_go_state_data`
--

LOCK TABLES `instance_saved_go_state_data` WRITE;
/*!40000 ALTER TABLE `instance_saved_go_state_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_saved_go_state_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_instance`
--

DROP TABLE IF EXISTS `item_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_instance` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `itemEntry` int unsigned DEFAULT '0',
  `owner_guid` int unsigned NOT NULL DEFAULT '0',
  `creatorGuid` int unsigned NOT NULL DEFAULT '0',
  `giftCreatorGuid` int unsigned NOT NULL DEFAULT '0',
  `count` int unsigned NOT NULL DEFAULT '1',
  `duration` int NOT NULL DEFAULT '0',
  `charges` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `flags` int unsigned DEFAULT '0',
  `enchantments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `randomPropertyId` smallint NOT NULL DEFAULT '0',
  `durability` smallint unsigned NOT NULL DEFAULT '0',
  `playedTime` int unsigned NOT NULL DEFAULT '0',
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`guid`),
  KEY `idx_owner_guid` (`owner_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_instance`
--

LOCK TABLES `item_instance` WRITE;
/*!40000 ALTER TABLE `item_instance` DISABLE KEYS */;
INSERT INTO `item_instance` VALUES (10,6948,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(12,51469,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,55,4795,''),(21,51472,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,4007,''),(23,51353,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,3937,''),(24,51354,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,3920,''),(25,51476,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,100,3885,''),(26,51477,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,120,4235,''),(27,51478,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,2926,''),(28,51479,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,100,3822,''),(30,51358,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,2637,''),(31,51362,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,55,2606,''),(32,51363,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,75,3691,''),(33,51364,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,55,2586,''),(34,51534,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(35,51474,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,164,3633,''),(36,51475,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,55,2512,''),(37,51393,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,120,3318,''),(38,16432,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,80,2950,''),(39,16431,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,100,2852,''),(40,16430,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,135,2945,''),(41,16429,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,80,2941,''),(42,16406,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,45,3674,''),(43,16405,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,65,1974,''),(44,33475,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(60,6098,3,0,0,1,0,'0 0 0 0 0 ',0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,35,0,''),(62,52,3,0,0,1,0,'0 0 0 0 0 ',0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,25,0,''),(68,35,3,0,0,1,0,'0 0 0 0 0 ',0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,25,0,''),(70,6948,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(71,51255,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,60,2051,''),(72,51256,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,35,2051,''),(73,51257,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,59,2051,''),(74,51258,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,75,2051,''),(75,51259,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,100,2051,''),(76,50684,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,75,0,''),(79,50731,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,119,0,''),(80,54585,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(82,50610,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(83,54588,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(84,54590,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(85,54582,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,35,0,''),(86,50613,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,35,0,''),(87,50699,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,50,0,''),(88,52252,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(89,54583,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(90,50182,3,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(95,40752,3,0,0,810,0,'0 0 0 0 0 ',0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(103,44697,3,0,0,1,0,'0 0 0 0 0 ',0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2803 0 0 2825 0 0 3726 0 0 0 0 0 0 0 0 ',-89,120,0,''),(105,33470,3,0,0,20,0,'0 0 0 0 0 ',0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(106,49623,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,145,0,''),(107,50622,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(108,50363,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(109,50706,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(111,34652,4,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,70,0,''),(113,34655,4,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,70,0,''),(115,34659,4,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(117,34650,4,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,115,0,''),(119,34653,4,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,40,0,''),(121,34649,4,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,40,0,''),(123,34651,4,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,40,0,''),(125,34656,4,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,85,0,''),(127,34648,4,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,55,0,''),(129,34657,4,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(131,34658,4,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(133,38145,4,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(135,38145,4,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(137,38145,4,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(139,38145,4,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(141,38147,4,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(143,41751,4,0,0,10,0,'-1 0 0 0 0 ',0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(144,41426,4,0,0,1,0,'0 0 0 0 0 ',0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(145,49623,4,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,145,0,''),(146,44817,4,0,0,1,0,'-1 0 0 0 0 ',0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,''),(147,44817,4,0,0,1,0,'-1 0 0 0 0 ',0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,'');
/*!40000 ALTER TABLE `item_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_loot_storage`
--

DROP TABLE IF EXISTS `item_loot_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_loot_storage` (
  `containerGUID` int unsigned NOT NULL,
  `itemid` int unsigned NOT NULL,
  `count` int unsigned NOT NULL,
  `item_index` int unsigned NOT NULL DEFAULT '0',
  `randomPropertyId` int NOT NULL,
  `randomSuffix` int unsigned NOT NULL,
  `follow_loot_rules` tinyint unsigned NOT NULL,
  `freeforall` tinyint unsigned NOT NULL,
  `is_blocked` tinyint unsigned NOT NULL,
  `is_counted` tinyint unsigned NOT NULL,
  `is_underthreshold` tinyint unsigned NOT NULL,
  `needs_quest` tinyint unsigned NOT NULL,
  `conditionLootId` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_loot_storage`
--

LOCK TABLES `item_loot_storage` WRITE;
/*!40000 ALTER TABLE `item_loot_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_loot_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_refund_instance`
--

DROP TABLE IF EXISTS `item_refund_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_refund_instance` (
  `item_guid` int unsigned NOT NULL COMMENT 'Item GUID',
  `player_guid` int unsigned NOT NULL COMMENT 'Player GUID',
  `paidMoney` int unsigned NOT NULL DEFAULT '0',
  `paidExtendedCost` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_guid`,`player_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Item Refund System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_refund_instance`
--

LOCK TABLES `item_refund_instance` WRITE;
/*!40000 ALTER TABLE `item_refund_instance` DISABLE KEYS */;
INSERT INTO `item_refund_instance` VALUES (97,3,0,2550);
/*!40000 ALTER TABLE `item_refund_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_soulbound_trade_data`
--

DROP TABLE IF EXISTS `item_soulbound_trade_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_soulbound_trade_data` (
  `itemGuid` int unsigned NOT NULL COMMENT 'Item GUID',
  `allowedPlayers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Space separated GUID list of players who can receive this item in trade',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Item Refund System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_soulbound_trade_data`
--

LOCK TABLES `item_soulbound_trade_data` WRITE;
/*!40000 ALTER TABLE `item_soulbound_trade_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_soulbound_trade_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lag_reports`
--

DROP TABLE IF EXISTS `lag_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lag_reports` (
  `reportId` int unsigned NOT NULL AUTO_INCREMENT,
  `guid` int unsigned NOT NULL DEFAULT '0',
  `lagType` tinyint unsigned NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `latency` int unsigned NOT NULL DEFAULT '0',
  `createTime` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lag_reports`
--

LOCK TABLES `lag_reports` WRITE;
/*!40000 ALTER TABLE `lag_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `lag_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lfg_data`
--

DROP TABLE IF EXISTS `lfg_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lfg_data` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `dungeon` int unsigned NOT NULL DEFAULT '0',
  `state` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='LFG Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lfg_data`
--

LOCK TABLES `lfg_data` WRITE;
/*!40000 ALTER TABLE `lfg_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `lfg_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_arena_fights`
--

DROP TABLE IF EXISTS `log_arena_fights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_arena_fights` (
  `fight_id` int unsigned NOT NULL,
  `time` datetime NOT NULL,
  `type` tinyint unsigned NOT NULL,
  `duration` int unsigned NOT NULL,
  `winner` int unsigned NOT NULL,
  `loser` int unsigned NOT NULL,
  `winner_tr` smallint unsigned NOT NULL,
  `winner_mmr` smallint unsigned NOT NULL,
  `winner_tr_change` smallint NOT NULL,
  `loser_tr` smallint unsigned NOT NULL,
  `loser_mmr` smallint unsigned NOT NULL,
  `loser_tr_change` smallint NOT NULL,
  `currOnline` int unsigned NOT NULL,
  PRIMARY KEY (`fight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_arena_fights`
--

LOCK TABLES `log_arena_fights` WRITE;
/*!40000 ALTER TABLE `log_arena_fights` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_arena_fights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_arena_memberstats`
--

DROP TABLE IF EXISTS `log_arena_memberstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_arena_memberstats` (
  `fight_id` int unsigned NOT NULL,
  `member_id` tinyint unsigned NOT NULL,
  `name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guid` int unsigned NOT NULL,
  `team` int unsigned NOT NULL,
  `account` int unsigned NOT NULL,
  `ip` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `damage` int unsigned NOT NULL,
  `heal` int unsigned NOT NULL,
  `kblows` int unsigned NOT NULL,
  PRIMARY KEY (`fight_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_arena_memberstats`
--

LOCK TABLES `log_arena_memberstats` WRITE;
/*!40000 ALTER TABLE `log_arena_memberstats` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_arena_memberstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_encounter`
--

DROP TABLE IF EXISTS `log_encounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_encounter` (
  `time` datetime NOT NULL,
  `map` smallint unsigned NOT NULL,
  `difficulty` tinyint unsigned NOT NULL,
  `creditType` tinyint unsigned NOT NULL,
  `creditEntry` int unsigned NOT NULL,
  `playersInfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_encounter`
--

LOCK TABLES `log_encounter` WRITE;
/*!40000 ALTER TABLE `log_encounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_encounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_money`
--

DROP TABLE IF EXISTS `log_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_money` (
  `sender_acc` int unsigned NOT NULL,
  `sender_guid` int unsigned NOT NULL,
  `sender_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_ip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_acc` int unsigned NOT NULL,
  `receiver_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `money` bigint unsigned NOT NULL,
  `topic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `type` tinyint NOT NULL COMMENT '1=COD,2=AH,3=GB DEPOSIT,4=GB WITHDRAW,5=MAIL,6=TRADE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_money`
--

LOCK TABLES `log_money` WRITE;
/*!40000 ALTER TABLE `log_money` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_money` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `messageType` tinyint unsigned NOT NULL DEFAULT '0',
  `stationery` tinyint NOT NULL DEFAULT '41',
  `mailTemplateId` smallint unsigned NOT NULL DEFAULT '0',
  `sender` int unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `receiver` int unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `subject` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `has_items` tinyint unsigned NOT NULL DEFAULT '0',
  `expire_time` int unsigned NOT NULL DEFAULT '0',
  `deliver_time` int unsigned NOT NULL DEFAULT '0',
  `money` int unsigned NOT NULL DEFAULT '0',
  `cod` int unsigned NOT NULL DEFAULT '0',
  `checked` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Mail System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
INSERT INTO `mail` VALUES (2,3,41,0,16128,4,'Nivel 80','Felicitaciones por tu convicción de llegar a la temporada 80 de aventuras. Sin duda, estás dedicado a la causa de librar a Azeroth de los males que nos han asolado.$B$BY aunque el viaje hasta ahora no ha sido una hazaña menor, la verdadera batalla está por llegar.$B$B¡Sigue luchando!$B$BRhonin',1,1795147961,1792555961,0,0,0),(3,3,41,264,32838,4,'','',1,1795148536,1792556536,0,0,0),(4,3,41,264,32838,4,'','',1,1795148562,1792556562,0,0,0);
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_items`
--

DROP TABLE IF EXISTS `mail_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_items` (
  `mail_id` int unsigned NOT NULL DEFAULT '0',
  `item_guid` int unsigned NOT NULL DEFAULT '0',
  `receiver` int unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  PRIMARY KEY (`item_guid`),
  KEY `idx_receiver` (`receiver`),
  KEY `idx_mail_id` (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_items`
--

LOCK TABLES `mail_items` WRITE;
/*!40000 ALTER TABLE `mail_items` DISABLE KEYS */;
INSERT INTO `mail_items` VALUES (2,144,4),(3,146,4),(4,147,4);
/*!40000 ALTER TABLE `mail_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_server_character`
--

DROP TABLE IF EXISTS `mail_server_character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_server_character` (
  `guid` int unsigned NOT NULL,
  `mailId` int unsigned NOT NULL,
  PRIMARY KEY (`guid`,`mailId`),
  KEY `fk_mail_server_character` (`mailId`),
  CONSTRAINT `fk_mail_server_character` FOREIGN KEY (`mailId`) REFERENCES `mail_server_template` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_server_character`
--

LOCK TABLES `mail_server_character` WRITE;
/*!40000 ALTER TABLE `mail_server_character` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_server_character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_server_template`
--

DROP TABLE IF EXISTS `mail_server_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_server_template` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `senderEntry` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entry from creature_template. 0 for default "Customer Support" sender.',
  `moneyA` int unsigned NOT NULL DEFAULT '0',
  `moneyH` int unsigned NOT NULL DEFAULT '0',
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39714 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_server_template`
--

LOCK TABLES `mail_server_template` WRITE;
/*!40000 ALTER TABLE `mail_server_template` DISABLE KEYS */;
INSERT INTO `mail_server_template` VALUES (14646,19506,0,0,'A Very Special Delivery','Thank you for your purchase of the World of Warcraft Collector\'s Edition! As a special gift of appreciation, we would like to present you with this gift voucher. Turn it in to receive a little companion to join you on your quest for adventure and glory!',1),(14647,19506,0,0,'A Very Special Delivery','Thank you for your purchase of the World of Warcraft Collector\'s Edition! As a special gift of appreciation, we would like to present you with this gift voucher. Turn it in to receive a little companion to join you on your quest for adventure and glory!',1),(14648,19506,0,0,'A Very Special Delivery','Thank you for your purchase of the World of Warcraft Collector\'s Edition! As a special gift of appreciation, we would like to present you with this gift voucher. Turn it in to receive a little companion to join you on your quest for adventure and glory!',1),(14649,19506,0,0,'A Very Special Delivery','Thank you for your purchase of the World of Warcraft Collector\'s Edition! As a special gift of appreciation, we would like to present you with this gift voucher. Turn it in to receive a little companion to join you on your quest for adventure and glory!',1),(14650,19506,0,0,'A Very Special Delivery','Thank you for your purchase of the World of Warcraft Collector\'s Edition! As a special gift of appreciation, we would like to present you with this gift voucher. Turn it in to receive a little companion to join you on your quest for adventure and glory!',1),(14651,19506,0,0,'A Very Special Delivery','Thank you for your purchase of the World of Warcraft Collector\'s Edition! As a special gift of appreciation, we would like to present you with this gift voucher. Turn it in to receive a little companion to join you on your quest for adventure and glory!',1),(20938,19506,0,0,'A Very Special Delivery','Thank you for your purchase of the World of Warcraft Collector\'s Edition! As a special gift of appreciation, we would like to present you with this gift voucher. Turn it in to receive a little companion to join you on your quest for adventure and glory!',1),(22888,19506,0,0,'A Very Special Delivery','Thank you for your purchase of the World of Warcraft Collector\'s Edition! As a special gift of appreciation, we would like to present you with this gift voucher. Turn it in to receive a little companion to join you on your quest for adventure and glory!',1),(39713,19506,0,0,'A Very Special Delivery','Thank you for your purchase of the World of Warcraft Collector\'s Edition! As a special gift of appreciation, we would like to present you with this gift voucher. Turn it in to receive a little companion to join you on your quest for adventure and glory!',1);
/*!40000 ALTER TABLE `mail_server_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_server_template_conditions`
--

DROP TABLE IF EXISTS `mail_server_template_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_server_template_conditions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `templateID` int unsigned NOT NULL,
  `conditionType` enum('Level','PlayTime','Quest','Achievement','Reputation','Faction','Race','Class','AccountFlags') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `conditionValue` int unsigned NOT NULL,
  `conditionState` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_mail_template_conditions` (`templateID`),
  CONSTRAINT `fk_mail_template_conditions` FOREIGN KEY (`templateID`) REFERENCES `mail_server_template` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_server_template_conditions`
--

LOCK TABLES `mail_server_template_conditions` WRITE;
/*!40000 ALTER TABLE `mail_server_template_conditions` DISABLE KEYS */;
INSERT INTO `mail_server_template_conditions` VALUES (1,14646,'Race',1,0),(2,14646,'Class',1503,0),(3,14646,'AccountFlags',4,0),(4,14647,'Race',68,0),(5,14647,'Class',1503,0),(6,14647,'AccountFlags',4,0),(7,14648,'Race',8,0),(8,14648,'Class',1503,0),(9,14648,'AccountFlags',4,0),(10,14649,'Race',130,0),(11,14649,'Class',1503,0),(12,14649,'AccountFlags',4,0),(13,14650,'Race',32,0),(14,14650,'Class',1503,0),(15,14650,'AccountFlags',4,0),(16,14651,'Race',16,0),(17,14651,'Class',1503,0),(18,14651,'AccountFlags',4,0),(19,20938,'Race',512,0),(20,20938,'Class',1503,0),(21,20938,'AccountFlags',4,0),(22,22888,'Race',1024,0),(23,22888,'Class',1503,0),(24,22888,'AccountFlags',4,0),(25,39713,'Class',32,0),(26,39713,'AccountFlags',4,0);
/*!40000 ALTER TABLE `mail_server_template_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_server_template_items`
--

DROP TABLE IF EXISTS `mail_server_template_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_server_template_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `templateID` int unsigned NOT NULL,
  `faction` enum('Alliance','Horde') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` int unsigned NOT NULL,
  `itemCount` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mail_template` (`templateID`),
  CONSTRAINT `fk_mail_template` FOREIGN KEY (`templateID`) REFERENCES `mail_server_template` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_server_template_items`
--

LOCK TABLES `mail_server_template_items` WRITE;
/*!40000 ALTER TABLE `mail_server_template_items` DISABLE KEYS */;
INSERT INTO `mail_server_template_items` VALUES (1,14646,'Alliance',14646,1),(2,14647,'Alliance',14647,1),(3,14648,'Alliance',14648,1),(4,14649,'Horde',14649,1),(5,14650,'Horde',14650,1),(6,14651,'Horde',14651,1),(7,20938,'Horde',20938,1),(8,22888,'Alliance',22888,1),(9,39713,'Alliance',39713,1),(10,39713,'Horde',39713,1);
/*!40000 ALTER TABLE `mail_server_template_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_aura`
--

DROP TABLE IF EXISTS `pet_aura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_aura` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `casterGuid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `spell` int unsigned NOT NULL DEFAULT '0',
  `effectMask` tinyint unsigned NOT NULL DEFAULT '0',
  `recalculateMask` tinyint unsigned NOT NULL DEFAULT '0',
  `stackCount` tinyint unsigned NOT NULL DEFAULT '1',
  `amount0` int DEFAULT NULL,
  `amount1` int DEFAULT NULL,
  `amount2` int DEFAULT NULL,
  `base_amount0` int DEFAULT NULL,
  `base_amount1` int DEFAULT NULL,
  `base_amount2` int DEFAULT NULL,
  `maxDuration` int NOT NULL DEFAULT '0',
  `remainTime` int NOT NULL DEFAULT '0',
  `remainCharges` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`casterGuid`,`spell`,`effectMask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Pet System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_aura`
--

LOCK TABLES `pet_aura` WRITE;
/*!40000 ALTER TABLE `pet_aura` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_aura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_spell`
--

DROP TABLE IF EXISTS `pet_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_spell` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` int unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Pet System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_spell`
--

LOCK TABLES `pet_spell` WRITE;
/*!40000 ALTER TABLE `pet_spell` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_spell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_spell_cooldown`
--

DROP TABLE IF EXISTS `pet_spell_cooldown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_spell_cooldown` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` int unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `category` int unsigned DEFAULT '0',
  `time` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_spell_cooldown`
--

LOCK TABLES `pet_spell_cooldown` WRITE;
/*!40000 ALTER TABLE `pet_spell_cooldown` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_spell_cooldown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petition`
--

DROP TABLE IF EXISTS `petition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `petition` (
  `ownerguid` int unsigned NOT NULL,
  `petitionguid` int unsigned DEFAULT '0',
  `petition_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ownerguid`,`type`),
  UNIQUE KEY `index_ownerguid_petitionguid` (`ownerguid`,`petitionguid`),
  KEY `idx_petition_id` (`petition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Guild System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petition`
--

LOCK TABLES `petition` WRITE;
/*!40000 ALTER TABLE `petition` DISABLE KEYS */;
/*!40000 ALTER TABLE `petition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petition_sign`
--

DROP TABLE IF EXISTS `petition_sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `petition_sign` (
  `ownerguid` int unsigned NOT NULL,
  `petitionguid` int unsigned NOT NULL DEFAULT '0',
  `petition_id` int unsigned NOT NULL DEFAULT '0',
  `playerguid` int unsigned NOT NULL DEFAULT '0',
  `player_account` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petition_id`,`playerguid`),
  KEY `Idx_playerguid` (`playerguid`),
  KEY `Idx_ownerguid` (`ownerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Guild System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petition_sign`
--

LOCK TABLES `petition_sign` WRITE;
/*!40000 ALTER TABLE `petition_sign` DISABLE KEYS */;
/*!40000 ALTER TABLE `petition_sign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pool_quest_save`
--

DROP TABLE IF EXISTS `pool_quest_save`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pool_quest_save` (
  `pool_id` int unsigned NOT NULL DEFAULT '0',
  `quest_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pool_id`,`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pool_quest_save`
--

LOCK TABLES `pool_quest_save` WRITE;
/*!40000 ALTER TABLE `pool_quest_save` DISABLE KEYS */;
INSERT INTO `pool_quest_save` VALUES (348,24636),(349,14104),(350,13905),(351,13915),(352,11380),(353,11667),(354,13424),(356,11368),(357,11383),(358,14152),(359,14112),(360,14143),(361,14092),(362,12760),(363,14108),(380,12735),(381,12734),(382,12705),(384,13192),(385,13154),(386,12501),(5662,13673),(5663,13764),(5664,13768),(5665,13773),(5666,13779),(5667,13785),(5668,13669),(5669,13603),(5670,13742),(5671,13747),(5672,13759),(5673,13754),(5674,13103),(5675,13115),(5676,13832),(5677,12961),(5678,24580);
/*!40000 ALTER TABLE `pool_quest_save` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profanity_name`
--

DROP TABLE IF EXISTS `profanity_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profanity_name` (
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profanity_name`
--

LOCK TABLES `profanity_name` WRITE;
/*!40000 ALTER TABLE `profanity_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `profanity_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pvpstats_battlegrounds`
--

DROP TABLE IF EXISTS `pvpstats_battlegrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pvpstats_battlegrounds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `winner_faction` tinyint NOT NULL,
  `bracket_id` tinyint unsigned NOT NULL,
  `type` tinyint unsigned NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pvpstats_battlegrounds`
--

LOCK TABLES `pvpstats_battlegrounds` WRITE;
/*!40000 ALTER TABLE `pvpstats_battlegrounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `pvpstats_battlegrounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pvpstats_players`
--

DROP TABLE IF EXISTS `pvpstats_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pvpstats_players` (
  `battleground_id` bigint unsigned NOT NULL,
  `character_guid` int unsigned NOT NULL,
  `winner` bit(1) NOT NULL,
  `score_killing_blows` int unsigned DEFAULT NULL,
  `score_deaths` int unsigned DEFAULT NULL,
  `score_honorable_kills` int unsigned DEFAULT NULL,
  `score_bonus_honor` int unsigned DEFAULT NULL,
  `score_damage_done` int unsigned DEFAULT NULL,
  `score_healing_done` int unsigned DEFAULT NULL,
  `attr_1` int unsigned DEFAULT '0',
  `attr_2` int unsigned DEFAULT '0',
  `attr_3` int unsigned DEFAULT '0',
  `attr_4` int unsigned DEFAULT '0',
  `attr_5` int unsigned DEFAULT '0',
  PRIMARY KEY (`battleground_id`,`character_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pvpstats_players`
--

LOCK TABLES `pvpstats_players` WRITE;
/*!40000 ALTER TABLE `pvpstats_players` DISABLE KEYS */;
/*!40000 ALTER TABLE `pvpstats_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest_tracker`
--

DROP TABLE IF EXISTS `quest_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_tracker` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `character_guid` int unsigned NOT NULL DEFAULT '0',
  `quest_accept_time` datetime NOT NULL,
  `quest_complete_time` datetime DEFAULT NULL,
  `quest_abandon_time` datetime DEFAULT NULL,
  `completed_by_gm` tinyint NOT NULL DEFAULT '0',
  `core_hash` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `core_revision` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_latest_quest_for_character` (`id`,`character_guid`,`quest_accept_time` DESC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest_tracker`
--

LOCK TABLES `quest_tracker` WRITE;
/*!40000 ALTER TABLE `quest_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recovery_item`
--

DROP TABLE IF EXISTS `recovery_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recovery_item` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Guid` int unsigned NOT NULL DEFAULT '0',
  `ItemEntry` int unsigned DEFAULT '0',
  `Count` int unsigned NOT NULL DEFAULT '0',
  `DeleteDate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_guid` (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recovery_item`
--

LOCK TABLES `recovery_item` WRITE;
/*!40000 ALTER TABLE `recovery_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `recovery_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserved_name`
--

DROP TABLE IF EXISTS `reserved_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserved_name` (
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player Reserved Names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserved_name`
--

LOCK TABLES `reserved_name` WRITE;
/*!40000 ALTER TABLE `reserved_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserved_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spam_reports`
--

DROP TABLE IF EXISTS `spam_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spam_reports` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SpamType` tinyint unsigned NOT NULL COMMENT '0 = mail, 1 = chat, 2 = calendar',
  `SpammerGuid` int unsigned NOT NULL DEFAULT '0',
  `Unk1` int unsigned DEFAULT '0',
  `MailIdOrMessageType` int unsigned DEFAULT '0',
  `ChannelId` int unsigned DEFAULT NULL COMMENT 'Only used if SpamType = 1',
  `SecondsSinceMessage` int unsigned DEFAULT NULL COMMENT 'Only used if SpamType = 1',
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Time` int DEFAULT NULL COMMENT 'Time of report',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spam_reports`
--

LOCK TABLES `spam_reports` WRITE;
/*!40000 ALTER TABLE `spam_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `spam_reports` ENABLE KEYS */;
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
INSERT INTO `updates` VALUES ('2023_04_24_00.sql','D164A70B22B2462464484614018C3218B3259AE4','ARCHIVED','2024-01-20 14:25:01',30),('2023_05_23_00.sql','A1A442D3F5049CDA2C067761F768C08BEFFFD26A','ARCHIVED','2024-01-20 14:25:01',35),('2023_09_16_00.sql','5760BA953E3F0C73492B979A33A86771B82CE464','ARCHIVED','2024-01-20 14:25:01',68),('2024_01_20_00.sql','FB9F840C7601C4F0939D23E87377D7DD9D145094','ARCHIVED','2024-01-20 14:25:01',26),('2024_07_05_00.sql','1C9590EBB81D192A2DF101D6B0B2178E45306500','ARCHIVED','2024-07-17 00:46:08',88),('2024_09_03_00.sql','6D7992803C7747E9CDE15A6EF0A0319DEE93DA51','ARCHIVED','2024-12-17 21:51:20',146),('2024_09_22_00.sql','CC603A632BB6E01737A3D2DF7A85D1BEFF16C102','ARCHIVED','2024-12-17 21:51:20',96),('2024_11_15_00.sql','AC109BE8DC3ABD09435A700F8ADE0050B9CB5170','ARCHIVED','2024-12-17 21:51:20',72),('2025_01_31_00.sql','49B70E7107D57C75198BA707B849A6243A32863F','ARCHIVED','2025-07-19 10:16:15',44),('2025_02_12_00.sql','BF2260040A6B47500D6C24BE74DB61198E5DA966','ARCHIVED','2025-07-19 10:16:15',80),('2025_02_16_00.sql','BF15638A8F522A4D9DE51D42A71B860B95FB8031','ARCHIVED','2025-07-19 10:16:15',60),('2025_03_09_00.sql','9BC72C8A080EDC1B3ECCB81C8146C8A5EA7E4266','ARCHIVED','2025-07-19 10:16:16',540),('2025_07_11_00.sql','EA89D9F35FC3237E8B443902D6A7AD94DC7C8645','ARCHIVED','2025-07-19 10:16:16',127),('2025_07_29_00.sql','6BA914607D79FF1450D558EEDCF1CF54A9FA657C','ARCHIVED','2025-12-29 17:51:45',32),('2025_09_03_00.sql','195C01E5CF60AEE47D1706E684BD0EA7C040071F','ARCHIVED','2025-12-29 17:51:45',67),('2026_02_24_00.sql','4F45A6FFCA42BA1360B13F5B821B18B010CF0A84','RELEASED','2026-03-15 20:33:22',70),('2026_03_30_00.sql','0A18FF7D8290DFF372612DACB3373B100545472F','RELEASED','2026-06-01 22:33:30',75),('2026_04_03_00.sql','758EBF4D4AD7F9F32B6369B3DF4BBBABFDBE76A2','RELEASED','2026-06-01 22:33:30',69),('2026_04_12_00.sql','2D6D77938C372E10E83FA0F3C5C46BB12B8E3D62','RELEASED','2026-06-01 22:33:31',138),('2026_06_01_00.sql','78BD2F1DC0BE9FFEC721D18D11AB6C1AF3EEFAC9','RELEASED','2026-06-01 22:33:31',76),('2026_06_24_00.sql','C59C5507F38EB9CD4F4FD188801BDBE43FC9F9B1','RELEASED','2026-10-20 19:48:56',62),('2026_07_18_00.sql','1A6FB1287F00E5C61F338681CC61E28635A126BB','RELEASED','2026-10-20 19:48:56',62),('2026_07_21_00.sql','A8C6CE6CB0D966E5E94781912F2C98F828834FCE','RELEASED','2026-10-20 19:48:56',39),('2026_07_22_00.sql','E06DB4D9E2D92046B5F184FE2FC26DB6D0635C91','RELEASED','2026-10-20 19:48:56',24),('2026_08_15_00.sql','9384496780BA9C0A9E69DAEFFAE014D1F7064FE0','RELEASED','2026-10-20 19:48:56',26);
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
INSERT INTO `updates_include` VALUES ('$/data/sql/archive/db_characters','ARCHIVED'),('$/data/sql/custom/db_characters','CUSTOM'),('$/data/sql/updates/db_characters','RELEASED'),('$/data/sql/updates/pending_db_characters','PENDING');
/*!40000 ALTER TABLE `updates_include` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warden_action`
--

DROP TABLE IF EXISTS `warden_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warden_action` (
  `wardenId` smallint unsigned NOT NULL,
  `action` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`wardenId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warden_action`
--

LOCK TABLES `warden_action` WRITE;
/*!40000 ALTER TABLE `warden_action` DISABLE KEYS */;
INSERT INTO `warden_action` VALUES (437,0);
/*!40000 ALTER TABLE `warden_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `world_state`
--

DROP TABLE IF EXISTS `world_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `world_state` (
  `Id` int unsigned NOT NULL COMMENT 'Internal save ID',
  `Data` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='WorldState save system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `world_state`
--

LOCK TABLES `world_state` WRITE;
/*!40000 ALTER TABLE `world_state` DISABLE KEYS */;
INSERT INTO `world_state` VALUES (20,'3 15 10000 10000 10000 10000 10000 10000 10000 10000 10000 10000 3 80 80 80');
/*!40000 ALTER TABLE `world_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worldstates`
--

DROP TABLE IF EXISTS `worldstates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worldstates` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `value` int unsigned NOT NULL DEFAULT '0',
  `comment` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Variable Saves';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worldstates`
--

LOCK TABLES `worldstates` WRITE;
/*!40000 ALTER TABLE `worldstates` DISABLE KEYS */;
INSERT INTO `worldstates` VALUES (1,0,NULL),(2,0,NULL),(3,0,NULL),(4,0,NULL),(5,0,NULL),(6,0,NULL),(7,0,NULL),(8,0,NULL),(9,0,NULL),(10,0,NULL),(11,0,NULL),(12,1792597269,NULL),(13,0,NULL),(14,0,NULL),(15,0,NULL),(16,0,NULL),(17,0,NULL),(18,0,NULL),(19,0,NULL),(20,0,NULL),(21,0,NULL),(22,0,NULL),(23,0,NULL),(24,0,NULL),(25,0,NULL),(26,0,NULL),(27,0,NULL),(28,0,NULL),(29,0,NULL),(30,0,NULL),(31,0,NULL),(32,0,NULL),(33,0,NULL),(34,0,NULL),(35,0,NULL),(36,0,NULL),(37,0,NULL),(38,0,NULL),(39,0,NULL),(40,0,NULL),(41,0,NULL),(42,0,NULL),(43,0,NULL),(44,0,NULL),(45,0,NULL),(46,0,NULL),(47,0,NULL),(48,0,NULL),(49,0,NULL),(50,0,NULL),(51,0,NULL),(52,0,NULL),(53,0,NULL),(54,0,NULL),(55,0,NULL),(56,0,NULL),(57,0,NULL),(58,0,NULL),(59,0,NULL),(60,0,NULL),(61,0,NULL),(62,0,NULL),(63,0,NULL),(64,0,NULL),(65,0,NULL),(66,0,NULL),(67,0,NULL),(68,0,NULL),(69,0,NULL),(70,0,NULL),(71,0,NULL),(72,0,NULL),(73,0,NULL),(74,0,NULL),(75,0,NULL),(76,0,NULL),(77,0,NULL),(78,0,NULL),(79,0,NULL),(80,0,NULL),(81,0,NULL),(82,0,NULL),(83,0,NULL),(84,0,NULL),(85,0,NULL),(86,0,NULL),(87,0,NULL),(88,0,NULL),(89,0,NULL),(90,0,NULL),(91,0,NULL),(92,0,NULL),(93,0,NULL),(94,0,NULL),(95,0,NULL),(96,0,NULL),(97,0,NULL),(98,0,NULL),(99,0,NULL),(100,0,NULL),(101,0,NULL),(102,0,NULL),(103,0,NULL),(104,0,NULL),(105,0,NULL),(106,0,NULL),(107,0,NULL),(108,0,NULL),(109,0,NULL),(110,0,NULL),(111,0,NULL),(112,0,NULL),(113,0,NULL),(114,0,NULL),(115,0,NULL),(116,0,NULL),(117,0,NULL),(118,0,NULL),(119,0,NULL),(120,0,NULL),(121,0,NULL),(122,0,NULL),(123,0,NULL),(124,0,NULL),(125,0,NULL),(126,0,NULL),(127,0,NULL),(128,0,NULL),(129,0,NULL),(130,0,NULL),(131,0,NULL),(132,0,NULL),(133,0,NULL),(134,0,NULL),(135,0,NULL),(136,0,NULL),(137,0,NULL),(138,0,NULL),(139,0,NULL),(140,0,NULL),(141,0,NULL),(142,0,NULL),(143,0,NULL),(144,0,NULL),(145,0,NULL),(146,0,NULL),(147,0,NULL),(148,0,NULL),(149,0,NULL),(150,0,NULL),(151,0,NULL),(152,0,NULL),(153,0,NULL),(154,0,NULL),(155,0,NULL),(156,0,NULL),(157,0,NULL),(158,0,NULL),(159,0,NULL),(160,0,NULL),(161,0,NULL),(162,0,NULL),(163,0,NULL),(164,0,NULL),(165,0,NULL),(166,0,NULL),(167,0,NULL),(168,0,NULL),(169,0,NULL),(170,0,NULL),(171,0,NULL),(172,0,NULL),(173,0,NULL),(174,0,NULL),(175,0,NULL),(176,0,NULL),(177,0,NULL),(178,0,NULL),(179,0,NULL),(180,0,NULL),(181,0,NULL),(182,0,NULL),(183,0,NULL),(184,0,NULL),(185,0,NULL),(186,0,NULL),(187,0,NULL),(188,0,NULL),(189,0,NULL),(190,0,NULL),(197,0,'Fishing Extravaganza - STV_FISHING_PREV_WIN_TIME'),(198,0,'Fishing Extravaganza - STV_FISHING_HAS_WINNER'),(199,0,'Fishing Extravaganza - STV_FISHING_ANNOUNCE_EVENT_BEGIN'),(200,0,'Fishing Extravaganza - STV_FISHING_ANNOUNCE_POOLS_DESPAN'),(3698,4,NULL),(3699,4,NULL),(3700,4,NULL),(3701,4,NULL),(3702,7,NULL),(3703,7,NULL),(3704,7,NULL),(3705,7,NULL),(3706,7,NULL),(3711,4,NULL),(3712,4,NULL),(3713,4,NULL),(3714,4,NULL),(3749,4,NULL),(3750,4,NULL),(3751,4,NULL),(3752,4,NULL),(3753,4,NULL),(3754,4,NULL),(3755,4,NULL),(3756,4,NULL),(3757,4,NULL),(3758,4,NULL),(3759,4,NULL),(3760,4,NULL),(3761,4,NULL),(3762,4,NULL),(3763,4,NULL),(3764,4,NULL),(3765,4,NULL),(3766,4,NULL),(3767,4,NULL),(3768,4,NULL),(3769,4,NULL),(3770,4,NULL),(3771,4,NULL),(3772,4,NULL),(3773,4,NULL),(3781,1742860,NULL),(3801,1,NULL),(3802,1,NULL),(4024,2,NULL),(20001,1454691600,'NextArenaPointDistributionTime'),(20002,1792648800,'NextWeeklyQuestResetTime'),(20003,1792648800,'NextBGRandomDailyResetTime'),(20004,0,'cleaning_flags'),(20005,1792648800,'NextDailyQuestResetTime'),(20006,1792648800,'NextGuildDailyResetTime'),(20007,1793512800,'NextMonthlyQuestResetTime'),(20008,1792648800,NULL);
/*!40000 ALTER TABLE `worldstates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'acore_characters'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-21 10:16:01
