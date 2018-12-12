/*
Navicat MySQL Data Transfer

Source Server         : siso
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : siso

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-12-09 17:05:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `people` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `applicationList` varchar(255) DEFAULT NULL,
  `state` bigint(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `application_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of application
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT NULL,
  `customercode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pinyincode` varchar(255) DEFAULT NULL,
  `customeraddr` varchar(255) DEFAULT NULL,
  `contactname` varchar(255) DEFAULT NULL,
  `officetel` varchar(255) DEFAULT NULL,
  `telphone` varchar(255) DEFAULT NULL,
  `serviceperson` varchar(255) DEFAULT NULL,
  `servicephone` varchar(255) DEFAULT NULL,
  `repairtel` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `customer_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '', '1', '服务外包学院', 'FWWBXY', '苏州工业园区若水路99号', '宁经理', '', '18912637879', '1', '15006200149', '15006200149', '测试', '2017-07-11 09:06:28', '2017-07-11 09:07:53', null);

-- ----------------------------
-- Table structure for evaluation
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `printerid` bigint(11) DEFAULT NULL,
  `repairevaluation` varchar(255) DEFAULT NULL,
  `serviceattitude` bigint(11) DEFAULT NULL,
  `technicallevel` bigint(11) DEFAULT NULL,
  `responsetime` bigint(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `evaluation_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation
-- ----------------------------
INSERT INTO `evaluation` VALUES ('1', '1', '不错', '5', '5', '5', '2017-07-11 07:28:56', '2017-07-11 07:28:56', null);
INSERT INTO `evaluation` VALUES ('2', '3', '', '5', '5', '5', '2017-07-24 02:35:28', '2017-07-24 02:35:28', null);
INSERT INTO `evaluation` VALUES ('3', '2', '', '5', '5', '5', '2017-08-15 06:30:45', '2017-08-15 06:30:45', null);
INSERT INTO `evaluation` VALUES ('4', '28', '很快到达现场帮助用户解决问题', '5', '5', '5', '2018-09-06 01:01:38', '2018-09-06 01:01:38', null);

-- ----------------------------
-- Table structure for fault
-- ----------------------------
DROP TABLE IF EXISTS `fault`;
CREATE TABLE `fault` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `printer_id` bigint(11) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `printertype` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `realposition` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `supplytype` int(11) DEFAULT NULL,
  `staff` bigint(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=464 DEFAULT CHARSET=utf8 COMMENT='故障表';

-- ----------------------------
-- Records of fault
-- ----------------------------
INSERT INTO `fault` VALUES ('18', '64', '扫描一体机', '京瓷', 'KM-2560', '王海霞', null, '62932631', 'A701', 'Wed Sep 12 2018 11:20:18 GMT+0800 (CST)', '9', '侧面板内部件损坏', null, '1', '1', null, '2017-09-02 02:59:26', '2018-09-12 03:20:08', '2017-09-05 04:31:02');
INSERT INTO `fault` VALUES ('53', '64', '扫描一体机', '京瓷', 'KM-2560', '程宝峰', null, '13862177740', 'A701', 'Wed Sep 12 2018 11:20:18 GMT+0800 (CST)', '9', '加热组件损坏', null, '1', '1', null, '2017-09-02 03:02:09', '2018-09-12 03:20:08', '2017-09-05 04:31:02');
INSERT INTO `fault` VALUES ('102', '42', '桌面打印机', '京瓷', 'FS-1060DN', '张洪波', null, '13814839557', 'H309', 'Wed Sep 12 2018 12:44:22 GMT+0800 (CST)', '9', '故障报警灯亮，无法打印。', null, '1', '1', null, '2017-09-02 06:50:24', '2018-09-12 04:44:12', '2017-09-02 07:49:23');
INSERT INTO `fault` VALUES ('105', '46', '传真打印一体机', '佳能', 'MF4370DNG', '王玉军', null, '62932908', 'H106', 'Wed Sep 12 2018 11:30:17 GMT+0800 (CST)', null, '暑假前就显示磨粉不足，开学办公室各位老师打印教学文档', '1', '1', '1', null, '2017-09-02 08:44:59', '2018-09-12 03:30:08', '2017-09-03 08:07:37');
INSERT INTO `fault` VALUES ('106', '42', '桌面打印机', '京瓷', 'FS-1060DN', '', null, '', 'H311', 'Wed Sep 12 2018 12:44:22 GMT+0800 (CST)', '4', '', null, '1', '1', null, '2017-09-02 08:50:52', '2018-09-12 04:44:12', '2018-09-12 04:17:48');
INSERT INTO `fault` VALUES ('124', '34', '桌面一体传真机', '联想', 'M7650DNF', '沈婧', null, '62932820', 'g107', 'Wed Sep 12 2018 12:20:17 GMT+0800 (CST)', null, '无墨', '1', '1', '1', null, '2017-09-03 05:51:09', '2018-09-12 04:20:07', '2017-09-03 08:05:17');
INSERT INTO `fault` VALUES ('125', '55', '激光打印机', '三星', 'prom3325ND', '丁淑彦', null, '15850005332', 'A602', 'Wed Sep 12 2018 12:38:40 GMT+0800 (CST)', '1', '卡纸   中间有一条灰色', null, '1', '1', null, '2017-09-04 07:10:57', '2018-09-12 04:38:31', null);
INSERT INTO `fault` VALUES ('127', '6', '复印机', '京瓷', 'FS-6525MFP', '倪卓琳', null, '62932021', 'a601', 'Wed Sep 12 2018 11:23:36 GMT+0800 (CST)', '9', '电脑需要连一下打印机，谢谢', null, '1', '1', null, '2017-09-05 02:18:59', '2018-09-12 03:23:27', '2017-09-05 02:24:37');
INSERT INTO `fault` VALUES ('128', '64', '扫描一体机', '京瓷', 'KM-2560', '', null, '', 'a701', 'Wed Sep 12 2018 11:20:18 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-09-05 04:24:50', '2018-09-12 03:20:08', '2017-09-05 04:31:02');
INSERT INTO `fault` VALUES ('131', '9', '复印机', '京瓷', 'KM-2560', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', 'A602', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', '2', '脏污', null, '1', '1', null, '2017-09-05 07:30:43', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('132', '64', '扫描一体机', '京瓷', 'KM-2560', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', 'A701', 'Wed Sep 12 2018 11:20:18 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-09-05 07:34:00', '2018-09-12 03:20:08', null);
INSERT INTO `fault` VALUES ('133', '26', '复印一体机', '京瓷', 'KM-2560', '卢晨', null, '62932711', 'F506', 'Wed Sep 12 2018 11:26:40 GMT+0800 (CST)', '1', '双面打印卡纸', null, '1', '1', null, '2017-09-06 00:42:54', '2018-09-12 03:26:32', null);
INSERT INTO `fault` VALUES ('134', '27', '复印一体机', '京瓷', 'KM-2560', '卢晨', null, '62932711', 'F506', 'Wed Sep 12 2018 11:26:23 GMT+0800 (CST)', '4', '无法打印，之前维修过，说要换零件', null, '1', '1', null, '2017-09-06 00:44:02', '2018-09-12 03:26:14', null);
INSERT INTO `fault` VALUES ('135', '47', '彩色打印机', '佳能', 'LBP5960', '张建亮', null, '13776093252', 'H311', 'Thu Dec 28 2017 16:34:05 GMT+0800 (CST)', '9', '需要usb数据线连接一台电脑，现在无法连接', null, '1', '1', null, '2017-09-06 07:21:35', '2017-12-28 08:34:04', null);
INSERT INTO `fault` VALUES ('136', '43', '复印一体机', '京瓷', 'KM-2560', '', null, '', 'H311', 'Wed Sep 12 2018 11:28:50 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2017-09-08 08:15:17', '2018-09-12 03:28:41', null);
INSERT INTO `fault` VALUES ('137', '43', '复印一体机', '京瓷', 'KM-2560', '', null, '', 'H311', 'Wed Sep 12 2018 11:28:50 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2017-09-08 08:15:24', '2018-09-12 03:28:41', null);
INSERT INTO `fault` VALUES ('138', '43', '复印一体机', '京瓷', 'KM-2560', '', null, '', 'H311', 'Wed Sep 12 2018 11:28:50 GMT+0800 (CST)', '2', '', null, '1', '1', null, '2017-09-11 02:45:03', '2018-09-12 03:28:41', null);
INSERT INTO `fault` VALUES ('139', '35', '桌面激光打印机', 'HP', 'HP400 M401dn', '陈丽君', null, '13656238548', '商学院G107', 'Wed Sep 12 2018 12:42:29 GMT+0800 (CST)', '1', '卡纸 无法打印', null, '1', '1', null, '2017-09-11 09:26:02', '2018-09-12 04:42:19', null);
INSERT INTO `fault` VALUES ('140', '17', '桌面打印机', 'HP', 'Laserjet1008', '唐小可', null, '13776026171', 'B301', 'Tue Sep 19 2017 11:13:22 GMT+0800 (CST)', null, '换墨', '1', '1', '1', null, '2017-09-12 07:46:59', '2017-09-19 03:13:11', null);
INSERT INTO `fault` VALUES ('141', '57', '复印机', '京瓷', 'FS-6525MFP', '', null, '', '外包学院', 'Wed Sep 12 2018 12:29:02 GMT+0800 (CST)', '9', '', null, '1', '1', null, '2017-09-13 01:16:07', '2018-09-12 04:28:53', null);
INSERT INTO `fault` VALUES ('142', '28', '复印一体机', '京瓷', '300i', '何', null, '2840', 'G210', 'Wed Sep 12 2018 12:52:08 GMT+0800 (CST)', '9', 'G210打印机坏。\n侧面盖板合不上去。', null, '1', '1', null, '2017-09-13 05:02:10', '2018-09-12 04:51:58', null);
INSERT INTO `fault` VALUES ('143', '34', '桌面一体传真机', '联想', 'M7650DNF', '沈', null, '2820', 'g107', 'Wed Sep 12 2018 12:20:17 GMT+0800 (CST)', null, '没墨了', '1', '1', '1', null, '2017-09-14 08:40:30', '2018-09-12 04:20:07', null);
INSERT INTO `fault` VALUES ('144', '19', '复印一体机', '施乐', 'S2420', '罗凯', null, '18262008681', 'F405', 'Wed Sep 12 2018 11:25:04 GMT+0800 (CST)', '1', '纸盘一卡纸，重启也没用', null, '1', '1', null, '2017-09-15 01:55:34', '2018-09-12 03:24:55', null);
INSERT INTO `fault` VALUES ('145', '27', '复印一体机', '京瓷', 'KM-2560', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '506', 'Wed Sep 12 2018 11:26:23 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-09-15 08:39:04', '2018-09-12 03:26:14', null);
INSERT INTO `fault` VALUES ('146', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wFiOYdggX62ldXnw-mr3Ajc', '', '测试', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '9', '', null, '1', '1', null, '2017-09-19 00:48:48', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('147', '17', '桌面打印机', 'HP', 'Laserjet1008', '唐小可', null, '13776026171', 'B301', 'Tue Sep 19 2017 11:13:22 GMT+0800 (CST)', '1', '打印机不能打印', null, '1', '1', null, '2017-09-19 01:42:46', '2017-09-19 03:13:11', null);
INSERT INTO `fault` VALUES ('148', '23', '复印一体机', '施乐', 'S2420', '孙琳', null, '15850088035', 'F412', 'Wed Sep 12 2018 11:18:55 GMT+0800 (CST)', null, '墨盒没墨了', '1', '1', '1', null, '2017-09-19 02:59:03', '2018-09-12 03:18:45', null);
INSERT INTO `fault` VALUES ('149', '31', '复印机', '京瓷', '300i', '武', null, '15006214399', 'G108', 'Wed Sep 12 2018 12:24:20 GMT+0800 (CST)', '1', '更换废粉盒', null, '1', '1', null, '2017-09-19 08:22:15', '2018-09-12 04:24:10', null);
INSERT INTO `fault` VALUES ('150', '31', '复印机', '京瓷', '300i', '武', null, '15006214399', 'G108', 'Wed Sep 12 2018 12:24:20 GMT+0800 (CST)', '1', '更换废粉盒', null, '1', '1', null, '2017-09-19 08:22:19', '2018-09-12 04:24:10', null);
INSERT INTO `fault` VALUES ('151', '55', '激光打印机', '三星', 'prom3325ND', '丁淑彦', null, '15850005332', ' A602', 'Wed Sep 12 2018 12:38:40 GMT+0800 (CST)', '4', '复无反应', null, '1', '1', null, '2017-09-20 01:35:11', '2018-09-12 04:38:31', null);
INSERT INTO `fault` VALUES ('152', '40', '激光打印机', 'HP', 'HP400 M401dn', '穆牧', null, '15851480567', 'H108', 'Wed Sep 12 2018 12:42:45 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2017-09-20 02:08:28', '2018-09-12 04:42:35', null);
INSERT INTO `fault` VALUES ('153', '43', '复印一体机', '京瓷', 'KM-2560', '王维', null, '18036099321', 'H311', 'Wed Sep 12 2018 11:28:50 GMT+0800 (CST)', '1', '问题表面是卡纸。但是，应该是打印机右侧的设备耗材损坏。', null, '1', '1', null, '2017-09-20 09:05:06', '2018-09-12 03:28:41', null);
INSERT INTO `fault` VALUES ('154', '64', '扫描一体机', '京瓷', 'KM-2560', '', null, '', '701', 'Wed Sep 12 2018 11:20:18 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-09-21 06:07:20', '2018-09-12 03:20:08', null);
INSERT INTO `fault` VALUES ('155', '44', '传真一体机', '联想', 'M7650DNF', '王维', null, '18036099321', 'H311', 'Wed Sep 12 2018 11:28:31 GMT+0800 (CST)', null, '打印机没有墨了。麻烦请给我一个新的墨盒。感谢！', '1', '1', '1', null, '2017-09-21 07:36:10', '2018-09-12 03:28:22', null);
INSERT INTO `fault` VALUES ('156', '8', '桌面激光打印机', '京瓷', 'ES-6975DN', '章琦', null, '13913599086', '事务保障中心', 'Wed Sep 12 2018 12:20:24 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2017-09-25 02:45:26', '2018-09-12 04:20:15', null);
INSERT INTO `fault` VALUES ('157', '64', '扫描一体机', '京瓷', 'KM-2560', '徐海波', null, '13382503066', 'a701', 'Wed Sep 12 2018 11:20:18 GMT+0800 (CST)', '1', '反复卡纸', null, '1', '1', null, '2017-09-25 04:45:37', '2018-09-12 03:20:08', null);
INSERT INTO `fault` VALUES ('158', '8', '桌面激光打印机', '京瓷', 'ES-6975DN', '章琦', null, '13913599086', '事务保障中心', 'Wed Sep 12 2018 12:20:24 GMT+0800 (CST)', '4', '', null, '1', '1', null, '2017-09-26 00:56:58', '2018-09-12 04:20:15', null);
INSERT INTO `fault` VALUES ('159', '42', '桌面打印机', '京瓷', 'FS-1060DN', '周洋', null, '18036392112', 'h201', 'Wed Sep 12 2018 12:44:22 GMT+0800 (CST)', '4', '无法安装驱动', null, '1', '1', null, '2017-09-27 02:23:58', '2018-09-12 04:44:12', null);
INSERT INTO `fault` VALUES ('160', '43', '复印一体机', '京瓷', 'KM-2560', '', null, '', 'h311', 'Wed Sep 12 2018 11:28:50 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-09-27 03:01:04', '2018-09-12 03:28:41', null);
INSERT INTO `fault` VALUES ('161', '8', '桌面激光打印机', '京瓷', 'ES-6975DN', '章琦', null, '13913599086', '事务保障中心', 'Wed Sep 12 2018 12:20:24 GMT+0800 (CST)', '2', '', null, '1', '1', null, '2017-09-27 03:16:28', '2018-09-12 04:20:15', null);
INSERT INTO `fault` VALUES ('162', '28', '复印一体机', '京瓷', '300i', '何洪亮', null, '62532840', 'g210', 'Wed Sep 12 2018 12:52:08 GMT+0800 (CST)', '1', '打印机侧面盖板合不上', null, '1', '1', null, '2017-09-28 04:24:57', '2018-09-12 04:51:58', null);
INSERT INTO `fault` VALUES ('163', '55', '激光打印机', '三星', 'prom3325ND', '丁淑彦', null, '15850005332', 'A602', 'Wed Sep 12 2018 12:38:40 GMT+0800 (CST)', '1', '面板失灵', null, '1', '1', null, '2017-09-29 01:01:38', '2018-09-12 04:38:31', null);
INSERT INTO `fault` VALUES ('164', '43', '复印一体机', '京瓷', 'KM-2560', '', null, '', 'H311', 'Wed Sep 12 2018 11:28:50 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-09-29 01:54:42', '2018-09-12 03:28:41', null);
INSERT INTO `fault` VALUES ('165', '37', '桌面激光打印机', 'HP', 'HPLaserJet2055d', '陈永花', null, '13205191685', 'G108', 'Sat Sep 30 2017 08:45:26 GMT+0800 (CST)', null, '墨盒耗尽', '1', '1', '1', null, '2017-09-29 02:46:57', '2017-09-30 00:45:23', null);
INSERT INTO `fault` VALUES ('166', '2', '针式打印机', 'EPSON', 'LQ630K', '', null, '', 'a406', 'Wed Sep 12 2018 11:30:56 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2017-09-29 06:09:31', '2018-09-12 03:30:46', null);
INSERT INTO `fault` VALUES ('167', '30', '桌面激光一体机', 'HP', 'M1136MFP', '张玮', null, '13776009032', 'g210玻璃办公室', 'Wed Sep 12 2018 11:27:03 GMT+0800 (CST)', null, '墨盒没有了，g210北面大空调旁边的玻璃隔间办公室', '1', '1', '1', null, '2017-09-30 04:00:37', '2018-09-12 03:26:54', null);
INSERT INTO `fault` VALUES ('168', '42', '桌面打印机', '京瓷', 'FS-1060DN', '周洋', null, '18036392112', 'H201', 'Wed Sep 12 2018 12:44:22 GMT+0800 (CST)', '4', '脱机', null, '1', '1', null, '2017-10-09 06:30:36', '2018-09-12 04:44:12', null);
INSERT INTO `fault` VALUES ('169', '26', '复印一体机', '京瓷', 'KM-2560', '刘小辰', null, '62932507', 'F506', 'Wed Sep 12 2018 11:26:40 GMT+0800 (CST)', null, '需要墨盒', '1', '1', '1', null, '2017-10-09 06:55:44', '2018-09-12 03:26:32', null);
INSERT INTO `fault` VALUES ('170', '41', '复印一体机', '京瓷', 'KM-2560', '任小芳', null, '13616209619', 'H211', 'Wed Sep 12 2018 13:27:01 GMT+0800 (CST)', null, '墨盒没有墨了', '1', '1', '1', null, '2017-10-10 02:23:04', '2018-09-12 05:26:51', null);
INSERT INTO `fault` VALUES ('171', '41', '复印一体机', '京瓷', 'KM-2560', '任小芳', null, '13616209619', 'H211', 'Wed Sep 12 2018 13:27:01 GMT+0800 (CST)', null, '墨盒没有墨了', '1', '1', '1', null, '2017-10-10 02:23:07', '2018-09-12 05:26:51', null);
INSERT INTO `fault` VALUES ('172', '41', '复印一体机', '京瓷', 'KM-2560', '任小芳', null, '13616209619', 'H211', 'Wed Sep 12 2018 13:27:01 GMT+0800 (CST)', null, '墨盒没有墨了', '1', '1', '1', null, '2017-10-10 02:23:16', '2018-09-12 05:26:51', null);
INSERT INTO `fault` VALUES ('173', '23', '复印一体机', '施乐', 'S2420', '孙琳', null, '15850088035', 'F412', 'Wed Sep 12 2018 11:18:55 GMT+0800 (CST)', '4', '指令错误', null, '1', '1', null, '2017-10-10 04:56:31', '2018-09-12 03:18:45', null);
INSERT INTO `fault` VALUES ('174', '2', '针式打印机', 'EPSON', 'LQ630K', '', 'ohCh0wEfGgfRKs065SKKIVLowG_U', '', '测试', 'Wed Sep 12 2018 11:30:56 GMT+0800 (CST)', '1', '工业技术学院', null, '1', '1', null, '2017-10-10 06:26:59', '2018-09-12 03:30:46', null);
INSERT INTO `fault` VALUES ('175', '22', '复印一体机', '施乐', 'S2420', '陈秀元', null, '18994373657', 'F408', 'Wed Sep 12 2018 11:25:45 GMT+0800 (CST)', '8', '打印机ip地址冲突，无法打印', null, '1', '1', null, '2017-10-11 07:01:59', '2018-09-12 03:25:36', null);
INSERT INTO `fault` VALUES ('176', '64', '扫描一体机', '京瓷', 'KM-2560', '', null, '', 'a701', 'Wed Sep 12 2018 11:20:18 GMT+0800 (CST)', '1', '双面打印纸皱', null, '1', '1', null, '2017-10-12 05:23:05', '2018-09-12 03:20:08', null);
INSERT INTO `fault` VALUES ('177', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '测试', 'ohCh0wFiOYdggX62ldXnw-mr3Ajc', '', '测试', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-10-13 08:58:34', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('178', '26', '复印一体机', '京瓷', 'KM-2560', '刘小辰', null, '62932507', 'F506', 'Wed Sep 12 2018 11:26:40 GMT+0800 (CST)', '1', '卡纸', null, '1', '1', null, '2017-10-16 05:05:45', '2018-09-12 03:26:32', null);
INSERT INTO `fault` VALUES ('179', '26', '复印一体机', '京瓷', 'KM-2560', '刘小辰', null, '62932507', 'F506', 'Wed Sep 12 2018 11:26:40 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-10-17 00:49:07', '2018-09-12 03:26:32', null);
INSERT INTO `fault` VALUES ('180', '42', '桌面打印机', '京瓷', 'FS-1060DN', '秦瑶', null, '13814896510', 'H201', 'Wed Sep 12 2018 12:44:22 GMT+0800 (CST)', '4', '打印机脱机', null, '1', '1', null, '2017-10-17 02:14:49', '2018-09-12 04:44:12', null);
INSERT INTO `fault` VALUES ('181', '19', '复印一体机', '施乐', 'S2420', '罗凯', null, '18262008681', 'F405', 'Wed Sep 12 2018 11:25:04 GMT+0800 (CST)', null, '换墨盒，麻烦迅速更换', '1', '1', '1', null, '2017-10-17 06:53:47', '2018-09-12 03:24:55', null);
INSERT INTO `fault` VALUES ('182', '43', '复印一体机', '京瓷', 'KM-2560', '', null, '', 'H311', 'Wed Sep 12 2018 11:28:50 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-10-19 01:57:00', '2018-09-12 03:28:41', null);
INSERT INTO `fault` VALUES ('183', '18', '激光桌面打印机', 'HP', 'HP2035N', '吴琴', null, '62932179', '图书馆303', 'Fri Oct 20 2017 16:19:53 GMT+0800 (CST)', null, '没墨了', '1', '1', '1', null, '2017-10-20 06:57:36', '2017-10-20 08:19:51', null);
INSERT INTO `fault` VALUES ('184', '9', '复印机', '京瓷', 'KM-2560', '张杨', null, '62932289', 'A602', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', null, '打印机型号为laserjet pro 400 M401dn', '1', '1', '1', null, '2017-10-23 02:18:01', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('185', '38', '扫描一体机', 'HP', 'M1136MFP', '丁强', null, '62932821', 'G109', 'Wed Oct 25 2017 11:22:03 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2017-10-25 02:53:08', '2017-10-25 03:21:53', null);
INSERT INTO `fault` VALUES ('186', '55', '激光打印机', '三星', 'prom3325ND', '', null, '', 'A1102', 'Wed Sep 12 2018 12:38:40 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-10-26 03:19:17', '2018-09-12 04:38:31', null);
INSERT INTO `fault` VALUES ('187', '55', '激光打印机', '三星', 'prom3325ND', '', null, '', 'A1202', 'Wed Sep 12 2018 12:38:40 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-10-26 03:20:35', '2018-09-12 04:38:31', null);
INSERT INTO `fault` VALUES ('188', '55', '激光打印机', '三星', 'prom3325ND', '', null, '', 'A1102', 'Wed Sep 12 2018 12:38:40 GMT+0800 (CST)', '1', '多次卡纸，机器异常', null, '1', '1', null, '2017-10-26 03:24:17', '2018-09-12 04:38:31', null);
INSERT INTO `fault` VALUES ('189', '43', '复印一体机', '京瓷', 'KM-2560', '', null, '', 'H311', 'Wed Sep 12 2018 11:28:50 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-10-26 04:01:10', '2018-09-12 03:28:41', null);
INSERT INTO `fault` VALUES ('190', '40', '激光打印机', 'HP', 'HP400 M401dn', '高雨', null, '18505127468', 'H108', 'Wed Sep 12 2018 12:42:45 GMT+0800 (CST)', '4', '打印机无法联网', null, '1', '1', null, '2017-11-06 01:33:33', '2018-09-12 04:42:35', null);
INSERT INTO `fault` VALUES ('191', '43', '复印一体机', '京瓷', 'KM-2560', '', null, '', 'H311', 'Wed Sep 12 2018 11:28:50 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-11-06 02:14:53', '2018-09-12 03:28:41', null);
INSERT INTO `fault` VALUES ('192', '66', '桌面打印机', 'HP', 'HP400 M401dn', '顾家乐', null, '', 'A701', 'Wed Sep 12 2018 12:43:47 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2017-11-07 03:08:53', '2018-09-12 04:43:38', null);
INSERT INTO `fault` VALUES ('193', '46', '传真打印一体机', '佳能', 'MF4370DNG', '', null, '', 'H106', 'Wed Sep 12 2018 11:30:17 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2017-11-09 01:28:06', '2018-09-12 03:30:08', null);
INSERT INTO `fault` VALUES ('194', '43', '复印一体机', '京瓷', 'KM-2560', '', null, '', 'H311', 'Wed Sep 12 2018 11:28:50 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-11-10 04:32:26', '2018-09-12 03:28:41', null);
INSERT INTO `fault` VALUES ('195', '47', '彩色打印机', '佳能', 'LBP5960', '张建亮', null, '13776093252', 'Hi311', 'Thu Dec 28 2017 16:34:05 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-11-15 03:22:26', '2017-12-28 08:34:04', null);
INSERT INTO `fault` VALUES ('196', '43', '复印一体机', '京瓷', 'KM-2560', '张建亮', null, '13776093252', 'h311', 'Wed Sep 12 2018 11:28:50 GMT+0800 (CST)', '9', '', null, '1', '1', null, '2017-11-15 04:16:36', '2018-09-12 03:28:41', null);
INSERT INTO `fault` VALUES ('197', '8', '桌面激光打印机', '京瓷', 'ES-6975DN', '章琦', null, '13913599086', 'A601', 'Wed Sep 12 2018 12:20:24 GMT+0800 (CST)', '2', '', null, '1', '1', null, '2017-11-16 02:49:50', '2018-09-12 04:20:15', null);
INSERT INTO `fault` VALUES ('198', '8', '桌面激光打印机', '京瓷', 'ES-6975DN', '', null, '', '601', 'Wed Sep 12 2018 12:20:24 GMT+0800 (CST)', '2', '纸面打印大量污损', null, '1', '1', null, '2017-11-17 05:13:18', '2018-09-12 04:20:15', null);
INSERT INTO `fault` VALUES ('199', '8', '桌面激光打印机', '京瓷', 'ES-6975DN', '章', null, '13913599086', 'A601', 'Wed Sep 12 2018 12:20:24 GMT+0800 (CST)', '2', '', null, '1', '1', null, '2017-11-20 01:30:52', '2018-09-12 04:20:15', null);
INSERT INTO `fault` VALUES ('200', '12', '桌面一体机', '京瓷', 'FS-1025MFP', '', null, '', 'A602进门第一张桌子', 'Mon Nov 20 2017 13:17:58 GMT+0800 (CST)', null, '没墨了', '1', '1', '1', null, '2017-11-20 05:08:05', '2017-11-20 05:17:52', null);
INSERT INTO `fault` VALUES ('201', '9', '复印机', '京瓷', 'KM-2560', '李箫', null, '62932182', 'a602', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', '1', '卡纸', null, '1', '1', null, '2017-11-20 06:34:18', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('202', '28', '复印一体机', '京瓷', '300i', '廖晨竹', null, '18551105925', 'G210', 'Wed Sep 12 2018 12:52:08 GMT+0800 (CST)', null, '墨粉用尽', '1', '1', '1', null, '2017-11-21 07:29:51', '2018-09-12 04:51:58', null);
INSERT INTO `fault` VALUES ('203', '34', '桌面一体传真机', '联想', 'M7650DNF', '沈', null, '2820', 'g107', 'Wed Sep 12 2018 12:20:17 GMT+0800 (CST)', null, '墨盒', '1', '1', '1', null, '2017-11-21 08:35:55', '2018-09-12 04:20:07', null);
INSERT INTO `fault` VALUES ('204', '34', '桌面一体传真机', '联想', 'M7650DNF', '沈', null, '2820', 'g107', 'Wed Sep 12 2018 12:20:17 GMT+0800 (CST)', '1', '更换硒鼓 墨粉量低', null, '1', '1', null, '2017-11-22 01:04:12', '2018-09-12 04:20:07', null);
INSERT INTO `fault` VALUES ('205', '9', '复印机', '京瓷', 'KM-2560', '李萧', null, '13584849039', 'A602', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', '9', '', null, '1', '1', null, '2017-11-22 02:49:05', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('206', '28', '复印一体机', '京瓷', '300i', '', null, '', 'G210', 'Wed Sep 12 2018 12:52:08 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-11-22 05:53:20', '2018-09-12 04:51:58', null);
INSERT INTO `fault` VALUES ('207', '44', '传真一体机', '联想', 'M7650DNF', '王维', null, '18036099321', 'H311办公室', 'Wed Sep 12 2018 11:28:31 GMT+0800 (CST)', null, '没有墨，需要更换墨盒。', '1', '1', '1', null, '2017-11-23 02:56:21', '2018-09-12 03:28:22', null);
INSERT INTO `fault` VALUES ('208', '9', '复印机', '京瓷', 'KM-2560', '李箫', null, '13584849039', 'A602', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-11-24 01:53:12', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('209', '55', '激光打印机', '三星', 'prom3325ND', '丁淑彦', null, '15850005332', 'A602', 'Wed Sep 12 2018 12:38:40 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-11-24 08:19:24', '2018-09-12 04:38:31', null);
INSERT INTO `fault` VALUES ('210', '47', '彩色打印机', '佳能', 'LBP5960', '张建亮', null, '13776093252', 'H311', 'Thu Dec 28 2017 16:34:05 GMT+0800 (CST)', '4', '', null, '1', '1', null, '2017-11-27 07:03:43', '2017-12-28 08:34:04', null);
INSERT INTO `fault` VALUES ('211', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', null, '', 'A406', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2017-11-28 06:33:46', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('212', '46', '传真打印一体机', '佳能', 'MF4370DNG', '王玉军', null, '13812666165', 'H106', 'Wed Sep 12 2018 11:30:17 GMT+0800 (CST)', '8', '请安装打印机驱动程序和用友财务软件', null, '1', '1', null, '2017-11-28 07:58:00', '2018-09-12 03:30:08', null);
INSERT INTO `fault` VALUES ('213', '46', '传真打印一体机', '佳能', 'MF4370DNG', '任菲', null, '18994374756', 'H106', 'Wed Sep 12 2018 11:30:17 GMT+0800 (CST)', '8', '请到H103装打印驱动', null, '1', '1', null, '2017-11-28 08:47:03', '2018-09-12 03:30:08', null);
INSERT INTO `fault` VALUES ('214', '46', '传真打印一体机', '佳能', 'MF4370DNG', '任菲', null, '18994374756', 'H106', 'Wed Sep 12 2018 11:30:17 GMT+0800 (CST)', '8', '请到H103装驱动', null, '1', '1', null, '2017-11-28 08:49:08', '2018-09-12 03:30:08', null);
INSERT INTO `fault` VALUES ('215', '34', '桌面一体传真机', '联想', 'M7650DNF', '小沈', null, '2820', 'g107', 'Wed Sep 12 2018 12:20:17 GMT+0800 (CST)', '2', '打印有条纹', null, '1', '1', null, '2017-11-30 04:29:59', '2018-09-12 04:20:07', null);
INSERT INTO `fault` VALUES ('216', '43', '复印一体机', '京瓷', 'KM-2560', '于海娟', null, '18994374635', 'H311', 'Wed Sep 12 2018 11:28:50 GMT+0800 (CST)', '9', '机器滚动轴被人为取出，导致打印无效', null, '1', '1', null, '2017-12-01 01:20:52', '2018-09-12 03:28:41', null);
INSERT INTO `fault` VALUES ('217', '36', '复印机', '京瓷', 'KM-2560', 'G109', null, '18862123062', 'G109门口', 'Wed Sep 12 2018 12:23:09 GMT+0800 (CST)', null, '打印机缺墨', '1', '1', '1', null, '2017-12-01 06:58:59', '2018-09-12 04:22:59', null);
INSERT INTO `fault` VALUES ('218', '19', '复印一体机', '施乐', 'S2420', '罗凯', null, '18262008681', 'F405', 'Wed Sep 12 2018 11:25:04 GMT+0800 (CST)', null, '打印机显示缺墨', '1', '1', '1', null, '2017-12-04 02:36:56', '2018-09-12 03:24:55', null);
INSERT INTO `fault` VALUES ('219', '34', '桌面一体传真机', '联想', 'M7650DNF', '沈', null, '2820', 'g107', 'Wed Sep 12 2018 12:20:17 GMT+0800 (CST)', '2', '打印以后一黑条 ', null, '1', '1', null, '2017-12-05 00:53:41', '2018-09-12 04:20:07', null);
INSERT INTO `fault` VALUES ('220', '55', '激光打印机', '三星', 'prom3325ND', '丁淑彦', null, '15850005332', 'A602', 'Wed Sep 12 2018 12:38:40 GMT+0800 (CST)', '4', '', null, '1', '1', null, '2017-12-05 01:42:24', '2018-09-12 04:38:31', null);
INSERT INTO `fault` VALUES ('221', '26', '复印一体机', '京瓷', 'KM-2560', '刘小辰', null, '62932507', 'F506', 'Wed Sep 12 2018 11:26:40 GMT+0800 (CST)', '1', '一直卡纸', null, '1', '1', null, '2017-12-05 02:06:27', '2018-09-12 03:26:32', null);
INSERT INTO `fault` VALUES ('222', '34', '桌面一体传真机', '联想', 'M7650DNF', '沈', null, '2820', 'g107', 'Wed Sep 12 2018 12:20:17 GMT+0800 (CST)', '2', '打印出来的放到机器附近了 自己来吧', null, '1', '1', null, '2017-12-06 05:35:50', '2018-09-12 04:20:07', null);
INSERT INTO `fault` VALUES ('223', '55', '激光打印机', '三星', 'prom3325ND', '丁淑彦', null, '15850005332', 'A602', 'Wed Sep 12 2018 12:38:40 GMT+0800 (CST)', '4', '', null, '1', '1', null, '2017-12-07 00:44:42', '2018-09-12 04:38:31', null);
INSERT INTO `fault` VALUES ('224', '64', '扫描一体机', '京瓷', 'KM-2560', '王海霞', null, '13914031346', 'A701', 'Wed Sep 12 2018 11:20:18 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-12-11 00:40:54', '2018-09-12 03:20:08', null);
INSERT INTO `fault` VALUES ('225', '26', '复印一体机', '京瓷', 'KM-2560', '刘小辰', null, '62932507', 'f506', 'Wed Sep 12 2018 11:26:40 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2017-12-11 02:24:56', '2018-09-12 03:26:32', null);
INSERT INTO `fault` VALUES ('226', '40', '激光打印机', 'HP', 'HP400 M401dn', '沈浥馨', null, '15851480567', 'H402', 'Wed Sep 12 2018 12:42:45 GMT+0800 (CST)', '4', '换办公室后打印机连不上', null, '1', '1', null, '2017-12-11 02:34:28', '2018-09-12 04:42:35', null);
INSERT INTO `fault` VALUES ('227', '31', '复印机', '京瓷', '300i', '', null, '', 'G108', 'Wed Sep 12 2018 12:24:20 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2017-12-11 09:22:52', '2018-09-12 04:24:10', null);
INSERT INTO `fault` VALUES ('228', '13', '桌面激光打印机', 'HP', 'HP2035N', '鲍媛媛', null, '13812672965', 'C103', 'Thu Dec 28 2017 16:37:57 GMT+0800 (CST)', '1', '卡纸', null, '1', '1', null, '2017-12-12 01:18:53', '2017-12-28 08:37:56', null);
INSERT INTO `fault` VALUES ('229', '59', '桌面一体机', 'HP', 'M1522nf', '林涛', null, '13402551123', 'c105', 'Wed Sep 12 2018 12:29:29 GMT+0800 (CST)', '1', '新打印机有问题', null, '1', '1', null, '2017-12-12 23:53:10', '2018-09-12 04:29:19', null);
INSERT INTO `fault` VALUES ('230', '32', '桌面激光打印机', '京瓷', 'FS1110', '', null, '', 'g201', 'Wed Sep 12 2018 12:47:22 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-12-13 06:58:51', '2018-09-12 04:47:13', null);
INSERT INTO `fault` VALUES ('231', '32', '桌面激光打印机', '京瓷', 'FS1110', '', null, '', 'g201', 'Wed Sep 12 2018 12:47:22 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-12-13 06:58:52', '2018-09-12 04:47:13', null);
INSERT INTO `fault` VALUES ('232', '31', '复印机', '京瓷', '300i', '', null, '', '卡纸g109', 'Wed Sep 12 2018 12:24:20 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-12-13 08:27:05', '2018-09-12 04:24:10', null);
INSERT INTO `fault` VALUES ('233', '26', '复印一体机', '京瓷', 'KM-2560', '蒋建锋', null, '13739176386', 'F506', 'Wed Sep 12 2018 11:26:40 GMT+0800 (CST)', '5', '系统异常，断电重启也一样。', null, '1', '1', null, '2017-12-14 00:50:55', '2018-09-12 03:26:32', null);
INSERT INTO `fault` VALUES ('234', '10', '彩色激光打印机', 'HP', 'hp400 color m451dn', '', null, '', 'A602学术研究中心', 'Wed Sep 12 2018 12:32:30 GMT+0800 (CST)', null, '缺黑色墨', '1', '1', '1', null, '2017-12-14 02:48:33', '2018-09-12 04:32:21', null);
INSERT INTO `fault` VALUES ('235', '35', '桌面激光打印机', 'HP', 'HP400 M401dn', '陈丽君', null, '13656238548', 'g107', 'Wed Sep 12 2018 12:42:29 GMT+0800 (CST)', null, '没墨了', '1', '1', '1', null, '2017-12-14 07:02:58', '2018-09-12 04:42:19', null);
INSERT INTO `fault` VALUES ('236', '19', '复印一体机', '施乐', 'S2420', '罗凯', null, '18262008681', 'F405', 'Wed Sep 12 2018 11:25:04 GMT+0800 (CST)', null, '打印机显示缺墨', '1', '1', '1', null, '2017-12-14 07:06:33', '2018-09-12 03:24:55', null);
INSERT INTO `fault` VALUES ('237', '9', '复印机', '京瓷', 'KM-2560', '王琪', null, '13013850511', 'F506文印室', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', '1', '无法打印东西', null, '1', '1', null, '2017-12-18 00:54:27', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('238', '10', '彩色激光打印机', 'HP', 'hp400 color m451dn', '丁淑彦', null, '15850005332', 'A602', 'Wed Sep 12 2018 12:32:30 GMT+0800 (CST)', '4', '', null, '1', '1', null, '2017-12-18 04:32:50', '2018-09-12 04:32:21', null);
INSERT INTO `fault` VALUES ('239', '48', '喷墨彩色打印机', 'HP', '3548 COPYPHOTO', '张耀', null, '62932633', 'h105', 'Wed Sep 12 2018 12:30:53 GMT+0800 (CST)', null, '黑白彩色墨盒各一个', '1', '1', '1', null, '2017-12-18 04:40:20', '2018-09-12 04:30:44', null);
INSERT INTO `fault` VALUES ('240', '9', '复印机', '京瓷', 'KM-2560', '梅钰', null, '62932521', 'F506', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', '4', '脱机', null, '1', '1', null, '2017-12-21 02:00:30', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('241', '9', '复印机', '京瓷', 'KM-2560', '苗园园', null, '18862123296', 'F509', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-12-21 06:41:15', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('242', '40', '激光打印机', 'HP', 'HP400 M401dn', '', null, '', 'H402', 'Wed Sep 12 2018 12:42:45 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2017-12-26 03:44:54', '2018-09-12 04:42:35', null);
INSERT INTO `fault` VALUES ('243', '9', '复印机', '京瓷', 'KM-2560', '', null, '', 'f508', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-12-26 07:21:43', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('244', '43', '复印一体机', '京瓷', 'KM-2560', '', null, '', 'H311', 'Wed Sep 12 2018 11:28:50 GMT+0800 (CST)', '9', '废粉盒已满', null, '1', '1', null, '2017-12-28 01:26:36', '2018-09-12 03:28:41', null);
INSERT INTO `fault` VALUES ('245', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '1102', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-12-29 01:00:29', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('246', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '测试', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-12-29 01:27:04', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('247', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '测试', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-12-29 01:50:42', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('248', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '测试', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2017-12-29 02:01:24', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('249', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '测试', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-01-02 00:52:42', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('250', '80', '复印一体机', '施乐', 'S2420', '周兰兰', null, '17706210202', 'C504', 'Wed Sep 12 2018 11:27:59 GMT+0800 (CST)', '9', '新教师安装打印机，谢谢。', null, '1', '1', null, '2018-01-02 07:57:11', '2018-09-12 03:27:50', null);
INSERT INTO `fault` VALUES ('251', '36', '复印机', '京瓷', 'KM-2560', '苏', null, '2663', 'G109', 'Wed Sep 12 2018 12:23:09 GMT+0800 (CST)', '9', '打印机侧盖打不开，合不住', null, '1', '1', null, '2018-01-08 03:09:45', '2018-09-12 04:22:59', null);
INSERT INTO `fault` VALUES ('252', '9', '复印机', '京瓷', 'KM-2560', '刘小辰', null, '', 'F506', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-01-10 02:30:26', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('253', '80', '复印一体机', '施乐', 'S2420', '王淡菊', null, '', 'C504', 'Wed Sep 12 2018 11:27:59 GMT+0800 (CST)', null, '缺墨粉', '1', '1', '1', null, '2018-01-10 03:50:47', '2018-09-12 03:27:50', null);
INSERT INTO `fault` VALUES ('254', '9', '复印机', '京瓷', 'KM-2560', '刘小辰', null, '', 'f506', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', null, '墨粉用尽', '1', '1', '1', null, '2018-01-10 05:51:40', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('255', '80', '复印一体机', '施乐', 'S2420', '周兰兰', null, '17706210202', 'C504', 'Wed Sep 12 2018 11:27:59 GMT+0800 (CST)', '9', '', null, '1', '1', null, '2018-01-10 07:46:55', '2018-09-12 03:27:50', null);
INSERT INTO `fault` VALUES ('256', '80', '复印一体机', '施乐', 'S2420', '周兰兰', null, '17706210202', 'C504', 'Wed Sep 12 2018 11:27:59 GMT+0800 (CST)', '9', '新电脑安装打印机，谢谢', null, '1', '1', null, '2018-01-10 07:47:16', '2018-09-12 03:27:50', null);
INSERT INTO `fault` VALUES ('257', '9', '复印机', '京瓷', 'KM-2560', '刘小辰', null, '', 'F506', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-01-11 05:41:12', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('258', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '宋翠玲', null, '15856111052', 'A601事务保障中心主', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', null, '缺墨', '1', '1', '1', null, '2018-01-12 08:17:52', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('259', '43', '复印一体机', '京瓷', 'KM-2560', '王维', null, '18036099321', 'H311', 'Wed Sep 12 2018 11:28:50 GMT+0800 (CST)', '1', '有个黑色的横条掉下来了，不能打印', null, '1', '1', null, '2018-01-19 07:00:31', '2018-09-12 03:28:41', null);
INSERT INTO `fault` VALUES ('260', '43', '复印一体机', '京瓷', 'KM-2560', '王维', null, '18036099321', 'H311', 'Wed Sep 12 2018 11:28:50 GMT+0800 (CST)', '9', '打出来都是白纸，应该是墨的横条掉下来或者断了，然后打出来都是白纸', null, '1', '1', null, '2018-01-19 07:02:12', '2018-09-12 03:28:41', null);
INSERT INTO `fault` VALUES ('261', '43', '复印一体机', '京瓷', 'KM-2560', '娄斌斌', null, '15295675997', 'H311', 'Wed Sep 12 2018 11:28:50 GMT+0800 (CST)', '1', '卡纸取不出来。急用', null, '1', '1', null, '2018-01-20 04:55:26', '2018-09-12 03:28:41', null);
INSERT INTO `fault` VALUES ('262', '46', '传真打印一体机', '佳能', 'MF4370DNG', '王玉军', null, '13812666165', 'H106', 'Wed Sep 12 2018 11:30:17 GMT+0800 (CST)', null, '因在做省示范考核材料，请现在更换，感谢支持！', '1', '1', '1', null, '2018-01-21 07:31:41', '2018-09-12 03:30:08', null);
INSERT INTO `fault` VALUES ('263', '55', '激光打印机', '三星', 'prom3325ND', '', null, '', '卜', 'Wed Sep 12 2018 12:38:40 GMT+0800 (CST)', '1', '测试', null, '1', '1', null, '2018-01-22 13:13:35', '2018-09-12 04:38:31', null);
INSERT INTO `fault` VALUES ('264', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '測試', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '卜', null, '1', '1', null, '2018-01-25 07:40:46', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('265', '2', '针式打印机', 'EPSON', 'LQ630K', '165132131', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '卜測試0', 'Wed Sep 12 2018 11:30:56 GMT+0800 (CST)', '10', '', '0', '1', '1', '', '2018-01-25 07:42:18', '2018-09-12 03:30:46', '0000-00-00 00:00:00');
INSERT INTO `fault` VALUES ('266', '43', '复印一体机', '京瓷', 'KM-2560', '王维', null, '18036099321', 'H311', 'Wed Sep 12 2018 11:28:50 GMT+0800 (CST)', '9', '那个黑色的东西又掉下来了。H311大型打印无法工作。应该是寒假的时候，发生的故障。我今天到学校发现了。', null, '1', '1', null, '2018-02-26 07:32:48', '2018-09-12 03:28:41', null);
INSERT INTO `fault` VALUES ('267', '44', '传真一体机', '联想', 'M7650DNF', '王维', null, '18036099321', 'H311右手边第一间', 'Wed Sep 12 2018 11:28:31 GMT+0800 (CST)', null, '硒鼓错误，一直提醒说要硒鼓的单元蓝色滑块来回滑动几次。我滑动了，可是依然有问题。', '1', '1', '1', null, '2018-02-26 07:35:38', '2018-09-12 03:28:22', null);
INSERT INTO `fault` VALUES ('268', '6', '复印机', '京瓷', 'FS-6525MFP', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '测试', 'Wed Sep 12 2018 11:23:36 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-03-04 00:57:51', '2018-09-12 03:23:27', null);
INSERT INTO `fault` VALUES ('269', '28', '复印一体机', '京瓷', '300i', '办公室', null, '2820', 'g210', 'Wed Sep 12 2018 12:52:08 GMT+0800 (CST)', '1', '打印机侧盖盖不上。且频繁卡纸', null, '1', '1', null, '2018-03-04 05:31:56', '2018-09-12 04:51:58', null);
INSERT INTO `fault` VALUES ('270', '8', '桌面激光打印机', '京瓷', 'ES-6975DN', '', null, '', 'A601', 'Wed Sep 12 2018 12:20:24 GMT+0800 (CST)', '1', '字迹模糊', null, '1', '1', null, '2018-03-04 07:06:01', '2018-09-12 04:20:15', null);
INSERT INTO `fault` VALUES ('271', '64', '扫描一体机', '京瓷', 'KM-2560', '王海霞', null, '13914031346', 'A701', 'Wed Sep 12 2018 11:20:18 GMT+0800 (CST)', '1', '卡纸 但是里面没有纸', null, '1', '1', null, '2018-03-04 08:54:36', '2018-09-12 03:20:08', null);
INSERT INTO `fault` VALUES ('272', '19', '复印一体机', '施乐', 'S2420', '', null, '', 'f405', 'Wed Sep 12 2018 11:25:04 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2018-03-06 02:47:57', '2018-09-12 03:24:55', null);
INSERT INTO `fault` VALUES ('273', '34', '桌面一体传真机', '联想', 'M7650DNF', '沈', null, '2820', 'g107', 'Wed Sep 12 2018 12:20:17 GMT+0800 (CST)', null, '墨', '1', '1', '1', null, '2018-03-09 01:46:55', '2018-09-12 04:20:07', null);
INSERT INTO `fault` VALUES ('274', '36', '复印机', '京瓷', 'KM-2560', '苏文燕', null, '2663', 'G109', 'Wed Sep 12 2018 12:23:09 GMT+0800 (CST)', '6', '', null, '1', '1', null, '2018-03-09 02:24:04', '2018-09-12 04:22:59', null);
INSERT INTO `fault` VALUES ('275', '8', '桌面激光打印机', '京瓷', 'ES-6975DN', '王振国', null, '62932210', 'a601', 'Wed Sep 12 2018 12:20:24 GMT+0800 (CST)', '9', '长时间显示正在添加墨粉', null, '1', '1', null, '2018-03-12 02:26:27', '2018-09-12 04:20:15', null);
INSERT INTO `fault` VALUES ('276', '64', '扫描一体机', '京瓷', 'KM-2560', '', null, '', 'a701', 'Wed Sep 12 2018 11:20:18 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2018-03-13 00:45:47', '2018-09-12 03:20:08', null);
INSERT INTO `fault` VALUES ('277', '23', '复印一体机', '施乐', 'S2420', '', null, '', 'F412', 'Wed Sep 12 2018 11:18:55 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2018-03-15 01:01:51', '2018-09-12 03:18:45', null);
INSERT INTO `fault` VALUES ('278', '23', '复印一体机', '施乐', 'S2420', '', null, '', 'F412', 'Wed Sep 12 2018 11:18:55 GMT+0800 (CST)', '4', '', null, '1', '1', null, '2018-03-15 01:44:06', '2018-09-12 03:18:45', null);
INSERT INTO `fault` VALUES ('279', '29', '桌面彩色一体机', 'HP', 'CM1415fncolorMFP', '李瑞丽', null, '15895584602', 'G210', 'Wed Sep 12 2018 12:21:18 GMT+0800 (CST)', null, '青色、黑色、红色、黄色打印硒鼓各一支。', '2', '1', '1', null, '2018-03-16 00:50:43', '2018-09-12 04:21:09', null);
INSERT INTO `fault` VALUES ('280', '40', '激光打印机', 'HP', 'HP400 M401dn', '高雨', null, '18505127468', 'H402', 'Wed Sep 12 2018 12:42:45 GMT+0800 (CST)', null, '没墨水，打印出来东西是白纸', '1', '1', '1', null, '2018-03-19 00:47:22', '2018-09-12 04:42:35', null);
INSERT INTO `fault` VALUES ('281', '81', '桌面打印机', '京瓷', 'FS-1060DN', '穆牧', null, '18651110126', 'H402', 'Wed Sep 12 2018 12:45:17 GMT+0800 (CST)', null, '打印机显示粉墨不足，打印不了', '1', '1', '1', null, '2018-03-20 01:19:32', '2018-09-12 04:45:07', null);
INSERT INTO `fault` VALUES ('282', '81', '桌面打印机', '京瓷', 'FS-1060DN', '', 'ohCh0wFiOYdggX62ldXnw-mr3Ajc', '', '测试', 'Wed Sep 12 2018 12:45:17 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-03-20 07:40:51', '2018-09-12 04:45:07', null);
INSERT INTO `fault` VALUES ('283', '28', '复印一体机', '京瓷', '300i', '', null, '', 'g210', 'Wed Sep 12 2018 12:52:08 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-03-22 05:52:51', '2018-09-12 04:51:58', null);
INSERT INTO `fault` VALUES ('284', '46', '传真打印一体机', '佳能', 'MF4370DNG', '张聿', null, '62932908', 'H106办公室', 'Wed Sep 12 2018 11:30:17 GMT+0800 (CST)', null, '没有墨了，整个一层都在用，耗得很快，申请两盒墨', '1', '1', '1', null, '2018-03-27 04:37:29', '2018-09-12 03:30:08', null);
INSERT INTO `fault` VALUES ('285', '46', '传真打印一体机', '佳能', 'MF4370DNG', '吕雪', null, '18662292505', '106', 'Wed Sep 12 2018 11:30:17 GMT+0800 (CST)', '4', '脱机', null, '1', '1', null, '2018-03-29 01:01:34', '2018-09-12 03:30:08', null);
INSERT INTO `fault` VALUES ('286', '64', '扫描一体机', '京瓷', 'KM-2560', '', null, '', 'a701', 'Wed Sep 12 2018 11:20:18 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-03-29 03:00:11', '2018-09-12 03:20:08', null);
INSERT INTO `fault` VALUES ('287', '55', '激光打印机', '三星', 'prom3325ND', '丁淑彦', null, '15850005332', ' A602', 'Wed Sep 12 2018 12:38:40 GMT+0800 (CST)', '1', '门未关闭', null, '1', '1', null, '2018-03-29 05:04:31', '2018-09-12 04:38:31', null);
INSERT INTO `fault` VALUES ('288', '9', '复印机', '京瓷', 'KM-2560', '刘小辰', null, '62932507', 'F楼506', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2018-03-29 06:11:17', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('289', '4', '彩色激光打印机', '京瓷', 'FS-C5150DN', '廖珊', null, '62932032', 'A601', 'Wed Sep 12 2018 12:30:36 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2018-03-30 02:36:20', '2018-09-12 04:30:27', null);
INSERT INTO `fault` VALUES ('290', '31', '复印机', '京瓷', '300i', '', null, '', 'g109', 'Wed Sep 12 2018 12:24:20 GMT+0800 (CST)', '9', '', null, '1', '1', null, '2018-03-30 02:42:30', '2018-09-12 04:24:10', null);
INSERT INTO `fault` VALUES ('291', '31', '复印机', '京瓷', '300i', '郑长虹', null, '15995818946', 'G108', 'Wed Sep 12 2018 12:24:20 GMT+0800 (CST)', '9', '盖板合不上', null, '1', '1', null, '2018-03-30 03:12:42', '2018-09-12 04:24:10', null);
INSERT INTO `fault` VALUES ('292', '48', '喷墨彩色打印机', 'HP', '3548 COPYPHOTO', '朱晓莉', null, '18651110130', 'H105', 'Wed Sep 12 2018 12:30:53 GMT+0800 (CST)', null, '缺墨', '1', '1', '1', null, '2018-04-01 03:22:06', '2018-09-12 04:30:44', null);
INSERT INTO `fault` VALUES ('293', '35', '桌面激光打印机', 'HP', 'HP400 M401dn', '陈丽君', null, '13656238548', 'G107', 'Wed Sep 12 2018 12:42:29 GMT+0800 (CST)', '4', '打印不了', null, '1', '1', null, '2018-04-03 02:03:17', '2018-09-12 04:42:19', null);
INSERT INTO `fault` VALUES ('294', '80', '复印一体机', '施乐', 'S2420', '王淡菊', null, '62932062', 'c504', 'Wed Sep 12 2018 11:27:59 GMT+0800 (CST)', null, '缺墨粉', '1', '1', '1', null, '2018-04-04 02:09:49', '2018-09-12 03:27:50', null);
INSERT INTO `fault` VALUES ('295', '80', '复印一体机', '施乐', 'S2420', '王淡菊', null, '62932062', 'c504', 'Wed Sep 12 2018 11:27:59 GMT+0800 (CST)', '7', '扫描出来的电子版边上有一蓝色条，部分原黑色字体变红', null, '1', '1', null, '2018-04-04 02:11:42', '2018-09-12 03:27:50', null);
INSERT INTO `fault` VALUES ('296', '42', '桌面打印机', '京瓷', 'FS-1060DN', '周洋', null, '18036392112', 'h201', 'Wed Sep 12 2018 12:44:22 GMT+0800 (CST)', '2', '字迹不清楚', null, '1', '1', null, '2018-04-09 05:08:04', '2018-09-12 04:44:12', null);
INSERT INTO `fault` VALUES ('297', '44', '传真一体机', '联想', 'M7650DNF', '王维', null, '18036099321', ' H311右手边第一间', 'Wed Sep 12 2018 11:28:31 GMT+0800 (CST)', null, '墨粉用尽，打印出来的纸颜色变淡', '1', '1', '1', null, '2018-04-10 05:45:02', '2018-09-12 03:28:22', null);
INSERT INTO `fault` VALUES ('298', '84', '激光打印机', 'HP', 'HP400 M401dn', '阿利亚', null, '15051560444', 'D101', 'Wed Sep 12 2018 12:35:40 GMT+0800 (CST)', null, '墨盒需要更换', '1', '1', '1', null, '2018-04-19 07:29:05', '2018-09-12 04:35:30', null);
INSERT INTO `fault` VALUES ('299', '55', '激光打印机', '三星', 'prom3325ND', '', null, '', 'a', 'Wed Sep 12 2018 12:38:40 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-04-19 07:29:53', '2018-09-12 04:38:31', null);
INSERT INTO `fault` VALUES ('300', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '，', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-04-19 07:31:32', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('301', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wFiOYdggX62ldXnw-mr3Ajc', '', '？', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-04-20 09:21:37', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('302', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wFiOYdggX62ldXnw-mr3Ajc', '', '？', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-04-20 09:23:18', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('303', '31', '复印机', '京瓷', '300i', '', null, '', 'G108', 'Wed Sep 12 2018 12:24:20 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2018-04-23 00:27:36', '2018-09-12 04:24:10', null);
INSERT INTO `fault` VALUES ('304', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '戴平', null, '15862469309', 'A406', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2018-04-23 01:47:50', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('305', '8', '桌面激光打印机', '京瓷', 'ES-6975DN', '顾华', null, '62932202', 'A601', 'Wed Sep 12 2018 12:20:24 GMT+0800 (CST)', '1', '一开始卡纸，后来弄好了，再然后说是要维修了', null, '1', '1', null, '2018-04-24 02:39:47', '2018-09-12 04:20:15', null);
INSERT INTO `fault` VALUES ('306', '68', '桌面一体机', '三星', 'SCX4521HS', '陈强', null, '13862009596', 'g309', 'Wed Sep 12 2018 11:21:02 GMT+0800 (CST)', '2', '打印之后出来只是变皱，并且无打印内容。', null, '1', '1', null, '2018-04-24 06:36:58', '2018-09-12 03:20:53', null);
INSERT INTO `fault` VALUES ('307', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wFiOYdggX62ldXnw-mr3Ajc', '', '测试', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-05-02 01:02:55', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('308', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '，', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-05-07 00:43:48', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('309', '9', '复印机', '京瓷', 'KM-2560', '刘小辰', null, '62932507', 'f506', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', null, '墨盒需要更换', '1', '1', '1', null, '2018-05-08 06:28:47', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('310', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '戴平', null, '15862469309', 'A406', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2018-05-10 02:13:26', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('311', '68', '桌面一体机', '三星', 'SCX4521HS', '杨奕', null, '', 'G309', 'Wed Sep 12 2018 11:21:02 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2018-05-11 00:45:49', '2018-09-12 03:20:53', null);
INSERT INTO `fault` VALUES ('312', '9', '复印机', '京瓷', 'KM-2560', '刘小辰', null, '62932507', 'f506', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', '1', '卡纸', null, '1', '1', null, '2018-05-14 06:05:07', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('313', '46', '传真打印一体机', '佳能', 'MF4370DNG', '', null, '', 'H106', 'Wed Sep 12 2018 11:30:17 GMT+0800 (CST)', '1', '卡纸取不出', null, '1', '1', null, '2018-05-15 02:22:37', '2018-09-12 03:30:08', null);
INSERT INTO `fault` VALUES ('314', '31', '复印机', '京瓷', '300i', '', null, '', 'g109', 'Wed Sep 12 2018 12:24:20 GMT+0800 (CST)', null, '', '2', '1', '1', null, '2018-05-15 08:19:46', '2018-09-12 04:24:10', null);
INSERT INTO `fault` VALUES ('315', '19', '复印一体机', '施乐', 'S2420', '吴凡', null, '18020255082', 'F405', 'Wed Sep 12 2018 11:25:04 GMT+0800 (CST)', '4', '电脑上请求打印，打印机显示脱机，在打印机上找不到申请打印的作业项目', null, '1', '1', null, '2018-05-16 01:43:30', '2018-09-12 03:24:55', null);
INSERT INTO `fault` VALUES ('316', '28', '复印一体机', '京瓷', '300i', '何洪亮', null, '2840', 'g210', 'Wed Sep 12 2018 12:52:08 GMT+0800 (CST)', '1', '频繁卡纸，每一张都卡', null, '1', '1', null, '2018-05-16 03:57:03', '2018-09-12 04:51:58', null);
INSERT INTO `fault` VALUES ('317', '8', '桌面激光打印机', '京瓷', 'ES-6975DN', '章琦', null, '13913599086', 'A601', 'Wed Sep 12 2018 12:20:24 GMT+0800 (CST)', '2', '', null, '1', '1', null, '2018-05-17 01:49:34', '2018-09-12 04:20:15', null);
INSERT INTO `fault` VALUES ('318', '48', '喷墨彩色打印机', 'HP', '3548 COPYPHOTO', '朱晓莉', null, '18651110130', 'H105', 'Wed Sep 12 2018 12:30:53 GMT+0800 (CST)', '1', '卡纸', null, '1', '1', null, '2018-05-21 00:26:59', '2018-09-12 04:30:44', null);
INSERT INTO `fault` VALUES ('319', '8', '桌面激光打印机', '京瓷', 'ES-6975DN', '章琦', null, '13913599086', 'A601', 'Wed Sep 12 2018 12:20:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-05-21 00:47:26', '2018-09-12 04:20:15', null);
INSERT INTO `fault` VALUES ('320', '31', '复印机', '京瓷', '300i', '武红阵', null, '15006214399', 'G108', 'Wed Sep 12 2018 12:24:20 GMT+0800 (CST)', '1', '卡纸严重', null, '1', '1', null, '2018-05-21 05:53:22', '2018-09-12 04:24:10', null);
INSERT INTO `fault` VALUES ('321', '46', '传真打印一体机', '佳能', 'MF4370DNG', '任菲', null, '18994374756', 'H106', 'Wed Sep 12 2018 11:30:17 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-05-22 06:39:55', '2018-09-12 03:30:08', null);
INSERT INTO `fault` VALUES ('322', '19', '复印一体机', '施乐', 'S2420', '吴凡', null, '18020255082', 'F405', 'Wed Sep 12 2018 11:25:04 GMT+0800 (CST)', '5', '打印机一直有空转的响声，无法正常打印', null, '1', '1', null, '2018-05-24 00:03:59', '2018-09-12 03:24:55', null);
INSERT INTO `fault` VALUES ('323', '66', '桌面打印机', 'HP', 'HP400 M401dn', '蔡炳育', null, '18261803468', '701', 'Wed Sep 12 2018 12:43:47 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2018-05-24 01:14:32', '2018-09-12 04:43:38', null);
INSERT INTO `fault` VALUES ('324', '19', '复印一体机', '施乐', 'S2420', '侯华斌', null, '18306214722', 'F405', 'Wed Sep 12 2018 11:25:04 GMT+0800 (CST)', '4', '开机异响，复印无反应', null, '1', '1', null, '2018-05-25 00:52:05', '2018-09-12 03:24:55', null);
INSERT INTO `fault` VALUES ('325', '10', '彩色激光打印机', 'HP', 'hp400 color m451dn', '', null, '', 'A602 学术研究中心', 'Wed Sep 12 2018 12:32:30 GMT+0800 (CST)', null, '缺蓝墨、粉墨、黄墨盒', '1', '1', '1', null, '2018-05-25 01:54:13', '2018-09-12 04:32:21', null);
INSERT INTO `fault` VALUES ('326', '66', '桌面打印机', 'HP', 'HP400 M401dn', '蔡炳育', null, '18261803468', '701', 'Wed Sep 12 2018 12:43:47 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2018-05-28 06:29:07', '2018-09-12 04:43:38', null);
INSERT INTO `fault` VALUES ('327', '60', '桌面一体机', 'HP', 'CM1415fncolorMFP', '章士凤', null, '13814898146', '医务室', 'Wed Sep 12 2018 12:29:46 GMT+0800 (CST)', null, '黑色', '1', '1', '1', null, '2018-05-29 07:41:47', '2018-09-12 04:29:37', null);
INSERT INTO `fault` VALUES ('328', '19', '复印一体机', '施乐', 'S2420', '覃鸿妮', null, '15151527926', 'F405', 'Wed Sep 12 2018 11:25:04 GMT+0800 (CST)', '1', '不停卡纸', null, '1', '1', null, '2018-05-30 01:23:03', '2018-09-12 03:24:55', null);
INSERT INTO `fault` VALUES ('329', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', null, '', 'A406', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2018-05-30 07:58:04', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('330', '9', '复印机', '京瓷', 'KM-2560', '谷彩港', null, '15599016003', '外包学院F楼506室', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', '4', '打印没反应', null, '1', '1', null, '2018-05-30 08:25:41', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('331', '34', '桌面一体传真机', '联想', 'M7650DNF', 'g107', null, '2820', 'g107', 'Wed Sep 12 2018 12:20:17 GMT+0800 (CST)', null, '墨粉最低', '1', '1', '1', null, '2018-05-31 03:21:38', '2018-09-12 04:20:07', null);
INSERT INTO `fault` VALUES ('332', '8', '桌面激光打印机', '京瓷', 'ES-6975DN', '章琦', null, '13913599086', 'A601', 'Wed Sep 12 2018 12:20:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-06-01 02:44:56', '2018-09-12 04:20:15', null);
INSERT INTO `fault` VALUES ('333', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '11', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-06-04 00:41:52', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('334', '93', '打印机', '京瓷', 'p2135dn', '', null, '', '1号', 'Wed Sep 12 2018 12:45:26 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-06-04 02:21:09', '2018-09-12 04:45:17', null);
INSERT INTO `fault` VALUES ('335', '40', '激光打印机', 'HP', 'HP400 M401dn', '高雨', null, '18505127468', 'H402', 'Wed Sep 12 2018 12:42:45 GMT+0800 (CST)', '1', '网络连接不畅，无法打印', null, '1', '1', null, '2018-06-04 07:24:37', '2018-09-12 04:42:35', null);
INSERT INTO `fault` VALUES ('336', '64', '扫描一体机', '京瓷', 'KM-2560', '李铨', null, '18626283400', 'A701', 'Wed Sep 12 2018 11:20:18 GMT+0800 (CST)', '1', '卡纸', null, '1', '1', null, '2018-06-05 06:07:22', '2018-09-12 03:20:08', null);
INSERT INTO `fault` VALUES ('337', '64', '扫描一体机', '京瓷', 'KM-2560', '李铨', null, '18626283400', 'A701 ', 'Wed Sep 12 2018 11:20:18 GMT+0800 (CST)', '1', '卡纸', null, '1', '1', null, '2018-06-05 06:36:45', '2018-09-12 03:20:08', null);
INSERT INTO `fault` VALUES ('338', '64', '扫描一体机', '京瓷', 'KM-2560', '李铨', null, '18626283400', 'A701 ', 'Wed Sep 12 2018 11:20:18 GMT+0800 (CST)', '1', '卡纸', null, '1', '1', null, '2018-06-05 06:36:47', '2018-09-12 03:20:08', null);
INSERT INTO `fault` VALUES ('339', '64', '扫描一体机', '京瓷', 'KM-2560', '李铨', null, '18626283400', 'A701 ', 'Wed Sep 12 2018 11:20:18 GMT+0800 (CST)', '1', '卡纸', null, '1', '1', null, '2018-06-05 06:36:48', '2018-09-12 03:20:08', null);
INSERT INTO `fault` VALUES ('340', '64', '扫描一体机', '京瓷', 'KM-2560', '李铨', null, '18626283400', 'A701', 'Wed Sep 12 2018 11:20:18 GMT+0800 (CST)', '1', '卡纸', null, '1', '1', null, '2018-06-05 06:37:23', '2018-09-12 03:20:08', null);
INSERT INTO `fault` VALUES ('341', '64', '扫描一体机', '京瓷', 'KM-2560', '李铨', null, '18626283400', 'A701', 'Wed Sep 12 2018 11:20:18 GMT+0800 (CST)', '1', '卡纸', null, '1', '1', null, '2018-06-05 07:54:48', '2018-09-12 03:20:08', null);
INSERT INTO `fault` VALUES ('342', '96', '一体机', '京瓷', 'M4028idn', '曹欢', null, '', 'a702', 'Wed Sep 12 2018 12:32:47 GMT+0800 (CST)', '4', '', null, '1', '1', null, '2018-06-06 01:20:01', '2018-09-12 04:32:38', null);
INSERT INTO `fault` VALUES ('343', '96', '一体机', '京瓷', 'M4028idn', '梅倩', null, '13814985669', 'A702', 'Wed Sep 12 2018 12:32:47 GMT+0800 (CST)', '1', '需要重新安装打印机，因为电脑重装了系统', null, '1', '1', null, '2018-06-07 00:49:13', '2018-09-12 04:32:38', null);
INSERT INTO `fault` VALUES ('344', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wFiOYdggX62ldXnw-mr3Ajc', '', '测试', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-06-11 00:31:49', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('345', '31', '复印机', '京瓷', '300i', '杜老师', null, '13625289900', 'g109', 'Wed Sep 12 2018 12:24:20 GMT+0800 (CST)', '1', '显示拉纸，但没看到纸。', null, '1', '1', null, '2018-06-11 01:06:52', '2018-09-12 04:24:10', null);
INSERT INTO `fault` VALUES ('346', '31', '复印机', '京瓷', '300i', '', null, '', 'G109', 'Wed Sep 12 2018 12:24:20 GMT+0800 (CST)', '4', '', null, '1', '1', null, '2018-06-13 01:19:37', '2018-09-12 04:24:10', null);
INSERT INTO `fault` VALUES ('347', '40', '激光打印机', 'HP', 'HP400 M401dn', '高雨', null, '18505127468', 'H402', 'Wed Sep 12 2018 12:42:45 GMT+0800 (CST)', '1', '打印不了图片', null, '1', '1', null, '2018-06-14 01:04:38', '2018-09-12 04:42:35', null);
INSERT INTO `fault` VALUES ('348', '96', '一体机', '京瓷', 'M4028idn', '曹韦璇', null, '62932292', 'A702', 'Wed Sep 12 2018 12:32:47 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-06-15 02:32:27', '2018-09-12 04:32:38', null);
INSERT INTO `fault` VALUES ('349', '46', '传真打印一体机', '佳能', 'MF4370DNG', '任菲', null, '18994374756', 'H106', 'Wed Sep 12 2018 11:30:17 GMT+0800 (CST)', null, '缺墨', '1', '1', '1', null, '2018-06-15 03:32:48', '2018-09-12 03:30:08', null);
INSERT INTO `fault` VALUES ('350', '31', '复印机', '京瓷', '300i', '', null, '', 'H109', 'Wed Sep 12 2018 12:24:20 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-06-20 01:57:39', '2018-09-12 04:24:10', null);
INSERT INTO `fault` VALUES ('351', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '1111', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-06-21 06:16:40', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('352', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', null, '', 'A406', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', null, '', '1', '1', '1', null, '2018-06-22 09:06:52', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('353', '96', '一体机', '京瓷', 'M4028idn', '', null, '', 'A702', 'Wed Sep 12 2018 12:32:47 GMT+0800 (CST)', '4', '', null, '1', '1', null, '2018-06-25 03:11:45', '2018-09-12 04:32:38', null);
INSERT INTO `fault` VALUES ('354', '9', '复印机', '京瓷', 'KM-2560', '刘晓旭', null, '18862110336', 'F506', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', '1', '打印机坏了 无法打印', null, '1', '1', null, '2018-06-25 05:47:45', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('355', '61', '针式打印机', '中盈', 'NX-680', '', null, '', 'A702', 'Wed Sep 12 2018 12:36:56 GMT+0800 (CST)', '2', '', null, '1', '1', null, '2018-06-26 01:56:03', '2018-09-12 04:36:47', null);
INSERT INTO `fault` VALUES ('356', '48', '喷墨彩色打印机', 'HP', '3548 COPYPHOTO', '朱晓莉', null, '18651110130', 'H105', 'Wed Sep 12 2018 12:30:53 GMT+0800 (CST)', null, '打印机缺墨', '1', '1', '1', null, '2018-06-30 07:45:23', '2018-09-12 04:30:44', null);
INSERT INTO `fault` VALUES ('357', '35', '桌面激光打印机', 'HP', 'HP400 M401dn', '陈丽君', null, '13656238548', 'G107', 'Wed Sep 12 2018 12:42:29 GMT+0800 (CST)', null, '没墨啦', '1', '1', '1', null, '2018-07-03 05:48:55', '2018-09-12 04:42:19', null);
INSERT INTO `fault` VALUES ('358', '3', '传真一体机', '京瓷', 'ECOYS M2530dn', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', 'qq q', 'Wed Sep 12 2018 12:39:22 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-07-09 03:46:29', '2018-09-12 04:39:13', null);
INSERT INTO `fault` VALUES ('359', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '1', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-07-10 01:57:18', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('360', '31', '复印机', '京瓷', '300i', '杜茜', null, '13625289900', '109', 'Wed Sep 12 2018 12:24:20 GMT+0800 (CST)', '4', '打印突然没有反应', null, '1', '1', null, '2018-07-11 03:14:40', '2018-09-12 04:24:10', null);
INSERT INTO `fault` VALUES ('361', '31', '复印机', '京瓷', '300i', '杜茜', null, '62932833', '109', 'Wed Sep 12 2018 12:24:20 GMT+0800 (CST)', '4', '内存灯一直闪，打印没反应', null, '1', '1', null, '2018-07-11 04:47:57', '2018-09-12 04:24:10', null);
INSERT INTO `fault` VALUES ('362', '98', '一体机', '京瓷', 'M4028idn', '朱晓莉', null, '18651110130', '602', 'Wed Sep 12 2018 12:33:13 GMT+0800 (CST)', '2', '墨痕严重', null, '1', '1', null, '2018-07-12 06:43:28', '2018-09-12 04:33:04', null);
INSERT INTO `fault` VALUES ('363', '98', '一体机', '京瓷', 'M4028idn', '丁', null, '', 'A602', 'Wed Sep 12 2018 12:33:13 GMT+0800 (CST)', '1', '脱机无法打印', null, '1', '1', null, '2018-07-16 01:40:52', '2018-09-12 04:33:04', null);
INSERT INTO `fault` VALUES ('364', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wFiOYdggX62ldXnw-mr3Ajc', '', '测试', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-07-24 00:44:20', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('365', '56', '复印一体机', '京瓷', '300i', '', null, '', '测试', 'Wed Sep 12 2018 12:53:07 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-07-26 00:45:19', '2018-09-12 04:52:57', null);
INSERT INTO `fault` VALUES ('366', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', null, '', '测试', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-07-26 08:35:43', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('367', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '111111', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-08-03 00:51:13', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('368', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wGUQ_CujF2fiMQRmNGT0Owg', '', '……', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-08-08 01:55:13', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('369', '96', '一体机', '京瓷', 'M4028idn', '曹韦璇', null, '17715588523', 'A702', 'Wed Sep 12 2018 12:32:47 GMT+0800 (CST)', null, '申请针式打印机', null, '1', '1', null, '2018-08-21 02:32:39', '2018-09-12 04:32:38', null);
INSERT INTO `fault` VALUES ('370', '44', '传真一体机', '联想', 'M7650DNF', '王维', null, '18036099321', 'H311右边第一间教务', 'Wed Sep 12 2018 11:28:31 GMT+0800 (CST)', null, '没有墨粉了，需要更换墨粉盒', '1', '1', '1', null, '2018-08-27 01:21:13', '2018-09-12 03:28:22', null);
INSERT INTO `fault` VALUES ('371', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '测试', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-08-28 01:37:06', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('372', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wFiOYdggX62ldXnw-mr3Ajc', '', '测试', 'Wed Sep 12 2018 11:17:24 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-09-01 01:26:41', '2018-09-12 03:17:15', null);
INSERT INTO `fault` VALUES ('373', '40', '激光打印机', 'HP', 'HP400 M401dn', '徐飞扬', null, '18206217867', '衡山楼402办公室', 'Wed Sep 12 2018 12:42:45 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-09-01 01:58:24', '2018-09-12 04:42:35', null);
INSERT INTO `fault` VALUES ('374', '80', '复印一体机', '施乐', 'S2420', '王淡菊', null, '62932062', 'C504', 'Wed Sep 12 2018 11:27:59 GMT+0800 (CST)', null, '打印机缺墨粉', '1', '1', '1', null, '2018-09-01 02:31:38', '2018-09-12 03:27:50', null);
INSERT INTO `fault` VALUES ('375', '42', '桌面打印机', '京瓷', 'FS-1060DN', '周洋', null, '18036392112', 'H201', 'Wed Sep 12 2018 12:44:22 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-09-01 02:39:26', '2018-09-12 04:44:12', null);
INSERT INTO `fault` VALUES ('376', '31', '复印机', '京瓷', '300i', 'g108一楼办公室', null, '2843', 'g108一楼办公室', 'Wed Sep 12 2018 12:24:20 GMT+0800 (CST)', '1', '卡纸，频繁卡纸，看不到纸在哪里还提醒卡纸', null, '1', '1', null, '2018-09-01 08:38:42', '2018-09-12 04:24:10', null);
INSERT INTO `fault` VALUES ('377', '9', '复印机', '京瓷', 'KM-2560', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '602', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-09-02 06:46:57', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('378', '23', '复印一体机', '施乐', 'S2420', '孙琳', null, '15850088035', 'F412', 'Wed Sep 12 2018 11:18:55 GMT+0800 (CST)', null, '缺墨', '1', '1', '1', null, '2018-09-02 08:19:11', '2018-09-12 03:18:45', null);
INSERT INTO `fault` VALUES ('379', '2', '针式打印机', 'EPSON', 'LQ630K', '吴立梦', null, '62932131', 'A406', 'Wed Sep 12 2018 11:30:56 GMT+0800 (CST)', '9', '按装打印机 测试打印', null, '1', '1', null, '2018-09-03 00:54:07', '2018-09-12 03:30:46', null);
INSERT INTO `fault` VALUES ('380', '42', '桌面打印机', '京瓷', 'FS-1060DN', '秦瑶', null, '13814896510', 'H201', 'Wed Sep 12 2018 12:44:22 GMT+0800 (CST)', '4', '打印机没反应', null, '1', '1', null, '2018-09-03 02:26:38', '2018-09-12 04:44:12', null);
INSERT INTO `fault` VALUES ('381', '2', '针式打印机', 'EPSON', 'LQ630K', '吴立梦', null, '13584885789', 'A406', 'Wed Sep 12 2018 11:30:56 GMT+0800 (CST)', '4', '', null, '1', '1', null, '2018-09-03 03:39:44', '2018-09-12 03:30:46', null);
INSERT INTO `fault` VALUES ('382', '41', '复印一体机', '京瓷', 'KM-2560', '徐芃', null, '18168728628', '苏州工业园区服务外包学', 'Wed Sep 12 2018 13:27:01 GMT+0800 (CST)', '6', '', null, '1', '1', null, '2018-09-04 04:35:52', '2018-09-12 05:26:51', null);
INSERT INTO `fault` VALUES ('383', '22', '复印一体机', '施乐', 'S2420', '陆伟峰', null, '15051598960', 'G309', 'Wed Sep 12 2018 11:25:45 GMT+0800 (CST)', '9', '无法打印', null, '1', '1', null, '2018-09-04 07:18:21', '2018-09-12 03:25:36', null);
INSERT INTO `fault` VALUES ('384', '82', '桌面打印机', '京瓷', 'FS1110', '郁春江', null, '13812774075', 'f408', 'Wed Sep 12 2018 12:48:14 GMT+0800 (CST)', null, '需要更换墨盒', '1', '1', '1', null, '2018-09-04 08:48:19', '2018-09-12 04:48:05', null);
INSERT INTO `fault` VALUES ('385', '28', '复印一体机', '京瓷', '300i', '黎纪东', null, '13584822598', 'G210', 'Wed Sep 12 2018 12:52:08 GMT+0800 (CST)', '4', '电脑发出的打印指令没反应', null, '1', '1', null, '2018-09-05 00:59:13', '2018-09-12 04:51:58', null);
INSERT INTO `fault` VALUES ('386', '28', '复印一体机', '京瓷', '300i', '黎纪东', null, '13584822598', 'G210', 'Wed Sep 12 2018 12:52:08 GMT+0800 (CST)', '4', '抱歉，打印还是有问题，显示错误或者脱机', null, '1', '1', null, '2018-09-06 01:01:08', '2018-09-12 04:51:58', null);
INSERT INTO `fault` VALUES ('387', '96', '一体机', '京瓷', 'M4028idn', '曹韦璇', null, '62932292', 'A702', 'Wed Sep 12 2018 12:32:47 GMT+0800 (CST)', null, '针式打印机', null, '1', '1', null, '2018-09-06 02:32:42', '2018-09-12 04:32:38', null);
INSERT INTO `fault` VALUES ('388', '22', '复印一体机', '施乐', 'S2420', '谢婷', null, '15895580093', 'G309', 'Wed Sep 12 2018 11:25:45 GMT+0800 (CST)', '1', '双面组件卡纸', null, '1', '1', null, '2018-09-06 08:12:07', '2018-09-12 03:25:36', null);
INSERT INTO `fault` VALUES ('389', '23', '复印一体机', '施乐', 'S2420', '孙琳', null, '15850088035', 'F412', 'Wed Sep 12 2018 11:18:55 GMT+0800 (CST)', '4', '没反应', null, '1', '1', null, '2018-09-08 10:25:58', '2018-09-12 03:18:45', null);
INSERT INTO `fault` VALUES ('390', '23', '复印一体机', '施乐', 'S2420', '孙琳', null, '15850088035', 'F412', 'Wed Sep 12 2018 11:18:55 GMT+0800 (CST)', null, '没墨', '1', '1', '1', null, '2018-09-08 10:26:30', '2018-09-12 03:18:45', null);
INSERT INTO `fault` VALUES ('391', '28', '复印一体机', '京瓷', '300i', '朱辉', null, '13814821024', 'g210', 'Wed Sep 12 2018 12:52:08 GMT+0800 (CST)', '4', '我的电脑无法连上打印机，总是显示脱机。我周二下午没有课，可以明天下午来帮我看看吗？谢谢', null, '1', '1', null, '2018-09-10 08:01:33', '2018-09-12 04:51:58', null);
INSERT INTO `fault` VALUES ('392', '28', '复印一体机', '京瓷', '300i', '朱辉', null, '13814821024', '服务外包学院g210', 'Wed Sep 12 2018 12:52:08 GMT+0800 (CST)', '4', '电脑上点击打印，显示脱机', null, '1', '1', null, '2018-09-10 08:56:17', '2018-09-12 04:51:58', null);
INSERT INTO `fault` VALUES ('393', '57', '复印机', '京瓷', 'FS-6525MFP', '孙晃', null, '18362688880', 'A103', 'Wed Sep 12 2018 12:29:02 GMT+0800 (CST)', '4', '', null, '1', '1', null, '2018-09-11 02:49:23', '2018-09-12 04:28:53', null);
INSERT INTO `fault` VALUES ('394', '0', '', '', '', '', null, '', 'h211', '2018-09-11 14:45:37', '2', '', null, null, '5', null, '2018-09-11 06:45:37', '2018-09-11 06:45:37', null);
INSERT INTO `fault` VALUES ('395', '28', '复印一体机', '京瓷', '300i', '贺丽花', null, '62932825', 'G210', 'Wed Sep 12 2018 12:52:08 GMT+0800 (CST)', '4', '', null, '1', '1', null, '2018-09-12 03:04:10', '2018-09-12 04:51:58', null);
INSERT INTO `fault` VALUES ('396', '47', '彩色打印机', '佳能', 'LBP5960', '', null, '', 'H311', '2018-09-12 12:33:20', '6', '打印出错', null, null, '5', null, '2018-09-12 04:33:20', '2018-09-12 04:33:20', null);
INSERT INTO `fault` VALUES ('397', '41', '复印一体机', '京瓷', 'KM-2560', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '，', 'Wed Sep 12 2018 13:27:01 GMT+0800 (CST)', '1', '', null, '1', '1', null, '2018-09-12 04:50:53', '2018-09-12 05:26:51', null);
INSERT INTO `fault` VALUES ('398', '9', '复印机', '京瓷', 'KM-2560', '刘小辰', null, '62932507', 'F506', 'Thu Sep 13 2018 15:24:13 GMT+0800 (CST)', null, '墨粉不足', '1', '1', '1', null, '2018-09-13 07:06:00', '2018-09-13 07:24:13', null);
INSERT INTO `fault` VALUES ('399', '40', '激光打印机', 'HP', 'HP400 M401dn', '徐飞扬', null, '18206217867', 'H402', null, null, '', '1', null, '5', null, '2018-09-17 00:57:58', '2018-09-17 00:57:58', null);
INSERT INTO `fault` VALUES ('400', '22', '复印一体机', '施乐', 'S2420', '谢婷', null, '15895580093', 'G309', '2018-09-19 12:40:03', '4', '', null, null, '5', null, '2018-09-19 04:40:03', '2018-09-19 04:40:03', null);
INSERT INTO `fault` VALUES ('401', '43', '复印一体机', '京瓷', 'KM-2560', '王维', null, '18036099321', 'H311', '2018-09-20 10:00:16', '1', '卡纸，卡得厉害！又再一次卡纸。A2处卡纸', null, null, '5', null, '2018-09-20 02:00:16', '2018-09-20 02:00:16', null);
INSERT INTO `fault` VALUES ('402', '40', '激光打印机', 'HP', 'HP400 M401dn', '沈浥馨', null, '15851480597', 'H402', null, null, '没墨了', '1', null, '5', null, '2018-09-20 03:55:20', '2018-09-20 03:55:20', null);
INSERT INTO `fault` VALUES ('403', '9', '复印机', '京瓷', 'KM-2560', '刘小辰', null, '62932507', 'F506', '2018-09-20 17:00:44', '9', '复印的地方有一块板掉下来了', null, null, '5', null, '2018-09-20 09:00:44', '2018-09-20 09:00:44', null);
INSERT INTO `fault` VALUES ('404', '35', '桌面激光打印机', 'HP', 'HP400 M401dn', '沈婧', null, '2826', 'G201', '2018-09-21 10:34:01', '9', '打印故障', null, null, '5', null, '2018-09-21 02:34:01', '2018-09-21 02:34:01', null);
INSERT INTO `fault` VALUES ('405', '23', '复印一体机', '施乐', 'S2420', '孙琳', null, '15850088035', 'F412', '2018-09-25 17:04:04', '9', '无法复印', null, null, '5', null, '2018-09-25 09:04:04', '2018-09-25 09:04:04', null);
INSERT INTO `fault` VALUES ('406', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', null, '', 'A406', null, null, '', '1', null, '5', null, '2018-09-27 00:39:41', '2018-09-27 00:39:41', null);
INSERT INTO `fault` VALUES ('407', '96', '一体机', '京瓷', 'M4028idn', '曹韦璇', null, '17715588523', 'A702', '2018-09-27 12:35:49', '1', '', null, null, '5', null, '2018-09-27 04:35:49', '2018-09-27 04:35:49', null);
INSERT INTO `fault` VALUES ('408', '34', '桌面一体传真机', '联想', 'M7650DNF', '沈', null, '62932826', 'g201', '2018-10-08 08:39:24', '4', 'g201新打印机无法安装驱动并进行打印', null, null, '5', null, '2018-10-08 00:39:24', '2018-10-08 00:39:24', null);
INSERT INTO `fault` VALUES ('409', '80', '复印一体机', '施乐', 'S2420', '', null, '13706265757', 'C504', '2018-10-08 09:35:20', '9', '安装打印机', null, null, '5', null, '2018-10-08 01:35:20', '2018-10-08 01:35:20', null);
INSERT INTO `fault` VALUES ('410', '66', '桌面打印机', 'HP', 'HP400 M401dn', '蔡炳育', null, '18261803468', 'A701玻璃房', null, null, '换墨盒', '1', null, '5', null, '2018-10-08 05:27:08', '2018-10-08 05:27:08', null);
INSERT INTO `fault` VALUES ('411', '34', '桌面一体传真机', '联想', 'M7650DNF', '陈丽君', null, '2826', 'G201', '2018-10-09 08:53:30', '1', '网络不通', null, null, '5', null, '2018-10-09 00:53:30', '2018-10-09 00:53:30', null);
INSERT INTO `fault` VALUES ('412', '98', '一体机', '京瓷', 'M4028idn', '丁淑彦', null, '15850005332', 'A602', '2018-10-09 15:56:52', '1', '不能打印    没有驱动', null, null, '5', null, '2018-10-09 07:56:52', '2018-10-09 07:56:52', null);
INSERT INTO `fault` VALUES ('413', '40', '激光打印机', 'HP', 'HP400 M401dn', '徐飞扬', null, '18206217867', 'h402', '2018-10-11 10:42:48', '1', '无墨', null, null, '5', null, '2018-10-11 02:42:48', '2018-10-11 02:42:48', null);
INSERT INTO `fault` VALUES ('414', '35', '桌面激光打印机', 'HP', 'HP400 M401dn', '小沈', null, '2826', 'g201', '2018-10-11 10:59:22', '4', '打印机打不了 之前您来处理过 还是不行啊', null, null, '5', null, '2018-10-11 02:59:22', '2018-10-11 02:59:22', null);
INSERT INTO `fault` VALUES ('415', '34', '桌面一体传真机', '联想', 'M7650DNF', '宋翠玲', null, '15962422506', 'G108玻璃房', '2018-10-11 12:54:41', '9', '无驱动，需要安装', null, null, '5', null, '2018-10-11 04:54:41', '2018-10-11 04:54:41', null);
INSERT INTO `fault` VALUES ('416', '12', '桌面一体机', '京瓷', 'FS-1025MFP', '吴奕晨', null, '62932311', 'A602合作交流中心', null, null, '缺墨', '1', null, '5', null, '2018-10-12 07:44:37', '2018-10-12 07:44:37', null);
INSERT INTO `fault` VALUES ('417', '44', '传真一体机', '联想', 'M7650DNF', '王维', null, '18036099321', 'H311', '2018-10-15 09:15:01', '9', '今天上午突然提示需要手动送纸，然后我放入纸张后，机器并无反应，不能正常打印。', null, null, '5', null, '2018-10-15 01:15:01', '2018-10-15 01:15:01', null);
INSERT INTO `fault` VALUES ('418', '36', '复印机', '京瓷', 'KM-2560', '武红阵', null, '15006214399', 'G109', '2018-10-15 13:44:02', '1', '显示墨粉不足', null, null, '5', null, '2018-10-15 05:44:02', '2018-10-15 05:44:02', null);
INSERT INTO `fault` VALUES ('419', '44', '传真一体机', '联想', 'M7650DNF', '王维', null, '18036099321', 'H311', '2018-10-15 14:14:44', '9', '有出现手动进纸，装入纸张的提示，无法打印。', null, null, '5', null, '2018-10-15 06:14:44', '2018-10-15 06:14:44', null);
INSERT INTO `fault` VALUES ('420', '35', '桌面激光打印机', 'HP', 'HP400 M401dn', '陈丽君', null, '13656238548', 'G201', '2018-10-22 09:38:06', '1', '复印不了', null, null, '5', null, '2018-10-22 01:38:06', '2018-10-22 01:38:06', null);
INSERT INTO `fault` VALUES ('421', '31', '复印机', '京瓷', '300i', '', null, '2843', 'G109', null, null, '新打印机没有墨粉了，但是机子上没贴二维码，扫的旧打印机上的码', '1', null, '5', null, '2018-10-22 02:47:44', '2018-10-22 02:47:44', null);
INSERT INTO `fault` VALUES ('422', '101', '黑白一体机', '京瓷', 'Ecosys M4132idn', '陈寅磊', null, '62932817', 'G210', null, null, '缺墨盒', '1', null, '5', null, '2018-10-24 05:17:55', '2018-10-24 05:17:55', null);
INSERT INTO `fault` VALUES ('423', '100', '黑白一体机', '京瓷', 'Ecosys M4132idn', '沈', null, '2826', 'g201', '2018-10-24 16:22:59', '1', '扫描文件二维码照片卡在扫描口里了！\n！！！', null, null, '5', null, '2018-10-24 08:22:59', '2018-10-24 08:22:59', null);
INSERT INTO `fault` VALUES ('424', '9', '复印机', '京瓷', 'KM-2560', '', null, '', 'F506', '2018-10-25 15:45:27', '1', '反复卡纸，左侧盖不紧', null, null, '5', null, '2018-10-25 07:45:27', '2018-10-25 07:45:27', null);
INSERT INTO `fault` VALUES ('425', '28', '复印一体机', '京瓷', '300i', '倪卓琳', null, '13814873006', '902', '2018-10-26 13:50:44', '1', '双面卡纸', null, null, '5', null, '2018-10-26 05:50:44', '2018-10-26 05:50:44', null);
INSERT INTO `fault` VALUES ('426', '96', '一体机', '京瓷', 'M4028idn', '柳润泽', null, '18013764289', 'A702', '2018-10-26 14:53:08', '4', '尽快', null, null, '5', null, '2018-10-26 06:53:08', '2018-10-26 06:53:08', null);
INSERT INTO `fault` VALUES ('427', '96', '一体机', '京瓷', 'M4028idn', '袁志成', null, '15961085096', 'A702', '2018-10-26 14:58:39', '4', '急用，尽快来', null, null, '5', null, '2018-10-26 06:58:39', '2018-10-26 06:58:39', null);
INSERT INTO `fault` VALUES ('428', '64', '扫描一体机', '京瓷', 'KM-2560', '袁露丹', null, '62932153', 'A701', '2018-10-26 15:37:19', '4', '', null, null, '5', null, '2018-10-26 07:37:19', '2018-10-26 07:37:19', null);
INSERT INTO `fault` VALUES ('429', '33', '桌面一体传真机', 'HP', '1216NfhMFP', 'G107办公室', null, '15962151014', 'G107办公室', null, null, '', '1', null, '5', null, '2018-10-30 03:03:53', '2018-10-30 03:03:53', null);
INSERT INTO `fault` VALUES ('430', '102', '黑白一体机', '京瓷', 'Ecosys M4132idn', '郭君臣', null, '18362668826', 'g110', '2018-10-30 11:20:57', '4', '', null, null, '5', null, '2018-10-30 03:20:57', '2018-10-30 03:20:57', null);
INSERT INTO `fault` VALUES ('431', '42', '桌面打印机', '京瓷', 'FS-1060DN', '秦瑶', null, '13814896510', 'H201', '2018-10-30 15:54:49', '4', '', null, null, '5', null, '2018-10-30 07:54:49', '2018-10-30 07:54:49', null);
INSERT INTO `fault` VALUES ('432', '57', '复印机', '京瓷', 'FS-6525MFP', '招办', null, '18994374635', '外包A103', '2018-10-31 14:00:53', '4', '打印没反应', null, null, '5', null, '2018-10-31 06:00:53', '2018-10-31 06:00:53', null);
INSERT INTO `fault` VALUES ('433', '29', '桌面彩色一体机', 'HP', 'CM1415fncolorMFP', '李瑞丽', null, '62932810', 'G210', null, null, '换墨盒，红色一支，黑色一支，黄色一支，蓝色一支', '1', null, '5', null, '2018-11-01 00:55:49', '2018-11-01 00:55:49', null);
INSERT INTO `fault` VALUES ('434', '96', '一体机', '京瓷', 'M4028idn', '柳润泽', null, '18013764289', 'A702', '2018-11-02 16:39:18', '4', '尽快尽快', null, null, '5', null, '2018-11-02 08:39:18', '2018-11-02 08:39:18', null);
INSERT INTO `fault` VALUES ('435', '40', '激光打印机', 'HP', 'HP400 M401dn', '徐飞扬', null, '18206217867', 'h402', '2018-11-05 10:19:51', '4', '显示脱机', null, null, '5', null, '2018-11-05 02:19:51', '2018-11-05 02:19:51', null);
INSERT INTO `fault` VALUES ('436', '19', '复印一体机', '施乐', 'S2420', '罗凯', null, '18262008681', 'F405', '2018-11-07 10:27:17', '5', '显示感光鼓寿命到期，有异响，墨盒也要更换', null, null, '5', null, '2018-11-07 02:27:17', '2018-11-07 02:27:17', null);
INSERT INTO `fault` VALUES ('437', '64', '扫描一体机', '京瓷', 'KM-2560', '谢奕君', null, '62932153', 'A701', '2018-11-08 09:54:40', '8', '无法打印', null, null, '5', null, '2018-11-08 01:54:40', '2018-11-08 01:54:40', null);
INSERT INTO `fault` VALUES ('438', '2', '针式打印机', 'EPSON', 'LQ630K', '', null, '', 'A406', '2018-11-08 09:54:42', '1', '卡纸 有异响', null, null, '5', null, '2018-11-08 01:54:42', '2018-11-08 01:54:42', null);
INSERT INTO `fault` VALUES ('439', '100', '黑白一体机', '京瓷', 'Ecosys M4132idn', '小沈', null, '62932826', 'g201', '2018-11-08 11:02:37', '4', '安装了驱动还是不打印', null, null, '5', null, '2018-11-08 03:02:37', '2018-11-08 03:02:37', null);
INSERT INTO `fault` VALUES ('440', '9', '复印机', '京瓷', 'KM-2560', '蒋建锋', null, '13739176386', 'F506', null, null, '打印机报粉墨用尽', '1', null, '5', null, '2018-11-08 05:37:50', '2018-11-08 05:37:50', null);
INSERT INTO `fault` VALUES ('441', '9', '复印机', '京瓷', 'KM-2560', '张鑫', null, '13952405346', 'F506', null, null, '缺墨', '1', null, '5', null, '2018-11-08 06:44:14', '2018-11-08 06:44:14', null);
INSERT INTO `fault` VALUES ('442', '19', '复印一体机', '施乐', 'S2420', '罗凯', null, '18262008681', 'F405', null, null, '更换墨粉筒', '1', null, '5', null, '2018-11-08 07:12:45', '2018-11-08 07:12:45', null);
INSERT INTO `fault` VALUES ('443', '80', '复印一体机', '施乐', 'S2420', '王艳', null, '18651110550', 'c104', '2018-11-19 13:35:26', '1', '从504搬家到104', null, null, '5', null, '2018-11-19 05:35:26', '2018-11-19 05:35:26', null);
INSERT INTO `fault` VALUES ('444', '80', '复印一体机', '施乐', 'S2420', '王淡菊', null, '62932062', 'C104', '2018-11-19 13:40:55', '9', '办公室搬迁，打印机需重新连电脑，扫描功能也需重新联机', null, null, '5', null, '2018-11-19 05:40:55', '2018-11-19 05:40:55', null);
INSERT INTO `fault` VALUES ('445', '46', '传真打印一体机', '佳能', 'MF4370DNG', '王玉军', null, '13812666165', 'H412', '2018-11-19 16:25:08', '9', '办公地点搬迁，网络需要重新链接设置匹配，现在空的话尽快来，因要加班打印材料', null, null, '5', null, '2018-11-19 08:25:08', '2018-11-19 08:25:08', null);
INSERT INTO `fault` VALUES ('446', '46', '传真打印一体机', '佳能', 'MF4370DNG', '王玉军', null, '13812666165', 'h 412', '2018-11-20 08:16:05', '1', '办公室迁移，需要重新匹配打印机地址', null, null, '5', null, '2018-11-20 00:16:05', '2018-11-20 00:16:05', null);
INSERT INTO `fault` VALUES ('447', '104', '复印一体机', '京瓷', 'Ecosys M4132idn', '', null, '', '111', '2018-11-22 09:22:10', '1', '', null, null, '5', null, '2018-11-22 01:22:10', '2018-11-22 01:22:10', null);
INSERT INTO `fault` VALUES ('448', '22', '复印一体机', '施乐', 'S2420', '谢婷', null, '62932652', 'G309', '2018-11-23 10:42:13', '9', '帮我电脑连一下打印机～谢谢麻烦啦', null, null, '5', null, '2018-11-23 02:42:13', '2018-11-23 02:42:13', null);
INSERT INTO `fault` VALUES ('449', '1', '桌面激光打印机', 'HP', 'HP400 M401dn', '', 'ohCh0wE7cbctkuigsKCUaChEznXw', '', '11', '2018-11-27 15:40:35', '1', '', null, null, '5', null, '2018-11-27 07:40:35', '2018-11-27 07:40:35', null);
INSERT INTO `fault` VALUES ('450', '42', '桌面打印机', '京瓷', 'FS-1060DN', '', null, '', 'H512', '2018-11-28 12:19:31', '9', '脱机\n', null, null, '5', null, '2018-11-28 04:19:31', '2018-11-28 04:19:31', null);
INSERT INTO `fault` VALUES ('451', '68', '桌面一体机', '三星', 'SCX4521HS', '杨奕', null, '13913107660', 'f306', null, null, 'kyocera ecosys m4132idn kx缺墨', '1', null, '5', null, '2018-11-28 05:10:53', '2018-11-28 05:10:53', null);
INSERT INTO `fault` VALUES ('452', '42', '桌面打印机', '京瓷', 'FS-1060DN', '周洋', null, '18036392112', 'H512', '2018-11-28 13:46:25', '1', '脱机', null, null, '5', null, '2018-11-28 05:46:25', '2018-11-28 05:46:25', null);
INSERT INTO `fault` VALUES ('453', '9', '复印机', '京瓷', 'KM-2560', '', null, '', 'F506', '2018-11-28 14:45:24', '9', '显示器显示发生错误，错误代码C7300', null, null, '5', null, '2018-11-28 06:45:24', '2018-11-28 06:45:24', null);
INSERT INTO `fault` VALUES ('454', '42', '桌面打印机', '京瓷', 'FS-1060DN', '', null, '18036392112', 'H512', '2018-11-28 16:22:08', '1', '无法打印，显示就绪，墨盒剩余3％', null, null, '5', null, '2018-11-28 08:22:08', '2018-11-28 08:22:08', null);
INSERT INTO `fault` VALUES ('455', '40', '激光打印机', 'HP', 'HP400 M401dn', '徐飞扬', null, '62932861', 'h402', null, null, '缺墨', '1', null, '5', null, '2018-11-30 01:09:46', '2018-11-30 01:09:46', null);
INSERT INTO `fault` VALUES ('456', '40', '激光打印机', 'HP', 'HP400 M401dn', '高雨', null, '62932925', 'H402', null, null, '缺墨', '1', null, '5', null, '2018-11-30 05:21:22', '2018-11-30 05:21:22', null);
INSERT INTO `fault` VALUES ('457', '9', '复印机', '京瓷', 'KM-2560', '张鑫', null, '13952405346', 'F506', null, null, '', '1', null, '5', null, '2018-11-30 07:41:34', '2018-11-30 07:41:34', null);
INSERT INTO `fault` VALUES ('458', '80', '复印一体机', '施乐', 'S2420', '邵家鹏', null, '62932093', 'C104', '2018-12-04 13:56:24', '9', '\n安装打印机', null, null, '5', null, '2018-12-04 05:56:24', '2018-12-04 05:56:24', null);
INSERT INTO `fault` VALUES ('459', '100', '黑白一体机', '京瓷', 'Ecosys M4132idn', '沈', null, '2826', 'g201', '2018-12-06 10:03:56', '9', '无法自动双面打印', null, null, '5', null, '2018-12-06 02:03:56', '2018-12-06 02:03:56', null);
INSERT INTO `fault` VALUES ('460', '9', '复印机', '京瓷', 'KM-2560', '何婷婷', null, '18862230590', 'F506', '2018-12-06 10:52:41', '1', '卡纸', null, null, '5', null, '2018-12-06 02:52:41', '2018-12-06 02:52:41', null);
INSERT INTO `fault` VALUES ('461', '102', '黑白一体机', '京瓷', 'Ecosys M4132idn', '外包', null, '15151502187', '苏州外包学院G108', '2018-12-06 16:38:25', '1', '无法打印PDF，无法取消作业，强制重启以后还是不能用', null, null, '5', null, '2018-12-06 08:38:25', '2018-12-06 08:38:25', null);
INSERT INTO `fault` VALUES ('462', '9', '复印机', '京瓷', 'KM-2560', '谷', null, '15599016003', 'F506', '2018-12-06 16:57:29', '1', '一直报错左侧盖板问题，经常卡纸', null, null, '5', null, '2018-12-06 08:57:29', '2018-12-06 08:57:29', null);
INSERT INTO `fault` VALUES ('463', '36', '复印机', '京瓷', 'KM-2560', '武红阵', null, '15006214399', 'G110', '2018-12-07 15:49:42', '1', '', null, null, '5', null, '2018-12-07 07:49:42', '2018-12-07 07:49:42', null);

-- ----------------------------
-- Table structure for faultlog
-- ----------------------------
DROP TABLE IF EXISTS `faultlog`;
CREATE TABLE `faultlog` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `printer_id` bigint(11) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `represult` int(11) DEFAULT NULL,
  `list` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `supresult` int(11) DEFAULT NULL,
  `suplist` varchar(255) DEFAULT NULL,
  `supdescription` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `faultlog_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of faultlog
-- ----------------------------
INSERT INTO `faultlog` VALUES ('1', '1', null, '2000-12-31 16:00:00', '1', '1', '1', '1', '1', '1', '1', '2017-07-19 08:35:23', '2017-07-19 08:35:23', '2017-07-19 08:35:26');
INSERT INTO `faultlog` VALUES ('2', '2', null, '2017-07-19 08:43:46', '1', '架子', '架子', null, null, null, null, '2017-07-19 08:43:38', '2017-07-19 08:43:38', null);
INSERT INTO `faultlog` VALUES ('3', '2', null, '2017-07-19 08:44:01', null, null, null, '1', '硒鼓', '硒鼓', null, '2017-07-19 08:43:53', '2017-07-19 08:43:53', null);
INSERT INTO `faultlog` VALUES ('4', '2', null, '2017-07-24 06:47:28', '4', '', '', null, null, null, null, '2017-07-24 06:47:11', '2017-07-24 06:47:11', null);
INSERT INTO `faultlog` VALUES ('5', '3', null, '2017-08-02 05:51:58', '1', '', '', null, null, null, null, '2017-08-02 05:51:29', '2017-08-02 05:51:29', null);
INSERT INTO `faultlog` VALUES ('6', '1', null, '2017-08-08 09:19:19', '1', '', '', null, null, null, null, '2017-08-08 09:18:42', '2017-08-08 09:18:42', null);
INSERT INTO `faultlog` VALUES ('7', '1', null, '2017-08-08 09:19:20', '1', '', '', null, null, null, null, '2017-08-08 09:18:43', '2017-08-08 09:18:43', null);
INSERT INTO `faultlog` VALUES ('8', '55', null, '2017-08-16 07:22:26', '1', '', '卡纸已修复', null, null, null, null, '2017-08-16 07:22:22', '2017-08-16 07:22:22', null);
INSERT INTO `faultlog` VALUES ('9', '67', null, '2017-08-16 07:48:00', null, null, null, '1', '墨盒', '墨盒', null, '2017-08-16 07:47:57', '2017-08-16 07:47:57', null);
INSERT INTO `faultlog` VALUES ('10', '55', null, '2017-08-16 08:14:04', '1', '', '', null, null, null, null, '2017-08-16 08:14:01', '2017-08-16 08:14:01', null);
INSERT INTO `faultlog` VALUES ('11', '55', null, '2017-08-16 08:20:59', '1', '', '', null, null, null, null, '2017-08-16 08:20:55', '2017-08-16 08:20:55', null);
INSERT INTO `faultlog` VALUES ('12', '55', null, '2017-08-16 08:22:48', '1', '', '', null, null, null, null, '2017-08-16 08:22:45', '2017-08-16 08:22:45', null);
INSERT INTO `faultlog` VALUES ('13', '55', null, '2017-08-16 08:23:21', null, null, null, '1', '', '', null, '2017-08-16 08:23:17', '2017-08-16 08:23:17', null);
INSERT INTO `faultlog` VALUES ('14', '55', null, '2017-08-16 08:26:12', '1', '', '', null, null, null, null, '2017-08-16 08:26:09', '2017-08-16 08:26:09', null);
INSERT INTO `faultlog` VALUES ('15', '55', null, '2017-08-16 08:26:24', '1', '', '', null, null, null, null, '2017-08-16 08:26:20', '2017-08-16 08:26:20', null);
INSERT INTO `faultlog` VALUES ('16', '1', null, '2017-09-01 02:27:04', '4', '维修中', '维修中', null, null, null, null, '2017-09-01 02:27:05', '2017-09-01 02:27:05', null);
INSERT INTO `faultlog` VALUES ('17', '1', null, '2017-09-01 02:27:25', '1', '完成维修', '完成维修', null, null, null, null, '2017-09-01 02:27:26', '2017-09-01 02:27:26', null);
INSERT INTO `faultlog` VALUES ('18', '1', null, '2017-09-01 02:58:40', '2', '', '', null, null, null, null, '2017-09-01 02:58:41', '2017-09-01 02:58:41', null);
INSERT INTO `faultlog` VALUES ('19', '1', null, '2017-09-01 02:58:51', '1', '', '', null, null, null, null, '2017-09-01 02:58:52', '2017-09-01 02:58:52', null);
INSERT INTO `faultlog` VALUES ('20', '1', null, '2017-09-01 03:10:22', '3', '', '', null, null, null, null, '2017-09-01 03:10:21', '2017-09-01 03:10:21', null);
INSERT INTO `faultlog` VALUES ('21', '1', null, '2017-09-01 03:10:32', '1', '', '', null, null, null, null, '2017-09-01 03:10:31', '2017-09-01 03:10:31', null);
INSERT INTO `faultlog` VALUES ('22', '74', null, '2017-09-01 08:54:25', '1', '', '', null, null, null, null, '2017-09-01 08:54:24', '2017-09-01 08:54:24', null);
INSERT INTO `faultlog` VALUES ('23', '1', null, '2017-09-02 00:50:57', '1', '', '', null, null, null, null, '2017-09-02 00:50:55', '2017-09-02 00:50:55', null);
INSERT INTO `faultlog` VALUES ('24', '64', null, '2017-09-02 05:48:44', '1', '', '', null, null, null, null, '2017-09-02 05:48:41', '2017-09-02 05:48:41', null);
INSERT INTO `faultlog` VALUES ('25', '64', null, '2017-09-02 05:48:51', '1', '', '', null, null, null, null, '2017-09-02 05:48:48', '2017-09-02 05:48:48', null);
INSERT INTO `faultlog` VALUES ('26', '64', null, '2017-09-02 05:48:54', '1', '', '', null, null, null, null, '2017-09-02 05:48:51', '2017-09-02 05:48:51', null);
INSERT INTO `faultlog` VALUES ('27', '64', null, '2017-09-02 05:48:56', '1', '', '', null, null, null, null, '2017-09-02 05:48:53', '2017-09-02 05:48:53', null);
INSERT INTO `faultlog` VALUES ('28', '64', null, '2017-09-02 05:48:57', '1', '', '', null, null, null, null, '2017-09-02 05:48:54', '2017-09-02 05:48:54', null);
INSERT INTO `faultlog` VALUES ('29', '64', null, '2017-09-02 05:48:58', '1', '', '', null, null, null, null, '2017-09-02 05:48:55', '2017-09-02 05:48:55', null);
INSERT INTO `faultlog` VALUES ('30', '64', null, '2017-09-02 05:48:59', '1', '', '', null, null, null, null, '2017-09-02 05:48:56', '2017-09-02 05:48:56', null);
INSERT INTO `faultlog` VALUES ('31', '64', null, '2017-09-02 05:49:01', '1', '', '', null, null, null, null, '2017-09-02 05:48:58', '2017-09-02 05:48:58', null);
INSERT INTO `faultlog` VALUES ('32', '64', null, '2017-09-02 05:49:02', '1', '', '', null, null, null, null, '2017-09-02 05:48:59', '2017-09-02 05:48:59', null);
INSERT INTO `faultlog` VALUES ('33', '64', null, '2017-09-02 05:49:03', '1', '', '', null, null, null, null, '2017-09-02 05:49:00', '2017-09-02 05:49:00', null);
INSERT INTO `faultlog` VALUES ('34', '64', null, '2017-09-02 05:49:04', '1', '', '', null, null, null, null, '2017-09-02 05:49:01', '2017-09-02 05:49:01', null);
INSERT INTO `faultlog` VALUES ('35', '64', null, '2017-09-02 05:49:05', '1', '', '', null, null, null, null, '2017-09-02 05:49:02', '2017-09-02 05:49:02', null);
INSERT INTO `faultlog` VALUES ('36', '64', null, '2017-09-02 05:49:06', '1', '', '', null, null, null, null, '2017-09-02 05:49:03', '2017-09-02 05:49:03', null);
INSERT INTO `faultlog` VALUES ('37', '64', null, '2017-09-02 05:49:07', '1', '', '', null, null, null, null, '2017-09-02 05:49:04', '2017-09-02 05:49:04', null);
INSERT INTO `faultlog` VALUES ('38', '1', null, '2017-09-02 05:49:41', '1', '', '', null, null, null, null, '2017-09-02 05:49:38', '2017-09-02 05:49:38', null);
INSERT INTO `faultlog` VALUES ('39', '13', null, '2017-09-02 05:50:46', '1', '', '', null, null, null, null, '2017-09-02 05:50:43', '2017-09-02 05:50:43', null);
INSERT INTO `faultlog` VALUES ('40', '63', null, '2017-09-02 05:51:42', '1', '', '', null, null, null, null, '2017-09-02 05:51:39', '2017-09-02 05:51:39', null);
INSERT INTO `faultlog` VALUES ('41', '42', null, '2017-09-02 07:49:26', '1', '', '', null, null, null, null, '2017-09-02 07:49:23', '2017-09-02 07:49:23', null);
INSERT INTO `faultlog` VALUES ('42', '34', null, '2017-09-03 08:05:21', '1', '', '', null, null, null, null, '2017-09-03 08:05:17', '2017-09-03 08:05:17', null);
INSERT INTO `faultlog` VALUES ('43', '47', null, '2017-09-03 08:06:19', '1', '更换耗材', '', null, null, null, null, '2017-09-03 08:06:14', '2017-09-03 08:06:14', null);
INSERT INTO `faultlog` VALUES ('44', '44', null, '2017-09-03 08:06:36', '1', '', '', null, null, null, null, '2017-09-03 08:06:32', '2017-09-03 08:06:32', null);
INSERT INTO `faultlog` VALUES ('45', '46', null, '2017-09-03 08:07:41', '1', '', '', null, null, null, null, '2017-09-03 08:07:37', '2017-09-03 08:07:37', null);
INSERT INTO `faultlog` VALUES ('46', '46', null, '2017-09-03 08:08:09', '4', '', '', null, null, null, null, '2017-09-03 08:08:04', '2017-09-03 08:08:04', null);
INSERT INTO `faultlog` VALUES ('47', '55', null, '2017-09-04 08:01:31', '2', '', '', null, null, null, null, '2017-09-04 08:01:25', '2017-09-04 08:01:25', null);
INSERT INTO `faultlog` VALUES ('48', '6', null, '2017-09-05 02:24:44', '1', '', '', null, null, null, null, '2017-09-05 02:24:37', '2017-09-05 02:24:37', null);
INSERT INTO `faultlog` VALUES ('49', '64', null, '2017-09-05 04:31:09', '1', '', '', null, null, null, null, '2017-09-05 04:31:02', '2017-09-05 04:31:02', null);
INSERT INTO `faultlog` VALUES ('50', '1', null, '2017-09-05 06:14:56', '1', '', '', null, null, null, null, '2017-09-05 06:14:50', '2017-09-05 06:14:50', null);
INSERT INTO `faultlog` VALUES ('51', '1', null, '2017-09-05 06:20:27', '1', '', '', null, null, null, null, '2017-09-05 06:20:22', '2017-09-05 06:20:22', null);
INSERT INTO `faultlog` VALUES ('52', '42', null, '2017-09-05 07:12:10', '1', '', '', null, null, null, null, '2017-09-05 07:12:03', '2017-09-05 07:12:03', null);
INSERT INTO `faultlog` VALUES ('53', '9', null, '2017-09-05 07:32:24', '2', '定影组件', '', null, null, null, null, '2017-09-05 07:32:17', '2017-09-05 07:32:17', null);
INSERT INTO `faultlog` VALUES ('54', '64', null, '2017-09-05 07:34:55', '2', '定影组件', '', null, null, null, null, '2017-09-05 07:34:49', '2017-09-05 07:34:49', null);
INSERT INTO `faultlog` VALUES ('55', '55', null, '2017-09-05 07:53:33', '1', '', '', null, null, null, null, '2017-09-05 07:53:26', '2017-09-05 07:53:26', null);
INSERT INTO `faultlog` VALUES ('56', '27', null, '2017-09-06 00:52:03', '2', '', '', null, null, null, null, '2017-09-06 00:51:55', '2017-09-06 00:51:55', null);
INSERT INTO `faultlog` VALUES ('57', '26', null, '2017-09-06 02:22:11', '2', '', '', null, null, null, null, '2017-09-06 02:22:02', '2017-09-06 02:22:02', null);
INSERT INTO `faultlog` VALUES ('58', '47', null, '2017-09-07 01:09:00', '2', '加长版usb连接线', '购买USB线\n', null, null, null, null, '2017-09-07 01:08:51', '2017-09-07 01:08:51', null);
INSERT INTO `faultlog` VALUES ('59', '43', null, '2017-09-08 09:06:48', '1', '', '', null, null, null, null, '2017-09-08 09:06:36', '2017-09-08 09:06:36', null);
INSERT INTO `faultlog` VALUES ('60', '9', null, '2017-09-08 09:14:51', '1', '更换fk671定影组件', '更换完成\n', null, null, null, null, '2017-09-08 09:14:40', '2017-09-08 09:14:40', null);
INSERT INTO `faultlog` VALUES ('61', '64', null, '2017-09-11 02:32:51', '1', '定影组件fk671', '更换定影组件', null, null, null, null, '2017-09-11 02:32:47', '2017-09-11 02:32:47', null);
INSERT INTO `faultlog` VALUES ('62', '63', null, '2017-09-11 02:33:49', '1', '搓纸轮，分页器', '更换搓纸轮和分页器', null, null, null, null, '2017-09-11 02:33:46', '2017-09-11 02:33:46', null);
INSERT INTO `faultlog` VALUES ('63', '43', null, '2017-09-11 03:01:04', '2', '', '', null, null, null, null, '2017-09-11 03:01:01', '2017-09-11 03:01:01', null);
INSERT INTO `faultlog` VALUES ('64', '47', null, '2017-09-11 06:10:58', '1', '', '', null, null, null, null, '2017-09-11 06:10:54', '2017-09-11 06:10:54', null);
INSERT INTO `faultlog` VALUES ('65', '35', null, '2017-09-12 01:10:20', '1', '', '', null, null, null, null, '2017-09-12 01:10:16', '2017-09-12 01:10:16', null);
INSERT INTO `faultlog` VALUES ('66', '17', null, '2017-09-12 08:02:22', '1', '', '', null, null, null, null, '2017-09-12 08:02:17', '2017-09-12 08:02:17', null);
INSERT INTO `faultlog` VALUES ('67', '57', null, '2017-09-13 01:30:10', '1', '', '', null, null, null, null, '2017-09-13 01:30:04', '2017-09-13 01:30:04', null);
INSERT INTO `faultlog` VALUES ('68', '28', null, '2017-09-13 07:02:20', '1', '', '', null, null, null, null, '2017-09-13 07:02:14', '2017-09-13 07:02:14', null);
INSERT INTO `faultlog` VALUES ('69', '43', null, '2017-09-14 00:35:36', '1', '更换转印无料', '更换转印组件', null, null, null, null, '2017-09-14 00:35:29', '2017-09-14 00:35:29', null);
INSERT INTO `faultlog` VALUES ('70', '34', null, '2017-09-14 09:09:09', '1', '', '', null, null, null, null, '2017-09-14 09:09:01', '2017-09-14 09:09:01', null);
INSERT INTO `faultlog` VALUES ('71', '19', null, '2017-09-15 02:20:08', '1', '', '清除卡纸\n', null, null, null, null, '2017-09-15 02:19:59', '2017-09-15 02:19:59', null);
INSERT INTO `faultlog` VALUES ('72', '26', null, '2017-09-15 08:36:33', '1', '', '完成', null, null, null, null, '2017-09-15 08:36:24', '2017-09-15 08:36:24', null);
INSERT INTO `faultlog` VALUES ('73', '26', null, '2017-09-15 08:37:06', '1', '', '', null, null, null, null, '2017-09-15 08:36:57', '2017-09-15 08:36:57', null);
INSERT INTO `faultlog` VALUES ('74', '27', null, '2017-09-15 08:38:41', '1', '', '', null, null, null, null, '2017-09-15 08:38:32', '2017-09-15 08:38:32', null);
INSERT INTO `faultlog` VALUES ('75', '1', null, '2017-09-19 00:49:43', '1', '测试\n', '', null, null, null, null, '2017-09-19 00:49:32', '2017-09-19 00:49:32', null);
INSERT INTO `faultlog` VALUES ('76', '17', null, '2017-09-19 03:13:22', '1', '', '驱动更新', null, null, null, null, '2017-09-19 03:13:11', '2017-09-19 03:13:11', null);
INSERT INTO `faultlog` VALUES ('77', '23', null, '2017-09-19 03:21:16', '1', '更换粉盒', '更换粉盒', null, null, null, null, '2017-09-19 03:21:05', '2017-09-19 03:21:05', null);
INSERT INTO `faultlog` VALUES ('78', '31', null, '2017-09-19 08:38:46', '1', '', '更换废粉盒', null, null, null, null, '2017-09-19 08:38:34', '2017-09-19 08:38:34', null);
INSERT INTO `faultlog` VALUES ('79', '40', null, '2017-09-20 02:34:00', '1', '', '', null, null, null, null, '2017-09-20 02:33:48', '2017-09-20 02:33:48', null);
INSERT INTO `faultlog` VALUES ('80', '43', null, '2017-09-21 01:46:44', '1', '', '手送纸盘坏', null, null, null, null, '2017-09-21 01:46:44', '2017-09-21 01:46:44', null);
INSERT INTO `faultlog` VALUES ('81', '55', null, '2017-09-21 01:49:42', '1', '', '', null, null, null, null, '2017-09-21 01:49:42', '2017-09-21 01:49:42', null);
INSERT INTO `faultlog` VALUES ('82', '64', null, '2017-09-21 07:42:36', '1', '', '', null, null, null, null, '2017-09-21 07:42:36', '2017-09-21 07:42:36', null);
INSERT INTO `faultlog` VALUES ('83', '44', null, '2017-09-21 07:43:04', '1', '', '', null, null, null, null, '2017-09-21 07:43:04', '2017-09-21 07:43:04', null);
INSERT INTO `faultlog` VALUES ('84', '8', null, '2017-09-25 08:59:48', '1', '', '', null, null, null, null, '2017-09-25 08:59:42', '2017-09-25 08:59:42', null);
INSERT INTO `faultlog` VALUES ('85', '64', null, '2017-09-25 09:00:13', '1', '', '', null, null, null, null, '2017-09-25 09:00:07', '2017-09-25 09:00:07', null);
INSERT INTO `faultlog` VALUES ('86', '8', null, '2017-09-26 01:53:01', '1', '', '', null, null, null, null, '2017-09-26 01:52:54', '2017-09-26 01:52:54', null);
INSERT INTO `faultlog` VALUES ('87', '42', null, '2017-09-27 03:14:53', '1', '', '', null, null, null, null, '2017-09-27 03:14:44', '2017-09-27 03:14:44', null);
INSERT INTO `faultlog` VALUES ('88', '42', null, '2017-09-27 03:15:11', '1', '', '', null, null, null, null, '2017-09-27 03:15:02', '2017-09-27 03:15:02', null);
INSERT INTO `faultlog` VALUES ('89', '43', null, '2017-09-27 03:15:44', '1', '', '', null, null, null, null, '2017-09-27 03:15:35', '2017-09-27 03:15:35', null);
INSERT INTO `faultlog` VALUES ('90', '8', null, '2017-09-27 03:35:26', '1', '', '', null, null, null, null, '2017-09-27 03:35:17', '2017-09-27 03:35:17', null);
INSERT INTO `faultlog` VALUES ('91', '28', null, '2017-09-28 06:32:50', '1', '', '', null, null, null, null, '2017-09-28 06:32:49', '2017-09-28 06:32:49', null);
INSERT INTO `faultlog` VALUES ('92', '55', null, '2017-09-29 01:14:58', '1', '', '', null, null, null, null, '2017-09-29 01:14:57', '2017-09-29 01:14:57', null);
INSERT INTO `faultlog` VALUES ('93', '43', null, '2017-09-30 00:43:06', '1', '', '', null, null, null, null, '2017-09-30 00:43:03', '2017-09-30 00:43:03', null);
INSERT INTO `faultlog` VALUES ('94', '37', null, '2017-09-30 00:45:26', '1', '更换息鼓', '', null, null, null, null, '2017-09-30 00:45:23', '2017-09-30 00:45:23', null);
INSERT INTO `faultlog` VALUES ('95', '2', null, '2017-09-30 00:46:28', '1', '更换色带', '', null, null, null, null, '2017-09-30 00:46:25', '2017-09-30 00:46:25', null);
INSERT INTO `faultlog` VALUES ('96', '26', null, '2017-09-30 00:47:09', '1', '', '', null, null, null, null, '2017-09-30 00:47:06', '2017-09-30 00:47:06', null);
INSERT INTO `faultlog` VALUES ('97', '27', null, '2017-09-30 00:47:30', '1', '', '', null, null, null, null, '2017-09-30 00:47:26', '2017-09-30 00:47:26', null);
INSERT INTO `faultlog` VALUES ('98', '30', null, '2017-09-30 04:25:21', '1', '', '', null, null, null, null, '2017-09-30 04:25:17', '2017-09-30 04:25:17', null);
INSERT INTO `faultlog` VALUES ('99', '42', null, '2017-10-09 06:45:52', '1', '', '', null, null, null, null, '2017-10-09 06:45:45', '2017-10-09 06:45:45', null);
INSERT INTO `faultlog` VALUES ('100', '26', null, '2017-10-09 07:59:12', '1', '', '', null, null, null, null, '2017-10-09 07:59:05', '2017-10-09 07:59:05', null);
INSERT INTO `faultlog` VALUES ('101', '41', null, '2017-10-10 02:44:02', '1', '', '', null, null, null, null, '2017-10-10 02:43:55', '2017-10-10 02:43:55', null);
INSERT INTO `faultlog` VALUES ('102', '23', null, '2017-10-10 05:58:34', '1', '', '', null, null, null, null, '2017-10-10 05:58:27', '2017-10-10 05:58:27', null);
INSERT INTO `faultlog` VALUES ('103', '2', null, '2017-10-10 06:34:15', '1', '', '', null, null, null, null, '2017-10-10 06:34:08', '2017-10-10 06:34:08', null);
INSERT INTO `faultlog` VALUES ('104', '22', null, '2017-10-11 08:30:54', '1', '', '', null, null, null, null, '2017-10-11 08:30:45', '2017-10-11 08:30:45', null);
INSERT INTO `faultlog` VALUES ('105', '64', null, '2017-10-12 05:58:54', '1', '', '', null, null, null, null, '2017-10-12 05:58:53', '2017-10-12 05:58:53', null);
INSERT INTO `faultlog` VALUES ('106', '1', null, '2017-10-13 08:58:53', '1', '', '', null, null, null, null, '2017-10-13 08:58:50', '2017-10-13 08:58:50', null);
INSERT INTO `faultlog` VALUES ('107', '26', null, '2017-10-16 06:07:03', '1', '', '', null, null, null, null, '2017-10-16 06:06:57', '2017-10-16 06:06:57', null);
INSERT INTO `faultlog` VALUES ('108', '26', null, '2017-10-17 01:52:07', '1', '更换定影，鼓组件，搓纸轮套', '', null, null, null, null, '2017-10-17 01:51:59', '2017-10-17 01:51:59', null);
INSERT INTO `faultlog` VALUES ('109', '42', null, '2017-10-17 06:03:26', '1', '', '', null, null, null, null, '2017-10-17 06:03:18', '2017-10-17 06:03:18', null);
INSERT INTO `faultlog` VALUES ('110', '19', null, '2017-10-18 01:40:07', '1', '', '', null, null, null, null, '2017-10-18 01:39:58', '2017-10-18 01:39:58', null);
INSERT INTO `faultlog` VALUES ('111', '43', null, '2017-10-19 03:13:25', '1', '', '卡纸', null, null, null, null, '2017-10-19 03:13:25', '2017-10-19 03:13:25', null);
INSERT INTO `faultlog` VALUES ('112', '18', null, '2017-10-20 08:19:53', '1', '', '', null, null, null, null, '2017-10-20 08:19:51', '2017-10-20 08:19:51', null);
INSERT INTO `faultlog` VALUES ('113', '9', null, '2017-10-23 08:53:39', '1', '', '', null, null, null, null, '2017-10-23 08:53:33', '2017-10-23 08:53:33', null);
INSERT INTO `faultlog` VALUES ('114', '38', null, '2017-10-25 03:22:03', '1', '', '', null, null, null, null, '2017-10-25 03:21:53', '2017-10-25 03:21:53', null);
INSERT INTO `faultlog` VALUES ('115', '55', null, '2017-10-26 03:20:05', '1', '', '', null, null, null, null, '2017-10-26 03:20:05', '2017-10-26 03:20:05', null);
INSERT INTO `faultlog` VALUES ('116', '55', null, '2017-10-26 03:21:58', '1', '', '', null, null, null, null, '2017-10-26 03:22:02', '2017-10-26 03:22:02', null);
INSERT INTO `faultlog` VALUES ('117', '43', null, '2017-10-26 04:11:41', '1', '', '', null, null, null, null, '2017-10-26 04:11:43', '2017-10-26 04:11:43', null);
INSERT INTO `faultlog` VALUES ('118', '55', null, '2017-10-26 06:43:14', '1', '', '', null, null, null, null, '2017-10-26 06:43:15', '2017-10-26 06:43:15', null);
INSERT INTO `faultlog` VALUES ('119', '43', null, '2017-11-06 03:08:37', '1', '', '卡纸修复', null, null, null, null, '2017-11-06 03:08:31', '2017-11-06 03:08:31', null);
INSERT INTO `faultlog` VALUES ('120', '66', null, '2017-11-07 03:21:08', null, null, null, '1', 'HP80A', '完成', null, '2017-11-07 03:21:05', '2017-11-07 03:21:05', null);
INSERT INTO `faultlog` VALUES ('121', '46', null, '2017-11-09 01:54:11', null, null, null, '1', 'FX9佳能', '已更换', null, '2017-11-09 01:54:07', '2017-11-09 01:54:07', null);
INSERT INTO `faultlog` VALUES ('122', '12', null, '2017-11-20 05:17:58', '1', '', '', null, null, null, null, '2017-11-20 05:17:52', '2017-11-20 05:17:52', null);
INSERT INTO `faultlog` VALUES ('123', '8', null, '2017-11-20 05:18:34', '1', '', '', null, null, null, null, '2017-11-20 05:18:28', '2017-11-20 05:18:28', null);
INSERT INTO `faultlog` VALUES ('124', '34', null, '2017-11-22 00:37:49', '1', '', '', null, null, null, null, '2017-11-22 00:37:41', '2017-11-22 00:37:41', null);
INSERT INTO `faultlog` VALUES ('125', '28', null, '2017-11-22 00:38:18', '1', '', '', null, null, null, null, '2017-11-22 00:38:10', '2017-11-22 00:38:10', null);
INSERT INTO `faultlog` VALUES ('126', '9', null, '2017-11-24 02:16:38', '1', '', '', null, null, null, null, '2017-11-24 02:16:38', '2017-11-24 02:16:38', null);
INSERT INTO `faultlog` VALUES ('127', '44', null, '2017-11-24 02:17:10', '1', '', '', null, null, null, null, '2017-11-24 02:17:10', '2017-11-24 02:17:10', null);
INSERT INTO `faultlog` VALUES ('128', '28', null, '2017-11-24 02:17:31', '1', '', '', null, null, null, null, '2017-11-24 02:17:31', '2017-11-24 02:17:31', null);
INSERT INTO `faultlog` VALUES ('129', '34', null, '2017-11-24 02:18:06', '1', '', '', null, null, null, null, '2017-11-24 02:18:06', '2017-11-24 02:18:06', null);
INSERT INTO `faultlog` VALUES ('130', '47', null, '2017-11-24 02:19:01', '1', '', '', null, null, null, null, '2017-11-24 02:19:01', '2017-11-24 02:19:01', null);
INSERT INTO `faultlog` VALUES ('131', '40', null, '2017-11-24 02:19:57', '1', '', '', null, null, null, null, '2017-11-24 02:19:57', '2017-11-24 02:19:57', null);
INSERT INTO `faultlog` VALUES ('132', '66', null, '2017-11-24 02:20:46', '1', '', '', null, null, null, null, '2017-11-24 02:20:44', '2017-11-24 02:20:44', null);
INSERT INTO `faultlog` VALUES ('133', '43', null, '2017-11-24 02:21:27', '1', '', '', null, null, null, null, '2017-11-24 02:21:26', '2017-11-24 02:21:26', null);
INSERT INTO `faultlog` VALUES ('134', '40', null, '2017-12-26 08:13:34', '1', '', '', null, null, null, null, '2017-12-26 08:13:26', '2017-12-26 08:13:26', null);
INSERT INTO `faultlog` VALUES ('135', '19', null, '2017-12-26 08:14:14', '1', '', '', null, null, null, null, '2017-12-26 08:14:06', '2017-12-26 08:14:06', null);
INSERT INTO `faultlog` VALUES ('136', '46', null, '2017-12-28 08:32:01', '1', '', '', null, null, null, null, '2017-12-28 08:32:00', '2017-12-28 08:32:00', null);
INSERT INTO `faultlog` VALUES ('137', '56', null, '2017-12-28 08:32:57', '1', '', '', null, null, null, null, '2017-12-28 08:32:56', '2017-12-28 08:32:56', null);
INSERT INTO `faultlog` VALUES ('138', '44', null, '2017-12-28 08:33:42', '1', '', '', null, null, null, null, '2017-12-28 08:33:41', '2017-12-28 08:33:41', null);
INSERT INTO `faultlog` VALUES ('139', '47', null, '2017-12-28 08:34:05', '1', '', '', null, null, null, null, '2017-12-28 08:34:04', '2017-12-28 08:34:04', null);
INSERT INTO `faultlog` VALUES ('140', '48', null, '2017-12-28 08:34:22', '1', '', '', null, null, null, null, '2017-12-28 08:34:21', '2017-12-28 08:34:21', null);
INSERT INTO `faultlog` VALUES ('141', '1', null, '2017-12-28 08:34:45', '1', '', '', null, null, null, null, '2017-12-28 08:34:44', '2017-12-28 08:34:44', null);
INSERT INTO `faultlog` VALUES ('142', '46', null, '2017-12-28 08:35:17', '1', '', '', null, null, null, null, '2017-12-28 08:35:16', '2017-12-28 08:35:16', null);
INSERT INTO `faultlog` VALUES ('143', '9', null, '2017-12-28 08:37:28', '1', '', '', null, null, null, null, '2017-12-28 08:37:27', '2017-12-28 08:37:27', null);
INSERT INTO `faultlog` VALUES ('144', '10', null, '2017-12-28 08:37:40', '1', '', '', null, null, null, null, '2017-12-28 08:37:39', '2017-12-28 08:37:39', null);
INSERT INTO `faultlog` VALUES ('145', '13', null, '2017-12-28 08:37:57', '1', '', '', null, null, null, null, '2017-12-28 08:37:57', '2017-12-28 08:37:57', null);
INSERT INTO `faultlog` VALUES ('146', '19', null, '2017-12-28 08:38:11', '1', '', '', null, null, null, null, '2017-12-28 08:38:10', '2017-12-28 08:38:10', null);
INSERT INTO `faultlog` VALUES ('147', '26', null, '2017-12-28 08:38:33', '1', '', '', null, null, null, null, '2017-12-28 08:38:32', '2017-12-28 08:38:32', null);
INSERT INTO `faultlog` VALUES ('148', '31', null, '2017-12-28 08:38:50', '1', '', '', null, null, null, null, '2017-12-28 08:38:49', '2017-12-28 08:38:49', null);
INSERT INTO `faultlog` VALUES ('149', '32', null, '2017-12-28 08:39:03', '1', '', '', null, null, null, null, '2017-12-28 08:39:03', '2017-12-28 08:39:03', null);
INSERT INTO `faultlog` VALUES ('150', '34', null, '2017-12-28 08:39:23', '1', '', '', null, null, null, null, '2017-12-28 08:39:22', '2017-12-28 08:39:22', null);
INSERT INTO `faultlog` VALUES ('151', '34', null, '2017-12-28 08:39:32', '1', '', '', null, null, null, null, '2017-12-28 08:39:32', '2017-12-28 08:39:32', null);
INSERT INTO `faultlog` VALUES ('152', '35', null, '2017-12-28 08:39:43', '1', '', '', null, null, null, null, '2017-12-28 08:39:42', '2017-12-28 08:39:42', null);
INSERT INTO `faultlog` VALUES ('153', '40', null, '2017-12-28 08:40:02', '1', '', '', null, null, null, null, '2017-12-28 08:40:01', '2017-12-28 08:40:01', null);
INSERT INTO `faultlog` VALUES ('154', '48', null, '2017-12-28 08:40:23', '1', '', '', null, null, null, null, '2017-12-28 08:40:22', '2017-12-28 08:40:22', null);
INSERT INTO `faultlog` VALUES ('155', '55', null, '2017-12-28 08:40:38', '1', '', '', null, null, null, null, '2017-12-28 08:40:37', '2017-12-28 08:40:37', null);
INSERT INTO `faultlog` VALUES ('156', '59', null, '2017-12-28 08:41:12', '1', '', '', null, null, null, null, '2017-12-28 08:41:12', '2017-12-28 08:41:12', null);
INSERT INTO `faultlog` VALUES ('157', '64', null, '2017-12-28 08:41:31', '1', '', '', null, null, null, null, '2017-12-28 08:41:31', '2017-12-28 08:41:31', null);
INSERT INTO `faultlog` VALUES ('158', '43', null, '2017-12-28 08:42:20', '1', '', '', null, null, null, null, '2017-12-28 08:42:19', '2017-12-28 08:42:19', null);
INSERT INTO `faultlog` VALUES ('159', '36', null, '2017-12-28 08:42:57', '1', '', '', null, null, null, null, '2017-12-28 08:42:57', '2017-12-28 08:42:57', null);
INSERT INTO `faultlog` VALUES ('160', '1', null, '2018-09-12 03:17:24', '1', '', '', null, null, null, null, '2018-09-12 03:17:15', '2018-09-12 03:17:15', null);
INSERT INTO `faultlog` VALUES ('161', '7', null, '2018-09-12 03:17:59', '1', '', '', null, null, null, null, '2018-09-12 03:17:50', '2018-09-12 03:17:50', null);
INSERT INTO `faultlog` VALUES ('162', '23', null, '2018-09-12 03:18:55', '1', '', '', null, null, null, null, '2018-09-12 03:18:45', '2018-09-12 03:18:45', null);
INSERT INTO `faultlog` VALUES ('163', '22', null, '2018-09-12 03:19:39', '1', '', '', null, null, null, null, '2018-09-12 03:19:30', '2018-09-12 03:19:30', null);
INSERT INTO `faultlog` VALUES ('164', '64', null, '2018-09-12 03:20:18', '1', '', '', null, null, null, null, '2018-09-12 03:20:08', '2018-09-12 03:20:08', null);
INSERT INTO `faultlog` VALUES ('165', '68', null, '2018-09-12 03:21:02', '1', '', '', null, null, null, null, '2018-09-12 03:20:53', '2018-09-12 03:20:53', null);
INSERT INTO `faultlog` VALUES ('166', '67', null, '2018-09-12 03:21:18', '1', '', '', null, null, null, null, '2018-09-12 03:21:09', '2018-09-12 03:21:09', null);
INSERT INTO `faultlog` VALUES ('167', '28', null, '2018-09-12 03:22:12', '1', '', '', null, null, null, null, '2018-09-12 03:22:02', '2018-09-12 03:22:02', null);
INSERT INTO `faultlog` VALUES ('168', '6', null, '2018-09-12 03:23:36', '1', '', '', null, null, null, null, '2018-09-12 03:23:27', '2018-09-12 03:23:27', null);
INSERT INTO `faultlog` VALUES ('169', '9', null, '2018-09-12 03:23:59', '1', '', '', null, null, null, null, '2018-09-12 03:23:50', '2018-09-12 03:23:50', null);
INSERT INTO `faultlog` VALUES ('170', '11', null, '2018-09-12 03:24:22', '1', '', '', null, null, null, null, '2018-09-12 03:24:13', '2018-09-12 03:24:13', null);
INSERT INTO `faultlog` VALUES ('171', '14', null, '2018-09-12 03:24:45', '1', '', '', null, null, null, null, '2018-09-12 03:24:35', '2018-09-12 03:24:35', null);
INSERT INTO `faultlog` VALUES ('172', '19', null, '2018-09-12 03:25:04', '1', '', '', null, null, null, null, '2018-09-12 03:24:55', '2018-09-12 03:24:55', null);
INSERT INTO `faultlog` VALUES ('173', '20', null, '2018-09-12 03:25:27', '1', '', '', null, null, null, null, '2018-09-12 03:25:18', '2018-09-12 03:25:18', null);
INSERT INTO `faultlog` VALUES ('174', '22', null, '2018-09-12 03:25:45', '1', '', '', null, null, null, null, '2018-09-12 03:25:36', '2018-09-12 03:25:36', null);
INSERT INTO `faultlog` VALUES ('175', '26', null, '2018-09-12 03:26:07', '1', '', '', null, null, null, null, '2018-09-12 03:25:57', '2018-09-12 03:25:57', null);
INSERT INTO `faultlog` VALUES ('176', '27', null, '2018-09-12 03:26:23', '1', '', '', null, null, null, null, '2018-09-12 03:26:14', '2018-09-12 03:26:14', null);
INSERT INTO `faultlog` VALUES ('177', '26', null, '2018-09-12 03:26:40', '1', '', '', null, null, null, null, '2018-09-12 03:26:32', '2018-09-12 03:26:32', null);
INSERT INTO `faultlog` VALUES ('178', '30', null, '2018-09-12 03:27:03', '1', '', '', null, null, null, null, '2018-09-12 03:26:54', '2018-09-12 03:26:54', null);
INSERT INTO `faultlog` VALUES ('179', '80', null, '2018-09-12 03:27:59', '1', '', '', null, null, null, null, '2018-09-12 03:27:50', '2018-09-12 03:27:50', null);
INSERT INTO `faultlog` VALUES ('180', '44', null, '2018-09-12 03:28:31', '1', '', '', null, null, null, null, '2018-09-12 03:28:22', '2018-09-12 03:28:22', null);
INSERT INTO `faultlog` VALUES ('181', '43', null, '2018-09-12 03:28:50', '1', '', '', null, null, null, null, '2018-09-12 03:28:41', '2018-09-12 03:28:41', null);
INSERT INTO `faultlog` VALUES ('182', '36', null, '2018-09-12 03:30:05', '1', '', '', null, null, null, null, '2018-09-12 03:29:56', '2018-09-12 03:29:56', null);
INSERT INTO `faultlog` VALUES ('183', '46', null, '2018-09-12 03:30:17', '1', '', '', null, null, null, null, '2018-09-12 03:30:08', '2018-09-12 03:30:08', null);
INSERT INTO `faultlog` VALUES ('184', '2', null, '2018-09-12 03:30:56', '1', '', '', null, null, null, null, '2018-09-12 03:30:46', '2018-09-12 03:30:46', null);
INSERT INTO `faultlog` VALUES ('185', '34', null, '2018-09-12 04:20:17', '1', '', '', null, null, null, null, '2018-09-12 04:20:07', '2018-09-12 04:20:07', null);
INSERT INTO `faultlog` VALUES ('186', '8', null, '2018-09-12 04:20:24', '1', '', '', null, null, null, null, '2018-09-12 04:20:15', '2018-09-12 04:20:15', null);
INSERT INTO `faultlog` VALUES ('187', '29', null, '2018-09-12 04:21:18', '1', '', '', null, null, null, null, '2018-09-12 04:21:09', '2018-09-12 04:21:09', null);
INSERT INTO `faultlog` VALUES ('188', '36', null, '2018-09-12 04:22:41', '1', '', '', null, null, null, null, '2018-09-12 04:22:32', '2018-09-12 04:22:32', null);
INSERT INTO `faultlog` VALUES ('189', '36', null, '2018-09-12 04:23:09', '1', '', '', null, null, null, null, '2018-09-12 04:22:59', '2018-09-12 04:22:59', null);
INSERT INTO `faultlog` VALUES ('190', '42', null, '2018-09-12 04:23:30', '1', '', '', null, null, null, null, '2018-09-12 04:23:21', '2018-09-12 04:23:21', null);
INSERT INTO `faultlog` VALUES ('191', '31', null, '2018-09-12 04:24:20', '1', '', '', null, null, null, null, '2018-09-12 04:24:11', '2018-09-12 04:24:11', null);
INSERT INTO `faultlog` VALUES ('192', '28', null, '2018-09-12 04:24:54', '1', '', '', null, null, null, null, '2018-09-12 04:24:45', '2018-09-12 04:24:45', null);
INSERT INTO `faultlog` VALUES ('193', '42', null, '2018-09-12 04:25:37', '1', '', '', null, null, null, null, '2018-09-12 04:25:27', '2018-09-12 04:25:27', null);
INSERT INTO `faultlog` VALUES ('194', '52', null, '2018-09-12 04:27:06', '1', '', '', null, null, null, null, '2018-09-12 04:26:58', '2018-09-12 04:26:58', null);
INSERT INTO `faultlog` VALUES ('195', '52', null, '2018-09-12 04:27:24', '1', '', '', null, null, null, null, '2018-09-12 04:27:15', '2018-09-12 04:27:15', null);
INSERT INTO `faultlog` VALUES ('196', '54', null, '2018-09-12 04:27:54', '1', '', '', null, null, null, null, '2018-09-12 04:27:45', '2018-09-12 04:27:45', null);
INSERT INTO `faultlog` VALUES ('197', '55', null, '2018-09-12 04:28:11', '1', '', '', null, null, null, null, '2018-09-12 04:28:02', '2018-09-12 04:28:02', null);
INSERT INTO `faultlog` VALUES ('198', '56', null, '2018-09-12 04:28:44', '1', '', '', null, null, null, null, '2018-09-12 04:28:35', '2018-09-12 04:28:35', null);
INSERT INTO `faultlog` VALUES ('199', '57', null, '2018-09-12 04:29:02', '1', '', '', null, null, null, null, '2018-09-12 04:28:53', '2018-09-12 04:28:53', null);
INSERT INTO `faultlog` VALUES ('200', '59', null, '2018-09-12 04:29:29', '1', '', '', null, null, null, null, '2018-09-12 04:29:19', '2018-09-12 04:29:19', null);
INSERT INTO `faultlog` VALUES ('201', '60', null, '2018-09-12 04:29:46', '1', '', '', null, null, null, null, '2018-09-12 04:29:37', '2018-09-12 04:29:37', null);
INSERT INTO `faultlog` VALUES ('202', '4', null, '2018-09-12 04:30:36', '1', '', '', null, null, null, null, '2018-09-12 04:30:27', '2018-09-12 04:30:27', null);
INSERT INTO `faultlog` VALUES ('203', '48', null, '2018-09-12 04:30:53', '1', '', '', null, null, null, null, '2018-09-12 04:30:44', '2018-09-12 04:30:44', null);
INSERT INTO `faultlog` VALUES ('204', '35', null, '2018-09-12 04:31:14', '1', '', '', null, null, null, null, '2018-09-12 04:31:05', '2018-09-12 04:31:05', null);
INSERT INTO `faultlog` VALUES ('205', '66', null, '2018-09-12 04:31:36', '1', '', '', null, null, null, null, '2018-09-12 04:31:27', '2018-09-12 04:31:27', null);
INSERT INTO `faultlog` VALUES ('206', '83', null, '2018-09-12 04:31:56', '1', '', '', null, null, null, null, '2018-09-12 04:31:46', '2018-09-12 04:31:46', null);
INSERT INTO `faultlog` VALUES ('207', '10', null, '2018-09-12 04:32:30', '1', '', '', null, null, null, null, '2018-09-12 04:32:21', '2018-09-12 04:32:21', null);
INSERT INTO `faultlog` VALUES ('208', '96', null, '2018-09-12 04:32:47', '1', '', '', null, null, null, null, '2018-09-12 04:32:38', '2018-09-12 04:32:38', null);
INSERT INTO `faultlog` VALUES ('209', '98', null, '2018-09-12 04:33:13', '1', '', '', null, null, null, null, '2018-09-12 04:33:04', '2018-09-12 04:33:04', null);
INSERT INTO `faultlog` VALUES ('210', '83', null, '2018-09-12 04:33:36', '1', '', '', null, null, null, null, '2018-09-12 04:33:27', '2018-09-12 04:33:27', null);
INSERT INTO `faultlog` VALUES ('211', '84', null, '2018-09-12 04:34:32', '1', '', '', null, null, null, null, '2018-09-12 04:34:23', '2018-09-12 04:34:23', null);
INSERT INTO `faultlog` VALUES ('212', '84', null, '2018-09-12 04:35:40', '1', '', '', null, null, null, null, '2018-09-12 04:35:31', '2018-09-12 04:35:31', null);
INSERT INTO `faultlog` VALUES ('213', '66', null, '2018-09-12 04:36:24', '1', '', '', null, null, null, null, '2018-09-12 04:36:15', '2018-09-12 04:36:15', null);
INSERT INTO `faultlog` VALUES ('214', '67', null, '2018-09-12 04:36:42', '1', '', '', null, null, null, null, '2018-09-12 04:36:33', '2018-09-12 04:36:33', null);
INSERT INTO `faultlog` VALUES ('215', '61', null, '2018-09-12 04:36:56', '1', '', '', null, null, null, null, '2018-09-12 04:36:47', '2018-09-12 04:36:47', null);
INSERT INTO `faultlog` VALUES ('216', '66', null, '2018-09-12 04:37:01', '1', '', '', null, null, null, null, '2018-09-12 04:36:52', '2018-09-12 04:36:52', null);
INSERT INTO `faultlog` VALUES ('217', '41', null, '2018-09-12 04:37:46', '1', '', '', null, null, null, null, '2018-09-12 04:37:36', '2018-09-12 04:37:36', null);
INSERT INTO `faultlog` VALUES ('218', '21', null, '2018-09-12 04:37:57', '1', '', '', null, null, null, null, '2018-09-12 04:37:47', '2018-09-12 04:37:47', null);
INSERT INTO `faultlog` VALUES ('219', '55', null, '2018-09-12 04:38:40', '1', '', '', null, null, null, null, '2018-09-12 04:38:31', '2018-09-12 04:38:31', null);
INSERT INTO `faultlog` VALUES ('220', '3', null, '2018-09-12 04:39:22', '1', '', '', null, null, null, null, '2018-09-12 04:39:13', '2018-09-12 04:39:13', null);
INSERT INTO `faultlog` VALUES ('221', '20', null, '2018-09-12 04:40:12', '1', '', '', null, null, null, null, '2018-09-12 04:40:03', '2018-09-12 04:40:03', null);
INSERT INTO `faultlog` VALUES ('222', '21', null, '2018-09-12 04:40:34', '1', '', '', null, null, null, null, '2018-09-12 04:40:25', '2018-09-12 04:40:25', null);
INSERT INTO `faultlog` VALUES ('223', '20', null, '2018-09-12 04:41:08', '1', '', '', null, null, null, null, '2018-09-12 04:40:58', '2018-09-12 04:40:58', null);
INSERT INTO `faultlog` VALUES ('224', '32', null, '2018-09-12 04:42:03', '1', '', '', null, null, null, null, '2018-09-12 04:41:54', '2018-09-12 04:41:54', null);
INSERT INTO `faultlog` VALUES ('225', '35', null, '2018-09-12 04:42:29', '1', '', '', null, null, null, null, '2018-09-12 04:42:19', '2018-09-12 04:42:19', null);
INSERT INTO `faultlog` VALUES ('226', '40', null, '2018-09-12 04:42:45', '1', '', '', null, null, null, null, '2018-09-12 04:42:35', '2018-09-12 04:42:35', null);
INSERT INTO `faultlog` VALUES ('227', '66', null, '2018-09-12 04:43:47', '1', '', '', null, null, null, null, '2018-09-12 04:43:38', '2018-09-12 04:43:38', null);
INSERT INTO `faultlog` VALUES ('228', '42', null, '2018-09-12 04:44:22', '1', '', '', null, null, null, null, '2018-09-12 04:44:12', '2018-09-12 04:44:12', null);
INSERT INTO `faultlog` VALUES ('229', '81', null, '2018-09-12 04:45:17', '1', '', '', null, null, null, null, '2018-09-12 04:45:08', '2018-09-12 04:45:08', null);
INSERT INTO `faultlog` VALUES ('230', '93', null, '2018-09-12 04:45:26', '1', '', '', null, null, null, null, '2018-09-12 04:45:17', '2018-09-12 04:45:17', null);
INSERT INTO `faultlog` VALUES ('231', '41', null, '2018-09-12 04:46:31', '1', '', '', null, null, null, null, '2018-09-12 04:46:22', '2018-09-12 04:46:22', null);
INSERT INTO `faultlog` VALUES ('232', '32', null, '2018-09-12 04:47:22', '1', '', '', null, null, null, null, '2018-09-12 04:47:13', '2018-09-12 04:47:13', null);
INSERT INTO `faultlog` VALUES ('233', '65', null, '2018-09-12 04:47:53', '1', '', '', null, null, null, null, '2018-09-12 04:47:43', '2018-09-12 04:47:43', null);
INSERT INTO `faultlog` VALUES ('234', '82', null, '2018-09-12 04:48:14', '1', '', '', null, null, null, null, '2018-09-12 04:48:05', '2018-09-12 04:48:05', null);
INSERT INTO `faultlog` VALUES ('235', '41', null, '2018-09-12 04:51:22', '1', '', '', null, null, null, null, '2018-09-12 04:51:12', '2018-09-12 04:51:12', null);
INSERT INTO `faultlog` VALUES ('236', '28', null, '2018-09-12 04:52:08', '1', '', '', null, null, null, null, '2018-09-12 04:51:58', '2018-09-12 04:51:58', null);
INSERT INTO `faultlog` VALUES ('237', '45', null, '2018-09-12 04:52:40', '1', '', '', null, null, null, null, '2018-09-12 04:52:30', '2018-09-12 04:52:30', null);
INSERT INTO `faultlog` VALUES ('238', '56', null, '2018-09-12 04:53:07', '1', '', '', null, null, null, null, '2018-09-12 04:52:57', '2018-09-12 04:52:57', null);
INSERT INTO `faultlog` VALUES ('239', '41', null, '2018-09-12 05:27:01', '1', '', '', null, null, null, null, '2018-09-12 05:26:51', '2018-09-12 05:26:51', null);
INSERT INTO `faultlog` VALUES ('240', '9', null, '2018-09-13 07:24:13', '1', '', '', null, null, null, null, '2018-09-13 07:24:13', '2018-09-13 07:24:13', null);

-- ----------------------------
-- Table structure for faultreport
-- ----------------------------
DROP TABLE IF EXISTS `faultreport`;
CREATE TABLE `faultreport` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `people` varchar(255) DEFAULT NULL,
  `phone` bigint(11) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `repairphone` bigint(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `faultreport_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of faultreport
-- ----------------------------

-- ----------------------------
-- Table structure for faulttype
-- ----------------------------
DROP TABLE IF EXISTS `faulttype`;
CREATE TABLE `faulttype` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `faulttype_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of faulttype
-- ----------------------------
INSERT INTO `faulttype` VALUES ('1', '卡纸', '111', '2017-08-10 00:42:36', '2017-08-10 00:42:36', null);
INSERT INTO `faulttype` VALUES ('2', '字迹异常', '222', '2017-08-10 00:42:46', '2017-08-10 00:42:46', null);
INSERT INTO `faulttype` VALUES ('3', '开关机异常', '333', '2017-08-10 00:43:00', '2017-08-10 00:43:00', null);
INSERT INTO `faulttype` VALUES ('4', '打印无反应', '444', '2017-08-10 00:43:13', '2017-08-10 00:43:13', null);
INSERT INTO `faulttype` VALUES ('5', '异响', '555', '2017-08-10 00:43:23', '2017-08-10 00:43:23', null);
INSERT INTO `faulttype` VALUES ('6', '指示灯异常', '666', '2017-08-10 00:43:35', '2017-08-10 00:43:35', null);
INSERT INTO `faulttype` VALUES ('7', '扫描异常', '777', '2017-08-10 00:43:47', '2017-08-10 00:43:47', null);
INSERT INTO `faulttype` VALUES ('8', '软件故障', '888', '2017-08-10 00:44:00', '2017-08-10 00:44:00', null);
INSERT INTO `faulttype` VALUES ('9', '其他', '999', '2017-08-10 00:44:07', '2017-08-10 00:44:07', null);

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `pid` bigint(11) DEFAULT NULL,
  `rootid` bigint(11) DEFAULT NULL,
  `name` int(11) DEFAULT NULL,
  `manager` bigint(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `group_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------

-- ----------------------------
-- Table structure for maintain
-- ----------------------------
DROP TABLE IF EXISTS `maintain`;
CREATE TABLE `maintain` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `equipmentid` bigint(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `use` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `maintain_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of maintain
-- ----------------------------

-- ----------------------------
-- Table structure for maintreport
-- ----------------------------
DROP TABLE IF EXISTS `maintreport`;
CREATE TABLE `maintreport` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `mainttype` bigint(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `leaselocation` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `maintreport_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of maintreport
-- ----------------------------

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `printerid` bigint(11) DEFAULT NULL,
  `dpaper` bigint(11) DEFAULT NULL,
  `wpaper` varchar(255) DEFAULT NULL,
  `mpaper` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `paper_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper
-- ----------------------------

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `servcustomer` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `person_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', 'ohCh0wOBiDxuzhn97WTXjA6R_vZA', '史竞成', '1', '15006200149', '001', '0', '1', '测试', '2017-07-11 09:06:54', '2017-07-11 09:18:23', null);
INSERT INTO `person` VALUES ('5', 'ohCh0wKjqA8PZt9oqHoG85xmE5yY', '李四', '1', '18888888888', '004', '0', '1', '测试测试', '2017-07-19 13:02:14', '2017-12-27 04:13:19', null);
INSERT INTO `person` VALUES ('6', 'ohCh0wFiOYdggX62ldXnw-mr3Ajc', '张跃', '1', '18012773921', '005', '0', '1', '', '2017-07-25 08:34:17', '2018-07-26 08:38:01', null);
INSERT INTO `person` VALUES ('7', 'ohCh0wEfGgfRKs065SKKIVLowG_U', '李华', '2', '18913573636', '006', '0', '1', '打印机维修主管', '2017-09-02 07:44:58', '2017-09-02 07:45:19', null);
INSERT INTO `person` VALUES ('10', 'ohCh0wE7cbctkuigsKCUaChEznXw', '卜迎祥', '1', '15050195021', '002', '0', '1', null, '2017-12-29 01:57:54', '2017-12-29 01:59:27', null);

-- ----------------------------
-- Table structure for printer
-- ----------------------------
DROP TABLE IF EXISTS `printer`;
CREATE TABLE `printer` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `serialnum` varchar(255) DEFAULT NULL,
  `drumtype` varchar(255) DEFAULT NULL,
  `locationip` varchar(255) DEFAULT NULL,
  `purtime` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `assetmanager` varchar(255) DEFAULT NULL,
  `contacttel` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `belong` bigint(11) DEFAULT NULL,
  `groupid` bigint(11) DEFAULT NULL,
  `ppbox` int(11) DEFAULT NULL,
  `ppmax` int(11) DEFAULT NULL,
  `ppnum` int(11) DEFAULT NULL,
  `inknum` int(11) DEFAULT NULL,
  `age` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `printercode` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `printer_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of printer
-- ----------------------------
INSERT INTO `printer` VALUES ('1', '桌面激光打印机', 'HP', 'HP400 M401dn', 'VNH3L00968', 'HP 80A(CF280A)', null, '2014年10月1日', 'A406', '财务部', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0001', null, '2017-08-07 07:53:52', '2017-09-05 06:20:45', null);
INSERT INTO `printer` VALUES ('2', '针式打印机', 'EPSON', 'LQ630K', 'EK9HL10050', '色带', null, null, 'A406', '财务部', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-311-0002', null, '2017-08-07 07:53:52', '2017-09-02 10:26:35', null);
INSERT INTO `printer` VALUES ('3', '传真一体机', '京瓷', 'ECOYS M2530dn', 'LXL5101684', 'TK-1133', null, null, 'A601', '事业发展中心', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-421-0003', null, '2017-08-07 07:53:52', '2017-09-02 10:26:40', null);
INSERT INTO `printer` VALUES ('4', '彩色激光打印机', '京瓷', 'FS-C5150DN', 'N8H5Z03648', 'TK580彩色墨盒', null, null, 'A601', '事业发展中心', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-112-0004', null, '2017-08-07 07:53:52', '2017-08-15 06:07:56', null);
INSERT INTO `printer` VALUES ('5', '彩色打印机', 'HP', 'HP5550', 'JPSJ94J00T', 'HP 645A(C9730-C9733)', null, '2016年7月1日', 'A601', '事业发展中心', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0005', null, '2017-08-07 07:53:52', '2017-08-15 06:08:02', null);
INSERT INTO `printer` VALUES ('6', '复印机', '京瓷', 'FS-6525MFP', 'KM04D7CB', 'TK-478', null, '2016年7月1日', 'A601', '事业发展中心', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-112-0006', null, '2017-08-07 07:53:52', '2017-08-15 06:08:07', null);
INSERT INTO `printer` VALUES ('7', '桌面激光打印机', 'HP', 'HP400 M401dn', 'VNH6J04441', 'HP 80A(CF280A)', null, '2014年10月1日', 'A601', '事业发展中心主任办公室', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0007', null, '2017-08-07 07:53:52', '2017-08-15 07:23:08', null);
INSERT INTO `printer` VALUES ('8', '桌面激光打印机', '京瓷', 'ES-6975DN', 'Q1L1600200', 'TK-453', null, null, 'A601', '事物保障中心', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0008', null, '2017-08-07 07:53:52', '2017-08-15 06:08:17', null);
INSERT INTO `printer` VALUES ('9', '复印机', '京瓷', 'KM-2560', 'QDS0702750', '京瓷 TK-678', null, '2010年9月1日', 'A602', '学术研究中心', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0009', null, '2017-08-07 07:53:52', '2017-08-15 06:08:22', null);
INSERT INTO `printer` VALUES ('10', '彩色激光打印机', 'HP', 'hp400 color m451dn', 'CNFG608388', 'HP 305A(CE410)', null, '2015年1月1日', 'A602', '学术研究中心', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-112-0010', null, '2017-08-07 07:53:52', '2017-08-15 06:08:27', null);
INSERT INTO `printer` VALUES ('11', '桌面激光打印机', 'HP', 'HP400 M401dn', 'VNH3L01187', 'HP 80A(CF280A)', null, '2014年10月1日', 'A602', '学术研究中心主任办公室', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0011', null, '2017-08-07 07:53:52', '2017-08-15 06:09:12', null);
INSERT INTO `printer` VALUES ('12', '桌面一体机', '京瓷', 'FS-1025MFP', 'NST5Y34439', 'TK-1133', null, null, 'A602', '合作交流中心', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0012', null, '2017-08-07 07:53:52', '2017-08-09 09:00:32', null);
INSERT INTO `printer` VALUES ('13', '桌面激光打印机', 'HP', 'HP2035N', 'CNC2500489', 'HP 05A(CE505A)', null, null, 'C103', '一站式中心', null, '62932091', '2', null, null, null, null, null, null, null, '0', 'SISO-111-0013', null, '2017-08-07 07:53:52', '2017-08-15 06:09:17', null);
INSERT INTO `printer` VALUES ('14', '复印一体机', '施乐', 'S2420', '192728', '富士施乐CT201911', null, null, 'C103', '学工处', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0014', null, '2017-08-07 07:53:52', '2017-08-15 06:09:22', null);
INSERT INTO `printer` VALUES ('15', '复印机', '京瓷', 'PF-220', 'QYG0600675', 'TK-458', null, null, 'B305', '图书馆', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0015', null, '2017-08-07 07:53:52', '2017-08-09 09:00:26', null);
INSERT INTO `printer` VALUES ('16', '复印机', '理光', 'MP2550B', 'M7788080085', '理光（Ricoh） MPC2550', null, null, 'B301', '图书馆采访部', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0016', null, '2017-08-07 07:53:52', '2017-08-15 06:09:27', null);
INSERT INTO `printer` VALUES ('17', '桌面打印机', 'HP', 'Laserjet1008', 'VNF4P31405', 'HP 88A(CC388A)', null, null, 'B301', '图书馆采访部', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0017', null, '2017-08-07 07:53:52', '2017-08-15 06:09:33', null);
INSERT INTO `printer` VALUES ('18', '激光桌面打印机', 'HP', 'HP2035N', 'CNC2601628', 'HP 05A(CE505A)', null, null, 'B204', '图书馆', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0018', null, '2017-08-07 07:53:52', '2017-08-15 06:09:39', null);
INSERT INTO `printer` VALUES ('19', '复印一体机', '施乐', 'S2420', '193298', '富士施乐CT201911', null, null, 'F405', '纳米', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0019', '主板坏，少配件', '2017-08-07 07:53:52', '2017-08-15 06:09:43', null);
INSERT INTO `printer` VALUES ('20', '桌面打印机', '京瓷', 'FS1110', '41910000013132', 'TK1103', null, '2012年12月1日', 'F407', '纳米', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0020', null, '2017-08-07 07:53:52', '2017-08-15 06:09:48', null);
INSERT INTO `printer` VALUES ('21', '桌面激光打印机', '京瓷', 'FS1110', '41910000013133', 'TK1103', null, '2012年12月1日', 'F401', '纳米', null, '18262008681', '2', null, null, null, null, null, null, null, '0', 'SISO-111-0021', null, '2017-08-07 07:53:52', '2017-08-15 06:27:35', null);
INSERT INTO `printer` VALUES ('22', '复印一体机', '施乐', 'S2420', '180387', '富士施乐CT201911', null, null, 'F408', '纳米', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0022', null, '2017-08-07 07:53:52', '2017-08-15 06:27:39', null);
INSERT INTO `printer` VALUES ('23', '复印一体机', '施乐', 'S2420', '193297', '富士施乐CT201911', null, null, 'F412', '纳米', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0023', null, '2017-08-07 07:53:52', '2017-08-15 06:27:47', null);
INSERT INTO `printer` VALUES ('24', '桌面一体机传真', 'HP', '1216nfhmFP', 'CNG6C74L3W', 'HP 88A(CC388A)', null, null, 'F509', '信息工程院', null, '2507', '2', null, null, null, null, null, null, null, '0', 'SISO-421-0024', null, '2017-08-07 07:53:52', '2017-08-15 06:27:51', null);
INSERT INTO `printer` VALUES ('25', '桌面一体机', '利盟', 'LEXMarkx204n', '5922W09', '利盟204', null, null, 'F515', '信息工程院', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0025', null, '2017-08-07 07:53:52', '2017-08-15 06:27:56', null);
INSERT INTO `printer` VALUES ('26', '复印一体机', '京瓷', 'KM-2560', 'QDS0702710', '京瓷 TK-678', null, '2010年9月1日', 'F506', '信息工程院', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0026', null, '2017-08-07 07:53:52', '2017-08-15 06:28:00', null);
INSERT INTO `printer` VALUES ('27', '复印一体机', '京瓷', 'KM-2560', 'QDV0707094', '京瓷 TK-678', null, '2010年9月1日', 'F506', '信息工程院', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0027', null, '2017-08-07 07:53:52', '2017-08-15 06:28:03', null);
INSERT INTO `printer` VALUES ('28', '复印一体机', '京瓷', '300i', 'NAL2802972', '京瓷 TK-678', null, '2012年12月1日', 'G210', '商学院', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0028', null, '2017-08-07 07:53:52', '2017-08-15 06:28:08', null);
INSERT INTO `printer` VALUES ('29', '桌面彩色一体机', 'HP', 'CM1415fncolorMFP', 'CNJ607Q05Q', 'HP 128A(CE320A)', null, null, 'G210', '商学院', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-122-0029', null, '2017-08-07 07:53:52', '2017-08-15 06:28:12', null);
INSERT INTO `printer` VALUES ('30', '桌面激光一体机', 'HP', 'M1136MFP', 'CNJ8J8P5XP', 'HP 88A(CC388A)', null, null, 'G210', '商学院', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0030', null, '2017-08-07 07:53:52', '2017-08-15 06:28:16', null);
INSERT INTO `printer` VALUES ('31', '复印机', '京瓷', '300i', 'NAM2902596', '京瓷 TK-678', null, '2012年12月1日', 'G109', '商学院', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0031', null, '2017-08-07 07:53:52', '2017-08-15 06:24:34', null);
INSERT INTO `printer` VALUES ('32', '桌面激光打印机', '京瓷', 'FS1110', '学校编号：41910000013130', 'TK1103', null, '2012年12月1日', 'G201', '商学院', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0032', null, '2017-08-07 07:53:52', '2017-08-15 06:24:39', null);
INSERT INTO `printer` VALUES ('33', '桌面一体传真机', 'HP', '1216NfhMFP', 'CNG6C79J91', 'HP 88A(CC388A)', null, null, 'G210', '商学院', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-421-0033', null, '2017-08-07 07:53:52', '2017-08-15 06:26:53', null);
INSERT INTO `printer` VALUES ('34', '桌面一体传真机', '联想', 'M7650DNF', 'LP03639627', '联想LT2641 ', null, '2014年1月1日', 'G107', '商学院', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-421-0034', null, '2017-08-07 07:53:52', '2017-08-15 06:26:58', null);
INSERT INTO `printer` VALUES ('35', '桌面激光打印机', 'HP', 'HP400 M401dn', 'VNH4CD1813', 'HP 80A(CF280A)', null, '2014年10月1日', 'G107', '商学院', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0035', null, '2017-08-07 07:53:52', '2017-08-15 06:27:03', null);
INSERT INTO `printer` VALUES ('36', '复印机', '京瓷', 'KM-2560', 'QDV0706882', '京瓷 TK-678', null, '2010年9月1日', 'G109', '商学院', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0036', null, '2017-08-07 07:53:52', '2017-08-15 06:27:08', null);
INSERT INTO `printer` VALUES ('37', '桌面激光打印机', 'HP', 'HPLaserJet2055d', 'CNC3846290', 'HP 05A(CE505A)', null, null, 'G109', '商学院', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0037', null, '2017-08-07 07:53:52', '2017-08-15 06:27:12', null);
INSERT INTO `printer` VALUES ('38', '扫描一体机', 'HP', 'M1136MFP', 'CNJ8J8P724', 'HP 88A(CC388A)', null, null, 'G109', '商学院', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0038', null, '2017-08-07 07:53:52', '2017-08-15 06:27:17', null);
INSERT INTO `printer` VALUES ('39', '激光打印机', 'HP', 'P2015d', 'CNCJF56910', 'HP 53A(Q7553A)', null, null, 'H110', '人文艺术系', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0039', null, '2017-08-07 07:53:52', '2017-08-15 06:27:21', null);
INSERT INTO `printer` VALUES ('40', '激光打印机', 'HP', 'HP400 M401dn', 'VNH3L021218', 'HP 80A(CF280A)', null, '2014年10月1日', 'H108', '人文艺术系', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0040', null, '2017-08-07 07:53:52', '2017-08-15 06:27:26', null);
INSERT INTO `printer` VALUES ('41', '复印一体机', '京瓷', 'KM-2560', 'QNV0707043', '京瓷 TK-678', null, '2010年9月1日', 'H211', '人文艺术系', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0041', null, '2017-08-07 07:53:52', '2017-08-15 06:23:47', null);
INSERT INTO `printer` VALUES ('42', '桌面打印机', '京瓷', 'FS-1060DN', 'NSF5Z31776', 'TK-1113', null, '2016年7月1日', 'H311', '人文艺术系', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0042', null, '2017-08-07 07:53:52', '2017-08-15 06:23:51', null);
INSERT INTO `printer` VALUES ('43', '复印一体机', '京瓷', 'KM-2560', 'QDV0707003', '京瓷 TK-678', null, '2010年9月1日', 'H311', '人文艺术系', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0043', null, '2017-08-07 07:53:52', '2017-08-15 06:23:56', null);
INSERT INTO `printer` VALUES ('44', '传真一体机', '联想', 'M7650DNF', 'LP03639630', '联想LT2641 ', null, '2014年1月1日', 'H311', '人文艺术系', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-421-0044', null, '2017-08-07 07:53:52', '2017-08-15 06:24:00', null);
INSERT INTO `printer` VALUES ('45', '复印机', '理光', null, null, null, null, null, 'H108', '仓库', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0045', '报废', '2017-08-07 07:53:52', '2017-08-15 06:24:05', null);
INSERT INTO `printer` VALUES ('46', '传真打印一体机', '佳能', 'MF4370DNG', 'EKT06149', '佳能FX9', null, null, 'H106', '人文艺术系', null, '2908', '2', null, null, null, null, null, null, null, '0', 'SISO-421-0046', null, '2017-08-07 07:53:52', '2017-08-15 06:24:09', null);
INSERT INTO `printer` VALUES ('47', '彩色打印机', '佳能', 'LBP5960', 'C217LRQA000886', 'CRG-302', null, null, 'H106', '人文艺术系', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0047', null, '2017-08-07 07:53:52', '2017-08-15 06:24:13', null);
INSERT INTO `printer` VALUES ('48', '喷墨彩色打印机', 'HP', '3548 COPYPHOTO', 'CN55933DHB', 'hp678彩色墨盒', null, null, 'H105', '人文艺术系', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-212-0048', null, '2017-08-07 07:53:52', '2017-08-15 06:24:18', null);
INSERT INTO `printer` VALUES ('49', '针式打印机', 'EPSON', 'LQ630K', 'U9YH024146', '色带', null, null, 'H105', '人文艺术系', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-311-0049', null, '2017-08-07 07:53:52', '2017-08-15 06:24:22', null);
INSERT INTO `printer` VALUES ('50', '喷墨彩色打印机', 'HP', 'Deskjet1050', 'CN19F3D4R6', 'HP 802系列 彩', null, null, 'H103', '人文艺术系', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-212-0050', null, '2017-08-07 07:53:52', '2017-08-15 06:24:27', null);
INSERT INTO `printer` VALUES ('51', '喷墨彩色打印机', 'HP', 'colorprom452nw', 'VNC3G01280', 'HP 305A(CF410)', null, null, 'A1101', '谭总办公室', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-212-0051', null, '2017-08-07 07:53:52', '2017-08-15 06:23:39', null);
INSERT INTO `printer` VALUES ('52', '激光打印机', '三星', 'prom3325ND', 'CNM1JC9001143CD54YHCQ0392', ' MLT-R204', null, null, 'A1101', '财务部', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0052', null, '2017-08-07 07:53:52', '2017-08-15 06:23:34', null);
INSERT INTO `printer` VALUES ('53', '针式打印机', 'AISCNO', 'SK860', '771B15181539', '色带', null, null, 'A1101', '财务部', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-311-0053', null, '2017-08-07 07:53:52', '2017-08-15 06:23:29', null);
INSERT INTO `printer` VALUES ('54', '激光打印机', '三星', 'prom3325ND', 'CNM1JC9001143CD54YHCQ0382', ' MLT-R204', null, null, 'A1101', '大厅', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0054', null, '2017-08-07 07:53:52', '2017-08-15 06:23:25', null);
INSERT INTO `printer` VALUES ('55', '激光打印机', '三星', 'prom3325ND', 'CNM1JC9001143CD54YHCQ0387', ' MLT-R204', null, null, 'A1102', '大厅', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0055', null, '2017-08-07 07:53:52', '2017-08-16 09:00:48', null);
INSERT INTO `printer` VALUES ('56', '复印一体机', '京瓷', '300i', 'NAM2501800', '京瓷 TK-678', null, '2012年12月1日', 'A1101', '大厅', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0056', null, '2017-08-07 07:53:52', '2017-08-15 06:23:17', null);
INSERT INTO `printer` VALUES ('57', '复印机', '京瓷', 'FS-6525MFP', 'L2W6447456', 'TK-478', null, '2016年7月1日', 'C104', '招生就业指导中心', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0057', null, '2017-08-07 07:53:52', '2017-08-15 06:23:12', null);
INSERT INTO `printer` VALUES ('58', '传真机', '理光', 'FAX1190L', 'A5618560505', '理光FAX-1190L', null, null, 'C104', '招生就业指导中心', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-400-0058', null, '2017-08-07 07:53:52', '2017-08-15 06:23:08', null);
INSERT INTO `printer` VALUES ('59', '桌面一体机', 'HP', 'M1522nf', 'CNG8B8668V', 'HP 36A(CB436A)', null, null, 'C105', '团委', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0059', null, '2017-08-07 07:53:52', '2017-08-15 06:23:03', null);
INSERT INTO `printer` VALUES ('60', '桌面一体机', 'HP', 'CM1415fncolorMFP', 'CNJ6D7Q05L', 'HP 128A(CE320A)', null, null, '5号宿舍', '医务室', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0060', null, '2017-08-07 07:53:52', '2017-08-15 06:22:58', null);
INSERT INTO `printer` VALUES ('61', '针式打印机', '中盈', 'NX-680', '680031505100318', '色带', null, null, 'A1101（暂时在A702）', '外包公司', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-311-0061', null, '2017-08-07 07:53:52', '2018-06-25 07:38:48', null);
INSERT INTO `printer` VALUES ('62', '复印机', '联想', 'M7650DNF', 'LP03638441', '联想LT2641 ', null, '2014年1月1日', '宾馆', '外包公司', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0062', null, '2017-08-07 07:53:52', '2017-08-15 06:22:28', null);
INSERT INTO `printer` VALUES ('63', '激光打印机', 'HP', 'HP2035N', 'CNC6800794', 'HP 05A(CE505A)', null, null, 'A701', '教学服务中心', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0063', null, '2017-08-07 07:53:52', '2017-08-15 06:22:33', null);
INSERT INTO `printer` VALUES ('64', '扫描一体机', '京瓷', 'KM-2560', 'QDS0702547', '京瓷 TK-678', null, '2010年9月1日', 'A701', '教学服务中心', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0064', null, '2017-08-07 07:53:52', '2017-08-15 06:22:37', null);
INSERT INTO `printer` VALUES ('65', '桌面打印机', '京瓷', 'FS1110', 'NCF2521094', 'TK1103', null, '2012年12月1日', 'A701', '教学服务中心', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0065', null, '2017-08-07 07:53:52', '2017-08-15 06:22:42', null);
INSERT INTO `printer` VALUES ('66', '桌面打印机', 'HP', 'HP400 M401dn', 'VNH3L01184', 'HP 80A(CF280A)', null, '2014年10月1日', 'A701', '教学服务中心', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0066', null, '2017-08-07 07:53:52', '2017-08-15 06:22:46', null);
INSERT INTO `printer` VALUES ('67', '桌面打印机', 'HP', 'HP400 M401dn', 'VNH4C01198', 'HP 80A(CF280A)', null, '2014年10月1日', 'A702', '继续教育学院', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0067', null, '2017-08-07 07:53:52', '2017-08-15 06:22:50', null);
INSERT INTO `printer` VALUES ('68', '桌面一体机', '三星', 'SCX4521HS', '06XEB8KFAE04ZJH', '三星SCX-4725', null, null, 'A702', '继续教育学院', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0068', null, '2017-08-07 07:53:52', '2017-08-15 06:21:58', null);
INSERT INTO `printer` VALUES ('69', '激光打印机', '三星', 'prom3325ND', 'C楼大厅', ' MLT-R204', null, null, '打印鸡', 'C楼大厅', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0069', null, '2017-08-07 07:53:52', '2017-08-15 06:21:53', '2018-03-20 07:38:20');
INSERT INTO `printer` VALUES ('70', '激光打印机', 'HP', 'P2055d', '未实盘', 'HP 05A(CE505A)', null, null, 'A901', '院长室', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0070', null, '2017-08-07 07:53:52', '2017-09-04 07:56:11', null);
INSERT INTO `printer` VALUES ('71', '激光打印机', '理光', 'MP2012LD', 'L5417501765', 'MP1610', null, null, 'A1102', '外包公司', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0071', null, '2017-08-07 07:53:52', '2017-08-15 06:11:02', null);
INSERT INTO `printer` VALUES ('72', '传真机', '松下', 'KX-FM380CN', '41910000005746', null, null, null, 'A401', '院长室', null, null, '6', null, null, null, null, null, null, null, '0', 'SISO-400-0072', null, '2017-08-07 07:53:52', '2017-08-07 07:53:52', '2017-08-09 09:01:00');
INSERT INTO `printer` VALUES ('73', '桌面打印机', '京瓷', 'FS-2020D', '41910000013141', 'TK-343', null, null, 'A505', '档案室', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0073', null, '2017-08-07 07:53:52', '2017-08-15 06:10:57', null);
INSERT INTO `printer` VALUES ('74', '桌面打印机', 'HP', 'HP2035N', 'CNC6800798', 'HP 05A(CE505A)', null, null, 'A405', '院长室', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0074', null, '2017-08-07 07:53:52', '2017-08-15 06:10:48', null);
INSERT INTO `printer` VALUES ('75', '速印机', '理光', 'JP785C', '41910000000129', null, null, null, 'A701', '教学服务中心', null, null, '6', null, null, null, null, null, null, null, '0', 'SISO-0-0075', null, '2017-08-07 07:53:52', '2017-08-07 07:53:52', '2017-08-09 09:01:08');
INSERT INTO `printer` VALUES ('76', '复印一体机', '施乐', 'S2420', '193279', '富士施乐CT201911', null, null, 'A505', '档案室', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0076', null, '2017-08-07 07:53:52', '2017-08-15 06:10:44', null);
INSERT INTO `printer` VALUES ('77', '激光打印机', 'HP', '2035', '未实盘', 'HP 05A(CE505A)', null, null, 'A901', '院长室', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0077', null, '2017-08-07 07:53:52', '2017-09-04 07:54:13', null);
INSERT INTO `printer` VALUES ('78', '激光打印机', 'HP', 'HP400 M401dn', '未实盘', 'HP 80A(CF280A)', null, null, 'A901', '院长室', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0078', null, '2017-08-07 07:53:52', '2017-08-15 06:10:30', null);
INSERT INTO `printer` VALUES ('79', '激光打印机', 'HP', '2035', '未实盘', 'HP 05A(CE505A)', null, null, 'A902', '院长室', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0079', null, '2017-08-07 07:53:52', '2017-09-04 07:54:22', null);
INSERT INTO `printer` VALUES ('80', '复印一体机', '施乐', 'S2420', '193223', '富士施乐CT201911', null, null, 'C504', '学生发展中心', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0080', null, '2017-08-07 07:53:52', '2017-08-15 06:10:19', null);
INSERT INTO `printer` VALUES ('81', '桌面打印机', '京瓷', 'FS-1060DN', '22030100027810', 'TK-1113', null, null, 'H108', '人文艺术系', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0081', null, '2017-08-07 07:53:52', '2017-08-15 06:10:14', null);
INSERT INTO `printer` VALUES ('82', '桌面打印机', '京瓷', 'FS1110', '41910000013134', 'TK-1103', null, null, 'F408', '纳米', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0082', null, '2017-08-07 07:53:52', '2017-08-15 06:10:09', null);
INSERT INTO `printer` VALUES ('83', '复印一体机', '理光', 'MP2550B', 'M6491900136', '理光（Ricoh） MPC2550', null, null, 'D101', '保安处', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-121-0083', null, '2017-08-07 07:53:52', '2017-08-15 06:10:00', null);
INSERT INTO `printer` VALUES ('84', '激光打印机', 'HP', 'HP400 M401dn', 'VNH6J05310', 'HP 80A(CF280A)', null, null, 'D102', '保安处', null, null, '2', null, null, null, null, null, null, null, '0', 'SISO-111-0084', null, '2017-08-07 07:53:52', '2017-08-15 06:09:55', null);
INSERT INTO `printer` VALUES ('85', '复印机', '京瓷', '4028idn', '2016994987', 'TK-6108', null, null, 'A702', null, null, null, '2', null, null, null, null, null, null, '2017-10-23 16:00:00', '0', null, null, '2017-10-24 01:53:29', '2017-10-24 01:53:29', '2017-12-14 08:36:43');
INSERT INTO `printer` VALUES ('86', '打印机', '京瓷', '2135', '22030100030029', 'TK-173', null, null, 'H401', null, null, null, null, null, null, null, null, null, null, '2017-10-23 16:00:00', '0', null, null, '2017-10-24 01:55:03', '2017-10-24 01:56:22', '2017-12-14 08:36:46');
INSERT INTO `printer` VALUES ('87', '打印机', '京瓷', '2135', null, 'TK-173', null, null, 'H311', null, null, null, null, null, null, null, null, null, null, '2017-10-23 16:00:00', '0', null, null, '2017-10-24 01:56:55', '2017-10-24 01:57:06', '2017-12-14 08:36:06');
INSERT INTO `printer` VALUES ('88', '一体机', '京瓷', '6525', 'xxxxxxxxxx', 'TK678', null, null, '创客汇104', null, null, null, null, null, null, null, null, null, null, '2017-10-23 16:00:00', '0', null, null, '2017-10-24 06:27:25', '2017-10-24 06:27:25', '2017-12-14 08:36:12');
INSERT INTO `printer` VALUES ('89', '打印机', '京瓷', 'p2135dn', '22030100030027（资产）', 'TK173', null, '2017年10月', 'A702', '国际学院', '梅倩', null, '2', null, null, null, null, null, null, '2017-12-13 16:00:00', '0', 'SISO-111-0082', null, '2017-12-14 08:35:21', '2018-05-16 01:15:06', null);
INSERT INTO `printer` VALUES ('90', '打印机', '京瓷', 'p2135dn', '22030100030028（资产）', 'TK173', '', '2017年10月', 'H311', '人文艺术学院', '张宏波', null, '2', null, null, null, null, null, null, '2017-12-13 16:00:00', '0', 'SISO-111-0083', null, '2017-12-14 08:39:20', '2018-05-16 01:15:16', null);
INSERT INTO `printer` VALUES ('91', '打印机', '京瓷', 'p2135dn', '22030100030029（资产）', 'TK173', '', '2017年10月', 'H310', '人文艺术学院', '李鹏举', null, '2', null, null, null, null, null, null, '2017-12-13 16:00:00', '0', 'SISO-111-0084', null, '2017-12-14 08:40:33', '2018-05-16 01:15:30', null);
INSERT INTO `printer` VALUES ('92', '打印机', '京瓷', 'p2135dn', '22030100030030（资产）', 'TK173', '', '2017年10月', 'H310', '人文艺术学院', '李鹏举', null, '2', null, null, null, null, null, null, '2017-12-13 16:00:00', '0', null, null, '2017-12-14 08:41:17', '2017-12-14 08:41:17', '2018-03-20 07:34:55');
INSERT INTO `printer` VALUES ('93', '打印机', '京瓷', 'p2135dn', '22030100030031（资产）', 'TK173', '', '2017年10月', 'H310', '人文艺术学院', '李鹏举', null, '2', null, null, null, null, null, null, '2017-12-13 16:00:00', '0', 'SISO-111-0085', null, '2017-12-14 08:41:38', '2018-05-16 01:15:40', null);
INSERT INTO `printer` VALUES ('94', '一体机', '京瓷', 'M4028idn', '22030100030821（资产）', 'TK6108', '', '2017年10月', 'A602', '学术研究中心', '丁淑彦', null, '2', null, null, null, null, null, null, '2017-12-13 16:00:00', '0', null, null, '2017-12-14 08:43:53', '2017-12-14 08:45:09', '2018-03-20 07:34:38');
INSERT INTO `printer` VALUES ('95', '一体机', '京瓷', 'M4028idn', '22030100030822（资产）', 'TK6108', '', '2017年10月', 'C105', '学生发展中心', '鲁石', null, '2', null, null, null, null, null, null, '2017-12-13 16:00:00', '0', 'SISO-121-0086', null, '2017-12-14 08:45:00', '2018-05-16 01:16:08', null);
INSERT INTO `printer` VALUES ('96', '一体机', '京瓷', 'M4028idn', '22030100030823（资产）', 'TK6108', '', '2017年10月', 'A702', '国际学院', '陈红玉', null, '2', null, null, null, null, null, null, '2017-12-13 16:00:00', '0', 'SISO-121-0087', null, '2017-12-14 08:43:53', '2018-05-16 01:16:21', null);
INSERT INTO `printer` VALUES ('97', '一体机', '京瓷', 'M4028idn', '22030100031782（资产）', 'TK6108', '', '2017年10月', 'A506', '人文艺术学院', '廖珊', null, '2', null, null, null, null, null, null, '2017-12-13 16:00:00', '0', 'SISO-121-0088', null, '2017-12-14 08:43:53', '2018-05-16 01:16:30', null);
INSERT INTO `printer` VALUES ('98', '一体机', '京瓷', 'M4028idn', '22030100030821（资产）', 'TK6108', '', '2017年10月', 'A602', '学术研究中心', '丁淑彦', null, '2', null, null, null, null, null, null, '2017-12-13 16:00:00', '0', 'SISO-121-0089', null, '2017-12-14 08:43:53', '2018-05-16 01:16:43', null);
INSERT INTO `printer` VALUES ('99', '复印机', '京瓷', 'FS-6525MFP', '', 'TK-478', null, '2016年7月1日', '创客汇104', '', null, null, null, null, null, null, null, null, null, '2018-05-15 16:00:00', '0', 'SISO-121-0090', null, '2017-08-07 07:53:52', '2018-05-16 01:19:19', null);
INSERT INTO `printer` VALUES ('100', '黑白一体机', '京瓷', 'Ecosys M4132idn', 'EZX008219786', 'TK-6128', '', '2018.9', 'G201', null, null, null, '10', null, null, null, null, null, null, '2018-10-08 16:00:00', '0', 'SISO-111-0091', null, '2018-10-09 07:46:17', '2018-10-09 07:57:18', null);
INSERT INTO `printer` VALUES ('101', '黑白一体机', '京瓷', 'Ecosys M4132idn', 'EZX008219681', 'TK-6128', '', '2018.9', 'G210', null, null, null, '10', null, null, null, null, null, null, '2018-10-08 16:00:00', '0', 'SISO-121-0092', null, '2018-10-09 07:46:44', '2018-10-09 07:57:54', null);
INSERT INTO `printer` VALUES ('102', '黑白一体机', '京瓷', 'Ecosys M4132idn', 'EZX008219697', 'TK-6128', '', '2018.9', 'G110', null, null, null, '10', null, null, null, null, null, null, '2018-10-08 16:00:00', '0', 'SISO-121-0093', null, '2018-10-09 07:47:05', '2018-10-09 07:58:06', null);
INSERT INTO `printer` VALUES ('103', '黑白一体机', '京瓷', 'Ecosys M4132idn', 'EZX008219696', 'TK-6128', '', '2018.9', 'F306', null, null, null, '10', null, null, null, null, null, null, '2018-10-08 16:00:00', '0', 'SISO-121-0094', null, '2018-10-09 07:47:56', '2018-10-09 07:58:15', null);
INSERT INTO `printer` VALUES ('104', '复印一体机', '京瓷', 'Ecosys M4132idn', 'EZX008431641', 'TK6128', null, '2018-11', 'A902', null, null, null, null, null, null, null, null, null, null, '2018-11-21 16:00:00', '0', 'SISO-121-0095', null, '2018-11-22 00:56:32', '2018-11-22 00:57:27', null);
INSERT INTO `printer` VALUES ('105', '打印机', '京瓷', 'Ecosys 1025mfp', 'EZX', 'TK1123', null, '2018-11', 'C203', null, null, null, null, null, null, null, null, null, null, '2018-11-21 16:00:00', '0', 'SISO-111-0096', null, '2018-11-22 00:56:32', '2018-11-29 03:12:12', null);

-- ----------------------------
-- Table structure for printertype
-- ----------------------------
DROP TABLE IF EXISTS `printertype`;
CREATE TABLE `printertype` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `suppliercontact` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `printertype_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of printertype
-- ----------------------------

-- ----------------------------
-- Table structure for represult
-- ----------------------------
DROP TABLE IF EXISTS `represult`;
CREATE TABLE `represult` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `represult_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of represult
-- ----------------------------
INSERT INTO `represult` VALUES ('1', '完成', '111', '2017-07-06 02:15:36', '2017-07-06 02:15:36', null);
INSERT INTO `represult` VALUES ('2', '定购配件中', '222', '2017-07-06 02:15:47', '2017-07-06 02:15:47', null);
INSERT INTO `represult` VALUES ('3', '使用备机中', '333', '2017-07-06 02:15:59', '2017-07-06 02:16:04', null);
INSERT INTO `represult` VALUES ('4', '维修中', '444', '2017-07-06 02:15:59', '2017-07-06 02:16:21', null);

-- ----------------------------
-- Table structure for supplyreport
-- ----------------------------
DROP TABLE IF EXISTS `supplyreport`;
CREATE TABLE `supplyreport` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `supplytype` bigint(11) DEFAULT NULL,
  `supplynum` bigint(11) DEFAULT NULL,
  `leaselocation` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `supplyreport_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplyreport
-- ----------------------------

-- ----------------------------
-- Table structure for supplytype
-- ----------------------------
DROP TABLE IF EXISTS `supplytype`;
CREATE TABLE `supplytype` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `supplytype_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplytype
-- ----------------------------
INSERT INTO `supplytype` VALUES ('1', '缺墨', '111', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null);
INSERT INTO `supplytype` VALUES ('2', '缺粉', '222', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null);

-- ----------------------------
-- Table structure for supresult
-- ----------------------------
DROP TABLE IF EXISTS `supresult`;
CREATE TABLE `supresult` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `supresult_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supresult
-- ----------------------------
INSERT INTO `supresult` VALUES ('1', '完成', '111', '2017-07-06 02:16:53', '2017-07-06 02:16:53', null);
INSERT INTO `supresult` VALUES ('2', '定购耗材中', '222', '2017-07-06 02:17:04', '2017-07-06 02:17:04', null);
INSERT INTO `supresult` VALUES ('3', '配送中', '333', '2017-07-06 02:17:12', '2017-07-06 02:17:12', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
