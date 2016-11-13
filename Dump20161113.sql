-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: kepdb
-- ------------------------------------------------------
-- Server version	5.7.10

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `Id` varchar(32) NOT NULL DEFAULT '',
  `content` varchar(255) DEFAULT NULL COMMENT '回帖内容',
  `topic_id` varchar(32) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `stat_id` int(32) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `fk_comment_1` (`topic_id`),
  KEY `fk_comment_2` (`user_id`),
  KEY `fk_comment_3` (`stat_id`),
  CONSTRAINT `fk_comment_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_3` FOREIGN KEY (`stat_id`) REFERENCES `statistic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES ('0A9B049B01BC79DA99F15C81914AC843','new new','1','AEA6E45293DFF946D496E2789488A03E','2016-11-11 17:21:49.324',1),('1','如果您听说过 Node，或者阅读过一些文章，宣称 Node 是多么多么的棒，那么您可能会想：“Node 究竟是什么东西？” 即便是在参阅 Node 的主页之后，您甚至可能还是 不明白 Node 为何物？Node 肯定不适合每个程序员，但它可能是某些程序员一直苦苦追寻的东西。','1','1','2016-11-10 17：52',1),('2','为试图解释什么是 Node.js，本文将简要介绍一些背景信息：它要解决的问题，它如何工作，如何运行一个简单应用程序，最后，Node 在什么情况下是一个好的解决方案。本文不涉及如何编写一个复杂的 Node 应用程序，也不是一份全面的 Node 教程。阅读本文应该有助于您决定是否应该继续学习 Node，以便将其用于您的业务。','1','2','2016-11-10 17：51',1),('22CEB7323EA7B055860D95D3B38D88B3','@zhengchj sadfasdfasfdasdf','1','AEA6E45293DFF946D496E2789488A03E','2016-11-11 17:45:56.946',1),('3','Node 公开宣称的目标是 “旨在提供一种简单的构建可伸缩网络程序的方法”。当前的服务器程序有什么问题？我们来做个数学题。在 Java™ 和 PHP 这类语言中，每个连接都会生成一个新线程，每个新线程可能需要 2 MB 的配套内存。在一个拥有 8 GB RAM 的系统上，理论上最大的并发连接数量是 4,000 个用户。随着您的客户群的增长，如果希望您的 Web 应用程序支持更多用户，那么，您必须添加更多服务器。当然，这会增加服务器成本、流量成本和人工成本等成本。除这些成本上升外，还有一个潜在技术问题，即用','1','1','2016-11-10 17：58',1),('7013D44BFB77780CFF482BC8AF515C34','分为文件服务器，数据库服务器，应用程序服务器，WEB服务器等','D58DA80BB66E590BA489800C062D241C','AEA6E45293DFF946D496E2789488A03E','2016-11-13 13:51:32.519',1),('8C8A06C498E2B6B85BE3BDA19C81324D','dsfasdfasdfasdfadsf','1','AEA6E45293DFF946D496E2789488A03E','2016-11-11 17:22:03.052',1),('9EBFF6059EF50B25D9675B2E9D745CCE','@zhengchj @hahaha @fandanping dsfasdfasf','1','AEA6E45293DFF946D496E2789488A03E','2016-11-11 18:00:22.840',1),('A3090C0962DFDDB551CFE3F0F433939D','dgfasdfas','3','AEA6E45293DFF946D496E2789488A03E','2016-11-11 18:00:32.631',1),('D8B660B4CE3B083468B3237CC9322110','<p>var a=1;</p><p>var b=2;</p>','4','AEA6E45293DFF946D496E2789488A03E','2016-11-13 20:46:09.535',1),('E21A25A40572C9F93058BE2619AC8B2C','最初，只是想学学运营，公司里专门运营的人不想碰，那就我来吧，CTO就是一块砖，哪里需要哪里搬。我的初衷很简单，我想挑战一下运营，除了编程外，我相信其他的我也一样能够做好。 注册了公众号 从以前的文库里，找到《生活如何不无聊》，发了第一篇文章 将给小弟培训的ppt改改，发了第二篇文章《Nodejs入门教程ppt分享》 后来就坚持着写，各种小弟们需要了解的实战，大部分都是实践经验，所以在CNode上被alsotang加了很多精华。这本身对我来说也是一种提高，虽然粉丝数寥寥无几，但是还是有效果的。直接推广肯定是','1','AEA6E45293DFF946D496E2789488A03E','2016-11-11 17:24:19.362',1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cc` AFTER INSERT ON `comment` FOR EACH ROW begin
declare c int;
set c = (select totalreplies from statistic where id = new.stat_id);
update statistic set totalreplies= c + 1  where id = new.stat_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `comment_trigger_2` AFTER DELETE ON `comment` FOR EACH ROW begin
declare c int;
set c = (select totalreplies from statistic where id = old.stat_id);
update statistic set totalreplies= c - 1  where id = old.stat_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `statistic`
--

DROP TABLE IF EXISTS `statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistic` (
  `totalcommunity` int(32) DEFAULT NULL,
  `totaltposts` int(32) DEFAULT NULL,
  `totalreplies` int(32) DEFAULT NULL,
  `id` int(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `totalcommunity` (`totalcommunity`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistic`
--

LOCK TABLES `statistic` WRITE;
/*!40000 ALTER TABLE `statistic` DISABLE KEYS */;
INSERT INTO `statistic` VALUES (8,7,11,1);
/*!40000 ALTER TABLE `statistic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `Id` varchar(32) NOT NULL DEFAULT '' COMMENT '帖子Id',
  `title` varchar(255) DEFAULT NULL COMMENT '帖子标题',
  `create_time` varchar(255) DEFAULT NULL COMMENT '帖子创建时间',
  `content` text COMMENT '内容',
  `page_view` int(11) DEFAULT NULL COMMENT '浏览量',
  `reply_num` int(11) DEFAULT NULL COMMENT '回复量',
  `praise` int(11) DEFAULT NULL COMMENT '点赞数',
  `user_id` varchar(32) DEFAULT NULL,
  `statistic_id` int(32) DEFAULT '1',
  `category` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_topic_1` (`user_id`),
  KEY `fk_topic_3` (`statistic_id`),
  CONSTRAINT `fk_topic_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_topic_3` FOREIGN KEY (`statistic_id`) REFERENCES `statistic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES ('1','hello world 大家好','2016-11-10 17：52','最初，只是想学学运营，公司里专门运营的人不想碰，那就我来吧，CTO就是一块砖，哪里需要哪里搬。我的初衷很简单，我想挑战一下运营，除了编程外，我相信其他的我也一样能够做好。\r\n\r\n注册了公众号\r\n从以前的文库里，找到《生活如何不无聊》，发了第一篇文章\r\n将给小弟培训的ppt改改，发了第二篇文章《Nodejs入门教程ppt分享》\r\n后来就坚持着写，各种小弟们需要了解的实战，大部分都是实践经验，所以在CNode上被alsotang加了很多精华。这本身对我来说也是一种提高，虽然粉丝数寥寥无几，但是还是有效果的。直接推广肯定是大家不喜欢的，于是我在精华帖子下面都加了公众号的二维码',250,250,250,'1',1,'h5'),('2','这，就是江湖人的技术','2016-11-10 17：32','本项目写于小程序发布之初，期间小程序官方有过几次更新，例如准备移除了loading组件、改变page的默认高度等，主要看的还是博卡君的文章，后来在朋友的建议下在9月27号写了本篇文章并分享到github上，是做为微信小应用的入门教程，并非某在线学习网站499收费课程的作业，特此声明。\r\n\r\n 微信应用号入门实践之cnode社区版\r\n\r\n首先感谢cnode社区提供的api，本次实现了简单的cnode社区应用号制作。\r\n实现了数据的读取、展示，\r\n实现了简单的布局，\r\n实现了下一页功能。\r\n\r\n放上我的github地址\r\nhttps://github.com/coolfishstudio/wechat-webapp-cnode',111,111,111,'1',1,'js'),('3','git怎么让某分支忽略或不跟踪某文件？','2016-11-10 17：56','请教下大家这个问题，貌似目不能做到某个分支管理某个文件吧？',100,100,100,'1',1,'node'),('4','ss','2016-11-10 17：12','sss',200,200,200,'1',1,'js'),('50C22E3C269024889A86A77BDDF58838','test','2016-11-13 17:15:48.688','<p>var a=1;</p><p>var fun=function(){</p><p>&nbsp; &nbsp; alert(123)<br></p><p>}</p>',NULL,NULL,NULL,'AEA6E45293DFF946D496E2789488A03E',1,'h5'),('D58DA80BB66E590BA489800C062D241C','服务器，也称伺服器','2016-11-12 23:50:35.975','服务器的构成包括处理器、硬盘、内存、系统总线等，和通用的计算机架构类似，但是由于需要提供高可靠的服务，因此在处理能力、稳定性、可靠性、安全性、可扩展性、可管理性等方面要求较高。\r\n在网络环境下，根据服务器提供的服务类型不同，分为文件服务器，数据库服务器，应用程序服务器，WEB服务器等。',NULL,NULL,NULL,'AEA6E45293DFF946D496E2789488A03E',1,'server'),('DD137C3E94A59475B808053BE1561CC4','123','2016-11-13 20:51:12.012','<p><iframe webkitallowfullscreen=\"\" mozallowfullscreen=\"\" allowfullscreen=\"\" frameborder=\"0\" height=\"498\" width=\"510\" src=\"//player.youku.com/embed/XMTgxNjQ3NTY5Ng\" class=\"note-video-clip\"></iframe><br></p>',NULL,NULL,NULL,'AEA6E45293DFF946D496E2789488A03E',1,'h5');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `aa` AFTER INSERT ON `topic` FOR EACH ROW begin
declare c int;
set c = (select totaltposts from statistic where id = new.statistic_id);
update statistic set totaltposts = c + 1 where id = new.statistic_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_3` BEFORE DELETE ON `topic` FOR EACH ROW BEGIN
DELETE FROM comment WHERE  topic_id=old.id;
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_2` AFTER DELETE ON `topic` FOR EACH ROW begin
declare c int;
set c = (select totaltposts from statistic where id = old.statistic_id);
update statistic set totaltposts = c - 1 where id = old.statistic_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Id` varchar(32) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `mail` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `photo` text COMMENT '头像',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `statistic_id` int(32) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `fk_user_1` (`statistic_id`),
  CONSTRAINT `fk_user_1` FOREIGN KEY (`statistic_id`) REFERENCES `statistic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','fandanping','2','2','2','如果说岁月是把杀猪刀，那肥胖更是一把屠龙刀！',1),('15D06E1E638594357124CC6649FBC02D','zheng11','123','123@163.com',NULL,NULL,1),('2','hahaha','22','22','2','当我的兄弟，你就要对得起兄弟这两个字',1),('2EBF05F68F2484D2ECFB94237E1ACE96','fandanping','fandanping521','18602474229@163.com',NULL,NULL,1),('54877E80B629C35314C0C089C0F87341','zhengchj1023','123','123@qq.com',NULL,NULL,1),('AAB8D34DF5F966918366CDD3D729EC0F','zhengchj333','333','333@163.com',NULL,NULL,1),('AEA6E45293DFF946D496E2789488A03E','zhengchj','123','123@163.com',NULL,'开始学习优雅的生活',1),('EAF48F66D85728B9422C238575A3C225','fandp','fandanping521','123@163.com',NULL,NULL,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bb` AFTER INSERT ON `user` FOR EACH ROW begin
declare c int;
set c = (select totalcommunity from statistic where id = new.statistic_id);
update statistic set totalcommunity = c + 1 where id = new.statistic_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_trigger_3` BEFORE DELETE ON `user` FOR EACH ROW BEGIN
DELETE FROM topic WHERE  user_id=old.id;
DELETE FROM comment WHERE  user_id=old.id;
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_trigger_2` AFTER DELETE ON `user` FOR EACH ROW begin
declare c int;
set c = (select totalcommunity from statistic where id = old.statistic_id);
update statistic set totalcommunity = c - 1 where id = old.statistic_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'kepdb'
--

--
-- Dumping routines for database 'kepdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-13 23:08:16
