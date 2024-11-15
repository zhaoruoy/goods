/*
 Navicat Premium Data Transfer

 Source Server         : 本地mysql
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : goods

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 03/06/2023 20:01:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名',
  `goodsType` int(11) NOT NULL COMMENT '分类',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '苹果手机', 7, 1000, '');
INSERT INTO `goods` VALUES (2, '华为手机', 7, 1000, '');
INSERT INTO `goods` VALUES (3, '荣耀平板', 6, 10000, '');
INSERT INTO `goods` VALUES (4, '康乃馨', 3, 10000, '');
INSERT INTO `goods` VALUES (5, '郁金香', 3, 50000, '');
INSERT INTO `goods` VALUES (6, '纯牛奶', 1, 50000, '');
INSERT INTO `goods` VALUES (7, '盼盼薯片', 1, 500000, '');
INSERT INTO `goods` VALUES (8, '大床', 4, 5000, '');
INSERT INTO `goods` VALUES (9, '流浪猫', 8, 500, '');
INSERT INTO `goods` VALUES (10, '女装', 10, 500000, '');
INSERT INTO `goods` VALUES (11, '男装', 10, 5000000, '');
INSERT INTO `goods` VALUES (12, '童装', 10, 50000, '');

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品分类名',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES (1, '食品', '5');
INSERT INTO `goodstype` VALUES (2, '电器', '5');
INSERT INTO `goodstype` VALUES (3, '鲜花', '5');
INSERT INTO `goodstype` VALUES (4, '家具', '');
INSERT INTO `goodstype` VALUES (5, '电器', '');
INSERT INTO `goodstype` VALUES (6, '电脑', '');
INSERT INTO `goodstype` VALUES (7, '手机', '');
INSERT INTO `goodstype` VALUES (8, '宠物', '');
INSERT INTO `goodstype` VALUES (9, '休闲', '');
INSERT INTO `goodstype` VALUES (10, '服装', '');
INSERT INTO `goodstype` VALUES (11, '水果', '');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL,
  `menuCode` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单编码',
  `menuName` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名字',
  `menuLevel` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单级别',
  `menuParentCode` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单的父code',
  `menuClick` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '点击触发的函数',
  `menuRight` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限 0超级管理员，1表示管理员，2表示普通用户，可以用逗号组合使用',
  `menuComponent` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `menuIcon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '001', '用户管理', '1', NULL, 'User', '0,1', 'user/UserManage.vue', 'el-icon-user-solid');
INSERT INTO `menu` VALUES (2, '002', '商品分类管理', '1', NULL, 'Goodstype', '0,1', 'goodstype/GoodstypeManage', 'el-icon-menu');
INSERT INTO `menu` VALUES (3, '003', '商品管理 ', '1', NULL, 'Goods', '0,1,2', 'goods/GoodsManage', 'el-icon-s-management');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '账号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `age` int(11) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电话',
  `role_id` int(11) NOT NULL DEFAULT 1 COMMENT '角色 0超级管理员，1管理员',
  `isValid` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Y' COMMENT '是否有效，Y有效，其他无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'sa', '超级管理员', '123', 18, 1, '111', 0, 'Y');
INSERT INTO `user` VALUES (2, '111', '测试', '123', 11, 1, '18173327496', 1, 'Y');
INSERT INTO `user` VALUES (3, '112', '1111', '12354', 20, 1, '15555555555', 1, 'Y');
INSERT INTO `user` VALUES (4, '452', '124', '124', 23, 1, '15666665555', 1, 'Y');
INSERT INTO `user` VALUES (5, '158', '158', '1223', 20, 1, '15699989887', 1, 'Y');
INSERT INTO `user` VALUES (6, '111', '1123', '100', 50, 1, '18173225255', 1, 'Y');

SET FOREIGN_KEY_CHECKS = 1;
