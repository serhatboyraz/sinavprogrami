/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : sinavprogrami

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-03-24 10:02:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dersler
-- ----------------------------
DROP TABLE IF EXISTS `dersler`;
CREATE TABLE `dersler` (
  `kod` varchar(30) NOT NULL,
  `ad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dersler
-- ----------------------------
INSERT INTO `dersler` VALUES ('ADD1106', 'Girişimcilik - I');
INSERT INTO `dersler` VALUES ('ADS000002', 'Muzik');
INSERT INTO `dersler` VALUES ('SMYO2002', 'Girişimcilik - II');
INSERT INTO `dersler` VALUES ('YBİL2012', 'Görsel Programlama II');
INSERT INTO `dersler` VALUES ('YBİL2038', 'Görüntü İşleme');

-- ----------------------------
-- Table structure for derslikler
-- ----------------------------
DROP TABLE IF EXISTS `derslikler`;
CREATE TABLE `derslikler` (
  `kod` varchar(30) NOT NULL,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of derslikler
-- ----------------------------
INSERT INTO `derslikler` VALUES ('B35');
INSERT INTO `derslikler` VALUES ('C11');
INSERT INTO `derslikler` VALUES ('C12');
INSERT INTO `derslikler` VALUES ('C13');
INSERT INTO `derslikler` VALUES ('F40');

-- ----------------------------
-- Table structure for hoca2sinav
-- ----------------------------
DROP TABLE IF EXISTS `hoca2sinav`;
CREATE TABLE `hoca2sinav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sinavid` int(11) DEFAULT NULL,
  `hocaid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hoca2sinav_ibfk_1` (`hocaid`),
  KEY `hoca2sinav_ibfk_2` (`sinavid`),
  CONSTRAINT `hoca2sinav_ibfk_1` FOREIGN KEY (`hocaid`) REFERENCES `hocalar` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `hoca2sinav_ibfk_2` FOREIGN KEY (`sinavid`) REFERENCES `sinavlar` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hoca2sinav
-- ----------------------------
INSERT INTO `hoca2sinav` VALUES ('14', '29', '1');
INSERT INTO `hoca2sinav` VALUES ('15', '29', '2');
INSERT INTO `hoca2sinav` VALUES ('17', '31', '1');
INSERT INTO `hoca2sinav` VALUES ('18', '32', '1');
INSERT INTO `hoca2sinav` VALUES ('19', null, '1');
INSERT INTO `hoca2sinav` VALUES ('20', null, '2');
INSERT INTO `hoca2sinav` VALUES ('21', null, '3');
INSERT INTO `hoca2sinav` VALUES ('22', '37', '1');
INSERT INTO `hoca2sinav` VALUES ('23', '37', '3');
INSERT INTO `hoca2sinav` VALUES ('24', '38', '2');

-- ----------------------------
-- Table structure for hocalar
-- ----------------------------
DROP TABLE IF EXISTS `hocalar`;
CREATE TABLE `hocalar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(100) DEFAULT NULL,
  `sifre` varchar(60) DEFAULT NULL,
  `admin` varchar(1) DEFAULT NULL,
  `adsoyad` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hocalar
-- ----------------------------
INSERT INTO `hocalar` VALUES ('1', 'test@test.com', '$2y$08$MlBFSG5FaERpRDVuZmFXcOfJyOnQeC5rwMpiYSKk7zc.EukTlAnrG', 'X', 'Serhat Boyraz');
INSERT INTO `hocalar` VALUES ('2', 'ertugrul_cinar@hotmail.com', '$2y$08$elNPcGtiRUg3OEZNbVVZROgieDz9NPqDIIlnWMVAqtoRDqyDdwR1G', 'X', 'Ertuğrul Çınar');
INSERT INTO `hocalar` VALUES ('3', 's@s.com', '$2y$08$anNiUHB3ZU9HNkU1WTcrN.6hZ53GMRuE2at010mybRjk26MU4jenm', null, 'Samed Kaya');

-- ----------------------------
-- Table structure for sinavlar
-- ----------------------------
DROP TABLE IF EXISTS `sinavlar`;
CREATE TABLE `sinavlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `derskod` varchar(30) DEFAULT NULL,
  `derslikkod` varchar(30) DEFAULT NULL,
  `sinavtarih` varchar(8) DEFAULT NULL,
  `sinavbaslangicsaat` varchar(6) DEFAULT NULL,
  `sinavbitissaat` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sinavlar_ibfk_1` (`derslikkod`),
  KEY `sinavlar_ibfk_2` (`derskod`),
  CONSTRAINT `sinavlar_ibfk_1` FOREIGN KEY (`derslikkod`) REFERENCES `derslikler` (`kod`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `sinavlar_ibfk_2` FOREIGN KEY (`derskod`) REFERENCES `dersler` (`kod`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sinavlar
-- ----------------------------
INSERT INTO `sinavlar` VALUES ('29', 'ADS000002', 'C11', '20170316', '1400', '1500');
INSERT INTO `sinavlar` VALUES ('30', 'ADD1106', 'B35', '20170316', '1400', '1500');
INSERT INTO `sinavlar` VALUES ('31', 'ADD1106', 'C11', '20170316', '1700', '1800');
INSERT INTO `sinavlar` VALUES ('32', 'ADD1106', 'C11', '20170317', '1700', '1800');
INSERT INTO `sinavlar` VALUES ('37', 'SMYO2002', 'B35', '20170322', '1500', '1600');
INSERT INTO `sinavlar` VALUES ('38', 'ADD1106', 'C11', '20170322', '1500', '1600');
