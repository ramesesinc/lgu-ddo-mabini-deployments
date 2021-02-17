/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50559
Source Host           : localhost:3306
Source Database       : etracs_image

Target Server Type    : MYSQL
Target Server Version : 50559
File Encoding         : 65001

Date: 2020-10-23 11:11:52
*/

CREATE DATABASE `etracs_image` CHARACTER SET utf8;

USE `etracs_image`; 

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for image_chunk
-- ----------------------------
DROP TABLE IF EXISTS `image_chunk`;
CREATE TABLE `image_chunk` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `fileno` int(11) NOT NULL,
  `byte` longblob NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for image_header
-- ----------------------------
DROP TABLE IF EXISTS `image_header`;
CREATE TABLE `image_header` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `filesize` int(11) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
