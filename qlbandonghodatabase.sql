/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : qlbandonghodatabase

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 30/03/2025 23:51:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `categoryId` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`categoryId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Luxury');
INSERT INTO `categories` VALUES (2, 'Classic');
INSERT INTO `categories` VALUES (3, 'Smartwatch');
INSERT INTO `categories` VALUES (4, 'Sport');
INSERT INTO `categories` VALUES (5, 'Luxury');
INSERT INTO `categories` VALUES (6, 'Classic');
INSERT INTO `categories` VALUES (7, 'Smartwatch');
INSERT INTO `categories` VALUES (8, 'Sport');

-- ----------------------------
-- Table structure for discounts
-- ----------------------------
DROP TABLE IF EXISTS `discounts`;
CREATE TABLE `discounts`  (
  `discountId` int NOT NULL AUTO_INCREMENT,
  `discountDetail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `discountCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `discountValue` int NULL DEFAULT NULL,
  `statusDate` date NULL DEFAULT NULL,
  `endDate` date NULL DEFAULT NULL,
  `createAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`discountId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discounts
-- ----------------------------
INSERT INTO `discounts` VALUES (1, 'Giảm giá 10% cho đơn hàng trên 1 triệu', 'DISCOUNT10', 10, '2023-10-01', '2023-10-31', '2025-03-17 08:22:22');
INSERT INTO `discounts` VALUES (2, 'Giảm giá 50k cho sản phẩm A', 'DISCOUNT50K', 50000, '2023-10-01', '2023-10-15', '2025-03-17 08:22:22');

-- ----------------------------
-- Table structure for orderdetails
-- ----------------------------
DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails`  (
  `orderDetailId` int NOT NULL AUTO_INCREMENT,
  `unitPrice` decimal(10, 0) NULL DEFAULT NULL,
  `quatity` int NULL DEFAULT NULL,
  `statusDetail` enum('pending','completed','canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `productId` int NULL DEFAULT NULL,
  `orderId` int NULL DEFAULT NULL,
  PRIMARY KEY (`orderDetailId`) USING BTREE,
  INDEX `productId`(`productId` ASC) USING BTREE,
  INDEX `orderId`(`orderId` ASC) USING BTREE,
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetails
-- ----------------------------
INSERT INTO `orderdetails` VALUES (1, 1500000, 1, 'pending', 1, 1);
INSERT INTO `orderdetails` VALUES (2, 3000000, 1, 'completed', 2, 1);
INSERT INTO `orderdetails` VALUES (3, 2500000, 1, 'canceled', 3, 2);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `orderDate` date NULL DEFAULT NULL,
  `statusOrder` enum('confirmationing','delivering','paid') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updateAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  `totalAmount` int NULL DEFAULT NULL,
  `paymentMethod` enum('transfer','cash') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `userId` int NULL DEFAULT NULL,
  PRIMARY KEY (`orderId`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '2023-10-05', 'confirmationing', '2025-03-17 08:36:31', 2700000, 'transfer', 1);
INSERT INTO `orders` VALUES (2, '2023-10-06', 'delivering', '2025-03-17 08:36:31', 1500000, 'cash', 2);

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images`  (
  `imageId` int NOT NULL AUTO_INCREMENT,
  `productId` int NOT NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`imageId`) USING BTREE,
  INDEX `productId`(`productId` ASC) USING BTREE,
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES (1, 1, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/_/0/_0002_cf-lg-9f340e51-97bc-4651-b885-00.jpg');
INSERT INTO `product_images` VALUES (2, 2, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/_/0/_0005_cf-lg-65651489-2748-4e13-a2be-87_1_.jpg');
INSERT INTO `product_images` VALUES (3, 3, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/_/0/_0001__-_-___6_2.jpg');
INSERT INTO `product_images` VALUES (4, 4, 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/g/a/garmin-2x-solar-do.jpg');
INSERT INTO `product_images` VALUES (5, 5, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_42__3_33.png');
INSERT INTO `product_images` VALUES (6, 6, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/g/a/garmin-forerunner-965-trang-1.jpg');
INSERT INTO `product_images` VALUES (7, 7, 'https://cdn.tgdd.vn/Products/Images/7077/327696/samsung-galaxy-watch7-lte-40mm-1-750x500.jpg');
INSERT INTO `product_images` VALUES (8, 8, 'https://cdn.tgdd.vn/Products/Images/7077/328630/befit-sporty-3-rd-1-1-750x500.jpg');
INSERT INTO `product_images` VALUES (9, 9, 'https://cdn.tgdd.vn/Products/Images/7077/315897/garmin-vivoactive-5-day-silicone-xanh-1-750x500.jpg');
INSERT INTO `product_images` VALUES (10, 10, 'https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/7077/329076/dong-ho-dinh-vi-tre-em-kidcare-k1-hong-hc-1-638617571963531395-750x500.jpg');
INSERT INTO `product_images` VALUES (11, 11, 'https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/7264/333711/g-shock-gst-b400cx-1adr-nam-2-638727968309121890-750x500.jpg');
INSERT INTO `product_images` VALUES (12, 12, 'https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/7264/333713/baby-g-bga-290ds-2adr-nu-1-638727973930649609-750x500.jpg');
INSERT INTO `product_images` VALUES (13, 13, 'https://cdn.tgdd.vn/Products/Images/7264/302236/casio-mtp-e715d-7avdf-nam-10.jpg');
INSERT INTO `product_images` VALUES (14, 14, 'https://cdn.tgdd.vn/Products/Images/7264/268649/casio-mtp-v300b-1audf-nam-2-750x500.jpg');
INSERT INTO `product_images` VALUES (15, 15, 'https://cdn.tgdd.vn/Products/Images/7264/307990/casio-lws-2200h-4avdf-nu-13.jpg');
INSERT INTO `product_images` VALUES (16, 16, 'https://cdn.tgdd.vn/Products/Images/7264/302230/g-shock-dw-291hx-1avdf-nam-11.jpg');
INSERT INTO `product_images` VALUES (17, 17, 'https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/7264/333709/g-shock-ga-b2100cd-1a4dr-nam-1-638727243007742471-750x500.jpg');
INSERT INTO `product_images` VALUES (18, 18, 'https://cdn.tgdd.vn/Products/Images/7264/326930/g-shock-gma-p2100sg-2adr-nu-1-750x500.jpg');
INSERT INTO `product_images` VALUES (19, 19, 'https://cdn.tgdd.vn/Products/Images/7264/326934/g-shock-gm-b2100ad-2adr-nam-1-750x500.jpg');
INSERT INTO `product_images` VALUES (20, 20, 'https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/7264/333115/citizen-bi5127-51h-nam-1-638702014664181835-750x500.jpg');
INSERT INTO `product_images` VALUES (21, 21, 'https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/7264/316397/citizen-el3100-55z-nu-1-638702036045102784-750x500.jpg');
INSERT INTO `product_images` VALUES (22, 22, 'https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/7264/333110/citizen-bi5120-51l-nam-1-638702011319934933-750x500.jpg');
INSERT INTO `product_images` VALUES (23, 23, 'https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/7264/333114/citizen-bi5124-50l-nam-1-638702014050674289-750x500.jpg');
INSERT INTO `product_images` VALUES (24, 24, 'https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/7264/332551/orient-ra-as0105s30b-nam-3-638684895743473550-750x500.jpg');
INSERT INTO `product_images` VALUES (25, 25, 'https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/7264/330001/citizen-nj0152-51x-nam-9-638629597846393245-750x500.jpg');
INSERT INTO `product_images` VALUES (26, 26, 'https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/7264/332552/orient-ra-as0106l30b-nam-2-638684901290354468-750x500.jpg');
INSERT INTO `product_images` VALUES (27, 27, 'https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/7264/331127/orient-re-av0127l00b-nam-6-638654688173917403-750x500.jpg');
INSERT INTO `product_images` VALUES (28, 28, 'https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/7264/332550/orient-re-at0018s00b-nam-8-638684895456476801-750x500.jpg');
INSERT INTO `product_images` VALUES (29, 29, 'https://www.zeitvintagewatch.com/cdn/shop/files/BAUMER_MERCIER6102-099-14.jpg?v=1726332359&width=990');
INSERT INTO `product_images` VALUES (30, 30, 'https://www.zeitvintagewatch.com/cdn/shop/files/BAUMER_MERCIER6102-099-14.jpg?v=1726332359&width=990');
INSERT INTO `product_images` VALUES (31, 31, 'https://www.zeitvintagewatch.com/cdn/shop/files/UG566101_4_-1.jpg?v=1738569170&width=990');
INSERT INTO `product_images` VALUES (32, 32, 'https://www.zeitvintagewatch.com/cdn/shop/files/DSCF1430.jpg?v=1732244968&width=990');
INSERT INTO `product_images` VALUES (33, 33, 'https://www.zeitvintagewatch.com/cdn/shop/files/DSCF1522.jpg?v=1732612554&width=990');
INSERT INTO `product_images` VALUES (34, 34, 'https://www.zeitvintagewatch.com/cdn/shop/files/LONGINESFLAGSHIP3104-4-1.jpg?v=1741248098&width=990');
INSERT INTO `product_images` VALUES (35, 35, 'https://www.zeitvintagewatch.com/cdn/shop/files/LONGINES7686-13-1.jpg?v=1741773520&width=990');
INSERT INTO `product_images` VALUES (36, 36, 'https://www.zeitvintagewatch.com/cdn/shop/files/LONGINES8446-5-1.jpg?v=1739675149&width=990');
INSERT INTO `product_images` VALUES (37, 37, 'https://www.zeitvintagewatch.com/cdn/shop/files/LONGINES4246_1_-16.jpg?v=1726632724&width=990');
INSERT INTO `product_images` VALUES (38, 38, 'https://www.zeitvintagewatch.com/cdn/shop/files/DSCF9266.jpg?v=1727253432&width=990');
INSERT INTO `product_images` VALUES (39, 39, 'https://www.zeitvintagewatch.com/cdn/shop/files/DSCF1451.jpg?v=1732196629&width=990');
INSERT INTO `product_images` VALUES (40, 40, 'https://www.zeitvintagewatch.com/cdn/shop/files/DSCF1722.jpg?v=1733277882&width=990');
INSERT INTO `product_images` VALUES (41, 41, 'https://www.zeitvintagewatch.com/cdn/shop/files/DSCF4216.jpg?v=1730257003&width=990');
INSERT INTO `product_images` VALUES (42, 42, 'https://www.zeitvintagewatch.com/cdn/shop/files/LONGINESULTRA-CHRON8024-1_1_-1.jpg?v=1740112876&width=990');
INSERT INTO `product_images` VALUES (43, 43, 'https://www.zeitvintagewatch.com/cdn/shop/files/BAUME_MERCIERHAMPTON65308-14.jpg?v=1735900612&width=990');
INSERT INTO `product_images` VALUES (44, 44, 'https://www.zeitvintagewatch.com/cdn/shop/files/OMEGA3971-5-15.jpg?v=1728505690&width=990');
INSERT INTO `product_images` VALUES (45, 45, 'https://www.zeitvintagewatch.com/cdn/shop/files/OMEGA161021_1_-15.jpg?v=1723603744&width=990');
INSERT INTO `product_images` VALUES (46, 46, 'https://www.zeitvintagewatch.com/cdn/shop/files/OMEGADEVILLE151010_5_-15.jpg?v=1723603921&width=990');
INSERT INTO `product_images` VALUES (47, 47, 'https://www.zeitvintagewatch.com/cdn/shop/files/OMEGADEVILLE151010_5_-15.jpg?v=1723603921&width=990');
INSERT INTO `product_images` VALUES (48, 48, 'https://www.zeitvintagewatch.com/cdn/shop/files/DSCF1916.jpg?v=1734165768&width=990');
INSERT INTO `product_images` VALUES (49, 49, 'https://www.zeitvintagewatch.com/cdn/shop/files/P1345558.jpg?v=1720079523&width=990');
INSERT INTO `product_images` VALUES (50, 50, 'https://www.zeitvintagewatch.com/cdn/shop/files/DSCF4504.jpg?v=1730867496&width=990');
INSERT INTO `product_images` VALUES (51, 51, 'https://www.zeitvintagewatch.com/cdn/shop/files/OMEGASEAMASTER2975-5-SC-1.jpg?v=1741069953&width=990');




INSERT INTO `product_images` VALUES (52, 52, 'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/2024_3_11_638457733130725371_garmin-forerunner-165-den%20(4).jpg');
INSERT INTO `product_images` VALUES (53, 53,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02903-06/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (54, 54,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02903-06/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (55, 55,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02907-70/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (56, 56,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02936-40/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (57, 57,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02934-41/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (58, 58,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02935-41/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (59, 59,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02933-23/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (60, 60,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02932-13/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (61, 61,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_15,q_auto,w_66/c_limit,h_15,w_66/v1/Product_Images/vi_VN/products/010-02784-50/v/cf-xl?pgw=1');
INSERT INTO `product_images` VALUES (62, 62,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02784-51/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (63, 63,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02785-50/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (64, 64,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02785-51/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (65, 65,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02785-52/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (66, 66,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02785-54/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (67, 67,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02862-52/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (68, 68,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-03406-14/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (69, 69,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02810-53/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (70, 70,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02863-B1/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (71, 71,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_15,q_auto,w_66/c_limit,h_15,w_66/v1/Product_Images/vi_VN/products/010-02863-B2/v/cf-xl?pgw=1');
INSERT INTO `product_images` VALUES (72, 72,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02863-B3/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (73, 73,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02863-AB/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (74, 74,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02809-80/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (75, 75,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02839-21/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (76, 76,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02839-60/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (77, 77,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02839-61/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (78, 78,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02839-63/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (79, 79,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02839-62/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (80, 80,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_772,q_auto,w_1600/c_limit,h_772,w_1600/v1/Product_Images/vi_VN/products/010-02891-50/v/cf-xl?pgw=1');
INSERT INTO `product_images` VALUES (81, 81,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02891-51/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (82, 82,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02891-52/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (83, 83,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02562-51/v/cf-xl-a7a0c155-d16d-48f2-b280-61f05b1ccb27?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (84, 84,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_772,q_auto,w_1600/c_limit,h_772,w_1600/v1/Product_Images/vi_VN/products/010-03393-D4/v/cf-xl?pgw=1');
INSERT INTO `product_images` VALUES (85, 85,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_772,q_auto,w_1600/c_limit,h_772,w_1600/v1/Product_Images/vi_VN/products/010-02648-A4/v/cf-xl?pgw=1');
INSERT INTO `product_images` VALUES (86, 86,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02648-B4/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (87, 87,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_772,q_auto,w_1600/c_limit,h_772,w_1600/v1/Product_Images/vi_VN/products/010-02648-C4/v/cf-xl?pgw=1');
INSERT INTO `product_images` VALUES (88, 88,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02722-B3/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (89, 89,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_772,q_auto,w_1600/c_limit,h_772,w_1600/v1/Product_Images/vi_VN/products/010-02665-80/v/cf-xl?pgw=1');
INSERT INTO `product_images` VALUES (90, 90,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_15,q_auto,w_66/c_limit,h_15,w_66/v1/Product_Images/vi_VN/products/010-02746-52/v/cf-xl?pgw=1');
INSERT INTO `product_images` VALUES (91, 91,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_15,q_auto,w_66/c_limit,h_15,w_66/v1/Product_Images/vi_VN/products/010-03010-40/v/cf-xl?pgw=1');
INSERT INTO `product_images` VALUES (92, 92,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_772,q_auto,w_1600/c_limit,h_772,w_1600/v1/Product_Images/vi_VN/products/010-02803-93/v/cf-xl?pgw=1');
INSERT INTO `product_images` VALUES (93, 93,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-01847-20/v/cf-xl-47b2fed2-0347-4d87-997b-52b7da0e869d?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (94, 94,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02441-51/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (95, 95,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02247-60/v/cf-xl-33453540-ede7-4573-96cb-d6b3b3907632?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (96, 96,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_772,q_auto,w_1600/c_limit,h_772,w_1600/v1/Product_Images/vi_VN/products/010-02785-50/v/cf-xl?pgw=1');
INSERT INTO `product_images` VALUES (97, 97,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02862-52/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (98, 98,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02862-5B/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (99, 99,'đồng hồ smart watch vívoactive 5 5','https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_1004,q_auto,w_2080/c_limit,h_1004,w_2080/v1/Product_Images/vi_VN/products/010-02862-53/v/cf-xl?pgw=1&pgwact=1');
INSERT INTO `product_images` VALUES (100, 100,'https://res.garmin.com/transform/image/upload/c_limit,dpr_1.0,f_auto,h_772,q_auto,w_1600/c_limit,h_772,w_1600/v1/Product_Images/vi_VN/products/010-02862-5A/v/cf-xl?pgw=1');
INSERT INTO `product_images` VALUES (101, 101, 'https://www.zeitvintagewatch.com/cdn/shop/files/OMEGASEAMASTER2975-5-SC-1.jpg?v=1741069953&width=990');



-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `productId` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `priceBuy` int NULL DEFAULT NULL,
  `priceSell` int NULL DEFAULT NULL,
  `productDetail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `brandName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  `categoryId` int NULL DEFAULT NULL,
  `imageId` int NULL DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE,
  INDEX `categoryId`(`categoryId` ASC) USING BTREE,
  INDEX `fk_products_image`(`imageId` ASC) USING BTREE,
  CONSTRAINT `fk_products_image` FOREIGN KEY (`imageId`) REFERENCES `product_images` (`imageId`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 205 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Đồng hồ thông minh Garmin Instinct 2', 4000000, 5390000, 'Đồng hồ thể thao chống nước, nhiều chức năng.', 'Garmin', '2025-03-30 23:46:57', 4, 1);
INSERT INTO `products` VALUES (2, 'Đồng hồ thông minh Garmin Instinct 2S', 4000000, 5390000, 'Chăm sóc sức khoẻ tốt hơn - đo nhịp tim, giấc ngủ, tuổi cơ thể...', 'Garmin', '2025-03-30 23:46:59', 4, 2);
INSERT INTO `products` VALUES (3, 'Đồng hồ thông minh Amazfit T-rex 2', 3000000, 4390000, 'Độ bền chuẩn quân đội - chống chịu nhiệt độ -30 - 70 độ. Kháng nước chuẩn 10 ATM', 'Amazfit', '2025-03-30 23:47:00', 4, 3);
INSERT INTO `products` VALUES (4, 'Đồng hồ thông minh Garmin Instinct 2X Solar', 8000000, 11390000, 'Sở hữu khả năng sạc bằng năng lượng mặt trời cho phép sử dụng đến 40 ngày ở chế độ thông minh', 'Garmin', '2025-03-30 23:47:00', 4, 4);
INSERT INTO `products` VALUES (5, 'Đồng hồ thông minh Garmin Instinct 3 Solar', 8200000, 11350000, 'Hệ thống GPS chính xác giúp người dùng dễ dàng định vị và ghi lại hành trình.', 'Garmin', '2025-03-30 23:47:02', 4, 5);
INSERT INTO `products` VALUES (6, 'Đồng hồ thông minh Garmin Forerunner 965', 1200000, 15550000, 'Thời lượng pin dài lên đến 30 ngày ở chế độ tiết kiệm pin, 31 giờ khi bật GPS liên tục', 'Garmin', '2025-03-30 23:47:03', 4, 6);
INSERT INTO `products` VALUES (7, 'Đồng hồ thông minh Samsung Galaxy Watch7 LTE 40mm', 4000000, 6550000, 'Chống nước 5 ATM - ISO 22810:2010 (Tắm, bơi vùng nước nông)', 'Samsung', '2025-03-30 23:47:04', 4, 7);
INSERT INTO `products` VALUES (8, 'Đồng hồ thông minh BeFit Sporty 3 46.4mm', 900000, 1500000, 'Dài 46.4 mm - Ngang 46.4 mm - Dày 11.65 mm - Nặng 45 g', 'BeFit', '2025-03-30 23:47:05', 4, 8);
INSERT INTO `products` VALUES (9, 'Đồng hồ thông minh Garmin Vivoactive 5 42.2mm dây silicone', 4900000, 5700000, 'Màn hình luôn hiển thị - Phát hiện té ngã', 'Garmin', '2025-03-30 23:47:06', 4, 9);
INSERT INTO `products` VALUES (10, 'Đồng hồ định vị trẻ em Kidcare K1', 1900000, 2700000, 'Cuộc gọi video 4G/LTE - Kháng nước IPX8 (Rửa tay, đi mưa)', 'Kidcare', '2025-03-30 23:47:08', 4, 10);
INSERT INTO `products` VALUES (11, 'Đồng hồ G-Shock 49.6 mm Nam GST-B400CX-1ADR', 7900000, 9550000, 'Carbon + Thép không gỉ', 'G-SHOCK', '2025-03-30 23:47:09', 4, 11);
INSERT INTO `products` VALUES (12, 'Đồng hồ Baby-G BGA-290 41.5 mm Nữ BGA-290DS-2ADR', 1750000, 2359000, 'Thời gian sử dụng pin: khoảng 3 năm', 'BABY-G', '2025-03-30 23:47:11', 4, 12);
INSERT INTO `products` VALUES (13, 'Đồng hồ Casio 43.4 mm Nam MTP-E715D-7AVDF', 1550000, 1959000, 'Dây đeo: Thép không gỉ mạ Ion', 'Casio', '2025-03-30 23:47:12', 4, 13);
INSERT INTO `products` VALUES (14, 'Đồng hồ CASIO 41.5 mm Nam MTP-V300B-1AUDF', 1350000, 1799000, 'Dây đeo: Thép không gỉ mạ Ion', 'Casio', '2025-03-30 23:47:13', 4, 14);
INSERT INTO `products` VALUES (15, 'Đồng hồ Casio 37.6 mm Nữ LWS-2200H-4AVDF', 735000, 1009000, 'Tên bộ máy: 3557', 'Casio', '2025-03-30 23:47:15', 4, 15);
INSERT INTO `products` VALUES (16, 'Đồng hồ Casio 50.5 × 50.4 mm Nam DW-291HX-1AVDF', 830000, 1239000, 'Chất liệu mặt kính: kính khoáng Mineral', 'Casio', '2025-03-30 23:47:16', 4, 16);
INSERT INTO `products` VALUES (17, 'Đồng hồ G-Shock 2100 45.4 mm Nam GA-B2100CD-1A4DR', 3720000, 4339000, 'Chất liệu khung viền: Carbon + Nhựa Resin', 'G-SHOCK', '2025-03-30 23:47:18', 4, 17);
INSERT INTO `products` VALUES (18, 'Đồng hồ G-Shock 40.2 mm Nữ GMA-P2100SG-2ADR', 1728000, 2479000, 'Chất liệu khung viền: Carbon + Nhựa Resin', 'G-SHOCK', '2025-03-30 23:47:20', 4, 18);
INSERT INTO `products` VALUES (19, 'Đồng hồ G-Shock 2100 44.4 mm Nam GM-B2100AD-2ADR', 10028000, 13009000, 'Khung viền: thép không gỉ', 'G-SHOCK', '2025-03-30 23:47:21', 4, 19);
INSERT INTO `products` VALUES (20, 'Đồng hồ Citizen 40 mm Nam BI5127-51H', 1028000, 3663000, 'Khung viền: thép không gỉ', 'Citizen', '2025-03-30 23:47:23', 2, 20);
INSERT INTO `products` VALUES (21, 'Đồng hồ Citizen 31 mm Nữ EL3100-55Z', 1520000, 2751000, 'Khung viền: thép không gỉ', 'Citizen', '2025-03-30 23:47:26', 2, 21);
INSERT INTO `products` VALUES (22, 'Đồng hồ Citizen 40 mm Nam BI5120-51L', 1520000, 2751000, 'Khung viền: thép không gỉ', 'Citizen', '2025-03-30 23:47:35', 2, 22);
INSERT INTO `products` VALUES (23, 'Đồng hồ Citizen 40 mm Nam BI5124-50L', 2490000, 3341000, 'Khung viền: thép không gỉ', 'Citizen', '2025-03-30 23:47:37', 2, 23);
INSERT INTO `products` VALUES (24, 'Đồng hồ Orient Vietnam Special Edition 41.5 mm Nam RA-AS0105S30B', 8770000, 10991000, 'Khung viền: thép không gỉ', 'ORIENT', '2025-03-30 23:47:38', 2, 24);
INSERT INTO `products` VALUES (25, 'Đồng hồ Citizen Tsuyosa 40 mm Nam NJ0152-51X', 8020000, 10263000, 'Khung viền: thép không gỉ', 'Citizen', '2025-03-30 23:47:43', 2, 25);
INSERT INTO `products` VALUES (26, 'Đồng hồ Orient Vietnam Special Edition 41.5 mm Nam RA-AS0106L30B', 1780000, 13660000, 'Khung viền: thép không gỉ', 'ORIENT', '2025-03-30 23:47:45', 2, 26);
INSERT INTO `products` VALUES (27, 'Đồng hồ Orient 41 mm Nam RE-AV0127L00B', 17800000, 23885000, 'Khung viền: thép không gỉ', 'ORIENT', '2025-03-30 23:47:46', 2, 27);
INSERT INTO `products` VALUES (28, 'Đồng hồ Orient Vietnam Special Edition 39.3 mm Nam RE-AT0018S00B', 20899000, 25698000, 'Khung viền: thép không gỉ', 'ORIENT', '2025-03-30 23:47:48', 2, 28);
INSERT INTO `products` VALUES (29, 'BAUME & MERCIER CHRONOGRAPH MOONPHASE REF. 6102.099', 27899000, 31001000, 'Khung viền: thép không gỉ', 'Baume & Mercier', '2025-03-30 23:47:50', 2, 29);
INSERT INTO `products` VALUES (30, 'OMEGA CONSTELLATION CHRONOMETER AUTOMATIC REF. 168.018', 19999000, 23031000, 'Khung viền: thép không gỉ', 'OMEGA', '2025-03-30 23:47:53', 2, 30);
INSERT INTO `products` VALUES (31, 'UNIVERSAL GENÈVE GILT SHADOW AUTOMATIC REF. 566101', 9799000, 12031000, 'Khung viền: thép không gỉ', 'Universal Genève', '2025-03-30 23:47:54', 2, 31);
INSERT INTO `products` VALUES (32, 'UNIVERSAL GENÈVE WHITE SHADOW AUTOMATIC ULTRA-SLIM REF. 866105', 1417000, 18129000, 'Khung viền: thép không gỉ', 'Universal Genève', '2025-03-30 23:47:55', 2, 32);
INSERT INTO `products` VALUES (33, 'UNIVERSAL GENÈVE GILT SHADOW AUTOMATIC ULTRA-SLIM REF. 566105', 1415000, 18192000, 'Khung viền: thép không gỉ', 'Universal Genève', '2025-03-30 23:47:56', 2, 33);
INSERT INTO `products` VALUES (34, 'LONGINES FLAGSHIP AUTOMATIC REF. 3401-4', 1235000, 16890000, 'Khung viền: thép không gỉ', 'LONGINES', '2025-03-30 23:47:58', 2, 34);
INSERT INTO `products` VALUES (35, 'LONGINES FLAGSHIP REF. 7686-13', 4350000, 6481000, 'Khung viền: thép không gỉ', 'LONGINES', '2025-03-30 23:47:59', 2, 35);
INSERT INTO `products` VALUES (36, 'LONGINES REF. 8446-5', 4350000, 6481000, 'Khung viền: thép không gỉ', 'LONGINES', '2025-03-30 23:48:01', 2, 36);
INSERT INTO `products` VALUES (37, 'LONGINES AUTOMATIC REF. 4246', 5772000, 9343000, 'Khung viền: thép không gỉ', 'LONGINES', '2025-03-30 23:48:02', 2, 37);
INSERT INTO `products` VALUES (38, 'LONGINES REF. 4150', 4752000, 6441000, 'Khung viền: thép không gỉ', 'LONGINES', '2025-03-30 23:48:04', 2, 38);
INSERT INTO `products` VALUES (39, 'LONGINES AUTOMATIC REF. 3617', 6755000, 9083000, 'Khung viền: thép không gỉ', 'LONGINES', '2025-03-30 23:48:06', 2, 39);
INSERT INTO `products` VALUES (40, 'LONGINES ULTRA-CHRON AUTOMATIC REF. 7851', 8805000, 11185000, 'Khung viền: thép không gỉ', 'LONGINES', '2025-03-30 23:48:07', 2, 40);
INSERT INTO `products` VALUES (41, 'LONGINES ULTRA-CHRON AUTOMATIC REF. 8442-1', 10000000, 14288000, 'Khung viền: thép không gỉ', 'LONGINES', '2025-03-30 23:48:08', 2, 41);
INSERT INTO `products` VALUES (42, 'LONGINES ULTRA-CHRON AUTOMATIC REF. 8042-1', 7033000, 11946000, 'Khung viền: thép không gỉ', 'LONGINES', '2025-03-30 23:48:09', 2, 42);
INSERT INTO `products` VALUES (43, 'BAUME & MERCIER HAMPTON AUTOMATIC REF. 65308', 1055700, 14286000, 'Khung viền: thép không gỉ', 'Baume & Mercier', '2025-03-30 23:48:11', 2, 43);
INSERT INTO `products` VALUES (44, 'OMEGA AUTOMATIC REF. 3971-4-SC', 10999000, 14339000, 'Khung viền: thép không gỉ', 'OMEGA', '2025-03-30 23:48:12', 2, 44);
INSERT INTO `products` VALUES (45, 'OMEGA DE VILLE AUTOMATIC REF. 161.021', 8989000, 12209000, 'Khung viền: thép không gỉ', 'OMEGA', '2025-03-30 23:48:13', 2, 45);
INSERT INTO `products` VALUES (46, 'OMEGA DE VILLE AUTOMATIC REF. 151.010', 7009000, 11949000, 'Khung viền: thép không gỉ', 'OMEGA', '2025-03-30 23:48:14', 2, 46);
INSERT INTO `products` VALUES (47, 'OMEGA GENÈVE AUTOMATIC REF. 162.0010', 7809000, 10940000, 'Khung viền: thép không gỉ', 'OMEGA', '2025-03-30 23:48:15', 2, 47);
INSERT INTO `products` VALUES (48, 'OMEGA GENÈVE DYNAMIC AUTOMATIC REF 166.107', 10293000, 15589000, 'Khung viền: thép không gỉ', 'OMEGA', '2025-03-30 23:48:18', 2, 48);
INSERT INTO `products` VALUES (49, 'OMEGA GENÈVE AUTOMATIC REF. 162.0042', 7993000, 11685000, 'Khung viền: thép không gỉ', 'OMEGA', '2025-03-30 23:48:19', 2, 49);
INSERT INTO `products` VALUES (50, 'OMEGA GENÈVE AUTOMATIC REF. 162.010', 7993000, 10384000, 'Khung viền: thép không gỉ', 'OMEGA', '2025-03-30 23:48:21', 2, 50);
INSERT INTO `products` VALUES (51, 'OMEGA SEAMASTER AUTOMATIC REF. 2975-5-SC', 17999000, 22085000, 'Khung viền: thép không gỉ', 'OMEGA', '2025-03-30 23:48:23', 2, 51);





INSERT INTO `products` VALUES (52, 'Garmin Forerunner 165','3020000','6020000','đồng hồ smart watch chạy bộ thế hệ mới Garmin Forerunner 165','Garmin', NOW(), 3, 52);
INSERT INTO `products` VALUES (53, 'fēnix 8','10000.000','31990000 ','Garmin','đồng hồ smart watch fēnix 8 ', NOW(), 3, 53);
INSERT INTO `products` VALUES (54, 'fēnix 8','10000.000','26990000 ','đồng hồ smart watch fēnix 8 ','Garmin', NOW(), 3, 54);
INSERT INTO `products` VALUES (55, 'fēnix 8','10000.000','29990000 ','đồng hồ smart watch fēnix 8 ','Garmin', NOW(), 3, 55);
INSERT INTO `products` VALUES (56, 'fēnix 8 Solar','10000.000','31990000 ','đồng hồ smart watch fēnix 8 Solar ','Garmin', NOW(), 3, 56);
INSERT INTO `products` VALUES (57, 'Instinct 3','5000000','12290000','đồng hồ smart watch Instinct 3','Garmin', NOW(), 3, 6);
INSERT INTO `products` VALUES (58, 'Instinct 3 Solar','5000000','12290000','đồng hồ smart watch Instinct 3 Solar','Garmin', NOW(), 3, 57);
INSERT INTO `products` VALUES (59, 'Instinct 3 Solar','5000000','12290000','đồng hồ smart watch Instinct 3 Solar','Garmin', NOW(), 3, 58);
INSERT INTO `products` VALUES (60, 'Instinct E','5000000','8290000','đồng hồ smart watch Instinct E','Garmin', NOW(), 3, 59);
INSERT INTO `products` VALUES (61, 'Instinct E','5000000','8290000','đồng hồ smart watch Instinct E', NOW(), 3, 60);
INSERT INTO `products` VALUES (62, 'Venu 3','5000000','12290000','đồng hồ smart watch Venu 3','Garmin', NOW(), 3, 61);
INSERT INTO `products` VALUES (63, 'Venu 3','5000000','12290000','đồng hồ smart watch Venu 3', NOW(),'Garmin', 3, 62);
INSERT INTO `products` VALUES (64, 'Venu 3 S','5000000','12290000','đồng hồ smart watch Venu 3 S','Garmin', NOW(), 3, 63);
INSERT INTO `products` VALUES (65, 'Venu 3 S','5000000','12290000','đồng hồ smart watch Venu 3 S','Garmin', NOW(), 3, 64);
INSERT INTO `products` VALUES (66, 'Venu 3 S','5000000','12290000','đồng hồ smart watch Venu 3 S','Garmin', NOW(), 3, 66);
INSERT INTO `products` VALUES (67, 'Venu 3 S','5000000','12290000','đồng hồ smart watch Venu 3 S','Garmin', NOW(), 3, 67);
INSERT INTO `products` VALUES (68, 'vívoactive 5','800000','5790000','đồng hồ smart watch vívoactive 5','Garmin', NOW(), 3, 68);
INSERT INTO `products` VALUES (69, 'tactix 8','10000000','37990000','đồng hồ smart watch tactix 8','Garmin', NOW(), 3, 69);
INSERT INTO `products` VALUES (70, 'Forerunner 265S','900000','11690000','đồng hồ smart watch Forerunner 265S','Garmin', NOW(), 3, 70);
INSERT INTO `products` VALUES (71, 'Forerunner 165 Music','900000','7990000','đồng hồ smart watch Forerunner 265S','Garmin', NOW(), 3, 71);
INSERT INTO `products` VALUES (72, 'Forerunner 165 Music','900000','7990000','đồng hồ smart watch Forerunner 265S','Garmin', NOW(), 3, 72);
INSERT INTO `products` VALUES (73, 'Forerunner 165 Music','900000','7990000','đồng hồ smart watch Forerunner 265S','Garmin', NOW(), 3, 73);
INSERT INTO `products` VALUES (74, 'Forerunner 165','900000','6690000','đồng hồ smart watch Forerunner 265S','Garmin', NOW(), 3, 74);
INSERT INTO `products` VALUES (75, 'Forerunner 965','900000','16490000','đồng hồ smart watch Forerunner 965','Garmin', NOW(), 3, 75);
INSERT INTO `products` VALUES (76, 'Lily 2','900000','6490000','đồng hồ smart watch Lily 2','Garmin', NOW(), 3, 76);
INSERT INTO `products` VALUES (77, 'Lily 2 Classic','900000','8490000','đồng hồ smart watch Lily 2 Classic','Garmin', NOW(), 3, 77);
INSERT INTO `products` VALUES (78, 'Lily 2 Classic','900000','8490000','đồng hồ smart watch Lily 2 Classic','Garmin', NOW(), 3, 78);
INSERT INTO `products` VALUES (79, 'Lily 2 Classic','900000','8490000','đồng hồ smart watch Lily 2 Classic','Garmin', NOW(), 3, 79);
INSERT INTO `products` VALUES (80, 'Lily 2 Classic','900000','8490000','đồng hồ smart watch Lily 2 Classic','Garmin', NOW(), 3, 80);
INSERT INTO `products` VALUES (81, 'Lily 2 Active','900000','8490000','đồng hồ smart watch Lily 2 Active','Garmin', NOW(), 3, 81);
INSERT INTO `products` VALUES (82, 'Lily 2 Active','900000','8490000','đồng hồ smart watch Lily 2 Active','Garmin', NOW(), 3, 82);
INSERT INTO `products` VALUES (83, 'Lily 2 Active','900000','8490000','đồng hồ smart watch Lily 2 Active','Garmin', NOW(), 3, 83);
INSERT INTO `products` VALUES (84, 'Forerunner 55','900000','3490000','đồng hồ smart watch Forerunner 55','Garmin', NOW(), 3, 84);
INSERT INTO `products` VALUES (85, 'MARQ Adventurer (Gen 2) - Damascus Steel Edition','9000000','79990000','đồng hồ smart watch MARQ Adventurer (Gen 2) - Damascus Steel Edition','Garmin', NOW(), 3, 85);
INSERT INTO `products` VALUES (86, 'MARQ Aviator (Gen 2)','9000000','59490000','đồng hồ smart watch MARQ Aviator (Gen 2)','Garmin', NOW(), 3, 86);
INSERT INTO `products` VALUES (87, 'MARQ Aviator (Gen 2)','9000000','59490000','đồng hồ smart watch MARQ Aviator (Gen 2)','Garmin', NOW(), 3, 87);
INSERT INTO `products` VALUES (88, 'MARQ Golfer (Gen 2)','9000000','62290000','đồng hồ smart watch MARQ Golfer (Gen 2)','Garmin', NOW(), 3, 88);
INSERT INTO `products` VALUES (89, 'MARQ Athlete (Gen 2) - Carbon Edition','9000000','77990000','đồng hồ smart watch MARQ Athlete (Gen 2) - Carbon Edition','Garmin', NOW(), 3, 89);
INSERT INTO `products` VALUES (90, 'vívomove Trend','900000','7290000','đồng hồ smart watch vívomove Trend','Garmin', NOW(), 3, 90);
INSERT INTO `products` VALUES (91, 'Approach S70','900000','18290000','đồng hồ smart watch Approach S70','Garmin', NOW(), 3, 91);
INSERT INTO `products` VALUES (92, 'Approach S50','900000','18290000','đồng hồ smart watch Approach S50','Garmin', NOW(), 3, 92);
INSERT INTO `products` VALUES (93, 'quatix 7 Pro','900000','25990000','đồng hồ smart watch quatix 7 Pro','Garmin', NOW(), 3, 93);
INSERT INTO `products` VALUES (94, 'vívofit 4','900000','2390000','đồng hồ smart watch vívofit 4','Garmin', NOW(), 3, 94);
INSERT INTO `products` VALUES (95, 'vívofit jr. 3','900000','2690000','đồng hồ smart watch vívofit jr. 3','Garmin', NOW(), 3, 95);
INSERT INTO `products` VALUES (96, 'Garmin Swim 2','900000','3690000','đồng hồ smart watch Garmin Swim 2','Garmin', NOW(), 3, 96);
INSERT INTO `products` VALUES (97, 'Venu 3S','900000','12290000','đồng hồ smart watch Venu 3S','Garmin', NOW(), 3, 97);
INSERT INTO `products` VALUES (98, 'vívoactive 5','900000','5790000','đồng hồ smart watch vívoactive 5 5','Garmin', NOW(), 3, 98);
INSERT INTO `products` VALUES (99, 'vívoactive 5','900000','5790000','đồng hồ smart watch vívoactive 5 5','Garmin', NOW(), 3, 99);
INSERT INTO `products` VALUES (100, 'vívoactive 5','900000','5790000','Garmin', NOW(), 3, 100);
INSERT INTO `products` VALUES (101, 'vívoactive 5','900000','5790000','đồng hồ smart watch vívoactive 5 5','Garmin', NOW(), 3, 101);






-- ----------------------------
-- Table structure for productviews
-- ----------------------------
DROP TABLE IF EXISTS `productviews`;
CREATE TABLE `productviews`  (
  `productViewId` int NOT NULL AUTO_INCREMENT,
  `viewProduct` decimal(10, 0) NULL DEFAULT NULL,
  `dayView` date NULL DEFAULT NULL,
  `productId` int NULL DEFAULT NULL,
  PRIMARY KEY (`productViewId`) USING BTREE,
  INDEX `productId`(`productId` ASC) USING BTREE,
  CONSTRAINT `productviews_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productviews
-- ----------------------------
INSERT INTO `productviews` VALUES (1, 100, '2023-10-05', 1);
INSERT INTO `productviews` VALUES (2, 150, '2023-10-05', 2);
INSERT INTO `productviews` VALUES (3, 200, '2023-10-06', 1);
INSERT INTO `productviews` VALUES (4, 50, '2023-10-06', 3);

-- ----------------------------
-- Table structure for stocks
-- ----------------------------
DROP TABLE IF EXISTS `stocks`;
CREATE TABLE `stocks`  (
  `stockId` int NOT NULL AUTO_INCREMENT,
  `stockName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `quatityStock` int NULL DEFAULT NULL,
  `minQuatity` int NULL DEFAULT NULL,
  `updateStockAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  `productId` int NULL DEFAULT NULL,
  PRIMARY KEY (`stockId`) USING BTREE,
  INDEX `productId`(`productId` ASC) USING BTREE,
  CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stocks
-- ----------------------------
INSERT INTO `stocks` VALUES (1, 'Kho A', 50, 10, '2025-03-17 08:48:10', 1);
INSERT INTO `stocks` VALUES (2, 'Kho B', 30, 5, '2025-03-17 08:48:10', 2);
INSERT INTO `stocks` VALUES (3, 'Kho C', 20, 2, '2025-03-17 08:48:10', 3);
INSERT INTO `stocks` VALUES (4, 'Kho D', 50, 15, '2025-03-17 08:48:10', 4);
INSERT INTO `stocks` VALUES (5, 'Kho A', 50, 10, '2025-03-17 08:48:10', 5);
INSERT INTO `stocks` VALUES (6, 'Kho B', 30, 5, '2025-03-17 08:48:10', 6);
INSERT INTO `stocks` VALUES (7, 'Kho C', 20, 2, '2025-03-17 08:48:10', 7);
INSERT INTO `stocks` VALUES (8, 'Kho D', 50, 15, '2025-03-17 08:48:10', 8);
INSERT INTO `stocks` VALUES (9, 'Kho A', 40, 10, '2025-03-17 08:48:10', 9);
INSERT INTO `stocks` VALUES (10, 'Kho B', 25, 5, '2025-03-17 08:48:10', 10);
INSERT INTO `stocks` VALUES (11, 'Kho C', 15, 2, '2025-03-17 08:48:10', 11);
INSERT INTO `stocks` VALUES (12, 'Kho D', 60, 20, '2025-03-17 08:48:10', 12);
INSERT INTO `stocks` VALUES (13, 'Kho A', 55, 10, '2025-03-17 08:48:10', 13);
INSERT INTO `stocks` VALUES (14, 'Kho B', 35, 5, '2025-03-17 08:48:10', 14);
INSERT INTO `stocks` VALUES (15, 'Kho C', 25, 2, '2025-03-17 08:48:10', 15);
INSERT INTO `stocks` VALUES (16, 'Kho D', 45, 15, '2025-03-17 08:48:10', 16);
INSERT INTO `stocks` VALUES (17, 'Kho A', 50, 10, '2025-03-17 08:48:10', 17);
INSERT INTO `stocks` VALUES (18, 'Kho B', 30, 5, '2025-03-17 08:48:10', 18);
INSERT INTO `stocks` VALUES (19, 'Kho C', 20, 2, '2025-03-17 08:48:10', 19);
INSERT INTO `stocks` VALUES (20, 'Kho D', 50, 15, '2025-03-17 08:48:10', 20);
INSERT INTO `stocks` VALUES (21, 'Kho A', 50, 10, '2025-03-17 08:48:10', 21);
INSERT INTO `stocks` VALUES (22, 'Kho B', 30, 5, '2025-03-17 08:48:10', 22);
INSERT INTO `stocks` VALUES (23, 'Kho C', 20, 2, '2025-03-17 08:48:10', 23);
INSERT INTO `stocks` VALUES (24, 'Kho D', 50, 15, '2025-03-17 08:48:10', 24);
INSERT INTO `stocks` VALUES (25, 'Kho A', 50, 10, '2025-03-17 08:48:10', 25);
INSERT INTO `stocks` VALUES (26, 'Kho B', 30, 5, '2025-03-17 08:48:10', 26);
INSERT INTO `stocks` VALUES (27, 'Kho C', 20, 2, '2025-03-17 08:48:10', 27);
INSERT INTO `stocks` VALUES (28, 'Kho D', 50, 15, '2025-03-17 08:48:10', 28);
INSERT INTO `stocks` VALUES (29, 'Kho A', 50, 10, '2025-03-17 08:48:10', 29);
INSERT INTO `stocks` VALUES (30, 'Kho B', 30, 5, '2025-03-17 08:48:10', 30);
INSERT INTO `stocks` VALUES (31, 'Kho C', 20, 2, '2025-03-17 08:48:10', 31);
INSERT INTO `stocks` VALUES (32, 'Kho D', 50, 15, '2025-03-17 08:48:10', 32);
INSERT INTO `stocks` VALUES (33, 'Kho A', 50, 10, '2025-03-17 08:48:10', 33);
INSERT INTO `stocks` VALUES (34, 'Kho B', 30, 5, '2025-03-17 08:48:10', 34);
INSERT INTO `stocks` VALUES (35, 'Kho C', 20, 2, '2025-03-17 08:48:10', 35);
INSERT INTO `stocks` VALUES (36, 'Kho D', 50, 15, '2025-03-17 08:48:10', 36);
INSERT INTO `stocks` VALUES (37, 'Kho A', 50, 10, '2025-03-17 08:48:10', 37);
INSERT INTO `stocks` VALUES (38, 'Kho B', 30, 5, '2025-03-17 08:48:10', 38);
INSERT INTO `stocks` VALUES (39, 'Kho C', 20, 2, '2025-03-17 08:48:10', 39);
INSERT INTO `stocks` VALUES (40, 'Kho D', 50, 15, '2025-03-17 08:48:10', 40);
INSERT INTO `stocks` VALUES (41, 'Kho A', 50, 10, '2025-03-17 08:48:10', 41);
INSERT INTO `stocks` VALUES (42, 'Kho B', 30, 5, '2025-03-17 08:48:10', 42);
INSERT INTO `stocks` VALUES (43, 'Kho C', 20, 2, '2025-03-17 08:48:10', 43);
INSERT INTO `stocks` VALUES (44, 'Kho D', 50, 15, '2025-03-17 08:48:10', 44);
INSERT INTO `stocks` VALUES (45, 'Kho A', 50, 10, '2025-03-17 08:48:10', 45);
INSERT INTO `stocks` VALUES (46, 'Kho B', 30, 5, '2025-03-17 08:48:10', 46);
INSERT INTO `stocks` VALUES (47, 'Kho C', 20, 2, '2025-03-17 08:48:10', 47);
INSERT INTO `stocks` VALUES (48, 'Kho D', 50, 15, '2025-03-17 08:48:10', 48);
INSERT INTO `stocks` VALUES (49, 'Kho A', 50, 10, '2025-03-17 08:48:10', 49);
INSERT INTO `stocks` VALUES (50, 'Kho B', 30, 5, '2025-03-17 08:48:10', 50);
INSERT INTO `stocks` VALUES (51, 'Kho C', 20, 2, '2025-03-17 08:48:10', 51);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `passwordUser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` int NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'user1', 'Nguyễn', 'An', '123', 1, 'user1@example.com', '2025-03-17 08:22:15', '2025-03-17 08:22:15');
INSERT INTO `users` VALUES (2, 'user2', 'Trần', 'Bình', 'password2', 2, 'user2@example.com', '2025-03-17 08:22:15', '2025-03-17 08:22:15');
INSERT INTO `users` VALUES (3, 'user3', 'Lê', 'Cường', 'password3', 1, 'user3@example.com', '2025-03-17 08:22:15', '2025-03-17 08:22:15');

SET FOREIGN_KEY_CHECKS = 1;
