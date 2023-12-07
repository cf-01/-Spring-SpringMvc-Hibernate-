/*
 Navicat Premium Data Transfer

 Source Server         : localhost-mysql
 Source Server Type    : MySQL
 Source Server Version : 80035 (8.0.35)
 Source Host           : localhost:3306
 Source Schema         : warehouse

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35)
 File Encoding         : 65001

 Date: 08/12/2023 03:15:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (1, 'IPhone 15', 'https://t14.baidu.com/it/u=2622550907,696523034&fm=224&app=112&size=h200&n=0&f=JPEG&fmt=auto?sec=1702054800&t=f532401b5fe46f5ca3c032094756614c', 79, 4999.00, '电子产品');
INSERT INTO `item` VALUES (4, 'MacBook Pro', 'https://img12.360buyimg.com/n7/jfs/t1/190476/40/40893/17512/65365cf8F331bbdff/90e995da8964afde.jpg', 13, 12999.00, '笔记本电脑');
INSERT INTO `item` VALUES (5, 'Nike Air Force 1', 'https://img11.360buyimg.com/n7/jfs/t1/90877/5/26818/30919/652119ecF47f7a476/a9683a783ed7cbea.jpg', 10, 799.00, '运动鞋');
INSERT INTO `item` VALUES (6, '联想小新轻薄本', 'https://img12.360buyimg.com/n7/jfs/t1/228275/10/6240/82060/65703331Fbb79a4ed/6183c6869caf515a.jpg', 8, 5199.00, '笔记本电脑');
INSERT INTO `item` VALUES (7, '华为Mate 50', 'https://img11.360buyimg.com/n7/jfs/t1/180221/30/37391/52423/64f05422Fff47cee8/371869cfa5f0c449.jpg', 15, 6999.00, '手机');
INSERT INTO `item` VALUES (8, '施华洛世奇项链', 'https://img11.360buyimg.com/n7/jfs/t1/233109/38/5444/79097/656d42beF9b8ed5ab/3705932359ae6bee.jpg', 3, 499.00, '首饰');
INSERT INTO `item` VALUES (9, '爱马仕包包', 'https://img11.360buyimg.com/n7/jfs/t1/229485/21/3606/88927/655adb20F077922e6/c3c8d66229b74749.jpg', 1, 37499.00, '奢侈品');
INSERT INTO `item` VALUES (10, 'Gucci钱夹', 'https://img12.360buyimg.com/n7/jfs/t1/146867/17/5460/161423/5f3a1f41Efcf93f86/b925f384669aed83.jpg', 7, 2999.00, '皮具');
INSERT INTO `item` VALUES (11, '索尼无线耳机', 'https://img12.360buyimg.com/n7/jfs/t1/234022/20/4056/38910/655f0a90F05a180d8/ce0dd4f724970142.jpg', 12, 1699.00, '电子产品');
INSERT INTO `item` VALUES (12, '天梭男表', 'https://img13.360buyimg.com/n7/jfs/t1/228528/22/6135/78624/65702c88F50171d61/b7a28db151e48475.jpg', 4, 4999.00, '手表');
INSERT INTO `item` VALUES (13, 'Canon EOS R5相机', 'https://img12.360buyimg.com/n7/jfs/t1/236534/36/5426/119163/656a0388F45fa0104/19421a65e76f8947.jpg', 6, 29999.00, '相机');
INSERT INTO `item` VALUES (14, 'Beats Solo 3 无线耳机', 'https://img12.360buyimg.com/n7/jfs/t1/105794/27/44585/39863/6556d24cF3a78bace/b79177e159ec7177.jpg', 15, 2099.00, '电子产品');
INSERT INTO `item` VALUES (15, '雅诗兰黛口红', 'https://img10.360buyimg.com/n7/jfs/t1/235007/5/5977/166545/656d3d20F6bfdd704/5fae45608fb8f497.jpg', 30, 199.00, '化妆品');
INSERT INTO `item` VALUES (16, '三星75英寸液晶电视', 'https://img13.360buyimg.com/n7/jfs/t1/224697/29/3869/117727/655719eaF34096681/108300e2d1549d6a.jpg', 2, 3199.00, '家电');
INSERT INTO `item` VALUES (17, '施华洛世奇手链', 'https://t15.baidu.com/it/u=3304610658,1630267359&fm=224&app=112&size=h200&n=0&f=JPEG&fmt=auto?sec=1702054800&t=ae3646dcf1fe184e0563824e950c6b57', 8, 499.00, '首饰');
INSERT INTO `item` VALUES (18, '罗意威香水', 'https://img1.360buyimg.com/n6/jfs/t1/48799/1/23605/37235/6469c32bF9c836b75/6dbd589d53e7d20d.jpg', 10, 899.00, '香水');
INSERT INTO `item` VALUES (19, '耐克篮球', 'https://img1.360buyimg.com/n6/jfs/t1/184854/7/41889/218528/655055beFaa71d794/81a201dfa30e68f7.jpg', 20, 199.00, '篮球用品');
INSERT INTO `item` VALUES (20, '阿迪达斯运动裤', 'https://img1.360buyimg.com/n6/jfs/t1/226564/19/6356/46558/656ef2f7F1271cf40/6ee6151e3b53c564.jpg', 25, 399.00, '运动服');
INSERT INTO `item` VALUES (21, '雅马哈吉他', 'https://img1.360buyimg.com/n6/jfs/t1/238108/9/4659/77330/6563e38aFc3dada09/53274bb81055ce63.jpg', 5, 999.00, '乐器');
INSERT INTO `item` VALUES (22, '惠普激光打印机', 'https://img1.360buyimg.com/n6/jfs/t1/179109/40/42295/42543/65572644Fd3d86d16/03513d10fcbc222e.jpg', 12, 1299.00, '办公设备');

-- ----------------------------
-- Table structure for ordered
-- ----------------------------
DROP TABLE IF EXISTS `ordered`;
CREATE TABLE `ordered`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `itemId` int NULL DEFAULT NULL,
  `userId` int NULL DEFAULT NULL,
  `outTime` datetime NULL DEFAULT NULL,
  `nums` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ordered
-- ----------------------------
INSERT INTO `ordered` VALUES (1, 1, 2, '2023-12-08 02:26:27', 1);
INSERT INTO `ordered` VALUES (2, 4, 2, '2023-12-08 02:26:27', 2);
INSERT INTO `ordered` VALUES (3, 1, 2, '2023-12-08 02:30:07', 1);
INSERT INTO `ordered` VALUES (4, 4, 2, '2023-12-08 02:30:08', 1);
INSERT INTO `ordered` VALUES (5, 1, 2, '2023-12-08 02:30:15', 1);
INSERT INTO `ordered` VALUES (6, 4, 2, '2023-12-08 02:30:15', 1);
INSERT INTO `ordered` VALUES (7, 1, 2, '2023-12-08 02:30:46', 2);
INSERT INTO `ordered` VALUES (8, 1, 2, '2023-12-08 02:32:44', 1);
INSERT INTO `ordered` VALUES (9, 4, 2, '2023-12-08 02:32:44', 1);
INSERT INTO `ordered` VALUES (10, 1, 2, '2023-12-08 02:35:46', 1);
INSERT INTO `ordered` VALUES (11, 1, 2, '2023-12-08 02:39:16', 1);
INSERT INTO `ordered` VALUES (12, 1, 2, '2023-12-08 02:41:44', 5);
INSERT INTO `ordered` VALUES (13, 1, 2, '2023-12-08 02:45:37', 5);
INSERT INTO `ordered` VALUES (14, 1, 2, '2023-12-08 03:03:43', 1);
INSERT INTO `ordered` VALUES (15, 4, 2, '2023-12-08 03:03:43', 2);
INSERT INTO `ordered` VALUES (16, 5, 2, '2023-12-08 03:03:43', 10);

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` int NULL DEFAULT NULL COMMENT '1男 0女',
  `role` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES (1, 'admin', 'admin', 1, 'admin', NULL, NULL);
INSERT INTO `person` VALUES (2, 'user1', '123456', 0, 'user', NULL, NULL);
INSERT INTO `person` VALUES (3, 'user2', '123456', 1, 'user', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
