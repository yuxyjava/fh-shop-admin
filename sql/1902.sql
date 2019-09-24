/*
SQLyog Enterprise - MySQL GUI v7.13 
MySQL - 5.6.26-log : Database - fh_1902
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`fh_1902` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `fh_1902`;

/*Table structure for table `t_log` */

DROP TABLE IF EXISTS `t_log`;

CREATE TABLE `t_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currDate` datetime DEFAULT NULL,
  `info` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `errorMsg` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_log` */

insert  into `t_log`(`id`,`userName`,`realName`,`currDate`,`info`,`status`,`errorMsg`,`detail`,`content`) values (1,'admin','张三丰','2019-09-08 17:31:47','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'',NULL,NULL),(2,'admin','张三丰','2019-09-08 17:32:51','执行了com.fh.shop.admin.controller.user.UserController的updateUser方法失败！！！',0,'*********',NULL,NULL),(3,'admin','张三丰','2019-09-08 17:34:19','执行了com.fh.shop.admin.controller.role.RoleController的update方法成功！！！',1,'',NULL,NULL),(4,'zhangsan','张三','2019-09-08 17:34:38','执行了com.fh.shop.admin.controller.resource.ResourceController的deleteBatch方法成功！！！',1,'',NULL,NULL),(5,'admin','张三丰','2019-09-09 11:46:28','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'',NULL,NULL),(6,'admin','张三丰','2019-09-09 11:46:37','执行了com.fh.shop.admin.controller.role.RoleController的update方法成功！！！',1,'',NULL,NULL),(7,'admin','张三丰','2019-09-09 11:47:07','执行了com.fh.shop.admin.controller.resource.ResourceController的update方法成功！！！',1,'',NULL,NULL),(8,'admin','张三丰','2019-09-09 12:24:29','执行了com.fh.shop.admin.controller.user.UserController的deleteUser方法成功！！！',1,'',NULL,NULL),(9,'admin','张三丰','2019-09-09 12:24:37','执行了com.fh.shop.admin.controller.user.UserController的deleteUser方法成功！！！',1,'',NULL,NULL),(10,'admin','张三丰','2019-09-09 12:52:16','执行了com.fh.shop.admin.controller.user.UserController的deleteUser方法成功！！！',1,'','id=24',NULL),(11,'admin','张三丰','2019-09-09 12:53:05','执行了com.fh.shop.admin.controller.user.UserController的add方法成功！！！',1,'','userName=uuurealName=游游password=111age=22sex=1salary=30000phone=12143324email=ww@126.comentryTime=2019-09-12roleIds=2,6,25',NULL),(12,'admin','张三丰','2019-09-09 12:54:42','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'','|fatherId=1|menuName=测试999|url=/user/9999|type=1',NULL),(13,'admin','张三丰','2019-09-09 16:53:53','执行了com.fh.shop.admin.controller.user.UserController的deleteUser方法成功！！！',1,'','|id=29','删除用户'),(14,'admin','张三丰','2019-09-09 16:54:00','执行了com.fh.shop.admin.controller.user.UserController的deleteBatch方法成功！！！',1,'','|userIds[]=23,22','批量删除用户'),(15,'admin','张三丰','2019-09-09 16:54:24','执行了com.fh.shop.admin.controller.user.UserController的add方法成功！！！',1,'','|userName=dd|realName=11|password=11|age=|salary=|phone=|email=|entryTime=|roleIds=','添加用户'),(16,'admin','张三丰','2019-09-09 17:01:07','执行了com.fh.shop.admin.controller.user.UserController的deleteUser方法成功！！！',1,'','|id=30','删除用户'),(17,'admin','张三丰','2019-09-11 15:57:50','执行了com.fh.shop.admin.controller.user.UserController的updateUserStatus方法成功！！！',1,'','|id=18','解锁用户'),(18,'admin','张三丰','2019-09-10 16:04:10','执行了com.fh.shop.admin.controller.user.UserController的updateUser方法失败！！！',0,'*********','|userName=zhangsan|realName=张三|password=3b7f848e7e2b66528f2eba93c421007a|id=18|age=22|phone=|email=|salary=|entryTime=|sex=0|roleIds=2,3,4',''),(19,'admin','张三丰','2019-09-10 16:05:13','执行了com.fh.shop.admin.controller.user.UserController的updateUser方法失败！！！',0,'*********','|userName=zhangsan|realName=张三|password=3b7f848e7e2b66528f2eba93c421007a|id=18|age=22|phone=|email=|salary=|entryTime=|sex=0|roleIds=2,3,4',''),(20,'admin','张三丰','2019-09-10 16:12:29','执行了com.fh.shop.admin.controller.user.UserController的updateUser方法成功！！！',1,'','|userName=zhangsan|realName=张三|password=3b7f848e7e2b66528f2eba93c421007a|id=18|age=22|phone=|email=|salary=|entryTime=|sex=0|roleIds=2,3,4',''),(21,'zhangsan','张三','2019-09-10 17:34:31','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=|newPassword=|confirmPassword=','修改密码'),(22,'zhangsan','张三','2019-09-10 17:38:50','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=|newPassword=|confirmPassword=','修改密码'),(23,'admin','张三丰','2019-09-10 17:41:45','执行了com.fh.shop.admin.controller.role.RoleController的update方法成功！！！',1,'','|id=1|roleName=管理员|ids[]=1,17,18,27,28,29,30,31,19,32,33,34,35,20,23,24,39,40,41,25,42,43,26,45',''),(24,'zhangsan','张三','2019-09-10 17:43:59','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=|newPassword=|confirmPassword=','修改密码'),(25,'zhangsan','张三','2019-09-10 17:44:05','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=sdsdsdsd|newPassword=|confirmPassword=','修改密码'),(26,'zhangsan','张三','2019-09-10 17:44:12','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=sdsdsdsd|newPassword=111|confirmPassword=111','修改密码'),(27,'zhangsan','张三','2019-09-10 17:44:49','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=sdsdsdsd|newPassword=111|confirmPassword=111','修改密码'),(28,'zhangsan','张三','2019-09-10 17:45:06','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=123456|newPassword=111|confirmPassword=111','修改密码'),(29,'zhangsan','张三','2019-09-10 17:45:15','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=123456|newPassword=111|confirmPassword=111','修改密码'),(30,'zhangsan','张三','2019-09-10 17:46:06','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=123456|newPassword=111|confirmPassword=111','修改密码'),(31,'zhangsan','张三','2019-09-10 17:48:29','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=123456|newPassword=111|confirmPassword=111','修改密码'),(32,'admin','张三丰','2019-09-10 17:53:21','执行了com.fh.shop.admin.controller.user.UserController的deleteBatch方法失败！！！',0,'*********','|userIds[]=21,20','批量删除用户'),(33,'admin','张三丰','2019-09-11 09:53:48','执行了com.fh.shop.admin.controller.user.UserController的updateUser方法成功！！！',1,'','|userName=t1ttt|realName=t1|password=0a447f2c11321cb6bf5acb9ab2c5943c|id=21|age=22|phone=|email=|salary=|entryTime=|sex=1|roleIds=3,5,6',''),(34,'admin','张三丰','2019-09-11 09:53:59','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=20|oldPassword=|newPassword=|confirmPassword=','修改密码'),(35,'admin','张三丰','2019-09-11 10:35:43','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=20|oldPassword=|newPassword=|confirmPassword=','修改密码'),(36,'admin','张三丰','2019-09-11 11:14:09','执行了com.fh.shop.admin.controller.user.UserController的resetUserPassword方法成功！！！',1,'','|id=18','重置用户密码'),(37,'admin','张三丰','2019-09-11 11:15:51','执行了com.fh.shop.admin.controller.user.UserController的resetUserPassword方法成功！！！',1,'','|id=10000000','重置用户密码'),(38,'zhangsan','张三','2019-09-11 11:19:15','执行了com.fh.shop.admin.controller.user.UserController的resetUserPassword方法成功！！！',1,'','|id=20','重置用户密码'),(39,'admin','张三丰','2019-09-11 11:21:20','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'','|fatherId=24|menuName=解锁|url=/user/updateUserStatus.jhtml|type=2',''),(40,'admin','张三丰','2019-09-11 11:21:38','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'','|fatherId=24|menuName=重置密码|url=/user/resetUserPassword.jhtml|type=2',''),(41,'admin','张三丰','2019-09-11 11:21:51','执行了com.fh.shop.admin.controller.role.RoleController的update方法成功！！！',1,'','|id=1|roleName=管理员|ids[]=1,17,18,27,28,29,30,31,19,32,33,34,35,20,23,24,39,40,41,47,48,25,42,43,26,45',''),(42,'admin','张三丰','2019-09-11 11:22:23','执行了com.fh.shop.admin.controller.user.UserController的resetUserPassword方法成功！！！',1,'','|id=20','重置用户密码'),(43,'admin','张三丰','2019-09-11 12:48:28','执行了com.fh.shop.admin.controller.user.UserController的updateUser方法成功！！！',1,'','|userName=zhangsan|realName=张三|id=18|age=22|phone=|email=532028476@qq.com|salary=|entryTime=|sex=0|roleIds=2,3,4',''),(44,'admin','张三丰','2019-09-11 12:48:48','执行了com.fh.shop.admin.controller.user.UserController的resetUserPassword方法成功！！！',1,'','|id=21','重置用户密码'),(45,'admin','张三丰','2019-09-11 12:49:22','执行了com.fh.shop.admin.controller.user.UserController的updateUser方法成功！！！',1,'','|userName=t1|realName=t1|id=21|age=22|phone=|email=784510419@qq.com|salary=|entryTime=|sex=1|roleIds=3,5,6',''),(46,'admin','张三丰','2019-09-12 15:51:13','执行了com.fh.shop.admin.controller.user.UserController的deleteUser方法成功！！！',1,'','|id=21','删除用户'),(47,'admin','张三丰','2019-09-12 16:29:24','执行了com.fh.shop.admin.controller.user.UserController的add方法成功！！！',1,'','|userName=tt1|realName=|password=|age=|salary=|phone=|email=|entryTime=|roleIds=','添加用户'),(48,'admin','张三丰','2019-09-15 18:23:02','执行了com.fh.shop.admin.controller.user.UserController的add方法成功！！！',1,'','|userName=sysadmin|realName=小南|password=111|age=34|sex=1|salary=|phone=|email=|entryTime=|roleIds=2,6','添加用户'),(49,'admin','张三丰','2019-09-15 18:23:53','执行了com.fh.shop.admin.controller.role.RoleController的update方法成功！！！',1,'','|id=2|roleName=商品维护人|ids[]=1,17,18,19,20',''),(50,'admin','张三丰','2019-09-15 18:24:26','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'','|fatherId=20|menuName=删除1|url=/s/f/safd|type=1',''),(51,'admin','张三丰','2019-09-15 18:24:36','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'','|fatherId=49|menuName=删除11|url=/s/df/sdf|type=1',''),(52,'admin','张三丰','2019-09-15 18:24:46','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'','|fatherId=50|menuName=删除111|url=/s/dfs/a|type=1',''),(53,'admin','张三丰','2019-09-15 18:26:05','执行了com.fh.shop.admin.controller.role.RoleController的update方法成功！！！',1,'','|id=1|roleName=管理员|ids[]=1,17,18,27,28,29,30,31,19,32,33,34,35,20,49,50,51,23,24,39,40,41,47,48,25,42,43,26,45',''),(54,'sysadmin','小南','2019-09-15 18:26:50','执行了com.fh.shop.admin.controller.resource.ResourceController的deleteBatch方法成功！！！',1,'','|ids[]=46',''),(55,'sysadmin','小南','2019-09-15 18:28:33','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=25|oldPassword=|newPassword=|confirmPassword=','修改密码'),(56,'sysadmin','小南','2019-09-15 18:28:37','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=25|oldPassword=sdfsdf|newPassword=|confirmPassword=','修改密码'),(57,'sysadmin','小南','2019-09-15 18:28:49','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=25|oldPassword=sdfsdf|newPassword=222222|confirmPassword=222222','修改密码'),(58,'sysadmin','小南','2019-09-15 18:29:01','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=25|oldPassword=111|newPassword=222222|confirmPassword=222222','修改密码'),(59,'admin','张三丰','2019-09-15 18:31:20','执行了com.fh.shop.admin.controller.user.UserController的updateUserStatus方法成功！！！',1,'','|id=25','解锁用户'),(60,'zhangsan','张三','2019-09-15 18:33:16','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=26eW38|newPassword=111111|confirmPassword=111111','修改密码'),(61,'admin','张三丰','2019-09-15 18:38:45','执行了com.fh.shop.admin.controller.user.UserController的resetUserPassword方法成功！！！',1,'','|id=18','重置用户密码');

/*Table structure for table `t_resource` */

DROP TABLE IF EXISTS `t_resource`;

CREATE TABLE `t_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fatherId` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_resource` */

insert  into `t_resource`(`id`,`menuName`,`fatherId`,`type`,`url`) values (1,'后台管理的菜单',0,NULL,NULL),(17,'商品管理',1,1,'/sdf/safds'),(18,'商品添加',17,1,'/aa'),(19,'商品修改',17,1,'/ddd'),(20,'商品删除',17,1,'/dr'),(21,'品牌管理',1,1,''),(22,'地区管理',1,1,'/a/b'),(23,'系统管理',1,1,''),(24,'用户管理',23,1,'/user/index.jhtml'),(25,'菜单管理',23,1,'/resource/index.jhtml'),(26,'角色管理',23,1,'/role/index.jhtml'),(27,'添加11',18,1,''),(28,'添加111',27,1,''),(29,'添加22',18,1,''),(30,'添加222',29,1,''),(31,'添加2222',30,1,''),(32,'修改11',19,1,''),(33,'修改111',32,1,''),(34,'修改1111',33,1,''),(35,'修改1112',33,1,''),(39,'用户删除',24,2,'/user/deleteUser.jhtml'),(40,'批量删除',24,2,'/user/deleteBatch'),(41,'添加用户',24,2,'/user/add'),(42,'添加菜单',25,2,'/resource/add'),(43,'修改菜单',25,2,'/resource/update'),(44,'删除',25,2,'/resource/deleteBatch'),(45,'日志管理',1,1,'/log/index.jhtml'),(47,'解锁',24,2,'/user/updateUserStatus.jhtml'),(48,'重置密码',24,2,'/user/resetUserPassword.jhtml'),(49,'删除1',20,1,'/s/f/safd'),(50,'删除11',49,1,'/s/df/sdf'),(51,'删除111',50,1,'/s/dfs/a');

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`roleName`) values (1,'管理员'),(2,'商品维护人'),(3,'品牌维护人'),(4,'地区维护人'),(5,'分类维护人'),(6,'菜单维护人'),(25,'系统管理模块负责人'),(26,'ddd'),(27,'wwww'),(28,'测试');

/*Table structure for table `t_role_resource` */

DROP TABLE IF EXISTS `t_role_resource`;

CREATE TABLE `t_role_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleId` bigint(20) DEFAULT NULL,
  `resourceid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_role_resource` */

insert  into `t_role_resource`(`id`,`roleId`,`resourceid`) values (73,25,1),(74,25,23),(75,25,24),(76,25,25),(77,25,26),(81,5,1),(83,3,1),(84,3,21),(307,28,1),(308,28,17),(309,28,20),(310,6,1),(311,6,23),(312,6,25),(313,6,44),(389,2,1),(390,2,17),(391,2,18),(392,2,19),(393,2,20),(394,1,1),(395,1,17),(396,1,18),(397,1,27),(398,1,28),(399,1,29),(400,1,30),(401,1,31),(402,1,19),(403,1,32),(404,1,33),(405,1,34),(406,1,35),(407,1,20),(408,1,49),(409,1,50),(410,1,51),(411,1,23),(412,1,24),(413,1,39),(414,1,40),(415,1,41),(416,1,47),(417,1,48),(418,1,25),(419,1,42),(420,1,43),(421,1,26),(422,1,45);

/*Table structure for table `t_stu` */

DROP TABLE IF EXISTS `t_stu`;

CREATE TABLE `t_stu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_stu` */

insert  into `t_stu`(`id`,`stuname`,`age`) values (1,'张三',20),(2,'李四',22),(3,'张三',23),(4,'张三',20),(5,'李四',35),(6,'李四',35),(7,'张三',20);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `entryTime` date DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  `loginCount` int(11) DEFAULT '0',
  `loginErrorCount` int(11) DEFAULT '0',
  `loginErrorDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`userName`,`salt`,`realName`,`password`,`sex`,`age`,`phone`,`email`,`salary`,`entryTime`,`loginTime`,`loginCount`,`loginErrorCount`,`loginErrorDate`) values (18,'zhangsan','33c6a0f6-7097-4c0c-9358-d51978bd2311','张三','847f406c2020c0383a9271333f553065',0,22,'','532028476@qq.com',NULL,NULL,'2019-09-15 18:38:54',3,5,'2019-09-15 18:39:04'),(20,'admin','45f0fc4c-197f-4ff1-8b8e-9a60611cf3f8','张三丰','4f06162185d168db45e251108f345f81',1,55,'','',NULL,NULL,'2019-09-15 18:38:24',8,0,'2019-09-12 17:48:15'),(23,'llll','b5371a71-e561-4d7f-8256-ac07e08313e1','订单','fa370ad1ad68627d9f6fd18d63386543',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL),(24,'kkk','6afbe0b8-c435-42ad-ad29-dcdba739d2cb',NULL,'2274f2efc1aa9547c4cb6d48124db663',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL),(25,'sysadmin','2657ebb9-7bcd-46b3-b8e1-37a45101e36f','小南','42008635eb2e30f4c4657588289c6688',1,34,'','',NULL,NULL,'2019-09-15 18:31:31',4,0,'2019-09-15 18:29:43');

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_user_role` */

insert  into `t_user_role`(`id`,`userId`,`roleId`) values (13,12,2),(14,12,3),(15,12,5),(16,13,5),(17,13,6),(25,20,1),(51,18,2),(52,18,3),(53,18,4),(62,24,1),(63,24,2),(64,24,3),(65,23,4),(66,23,5),(67,25,2),(68,25,6);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
