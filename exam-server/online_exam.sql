/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : online_exam

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 08/05/2023 16:00:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminId` int NOT NULL AUTO_INCREMENT COMMENT 'ID号',
  `adminName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `tel` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '电话号码',
  `email` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '电子邮箱',
  `pwd` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '密码',
  `cardId` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '身份证号',
  `role` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '角色(0管理员，1教师，2学生)',
  PRIMARY KEY (`adminId`) USING BTREE,
  INDEX `sex`(`sex`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9992 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '管理员信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1001, '超级管理员', '男', '18348243343', '3047306460@qq.com', '123456', '111111111111', '0');

-- ----------------------------
-- Table structure for exam_manage
-- ----------------------------
DROP TABLE IF EXISTS `exam_manage`;
CREATE TABLE `exam_manage`  (
  `examCode` int NOT NULL AUTO_INCREMENT COMMENT '考试编号',
  `description` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '该次考试介绍',
  `source` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '课程名称',
  `paperId` int NULL DEFAULT NULL COMMENT '试卷编号',
  `examDate` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '考试日期',
  `totalTime` int NULL DEFAULT NULL COMMENT '持续时长',
  `grade` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '年级',
  `term` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '学期',
  `major` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '专业',
  `institute` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '学院',
  `totalScore` int NULL DEFAULT NULL COMMENT '总分',
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '考试类型',
  `tips` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '考生须知',
  PRIMARY KEY (`examCode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20190019 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '考试管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_manage
-- ----------------------------
INSERT INTO `exam_manage` VALUES (20190022, NULL, '机械设计', 1002, '2023-05-02', 90, '2019', NULL, '机械工程', '国际学院', NULL, '期末', NULL);

-- ----------------------------
-- Table structure for fill_question
-- ----------------------------
DROP TABLE IF EXISTS `fill_question`;
CREATE TABLE `fill_question`  (
  `questionId` int NOT NULL AUTO_INCREMENT COMMENT '试题编号',
  `subject` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '考试科目',
  `question` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '试题内容',
  `answer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '正确答案',
  `analysis` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '题目解析',
  `score` int NULL DEFAULT 2 COMMENT '分数',
  `level` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '难度等级',
  `section` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '所属章节',
  PRIMARY KEY (`questionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10030 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '填空题题库' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fill_question
-- ----------------------------
INSERT INTO `fill_question` VALUES (10000, '计算机网络', '从计算机网络系统组成的角度看，计算机网络可以分为()和()', '通信子网资源子网', NULL, 2, '3', NULL);
INSERT INTO `fill_question` VALUES (10001, '计算机网络', '收发电子邮件，属于ISO/OSI RM中 ()层的功能。', '应用', NULL, 2, '1', NULL);
INSERT INTO `fill_question` VALUES (10002, '计算机网络', '在TCP/IP层次模型中与OSI参考模型第四层相对应的主要协议有()和(),其中后者提供无连接的不可靠传输服', 'TCP（传输控制协议） UDP（用户数据报协议） ', NULL, 2, '2', NULL);
INSERT INTO `fill_question` VALUES (10003, '计算机网络', '计算机网络中常用的三种有线媒体是 (),()和 ()', '同轴电缆.双绞线 光纤', NULL, 2, '1', NULL);
INSERT INTO `fill_question` VALUES (10004, '计算机网络', '国内最早的四大网络包括原邮电部的ChinaNet. 原电子部的ChinaGBN. 教育部的()和中科院的CSTnet', 'CERnet (或中国教育科研网)', NULL, 2, '4', NULL);
INSERT INTO `fill_question` VALUES (10005, '计算机网络', '复盖一个国家，地区或几个洲的计算机网络称为()，在同一建筑或复盖几公里内范围的网络称为()，而介于两者之间的是()', ' 广域网       局域网     城域网', NULL, 2, '1', NULL);
INSERT INTO `fill_question` VALUES (10006, '计算机网络', 'Outlook等常用电子邮件软件接收邮件使用的协议是(),发送邮件时使用的协议是()', 'POP3    SMTP    ', NULL, 2, '1', NULL);
INSERT INTO `fill_question` VALUES (10007, '计算机网络', '通信系统中，称调制前的电信号为()信号，调制后的信号为调制信号', '基带', NULL, 2, '1', NULL);
INSERT INTO `fill_question` VALUES (10008, '计算机网络', '按照IPV4标准,IP地址205.3.127.13属于()类地址', 'C', NULL, 2, '1', NULL);
INSERT INTO `fill_question` VALUES (10009, '计算机网络', '计算机网络采用()技术，而传统电话网络则采用()技术', '分组交换电路交换', NULL, 2, '1', NULL);
INSERT INTO `fill_question` VALUES (10010, '计算机网络', '计算机内传输的信号是()，而公用电话系统的传输系统只能传输()', '数字信号模拟信号', NULL, 2, '1', NULL);
INSERT INTO `fill_question` VALUES (10011, '计算机网络', '通信系统中，称调制前的电信号为()，调制后的信号叫()。', '基带信号调制信号', NULL, 2, '1', NULL);
INSERT INTO `fill_question` VALUES (10012, '计算机网络', 'IP地址分()和()两个部分', '网络号主机号', NULL, 2, '1', NULL);
INSERT INTO `fill_question` VALUES (10013, '计算机网络', ' IP地址协议作网间网中()层协议，提供无连接的数据报传输机制，IP数据报也分为()和()两个部分', '网络报头数据区', NULL, 2, '2', NULL);
INSERT INTO `fill_question` VALUES (10014, '计算机网络', '()是一个简单的远程终端协议。', 'TELNET', NULL, 2, '1', NULL);
INSERT INTO `fill_question` VALUES (10015, '计算机网络', '在同一个系统内，相邻层之间交换信息的连接点称之为()，而低层模块向高层提供功能性的支持称之为()。', '接口服务', NULL, 2, '1', NULL);
INSERT INTO `fill_question` VALUES (10016, '计算机网络', 'Internet广泛使用的电子邮件传送协议是()', 'SMTP', NULL, 2, '1', NULL);
INSERT INTO `fill_question` VALUES (10017, '计算机网络', '按交换方式来分类，计算机网络可以分为电路交换网，  报文交换网  和()三种', '分组交换网', NULL, 2, '3', NULL);
INSERT INTO `fill_question` VALUES (10018, '计算机网络', 'Intranet分层结构包括网络、(),应用三个层次。', '服务', NULL, 2, '1', NULL);
INSERT INTO `fill_question` VALUES (10019, '计算机网络', 'WWW上的每一个网页都有一个独立的地址，这些地址称为  ()', '统一资源定位器/URL ', NULL, 2, '2', NULL);
INSERT INTO `fill_question` VALUES (10020, '计算机网络', '分组交换网中，附加信息用来在网络中进行路由选择、() 和流量控制', '差错纠正  ', NULL, 2, '4', NULL);
INSERT INTO `fill_question` VALUES (10021, '计算机网络', '根据IEEE802模型的标准将数据链路层划分为LLC子层和 ()子层。', ' MAC ', NULL, 2, '3', NULL);
INSERT INTO `fill_question` VALUES (10022, '计算机网络', '据交换的路由信息的不同，路由算法可以分为两大类：  ()  和链路状态算法', '距离向量算法', NULL, 2, '3', NULL);
INSERT INTO `fill_question` VALUES (10023, '计算机网络', '假定某信道受奈氏准则限制的最高码元速率为2000码元/秒。如果采用振幅调制，把码元的振幅划分为16个不同等级来传送，那么可以获得的数据率为 () b/s。', '80000 ', NULL, 2, '5', NULL);
INSERT INTO `fill_question` VALUES (10024, '计算机网络', '交换型以太网系统中的 ()  ，以其为核心联接站点或者网段，端口之间帧的输入和输出已不再受到CSMA/CD媒体访问控制协议的约束。', '以太网交换器 ', NULL, 2, '5', NULL);
INSERT INTO `fill_question` VALUES (10025, '计算机网络', '局域网络参考模型是以 ()标准为基础的', 'IEEE802', NULL, 2, '5', NULL);
INSERT INTO `fill_question` VALUES (10026, '计算机网络', '路由器的核心是 () 。', ' 路由表', NULL, 2, '3', NULL);
INSERT INTO `fill_question` VALUES (10027, '计算机网络', '若 HDLC 帧数据段中出现比特串“ 01011111110 ”，则比特填充后的输出为()', '10111110110', NULL, 2, '5', NULL);
INSERT INTO `fill_question` VALUES (10028, '计算机网络', '数字调制的三种基本形式：移幅键控法ASK、 ()、移相键控法PSK', '移频键控法FSK', NULL, 2, '5', NULL);
INSERT INTO `fill_question` VALUES (10030, '机械设计', '机械零件的设计方法有', '理论设计，经验设计，模型试验设计', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10031, '机械设计', '轮系根据齿轮轴线的位置是否固定，可分为（ ）和行星轮系两大类。', '定轴轮系', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10032, '机械设计', '轮系中，惰轮不会影响轮系传动比的大小，而只是改变齿轮的', '转向', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10033, '机械设计', '在轮系中，只改变齿轮转向，而不影响轮系传动比的齿轮，称为', '惰轮', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10034, '机械设计', '在行星轮系中，轴线位置固定不动的齿轮称为', '太阳轮', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10035, '机械设计', '在行星轮系中，兼有自转和公转的齿轮称为（ ）。', '行星轮', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10036, '机械设计', '汽车后桥差速器是作为行星轮系中的（ ）轮系分解运动的应用', '差动', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10037, '机械设计', '组成行星轮系的基本构件有（ ） 、（ ） 和系杆。', '行星轮 太阳轮', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10038, '机械设计', '自由度为2的行星轮系，称为（ ）。', '差动轮系', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10039, '机械设计', '轮系中的惰轮对（ ）并无影响，但却能改变从动轮的转向。', '传动比', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10040, '机械设计', '一对外啮合圆柱齿轮传动，两齿轮的转向（）。', '相反', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10041, '机械设计', '在平面定轴轮系中，当外啮合齿轮的对数为奇数时，首、末轮转向（）。', '相反', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10042, '机械设计', '一对内啮合圆柱齿轮传动，两个齿轮的转向（）。', '相同', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10043, '机械设计', '国家标准中，V带的基准长度是在其（）面上所测得的长度。', '中性层', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10044, '机械设计', '根据工作原理不同，带传动可分为（）带传动和啮合带传动两类。', '摩擦', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10045, '机械设计', '带传动常用的张紧方法有两种：安装（）和调整（）。', '张紧轮中心距', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10046, '机械设计', '带传动通常是由主动带轮、从动带轮和（）所组成。', '挠性带', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10047, '机械设计', '普通V带截面形状为等腰梯形，其的楔角等于（）。', '40°', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10048, '机械设计', '与平带传动不同，V带是以其（）为工作面。', '两侧面', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10049, '机械设计', 'V带装在带轮上，和带节宽相对应的带轮直径，称为带轮的（）。', '基准直径', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10050, '机械设计', '带所能传动能力与下列因数有关：（）、摩擦系数和初拉力。', '包角', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10051, '机械设计', '在带传动设计中，若带速不在标准规定的范围，应重选（）。', '小带轮直径', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10052, '机械设计', 'V带标记“A2240”表示（）为2240mm的A型V带。', '基准长度', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10053, '机械设计', '我国V带已经标准化，V带截面为等腰梯形，且锲角是（）度。', '40', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10054, '机械设计', '带传动的设计准则是：在不打滑的条件下，具有一定的（）和使用寿命。', '疲劳强度', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10055, '机械设计', '带的打滑是由于（）引起的，因此可以避免。', '过载', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10056, '机械设计', '带传动的传动能力不仅与初拉力和摩擦系数有关，还与带轮（）有关。', '包角', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10057, '机械设计', '若小带轮包角过小，应增大带传动的（），重新计算。', '中心距', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10058, '机械设计', '当传动比i不等于1时，小带轮的包角始终（）大带轮的包角。', '小于', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10059, '机械设计', '传动链按其结构不同，有（）链和齿形链两种。', '套筒滚子', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10060, '机械设计', '链条上相邻两销柱中心的距离，称为（），它是链条的主要参数。', '链节距', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10061, '机械设计', '链节距是链条的重要参数，链节距越（），其承载能力越强。', '大', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10062, '机械设计', '为了避免使用过渡链节，引起附加弯曲应力，在链传动中，链节数一般选（）数。', '偶', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10063, '机械设计', '链传动主要由主动链轮、从动链轮、（）三部分组成。', '链条', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10064, '机械设计', '传动链按结构可分为两大类，其中（）链传动平稳，又称为无声链。', '齿形链', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10065, '机械设计', '为了使链条与链轮齿的磨损均匀，链轮齿数一般选与链节数互为质数的（）数。', '奇', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10066, '机械设计', '牙型角α＝60°的三角形螺纹,称为（）螺纹 ,广泛用于各种紧固件。', '普通', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10067, '机械设计', '螺纹按旋向分为左旋螺纹和（）螺纹。', '右旋', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10068, '机械设计', '普通螺纹的牙型形状为三角形，其牙型角为（）度。', '60', '', 2, '', '');
INSERT INTO `fill_question` VALUES (10069, '机械设计', '螺纹最小的直径称为（），在强度计算中常作为螺杆危险剖面的计算直径。', '小径', '', 2, '', '');

-- ----------------------------
-- Table structure for judge_question
-- ----------------------------
DROP TABLE IF EXISTS `judge_question`;
CREATE TABLE `judge_question`  (
  `questionId` int NOT NULL AUTO_INCREMENT COMMENT '试题编号',
  `subject` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '考试科目',
  `question` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '试题内容',
  `answer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '正确答案',
  `analysis` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '题目解析',
  `score` int NULL DEFAULT 2 COMMENT '分数',
  `level` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '难度等级',
  `section` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '所属章节',
  PRIMARY KEY (`questionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10013 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '判断题题库表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of judge_question
-- ----------------------------
INSERT INTO `judge_question` VALUES (10001, '计算机网络', '与有线网相比,无线网的数据传输率一般相对较慢', 'T', NULL, 2, '1', '');
INSERT INTO `judge_question` VALUES (10002, '计算机网络', 'OSI参考模型中,不同节点的同等层具有不同的功能', 'F', NULL, 2, '1', 'OSI模型');
INSERT INTO `judge_question` VALUES (10003, '计算机网络', '普通电脑不能作为服务器', 'F', NULL, 2, '1', NULL);
INSERT INTO `judge_question` VALUES (10004, '计算机网络', '没有网线的电脑不能连入互联网', 'F', NULL, 2, '1', NULL);
INSERT INTO `judge_question` VALUES (10005, '计算机网络', '网卡必须安装驱动程序', 'T', NULL, 2, '2', NULL);
INSERT INTO `judge_question` VALUES (10006, '计算机网络', 'UTP为屏蔽双绞线', 'F', NULL, 2, '2', NULL);
INSERT INTO `judge_question` VALUES (10007, '计算机网络', '网络接口卡又称为网卡,它是构成网络的基本部件', 'T', NULL, 2, '2', NULL);
INSERT INTO `judge_question` VALUES (10008, '计算机网络', '无线AP可以成倍地扩展网络覆盖范围', 'T', NULL, 2, '3', NULL);
INSERT INTO `judge_question` VALUES (10009, '计算机网络', 'SMTP是一组用于由源地址到目的地址传送邮件的协议', 'T', NULL, 2, '4', NULL);
INSERT INTO `judge_question` VALUES (10010, '计算机网络', '任务管理器可以关闭所有的进程', 'F', NULL, 2, '3', NULL);
INSERT INTO `judge_question` VALUES (10011, '计算机网络', '利用BT下载时,用户越多,下载速度越快', 'T', NULL, 2, '2', NULL);
INSERT INTO `judge_question` VALUES (10012, '计算机网络', 'INTERNET上向朋友发送电子邮件,必须知道对方的真实姓名和家庭住址', 'F', NULL, 2, '1', NULL);
INSERT INTO `judge_question` VALUES (10013, '机械设计', '一部机器只能有一个原动机。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10014, '机械设计', '一部机器只能有一个执行部分。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10015, '机械设计', '机械零件质量的好坏是决定机器质量好坏的关键。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10016, '机械设计', '采用可拆联接多是由于制造及经济上的原因。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10017, '机械设计', '采用不可拆联接多是由于安装、运输、维修上的原因。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10018, '机械设计', '不可拆联接的制造成本通常较可拆联接高。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10019, '机械设计', '锯齿形螺纹主要用于联接。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10020, '机械设计', '梯形螺纹主要用于联接。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10021, '机械设计', '管螺纹主要用于传动。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10022, '机械设计', '螺纹升角φ越大越容易自锁。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10023, '机械设计', '所有螺纹的牙型角都是60°。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10024, '机械设计', '紧键是靠键的两个侧面受挤压来传递转矩和运动的。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10025, '机械设计', '松键是靠键的上下两个面来传递转矩和运动的。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10026, '机械设计', '定位销可用于联接，并传递转矩。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10027, '机械设计', '花键联接只能用于静联接。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10028, '机械设计', '花键联接只能用于动联接。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10029, '机械设计', '花键联接即可用于静联接也可用于动连接。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10030, '机械设计', '花键联接适用于定心精度要求高、载荷大或经常滑移的联接。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10031, '机械设计', '联接销只可用于联接，不可用于传递载荷。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10032, '机械设计', '心轴只受扭矩。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10033, '机械设计', '转轴只受弯矩。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10034, '机械设计', '传动轴既受弯矩又受扭矩。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10035, '机械设计', '当用45#钢做轴刚度不够时，可用合金钢代替。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10036, '机械设计', '止推滑动轴承通常做成实心式轴颈。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10037, '机械设计', '油槽一般开在承载区以利于润滑。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10038, '机械设计', '蜗杆头数越多效率越高', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10039, '机械设计', '蜗杆头数越多效率越低。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10040, '机械设计', '要求蜗杆有自锁性则应选择双头蜗杆。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10041, '机械设计', '选择小齿轮齿数时，如是硬齿面齿轮则应取多一些齿数。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10042, '机械设计', '选择小齿轮齿数时，如是软齿面齿轮则应取少一些齿数。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10043, '机械设计', '定轴轮系的传动比等于轮系各对啮合齿轮传动比的连乘积', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10044, '机械设计', '轮系可以分为定轴轮系和行星轮系，其中，差动轮系属于定轴轮系', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10045, '机械设计', '在轮系中，惰轮既会能改变传动比大小，也会能改变转动方向', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10046, '机械设计', '在定轴轮系中，轮系传动比等于所有从动轮齿数的连乘积与主动轮齿数的连乘积之比', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10047, '机械设计', '轮系传动比计算公式(-1)m中的m是指轮系中相互啮合的齿轮的对数。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10048, '机械设计', '转系可分为定轴轮系和行星轮系两大类。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10049, '机械设计', '轮系中所有齿轮的轴线位置均不能固定的轮系，才能称之为行星轮系。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10050, '机械设计', '只要轮系中有一个齿轮的轴线的位置是固定的，则可称为定轴轮系。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10051, '机械设计', '定轴轮系传动比，等于组成该轮系的所有从动齿轮齿数连乘积与主动齿轮齿数连乘积之比。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10052, '机械设计', '在轮系中，惰轮只会改变齿轮的转向，而不会影响传动比。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10053, '机械设计', '行星轮系中，对行星轮起支承作用的称为太阳轮。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10054, '机械设计', '平面定轴轮系中，有奇数对外啮合齿轮，则首末两轮的转向是相反的。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10055, '机械设计', '行星轮系中，轴线的位置不固定的齿轮称为太阳轮。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10056, '机械设计', '只有1个自由度的行星轮系，我们称之为差动轮系。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10057, '机械设计', '轮系中的惰轮只会改变轮系的传动比。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10058, '机械设计', '行星轮既作自转，又作公转，犹如行星绕是运行一样，故称其为行星轮。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10059, '机械设计', '差动轮系可实现运动的合成和分解。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10060, '机械设计', '平面定轴轮系的传动比如果为正值，则说明首末两轮的转向相同。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10061, '机械设计', '平面定轴轮系传动比的正负取决于轮系中外啮合齿轮的对数。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10062, '机械设计', '轮系按齿轮轴线的位置是否固定分为定轴轮系和差动轮系。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10063, '机械设计', '轮系中只会改变齿轮转向的齿轮，称为行星轮。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10064, '机械设计', '轮系传动计算式前的(-1)m，m是指轮系中内啮合齿轮的对数。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10065, '机械设计', '平面定轴轮系中，若有偶数对外啮合齿轮，则传动比为负值。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10066, '机械设计', '行星轮系中，太阳轮的轴线位置不固定。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10067, '机械设计', '若行星轮系只有2个自由度，我们称之为差动轮系。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10068, '机械设计', '根据齿轮轴线的位置是否固定，轮系可分为定轴轮系和行星轮系。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10069, '机械设计', '轮系中既作自转又作公转的齿轮，称为行星轮。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10070, '机械设计', '内啮合圆柱齿轮传动，两齿轮的转向相反。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10071, '机械设计', '轮系中轴线的位置会产生改变的齿轮，为行星轮。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10072, '机械设计', '外啮合圆柱齿轮传动，两齿轮的转向是相同的。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10073, '机械设计', '所谓轮系传动比，是指轮系首、末轮转速之比。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10074, '机械设计', '行星轮系主要由行星轮、太阳轮和系杆等基本构件所组成。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10075, '机械设计', '轮系在结构较紧凑的条件下，可获得较大的传动比。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10076, '机械设计', '与单对齿轮传动相比，轮系在可实现远距离的传动，且结构紧凑。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10077, '机械设计', '轮系可实现变速和变向。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10078, '机械设计', '差动轮系是属定轴轮系中的一种，其自由度为2。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10079, '机械设计', '按齿轮轴线的位置是否固定，轮系分为定轴轮系和差动轮系。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10080, '机械设计', '差动轮系不仅可实现运动的合成，也能实现运动的分解。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10081, '机械设计', '平面定轴轮系的传动比若为负值，则说明首末两轮的转向相反。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10082, '机械设计', '压印在V带上的标记：Y200，表示Y型V带，允许的带轮最小直径为200mm。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10083, '机械设计', '带传动由于带有弹性，能缓冲吸振，故传动平稳，噪声小。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10084, '机械设计', '带传动水平布置时，通常将松边置于上方以增加包角。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10085, '机械设计', '增大带传动中心距，能增大小带轮上的包角。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10086, '机械设计', '为了使每根带受力比较均匀，带的根数不宜过多，通常取3～6根。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10087, '机械设计', 'Ｖ带的张紧轮应放在松边的内侧，并尽量靠近小带轮。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10088, '机械设计', '一组V带中若有一根损坏，应成组更换。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10089, '机械设计', '各种类型的带传动都是属于摩擦传动。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10090, '机械设计', '普通Ｖ带有Ａ、B、C、D、E、F七种型号,其截面尺寸和传递功率不同。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10091, '机械设计', '普通V带传递功率的能力，E型最大，A型最小。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10092, '机械设计', 'V带传动应设置防护罩。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10093, '机械设计', '弹性滑动会影响带传动的传动比，但在正常工作中是不可避免的。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10094, '机械设计', 'V带传动是以其内表面为工作面进行工作。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10095, '机械设计', 'Ｖ带打滑后可防止薄弱零件受到损伤，起到过载保护的作用。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10096, '机械设计', 'Ｖ带截面形状为等腰三角形。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10097, '机械设计', 'Ｖ带带轮越小，弯曲应力越大，带的寿命越低。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10098, '机械设计', '张紧轮应安装在带传动的松边。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10099, '机械设计', '在传递功率一定情况下，三角带的速度过高或过低，都容易产生打滑现象。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10100, '机械设计', 'V带的型号，主要根据计算功率和小带轮转速选用。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10101, '机械设计', 'V带传动带速过高，应重新确定小带轮直径进行设计计算。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10102, '机械设计', '带传动常用于两轴中心距较大的场合。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10103, '机械设计', '平带和V带都属于摩擦带传动。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10104, '机械设计', '与平带传动相比，在相同张紧力条件下，V带能传递较大的载荷。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10105, '机械设计', '平带的截面形状为矩形，是依靠两侧面来工作的。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10106, '机械设计', '所有的带传动都是依靠带与带轮的摩擦来传递运动的。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10107, '机械设计', '由于带与带轮之间有弹性滑动，其传动比不准确。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10108, '机械设计', '带传动过载时，会产生打滑现象，可以防止机器其它零件不受损伤。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10109, '机械设计', 'V带截面形状为梯形，其楔角为45°。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10110, '机械设计', '线强结构的V带较为柔软，弯曲性能好，适用于带轮直径较小的场合。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10111, '机械设计', '普通V带已标准化，按截面尺寸分为4种型号。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10112, '机械设计', '在普通V带中，A型带的截面尺寸最小，传递功率最小。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10113, '机械设计', '带轮常采用HT150、HT200等灰铸铁制造。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10114, '机械设计', 'V带的基准长度是指其内圆周的长度。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10115, '机械设计', '压印在V带表面上的标记“Z1120”，表示带的基准长度为1120mm的Z 型带。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10116, '机械设计', 'V带中性层的长度，即为带的基准长度。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10117, '机械设计', '与带传动相比，链传动有准确的平均传动比准确，传动功率较大。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10118, '机械设计', '链传动能保证准确的平均传动比，因此它特别适用于要求传动平稳的场合。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10119, '机械设计', '链传动具有准确的的平均传动比和瞬时传动比。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10120, '机械设计', '套筒滚子链的12B－2×60 GB12431－83，其链节数等于120。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10121, '机械设计', '链传动水平布置时，松边应位于下方，否则松边容易与紧边相碰。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10122, '机械设计', '链节距越大，承载能力越大，但相应会引起较大的冲击和振动，因此高速重载时，可选用小节距的多排链。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10123, '机械设计', '链传动传动平稳，一般布置在高速级', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10124, '机械设计', '滚子链“05B-1×48 GB12431－83”，表示链条的排数为5排。（）滚子链“05B-1×48 GB12431－83”，表示链条的排数为5排。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10125, '机械设计', '链节距是链条的主要参数，它反映了链条的结构尺寸和承载能力。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10126, '机械设计', '滚子链的链节数一般为偶数，以避免使用过渡链节。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10127, '机械设计', '为了使链齿的磨损均匀，链轮齿数一般应取取链节数互为质数的奇数。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10128, '机械设计', '链传动能在恶劣的环境下工作，所以广泛用于石油、矿山机械中。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10129, '机械设计', ' 滚子链的“24Ａ－2×54 GB12431－83”，表示链条长度为54mm。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10130, '机械设计', '滚子链链节数为奇数时，须使用过渡链节，会引起附加弯曲应力，应尽量避免。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10131, '机械设计', '与带传动一样，链传动可以用于中心距较远的传动。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10132, '机械设计', '链传动为啮合传动，不会产生打滑现象，其平均传动比准确。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10133, '机械设计', '滚子链链节距越大，链条尺寸越大，其承载能力也越强。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10134, '机械设计', '套筒滚子链的48Ａ－3×100 GB12431－83，表示链传动中心距为100mm。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10135, '机械设计', '普通螺纹的公称直径是指螺纹大径。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10136, '机械设计', '螺纹联接的基本型式共有四种，如螺栓联接、螺柱联接、螺钉联接等', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10137, '机械设计', '两个被联接件都可以制出通孔，且需拆装方便的场合应采用螺栓联接。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10138, '机械设计', '在振动、冲击或交变载荷作用的螺纹联接容易自行松脱，在设计时须考虑防松装置。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10139, '机械设计', '为增加螺纹联接的刚性和紧密性并提高防松能力，螺纹联接一般需预紧。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10140, '机械设计', '拧紧螺母时可使用测力矩扳手，以控制预紧力。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10141, '机械设计', '配合使用的内、外螺纹，其旋向相同。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10142, '机械设计', '常用螺纹联接的防松装置有机械防松、摩擦防松和永久防松等。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10143, '机械设计', '螺旋传动常将主动件的回转运动转换为从动件的直线运动。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10144, '机械设计', '为了符合操作习惯，车床横向进给丝杠螺纹采用的是左旋螺纹。', 'T', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10145, '机械设计', '普通螺纹的公称直径是指螺纹中径的基本尺寸。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10146, '机械设计', '焊接防松属于摩擦防松。', 'F', '', 2, '', '');
INSERT INTO `judge_question` VALUES (10147, '机械设计', '对同一螺栓组,通常采用相同的螺栓材料、直径和长度，以便安装和拆卸', 'T', '', 2, '', '');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '留言编号',
  `title` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '留言内容',
  `time` date NULL DEFAULT NULL COMMENT '留言时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '留言表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for multi_question
-- ----------------------------
DROP TABLE IF EXISTS `multi_question`;
CREATE TABLE `multi_question`  (
  `questionId` int NOT NULL AUTO_INCREMENT COMMENT '试题编号',
  `subject` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '考试科目',
  `question` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '问题题目',
  `answerA` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '选项A',
  `answerB` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '选项B',
  `answerC` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '选项C',
  `answerD` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '选项D',
  `rightAnswer` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '正确答案',
  `analysis` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '题目解析',
  `score` int NULL DEFAULT 2 COMMENT '分数',
  `section` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '所属章节',
  `level` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '难度等级',
  PRIMARY KEY (`questionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10035 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '选择题题库表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of multi_question
-- ----------------------------
INSERT INTO `multi_question` VALUES (10000, '计算机网络', 'DNS 服务器和DHCP服务器的作用是什么（）', '将IP地址翻译为计算机名，为客户机分配IP地址', '将IP地址翻译为计算机名、解析计算机的MAC地址', '将计算机名翻译为IP地址、为客户机分配IP地址', '将计算机名翻译为IP地址、解析计算机的MAC地址', 'C', '', 2, '应用层', '2');
INSERT INTO `multi_question` VALUES (10001, '计算机网络', 'HTTP协议通常使用什么协议进行传输（）', 'ARP', 'DHCP', 'UDP', 'TCP', 'D', NULL, 2, '应用层', '2');
INSERT INTO `multi_question` VALUES (10003, '计算机网络', '查看DNS缓存记录的命令（）', 'ipconfig/displaydns', 'nslookup', 'ipconfig/release', 'ipconfig/flushdns', 'A', NULL, 2, '应用层', '3');
INSERT INTO `multi_question` VALUES (10004, '计算机网络', 'DHCP(        )报文的目的IP地址为255.255.255.255', 'DhcpDisover', 'DhcpOffer', 'DhcpAck', 'DhcpNack', 'A', NULL, 2, '应用层', '2');
INSERT INTO `multi_question` VALUES (10005, '计算机网络', '下列地址中，（  ）不是DHCP服务器分配的IP地址', '196.254.109.100', '169.254.12.42', '69.254.48.45', '96.254.54.15', 'B', NULL, 2, '应用层', '2');
INSERT INTO `multi_question` VALUES (10006, '计算机网络', 'DHCP通常可以为客户端自动配置哪些网络参数（）', 'IP，掩码，网关，DNS', 'IP，掩码，域名，SMTP', '网关，掩码，浏览器，FTP', 'IP，网关，DNS，服务器', 'A', NULL, 2, '应用层', '2');
INSERT INTO `multi_question` VALUES (10007, '计算机网络', 'DNS服务器在名称解析过程中正确的查询顺序为（）', '本地缓存记录→区域记录→转发域名服务器→根域名服务器', '区域记录→本地缓存记录→转发域名服务器→根域名服务器', '本地缓存记录→区域记录→根域名服务器→转发域名服务器', '区域记录→本地缓存记录→根域名服务器→转发域名服务器', 'A', NULL, 2, '应用层', '3');
INSERT INTO `multi_question` VALUES (10008, '计算机网络', '在TCP/IP协议中，序号小于（  ）的端口称为熟知端口(well-known port)。', '1024', '64', '256', '128', 'A', NULL, 2, '传输层', '1');
INSERT INTO `multi_question` VALUES (10009, '计算机网络', '在Internet上用TCP/IP播放视频，想用传输层的最快协议，以减少时延，要使用（ ）', 'UDP协议的低开销特性', 'UDP协议的高开销特性', 'TCP协议的低开销特性', 'TCP协议的高开销特性', 'A', NULL, 2, '传输层', '2');
INSERT INTO `multi_question` VALUES (10010, '计算机网络', '在TCP协议中采用（ ）来区分不同的应用进程', '端口号', 'IP地址', '协议类型', 'MAC地址', 'A', NULL, 2, '传输层', '3');
INSERT INTO `multi_question` VALUES (10011, '计算机网络', '可靠的传输协议中的“可靠”指的是（ ）', '使用面向连接的会话', '使用“尽力而为”的传输', '使用滑动窗口来维持可靠性', '使用确认重传机制来确保传输的数据不丢失', 'D', NULL, 2, '传输层', '2');
INSERT INTO `multi_question` VALUES (10012, '计算机网络', '假设拥塞窗口为50KB，接收窗口为80KB，TCP能够发送的最大字节数为（ ）', '50KB', '80KB', '130KB', '30KB', 'A', NULL, 2, '传输层', '4');
INSERT INTO `multi_question` VALUES (10013, '计算机网络', '主机A向主机B发送一个（SYN=1，seq=2000）的TCP报文，期望与主机B建立连接，若主机B接受连接请求，则主机B发送的正确有TCP报文可能是（ ）', '（SYN=0,ACK=0,seq=2001,ack=2001）', '（SYN=1,ACK=1,seq=2000,ack=2000）', '•	C.（SYN=1,ACK=1,seq=2001,ack=2001）', '（SYN=0,ACK=1,seq=2000,ack=2000）', 'C', NULL, 2, '传输层', '2');
INSERT INTO `multi_question` VALUES (10014, '计算机网络', '主机A向主机B连续发送了两个TCP报文段，其序号分别为70和100。试问： （1）第一个报文段携带了（）个字节的数据？', ' 70', '30', '100', '170', 'B', NULL, 2, '传输层', '3');
INSERT INTO `multi_question` VALUES (10015, '计算机网络', 'PCM脉码调制的过程（ ）', '采样、量化、编码', '量化、编码、采样', '编码、量化、采样', '采样、编码、量化', 'A', NULL, 2, '物理层', '4');
INSERT INTO `multi_question` VALUES (10016, '计算机网络', '若某采用4相位调制的通信链路的数据传输速率为2400bps，则该链路的波特率为（）', '600Baud', '1200Baud', '4800Baud', '9600Baud', 'B', NULL, 2, '物理层', '1');
INSERT INTO `multi_question` VALUES (10017, '计算机网络', '以下关于数据传输速率的描述中，错误的是( )', '数据传输速率表示每秒钟传输构成数据代码的二进制比特数', '对于二进制数据，数据传输速率为S=1/T (bps)', '常用的数据传输速率单位有: 1Mbps=1.024×106bps', '数据传输速率是描述数据传输系统性能的重要技术指标之一', 'C', NULL, 2, '物理层', '2');
INSERT INTO `multi_question` VALUES (10018, '计算机网络', '以下关于时分多路复用概念的描述中，错误的是.(  ).', '时分多路复用将线路使用的时间分成多个时间片', '时分多路复用分为同步时分多路复用与统计时分多路复用', '时分多路复用使用“帧”与数据链路层“帧”的概念、作用是不同的', '统计时分多路复用将时间片预先分配给各个信道', 'D', NULL, 2, '物理层', '2');
INSERT INTO `multi_question` VALUES (10019, '计算机网络', '1000BASE-T标准支持的传输介质是（）', '双绞线', '同轴电缆', '光纤', '无线电', 'A', NULL, 2, '物理层', '1');
INSERT INTO `multi_question` VALUES (10020, '计算机网络', '一个以太网交换机，读取整个数据帧，对数据帧进行差错校验后再转发出去，这种交换方式称为 （）', '直通交换', '无碎片交换', '无差错交换', '存储转发交换', 'D', NULL, 2, '数据链路层', '2');
INSERT INTO `multi_question` VALUES (10021, '计算机网络', '关于VLAN，下面的描述中正确的是（）', '一个新的交换机没有配置VLAN', '通过配置VLAN减少了冲突域的数量', '一个VLAN不能跨越多个交换机', '各个VLAN属于不同的广播域', 'D', NULL, 2, '数据链路层', '2');
INSERT INTO `multi_question` VALUES (10022, '计算机网络', '以太网协议中使用物理地址作用是什么？', '.用于不同子网中的主机进行通信', '作为第二层设备的唯一标识', '用于区别第二层第三层的协议数据单元', '保存主机可检测未知的远程设备', 'B', NULL, 2, '数据链路层', '2');
INSERT INTO `multi_question` VALUES (10023, '计算机网络', '以太网采用的CSMA/CD协议，当冲突发生时要通过二进制指数后退算法计算后退延时， 关于这个算法，以下论述中错误的是 （）', '冲突次数越多，后退的时间越短', '平均后退次数的多少与负载大小有关', '后退时延的平均值与负载大小有关', '重发次数达到一定极限后放弃发送', 'A', NULL, 2, '数据链路层', '3');
INSERT INTO `multi_question` VALUES (10024, '计算机网络', '以下关于交换机获取与其端口连接设备的MAC地址的叙述中，正确的是（）', '交换机从路由表中提取设备的MAC地址', '交换机检查端口流入分组的源地址', '交换机之间互相交换地址表', '网络管理员手工输入设备的MAC地址', 'B', NULL, 2, '数据链路层', '2');
INSERT INTO `multi_question` VALUES (10025, '计算机网络', '如果G (x）为11010010，以下4个CRC校验比特序列中只有哪个可能是正确的 ？', '1101011001', '101011011', '11011011', '1011001', 'B', NULL, 2, '数据链路层', '1');
INSERT INTO `multi_question` VALUES (10026, '计算机网络', '以下关于Ethernet物理地址的描述中，错误的是', 'Ethernet物理地址又叫做MAC地址', '48位的Ethernet物理地址允许分配的地址数达到247个', '网卡的物理地址写入主机的EPROM中', '每一块网卡的物理地址在全世界是唯一的', 'C', NULL, 2, '数据链路层', '3');
INSERT INTO `multi_question` VALUES (10027, '计算机网络', '下列帧类型中，不属于HDLC帧类型的是（）', '信息帧', '确认帧', '监控帧', '无编号帧', 'B', NULL, 2, '数据链路层', '1');
INSERT INTO `multi_question` VALUES (10028, '计算机网络', '通过交换机连接的一组站点，关于它们的广播域和冲突域说法正确的是（）', '组成一个冲突域，但不是一个广播域', '组成一个广播域，但不是一个冲突域', '组成一个冲突域，也是一个广播域', '既不一个冲突域，也不是一个广播域', 'B', NULL, 2, '数据链路层', '3');
INSERT INTO `multi_question` VALUES (10029, '计算机网络', '数据链路层的数据单位是（）', '帧', '字节', '比特', '分组', 'A', NULL, 2, '数据链路层', '1');
INSERT INTO `multi_question` VALUES (10030, '计算机网络', 'LAN参考模型可分为物理层、（ ）', 'MAC，LLC等三层', 'LLC，MHS等三层', 'MAC，FTAM等三层', 'LLC，VT等三层', 'A', NULL, 2, '数据链路层', '3');
INSERT INTO `multi_question` VALUES (10035, '机械设计', '下述不可拆联接是', '销联接', '螺纹联接', '胶接', '键联接', 'C', '', 2, '', '1');
INSERT INTO `multi_question` VALUES (10036, '机械设计', '下述可拆联接是', '铆接', '焊接', '花键联接', '胶接', 'C', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10037, '机械设计', '下列牙型螺纹中效率最高的是', '管螺纹', '梯形螺纹', '锯齿形螺纹', '矩形螺纹', 'D', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10038, '机械设计', '下列牙型螺纹中效率最低的是', '矩形螺纹', '三角形螺纹', '管螺纹', '锯齿形螺纹', 'B', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10039, '机械设计', '下列牙型螺纹中用于传动的是', '梯形螺纹', '普通螺纹 ', '管螺纹', '矩形螺纹', 'A', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10040, '机械设计', '下列牙型螺纹中用于联接的是', '梯形螺纹', '普通螺纹 ', '矩形螺纹', '锯齿形螺纹', 'B', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10041, '机械设计', '被联接件之一太厚不宜制成通孔，且需要经常拆卸时，往往采用', '螺栓联接', '螺钉联接', '紧定螺钉联接', '双头螺柱联接', 'D', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10042, '机械设计', '按离合器的不同工作原理，离合器可分为', '摩擦式', '滚动式', '电磁式 ', '卡片式', 'A', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10043, '机械设计', '机械零件的设计准则有', '温度准则', '强度准则', '耐磨性准则 ', '等寿命准则', 'B', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10044, '机械设计', '刚性联轴器有', '滚子链联轴器', '齿式联轴器 ', '膜片联轴器', '凸缘式联轴器', 'D', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10045, '机械设计', '下列挠性联轴器有', '套筒式联轴器', '齿式联轴器', '凸缘式联轴器', '夹壳式联轴器', 'B', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10046, '机械设计', '转轴是指', '只受弯矩', '只受扭矩', '既受弯矩又受扭矩', '只受剪力', 'C', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10047, '机械设计', '心轴是指', '只受弯矩', '只受扭矩', '只受剪力', '既受弯矩又受扭矩', 'A', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10048, '机械设计', '传动轴是指', '只受剪力', '只受扭矩', '只受弯矩', '既受弯矩又受扭矩', 'B', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10049, '机械设计', '下列用于轴向定位的是', '套筒', '花键', '销', '过盈配合', 'A', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10050, '机械设计', '下列用于周向定位的是', '轴肩', '套筒', '花键', '弹性挡圈', 'C', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10051, '机械设计', '下列不是固体润滑剂的是', '聚丙烯', '二硫化钼', '聚四氟乙烯', '碳-石墨', 'A', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10052, '机械设计', '要求蜗杆有自锁性则应选择', '单头蜗杆', '双头蜗杆', '三头蜗杆', '四头蜗杆', 'A', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10053, '机械设计', '蜗杆传动中效率最高的是', '单头蜗杆', '双头蜗杆', '三头蜗杆', '四头蜗杆', 'D', '', 2, '', '');
INSERT INTO `multi_question` VALUES (10054, '机械设计', '为了减小蜗轮蜗杆的啮合摩擦，常在蜗轮表面镶嵌', '45#钢', '巴氏合金', '锡青铜', '20Gr', 'C', '', 2, '', '');

-- ----------------------------
-- Table structure for paper_manage
-- ----------------------------
DROP TABLE IF EXISTS `paper_manage`;
CREATE TABLE `paper_manage`  (
  `paperId` int NULL DEFAULT NULL COMMENT '试卷编号',
  `questionType` int NULL DEFAULT NULL COMMENT '题目类型',
  `questionId` int NULL DEFAULT NULL COMMENT '题目编号'
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '试卷管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of paper_manage
-- ----------------------------
INSERT INTO `paper_manage` VALUES (1002, 1, 10040);
INSERT INTO `paper_manage` VALUES (1002, 1, 10042);
INSERT INTO `paper_manage` VALUES (1002, 1, 10045);
INSERT INTO `paper_manage` VALUES (1002, 1, 10035);
INSERT INTO `paper_manage` VALUES (1002, 1, 10047);
INSERT INTO `paper_manage` VALUES (1002, 1, 10043);
INSERT INTO `paper_manage` VALUES (1002, 1, 10037);
INSERT INTO `paper_manage` VALUES (1002, 1, 10053);
INSERT INTO `paper_manage` VALUES (1002, 1, 10041);
INSERT INTO `paper_manage` VALUES (1002, 1, 10050);
INSERT INTO `paper_manage` VALUES (1002, 2, 10047);
INSERT INTO `paper_manage` VALUES (1002, 2, 10061);
INSERT INTO `paper_manage` VALUES (1002, 2, 10030);
INSERT INTO `paper_manage` VALUES (1002, 2, 10040);
INSERT INTO `paper_manage` VALUES (1002, 2, 10057);
INSERT INTO `paper_manage` VALUES (1002, 2, 10066);
INSERT INTO `paper_manage` VALUES (1002, 2, 10054);
INSERT INTO `paper_manage` VALUES (1002, 2, 10046);
INSERT INTO `paper_manage` VALUES (1002, 2, 10068);
INSERT INTO `paper_manage` VALUES (1002, 2, 10062);
INSERT INTO `paper_manage` VALUES (1002, 3, 10034);
INSERT INTO `paper_manage` VALUES (1002, 3, 10100);
INSERT INTO `paper_manage` VALUES (1002, 3, 10134);
INSERT INTO `paper_manage` VALUES (1002, 3, 10016);
INSERT INTO `paper_manage` VALUES (1002, 3, 10045);
INSERT INTO `paper_manage` VALUES (1002, 3, 10051);
INSERT INTO `paper_manage` VALUES (1002, 3, 10054);
INSERT INTO `paper_manage` VALUES (1002, 3, 10104);
INSERT INTO `paper_manage` VALUES (1002, 3, 10031);
INSERT INTO `paper_manage` VALUES (1002, 3, 10037);
INSERT INTO `paper_manage` VALUES (1002, 3, 10052);
INSERT INTO `paper_manage` VALUES (1002, 3, 10041);
INSERT INTO `paper_manage` VALUES (1002, 3, 10026);
INSERT INTO `paper_manage` VALUES (1002, 3, 10144);
INSERT INTO `paper_manage` VALUES (1002, 3, 10109);
INSERT INTO `paper_manage` VALUES (1002, 3, 10048);
INSERT INTO `paper_manage` VALUES (1002, 3, 10112);
INSERT INTO `paper_manage` VALUES (1002, 3, 10032);
INSERT INTO `paper_manage` VALUES (1002, 3, 10065);
INSERT INTO `paper_manage` VALUES (1002, 3, 10027);
INSERT INTO `paper_manage` VALUES (1002, 3, 10015);
INSERT INTO `paper_manage` VALUES (1002, 3, 10128);
INSERT INTO `paper_manage` VALUES (1002, 3, 10082);
INSERT INTO `paper_manage` VALUES (1002, 3, 10090);
INSERT INTO `paper_manage` VALUES (1002, 3, 10079);
INSERT INTO `paper_manage` VALUES (1002, 3, 10077);
INSERT INTO `paper_manage` VALUES (1002, 3, 10114);
INSERT INTO `paper_manage` VALUES (1002, 3, 10019);
INSERT INTO `paper_manage` VALUES (1002, 3, 10111);
INSERT INTO `paper_manage` VALUES (1002, 3, 10097);

-- ----------------------------
-- Table structure for replay
-- ----------------------------
DROP TABLE IF EXISTS `replay`;
CREATE TABLE `replay`  (
  `messageId` int NULL DEFAULT NULL COMMENT '留言编号',
  `replayId` int NOT NULL AUTO_INCREMENT COMMENT '回复编号',
  `replay` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '内容',
  `replayTime` date NULL DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`replayId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '回复表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of replay
-- ----------------------------

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `scoreId` int NOT NULL AUTO_INCREMENT COMMENT '分数编号',
  `examCode` int NULL DEFAULT NULL COMMENT '考试编号',
  `studentId` int NULL DEFAULT NULL COMMENT '学号',
  `subject` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '课程名称',
  `ptScore` int NULL DEFAULT NULL COMMENT '平时成绩',
  `etScore` int NULL DEFAULT NULL COMMENT '期末成绩',
  `score` int NULL DEFAULT NULL COMMENT '总成绩',
  `answerDate` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '答题日期',
  PRIMARY KEY (`scoreId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '成绩管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of score
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `studentId` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `studentName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '姓名',
  `grade` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '年级',
  `major` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '专业',
  `clazz` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '班级',
  `institute` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '学院',
  `tel` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '电话号码',
  `email` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '电子邮件',
  `pwd` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '密码',
  `cardId` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '身份证号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `role` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '2' COMMENT '角色(0管理员，1教师，2学生)',
  PRIMARY KEY (`studentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20225010 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '学生信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (20225010, '胡博涵', '2019', '机械工程', '2', '国际学院', '13333333333', NULL, '123456', NULL, '男', '2');
INSERT INTO `student` VALUES (20225011, '李宇航', '2019', '机械工程', '2', '国际学院', '15555555555', NULL, '123456', NULL, '男', '2');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `teacherId` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `teacherName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '姓名',
  `institute` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '学院',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `tel` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '电话号码',
  `email` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '邮箱',
  `pwd` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '密码',
  `cardId` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '身份证号',
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '职称',
  `role` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '角色（0管理员，1教师，2学生）',
  PRIMARY KEY (`teacherId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20081006 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '教师信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (20081006, '张三', '国际学院', '男', '18888888888', NULL, '123456', NULL, '讲师', '1');

SET FOREIGN_KEY_CHECKS = 1;
