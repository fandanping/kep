/*
Navicat MySQL Data Transfer

Source Server         : zhengdb
Source Server Version : 50540
Source Host           : 10.113.16.188:3306
Source Database       : kepdb

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-11-11 18:05:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
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

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('0A9B049B01BC79DA99F15C81914AC843', 'new new', '1', 'AEA6E45293DFF946D496E2789488A03E', '2016-11-11 17:21:49.324', '1');
INSERT INTO `comment` VALUES ('1', '如果您听说过 Node，或者阅读过一些文章，宣称 Node 是多么多么的棒，那么您可能会想：“Node 究竟是什么东西？” 即便是在参阅 Node 的主页之后，您甚至可能还是 不明白 Node 为何物？Node 肯定不适合每个程序员，但它可能是某些程序员一直苦苦追寻的东西。', '1', '1', '2016-11-10 17：52', '1');
INSERT INTO `comment` VALUES ('2', '为试图解释什么是 Node.js，本文将简要介绍一些背景信息：它要解决的问题，它如何工作，如何运行一个简单应用程序，最后，Node 在什么情况下是一个好的解决方案。本文不涉及如何编写一个复杂的 Node 应用程序，也不是一份全面的 Node 教程。阅读本文应该有助于您决定是否应该继续学习 Node，以便将其用于您的业务。', '1', '2', '2016-11-10 17：51', '1');
INSERT INTO `comment` VALUES ('22CEB7323EA7B055860D95D3B38D88B3', '@zhengchj sadfasdfasfdasdf', '1', 'AEA6E45293DFF946D496E2789488A03E', '2016-11-11 17:45:56.946', '1');
INSERT INTO `comment` VALUES ('3', 'Node 公开宣称的目标是 “旨在提供一种简单的构建可伸缩网络程序的方法”。当前的服务器程序有什么问题？我们来做个数学题。在 Java™ 和 PHP 这类语言中，每个连接都会生成一个新线程，每个新线程可能需要 2 MB 的配套内存。在一个拥有 8 GB RAM 的系统上，理论上最大的并发连接数量是 4,000 个用户。随着您的客户群的增长，如果希望您的 Web 应用程序支持更多用户，那么，您必须添加更多服务器。当然，这会增加服务器成本、流量成本和人工成本等成本。除这些成本上升外，还有一个潜在技术问题，即用', '1', '1', '2016-11-10 17：58', '1');
INSERT INTO `comment` VALUES ('8C8A06C498E2B6B85BE3BDA19C81324D', 'dsfasdfasdfasdfadsf', '1', 'AEA6E45293DFF946D496E2789488A03E', '2016-11-11 17:22:03.052', '1');
INSERT INTO `comment` VALUES ('9EBFF6059EF50B25D9675B2E9D745CCE', '@zhengchj @hahaha @fandanping dsfasdfasf', '1', 'AEA6E45293DFF946D496E2789488A03E', '2016-11-11 18:00:22.840', '1');
INSERT INTO `comment` VALUES ('A3090C0962DFDDB551CFE3F0F433939D', 'dgfasdfas', '3', 'AEA6E45293DFF946D496E2789488A03E', '2016-11-11 18:00:32.631', '1');
INSERT INTO `comment` VALUES ('E21A25A40572C9F93058BE2619AC8B2C', '最初，只是想学学运营，公司里专门运营的人不想碰，那就我来吧，CTO就是一块砖，哪里需要哪里搬。我的初衷很简单，我想挑战一下运营，除了编程外，我相信其他的我也一样能够做好。 注册了公众号 从以前的文库里，找到《生活如何不无聊》，发了第一篇文章 将给小弟培训的ppt改改，发了第二篇文章《Nodejs入门教程ppt分享》 后来就坚持着写，各种小弟们需要了解的实战，大部分都是实践经验，所以在CNode上被alsotang加了很多精华。这本身对我来说也是一种提高，虽然粉丝数寥寥无几，但是还是有效果的。直接推广肯定是', '1', 'AEA6E45293DFF946D496E2789488A03E', '2016-11-11 17:24:19.362', '1');

-- ----------------------------
-- Table structure for statistic
-- ----------------------------
DROP TABLE IF EXISTS `statistic`;
CREATE TABLE `statistic` (
  `totalcommunity` int(32) DEFAULT NULL,
  `totaltposts` int(32) DEFAULT NULL,
  `totalreplies` int(32) DEFAULT NULL,
  `id` int(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `totalcommunity` (`totalcommunity`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of statistic
-- ----------------------------
INSERT INTO `statistic` VALUES ('6', '1', '9', '1');

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
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
  PRIMARY KEY (`Id`),
  KEY `fk_topic_1` (`user_id`),
  KEY `fk_topic_3` (`statistic_id`),
  CONSTRAINT `fk_topic_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_topic_3` FOREIGN KEY (`statistic_id`) REFERENCES `statistic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', 'hello world 大家好', '2016/11/10 17：51', '最初，只是想学学运营，公司里专门运营的人不想碰，那就我来吧，CTO就是一块砖，哪里需要哪里搬。我的初衷很简单，我想挑战一下运营，除了编程外，我相信其他的我也一样能够做好。\r\n\r\n注册了公众号\r\n从以前的文库里，找到《生活如何不无聊》，发了第一篇文章\r\n将给小弟培训的ppt改改，发了第二篇文章《Nodejs入门教程ppt分享》\r\n后来就坚持着写，各种小弟们需要了解的实战，大部分都是实践经验，所以在CNode上被alsotang加了很多精华。这本身对我来说也是一种提高，虽然粉丝数寥寥无几，但是还是有效果的。直接推广肯定是大家不喜欢的，于是我在精华帖子下面都加了公众号的二维码', '250', '250', '250', '1', '1');
INSERT INTO `topic` VALUES ('2', '这，就是江湖人的技术', '2016/11/10 17：51', '本项目写于小程序发布之初，期间小程序官方有过几次更新，例如准备移除了loading组件、改变page的默认高度等，主要看的还是博卡君的文章，后来在朋友的建议下在9月27号写了本篇文章并分享到github上，是做为微信小应用的入门教程，并非某在线学习网站499收费课程的作业，特此声明。\r\n\r\n 微信应用号入门实践之cnode社区版\r\n\r\n首先感谢cnode社区提供的api，本次实现了简单的cnode社区应用号制作。\r\n实现了数据的读取、展示，\r\n实现了简单的布局，\r\n实现了下一页功能。\r\n\r\n放上我的github地址\r\nhttps://github.com/coolfishstudio/wechat-webapp-cnode', '111', '111', '111', '1', '1');
INSERT INTO `topic` VALUES ('3', 'git怎么让某分支忽略或不跟踪某文件？', '2016/11/10 17：51', '请教下大家这个问题，貌似目不能做到某个分支管理某个文件吧？', '100', '100', '100', '1', '1');
INSERT INTO `topic` VALUES ('4', 'ss', 'sss', 'sss', '200', '200', '200', '1', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
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

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'fandanping', '2', '2', '2', '如果说岁月是把杀猪刀，那肥胖更是一把屠龙刀！', '1');
INSERT INTO `user` VALUES ('2', 'hahaha', '22', '22', '2', '当我的兄弟，你就要对得起兄弟这两个字', '1');
INSERT INTO `user` VALUES ('2EBF05F68F2484D2ECFB94237E1ACE96', 'fandanping', 'fandanping521', '18602474229@163.com', null, null, '1');
INSERT INTO `user` VALUES ('54877E80B629C35314C0C089C0F87341', 'zhengchj1023', '123', '123@qq.com', null, null, '1');
INSERT INTO `user` VALUES ('AEA6E45293DFF946D496E2789488A03E', 'zhengchj', '123', '123@163.com', null, '开始学习优雅的生活', '1');
INSERT INTO `user` VALUES ('EAF48F66D85728B9422C238575A3C225', 'fandp', 'fandanping521', '123@163.com', null, null, '1');
DROP TRIGGER IF EXISTS `cc`;
DELIMITER ;;
CREATE TRIGGER `cc` AFTER INSERT ON `comment` FOR EACH ROW begin
declare c int;
set c = (select totalreplies from statistic where id = new.stat_id);
update statistic set totalreplies= c + 1  where id = new.stat_id;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `comment_trigger_2`;
DELIMITER ;;
CREATE TRIGGER `comment_trigger_2` AFTER DELETE ON `comment` FOR EACH ROW begin
declare c int;
set c = (select totalreplies from statistic where id = old.stat_id);
update statistic set totalreplies= c - 1  where id = old.stat_id;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `aa`;
DELIMITER ;;
CREATE TRIGGER `aa` AFTER INSERT ON `topic` FOR EACH ROW begin
declare c int;
set c = (select totaltposts from statistic where id = new.statistic_id);
update statistic set totaltposts = c + 1 where id = new.statistic_id;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger_3`;
DELIMITER ;;
CREATE TRIGGER `trigger_3` BEFORE DELETE ON `topic` FOR EACH ROW BEGIN
DELETE FROM comment WHERE  topic_id=old.id;
 END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger_2`;
DELIMITER ;;
CREATE TRIGGER `trigger_2` AFTER DELETE ON `topic` FOR EACH ROW begin
declare c int;
set c = (select totaltposts from statistic where id = old.statistic_id);
update statistic set totaltposts = c - 1 where id = old.statistic_id;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bb`;
DELIMITER ;;
CREATE TRIGGER `bb` AFTER INSERT ON `user` FOR EACH ROW begin
declare c int;
set c = (select totalcommunity from statistic where id = new.statistic_id);
update statistic set totalcommunity = c + 1 where id = new.statistic_id;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `user_trigger_3`;
DELIMITER ;;
CREATE TRIGGER `user_trigger_3` BEFORE DELETE ON `user` FOR EACH ROW BEGIN
DELETE FROM topic WHERE  user_id=old.id;
DELETE FROM comment WHERE  user_id=old.id;
 END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `user_trigger_2`;
DELIMITER ;;
CREATE TRIGGER `user_trigger_2` AFTER DELETE ON `user` FOR EACH ROW begin
declare c int;
set c = (select totalcommunity from statistic where id = old.statistic_id);
update statistic set totalcommunity = c - 1 where id = old.statistic_id;
end
;;
DELIMITER ;
