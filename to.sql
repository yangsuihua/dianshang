/*
SQLyog Professional v12.14 (64 bit)
MySQL - 8.0.32 : Database - shopping
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shopping` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `shopping`;

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `good_id` varchar(50) NOT NULL,
  `good_name` varchar(255) NOT NULL,
  `good_price` float DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `goods` */

insert  into `goods`(`good_id`,`good_name`,`good_price`,`Image`) values 
('G001','西凤酒 55度',545,'1'),
('G002','五粮液',2556,'2'),
('G003','泸州老窖 95度',256,'3'),
('G004','和天下 55度',215,'4'),
('G005','梅见 55度',545,'5'),
('G006','1516 55度',235,'6'),
('G007','雪花 53度',537,'7'),
('G008','贵州茅台酒 53度',1499,'8');

/*Table structure for table `goods_logs` */

DROP TABLE IF EXISTS `goods_logs`;

CREATE TABLE `goods_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` timestamp NULL DEFAULT NULL,
  `log_text` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

/*Data for the table `goods_logs` */

insert  into `goods_logs`(`id`,`time`,`log_text`) values 
(1,'2023-12-05 14:37:44','添加[G009][测试数据1][2356]'),
(2,'2023-12-05 14:38:01','添加[G010][测试数据2][2321]'),
(3,'2023-12-05 14:38:14','添加[G011][测试数据3][3124]'),
(4,'2023-12-05 14:39:46','删除[G009][测试数据1]'),
(5,'2023-12-05 14:39:47','删除[G010][测试数据2]'),
(6,'2023-12-05 14:39:47','删除[G011][测试数据3]');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` varchar(50) NOT NULL,
  `addres` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `tel` varchar(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `tel` (`tel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `users` */

insert  into `users`(`user_id`,`addres`,`password`,`tel`) values 
('avcc','','avcc','avcc'),
('czxxcz','','czxxcz','czxxcz'),
('dsaasd','','dsaasd','dsaasd'),
('qweee','','qweee','qweee'),
('rty','','rty','234134533'),
('U001','北京市朝阳区建国路123号','1S23','98765432101'),
('U002','上海市浦东新区张江高科技园区456号','12S3','87654321012'),
('U003','广州市天河区珠江新城789号','12S3','76543210923'),
('U004','成都市武侯区人民南路101号','12S3','65432109834'),
('U005','广东省广州市','S29231','15918166432'),
('U007','广东省广州市','S29231','15918166932'),
('U008','广东省广州市','S29231','159186932'),
('U010','广东省广州市','S29231','1591864932');

/*Table structure for table `users_goods` */

DROP TABLE IF EXISTS `users_goods`;

CREATE TABLE `users_goods` (
  `user_id` varchar(50) NOT NULL,
  `good_id` varchar(50) NOT NULL,
  `count` int DEFAULT NULL,
  PRIMARY KEY (`user_id`,`good_id`),
  KEY `fk_user_goods_good` (`good_id`),
  CONSTRAINT `fk_user_goods_good` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_goods_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_goods_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `users_goods` */

/*Table structure for table `users_logs` */

DROP TABLE IF EXISTS `users_logs`;

CREATE TABLE `users_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` timestamp NULL DEFAULT NULL,
  `log_text` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3;

/*Data for the table `users_logs` */

insert  into `users_logs`(`id`,`time`,`log_text`) values 
(1,'2023-12-05 16:12:12','添加[das][][das][das]'),
(2,'2023-12-06 21:12:27','添加[asdasd][][asdasd][adsasd]'),
(3,'2023-12-06 21:16:57','添加[12345][][12345][12345]'),
(4,'2023-12-06 21:17:02','添加[123455][][123455][123455]'),
(5,'2023-12-06 21:17:16','添加[qweqewww][][123455][asdad]'),
(6,'2023-12-06 21:17:35','添加[1sda][][1sda][1sda]'),
(7,'2023-12-06 21:20:11','删除[123][][123][1244567889]'),
(8,'2023-12-06 21:20:11','删除[1234][][dsadadd][ssdfada]'),
(9,'2023-12-06 21:20:11','删除[12345][][12345][12345]'),
(10,'2023-12-06 21:20:11','删除[123455][][123455][123455]'),
(11,'2023-12-06 21:20:11','删除[123dsadas][][dadsadD][123caczx]'),
(12,'2023-12-06 21:20:11','删除[1sda][][1sda][1sda]'),
(13,'2023-12-06 21:20:11','删除[asdasd][][asdasd][adsasd]'),
(14,'2023-12-06 21:20:11','删除[das][][das][das]'),
(15,'2023-12-06 21:20:11','删除[dasdz][][dasdscz][sdfadsad]'),
(16,'2023-12-06 21:20:11','删除[qweqewww][][123455][asdad]'),
(17,'2023-12-06 21:20:40','添加[asd][][asd][asd]'),
(18,'2023-12-06 21:21:21','添加[asd123][][asd321][asd456]'),
(19,'2023-12-06 21:31:59','删除[asd123][][asd321][asd456]'),
(20,'2023-12-06 21:32:34','添加[asd123][][asd321][123412]'),
(21,'2023-12-06 21:33:39','添加[asds][][asda][dasd]'),
(22,'2023-12-06 21:36:09','添加[asdsdsa][][asdadsa][dasdda]'),
(23,'2023-12-06 21:36:42','添加[ppp][][ppp][ppp]'),
(24,'2023-12-06 21:37:22','删除[asd][][asd][asd]'),
(25,'2023-12-06 21:37:22','删除[asd123][][asd321][123412]'),
(26,'2023-12-06 21:37:22','删除[asds][][asda][dasd]'),
(27,'2023-12-06 21:37:22','删除[asdsdsa][][asdadsa][dasdda]'),
(28,'2023-12-06 21:37:22','删除[ppp][][ppp][ppp]'),
(29,'2023-12-06 21:38:57','添加[dasd][][dasd][dasd]'),
(30,'2023-12-06 21:40:22','删除[dasd][][dasd][dasd]'),
(31,'2023-12-06 21:40:54','添加[oiu][][oiu][oiu]'),
(32,'2023-12-06 21:41:48','添加[oiu1][][oiu1][oiu1]'),
(33,'2023-12-06 21:42:04','添加[oiu2][][oiu2][oiu2]'),
(34,'2023-12-06 21:43:18','添加[dasd][][dasd][dasd]'),
(35,'2023-12-06 21:57:57','添加[qweads][][qweads2][12357888]'),
(36,'2023-12-07 15:11:00','添加[123][][123][123]'),
(37,'2023-12-07 15:51:21','添加[12345][][12345][12345]'),
(38,'2023-12-07 18:37:49','添加[a][][123][13042090030]'),
(39,'2023-12-08 10:27:51','添加[asd][][asd][asd]'),
(40,'2023-12-08 10:27:58','添加[asd33][][asd33][asd33]'),
(41,'2023-12-08 10:28:16','添加[qwead][][qweas][qweas]'),
(42,'2023-12-08 10:30:22','添加[rty][][rty][234134533]'),
(43,'2023-12-08 10:53:01','添加[dsad][][dadad][125654252]'),
(44,'2023-12-09 13:58:14','添加[1234][][1234][1234]'),
(45,'2023-12-09 13:59:44','添加[qweee][][qweee][qweee]'),
(46,'2023-12-09 14:01:21','删除[123][][123][123]'),
(47,'2023-12-09 14:01:22','删除[1234][][1234][1234]'),
(48,'2023-12-09 14:01:22','删除[12345][][12345][12345]'),
(49,'2023-12-09 14:01:22','删除[a][][123][13042090030]'),
(50,'2023-12-09 14:01:22','删除[asd][][asd][asd]'),
(51,'2023-12-09 14:01:22','删除[asd33][][asd33][asd33]'),
(52,'2023-12-09 14:01:22','删除[dasd][][dasd][dasd]'),
(53,'2023-12-09 14:01:22','删除[dsad][][dadad][125654252]'),
(54,'2023-12-09 14:01:22','删除[oiu][][oiu][oiu]'),
(55,'2023-12-09 14:01:22','删除[oiu1][][oiu1][oiu1]'),
(56,'2023-12-09 14:01:22','删除[oiu2][][oiu2][oiu2]'),
(57,'2023-12-09 14:01:22','删除[qwead][][qweas][qweas]'),
(58,'2023-12-09 14:01:22','删除[qweads][][qweads2][12357888]'),
(59,'2023-12-09 14:01:22','删除[qweee][][qweee][qweee]'),
(60,'2023-12-09 14:02:57','添加[qweee][][qweee][qweee]'),
(61,'2023-12-09 14:03:12','添加[avcc][][avcc][avcc]'),
(62,'2023-12-09 14:05:46','添加[czxxcz][][czxxcz][czxxcz]'),
(63,'2023-12-09 14:06:50','添加[dsaasd][][dsaasd][dsaasd]');

/* Trigger structure for table `goods` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `G_Changetime` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `G_Changetime` AFTER INSERT ON `goods` FOR EACH ROW insert into goods_logs(time,log_text)values(now(),concat('添加','[',new.good_id,']','[',new.good_name,']','[',new.good_price,']')) */$$


DELIMITER ;

/* Trigger structure for table `goods` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `G_Updatetime` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `G_Updatetime` AFTER UPDATE ON `goods` FOR EACH ROW insert into goods_logs(time,log_text)values(now(),concat('修改','[',new.good_id,']','[',new.good_name,']','[',new.good_price,']')) */$$


DELIMITER ;

/* Trigger structure for table `goods` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `G_Deletetime` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `G_Deletetime` AFTER DELETE ON `goods` FOR EACH ROW insert into goods_logs(time,log_text)values(now(),concat('删除','[',old.good_id,']','[',old.good_name,']')) */$$


DELIMITER ;

/* Trigger structure for table `users` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `UChangetime` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `UChangetime` AFTER INSERT ON `users` FOR EACH ROW insert into users_logs(time,log_text)values(now(),concat('添加','[',new.user_id,']','[',new.addres,']','[',new.password,']','[',new.tel,']')) */$$


DELIMITER ;

/* Trigger structure for table `users` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `Updatetime` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `Updatetime` AFTER UPDATE ON `users` FOR EACH ROW insert into users_logs(time,log_text)values(now(),concat('修改','[',new.user_id,']','[',new.addres,']','[',new.password,']','[',new.tel,']')) */$$


DELIMITER ;

/* Trigger structure for table `users` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `UDeletetime` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `UDeletetime` AFTER DELETE ON `users` FOR EACH ROW insert into users_logs(time,log_text)values(now(),concat('删除','[',old.user_id,']','[',old.addres,']','[',old.password,']','[',old.tel,']')) */$$


DELIMITER ;

/* Procedure structure for procedure `Create_UserGoodsView` */

/*!50003 DROP PROCEDURE IF EXISTS  `Create_UserGoodsView` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Create_UserGoodsView`(IN input_user_id varchar(255))
BEGIN
    SET @sql = CONCAT('SELECT * FROM user_goods_view WHERE user_id = ''', input_user_id, '''');
    SELECT @sql AS debug_output;  -- 添加调试输出
    PREPARE statement FROM @sql;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;
END */$$
DELIMITER ;

/* Procedure structure for procedure `GetGoodsByUserID` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetGoodsByUserID` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetGoodsByUserID`(IN input_user_id VARCHAR(50))
BEGIN
  SELECT
    g.good_id,
    g.good_name,
    g.good_price,
    ug.count
  FROM goods g
  INNER JOIN users_goods ug ON g.good_id = ug.good_id
  WHERE ug.user_id = input_user_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `GetUserwithGood` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetUserwithGood` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserwithGood`(IN input_good_id VARCHAR(50), IN input_user_id VARCHAR(50))
BEGIN
  SELECT
    u.user_id,
    u.addres,
    ug.count,
    g.good_id,
    g.good_name,
    g.good_price
  FROM users u
  INNER JOIN users_goods ug ON u.user_id = ug.user_id
  INNER JOIN goods g ON ug.good_id = g.good_id
  WHERE u.user_id = input_user_id AND g.good_id = input_good_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_Addgoods` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_Addgoods` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Addgoods`( in good_id varchar(50) , in good_name varchar(255) , in good_price float ,in Image varchar(255))
begin
	insert into goods (good_id,good_name,good_price,Image) values (good_id,good_name,good_price,Image);
 end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_Addusers` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_Addusers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Addusers`( 
in user_id varchar(50) ,
in addres varchar(255) ,
in password varchar(255),
in  tel varchar(11) )
begin
	insert into users (user_id,addres,password,tel) values (user_id,addres,password,tel);
 end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_show` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_show` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_show`(IN search_keyword VARCHAR(255))
begin
	select good_id,good_price,good_name,image from goods where good_name like CONCAT('%', search_keyword, '%');
 end */$$
DELIMITER ;

/*Table structure for table `user_goods_view` */

DROP TABLE IF EXISTS `user_goods_view`;

/*!50001 DROP VIEW IF EXISTS `user_goods_view` */;
/*!50001 DROP TABLE IF EXISTS `user_goods_view` */;

/*!50001 CREATE TABLE  `user_goods_view`(
 `user_id` varchar(50) ,
 `good_id` varchar(50) ,
 `good_name` varchar(255) ,
 `good_price` float ,
 `count` int 
)*/;

/*View structure for view user_goods_view */

/*!50001 DROP TABLE IF EXISTS `user_goods_view` */;
/*!50001 DROP VIEW IF EXISTS `user_goods_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_goods_view` AS select `u`.`user_id` AS `user_id`,`g`.`good_id` AS `good_id`,`g`.`good_name` AS `good_name`,`g`.`good_price` AS `good_price`,`ug`.`count` AS `count` from ((`users` `u` join `users_goods` `ug` on((`u`.`user_id` = `ug`.`user_id`))) join `goods` `g` on((`ug`.`good_id` = `g`.`good_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
