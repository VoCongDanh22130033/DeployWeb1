/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MariaDB
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : project_web

 Target Server Type    : MariaDB
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 04/06/2025 03:38:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `idAddress` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ward` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `district` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idAddress`) USING BTREE,
  INDEX `idUser`(`idUser`) USING BTREE,
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 1, 'HCM', 'THu DUC', '123', '123', 1);
INSERT INTO `address` VALUES (2, 27, '123 Phường 12 ', 'Xã Di Linh 2', 'Quận 9', 'Bình Dương a', 1);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `idCategory` int(11) NOT NULL AUTO_INCREMENT,
  `categoryType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idCategory`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1008 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Nam', 'Áo Bé Trai', 'Áo dành cho các bạn nam');
INSERT INTO `categories` VALUES (2, 'Nam', 'Quần Bé Trai', 'Quần dành cho các bạn nam');
INSERT INTO `categories` VALUES (3, 'Nam', 'Giày Bé Trai', 'Giày siêu đẹp dành cho các bạn nam');
INSERT INTO `categories` VALUES (4, 'Nam', 'Đồ bộ Bé Trai', 'Đồ bộ siêu ngầu siêu đẹp cho các bạn nam');
INSERT INTO `categories` VALUES (5, 'Nữ', 'Áo Bé Gái', 'Áo siêu dễ thương dành cho các bạn nữ');
INSERT INTO `categories` VALUES (6, 'Nữ', 'Quần Bé Gái', 'Quần siêu dễ thương dành cho các bạn nữ');
INSERT INTO `categories` VALUES (7, 'Nữ', 'Váy Bé Gái', 'Váy siêu dễ thương dành cho các bạn nữ');
INSERT INTO `categories` VALUES (8, 'Nữ', 'Đồ bộ Bé Gái', 'Đồ siêu dễ thương dành cho các bạn nữ');

-- ----------------------------
-- Table structure for colors
-- ----------------------------
DROP TABLE IF EXISTS `colors`;
CREATE TABLE `colors`  (
  `idColor` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hexCode` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idColor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1017 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of colors
-- ----------------------------
INSERT INTO `colors` VALUES (1, 'đỏ ', '#FF0000');
INSERT INTO `colors` VALUES (2, 'vàng kem nhạt', '#DCBF96');
INSERT INTO `colors` VALUES (3, 'đen', '#333');
INSERT INTO `colors` VALUES (4, 'xám nhạt', '#968E8D');
INSERT INTO `colors` VALUES (5, 'xanh nước biển', '#0000FF');
INSERT INTO `colors` VALUES (6, 'be', '#F5F5DC');
INSERT INTO `colors` VALUES (7, 'xanh da trời', '#87CEEB');
INSERT INTO `colors` VALUES (8, 'trắng', '#FFFAFA');
INSERT INTO `colors` VALUES (9, 'xanh lá', '#008000');
INSERT INTO `colors` VALUES (10, 'xanh navy', '#000080');
INSERT INTO `colors` VALUES (11, 'xanh rêu', '#808000');
INSERT INTO `colors` VALUES (12, 'nâu', '#A52A2A');
INSERT INTO `colors` VALUES (13, 'cam', '#FF9900');
INSERT INTO `colors` VALUES (14, 'hồng', '#FFC0CB');
INSERT INTO `colors` VALUES (15, 'hồng nhạt', '#FFB6C1');
INSERT INTO `colors` VALUES (16, 'tím', '#FFCCFF');
INSERT INTO `colors` VALUES (17, 'vàng', '#ffd700');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `idComment` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `commentText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idComment`) USING BTREE,
  INDEX `idUser`(`idUser`) USING BTREE,
  INDEX `idProduct`(`idProduct`) USING BTREE,
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `products` (`idProduct`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons`  (
  `idCoupon` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `discountAmount` decimal(10, 2) NOT NULL,
  `isPercentage` tinyint(1) NOT NULL,
  `minOrderValue` decimal(10, 2) NULL DEFAULT NULL,
  `startDate` timestamp NULL DEFAULT current_timestamp(),
  `endDate` timestamp NULL DEFAULT NULL,
  `usageLimit` int(11) NOT NULL,
  `usedCount` int(11) NOT NULL DEFAULT 0,
  `discountType` enum('PRODUCT','SHIPPING') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'PRODUCT',
  PRIMARY KEY (`idCoupon`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupons
-- ----------------------------
INSERT INTO `coupons` VALUES (1, 'FREESHIP50', 30000.00, 0, 200000.00, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 500, 120, 'SHIPPING');
INSERT INTO `coupons` VALUES (2, 'SHIPFREE30', 15000.00, 0, 150000.00, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 1000, 412, 'SHIPPING');
INSERT INTO `coupons` VALUES (3, 'SHIP20P', 20000.00, 0, 300000.00, '2025-06-05 00:00:00', '2025-06-25 00:00:00', 200, 50, 'SHIPPING');
INSERT INTO `coupons` VALUES (4, 'NEWSHIP', 50000.00, 0, 50000.00, '2025-06-01 00:00:00', '2025-12-31 00:00:00', 1, 0, 'SHIPPING');
INSERT INTO `coupons` VALUES (5, 'JUNEDEL', 10.00, 1, 250000.00, '2025-06-01 00:00:00', '2025-06-15 00:00:00', 300, 130, 'PRODUCT');
INSERT INTO `coupons` VALUES (6, 'GIAM5P', 5.00, 1, 100000.00, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 500, 20, 'PRODUCT');
INSERT INTO `coupons` VALUES (7, 'GIAM10P', 10.00, 1, 200000.00, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 300, 35, 'PRODUCT');
INSERT INTO `coupons` VALUES (8, 'GIAM15P', 15.00, 1, 300000.00, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 250, 60, 'PRODUCT');
INSERT INTO `coupons` VALUES (9, 'GIAM20P', 20.00, 1, 400000.00, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 200, 80, 'PRODUCT');
INSERT INTO `coupons` VALUES (10, 'GIAM25P', 25.00, 1, 500000.00, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 150, 70, 'PRODUCT');
INSERT INTO `coupons` VALUES (11, 'GIAM30P', 30.00, 1, 600000.00, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 100, 40, 'PRODUCT');
INSERT INTO `coupons` VALUES (12, 'TIEN50000', 50000.00, 0, 200000.00, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 400, 60, 'PRODUCT');
INSERT INTO `coupons` VALUES (13, 'TIEN100000', 100000.00, 0, 400000.00, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 300, 45, 'PRODUCT');
INSERT INTO `coupons` VALUES (14, 'TIEN200000', 200000.00, 0, 700000.00, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 250, 30, 'PRODUCT');
INSERT INTO `coupons` VALUES (15, 'SHIP15K', 15000.00, 0, 100000.00, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 300, 100, 'SHIPPING');
INSERT INTO `coupons` VALUES (16, 'SHIP20K', 20000.00, 0, 150000.00, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 300, 90, 'SHIPPING');
INSERT INTO `coupons` VALUES (17, 'SHIP25K', 25000.00, 0, 200000.00, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 200, 80, 'SHIPPING');
INSERT INTO `coupons` VALUES (18, 'SHIP30K', 30000.00, 0, 300000.00, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 200, 75, 'SHIPPING');
INSERT INTO `coupons` VALUES (19, 'FREESHIP50k', 50000.00, 0, 400000.00, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 150, 50, 'SHIPPING');
INSERT INTO `coupons` VALUES (20, 'FREESHIP100k', 100000.00, 0, 600000.00, '2025-06-01 00:00:00', '2025-06-30 00:00:00', 100, 30, 'SHIPPING');

-- ----------------------------
-- Table structure for discount
-- ----------------------------
DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount`  (
  `idDiscount` int(11) NOT NULL AUTO_INCREMENT,
  `discountAmount` decimal(5, 2) NOT NULL,
  `startDate` timestamp NULL DEFAULT current_timestamp(),
  `endDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idDiscount`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1012 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discount
-- ----------------------------
INSERT INTO `discount` VALUES (1, 5.00, '2025-03-06 23:53:03', NULL);
INSERT INTO `discount` VALUES (2, 7.00, '2025-03-06 23:53:03', NULL);
INSERT INTO `discount` VALUES (3, 10.00, '2025-03-06 23:53:03', NULL);
INSERT INTO `discount` VALUES (4, 15.00, '2025-03-06 23:53:03', NULL);
INSERT INTO `discount` VALUES (5, 20.00, '2025-03-06 23:53:03', NULL);
INSERT INTO `discount` VALUES (6, 25.00, '2025-03-06 23:53:03', NULL);
INSERT INTO `discount` VALUES (7, 30.00, '2025-03-06 23:53:03', NULL);
INSERT INTO `discount` VALUES (8, 35.00, '2025-03-06 23:53:03', NULL);
INSERT INTO `discount` VALUES (9, 40.00, '2025-03-06 23:53:03', NULL);
INSERT INTO `discount` VALUES (10, 45.00, '2025-03-06 23:53:03', NULL);
INSERT INTO `discount` VALUES (11, 50.00, '2025-03-06 23:53:03', NULL);
INSERT INTO `discount` VALUES (12, 20.00, '2025-03-06 23:53:03', NULL);

-- ----------------------------
-- Table structure for google_account
-- ----------------------------
DROP TABLE IF EXISTS `google_account`;
CREATE TABLE `google_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `google_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idRole` int(11) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fullName` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `google_id`(`google_id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `idRole`(`idRole`) USING BTREE,
  CONSTRAINT `google_account_ibfk_1` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of google_account
-- ----------------------------
INSERT INTO `google_account` VALUES (1, '111563913658623371492', 2, 'hdanhv5879@gmail.com', 'hdanhv58791742576935989', 'SuFUIZuM_V*L', 'Công Danh Võ', 'https://lh3.googleusercontent.com/a/ACg8ocJauw-oYi9LIAbj8-9aj8jR-7hx8CQDnE0zpePJ4bMjIGIJdphI=s96-c');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `idDetail` int(11) NOT NULL AUTO_INCREMENT,
  `idOrder` int(11) NOT NULL,
  `idVariant` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `discountPrice` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`idDetail`) USING BTREE,
  INDEX `idOrder`(`idOrder`) USING BTREE,
  INDEX `idVariant`(`idVariant`) USING BTREE,
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`idOrder`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`idVariant`) REFERENCES `product_variants` (`idVariant`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `idOrder` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idAddress` int(11) NOT NULL,
  `idCoupon` int(11) NULL DEFAULT NULL,
  `totalPrice` decimal(10, 2) NOT NULL,
  `status` enum('Chờ xác nhận','Đang giao','Hoàn thành','Đã hủy') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Chờ xác nhận',
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idOrder`) USING BTREE,
  INDEX `idUser`(`idUser`) USING BTREE,
  INDEX `idAddress`(`idAddress`) USING BTREE,
  INDEX `idCoupon`(`idCoupon`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`idAddress`) REFERENCES `address` (`idAddress`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`idCoupon`) REFERENCES `coupons` (`idCoupon`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for password_reset
-- ----------------------------
DROP TABLE IF EXISTS `password_reset`;
CREATE TABLE `password_reset`  (
  `idReset` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `expiresAt` timestamp NULL DEFAULT NULL,
  `isUsed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idReset`) USING BTREE,
  INDEX `idUser`(`idUser`) USING BTREE,
  CONSTRAINT `password_reset_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset
-- ----------------------------

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments`  (
  `idPayment` int(11) NOT NULL AUTO_INCREMENT,
  `idOrder` int(11) NOT NULL,
  `paymentMethod` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transactionId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `amount` decimal(10, 2) NOT NULL,
  `status` enum('chờ xác nhận','đã thanh toán','thất bại','hoàn tiền') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'chờ xác nhận',
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idPayment`) USING BTREE,
  INDEX `idOrder`(`idOrder`) USING BTREE,
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`idOrder`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payments
-- ----------------------------

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images`  (
  `idImage` int(11) NOT NULL AUTO_INCREMENT,
  `idProduct` int(11) NOT NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idImage`) USING BTREE,
  INDEX `idProduct`(`idProduct`) USING BTREE,
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `products` (`idProduct`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES (1, 1, 'https://product.hstatic.net/1000290074/product/5_copy_808ad3934afc4b128c8f075da8e655db_medium.jpg', 1);
INSERT INTO `product_images` VALUES (2, 1, 'https://product.hstatic.net/1000290074/product/6_copy_e8d9bb9a42124195933cf8dd0732fec1_medium.jpg', 2);
INSERT INTO `product_images` VALUES (3, 2, 'https://product.hstatic.net/1000290074/product/8_copy_daed0c8efbcb44069c281d7ef4b1a9fe_medium.jpg', 1);
INSERT INTO `product_images` VALUES (4, 2, 'https://product.hstatic.net/1000290074/product/7_copy_f2937a3f0cf54ead9f883e1ddcd2a3ce_medium.jpg', 2);
INSERT INTO `product_images` VALUES (5, 3, 'https://product.hstatic.net/1000290074/product/93818__2__d40a823b374c4c1180c7b79c98473dfd_medium.jpg', 1);
INSERT INTO `product_images` VALUES (6, 3, 'https://product.hstatic.net/1000290074/product/93818-4_16f893f9be2b45e788d5568de5ab73b0_medium.jpg', 2);
INSERT INTO `product_images` VALUES (7, 4, 'https://product.hstatic.net/1000290074/product/92788-1_98e82166483346ddba9d7953f8d22b76_medium.jpg', 1);
INSERT INTO `product_images` VALUES (8, 4, 'https://product.hstatic.net/1000290074/product/xanh_768658ebc99c42059d241b05d2991782_medium.png', 2);
INSERT INTO `product_images` VALUES (9, 5, 'https://product.hstatic.net/1000290074/product/900027240-1_2b1e4c5e752b46d9b8569678b8c17339_medium.jpg', 1);
INSERT INTO `product_images` VALUES (10, 5, 'https://product.hstatic.net/1000290074/product/900.027_ce83e101215c435ea2c4a064ba86258f_medium.jpg', 2);
INSERT INTO `product_images` VALUES (11, 6, 'https://product.hstatic.net/1000290074/product/9000152400-0_3b28da0672b94f40b87229c0168c0339_medium.jpg', 1);
INSERT INTO `product_images` VALUES (12, 6, 'https://product.hstatic.net/1000290074/product/9000152400-1_a57cfc877ed1467aa7b3d1ac35f74e2b_medium.jpg', 2);
INSERT INTO `product_images` VALUES (13, 7, 'https://product.hstatic.net/1000290074/product/9000312400-0_74f88c808e064871ad181812f9897b9b_medium.jpg', 1);
INSERT INTO `product_images` VALUES (14, 7, 'https://product.hstatic.net/1000290074/product/9000312400-1_268bb0eb4e5c4e64945d6cc8d1b00701_medium.jpg', 2);
INSERT INTO `product_images` VALUES (15, 8, 'https://product.hstatic.net/1000290074/product/50005624-5_8e5b10f14292455683da90d8c640c4dc_medium.jpg', 1);
INSERT INTO `product_images` VALUES (16, 8, 'https://product.hstatic.net/1000290074/product/50005624-1_e8ad49466bf0411894464ef7d319e1b6_medium.jpg', 2);
INSERT INTO `product_images` VALUES (17, 9, 'https://product.hstatic.net/1000290074/product/50005724-1_656c8d12486e4ea393aa12f5adfeb666_medium.jpg', 1);
INSERT INTO `product_images` VALUES (18, 9, 'https://product.hstatic.net/1000290074/product/50005724-5_3b02fd2d800747a99659799ba624da69_medium.jpg', 2);
INSERT INTO `product_images` VALUES (19, 10, 'https://product.hstatic.net/1000290074/product/900091241-7_9d6268f068be476c8fbb0d21338d45ba_medium.jpg', 1);
INSERT INTO `product_images` VALUES (20, 10, 'https://product.hstatic.net/1000290074/product/900091241-1_ccf57696ff3145658259d2bae08e4c95_medium.jpg', 2);
INSERT INTO `product_images` VALUES (21, 11, 'https://product.hstatic.net/1000290074/product/910015240-2_7d445c3de7694b1283eadc70f3de2994_medium.jpg', 1);
INSERT INTO `product_images` VALUES (22, 11, 'https://product.hstatic.net/1000290074/product/910015240-1_d1bb4bc5bb0a4c6f88fd7a49272f6e93_medium.jpg', 2);
INSERT INTO `product_images` VALUES (23, 12, 'https://product.hstatic.net/1000290074/product/900088-2_c49cca3f6d7f4e2fb9fa3ec5110466ac_medium.jpg', 1);
INSERT INTO `product_images` VALUES (24, 12, 'https://product.hstatic.net/1000290074/product/900088-7_099be236f7d64a7eaabbce1efc9fee55_medium.jpg', 2);
INSERT INTO `product_images` VALUES (25, 13, 'https://product.hstatic.net/1000290074/product/7_copy_192475811f434600898f962f21f36b9d_medium.jpg', 1);
INSERT INTO `product_images` VALUES (26, 13, 'https://product.hstatic.net/1000290074/product/8_copy_47b195a2269c4e4989b8c636a8639b4d_medium.jpg', 2);
INSERT INTO `product_images` VALUES (27, 14, 'https://product.hstatic.net/1000290074/product/14_copy_1cf5e2cfa659424c9e926a527af31443_medium.jpg', 1);
INSERT INTO `product_images` VALUES (28, 14, 'https://product.hstatic.net/1000290074/product/13_copy_309e5b1bf6e14174b7bc683223ba5fb3_medium.jpg', 2);
INSERT INTO `product_images` VALUES (29, 15, 'https://product.hstatic.net/1000290074/product/15_copy_9d2891a778984896810f65b304c9b651_medium.jpg', 1);
INSERT INTO `product_images` VALUES (30, 15, 'https://product.hstatic.net/1000290074/product/16_copy_2c2fe3993b33442783b1f7753ba44a0a_medium.jpg', 2);
INSERT INTO `product_images` VALUES (31, 16, 'https://product.hstatic.net/1000290074/product/6_copy_f8521216f9f6412180d42cfdb5702240_medium.jpg', 1);
INSERT INTO `product_images` VALUES (32, 16, 'https://product.hstatic.net/1000290074/product/6_2_c7f3960376724423b6d34b97f4c33bb5_medium.jpg', 2);
INSERT INTO `product_images` VALUES (33, 17, 'https://product.hstatic.net/1000290074/product/31_copy_0855cb332d1b4a41a9d76f57f3498bbd_medium.jpg', 1);
INSERT INTO `product_images` VALUES (34, 17, 'https://product.hstatic.net/1000290074/product/32_copy_ee4a86866d984d429bc296b70c6b4b4b_medium.jpg', 2);
INSERT INTO `product_images` VALUES (35, 18, 'https://product.hstatic.net/1000290074/product/91001024-4_ffabda9e567f4ff7a56b6acc40319581_medium.jpg', 1);
INSERT INTO `product_images` VALUES (36, 18, 'https://product.hstatic.net/1000290074/product/91001024-7_f53861e5e2954a77856304e843f52eda_medium.jpg', 2);
INSERT INTO `product_images` VALUES (37, 19, 'https://theme.hstatic.net/1000290074/1001116344/14/frame_2_1024x1024.png?v=7174', 1);
INSERT INTO `product_images` VALUES (38, 19, 'https://product.hstatic.net/1000290074/product/901006240-1_3e5d4824b8b1452bbe57ecfcdb2b4deb_medium.jpg', 2);
INSERT INTO `product_images` VALUES (39, 20, 'https://product.hstatic.net/1000290074/product/928008240-0_345ebbe0427c46b694e8eca47725994f_medium.jpg', 1);
INSERT INTO `product_images` VALUES (40, 20, 'https://product.hstatic.net/1000290074/product/928008240-4_e942d6b99d104c8f8fcab2ca947bf2b8_medium.jpg', 2);
INSERT INTO `product_images` VALUES (41, 21, 'https://product.hstatic.net/1000290074/product/532008250-1_a88d3db0d93a4df7844881407d77951b_medium.jpg', 1);
INSERT INTO `product_images` VALUES (42, 21, 'https://product.hstatic.net/1000290074/product/532008250-2_ccc8e89a5c394c3ab69373924913da30_medium.jpg', 2);
INSERT INTO `product_images` VALUES (43, 22, 'https://product.hstatic.net/1000290074/product/83000125-1_be0f77060a7b41a0a0b417b60fb380ac_medium.jpg', 1);
INSERT INTO `product_images` VALUES (44, 22, 'https://product.hstatic.net/1000290074/product/83000125-5_e8993ff6703d4c5aa09500911d123818_medium.jpg', 2);
INSERT INTO `product_images` VALUES (45, 23, 'https://product.hstatic.net/1000290074/product/941016-1_a349526009d14599ac2bda0c1086a533_medium.jpg', 1);
INSERT INTO `product_images` VALUES (46, 23, 'https://product.hstatic.net/1000290074/product/941016-4_e469dc0d362e42b3b33c33eaa1edb6de_medium.jpg', 2);
INSERT INTO `product_images` VALUES (47, 24, 'https://product.hstatic.net/1000290074/product/941015-2_a605325f40154ad09d0c18a9adda6f18_medium.jpg', 1);
INSERT INTO `product_images` VALUES (48, 24, 'https://product.hstatic.net/1000290074/product/941015-1_2c4fd195fa324085bffcf725a37a43ba_medium.jpg', 2);
INSERT INTO `product_images` VALUES (49, 25, 'https://product.hstatic.net/1000290074/product/11_copy_55fd10ce2e614e0698d6b0b2b695ee94_medium.jpg', 1);
INSERT INTO `product_images` VALUES (50, 25, 'https://product.hstatic.net/1000290074/product/11_4_3ce11ebfec1440fc9f2c9fe264ea8ebd_medium.jpg', 2);
INSERT INTO `product_images` VALUES (51, 26, 'https://product.hstatic.net/1000290074/product/15_copy_a74cd94c8678461db2e2697d3b8cf55a_medium.jpg', 1);
INSERT INTO `product_images` VALUES (52, 26, 'https://product.hstatic.net/1000290074/product/16_copy_a11de68536474555b821c68293ead813_medium.jpg', 2);
INSERT INTO `product_images` VALUES (53, 27, 'https://product.hstatic.net/1000290074/product/93792__2__9c8124555919414da108fb868f01d2ce_medium.jpg', 1);
INSERT INTO `product_images` VALUES (54, 27, 'https://product.hstatic.net/1000290074/product/93792__1__da8ce9440011411487406eda1065c4f6_medium.jpg', 2);
INSERT INTO `product_images` VALUES (55, 28, 'https://product.hstatic.net/1000290074/product/93704-0_f2fbdd9590dc468c8d5e389ce30b00f4_medium.jpg', 1);
INSERT INTO `product_images` VALUES (56, 28, 'https://product.hstatic.net/1000290074/product/93704-1_e1515ec644264ca4b4513ffd44d3ccd4_medium.jpg', 2);
INSERT INTO `product_images` VALUES (57, 29, 'https://product.hstatic.net/1000290074/product/93202024-4_fcb5a18b2a784148ad4c29e7e697756c_medium.jpg', 1);
INSERT INTO `product_images` VALUES (58, 29, 'https://product.hstatic.net/1000290074/product/93202024-0_7f042bd74bef4de4b4dd9a6cf80297ef_medium.jpg', 2);
INSERT INTO `product_images` VALUES (59, 30, 'https://product.hstatic.net/1000290074/product/944003240-6_38b6812cb97e4b06b1891d98d6f226c6_medium.jpg', 1);
INSERT INTO `product_images` VALUES (60, 30, 'https://product.hstatic.net/1000290074/product/dsc00231_copy_9a21ca54e56b4270857f8a0a0de06a99_medium.jpg', 2);
INSERT INTO `product_images` VALUES (61, 31, 'https://product.hstatic.net/1000290074/product/933009240-1_f937976f8e844ce6bcb719b6b42fbb12_medium.jpg', 1);
INSERT INTO `product_images` VALUES (62, 31, 'https://product.hstatic.net/1000290074/product/9330092400604_d6e722a014784ce6b9e4c1bd0a4f855f_medium.jpg', 2);
INSERT INTO `product_images` VALUES (63, 32, 'https://product.hstatic.net/1000290074/product/dsc01286_copy_4393983e15da4d679da096041b93a977_medium.jpg', 1);
INSERT INTO `product_images` VALUES (64, 32, 'https://product.hstatic.net/1000290074/product/542001240-0_387d1a2c6aec454c93106c350f146f73_medium.jpg', 2);
INSERT INTO `product_images` VALUES (65, 33, 'https://product.hstatic.net/1000290074/product/5300052400404-0_72bb92f1b1d3471cb7a8daddd085737a_medium.jpg', 1);
INSERT INTO `product_images` VALUES (66, 33, 'https://product.hstatic.net/1000290074/product/5300052400404-2_dbfb1cc7b8264899b0180c871043f4a2_medium.jpg', 2);
INSERT INTO `product_images` VALUES (67, 34, 'https://product.hstatic.net/1000290074/product/dsc09996_copy_4892a3359e6245df8c29c4fdfe3ca078_medium.jpg', 1);
INSERT INTO `product_images` VALUES (68, 34, 'https://product.hstatic.net/1000290074/product/530004240-0_53faab41c7414fcaa4fded821b462aa6_medium.jpg', 2);
INSERT INTO `product_images` VALUES (69, 35, 'https://product.hstatic.net/1000290074/product/530003240-0_ac0a7644fa114d679d117b2fe41dad1b_medium.jpg', 1);
INSERT INTO `product_images` VALUES (70, 35, 'https://product.hstatic.net/1000290074/product/530003240-3_2535d5a26df046ee8694118e69305964_medium.jpg', 2);
INSERT INTO `product_images` VALUES (71, 36, 'https://product.hstatic.net/1000290074/product/930008240-0_397509ea224d4d4b95ea65aae9855761_medium.jpg', 1);
INSERT INTO `product_images` VALUES (72, 36, 'https://product.hstatic.net/1000290074/product/930008240-1_d241888a3c044441a625d3c00ec47bf3_medium.jpg', 2);
INSERT INTO `product_images` VALUES (73, 37, 'https://product.hstatic.net/1000290074/product/download__7__9f4ed48a2dd843f3acfd8cb96b07bb68_medium.jpg', 1);
INSERT INTO `product_images` VALUES (74, 37, 'https://product.hstatic.net/1000290074/product/download__9__3b1d4d5c771841bfb580a781f487fe8a_medium.jpg', 2);
INSERT INTO `product_images` VALUES (75, 38, 'https://product.hstatic.net/1000290074/product/83024000-0_1a87edf86df642f582384a3a936d5a91_medium.jpg', 1);
INSERT INTO `product_images` VALUES (76, 38, 'https://product.hstatic.net/1000290074/product/83024000-1_bda88c56b8cd402dbe714da1db36c331_medium.jpg', 2);
INSERT INTO `product_images` VALUES (77, 39, 'https://product.hstatic.net/1000290074/product/93514000-4_a1efe4ab5fc643a49fa6624d94a28377_medium.jpg', 1);
INSERT INTO `product_images` VALUES (78, 39, 'https://product.hstatic.net/1000290074/product/93514000-6_3410721d4b1f44a5883c918af850c12f_medium.jpg', 2);
INSERT INTO `product_images` VALUES (79, 40, 'https://product.hstatic.net/1000290074/product/93776000-5_8212f7b2fcfe41878adba8849def943c_medium.jpg', 1);
INSERT INTO `product_images` VALUES (80, 40, 'https://product.hstatic.net/1000290074/product/93776000-6_2e812345315a4f72a57cd26d9c4ff6c4_medium.jpg', 2);
INSERT INTO `product_images` VALUES (81, 41, 'https://product.hstatic.net/1000290074/product/4_2_80402fc079ae4c108ec437778dd227b4_medium.jpg', 1);
INSERT INTO `product_images` VALUES (82, 41, 'https://product.hstatic.net/1000290074/product/5_2_4c0d2ab96d874bb1b5898527a9884abd_medium.jpg', 2);
INSERT INTO `product_images` VALUES (83, 42, 'https://product.hstatic.net/1000290074/product/13_2_bee90fe3a969481e83ea042fafb57933_medium.jpg', 1);
INSERT INTO `product_images` VALUES (84, 42, 'https://product.hstatic.net/1000290074/product/13_1_33f90768f64341a394790a74fed223e8_medium.jpg', 2);
INSERT INTO `product_images` VALUES (85, 43, 'https://product.hstatic.net/1000290074/product/10_2_a943a954fb6f426f89cee60e44a4ff37_medium.jpg', 1);
INSERT INTO `product_images` VALUES (86, 43, 'https://product.hstatic.net/1000290074/product/10_1_2d12a29dc442483cbdb5deb2c2dd907a_medium.jpg', 2);
INSERT INTO `product_images` VALUES (87, 44, 'https://product.hstatic.net/1000290074/product/9_2_286490ebc9ed4554a88847b60a327527_medium.jpg', 1);
INSERT INTO `product_images` VALUES (88, 44, 'https://product.hstatic.net/1000290074/product/9_3_7c485755d6a3489a81153ac362a7de61_medium.jpg', 2);
INSERT INTO `product_images` VALUES (89, 45, 'https://product.hstatic.net/1000290074/product/11_1_a89715dcddf14beab756f27348e649b5_medium.jpg', 1);
INSERT INTO `product_images` VALUES (90, 45, 'https://product.hstatic.net/1000290074/product/12_2_2ea5fbd11a2a415fa7113f903c9d5953_medium.jpg', 2);
INSERT INTO `product_images` VALUES (91, 46, 'https://product.hstatic.net/1000290074/product/989003240-1_d9ecfb35a5524d28916c39dc5160ecee_medium.jpg', 1);
INSERT INTO `product_images` VALUES (92, 46, 'https://product.hstatic.net/1000290074/product/989003240-2_af18bb26777f435897c3e18b0b38ef87_medium.jpg', 2);
INSERT INTO `product_images` VALUES (93, 47, 'https://product.hstatic.net/1000290074/product/989001240-4_1f84cc1384f94212958735cfd2469826_medium.jpg', 1);
INSERT INTO `product_images` VALUES (94, 47, 'https://product.hstatic.net/1000290074/product/989001240-5_2ddbc37d6603485c876794fbb0784013_medium.jpg', 2);
INSERT INTO `product_images` VALUES (95, 48, 'https://product.hstatic.net/1000290074/product/981004240-3_198a77bb7e2c431b9efcbf0fe3346a9b_medium.jpg', 1);
INSERT INTO `product_images` VALUES (96, 48, 'https://product.hstatic.net/1000290074/product/981004240-5_0473058202a24e2fa2189bc5c4fc7b9d_medium.jpg', 2);
INSERT INTO `product_images` VALUES (97, 49, 'https://product.hstatic.net/1000290074/product/981001240-1_2234357ed1b54b75a865f4e5e0f44689_medium.jpg', 1);
INSERT INTO `product_images` VALUES (98, 49, 'https://product.hstatic.net/1000290074/product/981001240-2_4e6ae94d494440aab5a3ad28b27dfe3d_medium.jpg', 2);
INSERT INTO `product_images` VALUES (99, 50, 'https://product.hstatic.net/1000290074/product/33029000-1_6f1ae03480bb4af599f37f504196940c_medium.jpg', 1);
INSERT INTO `product_images` VALUES (100, 50, 'https://product.hstatic.net/1000290074/product/33029000-5_fb1f89bf92cd4d7f9695bb5d2b0b5c2d_medium.jpg', 2);
INSERT INTO `product_images` VALUES (101, 51, 'https://product.hstatic.net/1000290074/product/33028000-1_9017f753ebee403cb8c13eb44edf8daa_medium.jpg', 1);
INSERT INTO `product_images` VALUES (102, 51, 'https://product.hstatic.net/1000290074/product/33028000-0_8df73046699b4eaa91cf08e9000027d0_medium.jpg', 2);
INSERT INTO `product_images` VALUES (103, 52, 'https://product.hstatic.net/1000290074/product/22033-3_b2f389e5d8ea4d3dac9f4d15a1cb11d6_medium.jpg', 1);
INSERT INTO `product_images` VALUES (104, 52, 'https://product.hstatic.net/1000290074/product/22033-10_2bb1b22734bb49a5ae00de9ca7306216_medium.jpg', 2);
INSERT INTO `product_images` VALUES (105, 53, 'https://product.hstatic.net/200000724807/product/312449924u-2-1_6732550a4fcd409ea66358582aa0e71c_grande.jpg', 1);
INSERT INTO `product_images` VALUES (106, 53, 'https://product.hstatic.net/200000724807/product/312449924u-1-1_a10a76990a754cfe842733282e6eeeb3_grande.jpg', 2);
INSERT INTO `product_images` VALUES (107, 54, 'https://product.hstatic.net/200000724807/product/312449922u-1-1_70a2166e8e0f4e0c9c3c7048fee9db55_grande.jpg', 1);
INSERT INTO `product_images` VALUES (108, 54, 'https://product.hstatic.net/200000724807/product/312449922u-1-2_f416575a9e7e49f19ec10d7b9d803e69_grande.jpg', 2);
INSERT INTO `product_images` VALUES (109, 55, 'https://product.hstatic.net/200000724807/product/a12519930-2-1__1__ddc497413caf42049b22303b2bd2f1bd_grande.jpg', 1);
INSERT INTO `product_images` VALUES (110, 55, 'https://product.hstatic.net/200000724807/product/a12519930-5-1__1__9e4ab03ca9654027b0207ae12179fc63_grande.jpg', 2);
INSERT INTO `product_images` VALUES (111, 56, 'https://product.hstatic.net/200000724807/product/312449926u-1-1_d46dc9af59624255bc5f3e50693dd817_grande.jpg', 1);
INSERT INTO `product_images` VALUES (112, 56, 'https://product.hstatic.net/200000724807/product/312449926u-1-2_ebce7dc65d424c668916e63e655b41b8_grande.jpg', 2);
INSERT INTO `product_images` VALUES (113, 57, 'https://product.hstatic.net/200000724807/product/a12515508-4-1__2__a406b9c482e44bfc917cef5eb315456a_grande.jpg', 1);
INSERT INTO `product_images` VALUES (114, 57, 'https://product.hstatic.net/200000724807/product/a12515508-4-3__2__8f993be67451423e8ad4b868fde3185f_grande.jpg', 2);
INSERT INTO `product_images` VALUES (115, 58, 'https://product.hstatic.net/200000724807/product/312511111-6-1__1__155b8ebbc736456cbf9420bcb80e67dd_grande.jpg', 1);
INSERT INTO `product_images` VALUES (116, 58, 'https://product.hstatic.net/200000724807/product/312511111-4-1__1__c08ffadafa7748dc8db9137923989447_grande.jpg', 2);
INSERT INTO `product_images` VALUES (117, 59, 'https://product.hstatic.net/200000724807/product/a12519904-2-1_d3924ca8bd844784b0c4f9cc2a37921a_grande.jpg', 1);
INSERT INTO `product_images` VALUES (118, 59, 'https://product.hstatic.net/200000724807/product/a12519904-2-2_f5af030e83dc4329bfa0088e2c4482c7_grande.jpg', 2);
INSERT INTO `product_images` VALUES (119, 60, 'https://product.hstatic.net/200000724807/product/312519903-2-1_0d8c3d3cd74d4f4e8db80e797fa73ffa_grande.jpg', 1);
INSERT INTO `product_images` VALUES (120, 60, 'https://product.hstatic.net/200000724807/product/312519903-2-3_0a6303d9f8ac4b96895d49d15f7b18f4_grande.jpg', 2);
INSERT INTO `product_images` VALUES (121, 61, 'https://product.hstatic.net/200000465365/product/set-tui-hop-2_e16dac380651458a855cd7e03e4f3163_grande.jpg', 1);
INSERT INTO `product_images` VALUES (122, 61, 'https://product.hstatic.net/200000465365/product/set-tui-hop-cam-3_79e0c3f51cc8497a8b505c0cd8b1d126_grande.jpg', 2);
INSERT INTO `product_images` VALUES (123, 62, 'https://product.hstatic.net/200000465365/product/set-ny-cam-1_6b2a1b740d504b75969fb12906e4292c_grande.jpg', 1);
INSERT INTO `product_images` VALUES (124, 62, 'https://product.hstatic.net/200000465365/product/set-ny-cam-1_6b2a1b740d504b75969fb12906e4292c_grande.jpg', 2);
INSERT INTO `product_images` VALUES (125, 63, 'https://product.hstatic.net/200000465365/product/bo-sat-nach-tay-lo-quan-tui-hop-7_64f00be21efc4a4c9ad566d155e7aedd_grande.jpg', 1);
INSERT INTO `product_images` VALUES (126, 63, 'https://product.hstatic.net/200000465365/product/bo-sat-nach-tay-lo-quan-tui-hop-3_7f7186dcaa424cdaa69d6b082b30a7c1_grande.jpg', 2);
INSERT INTO `product_images` VALUES (127, 64, 'https://product.hstatic.net/200000465365/product/sn-77-1_6f6e0ce8676e41b7af62c68202e831a5_grande.jpg', 1);
INSERT INTO `product_images` VALUES (128, 64, 'https://product.hstatic.net/200000465365/product/sn-77-xanhd-2_c7a2d9255acb4cb4ad1e828051c69692_grande.jpg', 2);
INSERT INTO `product_images` VALUES (129, 65, 'https://product.hstatic.net/200000465365/product/bo-labubu-bong-chay-3_00d0ad2f65c34506b0f6f7a1a92e52bd_grande.jpg', 1);
INSERT INTO `product_images` VALUES (130, 65, 'https://product.hstatic.net/200000465365/product/bo-labubu-bong-chay-4_d8cfe208e0a74e29bad6b492cefb88c6_grande.jpg', 2);
INSERT INTO `product_images` VALUES (131, 66, 'https://product.hstatic.net/200000465365/product/bo-sat-nach-nguoi-nhen-7_632fa9f6773246fdb86921c80c57a541_grande.jpg', 1);
INSERT INTO `product_images` VALUES (132, 66, 'https://product.hstatic.net/200000465365/product/bo-sat-nach-nguoi-nhen-1_0857bcd948a448c1923a298ef353053a_grande.jpg', 2);
INSERT INTO `product_images` VALUES (133, 67, 'https://product.hstatic.net/200000465365/product/bo-sat-nach-shin-kem_319ced3cdc8348f7ac87e54734b03d3a_large_0f0c212eb803443ea47dd30af60114ee_grande.jpg', 1);
INSERT INTO `product_images` VALUES (134, 67, 'https://product.hstatic.net/200000465365/product/bo-sat-nach-shin-den_0a437c0ad5214272ac0557ca25d3a9c0_large_69a8d134b12f46239fb2bdeda686d6e6_grande.jpg', 2);
INSERT INTO `product_images` VALUES (135, 68, 'https://product.hstatic.net/200000465365/product/bo-loang-labubu-2_6bb375f7f84b4b81b7c4904a1446f31b_grande.jpg', 1);
INSERT INTO `product_images` VALUES (136, 68, 'https://product.hstatic.net/200000465365/product/bo-loang-labubu-1_7f8ce64b686d43cb9a92c5cbf63980f9_grande.jpg', 2);
INSERT INTO `product_images` VALUES (137, 69, 'https://product.hstatic.net/200000465365/product/set-kem-tui-vang-1_5469363c50b94a9b88f1ddf3f8267319_grande.jpg', 1);
INSERT INTO `product_images` VALUES (138, 69, 'https://product.hstatic.net/200000465365/product/set-be-trai-kem-tui-vang-2_94c36ac0581f43f3a423f2413e1352a7_grande.jpg', 2);
INSERT INTO `product_images` VALUES (139, 70, 'https://product.hstatic.net/200000465365/product/set-nhen-xanh-6_fb890ad5d2f34296a4768b1fc57c9613_grande.jpg', 1);
INSERT INTO `product_images` VALUES (140, 70, 'https://product.hstatic.net/200000465365/product/set-nhen-xanh-8_9df1699a5abc4cff94c088f4de96ccd5_grande.jpg', 2);
INSERT INTO `product_images` VALUES (141, 71, 'https://product.hstatic.net/200000465365/product/sn-star-xanh-4_cba061f348a14eacab31b090f05381dc_grande.jpg', 1);
INSERT INTO `product_images` VALUES (142, 71, 'https://product.hstatic.net/200000465365/product/sb-star-den-2_6a54a1916c464c8e90ea6311c82e8215_grande.jpg', 2);
INSERT INTO `product_images` VALUES (143, 72, 'https://product.hstatic.net/200000465365/product/bo-thun-baby-three-2_469be3a23b5b4bd39e9e7a847fd96cfb_grande.jpg', 1);
INSERT INTO `product_images` VALUES (144, 72, 'https://product.hstatic.net/200000465365/product/bo-thun-baby-three-3_5fafa8ec03dd4f2fb157ebfac5beaab4_grande.jpg', 2);
INSERT INTO `product_images` VALUES (145, 73, 'https://product.hstatic.net/200000465365/product/set-thun-givenchy-xanh-21_34a3d285dc524ef7b0ac219464384c2c_grande.jpg', 1);
INSERT INTO `product_images` VALUES (146, 73, 'https://product.hstatic.net/200000465365/product/set-thun-givenchy-do-22_fc52326765ab4a8b84ac7cc7419ba97c_grande.jpg', 2);
INSERT INTO `product_images` VALUES (147, 74, 'https://product.hstatic.net/200000465365/product/set-bt-kenzo-xanh-15_10847eaf183648748929d3e77dcf6cde_grande.jpg', 1);
INSERT INTO `product_images` VALUES (148, 74, 'https://product.hstatic.net/200000465365/product/set-be-trai-kenzo-trang-14_21bd1c7cdadf4f32964c718ddaad2262_grande.jpg', 2);
INSERT INTO `product_images` VALUES (149, 75, 'https://product.hstatic.net/200000465365/product/set-gc-trang-16_0b62478b06ab46c7bac1f594bf3a3140_grande.jpg', 1);
INSERT INTO `product_images` VALUES (150, 75, 'https://product.hstatic.net/200000465365/product/set-gc-trang-16_0b62478b06ab46c7bac1f594bf3a3140_grande.jpg', 2);
INSERT INTO `product_images` VALUES (151, 76, 'https://product.hstatic.net/200000465365/product/set-bt-bbt-xanh-18_4af4dab228e24ebbb545c00d08aa852f_grande.jpg', 1);
INSERT INTO `product_images` VALUES (152, 76, 'https://product.hstatic.net/200000465365/product/set-bt-bbt-xanh-18_4af4dab228e24ebbb545c00d08aa852f_grande.jpg', 2);
INSERT INTO `product_images` VALUES (153, 77, 'https://product.hstatic.net/200000465365/product/set-jean-lbb-do-20_c0a223af8d8e40dd91877a11d92349d1_grande.jpg', 1);
INSERT INTO `product_images` VALUES (154, 77, 'https://product.hstatic.net/200000465365/product/set-jean-labubu-xanh-19_7f412be8031d4d40bc81511f01e5c1f3_grande.jpg', 2);
INSERT INTO `product_images` VALUES (155, 78, 'https://product.hstatic.net/200000465365/product/set-thun-74-do-23_faad6f9495244691b9b80d57ec10cb6f_grande.jpg', 1);
INSERT INTO `product_images` VALUES (156, 78, 'https://product.hstatic.net/200000465365/product/set-thun-74-trang-24_2a6faa66ff5b45f6b5be221acf9af556_grande.jpg', 2);
INSERT INTO `product_images` VALUES (157, 79, 'https://product.hstatic.net/200000465365/product/set-ao-dai-do-2_6cd3ed1c1afe48b1b6d95abab142afe8_grande.jpg', 1);
INSERT INTO `product_images` VALUES (158, 79, 'https://product.hstatic.net/200000465365/product/set-ao-dai-vang-3_ce82d4b822244b56b89f7cfb9968621e_grande.jpg', 2);
INSERT INTO `product_images` VALUES (159, 80, 'https://product.hstatic.net/200000465365/product/set-jean-labubu-do-1_2f9e521795c64456832797c2bbffca74_grande.jpg', 1);
INSERT INTO `product_images` VALUES (160, 80, 'https://product.hstatic.net/200000465365/product/set-jean-labubu-do-1_2f9e521795c64456832797c2bbffca74_grande.jpg', 2);
INSERT INTO `product_images` VALUES (161, 81, 'https://product.hstatic.net/200000465365/product/ao-gia-dinh-tet-1_8dcf9be61b45465980561ab2309449ae_grande.jpg', 1);
INSERT INTO `product_images` VALUES (162, 81, 'https://product.hstatic.net/200000465365/product/ao-gia-dinh-tet-2_752fb448aa2343e0bbbe141f25a747b7_grande.jpg', 2);
INSERT INTO `product_images` VALUES (163, 82, 'https://product.hstatic.net/200000465365/product/ao-thun-loang-hong-1_2f0d860c360c46f2893b8c102c5a89b3_grande.jpg', 1);
INSERT INTO `product_images` VALUES (164, 82, 'https://product.hstatic.net/200000465365/product/ao-thun-loang-miu-3_de68069134bc4efcabb8c81c5a9b1650_grande.jpg', 2);
INSERT INTO `product_images` VALUES (165, 83, 'https://product.hstatic.net/200000465365/product/469704523_973770218119250_2233909055428312928_n_7ab3bbf230c743e7ace3bc9236124df1_grande.jpeg', 1);
INSERT INTO `product_images` VALUES (166, 83, 'https://product.hstatic.net/200000465365/product/469689940_973770231452582_4324132832786060343_n_c744e9a92ad04d4aba2112151c562366_grande.jpeg', 2);
INSERT INTO `product_images` VALUES (167, 84, 'https://product.hstatic.net/200000465365/product/ao-thun-noel-5_4200710ff679447db2ee19479a2582e0_grande.jpg', 1);
INSERT INTO `product_images` VALUES (168, 84, 'https://product.hstatic.net/200000465365/product/ao-thun-noel-8_12192c6568ed435aa6edcf240fe0424c_grande.jpg', 2);
INSERT INTO `product_images` VALUES (169, 85, 'https://product.hstatic.net/200000465365/product/ao-khoac-labubu-xanh-5_ed7cfab39b2943189c742594d55d2727_grande.jpg', 1);
INSERT INTO `product_images` VALUES (170, 85, 'https://product.hstatic.net/200000465365/product/ao-khoac-labub-hong-4_1c5b096159254d8a8c203d2d89bf9a6e_grande.jpg', 2);
INSERT INTO `product_images` VALUES (171, 86, 'https://product.hstatic.net/200000465365/product/ao-hoodie-labubu-tre-em-5_e9e9f96d2a364733b0c9d56be46d29ec_grande.jpg', 1);
INSERT INTO `product_images` VALUES (172, 86, 'https://product.hstatic.net/200000465365/product/ao-hoodie-labubu-tre-em-6_d32980737972456998054ca552bc07b3_grande.jpg', 2);
INSERT INTO `product_images` VALUES (173, 87, 'https://product.hstatic.net/200000465365/product/so-gio-tho-kuromi_0a011618b84a41f4be8e86a7f923e468_grande.jpg', 1);
INSERT INTO `product_images` VALUES (174, 87, 'https://product.hstatic.net/200000465365/product/so-gio-tho-elsa_ecff80110d034433807305e9fda67c92_grande.jpg', 2);
INSERT INTO `product_images` VALUES (175, 88, 'https://product.hstatic.net/200000465365/product/ao-thun-the-thao-chu-b-kem_955293fafb39499ea0b6e8323ad4150e_grande.jpg', 1);
INSERT INTO `product_images` VALUES (176, 88, 'https://product.hstatic.net/200000465365/product/4de7a07e-066a-41e9-afbf-578131e492da_d9da8e723fbc48baafdc384cae2bc658.jfif', 2);
INSERT INTO `product_images` VALUES (177, 89, 'https://product.hstatic.net/200000465365/product/6f72cac58339b8cd7d6d7f256b06218da7e8605c_5b25173179cd42aa98e6a6767dea314d_grande.jpg', 1);
INSERT INTO `product_images` VALUES (178, 89, 'https://product.hstatic.net/200000465365/product/bcbb97175810d2b00b6adcdf7551ef87be55da68_f1428f9ed4db452d8105854b2f90fd15_grande.jpg', 2);
INSERT INTO `product_images` VALUES (179, 90, 'https://product.hstatic.net/200000465365/product/ao-thun-dark-le-vien-do_39eeebbb41014dd4aa7c06539e02be6f_grande.jpg', 1);
INSERT INTO `product_images` VALUES (180, 90, 'https://product.hstatic.net/200000465365/product/ao-thun-dark-le-vien-trang_2d615a5fea2d4f8d802b8bf49c7434ee_grande.jpg', 2);
INSERT INTO `product_images` VALUES (181, 91, 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F50%2Fab%2F50abe97af3724c3d0e1a87aa3a9dfd731b76ab1d.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 1);
INSERT INTO `product_images` VALUES (182, 91, 'https://image.hm.com/assets/hm/c2/04/c204a02db9028ca6cfb7c11cc7a41bbaa6dc4562.jpg?imwidth=1260', 2);
INSERT INTO `product_images` VALUES (183, 92, 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F97%2F7d%2F977dd430d9667820bedcc12edc20f4493b03d731.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 1);
INSERT INTO `product_images` VALUES (184, 92, 'https://image.hm.com/assets/hm/2f/49/2f490d51c34d2d487edff85542dead1701603d63.jpg?imwidth=1260', 2);
INSERT INTO `product_images` VALUES (185, 93, 'https://image.hm.com/assets/hm/38/43/3843bbdc6f1fcf852c748a86b595de9e9bdfceba.jpg?imwidth=1260', 1);
INSERT INTO `product_images` VALUES (186, 93, 'https://image.hm.com/assets/hm/e7/fa/e7fabbf7642e5e3e34238daabe01b2b236da6beb.jpg?imwidth=1260', 2);
INSERT INTO `product_images` VALUES (187, 94, 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F47%2F20%2F47206f526fa962aa33cd55275723af2814dffd46.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 1);
INSERT INTO `product_images` VALUES (188, 94, 'https://image.hm.com/assets/hm/1b/02/1b023d396e6d0afa2670f8f2ae3842ec07dc7766.jpg?imwidth=1260', 2);
INSERT INTO `product_images` VALUES (189, 95, 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F68%2F66%2F6866b0a547b3288b36d2c1d330412a01d1bc8820.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 1);
INSERT INTO `product_images` VALUES (190, 95, 'https://image.hm.com/assets/hm/29/2f/292ff7c52bf84a7ef022c1d0b5181678bc588293.jpg?imwidth=1260', 2);
INSERT INTO `product_images` VALUES (191, 96, 'https://product.hstatic.net/1000290074/product/dsc08771_5175dd7006d840af828393b4694d3df3.jpg', 1);
INSERT INTO `product_images` VALUES (192, 96, 'https://product.hstatic.net/1000290074/product/510009-2_75606b3ab56a495894e1daf710260845.jpg', 2);
INSERT INTO `product_images` VALUES (193, 97, 'https://product.hstatic.net/1000290074/product/9100121-6_a39e946c374a48b1b4b12add2a7abab9.jpg', 1);
INSERT INTO `product_images` VALUES (194, 97, 'https://product.hstatic.net/1000290074/product/9100122_aee8398dc9e5438397baca651523ff7e.jpg', 2);
INSERT INTO `product_images` VALUES (195, 98, 'https://product.hstatic.net/1000290074/product/500078-1_bf7f530974d04898b0af32b0701959d7.jpg', 1);
INSERT INTO `product_images` VALUES (196, 98, 'https://product.hstatic.net/1000290074/product/500078-4_bc58019542a64c15840eee79015eec6a.jpg', 2);
INSERT INTO `product_images` VALUES (197, 99, 'https://product.hstatic.net/1000290074/product/dsc08858_copy_c9b21a61312447aeadb807d3a7479f1e.jpg', 1);
INSERT INTO `product_images` VALUES (198, 99, 'https://product.hstatic.net/1000290074/product/dsc08872_copy_0e75c565bc1c4d4593f5c30b5014df7c.jpg', 2);
INSERT INTO `product_images` VALUES (199, 100, 'https://product.hstatic.net/1000290074/product/900083-3_ba2d1c4ab2254e97b2c6af9ccd94cfcb.jpg', 1);
INSERT INTO `product_images` VALUES (200, 100, 'https://product.hstatic.net/1000290074/product/900083-7_89c5c389a4ce4622b50125bcbe16a64e.jpg', 2);
INSERT INTO `product_images` VALUES (201, 101, 'https://product.hstatic.net/1000290074/product/943004241-1_ca4476347ef4418a996279db82d48262.jpg', 1);
INSERT INTO `product_images` VALUES (202, 101, 'https://product.hstatic.net/1000290074/product/943004241-4_9f31ca95d2a94f6a8f46de21f6e979a6.jpg', 2);
INSERT INTO `product_images` VALUES (203, 102, 'https://product.hstatic.net/1000290074/product/842001-1_b779c5b3ebd941109dfac7a950dc3b36.jpg', 1);
INSERT INTO `product_images` VALUES (204, 102, 'https://product.hstatic.net/1000290074/product/842001-7_410a99dc04754532a8bec355f37656b6.jpg', 2);
INSERT INTO `product_images` VALUES (205, 103, 'https://product.hstatic.net/1000290074/product/9_copy_dba297869b454f1089b9e836f52f5213.jpg', 1);
INSERT INTO `product_images` VALUES (206, 103, 'https://product.hstatic.net/1000290074/product/dsc00075_copy_4335e21e12a348018ebad0dc54a22c93.jpg', 2);
INSERT INTO `product_images` VALUES (207, 104, 'https://product.hstatic.net/1000290074/product/943003-2_6684030caa4642878a8c9e7342dda174.jpg', 1);
INSERT INTO `product_images` VALUES (208, 104, 'https://product.hstatic.net/1000290074/product/943003-7_462254c374bf411ca280ce345ba128c7.jpg', 2);
INSERT INTO `product_images` VALUES (209, 105, 'https://product.hstatic.net/1000290074/product/841001241-0_506b5e2cd79a4fbf864338a4be6075c4.jpg', 1);
INSERT INTO `product_images` VALUES (210, 105, 'https://product.hstatic.net/1000290074/product/841001241-1_ebfac57210d0449c92af9abe750d234b.jpg', 2);
INSERT INTO `product_images` VALUES (211, 106, 'https://product.hstatic.net/1000290074/product/8440012410403-0_d8668ff4cebd45409a2fa1e20fb2be5a.jpg', 1);
INSERT INTO `product_images` VALUES (212, 106, 'https://product.hstatic.net/1000290074/product/8440012410403-1_03e6b1f45f5443d186df9697bff224fc.jpg', 2);
INSERT INTO `product_images` VALUES (213, 107, 'https://product.hstatic.net/1000290074/product/941009241_c7250e828a2142a7b1153b65988ef020.jpg', 1);
INSERT INTO `product_images` VALUES (214, 107, 'https://product.hstatic.net/1000290074/product/941009241-1_6a23d0fee89b4a61955da3fa7a6e7fbc.jpg', 2);
INSERT INTO `product_images` VALUES (215, 108, 'https://product.hstatic.net/1000290074/product/941010241_404ac4f517a341efbaa034765a5a96e0.jpg', 1);
INSERT INTO `product_images` VALUES (216, 108, 'https://product.hstatic.net/1000290074/product/941010241-1_3f817328ae95474b87af19f2751ee2a6.jpg', 2);
INSERT INTO `product_images` VALUES (217, 109, 'https://product.hstatic.net/1000290074/product/5615-1_46cbad44213f4f8e91beb4db3822ff69.jpg', 1);
INSERT INTO `product_images` VALUES (218, 109, 'https://product.hstatic.net/1000290074/product/5615-3_ae239d8813014d3db4c94c523fa6896c.jpg', 2);
INSERT INTO `product_images` VALUES (219, 110, 'https://product.hstatic.net/1000290074/product/1_1bf16e1b1bfb41dcaa86d997206f74ab.png', 1);
INSERT INTO `product_images` VALUES (220, 110, 'https://product.hstatic.net/1000290074/product/3_67d0145eeb224a88acae99b8c087542c.png', 2);
INSERT INTO `product_images` VALUES (221, 111, 'https://product.hstatic.net/1000290074/product/93132000-1_c485fda9b51d46208ad89092eb04b3bc.jpg', 1);
INSERT INTO `product_images` VALUES (222, 111, 'https://product.hstatic.net/1000290074/product/93132000-5_c2569ad2fc4d46158ab526018d12a382.jpg', 2);
INSERT INTO `product_images` VALUES (223, 112, 'https://product.hstatic.net/1000290074/product/83016-3_55f0462a1bbd4b36ad16491d1ee3678d.jpg', 1);
INSERT INTO `product_images` VALUES (224, 112, 'https://product.hstatic.net/1000290074/product/83016-4_a3b9d41651f64beba307320d73af6bce.jpg', 2);
INSERT INTO `product_images` VALUES (225, 113, 'https://product.hstatic.net/1000290074/product/92556000-1_e1a707a59baa4259960cbd8b37dd3553.jpg', 1);
INSERT INTO `product_images` VALUES (226, 113, 'https://product.hstatic.net/1000290074/product/92556000-4_9be4662e23684ba7a44910b422ba19ac.jpg', 2);
INSERT INTO `product_images` VALUES (227, 114, 'https://product.hstatic.net/1000290074/product/544001241-0_cd1038bb39d348e3a7d0a8ea0e1a80a9.jpg', 1);
INSERT INTO `product_images` VALUES (228, 114, 'https://product.hstatic.net/1000290074/product/544001241-3_450f5279b28548ceb54035faba947dc6.jpg', 2);
INSERT INTO `product_images` VALUES (229, 115, 'https://product.hstatic.net/1000290074/product/5410012410623-0_f7b87e31e30b4438ae68e7ae6fa5c1b0.jpg', 1);
INSERT INTO `product_images` VALUES (230, 115, 'https://product.hstatic.net/1000290074/product/5410012410623-1_ddbdbf8d4296464b9202a40628d72af0.jpg', 2);
INSERT INTO `product_images` VALUES (231, 116, 'https://product.hstatic.net/1000290074/product/944001241-1_a5bfc2b74f0e41d3ae94b2f7c8193ee3.jpg', 1);
INSERT INTO `product_images` VALUES (232, 116, 'https://product.hstatic.net/1000290074/product/944001241-5_c417245ff151412c9270152e42d83020.jpg', 2);
INSERT INTO `product_images` VALUES (233, 117, 'https://product.hstatic.net/1000290074/product/943002241-1_4d8c630a002543ada696438cf6676d78.jpg', 1);
INSERT INTO `product_images` VALUES (234, 117, 'https://product.hstatic.net/1000290074/product/943002241-6_bc2241be01f14172b61d1435b76e5668.jpg', 2);
INSERT INTO `product_images` VALUES (235, 118, 'https://product.hstatic.net/1000290074/product/930010241-0_7f22b79291494b93bfd1e599a92462ba.jpg', 1);
INSERT INTO `product_images` VALUES (236, 118, 'https://product.hstatic.net/1000290074/product/930010241-1_8cd8243cfa4e4734b6bf753899e56caf.jpg', 2);
INSERT INTO `product_images` VALUES (237, 119, 'https://product.hstatic.net/1000290074/product/9310032410423-0_43536100fcc14d3b8112be6ca60fd819.jpg', 1);
INSERT INTO `product_images` VALUES (238, 119, 'https://product.hstatic.net/1000290074/product/9310032410423-1_2c308092d982420e9c8c7f0dbccca4eb.jpg', 2);
INSERT INTO `product_images` VALUES (239, 120, 'https://product.hstatic.net/1000290074/product/930009241-1_d406075111744a74bd173fba52ab59f0.jpg', 1);
INSERT INTO `product_images` VALUES (240, 120, 'https://product.hstatic.net/1000290074/product/930009241-6_3ff440db79e04fae8946833cf2d90bc0.jpg', 2);
INSERT INTO `product_images` VALUES (241, 121, 'https://product.hstatic.net/1000290074/product/7_copy_7884302ff71e4ba59e66b1ea5bbbe38d.jpg', 1);
INSERT INTO `product_images` VALUES (242, 121, 'https://product.hstatic.net/1000290074/product/7-3_3b7477c2380d474d8a9ce89c8d29d43b.jpg', 2);
INSERT INTO `product_images` VALUES (243, 122, 'https://product.hstatic.net/1000290074/product/5_copy_604d12365ec844b392fc3f48e77ad69c.jpg', 1);
INSERT INTO `product_images` VALUES (244, 122, 'https://product.hstatic.net/1000290074/product/5_4_a4fb9752103741c8afd3db45267e615b.jpg', 2);
INSERT INTO `product_images` VALUES (245, 123, 'https://product.hstatic.net/1000290074/product/8_copy_4e5cfcd27ca8437b974ce3b55818dc2d.jpg', 1);
INSERT INTO `product_images` VALUES (246, 123, 'https://product.hstatic.net/1000290074/product/8-3_6a7cbfedc66844d9a6ae89cf4bf0a1b2.jpg', 2);
INSERT INTO `product_images` VALUES (247, 124, 'https://product.hstatic.net/1000290074/product/855002_40717b11f0ce45448373a939851f5ecd.jpg', 1);
INSERT INTO `product_images` VALUES (248, 124, 'https://product.hstatic.net/1000290074/product/855002-2_3006bfadadf749a0b93ed7b3397fda0a.jpg', 2);
INSERT INTO `product_images` VALUES (249, 125, 'https://product.hstatic.net/1000290074/product/955018241-0_69fe4af9551a4e1a8aef298fc72ae822.jpg', 1);
INSERT INTO `product_images` VALUES (250, 125, 'https://product.hstatic.net/1000290074/product/dsc09543_copy_06a417bdee0f499f8939058ab1b5c020.jpg', 2);
INSERT INTO `product_images` VALUES (251, 126, 'https://product.hstatic.net/1000290074/product/855003241-1_a544329c6d5043d48b9a1dfc1d4badbc.jpg', 1);
INSERT INTO `product_images` VALUES (252, 126, 'https://product.hstatic.net/1000290074/product/855003241-6_573fe875b2e54e3c8acf1129a524a491.jpg', 2);
INSERT INTO `product_images` VALUES (253, 127, 'https://product.hstatic.net/1000290074/product/5_a019119b9de540fe9936391ee16f2e10.png', 1);
INSERT INTO `product_images` VALUES (254, 127, 'https://product.hstatic.net/1000290074/product/6_3b7f982736c04abcb85b1a8b18c439cd.png', 2);
INSERT INTO `product_images` VALUES (255, 128, 'https://product.hstatic.net/1000290074/product/555005241-0_3ee70b2533014a63a7790ef8a1e2e1be.jpg', 1);
INSERT INTO `product_images` VALUES (256, 128, 'https://product.hstatic.net/1000290074/product/555005241-3_f74cff02a13e4df19f92b30dc3319005.jpg', 2);
INSERT INTO `product_images` VALUES (257, 129, 'https://product.hstatic.net/1000290074/product/955012241-0_a5d879026a104cf7ac8256237697708b.jpg', 1);
INSERT INTO `product_images` VALUES (258, 129, 'https://product.hstatic.net/1000290074/product/955.012_65b2b9884021447fa477438a2fd0965d.jpg', 2);
INSERT INTO `product_images` VALUES (259, 130, 'https://product.hstatic.net/1000290074/product/955007241-1_cc0203bb2baa4b90a67eb8e3dfce08a6.jpg', 1);
INSERT INTO `product_images` VALUES (260, 130, 'https://product.hstatic.net/1000290074/product/955007241-6_e3c69e0a289f49cebb11c6474da7dde4.jpg', 2);
INSERT INTO `product_images` VALUES (261, 131, 'https://product.hstatic.net/1000290074/product/955002241-1_6d1c564286a846e1ba34c4fb5e3eb1d6.jpg', 1);
INSERT INTO `product_images` VALUES (262, 131, 'https://product.hstatic.net/1000290074/product/955002241-6_9358254846c14009b9f024bc6367494a.jpg', 2);
INSERT INTO `product_images` VALUES (263, 132, 'https://product.hstatic.net/1000290074/product/9550102410423_c482d2b998af4940bfe56799d5f6d0a9.jpg', 1);
INSERT INTO `product_images` VALUES (264, 132, 'https://product.hstatic.net/1000290074/product/955010_1eec3ea377494f8abbf8cf0511b49c3a.jpg', 2);
INSERT INTO `product_images` VALUES (265, 133, 'https://product.hstatic.net/1000290074/product/9550112410423_bc8ab326a57741e4830f2c0b755088fc.jpg', 1);
INSERT INTO `product_images` VALUES (266, 133, 'https://product.hstatic.net/1000290074/product/955011_5aa24246e9d5419fbdc4f557a7c2ed8c.jpg', 2);
INSERT INTO `product_images` VALUES (267, 134, 'https://product.hstatic.net/1000290074/product/5550042410423_41d4cc31d75441099c70974fa2b19c5d.jpg', 1);
INSERT INTO `product_images` VALUES (268, 134, 'https://product.hstatic.net/1000290074/product/555.004_7ec7a5f429b24502a5d2e7bb3a6eed37.jpg', 2);
INSERT INTO `product_images` VALUES (269, 135, 'https://product.hstatic.net/1000290074/product/555002-0_b984b8a549fc4493b2d8195cf1549d77.jpg', 1);
INSERT INTO `product_images` VALUES (270, 135, 'https://product.hstatic.net/1000290074/product/555002-3_cde73986dffc4a65a4be7093e0bb8411.jpg', 2);
INSERT INTO `product_images` VALUES (271, 136, 'https://product.hstatic.net/1000290074/product/555001-1_86831c4d3b07419e9fd013815dbc1de7.jpg', 1);
INSERT INTO `product_images` VALUES (272, 136, 'https://product.hstatic.net/1000290074/product/rabity9279_copy_dc72c14e0ff244788e0f214451d404fc.jpg', 2);
INSERT INTO `product_images` VALUES (273, 137, 'https://product.hstatic.net/1000290074/product/83041000-0_d6abd6195f454c4c92169dd70220fdc7.jpg', 1);
INSERT INTO `product_images` VALUES (274, 137, 'https://product.hstatic.net/1000290074/product/83041000-1_07917af886b942c988228009a1fdab88.jpg', 2);
INSERT INTO `product_images` VALUES (275, 138, 'https://product.hstatic.net/1000290074/product/83030000-4_21c7b6cd2db3492e9e8fb3dfc33bcd84.jpg', 1);
INSERT INTO `product_images` VALUES (276, 138, 'https://product.hstatic.net/1000290074/product/83030000-5_46beaa7de7cb4b4b9d5b90c81840ceea.jpg', 2);
INSERT INTO `product_images` VALUES (277, 139, 'https://product.hstatic.net/1000290074/product/93816000-0_69ad3480acf44723a8c48275b0b65bcc.jpg', 1);
INSERT INTO `product_images` VALUES (278, 139, 'https://product.hstatic.net/1000290074/product/93816000-1_1fb203c0e759426580033a94f79f3ab6.jpg', 2);
INSERT INTO `product_images` VALUES (279, 140, 'https://product.hstatic.net/1000290074/product/57350000-1_acbdd9c396af4788b7a5d94c49a89d93.jpg', 1);
INSERT INTO `product_images` VALUES (280, 140, 'https://product.hstatic.net/1000290074/product/57350000-2_335e72bfa99e4e2598a8569ab73203a5.jpg', 2);
INSERT INTO `product_images` VALUES (281, 141, 'https://product.hstatic.net/1000290074/product/10_copy_57d7f37ecf344d7db786b1828f3ee3e2.jpg', 1);
INSERT INTO `product_images` VALUES (282, 141, 'https://product.hstatic.net/1000290074/product/10_1_71e39c1c64234f03ac811471703846b0.jpg', 2);
INSERT INTO `product_images` VALUES (283, 142, 'https://product.hstatic.net/1000290074/product/960040251-1_395eb2f571c74535852f40182491f8a1.jpg', 1);
INSERT INTO `product_images` VALUES (284, 142, 'https://product.hstatic.net/1000290074/product/960040251-3_cdfd9594147d49a0a4ace7b4091ba037.jpg', 2);
INSERT INTO `product_images` VALUES (285, 143, 'https://product.hstatic.net/1000290074/product/960039251-1_7c5181f3c4a34cdb82b3c63483baa905.jpg', 1);
INSERT INTO `product_images` VALUES (286, 143, 'https://product.hstatic.net/1000290074/product/960039251-3_3f068f670c24415ca9b7a63145abc5e4.jpg', 2);
INSERT INTO `product_images` VALUES (287, 144, 'https://product.hstatic.net/1000290074/product/560045251-1_915ddf1c0a404e74a237abe712ccfd22.jpg', 1);
INSERT INTO `product_images` VALUES (288, 144, 'https://product.hstatic.net/1000290074/product/560045251-3_7b78d15a0df340ab953844d0396d8cce.jpg', 2);
INSERT INTO `product_images` VALUES (289, 145, 'https://product.hstatic.net/1000290074/product/960042251-1_96e4cc263ff54e59acd10e65da05d96e.jpg', 1);
INSERT INTO `product_images` VALUES (290, 145, 'https://product.hstatic.net/1000290074/product/960042251-3_98411a198cba4c2c8382449aeeffe91d.jpg', 2);
INSERT INTO `product_images` VALUES (291, 146, 'https://product.hstatic.net/1000290074/product/96003525-2_8e3622dba11448c6b0332e58c2150d24.jpg', 1);
INSERT INTO `product_images` VALUES (292, 146, 'https://product.hstatic.net/1000290074/product/96003525-7_6787677dbdac48239b83166aad9d8c3f.jpg', 2);
INSERT INTO `product_images` VALUES (293, 147, 'https://product.hstatic.net/1000290074/product/962008251-1_7c86471b671c4bf090588e0bce134401.jpg', 1);
INSERT INTO `product_images` VALUES (294, 147, 'https://product.hstatic.net/1000290074/product/962008251-7_028c84705ecf4207b2f4bd7fd2ecf3fd.jpg', 2);
INSERT INTO `product_images` VALUES (295, 148, 'https://product.hstatic.net/1000290074/product/96100425_89fd29f55d4045eca9a5b16e75a622f0.jpg', 1);
INSERT INTO `product_images` VALUES (296, 149, 'https://product.hstatic.net/1000290074/product/96100425-2_4f7c9b0c0227418fa9dbe8de9ee99123.jpg', 2);
INSERT INTO `product_images` VALUES (297, 149, 'https://product.hstatic.net/1000290074/product/96100425-3_7f5a61a9dbb2499e987f899dce68d5d6.jpg', 1);
INSERT INTO `product_images` VALUES (298, 150, 'https://product.hstatic.net/1000290074/product/957006251-1_e1e81540f96446d297783c322d26e7fe.jpg', 2);
INSERT INTO `product_images` VALUES (299, 150, 'https://product.hstatic.net/1000290074/product/957006251-4_c7bf0436d06c4e03bba388f646c28f74.jpg', 1);
INSERT INTO `product_images` VALUES (300, 148, 'https://product.hstatic.net/1000290074/product/96100425_89fd29f55d4045eca9a5b16e75a622f0.jpg', 1);

-- ----------------------------
-- Table structure for product_variants
-- ----------------------------
DROP TABLE IF EXISTS `product_variants`;
CREATE TABLE `product_variants`  (
  `idVariant` int(11) NOT NULL AUTO_INCREMENT,
  `idProduct` int(11) NOT NULL,
  `idSize` int(11) NOT NULL,
  `idColor` int(11) NOT NULL,
  `stockQuantity` int(11) NOT NULL,
  PRIMARY KEY (`idVariant`) USING BTREE,
  INDEX `idProduct`(`idProduct`) USING BTREE,
  INDEX `idSize`(`idSize`) USING BTREE,
  INDEX `idColor`(`idColor`) USING BTREE,
  CONSTRAINT `product_variants_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `products` (`idProduct`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_variants_ibfk_2` FOREIGN KEY (`idSize`) REFERENCES `sizes` (`idSize`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_variants_ibfk_3` FOREIGN KEY (`idColor`) REFERENCES `colors` (`idColor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1036 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_variants
-- ----------------------------
INSERT INTO `product_variants` VALUES (1, 1, 6, 1, 20);
INSERT INTO `product_variants` VALUES (2, 1, 4, 1, 20);
INSERT INTO `product_variants` VALUES (3, 1, 1, 1, 20);
INSERT INTO `product_variants` VALUES (4, 1, 2, 2, 20);
INSERT INTO `product_variants` VALUES (5, 1, 4, 2, 20);
INSERT INTO `product_variants` VALUES (6, 1, 4, 2, 20);
INSERT INTO `product_variants` VALUES (7, 2, 4, 1, 20);
INSERT INTO `product_variants` VALUES (8, 2, 6, 1, 20);
INSERT INTO `product_variants` VALUES (9, 2, 5, 1, 20);
INSERT INTO `product_variants` VALUES (10, 2, 4, 3, 20);
INSERT INTO `product_variants` VALUES (11, 2, 6, 3, 20);
INSERT INTO `product_variants` VALUES (12, 2, 4, 3, 20);
INSERT INTO `product_variants` VALUES (13, 3, 6, 4, 20);
INSERT INTO `product_variants` VALUES (14, 3, 3, 4, 20);
INSERT INTO `product_variants` VALUES (15, 3, 5, 4, 20);
INSERT INTO `product_variants` VALUES (16, 4, 3, 3, 20);
INSERT INTO `product_variants` VALUES (17, 4, 6, 3, 20);
INSERT INTO `product_variants` VALUES (18, 4, 4, 3, 20);
INSERT INTO `product_variants` VALUES (19, 4, 6, 5, 20);
INSERT INTO `product_variants` VALUES (20, 4, 4, 5, 20);
INSERT INTO `product_variants` VALUES (21, 4, 1, 5, 20);
INSERT INTO `product_variants` VALUES (22, 5, 4, 6, 20);
INSERT INTO `product_variants` VALUES (23, 5, 5, 6, 20);
INSERT INTO `product_variants` VALUES (24, 5, 6, 6, 20);
INSERT INTO `product_variants` VALUES (25, 5, 2, 6, 20);
INSERT INTO `product_variants` VALUES (26, 6, 3, 7, 20);
INSERT INTO `product_variants` VALUES (27, 6, 4, 7, 20);
INSERT INTO `product_variants` VALUES (28, 6, 5, 7, 20);
INSERT INTO `product_variants` VALUES (29, 6, 3, 8, 20);
INSERT INTO `product_variants` VALUES (30, 6, 4, 8, 20);
INSERT INTO `product_variants` VALUES (31, 6, 5, 8, 20);
INSERT INTO `product_variants` VALUES (32, 7, 4, 3, 20);
INSERT INTO `product_variants` VALUES (33, 7, 6, 3, 20);
INSERT INTO `product_variants` VALUES (34, 7, 2, 3, 20);
INSERT INTO `product_variants` VALUES (35, 7, 2, 8, 20);
INSERT INTO `product_variants` VALUES (36, 7, 5, 8, 20);
INSERT INTO `product_variants` VALUES (37, 7, 6, 8, 20);
INSERT INTO `product_variants` VALUES (38, 8, 6, 6, 20);
INSERT INTO `product_variants` VALUES (39, 8, 2, 6, 20);
INSERT INTO `product_variants` VALUES (40, 8, 3, 6, 20);
INSERT INTO `product_variants` VALUES (41, 8, 6, 9, 20);
INSERT INTO `product_variants` VALUES (42, 8, 3, 9, 20);
INSERT INTO `product_variants` VALUES (43, 8, 6, 9, 20);
INSERT INTO `product_variants` VALUES (44, 9, 4, 7, 20);
INSERT INTO `product_variants` VALUES (45, 9, 6, 7, 20);
INSERT INTO `product_variants` VALUES (46, 9, 2, 7, 20);
INSERT INTO `product_variants` VALUES (47, 9, 4, 8, 20);
INSERT INTO `product_variants` VALUES (48, 9, 6, 8, 20);
INSERT INTO `product_variants` VALUES (49, 9, 3, 8, 20);
INSERT INTO `product_variants` VALUES (50, 10, 3, 1, 20);
INSERT INTO `product_variants` VALUES (51, 10, 4, 1, 20);
INSERT INTO `product_variants` VALUES (52, 10, 5, 1, 20);
INSERT INTO `product_variants` VALUES (53, 10, 3, 8, 20);
INSERT INTO `product_variants` VALUES (54, 10, 4, 8, 20);
INSERT INTO `product_variants` VALUES (55, 10, 5, 8, 20);
INSERT INTO `product_variants` VALUES (56, 11, 2, 8, 20);
INSERT INTO `product_variants` VALUES (57, 11, 3, 8, 20);
INSERT INTO `product_variants` VALUES (58, 11, 4, 8, 20);
INSERT INTO `product_variants` VALUES (59, 11, 2, 4, 20);
INSERT INTO `product_variants` VALUES (60, 11, 3, 4, 20);
INSERT INTO `product_variants` VALUES (61, 11, 4, 4, 20);
INSERT INTO `product_variants` VALUES (62, 12, 2, 8, 20);
INSERT INTO `product_variants` VALUES (63, 12, 3, 8, 20);
INSERT INTO `product_variants` VALUES (64, 12, 4, 8, 20);
INSERT INTO `product_variants` VALUES (65, 13, 2, 10, 20);
INSERT INTO `product_variants` VALUES (66, 13, 6, 10, 20);
INSERT INTO `product_variants` VALUES (67, 13, 5, 10, 20);
INSERT INTO `product_variants` VALUES (68, 13, 1, 7, 20);
INSERT INTO `product_variants` VALUES (69, 13, 1, 7, 20);
INSERT INTO `product_variants` VALUES (70, 13, 3, 7, 20);
INSERT INTO `product_variants` VALUES (71, 14, 5, 1, 20);
INSERT INTO `product_variants` VALUES (72, 14, 6, 1, 20);
INSERT INTO `product_variants` VALUES (73, 14, 6, 1, 20);
INSERT INTO `product_variants` VALUES (74, 14, 5, 3, 20);
INSERT INTO `product_variants` VALUES (75, 14, 6, 3, 20);
INSERT INTO `product_variants` VALUES (76, 14, 4, 3, 20);
INSERT INTO `product_variants` VALUES (77, 15, 4, 1, 20);
INSERT INTO `product_variants` VALUES (78, 15, 2, 1, 20);
INSERT INTO `product_variants` VALUES (79, 15, 5, 1, 20);
INSERT INTO `product_variants` VALUES (80, 15, 6, 8, 20);
INSERT INTO `product_variants` VALUES (81, 15, 1, 8, 20);
INSERT INTO `product_variants` VALUES (82, 15, 4, 8, 20);
INSERT INTO `product_variants` VALUES (83, 16, 4, 8, 20);
INSERT INTO `product_variants` VALUES (84, 16, 6, 8, 20);
INSERT INTO `product_variants` VALUES (85, 16, 2, 8, 20);
INSERT INTO `product_variants` VALUES (86, 16, 6, 8, 20);
INSERT INTO `product_variants` VALUES (87, 17, 2, 6, 20);
INSERT INTO `product_variants` VALUES (88, 17, 3, 6, 20);
INSERT INTO `product_variants` VALUES (89, 17, 6, 6, 20);
INSERT INTO `product_variants` VALUES (90, 17, 5, 2, 20);
INSERT INTO `product_variants` VALUES (91, 17, 1, 2, 20);
INSERT INTO `product_variants` VALUES (92, 17, 2, 2, 20);
INSERT INTO `product_variants` VALUES (93, 18, 5, 8, 20);
INSERT INTO `product_variants` VALUES (94, 18, 1, 8, 20);
INSERT INTO `product_variants` VALUES (95, 18, 6, 8, 20);
INSERT INTO `product_variants` VALUES (96, 18, 5, 4, 20);
INSERT INTO `product_variants` VALUES (97, 18, 1, 4, 20);
INSERT INTO `product_variants` VALUES (98, 18, 5, 4, 20);
INSERT INTO `product_variants` VALUES (99, 19, 5, 1, 20);
INSERT INTO `product_variants` VALUES (100, 19, 2, 1, 20);
INSERT INTO `product_variants` VALUES (101, 19, 5, 1, 20);
INSERT INTO `product_variants` VALUES (102, 19, 3, 8, 20);
INSERT INTO `product_variants` VALUES (103, 19, 4, 8, 20);
INSERT INTO `product_variants` VALUES (104, 19, 4, 8, 20);
INSERT INTO `product_variants` VALUES (105, 20, 3, 7, 20);
INSERT INTO `product_variants` VALUES (106, 20, 1, 7, 20);
INSERT INTO `product_variants` VALUES (107, 20, 2, 7, 20);
INSERT INTO `product_variants` VALUES (108, 20, 6, 7, 20);
INSERT INTO `product_variants` VALUES (109, 20, 1, 7, 20);
INSERT INTO `product_variants` VALUES (110, 21, 3, 6, 20);
INSERT INTO `product_variants` VALUES (111, 21, 4, 6, 20);
INSERT INTO `product_variants` VALUES (112, 21, 5, 6, 20);
INSERT INTO `product_variants` VALUES (113, 21, 3, 5, 20);
INSERT INTO `product_variants` VALUES (114, 21, 4, 5, 20);
INSERT INTO `product_variants` VALUES (115, 21, 5, 5, 20);
INSERT INTO `product_variants` VALUES (116, 22, 6, 10, 20);
INSERT INTO `product_variants` VALUES (117, 22, 4, 10, 20);
INSERT INTO `product_variants` VALUES (118, 22, 5, 10, 20);
INSERT INTO `product_variants` VALUES (119, 22, 6, 6, 20);
INSERT INTO `product_variants` VALUES (120, 22, 5, 6, 20);
INSERT INTO `product_variants` VALUES (121, 22, 3, 6, 20);
INSERT INTO `product_variants` VALUES (122, 23, 4, 10, 20);
INSERT INTO `product_variants` VALUES (123, 23, 2, 10, 20);
INSERT INTO `product_variants` VALUES (124, 23, 6, 10, 20);
INSERT INTO `product_variants` VALUES (125, 24, 1, 3, 20);
INSERT INTO `product_variants` VALUES (126, 24, 6, 3, 20);
INSERT INTO `product_variants` VALUES (127, 24, 3, 3, 20);
INSERT INTO `product_variants` VALUES (128, 24, 1, 10, 20);
INSERT INTO `product_variants` VALUES (129, 24, 3, 10, 20);
INSERT INTO `product_variants` VALUES (130, 24, 4, 10, 20);
INSERT INTO `product_variants` VALUES (131, 25, 6, 3, 20);
INSERT INTO `product_variants` VALUES (132, 25, 5, 3, 20);
INSERT INTO `product_variants` VALUES (133, 25, 5, 3, 20);
INSERT INTO `product_variants` VALUES (134, 25, 5, 3, 20);
INSERT INTO `product_variants` VALUES (135, 26, 1, 3, 20);
INSERT INTO `product_variants` VALUES (136, 26, 4, 3, 20);
INSERT INTO `product_variants` VALUES (137, 26, 4, 3, 20);
INSERT INTO `product_variants` VALUES (138, 26, 6, 6, 20);
INSERT INTO `product_variants` VALUES (139, 26, 2, 6, 20);
INSERT INTO `product_variants` VALUES (140, 26, 4, 6, 20);
INSERT INTO `product_variants` VALUES (141, 27, 6, 8, 20);
INSERT INTO `product_variants` VALUES (142, 27, 1, 8, 20);
INSERT INTO `product_variants` VALUES (143, 27, 5, 8, 20);
INSERT INTO `product_variants` VALUES (144, 27, 2, 8, 20);
INSERT INTO `product_variants` VALUES (145, 28, 6, 10, 20);
INSERT INTO `product_variants` VALUES (146, 28, 6, 10, 20);
INSERT INTO `product_variants` VALUES (147, 28, 5, 10, 20);
INSERT INTO `product_variants` VALUES (148, 28, 3, 10, 20);
INSERT INTO `product_variants` VALUES (149, 28, 5, 10, 20);
INSERT INTO `product_variants` VALUES (150, 29, 3, 7, 20);
INSERT INTO `product_variants` VALUES (151, 29, 4, 7, 20);
INSERT INTO `product_variants` VALUES (152, 29, 5, 7, 20);
INSERT INTO `product_variants` VALUES (153, 29, 3, 11, 20);
INSERT INTO `product_variants` VALUES (154, 29, 4, 11, 20);
INSERT INTO `product_variants` VALUES (155, 29, 5, 11, 20);
INSERT INTO `product_variants` VALUES (156, 30, 3, 4, 20);
INSERT INTO `product_variants` VALUES (157, 30, 1, 4, 20);
INSERT INTO `product_variants` VALUES (158, 30, 2, 4, 20);
INSERT INTO `product_variants` VALUES (159, 30, 1, 4, 20);
INSERT INTO `product_variants` VALUES (160, 30, 2, 4, 20);
INSERT INTO `product_variants` VALUES (161, 31, 4, 5, 20);
INSERT INTO `product_variants` VALUES (162, 31, 5, 5, 20);
INSERT INTO `product_variants` VALUES (163, 31, 6, 5, 20);
INSERT INTO `product_variants` VALUES (164, 31, 4, 4, 20);
INSERT INTO `product_variants` VALUES (165, 31, 5, 4, 20);
INSERT INTO `product_variants` VALUES (166, 31, 6, 4, 20);
INSERT INTO `product_variants` VALUES (167, 32, 2, 6, 20);
INSERT INTO `product_variants` VALUES (168, 32, 4, 6, 20);
INSERT INTO `product_variants` VALUES (169, 32, 2, 10, 20);
INSERT INTO `product_variants` VALUES (170, 32, 5, 10, 20);
INSERT INTO `product_variants` VALUES (171, 33, 3, 10, 20);
INSERT INTO `product_variants` VALUES (172, 33, 4, 10, 20);
INSERT INTO `product_variants` VALUES (173, 33, 5, 10, 20);
INSERT INTO `product_variants` VALUES (174, 33, 6, 10, 20);
INSERT INTO `product_variants` VALUES (175, 34, 4, 6, 20);
INSERT INTO `product_variants` VALUES (176, 34, 5, 6, 20);
INSERT INTO `product_variants` VALUES (177, 34, 4, 10, 20);
INSERT INTO `product_variants` VALUES (178, 34, 5, 10, 20);
INSERT INTO `product_variants` VALUES (179, 35, 4, 10, 20);
INSERT INTO `product_variants` VALUES (180, 35, 6, 10, 20);
INSERT INTO `product_variants` VALUES (181, 35, 4, 10, 20);
INSERT INTO `product_variants` VALUES (182, 35, 6, 10, 20);
INSERT INTO `product_variants` VALUES (183, 36, 4, 10, 20);
INSERT INTO `product_variants` VALUES (184, 36, 6, 10, 20);
INSERT INTO `product_variants` VALUES (185, 36, 2, 10, 20);
INSERT INTO `product_variants` VALUES (186, 36, 3, 6, 20);
INSERT INTO `product_variants` VALUES (187, 36, 1, 6, 20);
INSERT INTO `product_variants` VALUES (188, 36, 2, 6, 20);
INSERT INTO `product_variants` VALUES (189, 37, 6, 6, 20);
INSERT INTO `product_variants` VALUES (190, 37, 5, 6, 20);
INSERT INTO `product_variants` VALUES (191, 37, 6, 3, 20);
INSERT INTO `product_variants` VALUES (192, 37, 1, 3, 20);
INSERT INTO `product_variants` VALUES (193, 38, 2, 7, 20);
INSERT INTO `product_variants` VALUES (194, 38, 3, 7, 20);
INSERT INTO `product_variants` VALUES (195, 38, 5, 7, 20);
INSERT INTO `product_variants` VALUES (196, 38, 2, 4, 20);
INSERT INTO `product_variants` VALUES (197, 38, 6, 4, 20);
INSERT INTO `product_variants` VALUES (198, 38, 5, 4, 20);
INSERT INTO `product_variants` VALUES (199, 39, 3, 8, 20);
INSERT INTO `product_variants` VALUES (200, 39, 4, 8, 20);
INSERT INTO `product_variants` VALUES (201, 39, 5, 8, 20);
INSERT INTO `product_variants` VALUES (202, 40, 3, 11, 20);
INSERT INTO `product_variants` VALUES (203, 40, 4, 11, 20);
INSERT INTO `product_variants` VALUES (204, 40, 5, 11, 20);
INSERT INTO `product_variants` VALUES (205, 41, 6, 3, 20);
INSERT INTO `product_variants` VALUES (206, 41, 4, 3, 20);
INSERT INTO `product_variants` VALUES (207, 41, 1, 3, 20);
INSERT INTO `product_variants` VALUES (208, 41, 2, 8, 20);
INSERT INTO `product_variants` VALUES (209, 41, 4, 8, 20);
INSERT INTO `product_variants` VALUES (210, 41, 1, 8, 20);
INSERT INTO `product_variants` VALUES (211, 42, 3, 4, 20);
INSERT INTO `product_variants` VALUES (212, 42, 5, 4, 20);
INSERT INTO `product_variants` VALUES (213, 42, 4, 4, 20);
INSERT INTO `product_variants` VALUES (214, 42, 6, 4, 20);
INSERT INTO `product_variants` VALUES (215, 43, 6, 4, 20);
INSERT INTO `product_variants` VALUES (216, 43, 5, 4, 20);
INSERT INTO `product_variants` VALUES (217, 43, 6, 4, 20);
INSERT INTO `product_variants` VALUES (218, 44, 3, 7, 20);
INSERT INTO `product_variants` VALUES (219, 44, 4, 7, 20);
INSERT INTO `product_variants` VALUES (220, 44, 5, 7, 20);
INSERT INTO `product_variants` VALUES (221, 44, 6, 7, 20);
INSERT INTO `product_variants` VALUES (222, 45, 3, 10, 20);
INSERT INTO `product_variants` VALUES (223, 45, 4, 10, 20);
INSERT INTO `product_variants` VALUES (224, 45, 5, 10, 20);
INSERT INTO `product_variants` VALUES (225, 45, 3, 3, 20);
INSERT INTO `product_variants` VALUES (226, 45, 4, 3, 20);
INSERT INTO `product_variants` VALUES (227, 45, 5, 3, 20);
INSERT INTO `product_variants` VALUES (228, 46, 2, 12, 20);
INSERT INTO `product_variants` VALUES (229, 46, 6, 12, 20);
INSERT INTO `product_variants` VALUES (230, 46, 4, 12, 20);
INSERT INTO `product_variants` VALUES (231, 47, 3, 8, 20);
INSERT INTO `product_variants` VALUES (232, 47, 6, 8, 20);
INSERT INTO `product_variants` VALUES (233, 47, 3, 8, 20);
INSERT INTO `product_variants` VALUES (234, 47, 4, 8, 20);
INSERT INTO `product_variants` VALUES (235, 48, 4, 3, 20);
INSERT INTO `product_variants` VALUES (236, 48, 2, 3, 20);
INSERT INTO `product_variants` VALUES (237, 48, 2, 3, 20);
INSERT INTO `product_variants` VALUES (238, 48, 4, 8, 20);
INSERT INTO `product_variants` VALUES (239, 48, 1, 8, 20);
INSERT INTO `product_variants` VALUES (240, 48, 3, 8, 20);
INSERT INTO `product_variants` VALUES (241, 49, 6, 12, 20);
INSERT INTO `product_variants` VALUES (242, 49, 1, 12, 20);
INSERT INTO `product_variants` VALUES (243, 49, 2, 12, 20);
INSERT INTO `product_variants` VALUES (244, 50, 1, 10, 20);
INSERT INTO `product_variants` VALUES (245, 50, 6, 10, 20);
INSERT INTO `product_variants` VALUES (246, 50, 6, 10, 20);
INSERT INTO `product_variants` VALUES (247, 50, 1, 10, 20);
INSERT INTO `product_variants` VALUES (248, 51, 4, 3, 20);
INSERT INTO `product_variants` VALUES (249, 51, 4, 3, 20);
INSERT INTO `product_variants` VALUES (250, 51, 2, 3, 20);
INSERT INTO `product_variants` VALUES (251, 51, 4, 3, 20);
INSERT INTO `product_variants` VALUES (252, 52, 6, 3, 20);
INSERT INTO `product_variants` VALUES (253, 52, 5, 3, 20);
INSERT INTO `product_variants` VALUES (254, 52, 6, 3, 20);
INSERT INTO `product_variants` VALUES (255, 53, 4, 8, 20);
INSERT INTO `product_variants` VALUES (256, 53, 1, 8, 20);
INSERT INTO `product_variants` VALUES (257, 53, 6, 8, 20);
INSERT INTO `product_variants` VALUES (258, 53, 5, 3, 20);
INSERT INTO `product_variants` VALUES (259, 53, 4, 3, 20);
INSERT INTO `product_variants` VALUES (260, 53, 5, 3, 20);
INSERT INTO `product_variants` VALUES (261, 54, 4, 8, 20);
INSERT INTO `product_variants` VALUES (262, 54, 6, 8, 20);
INSERT INTO `product_variants` VALUES (263, 54, 3, 8, 20);
INSERT INTO `product_variants` VALUES (264, 54, 6, 8, 20);
INSERT INTO `product_variants` VALUES (265, 55, 1, 3, 20);
INSERT INTO `product_variants` VALUES (266, 55, 3, 3, 20);
INSERT INTO `product_variants` VALUES (267, 55, 1, 8, 20);
INSERT INTO `product_variants` VALUES (268, 55, 6, 8, 20);
INSERT INTO `product_variants` VALUES (269, 56, 4, 8, 20);
INSERT INTO `product_variants` VALUES (270, 56, 1, 8, 20);
INSERT INTO `product_variants` VALUES (271, 56, 3, 8, 20);
INSERT INTO `product_variants` VALUES (272, 56, 6, 8, 20);
INSERT INTO `product_variants` VALUES (273, 57, 4, 3, 20);
INSERT INTO `product_variants` VALUES (274, 57, 1, 3, 20);
INSERT INTO `product_variants` VALUES (275, 57, 2, 3, 20);
INSERT INTO `product_variants` VALUES (276, 58, 4, 8, 20);
INSERT INTO `product_variants` VALUES (277, 58, 1, 8, 20);
INSERT INTO `product_variants` VALUES (278, 58, 2, 3, 20);
INSERT INTO `product_variants` VALUES (279, 58, 3, 3, 20);
INSERT INTO `product_variants` VALUES (280, 59, 6, 7, 20);
INSERT INTO `product_variants` VALUES (281, 59, 3, 7, 20);
INSERT INTO `product_variants` VALUES (282, 59, 5, 7, 20);
INSERT INTO `product_variants` VALUES (283, 59, 2, 7, 20);
INSERT INTO `product_variants` VALUES (284, 60, 6, 1, 20);
INSERT INTO `product_variants` VALUES (285, 60, 2, 1, 20);
INSERT INTO `product_variants` VALUES (286, 60, 6, 1, 20);
INSERT INTO `product_variants` VALUES (287, 60, 3, 1, 20);
INSERT INTO `product_variants` VALUES (288, 60, 5, 1, 20);
INSERT INTO `product_variants` VALUES (289, 61, 4, 13, 20);
INSERT INTO `product_variants` VALUES (290, 61, 1, 13, 20);
INSERT INTO `product_variants` VALUES (291, 61, 4, 13, 20);
INSERT INTO `product_variants` VALUES (292, 61, 6, 13, 20);
INSERT INTO `product_variants` VALUES (293, 61, 3, 13, 20);
INSERT INTO `product_variants` VALUES (294, 62, 6, 8, 20);
INSERT INTO `product_variants` VALUES (295, 62, 5, 8, 20);
INSERT INTO `product_variants` VALUES (296, 62, 1, 8, 20);
INSERT INTO `product_variants` VALUES (297, 63, 3, 3, 20);
INSERT INTO `product_variants` VALUES (298, 63, 4, 3, 20);
INSERT INTO `product_variants` VALUES (299, 63, 5, 3, 20);
INSERT INTO `product_variants` VALUES (300, 64, 3, 9, 20);
INSERT INTO `product_variants` VALUES (301, 64, 4, 9, 20);
INSERT INTO `product_variants` VALUES (302, 64, 5, 9, 20);
INSERT INTO `product_variants` VALUES (303, 64, 3, 8, 20);
INSERT INTO `product_variants` VALUES (304, 64, 4, 8, 20);
INSERT INTO `product_variants` VALUES (305, 64, 5, 8, 20);
INSERT INTO `product_variants` VALUES (306, 65, 3, 1, 20);
INSERT INTO `product_variants` VALUES (307, 65, 4, 1, 20);
INSERT INTO `product_variants` VALUES (308, 65, 5, 1, 20);
INSERT INTO `product_variants` VALUES (309, 65, 3, 3, 20);
INSERT INTO `product_variants` VALUES (310, 65, 4, 3, 20);
INSERT INTO `product_variants` VALUES (311, 65, 5, 3, 20);
INSERT INTO `product_variants` VALUES (312, 66, 5, 1, 20);
INSERT INTO `product_variants` VALUES (313, 66, 6, 1, 20);
INSERT INTO `product_variants` VALUES (314, 66, 1, 1, 20);
INSERT INTO `product_variants` VALUES (315, 66, 5, 2, 20);
INSERT INTO `product_variants` VALUES (316, 66, 6, 2, 20);
INSERT INTO `product_variants` VALUES (317, 66, 2, 2, 20);
INSERT INTO `product_variants` VALUES (318, 67, 4, 8, 20);
INSERT INTO `product_variants` VALUES (319, 67, 5, 8, 20);
INSERT INTO `product_variants` VALUES (320, 67, 6, 8, 20);
INSERT INTO `product_variants` VALUES (321, 67, 4, 3, 20);
INSERT INTO `product_variants` VALUES (322, 67, 5, 3, 20);
INSERT INTO `product_variants` VALUES (323, 67, 6, 3, 20);
INSERT INTO `product_variants` VALUES (324, 68, 5, 13, 20);
INSERT INTO `product_variants` VALUES (325, 68, 6, 13, 20);
INSERT INTO `product_variants` VALUES (326, 68, 6, 13, 20);
INSERT INTO `product_variants` VALUES (327, 69, 5, 2, 20);
INSERT INTO `product_variants` VALUES (328, 69, 6, 2, 20);
INSERT INTO `product_variants` VALUES (329, 69, 5, 2, 20);
INSERT INTO `product_variants` VALUES (330, 69, 5, 1, 20);
INSERT INTO `product_variants` VALUES (331, 69, 6, 1, 20);
INSERT INTO `product_variants` VALUES (332, 69, 1, 1, 20);
INSERT INTO `product_variants` VALUES (333, 70, 2, 7, 20);
INSERT INTO `product_variants` VALUES (334, 70, 6, 7, 20);
INSERT INTO `product_variants` VALUES (335, 70, 4, 7, 20);
INSERT INTO `product_variants` VALUES (336, 71, 4, 8, 20);
INSERT INTO `product_variants` VALUES (337, 71, 5, 8, 20);
INSERT INTO `product_variants` VALUES (338, 71, 6, 8, 20);
INSERT INTO `product_variants` VALUES (339, 72, 4, 2, 20);
INSERT INTO `product_variants` VALUES (340, 72, 5, 2, 20);
INSERT INTO `product_variants` VALUES (341, 72, 6, 2, 20);
INSERT INTO `product_variants` VALUES (342, 72, 4, 5, 20);
INSERT INTO `product_variants` VALUES (343, 72, 5, 5, 20);
INSERT INTO `product_variants` VALUES (344, 72, 6, 5, 20);
INSERT INTO `product_variants` VALUES (345, 73, 5, 1, 20);
INSERT INTO `product_variants` VALUES (346, 73, 6, 1, 20);
INSERT INTO `product_variants` VALUES (347, 73, 4, 1, 20);
INSERT INTO `product_variants` VALUES (348, 73, 5, 9, 20);
INSERT INTO `product_variants` VALUES (349, 73, 6, 9, 20);
INSERT INTO `product_variants` VALUES (350, 73, 1, 9, 20);
INSERT INTO `product_variants` VALUES (351, 74, 6, 5, 20);
INSERT INTO `product_variants` VALUES (352, 74, 4, 5, 20);
INSERT INTO `product_variants` VALUES (353, 74, 5, 5, 20);
INSERT INTO `product_variants` VALUES (354, 74, 6, 8, 20);
INSERT INTO `product_variants` VALUES (355, 74, 5, 8, 20);
INSERT INTO `product_variants` VALUES (356, 74, 3, 8, 20);
INSERT INTO `product_variants` VALUES (357, 75, 6, 8, 20);
INSERT INTO `product_variants` VALUES (358, 75, 4, 8, 20);
INSERT INTO `product_variants` VALUES (359, 75, 2, 8, 20);
INSERT INTO `product_variants` VALUES (360, 76, 4, 5, 20);
INSERT INTO `product_variants` VALUES (361, 76, 5, 5, 20);
INSERT INTO `product_variants` VALUES (362, 76, 6, 5, 20);
INSERT INTO `product_variants` VALUES (363, 77, 4, 1, 20);
INSERT INTO `product_variants` VALUES (364, 77, 5, 1, 20);
INSERT INTO `product_variants` VALUES (365, 77, 6, 1, 20);
INSERT INTO `product_variants` VALUES (366, 77, 4, 9, 20);
INSERT INTO `product_variants` VALUES (367, 77, 5, 9, 20);
INSERT INTO `product_variants` VALUES (368, 77, 6, 9, 20);
INSERT INTO `product_variants` VALUES (369, 78, 4, 1, 20);
INSERT INTO `product_variants` VALUES (370, 78, 5, 1, 20);
INSERT INTO `product_variants` VALUES (371, 78, 6, 1, 20);
INSERT INTO `product_variants` VALUES (372, 78, 4, 8, 20);
INSERT INTO `product_variants` VALUES (373, 78, 5, 8, 20);
INSERT INTO `product_variants` VALUES (374, 78, 6, 8, 20);
INSERT INTO `product_variants` VALUES (375, 79, 3, 1, 20);
INSERT INTO `product_variants` VALUES (376, 79, 4, 1, 20);
INSERT INTO `product_variants` VALUES (377, 79, 5, 1, 20);
INSERT INTO `product_variants` VALUES (378, 79, 3, 2, 20);
INSERT INTO `product_variants` VALUES (379, 79, 4, 2, 20);
INSERT INTO `product_variants` VALUES (380, 79, 5, 2, 20);
INSERT INTO `product_variants` VALUES (381, 80, 4, 1, 20);
INSERT INTO `product_variants` VALUES (382, 80, 5, 1, 20);
INSERT INTO `product_variants` VALUES (383, 80, 6, 1, 20);
INSERT INTO `product_variants` VALUES (384, 81, 4, 1, 20);
INSERT INTO `product_variants` VALUES (385, 81, 5, 1, 20);
INSERT INTO `product_variants` VALUES (386, 81, 6, 1, 20);
INSERT INTO `product_variants` VALUES (387, 82, 6, 14, 20);
INSERT INTO `product_variants` VALUES (388, 82, 1, 14, 20);
INSERT INTO `product_variants` VALUES (389, 82, 5, 14, 20);
INSERT INTO `product_variants` VALUES (390, 83, 5, 14, 20);
INSERT INTO `product_variants` VALUES (391, 83, 6, 14, 20);
INSERT INTO `product_variants` VALUES (392, 83, 3, 14, 20);
INSERT INTO `product_variants` VALUES (393, 84, 3, 1, 20);
INSERT INTO `product_variants` VALUES (394, 84, 4, 1, 20);
INSERT INTO `product_variants` VALUES (395, 84, 5, 1, 20);
INSERT INTO `product_variants` VALUES (396, 85, 5, 15, 20);
INSERT INTO `product_variants` VALUES (397, 85, 6, 15, 20);
INSERT INTO `product_variants` VALUES (398, 85, 5, 15, 20);
INSERT INTO `product_variants` VALUES (399, 86, 4, 3, 20);
INSERT INTO `product_variants` VALUES (400, 86, 5, 3, 20);
INSERT INTO `product_variants` VALUES (401, 86, 6, 3, 20);
INSERT INTO `product_variants` VALUES (402, 87, 5, 4, 20);
INSERT INTO `product_variants` VALUES (403, 87, 6, 4, 20);
INSERT INTO `product_variants` VALUES (404, 87, 6, 4, 20);
INSERT INTO `product_variants` VALUES (405, 88, 6, 8, 20);
INSERT INTO `product_variants` VALUES (406, 88, 1, 8, 20);
INSERT INTO `product_variants` VALUES (407, 88, 5, 8, 20);
INSERT INTO `product_variants` VALUES (408, 89, 3, 8, 20);
INSERT INTO `product_variants` VALUES (409, 89, 4, 8, 20);
INSERT INTO `product_variants` VALUES (410, 89, 5, 8, 20);
INSERT INTO `product_variants` VALUES (411, 90, 5, 1, 20);
INSERT INTO `product_variants` VALUES (412, 90, 1, 1, 20);
INSERT INTO `product_variants` VALUES (413, 90, 4, 1, 20);
INSERT INTO `product_variants` VALUES (414, 91, 4, 5, 20);
INSERT INTO `product_variants` VALUES (415, 91, 5, 5, 20);
INSERT INTO `product_variants` VALUES (416, 91, 6, 5, 20);
INSERT INTO `product_variants` VALUES (417, 92, 4, 5, 20);
INSERT INTO `product_variants` VALUES (418, 92, 5, 5, 20);
INSERT INTO `product_variants` VALUES (419, 92, 6, 5, 20);
INSERT INTO `product_variants` VALUES (420, 93, 3, 2, 20);
INSERT INTO `product_variants` VALUES (421, 93, 4, 2, 20);
INSERT INTO `product_variants` VALUES (422, 93, 5, 2, 20);
INSERT INTO `product_variants` VALUES (423, 94, 3, 3, 20);
INSERT INTO `product_variants` VALUES (424, 94, 4, 3, 20);
INSERT INTO `product_variants` VALUES (425, 94, 5, 3, 20);
INSERT INTO `product_variants` VALUES (426, 95, 3, 3, 20);
INSERT INTO `product_variants` VALUES (427, 95, 4, 3, 20);
INSERT INTO `product_variants` VALUES (428, 95, 5, 3, 20);
INSERT INTO `product_variants` VALUES (429, 96, 3, 8, 20);
INSERT INTO `product_variants` VALUES (430, 96, 4, 8, 20);
INSERT INTO `product_variants` VALUES (431, 96, 5, 8, 20);
INSERT INTO `product_variants` VALUES (432, 97, 3, 2, 20);
INSERT INTO `product_variants` VALUES (433, 97, 4, 2, 20);
INSERT INTO `product_variants` VALUES (434, 97, 5, 2, 20);
INSERT INTO `product_variants` VALUES (435, 98, 3, 1, 20);
INSERT INTO `product_variants` VALUES (436, 98, 4, 1, 20);
INSERT INTO `product_variants` VALUES (437, 98, 5, 1, 20);
INSERT INTO `product_variants` VALUES (438, 99, 3, 8, 20);
INSERT INTO `product_variants` VALUES (439, 99, 4, 8, 20);
INSERT INTO `product_variants` VALUES (440, 99, 5, 8, 20);
INSERT INTO `product_variants` VALUES (441, 100, 3, 14, 20);
INSERT INTO `product_variants` VALUES (442, 100, 4, 14, 20);
INSERT INTO `product_variants` VALUES (443, 100, 5, 14, 20);
INSERT INTO `product_variants` VALUES (444, 101, 3, 3, 20);
INSERT INTO `product_variants` VALUES (445, 101, 4, 3, 20);
INSERT INTO `product_variants` VALUES (446, 101, 5, 3, 20);
INSERT INTO `product_variants` VALUES (447, 102, 3, 15, 20);
INSERT INTO `product_variants` VALUES (448, 102, 4, 15, 20);
INSERT INTO `product_variants` VALUES (449, 102, 5, 15, 20);
INSERT INTO `product_variants` VALUES (450, 103, 3, 15, 20);
INSERT INTO `product_variants` VALUES (451, 103, 4, 15, 20);
INSERT INTO `product_variants` VALUES (452, 103, 5, 15, 20);
INSERT INTO `product_variants` VALUES (453, 104, 3, 14, 20);
INSERT INTO `product_variants` VALUES (454, 104, 4, 14, 20);
INSERT INTO `product_variants` VALUES (455, 104, 5, 14, 20);
INSERT INTO `product_variants` VALUES (456, 105, 3, 5, 20);
INSERT INTO `product_variants` VALUES (457, 105, 4, 5, 20);
INSERT INTO `product_variants` VALUES (458, 105, 5, 5, 20);
INSERT INTO `product_variants` VALUES (459, 106, 3, 3, 20);
INSERT INTO `product_variants` VALUES (460, 106, 4, 3, 20);
INSERT INTO `product_variants` VALUES (461, 106, 5, 3, 20);
INSERT INTO `product_variants` VALUES (462, 107, 3, 5, 20);
INSERT INTO `product_variants` VALUES (463, 107, 4, 5, 20);
INSERT INTO `product_variants` VALUES (464, 107, 5, 5, 20);
INSERT INTO `product_variants` VALUES (465, 108, 3, 5, 20);
INSERT INTO `product_variants` VALUES (466, 108, 4, 5, 20);
INSERT INTO `product_variants` VALUES (467, 108, 5, 5, 20);
INSERT INTO `product_variants` VALUES (468, 109, 3, 16, 20);
INSERT INTO `product_variants` VALUES (469, 109, 4, 16, 20);
INSERT INTO `product_variants` VALUES (470, 109, 5, 16, 20);
INSERT INTO `product_variants` VALUES (471, 110, 3, 3, 20);
INSERT INTO `product_variants` VALUES (472, 110, 4, 3, 20);
INSERT INTO `product_variants` VALUES (473, 110, 5, 3, 20);
INSERT INTO `product_variants` VALUES (474, 111, 3, 3, 20);
INSERT INTO `product_variants` VALUES (475, 111, 4, 3, 20);
INSERT INTO `product_variants` VALUES (476, 111, 5, 3, 20);
INSERT INTO `product_variants` VALUES (477, 112, 3, 7, 20);
INSERT INTO `product_variants` VALUES (478, 112, 4, 7, 20);
INSERT INTO `product_variants` VALUES (479, 112, 5, 7, 20);
INSERT INTO `product_variants` VALUES (480, 113, 3, 3, 20);
INSERT INTO `product_variants` VALUES (481, 113, 4, 3, 20);
INSERT INTO `product_variants` VALUES (482, 113, 5, 3, 20);
INSERT INTO `product_variants` VALUES (483, 114, 3, 14, 20);
INSERT INTO `product_variants` VALUES (484, 114, 4, 14, 20);
INSERT INTO `product_variants` VALUES (485, 114, 5, 14, 20);
INSERT INTO `product_variants` VALUES (486, 115, 3, 5, 20);
INSERT INTO `product_variants` VALUES (487, 115, 4, 5, 20);
INSERT INTO `product_variants` VALUES (488, 115, 5, 5, 20);
INSERT INTO `product_variants` VALUES (489, 116, 3, 15, 20);
INSERT INTO `product_variants` VALUES (490, 116, 4, 15, 20);
INSERT INTO `product_variants` VALUES (491, 116, 5, 15, 20);
INSERT INTO `product_variants` VALUES (492, 117, 3, 14, 20);
INSERT INTO `product_variants` VALUES (493, 117, 4, 14, 20);
INSERT INTO `product_variants` VALUES (494, 117, 5, 14, 20);
INSERT INTO `product_variants` VALUES (495, 118, 3, 14, 20);
INSERT INTO `product_variants` VALUES (496, 118, 4, 14, 20);
INSERT INTO `product_variants` VALUES (497, 118, 5, 14, 20);
INSERT INTO `product_variants` VALUES (498, 119, 3, 3, 20);
INSERT INTO `product_variants` VALUES (499, 119, 4, 3, 20);
INSERT INTO `product_variants` VALUES (500, 119, 5, 3, 20);
INSERT INTO `product_variants` VALUES (501, 120, 3, 14, 20);
INSERT INTO `product_variants` VALUES (502, 120, 4, 14, 20);
INSERT INTO `product_variants` VALUES (503, 120, 5, 14, 20);
INSERT INTO `product_variants` VALUES (504, 121, 3, 2, 20);
INSERT INTO `product_variants` VALUES (505, 121, 4, 2, 20);
INSERT INTO `product_variants` VALUES (506, 121, 5, 2, 20);
INSERT INTO `product_variants` VALUES (507, 122, 3, 3, 20);
INSERT INTO `product_variants` VALUES (508, 122, 4, 3, 20);
INSERT INTO `product_variants` VALUES (509, 122, 5, 3, 20);
INSERT INTO `product_variants` VALUES (510, 123, 3, 14, 20);
INSERT INTO `product_variants` VALUES (511, 123, 4, 14, 20);
INSERT INTO `product_variants` VALUES (512, 123, 5, 14, 20);
INSERT INTO `product_variants` VALUES (513, 124, 3, 2, 20);
INSERT INTO `product_variants` VALUES (514, 124, 4, 2, 20);
INSERT INTO `product_variants` VALUES (515, 124, 5, 2, 20);
INSERT INTO `product_variants` VALUES (516, 125, 3, 3, 20);
INSERT INTO `product_variants` VALUES (517, 125, 4, 3, 20);
INSERT INTO `product_variants` VALUES (518, 125, 5, 3, 20);
INSERT INTO `product_variants` VALUES (519, 126, 3, 2, 20);
INSERT INTO `product_variants` VALUES (520, 126, 4, 2, 20);
INSERT INTO `product_variants` VALUES (521, 126, 5, 2, 20);
INSERT INTO `product_variants` VALUES (522, 127, 3, 14, 20);
INSERT INTO `product_variants` VALUES (523, 127, 4, 14, 20);
INSERT INTO `product_variants` VALUES (524, 127, 5, 14, 20);
INSERT INTO `product_variants` VALUES (525, 128, 3, 16, 20);
INSERT INTO `product_variants` VALUES (526, 128, 4, 16, 20);
INSERT INTO `product_variants` VALUES (527, 128, 5, 16, 20);
INSERT INTO `product_variants` VALUES (528, 129, 3, 15, 20);
INSERT INTO `product_variants` VALUES (529, 129, 4, 15, 20);
INSERT INTO `product_variants` VALUES (530, 129, 5, 15, 20);
INSERT INTO `product_variants` VALUES (531, 130, 3, 3, 20);
INSERT INTO `product_variants` VALUES (532, 130, 4, 3, 20);
INSERT INTO `product_variants` VALUES (533, 130, 5, 3, 20);
INSERT INTO `product_variants` VALUES (534, 131, 3, 14, 20);
INSERT INTO `product_variants` VALUES (535, 131, 4, 14, 20);
INSERT INTO `product_variants` VALUES (536, 131, 5, 14, 20);
INSERT INTO `product_variants` VALUES (537, 132, 3, 5, 20);
INSERT INTO `product_variants` VALUES (538, 132, 4, 5, 20);
INSERT INTO `product_variants` VALUES (539, 132, 5, 5, 20);
INSERT INTO `product_variants` VALUES (540, 133, 3, 5, 20);
INSERT INTO `product_variants` VALUES (541, 133, 4, 5, 20);
INSERT INTO `product_variants` VALUES (542, 133, 5, 5, 20);
INSERT INTO `product_variants` VALUES (543, 134, 3, 5, 20);
INSERT INTO `product_variants` VALUES (544, 134, 4, 5, 20);
INSERT INTO `product_variants` VALUES (545, 134, 5, 5, 20);
INSERT INTO `product_variants` VALUES (546, 135, 3, 15, 20);
INSERT INTO `product_variants` VALUES (547, 135, 4, 15, 20);
INSERT INTO `product_variants` VALUES (548, 135, 5, 15, 20);
INSERT INTO `product_variants` VALUES (549, 136, 3, 2, 20);
INSERT INTO `product_variants` VALUES (550, 136, 4, 2, 20);
INSERT INTO `product_variants` VALUES (551, 136, 5, 2, 20);
INSERT INTO `product_variants` VALUES (552, 137, 3, 3, 20);
INSERT INTO `product_variants` VALUES (553, 137, 4, 3, 20);
INSERT INTO `product_variants` VALUES (554, 137, 5, 3, 20);
INSERT INTO `product_variants` VALUES (555, 138, 3, 1, 20);
INSERT INTO `product_variants` VALUES (556, 138, 4, 1, 20);
INSERT INTO `product_variants` VALUES (557, 138, 5, 1, 20);
INSERT INTO `product_variants` VALUES (558, 139, 3, 2, 20);
INSERT INTO `product_variants` VALUES (559, 139, 4, 2, 20);
INSERT INTO `product_variants` VALUES (560, 139, 5, 2, 20);
INSERT INTO `product_variants` VALUES (561, 140, 3, 14, 20);
INSERT INTO `product_variants` VALUES (562, 140, 4, 14, 20);
INSERT INTO `product_variants` VALUES (563, 140, 5, 14, 20);
INSERT INTO `product_variants` VALUES (564, 141, 4, 17, 20);
INSERT INTO `product_variants` VALUES (565, 141, 5, 17, 20);
INSERT INTO `product_variants` VALUES (566, 141, 6, 17, 20);
INSERT INTO `product_variants` VALUES (567, 142, 3, 16, 20);
INSERT INTO `product_variants` VALUES (568, 142, 4, 16, 20);
INSERT INTO `product_variants` VALUES (569, 142, 5, 16, 20);
INSERT INTO `product_variants` VALUES (570, 143, 4, 15, 20);
INSERT INTO `product_variants` VALUES (571, 143, 5, 15, 20);
INSERT INTO `product_variants` VALUES (572, 143, 6, 15, 20);
INSERT INTO `product_variants` VALUES (573, 144, 3, 15, 20);
INSERT INTO `product_variants` VALUES (574, 144, 4, 15, 20);
INSERT INTO `product_variants` VALUES (575, 144, 5, 15, 20);
INSERT INTO `product_variants` VALUES (576, 145, 4, 16, 20);
INSERT INTO `product_variants` VALUES (577, 145, 5, 16, 20);
INSERT INTO `product_variants` VALUES (578, 145, 6, 16, 20);
INSERT INTO `product_variants` VALUES (579, 146, 3, 15, 20);
INSERT INTO `product_variants` VALUES (580, 146, 4, 15, 20);
INSERT INTO `product_variants` VALUES (581, 146, 5, 15, 20);
INSERT INTO `product_variants` VALUES (582, 147, 4, 14, 20);
INSERT INTO `product_variants` VALUES (583, 147, 5, 14, 20);
INSERT INTO `product_variants` VALUES (584, 147, 6, 14, 20);
INSERT INTO `product_variants` VALUES (585, 148, 3, 14, 20);
INSERT INTO `product_variants` VALUES (586, 148, 4, 14, 20);
INSERT INTO `product_variants` VALUES (587, 148, 5, 14, 20);
INSERT INTO `product_variants` VALUES (588, 149, 4, 14, 20);
INSERT INTO `product_variants` VALUES (589, 149, 5, 14, 20);
INSERT INTO `product_variants` VALUES (590, 149, 6, 14, 20);
INSERT INTO `product_variants` VALUES (591, 150, 3, 14, 20);
INSERT INTO `product_variants` VALUES (592, 150, 4, 14, 20);
INSERT INTO `product_variants` VALUES (593, 150, 5, 14, 20);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `idProduct` int(11) NOT NULL AUTO_INCREMENT,
  `idCategory` int(11) NOT NULL,
  `idDiscount` int(11) NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  `boy_or_girl` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idProduct`) USING BTREE,
  INDEX `idCategory`(`idCategory`) USING BTREE,
  INDEX `idDiscount`(`idDiscount`) USING BTREE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`idCategory`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`idDiscount`) REFERENCES `discount` (`idDiscount`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1649 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 1, 7, 'Áo thun ngắn tay in bản đồ Việt Nam bé trai', 180000.00, 'Áo thun là một outfits tiện lợi cho mẹ và bé, với kiểu dáng áo thun cá tính, năng động sẽ giúp bé thoải mái vận động. Ba mẹ có thể phối cho bé áo thun với những quần khác nhau như quần nỉ, quần dài, quần thun,... cho bé mặc nhiều dịp đi học, đi chơi, đi học, đi tiệc,...', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (2, 1, 7, 'Áo thun ngắn tay bé trai Capybara Rabity', 180000.00, 'Áo thun là một outfits tiện lợi cho mẹ và bé, với kiểu dáng áo thun cá tính, năng động sẽ giúp bé thoải mái vận động. Ba mẹ có thể phối cho bé áo thun với những quần khác nhau như quần nỉ, quần dài, quần thun,... cho bé mặc nhiều dịp đi học, đi chơi, đi học, đi tiệc,...', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (3, 1, 12, 'Áo thun dài tay bé trai Rabity 93818', 180000.00, 'Áo thun là một outfits tiện lợi cho mẹ và bé, với kiểu dáng áo thun cá tính, năng động sẽ giúp bé thoải mái vận động. Ba mẹ có thể phối cho bé áo thun với những quần khác nhau như quần nỉ, quần dài, quần thun,... cho bé mặc nhiều dịp đi học, đi chơi, đi học, đi tiệc,...', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (4, 1, 12, 'Áo thun dài tay bé trai Rabity 92788', 170000.00, 'Áo thun dài tay thời trang, năng động cho bé tự do khám phá, vận động và phát triển trí tuệ toàn diện.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (5, 1, 12, 'Áo thun ngắn tay Vintage bé trai', 170000.00, 'Áo thun ngắn tay in hình vintage, hình in sắc nét và màu sắc hài hòa', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (6, 1, 12, 'Áo thun ngắn tay bé trai Rabity 900.015', 170000.00, 'Áo thun bé trai sẽ là outfits tiện lợi cho mẹ và bé, với kiểu dáng áo thun cá tính, năng động sẽ giúp bé thoải mái vận động. Ba mẹ có thể phối cho bé áo thun với những quần khác nhau như quần short, quần dài, quần kaki,... cho bé mặc nhiều dịp đi học, đi chơi, đi học, đi tiệc,...', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (7, 1, 12, 'Áo thun ngắn tay bé trai Rabity 900.031', 170000.00, 'Áo thun ngắn tay chữ cách điệu độc đáo, năng động, hình in sắc nét và màu sắc hài hòa', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (8, 1, 12, 'Áo thun ngắn tay Khủng long Rex bé trai', 199000.00, 'Áo thun là một outfits tiện lợi cho mẹ và bé, với kiểu dáng áo thun cá tính, năng động sẽ giúp bé thoải mái vận động. Ba mẹ có thể phối cho bé áo thun với những quần khác nhau như quần nỉ, quần dài, quần thun,... cho bé mặc nhiều dịp đi học, đi chơi, đi học, đi tiệc,...', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (9, 1, 12, 'Áo thun ngắn tay Avengers Marvel bé trai', 199000.00, 'Áo thun là một outfits tiện lợi cho mẹ và bé, với kiểu dáng áo thun cá tính, năng động sẽ giúp bé thoải mái vận động. Ba mẹ có thể phối cho bé áo thun với những quần khác nhau như quần nỉ, quần dài, quần thun,... cho bé mặc nhiều dịp đi học, đi chơi, đi học, đi tiệc,...', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (10, 1, 12, 'Áo thun ngắn tay bé trai Rabity 900.089', 179000.00, 'Áo thun là một outfits tiện lợi cho mẹ và bé, với kiểu dáng áo thun cá tính, năng động sẽ giúp bé thoải mái vận động. Ba mẹ có thể phối cho bé áo thun với những quần khác nhau như quần nỉ, quần dài, quần thun,... cho bé mặc nhiều dịp đi học, đi chơi, đi học, đi tiệc,...', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (11, 1, 12, 'Áo thun dài tay bé trai Rabity 910.015', 199000.00, 'Áo thun bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố. Sản phẩm đạt chứng nhận Oeko-Tex 100 an toàn cho da trẻ em.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (12, 1, 3, 'Áo thun ngắn tay bé trai Rabity 900.088', 179000.00, 'Áo thun bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (13, 1, 4, 'Áo thun ngắn tay Captain America Đội trưởng Mỹ bé trai Rabity', 199000.00, 'Áo thun là một outfits tiện lợi cho mẹ và bé, với kiểu dáng áo thun cá tính, năng động sẽ giúp bé thoải mái vận động.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (14, 1, 7, 'Áo thun ngắn tay Spider-Man bé trai', 199000.00, 'Áo thun là một outfits tiện lợi cho mẹ và bé, với kiểu dáng áo thun cá tính, năng động sẽ giúp bé thoải mái vận động.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (15, 1, 12, 'Áo thun ngắn tay Spider-Man bé trai Rabity 500.062', 199000.00, 'Áo thun là một outfits tiện lợi cho mẹ và bé, với kiểu dáng áo thun cá tính, năng động sẽ giúp bé thoải mái vận động.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (16, 1, 5, 'Áo thun ngắn tay Mickey bé trai', 199000.00, 'Áo thun là một outfits tiện lợi cho mẹ và bé, với kiểu dáng áo thun cá tính, năng động sẽ giúp bé thoải mái vận động.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (17, 1, 7, 'Áo sơ mi dài tay bé trai Rabity x ELLE Kids - designed in Paris', 299000.00, 'Áo sơ mi bé trai một là outfits tiện lợi cho mẹ và bé, với kiểu dáng áo sơ mi bảnh bao, năng động và không kém phần thời trang có thể phối cho bé nhiều outfits mặc đi học, đi chơi, đi tiệc,...', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (18, 1, 3, 'Áo giữ nhiệt dài tay bé trai', 129000.00, 'Áo giữ nhiệt sẽ là outfits tiện lợi cho mẹ và bé, với kiểu dáng áo thun cá tính, năng động sẽ giúp bé thoải mái vận động.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (19, 1, 5, 'Áo thun polo cổ trụ ngắn tay bé trai', 199000.00, 'Áo thun polo cổ trụ bé trai sẽ là outfits tiện lợi cho mẹ và bé, với kiểu dáng áo vừa mang đến sự lịch sự như một mẫu áo sơ mi, vừa có sự co giản tốt, thoải mái của một chiếc áo thun sẽ giúp bé thoải mái vận động.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (20, 1, 12, 'Áo Gile len bé trai', 149000.00, 'Áo Gile len là một trong những sản phẩm luôn được ba mẹ ưa chuộng khi phối đồ cho bé trai bởi sự tiện lợi và thoải mái mà chúng mang lại cho bé.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (21, 2, 7, 'Quần short thô bé trai Rabity 532.008', 269000.00, 'Quần short lửng kaki bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (22, 2, 12, 'Quần short kaki bé trai Rabity 830.001 - designed in Paris', 269000.00, 'Quần short lửng kaki bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (23, 2, 7, 'Quần jean dài bé trai Rabity', 339000.00, 'Quần jean là sự kết hợp hoàn hảo giữa phong cách lịch sự và tiện dụng. Quần jean không chỉ phù hợp cho những buổi dạo phố, mà còn là lựa chọn lý tưởng cho các bé khi tham gia các hoạt động ngoại khóa', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (24, 2, 7, 'Quần jean dài bé trai Rabity 941.015', 369000.00, 'Quần jean là sự kết hợp hoàn hảo giữa phong cách lịch sự và tiện dụng. Quần jean không chỉ phù hợp cho những buổi dạo phố, mà còn là lựa chọn lý tưởng cho các bé khi tham gia các hoạt động ngoại khóa', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (25, 2, 12, 'Quần short kaki bé trai Rabity x ELLE Kids - designed in Paris 830.002', 269000.00, 'Quần short lửng kaki bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (26, 2, 12, 'Quần kaki dài bé trai Rabity x ELLE Kids - designed in Paris 842.002', 339000.00, 'Quần dài bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (27, 2, 12, 'Quần kaki phối áo dài bé trai Rabity 942.005', 339000.00, 'Quần dài bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (28, 2, 3, 'Quần nỉ dài bé trai', 179000.00, 'Quần dài bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (29, 2, 3, 'Quần short thô bé trai Rabity 932.020', 179000.00, 'Quần dài bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (30, 2, 7, 'Quần nỉ dài bé trai Rabity 944.003', 179000.00, 'Quần nỉ là sự kết hợp hoàn hảo giữa phong cách năng động và tiện dụng', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (31, 2, 11, 'Quần short thun bé trai 933.009', 199000.00, 'Quần short lửng kaki bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (32, 2, 12, 'Quần kaki dài Marvel Avengers bé trai Rabity 542.001', 339000.00, 'Quần dài bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (33, 2, 12, 'Quần short thô Captain America bé trai', 229000.00, 'Quần short lửng kaki bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (34, 2, 7, 'Quần short kaki Mickey bé trai', 229000.00, 'Quần short lửng kaki bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (35, 2, 4, 'Quần short kaki Spider-Man bé trai', 279000.00, 'Quần short lửng kaki bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (36, 2, 12, 'Quần short kaki bé trai Rabity 930.008', 249000.00, 'Quần short lửng kaki bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (37, 2, 7, 'Quần dài kaki bé trai Rabity x ELLE Kids - designed in Paris 83012', 339000.00, 'Quần dài bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (38, 2, 12, 'Quần dài kaki jogger bé trai Rabity x ELLE Kids - designed in Paris 83024', 339000.00, 'Quần dài bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (39, 2, 3, 'Quần short thô bé trai Rabity 93514', 249000.00, 'Quần short thô, bo chun để điều chỉnh với dòng chữ hiện đại, bắt mắt; quần thiết kế nhiều túi năng động và tiện dụng cho bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (40, 2, 7, 'Quần kaki jogger dài bé trai Rabity 93776', 339000.00, 'Quần bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (41, 3, 7, 'Giày sneaker bé trai Rabity 984.001', 339000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (42, 3, 3, 'Giày Sandal bé trai Rabity 981.007', 329000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (43, 3, 12, 'Giày tập đi bé trai Rabity 982.005', 229000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (44, 3, 12, 'Chia sẻ Giày tập đi bé trai Rabity 982.004', 229000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (45, 3, 12, 'Giày/sandal bé trai Rabity 981.008', 339000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (46, 3, 12, 'Giày lười bé trai 989.003', 339000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (47, 3, 7, 'Giày lười bé trai Rabity 989.001.002', 339000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (48, 3, 12, 'Giày sandal bé trai Rabity 981.004', 339000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (49, 3, 12, 'Giày sandal bé trai Rabity 981.001', 319000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (50, 3, 12, 'Sandal bé trai Rabity 33029', 229000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (51, 3, 12, 'Giày sandal bé trai Rabity 33028', 319000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (52, 3, 7, 'Dép sandal bé trai Rabity 22033', 229000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (53, 3, 12, 'Giày Chạy Thể Thao Bé Trai Size 28-33 Anta Kids Cloud Rider 312449924U', 499000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (54, 3, 7, 'Giày Chạy Thể Thao Bé Trai Size 28-32 Anta Kids Run Bike 312449922U', 499000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (55, 3, 9, 'Giày Bóng Rổ Bé Trai Size 28-32 Anta Kids NILIN A125A9930', 499000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (56, 3, 12, 'Giày Chạy Thể Thao Bé Trai Size 28-32 Anta Kids Butterfly Wings 312449926U', 499000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (57, 3, 12, 'Giày Chạy Thể Thao Bé Trai Size 34-40 Anta Kids Cloud Rider A125A5508', 499000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (58, 3, 12, 'Giày Bóng Rổ Bé Trai Size 34-40 Anta Kids Green Mango 3125A1111', 499000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (59, 3, 12, 'Giày Chạy Thể Thao Bé Trai Size 28-32 Anta Kids Flash Shoes A125A9904', 499000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (60, 3, 12, 'Giày Chạy Thể Thao Bé Trai Size 28-32 Anta Kids 3125A9903', 499000.00, 'Giày bé trai form vừa vặn thoải mái. Kiểu dáng dễ phối nhiều outfit lịch sự cho bé diện đi học, đi tiệc hay xuống phố.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (61, 4, 12, 'Set túi hộp hiphop phối chữ dễ thương cho bé trai', 179000.00, ' Bộ Thun HipHop Túi Hộp In Chữ Nổi – Màu cam năng động, đậm cá tính!Thiết kế độc đáo với chi tiết túi hộp và chữ nổi in nổi bật, mang đậm phong cách hiphop hiện đại, giúp bé tự tin tỏa sáng mọi lúc mọi nơi.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (62, 4, 11, 'Set bé trai loang dễ thương cho bé trai', 125000.00, 'Bộ thun loang NY màu cam dành cho bé trai – thoải mái, cá tính và trendy!Chất liệu thun cotton mềm mịn, thoáng mát, thấm hút mồ hôi cực tốt.Thiết kế phong cách streetwear với họa tiết NY nổi bật, phù hợp cho mọi hoạt động.Màu cam năng động – giúp bé luôn tỏa sáng mọi lúc mọi nơi!', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (63, 4, 11, 'Bộ sát nách tay lỡ in chữ quần túi hộp dễ thương cho bé trai', 159000.00, 'Thiết kế dễ thương: Áo tay lỡ dạng sát nách, in chữ công nghệ cao sắc nét không bong tróc khi giặt. Quần túi hộp dây gút giả năng động, thời trang.Chất liệu thoáng mát: Áo thun 4c thấm hút mồ hôi, co giãn mạnh, mềm mại, thoải mái cho bé vận động. Quần Thun Cotton dầy dặn giúp đứng phom như mẫu.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (64, 4, 11, 'Set sát nách Boomers 77 dễ thương cho bé trai', 123000.00, 'Vải poly lỗ lạnh, thấm hút.Với tính năng thấm hút mồ hôi và nhanh khô sau mỗi lần hoạt động giúp làn gia của trẻ không bị nóng bức khó chịu.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (65, 4, 11, 'Bộ thun LABUBU bóng chày dễ thương cho bé trai', 230000.00, 'Thiết kế dễ thương: In hình Labubu đang HOT, hình in loang công nghệ cao sắc nét không bong tróc khi giặt. Tay áo và quần phối màu nổi bật, đáng yêu.Chất liệu thoáng mát: Nguyên bộ chất thun cotton 4c thấm hút mồ hôi, co giãn mạnh, mềm mại, thoải mái cho bé vận động.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (66, 4, 10, 'Set thun sát nách tay lỡ người nhện dễ thương cho', 350000.00, 'Thiết kế dễ thương: In hình Người nhện cực ngầu, hình in công nghệ cao sắc nét không bong tróc khi giặt. Bảo đảm các fan nhí của Spider man không thể bỏ qua.Chất liệu thoáng mát: Nguyên bộ chất thun cotton 4c thấm hút mồ hôi, co giãn mạnh, mềm mại, thoải mái cho bé vận động.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (67, 4, 6, 'Bộ sát nách tay lỡ Shin dễ thương cho bé trai', 123000.00, 'Bộ sát nách tay lỡ Shin dễ thương cho bé trai. Nguyên bộ chất cotton 4c mịn đẹp, co giãn mạnh, hình in cao cấp bao đẹp như hình.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (68, 4, 6, 'Bộ thun loang in Labubu Phối bo thể thao dễ thương cho bé trai', 243500.00, 'Thiết kế dễ thương: In hình Labubu đang HOT, hình in loang công nghệ cao sắc nét không bong tróc khi giặt. Tay và cổ phối bo thể thao năng động, đáng yêu.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (69, 4, 6, 'Set bé trai họa tiết', 259000.00, ' Nguyên Bộ chất thun cá sấu co giãn 4 chiều , mềm mịn thoáng mát không bị nóng bí.Hình in chuyển nhiệt công nghệ mới bền màu , sắc nét từng chi tiết.✔ Túi đeo chất kaki có lót lớp mút mỏng đứng form hàng chuẩn đẹp , có thể đeo chéo hoặc đeo ngang bụng', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (70, 4, 6, 'Set bé trai nhện Spider', 274500.00, 'Áo Thun 100% Cotton co giãn 4 chiều mềm mịn mát . thấm hút mồ hôi tốt.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (71, 4, 6, 'Set sát nách STARWAR dễ thương cho bé trai', 290000.00, 'Nguyên sét thun cotton chính phẩm, co giãn 4C, chất vải mịn sợi dai.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (72, 4, 6, 'Bộ thun Babythree đồng phục cho bé trai', 305500.00, 'Thiết kế dễ thương: In hình Baby Three đang HOT, hình in công nghệ cao sắc nét không bong tróc khi giặt.Chất liệu thoáng mát: Nguyên bộ chất thun cotton 4c thấm hút mồ hôi, co giãn mạnh, mềm mại, thoải mái cho bé vận động.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (73, 4, 6, 'Set bé trai thêu Givenchy dễ thương cho bé trai', 321000.00, 'Bộ thun thương hiệu thêu áo và quần sang chảnh cho bé trai diện Tết. Chất thun 100% cotton 4c mịn, đẹp,FORM TO,  hàng chuẩn đẹp.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (74, 4, 6, 'Set bé trai cổ bẻ phối viền Kenzo dễ thương cho bé trai', 336500.00, 'Bộ thun thương hiệu thêu áo và quần sang chảnh cho bé trai diện Tết. Chất thun 100% cotton 4c mịn, đẹp,FORM TO,  hàng chuẩn đẹp.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (75, 4, 6, 'Set bé trai phối dây Gucci dễ thương cho bé trai', 352000.00, 'Bộ thun thương hiệu thêu áo và quần sang chảnh cho bé trai diện Tết. Chất thun 100% cotton 4c mịn, đẹp,FORM TO,  hàng chuẩn đẹp.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (76, 4, 6, 'Set bé trai phối màu in Baby Three Angel dễ thương cho bé trai', 367500.00, 'Bộ thun thương hiệu thêu áo và quần sang chảnh cho bé trai diện Tết. Chất thun 100% cotton 4c mịn, đẹp,FORM TO,  hàng chuẩn đẹp.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (77, 4, 6, 'Set jean bé trai in Labubu Have a good time dễ thương cho bé trai', 383000.00, 'Chào khách sét bộ jean Tết cực xinh cho bé mua 1 mà được 2 mẹ tách sét mix đủ kiểu Áo chất coton co dãn 4 chiều, mềm mại,thấm hút mồ hôi .Hình in không bong tróc chuẩn fom đường kim mũi chỉ .Quần jean wash in nhẹ phối 2 túi xịn xò', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (78, 4, 8, 'Set bé trai phối màu in 74 dễ thương cho bé trai', 398500.00, 'Bộ bé trai phom rộng, phong cách năng động. Vải cotton 4 chiều co dãn, thấm hút mồ hôi và mát mẽ cho làn da mỏng manh của trẻ. in nhẹ, phối cá tính, quần có túi.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (79, 4, 8, 'Set áo dài bé trai gấm vân mây cao cấp thêu đắp cá kèm quần dễ thương cho bé trai', 414000.00, 'Set Áo dài bé trai thêu Cá chép, gây ấn tượng với hình thêu nổi cá chép truyền thống mang đậm nét văn hóa Việt Nam, từng đường kim mũi chỉ của tà áo đều được chăm chút thật tỉ mỉ, chất liệu gấm vân mây cao cấp đảm bảo khi các bé mặc lên vừa vặn, sang trọng để đi du xuân, chúc tết ông bà...', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (80, 4, 8, 'Set jean hiphop in Labubu dễ thương cho bé trai', 290000.00, 'Áo chất thun cotton mềm mát, co giãn, thấm hút mồ hôi cực tốt, in hình công nghệ cao săc nét, không bong tróc, với các chủ đề Rắn Linh Vật Tết 2025.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 1);
INSERT INTO `products` VALUES (81, 5, 8, 'Áo thun đồng phục Gia đình bé trai & bé gái', 125000.00, 'Áo chất thun cotton mềm mát, co giãn, thấm hút mồ hôi cực tốt, in hình công nghệ cao săc nét, không bong tróc, với các chủ đề Rắn Linh Vật Tết 2025.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (82, 5, 8, 'Áo thun bé gái wash dễ thương cho bé gái', 185000.00, 'Áo chất thun cotton mềm mát, co giãn, thấm hút mồ hôi cực tốt, in hình công nghệ cao săc nét, không bong tróc, với các chủ đề Rắn Linh Vật Tết 2025.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (83, 5, 8, 'Áo thun đồng phục Gia đình Capybara cho bé trai, bé gái', 118000.00, 'Áo thun Capybara đồng phục cho gia đình bé trai, bé gái & Bố Mẹ. Được thiết kế theo dáng cổ tròn, tay ngắn mang phong cách trẻ trung, năng động. Chất thun cotton 4c co giãn, thấm hút mồ hôi tốt. Hình in cao cấp sắc nét, không bong tróc khi giặt.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (84, 5, 8, 'Áo thun Cotton Noel dễ thương cho bé trai & bé gái mùa Giáng Sinh', 118000.00, 'Áo thun đồng phục Gia đình chủ đề mùa Giáng Sinh. Có 3 kiểu: Hình Tuần Lộc, Hình Người Tuyết và Hình Songoku. Màu sắc: Đỏ & Đen.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (85, 5, 8, 'Áo khoác thô gân in Labubu dễ thương cho bé gái', 185000.00, 'vải gân hình in sắc nét phối kéo hàng bao chuẩn đẹp y hình', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (86, 5, 8, 'Áo hoodie Labubu dễ thương cho bé tái và bé gái', 165000.00, 'Áo Hoodie in Labubu dễ thương cho bé trai & bé gái ngày Thu Đông. Áo chất thun da cá dầy dặn, co giãn, thấm hút mồ hôi cực tốt. Áo nón dây gút, may túi trước, in hình Labubu siêu HOT. Hình in sắc nét, không bong tróc kể cả khi giặt máy.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (87, 5, 8, 'Áo gió in 3D dễ thương cho bé gái', 170000.00, 'Áo Gió - hàng TQXK - in họa tiết đáng yêu cho bé trai:  Áo Gió các kiểu, thời trang, chất Gió đẹp, nón được may 2 lớp. Bên trong áo lót lớp lưới mềm mại, rất thoải mái cho bé khi mặc quanh năm.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (88, 5, 8, 'Áo thun thể thao chữ B dễ thương cho bé gái', 155000.00, 'Áo thun thể thao cho hot girl baby — Áo chất cotton 4c mịn đẹp, hình in pet cao cấp.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (89, 5, 8, 'Áo thun croptop JASPER dễ thương cho bé gái', 135000.00, 'Chất vải thun coton 4 c siêu đẹp và mềm mướt thấm mồ hôi.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (90, 5, 8, 'Áo thun Dark Studio LÉ VIỀN dễ thương cho bé gái', 135000.00, 'Chất vải thun coton 4 c siêu đẹp và mềm mướt thấm mồ hôi.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (91, 5, 8, 'Áo có peplum giả denim', 200000.00, 'Áo bằng vải nỉ nhẹ mềm giả denim. Cổ tròn có nơ trang trí ở thân trước, phần mở kiểu lỗ khoá cài khuy phía sau và tay ngắn, bồng có chun mảnh ở cổ tay. Chun co giãn rút vải ở eo và peplum xoè.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (92, 5, 8, 'Áo kiểu nhún bèo vải denim', 399000.00, 'Áo kiểu bằng cotton denim mềm có cầu vai chữ V viền nhún bèo. Cổ tròn, khuy dọc thân trước và tay dài với cổ tay co giãn viền diềm nhún.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (93, 5, 8, 'Áo jersey vân nổi', 199000.00, 'Áo bằng jersey vân nổi mềm. Cổ tròn, phần mở hình lỗ khoá cài khuy phía sau cùng tay ngắn, bồng viền chun mảnh và một viền diềm nhún ở cổ tay.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (94, 5, 8, 'Áo jersey có cúc', 199000.00, 'Áo cotton jersey mềm, gân nổi có nẹp khuy trang trí dọc thân trước. Cổ tròn, tay dài với cổ tay và gấu có viền vắt sổ.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (95, 5, 8, 'Áo jersey có nơ', 199000.00, 'Áo bằng cotton jersey gân nổi, xếp lớp bên trên với cầu vai hình nơ bằng cotton poplin. Cổ tròn, phần mở hình lỗ khoá cài khuy phía sau và tay dài. Cổ tay và gấu viền vắt sổ.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (96, 5, 8, 'Áo thun dài tay Minnie bé gái', 179000.00, 'Chất liệu 95% cotton và 5% spandex thoáng mát và an toàn cho làn da bé- Loại sản phẩm: Áo thun bé gái; Áo dài tay bé gái- Phù hợp với bé gái cân nặng từ 11-30kg; từ 2-10 tuổi- Áo thun dài tay trơn màu sắc đơn giản kết hợp với họa tiết in nhỏ đáng yêu cho trang phục của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (97, 5, 8, 'Áo thun tăm dài tay bé gái', 179000.00, 'Chất liệu 95% cotton và 5% spandex thoáng mát và an toàn cho làn da bé- Loại sản phẩm: Áo thun bé gái; Áo dài tay bé gái- Phù hợp với bé gái cân nặng từ 11-30kg; từ 2-10 tuổi- Áo thun dài tay trơn màu sắc đơn giản kết hợp với họa tiết in nhỏ đáng yêu cho trang phục của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (98, 5, 8, 'Áo thun ngắn tay Minnie', 179000.00, 'Chất liệu 95% cotton và 5% spandex thoáng mát và an toàn cho làn da bé- Loại sản phẩm: Áo thun bé gái; Áo dài tay bé gái- Phù hợp với bé gái cân nặng từ 11-30kg; từ 2-10 tuổi- Áo thun dài tay trơn màu sắc đơn giản kết hợp với họa tiết in nhỏ đáng yêu cho trang phục của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (99, 5, 8, 'Áo thun ngắn tay bé gái', 179000.00, 'Chất liệu 95% cotton và 5% spandex thoáng mát và an toàn cho làn da bé- Loại sản phẩm: Áo thun bé gái; Áo dài tay bé gái- Phù hợp với bé gái cân nặng từ 11-30kg; từ 2-10 tuổi- Áo thun dài tay trơn màu sắc đơn giản kết hợp với họa tiết in nhỏ đáng yêu cho trang phục của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (100, 5, 8, 'Áo thun ngắn tay Ngoan xinh yêu cho bé gái', 126000.00, 'Chất liệu 95% cotton và 5% spandex thoáng mát và an toàn cho làn da bé- Loại sản phẩm: Áo thun bé gái; Áo dài tay bé gái- Phù hợp với bé gái cân nặng từ 11-30kg; từ 2-10 tuổi- Áo thun dài tay trơn màu sắc đơn giản kết hợp với họa tiết in nhỏ đáng yêu cho trang phục của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (101, 6, 8, 'Quần legging dài bé gái', 139000.00, 'Quần dài legging là một kiểu quần rất tiện lợi nên thường được ba mẹ lựa chọn khi mua sắm quần áo cho bé gái, với những chiếc quần legging bạn có thể phối với đa dạng mẫu áo khác nhau như áo thun tay ngắn, áo sát nách, áo sơ mi,... để mặc đi học, đi chơi hoặc đi tiệc.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (102, 6, 4, 'Quần kaki dài bé gái', 297000.00, 'Nhóm sản phẩm: Quần bé gái, Quần dài bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (103, 6, 4, 'Quần short thô bé gái', 230000.00, 'Nhóm sản phẩm: Quần short bé gái, Quần bé gái Chất liệu: 100% cotton an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (104, 6, 4, 'Quần legging dài thun bé gái', 234000.00, 'Nhóm sản phẩm: Quần bé gái, Quần dài bé gái Chất liệu: 95% cotton 5% spandex thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (105, 6, 4, 'Quần jean dài bé gái Rabity', 239000.00, 'Nhóm sản phẩm: Quần bé gái, Quần dài bé gái Chất liệu: 95% cotton 5% spandex thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (106, 6, 4, 'Quần nỉ dài bé gái', 138000.00, 'Quần nỉ là một kiểu quần rất tiện lợi nên thường được ba mẹ lựa chọn khi mua sắm quần áo cho bé gái, với những chiếc quần nỉ bạn có thể phối với đa dạng mẫu áo khác nhau như áo thun tay ngắn, áo sát nách, áo sơ mi,... để mặc đi học, đi chơi hoặc đi tiệc', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (107, 6, 4, 'Quần jean dài bé gái', 369000.00, 'Quần jean dài cho bé gái là một lựa chọn thời trang không thể thiếu trong tủ đồ của các bé. Với sự kết hợp hoàn hảo giữa phong cách thời trang và tính tiện dụng, quần jean phù hợp cho các bé khi đi học, đi chơi hay tham gia các hoạt động ngoài trời.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (108, 6, 4, 'Quần jean dài bo ống bé gái', 339000.00, 'Quần jean dài cho bé gái là một lựa chọn thời trang không thể thiếu trong tủ đồ của các bé. Với sự kết hợp hoàn hảo giữa phong cách thời trang và tính tiện dụng, quần jean phù hợp cho các bé khi đi học, đi chơi hay tham gia các hoạt động ngoài trời.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (109, 6, 4, 'Quần short Minnie bé gái', 119000.00, 'Chất liệu vải 95% cotton và 5% spandex   Loại sản phẩm: Quần short bé gái', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (110, 6, 4, 'Quần dài giả jean bò lót lông bé gái', 130000.00, 'Quần dài giả jean là một kiểu quần rất tiện lợi nên thường được ba mẹ lựa chọn khi mua sắm quần áo cho bé gái, với những chiếc quần dài bạn có thể phối với đa dạng mẫu áo khác nhau như áo thun tay ngắn, áo sát nách, áo sơ mi,... để mặc đi học, đi chơi hoặc đi tiệc.', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (111, 6, 4, 'Quần thô dài bé gái', 189000.00, '- Chất liệu: 100% cotton thoáng mát, an toàn cho daLoại sản phẩm: Quần dài bé gái Quần thô dài họa tiết nổi bật', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (112, 6, 4, 'Quần short thô bé gái', 126000.00, '- Chất liệu: 100% cotton thoáng mát, an toàn cho daLoại sản phẩm: Quần dài bé gái Quần thô dài họa tiết nổi bật', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (113, 6, 4, 'Quần legging lửng dài', 139000.00, '- Chất liệu: 100% cotton thoáng mát, an toàn cho daLoại sản phẩm: Quần dài bé gái Quần thô dài họa tiết nổi bật', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (114, 6, 4, 'Quần nỉ dài Minnie bé gái', 297000.00, '- Chất liệu: 100% cotton thoáng mát, an toàn cho daLoại sản phẩm: Quần dài bé gái Quần thô dài họa tiết nổi bật', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (115, 6, 4, 'Quần jean dài Minnie ống rộng', 230000.00, '- Chất liệu: 100% cotton thoáng mát, an toàn cho daLoại sản phẩm: Quần dài bé gái Quần thô dài họa tiết nổi bật', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (116, 6, 4, 'Quần thun kaki dài bé gái', 234000.00, '- Chất liệu: 100% cotton thoáng mát, an toàn cho daLoại sản phẩm: Quần dài bé gái Quần thô dài họa tiết nổi bật', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (117, 6, 4, 'Quần dài legging Melody bé gái', 239000.00, '- Chất liệu: 100% cotton thoáng mát, an toàn cho daLoại sản phẩm: Quần dài bé gái Quần thô dài họa tiết nổi bật', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (118, 6, 4, 'Quần short kaki bé gái', 138000.00, '- Chất liệu: 100% cotton thoáng mát, an toàn cho daLoại sản phẩm: Quần dài bé gái Quần thô dài họa tiết nổi bật', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (119, 6, 4, 'Quần short jean bé gái', 369000.00, '- Chất liệu: 100% cotton thoáng mát, an toàn cho daLoại sản phẩm: Quần dài bé gái Quần thô dài họa tiết nổi bật', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (120, 6, 4, 'Quần short kaki bé gái', 339000.00, '- Chất liệu: 100% cotton thoáng mát, an toàn cho daLoại sản phẩm: Quần dài bé gái Quần thô dài họa tiết nổi bật', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (121, 7, 4, 'Chân váy nhung bé gái Rabity', 119000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (122, 7, 4, 'Chân váy da bé gái', 130000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (123, 7, 4, 'Chân váy thô bé gái', 179000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (124, 7, 4, 'Chân váy thô bé gái  paris', 126000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (125, 7, 4, 'Chân váy da bé gái', 139000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (126, 7, 4, ' Chân váy voan bé gái', 297000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (127, 7, 4, 'Chân váy nhung bé gái', 230000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (128, 7, 4, 'Chân váy kaki Disney Daisy bé gái', 234000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (129, 7, 4, 'Chân váy kaki bé gái', 239000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (130, 7, 4, 'Chân váy thô Vintage bé gái', 138000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (131, 7, 4, 'Chân váy voan nhún bé gái màu hồng', 369000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (132, 7, 8, 'Chân váy jean nhún bé gái', 339000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (133, 7, 7, 'Chân váy voan nhún Vintage bé gái', 119000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (134, 7, 7, 'Chân váy jean Minnie có viền ren bé gái', 179000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (135, 7, 7, 'Chân váy kaki Minnie bé gái', 199000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (136, 7, 7, 'Chân váy thô nhún bèo Minnie bé gái', 339000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (137, 7, 7, 'Chân váy bé gái màu đen', 229000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (138, 7, 7, 'Chân váy phối voan bé gái', 229000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (139, 7, 7, 'Chân váy nhung bé gái màu be', 279000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (140, 7, 7, 'Chân váy thô bé gái Minnie', 249000.00, 'Nhóm sản phẩm: Đầm váy bé gái, Chân váy bé gái Chất liệu: 100% cotton thấm hút mồ hôi, an toàn và thoáng mát cho da của bé', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (141, 8, 7, 'Đồ bộ thun ngắn tay Gấu dâu Lotso bé gái', 339000.00, 'Thiết kế cực yêu dành cho công chúa nhỏ! Chất liệu thun cotton cao cấp, mềm mịn, thấm hút mồ hôi, giúp bé luôn thoải mái suốt ngày dài. Điểm nhấn chấm bi xinh xắn kết hợp bèo điệu đà, mang đến phong cách nhẹ nhàng, đáng yêu cho bé gái. Mát mẻ – Thoải mái – Thời Trang, cực kỳ phù hợp cho những ngày hè năng động!', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (142, 8, 7, 'Bộ thun ngắn tay bé gái', 339000.00, 'Thiết kế cực yêu dành cho công chúa nhỏ! Chất liệu thun cotton cao cấp, mềm mịn, thấm hút mồ hôi, giúp bé luôn thoải mái suốt ngày dài. Điểm nhấn chấm bi xinh xắn kết hợp bèo điệu đà, mang đến phong cách nhẹ nhàng, đáng yêu cho bé gái. Mát mẻ – Thoải mái – Thời Trang, cực kỳ phù hợp cho những ngày hè năng động!', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (143, 8, 7, 'Bộ thun ngắn tay bé gái màu hồng cam', 249000.00, 'Thiết kế cực yêu dành cho công chúa nhỏ! Chất liệu thun cotton cao cấp, mềm mịn, thấm hút mồ hôi, giúp bé luôn thoải mái suốt ngày dài. Điểm nhấn chấm bi xinh xắn kết hợp bèo điệu đà, mang đến phong cách nhẹ nhàng, đáng yêu cho bé gái. Mát mẻ – Thoải mái – Thời Trang, cực kỳ phù hợp cho những ngày hè năng động!', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (144, 8, 7, 'Đồ bộ thun ngắn tay Stitch bé gái', 339000.00, 'Thiết kế cực yêu dành cho công chúa nhỏ! Chất liệu thun cotton cao cấp, mềm mịn, thấm hút mồ hôi, giúp bé luôn thoải mái suốt ngày dài. Điểm nhấn chấm bi xinh xắn kết hợp bèo điệu đà, mang đến phong cách nhẹ nhàng, đáng yêu cho bé gái. Mát mẻ – Thoải mái – Thời Trang, cực kỳ phù hợp cho những ngày hè năng động!', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (145, 8, 7, 'Đồ bộ thun ngắn tay Labubu', 339000.00, 'Thiết kế cực yêu dành cho công chúa nhỏ! Chất liệu thun cotton cao cấp, mềm mịn, thấm hút mồ hôi, giúp bé luôn thoải mái suốt ngày dài. Điểm nhấn chấm bi xinh xắn kết hợp bèo điệu đà, mang đến phong cách nhẹ nhàng, đáng yêu cho bé gái. Mát mẻ – Thoải mái – Thời Trang, cực kỳ phù hợp cho những ngày hè năng động!', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (146, 8, 7, 'Đồ bộ thun ngắn tay bé gái', 329000.00, 'Thiết kế cực yêu dành cho công chúa nhỏ! Chất liệu thun cotton cao cấp, mềm mịn, thấm hút mồ hôi, giúp bé luôn thoải mái suốt ngày dài. Điểm nhấn chấm bi xinh xắn kết hợp bèo điệu đà, mang đến phong cách nhẹ nhàng, đáng yêu cho bé gái. Mát mẻ – Thoải mái – Thời Trang, cực kỳ phù hợp cho những ngày hè năng động!', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (147, 8, 7, 'Đồ bộ pijama ngắn tay bé gái', 229000.00, 'Thiết kế cực yêu dành cho công chúa nhỏ! Chất liệu thun cotton cao cấp, mềm mịn, thấm hút mồ hôi, giúp bé luôn thoải mái suốt ngày dài. Điểm nhấn chấm bi xinh xắn kết hợp bèo điệu đà, mang đến phong cách nhẹ nhàng, đáng yêu cho bé gái. Mát mẻ – Thoải mái – Thời Trang, cực kỳ phù hợp cho những ngày hè năng động!', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (148, 8, 1, 'Đồ bộ thun dài tay bé gái trung nhí', 229000.00, 'Thiết kế cực yêu dành cho công chúa nhỏ! Chất liệu thun cotton cao cấp, mềm mịn, thấm hút mồ hôi, giúp bé luôn thoải mái suốt ngày dài. Điểm nhấn chấm bi xinh xắn kết hợp bèo điệu đà, mang đến phong cách nhẹ nhàng, đáng yêu cho bé gái. Mát mẻ – Thoải mái – Thời Trang, cực kỳ phù hợp cho những ngày hè năng động!', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (149, 8, 1, 'Set bộ áo váy thô ngắn tay bé gái', 339000.00, 'Thiết kế cực yêu dành cho công chúa nhỏ! Chất liệu thun cotton cao cấp, mềm mịn, thấm hút mồ hôi, giúp bé luôn thoải mái suốt ngày dài. Điểm nhấn chấm bi xinh xắn kết hợp bèo điệu đà, mang đến phong cách nhẹ nhàng, đáng yêu cho bé gái. Mát mẻ – Thoải mái – Thời Trang, cực kỳ phù hợp cho những ngày hè năng động!', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);
INSERT INTO `products` VALUES (150, 8, 1, 'Đồ bộ dài tay nỉ lông bé gái', 339000.00, 'Thiết kế cực yêu dành cho công chúa nhỏ! Chất liệu thun cotton cao cấp, mềm mịn, thấm hút mồ hôi, giúp bé luôn thoải mái suốt ngày dài. Điểm nhấn chấm bi xinh xắn kết hợp bèo điệu đà, mang đến phong cách nhẹ nhàng, đáng yêu cho bé gái. Mát mẻ – Thoải mái – Thời Trang, cực kỳ phù hợp cho những ngày hè năng động!', 1, '2025-03-06 23:47:36', '2025-03-30 15:29:49', 2);

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `idReview` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `rating` int(11) NULL DEFAULT NULL CHECK (`rating` between 1 and 5),
  `reviewText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idReview`) USING BTREE,
  INDEX `idUser`(`idUser`) USING BTREE,
  INDEX `idProduct`(`idProduct`) USING BTREE,
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `products` (`idProduct`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reviews
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `idRole` int(11) NOT NULL AUTO_INCREMENT,
  `role` enum('ROLE_EMPLOYEE','ROLE_ADMIN','ROLE_USER') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idRole`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1003 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (0, 'ROLE_EMPLOYEE');
INSERT INTO `role` VALUES (1, 'ROLE_ADMIN');
INSERT INTO `role` VALUES (2, 'ROLE_USER');

-- ----------------------------
-- Table structure for sizes
-- ----------------------------
DROP TABLE IF EXISTS `sizes`;
CREATE TABLE `sizes`  (
  `idSize` int(11) NOT NULL AUTO_INCREMENT,
  `size` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idSize`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1014 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sizes
-- ----------------------------
INSERT INTO `sizes` VALUES (1, '1Y');
INSERT INTO `sizes` VALUES (2, '2Y');
INSERT INTO `sizes` VALUES (3, '3Y');
INSERT INTO `sizes` VALUES (4, '4Y');
INSERT INTO `sizes` VALUES (5, '5Y');
INSERT INTO `sizes` VALUES (6, '6Y');
INSERT INTO `sizes` VALUES (7, '7Y');
INSERT INTO `sizes` VALUES (8, '8Y');
INSERT INTO `sizes` VALUES (9, '9Y');
INSERT INTO `sizes` VALUES (10, '10Y');
INSERT INTO `sizes` VALUES (11, '11Y');
INSERT INTO `sizes` VALUES (12, '12Y');
INSERT INTO `sizes` VALUES (13, '13Y');
INSERT INTO `sizes` VALUES (14, '14Y');
INSERT INTO `sizes` VALUES (15, '');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `idRole` int(11) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fullName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phoneNumber` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `birthDate` date NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authProvider` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `socialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `lockedUntil` datetime NULL DEFAULT NULL,
  `loginAttempts` int(11) NULL DEFAULT 0,
  `isLocked` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`idUser`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `phoneNumber`(`phoneNumber`) USING BTREE,
  UNIQUE INDEX `unique_social_id`(`socialId`) USING BTREE,
  UNIQUE INDEX `phoneNumber_2`(`phoneNumber`) USING BTREE,
  INDEX `idRole`(`idRole`) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 1, 'hdanhv5879', '$2a$10$6i/Fxp8NNLbea5QsLG./zuQuHEEXU8HmHck3AjtptGOzF4dwqTaRy', 'Công Danh Võ', 'hdanhv5879@gmail.com', NULL, 1, '2004-06-16', 'https://lh3.googleusercontent.com/a/ACg8ocJauw-oYi9LIAbj8-9aj8jR-7hx8CQDnE0zpePJ4bMjIGIJdphI=s96-c', NULL, NULL, '2025-03-06 23:51:40', NULL, 1, 0);
INSERT INTO `users` VALUES (25, 2, '22130033', '$2a$10$rqsWtTROTet7fe3PXl.sK.MMZSue41Go42eRUUrmwSC/ekBWojpgG', 'Danh Võ Công', '22130033@st.hcmuaf.edu.vn', NULL, 1, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocIlOBa9PX5p9WOGCxgR_En-pi5U099w06FchMntH1NxytPHrzM=s96-c', NULL, '117271848632963369845', '2025-04-16 22:35:28', NULL, 0, 0);
INSERT INTO `users` VALUES (27, 2, 'danh', '$2a$12$2Xn/XLAyBjlBTtTwgEhGWet3Z4gftLOD.a.s/YbDwWzwDiJ7ZbVBa', 'Dava', 'danhv25879@gmail.com', '0358082527', 1, '2017-01-04', NULL, NULL, NULL, '2025-04-16 22:41:52', NULL, 0, 0);
INSERT INTO `users` VALUES (50, 2, 'TestAd', '$2a$10$jPiEuQ95QpJ8n97eOBEtiegeM7HpJMq7t0ogep1854AdPsNb4BQCC', 'Danh Pro', 'danhv5879@gmail.com', '03580825266', 1, NULL, NULL, NULL, NULL, '2025-06-02 20:30:39', NULL, 0, 0);
INSERT INTO `users` VALUES (52, 2, 'danha', '$2a$10$Sg3m3ivfSuTfMfWYXTR1teQ3IWYW/chxL692DfDhwuww5xahNlTfC', 'Danh Pro', '2213e33@st.hcmuaf.edu.vn', '03580825227', 1, NULL, NULL, NULL, NULL, '2025-06-02 20:45:57', NULL, 0, 0);
INSERT INTO `users` VALUES (53, 2, 'danha1', '$2a$10$JOfvkdi4iVfkedp2fUw6cerO4KUcamNvBu50kmMYCN05dvgZGdMZC', 'Danh Pro', '22132e33@st.hcmuaf.edu.vn', '035808215227', 1, NULL, NULL, NULL, NULL, '2025-06-02 20:48:02', NULL, 0, 0);
INSERT INTO `users` VALUES (54, 2, 'danha11', '$2a$10$GziFsapHrUNyUfNhzNGSN.WRFQDlT0EmBDZgbWISFQO4IxAzeAdRi', 'Danh Pro', '2213253@st.hcmuaf.edu.vn', '0358082327', 1, NULL, NULL, NULL, NULL, '2025-06-02 20:51:34', NULL, 0, 0);
INSERT INTO `users` VALUES (55, 2, 'danhaa11', '$2a$10$EbeyawsRxq.2NfqdO2MixO9sRT1uJYGmgemuTyXCKmDagDctH.7oa', 'Danh Pro', '2213a3@st.hcmuaf.edu.vn', '0358082227', 1, NULL, NULL, NULL, NULL, '2025-06-02 20:52:23', NULL, 0, 0);
INSERT INTO `users` VALUES (62, 2, 'dvo613618', '$2a$10$LnqL5cWuBEQBH/MCqbvnDe6HwX3tkA2PyklWbUBxJYwDC2jP0ZG2O', 'vo danh', 'dvo613618@gmail.com', NULL, 1, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJI2jN_ZyNIQeZe1JSPVUoJAWSZm1AD4XeCMTmiKz2kb23rZA=s96-c', NULL, '104779965266483956925', '2025-06-02 21:23:12', NULL, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
