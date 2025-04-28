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
INSERT INTO `product_images` VALUES (1, 1, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/products/_/0/_0002_cf-lg-9f340e51-97bc-4651-b885-00.jpg');
INSERT INTO `product_images` VALUES (2, 2, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/products/_/0/_0005_cf-lg-65651489-2748-4e13-a2be-87_1_.jpg');
INSERT INTO `product_images` VALUES (3, 3, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/products/_/0/_0001__-_-___6_2.jpg');
INSERT INTO `product_images` VALUES (4, 4, 'https://cdn2.cellphones.com.vn/358x/media/catalog/products/g/a/garmin-2x-solar-do.jpg');
INSERT INTO `product_images` VALUES (5, 5, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/products/t/e/text_ng_n_42__3_33.png');
INSERT INTO `product_images` VALUES (6, 6, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/products/g/a/garmin-forerunner-965-trang-1.jpg');
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
