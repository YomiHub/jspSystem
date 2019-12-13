/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : wordmanager

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-12-13 11:59:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '好的', 'heyanmei');
INSERT INTO `comment` VALUES ('2', 'ad得给对方', 'heyanmei');
INSERT INTO `comment` VALUES ('3', '三个', 'heyanmei');
INSERT INTO `comment` VALUES ('4', '434', 'heyanmei');
INSERT INTO `comment` VALUES ('5', '今天天气真好', 'heyanmei');
INSERT INTO `comment` VALUES ('6', '建议', 'wyx');
INSERT INTO `comment` VALUES ('7', '太好玩了', 'wyx');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('cyl', 'cyl');
INSERT INTO `user` VALUES ('dj', 'dj');
INSERT INTO `user` VALUES ('fjx', 'fjx');
INSERT INTO `user` VALUES ('heyanmei', 'heyanmei');
INSERT INTO `user` VALUES ('lzc', 'lzc');
INSERT INTO `user` VALUES ('wyx', 'wyx');

-- ----------------------------
-- Table structure for word
-- ----------------------------
DROP TABLE IF EXISTS `word`;
CREATE TABLE `word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `english` varchar(20) DEFAULT NULL COMMENT '英文单词',
  `chinese` varchar(20) DEFAULT NULL COMMENT '中文释义',
  `type` varchar(10) DEFAULT NULL COMMENT '类别',
  `comm` varchar(20) DEFAULT NULL COMMENT '注释',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of word
-- ----------------------------
INSERT INTO `word` VALUES ('2', 'other', '其他', '学科', '测试');
INSERT INTO `word` VALUES ('3', 'english', '英语', '学科', '测试用途');
INSERT INTO `word` VALUES ('5', 'she', '她', '人称', '测试');
INSERT INTO `word` VALUES ('6', 'word', '单词', '其他', '测试用途');
INSERT INTO `word` VALUES ('8', 'he', '他', '学科', '测试用途');
INSERT INTO `word` VALUES ('9', 'i', '我', '人称', '测试');
INSERT INTO `word` VALUES ('10', 'qf', '千锋', '学科', '太强了');
