/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : mobileshop

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-05-22 13:32:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for management
-- ----------------------------
DROP TABLE IF EXISTS `management`;
CREATE TABLE `management` (
  `logname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `realname` varchar(255) NOT NULL,
  PRIMARY KEY (`logname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of management
-- ----------------------------
INSERT INTO `management` VALUES ('hym', 'hym', '15768236616', '广东海洋大学', '小燕子');

-- ----------------------------
-- Table structure for mobileclassify
-- ----------------------------
DROP TABLE IF EXISTS `mobileclassify`;
CREATE TABLE `mobileclassify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mobileclassify
-- ----------------------------
INSERT INTO `mobileclassify` VALUES ('1', 'iPhone手机');
INSERT INTO `mobileclassify` VALUES ('2', 'Android手机');
INSERT INTO `mobileclassify` VALUES ('3', 'Win Phone手机');

-- ----------------------------
-- Table structure for mobileform
-- ----------------------------
DROP TABLE IF EXISTS `mobileform`;
CREATE TABLE `mobileform` (
  `mobile_version` varchar(50) NOT NULL,
  `mobile_name` varchar(60) NOT NULL,
  `mobile_made` varchar(255) NOT NULL,
  `mobile_price` float(10,0) NOT NULL,
  `mobile_mess` varchar(255) DEFAULT NULL,
  `mobile_pic` varchar(255) NOT NULL,
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`mobile_version`,`mobile_pic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mobileform
-- ----------------------------
INSERT INTO `mobileform` VALUES ('A8971', ' 小米6', ' 小米集团', '8971', ' 超长续航', 'aa.jpg', '3');
INSERT INTO `mobileform` VALUES ('A89s6', '苹果S5手机', '苹果手机', '9876', '高清大屏幕 1920*1080像素\r\n电池容量：1800mAh,后置摄像头像素：800万像素\r\n操作系统：ISO RAM容量：4GB  ROM容量：32GB|128GB', 'apple.jpg', '1');
INSERT INTO `mobileform` VALUES ('B2343', '三星B7手机', '三星手机', '14567', '折叠屏', 'ee.jpg', '2');
INSERT INTO `mobileform` VALUES ('B8978', '三星A98手机', '三星手机', '8976', ' 支持图形非常好', ' aa.jpg', '2');
INSERT INTO `mobileform` VALUES ('C555', '中兴N986', ' 中兴公司', '3567', ' 双卡双待', ' cc.jpg', '2');
INSERT INTO `mobileform` VALUES ('DD111', '2016苹果新款', '苹果公司', '9987', ' 双卡双待', ' aa.jpg', '1');

-- ----------------------------
-- Table structure for orderform
-- ----------------------------
DROP TABLE IF EXISTS `orderform`;
CREATE TABLE `orderform` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `logname` varchar(255) NOT NULL,
  `mess` varchar(255) NOT NULL,
  `sum` float(4,0) NOT NULL,
  `status` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderform
-- ----------------------------
INSERT INTO `orderform` VALUES ('3', 'wyx', '1:(A89s6,苹果S5手机,苹果手机,9876.0)', '987', '0000000001');
INSERT INTO `orderform` VALUES ('5', 'hym', '1:(DD111,2016苹果新款,苹果公司,9987.0)', '9987', '0000000001');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `logname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `realname` varchar(255) NOT NULL,
  PRIMARY KEY (`logname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('234324', '2354235', '1432142345', '湖光岩', '213');
INSERT INTO `user` VALUES ('3242', '34545', '234535', '广东海洋大学隔壁', '234');
INSERT INTO `user` VALUES ('456', '456', '456', '广东海洋大学', '456');
INSERT INTO `user` VALUES ('678', '678', '678', '广东海洋大学', '6578');
INSERT INTO `user` VALUES ('789', '789', '789', '广东海洋大学', '789');
INSERT INTO `user` VALUES ('de', 'de', 'de', 'de', 'de');
INSERT INTO `user` VALUES ('hym', 'hym', '1432142345', '湖光岩', '213');
INSERT INTO `user` VALUES ('hym123', 'hym123', '15768236616123', '1348918467@qq.com123', '何燕梅123');
INSERT INTO `user` VALUES ('pjj', 'pjj', 'pjj', 'pjj', 'pjj');
INSERT INTO `user` VALUES ('wyx', 'wyx', '14567889900', '广东海洋大学', 'wyx');
