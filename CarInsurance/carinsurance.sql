/*
Navicat MySQL Data Transfer

Source Server         : my
Source Server Version : 50154
Source Host           : localhost:3306
Source Database       : carinsurance

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2016-04-10 19:18:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_config`;
CREATE TABLE `tb_config` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `delflag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `key` varchar(20) DEFAULT NULL COMMENT '配置索引',
  `value` varchar(1000) DEFAULT NULL COMMENT '配置值',
  `remarks` varchar(100) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_config
-- ----------------------------
INSERT INTO `tb_config` VALUES ('1', '0', 'IMG_SAVEPATH', 'F:/2015-eclipse/BoGaoImg', '上传图片保存根路径');
INSERT INTO `tb_config` VALUES ('4', '0', 'PAGESIZE', '10', '页面容量');
INSERT INTO `tb_config` VALUES ('5', '0', 'AUTH_CONF', '1:inf;2:sys,del,opera;3:opera,front;', '权限配置');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `delflag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `email` varchar(100) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `roles` varchar(20) DEFAULT '3' COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', '0', 'super@qq.com', '13987654321', 'CdaiC', 'super', '202CB962AC59075B964B07152D234B70', '0');
INSERT INTO `tb_user` VALUES ('2', '0', 'admin@qq.com', '13987654321', 'Admin', 'admin', '202CB962AC59075B964B07152D234B70', '1');
INSERT INTO `tb_user` VALUES ('3', '0', '654478998@qq.com', '13987654321', '王大力', 'wdl', '202CB962AC59075B964B07152D234B70', '2');
INSERT INTO `tb_user` VALUES ('4', '0', '888888888@qq.com', '13987654321', 'test', '123', '202CB962AC59075B964B07152D234B70', '2');
