-- MySQL dump 10.14  Distrib 5.5.52-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: zabbix
-- ------------------------------------------------------
-- Server version	5.5.52-MariaDB

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
-- Table structure for table `acknowledges`
--

DROP TABLE IF EXISTS `acknowledges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acknowledges` (
  `acknowledgeid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `message` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`acknowledgeid`),
  KEY `acknowledges_1` (`userid`),
  KEY `acknowledges_2` (`eventid`),
  KEY `acknowledges_3` (`clock`),
  CONSTRAINT `c_acknowledges_2` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_acknowledges_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acknowledges`
--

LOCK TABLES `acknowledges` WRITE;
/*!40000 ALTER TABLE `acknowledges` DISABLE KEYS */;
/*!40000 ALTER TABLE `acknowledges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `actionid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `eventsource` int(11) NOT NULL DEFAULT '0',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `esc_period` int(11) NOT NULL DEFAULT '0',
  `def_shortdata` varchar(255) NOT NULL DEFAULT '',
  `def_longdata` text NOT NULL,
  `recovery_msg` int(11) NOT NULL DEFAULT '0',
  `r_shortdata` varchar(255) NOT NULL DEFAULT '',
  `r_longdata` text NOT NULL,
  `formula` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`actionid`),
  UNIQUE KEY `actions_2` (`name`),
  KEY `actions_1` (`eventsource`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (2,'Auto discovery. Linux servers.',1,0,1,0,'','',0,'','',''),(3,'Report problems to Zabbix administrators',0,0,1,3600,'{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}\r\n\r\nOriginal event ID: {EVENT.ID}',1,'{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}\r\n\r\nOriginal event ID: {EVENT.ID}',''),(4,'Report not supported items',3,0,1,3600,'{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}',1,'{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}',''),(5,'Report not supported low level discovery rules',3,0,1,3600,'{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}',1,'{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}',''),(6,'Report unknown triggers',3,0,1,3600,'{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}',1,'{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}',''),(7,'Send E-mail',0,0,0,120,'Cluster故障: {HOST.IP}  {EVENT.TIME} {TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\n\r\nItem values:\r\n\r\n{ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n\r\nOriginal event ID: {EVENT.ID}',1,'Cluster故障恢复: {HOST.IP}  {TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\n\r\nItem values:\r\n\r\n{ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n\r\nOriginal event ID: {EVENT.ID}',''),(8,'Auto registration:controller',2,0,1,0,'Auto registration: {HOST.HOST}','Host name: {HOST.HOST}\r\nHost IP: {HOST.IP}\r\nAgent port: {HOST.PORT}',0,'','',''),(9,'Auto registration:compute',2,0,1,0,'Auto registration: {HOST.HOST}','Host name: {HOST.HOST}\r\nHost IP: {HOST.IP}\r\nAgent port: {HOST.PORT}',0,'','',''),(10,'Auto registration:ceph',2,0,1,0,'Auto registration: {HOST.HOST}','Host name: {HOST.HOST}\r\nHost IP: {HOST.IP}\r\nAgent port: {HOST.PORT}',0,'','',''),(11,'send wechat',0,0,0,3600,'Cluster: {HOST.IP}  {EVENT.TIME} {TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\n\r\nItem values:\r\n\r\n{ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n\r\nOriginal event ID: {EVENT.ID}',1,'Cluster: {HOST.IP}  {TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\n\r\nItem values:\r\n\r\n{ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n\r\nOriginal event ID: {EVENT.ID}','');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `alertid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `mediatypeid` bigint(20) unsigned DEFAULT NULL,
  `sendto` varchar(100) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `retries` int(11) NOT NULL DEFAULT '0',
  `error` varchar(128) NOT NULL DEFAULT '',
  `esc_step` int(11) NOT NULL DEFAULT '0',
  `alerttype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`alertid`),
  KEY `alerts_1` (`actionid`),
  KEY `alerts_2` (`clock`),
  KEY `alerts_3` (`eventid`),
  KEY `alerts_4` (`status`,`retries`),
  KEY `alerts_5` (`mediatypeid`),
  KEY `alerts_6` (`userid`),
  CONSTRAINT `c_alerts_4` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_2` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_discovery`
--

DROP TABLE IF EXISTS `application_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_discovery` (
  `application_discoveryid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`application_discoveryid`),
  KEY `application_discovery_1` (`applicationid`),
  KEY `application_discovery_2` (`application_prototypeid`),
  CONSTRAINT `c_application_discovery_2` FOREIGN KEY (`application_prototypeid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_discovery_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_discovery`
--

LOCK TABLES `application_discovery` WRITE;
/*!40000 ALTER TABLE `application_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_prototype`
--

DROP TABLE IF EXISTS `application_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_prototype` (
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`application_prototypeid`),
  KEY `application_prototype_1` (`itemid`),
  KEY `application_prototype_2` (`templateid`),
  CONSTRAINT `c_application_prototype_2` FOREIGN KEY (`templateid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_prototype_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_prototype`
--

LOCK TABLES `application_prototype` WRITE;
/*!40000 ALTER TABLE `application_prototype` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_template`
--

DROP TABLE IF EXISTS `application_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_template` (
  `application_templateid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`application_templateid`),
  UNIQUE KEY `application_template_1` (`applicationid`,`templateid`),
  KEY `application_template_2` (`templateid`),
  CONSTRAINT `c_application_template_2` FOREIGN KEY (`templateid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_template_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_template`
--

LOCK TABLES `application_template` WRITE;
/*!40000 ALTER TABLE `application_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `applicationid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`applicationid`),
  UNIQUE KEY `applications_2` (`hostid`,`name`),
  CONSTRAINT `c_applications_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (345,10084,'Zabbix server',0),(346,10084,'CPU',0),(347,10084,'Filesystems',0),(348,10084,'General',0),(349,10084,'Memory',0),(350,10084,'Network interfaces',0),(351,10084,'OS',0),(352,10084,'Performance',0),(353,10084,'Processes',0),(354,10084,'Security',0),(355,10084,'Zabbix agent',0),(387,10107,'Openstack',0),(388,10108,'Openstack',0),(389,10109,'Openstack',0),(390,10110,'Openstack',0),(391,10111,'Openstack',0),(392,10112,'Openstack',0),(393,10113,'Openstack',0),(394,10114,'Openstack',0),(395,10115,'Openstack',0),(396,10116,'Openstack',0),(397,10117,'CephProNum',0),(398,10118,'Ceph_State',0),(399,10119,'IO_states',0),(400,10120,'MySQL',0),(401,10121,'Openstack',0),(402,10122,'Openstack',0),(403,10123,'SSH service',0),(404,10124,'Zabbix agent',0),(405,10125,'Zabbix proxy',0),(406,10126,'Zabbix server',0),(407,10127,'CPU',0),(408,10127,'Filesystems',0),(409,10127,'General',0),(410,10127,'Memory',0),(411,10127,'Network interfaces',0),(412,10127,'OS',0),(413,10127,'Performance',0),(414,10127,'Processes',0),(415,10127,'scripts',0),(416,10127,'Security',0),(417,10127,'Zabbix agent',0),(418,10128,'CPU',0),(419,10128,'Filesystems',0),(420,10128,'General',0),(421,10128,'Memory',0),(422,10128,'Network interfaces',0),(423,10128,'OS',0),(424,10128,'Performance',0),(425,10128,'Processes',0),(426,10128,'Zabbix agent',0),(427,10129,'Aria Page Cache',0),(428,10130,'fpmmm',0),(429,10131,'Galera',0),(430,10132,'InnoDB',0),(431,10132,'InnoDB Buffer Pool',0),(432,10132,'InnoDB Global Variables',0),(433,10132,'InnoDB Locking',0),(434,10132,'InnoDB Log File',0),(435,10132,'InnoDB Rows',0),(436,10132,'InnoDB Transactions',0),(437,10133,'Binlog',0),(438,10133,'Events',0),(439,10133,'Master Global Variables',0),(440,10133,'Slaves',0),(441,10134,'Connections',0),(442,10134,'MySQL',0),(443,10134,'MySQL Global Variables',0),(444,10134,'MySQL Performance',0),(445,10134,'Query Cache',0),(446,10134,'Table',0),(447,10135,'CPU',0),(448,10135,'Process',0),(449,10135,'Virtual Memory',0),(450,10136,'Security',0),(451,10137,'CPU',0),(452,10137,'Filesystem',0),(453,10137,'IO',0),(454,10137,'Memory',0),(455,10137,'Network',0),(456,10138,'Slave Global Variables',0),(457,10138,'Slave positions',0),(458,10138,'Slave threads',0);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog` (
  `auditid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '0',
  `resourcetype` int(11) NOT NULL DEFAULT '0',
  `details` varchar(128) NOT NULL DEFAULT '0',
  `ip` varchar(39) NOT NULL DEFAULT '',
  `resourceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `resourcename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`auditid`),
  KEY `auditlog_1` (`userid`,`clock`),
  KEY `auditlog_2` (`clock`),
  CONSTRAINT `c_auditlog_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog`
--

LOCK TABLES `auditlog` WRITE;
/*!40000 ALTER TABLE `auditlog` DISABLE KEYS */;
INSERT INTO `auditlog` VALUES (1,1,1490925968,3,0,'0','10.103.196.191',1,''),(2,1,1490925978,2,31,'0','10.103.196.191',13266,'Free disk space is less than 20% on volume {#FSNAME}:{12592}<20'),(3,1,1490925978,2,31,'0','10.103.196.191',13272,'Free inodes is less than 20% on volume {#FSNAME}:{12598}<20'),(4,1,1490925978,2,31,'0','10.103.196.191',13287,'Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}:{12671}=1'),(5,1,1490925978,2,31,'0','10.103.196.191',13288,'Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}:{12672}=1'),(6,1,1490925978,2,31,'0','10.103.196.191',13289,'Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}:{12673}=1'),(7,1,1490925978,2,31,'0','10.103.196.191',13291,'Free disk space is less than 20% on volume {#SNMPVALUE}:{12675} / {12676} > 0.8'),(8,1,1490925978,2,31,'0','10.103.196.191',13292,'Free disk space is less than 20% on volume {#SNMPVALUE}:{12677} / {12678} > 0.8'),(9,1,1490925978,2,31,'0','10.103.196.191',13293,'Free disk space is less than 20% on volume {#SNMPVALUE}:{12679} / {12680} > 0.8'),(10,1,1490925978,2,31,'0','10.103.196.191',13294,'Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}:{12681}=1'),(11,1,1490925978,2,31,'0','10.103.196.191',13342,'Free inodes is less than 20% on volume {#FSNAME}:{12729}<20'),(12,1,1490925978,2,31,'0','10.103.196.191',13343,'Free disk space is less than 20% on volume {#FSNAME}:{12730}<20'),(13,1,1490925978,2,31,'0','10.103.196.191',13358,'Free inodes is less than 20% on volume {#FSNAME}:{12745}<20'),(14,1,1490925978,2,31,'0','10.103.196.191',13359,'Free disk space is less than 20% on volume {#FSNAME}:{12746}<20'),(15,1,1490925978,2,31,'0','10.103.196.191',13374,'Free inodes is less than 20% on volume {#FSNAME}:{12761}<20'),(16,1,1490925978,2,31,'0','10.103.196.191',13375,'Free disk space is less than 20% on volume {#FSNAME}:{12762}<20'),(17,1,1490925978,2,31,'0','10.103.196.191',13390,'Free inodes is less than 20% on volume {#FSNAME}:{12777}<20'),(18,1,1490925978,2,31,'0','10.103.196.191',13391,'Free disk space is less than 20% on volume {#FSNAME}:{12778}<20'),(19,1,1490925978,2,31,'0','10.103.196.191',13406,'Free inodes is less than 20% on volume {#FSNAME}:{12793}<20'),(20,1,1490925978,2,31,'0','10.103.196.191',13407,'Free disk space is less than 20% on volume {#FSNAME}:{12794}<20'),(21,1,1490925978,2,31,'0','10.103.196.191',13422,'Free inodes is less than 20% on volume {#FSNAME}:{12809}<20'),(22,1,1490925978,2,31,'0','10.103.196.191',13423,'Free disk space is less than 20% on volume {#FSNAME}:{12810}<20'),(23,1,1490925978,2,31,'0','10.103.196.191',13439,'Free disk space is less than 20% on volume {#FSNAME}:{12826}<20'),(24,1,1490925979,2,13,'0','10.103.196.191',10010,'Processor load is too high on {HOST.NAME}'),(25,1,1490925979,2,13,'0','10.103.196.191',10011,'Too many processes running on {HOST.NAME}'),(26,1,1490925979,2,13,'0','10.103.196.191',10012,'Lack of free swap space on {HOST.NAME}'),(27,1,1490925979,2,13,'0','10.103.196.191',10016,'/etc/passwd has been changed on {HOST.NAME}'),(28,1,1490925979,2,13,'0','10.103.196.191',10021,'{HOST.NAME} has just been restarted'),(29,1,1490925979,2,13,'0','10.103.196.191',10041,'Configured max number of processes is too low on {HOST.NAME}'),(30,1,1490925979,2,13,'0','10.103.196.191',10042,'Configured max number of opened files is too low on {HOST.NAME}'),(31,1,1490925979,2,13,'0','10.103.196.191',10043,'Hostname was changed on {HOST.NAME}'),(32,1,1490925979,2,13,'0','10.103.196.191',10044,'Host information was changed on {HOST.NAME}'),(33,1,1490925979,2,13,'0','10.103.196.191',10045,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(34,1,1490925979,2,13,'0','10.103.196.191',10047,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(35,1,1490925979,2,13,'0','10.103.196.191',10190,'Too many processes on {HOST.NAME}'),(36,1,1490925979,2,13,'0','10.103.196.191',13000,'Lack of available memory on server {HOST.NAME}'),(37,1,1490925979,2,13,'0','10.103.196.191',13015,'Less than 25% free in the configuration cache'),(38,1,1490925979,2,13,'0','10.103.196.191',13017,'Less than 25% free in the history index cache'),(39,1,1490925979,2,13,'0','10.103.196.191',13019,'Less than 25% free in the trends cache'),(40,1,1490925979,2,13,'0','10.103.196.191',13023,'More than 100 items having missing data for more than 10 minutes'),(41,1,1490925979,2,13,'0','10.103.196.191',13025,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(42,1,1490925979,2,13,'0','10.103.196.191',13026,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(43,1,1490925979,2,13,'0','10.103.196.191',13073,'Less than 25% free in the history cache'),(44,1,1490925979,2,13,'0','10.103.196.191',13074,'Less than 5% free in the value cache'),(45,1,1490925979,2,13,'0','10.103.196.191',13080,'Zabbix alerter processes more than 75% busy'),(46,1,1490925979,2,13,'0','10.103.196.191',13081,'Zabbix configuration syncer processes more than 75% busy'),(47,1,1490925979,2,13,'0','10.103.196.191',13082,'Zabbix db watchdog processes more than 75% busy'),(48,1,1490925979,2,13,'0','10.103.196.191',13083,'Zabbix discoverer processes more than 75% busy'),(49,1,1490925979,2,13,'0','10.103.196.191',13084,'Zabbix escalator processes more than 75% busy'),(50,1,1490925979,2,13,'0','10.103.196.191',13085,'Zabbix history syncer processes more than 75% busy'),(51,1,1490925979,2,13,'0','10.103.196.191',13086,'Zabbix housekeeper processes more than 75% busy'),(52,1,1490925979,2,13,'0','10.103.196.191',13087,'Zabbix http poller processes more than 75% busy'),(53,1,1490925979,2,13,'0','10.103.196.191',13088,'Zabbix icmp pinger processes more than 75% busy'),(54,1,1490925979,2,13,'0','10.103.196.191',13089,'Zabbix ipmi poller processes more than 75% busy'),(55,1,1490925979,2,13,'0','10.103.196.191',13091,'Zabbix poller processes more than 75% busy'),(56,1,1490925979,2,13,'0','10.103.196.191',13092,'Zabbix proxy poller processes more than 75% busy'),(57,1,1490925979,2,13,'0','10.103.196.191',13093,'Zabbix self-monitoring processes more than 75% busy'),(58,1,1490925979,2,13,'0','10.103.196.191',13094,'Zabbix timer processes more than 75% busy'),(59,1,1490925979,2,13,'0','10.103.196.191',13095,'Zabbix trapper processes more than 75% busy'),(60,1,1490925979,2,13,'0','10.103.196.191',13096,'Zabbix unreachable poller processes more than 75% busy'),(61,1,1490925979,2,13,'0','10.103.196.191',13097,'Zabbix vmware collector processes more than 75% busy'),(62,1,1490925979,2,13,'0','10.103.196.191',13243,'Disk I/O is overloaded on {HOST.NAME}'),(63,1,1490925979,2,13,'0','10.103.196.191',13275,'Zabbix java poller processes more than 75% busy'),(64,1,1490925979,2,13,'0','10.103.196.191',13285,'Telnet service is down on {HOST.NAME}'),(65,1,1490925979,2,13,'0','10.103.196.191',13295,'Baseboard Temp Critical [{ITEM.VALUE}]'),(66,1,1490925979,2,13,'0','10.103.196.191',13296,'Baseboard Temp Non-Critical [{ITEM.VALUE}]'),(67,1,1490925979,2,13,'0','10.103.196.191',13297,'BB +1.05V PCH Critical [{ITEM.VALUE}]'),(68,1,1490925979,2,13,'0','10.103.196.191',13298,'BB +1.05V PCH Non-Critical [{ITEM.VALUE}]'),(69,1,1490925979,2,13,'0','10.103.196.191',13299,'BB +1.1V P1 Vccp Critical [{ITEM.VALUE}]'),(70,1,1490925979,2,13,'0','10.103.196.191',13300,'BB +1.1V P1 Vccp Non-Critical [{ITEM.VALUE}]'),(71,1,1490925979,2,13,'0','10.103.196.191',13301,'BB +1.5V P1 DDR3 Critical [{ITEM.VALUE}]'),(72,1,1490925979,2,13,'0','10.103.196.191',13302,'BB +1.5V P1 DDR3 Non-Critical [{ITEM.VALUE}]'),(73,1,1490925979,2,13,'0','10.103.196.191',13303,'BB +1.8V SM Critical [{ITEM.VALUE}]'),(74,1,1490925979,2,13,'0','10.103.196.191',13304,'BB +1.8V SM Non-Critical [{ITEM.VALUE}]'),(75,1,1490925979,2,13,'0','10.103.196.191',13305,'BB +3.3V Critical [{ITEM.VALUE}]'),(76,1,1490925979,2,13,'0','10.103.196.191',13306,'BB +3.3V Critical [{ITEM.VALUE}]'),(77,1,1490925979,2,13,'0','10.103.196.191',13307,'BB +3.3V Non-Critical [{ITEM.VALUE}]'),(78,1,1490925979,2,13,'0','10.103.196.191',13308,'BB +3.3V Non-Critical [{ITEM.VALUE}]'),(79,1,1490925979,2,13,'0','10.103.196.191',13309,'BB +3.3V STBY Critical [{ITEM.VALUE}]'),(80,1,1490925979,2,13,'0','10.103.196.191',13310,'BB +3.3V STBY Critical [{ITEM.VALUE}]'),(81,1,1490925979,2,13,'0','10.103.196.191',13311,'BB +3.3V STBY Non-Critical [{ITEM.VALUE}]'),(82,1,1490925979,2,13,'0','10.103.196.191',13312,'BB +3.3V STBY Non-Critical [{ITEM.VALUE}]'),(83,1,1490925979,2,13,'0','10.103.196.191',13313,'BB +5.0V Critical [{ITEM.VALUE}]'),(84,1,1490925979,2,13,'0','10.103.196.191',13314,'BB +5.0V Critical [{ITEM.VALUE}]'),(85,1,1490925979,2,13,'0','10.103.196.191',13315,'BB +5.0V Non-Critical [{ITEM.VALUE}]'),(86,1,1490925979,2,13,'0','10.103.196.191',13316,'BB +5.0V Non-Critical [{ITEM.VALUE}]'),(87,1,1490925979,2,13,'0','10.103.196.191',13317,'BB Ambient Temp Critical [{ITEM.VALUE}]'),(88,1,1490925979,2,13,'0','10.103.196.191',13318,'BB Ambient Temp Non-Critical [{ITEM.VALUE}]'),(89,1,1490925979,2,13,'0','10.103.196.191',13319,'Front Panel Temp Critical [{ITEM.VALUE}]'),(90,1,1490925979,2,13,'0','10.103.196.191',13320,'Front Panel Temp Non-Critical [{ITEM.VALUE}]'),(91,1,1490925979,2,13,'0','10.103.196.191',13321,'Power'),(92,1,1490925979,2,13,'0','10.103.196.191',13322,'Power'),(93,1,1490925979,2,13,'0','10.103.196.191',13323,'System Fan 2 Critical [{ITEM.VALUE}]'),(94,1,1490925979,2,13,'0','10.103.196.191',13324,'System Fan 2 Non-Critical [{ITEM.VALUE}]'),(95,1,1490925979,2,13,'0','10.103.196.191',13325,'System Fan 3 Critical [{ITEM.VALUE}]'),(96,1,1490925979,2,13,'0','10.103.196.191',13326,'System Fan 3 Non-Critical [{ITEM.VALUE}]'),(97,1,1490925979,2,13,'0','10.103.196.191',13327,'MySQL is down'),(98,1,1490925979,2,13,'0','10.103.196.191',13328,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(99,1,1490925979,2,13,'0','10.103.196.191',13329,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(100,1,1490925979,2,13,'0','10.103.196.191',13330,'Configured max number of opened files is too low on {HOST.NAME}'),(101,1,1490925979,2,13,'0','10.103.196.191',13331,'Configured max number of processes is too low on {HOST.NAME}'),(102,1,1490925979,2,13,'0','10.103.196.191',13332,'Too many processes running on {HOST.NAME}'),(103,1,1490925979,2,13,'0','10.103.196.191',13333,'Too many processes on {HOST.NAME}'),(104,1,1490925979,2,13,'0','10.103.196.191',13334,'Processor load is too high on {HOST.NAME}'),(105,1,1490925979,2,13,'0','10.103.196.191',13336,'Hostname was changed on {HOST.NAME}'),(106,1,1490925979,2,13,'0','10.103.196.191',13337,'Lack of free swap space on {HOST.NAME}'),(107,1,1490925979,2,13,'0','10.103.196.191',13338,'Host information was changed on {HOST.NAME}'),(108,1,1490925979,2,13,'0','10.103.196.191',13339,'{HOST.NAME} has just been restarted'),(109,1,1490925979,2,13,'0','10.103.196.191',13340,'/etc/passwd has been changed on {HOST.NAME}'),(110,1,1490925979,2,13,'0','10.103.196.191',13341,'Lack of available memory on server {HOST.NAME}'),(111,1,1490925979,2,13,'0','10.103.196.191',13344,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(112,1,1490925979,2,13,'0','10.103.196.191',13345,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(113,1,1490925979,2,13,'0','10.103.196.191',13346,'Configured max number of opened files is too low on {HOST.NAME}'),(114,1,1490925979,2,13,'0','10.103.196.191',13347,'Configured max number of processes is too low on {HOST.NAME}'),(115,1,1490925979,2,13,'0','10.103.196.191',13348,'Too many processes running on {HOST.NAME}'),(116,1,1490925979,2,13,'0','10.103.196.191',13349,'Too many processes on {HOST.NAME}'),(117,1,1490925979,2,13,'0','10.103.196.191',13350,'Processor load is too high on {HOST.NAME}'),(118,1,1490925979,2,13,'0','10.103.196.191',13352,'Hostname was changed on {HOST.NAME}'),(119,1,1490925979,2,13,'0','10.103.196.191',13353,'Lack of free swap space on {HOST.NAME}'),(120,1,1490925979,2,13,'0','10.103.196.191',13354,'Host information was changed on {HOST.NAME}'),(121,1,1490925979,2,13,'0','10.103.196.191',13355,'{HOST.NAME} has just been restarted'),(122,1,1490925979,2,13,'0','10.103.196.191',13356,'/etc/passwd has been changed on {HOST.NAME}'),(123,1,1490925979,2,13,'0','10.103.196.191',13357,'Lack of available memory on server {HOST.NAME}'),(124,1,1490925979,2,13,'0','10.103.196.191',13360,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(125,1,1490925979,2,13,'0','10.103.196.191',13361,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(126,1,1490925979,2,13,'0','10.103.196.191',13364,'Too many processes running on {HOST.NAME}'),(127,1,1490925979,2,13,'0','10.103.196.191',13365,'Too many processes on {HOST.NAME}'),(128,1,1490925979,2,13,'0','10.103.196.191',13366,'Processor load is too high on {HOST.NAME}'),(129,1,1490925979,2,13,'0','10.103.196.191',13367,'Disk I/O is overloaded on {HOST.NAME}'),(130,1,1490925979,2,13,'0','10.103.196.191',13368,'Hostname was changed on {HOST.NAME}'),(131,1,1490925979,2,13,'0','10.103.196.191',13370,'Host information was changed on {HOST.NAME}'),(132,1,1490925979,2,13,'0','10.103.196.191',13371,'{HOST.NAME} has just been restarted'),(133,1,1490925979,2,13,'0','10.103.196.191',13372,'/etc/passwd has been changed on {HOST.NAME}'),(134,1,1490925979,2,13,'0','10.103.196.191',13373,'Lack of available memory on server {HOST.NAME}'),(135,1,1490925979,2,13,'0','10.103.196.191',13376,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(136,1,1490925979,2,13,'0','10.103.196.191',13377,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(137,1,1490925979,2,13,'0','10.103.196.191',13382,'Processor load is too high on {HOST.NAME}'),(138,1,1490925979,2,13,'0','10.103.196.191',13384,'Hostname was changed on {HOST.NAME}'),(139,1,1490925979,2,13,'0','10.103.196.191',13386,'Host information was changed on {HOST.NAME}'),(140,1,1490925979,2,13,'0','10.103.196.191',13388,'/etc/passwd has been changed on {HOST.NAME}'),(141,1,1490925979,2,13,'0','10.103.196.191',13389,'Lack of available memory on server {HOST.NAME}'),(142,1,1490925979,2,13,'0','10.103.196.191',13392,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(143,1,1490925979,2,13,'0','10.103.196.191',13393,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(144,1,1490925979,2,13,'0','10.103.196.191',13395,'Configured max number of processes is too low on {HOST.NAME}'),(145,1,1490925979,2,13,'0','10.103.196.191',13396,'Too many processes running on {HOST.NAME}'),(146,1,1490925979,2,13,'0','10.103.196.191',13397,'Too many processes on {HOST.NAME}'),(147,1,1490925979,2,13,'0','10.103.196.191',13398,'Processor load is too high on {HOST.NAME}'),(148,1,1490925979,2,13,'0','10.103.196.191',13399,'Disk I/O is overloaded on {HOST.NAME}'),(149,1,1490925979,2,13,'0','10.103.196.191',13400,'Hostname was changed on {HOST.NAME}'),(150,1,1490925979,2,13,'0','10.103.196.191',13401,'Lack of free swap space on {HOST.NAME}'),(151,1,1490925979,2,13,'0','10.103.196.191',13402,'Host information was changed on {HOST.NAME}'),(152,1,1490925979,2,13,'0','10.103.196.191',13403,'{HOST.NAME} has just been restarted'),(153,1,1490925979,2,13,'0','10.103.196.191',13404,'/etc/passwd has been changed on {HOST.NAME}'),(154,1,1490925979,2,13,'0','10.103.196.191',13405,'Lack of available memory on server {HOST.NAME}'),(155,1,1490925979,2,13,'0','10.103.196.191',13408,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(156,1,1490925979,2,13,'0','10.103.196.191',13409,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(157,1,1490925979,2,13,'0','10.103.196.191',13410,'Configured max number of opened files is too low on {HOST.NAME}'),(158,1,1490925979,2,13,'0','10.103.196.191',13411,'Configured max number of processes is too low on {HOST.NAME}'),(159,1,1490925979,2,13,'0','10.103.196.191',13414,'Processor load is too high on {HOST.NAME}'),(160,1,1490925979,2,13,'0','10.103.196.191',13416,'Hostname was changed on {HOST.NAME}'),(161,1,1490925979,2,13,'0','10.103.196.191',13418,'Host information was changed on {HOST.NAME}'),(162,1,1490925979,2,13,'0','10.103.196.191',13419,'{HOST.NAME} has just been restarted'),(163,1,1490925979,2,13,'0','10.103.196.191',13420,'/etc/passwd has been changed on {HOST.NAME}'),(164,1,1490925979,2,13,'0','10.103.196.191',13421,'Lack of available memory on server {HOST.NAME}'),(165,1,1490925979,2,13,'0','10.103.196.191',13425,'Host information was changed on {HOST.NAME}'),(166,1,1490925979,2,13,'0','10.103.196.191',13428,'{HOST.NAME} has just been restarted'),(167,1,1490925979,2,13,'0','10.103.196.191',13430,'Too many processes on {HOST.NAME}'),(168,1,1490925979,2,13,'0','10.103.196.191',13431,'Lack of available virtual memory on server {HOST.NAME}'),(169,1,1490925979,2,13,'0','10.103.196.191',13433,'Lack of free memory on server {HOST.NAME}'),(170,1,1490925979,2,13,'0','10.103.196.191',13435,'Processor load is too high on {HOST.NAME}'),(171,1,1490925979,2,13,'0','10.103.196.191',13437,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(172,1,1490925979,2,13,'0','10.103.196.191',13438,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(173,1,1490925979,2,13,'0','10.103.196.191',13441,'Zabbix snmp trapper processes more than 75% busy'),(174,1,1490925979,2,13,'0','10.103.196.191',13442,'70% http-8080 worker threads busy on {HOST.NAME}'),(175,1,1490925979,2,13,'0','10.103.196.191',13443,'70% http-8443 worker threads busy on {HOST.NAME}'),(176,1,1490925979,2,13,'0','10.103.196.191',13444,'70% jk-8009 worker threads busy on {HOST.NAME}'),(177,1,1490925979,2,13,'0','10.103.196.191',13445,'70% mp CMS Old Gen used on {HOST.NAME}'),(178,1,1490925979,2,13,'0','10.103.196.191',13446,'70% mp CMS Perm Gen used on {HOST.NAME}'),(179,1,1490925979,2,13,'0','10.103.196.191',13447,'70% mp Code Cache used on {HOST.NAME}'),(180,1,1490925979,2,13,'0','10.103.196.191',13448,'70% mp Perm Gen used on {HOST.NAME}'),(181,1,1490925979,2,13,'0','10.103.196.191',13449,'70% mp PS Old Gen used on {HOST.NAME}'),(182,1,1490925979,2,13,'0','10.103.196.191',13450,'70% mp PS Perm Gen used on {HOST.NAME}'),(183,1,1490925979,2,13,'0','10.103.196.191',13451,'70% mp Tenured Gen used on {HOST.NAME}'),(184,1,1490925979,2,13,'0','10.103.196.191',13452,'70% os Opened File Descriptor Count used on {HOST.NAME}'),(185,1,1490925979,2,13,'0','10.103.196.191',13453,'gc Concurrent Mark Sweep in fire fighting mode on {HOST.NAME}'),(186,1,1490925979,2,13,'0','10.103.196.191',13454,'gc Mark Sweep Compact in fire fighting mode on {HOST.NAME}'),(187,1,1490925979,2,13,'0','10.103.196.191',13455,'gc PS Mark Sweep in fire fighting mode on {HOST.NAME}'),(188,1,1490925979,2,13,'0','10.103.196.191',13456,'gzip compression is off for connector http-8080 on {HOST.NAME}'),(189,1,1490925979,2,13,'0','10.103.196.191',13457,'gzip compression is off for connector http-8443 on {HOST.NAME}'),(190,1,1490925979,2,13,'0','10.103.196.191',13458,'mp CMS Old Gen fully committed on {HOST.NAME}'),(191,1,1490925979,2,13,'0','10.103.196.191',13459,'mp CMS Perm Gen fully committed on {HOST.NAME}'),(192,1,1490925979,2,13,'0','10.103.196.191',13460,'mp Code Cache fully committed on {HOST.NAME}'),(193,1,1490925979,2,13,'0','10.103.196.191',13461,'mp Perm Gen fully committed on {HOST.NAME}'),(194,1,1490925979,2,13,'0','10.103.196.191',13462,'mp PS Old Gen fully committed on {HOST.NAME}'),(195,1,1490925979,2,13,'0','10.103.196.191',13463,'mp PS Perm Gen fully committed on {HOST.NAME}'),(196,1,1490925979,2,13,'0','10.103.196.191',13464,'mp Tenured Gen fully committed on {HOST.NAME}'),(197,1,1490925979,2,13,'0','10.103.196.191',13465,'{HOST.NAME} is not reachable'),(198,1,1490925979,2,13,'0','10.103.196.191',13466,'{HOST.NAME} uses suboptimal JIT compiler'),(199,1,1490925979,2,13,'0','10.103.196.191',13507,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(200,1,1490925979,2,13,'0','10.103.196.191',13508,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(201,1,1490925979,2,13,'0','10.103.196.191',13510,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(202,1,1490925979,2,13,'0','10.103.196.191',13511,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(203,1,1490925979,2,13,'0','10.103.196.191',13512,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(204,1,1490925979,2,13,'0','10.103.196.191',13513,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(205,1,1490925979,2,13,'0','10.103.196.191',13514,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(206,1,1490925979,2,13,'0','10.103.196.191',13515,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(207,1,1490925979,2,13,'0','10.103.196.191',13516,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(208,1,1490925979,2,13,'0','10.103.196.191',13517,'Less than 25% free in the configuration cache'),(209,1,1490925979,2,13,'0','10.103.196.191',13518,'Less than 25% free in the history cache'),(210,1,1490925979,2,13,'0','10.103.196.191',13519,'Less than 25% free in the history index cache'),(211,1,1490925979,2,13,'0','10.103.196.191',13520,'More than 100 items having missing data for more than 10 minutes'),(212,1,1490925979,2,13,'0','10.103.196.191',13521,'Zabbix configuration syncer processes more than 75% busy'),(213,1,1490925979,2,13,'0','10.103.196.191',13522,'Zabbix discoverer processes more than 75% busy'),(214,1,1490925979,2,13,'0','10.103.196.191',13523,'Zabbix history syncer processes more than 75% busy'),(215,1,1490925979,2,13,'0','10.103.196.191',13524,'Zabbix housekeeper processes more than 75% busy'),(216,1,1490925979,2,13,'0','10.103.196.191',13525,'Zabbix http poller processes more than 75% busy'),(217,1,1490925979,2,13,'0','10.103.196.191',13526,'Zabbix icmp pinger processes more than 75% busy'),(218,1,1490925979,2,13,'0','10.103.196.191',13527,'Zabbix ipmi poller processes more than 75% busy'),(219,1,1490925979,2,13,'0','10.103.196.191',13528,'Zabbix java poller processes more than 75% busy'),(220,1,1490925979,2,13,'0','10.103.196.191',13529,'Zabbix poller processes more than 75% busy'),(221,1,1490925979,2,13,'0','10.103.196.191',13530,'Zabbix self-monitoring processes more than 75% busy'),(222,1,1490925979,2,13,'0','10.103.196.191',13531,'Zabbix snmp trapper processes more than 75% busy'),(223,1,1490925979,2,13,'0','10.103.196.191',13532,'Zabbix trapper processes more than 75% busy'),(224,1,1490925979,2,13,'0','10.103.196.191',13533,'Zabbix unreachable poller processes more than 75% busy'),(225,1,1490925979,2,13,'0','10.103.196.191',13534,'Zabbix data sender processes more than 75% busy'),(226,1,1490925979,2,13,'0','10.103.196.191',13535,'Zabbix heartbeat sender processes more than 75% busy'),(227,1,1490925979,2,13,'0','10.103.196.191',13536,'Less than 25% free in the vmware cache'),(228,1,1490925979,2,13,'0','10.103.196.191',13538,'70% os Process CPU Load on {HOST.NAME}'),(229,1,1490925979,2,13,'0','10.103.196.191',13539,'70% mem Heap Memory used on {HOST.NAME}'),(230,1,1490925979,2,13,'0','10.103.196.191',13540,'70% mem Non-Heap Memory used on {HOST.NAME}'),(231,1,1490925979,2,13,'0','10.103.196.191',13541,'mem Heap Memory fully committed on {HOST.NAME}'),(232,1,1490925979,2,13,'0','10.103.196.191',13542,'mem Non-Heap Memory fully committed on {HOST.NAME}'),(233,1,1490925979,2,13,'0','10.103.196.191',13543,'{HOST.NAME} runs suboptimal VM type'),(234,1,1490925979,2,13,'0','10.103.196.191',13544,'FTP service is down on {HOST.NAME}'),(235,1,1490925979,2,13,'0','10.103.196.191',13545,'HTTP service is down on {HOST.NAME}'),(236,1,1490925979,2,13,'0','10.103.196.191',13546,'HTTPS service is down on {HOST.NAME}'),(237,1,1490925979,2,13,'0','10.103.196.191',13547,'IMAP service is down on {HOST.NAME}'),(238,1,1490925979,2,13,'0','10.103.196.191',13548,'LDAP service is down on {HOST.NAME}'),(239,1,1490925979,2,13,'0','10.103.196.191',13549,'NNTP service is down on {HOST.NAME}'),(240,1,1490925979,2,13,'0','10.103.196.191',13550,'NTP service is down on {HOST.NAME}'),(241,1,1490925979,2,13,'0','10.103.196.191',13551,'POP service is down on {HOST.NAME}'),(242,1,1490925979,2,13,'0','10.103.196.191',13552,'SMTP service is down on {HOST.NAME}'),(243,1,1490925979,2,13,'0','10.103.196.191',13553,'SSH service is down on {HOST.NAME}'),(244,1,1490925979,2,13,'0','10.103.196.191',13554,'{HOST.NAME} is unavailable by ICMP'),(245,1,1490925979,2,13,'0','10.103.196.191',13555,'Response time is too high on {HOST.NAME}'),(246,1,1490925979,2,13,'0','10.103.196.191',13556,'Ping loss is too high on {HOST.NAME}'),(247,1,1490925979,2,13,'0','10.103.196.191',13557,'Zabbix value cache working in low memory mode'),(248,1,1490925979,2,4,'0','10.103.196.191',10001,'Template OS Linux'),(249,1,1490925979,2,4,'0','10.103.196.191',10047,'Template App Zabbix Server'),(250,1,1490925979,2,4,'0','10.103.196.191',10048,'Template App Zabbix Proxy'),(251,1,1490925979,2,4,'0','10.103.196.191',10050,'Template App Zabbix Agent'),(252,1,1490925979,2,4,'0','10.103.196.191',10060,'Template SNMP Interfaces'),(253,1,1490925979,2,4,'0','10.103.196.191',10065,'Template SNMP Generic'),(254,1,1490925979,2,4,'0','10.103.196.191',10066,'Template SNMP Device'),(255,1,1490925979,2,4,'0','10.103.196.191',10067,'Template SNMP OS Windows'),(256,1,1490925979,2,4,'0','10.103.196.191',10068,'Template SNMP Disks'),(257,1,1490925979,2,4,'0','10.103.196.191',10069,'Template SNMP OS Linux'),(258,1,1490925979,2,4,'0','10.103.196.191',10070,'Template SNMP Processors'),(259,1,1490925979,2,4,'0','10.103.196.191',10071,'Template IPMI Intel SR1530'),(260,1,1490925979,2,4,'0','10.103.196.191',10072,'Template IPMI Intel SR1630'),(261,1,1490925979,2,4,'0','10.103.196.191',10073,'Template App MySQL'),(262,1,1490925979,2,4,'0','10.103.196.191',10074,'Template OS OpenBSD'),(263,1,1490925979,2,4,'0','10.103.196.191',10075,'Template OS FreeBSD'),(264,1,1490925979,2,4,'0','10.103.196.191',10076,'Template OS AIX'),(265,1,1490925979,2,4,'0','10.103.196.191',10077,'Template OS HP-UX'),(266,1,1490925979,2,4,'0','10.103.196.191',10078,'Template OS Solaris'),(267,1,1490925979,2,4,'0','10.103.196.191',10079,'Template OS Mac OS X'),(268,1,1490925979,2,4,'0','10.103.196.191',10081,'Template OS Windows'),(269,1,1490925979,2,4,'0','10.103.196.191',10082,'Template JMX Generic'),(270,1,1490925979,2,4,'0','10.103.196.191',10083,'Template JMX Tomcat'),(271,1,1490925979,2,4,'0','10.103.196.191',10088,'Template Virt VMware'),(272,1,1490925979,2,4,'0','10.103.196.191',10089,'Template Virt VMware Guest'),(273,1,1490925979,2,4,'0','10.103.196.191',10091,'Template Virt VMware Hypervisor'),(274,1,1490925979,2,4,'0','10.103.196.191',10093,'Template App FTP Service'),(275,1,1490925979,2,4,'0','10.103.196.191',10094,'Template App HTTP Service'),(276,1,1490925979,2,4,'0','10.103.196.191',10095,'Template App HTTPS Service'),(277,1,1490925979,2,4,'0','10.103.196.191',10096,'Template App IMAP Service'),(278,1,1490925979,2,4,'0','10.103.196.191',10097,'Template App LDAP Service'),(279,1,1490925979,2,4,'0','10.103.196.191',10098,'Template App NNTP Service'),(280,1,1490925979,2,4,'0','10.103.196.191',10099,'Template App NTP Service'),(281,1,1490925979,2,4,'0','10.103.196.191',10100,'Template App POP Service'),(282,1,1490925979,2,4,'0','10.103.196.191',10101,'Template App SMTP Service'),(283,1,1490925979,2,4,'0','10.103.196.191',10102,'Template App SSH Service'),(284,1,1490925979,2,4,'0','10.103.196.191',10103,'Template App Telnet Service'),(285,1,1490925979,2,4,'0','10.103.196.191',10104,'Template ICMP Ping'),(286,1,1490925991,0,13,'0','10.103.196.191',13559,'/etc/passwd has been changed on {HOST.NAME}'),(287,1,1490925991,0,13,'0','10.103.196.191',13560,'CEPH critical error'),(288,1,1490925991,0,13,'0','10.103.196.191',13561,'CEPH warning'),(289,1,1490925991,0,13,'0','10.103.196.191',13562,'Configured max number of opened files is too low on {HOST.NAME}'),(290,1,1490925991,0,13,'0','10.103.196.191',13563,'Configured max number of processes is too low on {HOST.NAME}'),(291,1,1490925991,0,13,'0','10.103.196.191',13564,'Disk I/O is overloaded on {HOST.NAME}'),(292,1,1490925991,0,13,'0','10.103.196.191',13565,'Host information was changed on {HOST.NAME}'),(293,1,1490925991,0,13,'0','10.103.196.191',13566,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(294,1,1490925991,0,13,'0','10.103.196.191',13567,'Hostname was changed on {HOST.NAME}'),(295,1,1490925991,0,13,'0','10.103.196.191',13568,'IMAP service is down on {HOST.NAME}'),(296,1,1490925991,0,13,'0','10.103.196.191',13569,'Lack of available memory on server {HOST.NAME}'),(297,1,1490925991,0,13,'0','10.103.196.191',13570,'Lack of free swap space on {HOST.NAME}'),(298,1,1490925991,0,13,'0','10.103.196.191',13571,'LDAP service is down on {HOST.NAME}'),(299,1,1490925991,0,13,'0','10.103.196.191',13572,'Less than 5% free in the value cache'),(300,1,1490925991,0,13,'0','10.103.196.191',13573,'Less than 25% free in the configuration cache'),(301,1,1490925991,0,13,'0','10.103.196.191',13574,'Less than 25% free in the configuration cache'),(302,1,1490925991,0,13,'0','10.103.196.191',13575,'Less than 25% free in the history cache'),(303,1,1490925991,0,13,'0','10.103.196.191',13576,'Less than 25% free in the history cache'),(304,1,1490925991,0,13,'0','10.103.196.191',13577,'Less than 25% free in the history index cache'),(305,1,1490925991,0,13,'0','10.103.196.191',13578,'Less than 25% free in the text history cache'),(306,1,1490925991,0,13,'0','10.103.196.191',13579,'Less than 25% free in the trends cache'),(307,1,1490925991,0,13,'0','10.103.196.191',13580,'Less than 25% free in the vmware cache'),(308,1,1490925991,0,13,'0','10.103.196.191',13581,'More than 100 items having missing data for more than 10'),(309,1,1490925991,0,13,'0','10.103.196.191',13582,'More than 100 items having missing data for more than 10 minutes'),(310,1,1490925991,0,13,'0','10.103.196.191',13583,'MySQL is down'),(311,1,1490925991,0,13,'0','10.103.196.191',13584,'Neutron server daemon status'),(312,1,1490925991,0,13,'0','10.103.196.191',13585,'openstack ceilometer-agent-notification has down'),(313,1,1490925991,0,13,'0','10.103.196.191',13586,'openstack ceilometer-collector has down'),(314,1,1490925991,0,13,'0','10.103.196.191',13587,'openstack ceilometer-polling has down'),(315,1,1490925991,0,13,'0','10.103.196.191',13588,'openstack ceilometer-polling has down'),(316,1,1490925991,0,13,'0','10.103.196.191',13589,'openstack ceilometer collector daemon status'),(317,1,1490925991,0,13,'0','10.103.196.191',13590,'openstack cinder-api has down'),(318,1,1490925991,0,13,'0','10.103.196.191',13591,'openstack cinder-scheduler has down'),(319,1,1490925991,0,13,'0','10.103.196.191',13592,'openstack cinder-volume has down'),(320,1,1490925991,0,13,'0','10.103.196.191',13593,'Openstack cinder process status'),(321,1,1490925991,0,13,'0','10.103.196.191',13594,'Openstack compute service cinder volume'),(322,1,1490925991,0,13,'0','10.103.196.191',13595,'Openstack compute service libvirtd'),(323,1,1490925991,0,13,'0','10.103.196.191',13596,'Openstack compute service neutron l3 agent'),(324,1,1490925991,0,13,'0','10.103.196.191',13597,'Openstack compute service neutron metadata agent'),(325,1,1490925991,0,13,'0','10.103.196.191',13598,'Openstack compute service neutron openvswitch agent'),(326,1,1490925991,0,13,'0','10.103.196.191',13599,'Openstack compute service nova compute'),(327,1,1490925991,0,13,'0','10.103.196.191',13600,'Openstack controller service cinder api'),(328,1,1490925991,0,13,'0','10.103.196.191',13601,'Openstack controller service cinder scheduler'),(329,1,1490925991,0,13,'0','10.103.196.191',13602,'Openstack controller service glance api'),(330,1,1490925991,0,13,'0','10.103.196.191',13603,'Openstack controller service glance registry'),(331,1,1490925991,0,13,'0','10.103.196.191',13604,'Openstack controller service httpd'),(332,1,1490925991,0,13,'0','10.103.196.191',13605,'Openstack controller service memcached'),(333,1,1490925991,0,13,'0','10.103.196.191',13606,'Openstack controller service neutron dhcp agent'),(334,1,1490925991,0,13,'0','10.103.196.191',13607,'Openstack controller service neutron l3 agent'),(335,1,1490925991,0,13,'0','10.103.196.191',13608,'Openstack controller service neutron metadata agent'),(336,1,1490925991,0,13,'0','10.103.196.191',13609,'Openstack controller service neutron openvswitch agent'),(337,1,1490925991,0,13,'0','10.103.196.191',13610,'Openstack controller service neutron server'),(338,1,1490925991,0,13,'0','10.103.196.191',13611,'Openstack controller service nova api'),(339,1,1490925991,0,13,'0','10.103.196.191',13612,'Openstack controller service nova cert'),(340,1,1490925991,0,13,'0','10.103.196.191',13613,'Openstack controller service nova conductor'),(341,1,1490925991,0,13,'0','10.103.196.191',13614,'Openstack controller service nova consoleauth'),(342,1,1490925991,0,13,'0','10.103.196.191',13615,'Openstack controller service nova novncproxy'),(343,1,1490925991,0,13,'0','10.103.196.191',13616,'Openstack controller service nova scheduler'),(344,1,1490925991,0,13,'0','10.103.196.191',13617,'openstack glance-api has down'),(345,1,1490925991,0,13,'0','10.103.196.191',13618,'openstack glance-registry has down'),(346,1,1490925991,0,13,'0','10.103.196.191',13619,'openstack heat api daemon status'),(347,1,1490925991,0,13,'0','10.103.196.191',13620,'openstack httpd has down'),(348,1,1490925991,0,13,'0','10.103.196.191',13621,'openstack httpd has down'),(349,1,1490925991,0,13,'0','10.103.196.191',13622,'openstack libvirtd has down'),(350,1,1490925991,0,13,'0','10.103.196.191',13623,'openstack memcached has down'),(351,1,1490925991,0,13,'0','10.103.196.191',13624,'openstack mysqld has down'),(352,1,1490925991,0,13,'0','10.103.196.191',13625,'openstack neutron-dhcp-agent has down'),(353,1,1490925991,0,13,'0','10.103.196.191',13626,'openstack neutron-l3-agent has down'),(354,1,1490925991,0,13,'0','10.103.196.191',13627,'openstack neutron-l3-agent has down'),(355,1,1490925991,0,13,'0','10.103.196.191',13628,'openstack neutron-lbaasv2-agent has down'),(356,1,1490925991,0,13,'0','10.103.196.191',13629,'openstack  neutron-metadata-agent has down'),(357,1,1490925991,0,13,'0','10.103.196.191',13630,'openstack neutron-openvswitch-agent has down'),(358,1,1490925991,0,13,'0','10.103.196.191',13631,'openstack neutron-openvswitch-agent has down'),(359,1,1490925991,0,13,'0','10.103.196.191',13632,'openstack neutron-server has down'),(360,1,1490925991,0,13,'0','10.103.196.191',13633,'Openstack neutron process status'),(361,1,1490925991,0,13,'0','10.103.196.191',13634,'openstack nova-api has down'),(362,1,1490925991,0,13,'0','10.103.196.191',13635,'openstack nova-cert has down'),(363,1,1490925991,0,13,'0','10.103.196.191',13636,'openstack nova-compute has down'),(364,1,1490925991,0,13,'0','10.103.196.191',13637,'openstack nova-conductor has down'),(365,1,1490925991,0,13,'0','10.103.196.191',13638,'openstack nova-consoleauth has down'),(366,1,1490925991,0,13,'0','10.103.196.191',13639,'openstack nova-novncproxy has down'),(367,1,1490925991,0,13,'0','10.103.196.191',13640,'openstack nova-scheduler has down'),(368,1,1490925991,0,13,'0','10.103.196.191',13641,'Openstack nova process status'),(369,1,1490925991,0,13,'0','10.103.196.191',13642,'openstack ntpd has down'),(370,1,1490925991,0,13,'0','10.103.196.191',13643,'openstack openvswitch has down'),(371,1,1490925991,0,13,'0','10.103.196.191',13644,'openstack rabbitmq-server has down'),(372,1,1490925991,0,13,'0','10.103.196.191',13645,'Openstack service haproxy has down'),(373,1,1490925991,0,13,'0','10.103.196.191',13646,'Openstack service heat api cfn daemon status'),(374,1,1490925991,0,13,'0','10.103.196.191',13647,'Openstack service heat engine daemon status'),(375,1,1490925991,0,13,'0','10.103.196.191',13648,'Openstack service keepalived has down'),(376,1,1490925991,0,13,'0','10.103.196.191',13649,'openstack xinetd has down'),(377,1,1490925991,0,13,'0','10.103.196.191',13650,'Processor load is too high on {HOST.NAME}'),(378,1,1490925991,0,13,'0','10.103.196.191',13651,'SSH service is down on {HOST.NAME}'),(379,1,1490925991,0,13,'0','10.103.196.191',13652,'Too many processes on {HOST.NAME}'),(380,1,1490925991,0,13,'0','10.103.196.191',13653,'Too many processes running on {HOST.NAME}'),(381,1,1490925991,0,13,'0','10.103.196.191',13654,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(382,1,1490925991,0,13,'0','10.103.196.191',13655,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(383,1,1490925991,0,13,'0','10.103.196.191',13656,'Zabbix alerter processes more than 75% busy'),(384,1,1490925991,0,13,'0','10.103.196.191',13657,'Zabbix configuration syncer processes more than 75% busy'),(385,1,1490925991,0,13,'0','10.103.196.191',13658,'Zabbix configuration syncer processes more than 75% busy'),(386,1,1490925991,0,13,'0','10.103.196.191',13659,'Zabbix data sender processes more than 75% busy'),(387,1,1490925991,0,13,'0','10.103.196.191',13660,'Zabbix db watchdog processes more than 75% busy'),(388,1,1490925991,0,13,'0','10.103.196.191',13661,'Zabbix discoverer processes more than 75% busy'),(389,1,1490925991,0,13,'0','10.103.196.191',13662,'Zabbix discoverer processes more than 75% busy'),(390,1,1490925991,0,13,'0','10.103.196.191',13663,'Zabbix escalator processes more than 75% busy'),(391,1,1490925991,0,13,'0','10.103.196.191',13664,'Zabbix heartbeat sender processes more than 75% busy'),(392,1,1490925991,0,13,'0','10.103.196.191',13665,'Zabbix history syncer processes more than 75% busy'),(393,1,1490925991,0,13,'0','10.103.196.191',13666,'Zabbix history syncer processes more than 75% busy'),(394,1,1490925991,0,13,'0','10.103.196.191',13667,'Zabbix housekeeper processes more than 75% busy'),(395,1,1490925991,0,13,'0','10.103.196.191',13668,'Zabbix housekeeper processes more than 75% busy'),(396,1,1490925991,0,13,'0','10.103.196.191',13669,'Zabbix http poller processes more than 75% busy'),(397,1,1490925991,0,13,'0','10.103.196.191',13670,'Zabbix http poller processes more than 75% busy'),(398,1,1490925991,0,13,'0','10.103.196.191',13671,'Zabbix icmp pinger processes more than 75% busy'),(399,1,1490925991,0,13,'0','10.103.196.191',13672,'Zabbix icmp pinger processes more than 75% busy'),(400,1,1490925991,0,13,'0','10.103.196.191',13673,'Zabbix ipmi poller processes more than 75% busy'),(401,1,1490925991,0,13,'0','10.103.196.191',13674,'Zabbix ipmi poller processes more than 75% busy'),(402,1,1490925991,0,13,'0','10.103.196.191',13675,'Zabbix java poller processes more than 75% busy'),(403,1,1490925991,0,13,'0','10.103.196.191',13676,'Zabbix java poller processes more than 75% busy'),(404,1,1490925991,0,13,'0','10.103.196.191',13677,'Zabbix poller processes more than 75% busy'),(405,1,1490925991,0,13,'0','10.103.196.191',13678,'Zabbix poller processes more than 75% busy'),(406,1,1490925991,0,13,'0','10.103.196.191',13679,'Zabbix proxy poller processes more than 75% busy'),(407,1,1490925991,0,13,'0','10.103.196.191',13680,'Zabbix self-monitoring processes more than 75% busy'),(408,1,1490925991,0,13,'0','10.103.196.191',13681,'Zabbix self-monitoring processes more than 75% busy'),(409,1,1490925991,0,13,'0','10.103.196.191',13682,'Zabbix snmp trapper processes more than 75% busy'),(410,1,1490925991,0,13,'0','10.103.196.191',13683,'Zabbix snmp trapper processes more than 75% busy'),(411,1,1490925991,0,13,'0','10.103.196.191',13684,'Zabbix timer processes more than 75% busy'),(412,1,1490925991,0,13,'0','10.103.196.191',13685,'Zabbix trapper processes more than 75% busy'),(413,1,1490925991,0,13,'0','10.103.196.191',13686,'Zabbix trapper processes more than 75% busy'),(414,1,1490925991,0,13,'0','10.103.196.191',13687,'Zabbix unreachable poller processes more than 75% busy'),(415,1,1490925991,0,13,'0','10.103.196.191',13688,'Zabbix unreachable poller processes more than 75% busy'),(416,1,1490925991,0,13,'0','10.103.196.191',13689,'Zabbix vmware collector processes more than 75% busy'),(417,1,1490925991,0,13,'0','10.103.196.191',13690,'{HOST.NAME} has just been restarted'),(418,1,1490925991,0,13,'0','10.103.196.191',13691,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(419,1,1490925991,0,13,'0','10.103.196.191',13692,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(420,1,1490925991,0,13,'0','10.103.196.191',13693,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(421,1,1490926108,1,3,'Media type [Email]','10.103.196.191',0,''),(422,1,1490926323,1,5,'Name: Send E-mail','10.103.196.191',0,''),(423,1,1490926336,1,5,'Name: Send E-mail','10.103.196.191',0,''),(424,1,1490926453,0,5,'Name: Auto registration:controller','10.103.196.191',0,''),(425,1,1490926534,0,5,'Name: Auto registration:compute','10.103.196.191',0,''),(426,1,1490926613,0,5,'Name: Auto registration:ceph','10.103.196.191',0,''),(427,1,1490926877,1,0,'User alias [Admin] name [Zabbix] surname [Administrator]','10.103.196.191',0,''),(428,1,1490927033,0,3,'Media type [Wechat]','10.103.196.191',0,''),(429,1,1490927057,0,5,'Name: send wechat','10.103.196.191',0,''),(430,1,1492236757,3,0,'0','10.96.196.127',1,''),(431,1,1492239584,2,13,'0','10.96.196.127',13691,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(432,1,1492239584,2,13,'0','10.96.196.127',13692,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(433,1,1492239584,2,13,'0','10.96.196.127',13693,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(434,1,1492239584,2,31,'0','10.96.196.127',13694,'Free disk space is less than 20% on volume {#FSNAME}:{13297}<20'),(435,1,1492239584,2,31,'0','10.96.196.127',13695,'Free inodes is less than 20% on volume {#FSNAME}:{13298}<20'),(436,1,1492239584,2,13,'0','10.96.196.127',13559,'/etc/passwd has been changed on {HOST.NAME}'),(437,1,1492239584,2,13,'0','10.96.196.127',13560,'CEPH critical error'),(438,1,1492239584,2,13,'0','10.96.196.127',13561,'CEPH warning'),(439,1,1492239584,2,13,'0','10.96.196.127',13562,'Configured max number of opened files is too low on {HOST.NAME}'),(440,1,1492239584,2,13,'0','10.96.196.127',13563,'Configured max number of processes is too low on {HOST.NAME}'),(441,1,1492239584,2,13,'0','10.96.196.127',13564,'Disk I/O is overloaded on {HOST.NAME}'),(442,1,1492239584,2,13,'0','10.96.196.127',13565,'Host information was changed on {HOST.NAME}'),(443,1,1492239584,2,13,'0','10.96.196.127',13566,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(444,1,1492239584,2,13,'0','10.96.196.127',13567,'Hostname was changed on {HOST.NAME}'),(445,1,1492239584,2,13,'0','10.96.196.127',13568,'IMAP service is down on {HOST.NAME}'),(446,1,1492239584,2,13,'0','10.96.196.127',13569,'Lack of available memory on server {HOST.NAME}'),(447,1,1492239584,2,13,'0','10.96.196.127',13570,'Lack of free swap space on {HOST.NAME}'),(448,1,1492239584,2,13,'0','10.96.196.127',13571,'LDAP service is down on {HOST.NAME}'),(449,1,1492239584,2,13,'0','10.96.196.127',13572,'Less than 5% free in the value cache'),(450,1,1492239584,2,13,'0','10.96.196.127',13573,'Less than 25% free in the configuration cache'),(451,1,1492239584,2,13,'0','10.96.196.127',13574,'Less than 25% free in the configuration cache'),(452,1,1492239584,2,13,'0','10.96.196.127',13575,'Less than 25% free in the history cache'),(453,1,1492239584,2,13,'0','10.96.196.127',13576,'Less than 25% free in the history cache'),(454,1,1492239584,2,13,'0','10.96.196.127',13577,'Less than 25% free in the history index cache'),(455,1,1492239584,2,13,'0','10.96.196.127',13578,'Less than 25% free in the text history cache'),(456,1,1492239584,2,13,'0','10.96.196.127',13579,'Less than 25% free in the trends cache'),(457,1,1492239584,2,13,'0','10.96.196.127',13580,'Less than 25% free in the vmware cache'),(458,1,1492239584,2,13,'0','10.96.196.127',13581,'More than 100 items having missing data for more than 10'),(459,1,1492239584,2,13,'0','10.96.196.127',13582,'More than 100 items having missing data for more than 10 minutes'),(460,1,1492239584,2,13,'0','10.96.196.127',13583,'MySQL is down'),(461,1,1492239584,2,13,'0','10.96.196.127',13584,'Neutron server daemon status'),(462,1,1492239584,2,13,'0','10.96.196.127',13585,'openstack ceilometer-agent-notification has down'),(463,1,1492239584,2,13,'0','10.96.196.127',13586,'openstack ceilometer-collector has down'),(464,1,1492239584,2,13,'0','10.96.196.127',13587,'openstack ceilometer-polling has down'),(465,1,1492239584,2,13,'0','10.96.196.127',13588,'openstack ceilometer-polling has down'),(466,1,1492239584,2,13,'0','10.96.196.127',13589,'openstack ceilometer collector daemon status'),(467,1,1492239584,2,13,'0','10.96.196.127',13590,'openstack cinder-api has down'),(468,1,1492239584,2,13,'0','10.96.196.127',13591,'openstack cinder-scheduler has down'),(469,1,1492239584,2,13,'0','10.96.196.127',13592,'openstack cinder-volume has down'),(470,1,1492239584,2,13,'0','10.96.196.127',13593,'Openstack cinder process status'),(471,1,1492239584,2,13,'0','10.96.196.127',13594,'Openstack compute service cinder volume'),(472,1,1492239584,2,13,'0','10.96.196.127',13595,'Openstack compute service libvirtd'),(473,1,1492239584,2,13,'0','10.96.196.127',13596,'Openstack compute service neutron l3 agent'),(474,1,1492239584,2,13,'0','10.96.196.127',13597,'Openstack compute service neutron metadata agent'),(475,1,1492239584,2,13,'0','10.96.196.127',13598,'Openstack compute service neutron openvswitch agent'),(476,1,1492239584,2,13,'0','10.96.196.127',13599,'Openstack compute service nova compute'),(477,1,1492239584,2,13,'0','10.96.196.127',13600,'Openstack controller service cinder api'),(478,1,1492239584,2,13,'0','10.96.196.127',13601,'Openstack controller service cinder scheduler'),(479,1,1492239584,2,13,'0','10.96.196.127',13602,'Openstack controller service glance api'),(480,1,1492239584,2,13,'0','10.96.196.127',13603,'Openstack controller service glance registry'),(481,1,1492239584,2,13,'0','10.96.196.127',13604,'Openstack controller service httpd'),(482,1,1492239584,2,13,'0','10.96.196.127',13605,'Openstack controller service memcached'),(483,1,1492239584,2,13,'0','10.96.196.127',13606,'Openstack controller service neutron dhcp agent'),(484,1,1492239584,2,13,'0','10.96.196.127',13607,'Openstack controller service neutron l3 agent'),(485,1,1492239584,2,13,'0','10.96.196.127',13608,'Openstack controller service neutron metadata agent'),(486,1,1492239584,2,13,'0','10.96.196.127',13609,'Openstack controller service neutron openvswitch agent'),(487,1,1492239584,2,13,'0','10.96.196.127',13610,'Openstack controller service neutron server'),(488,1,1492239584,2,13,'0','10.96.196.127',13611,'Openstack controller service nova api'),(489,1,1492239584,2,13,'0','10.96.196.127',13612,'Openstack controller service nova cert'),(490,1,1492239584,2,13,'0','10.96.196.127',13613,'Openstack controller service nova conductor'),(491,1,1492239584,2,13,'0','10.96.196.127',13614,'Openstack controller service nova consoleauth'),(492,1,1492239584,2,13,'0','10.96.196.127',13615,'Openstack controller service nova novncproxy'),(493,1,1492239584,2,13,'0','10.96.196.127',13616,'Openstack controller service nova scheduler'),(494,1,1492239584,2,13,'0','10.96.196.127',13617,'openstack glance-api has down'),(495,1,1492239584,2,13,'0','10.96.196.127',13618,'openstack glance-registry has down'),(496,1,1492239584,2,13,'0','10.96.196.127',13619,'openstack heat api daemon status'),(497,1,1492239584,2,13,'0','10.96.196.127',13620,'openstack httpd has down'),(498,1,1492239584,2,13,'0','10.96.196.127',13621,'openstack httpd has down'),(499,1,1492239584,2,13,'0','10.96.196.127',13622,'openstack libvirtd has down'),(500,1,1492239584,2,13,'0','10.96.196.127',13623,'openstack memcached has down'),(501,1,1492239584,2,13,'0','10.96.196.127',13624,'openstack mysqld has down'),(502,1,1492239584,2,13,'0','10.96.196.127',13625,'openstack neutron-dhcp-agent has down'),(503,1,1492239584,2,13,'0','10.96.196.127',13626,'openstack neutron-l3-agent has down'),(504,1,1492239584,2,13,'0','10.96.196.127',13627,'openstack neutron-l3-agent has down'),(505,1,1492239584,2,13,'0','10.96.196.127',13628,'openstack neutron-lbaasv2-agent has down'),(506,1,1492239584,2,13,'0','10.96.196.127',13629,'openstack  neutron-metadata-agent has down'),(507,1,1492239584,2,13,'0','10.96.196.127',13630,'openstack neutron-openvswitch-agent has down'),(508,1,1492239584,2,13,'0','10.96.196.127',13631,'openstack neutron-openvswitch-agent has down'),(509,1,1492239584,2,13,'0','10.96.196.127',13632,'openstack neutron-server has down'),(510,1,1492239584,2,13,'0','10.96.196.127',13633,'Openstack neutron process status'),(511,1,1492239584,2,13,'0','10.96.196.127',13634,'openstack nova-api has down'),(512,1,1492239584,2,13,'0','10.96.196.127',13635,'openstack nova-cert has down'),(513,1,1492239584,2,13,'0','10.96.196.127',13636,'openstack nova-compute has down'),(514,1,1492239584,2,13,'0','10.96.196.127',13637,'openstack nova-conductor has down'),(515,1,1492239584,2,13,'0','10.96.196.127',13638,'openstack nova-consoleauth has down'),(516,1,1492239584,2,13,'0','10.96.196.127',13639,'openstack nova-novncproxy has down'),(517,1,1492239584,2,13,'0','10.96.196.127',13640,'openstack nova-scheduler has down'),(518,1,1492239584,2,13,'0','10.96.196.127',13641,'Openstack nova process status'),(519,1,1492239584,2,13,'0','10.96.196.127',13642,'openstack ntpd has down'),(520,1,1492239584,2,13,'0','10.96.196.127',13643,'openstack openvswitch has down'),(521,1,1492239584,2,13,'0','10.96.196.127',13644,'openstack rabbitmq-server has down'),(522,1,1492239584,2,13,'0','10.96.196.127',13645,'Openstack service haproxy has down'),(523,1,1492239584,2,13,'0','10.96.196.127',13646,'Openstack service heat api cfn daemon status'),(524,1,1492239584,2,13,'0','10.96.196.127',13647,'Openstack service heat engine daemon status'),(525,1,1492239584,2,13,'0','10.96.196.127',13648,'Openstack service keepalived has down'),(526,1,1492239584,2,13,'0','10.96.196.127',13649,'openstack xinetd has down'),(527,1,1492239584,2,13,'0','10.96.196.127',13650,'Processor load is too high on {HOST.NAME}'),(528,1,1492239584,2,13,'0','10.96.196.127',13651,'SSH service is down on {HOST.NAME}'),(529,1,1492239584,2,13,'0','10.96.196.127',13652,'Too many processes on {HOST.NAME}'),(530,1,1492239584,2,13,'0','10.96.196.127',13653,'Too many processes running on {HOST.NAME}'),(531,1,1492239584,2,13,'0','10.96.196.127',13654,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(532,1,1492239584,2,13,'0','10.96.196.127',13655,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(533,1,1492239584,2,13,'0','10.96.196.127',13656,'Zabbix alerter processes more than 75% busy'),(534,1,1492239584,2,13,'0','10.96.196.127',13657,'Zabbix configuration syncer processes more than 75% busy'),(535,1,1492239584,2,13,'0','10.96.196.127',13658,'Zabbix configuration syncer processes more than 75% busy'),(536,1,1492239584,2,13,'0','10.96.196.127',13659,'Zabbix data sender processes more than 75% busy'),(537,1,1492239584,2,13,'0','10.96.196.127',13660,'Zabbix db watchdog processes more than 75% busy'),(538,1,1492239584,2,13,'0','10.96.196.127',13661,'Zabbix discoverer processes more than 75% busy'),(539,1,1492239584,2,13,'0','10.96.196.127',13662,'Zabbix discoverer processes more than 75% busy'),(540,1,1492239584,2,13,'0','10.96.196.127',13663,'Zabbix escalator processes more than 75% busy'),(541,1,1492239584,2,13,'0','10.96.196.127',13664,'Zabbix heartbeat sender processes more than 75% busy'),(542,1,1492239584,2,13,'0','10.96.196.127',13665,'Zabbix history syncer processes more than 75% busy'),(543,1,1492239584,2,13,'0','10.96.196.127',13666,'Zabbix history syncer processes more than 75% busy'),(544,1,1492239584,2,13,'0','10.96.196.127',13667,'Zabbix housekeeper processes more than 75% busy'),(545,1,1492239584,2,13,'0','10.96.196.127',13668,'Zabbix housekeeper processes more than 75% busy'),(546,1,1492239584,2,13,'0','10.96.196.127',13669,'Zabbix http poller processes more than 75% busy'),(547,1,1492239584,2,13,'0','10.96.196.127',13670,'Zabbix http poller processes more than 75% busy'),(548,1,1492239584,2,13,'0','10.96.196.127',13671,'Zabbix icmp pinger processes more than 75% busy'),(549,1,1492239584,2,13,'0','10.96.196.127',13672,'Zabbix icmp pinger processes more than 75% busy'),(550,1,1492239584,2,13,'0','10.96.196.127',13673,'Zabbix ipmi poller processes more than 75% busy'),(551,1,1492239584,2,13,'0','10.96.196.127',13674,'Zabbix ipmi poller processes more than 75% busy'),(552,1,1492239584,2,13,'0','10.96.196.127',13675,'Zabbix java poller processes more than 75% busy'),(553,1,1492239584,2,13,'0','10.96.196.127',13676,'Zabbix java poller processes more than 75% busy'),(554,1,1492239584,2,13,'0','10.96.196.127',13677,'Zabbix poller processes more than 75% busy'),(555,1,1492239584,2,13,'0','10.96.196.127',13678,'Zabbix poller processes more than 75% busy'),(556,1,1492239584,2,13,'0','10.96.196.127',13679,'Zabbix proxy poller processes more than 75% busy'),(557,1,1492239584,2,13,'0','10.96.196.127',13680,'Zabbix self-monitoring processes more than 75% busy'),(558,1,1492239584,2,13,'0','10.96.196.127',13681,'Zabbix self-monitoring processes more than 75% busy'),(559,1,1492239584,2,13,'0','10.96.196.127',13682,'Zabbix snmp trapper processes more than 75% busy'),(560,1,1492239584,2,13,'0','10.96.196.127',13683,'Zabbix snmp trapper processes more than 75% busy'),(561,1,1492239584,2,13,'0','10.96.196.127',13684,'Zabbix timer processes more than 75% busy'),(562,1,1492239584,2,13,'0','10.96.196.127',13685,'Zabbix trapper processes more than 75% busy'),(563,1,1492239584,2,13,'0','10.96.196.127',13686,'Zabbix trapper processes more than 75% busy'),(564,1,1492239584,2,13,'0','10.96.196.127',13687,'Zabbix unreachable poller processes more than 75% busy'),(565,1,1492239584,2,13,'0','10.96.196.127',13688,'Zabbix unreachable poller processes more than 75% busy'),(566,1,1492239584,2,13,'0','10.96.196.127',13689,'Zabbix vmware collector processes more than 75% busy'),(567,1,1492239584,2,13,'0','10.96.196.127',13690,'{HOST.NAME} has just been restarted'),(568,1,1492239584,2,4,'0','10.96.196.127',10085,'compute node'),(569,1,1492239584,2,4,'0','10.96.196.127',10086,'controller node'),(570,1,1492239584,2,4,'0','10.96.196.127',10087,'dashboard'),(571,1,1492239584,2,4,'0','10.96.196.127',10088,'haproxy'),(572,1,1492239584,2,4,'0','10.96.196.127',10089,'lbaas'),(573,1,1492239584,2,4,'0','10.96.196.127',10090,'memcache'),(574,1,1492239584,2,4,'0','10.96.196.127',10091,'mysql'),(575,1,1492239584,2,4,'0','10.96.196.127',10092,'novnc'),(576,1,1492239584,2,4,'0','10.96.196.127',10093,'ntp'),(577,1,1492239584,2,4,'0','10.96.196.127',10094,'rabbitmq'),(578,1,1492239584,2,4,'0','10.96.196.127',10095,'Template App Ceph ProcessNum'),(579,1,1492239584,2,4,'0','10.96.196.127',10096,'Template App Ceph State'),(580,1,1492239584,2,4,'0','10.96.196.127',10097,'Template App IMAP Service'),(581,1,1492239584,2,4,'0','10.96.196.127',10098,'Template App LDAP Service'),(582,1,1492239584,2,4,'0','10.96.196.127',10099,'Template App MySQL'),(583,1,1492239584,2,4,'0','10.96.196.127',10100,'Template App Openstack Compute ServiceExist'),(584,1,1492239584,2,4,'0','10.96.196.127',10101,'Template App Openstack Controller ServiceExist'),(585,1,1492239584,2,4,'0','10.96.196.127',10102,'Template App SSH Service'),(586,1,1492239584,2,4,'0','10.96.196.127',10103,'Template App Zabbix Agent'),(587,1,1492239584,2,4,'0','10.96.196.127',10104,'Template App Zabbix Proxy'),(588,1,1492239584,2,4,'0','10.96.196.127',10105,'Template App Zabbix Server'),(589,1,1492239584,2,4,'0','10.96.196.127',10106,'Template OS Linux'),(590,1,1492239623,0,13,'0','10.96.196.127',13696,'/etc/passwd has been changed on {HOST.NAME}'),(591,1,1492239623,0,13,'0','10.96.196.127',13697,'Auto Increment Control is disabled'),(592,1,1492239623,0,13,'0','10.96.196.127',13698,'Binary Log Do Filter is enabled'),(593,1,1492239623,0,13,'0','10.96.196.127',13699,'Binary Log Ignore Filter is enabled'),(594,1,1492239623,0,13,'0','10.96.196.127',13700,'Binary Log is disabled'),(595,1,1492239623,0,13,'0','10.96.196.127',13701,'Binlog format MIXED with filtering'),(596,1,1492239623,0,13,'0','10.96.196.127',13702,'Binlog Statement Cache size too small'),(597,1,1492239623,0,13,'0','10.96.196.127',13703,'Binlog Transaction Cache size too small'),(598,1,1492239623,0,13,'0','10.96.196.127',13704,'Causal Reads is enabled'),(599,1,1492239623,0,13,'0','10.96.196.127',13705,'CEPH critical error'),(600,1,1492239623,0,13,'0','10.96.196.127',13706,'CEPH warning'),(601,1,1492239623,0,13,'0','10.96.196.127',13707,'Character Set of Server is utf8'),(602,1,1492239623,0,13,'0','10.96.196.127',13708,'Cluster Configuration has changed'),(603,1,1492239623,0,13,'0','10.96.196.127',13709,'Cluster is slowed down due to slave lag'),(604,1,1492239623,0,13,'0','10.96.196.127',13710,'Cluster node status'),(605,1,1492239623,0,13,'0','10.96.196.127',13711,'Cluster size is different from expected'),(606,1,1492239623,0,13,'0','10.96.196.127',13712,'Configured max number of opened files is too low on {HOST.NAME}'),(607,1,1492239623,0,13,'0','10.96.196.127',13713,'Configured max number of processes is too low on {HOST.NAME}'),(608,1,1492239623,0,13,'0','10.96.196.127',13714,'CPU interrupt time {HOST.NAME}'),(609,1,1492239623,0,13,'0','10.96.196.127',13715,'Default Storage Engine is not InnoDB'),(610,1,1492239623,0,13,'0','10.96.196.127',13716,'Disk I/O is overloaded on {HOST.NAME}'),(611,1,1492239623,0,13,'0','10.96.196.127',13717,'fpmmm Agent is down'),(612,1,1492239623,0,13,'0','10.96.196.127',13718,'fpmmm MaaS Agent is not sending data'),(613,1,1492239623,0,13,'0','10.96.196.127',13719,'fpmmm MaaS Agent is sending data again'),(614,1,1492239623,0,13,'0','10.96.196.127',13720,'fpmmm Version'),(615,1,1492239623,0,13,'0','10.96.196.127',13721,'General Log is enabled'),(616,1,1492239623,0,13,'0','10.96.196.127',13722,'Host information was changed on {HOST.NAME}'),(617,1,1492239623,0,13,'0','10.96.196.127',13723,'Host information was changed on {HOST.NAME}'),(618,1,1492239623,0,13,'0','10.96.196.127',13724,'InnoDB Buffer Pool Instances is too small'),(619,1,1492239623,0,13,'0','10.96.196.127',13725,'InnoDB Deadlock detected'),(620,1,1492239623,0,13,'0','10.96.196.127',13726,'InnoDB Flush Log at Transaction Commit'),(621,1,1492239623,0,13,'0','10.96.196.127',13727,'InnoDB Flush Method has changed'),(622,1,1492239623,0,13,'0','10.96.196.127',13728,'InnoDB Force Recovery is enabled'),(623,1,1492239623,0,13,'0','10.96.196.127',13729,'InnoDB Foreign Key error detected'),(624,1,1492239623,0,13,'0','10.96.196.127',13730,'InnoDB Log Buffer too small'),(625,1,1492239623,0,13,'0','10.96.196.127',13731,'InnoDB Log File size is too small'),(626,1,1492239623,0,13,'0','10.96.196.127',13732,'InnoDB Log File size is too small'),(627,1,1492239623,0,13,'0','10.96.196.127',13733,'InnoDB Plugin is enabled'),(628,1,1492239623,0,13,'0','10.96.196.127',13734,'IO thread stopped'),(629,1,1492239623,0,13,'0','10.96.196.127',13735,'Lack of available memory on server {HOST.NAME}'),(630,1,1492239623,0,13,'0','10.96.196.127',13736,'Lack of free memory on server {HOST.NAME}'),(631,1,1492239623,0,13,'0','10.96.196.127',13737,'Lack of free swap space on {HOST.NAME}'),(632,1,1492239623,0,13,'0','10.96.196.127',13738,'Less than 5% free in the value cache'),(633,1,1492239623,0,13,'0','10.96.196.127',13739,'Less than 25% free in the configuration cache'),(634,1,1492239623,0,13,'0','10.96.196.127',13740,'Less than 25% free in the configuration cache'),(635,1,1492239623,0,13,'0','10.96.196.127',13741,'Less than 25% free in the history cache'),(636,1,1492239623,0,13,'0','10.96.196.127',13742,'Less than 25% free in the history cache'),(637,1,1492239623,0,13,'0','10.96.196.127',13743,'Less than 25% free in the history index cache'),(638,1,1492239623,0,13,'0','10.96.196.127',13744,'Less than 25% free in the text history cache'),(639,1,1492239623,0,13,'0','10.96.196.127',13745,'Less than 25% free in the trends cache'),(640,1,1492239623,0,13,'0','10.96.196.127',13746,'Less than 25% free in the vmware cache'),(641,1,1492239623,0,13,'0','10.96.196.127',13747,'Log Output is other than File'),(642,1,1492239623,0,13,'0','10.96.196.127',13748,'Log Queries not using Indexes is disabled'),(643,1,1492239623,0,13,'0','10.96.196.127',13749,'Low free disk space'),(644,1,1492239623,0,13,'0','10.96.196.127',13750,'Low free disk space'),(645,1,1492239623,0,13,'0','10.96.196.127',13751,'More than 100 items having missing data for more than 10 minutes'),(646,1,1492239623,0,13,'0','10.96.196.127',13752,'More than 100 items having missing data for more than 10 minutes'),(647,1,1492239623,0,13,'0','10.96.196.127',13753,'MySQL is down'),(648,1,1492239623,0,13,'0','10.96.196.127',13754,'MySQL is down'),(649,1,1492239623,0,13,'0','10.96.196.127',13755,'MySQL is up again'),(650,1,1492239623,0,13,'0','10.96.196.127',13756,'Node is not ready'),(651,1,1492239623,0,13,'0','10.96.196.127',13757,'nova-novncproxy has  down'),(652,1,1492239623,0,13,'0','10.96.196.127',13758,'Old Binlog Format is still used'),(653,1,1492239623,0,13,'0','10.96.196.127',13759,'Open files high'),(654,1,1492239623,0,13,'0','10.96.196.127',13760,'openstack ceilometer-agent-notification has down'),(655,1,1492239623,0,13,'0','10.96.196.127',13761,'openstack ceilometer-collector has down'),(656,1,1492239623,0,13,'0','10.96.196.127',13762,'openstack ceilometer-polling has down'),(657,1,1492239623,0,13,'0','10.96.196.127',13763,'openstack ceilometer-polling has down'),(658,1,1492239623,0,13,'0','10.96.196.127',13764,'openstack cinder-api has down'),(659,1,1492239623,0,13,'0','10.96.196.127',13765,'openstack cinder-scheduler has down'),(660,1,1492239623,0,13,'0','10.96.196.127',13766,'openstack cinder-volume has down'),(661,1,1492239623,0,13,'0','10.96.196.127',13767,'Openstack cinder process status'),(662,1,1492239623,0,13,'0','10.96.196.127',13768,'Openstack compute service cinder volume'),(663,1,1492239623,0,13,'0','10.96.196.127',13769,'Openstack compute service libvirtd'),(664,1,1492239623,0,13,'0','10.96.196.127',13770,'Openstack compute service neutron l3 agent'),(665,1,1492239623,0,13,'0','10.96.196.127',13771,'Openstack compute service neutron metadata agent'),(666,1,1492239623,0,13,'0','10.96.196.127',13772,'Openstack compute service neutron openvswitch agent'),(667,1,1492239623,0,13,'0','10.96.196.127',13773,'Openstack compute service nova compute'),(668,1,1492239623,0,13,'0','10.96.196.127',13774,'Openstack controller service cinder api'),(669,1,1492239623,0,13,'0','10.96.196.127',13775,'Openstack controller service cinder scheduler'),(670,1,1492239623,0,13,'0','10.96.196.127',13776,'Openstack controller service glance api'),(671,1,1492239623,0,13,'0','10.96.196.127',13777,'Openstack controller service glance registry'),(672,1,1492239623,0,13,'0','10.96.196.127',13778,'Openstack controller service httpd'),(673,1,1492239623,0,13,'0','10.96.196.127',13779,'Openstack controller service memcached'),(674,1,1492239623,0,13,'0','10.96.196.127',13780,'Openstack controller service neutron dhcp agent'),(675,1,1492239623,0,13,'0','10.96.196.127',13781,'Openstack controller service neutron l3 agent'),(676,1,1492239623,0,13,'0','10.96.196.127',13782,'Openstack controller service neutron metadata agent'),(677,1,1492239623,0,13,'0','10.96.196.127',13783,'Openstack controller service neutron openvswitch agent'),(678,1,1492239623,0,13,'0','10.96.196.127',13784,'Openstack controller service neutron server'),(679,1,1492239623,0,13,'0','10.96.196.127',13785,'Openstack controller service nova api'),(680,1,1492239623,0,13,'0','10.96.196.127',13786,'Openstack controller service nova cert'),(681,1,1492239623,0,13,'0','10.96.196.127',13787,'Openstack controller service nova conductor'),(682,1,1492239623,0,13,'0','10.96.196.127',13788,'Openstack controller service nova consoleauth'),(683,1,1492239623,0,13,'0','10.96.196.127',13789,'Openstack controller service nova novncproxy'),(684,1,1492239623,0,13,'0','10.96.196.127',13790,'Openstack controller service nova scheduler'),(685,1,1492239623,0,13,'0','10.96.196.127',13791,'openstack glance-api has down'),(686,1,1492239623,0,13,'0','10.96.196.127',13792,'openstack glance-registry has down'),(687,1,1492239623,0,13,'0','10.96.196.127',13793,'Openstack haproxy has down'),(688,1,1492239623,0,13,'0','10.96.196.127',13794,'openstack httpd has down'),(689,1,1492239623,0,13,'0','10.96.196.127',13795,'openstack httpd has down'),(690,1,1492239623,0,13,'0','10.96.196.127',13796,'openstack libvirtd has down'),(691,1,1492239623,0,13,'0','10.96.196.127',13797,'openstack memcached has down'),(692,1,1492239623,0,13,'0','10.96.196.127',13798,'openstack mysqld has down'),(693,1,1492239623,0,13,'0','10.96.196.127',13799,'openstack neutron-dhcp-agent has down'),(694,1,1492239623,0,13,'0','10.96.196.127',13800,'openstack neutron-l3-agent has down'),(695,1,1492239623,0,13,'0','10.96.196.127',13801,'openstack neutron-l3-agent has down'),(696,1,1492239623,0,13,'0','10.96.196.127',13802,'openstack neutron-lbaasv2-agent has down'),(697,1,1492239623,0,13,'0','10.96.196.127',13803,'openstack  neutron-metadata-agent has down'),(698,1,1492239623,0,13,'0','10.96.196.127',13804,'openstack neutron-openvswitch-agent has down'),(699,1,1492239623,0,13,'0','10.96.196.127',13805,'openstack neutron-openvswitch-agent has down'),(700,1,1492239623,0,13,'0','10.96.196.127',13806,'openstack neutron-server has down'),(701,1,1492239623,0,13,'0','10.96.196.127',13807,'Openstack neutron process status'),(702,1,1492239623,0,13,'0','10.96.196.127',13808,'openstack nova-api has down'),(703,1,1492239623,0,13,'0','10.96.196.127',13809,'openstack nova-cert has down'),(704,1,1492239623,0,13,'0','10.96.196.127',13810,'openstack nova-compute has down'),(705,1,1492239623,0,13,'0','10.96.196.127',13811,'openstack nova-conductor has down'),(706,1,1492239623,0,13,'0','10.96.196.127',13812,'openstack nova-consoleauth has down'),(707,1,1492239623,0,13,'0','10.96.196.127',13813,'openstack nova-novncproxy has down'),(708,1,1492239623,0,13,'0','10.96.196.127',13814,'openstack nova-scheduler has down'),(709,1,1492239623,0,13,'0','10.96.196.127',13815,'Openstack nova process status'),(710,1,1492239623,0,13,'0','10.96.196.127',13816,'openstack ntpd has down'),(711,1,1492239623,0,13,'0','10.96.196.127',13817,'openstack openvswitch has down'),(712,1,1492239623,0,13,'0','10.96.196.127',13818,'openstack rabbitmq-server has down'),(713,1,1492239623,0,13,'0','10.96.196.127',13819,'Openstack service haproxy has down'),(714,1,1492239623,0,13,'0','10.96.196.127',13820,'Openstack service keepalived has down'),(715,1,1492239623,0,13,'0','10.96.196.127',13821,'openstack xinetd has down'),(716,1,1492239623,0,13,'0','10.96.196.127',13822,'Processor load is too high on(5min)  {HOST.NAME}'),(717,1,1492239623,0,13,'0','10.96.196.127',13823,'Processor load is too high on (15min){HOST.NAME}'),(718,1,1492239623,0,13,'0','10.96.196.127',13824,'Processor load is too high on {HOST.NAME}'),(719,1,1492239623,0,13,'0','10.96.196.127',13825,'Processor load is too high on {HOST.NAME}'),(720,1,1492239623,0,13,'0','10.96.196.127',13826,'Read buffer size is bigger than max. allowed packet size'),(721,1,1492239623,0,13,'0','10.96.196.127',13827,'Slave errors are skipped!'),(722,1,1492239623,0,13,'0','10.96.196.127',13828,'Slave is NOT read only'),(723,1,1492239623,0,13,'0','10.96.196.127',13829,'Slave lagging behind Master'),(724,1,1492239623,0,13,'0','10.96.196.127',13830,'Slave lagging behind Master'),(725,1,1492239623,0,13,'0','10.96.196.127',13831,'Sort buffer possibly missconfigured'),(726,1,1492239623,0,13,'0','10.96.196.127',13832,'SQL thread stopped'),(727,1,1492239623,0,13,'0','10.96.196.127',13833,'SSH service is down on {HOST.NAME}'),(728,1,1492239623,0,13,'0','10.96.196.127',13834,'Sync Binlog is enabled'),(729,1,1492239623,0,13,'0','10.96.196.127',13835,'Table definition cache too small'),(730,1,1492239623,0,13,'0','10.96.196.127',13836,'Table open cache too small'),(731,1,1492239623,0,13,'0','10.96.196.127',13837,'Thread stack size is possibly too small'),(732,1,1492239623,0,13,'0','10.96.196.127',13838,'Thread stack size is too small'),(733,1,1492239623,0,13,'0','10.96.196.127',13839,'Too little Slave Threads'),(734,1,1492239623,0,13,'0','10.96.196.127',13840,'Too many processes on {HOST.NAME}'),(735,1,1492239623,0,13,'0','10.96.196.127',13841,'Transaction isolation level is set to non-default value'),(736,1,1492239623,0,13,'0','10.96.196.127',13842,'Transaction isolation level is set to non-recommended value'),(737,1,1492239623,0,13,'0','10.96.196.127',13843,'Very low free disk space'),(738,1,1492239623,0,13,'0','10.96.196.127',13844,'Very low free disk space'),(739,1,1492239623,0,13,'0','10.96.196.127',13845,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(740,1,1492239623,0,13,'0','10.96.196.127',13846,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(741,1,1492239623,0,13,'0','10.96.196.127',13847,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(742,1,1492239623,0,13,'0','10.96.196.127',13848,'Zabbix alerter processes more than 75% busy'),(743,1,1492239623,0,13,'0','10.96.196.127',13849,'Zabbix configuration syncer processes more than 75% busy'),(744,1,1492239623,0,13,'0','10.96.196.127',13850,'Zabbix configuration syncer processes more than 75% busy'),(745,1,1492239623,0,13,'0','10.96.196.127',13851,'Zabbix data sender processes more than 75% busy'),(746,1,1492239623,0,13,'0','10.96.196.127',13852,'Zabbix db watchdog processes more than 75% busy'),(747,1,1492239623,0,13,'0','10.96.196.127',13853,'Zabbix discoverer processes more than 75% busy'),(748,1,1492239623,0,13,'0','10.96.196.127',13854,'Zabbix discoverer processes more than 75% busy'),(749,1,1492239623,0,13,'0','10.96.196.127',13855,'Zabbix escalator processes more than 75% busy'),(750,1,1492239623,0,13,'0','10.96.196.127',13856,'Zabbix heartbeat sender processes more than 75% busy'),(751,1,1492239623,0,13,'0','10.96.196.127',13857,'Zabbix history syncer processes more than 75% busy'),(752,1,1492239623,0,13,'0','10.96.196.127',13858,'Zabbix history syncer processes more than 75% busy'),(753,1,1492239623,0,13,'0','10.96.196.127',13859,'Zabbix housekeeper processes more than 75% busy'),(754,1,1492239623,0,13,'0','10.96.196.127',13860,'Zabbix housekeeper processes more than 75% busy'),(755,1,1492239623,0,13,'0','10.96.196.127',13861,'Zabbix http poller processes more than 75% busy'),(756,1,1492239623,0,13,'0','10.96.196.127',13862,'Zabbix http poller processes more than 75% busy'),(757,1,1492239623,0,13,'0','10.96.196.127',13863,'Zabbix icmp pinger processes more than 75% busy'),(758,1,1492239623,0,13,'0','10.96.196.127',13864,'Zabbix icmp pinger processes more than 75% busy'),(759,1,1492239623,0,13,'0','10.96.196.127',13865,'Zabbix ipmi poller processes more than 75% busy'),(760,1,1492239623,0,13,'0','10.96.196.127',13866,'Zabbix ipmi poller processes more than 75% busy'),(761,1,1492239623,0,13,'0','10.96.196.127',13867,'Zabbix java poller processes more than 75% busy'),(762,1,1492239623,0,13,'0','10.96.196.127',13868,'Zabbix java poller processes more than 75% busy'),(763,1,1492239623,0,13,'0','10.96.196.127',13869,'Zabbix poller processes more than 75% busy'),(764,1,1492239623,0,13,'0','10.96.196.127',13870,'Zabbix poller processes more than 75% busy'),(765,1,1492239623,0,13,'0','10.96.196.127',13871,'Zabbix proxy poller processes more than 75% busy'),(766,1,1492239623,0,13,'0','10.96.196.127',13872,'Zabbix self-monitoring processes more than 75% busy'),(767,1,1492239623,0,13,'0','10.96.196.127',13873,'Zabbix self-monitoring processes more than 75% busy'),(768,1,1492239623,0,13,'0','10.96.196.127',13874,'Zabbix snmp trapper processes more than 75% busy'),(769,1,1492239623,0,13,'0','10.96.196.127',13875,'Zabbix snmp trapper processes more than 75% busy'),(770,1,1492239623,0,13,'0','10.96.196.127',13876,'Zabbix timer processes more than 75% busy'),(771,1,1492239623,0,13,'0','10.96.196.127',13877,'Zabbix trapper processes more than 75% busy'),(772,1,1492239623,0,13,'0','10.96.196.127',13878,'Zabbix trapper processes more than 75% busy'),(773,1,1492239623,0,13,'0','10.96.196.127',13879,'Zabbix unreachable poller processes more than 75% busy'),(774,1,1492239623,0,13,'0','10.96.196.127',13880,'Zabbix unreachable poller processes more than 75% busy'),(775,1,1492239623,0,13,'0','10.96.196.127',13881,'Zabbix value cache working in low memory mode'),(776,1,1492239623,0,13,'0','10.96.196.127',13882,'Zabbix vmware collector processes more than 75% busy'),(777,1,1492239623,0,13,'0','10.96.196.127',13883,'{HOST.NAME} has just been restarted'),(778,1,1492239623,0,13,'0','10.96.196.127',13884,'{HOST.NAME} has just been restarted'),(779,1,1492239823,2,13,'0','10.96.196.127',13774,'Openstack controller service cinder api'),(780,1,1492239823,2,13,'0','10.96.196.127',13775,'Openstack controller service cinder scheduler'),(781,1,1492239823,2,13,'0','10.96.196.127',13776,'Openstack controller service glance api'),(782,1,1492239823,2,13,'0','10.96.196.127',13777,'Openstack controller service glance registry'),(783,1,1492239823,2,13,'0','10.96.196.127',13778,'Openstack controller service httpd'),(784,1,1492239823,2,13,'0','10.96.196.127',13779,'Openstack controller service memcached'),(785,1,1492239823,2,13,'0','10.96.196.127',13780,'Openstack controller service neutron dhcp agent'),(786,1,1492239823,2,13,'0','10.96.196.127',13781,'Openstack controller service neutron l3 agent'),(787,1,1492239823,2,13,'0','10.96.196.127',13782,'Openstack controller service neutron metadata agent'),(788,1,1492239823,2,13,'0','10.96.196.127',13783,'Openstack controller service neutron openvswitch agent'),(789,1,1492239823,2,13,'0','10.96.196.127',13784,'Openstack controller service neutron server'),(790,1,1492239823,2,13,'0','10.96.196.127',13785,'Openstack controller service nova api'),(791,1,1492239823,2,13,'0','10.96.196.127',13786,'Openstack controller service nova cert'),(792,1,1492239823,2,13,'0','10.96.196.127',13787,'Openstack controller service nova conductor'),(793,1,1492239823,2,13,'0','10.96.196.127',13788,'Openstack controller service nova consoleauth'),(794,1,1492239823,2,13,'0','10.96.196.127',13789,'Openstack controller service nova novncproxy'),(795,1,1492239823,2,13,'0','10.96.196.127',13790,'Openstack controller service nova scheduler'),(796,1,1492239823,2,13,'0','10.96.196.127',13793,'Openstack haproxy has down'),(797,1,1492239823,2,15,'Item [openstack.serviceexist[haproxy]] [23917] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(798,1,1492239823,2,15,'Item [openstack.serviceexist[httpd]] [23918] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(799,1,1492239823,2,15,'Item [openstack.serviceexist[memcached]] [23919] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(800,1,1492239823,2,15,'Item [openstack.serviceexist[neutron-dhcp-agent]] [23920] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(801,1,1492239823,2,15,'Item [openstack.serviceexist[neutron-l3-agent]] [23921] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(802,1,1492239823,2,15,'Item [openstack.serviceexist[neutron-metadata-agent]] [23922] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(803,1,1492239823,2,15,'Item [openstack.serviceexist[neutron-openvswitch-agent]] [23923] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(804,1,1492239823,2,15,'Item [openstack.serviceexist[ neutron-server]] [23924] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(805,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-cinder-api]] [23925] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(806,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-cinder-scheduler]] [23926] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(807,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-glance-api]] [23927] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(808,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-glance-registry]] [23928] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(809,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-nova-api]] [23929] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(810,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-nova-cert]] [23930] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(811,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-nova-conductor]] [23931] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(812,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-nova-consoleauth]] [23932] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(813,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-nova-novncproxy]] [23933] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(814,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-nova-scheduler]] [23934] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(815,1,1492253247,1,0,'User alias [Admin] name [Zabbix] surname [Administrator]','10.96.206.88',0,''),(816,1,1492253334,1,5,'Name: Send E-mail','10.96.206.88',0,''),(817,1,1492253469,1,5,'Name: Auto registration:compute','10.96.206.88',0,''),(818,1,1492253517,1,5,'Name: Auto registration:controller','10.96.206.88',0,''),(819,1,1492253597,1,5,'Name: Auto registration:ceph','10.96.206.88',0,''),(820,1,1492253616,1,5,'Name: Auto registration:compute','10.96.206.88',0,'');
/*!40000 ALTER TABLE `auditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog_details`
--

DROP TABLE IF EXISTS `auditlog_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog_details` (
  `auditdetailid` bigint(20) unsigned NOT NULL,
  `auditid` bigint(20) unsigned NOT NULL,
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `field_name` varchar(64) NOT NULL DEFAULT '',
  `oldvalue` text NOT NULL,
  `newvalue` text NOT NULL,
  PRIMARY KEY (`auditdetailid`),
  KEY `auditlog_details_1` (`auditid`),
  CONSTRAINT `c_auditlog_details_1` FOREIGN KEY (`auditid`) REFERENCES `auditlog` (`auditid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog_details`
--

LOCK TABLES `auditlog_details` WRITE;
/*!40000 ALTER TABLE `auditlog_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditlog_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoreg_host`
--

DROP TABLE IF EXISTS `autoreg_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoreg_host` (
  `autoreg_hostid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(64) NOT NULL DEFAULT '',
  `listen_ip` varchar(39) NOT NULL DEFAULT '',
  `listen_port` int(11) NOT NULL DEFAULT '0',
  `listen_dns` varchar(64) NOT NULL DEFAULT '',
  `host_metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`autoreg_hostid`),
  KEY `autoreg_host_1` (`proxy_hostid`,`host`),
  CONSTRAINT `c_autoreg_host_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoreg_host`
--

LOCK TABLES `autoreg_host` WRITE;
/*!40000 ALTER TABLE `autoreg_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `autoreg_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditions` (
  `conditionid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `conditiontype` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`conditionid`),
  KEY `conditions_1` (`actionid`),
  CONSTRAINT `c_conditions_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
INSERT INTO `conditions` VALUES (2,2,10,0,'0'),(3,2,8,0,'9'),(4,2,12,2,'Linux'),(5,3,16,7,''),(6,3,5,0,'1'),(7,4,23,0,'0'),(8,5,23,0,'2'),(9,6,23,0,'4'),(10,7,16,7,''),(11,7,5,0,'1'),(12,8,24,2,'controller'),(13,9,24,2,'compute'),(14,10,24,2,'ceph'),(15,11,16,7,''),(16,11,5,0,'1');
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `configid` bigint(20) unsigned NOT NULL,
  `refresh_unsupported` int(11) NOT NULL DEFAULT '0',
  `work_period` varchar(100) NOT NULL DEFAULT '1-5,00:00-24:00',
  `alert_usrgrpid` bigint(20) unsigned DEFAULT NULL,
  `event_ack_enable` int(11) NOT NULL DEFAULT '1',
  `event_expire` int(11) NOT NULL DEFAULT '7',
  `event_show_max` int(11) NOT NULL DEFAULT '100',
  `default_theme` varchar(128) NOT NULL DEFAULT 'blue-theme',
  `authentication_type` int(11) NOT NULL DEFAULT '0',
  `ldap_host` varchar(255) NOT NULL DEFAULT '',
  `ldap_port` int(11) NOT NULL DEFAULT '389',
  `ldap_base_dn` varchar(255) NOT NULL DEFAULT '',
  `ldap_bind_dn` varchar(255) NOT NULL DEFAULT '',
  `ldap_bind_password` varchar(128) NOT NULL DEFAULT '',
  `ldap_search_attribute` varchar(128) NOT NULL DEFAULT '',
  `dropdown_first_entry` int(11) NOT NULL DEFAULT '1',
  `dropdown_first_remember` int(11) NOT NULL DEFAULT '1',
  `discovery_groupid` bigint(20) unsigned NOT NULL,
  `max_in_table` int(11) NOT NULL DEFAULT '50',
  `search_limit` int(11) NOT NULL DEFAULT '1000',
  `severity_color_0` varchar(6) NOT NULL DEFAULT '97AAB3',
  `severity_color_1` varchar(6) NOT NULL DEFAULT '7499FF',
  `severity_color_2` varchar(6) NOT NULL DEFAULT 'FFC859',
  `severity_color_3` varchar(6) NOT NULL DEFAULT 'FFA059',
  `severity_color_4` varchar(6) NOT NULL DEFAULT 'E97659',
  `severity_color_5` varchar(6) NOT NULL DEFAULT 'E45959',
  `severity_name_0` varchar(32) NOT NULL DEFAULT 'Not classified',
  `severity_name_1` varchar(32) NOT NULL DEFAULT 'Information',
  `severity_name_2` varchar(32) NOT NULL DEFAULT 'Warning',
  `severity_name_3` varchar(32) NOT NULL DEFAULT 'Average',
  `severity_name_4` varchar(32) NOT NULL DEFAULT 'High',
  `severity_name_5` varchar(32) NOT NULL DEFAULT 'Disaster',
  `ok_period` int(11) NOT NULL DEFAULT '1800',
  `blink_period` int(11) NOT NULL DEFAULT '1800',
  `problem_unack_color` varchar(6) NOT NULL DEFAULT 'DC0000',
  `problem_ack_color` varchar(6) NOT NULL DEFAULT 'DC0000',
  `ok_unack_color` varchar(6) NOT NULL DEFAULT '00AA00',
  `ok_ack_color` varchar(6) NOT NULL DEFAULT '00AA00',
  `problem_unack_style` int(11) NOT NULL DEFAULT '1',
  `problem_ack_style` int(11) NOT NULL DEFAULT '1',
  `ok_unack_style` int(11) NOT NULL DEFAULT '1',
  `ok_ack_style` int(11) NOT NULL DEFAULT '1',
  `snmptrap_logging` int(11) NOT NULL DEFAULT '1',
  `server_check_interval` int(11) NOT NULL DEFAULT '10',
  `hk_events_mode` int(11) NOT NULL DEFAULT '1',
  `hk_events_trigger` int(11) NOT NULL DEFAULT '365',
  `hk_events_internal` int(11) NOT NULL DEFAULT '365',
  `hk_events_discovery` int(11) NOT NULL DEFAULT '365',
  `hk_events_autoreg` int(11) NOT NULL DEFAULT '365',
  `hk_services_mode` int(11) NOT NULL DEFAULT '1',
  `hk_services` int(11) NOT NULL DEFAULT '365',
  `hk_audit_mode` int(11) NOT NULL DEFAULT '1',
  `hk_audit` int(11) NOT NULL DEFAULT '365',
  `hk_sessions_mode` int(11) NOT NULL DEFAULT '1',
  `hk_sessions` int(11) NOT NULL DEFAULT '365',
  `hk_history_mode` int(11) NOT NULL DEFAULT '1',
  `hk_history_global` int(11) NOT NULL DEFAULT '0',
  `hk_history` int(11) NOT NULL DEFAULT '90',
  `hk_trends_mode` int(11) NOT NULL DEFAULT '1',
  `hk_trends_global` int(11) NOT NULL DEFAULT '0',
  `hk_trends` int(11) NOT NULL DEFAULT '365',
  `default_inventory_mode` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`configid`),
  KEY `config_1` (`alert_usrgrpid`),
  KEY `config_2` (`discovery_groupid`),
  CONSTRAINT `c_config_2` FOREIGN KEY (`discovery_groupid`) REFERENCES `groups` (`groupid`),
  CONSTRAINT `c_config_1` FOREIGN KEY (`alert_usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,600,'1-5,09:00-18:00;',7,1,7,100,'blue-theme',0,'',389,'','','','',1,1,5,50,1000,'97AAB3','7499FF','FFC859','FFA059','E97659','E45959','Not classified','Information','Warning','Average','High','Disaster',1800,1800,'DC0000','DC0000','00AA00','00AA00',1,1,1,1,1,10,1,365,365,365,365,1,365,1,365,1,365,1,0,90,1,0,365,-1);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbversion`
--

DROP TABLE IF EXISTS `dbversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbversion` (
  `mandatory` int(11) NOT NULL DEFAULT '0',
  `optional` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbversion`
--

LOCK TABLES `dbversion` WRITE;
/*!40000 ALTER TABLE `dbversion` DISABLE KEYS */;
INSERT INTO `dbversion` VALUES (3000000,3000000);
/*!40000 ALTER TABLE `dbversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dchecks`
--

DROP TABLE IF EXISTS `dchecks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dchecks` (
  `dcheckid` bigint(20) unsigned NOT NULL,
  `druleid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `key_` varchar(255) NOT NULL DEFAULT '',
  `snmp_community` varchar(255) NOT NULL DEFAULT '',
  `ports` varchar(255) NOT NULL DEFAULT '0',
  `snmpv3_securityname` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_securitylevel` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authpassphrase` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_privpassphrase` varchar(64) NOT NULL DEFAULT '',
  `uniq` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_privprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_contextname` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`dcheckid`),
  KEY `dchecks_1` (`druleid`),
  CONSTRAINT `c_dchecks_1` FOREIGN KEY (`druleid`) REFERENCES `drules` (`druleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dchecks`
--

LOCK TABLES `dchecks` WRITE;
/*!40000 ALTER TABLE `dchecks` DISABLE KEYS */;
INSERT INTO `dchecks` VALUES (2,2,9,'system.uname','','10050','',0,'','',0,0,0,'');
/*!40000 ALTER TABLE `dchecks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dhosts`
--

DROP TABLE IF EXISTS `dhosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dhosts` (
  `dhostid` bigint(20) unsigned NOT NULL,
  `druleid` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `lastup` int(11) NOT NULL DEFAULT '0',
  `lastdown` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dhostid`),
  KEY `dhosts_1` (`druleid`),
  CONSTRAINT `c_dhosts_1` FOREIGN KEY (`druleid`) REFERENCES `drules` (`druleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dhosts`
--

LOCK TABLES `dhosts` WRITE;
/*!40000 ALTER TABLE `dhosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `dhosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drules`
--

DROP TABLE IF EXISTS `drules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drules` (
  `druleid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `iprange` varchar(2048) NOT NULL DEFAULT '',
  `delay` int(11) NOT NULL DEFAULT '3600',
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`druleid`),
  UNIQUE KEY `drules_2` (`name`),
  KEY `drules_1` (`proxy_hostid`),
  CONSTRAINT `c_drules_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drules`
--

LOCK TABLES `drules` WRITE;
/*!40000 ALTER TABLE `drules` DISABLE KEYS */;
INSERT INTO `drules` VALUES (2,NULL,'Local network','192.168.0.1-254',3600,0,1);
/*!40000 ALTER TABLE `drules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dservices`
--

DROP TABLE IF EXISTS `dservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dservices` (
  `dserviceid` bigint(20) unsigned NOT NULL,
  `dhostid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `key_` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `lastup` int(11) NOT NULL DEFAULT '0',
  `lastdown` int(11) NOT NULL DEFAULT '0',
  `dcheckid` bigint(20) unsigned NOT NULL,
  `ip` varchar(39) NOT NULL DEFAULT '',
  `dns` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`dserviceid`),
  UNIQUE KEY `dservices_1` (`dcheckid`,`type`,`key_`,`ip`,`port`),
  KEY `dservices_2` (`dhostid`),
  CONSTRAINT `c_dservices_2` FOREIGN KEY (`dcheckid`) REFERENCES `dchecks` (`dcheckid`) ON DELETE CASCADE,
  CONSTRAINT `c_dservices_1` FOREIGN KEY (`dhostid`) REFERENCES `dhosts` (`dhostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dservices`
--

LOCK TABLES `dservices` WRITE;
/*!40000 ALTER TABLE `dservices` DISABLE KEYS */;
/*!40000 ALTER TABLE `dservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalations`
--

DROP TABLE IF EXISTS `escalations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escalations` (
  `escalationid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned DEFAULT NULL,
  `eventid` bigint(20) unsigned DEFAULT NULL,
  `r_eventid` bigint(20) unsigned DEFAULT NULL,
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `esc_step` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`escalationid`),
  UNIQUE KEY `escalations_1` (`actionid`,`triggerid`,`itemid`,`escalationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalations`
--

LOCK TABLES `escalations` WRITE;
/*!40000 ALTER TABLE `escalations` DISABLE KEYS */;
/*!40000 ALTER TABLE `escalations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `eventid` bigint(20) unsigned NOT NULL,
  `source` int(11) NOT NULL DEFAULT '0',
  `object` int(11) NOT NULL DEFAULT '0',
  `objectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `acknowledged` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventid`),
  KEY `events_1` (`source`,`object`,`objectid`,`clock`),
  KEY `events_2` (`source`,`object`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expressions`
--

DROP TABLE IF EXISTS `expressions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expressions` (
  `expressionid` bigint(20) unsigned NOT NULL,
  `regexpid` bigint(20) unsigned NOT NULL,
  `expression` varchar(255) NOT NULL DEFAULT '',
  `expression_type` int(11) NOT NULL DEFAULT '0',
  `exp_delimiter` varchar(1) NOT NULL DEFAULT '',
  `case_sensitive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`expressionid`),
  KEY `expressions_1` (`regexpid`),
  CONSTRAINT `c_expressions_1` FOREIGN KEY (`regexpid`) REFERENCES `regexps` (`regexpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expressions`
--

LOCK TABLES `expressions` WRITE;
/*!40000 ALTER TABLE `expressions` DISABLE KEYS */;
INSERT INTO `expressions` VALUES (1,1,'^(btrfs|ext2|ext3|ext4|jfs|reiser|xfs|ffs|ufs|jfs|jfs2|vxfs|hfs|refs|ntfs|fat32|zfs)$',3,',',0),(2,2,'^lo$',4,',',1),(3,3,'^(Physical memory|Virtual memory|Memory buffers|Cached memory|Swap space)$',4,',',1),(4,2,'^Software Loopback Interface',4,',',1);
/*!40000 ALTER TABLE `expressions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functions`
--

DROP TABLE IF EXISTS `functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `functions` (
  `functionid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `function` varchar(12) NOT NULL DEFAULT '',
  `parameter` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`functionid`),
  KEY `functions_1` (`triggerid`),
  KEY `functions_2` (`itemid`,`function`,`parameter`),
  CONSTRAINT `c_functions_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_functions_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functions`
--

LOCK TABLES `functions` WRITE;
/*!40000 ALTER TABLE `functions` DISABLE KEYS */;
INSERT INTO `functions` VALUES (12648,23620,13075,'min','10m'),(12895,23271,13486,'min','10m'),(12896,23273,13487,'min','10m'),(12897,23274,13488,'min','10m'),(12898,23275,13489,'min','10m'),(12899,23276,13490,'min','10m'),(12900,23287,13491,'nodata','5m'),(12902,23289,13493,'last','0'),(12903,23290,13494,'last','0'),(12908,23307,13499,'diff','0'),(12909,23310,13500,'last','0'),(12910,23312,13501,'diff','0'),(12911,23313,13502,'change','0'),(12912,23315,13503,'diff','0'),(12913,23316,13504,'last','0'),(12914,23282,13505,'last','0'),(12915,23284,13506,'last','0'),(12928,23288,13492,'diff','0'),(12938,23327,13509,'diff','0'),(12966,23635,13537,'min','10m'),(13030,23266,13481,'min','10m'),(13079,23296,13497,'avg','5m'),(13081,23301,13498,'avg','5m'),(13083,23292,13496,'avg','5m'),(13085,23291,13495,'avg','5m'),(13100,23252,13467,'avg','10m'),(13102,23253,13468,'avg','10m'),(13104,23254,13469,'avg','10m'),(13106,23255,13470,'avg','10m'),(13108,23256,13471,'avg','10m'),(13110,23257,13472,'avg','10m'),(13112,23258,13473,'avg','30m'),(13114,23259,13474,'avg','10m'),(13116,23260,13475,'avg','10m'),(13118,23261,13476,'avg','10m'),(13120,23262,13477,'avg','10m'),(13124,23264,13479,'avg','10m'),(13126,23265,13480,'avg','10m'),(13128,23267,13482,'avg','10m'),(13130,23268,13483,'avg','10m'),(13132,23269,13484,'avg','10m'),(13134,23270,13485,'avg','10m'),(13136,23328,13436,'avg','10m'),(13161,23662,13558,'last',''),(13299,24013,13696,'diff','0'),(13300,24059,13697,'regexp','ON'),(13301,24181,13698,'strlen','#1'),(13302,24185,13699,'strlen','#1'),(13303,24192,13700,'regexp','\"ON\"'),(13304,24185,13701,'strlen','#1'),(13305,24181,13701,'strlen','#1'),(13306,24184,13701,'regexp','\"MIXED\",#1'),(13307,24189,13702,'last','0'),(13308,24179,13703,'last','0'),(13309,24060,13704,'regexp','OFF'),(13310,23893,13705,'last',''),(13311,23893,13706,'last',''),(13312,24207,13707,'regexp','utf8'),(13313,24064,13708,'last','60'),(13314,24072,13709,'last','0'),(13315,24067,13710,'regexp','Primary'),(13316,24066,13711,'last','0'),(13317,23990,13712,'last','0'),(13318,23991,13713,'last','0'),(13319,24002,13714,'avg','5m'),(13320,24223,13715,'regexp','InnoDB'),(13321,24003,13716,'avg','5m'),(13322,24053,13717,'last','0'),(13323,24052,13718,'last','0'),(13324,24052,13718,'prev','0'),(13325,24052,13719,'last','0'),(13326,24052,13719,'prev','0'),(13327,24054,13720,'last','0'),(13328,24226,13721,'regexp','ON'),(13329,24010,13722,'diff','0'),(13330,24028,13723,'diff','0'),(13331,24108,13724,'last','0'),(13332,24103,13725,'last','0'),(13333,24135,13726,'last','0'),(13334,24136,13727,'diff','0'),(13335,24137,13728,'last','0'),(13336,24105,13729,'last','0'),(13337,24156,13730,'last','1m'),(13338,24142,13730,'last','0'),(13339,24144,13731,'last','0'),(13340,24156,13732,'last','1h'),(13341,24144,13732,'last','0'),(13342,24143,13732,'last','0'),(13343,24106,13733,'regexp','ON'),(13344,24672,13734,'last','0'),(13345,24014,13735,'last','0'),(13346,24030,13736,'last','0'),(13347,24026,13737,'last','0'),(13348,23980,13738,'min','10m'),(13349,23954,13739,'min','10m'),(13350,23979,13740,'min','10m'),(13351,23955,13741,'min','10m'),(13352,23985,13742,'min','10m'),(13353,23986,13743,'min','10m'),(13354,23956,13744,'min','10m'),(13355,23987,13745,'min','10m'),(13356,23984,13746,'min','10m'),(13357,24237,13747,'regexp','FILE'),(13358,24238,13748,'regexp','\"ON\"'),(13359,24621,13749,'last','0'),(13360,24626,13750,'last','0'),(13361,23952,13751,'min','10m'),(13362,23977,13752,'min','10m'),(13363,23894,13753,'last','0'),(13364,24199,13754,'last','0'),(13365,24199,13755,'diff','0'),(13366,24199,13755,'last','0'),(13367,24094,13756,'regexp','ON'),(13368,23872,13757,'last',''),(13369,24184,13758,'regexp','ROW'),(13370,24251,13759,'last','0'),(13371,24252,13759,'last','0'),(13372,23863,13760,'last',''),(13373,23862,13761,'last',''),(13374,23855,13762,'last',''),(13375,23861,13763,'last',''),(13376,23864,13764,'last',''),(13377,23865,13765,'last',''),(13378,23856,13766,'last',''),(13379,23914,13767,'strlen',''),(13380,23912,13768,'last',''),(13381,23908,13769,'last',''),(13382,23909,13770,'last',''),(13383,23910,13771,'last',''),(13384,23911,13772,'last',''),(13385,23913,13773,'last',''),(13403,23866,13791,'last',''),(13404,23867,13792,'last',''),(13406,23859,13794,'last',''),(13407,23874,13795,'last',''),(13408,23850,13796,'last',''),(13409,23880,13797,'last',''),(13410,23881,13798,'last',''),(13411,23851,13799,'last',''),(13412,23852,13800,'last',''),(13413,23877,13801,'last',''),(13414,23878,13802,'last',''),(13415,23853,13803,'last',''),(13416,23854,13804,'last',''),(13417,23879,13805,'last',''),(13418,23860,13806,'last',''),(13419,23915,13807,'strlen',''),(13420,23868,13808,'last',''),(13421,23869,13809,'last',''),(13422,23857,13810,'last',''),(13423,23870,13811,'last',''),(13424,23871,13812,'last',''),(13425,23883,13813,'last',''),(13426,23873,13814,'last',''),(13427,23916,13815,'strlen',''),(13428,23884,13816,'last',''),(13429,23858,13817,'last',''),(13430,23885,13818,'last',''),(13431,23875,13819,'last',''),(13432,23876,13820,'last',''),(13433,23882,13821,'last',''),(13434,23997,13822,'avg','5m'),(13435,23998,13823,'avg','5m'),(13436,23996,13824,'avg','5m'),(13437,24023,13825,'avg','5m'),(13438,24271,13826,'last','0'),(13439,24242,13826,'last','0'),(13440,24673,13827,'regexp','OFF'),(13441,24669,13828,'regexp','ON'),(13442,24671,13829,'last','0'),(13443,24671,13830,'last','0'),(13444,24671,13830,'time','0'),(13445,24279,13831,'last','0'),(13446,24271,13831,'last','0'),(13447,24674,13832,'last','0'),(13448,23935,13833,'max','#3'),(13449,24194,13834,'last','0'),(13450,24254,13835,'last','0'),(13451,24286,13835,'last','0'),(13452,24253,13836,'last','0'),(13453,24289,13836,'last','0'),(13454,24295,13837,'last','0'),(13455,24295,13838,'last','0'),(13456,24061,13839,'avg','300'),(13457,24099,13839,'last','0'),(13458,24022,13840,'avg','5m'),(13459,24297,13841,'regexp','REPEATABLE-READ'),(13460,24297,13842,'regexp','REPEATABLE-READ'),(13461,24297,13842,'regexp','READ-COMMITTED'),(13462,24621,13843,'last','0'),(13463,24626,13844,'last','0'),(13464,23936,13845,'nodata','5m'),(13465,23989,13846,'nodata','5m'),(13466,24016,13847,'nodata','5m'),(13467,23958,13848,'avg','10m'),(13468,23937,13849,'avg','10m'),(13469,23959,13850,'avg','10m'),(13470,23938,13851,'avg','10m'),(13471,23960,13852,'avg','10m'),(13472,23939,13853,'avg','10m'),(13473,23961,13854,'avg','10m'),(13474,23962,13855,'avg','10m'),(13475,23940,13856,'avg','10m'),(13476,23941,13857,'avg','10m'),(13477,23963,13858,'avg','10m'),(13478,23942,13859,'avg','30m'),(13479,23964,13860,'avg','30m'),(13480,23943,13861,'avg','10m'),(13481,23965,13862,'avg','10m'),(13482,23944,13863,'avg','10m'),(13483,23966,13864,'avg','10m'),(13484,23945,13865,'avg','10m'),(13485,23967,13866,'avg','10m'),(13486,23946,13867,'avg','10m'),(13487,23968,13868,'avg','10m'),(13488,23947,13869,'avg','10m'),(13489,23969,13870,'avg','10m'),(13490,23970,13871,'avg','10m'),(13491,23948,13872,'avg','10m'),(13492,23971,13873,'min','10m'),(13493,23949,13874,'avg','10m'),(13494,23972,13875,'avg','10m'),(13495,23973,13876,'avg','10m'),(13496,23950,13877,'avg','10m'),(13497,23974,13878,'avg','10m'),(13498,23951,13879,'avg','10m'),(13499,23975,13880,'avg','10m'),(13500,23983,13881,'last',''),(13501,23976,13882,'avg','10m'),(13502,24011,13883,'change','0'),(13503,24029,13884,'change','0'),(13504,24695,13885,'last','0'),(13505,24693,13886,'last','0'),(13506,24701,13887,'last','0');
/*!40000 ALTER TABLE `functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalmacro`
--

DROP TABLE IF EXISTS `globalmacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalmacro` (
  `globalmacroid` bigint(20) unsigned NOT NULL,
  `macro` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`globalmacroid`),
  UNIQUE KEY `globalmacro_1` (`macro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalmacro`
--

LOCK TABLES `globalmacro` WRITE;
/*!40000 ALTER TABLE `globalmacro` DISABLE KEYS */;
INSERT INTO `globalmacro` VALUES (2,'{$SNMP_COMMUNITY}','public');
/*!40000 ALTER TABLE `globalmacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalvars`
--

DROP TABLE IF EXISTS `globalvars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalvars` (
  `globalvarid` bigint(20) unsigned NOT NULL,
  `snmp_lastsize` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`globalvarid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalvars`
--

LOCK TABLES `globalvars` WRITE;
/*!40000 ALTER TABLE `globalvars` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalvars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_discovery`
--

DROP TABLE IF EXISTS `graph_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_discovery` (
  `graphid` bigint(20) unsigned NOT NULL,
  `parent_graphid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`graphid`),
  KEY `graph_discovery_1` (`parent_graphid`),
  CONSTRAINT `c_graph_discovery_2` FOREIGN KEY (`parent_graphid`) REFERENCES `graphs` (`graphid`),
  CONSTRAINT `c_graph_discovery_1` FOREIGN KEY (`graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_discovery`
--

LOCK TABLES `graph_discovery` WRITE;
/*!40000 ALTER TABLE `graph_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `graph_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_theme`
--

DROP TABLE IF EXISTS `graph_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_theme` (
  `graphthemeid` bigint(20) unsigned NOT NULL,
  `theme` varchar(64) NOT NULL DEFAULT '',
  `backgroundcolor` varchar(6) NOT NULL DEFAULT '',
  `graphcolor` varchar(6) NOT NULL DEFAULT '',
  `gridcolor` varchar(6) NOT NULL DEFAULT '',
  `maingridcolor` varchar(6) NOT NULL DEFAULT '',
  `gridbordercolor` varchar(6) NOT NULL DEFAULT '',
  `textcolor` varchar(6) NOT NULL DEFAULT '',
  `highlightcolor` varchar(6) NOT NULL DEFAULT '',
  `leftpercentilecolor` varchar(6) NOT NULL DEFAULT '',
  `rightpercentilecolor` varchar(6) NOT NULL DEFAULT '',
  `nonworktimecolor` varchar(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`graphthemeid`),
  UNIQUE KEY `graph_theme_1` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_theme`
--

LOCK TABLES `graph_theme` WRITE;
/*!40000 ALTER TABLE `graph_theme` DISABLE KEYS */;
INSERT INTO `graph_theme` VALUES (1,'blue-theme','FFFFFF','FFFFFF','CCD5D9','ACBBC2','ACBBC2','1F2C33','E33734','429E47','E33734','EBEBEB'),(2,'dark-theme','2B2B2B','2B2B2B','454545','4F4F4F','4F4F4F','F2F2F2','E45959','59DB8F','E45959','333333');
/*!40000 ALTER TABLE `graph_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphs`
--

DROP TABLE IF EXISTS `graphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs` (
  `graphid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '900',
  `height` int(11) NOT NULL DEFAULT '200',
  `yaxismin` double(16,4) NOT NULL DEFAULT '0.0000',
  `yaxismax` double(16,4) NOT NULL DEFAULT '100.0000',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `show_work_period` int(11) NOT NULL DEFAULT '1',
  `show_triggers` int(11) NOT NULL DEFAULT '1',
  `graphtype` int(11) NOT NULL DEFAULT '0',
  `show_legend` int(11) NOT NULL DEFAULT '1',
  `show_3d` int(11) NOT NULL DEFAULT '0',
  `percent_left` double(16,4) NOT NULL DEFAULT '0.0000',
  `percent_right` double(16,4) NOT NULL DEFAULT '0.0000',
  `ymin_type` int(11) NOT NULL DEFAULT '0',
  `ymax_type` int(11) NOT NULL DEFAULT '0',
  `ymin_itemid` bigint(20) unsigned DEFAULT NULL,
  `ymax_itemid` bigint(20) unsigned DEFAULT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`graphid`),
  KEY `graphs_1` (`name`),
  KEY `graphs_2` (`templateid`),
  KEY `graphs_3` (`ymin_itemid`),
  KEY `graphs_4` (`ymax_itemid`),
  CONSTRAINT `c_graphs_3` FOREIGN KEY (`ymax_itemid`) REFERENCES `items` (`itemid`),
  CONSTRAINT `c_graphs_1` FOREIGN KEY (`templateid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_graphs_2` FOREIGN KEY (`ymin_itemid`) REFERENCES `items` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphs`
--

LOCK TABLES `graphs` WRITE;
/*!40000 ALTER TABLE `graphs` DISABLE KEYS */;
INSERT INTO `graphs` VALUES (517,'Zabbix internal process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(518,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(519,'Zabbix server performance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(520,'Zabbix cache usage, % free',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(521,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(522,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(523,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(524,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(525,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(526,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(528,'Value cache effectiveness',900,200,0.0000,100.0000,NULL,1,1,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(534,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23317,0),(553,'IO_asu on {#DISK_NAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(554,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(555,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(556,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(557,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(558,'Aria key buffer',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(559,'Aria key reads',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(560,'Aria key writes',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(561,'Binary log',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(562,'Binlog Statement Cache Efficiency',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(563,'Binlog Trx Cache Efficiency',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(564,'compute node',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(565,'Context switches',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(566,'controller node',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(567,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(568,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(569,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(570,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(571,'CPU utilization core 0',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,1,NULL,NULL,0),(572,'CPU utilization core 1',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,1,NULL,NULL,0),(573,'CPU utilization core 2',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,1,NULL,NULL,0),(574,'CPU utilization core 3',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,1,NULL,NULL,0),(575,'CPU utilization total',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,1,NULL,NULL,0),(576,'Disk Space',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(577,'Forks',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(578,'fpmmm Agent alive',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(579,'Galera Cluster slow down due to Slave lag',900,200,0.0000,1.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,1,NULL,NULL,0),(580,'Galera Network Traffic',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(581,'Galera Slave Threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(582,'Galera slow Cluster Node',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(583,'haproxy',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(584,'I/O time',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(585,'InnoDB Adaptive Hash Index Memory',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(586,'InnoDB Adaptive Hash Index Searches',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(587,'InnoDB Buffer Pool Activity (blocks)',900,200,0.0000,0.0000,NULL,1,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(588,'InnoDB Buffer Pool Activity (bytes)',900,200,0.0000,0.0000,NULL,1,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(589,'InnoDB Buffer Pool reads',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(590,'InnoDB Compression Time',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(591,'InnoDB Datafile IO Usage',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(592,'InnoDB Deadlocks',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(593,'InnoDB Locking',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(594,'InnoDB Log Activity',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(595,'InnoDB OS File Access',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(596,'InnoDB Row Lock Details',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(597,'InnoDB Row Operations',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(598,'InnoDB Semaphores',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(599,'InnoDB Transaction History',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(600,'InnoDB Transaction Lock Memory',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(601,'InnoDB Transactions',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(602,'Interrupts',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(603,'IOPS of sda',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(604,'IOPS of sdb',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(605,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,24031,0),(606,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,24015,0),(607,'MySQL bandwidth',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(608,'MySQL Connections',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(609,'MySQL Connections - Aborted',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(610,'MySQL Connections - Cache (Thread cache)',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(611,'MySQL Connections/Threads',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(612,'mysqld',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(613,'MySQL Network/Socket activity',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(614,'MySQL operations',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(615,'MySQL Queries executed',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(616,'MySQL Row access (Handler reads)',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(617,'MySQL Row writes (Handler writes)',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(618,'MySQL Slow queries',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(619,'MySQL Sort activity',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(620,'MySQL Table definition cache',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(621,'MySQL Table locks',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(622,'MySQL Table open cache',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(623,'MySQL Temporary files',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(624,'MySQL Temporary tables',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(625,'Network traffic eth0 (bytes)',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(626,'Network traffic eth0 (packets)',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(627,'Network traffic eth1 (bytes)',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(628,'Network traffic eth1 (packets)',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(629,'Network traffic lo (bytes)',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(630,'Network traffic lo (packets)',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(631,'ntp',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(632,'Physical memory (RAM)',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(633,'Processes',900,200,0.0000,100.0000,NULL,0,0,1,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(634,'Process memory',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(635,'Process Page Faults',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(636,'Process time',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(637,'Query cache blocks',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(638,'Query cache efficiency',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(639,'Query cache low memory prunes',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(640,'Query cache memory',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(641,'Query Cache queries',900,200,0.0000,100.0000,NULL,0,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(642,'rabbitmq-server',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(643,'Slave behind Master',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(644,'Slave read/write/execute positions',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(645,'Slave thread state',900,200,0.0000,100.0000,NULL,1,0,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(646,'Swap space',900,200,0.0000,0.0000,NULL,0,0,0,1,0,0.0000,0.0000,1,2,NULL,24662,0),(647,'Value cache effectiveness',900,200,0.0000,100.0000,NULL,1,1,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(648,'Zabbix cache usage, % free',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(649,'Zabbix cache usage, % free',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(650,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(651,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(652,'Zabbix internal process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(653,'Zabbix internal process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(654,'Zabbix proxy performance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(655,'Zabbix server performance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `graphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphs_items`
--

DROP TABLE IF EXISTS `graphs_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs_items` (
  `gitemid` bigint(20) unsigned NOT NULL,
  `graphid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '009600',
  `yaxisside` int(11) NOT NULL DEFAULT '0',
  `calc_fnc` int(11) NOT NULL DEFAULT '2',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gitemid`),
  KEY `graphs_items_1` (`itemid`),
  KEY `graphs_items_2` (`graphid`),
  CONSTRAINT `c_graphs_items_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_graphs_items_1` FOREIGN KEY (`graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphs_items`
--

LOCK TABLES `graphs_items` WRITE;
/*!40000 ALTER TABLE `graphs_items` DISABLE KEYS */;
INSERT INTO `graphs_items` VALUES (1689,517,23268,0,0,'00EE00',0,2,0),(1691,517,23256,0,1,'0000EE',0,2,0),(1692,517,23258,0,2,'FFAA00',0,2,0),(1693,517,23252,0,3,'00EEEE',0,2,0),(1694,517,23253,0,4,'990099',0,2,0),(1695,517,23254,0,5,'666600',0,2,0),(1696,517,23257,0,6,'EE0000',0,2,0),(1697,517,23266,0,7,'FF66FF',0,2,0),(1698,518,23269,0,0,'990099',0,2,0),(1699,518,23264,0,1,'990000',0,2,0),(1700,518,23261,0,2,'0000EE',0,2,0),(1701,518,23255,0,3,'FF33FF',0,2,0),(1702,518,23260,0,4,'009600',0,2,0),(1703,518,23259,0,5,'003300',0,2,0),(1704,518,23265,0,6,'CCCC00',0,2,0),(1705,518,23270,0,7,'33FFFF',0,2,0),(1706,518,23262,0,8,'DD0000',0,2,0),(1707,518,23267,0,9,'000099',0,2,0),(1708,519,23277,5,0,'00C800',0,2,0),(1709,519,23272,5,1,'C80000',1,2,0),(1710,518,23328,0,10,'00FF00',0,2,0),(1714,521,23280,5,0,'00AA00',0,2,0),(1715,521,23281,5,1,'3333FF',0,2,0),(1716,522,23285,0,0,'C80000',0,2,2),(1717,522,23283,0,1,'00C800',0,2,0),(1718,523,23298,0,0,'009900',0,2,0),(1719,523,23294,0,1,'000099',0,2,0),(1720,524,23296,0,0,'009900',0,2,0),(1721,524,23297,0,1,'000099',0,2,0),(1722,524,23295,0,2,'990000',0,2,0),(1723,525,23304,1,0,'FF5555',0,2,0),(1724,525,23303,1,1,'55FF55',0,2,0),(1725,525,23300,1,2,'009999',0,2,0),(1726,525,23302,1,3,'990099',0,2,0),(1727,525,23301,1,4,'999900',0,2,0),(1728,525,23305,1,5,'990000',0,2,0),(1729,525,23306,1,6,'000099',0,2,0),(1730,525,23299,1,7,'009900',0,2,0),(1731,526,23311,0,0,'AA0000',0,2,2),(1732,526,23309,0,1,'00AA00',0,2,0),(1737,528,23628,0,0,'C80000',0,2,0),(1738,528,23625,0,1,'00C800',0,2,0),(1760,520,23276,0,0,'009900',0,2,0),(1761,520,23273,0,1,'DD0000',0,2,0),(1762,520,23275,0,2,'00DDDD',0,2,0),(1763,520,23274,0,3,'3333FF',0,2,0),(1764,520,23620,0,4,'999900',0,2,0),(1765,520,23635,0,5,'00FF00',0,2,0),(1792,534,23316,5,0,'00C800',0,2,0),(1871,553,24682,0,0,'00C800',0,2,0),(1872,553,24683,0,1,'C80000',0,2,0),(1873,553,24684,0,2,'0000C8',0,2,0),(1874,553,24685,0,3,'C800C8',0,2,0),(1875,553,24686,0,4,'00C8C8',0,2,0),(1876,553,24687,0,5,'C8C800',0,2,0),(1877,553,24688,0,6,'C8C8C8',0,2,0),(1878,553,24689,0,7,'009600',0,2,0),(1879,553,24690,0,8,'960000',0,2,0),(1880,554,24691,5,0,'00AA00',0,2,0),(1881,554,24692,5,1,'3333FF',0,2,0),(1882,555,24696,0,0,'C80000',0,2,2),(1883,555,24694,0,1,'00C800',0,2,0),(1884,556,24698,5,0,'00AA00',0,2,0),(1885,556,24699,5,1,'3333FF',0,2,0),(1886,557,24702,0,0,'C80000',0,2,2),(1887,557,24700,0,1,'00C800',0,2,0),(1888,558,24042,1,0,'99FF99',0,2,0),(1889,558,24032,1,1,'99FF99',0,2,0),(1890,558,24044,1,2,'FFFFCC',0,2,0),(1891,558,24034,1,3,'FFFFCC',0,2,0),(1892,558,24045,1,4,'FFCCCC',0,2,0),(1893,558,24035,1,5,'FFCCCC',0,2,0),(1894,558,24043,1,6,'FF99FF',0,2,0),(1895,558,24033,1,7,'FF99FF',0,2,0),(1896,559,24047,1,0,'880000',0,2,0),(1897,559,24037,1,1,'880000',0,2,0),(1898,559,24048,1,2,'99FF99',0,2,0),(1899,559,24038,1,3,'99FF99',0,2,0),(1900,560,24049,1,0,'990000',0,2,0),(1901,560,24039,1,1,'990000',0,2,0),(1902,560,24050,1,2,'99FF99',0,2,0),(1903,560,24040,1,3,'99FF99',0,2,0),(1904,561,24187,1,0,'009900',0,2,0),(1905,562,24204,1,0,'009900',0,2,0),(1906,562,24203,2,1,'EE0000',1,2,0),(1907,563,24202,1,0,'009900',0,2,0),(1908,563,24201,2,1,'EE0000',1,2,0),(1909,564,23855,0,0,'1A7C11',0,2,0),(1910,564,23856,0,1,'F63100',0,2,0),(1911,564,23850,0,2,'2774A4',0,2,0),(1912,564,23851,0,3,'A54F10',0,2,0),(1913,564,23852,0,4,'FC6EA3',0,2,0),(1914,564,23853,0,5,'6C59DC',0,2,0),(1915,564,23854,0,6,'AC8C14',0,2,0),(1916,564,23857,0,7,'611F27',0,2,0),(1917,564,23858,0,9,'5CCD18',0,2,0),(1918,565,24566,1,0,'00A7B3',0,2,0),(1919,566,23859,0,0,'1A7C11',0,2,0),(1920,566,23860,0,1,'F63100',0,2,0),(1921,566,23861,0,2,'2774A4',0,2,0),(1922,566,23862,0,3,'A54F10',0,2,0),(1923,566,23863,0,4,'FC6EA3',0,2,0),(1924,566,23864,0,5,'6C59DC',0,2,0),(1925,566,23865,0,6,'AC8C14',0,2,0),(1926,566,23866,0,7,'611F27',0,2,0),(1927,566,23867,0,8,'F230E0',0,2,0),(1928,566,23868,0,9,'5CCD18',0,2,0),(1929,566,23869,0,10,'BB2A02',0,2,0),(1930,566,23870,0,11,'5A2B57',0,2,0),(1931,566,23871,0,12,'89ABF8',0,2,0),(1932,566,23872,0,13,'7EC25C',0,2,0),(1933,566,23873,0,14,'274482',0,2,0),(1934,567,23999,0,0,'009900',0,2,0),(1935,567,23995,0,1,'000099',0,2,0),(1936,568,23996,0,0,'009900',0,2,0),(1937,568,23997,0,1,'000099',0,2,0),(1938,568,23998,0,2,'990000',0,2,0),(1939,569,24023,0,0,'009900',0,2,0),(1940,569,24024,0,1,'000099',0,2,0),(1941,569,24025,0,2,'990000',0,2,0),(1942,570,24006,1,0,'FF5555',0,2,0),(1943,570,24005,1,1,'55FF55',0,2,0),(1944,570,24002,1,2,'009999',0,2,0),(1945,570,24004,1,3,'990099',0,2,0),(1946,570,24003,1,4,'999900',0,2,0),(1947,570,24007,1,5,'990000',0,2,0),(1948,570,24008,1,6,'000099',0,2,0),(1949,570,24001,1,7,'009900',0,2,0),(1950,571,24343,1,0,'CC0000',0,2,0),(1951,571,24344,1,1,'F46D43',0,2,0),(1952,571,24346,1,2,'FDAE61',0,2,0),(1953,571,24347,1,3,'FEE08B',0,2,0),(1954,571,24341,1,4,'FFFFBF',0,2,0),(1955,571,24348,1,5,'D9EF8B',0,2,0),(1956,571,24349,1,6,'A6D96A',0,2,0),(1957,571,24345,1,7,'66BD63',0,2,0),(1958,571,24342,1,8,'1A9850',0,2,0),(1959,572,24352,1,0,'CC0000',0,2,0),(1960,572,24353,1,1,'F46D43',0,2,0),(1961,572,24355,1,2,'FDAE61',0,2,0),(1962,572,24356,1,3,'FEE08B',0,2,0),(1963,572,24350,1,4,'FFFFBF',0,2,0),(1964,572,24357,1,5,'D9EF8B',0,2,0),(1965,572,24358,1,6,'A6D96A',0,2,0),(1966,572,24354,1,7,'66BD63',0,2,0),(1967,572,24351,1,8,'1A9850',0,2,0),(1968,573,24361,1,0,'CC0000',0,2,0),(1969,573,24362,1,1,'F46D43',0,2,0),(1970,573,24364,1,2,'FDAE61',0,2,0),(1971,573,24365,1,3,'FEE08B',0,2,0),(1972,573,24359,1,4,'FFFFBF',0,2,0),(1973,573,24366,1,5,'D9EF8B',0,2,0),(1974,573,24367,1,6,'A6D96A',0,2,0),(1975,573,24363,1,7,'66BD63',0,2,0),(1976,573,24360,1,8,'1A9850',0,2,0),(1977,574,24370,1,0,'CC0000',0,2,0),(1978,574,24371,1,1,'F46D43',0,2,0),(1979,574,24373,1,2,'FDAE61',0,2,0),(1980,574,24374,1,3,'FEE08B',0,2,0),(1981,574,24368,1,4,'FFFFBF',0,2,0),(1982,574,24375,1,5,'D9EF8B',0,2,0),(1983,574,24376,1,6,'A6D96A',0,2,0),(1984,574,24372,1,7,'66BD63',0,2,0),(1985,574,24369,1,8,'1A9850',0,2,0),(1986,575,24559,1,0,'D73027',0,2,0),(1987,575,24560,1,1,'F46D43',0,2,0),(1988,575,24562,1,2,'FDAE61',0,2,0),(1989,575,24563,1,3,'FEE08B',0,2,0),(1990,575,24557,1,4,'FFFFBF',0,2,0),(1991,575,24564,1,5,'D9EF8B',0,2,0),(1992,575,24565,1,6,'A6D96A',0,2,0),(1993,575,24561,1,7,'66BD63',0,2,0),(1994,575,24558,1,8,'1A9850',0,2,0),(1995,576,24623,1,0,'99FF99',0,2,0),(1996,576,24624,1,1,'009900',0,2,0),(1997,576,24621,2,2,'FF3333',1,2,0),(1998,577,24568,1,0,'8BB300',0,2,0),(1999,578,24053,1,0,'009900',0,2,0),(2000,579,24072,2,0,'009900',0,2,0),(2001,580,24083,2,0,'009900',0,2,0),(2002,581,24061,1,0,'009900',0,2,0),(2003,581,24099,2,1,'CC0000',0,2,0),(2004,582,24074,2,0,'3333FF',0,2,0),(2005,582,24081,2,1,'FF3333',0,2,0),(2006,583,23875,0,0,'1A7C11',0,2,0),(2007,583,23876,0,1,'F63100',0,2,0),(2008,584,24581,0,0,'66C2A5',0,2,0),(2009,584,24609,0,1,'FC8D62',0,2,0),(2010,584,24589,0,2,'8DA0CB',0,2,0),(2011,584,24585,0,3,'E78AC3',0,2,0),(2012,585,24138,1,0,'009900',0,2,0),(2013,586,24139,1,0,'FFFF99',0,2,0),(2014,586,24151,1,1,'FF6666',0,2,0),(2015,587,24119,1,0,'CCFFCC',0,2,0),(2016,587,24111,1,1,'33FF33',0,2,0),(2017,587,24113,1,2,'FF3333',0,2,0),(2018,587,24109,2,3,'880000',0,2,0),(2019,587,24107,2,4,'6666FF',1,2,0),(2020,588,24120,1,0,'CCFFCC',0,2,0),(2021,588,24112,1,1,'33FF33',0,2,0),(2022,588,24114,1,2,'FF3333',0,2,0),(2023,588,24110,2,3,'660000',0,2,0),(2024,588,24107,2,4,'6666FF',1,2,0),(2025,589,24122,1,0,'6666FF',0,2,0),(2026,589,24121,1,1,'FF6666',0,2,0),(2027,589,24107,2,2,'990000',1,2,0),(2028,590,24124,1,0,'FF9999',0,2,0),(2029,590,24175,1,1,'DD0000',0,2,0),(2030,591,24132,1,0,'FF6666',0,2,0),(2031,591,24129,1,1,'9999FF',0,2,0),(2032,592,24103,2,0,'EE0000',0,2,0),(2033,593,24168,1,0,'FF9999',1,2,0),(2034,593,24167,2,1,'009900',0,2,0),(2035,594,24145,0,0,'CCCCCC',0,2,0),(2036,594,24157,1,1,'FF99FF',0,2,0),(2037,594,24146,1,2,'99FF99',0,2,0),(2038,594,24141,1,3,'FF9999',0,2,0),(2039,595,24125,1,0,'FF3333',0,2,0),(2040,595,24131,1,1,'FF9999',0,2,0),(2041,595,24130,1,2,'33FF33',0,2,0),(2042,596,24163,1,0,'FF9999',0,2,0),(2043,596,24164,1,1,'9999FF',0,2,0),(2044,597,24162,1,0,'e7298a',0,2,0),(2045,597,24166,1,1,'7570b3',0,2,0),(2046,597,24161,1,2,'d95f02',0,2,0),(2047,597,24165,1,3,'1b9e77',0,2,0),(2048,598,24149,1,0,'9999FF',0,2,0),(2049,598,24150,1,1,'FF99FF',0,2,0),(2050,598,24148,2,2,'FF3333',1,2,0),(2051,599,24170,1,0,'FF9999',0,2,0),(2052,600,24171,1,0,'FF9999',0,2,0),(2053,601,24174,0,0,'FF9999',0,2,0),(2054,601,24173,0,1,'009900',0,2,0),(2055,601,24169,0,1,'EE0000',0,2,0),(2056,601,24172,0,2,'9999FF',0,2,0),(2057,602,24567,1,0,'B14F9A',0,2,0),(2058,603,24593,1,0,'009999',0,2,0),(2059,603,24613,1,1,'FF33FF',0,2,0),(2060,604,24595,1,0,'009999',0,2,0),(2061,604,24615,1,1,'FF33FF',0,2,0),(2062,605,24030,5,0,'00C800',0,2,0),(2063,606,24014,5,0,'00C800',0,2,0),(2064,607,23895,5,0,'00AA00',0,2,0),(2065,607,23896,5,1,'3333FF',0,2,0),(2066,608,24243,1,0,'FFEDA0',0,2,0),(2067,608,24245,1,1,'FEB24C',0,2,0),(2068,608,24291,1,3,'BB0000',0,2,0),(2069,608,24293,1,5,'009900',0,2,0),(2070,609,24218,1,0,'CCFFCC',0,2,0),(2071,609,24196,2,1,'FFFF66',1,2,0),(2072,609,24197,2,2,'FF6666',1,2,0),(2073,609,24198,2,3,'EE0000',1,2,0),(2074,610,24218,1,0,'99FF99',0,2,0),(2075,610,24290,2,1,'FF3333',1,2,0),(2076,611,24291,1,0,'FF66FF',0,2,0),(2077,611,24293,1,1,'66FFFF',0,2,0),(2078,611,24290,2,2,'FFFF66',0,2,0),(2079,612,23881,0,0,'1A7C11',0,2,0),(2080,612,23882,0,1,'F63100',0,2,0),(2081,613,24205,1,0,'B3CDE3',0,2,0),(2082,613,24206,1,1,'FBB4AE',0,2,0),(2083,614,23897,0,0,'C8C800',0,2,0),(2084,614,23898,0,1,'006400',0,2,0),(2085,614,23899,0,2,'C80000',0,2,0),(2086,614,23900,0,3,'0000EE',0,2,0),(2087,614,23901,0,4,'640000',0,2,0),(2088,614,23902,0,5,'00C800',0,2,0),(2089,614,23903,0,6,'C800C8',0,2,0),(2090,615,24212,1,0,'ff7f00',0,2,0),(2091,615,24211,1,1,'fdbf6f',0,2,0),(2092,615,24214,1,2,'e31a1c',0,2,0),(2093,615,24213,1,3,'fb9a99',0,2,0),(2094,615,24217,1,4,'33a02c',0,2,0),(2095,615,24216,1,5,'b2df8a',0,2,0),(2096,615,24210,1,6,'1f77b4',0,2,0),(2097,615,24209,1,7,'a6cee3',0,2,0),(2098,615,24215,1,8,'cab2d6',0,2,0),(2099,616,24282,1,0,'0000DD',0,2,0),(2100,616,24230,1,1,'CCFFCC',0,2,0),(2101,616,24228,1,2,'FDE0DD',0,2,0),(2102,616,24229,1,3,'FCC5C0',0,2,0),(2103,616,24232,1,4,'FA9FB5',0,2,0),(2104,616,24231,1,5,'F768A1',0,2,0),(2105,616,24233,1,6,'DD3497',0,2,0),(2106,616,24234,1,7,'AE017E',0,2,0),(2107,617,24227,1,0,'ECE7F2',0,2,0),(2108,617,24236,1,1,'A6BDDB',0,2,0),(2109,617,24235,1,2,'2B8CBE',0,2,0),(2110,618,24277,1,0,'FF9999',0,2,0),(2111,619,24280,1,0,'FEE0D2',0,2,0),(2112,619,24283,1,1,'FC9272',0,2,0),(2113,619,24281,1,2,'DE2D26',0,2,0),(2114,620,24286,1,0,'91BFDB',0,2,0),(2115,620,24254,1,1,'FFFFBF',0,2,0),(2116,620,24250,2,2,'BB0000',1,2,0),(2117,621,24288,1,0,'FF9999',0,2,0),(2118,621,24287,1,1,'99FF99',0,2,0),(2119,622,24285,1,0,'91BFDB',0,2,0),(2120,622,24289,1,1,'91BFDB',0,2,0),(2121,622,24253,1,2,'FFFFBF',0,2,0),(2122,622,24249,2,3,'BB0000',1,2,0),(2123,623,24220,1,0,'FF9999',0,2,0),(2124,623,24248,1,1,'3333FF',0,2,0),(2125,624,24219,1,0,'FF6666',0,2,0),(2126,624,24221,1,1,'99FF99',0,2,0),(2127,625,24631,1,1,'B3925D',0,2,0),(2128,625,24630,1,3,'66FF66',0,2,0),(2129,626,24633,2,0,'8DA0CB',1,2,0),(2130,626,24635,2,1,'FC8D62',1,2,0),(2131,626,24637,1,2,'B3925D',0,2,0),(2132,626,24632,2,3,'E78AC3',1,2,0),(2133,626,24634,2,4,'66C2A5',1,2,0),(2134,626,24636,1,5,'66FF66',0,2,0),(2135,627,24639,1,1,'B3925D',0,2,0),(2136,627,24638,1,3,'66FF66',0,2,0),(2137,628,24641,2,0,'8DA0CB',1,2,0),(2138,628,24643,2,1,'FC8D62',1,2,0),(2139,628,24645,1,2,'B3925D',0,2,0),(2140,628,24640,2,3,'E78AC3',1,2,0),(2141,628,24642,2,4,'66C2A5',1,2,0),(2142,628,24644,1,5,'66FF66',0,2,0),(2143,629,24647,1,4,'B3925D',0,2,0),(2144,629,24646,1,5,'66FF66',0,2,0),(2145,630,24649,2,0,'8DA0CB',1,2,0),(2146,630,24651,2,1,'FC8D62',1,2,0),(2147,630,24653,1,2,'B3925D',0,2,0),(2148,630,24648,2,3,'E78AC3',1,2,0),(2149,630,24650,2,4,'66C2A5',1,2,0),(2150,630,24652,1,5,'66FF66',0,2,0),(2151,631,23884,0,0,'1A7C11',0,2,0),(2152,632,24660,1,0,'D7191C',0,2,0),(2153,632,24656,1,1,'FDAE61',0,2,0),(2154,632,24657,1,2,'A6D96A',0,2,0),(2155,632,24658,1,3,'1A9641',0,2,0),(2156,633,24569,1,0,'E20800',0,2,0),(2157,633,24570,1,1,'00BF00',0,2,0),(2158,634,24328,2,0,'3333FF',0,2,0),(2159,634,24327,1,1,'FF9999',0,2,0),(2160,634,24325,2,2,'EE0000',0,2,0),(2161,634,24326,1,3,'99FF99',0,2,0),(2162,634,24324,2,4,'00EE00',0,2,0),(2163,635,24311,1,0,'009900',0,2,0),(2164,635,24303,1,1,'FF6666',0,2,0),(2165,635,24310,1,2,'BB0000',0,2,0),(2166,635,24304,1,3,'99FF99',0,2,0),(2167,636,24305,1,0,'FF6666',0,2,0),(2168,636,24320,1,1,'DD0000',0,2,0),(2169,636,24302,1,2,'FFFF66',0,2,0),(2170,636,24308,1,3,'DDDD00',0,2,0),(2171,636,24306,1,4,'99FF99',0,2,0),(2172,636,24322,1,5,'009900',0,2,0),(2173,637,24264,1,0,'FF3333',0,2,0),(2174,637,24257,1,1,'009900',0,2,0),(2175,638,24262,1,0,'2C7FB8',0,2,0),(2176,638,24259,1,1,'7FCDBB',0,2,0),(2177,638,24260,1,2,'EDF8B1',0,2,0),(2178,639,24261,1,0,'CC0000',0,2,0),(2179,640,24268,1,0,'CCFFCC',0,2,0),(2180,640,24258,1,1,'009900',0,2,0),(2181,641,24263,1,0,'009900',0,2,0),(2182,642,23885,0,0,'1A7C11',0,2,0),(2183,643,24671,0,0,'009900',0,2,0),(2184,644,24668,2,0,'009900',0,2,0),(2185,644,24664,2,0,'BB00BB',0,2,0),(2186,644,24670,2,1,'BB0000',0,2,0),(2187,645,24672,2,0,'DD0000',0,2,0),(2188,645,24674,2,1,'0000DD',0,2,0),(2189,646,24662,1,0,'A6D96A',0,2,0),(2190,646,24663,1,1,'D7191C',0,2,0),(2191,647,23982,0,0,'C80000',0,2,0),(2192,647,23981,0,1,'00C800',0,2,0),(2193,648,23954,0,0,'DD0000',0,2,0),(2194,648,23956,0,1,'00DDDD',0,2,0),(2195,648,23955,0,2,'3333FF',0,2,0),(2196,649,23987,0,0,'009900',0,2,0),(2197,649,23979,0,1,'DD0000',0,2,0),(2198,649,23986,0,2,'00DDDD',0,2,0),(2199,649,23985,0,3,'3333FF',0,2,0),(2200,649,23980,0,4,'999900',0,2,0),(2201,649,23984,0,5,'00FF00',0,2,0),(2202,650,23950,0,0,'990099',0,2,0),(2203,650,23947,0,1,'990000',0,2,0),(2204,650,23945,0,2,'0000EE',0,2,0),(2205,650,23939,0,3,'FF33FF',0,2,0),(2206,650,23944,0,4,'00EE00',0,2,0),(2207,650,23943,0,5,'003300',0,2,0),(2208,650,23951,0,6,'33FFFF',0,2,0),(2209,650,23946,0,7,'DD0000',0,2,0),(2210,650,23949,0,8,'000099',0,7,0),(2211,651,23974,0,0,'990099',0,2,0),(2212,651,23969,0,1,'990000',0,2,0),(2213,651,23967,0,2,'0000EE',0,2,0),(2214,651,23961,0,3,'FF33FF',0,2,0),(2215,651,23966,0,4,'009600',0,2,0),(2216,651,23965,0,5,'003300',0,2,0),(2217,651,23970,0,6,'CCCC00',0,2,0),(2218,651,23975,0,7,'33FFFF',0,2,0),(2219,651,23968,0,8,'DD0000',0,2,0),(2220,651,23972,0,9,'000099',0,2,0),(2221,651,23976,0,10,'00FF00',0,2,0),(2222,652,23942,0,0,'FFAA00',0,2,0),(2223,652,23937,0,1,'990099',0,2,0),(2224,652,23941,0,2,'EE0000',0,2,0),(2225,652,23948,0,3,'FF66FF',0,2,0),(2226,652,23940,0,4,'960000',0,2,0),(2227,652,23938,0,5,'009600',0,2,0),(2228,653,23973,0,0,'00EE00',0,2,0),(2229,653,23962,0,1,'0000EE',0,2,0),(2230,653,23964,0,2,'FFAA00',0,2,0),(2231,653,23958,0,3,'00EEEE',0,2,0),(2232,653,23959,0,4,'990099',0,2,0),(2233,653,23960,0,5,'666600',0,2,0),(2234,653,23963,0,6,'EE0000',0,2,0),(2235,653,23971,0,7,'FF66FF',0,2,0),(2236,654,23957,5,0,'00C800',0,2,0),(2237,654,23953,5,1,'C80000',1,2,0),(2238,655,23988,5,0,'00C800',0,2,0),(2239,655,23978,5,1,'C80000',1,2,0);
/*!40000 ALTER TABLE `graphs_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_discovery`
--

DROP TABLE IF EXISTS `group_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_discovery` (
  `groupid` bigint(20) unsigned NOT NULL,
  `parent_group_prototypeid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `c_group_discovery_2` (`parent_group_prototypeid`),
  CONSTRAINT `c_group_discovery_2` FOREIGN KEY (`parent_group_prototypeid`) REFERENCES `group_prototype` (`group_prototypeid`),
  CONSTRAINT `c_group_discovery_1` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_discovery`
--

LOCK TABLES `group_discovery` WRITE;
/*!40000 ALTER TABLE `group_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_prototype`
--

DROP TABLE IF EXISTS `group_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_prototype` (
  `group_prototypeid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `groupid` bigint(20) unsigned DEFAULT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`group_prototypeid`),
  KEY `group_prototype_1` (`hostid`),
  KEY `c_group_prototype_2` (`groupid`),
  KEY `c_group_prototype_3` (`templateid`),
  CONSTRAINT `c_group_prototype_3` FOREIGN KEY (`templateid`) REFERENCES `group_prototype` (`group_prototypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_group_prototype_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_group_prototype_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_prototype`
--

LOCK TABLES `group_prototype` WRITE;
/*!40000 ALTER TABLE `group_prototype` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `groupid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `internal` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `groups_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Templates',0,0),(2,'Linux servers',0,0),(4,'Zabbix servers',0,0),(5,'Discovered hosts',1,0),(6,'Virtual machines',0,0),(7,'Hypervisors',0,0),(8,'Ceph',0,0),(9,'Openstack',0,0),(10,'Compute node',0,0),(11,'Controller node',0,0),(12,'IO_State',0,0);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` double(16,4) NOT NULL DEFAULT '0.0000',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_log`
--

DROP TABLE IF EXISTS `history_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_log` (
  `id` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `source` varchar(64) NOT NULL DEFAULT '',
  `severity` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `logeventid` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `history_log_2` (`itemid`,`id`),
  KEY `history_log_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_log`
--

LOCK TABLES `history_log` WRITE;
/*!40000 ALTER TABLE `history_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_str`
--

DROP TABLE IF EXISTS `history_str`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_str` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_str_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_str`
--

LOCK TABLES `history_str` WRITE;
/*!40000 ALTER TABLE `history_str` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_str` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_text`
--

DROP TABLE IF EXISTS `history_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_text` (
  `id` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `ns` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `history_text_2` (`itemid`,`id`),
  KEY `history_text_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_text`
--

LOCK TABLES `history_text` WRITE;
/*!40000 ALTER TABLE `history_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_uint`
--

DROP TABLE IF EXISTS `history_uint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_uint` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_uint_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_uint`
--

LOCK TABLES `history_uint` WRITE;
/*!40000 ALTER TABLE `history_uint` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_uint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_discovery`
--

DROP TABLE IF EXISTS `host_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_discovery` (
  `hostid` bigint(20) unsigned NOT NULL,
  `parent_hostid` bigint(20) unsigned DEFAULT NULL,
  `parent_itemid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(64) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hostid`),
  KEY `c_host_discovery_2` (`parent_hostid`),
  KEY `c_host_discovery_3` (`parent_itemid`),
  CONSTRAINT `c_host_discovery_3` FOREIGN KEY (`parent_itemid`) REFERENCES `items` (`itemid`),
  CONSTRAINT `c_host_discovery_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_host_discovery_2` FOREIGN KEY (`parent_hostid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_discovery`
--

LOCK TABLES `host_discovery` WRITE;
/*!40000 ALTER TABLE `host_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `host_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_inventory`
--

DROP TABLE IF EXISTS `host_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_inventory` (
  `hostid` bigint(20) unsigned NOT NULL,
  `inventory_mode` int(11) NOT NULL DEFAULT '0',
  `type` varchar(64) NOT NULL DEFAULT '',
  `type_full` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `alias` varchar(64) NOT NULL DEFAULT '',
  `os` varchar(64) NOT NULL DEFAULT '',
  `os_full` varchar(255) NOT NULL DEFAULT '',
  `os_short` varchar(64) NOT NULL DEFAULT '',
  `serialno_a` varchar(64) NOT NULL DEFAULT '',
  `serialno_b` varchar(64) NOT NULL DEFAULT '',
  `tag` varchar(64) NOT NULL DEFAULT '',
  `asset_tag` varchar(64) NOT NULL DEFAULT '',
  `macaddress_a` varchar(64) NOT NULL DEFAULT '',
  `macaddress_b` varchar(64) NOT NULL DEFAULT '',
  `hardware` varchar(255) NOT NULL DEFAULT '',
  `hardware_full` text NOT NULL,
  `software` varchar(255) NOT NULL DEFAULT '',
  `software_full` text NOT NULL,
  `software_app_a` varchar(64) NOT NULL DEFAULT '',
  `software_app_b` varchar(64) NOT NULL DEFAULT '',
  `software_app_c` varchar(64) NOT NULL DEFAULT '',
  `software_app_d` varchar(64) NOT NULL DEFAULT '',
  `software_app_e` varchar(64) NOT NULL DEFAULT '',
  `contact` text NOT NULL,
  `location` text NOT NULL,
  `location_lat` varchar(16) NOT NULL DEFAULT '',
  `location_lon` varchar(16) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  `chassis` varchar(64) NOT NULL DEFAULT '',
  `model` varchar(64) NOT NULL DEFAULT '',
  `hw_arch` varchar(32) NOT NULL DEFAULT '',
  `vendor` varchar(64) NOT NULL DEFAULT '',
  `contract_number` varchar(64) NOT NULL DEFAULT '',
  `installer_name` varchar(64) NOT NULL DEFAULT '',
  `deployment_status` varchar(64) NOT NULL DEFAULT '',
  `url_a` varchar(255) NOT NULL DEFAULT '',
  `url_b` varchar(255) NOT NULL DEFAULT '',
  `url_c` varchar(255) NOT NULL DEFAULT '',
  `host_networks` text NOT NULL,
  `host_netmask` varchar(39) NOT NULL DEFAULT '',
  `host_router` varchar(39) NOT NULL DEFAULT '',
  `oob_ip` varchar(39) NOT NULL DEFAULT '',
  `oob_netmask` varchar(39) NOT NULL DEFAULT '',
  `oob_router` varchar(39) NOT NULL DEFAULT '',
  `date_hw_purchase` varchar(64) NOT NULL DEFAULT '',
  `date_hw_install` varchar(64) NOT NULL DEFAULT '',
  `date_hw_expiry` varchar(64) NOT NULL DEFAULT '',
  `date_hw_decomm` varchar(64) NOT NULL DEFAULT '',
  `site_address_a` varchar(128) NOT NULL DEFAULT '',
  `site_address_b` varchar(128) NOT NULL DEFAULT '',
  `site_address_c` varchar(128) NOT NULL DEFAULT '',
  `site_city` varchar(128) NOT NULL DEFAULT '',
  `site_state` varchar(64) NOT NULL DEFAULT '',
  `site_country` varchar(64) NOT NULL DEFAULT '',
  `site_zip` varchar(64) NOT NULL DEFAULT '',
  `site_rack` varchar(128) NOT NULL DEFAULT '',
  `site_notes` text NOT NULL,
  `poc_1_name` varchar(128) NOT NULL DEFAULT '',
  `poc_1_email` varchar(128) NOT NULL DEFAULT '',
  `poc_1_phone_a` varchar(64) NOT NULL DEFAULT '',
  `poc_1_phone_b` varchar(64) NOT NULL DEFAULT '',
  `poc_1_cell` varchar(64) NOT NULL DEFAULT '',
  `poc_1_screen` varchar(64) NOT NULL DEFAULT '',
  `poc_1_notes` text NOT NULL,
  `poc_2_name` varchar(128) NOT NULL DEFAULT '',
  `poc_2_email` varchar(128) NOT NULL DEFAULT '',
  `poc_2_phone_a` varchar(64) NOT NULL DEFAULT '',
  `poc_2_phone_b` varchar(64) NOT NULL DEFAULT '',
  `poc_2_cell` varchar(64) NOT NULL DEFAULT '',
  `poc_2_screen` varchar(64) NOT NULL DEFAULT '',
  `poc_2_notes` text NOT NULL,
  PRIMARY KEY (`hostid`),
  CONSTRAINT `c_host_inventory_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_inventory`
--

LOCK TABLES `host_inventory` WRITE;
/*!40000 ALTER TABLE `host_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `host_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostmacro`
--

DROP TABLE IF EXISTS `hostmacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostmacro` (
  `hostmacroid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `macro` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`hostmacroid`),
  UNIQUE KEY `hostmacro_1` (`hostid`,`macro`),
  CONSTRAINT `c_hostmacro_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostmacro`
--

LOCK TABLES `hostmacro` WRITE;
/*!40000 ALTER TABLE `hostmacro` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostmacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts` (
  `hostid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(128) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `disable_until` int(11) NOT NULL DEFAULT '0',
  `error` varchar(2048) NOT NULL DEFAULT '',
  `available` int(11) NOT NULL DEFAULT '0',
  `errors_from` int(11) NOT NULL DEFAULT '0',
  `lastaccess` int(11) NOT NULL DEFAULT '0',
  `ipmi_authtype` int(11) NOT NULL DEFAULT '0',
  `ipmi_privilege` int(11) NOT NULL DEFAULT '2',
  `ipmi_username` varchar(16) NOT NULL DEFAULT '',
  `ipmi_password` varchar(20) NOT NULL DEFAULT '',
  `ipmi_disable_until` int(11) NOT NULL DEFAULT '0',
  `ipmi_available` int(11) NOT NULL DEFAULT '0',
  `snmp_disable_until` int(11) NOT NULL DEFAULT '0',
  `snmp_available` int(11) NOT NULL DEFAULT '0',
  `maintenanceid` bigint(20) unsigned DEFAULT NULL,
  `maintenance_status` int(11) NOT NULL DEFAULT '0',
  `maintenance_type` int(11) NOT NULL DEFAULT '0',
  `maintenance_from` int(11) NOT NULL DEFAULT '0',
  `ipmi_errors_from` int(11) NOT NULL DEFAULT '0',
  `snmp_errors_from` int(11) NOT NULL DEFAULT '0',
  `ipmi_error` varchar(2048) NOT NULL DEFAULT '',
  `snmp_error` varchar(2048) NOT NULL DEFAULT '',
  `jmx_disable_until` int(11) NOT NULL DEFAULT '0',
  `jmx_available` int(11) NOT NULL DEFAULT '0',
  `jmx_errors_from` int(11) NOT NULL DEFAULT '0',
  `jmx_error` varchar(2048) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT '0',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `description` text NOT NULL,
  `tls_connect` int(11) NOT NULL DEFAULT '1',
  `tls_accept` int(11) NOT NULL DEFAULT '1',
  `tls_issuer` varchar(1024) NOT NULL DEFAULT '',
  `tls_subject` varchar(1024) NOT NULL DEFAULT '',
  `tls_psk_identity` varchar(128) NOT NULL DEFAULT '',
  `tls_psk` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`hostid`),
  KEY `hosts_1` (`host`),
  KEY `hosts_2` (`status`),
  KEY `hosts_3` (`proxy_hostid`),
  KEY `hosts_4` (`name`),
  KEY `hosts_5` (`maintenanceid`),
  KEY `c_hosts_3` (`templateid`),
  CONSTRAINT `c_hosts_3` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_hosts_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`),
  CONSTRAINT `c_hosts_2` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts`
--

LOCK TABLES `hosts` WRITE;
/*!40000 ALTER TABLE `hosts` DISABLE KEYS */;
INSERT INTO `hosts` VALUES (10084,NULL,'Zabbix server',1,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Zabbix server',0,NULL,'',1,1,'','','',''),(10107,NULL,'compute node',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','compute node',0,NULL,'',1,1,'','','',''),(10108,NULL,'controller node',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','controller node',0,NULL,'',1,1,'','','',''),(10109,NULL,'dashboard',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','dashboard',0,NULL,'',1,1,'','','',''),(10110,NULL,'haproxy',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','haproxy',0,NULL,'',1,1,'','','',''),(10111,NULL,'lbaas',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','lbaas',0,NULL,'',1,1,'','','',''),(10112,NULL,'memcache',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','memcache',0,NULL,'',1,1,'','','',''),(10113,NULL,'mysql',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','mysql',0,NULL,'',1,1,'','','',''),(10114,NULL,'novnc',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','novnc',0,NULL,'',1,1,'','','',''),(10115,NULL,'ntp',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','ntp',0,NULL,'',1,1,'','','',''),(10116,NULL,'rabbitmq',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','rabbitmq',0,NULL,'',1,1,'','','',''),(10117,NULL,'Template App Ceph ProcessNum',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Ceph ProcessNum',0,NULL,'',1,1,'','','',''),(10118,NULL,'Template App Ceph State',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Ceph State',0,NULL,'',1,1,'','','',''),(10119,NULL,'Template App IO State',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App IO State',0,NULL,'',1,1,'','','',''),(10120,NULL,'Template App MySQL',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App MySQL',0,NULL,'',1,1,'','','',''),(10121,NULL,'Template App Openstack Compute ServiceExist',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Openstack Compute ServiceExist',0,NULL,'',1,1,'','','',''),(10122,NULL,'Template App Openstack Controller ServiceExist',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Openstack Controller ServiceExist',0,NULL,'',1,1,'','','',''),(10123,NULL,'Template App SSH Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App SSH Service',0,NULL,'',1,1,'','','',''),(10124,NULL,'Template App Zabbix Agent',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Agent',0,NULL,'',1,1,'','','',''),(10125,NULL,'Template App Zabbix Proxy',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Proxy',0,NULL,'',1,1,'','','',''),(10126,NULL,'Template App Zabbix Server',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Server',0,NULL,'',1,1,'','','',''),(10127,NULL,'Template OS Linux - physical',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Linux - physical',0,NULL,'',1,1,'','','',''),(10128,NULL,'Template OS Windows',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Windows',0,NULL,'',1,1,'','','',''),(10129,NULL,'Template_FromDual.MySQL.aria',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template_FromDual.MySQL.aria',0,NULL,'',1,1,'','','',''),(10130,NULL,'Template_FromDual.MySQL.fpmmm',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template_FromDual.MySQL.fpmmm',0,NULL,'',1,1,'','','',''),(10131,NULL,'Template_FromDual.MySQL.galera',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template_FromDual.MySQL.galera',0,NULL,'',1,1,'','','',''),(10132,NULL,'Template_FromDual.MySQL.innodb',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template_FromDual.MySQL.innodb',0,NULL,'',1,1,'','','',''),(10133,NULL,'Template_FromDual.MySQL.master',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template_FromDual.MySQL.master',0,NULL,'',1,1,'','','',''),(10134,NULL,'Template_FromDual.MySQL.mysql',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template_FromDual.MySQL.mysql',0,NULL,'',1,1,'','','',''),(10135,NULL,'Template_FromDual.MySQL.process',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template_FromDual.MySQL.process',0,NULL,'',1,1,'','','',''),(10136,NULL,'Template_FromDual.MySQL.security',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template_FromDual.MySQL.security',0,NULL,'',1,1,'','','',''),(10137,NULL,'Template_FromDual.MySQL.server',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template_FromDual.MySQL.server',0,NULL,'',1,1,'','','',''),(10138,NULL,'Template_FromDual.MySQL.slave',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template_FromDual.MySQL.slave',0,NULL,'',1,1,'','','','');
/*!40000 ALTER TABLE `hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_groups`
--

DROP TABLE IF EXISTS `hosts_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_groups` (
  `hostgroupid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`hostgroupid`),
  UNIQUE KEY `hosts_groups_1` (`hostid`,`groupid`),
  KEY `hosts_groups_2` (`groupid`),
  CONSTRAINT `c_hosts_groups_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_hosts_groups_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_groups`
--

LOCK TABLES `hosts_groups` WRITE;
/*!40000 ALTER TABLE `hosts_groups` DISABLE KEYS */;
INSERT INTO `hosts_groups` VALUES (92,10084,4),(129,10107,1),(128,10107,11),(131,10108,1),(130,10108,11),(133,10109,1),(132,10109,10),(134,10110,11),(136,10111,1),(135,10111,11),(138,10112,1),(137,10112,11),(140,10113,1),(139,10113,10),(142,10114,1),(141,10114,11),(144,10115,1),(143,10115,10),(146,10116,1),(145,10116,11),(148,10117,1),(147,10117,8),(150,10118,1),(149,10118,8),(152,10119,1),(151,10119,12),(153,10120,1),(156,10121,1),(155,10121,9),(154,10121,10),(158,10122,1),(157,10122,11),(159,10123,1),(160,10124,1),(161,10125,1),(162,10126,1),(163,10127,1),(164,10128,1),(165,10129,1),(166,10130,1),(167,10131,1),(168,10132,1),(169,10133,1),(170,10134,1),(171,10135,1),(172,10136,1),(173,10137,1),(174,10138,1);
/*!40000 ALTER TABLE `hosts_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_templates`
--

DROP TABLE IF EXISTS `hosts_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_templates` (
  `hosttemplateid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`hosttemplateid`),
  UNIQUE KEY `hosts_templates_1` (`hostid`,`templateid`),
  KEY `hosts_templates_2` (`templateid`),
  CONSTRAINT `c_hosts_templates_2` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_hosts_templates_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_templates`
--

LOCK TABLES `hosts_templates` WRITE;
/*!40000 ALTER TABLE `hosts_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `hosts_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housekeeper`
--

DROP TABLE IF EXISTS `housekeeper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housekeeper` (
  `housekeeperid` bigint(20) unsigned NOT NULL,
  `tablename` varchar(64) NOT NULL DEFAULT '',
  `field` varchar(64) NOT NULL DEFAULT '',
  `value` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`housekeeperid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housekeeper`
--

LOCK TABLES `housekeeper` WRITE;
/*!40000 ALTER TABLE `housekeeper` DISABLE KEYS */;
/*!40000 ALTER TABLE `housekeeper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstep`
--

DROP TABLE IF EXISTS `httpstep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstep` (
  `httpstepid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `no` int(11) NOT NULL DEFAULT '0',
  `url` varchar(2048) NOT NULL DEFAULT '',
  `timeout` int(11) NOT NULL DEFAULT '15',
  `posts` text NOT NULL,
  `required` varchar(255) NOT NULL DEFAULT '',
  `status_codes` varchar(255) NOT NULL DEFAULT '',
  `variables` text NOT NULL,
  `follow_redirects` int(11) NOT NULL DEFAULT '1',
  `retrieve_mode` int(11) NOT NULL DEFAULT '0',
  `headers` text NOT NULL,
  PRIMARY KEY (`httpstepid`),
  KEY `httpstep_1` (`httptestid`),
  CONSTRAINT `c_httpstep_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstep`
--

LOCK TABLES `httpstep` WRITE;
/*!40000 ALTER TABLE `httpstep` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstepitem`
--

DROP TABLE IF EXISTS `httpstepitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstepitem` (
  `httpstepitemid` bigint(20) unsigned NOT NULL,
  `httpstepid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httpstepitemid`),
  UNIQUE KEY `httpstepitem_1` (`httpstepid`,`itemid`),
  KEY `httpstepitem_2` (`itemid`),
  CONSTRAINT `c_httpstepitem_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_httpstepitem_1` FOREIGN KEY (`httpstepid`) REFERENCES `httpstep` (`httpstepid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstepitem`
--

LOCK TABLES `httpstepitem` WRITE;
/*!40000 ALTER TABLE `httpstepitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstepitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptest`
--

DROP TABLE IF EXISTS `httptest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptest` (
  `httptestid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `applicationid` bigint(20) unsigned DEFAULT NULL,
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `delay` int(11) NOT NULL DEFAULT '60',
  `status` int(11) NOT NULL DEFAULT '0',
  `variables` text NOT NULL,
  `agent` varchar(255) NOT NULL DEFAULT 'Zabbix',
  `authentication` int(11) NOT NULL DEFAULT '0',
  `http_user` varchar(64) NOT NULL DEFAULT '',
  `http_password` varchar(64) NOT NULL DEFAULT '',
  `hostid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `http_proxy` varchar(255) NOT NULL DEFAULT '',
  `retries` int(11) NOT NULL DEFAULT '1',
  `ssl_cert_file` varchar(255) NOT NULL DEFAULT '',
  `ssl_key_file` varchar(255) NOT NULL DEFAULT '',
  `ssl_key_password` varchar(64) NOT NULL DEFAULT '',
  `verify_peer` int(11) NOT NULL DEFAULT '0',
  `verify_host` int(11) NOT NULL DEFAULT '0',
  `headers` text NOT NULL,
  PRIMARY KEY (`httptestid`),
  UNIQUE KEY `httptest_2` (`hostid`,`name`),
  KEY `httptest_1` (`applicationid`),
  KEY `httptest_3` (`status`),
  KEY `httptest_4` (`templateid`),
  CONSTRAINT `c_httptest_3` FOREIGN KEY (`templateid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE,
  CONSTRAINT `c_httptest_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`),
  CONSTRAINT `c_httptest_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptest`
--

LOCK TABLES `httptest` WRITE;
/*!40000 ALTER TABLE `httptest` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptestitem`
--

DROP TABLE IF EXISTS `httptestitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptestitem` (
  `httptestitemid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httptestitemid`),
  UNIQUE KEY `httptestitem_1` (`httptestid`,`itemid`),
  KEY `httptestitem_2` (`itemid`),
  CONSTRAINT `c_httptestitem_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_httptestitem_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptestitem`
--

LOCK TABLES `httptestitem` WRITE;
/*!40000 ALTER TABLE `httptestitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptestitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icon_map`
--

DROP TABLE IF EXISTS `icon_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon_map` (
  `iconmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `default_iconid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`iconmapid`),
  UNIQUE KEY `icon_map_1` (`name`),
  KEY `icon_map_2` (`default_iconid`),
  CONSTRAINT `c_icon_map_1` FOREIGN KEY (`default_iconid`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icon_map`
--

LOCK TABLES `icon_map` WRITE;
/*!40000 ALTER TABLE `icon_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `icon_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icon_mapping`
--

DROP TABLE IF EXISTS `icon_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon_mapping` (
  `iconmappingid` bigint(20) unsigned NOT NULL,
  `iconmapid` bigint(20) unsigned NOT NULL,
  `iconid` bigint(20) unsigned NOT NULL,
  `inventory_link` int(11) NOT NULL DEFAULT '0',
  `expression` varchar(64) NOT NULL DEFAULT '',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iconmappingid`),
  KEY `icon_mapping_1` (`iconmapid`),
  KEY `icon_mapping_2` (`iconid`),
  CONSTRAINT `c_icon_mapping_2` FOREIGN KEY (`iconid`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_icon_mapping_1` FOREIGN KEY (`iconmapid`) REFERENCES `icon_map` (`iconmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icon_mapping`
--

LOCK TABLES `icon_mapping` WRITE;
/*!40000 ALTER TABLE `icon_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `icon_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ids`
--

DROP TABLE IF EXISTS `ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ids` (
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `field_name` varchar(64) NOT NULL DEFAULT '',
  `nextid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`table_name`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ids`
--

LOCK TABLES `ids` WRITE;
/*!40000 ALTER TABLE `ids` DISABLE KEYS */;
INSERT INTO `ids` VALUES ('actions','actionid',11),('applications','applicationid',458),('application_template','application_templateid',1),('auditlog','auditid',820),('conditions','conditionid',16),('functions','functionid',13506),('graphs','graphid',655),('graphs_items','gitemid',2239),('groups','groupid',12),('hosts','hostid',10138),('hosts_groups','hostgroupid',174),('hosts_templates','hosttemplateid',1),('housekeeper','housekeeperid',4648),('items','itemid',24703),('items_applications','itemappid',7001),('item_condition','item_conditionid',26),('item_discovery','itemdiscoveryid',217),('media','mediaid',9),('media_type','mediatypeid',4),('opcommand_grp','opcommand_grpid',1),('opconditions','opconditionid',1),('operations','operationid',25),('opgroup','opgroupid',4),('opmessage_grp','opmessage_grpid',7),('opmessage_usr','opmessage_usrid',2),('optemplate','optemplateid',13),('profiles','profileid',53),('screens','screenid',25),('screens_items','screenitemid',81),('triggers','triggerid',13887);
/*!40000 ALTER TABLE `ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `imageid` bigint(20) unsigned NOT NULL,
  `imagetype` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '0',
  `image` longblob NOT NULL,
  PRIMARY KEY (`imageid`),
  UNIQUE KEY `images_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface`
--

DROP TABLE IF EXISTS `interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface` (
  `interfaceid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `main` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `useip` int(11) NOT NULL DEFAULT '1',
  `ip` varchar(64) NOT NULL DEFAULT '127.0.0.1',
  `dns` varchar(64) NOT NULL DEFAULT '',
  `port` varchar(64) NOT NULL DEFAULT '10050',
  `bulk` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`interfaceid`),
  KEY `interface_1` (`hostid`,`type`),
  KEY `interface_2` (`ip`,`dns`),
  CONSTRAINT `c_interface_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface`
--

LOCK TABLES `interface` WRITE;
/*!40000 ALTER TABLE `interface` DISABLE KEYS */;
INSERT INTO `interface` VALUES (1,10084,1,1,1,'127.0.0.1','','10050',1);
/*!40000 ALTER TABLE `interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface_discovery`
--

DROP TABLE IF EXISTS `interface_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface_discovery` (
  `interfaceid` bigint(20) unsigned NOT NULL,
  `parent_interfaceid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`interfaceid`),
  KEY `c_interface_discovery_2` (`parent_interfaceid`),
  CONSTRAINT `c_interface_discovery_2` FOREIGN KEY (`parent_interfaceid`) REFERENCES `interface` (`interfaceid`) ON DELETE CASCADE,
  CONSTRAINT `c_interface_discovery_1` FOREIGN KEY (`interfaceid`) REFERENCES `interface` (`interfaceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface_discovery`
--

LOCK TABLES `interface_discovery` WRITE;
/*!40000 ALTER TABLE `interface_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `interface_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_application_prototype`
--

DROP TABLE IF EXISTS `item_application_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_application_prototype` (
  `item_application_prototypeid` bigint(20) unsigned NOT NULL,
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`item_application_prototypeid`),
  UNIQUE KEY `item_application_prototype_1` (`application_prototypeid`,`itemid`),
  KEY `item_application_prototype_2` (`itemid`),
  CONSTRAINT `c_item_application_prototype_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_item_application_prototype_1` FOREIGN KEY (`application_prototypeid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_application_prototype`
--

LOCK TABLES `item_application_prototype` WRITE;
/*!40000 ALTER TABLE `item_application_prototype` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_application_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_condition`
--

DROP TABLE IF EXISTS `item_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_condition` (
  `item_conditionid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `operator` int(11) NOT NULL DEFAULT '8',
  `macro` varchar(64) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_conditionid`),
  KEY `item_condition_1` (`itemid`),
  CONSTRAINT `c_item_condition_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_condition`
--

LOCK TABLES `item_condition` WRITE;
/*!40000 ALTER TABLE `item_condition` DISABLE KEYS */;
INSERT INTO `item_condition` VALUES (19,23278,8,'{#IFNAME}','@Network interfaces for discovery'),(20,23279,8,'{#FSTYPE}','@File systems for discovery'),(23,24678,8,'{#IFNAME}','@Network interfaces for discovery'),(24,24679,8,'{#FSTYPE}','@File systems for discovery'),(25,24680,8,'{#IFNAME}','@Network interfaces for discovery'),(26,24681,8,'{#FSTYPE}','@File systems for discovery');
/*!40000 ALTER TABLE `item_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_discovery`
--

DROP TABLE IF EXISTS `item_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_discovery` (
  `itemdiscoveryid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `parent_itemid` bigint(20) unsigned NOT NULL,
  `key_` varchar(255) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemdiscoveryid`),
  UNIQUE KEY `item_discovery_1` (`itemid`,`parent_itemid`),
  KEY `item_discovery_2` (`parent_itemid`),
  CONSTRAINT `c_item_discovery_2` FOREIGN KEY (`parent_itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_item_discovery_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_discovery`
--

LOCK TABLES `item_discovery` WRITE;
/*!40000 ALTER TABLE `item_discovery` DISABLE KEYS */;
INSERT INTO `item_discovery` VALUES (182,23280,23278,'',0,0),(183,23281,23278,'',0,0),(184,23282,23279,'',0,0),(185,23283,23279,'',0,0),(186,23284,23279,'',0,0),(187,23285,23279,'',0,0),(188,23286,23279,'',0,0),(196,24682,24677,'',0,0),(197,24683,24677,'',0,0),(198,24684,24677,'',0,0),(199,24685,24677,'',0,0),(200,24686,24677,'',0,0),(201,24687,24677,'',0,0),(202,24688,24677,'',0,0),(203,24689,24677,'',0,0),(204,24690,24677,'',0,0),(205,24691,24678,'',0,0),(206,24692,24678,'',0,0),(207,24693,24679,'',0,0),(208,24694,24679,'',0,0),(209,24695,24679,'',0,0),(210,24696,24679,'',0,0),(211,24697,24679,'',0,0),(212,24698,24680,'',0,0),(213,24699,24680,'',0,0),(214,24700,24681,'',0,0),(215,24701,24681,'',0,0),(216,24702,24681,'',0,0),(217,24703,24681,'',0,0);
/*!40000 ALTER TABLE `item_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `snmp_community` varchar(64) NOT NULL DEFAULT '',
  `snmp_oid` varchar(255) NOT NULL DEFAULT '',
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `key_` varchar(255) NOT NULL DEFAULT '',
  `delay` int(11) NOT NULL DEFAULT '0',
  `history` int(11) NOT NULL DEFAULT '90',
  `trends` int(11) NOT NULL DEFAULT '365',
  `status` int(11) NOT NULL DEFAULT '0',
  `value_type` int(11) NOT NULL DEFAULT '0',
  `trapper_hosts` varchar(255) NOT NULL DEFAULT '',
  `units` varchar(255) NOT NULL DEFAULT '',
  `multiplier` int(11) NOT NULL DEFAULT '0',
  `delta` int(11) NOT NULL DEFAULT '0',
  `snmpv3_securityname` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_securitylevel` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authpassphrase` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_privpassphrase` varchar(64) NOT NULL DEFAULT '',
  `formula` varchar(255) NOT NULL DEFAULT '',
  `error` varchar(2048) NOT NULL DEFAULT '',
  `lastlogsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `logtimefmt` varchar(64) NOT NULL DEFAULT '',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `valuemapid` bigint(20) unsigned DEFAULT NULL,
  `delay_flex` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `ipmi_sensor` varchar(128) NOT NULL DEFAULT '',
  `data_type` int(11) NOT NULL DEFAULT '0',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `publickey` varchar(64) NOT NULL DEFAULT '',
  `privatekey` varchar(64) NOT NULL DEFAULT '',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `interfaceid` bigint(20) unsigned DEFAULT NULL,
  `port` varchar(64) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `inventory_link` int(11) NOT NULL DEFAULT '0',
  `lifetime` varchar(64) NOT NULL DEFAULT '30',
  `snmpv3_authprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_privprotocol` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `snmpv3_contextname` varchar(255) NOT NULL DEFAULT '',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  UNIQUE KEY `items_1` (`hostid`,`key_`),
  KEY `items_3` (`status`),
  KEY `items_4` (`templateid`),
  KEY `items_5` (`valuemapid`),
  KEY `items_6` (`interfaceid`),
  CONSTRAINT `c_items_4` FOREIGN KEY (`interfaceid`) REFERENCES `interface` (`interfaceid`),
  CONSTRAINT `c_items_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_2` FOREIGN KEY (`templateid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_3` FOREIGN KEY (`valuemapid`) REFERENCES `valuemaps` (`valuemapid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (23252,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,alerter,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23253,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,configuration syncer,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23254,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,db watchdog,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23255,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,discoverer,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23256,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,escalator,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23257,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,history syncer,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23258,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,housekeeper,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23259,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,http poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23260,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,icmp pinger,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23261,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,ipmi poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23262,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,java poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23264,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23265,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,proxy poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23266,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,self-monitoring,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23267,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,snmp trapper,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23268,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,timer,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23269,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,trapper,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23270,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,unreachable poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23271,5,'','',10084,'Zabbix queue over $2','zabbix[queue,10m]',600,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23272,5,'','',10084,'Zabbix queue','zabbix[queue]',600,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23273,5,'','',10084,'Zabbix configuration cache, % free','zabbix[rcache,buffer,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23274,5,'','',10084,'Zabbix $2 write cache, % free','zabbix[wcache,history,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23275,5,'','',10084,'Zabbix history index cache, % free','zabbix[wcache,index,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23276,5,'','',10084,'Zabbix $2 write cache, % free','zabbix[wcache,trend,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23277,5,'','',10084,'Values processed by Zabbix server per second','zabbix[wcache,values]',60,7,365,0,0,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23278,0,'','',10084,'Network interface discovery','net.if.discovery',3600,90,0,0,4,'','',0,0,'',0,'','','','',0,'',NULL,NULL,'','','',0,0,'','','','',0,1,1,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30',0,0,0,'',0),(23279,0,'','',10084,'Mounted filesystem discovery','vfs.fs.discovery',3600,90,0,0,4,'','',0,0,'',0,'','','','',0,'',NULL,NULL,'','','',0,0,'','','','',0,1,1,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30',0,0,0,'',0),(23280,0,'','',10084,'Incoming network traffic on $1','net.if.in[{#IFNAME}]',60,7,365,0,3,'','bps',1,1,'',0,'','','8','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,1,'','',0,'0',0,0,0,'',0),(23281,0,'','',10084,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]',60,7,365,0,3,'','bps',1,1,'',0,'','','8','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,1,'','',0,'0',0,0,0,'',0),(23282,0,'','',10084,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,1,'','',0,'0',0,0,0,'',0),(23283,0,'','',10084,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]',60,7,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,1,'','',0,'0',0,0,0,'',0),(23284,0,'','',10084,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,1,'','',0,'0',0,0,0,'',0),(23285,0,'','',10084,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]',3600,7,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,1,'','',0,'0',0,0,0,'',0),(23286,0,'','',10084,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]',60,7,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,1,'','',0,'0',0,0,0,'',0),(23287,0,'','',10084,'Agent ping','agent.ping',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,10,'','','',0,0,'','','','',0,0,1,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0),(23288,0,'','',10084,'Version of zabbix_agent(d) running','agent.version',3600,7,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23289,0,'','',10084,'Maximum number of opened files','kernel.maxfiles',3600,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'0',0,0,0,'',0),(23290,0,'','',10084,'Maximum number of processes','kernel.maxproc',3600,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'0',0,0,0,'',0),(23291,0,'','',10084,'Number of running processes','proc.num[,,run]',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','Number of processes in running state.',0,'0',0,0,0,'',0),(23292,0,'','',10084,'Number of processes','proc.num[]',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','Total number of processes in any state.',0,'0',0,0,0,'',0),(23293,0,'','',10084,'Host boot time','system.boottime',600,7,365,0,3,'','unixtime',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23294,0,'','',10084,'Interrupts per second','system.cpu.intr',60,7,365,0,3,'','ips',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23295,0,'','',10084,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]',60,7,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'0',0,0,0,'',0),(23296,0,'','',10084,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]',60,7,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'0',0,0,0,'',0),(23297,0,'','',10084,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]',60,7,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'0',0,0,0,'',0),(23298,0,'','',10084,'Context switches per second','system.cpu.switches',60,7,365,0,3,'','sps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23299,0,'','',10084,'CPU $2 time','system.cpu.util[,idle]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The time the CPU has spent doing nothing.',0,'0',0,0,0,'',0),(23300,0,'','',10084,'CPU $2 time','system.cpu.util[,interrupt]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The amount of time the CPU has been servicing hardware interrupts.',0,'0',0,0,0,'',0),(23301,0,'','',10084,'CPU $2 time','system.cpu.util[,iowait]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','Amount of time the CPU has been waiting for I/O to complete.',0,'0',0,0,0,'',0),(23302,0,'','',10084,'CPU $2 time','system.cpu.util[,nice]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The time the CPU has spent running users\' processes that have been niced.',0,'0',0,0,0,'',0),(23303,0,'','',10084,'CPU $2 time','system.cpu.util[,softirq]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The amount of time the CPU has been servicing software interrupts.',0,'0',0,0,0,'',0),(23304,0,'','',10084,'CPU $2 time','system.cpu.util[,steal]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The amount of CPU \'stolen\' from this virtual machine by the hypervisor for other tasks (such as running another virtual machine).',0,'0',0,0,0,'',0),(23305,0,'','',10084,'CPU $2 time','system.cpu.util[,system]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The time the CPU has spent running the kernel and its processes.',0,'0',0,0,0,'',0),(23306,0,'','',10084,'CPU $2 time','system.cpu.util[,user]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The time the CPU has spent running users\' processes that are not niced.',0,'0',0,0,0,'',0),(23307,0,'','',10084,'Host name','system.hostname',3600,7,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','System host name.',3,'0',0,0,0,'',0),(23308,0,'','',10084,'Host local time','system.localtime',60,7,365,0,3,'','unixtime',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23309,0,'','',10084,'Free swap space','system.swap.size[,free]',60,7,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23310,0,'','',10084,'Free swap space in %','system.swap.size[,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23311,0,'','',10084,'Total swap space','system.swap.size[,total]',3600,7,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23312,0,'','',10084,'System information','system.uname',3600,7,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The information as normally returned by \'uname -a\'.',5,'0',0,0,0,'',0),(23313,0,'','',10084,'System uptime','system.uptime',600,7,365,0,3,'','uptime',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23314,0,'','',10084,'Number of logged in users','system.users.num',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','Number of users who are currently logged in.',0,'0',0,0,0,'',0),(23315,0,'','',10084,'Checksum of $1','vfs.file.cksum[/etc/passwd]',3600,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23316,0,'','',10084,'Available memory','vm.memory.size[available]',60,7,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','Available memory is defined as free+cached+buffers memory.',0,'0',0,0,0,'',0),(23317,0,'','',10084,'Total memory','vm.memory.size[total]',3600,7,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23327,0,'','',10084,'Host name of zabbix_agentd running','agent.hostname',3600,7,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'30',0,0,0,'',0),(23328,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,vmware collector,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23620,5,'','',10084,'Zabbix value cache, % free','zabbix[vcache,buffer,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23625,5,'','',10084,'Zabbix value cache hits','zabbix[vcache,cache,hits]',60,7,365,0,0,'','vps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23628,5,'','',10084,'Zabbix value cache misses','zabbix[vcache,cache,misses]',60,7,365,0,0,'','vps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'0',0,0,0,'',0),(23635,5,'','',10084,'Zabbix vmware cache, % free','zabbix[vmware,buffer,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23662,5,'','',10084,'Zabbix value cache operating mode','zabbix[vcache,cache,mode]',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,15,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23850,0,'','',10107,'libvirtd','openstack.serviceexist[libvirtd]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23851,0,'','',10107,'neutron-dhcp-agent','openstack.serviceexist[neutron-dhcp-agent]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23852,0,'','',10107,'neutron-l3-agent','openstack.serviceexist[neutron-l3-agent]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23853,0,'','',10107,'neutron-metadata-agent','openstack.serviceexist[neutron-metadata-agent]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23854,0,'','',10107,'neutron-openvswitch-agent','openstack.serviceexist[neutron-openvswitch-agent]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23855,0,'','',10107,'openstack-ceilometer-compute','openstack.serviceexist[openstack-ceilometer-compute]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23856,0,'','',10107,'openstack-cinder-volume','openstack.serviceexist[openstack-cinder-volume]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23857,0,'','',10107,'openstack-nova-compute','openstack.serviceexist[openstack-nova-compute]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23858,0,'','',10107,'openvswitch','openstack.serviceexist[openvswitch]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23859,0,'','',10108,'httpd','openstack.serviceexist[httpd]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23860,0,'','',10108,'neutron-server','openstack.serviceexist[neutron-server]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23861,0,'','',10108,'openstack-ceilometer-central','openstack.serviceexist[openstack-ceilometer-central]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23862,0,'','',10108,'openstack-ceilometer-collector','openstack.serviceexist[openstack-ceilometer-collector]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23863,0,'','',10108,'openstack-ceilometer-notification','openstack.serviceexist[openstack-ceilometer-notification]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23864,0,'','',10108,'openstack-cinder-api','openstack.serviceexist[openstack-cinder-api]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23865,0,'','',10108,'openstack-cinder-scheduler','openstack.serviceexist[openstack-cinder-scheduler]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23866,0,'','',10108,'openstack-glance-api','openstack.serviceexist[openstack-glance-api]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23867,0,'','',10108,'openstack-glance-registry','openstack.serviceexist[openstack-glance-registry]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23868,0,'','',10108,'openstack-nova-api','openstack.serviceexist[openstack-nova-api]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23869,0,'','',10108,'openstack-nova-cert','openstack.serviceexist[openstack-nova-cert]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23870,0,'','',10108,'openstack-nova-conductor','openstack.serviceexist[openstack-nova-conductor]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23871,0,'','',10108,'openstack-nova-consoleauth','openstack.serviceexist[openstack-nova-consoleauth]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23872,0,'','',10108,'openstack-nova-novncproxy','openstack.serviceexist[openstack-nova-novncproxy]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23873,0,'','',10108,'openstack-nova-scheduler','openstack.serviceexist[openstack-nova-scheduler]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23874,0,'','',10109,'httpd','openstack.serviceexist[httpd]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23875,0,'','',10110,'Openstack service haproxy','openstack.serviceexist[haproxy]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23876,0,'','',10110,'Openstack service keepalived','openstack.serviceexist[keepalived]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23877,0,'','',10111,'neutron-l3-agent','openstack.serviceexist[neutron-l3-agent]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23878,0,'','',10111,'neutron-lbaasv2-agent','openstack.serviceexist[neutron-lbaasv2-agent]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23879,0,'','',10111,'neutron-openvswitch-agent','openstack.serviceexist[neutron-openvswitch-agent]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23880,0,'','',10112,'memcached','openstack.serviceexist[memcached]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23881,0,'','',10113,'mysqld','openstack.serviceexist[mysqldi]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23882,0,'','',10113,'xinetd','openstack.serviceexist[xinetd]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23883,0,'','',10114,'nova-novncproxy','openstack.serviceexist[nova-novncproxy]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23884,0,'','',10115,'ntpd','openstack.serviceexist[ntpd]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23885,0,'','',10116,'rabbitmq-server','openstack.serviceexist[rabbitmq-server]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23886,0,'','',10117,'ceph-pronum','ceph.pnum[ceph]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23887,0,'','',10118,'CEPH_osd_df','ceph.osd_df',60,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23888,0,'','',10118,'CEPH_osd_perf','ceph.osd_perf',60,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23889,0,'','',10118,'CEPH_osd_pool_stats','ceph.osd_pool_stats',60,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23890,0,'','',10118,'CEPH_osd_tree','ceph.osd_tree',60,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23891,0,'','',10118,'CEPH_pg_stat','ceph.pg_stat',60,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23892,0,'','',10118,'CEPH_status','ceph.status',60,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23893,0,'','',10118,'Ceph_warn','ceph.warn',60,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23894,0,'','',10120,'MySQL status','mysql.ping',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,1,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.ping, which is defined in userparameter_mysql.conf.\r\n\r\n0 - MySQL server is down\r\n1 - MySQL server is up',0,'30',0,0,0,'',0),(23895,0,'','',10120,'MySQL bytes received per second','mysql.status[Bytes_received]',60,7,365,0,0,'','Bps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The number of bytes received from all clients. \r\n\r\nIt requires user parameter mysql.status[*], which is defined in \r\nuserparameter_mysql.conf.',0,'30',0,0,0,'',0),(23896,0,'','',10120,'MySQL bytes sent per second','mysql.status[Bytes_sent]',60,7,365,0,0,'','Bps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The number of bytes sent to all clients.\r\n\r\nIt requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23897,0,'','',10120,'MySQL begin operations per second','mysql.status[Com_begin]',60,7,365,0,0,'','qps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23898,0,'','',10120,'MySQL commit operations per second','mysql.status[Com_commit]',60,7,365,0,0,'','qps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23899,0,'','',10120,'MySQL delete operations per second','mysql.status[Com_delete]',60,7,365,0,0,'','qps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23900,0,'','',10120,'MySQL insert operations per second','mysql.status[Com_insert]',60,7,365,0,0,'','qps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23901,0,'','',10120,'MySQL rollback operations per second','mysql.status[Com_rollback]',60,7,365,0,0,'','qps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23902,0,'','',10120,'MySQL select operations per second','mysql.status[Com_select]',60,7,365,0,0,'','qps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23903,0,'','',10120,'MySQL update operations per second','mysql.status[Com_update]',60,7,365,0,0,'','qps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23904,0,'','',10120,'MySQL queries per second','mysql.status[Questions]',60,7,365,0,0,'','qps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23905,0,'','',10120,'MySQL slow queries','mysql.status[Slow_queries]',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23906,0,'','',10120,'MySQL uptime','mysql.status[Uptime]',60,7,365,0,3,'','uptime',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23907,0,'','',10120,'MySQL version','mysql.version',3600,7,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.version, which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23908,0,'','',10121,'Openstack_service_libvirtd','openstack.serviceexist[libvirtd]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23909,0,'','',10121,'Openstack_service_neutron_l3_agent','openstack.serviceexist[ neutron-l3-agent]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23910,0,'','',10121,'Openstack_service_neutron_metadata_agent','openstack.serviceexist[neutron-metadata-agent]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23911,0,'','',10121,'Openstack_service_neutron_openvswitch_agent','openstack.serviceexist[neutron-openvswitch-agent]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23912,0,'','',10121,'Openstack_service_cinder_volume','openstack.serviceexist[openstack-cinder-volume]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23913,0,'','',10121,'Openstack_service_nova_compute','openstack.serviceexist[openstack-nova-compute]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23914,0,'','',10122,'check cinder process status','check-process-status-openstack[cinder]',120,90,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23915,0,'','',10122,'check neutron process status','check-process-status-openstack[neutron]',120,90,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23916,0,'','',10122,'check nova process status','check-process-status-openstack[nova]',30,90,0,0,4,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23935,3,'','',10123,'SSH service is running','net.tcp.service[ssh]',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,1,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23936,7,'','',10124,'Agent ping','agent.ping',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,10,'','','',0,0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'30',0,0,0,'',0),(23937,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,configuration syncer,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23938,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,data sender,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23939,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,discoverer,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23940,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,heartbeat sender,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23941,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,history syncer,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23942,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,housekeeper,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23943,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,http poller,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23944,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,icmp pinger,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23945,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,ipmi poller,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23946,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,java poller,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23947,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,poller,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23948,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,self-monitoring,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23949,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,snmp trapper,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23950,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,trapper,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23951,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,unreachable poller,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23952,5,'','',10125,'Zabbix queue over $2','zabbix[queue,10m]',600,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23953,5,'','',10125,'Zabbix queue','zabbix[queue]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23954,5,'','',10125,'Zabbix configuration cache, % free','zabbix[rcache,buffer,pfree]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23955,5,'','',10125,'Zabbix $2 write cache, % free','zabbix[wcache,history,pfree]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23956,5,'','',10125,'Zabbix $2 write cache, % free','zabbix[wcache,text,pfree]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23957,5,'','',10125,'Values processed by Zabbix proxy per second','zabbix[wcache,values]',60,180,365,0,0,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23958,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,alerter,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23959,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,configuration syncer,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23960,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,db watchdog,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23961,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,discoverer,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23962,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,escalator,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23963,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,history syncer,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23964,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,housekeeper,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23965,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,http poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23966,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,icmp pinger,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23967,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,ipmi poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23968,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,java poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23969,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23970,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,proxy poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23971,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,self-monitoring,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23972,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,snmp trapper,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23973,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,timer,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23974,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,trapper,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23975,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,unreachable poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23976,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,vmware collector,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23977,5,'','',10126,'Zabbix queue over $2','zabbix[queue,10m]',600,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23978,5,'','',10126,'Zabbix queue','zabbix[queue]',600,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23979,5,'','',10126,'Zabbix configuration cache, % free','zabbix[rcache,buffer,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23980,5,'','',10126,'Zabbix value cache, % free','zabbix[vcache,buffer,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23981,5,'','',10126,'Zabbix value cache hits','zabbix[vcache,cache,hits]',60,7,365,0,0,'','vps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23982,5,'','',10126,'Zabbix value cache misses','zabbix[vcache,cache,misses]',60,7,365,0,0,'','vps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23983,5,'','',10126,'Zabbix value cache operating mode','zabbix[vcache,cache,mode]',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,15,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23984,5,'','',10126,'Zabbix vmware cache, % free','zabbix[vmware,buffer,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23985,5,'','',10126,'Zabbix $2 write cache, % free','zabbix[wcache,history,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23986,5,'','',10126,'Zabbix history index cache, % free','zabbix[wcache,index,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23987,5,'','',10126,'Zabbix $2 write cache, % free','zabbix[wcache,trend,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23988,5,'','',10126,'Values processed by Zabbix server per second','zabbix[wcache,values]',60,7,365,0,0,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23989,7,'','',10127,'Agent ping','agent.ping',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,10,'','','',0,0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'30',0,0,0,'',0),(23990,7,'','',10127,'Maximum number of opened files','kernel.maxfiles',3600,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Maximum number of opened files',0,'30',0,0,0,'',0),(23991,7,'','',10127,'Maximum number of processes','kernel.maxproc',3600,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Maximum number of processes',0,'30',0,0,0,'',0),(23992,7,'','',10127,'Host boot time','system.boottime',600,180,365,0,3,'','unixtime',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Host boot time',0,'30',0,0,0,'',0),(23993,7,'','',10127,'Highload CPU index','system.cpu.highload[CpuNumber]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The index of the first CPU reaching 100%',0,'30',0,0,0,'',0),(23994,7,'','',10127,'Total highload CPU number','system.cpu.highload[CpuTotal]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23995,7,'','',10127,'Interrupts per second','system.cpu.intr',60,180,365,0,3,'','ips',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Interrupts per second',0,'30',0,0,0,'',0),(23996,7,'','',10127,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.(1 minute)',0,'30',0,0,0,'',0),(23997,7,'','',10127,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.(5 minutes)',0,'30',0,0,0,'',0),(23998,7,'','',10127,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.(15 minutes)',0,'30',0,0,0,'',0),(23999,7,'','',10127,'Context switches per second','system.cpu.switches',600,180,365,0,3,'','sps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Context switches per second on host',0,'30',0,0,0,'',0),(24000,7,'','',10127,'Highload CPU process','system.cpu.top',60,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The first process id whose CPU reaches100%',0,'30',0,0,0,'',0),(24001,7,'','',10127,'CPU $2 time','system.cpu.util[,idle]',120,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The time the CPU has spent doing nothing.',0,'30',0,0,0,'',0),(24002,7,'','',10127,'CPU $2 time','system.cpu.util[,interrupt]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Hardware interrupt time.',0,'30',0,0,0,'',0),(24003,7,'','',10127,'CPU $2 time','system.cpu.util[,iowait]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','CPU iowait time',0,'30',0,0,0,'',0),(24004,7,'','',10127,'CPU $2 time','system.cpu.util[,nice]',120,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','CPU nice time',0,'30',0,0,0,'',0),(24005,7,'','',10127,'CPU $2 time','system.cpu.util[,softirq]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Software interrupt time',0,'30',0,0,0,'',0),(24006,7,'','',10127,'CPU $2 time','system.cpu.util[,steal]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The amount of CPU \'stolen\' from this virtual machine by the hypervisor for other tasks (such as running another virtual machine).',0,'30',0,0,0,'',0),(24007,7,'','',10127,'CPU $2 time','system.cpu.util[,system]',120,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','CPU system time',0,'30',0,0,0,'',0),(24008,7,'','',10127,'CPU $2 time','system.cpu.util[,user]',120,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','CPU time spent in user space',0,'30',0,0,0,'',0),(24009,7,'','',10127,'Host name','system.hostname',3600,14,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Host name',3,'30',0,0,0,'',0),(24010,7,'','',10127,'System information','system.uname',3600,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'30',0,0,0,'',0),(24011,7,'','',10127,'System uptime','system.uptime',600,180,365,0,3,'','uptime',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','System uptime',0,'30',0,0,0,'',0),(24012,7,'','',10127,'Number of logged in users','system.users.num',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Number of logged in users',0,'30',0,0,0,'',0),(24013,7,'','',10127,'Checksum of $1','vfs.file.cksum[/etc/passwd]',60,3,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Check whether the password is changed',0,'30',0,0,0,'',0),(24014,7,'','',10127,'Available memory','vm.memory.size[available]',60,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Available memory',0,'30',0,0,0,'',0),(24015,7,'','',10127,'Total memory','vm.memory.size[total]',3600,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24016,7,'','',10128,'Agent ping','agent.ping',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,10,'','','',0,0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'30',0,0,0,'',0),(24017,0,'','',10128,'File read bytes per second','perf_counter[\\2\\16]',60,180,365,0,0,'','Bps',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Full counter name: \\System\\File Read Bytes/sec',0,'30',0,0,0,'',0),(24018,0,'','',10128,'File write bytes per second','perf_counter[\\2\\18]',60,180,365,0,0,'','Bps',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Full counter name: \\System\\File Write Bytes/sec',0,'30',0,0,0,'',0),(24019,0,'','',10128,'Number of threads','perf_counter[\\2\\250]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Full counter name: \\System\\Threads',0,'30',0,0,0,'',0),(24020,0,'','',10128,'Average disk read queue length','perf_counter[\\234(_Total)\\1402]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Full counter name: \\PhysicalDisk(_Total)\\Avg. Disk Read Queue Length',0,'30',0,0,0,'',0),(24021,0,'','',10128,'Average disk write queue length','perf_counter[\\234(_Total)\\1404]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Full counter name: \\PhysicalDisk(_Total)\\Avg. Disk Write Queue Length',0,'30',0,0,0,'',0),(24022,0,'','',10128,'Number of processes','proc.num[]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24023,0,'','',10128,'Processor load (1 min average)','system.cpu.load[percpu,avg1]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24024,0,'','',10128,'Processor load (5 min average)','system.cpu.load[percpu,avg5]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24025,0,'','',10128,'Processor load (15 min average)','system.cpu.load[percpu,avg15]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24026,0,'','',10128,'Free swap space','system.swap.size[,free]',60,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24027,0,'','',10128,'Total swap space','system.swap.size[,total]',3600,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24028,0,'','',10128,'System information','system.uname',3600,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',5,'30',0,0,0,'',0),(24029,0,'','',10128,'System uptime','system.uptime',60,180,365,0,3,'','uptime',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24030,0,'','',10128,'Free memory','vm.memory.size[free]',60,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24031,0,'','',10128,'Total memory','vm.memory.size[total]',3600,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24032,2,'','',10129,'aria_pagecache_blocks','FromDual.MySQL.aria.aria_pagecache_blocks',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24033,2,'','',10129,'Aria_pagecache_blocks_not_flushed','FromDual.MySQL.aria.Aria_pagecache_blocks_not_flushed',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24034,2,'','',10129,'Aria_pagecache_blocks_unused','FromDual.MySQL.aria.Aria_pagecache_blocks_unused',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24035,2,'','',10129,'Aria_pagecache_blocks_used','FromDual.MySQL.aria.Aria_pagecache_blocks_used',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24036,2,'','',10129,'aria_pagecache_buffer_size','FromDual.MySQL.aria.aria_pagecache_buffer_size',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24037,2,'','',10129,'Aria_pagecache_reads','FromDual.MySQL.aria.Aria_pagecache_reads',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24038,2,'','',10129,'Aria_pagecache_read_requests','FromDual.MySQL.aria.Aria_pagecache_read_requests',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24039,2,'','',10129,'Aria_pagecache_writes','FromDual.MySQL.aria.Aria_pagecache_writes',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24040,2,'','',10129,'Aria_pagecache_write_requests','FromDual.MySQL.aria.Aria_pagecache_write_requests',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24041,2,'','',10129,'Aria_transaction_log_syncs','FromDual.MySQL.aria.Aria_transaction_log_syncs',60,30,365,0,3,'','sync/s',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24042,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10129,'maria_pagecache_blocks','FromDual.MySQL.aria.maria_pagecache_blocks',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24043,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10129,'Maria_pagecache_blocks_not_flushed','FromDual.MySQL.aria.Maria_pagecache_blocks_not_flushed',30,30,365,0,3,'','',0,2,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24044,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10129,'Maria_pagecache_blocks_unused','FromDual.MySQL.aria.Maria_pagecache_blocks_unused',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24045,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10129,'Maria_pagecache_blocks_used','FromDual.MySQL.aria.Maria_pagecache_blocks_used',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24046,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10129,'maria_pagecache_buffer_size','FromDual.MySQL.aria.maria_pagecache_buffer_size',30,30,365,0,3,'','byte',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24047,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10129,'Maria_pagecache_reads','FromDual.MySQL.aria.Maria_pagecache_reads',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24048,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10129,'Maria_pagecache_read_requests','FromDual.MySQL.aria.Maria_pagecache_read_requests',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24049,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10129,'Maria_pagecache_writes','FromDual.MySQL.aria.Maria_pagecache_writes',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24050,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10129,'Maria_pagecache_write_requests','FromDual.MySQL.aria.Maria_pagecache_write_requests',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24051,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10129,'Maria_transaction_log_syncs','FromDual.MySQL.aria.Maria_transaction_log_syncs',30,30,365,0,3,'','sync/s',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24052,2,'','',10130,'fpmmm Agent is OK','FromDual.MySQL.agent_OK',60,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24053,0,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10130,'fpmmm Agent is alive','FromDual.MySQL.check',10,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24054,2,'','',10130,'MySQL Performance Monitor machine readable version','FromDual.MySQL.fpmmm.fpmmm_mr_version',60,1100,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24055,2,'','',10130,'MySQL Performance Monitor version','FromDual.MySQL.fpmmm.fpmmm_version',60,1100,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24056,2,'','',10131,'WsRep Apply oooe','FromDual.MySQL.galera.wsrep_apply_oooe',60,30,365,0,0,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24057,2,'','',10131,'WsRep Apply oool','FromDual.MySQL.galera.wsrep_apply_oool',60,30,365,0,0,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24058,2,'','',10131,'WsRep Apply window','FromDual.MySQL.galera.wsrep_apply_window',60,30,365,0,0,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24059,2,'','',10131,'WsRep Auto Increment Control','FromDual.MySQL.galera.wsrep_auto_increment_control',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24060,2,'','',10131,'WsRep Causal Reads','FromDual.MySQL.galera.wsrep_causal_reads',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24061,2,'','',10131,'WsRep Certifcate Deps Distance','FromDual.MySQL.galera.wsrep_cert_deps_distance',60,30,365,0,0,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24062,2,'','',10131,'WsRep Cert Index Size','FromDual.MySQL.galera.wsrep_cert_index_size',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24063,2,'','',10131,'WsRep Cluster Address','FromDual.MySQL.galera.wsrep_cluster_address',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24064,2,'','',10131,'WsRep Cluster Configuration ID','FromDual.MySQL.galera.wsrep_cluster_conf_id',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24065,2,'','',10131,'WsRep Cluster Name','FromDual.MySQL.galera.wsrep_cluster_name',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24066,2,'','',10131,'WsRep Cluster Size','FromDual.MySQL.galera.wsrep_cluster_size',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24067,2,'','',10131,'WsRep Cluster Status','FromDual.MySQL.galera.wsrep_cluster_status',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24068,2,'','',10131,'WsRep Commit oooe','FromDual.MySQL.galera.wsrep_commit_oooe',60,30,365,0,0,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24069,2,'','',10131,'WsRep Commit oool','FromDual.MySQL.galera.wsrep_commit_oool',60,30,365,0,0,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24070,2,'','',10131,'WsRep Commit window','FromDual.MySQL.galera.wsrep_commit_window',60,30,365,0,0,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24071,2,'','',10131,'WsRep Connected','FromDual.MySQL.galera.wsrep_connected',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24072,2,'','',10131,'WsRep Flow Control Paused','FromDual.MySQL.galera.wsrep_flow_control_paused',60,30,365,0,0,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24073,2,'','',10131,'WsRep Flow Control Received','FromDual.MySQL.galera.wsrep_flow_control_recv',0,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24074,2,'','',10131,'WsRep Flow Control Sent','FromDual.MySQL.galera.wsrep_flow_control_sent',0,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24075,2,'','',10131,'WsRep Flow Control Waits','FromDual.MySQL.galera.wsrep_flow_control_waits',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24076,2,'','',10131,'WsRep Last Committed','FromDual.MySQL.galera.wsrep_last_committed',0,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24077,2,'','',10131,'WsRep Local BF Aborts','FromDual.MySQL.galera.wsrep_local_bf_aborts',0,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24078,2,'','',10131,'WsRep Local Cert Failures','FromDual.MySQL.galera.wsrep_local_cert_failures',0,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24079,2,'','',10131,'WsRep Local Commits','FromDual.MySQL.galera.wsrep_local_commits',0,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24080,2,'','',10131,'WsRep Local Receive Queue','FromDual.MySQL.galera.wsrep_local_recv_queue',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24081,2,'','',10131,'WsRep Local Receive Queue (avg)','FromDual.MySQL.galera.wsrep_local_recv_queue_avg',60,30,365,0,0,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24082,2,'','',10131,'WsRep Local Send Queue','FromDual.MySQL.galera.wsrep_local_send_queue',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24083,2,'','',10131,'WsRep Local Send Queue (avg)','FromDual.MySQL.galera.wsrep_local_send_queue_avg',60,30,365,0,0,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24084,2,'','',10131,'WsRep Local State','FromDual.MySQL.galera.wsrep_local_state',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24085,2,'','',10131,'WsRep Locale State Comment','FromDual.MySQL.galera.wsrep_local_state_comment',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24086,2,'','',10131,'WsRep Local Local Status','FromDual.MySQL.galera.wsrep_local_status',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24087,2,'','',10131,'WsRep Node Name','FromDual.MySQL.galera.wsrep_node_name',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24088,2,'','',10131,'WsRep On','FromDual.MySQL.galera.wsrep_on',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24089,2,'','',10131,'WsRep Protocol Version','FromDual.MySQL.galera.wsrep_protocol_version',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24090,2,'','',10131,'WsRep Provider','FromDual.MySQL.galera.wsrep_provider',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24091,2,'','',10131,'WsRep Provider Options','FromDual.MySQL.galera.wsrep_provider_options',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24092,2,'','',10131,'WsRep Provider Version','FromDual.MySQL.galera.wsrep_provider_version',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24093,2,'','',10131,'WsRep Provider Version (MR)','FromDual.MySQL.galera.wsrep_provider_version_mr',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24094,2,'','',10131,'WsRep Ready','FromDual.MySQL.galera.wsrep_ready',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24095,2,'','',10131,'WsRep Received','FromDual.MySQL.galera.wsrep_received',0,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24096,2,'','',10131,'WsRep Received Bytes','FromDual.MySQL.galera.wsrep_received_bytes',0,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24097,2,'','',10131,'WsRep Replicated','FromDual.MySQL.galera.wsrep_replicated',0,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24098,2,'','',10131,'WsRep Replicated Bytes','FromDual.MySQL.galera.wsrep_replicated_bytes',0,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24099,2,'','',10131,'WsRep Slave Threads','FromDual.MySQL.galera.wsrep_slave_threads',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24100,2,'','',10131,'WsRep SST Methode','FromDual.MySQL.galera.wsrep_sst_method',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24101,2,'','',10131,'WsRep SST Receive Address','FromDual.MySQL.galera.wsrep_sst_receive_address',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24102,2,'','',10132,'InnoDB Deadlock error message','FromDual.MySQL.innodb.Deadlock_message',60,30,0,0,4,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24103,2,'','',10132,'InnoDB new Deadlock error','FromDual.MySQL.innodb.Deadlock_new',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24104,2,'','',10132,'InnoDB Foreign Key error message','FromDual.MySQL.innodb.ForeignKey_message',60,30,0,0,4,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24105,2,'','',10132,'InnoDB new Foreign Key error','FromDual.MySQL.innodb.ForeignKey_new',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24106,2,'','',10132,'InnoDB plugin-in','FromDual.MySQL.innodb.ignore_builtin_innodb',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24107,2,'','',10132,'InnoDB Buffer Pool Hit Ratio','FromDual.MySQL.innodb.Innodb_buffer_pool_hit_ratio',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24108,2,'','',10132,'InnoDB Buffer Pool Instances','FromDual.MySQL.innodb.innodb_buffer_pool_instances',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24109,2,'','',10132,'InnoDB Buffer Pool max dirty Pages','FromDual.MySQL.innodb.Innodb_buffer_pool_max_dirty_pages',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24110,2,'','',10132,'InnoDB Buffer Pool max dirty Pages','FromDual.MySQL.innodb.Innodb_buffer_pool_max_dirty_pages_b',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24111,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'InnoDB Buffer Pool Pages Data','FromDual.MySQL.innodb.Innodb_buffer_pool_pages_data',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24112,2,'','',10132,'InnoDB Buffer Pool Pages Data','FromDual.MySQL.innodb.Innodb_buffer_pool_pages_data_b',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24113,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'InnoDB Buffer Pool Pages Dirty','FromDual.MySQL.innodb.Innodb_buffer_pool_pages_dirty',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24114,2,'','',10132,'InnoDB Buffer Pool Pages Dirty','FromDual.MySQL.innodb.Innodb_buffer_pool_pages_dirty_b',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24115,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'InnoDB Buffer Pool Pages Free','FromDual.MySQL.innodb.Innodb_buffer_pool_pages_free',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24116,2,'','',10132,'InnoDB Buffer Pool Pages Free','FromDual.MySQL.innodb.Innodb_buffer_pool_pages_free_b',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24117,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'InnoDB Buffer Pool Pages Misc','FromDual.MySQL.innodb.Innodb_buffer_pool_pages_misc',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24118,2,'','',10132,'InnoDB Buffer Pool Pages Misc','FromDual.MySQL.innodb.Innodb_buffer_pool_pages_misc_b',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24119,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'InnoDB Buffer Pool Pages Total','FromDual.MySQL.innodb.Innodb_buffer_pool_pages_total',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24120,2,'','',10132,'InnoDB Buffer Pool Pages Total','FromDual.MySQL.innodb.Innodb_buffer_pool_pages_total_b',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24121,2,'','',10132,'InnoDB Buffer Pool Reads','FromDual.MySQL.innodb.Innodb_buffer_pool_reads',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24122,2,'','',10132,'InnoDB Buffer Pool Read Requests','FromDual.MySQL.innodb.Innodb_buffer_pool_read_requests',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24123,2,'','',10132,'InnoDB Buffer Pool size','FromDual.MySQL.innodb.innodb_buffer_pool_size',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24124,2,'','',10132,'InnoDB Compress Time','FromDual.MySQL.innodb.Innodb_compress_time',60,30,365,0,3,'','s',0,2,'',0,'','','60','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24125,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'InnoDB Data Fsyncs','FromDual.MySQL.innodb.Innodb_data_fsyncs',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24126,2,'','',10132,'InnoDB Data Pending Fsyncs','FromDual.MySQL.innodb.Innodb_data_pending_fsyncs',60,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24127,2,'','',10132,'InnoDB Data Pending Reads','FromDual.MySQL.innodb.Innodb_data_pending_reads',60,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24128,2,'','',10132,'InnoDB Data Pending Writes','FromDual.MySQL.innodb.Innodb_data_pending_writes',60,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24129,2,'','',10132,'InnoDB Data Bytes Read','FromDual.MySQL.innodb.Innodb_data_read',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24130,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'InnoDB Data Reads','FromDual.MySQL.innodb.Innodb_data_reads',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24131,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'InnoDB Data Writes','FromDual.MySQL.innodb.Innodb_data_writes',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24132,2,'','',10132,'InnoDB Data Bytes Written','FromDual.MySQL.innodb.Innodb_data_written',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24133,2,'','',10132,'InnoDB File Format','FromDual.MySQL.innodb.innodb_file_format',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24134,2,'','',10132,'InnoDB File per Table','FromDual.MySQL.innodb.innodb_file_per_table',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24135,2,'','',10132,'InnoDB Flush Log at Transaction Commit','FromDual.MySQL.innodb.innodb_flush_log_at_trx_commit',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24136,2,'','',10132,'InnoDB Flush Method','FromDual.MySQL.innodb.innodb_flush_method',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24137,2,'','',10132,'InnoDB Force Recovery','FromDual.MySQL.innodb.innodb_force_recovery',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24138,2,'','',10132,'InnoDB Hash Node Size','FromDual.MySQL.innodb.Innodb_hash_node_size',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24139,2,'','',10132,'InnoDB Hash Searches','FromDual.MySQL.innodb.Innodb_hash_searches',60,30,365,0,0,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24140,2,'','',10132,'InnoDB I/O capacity','FromDual.MySQL.innodb.innodb_io_capacity',60,30,365,0,3,'','IOPS',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24141,2,'','',10132,'InnoDB Last Checkpoint at','FromDual.MySQL.innodb.Innodb_last_checkpoint_at',60,30,365,0,3,'','byte',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24142,2,'','',10132,'InnoDB Log Buffer Size','FromDual.MySQL.innodb.innodb_log_buffer_size',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24143,2,'','',10132,'InnoDB Log Files in Group','FromDual.MySQL.innodb.innodb_log_files_in_group',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24144,2,'','',10132,'InnoDB Log File Size','FromDual.MySQL.innodb.innodb_log_file_size',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24145,2,'','',10132,'InnoDB Log Flushed up to','FromDual.MySQL.innodb.Innodb_log_flushed_up_to',60,30,365,0,3,'','byte',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24146,2,'','',10132,'InnoDB Log Sequence Number','FromDual.MySQL.innodb.Innodb_log_sequence_number',60,30,365,0,3,'','byte',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24147,2,'','',10132,'InnoDB Log Buffer Waits','FromDual.MySQL.innodb.Innodb_log_waits',60,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24148,2,'','',10132,'InnoDB Mutex OS Waits','FromDual.MySQL.innodb.Innodb_mutex_os_waits',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24149,2,'','',10132,'InnoDB Mutex Spin Rounds','FromDual.MySQL.innodb.Innodb_mutex_spin_rounds',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24150,2,'','',10132,'InnoDB Mutex Spin Waits','FromDual.MySQL.innodb.Innodb_mutex_spin_waits',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24151,2,'','',10132,'InnoDB non-Hash Searches','FromDual.MySQL.innodb.Innodb_non_hash_searches',60,30,365,0,0,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24152,2,'','',10132,'InnoDB Open Read Views inside InnoDB Core','FromDual.MySQL.innodb.Innodb_open_read_views_inside_innodb',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24153,2,'','',10132,'InnoDB Log Fsyncs','FromDual.MySQL.innodb.Innodb_os_log_fsyncs',60,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24154,2,'','',10132,'InnoDB Log Pending Fsyncs','FromDual.MySQL.innodb.Innodb_os_log_pending_fsyncs',60,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24155,2,'','',10132,'InnoDB Log Pending Writes','FromDual.MySQL.innodb.Innodb_os_log_pending_writes',60,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24156,2,'','',10132,'InnoDB Trx Log bytes written','FromDual.MySQL.innodb.Innodb_os_log_written',60,30,365,0,3,'','byte/s',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24157,2,'','',10132,'InnoDB Pages Flushed up to','FromDual.MySQL.innodb.Innodb_pages_flushed_up_to',60,30,365,0,3,'','byte',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24158,2,'','',10132,'InnoDB Page Size','FromDual.MySQL.innodb.innodb_page_size',60,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24159,2,'','',10132,'InnoDB Queries Inside InnoDB Core','FromDual.MySQL.innodb.Innodb_queries_inside_innodb',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24160,2,'','',10132,'InnoDB Queries in Queue','FromDual.MySQL.innodb.Innodb_queries_in_queue',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24161,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'InnoDB Rows Deleted','FromDual.MySQL.innodb.Innodb_rows_deleted',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24162,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'InnoDB Rows Inserted','FromDual.MySQL.innodb.Innodb_rows_inserted',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24163,2,'','',10132,'InnoDB Rows Locked','FromDual.MySQL.innodb.Innodb_rows_locked',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24164,2,'','',10132,'InnoDB Rows Modified','FromDual.MySQL.innodb.Innodb_rows_modified',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24165,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'InnoDB Rows Read','FromDual.MySQL.innodb.Innodb_rows_read',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24166,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10132,'InnoDB Rows Updated','FromDual.MySQL.innodb.Innodb_rows_updated',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24167,2,'','',10132,'InnoDB Row Lock time (total)','FromDual.MySQL.innodb.Innodb_row_lock_time',60,30,365,0,3,'','ms',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24168,2,'','',10132,'InnoDB Row Lock waits (total)','FromDual.MySQL.innodb.Innodb_row_lock_waits',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24169,2,'','',10132,'InnoDB Transaction Committing','FromDual.MySQL.innodb.Innodb_trx_committing',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24170,2,'','',10132,'InnoDB Transaction History Length','FromDual.MySQL.innodb.Innodb_trx_history_list_length',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24171,2,'','',10132,'InnoDB Transaction Lock Memory','FromDual.MySQL.innodb.Innodb_trx_lock_memory',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24172,2,'','',10132,'InnoDB Transaction Lock Waiting','FromDual.MySQL.innodb.Innodb_trx_lock_wait',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24173,2,'','',10132,'InnoDB Transaction Rolling Back','FromDual.MySQL.innodb.Innodb_trx_rolling_back',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24174,2,'','',10132,'InnoDB Transaction Running','FromDual.MySQL.innodb.Innodb_trx_running',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24175,2,'','',10132,'InnoDB Uncompress Time','FromDual.MySQL.innodb.Innodb_uncompress_time',60,30,365,0,3,'','s',0,2,'',0,'','','60','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24176,2,'','',10133,'Auto Increment Increment','FromDual.MySQL.master.auto_increment_increment',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24177,2,'','',10133,'Auto Increment Offset','FromDual.MySQL.master.auto_increment_offset',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24178,2,'','',10133,'Average binlog event size','FromDual.MySQL.master.Binlog_avg_event_size',60,30,365,0,0,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24179,2,'','',10133,'Binlog Transaction Cache Size','FromDual.MySQL.master.binlog_cache_size',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24180,2,'','',10133,'Number of available binlogs','FromDual.MySQL.master.Binlog_count',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24181,2,'','',10133,'Binlog Do Filter','FromDual.MySQL.master.Binlog_do_filter',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24182,2,'','',10133,'Number of events written to the binlog','FromDual.MySQL.master.Binlog_event_count',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24183,2,'','',10133,'Binlog File','FromDual.MySQL.master.Binlog_file',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24184,2,'','',10133,'Binlog Format','FromDual.MySQL.master.binlog_format',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24185,2,'','',10133,'Binlog Ignore Filter','FromDual.MySQL.master.Binlog_ignore_filter',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24186,2,'','',10133,'Number of actual binlog','FromDual.MySQL.master.Binlog_number',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24187,2,'','',10133,'Master binlog position','FromDual.MySQL.master.Binlog_position',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24188,2,'','',10133,'Binlog Row Image','FromDual.MySQL.master.binlog_row_image',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24189,2,'','',10133,'Binlog Statement Cache Size','FromDual.MySQL.master.binlog_stmt_cache_size',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24190,2,'','',10133,'Total size of all binlogs','FromDual.MySQL.master.Binlog_total_size',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24191,2,'','',10133,'Expire Logs days','FromDual.MySQL.master.expire_logs_days',60,30,365,0,3,'','day',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24192,2,'','',10133,'Binary Log','FromDual.MySQL.master.log_bin',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24193,2,'','',10133,'Number of registered slaves','FromDual.MySQL.master.Slave_count',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24194,2,'','',10133,'Sync Binlog','FromDual.MySQL.master.sync_binlog',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24195,2,'','',10133,'Sync Master Info','FromDual.MySQL.master.sync_master_info',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24196,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Aborted_clients','FromDual.MySQL.mysql.Aborted_clients',30,30,365,0,3,'','',0,2,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24197,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Aborted_connects','FromDual.MySQL.mysql.Aborted_connects',30,30,365,0,3,'','',0,2,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24198,2,'','',10134,'Access_denied_errors','FromDual.MySQL.mysql.Access_denied_errors',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24199,2,'','',10134,'MySQL is alive','FromDual.MySQL.mysql.alive',30,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24200,2,'','',10134,'Binlog_bytes_written','FromDual.MySQL.mysql.Binlog_bytes_written',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24201,2,'','',10134,'Binlog Trx Cache Disk Writes','FromDual.MySQL.mysql.Binlog_cache_disk_use',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24202,2,'','',10134,'Binlog Trx Cache Writes','FromDual.MySQL.mysql.Binlog_cache_use',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24203,2,'','',10134,'Binlog Statement Cache Disk Writes','FromDual.MySQL.mysql.Binlog_stmt_cache_disk_use',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24204,2,'','',10134,'Binlog Statement Cache Writes','FromDual.MySQL.mysql.Binlog_stmt_cache_use',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24205,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Bytes_received','FromDual.MySQL.mysql.Bytes_received',30,30,365,0,3,'','byte/s',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24206,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Bytes_sent','FromDual.MySQL.mysql.Bytes_sent',30,30,365,0,3,'','byte/s',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24207,2,'','',10134,'Character Set of Server','FromDual.MySQL.mysql.character_set_server',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24208,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Com_call_proc','FromDual.MySQL.mysql.Com_call_proc',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24209,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Com_delete','FromDual.MySQL.mysql.Com_delete',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24210,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Com_delete_multi','FromDual.MySQL.mysql.Com_delete_multi',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24211,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Com_insert','FromDual.MySQL.mysql.Com_insert',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24212,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Com_insert_select','FromDual.MySQL.mysql.Com_insert_select',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24213,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Com_replace','FromDual.MySQL.mysql.Com_replace',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24214,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Com_replace_select','FromDual.MySQL.mysql.Com_replace_select',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24215,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Com_select','FromDual.MySQL.mysql.Com_select',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24216,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Com_update','FromDual.MySQL.mysql.Com_update',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24217,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Com_update_multi','FromDual.MySQL.mysql.Com_update_multi',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24218,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Connections','FromDual.MySQL.mysql.Connections',30,30,365,0,3,'','',0,2,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24219,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Created_tmp_disk_tables','FromDual.MySQL.mysql.Created_tmp_disk_tables',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24220,2,'','',10134,'Created_tmp_files','FromDual.MySQL.mysql.Created_tmp_files',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24221,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Created_tmp_tables','FromDual.MySQL.mysql.Created_tmp_tables',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24222,2,'','',10134,'Datadir','FromDual.MySQL.mysql.datadir',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24223,2,'','',10134,'Default Storage Engine','FromDual.MySQL.mysql.default_storage_engine',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24224,2,'','',10134,'Event Scheduler','FromDual.MySQL.mysql.event_scheduler',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24225,2,'','',10134,'Foreign Key Checks','FromDual.MySQL.mysql.foreign_key_checks',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24226,2,'','',10134,'General Log','FromDual.MySQL.mysql.general_log',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24227,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Handler_delete','FromDual.MySQL.mysql.Handler_delete',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24228,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Handler_read_first','FromDual.MySQL.mysql.Handler_read_first',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24229,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Handler_read_key','FromDual.MySQL.mysql.Handler_read_key',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24230,2,'','',10134,'Handler_read_last','FromDual.MySQL.mysql.Handler_read_last',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24231,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Handler_read_next','FromDual.MySQL.mysql.Handler_read_next',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24232,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Handler_read_prev','FromDual.MySQL.mysql.Handler_read_prev',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24233,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Handler_read_rnd','FromDual.MySQL.mysql.Handler_read_rnd',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24234,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Handler_read_rnd_next','FromDual.MySQL.mysql.Handler_read_rnd_next',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24235,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Handler_update','FromDual.MySQL.mysql.Handler_update',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24236,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Handler_write','FromDual.MySQL.mysql.Handler_write',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24237,2,'','',10134,'Log Output','FromDual.MySQL.mysql.log_output',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24238,2,'','',10134,'Log Queries not using Indexes','FromDual.MySQL.mysql.log_queries_not_using_indexes',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24239,2,'','',10134,'Log Slave Updates','FromDual.MySQL.mysql.log_slave_updates',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24240,2,'','',10134,'Log Warnings','FromDual.MySQL.mysql.log_warnings',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24241,2,'','',10134,'Long Query Time','FromDual.MySQL.mysql.long_query_time',60,30,365,0,0,'','s',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24242,2,'','',10134,'Max. allowed packet size','FromDual.MySQL.mysql.max_allowed_packet',60,30,365,0,3,'','byte',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24243,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Max. Connections','FromDual.MySQL.mysql.max_connections',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24244,2,'','',10134,'Max. Heap Table size','FromDual.MySQL.mysql.max_heap_table_size',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24245,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Max. used Connections','FromDual.MySQL.mysql.Max_used_connections',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24246,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Max. User Connections','FromDual.MySQL.mysql.max_user_connections',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24247,2,'','',10134,'MySQL version (machine readable)','FromDual.MySQL.mysql.mr_version',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24248,2,'','',10134,'Opened_files','FromDual.MySQL.mysql.Opened_files',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24249,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Opened_tables','FromDual.MySQL.mysql.Opened_tables',30,30,365,0,3,'','',0,2,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24250,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Opened_table_definitions','FromDual.MySQL.mysql.Opened_table_definitions',30,30,365,0,3,'','',0,2,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24251,2,'','',10134,'Open files','FromDual.MySQL.mysql.Open_files',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24252,2,'','',10134,'Open files limit','FromDual.MySQL.mysql.open_files_limit',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24253,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Open_tables','FromDual.MySQL.mysql.Open_tables',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24254,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Open_table_definitions','FromDual.MySQL.mysql.Open_table_definitions',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24255,2,'','',10134,'Query Cache blk / Query','FromDual.MySQL.mysql.Qcache_block_per_query',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24256,2,'','',10134,'Query Cache byte / block','FromDual.MySQL.mysql.Qcache_byte_per_block',60,30,365,0,3,'','byte/blk',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24257,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Query Cache free Blocks','FromDual.MySQL.mysql.Qcache_free_blocks',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24258,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Query Cache free Memory','FromDual.MySQL.mysql.Qcache_free_memory',30,30,365,0,3,'','byte',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24259,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Query Cache Hits','FromDual.MySQL.mysql.Qcache_hits',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24260,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Query Cache Inserts','FromDual.MySQL.mysql.Qcache_inserts',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24261,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Query Cache low Memory prunes','FromDual.MySQL.mysql.Qcache_lowmem_prunes',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24262,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Query Cache not cached','FromDual.MySQL.mysql.Qcache_not_cached',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24263,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Query Cache Queries in Cache','FromDual.MySQL.mysql.Qcache_queries_in_cache',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24264,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Query Cache total blocks','FromDual.MySQL.mysql.Qcache_total_blocks',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24265,2,'','',10134,'Query Cache used Blocks','FromDual.MySQL.mysql.Qcache_used_blocks',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24266,2,'','',10134,'Query Cache used Memory','FromDual.MySQL.mysql.Qcache_used_memory',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24267,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Queries','FromDual.MySQL.mysql.Queries',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24268,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Query Cache size','FromDual.MySQL.mysql.query_cache_size',30,30,365,0,3,'','byte',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24269,2,'','',10134,'Query Cache Type','FromDual.MySQL.mysql.query_cache_type',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24270,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Questions','FromDual.MySQL.mysql.Questions',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24271,2,'','',10134,'Read buffer size','FromDual.MySQL.mysql.read_buffer_size',60,30,365,0,3,'','byte',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24272,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Select_full_join','FromDual.MySQL.mysql.Select_full_join',30,30,365,0,3,'','',0,2,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24273,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Select_full_range_join','FromDual.MySQL.mysql.Select_full_range_join',30,30,365,0,3,'','',0,2,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24274,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Select_range_check','FromDual.MySQL.mysql.Select_range_check',30,30,365,0,3,'','',0,2,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24275,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Select_scan','FromDual.MySQL.mysql.Select_scan',30,30,365,0,3,'','',0,2,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24276,2,'','',10134,'Skip networking','FromDual.MySQL.mysql.skip_networking',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24277,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Slow_queries','FromDual.MySQL.mysql.Slow_queries',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24278,2,'','',10134,'Slow Query Log','FromDual.MySQL.mysql.slow_query_log',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24279,2,'','',10134,'Sort Buffer Size','FromDual.MySQL.mysql.sort_buffer_size',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24280,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Sort_merge_passes','FromDual.MySQL.mysql.Sort_merge_passes',30,30,365,0,3,'','',0,2,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24281,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Sort_range','FromDual.MySQL.mysql.Sort_range',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24282,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Sort_rows','FromDual.MySQL.mysql.Sort_rows',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24283,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Sort_scan','FromDual.MySQL.mysql.Sort_scan',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24284,2,'','',10134,'SQL Mode','FromDual.MySQL.mysql.sql_mode',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24285,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Table Cache','FromDual.MySQL.mysql.table_cache',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24286,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Table Definition Cache','FromDual.MySQL.mysql.table_definition_cache',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24287,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Table_locks_immediate','FromDual.MySQL.mysql.Table_locks_immediate',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24288,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Table_locks_waited','FromDual.MySQL.mysql.Table_locks_waited',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24289,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Table Open Cache','FromDual.MySQL.mysql.table_open_cache',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24290,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Threads cached','FromDual.MySQL.mysql.Threads_cached',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24291,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Threads connected','FromDual.MySQL.mysql.Threads_connected',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24292,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Threads created','FromDual.MySQL.mysql.Threads_created',30,30,365,0,3,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24293,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10134,'Threads running','FromDual.MySQL.mysql.Threads_running',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24294,2,'','',10134,'Thread Cache size','FromDual.MySQL.mysql.thread_cache_size',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24295,2,'','',10134,'Thread Stack size','FromDual.MySQL.mysql.thread_stack',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24296,2,'','',10134,'Temporary Table size','FromDual.MySQL.mysql.tmp_table_size',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24297,2,'','',10134,'Transaction isolation level','FromDual.MySQL.mysql.tx_isolation',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24298,2,'','',10134,'MySQL uptime','FromDual.MySQL.mysql.Uptime',60,30,365,0,3,'','uptime',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24299,2,'','',10134,'MySQL version','FromDual.MySQL.mysql.version',600,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24300,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'block_io_delays','FromDual.MySQL.process.block_io_delays',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24301,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'Check process','FromDual.MySQL.process.check',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24302,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'children_guest_time','FromDual.MySQL.process.children_guest_time',30,30,365,0,3,'','tick',0,2,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24303,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'children_major_faults','FromDual.MySQL.process.children_major_faults',30,30,365,0,3,'','fault/s',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24304,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'children_minor_faults','FromDual.MySQL.process.children_minor_faults',30,30,365,0,3,'','fault/s',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24305,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'children_system_time','FromDual.MySQL.process.children_system_time',30,30,365,0,3,'','tick',0,2,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24306,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'children_user_time','FromDual.MySQL.process.children_user_time',30,30,365,0,3,'','tick',0,2,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24307,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'FD Size','FromDual.MySQL.process.FDSize',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24308,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'guest_time','FromDual.MySQL.process.guest_time',30,30,365,0,3,'','tick',0,2,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24309,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'last_cpu_number','FromDual.MySQL.process.last_cpu_number',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24310,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'major_faults','FromDual.MySQL.process.major_faults',30,30,365,0,3,'','fault/s',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24311,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'minor_faults','FromDual.MySQL.process.minor_faults',30,30,365,0,3,'','fault/s',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24312,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'nice_value','FromDual.MySQL.process.nice_value',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24313,2,'','',10135,'Nonvoluntary Context Switches','FromDual.MySQL.process.nonvoluntary_ctxt_switches',60,30,90,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24314,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'Number of file descriptors','FromDual.MySQL.process.number_of_file_descriptors',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24315,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'Number of Threads','FromDual.MySQL.process.number_of_threads',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24316,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'resident_memory_size','FromDual.MySQL.process.resident_memory_size',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24317,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'rt_priority','FromDual.MySQL.process.rt_priority',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24318,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'scheduling_policy','FromDual.MySQL.process.scheduling_policy',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24319,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'scheduling_priortiy','FromDual.MySQL.process.scheduling_priortiy',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24320,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'system_time','FromDual.MySQL.process.system_time',30,30,365,0,3,'','tick',0,2,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24321,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'Threads','FromDual.MySQL.process.Threads',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24322,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'user_time','FromDual.MySQL.process.user_time',30,30,365,0,3,'','tick',0,2,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24323,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'virtual_memory_size','FromDual.MySQL.process.virtual_memory_size',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24324,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'Resident Memory Peak (HWM)','FromDual.MySQL.process.VmHWM',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24325,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'Virtual Memory Peak (HWM)','FromDual.MySQL.process.VmPeak',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24326,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'Resident Memory (RSS)','FromDual.MySQL.process.VmRSS',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24327,2,'public','interfaces.ifTable.ifEntry.ifInOctets.1',10135,'Virtual Memory Size (VSZ)','FromDual.MySQL.process.VmSize',30,30,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24328,2,'','',10135,'Physical RAM','FromDual.MySQL.process.vm_memory_total_kb',60,30,365,0,3,'','byte',1,0,'',0,'','','1024','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24329,2,'','',10135,'Voluntary Context Switches','FromDual.MySQL.process.voluntary_ctxt_switches',60,30,90,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24330,2,'','',10136,'Empty user','FromDual.MySQL.security.empty_user',0,90,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24331,2,'','',10136,'Local Infile','FromDual.MySQL.security.local_infile',0,90,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24332,2,'','',10136,'Old Passwords','FromDual.MySQL.security.old_passwords',0,90,0,0,4,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24333,2,'','',10136,'Root from remote','FromDual.MySQL.security.root_from_remote',0,90,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24334,2,'','',10136,'External Lockin','FromDual.MySQL.security.skip_external_locking',0,90,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24335,2,'','',10136,'Test database','FromDual.MySQL.security.test_database',0,90,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24336,2,'','',10136,'User with CREATE USER privilege','FromDual.MySQL.security.user_with_create_user_privilege',0,90,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24337,2,'','',10136,'User with GRANT privilege','FromDual.MySQL.security.user_with_grant_privilege',0,90,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24338,2,'','',10136,'User with SUPER privilege','FromDual.MySQL.security.user_with_super_privilege',0,90,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24339,2,'','',10137,'Number of cores','FromDual.MySQL.server.cpu.count',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24340,2,'','',10137,'Cores available','FromDual.MySQL.server.cpu.cpus',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24341,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[0,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24342,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[0,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24343,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[0,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24344,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[0,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24345,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[0,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24346,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[0,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24347,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[0,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24348,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[0,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24349,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[0,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24350,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[1,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24351,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[1,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24352,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[1,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24353,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[1,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24354,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[1,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24355,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[1,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24356,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[1,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24357,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[1,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24358,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[1,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24359,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[2,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24360,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[2,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24361,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[2,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24362,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[2,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24363,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[2,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24364,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[2,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24365,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[2,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24366,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[2,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24367,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[2,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24368,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[3,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24369,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[3,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24370,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[3,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24371,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[3,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24372,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[3,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24373,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[3,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24374,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[3,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24375,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[3,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24376,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[3,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24377,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[4,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24378,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[4,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24379,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[4,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24380,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[4,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24381,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[4,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24382,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[4,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24383,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[4,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24384,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[4,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24385,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[4,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24386,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[5,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24387,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[5,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24388,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[5,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24389,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[5,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24390,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[5,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24391,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[5,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24392,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[5,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24393,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[5,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24394,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[5,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24395,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[6,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24396,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[6,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24397,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[6,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24398,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[6,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24399,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[6,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24400,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[6,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24401,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[6,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24402,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[6,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24403,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[6,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24404,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[7,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24405,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[7,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24406,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[7,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24407,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[7,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24408,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[7,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24409,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[7,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24410,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[7,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24411,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[7,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24412,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[7,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24413,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[8,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24414,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[8,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24415,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[8,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24416,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[8,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24417,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[8,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24418,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[8,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24419,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[8,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24420,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[8,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24421,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[8,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24422,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[9,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24423,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[9,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24424,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[9,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24425,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[9,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24426,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[9,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24427,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[9,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24428,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[9,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24429,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[9,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24430,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[9,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24431,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[10,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24432,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[10,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24433,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[10,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24434,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[10,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24435,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[10,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24436,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[10,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24437,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[10,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24438,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[10,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24439,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[10,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24440,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[11,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24441,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[11,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24442,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[11,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24443,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[11,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24444,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[11,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24445,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[11,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24446,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[11,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24447,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[11,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24448,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[11,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24449,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[12,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24450,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[12,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24451,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[12,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24452,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[12,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24453,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[12,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24454,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[12,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24455,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[12,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24456,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[12,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24457,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[12,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24458,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[13,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24459,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[13,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24460,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[13,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24461,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[13,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24462,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[13,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24463,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[13,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24464,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[13,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24465,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[13,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24466,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[13,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24467,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[14,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24468,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[14,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24469,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[14,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24470,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[14,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24471,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[14,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24472,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[14,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24473,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[14,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24474,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[14,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24475,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[14,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24476,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[15,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24477,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[15,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24478,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[15,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24479,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[15,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24480,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[15,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24481,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[15,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24482,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[15,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24483,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[15,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24484,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[15,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24485,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[16,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24486,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[16,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24487,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[16,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24488,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[16,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24489,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[16,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24490,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[16,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24491,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[16,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24492,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[16,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24493,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[16,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24494,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[17,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24495,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[17,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24496,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[17,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24497,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[17,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24498,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[17,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24499,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[17,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24500,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[17,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24501,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[17,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24502,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[17,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24503,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[18,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24504,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[18,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24505,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[18,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24506,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[18,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24507,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[18,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24508,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[18,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24509,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[18,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24510,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[18,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24511,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[18,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24512,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[19,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24513,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[19,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24514,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[19,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24515,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[19,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24516,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[19,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24517,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[19,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24518,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[19,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24519,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[19,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24520,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[19,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24521,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[20,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24522,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[20,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24523,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[20,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24524,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[20,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24525,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[20,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24526,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[20,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24527,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[20,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24528,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[20,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24529,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[20,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24530,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[21,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24531,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[21,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24532,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[21,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24533,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[21,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24534,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[21,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24535,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[21,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24536,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[21,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24537,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[21,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24538,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[21,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24539,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[22,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24540,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[22,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24541,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[22,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24542,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[22,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24543,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[22,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24544,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[22,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24545,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[22,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24546,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[22,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24547,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[22,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24548,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[23,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24549,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[23,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24550,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[23,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24551,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[23,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24552,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[23,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24553,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[23,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24554,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[23,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24555,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[23,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24556,2,'','',10137,'CPU $2 time of core $1','FromDual.MySQL.server.cpu[23,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24557,2,'','',10137,'CPU $2 time $1','FromDual.MySQL.server.cpu[total,guest]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24558,2,'','',10137,'CPU $2 time $1','FromDual.MySQL.server.cpu[total,idle]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24559,2,'','',10137,'CPU $2 time $1','FromDual.MySQL.server.cpu[total,iowait]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24560,2,'','',10137,'CPU $2 time $1','FromDual.MySQL.server.cpu[total,irq]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24561,2,'','',10137,'CPU $2 time $1','FromDual.MySQL.server.cpu[total,nice]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24562,2,'','',10137,'CPU $2 time $1','FromDual.MySQL.server.cpu[total,soft]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24563,2,'','',10137,'CPU $2 time $1','FromDual.MySQL.server.cpu[total,steal]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24564,2,'','',10137,'CPU $2 time $1','FromDual.MySQL.server.cpu[total,system]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24565,2,'','',10137,'CPU $2 time $1','FromDual.MySQL.server.cpu[total,user]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24566,2,'','',10137,'Context switches','FromDual.MySQL.server.cpu_ctxt',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24567,2,'','',10137,'Interrupts','FromDual.MySQL.server.cpu_intr',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24568,2,'','',10137,'Forks','FromDual.MySQL.server.cpu_proc',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24569,2,'','',10137,'Process blocked waiting for I/O','FromDual.MySQL.server.cpu_proc_b',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24570,2,'','',10137,'Processes running','FromDual.MySQL.server.cpu_proc_r',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24571,15,'','',10137,'Average IO read wait on $1','FromDual.MySQL.server.disk.avg_io_read_wait[sda]',10,30,365,0,0,'','s',1,0,'',0,'','','0.001','',0,'',NULL,NULL,'','last(FromDual.MySQL.server.disk.ms_spent_reading[sda])\r\n/\r\n(\r\nlast(FromDual.MySQL.server.disk.reads_completed[sda])\r\n+ count(FromDual.MySQL.server.disk.reads_completed[sda],#1,0)\r\n)','',0,0,'','','','',0,0,NULL,'','Experimental because they are differing from iostat values.',0,'30',0,0,0,'',0),(24572,15,'','',10137,'Average IO read wait on $1','FromDual.MySQL.server.disk.avg_io_read_wait[sdb]',10,30,365,0,0,'','s',1,0,'',0,'','','0.001','',0,'',NULL,NULL,'','last(FromDual.MySQL.server.disk.ms_spent_reading[sdb])\r\n/\r\n(\r\nlast(FromDual.MySQL.server.disk.reads_completed[sdb])\r\n+ count(FromDual.MySQL.server.disk.reads_completed[sdb],#1,0)\r\n)','',0,0,'','','','',0,0,NULL,'','Experimental because they are differing from iostat values.',0,'30',0,0,0,'',0),(24573,15,'','',10137,'Average IO write wait on $1','FromDual.MySQL.server.disk.avg_io_write_wait[sda]',10,30,365,0,0,'','s',1,0,'',0,'','','0.001','',0,'',NULL,NULL,'','last(FromDual.MySQL.server.disk.ms_spent_writing[sda])\r\n/\r\n(\r\nlast(FromDual.MySQL.server.disk.writes_completed[sda])\r\n+ count(FromDual.MySQL.server.disk.writes_completed[sda],#1,0)\r\n)','',0,0,'','','','',0,0,NULL,'','Experimental because they are differing from iostat values.',0,'30',0,0,0,'',0),(24574,15,'','',10137,'Average IO write wait on $1','FromDual.MySQL.server.disk.avg_io_write_wait[sdb]',10,30,365,0,0,'','s',1,0,'',0,'','','0.001','',0,'',NULL,NULL,'','last(FromDual.MySQL.server.disk.ms_spent_writing[sdb])\r\n/\r\n(\r\nlast(FromDual.MySQL.server.disk.writes_completed[sdb])\r\n+ count(FromDual.MySQL.server.disk.writes_completed[sdb],#1,0)\r\n)','',0,0,'','','','',0,0,NULL,'','Experimental because they are differing from iostat values.',0,'30',0,0,0,'',0),(24575,2,'','',10137,'Devices','FromDual.MySQL.server.disk.devices',600,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24576,2,'','',10137,'I/O in progress on $1','FromDual.MySQL.server.disk.io_in_progress[sda1]',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24577,2,'','',10137,'I/O in progress on $1','FromDual.MySQL.server.disk.io_in_progress[sda]',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24578,2,'','',10137,'I/O in progress on $1','FromDual.MySQL.server.disk.io_in_progress[sdb1]',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24579,2,'','',10137,'I/O in progress on $1','FromDual.MySQL.server.disk.io_in_progress[sdb]',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24580,2,'','',10137,'ms spent doing I/O on $1','FromDual.MySQL.server.disk.ms_spent_doing_io[sda1]',60,30,365,0,3,'','ms',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24581,2,'','',10137,'ms spent doing I/O on $1','FromDual.MySQL.server.disk.ms_spent_doing_io[sda]',60,30,365,0,3,'','ms',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24582,2,'','',10137,'ms spent doing I/O on $1','FromDual.MySQL.server.disk.ms_spent_doing_io[sdb1]',60,30,365,0,3,'','ms',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24583,2,'','',10137,'ms spent doing I/O on $1','FromDual.MySQL.server.disk.ms_spent_doing_io[sdb]',60,30,365,0,3,'','ms',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24584,2,'','',10137,'ms spent reading on $1','FromDual.MySQL.server.disk.ms_spent_reading[sda1]',60,30,365,0,3,'','ms',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24585,2,'','',10137,'ms spent reading on $1','FromDual.MySQL.server.disk.ms_spent_reading[sda]',60,30,365,0,3,'','ms',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24586,2,'','',10137,'ms spent reading on $1','FromDual.MySQL.server.disk.ms_spent_reading[sdb1]',60,30,365,0,3,'','ms',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24587,2,'','',10137,'ms spent reading on $1','FromDual.MySQL.server.disk.ms_spent_reading[sdb]',60,30,365,0,3,'','ms',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24588,2,'','',10137,'ms spent writing on $1','FromDual.MySQL.server.disk.ms_spent_writing[sda1]',60,30,365,0,3,'','ms',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24589,2,'','',10137,'ms spent writing on $1','FromDual.MySQL.server.disk.ms_spent_writing[sda]',60,30,365,0,3,'','ms',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24590,2,'','',10137,'ms spent writing on $1','FromDual.MySQL.server.disk.ms_spent_writing[sdb1]',60,30,365,0,3,'','ms',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24591,2,'','',10137,'ms spent writing on $1','FromDual.MySQL.server.disk.ms_spent_writing[sdb]',60,30,365,0,3,'','ms',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24592,2,'','',10137,'Reads on $1','FromDual.MySQL.server.disk.reads_completed[sda1]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24593,2,'','',10137,'Reads on $1','FromDual.MySQL.server.disk.reads_completed[sda]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24594,2,'','',10137,'Reads on $1','FromDual.MySQL.server.disk.reads_completed[sdb1]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24595,2,'','',10137,'Reads on $1','FromDual.MySQL.server.disk.reads_completed[sdb]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24596,2,'','',10137,'Merged reads on $1','FromDual.MySQL.server.disk.reads_merged[sda1]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24597,2,'','',10137,'Merged reads on $1','FromDual.MySQL.server.disk.reads_merged[sda]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24598,2,'','',10137,'Merged reads on $1','FromDual.MySQL.server.disk.reads_merged[sdb1]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24599,2,'','',10137,'Merged reads on $1','FromDual.MySQL.server.disk.reads_merged[sdb]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24600,2,'','',10137,'Sectors read on $1','FromDual.MySQL.server.disk.sectors_read[sda1]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24601,2,'','',10137,'Sectors read on $1','FromDual.MySQL.server.disk.sectors_read[sda]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24602,2,'','',10137,'Sectors read on $1','FromDual.MySQL.server.disk.sectors_read[sdb1]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24603,2,'','',10137,'Sectors read on $1','FromDual.MySQL.server.disk.sectors_read[sdb]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24604,2,'','',10137,'Sectors written on $1','FromDual.MySQL.server.disk.sectors_written[sda1]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24605,2,'','',10137,'Sectors written on $1','FromDual.MySQL.server.disk.sectors_written[sda]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24606,2,'','',10137,'Sectors written on $1','FromDual.MySQL.server.disk.sectors_written[sdb1]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24607,2,'','',10137,'Sectors written on $1','FromDual.MySQL.server.disk.sectors_written[sdb]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24608,2,'','',10137,'Wighted number of ms spent doing I/O on $1','FromDual.MySQL.server.disk.wighted_nbr_ms_spent_doing_io[sda1]',60,30,365,0,3,'','ms',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24609,2,'','',10137,'Wighted number of ms spent doing I/O on $1','FromDual.MySQL.server.disk.wighted_nbr_ms_spent_doing_io[sda]',60,30,365,0,3,'','ms',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24610,2,'','',10137,'Wighted number of ms spent doing I/O on $1','FromDual.MySQL.server.disk.wighted_nbr_ms_spent_doing_io[sdb1]',60,30,365,0,3,'','ms',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24611,2,'','',10137,'Wighted number of ms spent doing I/O on $1','FromDual.MySQL.server.disk.wighted_nbr_ms_spent_doing_io[sdb]',60,30,365,0,3,'','ms',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24612,2,'','',10137,'Writes on $1','FromDual.MySQL.server.disk.writes_completed[sda1]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24613,2,'','',10137,'Writes on $1','FromDual.MySQL.server.disk.writes_completed[sda]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24614,2,'','',10137,'Writes on $1','FromDual.MySQL.server.disk.writes_completed[sdb1]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24615,2,'','',10137,'Writes on $1','FromDual.MySQL.server.disk.writes_completed[sdb]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24616,2,'','',10137,'Merged writes on $1','FromDual.MySQL.server.disk.writes_merged[sda1]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24617,2,'','',10137,'Merged writes on $1','FromDual.MySQL.server.disk.writes_merged[sda]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24618,2,'','',10137,'Merged writes on $1','FromDual.MySQL.server.disk.writes_merged[sdb1]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24619,2,'','',10137,'Merged writes on $1','FromDual.MySQL.server.disk.writes_merged[sdb]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24620,2,'','',10137,'Disk space free on $1','FromDual.MySQL.server.disk_space[/,free]',60,30,365,0,3,'','byte',1,0,'',0,'','','1024','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24621,2,'','',10137,'Disk space % free on $1','FromDual.MySQL.server.disk_space[/,pfree]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24622,2,'','',10137,'Disk space % used on $1','FromDual.MySQL.server.disk_space[/,pused]',60,30,365,0,0,'','%',0,0,'',0,'','','1024','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24623,2,'','',10137,'Disk space total on $1','FromDual.MySQL.server.disk_space[/,total]',60,30,365,0,3,'','byte',1,0,'',0,'','','1024','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24624,2,'','',10137,'Disk space used on $1','FromDual.MySQL.server.disk_space[/,used]',60,30,365,0,3,'','byte',1,0,'',0,'','','1024','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24625,2,'','',10137,'Disk space free on $1','FromDual.MySQL.server.disk_space[/var/lib/mysql,free]',60,30,365,0,3,'','byte',1,0,'',0,'','','1024','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24626,2,'','',10137,'Disk space % free on $1','FromDual.MySQL.server.disk_space[/var/lib/mysql,pfree]',60,30,365,0,0,'','%',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24627,2,'','',10137,'Disk space % used on $1','FromDual.MySQL.server.disk_space[/var/lib/mysql,pused]',60,30,365,0,0,'','%',0,0,'',0,'','','1024','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24628,2,'','',10137,'Disk space total on $1','FromDual.MySQL.server.disk_space[/var/lib/mysql,total]',60,30,365,0,3,'','byte',1,0,'',0,'','','1024','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24629,2,'','',10137,'Disk space used on $1','FromDual.MySQL.server.disk_space[/var/lib/mysql,used]',60,30,365,0,3,'','byte',1,0,'',0,'','','1024','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24630,2,'','',10137,'Incoming traffic on interface $1 (bytes)','FromDual.MySQL.server.network[eth0,bytes_rx]',5,30,365,0,3,'','byte',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24631,2,'','',10137,'Outgoing traffic on interface $1 (bytes)','FromDual.MySQL.server.network[eth0,bytes_tx]',5,30,365,0,3,'','byte',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24632,2,'','',10137,'Incoming dropped packages on interface $1','FromDual.MySQL.server.network[eth0,drop_rx]',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24633,2,'','',10137,'Outgoing dropped packages on interface $1','FromDual.MySQL.server.network[eth0,drop_tx]',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24634,2,'','',10137,'Incoming erronous packages on interface $1','FromDual.MySQL.server.network[eth0,err_rx]',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24635,2,'','',10137,'Outgoing erronous packages on interface $1','FromDual.MySQL.server.network[eth0,err_tx]',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24636,2,'','',10137,'Incoming traffic on interface $1 (packets)','FromDual.MySQL.server.network[eth0,pckts_rx]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24637,2,'','',10137,'Outgoing traffic on interface $1 (packets)','FromDual.MySQL.server.network[eth0,pckts_tx]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24638,2,'','',10137,'Incoming traffic on interface $1 (bytes)','FromDual.MySQL.server.network[eth1,bytes_rx]',5,30,365,0,3,'','byte',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24639,2,'','',10137,'Outgoing traffic on interface $1 (bytes)','FromDual.MySQL.server.network[eth1,bytes_tx]',5,30,365,0,3,'','byte',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24640,2,'','',10137,'Incoming dropped packages on interface $1','FromDual.MySQL.server.network[eth1,drop_rx]',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24641,2,'','',10137,'Outgoing dropped packages on interface $1','FromDual.MySQL.server.network[eth1,drop_tx]',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24642,2,'','',10137,'Incoming erronous packages on interface $1','FromDual.MySQL.server.network[eth1,err_rx]',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24643,2,'','',10137,'Outgoing erronous packages on interface $1','FromDual.MySQL.server.network[eth1,err_tx]',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24644,2,'','',10137,'Incoming traffic on interface $1 (packets)','FromDual.MySQL.server.network[eth1,pckts_rx]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24645,2,'','',10137,'Outgoing traffic on interface $1 (packets)','FromDual.MySQL.server.network[eth1,pckts_tx]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24646,2,'','',10137,'Incoming traffic on interface $1 (bytes)','FromDual.MySQL.server.network[lo,bytes_rx]',60,30,365,0,3,'','byte',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24647,2,'','',10137,'Outgoing traffic on interface $1 (bytes)','FromDual.MySQL.server.network[lo,bytes_tx]',60,30,365,0,3,'','byte',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24648,2,'','',10137,'Incoming dropped packages on interface $1','FromDual.MySQL.server.network[lo,drop_rx]',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24649,2,'','',10137,'Outgoing dropped packages on interface $1','FromDual.MySQL.server.network[lo,drop_tx]',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24650,2,'','',10137,'Incoming erronous packages on interface $1','FromDual.MySQL.server.network[lo,err_rx]',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24651,2,'','',10137,'Outgoing erronous packages on interface $1','FromDual.MySQL.server.network[lo,err_tx]',60,30,365,0,3,'','',0,2,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24652,2,'','',10137,'Incoming traffic on interface $1 (packets)','FromDual.MySQL.server.network[lo,pckts_rx]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24653,2,'','',10137,'Outgoing traffic on interface $1 (packets)','FromDual.MySQL.server.network[lo,pckts_tx]',60,30,365,0,3,'','',0,1,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24654,2,'','',10137,'NUMA Info','FromDual.MySQL.server.numa',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24655,2,'','',10137,'Virtualization','FromDual.MySQL.server.virtualization',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24656,2,'','',10137,'Buffers memory','FromDual.MySQL.server.vm_memory_buffers_kb',30,30,365,0,3,'','byte',1,0,'',0,'','','1024','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24657,2,'','',10137,'Cached memory','FromDual.MySQL.server.vm_memory_cached_kb',30,30,365,0,3,'','byte',1,0,'',0,'','','1024','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24658,2,'','',10137,'Free memory','FromDual.MySQL.server.vm_memory_free_kb',60,30,365,0,3,'','byte',1,0,'',0,'','','1024','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24659,2,'','',10137,'Total memory','FromDual.MySQL.server.vm_memory_total_kb',1800,30,365,0,3,'','byte',1,0,'',0,'','','1024','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24660,2,'','',10137,'Used memory','FromDual.MySQL.server.vm_memory_used_kb',30,30,365,0,3,'','byte',1,0,'',0,'','','1024','',0,'',NULL,NULL,'','last(\"vm.memory.size[total]\")-(last(\"vm.memory.size[buffers]\")+last(\"vm.memory.size[cached]\")+last(\"vm.memory.size[free]\")+last(\"vm.memory.size[shared]\"))','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24661,2,'','',10137,'Free swap space','FromDual.MySQL.server.vm_swap_free_kb',30,30,365,0,3,'','byte',1,0,'',0,'','','1024','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24662,2,'','',10137,'Total swap space','FromDual.MySQL.server.vm_swap_total_kb',1800,30,365,0,3,'','byte',1,0,'',0,'','','1024','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24663,2,'','',10137,'Used swap space','FromDual.MySQL.server.vm_swap_used_kb',30,30,365,0,3,'','byte',1,0,'',0,'','','1024','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24664,2,'','',10138,'SQL thread execute position','FromDual.MySQL.slave.Exec_Master_Log_Pos',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24665,2,'','',10138,'Slave Last Error','FromDual.MySQL.slave.Last_Error',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24666,2,'','',10138,'Slave Last IO Error','FromDual.MySQL.slave.Last_IO_Error',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24667,2,'','',10138,'Slave Last SQL Error','FromDual.MySQL.slave.Last_SQL_Error',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24668,2,'','',10138,'IO thread read position','FromDual.MySQL.slave.Read_Master_Log_Pos',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24669,2,'','',10138,'Slave is Read Only','FromDual.MySQL.slave.read_only',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24670,2,'','',10138,'IO thread write position','FromDual.MySQL.slave.Relay_Log_Pos',60,30,365,0,3,'','byte',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24671,2,'','',10138,'Slave behind Master','FromDual.MySQL.slave.Seconds_Behind_Master',60,30,365,0,3,'','s',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24672,2,'','',10138,'Slave IO thread running','FromDual.MySQL.slave.Slave_IO_Running',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24673,2,'','',10138,'Slave Errors are skipped','FromDual.MySQL.slave.slave_skip_errors',60,30,0,0,1,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24674,2,'','',10138,'Slave SQL thread running','FromDual.MySQL.slave.Slave_SQL_Running',30,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24675,2,'','',10138,'Sync Relay Log','FromDual.MySQL.slave.sync_relay_log',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24676,2,'','',10138,'Sync Relay Log Info','FromDual.MySQL.slave.sync_relay_log_info',60,30,365,0,3,'','',0,0,'',0,'','','0','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24677,0,'','',10119,'IO_discover','io.scandisk',60,90,0,0,4,'','',0,0,'',0,'','','','',0,'',NULL,NULL,'','','',0,0,'','','','',0,1,NULL,'','',0,'30',0,0,0,'',0),(24678,0,'','',10127,'Network interface discovery','net.if.discovery',60,90,0,0,4,'','',0,0,'',0,'','','','',0,'',NULL,NULL,'','','',0,0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30',0,0,0,'',1),(24679,0,'','',10127,'Mounted filesystem discovery','vfs.fs.discovery',3600,90,0,0,4,'','',0,0,'',0,'','','','',0,'',NULL,NULL,'','','',0,0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30',0,0,0,'',0),(24680,0,'','',10128,'Network interface discovery','net.if.discovery',3600,90,0,0,4,'','',0,0,'',0,'','','','',0,'',NULL,NULL,'','','',0,0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30',0,0,0,'',0),(24681,0,'','',10128,'Mounted filesystem discovery','vfs.fs.discovery',3600,90,0,0,4,'','',0,0,'',0,'','','','',0,'',NULL,NULL,'','','',0,0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30',0,0,0,'',0),(24682,0,'','',10119,'IO_avgqu-sz on $1','io.avgqu-sz[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24683,0,'','',10119,'IO_avgrq-sz on $1','io.avgrq-sz[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24684,0,'','',10119,'IO_await on $1','io.await[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24685,0,'','',10119,'IO_rMBps on $1','io.rMBps[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24686,0,'','',10119,'IO_rps on $1','io.rps[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24687,0,'','',10119,'IO_svctm on $1','io.svctm[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24688,0,'','',10119,'IO_util on $1','io.util[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24689,0,'','',10119,'IO_wMBps on $1','io.wMBps[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24690,0,'','',10119,'IO_wps on $1','io.wps[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24691,0,'','',10127,'Incoming network traffic on $1','net.if.in[{#IFNAME}]',40,180,365,0,3,'','bps',1,1,'',0,'','','8','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24692,0,'','',10127,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]',50,180,365,0,3,'','bps',1,1,'',0,'','','8','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24693,0,'','',10127,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24694,0,'','',10127,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]',60,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24695,0,'','',10127,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24696,0,'','',10127,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]',3600,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24697,0,'','',10127,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]',60,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24698,0,'','',10128,'Incoming network traffic on $1','net.if.in[{#IFNAME}]',60,180,365,0,3,'','bps',1,1,'',0,'','','8','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24699,0,'','',10128,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]',60,180,365,0,3,'','bps',1,1,'',0,'','','8','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24700,0,'','',10128,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]',60,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24701,0,'','',10128,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24702,0,'','',10128,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]',3600,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24703,0,'','',10128,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]',60,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_applications`
--

DROP TABLE IF EXISTS `items_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_applications` (
  `itemappid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`itemappid`),
  UNIQUE KEY `items_applications_1` (`applicationid`,`itemid`),
  KEY `items_applications_2` (`itemid`),
  CONSTRAINT `c_items_applications_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_applications_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_applications`
--

LOCK TABLES `items_applications` WRITE;
/*!40000 ALTER TABLE `items_applications` DISABLE KEYS */;
INSERT INTO `items_applications` VALUES (5427,345,23252),(5428,345,23253),(5429,345,23254),(5430,345,23255),(5431,345,23256),(5432,345,23257),(5433,345,23258),(5434,345,23259),(5435,345,23260),(5436,345,23261),(5437,345,23262),(5439,345,23264),(5440,345,23265),(5441,345,23266),(5442,345,23267),(5443,345,23268),(5444,345,23269),(5445,345,23270),(5446,345,23271),(5447,345,23272),(5448,345,23273),(5449,345,23274),(5450,345,23275),(5451,345,23276),(5452,345,23277),(5524,345,23328),(5527,345,23620),(5528,345,23625),(5529,345,23628),(5850,345,23635),(5884,345,23662),(5468,346,23294),(5470,346,23295),(5472,346,23296),(5474,346,23297),(5476,346,23298),(5478,346,23299),(5480,346,23300),(5482,346,23301),(5484,346,23302),(5486,346,23303),(5488,346,23304),(5490,346,23305),(5492,346,23306),(5455,347,23282),(5456,347,23283),(5457,347,23284),(5458,347,23285),(5459,347,23286),(5467,348,23293),(5495,348,23307),(5497,348,23308),(5502,348,23312),(5504,348,23313),(5498,349,23309),(5499,349,23310),(5500,349,23311),(5508,349,23316),(5509,349,23317),(5453,350,23280),(5454,350,23281),(5462,351,23289),(5463,351,23290),(5466,351,23293),(5494,351,23307),(5496,351,23308),(5501,351,23312),(5503,351,23313),(5505,351,23314),(5469,352,23294),(5471,352,23295),(5473,352,23296),(5475,352,23297),(5477,352,23298),(5479,352,23299),(5481,352,23300),(5483,352,23301),(5485,352,23302),(5487,352,23303),(5489,352,23304),(5491,352,23305),(5493,352,23306),(5464,353,23291),(5465,353,23292),(5506,354,23314),(5507,354,23315),(5460,355,23287),(5461,355,23288),(5523,355,23327),(6054,387,23850),(6055,387,23851),(6056,387,23852),(6057,387,23853),(6058,387,23854),(6059,387,23855),(6060,387,23856),(6061,387,23857),(6062,387,23858),(6063,388,23859),(6064,388,23860),(6065,388,23861),(6066,388,23862),(6067,388,23863),(6068,388,23864),(6069,388,23865),(6070,388,23866),(6071,388,23867),(6072,388,23868),(6073,388,23869),(6074,388,23870),(6075,388,23871),(6076,388,23872),(6077,388,23873),(6078,389,23874),(6079,390,23875),(6080,390,23876),(6081,391,23877),(6082,391,23878),(6083,391,23879),(6084,392,23880),(6085,393,23881),(6086,393,23882),(6087,394,23883),(6088,395,23884),(6089,396,23885),(6090,397,23886),(6091,398,23887),(6092,398,23888),(6093,398,23889),(6094,398,23890),(6095,398,23891),(6096,398,23892),(6097,398,23893),(6980,399,24682),(6981,399,24683),(6982,399,24684),(6983,399,24685),(6984,399,24686),(6985,399,24687),(6986,399,24688),(6987,399,24689),(6988,399,24690),(6098,400,23894),(6099,400,23895),(6100,400,23896),(6101,400,23897),(6102,400,23898),(6103,400,23899),(6104,400,23900),(6105,400,23901),(6106,400,23902),(6107,400,23903),(6108,400,23904),(6109,400,23905),(6110,400,23906),(6111,400,23907),(6112,401,23908),(6113,401,23909),(6114,401,23910),(6115,401,23911),(6116,401,23912),(6117,401,23913),(6118,402,23914),(6119,402,23915),(6120,402,23916),(6139,403,23935),(6140,404,23936),(6141,405,23937),(6142,405,23938),(6143,405,23939),(6144,405,23940),(6145,405,23941),(6146,405,23942),(6147,405,23943),(6148,405,23944),(6149,405,23945),(6150,405,23946),(6151,405,23947),(6152,405,23948),(6153,405,23949),(6154,405,23950),(6155,405,23951),(6156,405,23952),(6157,405,23953),(6158,405,23954),(6159,405,23955),(6160,405,23956),(6161,405,23957),(6162,406,23958),(6163,406,23959),(6164,406,23960),(6165,406,23961),(6166,406,23962),(6167,406,23963),(6168,406,23964),(6169,406,23965),(6170,406,23966),(6171,406,23967),(6172,406,23968),(6173,406,23969),(6174,406,23970),(6175,406,23971),(6176,406,23972),(6177,406,23973),(6178,406,23974),(6179,406,23975),(6180,406,23976),(6181,406,23977),(6182,406,23978),(6183,406,23979),(6184,406,23980),(6185,406,23981),(6186,406,23982),(6187,406,23983),(6188,406,23984),(6189,406,23985),(6190,406,23986),(6191,406,23987),(6192,406,23988),(6200,407,23995),(6202,407,23996),(6204,407,23997),(6206,407,23998),(6208,407,23999),(6211,407,24001),(6213,407,24002),(6215,407,24003),(6217,407,24004),(6219,407,24005),(6221,407,24006),(6223,407,24007),(6225,407,24008),(6991,408,24693),(6992,408,24694),(6993,408,24695),(6994,408,24696),(6995,408,24697),(6196,409,23992),(6227,409,24009),(6229,409,24010),(6231,409,24011),(6236,410,24014),(6237,410,24015),(6989,411,24691),(6990,411,24692),(6194,412,23990),(6195,412,23991),(6197,412,23992),(6228,412,24009),(6230,412,24010),(6232,412,24011),(6233,412,24012),(6201,413,23995),(6203,413,23996),(6205,413,23997),(6207,413,23998),(6209,413,23999),(6212,413,24001),(6214,413,24002),(6216,413,24003),(6218,413,24004),(6220,413,24005),(6222,413,24006),(6224,413,24007),(6226,413,24008),(6198,415,23993),(6199,415,23994),(6210,415,24000),(6234,416,24012),(6235,416,24013),(6193,417,23989),(6249,418,24023),(6251,418,24024),(6253,418,24025),(6239,419,24017),(6241,419,24018),(6244,419,24020),(6246,419,24021),(6998,419,24700),(6999,419,24701),(7000,419,24702),(7001,419,24703),(6257,420,24028),(6259,420,24029),(6255,421,24026),(6256,421,24027),(6260,421,24030),(6261,421,24031),(6996,422,24698),(6997,422,24699),(6243,423,24019),(6258,423,24028),(6240,424,24017),(6242,424,24018),(6245,424,24020),(6247,424,24021),(6250,424,24023),(6252,424,24024),(6254,424,24025),(6248,425,24022),(6238,426,24016),(6262,427,24032),(6263,427,24033),(6264,427,24034),(6265,427,24035),(6266,427,24036),(6267,427,24037),(6268,427,24038),(6269,427,24039),(6270,427,24040),(6271,427,24041),(6272,427,24042),(6273,427,24043),(6274,427,24044),(6275,427,24045),(6276,427,24046),(6277,427,24047),(6278,427,24048),(6279,427,24049),(6280,427,24050),(6281,427,24051),(6282,428,24052),(6283,428,24053),(6284,428,24054),(6285,428,24055),(6286,429,24056),(6287,429,24057),(6288,429,24058),(6289,429,24059),(6290,429,24060),(6291,429,24061),(6292,429,24062),(6293,429,24063),(6294,429,24064),(6295,429,24065),(6296,429,24066),(6297,429,24067),(6298,429,24068),(6299,429,24069),(6300,429,24070),(6301,429,24071),(6302,429,24072),(6303,429,24073),(6304,429,24074),(6305,429,24075),(6306,429,24076),(6307,429,24077),(6308,429,24078),(6309,429,24079),(6310,429,24080),(6311,429,24081),(6312,429,24082),(6313,429,24083),(6314,429,24084),(6315,429,24085),(6316,429,24086),(6317,429,24087),(6318,429,24088),(6319,429,24089),(6320,429,24090),(6321,429,24091),(6322,429,24092),(6323,429,24093),(6324,429,24094),(6325,429,24095),(6326,429,24096),(6327,429,24097),(6328,429,24098),(6329,429,24099),(6330,429,24100),(6331,429,24101),(6334,430,24104),(6335,430,24105),(6337,430,24107),(6340,430,24109),(6342,430,24110),(6344,430,24111),(6346,430,24112),(6348,430,24113),(6350,430,24114),(6352,430,24115),(6354,430,24116),(6356,430,24117),(6358,430,24118),(6360,430,24119),(6362,430,24120),(6364,430,24121),(6366,430,24122),(6369,430,24124),(6371,430,24125),(6373,430,24126),(6375,430,24127),(6377,430,24128),(6379,430,24129),(6381,430,24130),(6383,430,24131),(6385,430,24132),(6389,430,24135),(6394,430,24138),(6395,430,24139),(6397,430,24141),(6399,430,24142),(6402,430,24143),(6405,430,24144),(6408,430,24145),(6410,430,24146),(6412,430,24147),(6414,430,24148),(6415,430,24149),(6416,430,24150),(6417,430,24151),(6418,430,24152),(6419,430,24153),(6421,430,24154),(6423,430,24155),(6425,430,24156),(6427,430,24157),(6429,430,24158),(6431,430,24159),(6432,430,24160),(6433,430,24161),(6435,430,24162),(6437,430,24163),(6439,430,24164),(6441,430,24165),(6443,430,24166),(6447,430,24169),(6449,430,24170),(6451,430,24171),(6453,430,24172),(6455,430,24173),(6457,430,24174),(6459,430,24175),(6338,431,24107),(6341,431,24109),(6343,431,24110),(6345,431,24111),(6347,431,24112),(6349,431,24113),(6351,431,24114),(6353,431,24115),(6355,431,24116),(6357,431,24117),(6359,431,24118),(6361,431,24119),(6363,431,24120),(6365,431,24121),(6367,431,24122),(6370,431,24124),(6372,431,24125),(6374,431,24126),(6376,431,24127),(6378,431,24128),(6380,431,24129),(6382,431,24130),(6384,431,24131),(6386,431,24132),(6430,431,24158),(6460,431,24175),(6336,432,24106),(6339,432,24108),(6368,432,24123),(6387,432,24133),(6388,432,24134),(6390,432,24135),(6392,432,24136),(6393,432,24137),(6396,432,24140),(6400,432,24142),(6403,432,24143),(6406,432,24144),(6332,433,24102),(6333,433,24103),(6445,433,24167),(6446,433,24168),(6391,434,24135),(6398,434,24141),(6401,434,24142),(6404,434,24143),(6407,434,24144),(6409,434,24145),(6411,434,24146),(6413,434,24147),(6420,434,24153),(6422,434,24154),(6424,434,24155),(6426,434,24156),(6428,434,24157),(6434,435,24161),(6436,435,24162),(6438,435,24163),(6440,435,24164),(6442,435,24165),(6444,435,24166),(6448,436,24169),(6450,436,24170),(6452,436,24171),(6454,436,24172),(6456,436,24173),(6458,436,24174),(6464,437,24179),(6466,437,24180),(6467,437,24181),(6469,437,24183),(6471,437,24184),(6473,437,24185),(6474,437,24186),(6475,437,24187),(6476,437,24188),(6478,437,24189),(6480,437,24190),(6481,437,24191),(6483,437,24192),(6486,437,24194),(6463,438,24178),(6468,438,24182),(6461,439,24176),(6462,439,24177),(6465,439,24179),(6470,439,24183),(6472,439,24184),(6477,439,24188),(6479,439,24189),(6482,439,24191),(6484,439,24192),(6487,439,24194),(6488,439,24195),(6485,440,24193),(6489,441,24196),(6490,441,24197),(6491,441,24198),(6511,441,24218),(6536,441,24243),(6539,441,24245),(6540,441,24246),(6548,441,24252),(6592,441,24290),(6593,441,24291),(6594,441,24292),(6595,441,24293),(6492,442,24199),(6535,442,24242),(6542,442,24247),(6547,442,24251),(6600,442,24298),(6601,442,24299),(6500,443,24207),(6515,443,24222),(6516,443,24223),(6517,443,24224),(6518,443,24225),(6519,443,24226),(6530,443,24237),(6531,443,24238),(6532,443,24239),(6533,443,24240),(6534,443,24241),(6537,443,24243),(6538,443,24244),(6541,443,24246),(6543,443,24247),(6549,443,24252),(6566,443,24268),(6568,443,24269),(6575,443,24276),(6577,443,24278),(6578,443,24279),(6583,443,24284),(6584,443,24285),(6586,443,24286),(6590,443,24289),(6596,443,24294),(6597,443,24295),(6598,443,24296),(6599,443,24297),(6602,443,24299),(6493,444,24200),(6494,444,24201),(6495,444,24202),(6496,444,24203),(6497,444,24204),(6498,444,24205),(6499,444,24206),(6501,444,24208),(6502,444,24209),(6503,444,24210),(6504,444,24211),(6505,444,24212),(6506,444,24213),(6507,444,24214),(6508,444,24215),(6509,444,24216),(6510,444,24217),(6513,444,24220),(6520,444,24227),(6521,444,24228),(6522,444,24229),(6523,444,24230),(6524,444,24231),(6525,444,24232),(6526,444,24233),(6527,444,24234),(6528,444,24235),(6529,444,24236),(6544,444,24248),(6565,444,24267),(6569,444,24270),(6570,444,24271),(6571,444,24272),(6572,444,24273),(6573,444,24274),(6574,444,24275),(6576,444,24277),(6579,444,24280),(6580,444,24281),(6581,444,24282),(6582,444,24283),(6588,444,24287),(6589,444,24288),(6553,445,24255),(6554,445,24256),(6555,445,24257),(6556,445,24258),(6557,445,24259),(6558,445,24260),(6559,445,24261),(6560,445,24262),(6561,445,24263),(6562,445,24264),(6563,445,24265),(6564,445,24266),(6567,445,24268),(6512,446,24219),(6514,446,24221),(6545,446,24249),(6546,446,24250),(6550,446,24252),(6551,446,24253),(6552,446,24254),(6585,446,24285),(6587,446,24286),(6591,446,24289),(6603,447,24300),(6605,447,24302),(6608,447,24305),(6609,447,24306),(6611,447,24308),(6612,447,24309),(6615,447,24312),(6616,447,24313),(6620,447,24317),(6621,447,24318),(6622,447,24319),(6623,447,24320),(6625,447,24322),(6632,447,24329),(6604,448,24301),(6610,448,24307),(6617,448,24314),(6618,448,24315),(6624,448,24321),(6606,449,24303),(6607,449,24304),(6613,449,24310),(6614,449,24311),(6619,449,24316),(6626,449,24323),(6627,449,24324),(6628,449,24325),(6629,449,24326),(6630,449,24327),(6631,449,24328),(6633,450,24330),(6634,450,24331),(6635,450,24332),(6636,450,24333),(6637,450,24334),(6638,450,24335),(6639,450,24336),(6640,450,24337),(6641,450,24338),(6642,451,24339),(6643,451,24340),(6644,451,24341),(6645,451,24342),(6646,451,24343),(6647,451,24344),(6648,451,24345),(6649,451,24346),(6650,451,24347),(6651,451,24348),(6652,451,24349),(6653,451,24350),(6654,451,24351),(6655,451,24352),(6656,451,24353),(6657,451,24354),(6658,451,24355),(6659,451,24356),(6660,451,24357),(6661,451,24358),(6662,451,24359),(6663,451,24360),(6664,451,24361),(6665,451,24362),(6666,451,24363),(6667,451,24364),(6668,451,24365),(6669,451,24366),(6670,451,24367),(6671,451,24368),(6672,451,24369),(6673,451,24370),(6674,451,24371),(6675,451,24372),(6676,451,24373),(6677,451,24374),(6678,451,24375),(6679,451,24376),(6680,451,24377),(6681,451,24378),(6682,451,24379),(6683,451,24380),(6684,451,24381),(6685,451,24382),(6686,451,24383),(6687,451,24384),(6688,451,24385),(6689,451,24386),(6690,451,24387),(6691,451,24388),(6692,451,24389),(6693,451,24390),(6694,451,24391),(6695,451,24392),(6696,451,24393),(6697,451,24394),(6698,451,24395),(6699,451,24396),(6700,451,24397),(6701,451,24398),(6702,451,24399),(6703,451,24400),(6704,451,24401),(6705,451,24402),(6706,451,24403),(6707,451,24404),(6708,451,24405),(6709,451,24406),(6710,451,24407),(6711,451,24408),(6712,451,24409),(6713,451,24410),(6714,451,24411),(6715,451,24412),(6716,451,24413),(6717,451,24414),(6718,451,24415),(6719,451,24416),(6720,451,24417),(6721,451,24418),(6722,451,24419),(6723,451,24420),(6724,451,24421),(6725,451,24422),(6726,451,24423),(6727,451,24424),(6728,451,24425),(6729,451,24426),(6730,451,24427),(6731,451,24428),(6732,451,24429),(6733,451,24430),(6734,451,24431),(6735,451,24432),(6736,451,24433),(6737,451,24434),(6738,451,24435),(6739,451,24436),(6740,451,24437),(6741,451,24438),(6742,451,24439),(6743,451,24440),(6744,451,24441),(6745,451,24442),(6746,451,24443),(6747,451,24444),(6748,451,24445),(6749,451,24446),(6750,451,24447),(6751,451,24448),(6752,451,24449),(6753,451,24450),(6754,451,24451),(6755,451,24452),(6756,451,24453),(6757,451,24454),(6758,451,24455),(6759,451,24456),(6760,451,24457),(6761,451,24458),(6762,451,24459),(6763,451,24460),(6764,451,24461),(6765,451,24462),(6766,451,24463),(6767,451,24464),(6768,451,24465),(6769,451,24466),(6770,451,24467),(6771,451,24468),(6772,451,24469),(6773,451,24470),(6774,451,24471),(6775,451,24472),(6776,451,24473),(6777,451,24474),(6778,451,24475),(6779,451,24476),(6780,451,24477),(6781,451,24478),(6782,451,24479),(6783,451,24480),(6784,451,24481),(6785,451,24482),(6786,451,24483),(6787,451,24484),(6788,451,24485),(6789,451,24486),(6790,451,24487),(6791,451,24488),(6792,451,24489),(6793,451,24490),(6794,451,24491),(6795,451,24492),(6796,451,24493),(6797,451,24494),(6798,451,24495),(6799,451,24496),(6800,451,24497),(6801,451,24498),(6802,451,24499),(6803,451,24500),(6804,451,24501),(6805,451,24502),(6806,451,24503),(6807,451,24504),(6808,451,24505),(6809,451,24506),(6810,451,24507),(6811,451,24508),(6812,451,24509),(6813,451,24510),(6814,451,24511),(6815,451,24512),(6816,451,24513),(6817,451,24514),(6818,451,24515),(6819,451,24516),(6820,451,24517),(6821,451,24518),(6822,451,24519),(6823,451,24520),(6824,451,24521),(6825,451,24522),(6826,451,24523),(6827,451,24524),(6828,451,24525),(6829,451,24526),(6830,451,24527),(6831,451,24528),(6832,451,24529),(6833,451,24530),(6834,451,24531),(6835,451,24532),(6836,451,24533),(6837,451,24534),(6838,451,24535),(6839,451,24536),(6840,451,24537),(6841,451,24538),(6842,451,24539),(6843,451,24540),(6844,451,24541),(6845,451,24542),(6846,451,24543),(6847,451,24544),(6848,451,24545),(6849,451,24546),(6850,451,24547),(6851,451,24548),(6852,451,24549),(6853,451,24550),(6854,451,24551),(6855,451,24552),(6856,451,24553),(6857,451,24554),(6858,451,24555),(6859,451,24556),(6860,451,24557),(6861,451,24558),(6862,451,24559),(6863,451,24560),(6864,451,24561),(6865,451,24562),(6866,451,24563),(6867,451,24564),(6868,451,24565),(6869,451,24566),(6870,451,24567),(6871,451,24568),(6872,451,24569),(6873,451,24570),(6957,451,24654),(6958,451,24655),(6923,452,24620),(6924,452,24621),(6925,452,24622),(6926,452,24623),(6927,452,24624),(6928,452,24625),(6929,452,24626),(6930,452,24627),(6931,452,24628),(6932,452,24629),(6874,453,24571),(6875,453,24572),(6876,453,24573),(6877,453,24574),(6878,453,24575),(6879,453,24576),(6880,453,24577),(6881,453,24578),(6882,453,24579),(6883,453,24580),(6884,453,24581),(6885,453,24582),(6886,453,24583),(6887,453,24584),(6888,453,24585),(6889,453,24586),(6890,453,24587),(6891,453,24588),(6892,453,24589),(6893,453,24590),(6894,453,24591),(6895,453,24592),(6896,453,24593),(6897,453,24594),(6898,453,24595),(6899,453,24596),(6900,453,24597),(6901,453,24598),(6902,453,24599),(6903,453,24600),(6904,453,24601),(6905,453,24602),(6906,453,24603),(6907,453,24604),(6908,453,24605),(6909,453,24606),(6910,453,24607),(6911,453,24608),(6912,453,24609),(6913,453,24610),(6914,453,24611),(6915,453,24612),(6916,453,24613),(6917,453,24614),(6918,453,24615),(6919,453,24616),(6920,453,24617),(6921,453,24618),(6922,453,24619),(6959,454,24656),(6960,454,24657),(6961,454,24658),(6962,454,24659),(6963,454,24660),(6964,454,24661),(6965,454,24662),(6966,454,24663),(6933,455,24630),(6934,455,24631),(6935,455,24632),(6936,455,24633),(6937,455,24634),(6938,455,24635),(6939,455,24636),(6940,455,24637),(6941,455,24638),(6942,455,24639),(6943,455,24640),(6944,455,24641),(6945,455,24642),(6946,455,24643),(6947,455,24644),(6948,455,24645),(6949,455,24646),(6950,455,24647),(6951,455,24648),(6952,455,24649),(6953,455,24650),(6954,455,24651),(6955,455,24652),(6956,455,24653),(6972,456,24669),(6976,456,24673),(6978,456,24675),(6979,456,24676),(6967,457,24664),(6971,457,24668),(6973,457,24670),(6968,458,24665),(6969,458,24666),(6970,458,24667),(6974,458,24671),(6975,458,24672),(6977,458,24674);
/*!40000 ALTER TABLE `items_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances`
--

DROP TABLE IF EXISTS `maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances` (
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `maintenance_type` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `active_since` int(11) NOT NULL DEFAULT '0',
  `active_till` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`maintenanceid`),
  UNIQUE KEY `maintenances_2` (`name`),
  KEY `maintenances_1` (`active_since`,`active_till`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances`
--

LOCK TABLES `maintenances` WRITE;
/*!40000 ALTER TABLE `maintenances` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_groups`
--

DROP TABLE IF EXISTS `maintenances_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_groups` (
  `maintenance_groupid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_groupid`),
  UNIQUE KEY `maintenances_groups_1` (`maintenanceid`,`groupid`),
  KEY `maintenances_groups_2` (`groupid`),
  CONSTRAINT `c_maintenances_groups_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_groups_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_groups`
--

LOCK TABLES `maintenances_groups` WRITE;
/*!40000 ALTER TABLE `maintenances_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_hosts`
--

DROP TABLE IF EXISTS `maintenances_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_hosts` (
  `maintenance_hostid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_hostid`),
  UNIQUE KEY `maintenances_hosts_1` (`maintenanceid`,`hostid`),
  KEY `maintenances_hosts_2` (`hostid`),
  CONSTRAINT `c_maintenances_hosts_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_hosts_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_hosts`
--

LOCK TABLES `maintenances_hosts` WRITE;
/*!40000 ALTER TABLE `maintenances_hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_windows`
--

DROP TABLE IF EXISTS `maintenances_windows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_windows` (
  `maintenance_timeperiodid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `timeperiodid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_timeperiodid`),
  UNIQUE KEY `maintenances_windows_1` (`maintenanceid`,`timeperiodid`),
  KEY `maintenances_windows_2` (`timeperiodid`),
  CONSTRAINT `c_maintenances_windows_2` FOREIGN KEY (`timeperiodid`) REFERENCES `timeperiods` (`timeperiodid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_windows_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_windows`
--

LOCK TABLES `maintenances_windows` WRITE;
/*!40000 ALTER TABLE `maintenances_windows` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_windows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mappings`
--

DROP TABLE IF EXISTS `mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mappings` (
  `mappingid` bigint(20) unsigned NOT NULL,
  `valuemapid` bigint(20) unsigned NOT NULL,
  `value` varchar(64) NOT NULL DEFAULT '',
  `newvalue` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`mappingid`),
  KEY `mappings_1` (`valuemapid`),
  CONSTRAINT `c_mappings_1` FOREIGN KEY (`valuemapid`) REFERENCES `valuemaps` (`valuemapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mappings`
--

LOCK TABLES `mappings` WRITE;
/*!40000 ALTER TABLE `mappings` DISABLE KEYS */;
INSERT INTO `mappings` VALUES (1,1,'0','Down'),(2,1,'1','Up'),(3,2,'0','not available'),(4,2,'1','available'),(5,2,'2','unknown'),(13,6,'1','Other'),(14,6,'2','OK'),(15,6,'3','Degraded'),(17,7,'1','Other'),(18,7,'2','Unknown'),(19,7,'3','OK'),(20,7,'4','NonCritical'),(21,7,'5','Critical'),(22,7,'6','NonRecoverable'),(23,5,'1','unknown'),(24,5,'2','batteryNormal'),(25,5,'3','batteryLow'),(26,4,'1','unknown'),(27,4,'2','notInstalled'),(28,4,'3','ok'),(29,4,'4','failed'),(30,4,'5','highTemperature'),(31,4,'6','replaceImmediately'),(32,4,'7','lowCapacity'),(33,3,'0','Running'),(34,3,'1','Paused'),(35,3,'3','Pause pending'),(36,3,'4','Continue pending'),(37,3,'5','Stop pending'),(38,3,'6','Stopped'),(39,3,'7','Unknown'),(40,3,'255','No such service'),(41,3,'2','Start pending'),(49,9,'1','unknown'),(50,9,'2','running'),(51,9,'3','warning'),(52,9,'4','testing'),(53,9,'5','down'),(61,8,'1','up'),(62,8,'2','down'),(63,8,'3','testing'),(64,8,'4','unknown'),(65,8,'5','dormant'),(66,8,'6','notPresent'),(67,8,'7','lowerLayerDown'),(68,10,'1','Up'),(69,11,'1','up'),(70,11,'2','down'),(71,11,'3','testing'),(72,12,'0','poweredOff'),(73,12,'1','poweredOn'),(74,12,'2','suspended'),(75,13,'0','gray'),(76,13,'1','green'),(77,13,'2','yellow'),(78,13,'3','red'),(79,14,'0','normal'),(80,14,'1','in maintenance'),(81,14,'2','no data collection'),(82,15,'0','Normal'),(83,15,'1','Low memory'),(84,16,'0','Automatic'),(85,16,'1','Automatic delayed'),(86,16,'2','Manual'),(87,16,'3','Disabled'),(88,16,'4','Unknown'),(89,17,'100','Continue'),(90,17,'101','Switching Protocols'),(91,17,'102','Processing'),(92,17,'200','OK'),(93,17,'201','Created'),(94,17,'202','Accepted'),(95,17,'203','Non-Authoritative Information'),(96,17,'204','No Content'),(97,17,'205','Reset Content'),(98,17,'206','Partial Content'),(99,17,'207','Multi-Status'),(100,17,'208','Already Reported'),(101,17,'226','IM Used'),(102,17,'300','Multiple Choices'),(103,17,'301','Moved Permanently'),(104,17,'302','Found'),(105,17,'303','See Other'),(106,17,'304','Not Modified'),(107,17,'305','Use Proxy'),(108,17,'306','Switch Proxy'),(109,17,'307','Temporary Redirect'),(110,17,'308','Permanent Redirect/Resume Incomplete'),(111,17,'400','Bad Request'),(112,17,'401','Unauthorized'),(113,17,'402','Payment Required'),(114,17,'403','Forbidden'),(115,17,'404','Not Found'),(116,17,'405','Method Not Allowed'),(117,17,'406','Not Acceptable'),(118,17,'407','Proxy Authentication Required'),(119,17,'408','Request Timeout'),(120,17,'409','Conflict'),(121,17,'410','Gone'),(122,17,'411','Length Required'),(123,17,'412','Precondition Failed'),(124,17,'413','Payload Too Large'),(125,17,'414','Request-URI Too Long'),(126,17,'415','Unsupported Media Type'),(127,17,'416','Requested Range Not Satisfiable'),(128,17,'417','Expectation Failed'),(129,17,'418','I\'m a Teapot'),(130,17,'419','Authentication Timeout'),(131,17,'420','Method Failure/Enhance Your Calm'),(132,17,'421','Misdirected Request'),(133,17,'422','Unprocessable Entity'),(134,17,'423','Locked'),(135,17,'424','Failed Dependency'),(136,17,'426','Upgrade Required'),(137,17,'428','Precondition Required'),(138,17,'429','Too Many Requests'),(139,17,'431','Request Header Fields Too Large'),(140,17,'440','Login Timeout'),(141,17,'444','No Response'),(142,17,'449','Retry With'),(143,17,'450','Blocked by Windows Parental Controls'),(144,17,'451','Unavailable for Legal Reasons/Redirect'),(145,17,'494','Request Header Too Large'),(146,17,'495','Cert Error'),(147,17,'496','No Cert'),(148,17,'497','HTTP to HTTPS'),(149,17,'498','Token Expired/Invalid'),(150,17,'499','Client Closed Request/Token Required'),(151,17,'500','Internal Server Error'),(152,17,'501','Not Implemented'),(153,17,'502','Bad Gateway'),(154,17,'503','Service Unavailable'),(155,17,'504','Gateway Timeout'),(156,17,'505','HTTP Version Not Supported'),(157,17,'506','Variant Also Negotiates'),(158,17,'507','Insufficient Storage'),(159,17,'508','Loop Detected'),(160,17,'509','Bandwidth Limit Exceeded'),(161,17,'510','Not Extended'),(162,17,'511','Network Authentication Required'),(163,17,'520','Unknown Error'),(164,17,'598','Network Read Timeout Error'),(165,17,'599','Network Connect Timeout Error');
/*!40000 ALTER TABLE `mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `mediaid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `mediatypeid` bigint(20) unsigned NOT NULL,
  `sendto` varchar(100) NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT '0',
  `severity` int(11) NOT NULL DEFAULT '63',
  `period` varchar(100) NOT NULL DEFAULT '1-7,00:00-24:00',
  PRIMARY KEY (`mediaid`),
  KEY `media_1` (`userid`),
  KEY `media_2` (`mediatypeid`),
  CONSTRAINT `c_media_2` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_media_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (8,1,1,'yuchengc@chinatelecom.cn',0,63,'1-7,00:00-24:00');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_type` (
  `mediatypeid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `description` varchar(100) NOT NULL DEFAULT '',
  `smtp_server` varchar(255) NOT NULL DEFAULT '',
  `smtp_helo` varchar(255) NOT NULL DEFAULT '',
  `smtp_email` varchar(255) NOT NULL DEFAULT '',
  `exec_path` varchar(255) NOT NULL DEFAULT '',
  `gsm_modem` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `passwd` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `smtp_port` int(11) NOT NULL DEFAULT '25',
  `smtp_security` int(11) NOT NULL DEFAULT '0',
  `smtp_verify_peer` int(11) NOT NULL DEFAULT '0',
  `smtp_verify_host` int(11) NOT NULL DEFAULT '0',
  `smtp_authentication` int(11) NOT NULL DEFAULT '0',
  `exec_params` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`mediatypeid`),
  UNIQUE KEY `media_type_1` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_type`
--

LOCK TABLES `media_type` WRITE;
/*!40000 ALTER TABLE `media_type` DISABLE KEYS */;
INSERT INTO `media_type` VALUES (1,1,'Email','mail.company.com','company.com','zabbix@company.com','Email.py','','','',0,25,0,0,0,0,'{ALERT.SENDTO}\n{ALERT.SUBJECT}\n{ALERT.MESSAGE}\n'),(2,3,'Jabber','','','','','','jabber@company.com','zabbix',0,25,0,0,0,0,''),(3,2,'SMS','','','','','/dev/ttyS0','','',0,25,0,0,0,0,''),(4,1,'Wechat','','','','Wechat.py','','','',0,25,0,0,0,0,'{ALERT.TO}\n{ALERT.SUBJECT}\n{ALERT.MESSAGE}\n');
/*!40000 ALTER TABLE `media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand`
--

DROP TABLE IF EXISTS `opcommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand` (
  `operationid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `scriptid` bigint(20) unsigned DEFAULT NULL,
  `execute_on` int(11) NOT NULL DEFAULT '0',
  `port` varchar(64) NOT NULL DEFAULT '',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `publickey` varchar(64) NOT NULL DEFAULT '',
  `privatekey` varchar(64) NOT NULL DEFAULT '',
  `command` text NOT NULL,
  PRIMARY KEY (`operationid`),
  KEY `opcommand_1` (`scriptid`),
  CONSTRAINT `c_opcommand_2` FOREIGN KEY (`scriptid`) REFERENCES `scripts` (`scriptid`),
  CONSTRAINT `c_opcommand_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand`
--

LOCK TABLES `opcommand` WRITE;
/*!40000 ALTER TABLE `opcommand` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand_grp`
--

DROP TABLE IF EXISTS `opcommand_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand_grp` (
  `opcommand_grpid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opcommand_grpid`),
  KEY `opcommand_grp_1` (`operationid`),
  KEY `opcommand_grp_2` (`groupid`),
  CONSTRAINT `c_opcommand_grp_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`),
  CONSTRAINT `c_opcommand_grp_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand_grp`
--

LOCK TABLES `opcommand_grp` WRITE;
/*!40000 ALTER TABLE `opcommand_grp` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand_hst`
--

DROP TABLE IF EXISTS `opcommand_hst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand_hst` (
  `opcommand_hstid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`opcommand_hstid`),
  KEY `opcommand_hst_1` (`operationid`),
  KEY `opcommand_hst_2` (`hostid`),
  CONSTRAINT `c_opcommand_hst_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`),
  CONSTRAINT `c_opcommand_hst_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand_hst`
--

LOCK TABLES `opcommand_hst` WRITE;
/*!40000 ALTER TABLE `opcommand_hst` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand_hst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opconditions`
--

DROP TABLE IF EXISTS `opconditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opconditions` (
  `opconditionid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `conditiontype` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`opconditionid`),
  KEY `opconditions_1` (`operationid`),
  CONSTRAINT `c_opconditions_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opconditions`
--

LOCK TABLES `opconditions` WRITE;
/*!40000 ALTER TABLE `opconditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `opconditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operations` (
  `operationid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `operationtype` int(11) NOT NULL DEFAULT '0',
  `esc_period` int(11) NOT NULL DEFAULT '0',
  `esc_step_from` int(11) NOT NULL DEFAULT '1',
  `esc_step_to` int(11) NOT NULL DEFAULT '1',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operationid`),
  KEY `operations_1` (`actionid`),
  CONSTRAINT `c_operations_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
INSERT INTO `operations` VALUES (2,2,4,0,1,1,0),(3,3,0,0,1,1,0),(4,4,0,0,1,1,0),(5,5,0,0,1,1,0),(6,6,0,0,1,1,0),(9,7,0,0,1,1,0),(10,8,2,0,1,1,0),(11,8,4,0,1,1,0),(14,9,2,0,1,1,0),(15,9,4,0,1,1,0),(17,10,2,0,1,1,0),(18,10,4,0,1,1,0),(21,11,0,0,1,1,0),(22,9,6,0,1,1,0),(23,8,6,0,1,1,0),(24,10,6,0,1,1,0),(25,9,6,0,1,1,0);
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opgroup`
--

DROP TABLE IF EXISTS `opgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opgroup` (
  `opgroupid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opgroupid`),
  UNIQUE KEY `opgroup_1` (`operationid`,`groupid`),
  KEY `opgroup_2` (`groupid`),
  CONSTRAINT `c_opgroup_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`),
  CONSTRAINT `c_opgroup_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opgroup`
--

LOCK TABLES `opgroup` WRITE;
/*!40000 ALTER TABLE `opgroup` DISABLE KEYS */;
INSERT INTO `opgroup` VALUES (1,2,2),(2,11,9),(3,15,9),(4,18,8);
/*!40000 ALTER TABLE `opgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opinventory`
--

DROP TABLE IF EXISTS `opinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opinventory` (
  `operationid` bigint(20) unsigned NOT NULL,
  `inventory_mode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operationid`),
  CONSTRAINT `c_opinventory_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opinventory`
--

LOCK TABLES `opinventory` WRITE;
/*!40000 ALTER TABLE `opinventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `opinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage`
--

DROP TABLE IF EXISTS `opmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage` (
  `operationid` bigint(20) unsigned NOT NULL,
  `default_msg` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `mediatypeid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`operationid`),
  KEY `opmessage_1` (`mediatypeid`),
  CONSTRAINT `c_opmessage_2` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`),
  CONSTRAINT `c_opmessage_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage`
--

LOCK TABLES `opmessage` WRITE;
/*!40000 ALTER TABLE `opmessage` DISABLE KEYS */;
INSERT INTO `opmessage` VALUES (3,1,'{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}',NULL),(4,1,'','',NULL),(5,1,'','',NULL),(6,1,'','',NULL),(9,1,'{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}\r\n\r\nOriginal event ID: {EVENT.ID}',1),(21,1,'{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}\r\n\r\nOriginal event ID: {EVENT.ID}',4);
/*!40000 ALTER TABLE `opmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage_grp`
--

DROP TABLE IF EXISTS `opmessage_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage_grp` (
  `opmessage_grpid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opmessage_grpid`),
  UNIQUE KEY `opmessage_grp_1` (`operationid`,`usrgrpid`),
  KEY `opmessage_grp_2` (`usrgrpid`),
  CONSTRAINT `c_opmessage_grp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`),
  CONSTRAINT `c_opmessage_grp_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage_grp`
--

LOCK TABLES `opmessage_grp` WRITE;
/*!40000 ALTER TABLE `opmessage_grp` DISABLE KEYS */;
INSERT INTO `opmessage_grp` VALUES (1,3,7),(2,4,7),(3,5,7),(4,6,7),(6,9,7),(7,21,7);
/*!40000 ALTER TABLE `opmessage_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage_usr`
--

DROP TABLE IF EXISTS `opmessage_usr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage_usr` (
  `opmessage_usrid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opmessage_usrid`),
  UNIQUE KEY `opmessage_usr_1` (`operationid`,`userid`),
  KEY `opmessage_usr_2` (`userid`),
  CONSTRAINT `c_opmessage_usr_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `c_opmessage_usr_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage_usr`
--

LOCK TABLES `opmessage_usr` WRITE;
/*!40000 ALTER TABLE `opmessage_usr` DISABLE KEYS */;
INSERT INTO `opmessage_usr` VALUES (1,9,1),(2,21,1);
/*!40000 ALTER TABLE `opmessage_usr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optemplate`
--

DROP TABLE IF EXISTS `optemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `optemplate` (
  `optemplateid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`optemplateid`),
  UNIQUE KEY `optemplate_1` (`operationid`,`templateid`),
  KEY `optemplate_2` (`templateid`),
  CONSTRAINT `c_optemplate_2` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`),
  CONSTRAINT `c_optemplate_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optemplate`
--

LOCK TABLES `optemplate` WRITE;
/*!40000 ALTER TABLE `optemplate` DISABLE KEYS */;
INSERT INTO `optemplate` VALUES (9,22,10127),(10,23,10108),(11,23,10127),(12,24,10127),(13,25,10107);
/*!40000 ALTER TABLE `optemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `profileid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `idx` varchar(96) NOT NULL DEFAULT '',
  `idx2` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_int` int(11) NOT NULL DEFAULT '0',
  `value_str` varchar(255) NOT NULL DEFAULT '',
  `source` varchar(96) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`profileid`),
  KEY `profiles_1` (`userid`,`idx`,`idx2`),
  KEY `profiles_2` (`userid`,`profileid`),
  CONSTRAINT `c_profiles_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,1,'web.menu.config.last',0,0,0,'hosts.php','',3),(2,1,'web.templates.php.groupid',0,0,0,'','',1),(3,1,'web.latest.groupid',0,0,0,'','',1),(4,1,'web.templates.php.sort',0,0,0,'name','',3),(5,1,'web.templates.php.sortorder',0,0,0,'ASC','',3),(6,1,'web.paging.lastpage',0,0,0,'hosts.php','',3),(7,1,'web.items.filter_groupid',0,0,0,'','',1),(8,1,'web.items.filter_hostid',0,10137,0,'','',1),(9,1,'web.items.filter_application',0,0,0,'','',3),(10,1,'web.items.filter_name',0,0,0,'','',3),(11,1,'web.items.filter_type',0,0,-1,'','',2),(12,1,'web.items.filter_key',0,0,0,'','',3),(13,1,'web.items.filter_snmp_community',0,0,0,'','',3),(14,1,'web.items.filter_snmpv3_securityname',0,0,0,'','',3),(15,1,'web.items.filter_snmp_oid',0,0,0,'','',3),(16,1,'web.items.filter_port',0,0,0,'','',3),(17,1,'web.items.filter_value_type',0,0,-1,'','',2),(18,1,'web.items.filter_data_type',0,0,-1,'','',2),(19,1,'web.items.filter_delay',0,0,0,'','',3),(20,1,'web.items.filter_history',0,0,0,'','',3),(21,1,'web.items.filter_trends',0,0,0,'','',3),(22,1,'web.items.filter_status',0,0,-1,'','',2),(23,1,'web.items.filter_state',0,0,-1,'','',2),(24,1,'web.items.filter_templated_items',0,0,-1,'','',2),(25,1,'web.items.filter_with_triggers',0,0,-1,'','',2),(26,1,'web.items.filter_ipmi_sensor',0,0,0,'','',3),(27,1,'web.items.subfilter_apps',0,0,0,'','',3),(28,1,'web.items.subfilter_types',0,0,0,'','',3),(29,1,'web.items.subfilter_value_types',0,0,0,'','',3),(30,1,'web.items.subfilter_status',0,0,0,'','',3),(31,1,'web.items.subfilter_state',0,0,0,'','',3),(32,1,'web.items.subfilter_templated_items',0,0,0,'','',3),(33,1,'web.items.subfilter_with_triggers',0,0,0,'','',3),(34,1,'web.items.subfilter_hosts',0,0,0,'','',3),(35,1,'web.items.subfilter_interval',0,0,0,'','',3),(36,1,'web.items.subfilter_history',0,0,0,'','',3),(37,1,'web.items.subfilter_trends',0,0,0,'','',3),(38,1,'web.items.php.sort',0,0,0,'name','',3),(39,1,'web.items.php.sortorder',0,0,0,'ASC','',3),(40,1,'web.media_type.php.sort',0,0,0,'description','',3),(41,1,'web.media_types.php.sortorder',0,0,0,'ASC','',3),(42,1,'web.actionconf.php.sort',0,0,0,'name','',3),(43,1,'web.actionconf.php.sortorder',0,0,0,'ASC','',3),(44,1,'web.reports.groupid',0,1,0,'','',1),(45,1,'web.actionconf.eventsource',0,0,2,'','',2),(46,1,'web.config.groupid',0,0,0,'','',1),(47,1,'web.hosts.php.sort',0,0,0,'name','',3),(48,1,'web.hosts.php.sortorder',0,0,0,'ASC','',3),(49,1,'web.menu.admin.last',0,0,0,'users.php','',3),(50,1,'web.users.filter.usrgrpid',0,0,0,'','',1),(51,1,'web.users.php.sort',0,0,0,'alias','',3),(52,1,'web.users.php.sortorder',0,0,0,'ASC','',3),(53,1,'web.paging.page',0,0,6,'','',2);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_autoreg_host`
--

DROP TABLE IF EXISTS `proxy_autoreg_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_autoreg_host` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clock` int(11) NOT NULL DEFAULT '0',
  `host` varchar(64) NOT NULL DEFAULT '',
  `listen_ip` varchar(39) NOT NULL DEFAULT '',
  `listen_port` int(11) NOT NULL DEFAULT '0',
  `listen_dns` varchar(64) NOT NULL DEFAULT '',
  `host_metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `proxy_autoreg_host_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_autoreg_host`
--

LOCK TABLES `proxy_autoreg_host` WRITE;
/*!40000 ALTER TABLE `proxy_autoreg_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_autoreg_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_dhistory`
--

DROP TABLE IF EXISTS `proxy_dhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_dhistory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clock` int(11) NOT NULL DEFAULT '0',
  `druleid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(39) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '0',
  `key_` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `dcheckid` bigint(20) unsigned DEFAULT NULL,
  `dns` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `proxy_dhistory_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_dhistory`
--

LOCK TABLES `proxy_dhistory` WRITE;
/*!40000 ALTER TABLE `proxy_dhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_dhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_history`
--

DROP TABLE IF EXISTS `proxy_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `source` varchar(64) NOT NULL DEFAULT '',
  `severity` int(11) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  `logeventid` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `lastlogsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `proxy_history_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_history`
--

LOCK TABLES `proxy_history` WRITE;
/*!40000 ALTER TABLE `proxy_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regexps`
--

DROP TABLE IF EXISTS `regexps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regexps` (
  `regexpid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `test_string` text NOT NULL,
  PRIMARY KEY (`regexpid`),
  UNIQUE KEY `regexps_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regexps`
--

LOCK TABLES `regexps` WRITE;
/*!40000 ALTER TABLE `regexps` DISABLE KEYS */;
INSERT INTO `regexps` VALUES (1,'File systems for discovery','ext3'),(2,'Network interfaces for discovery','eth0'),(3,'Storage devices for SNMP discovery','/boot');
/*!40000 ALTER TABLE `regexps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `rightid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '0',
  `id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`rightid`),
  KEY `rights_1` (`groupid`),
  KEY `rights_2` (`id`),
  CONSTRAINT `c_rights_2` FOREIGN KEY (`id`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_rights_1` FOREIGN KEY (`groupid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_user`
--

DROP TABLE IF EXISTS `screen_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_user` (
  `screenuserid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`screenuserid`),
  UNIQUE KEY `screen_user_1` (`screenid`,`userid`),
  KEY `c_screen_user_2` (`userid`),
  CONSTRAINT `c_screen_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_screen_user_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_user`
--

LOCK TABLES `screen_user` WRITE;
/*!40000 ALTER TABLE `screen_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_usrgrp`
--

DROP TABLE IF EXISTS `screen_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_usrgrp` (
  `screenusrgrpid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`screenusrgrpid`),
  UNIQUE KEY `screen_usrgrp_1` (`screenid`,`usrgrpid`),
  KEY `c_screen_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_screen_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_screen_usrgrp_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_usrgrp`
--

LOCK TABLES `screen_usrgrp` WRITE;
/*!40000 ALTER TABLE `screen_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens` (
  `screenid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `hsize` int(11) NOT NULL DEFAULT '1',
  `vsize` int(11) NOT NULL DEFAULT '1',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`screenid`),
  KEY `screens_1` (`templateid`),
  KEY `c_screens_3` (`userid`),
  CONSTRAINT `c_screens_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `c_screens_1` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
INSERT INTO `screens` VALUES (16,'Zabbix server',2,2,NULL,1,0),(21,'MySQL performance',2,1,10120,NULL,1),(22,'Zabbix proxy health',2,2,10125,NULL,1),(23,'Zabbix server health',2,3,10126,NULL,1),(24,'System performance',2,3,10127,NULL,1),(25,'System performance',2,2,10128,NULL,1);
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens_items`
--

DROP TABLE IF EXISTS `screens_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens_items` (
  `screenitemid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `resourcetype` int(11) NOT NULL DEFAULT '0',
  `resourceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '320',
  `height` int(11) NOT NULL DEFAULT '200',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `colspan` int(11) NOT NULL DEFAULT '1',
  `rowspan` int(11) NOT NULL DEFAULT '1',
  `elements` int(11) NOT NULL DEFAULT '25',
  `valign` int(11) NOT NULL DEFAULT '0',
  `halign` int(11) NOT NULL DEFAULT '0',
  `style` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `dynamic` int(11) NOT NULL DEFAULT '0',
  `sort_triggers` int(11) NOT NULL DEFAULT '0',
  `application` varchar(255) NOT NULL DEFAULT '',
  `max_columns` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`screenitemid`),
  KEY `screens_items_1` (`screenid`),
  CONSTRAINT `c_screens_items_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens_items`
--

LOCK TABLES `screens_items` WRITE;
/*!40000 ALTER TABLE `screens_items` DISABLE KEYS */;
INSERT INTO `screens_items` VALUES (44,16,2,1,500,100,0,0,2,1,0,0,0,0,'',0,0,'',3),(45,16,0,524,400,156,0,1,1,1,0,0,0,0,'',0,0,'',3),(46,16,0,525,400,100,1,1,1,1,0,0,0,0,'',0,0,'',3),(64,21,0,614,500,200,0,0,1,1,0,1,0,0,'',0,0,'',3),(65,21,0,607,500,270,1,0,1,1,0,1,0,0,'',0,0,'',3),(66,22,0,654,500,212,0,0,1,1,0,1,0,0,'',0,0,'',3),(67,22,0,650,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(68,22,0,652,500,100,0,1,1,1,0,1,0,0,'',0,0,'',3),(69,22,0,648,500,128,1,1,1,1,0,1,0,0,'',0,0,'',3),(70,23,0,655,500,212,0,0,1,1,0,1,0,0,'',0,0,'',3),(71,23,0,651,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(72,23,0,653,555,114,0,1,1,1,0,1,0,0,'',0,0,'',3),(73,23,0,649,500,128,1,1,1,1,0,1,0,0,'',0,0,'',3),(74,23,0,647,500,160,0,2,2,1,0,0,0,0,'',0,0,'',3),(75,24,0,568,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(76,24,0,570,500,148,1,0,1,1,0,1,0,0,'',0,0,'',3),(77,24,0,606,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(78,25,0,569,500,100,0,0,1,1,0,0,0,0,'',0,0,'',3),(79,25,0,605,500,100,1,0,1,1,0,0,0,0,'',0,0,'',3),(80,25,1,24022,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(81,25,1,24019,500,100,1,1,1,1,0,0,0,0,'',0,0,'',3);
/*!40000 ALTER TABLE `screens_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scripts`
--

DROP TABLE IF EXISTS `scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scripts` (
  `scriptid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `command` varchar(255) NOT NULL DEFAULT '',
  `host_access` int(11) NOT NULL DEFAULT '2',
  `usrgrpid` bigint(20) unsigned DEFAULT NULL,
  `groupid` bigint(20) unsigned DEFAULT NULL,
  `description` text NOT NULL,
  `confirmation` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `execute_on` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`scriptid`),
  UNIQUE KEY `scripts_3` (`name`),
  KEY `scripts_1` (`usrgrpid`),
  KEY `scripts_2` (`groupid`),
  CONSTRAINT `c_scripts_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`),
  CONSTRAINT `c_scripts_1` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripts`
--

LOCK TABLES `scripts` WRITE;
/*!40000 ALTER TABLE `scripts` DISABLE KEYS */;
INSERT INTO `scripts` VALUES (1,'Ping','/bin/ping -c 3 {HOST.CONN} 2>&1',2,NULL,NULL,'','',0,1),(2,'Traceroute','/bin/traceroute {HOST.CONN} 2>&1',2,NULL,NULL,'','',0,1),(3,'Detect operating system','sudo /usr/bin/nmap -O {HOST.CONN} 2>&1',2,7,NULL,'','',0,1);
/*!40000 ALTER TABLE `scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_alarms`
--

DROP TABLE IF EXISTS `service_alarms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_alarms` (
  `servicealarmid` bigint(20) unsigned NOT NULL,
  `serviceid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`servicealarmid`),
  KEY `service_alarms_1` (`serviceid`,`clock`),
  KEY `service_alarms_2` (`clock`),
  CONSTRAINT `c_service_alarms_1` FOREIGN KEY (`serviceid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_alarms`
--

LOCK TABLES `service_alarms` WRITE;
/*!40000 ALTER TABLE `service_alarms` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_alarms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `serviceid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `algorithm` int(11) NOT NULL DEFAULT '0',
  `triggerid` bigint(20) unsigned DEFAULT NULL,
  `showsla` int(11) NOT NULL DEFAULT '0',
  `goodsla` double(16,4) NOT NULL DEFAULT '99.9000',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`serviceid`),
  KEY `services_1` (`triggerid`),
  CONSTRAINT `c_services_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_links`
--

DROP TABLE IF EXISTS `services_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_links` (
  `linkid` bigint(20) unsigned NOT NULL,
  `serviceupid` bigint(20) unsigned NOT NULL,
  `servicedownid` bigint(20) unsigned NOT NULL,
  `soft` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  UNIQUE KEY `services_links_2` (`serviceupid`,`servicedownid`),
  KEY `services_links_1` (`servicedownid`),
  CONSTRAINT `c_services_links_2` FOREIGN KEY (`servicedownid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE,
  CONSTRAINT `c_services_links_1` FOREIGN KEY (`serviceupid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_links`
--

LOCK TABLES `services_links` WRITE;
/*!40000 ALTER TABLE `services_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_times`
--

DROP TABLE IF EXISTS `services_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_times` (
  `timeid` bigint(20) unsigned NOT NULL,
  `serviceid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `ts_from` int(11) NOT NULL DEFAULT '0',
  `ts_to` int(11) NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`timeid`),
  KEY `services_times_1` (`serviceid`,`type`,`ts_from`,`ts_to`),
  CONSTRAINT `c_services_times_1` FOREIGN KEY (`serviceid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_times`
--

LOCK TABLES `services_times` WRITE;
/*!40000 ALTER TABLE `services_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sessionid` varchar(32) NOT NULL DEFAULT '',
  `userid` bigint(20) unsigned NOT NULL,
  `lastaccess` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sessionid`),
  KEY `sessions_1` (`userid`,`status`),
  CONSTRAINT `c_sessions_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('391dc181f506d12dd3a255a9791959e2',1,1492253851,0),('a505292d98cc94a03559fe24079c4f9d',1,1490926267,0),('b77069254195de422976ae35185cf5b9',1,1490927149,0);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `slideid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `step` int(11) NOT NULL DEFAULT '0',
  `delay` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slideid`),
  KEY `slides_1` (`slideshowid`),
  KEY `slides_2` (`screenid`),
  CONSTRAINT `c_slides_2` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE,
  CONSTRAINT `c_slides_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshow_user`
--

DROP TABLE IF EXISTS `slideshow_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshow_user` (
  `slideshowuserid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`slideshowuserid`),
  UNIQUE KEY `slideshow_user_1` (`slideshowid`,`userid`),
  KEY `c_slideshow_user_2` (`userid`),
  CONSTRAINT `c_slideshow_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_slideshow_user_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshow_user`
--

LOCK TABLES `slideshow_user` WRITE;
/*!40000 ALTER TABLE `slideshow_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshow_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshow_usrgrp`
--

DROP TABLE IF EXISTS `slideshow_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshow_usrgrp` (
  `slideshowusrgrpid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`slideshowusrgrpid`),
  UNIQUE KEY `slideshow_usrgrp_1` (`slideshowid`,`usrgrpid`),
  KEY `c_slideshow_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_slideshow_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_slideshow_usrgrp_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshow_usrgrp`
--

LOCK TABLES `slideshow_usrgrp` WRITE;
/*!40000 ALTER TABLE `slideshow_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshow_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshows`
--

DROP TABLE IF EXISTS `slideshows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshows` (
  `slideshowid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `delay` int(11) NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`slideshowid`),
  UNIQUE KEY `slideshows_1` (`name`),
  KEY `c_slideshows_3` (`userid`),
  CONSTRAINT `c_slideshows_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshows`
--

LOCK TABLES `slideshows` WRITE;
/*!40000 ALTER TABLE `slideshows` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_element_url`
--

DROP TABLE IF EXISTS `sysmap_element_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_element_url` (
  `sysmapelementurlid` bigint(20) unsigned NOT NULL,
  `selementid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`sysmapelementurlid`),
  UNIQUE KEY `sysmap_element_url_1` (`selementid`,`name`),
  CONSTRAINT `c_sysmap_element_url_1` FOREIGN KEY (`selementid`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_element_url`
--

LOCK TABLES `sysmap_element_url` WRITE;
/*!40000 ALTER TABLE `sysmap_element_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_element_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_url`
--

DROP TABLE IF EXISTS `sysmap_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_url` (
  `sysmapurlid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `elementtype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sysmapurlid`),
  UNIQUE KEY `sysmap_url_1` (`sysmapid`,`name`),
  CONSTRAINT `c_sysmap_url_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_url`
--

LOCK TABLES `sysmap_url` WRITE;
/*!40000 ALTER TABLE `sysmap_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_user`
--

DROP TABLE IF EXISTS `sysmap_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_user` (
  `sysmapuserid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`sysmapuserid`),
  UNIQUE KEY `sysmap_user_1` (`sysmapid`,`userid`),
  KEY `c_sysmap_user_2` (`userid`),
  CONSTRAINT `c_sysmap_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_user_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_user`
--

LOCK TABLES `sysmap_user` WRITE;
/*!40000 ALTER TABLE `sysmap_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_usrgrp`
--

DROP TABLE IF EXISTS `sysmap_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_usrgrp` (
  `sysmapusrgrpid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`sysmapusrgrpid`),
  UNIQUE KEY `sysmap_usrgrp_1` (`sysmapid`,`usrgrpid`),
  KEY `c_sysmap_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_sysmap_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_usrgrp_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_usrgrp`
--

LOCK TABLES `sysmap_usrgrp` WRITE;
/*!40000 ALTER TABLE `sysmap_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps`
--

DROP TABLE IF EXISTS `sysmaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps` (
  `sysmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '600',
  `height` int(11) NOT NULL DEFAULT '400',
  `backgroundid` bigint(20) unsigned DEFAULT NULL,
  `label_type` int(11) NOT NULL DEFAULT '2',
  `label_location` int(11) NOT NULL DEFAULT '0',
  `highlight` int(11) NOT NULL DEFAULT '1',
  `expandproblem` int(11) NOT NULL DEFAULT '1',
  `markelements` int(11) NOT NULL DEFAULT '0',
  `show_unack` int(11) NOT NULL DEFAULT '0',
  `grid_size` int(11) NOT NULL DEFAULT '50',
  `grid_show` int(11) NOT NULL DEFAULT '1',
  `grid_align` int(11) NOT NULL DEFAULT '1',
  `label_format` int(11) NOT NULL DEFAULT '0',
  `label_type_host` int(11) NOT NULL DEFAULT '2',
  `label_type_hostgroup` int(11) NOT NULL DEFAULT '2',
  `label_type_trigger` int(11) NOT NULL DEFAULT '2',
  `label_type_map` int(11) NOT NULL DEFAULT '2',
  `label_type_image` int(11) NOT NULL DEFAULT '2',
  `label_string_host` varchar(255) NOT NULL DEFAULT '',
  `label_string_hostgroup` varchar(255) NOT NULL DEFAULT '',
  `label_string_trigger` varchar(255) NOT NULL DEFAULT '',
  `label_string_map` varchar(255) NOT NULL DEFAULT '',
  `label_string_image` varchar(255) NOT NULL DEFAULT '',
  `iconmapid` bigint(20) unsigned DEFAULT NULL,
  `expand_macros` int(11) NOT NULL DEFAULT '0',
  `severity_min` int(11) NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sysmapid`),
  UNIQUE KEY `sysmaps_1` (`name`),
  KEY `sysmaps_2` (`backgroundid`),
  KEY `sysmaps_3` (`iconmapid`),
  KEY `c_sysmaps_3` (`userid`),
  CONSTRAINT `c_sysmaps_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `c_sysmaps_1` FOREIGN KEY (`backgroundid`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_2` FOREIGN KEY (`iconmapid`) REFERENCES `icon_map` (`iconmapid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps`
--

LOCK TABLES `sysmaps` WRITE;
/*!40000 ALTER TABLE `sysmaps` DISABLE KEYS */;
INSERT INTO `sysmaps` VALUES (1,'Local network',680,200,NULL,0,0,1,1,1,0,50,1,1,0,2,2,2,2,2,'','','','','',NULL,1,0,1,0);
/*!40000 ALTER TABLE `sysmaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_elements`
--

DROP TABLE IF EXISTS `sysmaps_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_elements` (
  `selementid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `elementid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `elementtype` int(11) NOT NULL DEFAULT '0',
  `iconid_off` bigint(20) unsigned DEFAULT NULL,
  `iconid_on` bigint(20) unsigned DEFAULT NULL,
  `label` varchar(2048) NOT NULL DEFAULT '',
  `label_location` int(11) NOT NULL DEFAULT '-1',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `iconid_disabled` bigint(20) unsigned DEFAULT NULL,
  `iconid_maintenance` bigint(20) unsigned DEFAULT NULL,
  `elementsubtype` int(11) NOT NULL DEFAULT '0',
  `areatype` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '200',
  `height` int(11) NOT NULL DEFAULT '200',
  `viewtype` int(11) NOT NULL DEFAULT '0',
  `use_iconmap` int(11) NOT NULL DEFAULT '1',
  `application` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`selementid`),
  KEY `sysmaps_elements_1` (`sysmapid`),
  KEY `sysmaps_elements_2` (`iconid_off`),
  KEY `sysmaps_elements_3` (`iconid_on`),
  KEY `sysmaps_elements_4` (`iconid_disabled`),
  KEY `sysmaps_elements_5` (`iconid_maintenance`),
  CONSTRAINT `c_sysmaps_elements_5` FOREIGN KEY (`iconid_maintenance`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_elements_2` FOREIGN KEY (`iconid_off`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_3` FOREIGN KEY (`iconid_on`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_4` FOREIGN KEY (`iconid_disabled`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_elements`
--

LOCK TABLES `sysmaps_elements` WRITE;
/*!40000 ALTER TABLE `sysmaps_elements` DISABLE KEYS */;
INSERT INTO `sysmaps_elements` VALUES (1,1,10084,0,185,NULL,'{HOST.NAME}\r\n{HOST.CONN}',0,111,61,NULL,NULL,0,0,200,200,0,0,'');
/*!40000 ALTER TABLE `sysmaps_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_link_triggers`
--

DROP TABLE IF EXISTS `sysmaps_link_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_link_triggers` (
  `linktriggerid` bigint(20) unsigned NOT NULL,
  `linkid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '000000',
  PRIMARY KEY (`linktriggerid`),
  UNIQUE KEY `sysmaps_link_triggers_1` (`linkid`,`triggerid`),
  KEY `sysmaps_link_triggers_2` (`triggerid`),
  CONSTRAINT `c_sysmaps_link_triggers_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_link_triggers_1` FOREIGN KEY (`linkid`) REFERENCES `sysmaps_links` (`linkid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_link_triggers`
--

LOCK TABLES `sysmaps_link_triggers` WRITE;
/*!40000 ALTER TABLE `sysmaps_link_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmaps_link_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_links`
--

DROP TABLE IF EXISTS `sysmaps_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_links` (
  `linkid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `selementid1` bigint(20) unsigned NOT NULL,
  `selementid2` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '000000',
  `label` varchar(2048) NOT NULL DEFAULT '',
  PRIMARY KEY (`linkid`),
  KEY `sysmaps_links_1` (`sysmapid`),
  KEY `sysmaps_links_2` (`selementid1`),
  KEY `sysmaps_links_3` (`selementid2`),
  CONSTRAINT `c_sysmaps_links_3` FOREIGN KEY (`selementid2`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_links_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_links_2` FOREIGN KEY (`selementid1`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_links`
--

LOCK TABLES `sysmaps_links` WRITE;
/*!40000 ALTER TABLE `sysmaps_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmaps_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeperiods`
--

DROP TABLE IF EXISTS `timeperiods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeperiods` (
  `timeperiodid` bigint(20) unsigned NOT NULL,
  `timeperiod_type` int(11) NOT NULL DEFAULT '0',
  `every` int(11) NOT NULL DEFAULT '1',
  `month` int(11) NOT NULL DEFAULT '0',
  `dayofweek` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `period` int(11) NOT NULL DEFAULT '0',
  `start_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`timeperiodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeperiods`
--

LOCK TABLES `timeperiods` WRITE;
/*!40000 ALTER TABLE `timeperiods` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeperiods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trends`
--

DROP TABLE IF EXISTS `trends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trends` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `value_min` double(16,4) NOT NULL DEFAULT '0.0000',
  `value_avg` double(16,4) NOT NULL DEFAULT '0.0000',
  `value_max` double(16,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trends`
--

LOCK TABLES `trends` WRITE;
/*!40000 ALTER TABLE `trends` DISABLE KEYS */;
/*!40000 ALTER TABLE `trends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trends_uint`
--

DROP TABLE IF EXISTS `trends_uint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trends_uint` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `value_min` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_avg` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_max` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trends_uint`
--

LOCK TABLES `trends_uint` WRITE;
/*!40000 ALTER TABLE `trends_uint` DISABLE KEYS */;
/*!40000 ALTER TABLE `trends_uint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_depends`
--

DROP TABLE IF EXISTS `trigger_depends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_depends` (
  `triggerdepid` bigint(20) unsigned NOT NULL,
  `triggerid_down` bigint(20) unsigned NOT NULL,
  `triggerid_up` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`triggerdepid`),
  UNIQUE KEY `trigger_depends_1` (`triggerid_down`,`triggerid_up`),
  KEY `trigger_depends_2` (`triggerid_up`),
  CONSTRAINT `c_trigger_depends_2` FOREIGN KEY (`triggerid_up`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_trigger_depends_1` FOREIGN KEY (`triggerid_down`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_depends`
--

LOCK TABLES `trigger_depends` WRITE;
/*!40000 ALTER TABLE `trigger_depends` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger_depends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_discovery`
--

DROP TABLE IF EXISTS `trigger_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_discovery` (
  `triggerid` bigint(20) unsigned NOT NULL,
  `parent_triggerid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`triggerid`),
  KEY `trigger_discovery_1` (`parent_triggerid`),
  CONSTRAINT `c_trigger_discovery_2` FOREIGN KEY (`parent_triggerid`) REFERENCES `triggers` (`triggerid`),
  CONSTRAINT `c_trigger_discovery_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_discovery`
--

LOCK TABLES `trigger_discovery` WRITE;
/*!40000 ALTER TABLE `trigger_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `triggers`
--

DROP TABLE IF EXISTS `triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triggers` (
  `triggerid` bigint(20) unsigned NOT NULL,
  `expression` varchar(2048) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `lastchange` int(11) NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  `error` varchar(128) NOT NULL DEFAULT '',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`triggerid`),
  KEY `triggers_1` (`status`),
  KEY `triggers_2` (`value`,`lastchange`),
  KEY `triggers_3` (`templateid`),
  CONSTRAINT `c_triggers_1` FOREIGN KEY (`templateid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `triggers`
--

LOCK TABLES `triggers` WRITE;
/*!40000 ALTER TABLE `triggers` DISABLE KEYS */;
INSERT INTO `triggers` VALUES (13075,'{12648}<5','Less than 5% free in the value cache','',0,0,3,0,'','',NULL,0,0,0),(13436,'({TRIGGER.VALUE}=0 and {13136}>75) or ({TRIGGER.VALUE}=1 and {13136}>65)','Zabbix vmware collector processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13467,'({TRIGGER.VALUE}=0 and {13100}>75) or ({TRIGGER.VALUE}=1 and {13100}>65)','Zabbix alerter processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13468,'({TRIGGER.VALUE}=0 and {13102}>75) or ({TRIGGER.VALUE}=1 and {13102}>65)','Zabbix configuration syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13469,'({TRIGGER.VALUE}=0 and {13104}>75) or ({TRIGGER.VALUE}=1 and {13104}>65)','Zabbix db watchdog processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13470,'({TRIGGER.VALUE}=0 and {13106}>75) or ({TRIGGER.VALUE}=1 and {13106}>65)','Zabbix discoverer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13471,'({TRIGGER.VALUE}=0 and {13108}>75) or ({TRIGGER.VALUE}=1 and {13108}>65)','Zabbix escalator processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13472,'({TRIGGER.VALUE}=0 and {13110}>75) or ({TRIGGER.VALUE}=1 and {13110}>65)','Zabbix history syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13473,'({TRIGGER.VALUE}=0 and {13112}>75) or ({TRIGGER.VALUE}=1 and {13112}>65)','Zabbix housekeeper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13474,'({TRIGGER.VALUE}=0 and {13114}>75) or ({TRIGGER.VALUE}=1 and {13114}>65)','Zabbix http poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13475,'({TRIGGER.VALUE}=0 and {13116}>75) or ({TRIGGER.VALUE}=1 and {13116}>65)','Zabbix icmp pinger processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13476,'({TRIGGER.VALUE}=0 and {13118}>75) or ({TRIGGER.VALUE}=1 and {13118}>65)','Zabbix ipmi poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13477,'({TRIGGER.VALUE}=0 and {13120}>75) or ({TRIGGER.VALUE}=1 and {13120}>65)','Zabbix java poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13479,'({TRIGGER.VALUE}=0 and {13124}>75) or ({TRIGGER.VALUE}=1 and {13124}>65)','Zabbix poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13480,'({TRIGGER.VALUE}=0 and {13126}>75) or ({TRIGGER.VALUE}=1 and {13126}>65)','Zabbix proxy poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13481,'({TRIGGER.VALUE}=0 and {13030}>75) or ({TRIGGER.VALUE}=1 and {13030}>65)','Zabbix self-monitoring processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13482,'({TRIGGER.VALUE}=0 and {13128}>75) or ({TRIGGER.VALUE}=1 and {13128}>65)','Zabbix snmp trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13483,'({TRIGGER.VALUE}=0 and {13130}>75) or ({TRIGGER.VALUE}=1 and {13130}>65)','Zabbix timer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13484,'({TRIGGER.VALUE}=0 and {13132}>75) or ({TRIGGER.VALUE}=1 and {13132}>65)','Zabbix trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13485,'({TRIGGER.VALUE}=0 and {13134}>75) or ({TRIGGER.VALUE}=1 and {13134}>65)','Zabbix unreachable poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13486,'{12895}>100','More than 100 items having missing data for more than 10 minutes','',0,0,2,0,'zabbix[queue,10m] item is collecting data about how many items are missing data for more than 10 minutes (next parameter)','',NULL,0,0,0),(13487,'{12896}<25','Less than 25% free in the configuration cache','',0,0,3,0,'Consider increasing CacheSize in the zabbix_server.conf configuration file','',NULL,0,0,0),(13488,'{12897}<25','Less than 25% free in the history cache','',0,0,3,0,'','',NULL,0,0,0),(13489,'{12898}<25','Less than 25% free in the history index cache','',0,0,3,0,'','',NULL,0,0,0),(13490,'{12899}<25','Less than 25% free in the trends cache','',0,0,3,0,'','',NULL,0,0,0),(13491,'{12900}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',NULL,0,0,0),(13492,'{12928}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0),(13493,'{12902}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0),(13494,'{12903}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0),(13495,'{13085}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0),(13496,'{13083}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0),(13497,'{13079}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0),(13498,'{13081}>20','Disk I/O is overloaded on {HOST.NAME}','',0,0,2,0,'OS spends significant time waiting for I/O (input/output) operations. It could be indicator of performance issues with storage system.','',NULL,0,0,0),(13499,'{12908}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0),(13500,'{12909}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',NULL,0,0,0),(13501,'{12910}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0),(13502,'{12911}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0),(13503,'{12912}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0),(13504,'{12913}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0),(13505,'{12914}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2),(13506,'{12915}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2),(13509,'{12938}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0),(13537,'{12966}<25','Less than 25% free in the vmware cache','',0,0,3,0,'','',NULL,0,0,0),(13558,'{13161}=1','Zabbix value cache working in low memory mode','',0,0,4,0,'','',NULL,0,0,0),(13696,'{13299}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,3,0,'Password has been changed','',NULL,0,0,0),(13697,'{13300}<>1','Auto Increment Control is disabled','',0,0,2,0,'It is recommended to use Auto Increment Control of Galera Cluster.','',NULL,0,0,0),(13698,'{13301}>0','Binary Log Do Filter is enabled','',0,0,2,0,'You have a Binary Log filter enabled on the master. This is dangerous when you are using this binary log for replication or Point-in-Time-Recovery.','',NULL,0,0,0),(13699,'{13302}>0','Binary Log Ignore Filter is enabled','',0,0,2,0,'You have a Binary Log filter enabled on the master. This is dangerous when you are using this binary log for replication or Point-in-Time-Recovery.','',NULL,0,0,0),(13700,'{13303}<>1','Binary Log is disabled','',0,0,2,0,'Binary Log is disabled. This prohibits you to do Point in Time Recovery (PiTR).','',NULL,0,0,0),(13701,'({13304}>0 or {13305}>0) and {13306}=1','Binlog format MIXED with filtering','http://mysql-forum.ch/showthread.php?tid=6747',0,0,3,0,'Binlog Format MIXED changes the format (ROW/STATEMENT) depending on the queries. This makes it impossible to define correctly working filter rules.','',NULL,1,0,0),(13702,'{13307}<1048576 and {13307}>0','Binlog Statement Cache size too small','',0,0,2,0,'Binlog Statement Cache size is possibly to small. A value of 1 Mbyte or higher is typically OK.','',NULL,0,0,0),(13703,'{13308}<1048576','Binlog Transaction Cache size too small','',0,0,2,0,'Binlog Transaction Cache size is possibly to small. A value of 1 Mbyte or higher is typically OK.','',NULL,0,0,0),(13704,'{13309}<>1','Causal Reads is enabled','',0,0,1,0,'Causal reads has some performance impacts. You should only use it if you really need it. For example in automated Read/Write splitting.','',NULL,0,0,0),(13705,'{13310}=1','CEPH critical error','',0,0,3,0,'CEPH encounters a citical issue needing immediate fix.','',NULL,0,0,0),(13706,'{13311}=2','CEPH warning','',0,0,2,0,'CEPH is in wrong status, but still can run normally now.','',NULL,0,0,0),(13707,'{13312}=1','Character Set of Server is utf8','',1,0,1,0,'The Character Set of your Server is utf8. This has performance impacts.','',NULL,0,0,0),(13708,'{13313}=1','Cluster Configuration has changed','',0,0,3,0,'Cluster Configuration ID has changed. This typically means that one node has left or joined the Cluster. You should investigate for the reason.','',NULL,0,0,0),(13709,'{13314}>0.1','Cluster is slowed down due to slave lag','',0,0,2,0,'Replication is paused from time to time. This means Cluster is slowed due to slave lag. Improve this situation by increasing wsrep_slave_threads and dropping slow nodes out of the Cluster.','',NULL,0,0,0),(13710,'{13315}<>1','Cluster node status','',0,0,3,0,'Cluster node status is not Primary. This could mean that the Cluster is partitioned or you met a split-brain condition. You should investigate.','',NULL,0,0,0),(13711,'{13316}<>3','Cluster size is different from expected','',0,0,3,0,'Cluster size is different from what is expected. If you have a 2+1 Cluster or a Cluster consisting of more than 4 nodes you have to adapt the Trigger!','',NULL,0,0,0),(13712,'{13317}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'Configured max number of opened files is too low','',NULL,0,0,0),(13713,'{13318}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'Configured max number of processes is too low','',NULL,0,0,0),(13714,'{13319}>20','CPU interrupt time {HOST.NAME}','',0,0,2,0,'CPU interrupt time','',NULL,0,0,0),(13715,'{13320}<>1','Default Storage Engine is not InnoDB','',0,0,2,0,'Your Default Storage Engine is not set to InnoDB.','',NULL,0,0,0),(13716,'{13321}>35','Disk I/O is overloaded on {HOST.NAME}','',0,0,2,0,'OS spends significant time waiting for I/O (input/output) operations. It could be indicator of performance issues with storage system.','',NULL,0,0,0),(13717,'{13322}=0','fpmmm Agent is down','',0,0,4,0,'fpmmm Agent was not reachable. We assume it is down!','',NULL,0,0,0),(13718,'{13323}=0 and {13324}=1','fpmmm MaaS Agent is not sending data','',0,0,4,0,'fpmmm MaaS Agent did not send any data during the last 5 minutes. This can be due to troubles with the network or because it was not running. Please check in the log file for more information.','',NULL,0,0,0),(13719,'{13325}=1 and {13326}=0','fpmmm MaaS Agent is sending data again','',0,0,1,0,'fpmmm MaaS Agent is sending data again after a gap in the past.','',NULL,0,0,0),(13720,'{13327}<010001','fpmmm Version','http://mysql-forum.ch/showthread.php?tid=6748',0,0,1,0,'You are using an old version of fpmmm/mpm. Please consider using a more actual version: http://fromdual.com/fromdual-performance-monitor-for-mysql-and-mariadb-1.0.1-has-been-released','',NULL,0,0,0),(13721,'{13328}=1','General Log is enabled','',0,0,2,0,'Your General Log is enabled. If this is a production Server under high load, this is not recommended.','',NULL,0,0,0),(13722,'{13329}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'Host information was changed','',NULL,0,0,0),(13723,'{13330}>0','Host information was changed on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0),(13724,'{13331}=1','InnoDB Buffer Pool Instances is too small','http://mysql-forum.ch/showthread.php?tid=6750',1,0,1,0,'If you are using MySQL 5.5 and higher you should use several InnoDB Buffer Pool Instances for performance reasons.\r\nSome rules are: InnoDB Buffer Pool Instance should be at least 1 Gbyte in size.\r\nInnoDB Buffer Pool Instances you can set equal to the number of cores of your machine.','',NULL,0,0,0),(13725,'{13332}>0','InnoDB Deadlock detected','http://mysql-forum.ch/showthread.php?tid=6751',0,0,1,0,'You got an InnoDB Deadlock. Please talk to your development department to fix this. Deadlocks are an application problem!','',NULL,1,0,0),(13726,'{13333}<>1','InnoDB Flush Log at Transaction Commit','http://mysql-forum.ch/showthread.php?tid=6752',1,0,1,0,'InnoDB Flush Log at Transaction Commit is set to a values != 1. This can lead to a loss of commited transactions in case of a power failure.','',NULL,0,0,0),(13727,'{13334}=1','InnoDB Flush Method has changed','http://mysql-forum.ch/showthread.php?tid=6571',0,0,2,0,'The InnoDB Flush Method has changed. This can have an impact on InnoDB write Performance.','',NULL,0,0,0),(13728,'{13335}<>0','InnoDB Force Recovery is enabled','http://mysql-forum.ch/showthread.php?tid=6753',0,0,3,0,'InnoDB Force Recovery is enabled. This mode should be used for data recovery purposes only. It prohibits writing to the data.','',NULL,0,0,0),(13729,'{13336}>0','InnoDB Foreign Key error detected','http://mysql-forum.ch/showthread.php?tid=6754',0,0,2,0,'You got an InnoDB Foreign Key error. Talk to your development department to fix this.','',NULL,1,0,0),(13730,'{13337}>{13338}','InnoDB Log Buffer too small','',0,0,2,0,'InnoDB Log Buffer size is possible too small for the current traffic.','',NULL,0,0,0),(13731,'{13339}<16777216','InnoDB Log File size is too small','http://mysql-forum.ch/showthread.php?tid=6755',0,0,2,0,'The InnoDB Log File size is possibly too small. Choosing a small InnoDB Log File size can have significant performance impacts.','',NULL,0,0,0),(13732,'{13340}>{13341}*{13342}','InnoDB Log File size is too small','',0,0,2,0,'Log File Size is possibly too small for the current traffic.','',NULL,0,0,0),(13733,'{13343}=1','InnoDB Plugin is enabled','http://mysql-forum.ch/showthread.php?tid=6756',0,0,1,0,'InnoDB Plugin is enabled','',NULL,0,0,0),(13734,'{13344}=0','IO thread stopped','',0,0,4,0,'IO thread has stopped. This is usually because it cannot connect to the Master any more.','',NULL,0,0,0),(13735,'{13345}<1000M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'Lack of available memory','',NULL,0,0,0),(13736,'{13346}<10000','Lack of free memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0),(13737,'{13347}<100000','Lack of free swap space on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0),(13738,'{13348}<5','Less than 5% free in the value cache','',0,0,3,0,'','',NULL,0,0,0),(13739,'{13349}<25','Less than 25% free in the configuration cache','',0,0,3,0,'Consider increasing CacheSize in the zabbix_server.conf configuration file','',NULL,0,0,0),(13740,'{13350}<25','Less than 25% free in the configuration cache','',0,0,3,0,'Consider increasing CacheSize in the zabbix_server.conf configuration file','',NULL,0,0,0),(13741,'{13351}<25','Less than 25% free in the history cache','',0,0,3,0,'Less than 25% free in the history cache','',NULL,0,0,0),(13742,'{13352}<25','Less than 25% free in the history cache','',0,0,3,0,'','',NULL,0,0,0),(13743,'{13353}<25','Less than 25% free in the history index cache','',0,0,3,0,'','',NULL,0,0,0),(13744,'{13354}<25','Less than 25% free in the text history cache','',0,0,3,0,'','',NULL,0,0,0),(13745,'{13355}<25','Less than 25% free in the trends cache','',0,0,3,0,'','',NULL,0,0,0),(13746,'{13356}<25','Less than 25% free in the vmware cache','',0,0,3,0,'','',NULL,0,0,0),(13747,'{13357}<>1','Log Output is other than File','',0,0,2,0,'Your Log Output is not File. It can lead to problems when you run to Table for too long time.','',NULL,0,0,0),(13748,'{13358}=0','Log Queries not using Indexes is disabled','',1,0,1,0,'You have not enabled log_queries_not_using_indexes. This could help you finding slow queries.','',NULL,0,0,0),(13749,'{13359}<25','Low free disk space','',0,0,2,0,'Low on free disk space. You disk is used up to 75%','',NULL,0,0,0),(13750,'{13360}<25','Low free disk space','',0,0,2,0,'Low on free disk space. You disk is used up to 75%','',NULL,0,0,0),(13751,'{13361}>100','More than 100 items having missing data for more than 10 minutes','',0,0,2,0,'zabbix[queue,10m] item is collecting data about how many items are missing data for more than 10 minutes (next parameter)','',NULL,0,0,0),(13752,'{13362}>100','More than 100 items having missing data for more than 10 minutes','',0,0,2,0,'zabbix[queue,10m] item is collecting data about how many items are missing data for more than 10 minutes (next parameter)','',NULL,0,0,0),(13753,'{13363}=0','MySQL is down','',0,0,2,0,'','',NULL,0,0,0),(13754,'{13364}=0','MySQL is down','',0,0,5,0,'MySQL database is down. This requires immediate action!','',NULL,1,0,0),(13755,'{13365}=1 and {13366}=1','MySQL is up again','',0,0,1,0,'MySQL database is up again. Please investigate why it was down before...','',NULL,1,0,0),(13756,'{13367}<>1','Node is not ready','',0,0,3,0,'Node is not ready. It cannot accept SQL node right now. Check why.','',NULL,0,0,0),(13757,'{13368}=0','nova-novncproxy has  down','',0,0,3,0,'','',NULL,0,0,0),(13758,'{13369}<>1','Old Binlog Format is still used','',0,0,3,0,'Old (and default) Binlog Format is STATEMENT (SBR). This can lead to inconsistent data in your replication. It is recommended to use Row Based Replication (SBR). This is possible from MySQL v5.1 and newer.','',NULL,0,0,0),(13759,'{13370}>{13371}*0.75','Open files high','',0,0,1,0,'Open files is high. Please consider increasing open_files_limit.','',NULL,1,0,0),(13760,'{13372}=0','openstack ceilometer-agent-notification has down','',0,0,3,0,'','',NULL,0,0,0),(13761,'{13373}=0','openstack ceilometer-collector has down','',0,0,3,0,'','',NULL,0,0,0),(13762,'{13374}<>1','openstack ceilometer-polling has down','',0,0,3,0,'','',NULL,0,0,0),(13763,'{13375}=0','openstack ceilometer-polling has down','',0,0,3,0,'','',NULL,0,0,0),(13764,'{13376}=0','openstack cinder-api has down','',0,0,3,0,'','',NULL,0,0,0),(13765,'{13377}=0','openstack cinder-scheduler has down','',0,0,3,0,'','',NULL,0,0,0),(13766,'{13378}<>1','openstack cinder-volume has down','',0,0,3,0,'','',NULL,0,0,0),(13767,'{13379}>1','Openstack cinder process status','',0,0,3,0,'The service of cinder which is down','',NULL,0,0,0),(13768,'{13380}=0','Openstack compute service cinder volume','',0,0,3,0,'Openstack compute service cinder volume error','',NULL,0,0,0),(13769,'{13381}=0','Openstack compute service libvirtd','',0,0,3,0,'Openstack compute service libvirtd error','',NULL,0,0,0),(13770,'{13382}=0','Openstack compute service neutron l3 agent','',0,0,3,0,'Openstack compute service neutron l3 agent','',NULL,0,0,0),(13771,'{13383}=0','Openstack compute service neutron metadata agent','',0,0,3,0,'Openstack compute service neutron metadata agent error','',NULL,0,0,0),(13772,'{13384}=0','Openstack compute service neutron openvswitch agent','',0,0,3,0,'Openstack compute service neutron openvswitch agent error','',NULL,0,0,0),(13773,'{13385}=0','Openstack compute service nova compute','',0,0,3,0,'Openstack compute service nova compute status','',NULL,0,0,0),(13791,'{13403}=0','openstack glance-api has down','',0,0,3,0,'','',NULL,0,0,0),(13792,'{13404}=0','openstack glance-registry has down','',0,0,3,0,'','',NULL,0,0,0),(13794,'{13406}=0','openstack httpd has down','',0,0,3,0,'','',NULL,0,0,0),(13795,'{13407}=0','openstack httpd has down','',0,0,3,0,'','',NULL,0,0,0),(13796,'{13408}<>1','openstack libvirtd has down','',0,0,3,0,'','',NULL,0,0,0),(13797,'{13409}=0','openstack memcached has down','',0,0,3,0,'','',NULL,0,0,0),(13798,'{13410}=0','openstack mysqld has down','',0,0,3,0,'','',NULL,0,0,0),(13799,'{13411}<>1','openstack neutron-dhcp-agent has down','',0,0,3,0,'','',NULL,0,0,0),(13800,'{13412}=0','openstack neutron-l3-agent has down','',0,0,3,0,'','',NULL,0,0,0),(13801,'{13413}=0','openstack neutron-l3-agent has down','',0,0,3,0,'','',NULL,0,0,0),(13802,'{13414}=0','openstack neutron-lbaasv2-agent has down','',0,0,3,0,'','',NULL,0,0,0),(13803,'{13415}=0','openstack  neutron-metadata-agent has down','',0,0,3,0,'','',NULL,0,0,0),(13804,'{13416}=0','openstack neutron-openvswitch-agent has down','',0,0,3,0,'','',NULL,0,0,0),(13805,'{13417}=0','openstack neutron-openvswitch-agent has down','',0,0,3,0,'','',NULL,0,0,0),(13806,'{13418}=0','openstack neutron-server has down','',0,0,3,0,'','',NULL,0,0,0),(13807,'{13419}>1','Openstack neutron process status','',0,0,3,0,'The service of neutron which is down','',NULL,0,0,0),(13808,'{13420}=0','openstack nova-api has down','',0,0,3,0,'','',NULL,0,0,0),(13809,'{13421}=0','openstack nova-cert has down','',0,0,3,0,'','',NULL,0,0,0),(13810,'{13422}=0','openstack nova-compute has down','',0,0,3,0,'','',NULL,0,0,0),(13811,'{13423}=0','openstack nova-conductor has down','',0,0,3,0,'','',NULL,0,0,0),(13812,'{13424}=0','openstack nova-consoleauth has down','',0,0,3,0,'','',NULL,0,0,0),(13813,'{13425}=0','openstack nova-novncproxy has down','',0,0,3,0,'','',NULL,0,0,0),(13814,'{13426}=0','openstack nova-scheduler has down','',0,0,3,0,'','',NULL,0,0,0),(13815,'{13427}<>1','Openstack nova process status','',0,0,3,0,'The service of nova which is down','',NULL,0,0,0),(13816,'{13428}=0','openstack ntpd has down','',0,0,3,0,'','',NULL,0,0,0),(13817,'{13429}=0','openstack openvswitch has down','',0,0,3,0,'','',NULL,0,0,0),(13818,'{13430}=0','openstack rabbitmq-server has down','',0,0,3,0,'','',NULL,0,0,0),(13819,'{13431}=0','Openstack service haproxy has down','',0,0,3,0,'','',NULL,0,0,0),(13820,'{13432}=0','Openstack service keepalived has down','',0,0,3,0,'','',NULL,0,0,0),(13821,'{13433}=0','openstack xinetd has down','',0,0,3,0,'','',NULL,0,0,0),(13822,'{13434}>5','Processor load is too high on(5min)  {HOST.NAME}','',0,0,2,0,'Processor load is too high (5min)','',NULL,0,0,0),(13823,'{13435}>5','Processor load is too high on (15min){HOST.NAME}','',0,0,2,0,'Processor load is too high(15min)','',NULL,0,0,0),(13824,'{13436}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'Processor load is too high （1min）','',NULL,0,0,0),(13825,'{13437}>5','Processor load is too high on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0),(13826,'{13438}>{13439}','Read buffer size is bigger than max. allowed packet size','',0,0,3,0,'Read buffer size (read_buffer_size) is bigger than max. allowed packet size (max_allowed_packet).\r\nThis can break your replication.','',NULL,0,0,0),(13827,'{13440}<>1','Slave errors are skipped!','',0,0,4,0,'Slave errors are skipped! This leads to data inconsistency!','',NULL,0,0,0),(13828,'{13441}<>1','Slave is NOT read only','',0,0,4,0,'Slave is NOT set to read only. You can accidentally manipulate data on the slave and get inconsistencies...','',NULL,0,0,0),(13829,'{13442}>30','Slave lagging behind Master','',0,0,2,0,'Slave is lagging behind Master. Please check if Slave threads are running and if there are some performance issues!','',NULL,0,0,0),(13830,'{13443}>30 and ({13444}<040000 or {13444}>120000)','Slave lagging behind Master','',1,0,2,0,'Slave is lagging behind Master. Please check if Slave threads are running and if there are some performance issues! But only while we do not backup...\r\nDo not check from 04:00 - 12:00','',NULL,0,0,0),(13831,'{13445}<256*1024 or {13446}>4*1024*1024','Sort buffer possibly missconfigured','',0,0,2,0,'Sort buffer size is either too big or too small. A good value for sort_buffer_size is between 256k and 4M.','',NULL,0,0,0),(13832,'{13447}=0','SQL thread stopped','',0,0,4,0,'SQL thread has stopped. This is usually because it cannot apply a SQL statement received from the master.','',NULL,0,0,0),(13833,'{13448}=0','SSH service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0),(13834,'{13449}=1','Sync Binlog is enabled','',0,0,2,0,'Sync Binlog is enabled. This leads to higher data security but on the cost of write performance.','',NULL,0,0,0),(13835,'{13450}>({13451}*99/100)','Table definition cache too small','http://mysql-forum.ch/showthread.php?tid=6745',0,0,1,0,'Your Table Definition Cache is possibly too small. If it is much too small this can have significant performance impacts!','',NULL,0,0,0),(13836,'{13452}>({13453}*99/100)','Table open cache too small','http://mysql-forum.ch/showthread.php?tid=6744',0,0,1,0,'Your Table Open Cache is possibly too small (old name Table Cache). If it is much too small this can have significant performance impacts!','',NULL,0,0,0),(13837,'{13454}<262144','Thread stack size is possibly too small','',0,0,1,0,'Thread stack size is possibly too small. This can cause problems when you use Stored Language constructs for example.\r\nA typical is 256k for thread_stack_size.','',NULL,0,0,0),(13838,'{13455}<196608','Thread stack size is too small','',0,0,2,0,'Thread stack size is too small. This can cause problems when you use Stored Language constructs for example.\r\nA typical is 256k for thread_stack_size.','',NULL,0,0,0),(13839,'{13456}>{13457}','Too little Slave Threads','',0,0,2,0,'More transactions might be applied in parallel than configured in wsrep_slave_threads.','',NULL,0,0,0),(13840,'{13458}>300','Too many processes on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0),(13841,'{13459}<>1','Transaction isolation level is set to non-default value','',0,0,1,0,'You transaction isolation level is set to an non-default value. Please consider its impacts.','',NULL,0,0,0),(13842,'{13460}<>1 and {13461}<>1','Transaction isolation level is set to non-recommended value','',0,0,1,0,'You transaction isolation level is set to an non-recommende value. Please consider its impacts.','',NULL,0,0,0),(13843,'{13462}<10','Very low free disk space','',0,0,4,0,'Very low on free disk space. You disk is used up to 90%','',NULL,0,0,0),(13844,'{13463}<10','Very low free disk space','',0,0,4,0,'Very low on free disk space. You disk is used up to 90%','',NULL,0,0,0),(13845,'{13464}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'Zabbix agent is unreachable for 5 minutes','',NULL,0,0,0),(13846,'{13465}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'Zabbix agent is unreachable for 5 minutes','',NULL,0,0,0),(13847,'{13466}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'Zabbix agent is unreachable for 5 minutes','',NULL,0,0,0),(13848,'({TRIGGER.VALUE}=0 and {13467}>75) or ({TRIGGER.VALUE}=1 and {13467}>65)','Zabbix alerter processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13849,'({TRIGGER.VALUE}=0 and {13468}>75) or ({TRIGGER.VALUE}=1 and {13468}>65)','Zabbix configuration syncer processes more than 75% busy','',0,0,3,0,'Zabbix configuration syncer processes more than 75% busy','',NULL,0,0,0),(13850,'({TRIGGER.VALUE}=0 and {13469}>75) or ({TRIGGER.VALUE}=1 and {13469}>65)','Zabbix configuration syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13851,'({TRIGGER.VALUE}=0 and {13470}>75) or ({TRIGGER.VALUE}=1 and {13470}>65)','Zabbix data sender processes more than 75% busy','',0,0,3,0,'Zabbix data sender processes more than 75% busy','',NULL,0,0,0),(13852,'({TRIGGER.VALUE}=0 and {13471}>75) or ({TRIGGER.VALUE}=1 and {13471}>65)','Zabbix db watchdog processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13853,'({TRIGGER.VALUE}=0 and {13472}>75) or ({TRIGGER.VALUE}=1 and {13472}>65)','Zabbix discoverer processes more than 75% busy','',0,0,3,0,'Zabbix discoverer processes more than 75% busy','',NULL,0,0,0),(13854,'({TRIGGER.VALUE}=0 and {13473}>75) or ({TRIGGER.VALUE}=1 and {13473}>65)','Zabbix discoverer processes more than 75% busy','',1,0,3,0,'','',NULL,0,0,0),(13855,'({TRIGGER.VALUE}=0 and {13474}>75) or ({TRIGGER.VALUE}=1 and {13474}>65)','Zabbix escalator processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13856,'({TRIGGER.VALUE}=0 and {13475}>75) or ({TRIGGER.VALUE}=1 and {13475}>65)','Zabbix heartbeat sender processes more than 75% busy','',0,0,3,0,'Zabbix heartbeat sender processes more than 75% busy','',NULL,0,0,0),(13857,'({TRIGGER.VALUE}=0 and {13476}>75) or ({TRIGGER.VALUE}=1 and {13476}>65)','Zabbix history syncer processes more than 75% busy','',0,0,3,0,'Zabbix history syncer processes more than 75% busy','',NULL,0,0,0),(13858,'({TRIGGER.VALUE}=0 and {13477}>75) or ({TRIGGER.VALUE}=1 and {13477}>65)','Zabbix history syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13859,'({TRIGGER.VALUE}=0 and {13478}>75) or ({TRIGGER.VALUE}=1 and {13478}>65)','Zabbix housekeeper processes more than 75% busy','',0,0,3,0,'Zabbix housekeeper processes more than 75% busy','',NULL,0,0,0),(13860,'({TRIGGER.VALUE}=0 and {13479}>75) or ({TRIGGER.VALUE}=1 and {13479}>65)','Zabbix housekeeper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13861,'({TRIGGER.VALUE}=0 and {13480}>75) or ({TRIGGER.VALUE}=1 and {13480}>65)','Zabbix http poller processes more than 75% busy','',0,0,3,0,'Zabbix http poller processes more than 75% busy','',NULL,0,0,0),(13862,'({TRIGGER.VALUE}=0 and {13481}>75) or ({TRIGGER.VALUE}=1 and {13481}>65)','Zabbix http poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13863,'({TRIGGER.VALUE}=0 and {13482}>75) or ({TRIGGER.VALUE}=1 and {13482}>65)','Zabbix icmp pinger processes more than 75% busy','',0,0,3,0,'Zabbix icmp pinger processes more than 75% busy','',NULL,0,0,0),(13864,'({TRIGGER.VALUE}=0 and {13483}>75) or ({TRIGGER.VALUE}=1 and {13483}>65)','Zabbix icmp pinger processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13865,'({TRIGGER.VALUE}=0 and {13484}>75) or ({TRIGGER.VALUE}=1 and {13484}>65)','Zabbix ipmi poller processes more than 75% busy','',0,0,3,0,'Zabbix ipmi poller processes more than 75% busy','',NULL,0,0,0),(13866,'({TRIGGER.VALUE}=0 and {13485}>75) or ({TRIGGER.VALUE}=1 and {13485}>65)','Zabbix ipmi poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13867,'({TRIGGER.VALUE}=0 and {13486}>75) or ({TRIGGER.VALUE}=1 and {13486}>65)','Zabbix java poller processes more than 75% busy','',0,0,3,0,'Zabbix java poller processes more than 75% busy','',NULL,0,0,0),(13868,'({TRIGGER.VALUE}=0 and {13487}>75) or ({TRIGGER.VALUE}=1 and {13487}>65)','Zabbix java poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13869,'({TRIGGER.VALUE}=0 and {13488}>75) or ({TRIGGER.VALUE}=1 and {13488}>65)','Zabbix poller processes more than 75% busy','',0,0,3,0,'Zabbix poller processes more than 75% busy','',NULL,0,0,0),(13870,'({TRIGGER.VALUE}=0 and {13489}>75) or ({TRIGGER.VALUE}=1 and {13489}>65)','Zabbix poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13871,'({TRIGGER.VALUE}=0 and {13490}>75) or ({TRIGGER.VALUE}=1 and {13490}>65)','Zabbix proxy poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13872,'({TRIGGER.VALUE}=0 and {13491}>75) or ({TRIGGER.VALUE}=1 and {13491}>65)','Zabbix self-monitoring processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13873,'({TRIGGER.VALUE}=0 and {13492}>75) or ({TRIGGER.VALUE}=1 and {13492}>65)','Zabbix self-monitoring processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13874,'({TRIGGER.VALUE}=0 and {13493}>75) or ({TRIGGER.VALUE}=1 and {13493}>65)','Zabbix snmp trapper processes more than 75% busy','',0,0,3,0,'Zabbix snmp trapper processes more than 75% busy','',NULL,0,0,0),(13875,'({TRIGGER.VALUE}=0 and {13494}>75) or ({TRIGGER.VALUE}=1 and {13494}>65)','Zabbix snmp trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13876,'({TRIGGER.VALUE}=0 and {13495}>75) or ({TRIGGER.VALUE}=1 and {13495}>65)','Zabbix timer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13877,'({TRIGGER.VALUE}=0 and {13496}>75) or ({TRIGGER.VALUE}=1 and {13496}>65)','Zabbix trapper processes more than 75% busy','',0,0,3,0,'Zabbix trapper processes more than 75% busy','',NULL,0,0,0),(13878,'({TRIGGER.VALUE}=0 and {13497}>75) or ({TRIGGER.VALUE}=1 and {13497}>65)','Zabbix trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13879,'({TRIGGER.VALUE}=0 and {13498}>75) or ({TRIGGER.VALUE}=1 and {13498}>65)','Zabbix unreachable poller processes more than 75% busy','',0,0,3,0,'Zabbix unreachable poller processes more than 75% busy','',NULL,0,0,0),(13880,'({TRIGGER.VALUE}=0 and {13499}>75) or ({TRIGGER.VALUE}=1 and {13499}>65)','Zabbix unreachable poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13881,'{13500}=1','Zabbix value cache working in low memory mode','',0,0,4,0,'','',NULL,0,0,0),(13882,'({TRIGGER.VALUE}=0 and {13501}>75) or ({TRIGGER.VALUE}=1 and {13501}>65)','Zabbix vmware collector processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13883,'{13502}<0','{HOST.NAME} has just been restarted','',0,0,3,0,'Server just been restarted','',NULL,0,0,0),(13884,'{13503}<0','{HOST.NAME} has just been restarted','',0,0,3,0,'','',NULL,0,0,0),(13885,'{13504}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'Free disk space is less than 20% on volume {#FSNAME}','',NULL,0,0,2),(13886,'{13505}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'Free inodes is less than 20% on volume {#FSNAME}','',NULL,0,0,2),(13887,'{13506}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2);
/*!40000 ALTER TABLE `triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` bigint(20) unsigned NOT NULL,
  `alias` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `surname` varchar(100) NOT NULL DEFAULT '',
  `passwd` char(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `autologin` int(11) NOT NULL DEFAULT '0',
  `autologout` int(11) NOT NULL DEFAULT '900',
  `lang` varchar(5) NOT NULL DEFAULT 'en_GB',
  `refresh` int(11) NOT NULL DEFAULT '30',
  `type` int(11) NOT NULL DEFAULT '1',
  `theme` varchar(128) NOT NULL DEFAULT 'default',
  `attempt_failed` int(11) NOT NULL DEFAULT '0',
  `attempt_ip` varchar(39) NOT NULL DEFAULT '',
  `attempt_clock` int(11) NOT NULL DEFAULT '0',
  `rows_per_page` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `users_1` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Zabbix','Administrator','5fce1b3e34b520afeffb37ce08c7cd66','',1,0,'en_GB',30,3,'default',0,'',0,50),(2,'guest','','','d41d8cd98f00b204e9800998ecf8427e','',0,900,'en_GB',30,1,'default',0,'',0,50);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `id` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_1` (`usrgrpid`,`userid`),
  KEY `users_groups_2` (`userid`),
  CONSTRAINT `c_users_groups_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_users_groups_1` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (4,7,1),(2,8,2);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usrgrp`
--

DROP TABLE IF EXISTS `usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usrgrp` (
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `gui_access` int(11) NOT NULL DEFAULT '0',
  `users_status` int(11) NOT NULL DEFAULT '0',
  `debug_mode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usrgrpid`),
  UNIQUE KEY `usrgrp_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usrgrp`
--

LOCK TABLES `usrgrp` WRITE;
/*!40000 ALTER TABLE `usrgrp` DISABLE KEYS */;
INSERT INTO `usrgrp` VALUES (7,'Zabbix administrators',0,0,0),(8,'Guests',0,0,0),(9,'Disabled',0,1,0),(11,'Enabled debug mode',0,0,1),(12,'No access to the frontend',2,0,0);
/*!40000 ALTER TABLE `usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valuemaps`
--

DROP TABLE IF EXISTS `valuemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valuemaps` (
  `valuemapid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`valuemapid`),
  UNIQUE KEY `valuemaps_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valuemaps`
--

LOCK TABLES `valuemaps` WRITE;
/*!40000 ALTER TABLE `valuemaps` DISABLE KEYS */;
INSERT INTO `valuemaps` VALUES (4,'APC Battery Replacement Status'),(5,'APC Battery Status'),(7,'Dell Open Manage System Status'),(2,'Host availability'),(6,'HP Insight System Status'),(17,'HTTP response status code'),(14,'Maintenance status'),(1,'Service state'),(9,'SNMP device status (hrDeviceStatus)'),(11,'SNMP interface status (ifAdminStatus)'),(8,'SNMP interface status (ifOperStatus)'),(15,'Value cache operating mode'),(13,'VMware status'),(12,'VMware VirtualMachinePowerState'),(16,'Windows service startup type'),(3,'Windows service state'),(10,'Zabbix agent ping status');
/*!40000 ALTER TABLE `valuemaps` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-15 18:57:38