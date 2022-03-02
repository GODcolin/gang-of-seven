/*
 Navicat Premium Data Transfer

 Source Server         : knowledge
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 106.14.22.220:3306
 Source Schema         : elementary

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 02/03/2022 21:29:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(0) NULL DEFAULT 0,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `frk_parent_id`(`parent_id`) USING BTREE,
  CONSTRAINT `frk_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 0, '费用查询');
INSERT INTO `category` VALUES (2, 1, '话费余额');
INSERT INTO `category` VALUES (3, 1, '余额变动明细');
INSERT INTO `category` VALUES (4, 1, '账单查询');
INSERT INTO `category` VALUES (5, 1, '套餐使用');
INSERT INTO `category` VALUES (6, 1, '电子发票');
INSERT INTO `category` VALUES (7, 0, '详单查询');
INSERT INTO `category` VALUES (8, 7, '语音详单查询');
INSERT INTO `category` VALUES (9, 7, '短信详单查询');
INSERT INTO `category` VALUES (10, 7, '上网详单查询');
INSERT INTO `category` VALUES (11, 0, '积分查兑');
INSERT INTO `category` VALUES (12, 11, '积分查询');
INSERT INTO `category` VALUES (13, 11, '积分兑换');
INSERT INTO `category` VALUES (14, 11, '星级服务');
INSERT INTO `category` VALUES (15, 0, '充值交费');
INSERT INTO `category` VALUES (16, 15, '充值卡充值');
INSERT INTO `category` VALUES (17, 15, '充值卡余额查询');
INSERT INTO `category` VALUES (18, 15, '充值记录查询');
INSERT INTO `category` VALUES (19, 0, '手机服务');
INSERT INTO `category` VALUES (20, 19, '国际/港澳台');
INSERT INTO `category` VALUES (21, 19, '实名补登记');
INSERT INTO `category` VALUES (22, 19, '5G覆盖查询');
INSERT INTO `category` VALUES (23, 19, '一证通查');
INSERT INTO `category` VALUES (24, 29, '宽带服务');
INSERT INTO `category` VALUES (25, 0, '卡号');
INSERT INTO `category` VALUES (26, 25, '5G套餐');
INSERT INTO `category` VALUES (27, 25, '4G套餐');
INSERT INTO `category` VALUES (28, 25, '卡号专区');
INSERT INTO `category` VALUES (29, 0, '热门推荐');
INSERT INTO `category` VALUES (30, 29, '流量套餐');
INSERT INTO `category` VALUES (31, 29, '智慧生活');
INSERT INTO `category` VALUES (32, 29, '自助服务');
INSERT INTO `category` VALUES (33, 29, '热销推荐');
INSERT INTO `category` VALUES (34, 29, '客服服务');
INSERT INTO `category` VALUES (35, 29, '增值服务');
INSERT INTO `category` VALUES (36, 0, '业务');
INSERT INTO `category` VALUES (37, 36, '流量');
INSERT INTO `category` VALUES (38, 36, '话费');
INSERT INTO `category` VALUES (39, 36, '装维');
INSERT INTO `category` VALUES (40, 29, '老用户');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '反馈类型',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '反馈内容',
  `feedback_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '反馈时间',
  `knowledge_id` bigint(0) NULL DEFAULT NULL COMMENT '知识id',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '反馈状态 0待处理 1通过 2驳回',
  `handler_id` bigint(0) NULL DEFAULT NULL COMMENT '处理员id',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驳回理由',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES (1, 1, '内容过时', '阿是多少干', '2022-01-12 06:12:37', 11, '2', 3, '驳回');
INSERT INTO `feedback` VALUES (2, 1, '政治相关', '内容错误', '2022-01-12 06:14:24', 13, '0', NULL, '');
INSERT INTO `feedback` VALUES (3, 3, '知识错误', '不合理啊', '2022-01-12 06:22:05', 12, '0', NULL, '');
INSERT INTO `feedback` VALUES (4, 4, '存在错字', '啊哈大会', '2022-01-12 07:46:50', 14, '0', NULL, '');
INSERT INTO `feedback` VALUES (5, 1, '样式问题', '真丑的知识，赶紧撤掉', '2022-01-12 08:43:26', 16, '0', NULL, '');
INSERT INTO `feedback` VALUES (6, 1, '内容涉黄', '我的反馈结果我怎么收不到啊', '2022-01-12 11:22:49', 18, '0', NULL, '');
INSERT INTO `feedback` VALUES (7, 1, '内容错误', '知识内容和题目不符合', '2022-01-12 11:24:47', 19, '0', NULL, '');
INSERT INTO `feedback` VALUES (8, 1, '内容错误', 'jiade', '2022-01-12 11:33:05', 23, '0', NULL, '');
INSERT INTO `feedback` VALUES (9, 2, '包含敏感词', '敏感词呲呲呲', '2022-01-13 12:41:01', 24, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (10, 4, '内容错误', '感觉不对劲', '2022-01-13 12:41:34', 26, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (11, 3, '内容过时', '貌似过时了', '2022-01-13 12:41:55', 27, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (12, 5, '内容不完整', '反馈一下反馈吧', '2022-01-13 12:42:41', 28, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (13, 3, '存在歧义', '对于这条知识，我有八种理解', '2022-01-13 12:43:54', 30, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (14, 6, '标签错误', '这里的标签写错了吧', '2022-01-13 12:44:36', 31, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (15, 3, '包含敏感词', '敏感词有点多了吧', '2022-01-13 12:45:10', 33, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (16, 7, '内容错误', '第一行有误，应该为', '2022-01-14 10:18:26', 34, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (17, 9, '内容错误', '第二行有误，应该为', '2022-01-14 10:19:15', 35, '2', 8, '反馈内容不详细');
INSERT INTO `feedback` VALUES (18, 8, '内容错误', '第三行有误，应该为', '2022-01-14 10:19:48', 37, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (19, 6, '内容错误', '第四行有误，应该为', '2022-01-14 10:20:24', 38, '0', NULL, '');
INSERT INTO `feedback` VALUES (20, 5, '内容错误', '第五行有误，应该为', '2022-01-14 10:20:46', 40, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (21, 4, '格式有误', '第六行格式不对', '2022-01-14 10:22:12', 44, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (22, 3, '格式有误', '第七行格式不对', '2022-01-14 10:22:30', 45, '2', 8, '123456');
INSERT INTO `feedback` VALUES (23, 1, '样式问题', '样式有点难看', '2022-01-14 13:28:11', 11, '2', 1, '没有错字');
INSERT INTO `feedback` VALUES (24, 1, '内容过时', '内容早就过时了', '2022-01-15 02:50:25', 11, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (25, 1, '包含敏感词', '存在xxx等敏感词', '2022-01-15 02:59:21', 12, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (26, 1, '存在错字', 'yyyyy字错了', '2022-01-15 02:59:43', 13, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (27, 1, '样式问题', '整个页面都偏了哎', '2022-01-15 03:00:25', 14, '2', 9, '没有偏，驳回');
INSERT INTO `feedback` VALUES (29, 1, '存在错字', '第一行有错字', '2022-01-15 06:27:46', 19, '2', 1, '没有错字');
INSERT INTO `feedback` VALUES (30, 1, '存在错字', '第一行有错字', '2022-01-15 07:23:11', 11, '0', NULL, '');
INSERT INTO `feedback` VALUES (31, 8, '存在错字', '测试一下对不对', '2022-01-18 08:07:27', 32, '2', 9, '反馈不属实');
INSERT INTO `feedback` VALUES (32, 5, '样式问题', '段落没有缩进', '2022-01-21 03:46:13', 128, '2', 9, '反馈不正确');
INSERT INTO `feedback` VALUES (33, 4, '样式问题', '段落', '2022-01-21 07:16:32', 128, '0', NULL, '');
INSERT INTO `feedback` VALUES (34, 4, '存在错字', 'sss', '2022-01-21 11:57:21', 2, '1', 9, NULL);
INSERT INTO `feedback` VALUES (35, 4, '存在错字', '啊哈大会', '2022-01-21 13:36:05', 34, '2', 9, '反馈不属实');
INSERT INTO `feedback` VALUES (36, 4, '存在错字', '第一段存在错字', '2022-01-21 13:44:22', 63, '1', 9, NULL);
INSERT INTO `feedback` VALUES (37, 4, '存在错字', '第一段存在错字', '2022-01-21 14:09:12', 109, '1', 9, NULL);
INSERT INTO `feedback` VALUES (38, 4, '存在错字', '第一段存在错字', '2022-01-21 14:41:12', 23, '1', 9, NULL);
INSERT INTO `feedback` VALUES (39, 4, '存在错字', '啊哈大会', '2022-01-21 23:33:44', 34, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (40, 1, '内容错误', '第几段', '2022-01-22 04:21:16', 59, '1', 1, NULL);
INSERT INTO `feedback` VALUES (41, 4, '存在错字', '啊哈大会', '2022-02-24 11:09:57', 34, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (42, 1, '样式问题', 'dada', '2022-02-24 13:04:07', 128, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (43, 4, '存在错字', '啊哈大会', '2022-02-27 13:50:33', 34, '0', NULL, NULL);
INSERT INTO `feedback` VALUES (44, 4, '存在错字', '啊哈大会', '2022-03-01 12:16:20', 34, '0', NULL, NULL);

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `knowledge_id` bigint(0) NOT NULL COMMENT '知识id',
  `view_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '浏览时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2409 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (5, 2, 15, '2022-01-06 15:52:13');
INSERT INTO `history` VALUES (8, 2, 18, '2022-01-06 16:08:30');
INSERT INTO `history` VALUES (11, 1, 23, '2022-01-06 20:33:03');
INSERT INTO `history` VALUES (12, 2, 24, '2022-01-06 20:33:24');
INSERT INTO `history` VALUES (13, 2, 25, '2022-01-06 20:34:06');
INSERT INTO `history` VALUES (14, 2, 26, '2022-01-06 20:34:16');
INSERT INTO `history` VALUES (15, 2, 27, '2022-01-06 20:34:39');
INSERT INTO `history` VALUES (16, 2, 28, '2022-01-06 20:34:45');
INSERT INTO `history` VALUES (17, 2, 29, '2022-01-06 20:34:50');
INSERT INTO `history` VALUES (18, 2, 30, '2022-01-06 20:34:57');
INSERT INTO `history` VALUES (20, 2, 32, '2022-01-06 20:35:16');
INSERT INTO `history` VALUES (22, 1, 34, '2022-01-21 09:07:35');
INSERT INTO `history` VALUES (23, 1, 35, '2022-01-06 20:35:35');
INSERT INTO `history` VALUES (24, 1, 36, '2022-01-06 20:38:18');
INSERT INTO `history` VALUES (25, 2, 37, '2022-01-06 20:38:40');
INSERT INTO `history` VALUES (26, 1, 30, '2022-03-01 12:16:21');
INSERT INTO `history` VALUES (27, 3, 57, '2022-01-19 14:23:59');
INSERT INTO `history` VALUES (30, 1, 90, '2022-01-11 07:27:38');
INSERT INTO `history` VALUES (36, 1, 5, '2022-01-11 07:37:41');
INSERT INTO `history` VALUES (37, 1, 42, '2022-01-11 07:39:51');
INSERT INTO `history` VALUES (41, 1, 43, '2022-01-11 07:49:09');
INSERT INTO `history` VALUES (90, 1, 95, '2022-01-11 08:45:51');
INSERT INTO `history` VALUES (170, 1, 97, '2022-01-11 11:05:14');
INSERT INTO `history` VALUES (210, 1, 41, '2022-01-11 12:07:04');
INSERT INTO `history` VALUES (222, 1, 46, '2022-01-12 02:03:59');
INSERT INTO `history` VALUES (436, 1, 103, '2022-01-12 11:35:56');
INSERT INTO `history` VALUES (775, 1, 24, '2022-01-13 13:40:00');
INSERT INTO `history` VALUES (844, 2, 11, '2022-01-14 03:49:00');
INSERT INTO `history` VALUES (846, 4, 11, '2022-01-21 03:09:14');
INSERT INTO `history` VALUES (1069, 1, 18, '2022-01-18 03:05:36');
INSERT INTO `history` VALUES (1075, 8, 26, '2022-01-18 04:00:18');
INSERT INTO `history` VALUES (1089, 8, 100, '2022-01-18 06:17:42');
INSERT INTO `history` VALUES (1091, 8, 97, '2022-01-18 06:18:55');
INSERT INTO `history` VALUES (1092, 8, 109, '2022-01-18 06:19:03');
INSERT INTO `history` VALUES (1188, 8, 104, '2022-01-18 07:59:12');
INSERT INTO `history` VALUES (1195, 7, 49, '2022-01-18 08:00:17');
INSERT INTO `history` VALUES (1198, 9, 12, '2022-01-22 02:01:01');
INSERT INTO `history` VALUES (1199, 9, 19, '2022-01-18 09:28:23');
INSERT INTO `history` VALUES (1200, 9, 30, '2022-01-18 09:28:39');
INSERT INTO `history` VALUES (1245, 7, 30, '2022-01-18 11:45:48');
INSERT INTO `history` VALUES (1247, 7, 14, '2022-01-18 11:46:23');
INSERT INTO `history` VALUES (1249, 7, 91, '2022-01-18 11:53:32');
INSERT INTO `history` VALUES (1295, 5, 13, '2022-01-19 01:44:57');
INSERT INTO `history` VALUES (1326, 5, 8, '2022-01-19 02:21:16');
INSERT INTO `history` VALUES (1329, 5, 92, '2022-01-19 02:21:20');
INSERT INTO `history` VALUES (1330, 5, 14, '2022-01-19 02:21:26');
INSERT INTO `history` VALUES (1379, 5, 37, '2022-01-19 02:28:41');
INSERT INTO `history` VALUES (1574, 7, 12, '2022-01-19 02:32:03');
INSERT INTO `history` VALUES (1575, 7, 19, '2022-01-19 02:32:05');
INSERT INTO `history` VALUES (1576, 5, 90, '2022-01-19 02:32:06');
INSERT INTO `history` VALUES (1916, 8, 110, '2022-01-19 02:42:19');
INSERT INTO `history` VALUES (1929, 5, 91, '2022-01-19 02:44:43');
INSERT INTO `history` VALUES (2039, 5, 40, '2022-01-21 03:40:10');
INSERT INTO `history` VALUES (2094, 8, 14, '2022-01-19 09:43:33');
INSERT INTO `history` VALUES (2099, 8, 16, '2022-01-19 09:56:13');
INSERT INTO `history` VALUES (2100, 8, 24, '2022-01-19 09:57:10');
INSERT INTO `history` VALUES (2155, 8, 31, '2022-01-19 11:26:12');
INSERT INTO `history` VALUES (2156, 8, 8, '2022-01-19 11:26:16');
INSERT INTO `history` VALUES (2201, 1, 115, '2022-01-20 06:14:03');
INSERT INTO `history` VALUES (2214, 5, 26, '2022-01-20 06:57:51');
INSERT INTO `history` VALUES (2220, 5, 52, '2022-01-20 07:24:50');
INSERT INTO `history` VALUES (2238, 7, 128, '2022-01-21 04:25:38');
INSERT INTO `history` VALUES (2240, 1, 59, '2022-01-22 04:20:34');
INSERT INTO `history` VALUES (2241, 1, 69, '2022-01-20 08:30:44');
INSERT INTO `history` VALUES (2242, 1, 62, '2022-01-20 08:30:48');
INSERT INTO `history` VALUES (2243, 1, 60, '2022-01-20 08:30:55');
INSERT INTO `history` VALUES (2244, 1, 54, '2022-02-27 14:07:40');
INSERT INTO `history` VALUES (2248, 7, 122, '2022-01-20 11:15:05');
INSERT INTO `history` VALUES (2263, 1, 123, '2022-01-20 11:19:38');
INSERT INTO `history` VALUES (2264, 8, 58, '2022-01-20 11:20:06');
INSERT INTO `history` VALUES (2265, 8, 51, '2022-01-20 11:20:13');
INSERT INTO `history` VALUES (2266, 8, 2, '2022-01-20 11:20:17');
INSERT INTO `history` VALUES (2267, 8, 99, '2022-01-20 11:20:23');
INSERT INTO `history` VALUES (2288, 8, 76, '2022-01-20 11:25:53');
INSERT INTO `history` VALUES (2312, 1, 128, '2022-03-02 13:22:40');
INSERT INTO `history` VALUES (2313, 1, 32, '2022-01-21 00:09:58');
INSERT INTO `history` VALUES (2314, 1, 43, '2022-01-21 00:10:15');
INSERT INTO `history` VALUES (2315, 1, 3, '2022-01-21 00:10:16');
INSERT INTO `history` VALUES (2316, 1, 12, '2022-01-22 04:28:00');
INSERT INTO `history` VALUES (2317, 1, 38, '2022-01-21 09:07:44');
INSERT INTO `history` VALUES (2318, 1, 130, '2022-01-21 08:59:45');
INSERT INTO `history` VALUES (2319, 4, 130, '2022-01-21 07:11:47');
INSERT INTO `history` VALUES (2320, 4, 123, '2022-01-21 03:19:10');
INSERT INTO `history` VALUES (2321, 4, 118, '2022-01-21 03:09:17');
INSERT INTO `history` VALUES (2322, 4, 105, '2022-01-21 02:37:00');
INSERT INTO `history` VALUES (2323, 4, 34, '2022-01-21 03:10:43');
INSERT INTO `history` VALUES (2324, 4, 128, '2022-01-21 14:32:13');
INSERT INTO `history` VALUES (2325, 4, 124, '2022-01-21 03:18:50');
INSERT INTO `history` VALUES (2326, 4, 122, '2022-01-21 03:20:21');
INSERT INTO `history` VALUES (2327, 7, 548, '2022-01-21 06:54:37');
INSERT INTO `history` VALUES (2328, 5, 548, '2022-01-21 03:45:12');
INSERT INTO `history` VALUES (2329, 5, 128, '2022-01-22 02:02:53');
INSERT INTO `history` VALUES (2330, 1, 540, '2022-01-21 06:09:41');
INSERT INTO `history` VALUES (2331, 1, 539, '2022-01-21 06:10:15');
INSERT INTO `history` VALUES (2332, 6, 130, '2022-01-21 04:07:45');
INSERT INTO `history` VALUES (2333, 6, 128, '2022-01-22 01:57:43');
INSERT INTO `history` VALUES (2334, 6, 124, '2022-01-21 04:05:49');
INSERT INTO `history` VALUES (2335, 6, 123, '2022-01-21 04:06:28');
INSERT INTO `history` VALUES (2336, 6, 122, '2022-01-21 04:07:24');
INSERT INTO `history` VALUES (2337, 1, 39, '2022-01-21 04:09:30');
INSERT INTO `history` VALUES (2338, 10, 128, '2022-01-21 04:18:33');
INSERT INTO `history` VALUES (2339, 10, 130, '2022-01-21 04:19:10');
INSERT INTO `history` VALUES (2340, 10, 124, '2022-01-21 04:19:57');
INSERT INTO `history` VALUES (2341, 1, 122, '2022-01-21 06:00:05');
INSERT INTO `history` VALUES (2342, 1, 119, '2022-01-21 06:07:47');
INSERT INTO `history` VALUES (2343, 6, 120, '2022-01-21 06:18:27');
INSERT INTO `history` VALUES (2344, 6, 121, '2022-01-21 06:18:28');
INSERT INTO `history` VALUES (2345, 6, 129, '2022-01-21 06:38:59');
INSERT INTO `history` VALUES (2346, 1, 548, '2022-01-21 06:38:07');
INSERT INTO `history` VALUES (2347, 7, 549, '2022-01-21 07:15:10');
INSERT INTO `history` VALUES (2348, 4, 549, '2022-01-21 07:15:29');
INSERT INTO `history` VALUES (2349, 5, 549, '2022-01-21 11:51:45');
INSERT INTO `history` VALUES (2350, 3, 128, '2022-01-21 08:18:36');
INSERT INTO `history` VALUES (2351, 8, 123, '2022-01-21 08:51:42');
INSERT INTO `history` VALUES (2352, 8, 130, '2022-01-21 08:51:53');
INSERT INTO `history` VALUES (2353, 1, 10, '2022-02-25 12:25:30');
INSERT INTO `history` VALUES (2354, 1, 11, '2022-01-21 09:07:56');
INSERT INTO `history` VALUES (2355, 4, 548, '2022-01-21 11:51:33');
INSERT INTO `history` VALUES (2356, 5, 55, '2022-01-21 11:54:36');
INSERT INTO `history` VALUES (2358, 9, 549, '2022-01-21 12:02:55');
INSERT INTO `history` VALUES (2359, 9, 548, '2022-01-21 12:03:00');
INSERT INTO `history` VALUES (2360, 9, 130, '2022-01-21 12:03:13');
INSERT INTO `history` VALUES (2361, 9, 128, '2022-01-21 14:34:22');
INSERT INTO `history` VALUES (2362, 9, 123, '2022-01-21 11:55:48');
INSERT INTO `history` VALUES (2363, 7, 540, '2022-01-21 11:56:23');
INSERT INTO `history` VALUES (2365, 4, 2, '2022-01-21 11:57:00');
INSERT INTO `history` VALUES (2366, 5, 124, '2022-01-21 11:57:44');
INSERT INTO `history` VALUES (2368, 9, 122, '2022-01-21 12:03:19');
INSERT INTO `history` VALUES (2369, 5, 39, '2022-01-21 14:08:16');
INSERT INTO `history` VALUES (2370, 4, 56, '2022-01-21 12:28:11');
INSERT INTO `history` VALUES (2371, 7, 130, '2022-01-21 12:43:16');
INSERT INTO `history` VALUES (2372, 7, 107, '2022-01-21 13:19:07');
INSERT INTO `history` VALUES (2373, 5, 19, '2022-01-21 13:06:02');
INSERT INTO `history` VALUES (2374, 1, 14, '2022-02-24 13:22:44');
INSERT INTO `history` VALUES (2375, 5, 97, '2022-01-21 13:13:31');
INSERT INTO `history` VALUES (2376, 5, 126, '2022-01-21 13:14:56');
INSERT INTO `history` VALUES (2377, 5, 9, '2022-01-21 13:17:30');
INSERT INTO `history` VALUES (2379, 7, 558, '2022-01-21 13:41:57');
INSERT INTO `history` VALUES (2381, 4, 63, '2022-01-21 13:43:51');
INSERT INTO `history` VALUES (2382, 7, 557, '2022-01-21 14:18:48');
INSERT INTO `history` VALUES (2384, 7, 537, '2022-01-21 14:06:39');
INSERT INTO `history` VALUES (2386, 4, 109, '2022-01-21 14:08:49');
INSERT INTO `history` VALUES (2387, 7, 555, '2022-01-21 14:18:52');
INSERT INTO `history` VALUES (2388, 9, 32, '2022-01-21 14:42:24');
INSERT INTO `history` VALUES (2389, 7, 561, '2022-01-21 14:39:01');
INSERT INTO `history` VALUES (2390, 7, 552, '2022-01-21 14:39:15');
INSERT INTO `history` VALUES (2391, 5, 561, '2022-01-21 14:40:16');
INSERT INTO `history` VALUES (2392, 5, 119, '2022-01-21 14:40:28');
INSERT INTO `history` VALUES (2393, 4, 23, '2022-01-21 14:40:57');
INSERT INTO `history` VALUES (2394, 9, 23, '2022-01-21 14:42:00');
INSERT INTO `history` VALUES (2395, 5, 59, '2022-01-22 02:01:03');
INSERT INTO `history` VALUES (2396, 9, 15, '2022-01-22 02:01:06');
INSERT INTO `history` VALUES (2397, 5, 11, '2022-01-22 02:01:07');
INSERT INTO `history` VALUES (2398, 5, 100, '2022-01-22 02:01:11');
INSERT INTO `history` VALUES (2399, 1, 562, '2022-03-02 12:04:55');
INSERT INTO `history` VALUES (2400, 1, 557, '2022-01-22 04:22:41');
INSERT INTO `history` VALUES (2401, 4, 562, '2022-01-22 04:23:30');
INSERT INTO `history` VALUES (2402, 1, 100, '2022-02-25 02:19:12');
INSERT INTO `history` VALUES (2403, 6, 43, '2022-02-24 12:47:12');
INSERT INTO `history` VALUES (2404, 6, 44, '2022-02-24 12:52:02');
INSERT INTO `history` VALUES (2405, 1, 13, '2022-02-24 13:02:08');
INSERT INTO `history` VALUES (2406, 1, 413, '2022-02-24 13:02:21');
INSERT INTO `history` VALUES (2407, 1, 418, '2022-02-24 13:02:30');
INSERT INTO `history` VALUES (2408, 1, 126, '2022-02-25 00:25:22');

-- ----------------------------
-- Table structure for knowledge
-- ----------------------------
DROP TABLE IF EXISTS `knowledge`;
CREATE TABLE `knowledge`  (
  `id` bigint(20) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `author_id` bigint(0) NOT NULL COMMENT '作者id',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `life_time` timestamp(0) NOT NULL DEFAULT '2038-01-19 03:14:07' COMMENT '知识有效时间',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `category_id` bigint(0) NULL DEFAULT NULL COMMENT '类别id',
  `view_counts` int(0) NOT NULL DEFAULT 0 COMMENT '浏览数量',
  `is_delete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '知识状态（0上线，1下线)',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '知识状态（0草稿、1待审核、2发布 3审核不通过)',
  `like_counts` int(0) NOT NULL DEFAULT 0 COMMENT '点赞数量',
  `dislike_counts` int(0) NOT NULL DEFAULT 0 COMMENT '反对数量',
  `comment_counts` int(0) NOT NULL DEFAULT 0 COMMENT '评论数量',
  `collect_counts` int(0) NOT NULL DEFAULT 0 COMMENT '收藏数量',
  `source_id` int(0) NULL DEFAULT NULL COMMENT '来源id',
  `master_id` bigint(0) NOT NULL COMMENT '一个系列的知识该字段值相同',
  `version` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'C' COMMENT ' C表示当前最新知识，A表示历史知识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 563 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge
-- ----------------------------
INSERT INTO `knowledge` VALUES (00000000000000000001, '费用查询相关问题大全', 1, '2022-01-03 08:34:46', '2022-09-21 17:13:09', '<p align=\"justify\">当前，以千兆光网、5G、物联网等为代表的新一轮科技革命和产业变革正在全球锐意兴起，在政策引领、技术驱动、模式变革等因素影响下，数字家庭产业发展进入新的增长期。作为我国数字家庭生态的重要参与者和布局者，中国电信凭借自身网络基础优势，联合华为等合作伙伴创新FTTR（Fiber to The Room）家庭组网解决方案，面向中大户型家庭提供千兆全光组网产品，实现全屋千兆覆盖。此外，中国电信还推出基于智能家庭网关的场景化宽带，进一步提升家庭用户网络体验，持续推进数字家庭产业发展。</p>\r\n<p align=\"justify\">FTTR助力打造数字家庭全光千兆网络</p>\r\n<p align=\"justify\">与传统组网相比，FTTR在FTTH光纤入户基础上，创新性使用光纤取代双绞网线延伸至房间，突破网线速率限制，解决大户型家庭Wi-Fi覆盖难题，主设备和从属设备同时提供超千兆网口和Wi-Fi6连接，推进家庭宽带业务由全屋Wi-Fi向全光千兆Wi-Fi拓展，为用户提供大宽带、低时延、高品质、平滑升级的业务承载能力，满足高品质业务需求。为有力支撑三千兆发展战略，今年6月中国电信发布家庭全光网关、光路由器终端白皮书，在业界率先推进FTTR终端标准化。</p>\r\n<p align=\"justify\">中国电信旗下的天翼数字生活公司拥有家庭网络核心专利群，牵头多项国际及行业标准，业界首创宽带零配置、光网络终端解耦、e-OS智能系统、EasyMesh互联互通，引领家庭网络智能化发展。面向家庭网络全光演进，天翼数字生活公司联合产业链伙伴推进FTTR产品化，实现全光组网能力和家庭网络智能特性的深度融合，用户通过小翼管家App方便地管理全光家庭网络，实现应用一键加载、故障一键检测、网络一键优化，全力打造光纤全联接、千兆全覆盖、Wi-Fi全漫游、管理全智能的绿色低碳四“全”家庭网络。</p>', 1, 5, '0', '2', 1, 0, 0, 0, 1, 1, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000002, '话费余额相关问题大全', 4, '2022-01-10 08:34:48', '2022-08-28 17:15:55', '<p align=\"justify\">中国电信副总经理唐珂出席论坛并致辞，高度评价了产业各方对渠道运营数字化转型的贡献，并就未来产业链合作发展提出三点倡议：一是在当前5G发展时代，面对商业综合体、社区乡镇、线上购物等的新型市场需求，共同拓展5G手机、智慧家庭等市场新空间；二是与产业链合作伙伴渠道互进、产业互联、权益互通，共同打造终端、渠道、权益一体化的新生态；三是利用连锁化运营新机制、5G边缘计算新技术、数字化新手段，共同激发产业新动能。唐珂还宣布启动渠道 “百千万亿合作计划”，充分展现中国电信的合作诚意、合作信心。</p>\r\n<p align=\"justify\"><strong>聚焦数字化转型需求 升级全渠道发展策略</strong>&nbsp;</p>\r\n<p align=\"justify\">5G时代来临，线上线下渠道面临巨大的机会与挑战。无论是从消费升级的需求侧，还是从结构升级的供给侧，都需要资源进行有效的数字化整合。</p>\r\n<p align=\"justify\">中国电信全渠道运营中心总经理郭勇介绍了中国电信全新的“三变创新”一年来的成果，并表示，中国电信渠道建设将由门店裂变、运营聚变、销售智变的驱动向线上线下一体化、营销服务数字化、渠道合作生态化的“三化升级”演进。通过构建高效协同的全渠道营销网络，实现线上销售实体门店交付；建设全渠道运营平台，持续完善连接触达能力和持续升级智慧销服能力，支撑保障用户全旅程服务；打造国内领先的虚实共生空间互联网信息消费平台，赋能传统商业数字化变革，以丰富的内容权益资源，满足客户“购食住行教娱医”场景的数字生活消费需求，让用户尽享信息消费新生活。</p>\r\n<p align=\"justify\">此次论坛还发布百家互联网伙伴、五千家5G+MEC智慧综合体、六千家爱心翼站、万家中国电信连锁门店、万家生态网格运营合作计划与一亿5G终端换新行动计划，把拓展优质互联网合作商户，生态合作城市落地，异业销售场景延伸，激活城市新型信息消费新引擎等作为渠道升级策略的主要目的，实现现有触点价值化、合作领域纵深化、商机共享规模化、数字平台高效化。</p>\r\n<p align=\"justify\"><strong>聚焦用户5G换机需求 整合产业链让利用户</strong>&nbsp;</p>\r\n<p align=\"justify\">中国电信市场部副总经理陆良军发布了2021数字生活节政策。在论坛现场，与荣耀、OPPO、vivo、小米、realme、三星、一加、中兴、普天太力、松联、爱施德、天音、邮电器材、国美、迪信通、苏宁等连锁强商合作伙伴共同启动数字生活节5G终端订货。数字生活节期间中国电信汇聚百亿资源，用于用户合约补贴和渠道销售激励，推动TOP厂商大力支持保障5G终端货源，吸引连锁强商、零售商积极参与双节营销订货，以5G终端顺差让利、合约直降等方式，让利用户。</p>\r\n<p align=\"justify\">中国电信还同步发布了门店零售系统、天翼云图以及OAO生态合作计划。门店零售系统升级中国电信门店连锁化运营能力，推进平台型多业态连锁合作机制，提供终端、零售、资金和业态服务等新合作商机。</p>\r\n<p align=\"justify\">天翼云图（Ecoverse）则打造国内领先的虚实共生空间互联网信息消费平台，联合产业链共创数字商业元宇宙，推出5G AR云Go、云Mall、云播、云店、云XR娱乐空间等5G新消费产品，赋能实体商业全链路流量变现，让用户尽享信息消费新生活。</p>\r\n<p align=\"justify\">OAO生态合作计划携手终端、权益伙伴共同打造全新的生态合作模式，通过共享触点、商机、数字平台等的资源与流量共享方式，整合产业链生态，打造全新的线上线下一体化合作模式。</p>', 2, 4, '0', '2', 0, 0, 0, 0, 2, 2, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000003, '余额变动明细相关问题大全', 7, '2022-01-10 08:34:49', '2022-07-06 15:55:37', '<p align=\"justify\"><strong>升级联盟合作平台，开拓产业合作空间</strong>&nbsp;</p>\r\n<p align=\"justify\">中国电信终端产业联盟于2010年成立，11年来联盟成员不断增加，合作范围从以手机厂商、渠道商为主逐渐拓展至包括智家终端、行业终端等在内的全品类终端的产业上下游相关各方，成为中国电信推进终端合作，繁荣终端生态的重要平台。</p>\r\n<p align=\"justify\">终端产业联盟理事长，中国电信副总经理唐珂在致辞中表示，中国电信提出“云改数转”战略，牢牢把握“十四五”规划期间数字经济重大发展机遇，以云网融合为基础，加强全业务运营，助力云改数转，加强全品类运营，推进终端生态繁荣，加强全渠道运营，提升产业服务能力，创新融数注智，提升运营效益。终端产业联盟将携手产业合作伙伴，进一步开展内容、应用、云、终端等领域合作，共同推进终端产业蓬勃发展。</p>\r\n<p align=\"justify\">中国电信终端产业联盟秘书长、中国电信终端运营中心总经理李华表示，2021年，联盟队伍数量和品类持续壮大，终端规模迅猛上扬，标准引领更见成效，支撑服务更显担当，云改数转落地生根，持续推动NB-IoT终端模组等规范成为行标、企标，积极推进了5G全网通标准、终端技术指引和5G终端研发。2022年将紧密生态合作，强化科技创新和产业链供应链韧性，加快解决“卡脖子”难题，强化终端创新，积极储备5G终端，积极推动云改数转，持续做强产业生态。联盟将加强全业务全品类全渠道的终端运营合作，共同应对资源、货源、客流减少的风险挑战，通过资源叠加、政策互动、战略合作的方式方法，共同降低运营成本、提升资源效益、繁荣产业生态。</p>\r\n<p align=\"justify\"><strong>深化云网端合作，创新全品类运营</strong>&nbsp;</p>\r\n<p align=\"justify\">在本次论坛上，中国电信市场部副总经理陆良军详细介绍了2022年中国电信终端发展策略，主要体现在扩规模、提品质、拓创新、强合作。</p>\r\n<p align=\"justify\">在扩规模方面，中国电信将做大全品类终端规模，同时提升全渠道的服务能力，自有开放渠道协同，线上线下一体化服务；在提品质方面，坚持以WiFi6+引领、智能视觉升级、完善5G多场景高智能终端提升终端品质；在拓创新方面，积极拓展包括云手机、云路由器、云电脑、云摄像头、云电视和智慧云屏在内的云终端从原型试点向规模应用发展，创新打造云终端生态；在强合作方面，通过持续扩展连锁2.0，推进终端+套餐+权益一体化销售，联合会员精准营销；整合内外部资源生态合作，实现自有开放渠道协同，线上线下一体化服务。通过与产业合作伙伴的能力合作、研发合作、商业合作，多维度发力共筑生态，实现赋能助转型、聚力促发展、共赢提价值。</p>\r\n<p align=\"justify\"><strong>携手产业合作，以行动开启新发展</strong>&nbsp;</p>\r\n<p align=\"justify\">论坛同时启动中国电信“云终端飞扬计划”，协手产业伙伴共同推进云终端发展，推进终端云化、端云协同等方面技术创新、产品创新和商业模式创新，实现云网边端高效协同发展，开创产业发展新蓝海。</p>\r\n<p align=\"justify\">云终端中最先面世的云手机系列，已经先后推出两代天翼1号云手机产品，中国电信还将采用云手机深度合作模式与更多厂商合作，开辟云手机快速发展的新通道。同时，智慧云屏、云电脑、云电视、云路由、云摄像头、云VR和行业云终端等一系列产品也将陆续推出。针对不同云终端品类，中国电信将采取不同的发展策略，基于桌面+移动融通的云应用，打造面向千行百业的云方案，联合合作伙伴共建云终端合作生态，加速云终端发展进程。</p>\r\n<p align=\"justify\">在本次论坛上，中国电信联合众多合作伙伴启动了全品类终端合作签约，促进5G、数字生活、产业数字化等重点业务领域改革及发展，扩大产品保障能力，推进产业链广泛深入合作。论坛还为中国电信终端产业联盟优秀合作伙伴颁奖，表彰并肯定他们在过去的一年时间里，在5G终端研发、数字生活终端生态合作、产业数字化终端生态合作、创新终端生态合作等领域做出的积极卓越贡献。</p>\r\n<p align=\"justify\">中国电信将坚定实施云改数转战略，积极推进5G高质量发展，加速数字化转型，扩大开放合作，以科技创新为引领，以用户需求为导向，持续推动产品创新、应用创新、合作创新，促进终端产业繁荣，为建设数字中国做出更大贡献。</p>', 3, 44, '1', '2', 33, 0, 20, 0, 3, 3, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000004, '账单查询相关问题大全', 4, '2022-01-10 08:34:51', '2022-09-29 16:47:37', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">聚焦人民群众对综合智能信息服务的需求，着力提供高质量信息化产品和服务；聚焦社会公众关注的适老化服务等热点，用心履行社会责任；聚焦员工的“急难愁盼”问题，解决基层困难，保障员工权益……</p>\r\n<p align=\"justify\">2021年，中国电信认真学习贯彻习近平总书记重要讲话精神，传承红色基因，弘扬“人民邮电为人民”的优良传统，扎实推进党史学习教育，坚持学党史、悟思想、办实事、开新局，了解客户所需、回应基层所盼，开展“我为群众办实事”实践活动。把实事办好、把好事办实，努力增强客户和员工的获得感、幸福感和安全感，满足人民群众对美好生活的向往。</p>\r\n<p align=\"justify\"><strong>聚焦信息化主力军主责让群众共享美好信息生活</strong>&nbsp;</p>\r\n<p align=\"justify\">3月，寒气渐退，大地蕴含春意。中国电信集团党组成员分赴甘肃、浙江等地，走进重点客户，深入基层一线，开展现场调研，了解群众对综合智能信息服务的期望和在数字化改革中的需求，深入剖析产品服务供给方面的具体问题。</p>\r\n<p align=\"justify\">作为国家信息化建设主力军，中国电信聚焦主责主业，着力发挥云网融合及5G、宽带和信息化技术优势，满足人民群众日益增长的综合智能信息服务需求。</p>\r\n<p align=\"justify\">中国电信组织开展“为5G和智慧家庭客户提供更优质的综合智能信息服务”实践活动。一是提升5G上网感知及应用能力，通过精准建网补点，优化5G网络覆盖，持续丰富5G超高清视频、云游戏、云VR/ AR等数字娱乐内容，引入全景视频、自由视角高清直播等5G特色创新应用产品，全力满足用户5G体验需求。二是提高智慧家庭/社区智能服务品质，为用户提供高速、稳定的家庭WiFi网络服务和舒心、联动的智能场景应用服务。三是增强智能通信及网信安全服务能力，通信助理服务已实现漏话能提醒、应答能自动、骚扰能拦截等功能，安全管家服务则通过恶意网站拦截、家庭智能设备潜在风险检测，为用户提供通信安全保障。</p>\r\n<p align=\"justify\">正如中国电信董事长柯瑞文所说，把满足客户需求、提升客户体验作为5G发展的出发点和落脚点，真正做到5G好不好还是由用户说了算。让更多用户体验到5G带来的高速率、低时延、大流量和多彩应用，共享美好信息新生活，中国电信一直在路上。</p>\r\n<p align=\"justify\">在政企客户业务全面上云的背景下，如何凭借运营商自身网络优势和IT上云经验，帮助政企客户加快自身云化、实现数字化转型？</p>\r\n<p align=\"justify\">中国电信聚焦政企客户服务需求，推进“客户IT上云”工程，提供以客户为中心的场景化整体解决方案，实现运营效率提升、客户体验提升、业务模式创新，为全社会的数字化转型赋能助力。一方面，加快打造支撑客户上云的产品和服务能力。中国电信通过查线路、查机房、查设备，问系统、问规划、问痛点，准确深入了解政企客户的信息化需求，为客户制定符合其业务需求的整体上云规划和方案。另一方面，则加快建设服务客户上云的人才队伍。开展“腾云计划”，集结全国万名IT专业岗位人才，开展内部培训、外部认证、上云实战，组建千人上云专家队伍，为客户IT上云提供高端咨询规划和实施服务，全面支撑客户核心系统云化改造。依托中国电信各级团委，发动青年骨干，建立千支上云青年突击队，开展客户“急难愁盼”调研，成为服务客户上云的攻坚力量。</p>\r\n<p align=\"justify\"><strong>巩固拓展脱贫攻坚成果为乡村振兴奠定数字底座</strong>&nbsp;</p>\r\n<p align=\"justify\">民族要复兴，乡村必振兴。习近平总书记在中央农村工作会议上强调，脱贫攻坚取得胜利后，要全面推进乡村振兴，这是“三农”工作重心的历史性转移。中国电信高度重视，扎实部署数字乡村推进工作。4月12日，中国电信在长沙召开数字乡村全国推进启动会，发布数字乡村云平台和《中国电信数字乡村白皮书》，围绕提供乡村治理数字化、生活智慧化、生产智能化综合信息服务进行了积极的探索和实践。</p>\r\n<p align=\"justify\">在湖南省长沙县的数字果园，生态小龙虾色泽诱人；在新疆阿勒泰，满格信号照亮哈萨克大尾羊的回家路；在浙江安吉，村民用5G网络直播销售茶叶和笋干；在四川绵阳，村委会依托视频监控掌握的信息迅速帮助被洪水围困的群众转移……</p>\r\n<p align=\"justify\">在数字乡村建设中，中国电信注重为群众提供数字化服务，满足农村群众智慧化生活需求，提升村民生活品质。在平安乡村视频监控服务方面，截至9月底，“天翼看家”已为近1300万用户提供看家护院、生产看护等服务；在娱乐学习方面，乡镇版IPTV目前可提供直播点播、党建学习、“三农”服务、通知公告、视频监控及电视会议等内容和应用；在农业生产数字化方面，中国电信联合农业科研院所和生态伙伴，创新推出种植业数字化、畜牧业数字化、渔业数字化、智慧农机服务等一系列农业生产应用，为农民提供科学种植养殖信息化服务。</p>\r\n<p align=\"justify\">同时，中国电信致力于满足基层政府综合治理需求，提升农村治理水平。以天翼云播、AI人脸识别、智慧大屏等应用，助力提升乡村治理水平；上线智慧党建、村务公开、便民服务等应用，增强村务信息化能力，提升办事效率；推出应急指挥、人居环境监测等多种方案，促进基层政府管理信息化能力提升。</p>\r\n<p align=\"justify\"><strong>倾力履行央企社会责任用信息技术点亮爱心翼站</strong>&nbsp;</p>\r\n<p align=\"justify\">九九重阳，丹桂飘香。中国电信南京分公司多个党支部走进社区敬老院辅导老人使用智能手机设备，在“爱心翼站”开设助老“微课堂”。这一活动，是中国电信贯彻国务院、工业和信息化部关于解决老年人运用智能技术困难相关工作部署，开展适老化服务的一个缩影。</p>\r\n<p align=\"justify\">今年以来，中国电信坚持传统服务与智能创新相结合、线上服务与线下渠道相结合，聚焦老年人日常生活涉及的高频事项，集中力量为老年人提供更优质的信息通信服务，帮助老年人跨越“数字鸿沟”。遍布街头巷尾的中国电信营业厅，渐次亮起明灯，变成“爱心翼站”，为老人提供爱心台席，科普智能手机技巧。在实体营业厅之外，中国电信完成对10000号客服热线、网厅的适老化改造。针对65岁及以上实名制认证的老年人，10000号提供“一键呼入人工客服”功能，截至目前，已为老年人提供暖心服务1900万人次。APP关爱版上线至今，月均访问量超百万。</p>\r\n<p align=\"justify\">迈向信息化的道路上，不能让一个人掉队。利用“爱心翼站”和线上平台，中国电信开设“微课堂”等公益课程2.2万场次，辅导老人使用智能手机，开展防诈宣传，科普信息化知识。各省区市组织夏送清凉、重阳敬老、冬送温暖等公益关爱活动，服务老年人、户外劳动者等群体29万人次。中国电信成为行业首家获得中华全国总工会认可的“户外劳动者服务站点”共建品牌企业。“爱心翼站”公益服务入选国家卫健委、团中央2021年“金晖行动—智慧助老”志愿服务示范项目。</p>\r\n<p align=\"justify\">在防范整治网络诈骗方面，中国电信通过人防、技防、制度防有机结合，短期攻坚与长期防治兼顾，持续提升综合防范治理水平，百万用户涉案涉诈率持续保持下降趋势。面对垃圾短信和骚扰电话，中国电信通过健全防范机制、不断提升技术防范能力、强化违规号码核查处置等举措，全力为人民群众营造清朗安全的通信环境，取得了良好的治理成效。截至9月底，骚扰电话和垃圾短信被举报量持续保持行业最低。</p>\r\n<p align=\"justify\"><strong>切实解决基层员工困难把问题清单变成满意答卷</strong>&nbsp;</p>\r\n<p align=\"justify\">倾听员工心声，为基层解决实际困难，加强团队凝聚力，是中国电信为群众办实事的重要内容。中国电信聚焦员工“急难愁盼”问题，用心用情用力解决员工困难事、烦心事，力争把员工的问题清单变成满意答卷。</p>\r\n<p align=\"justify\">雪域高原，天翼信号满格，离不开电信人的默默守护。然而在高海拔地区，高原反应威胁着电信员工的健康。2019年以来，中国电信在海拔超过3500米的基层单位推进部署供氧设施，受到员工好评。2021年，中国电信集团工会协同云网发展部，增配专项投资资金，继续在西藏、青海、四川、新疆、云南、甘肃6个省区，为海拔超过3000米的135个基层单位，配备便携式制氧机，并在宿舍、食堂、办公场所部署弥散式集中供氧设备，有效改善了高海拔艰苦地区员工的工作生活环境。</p>\r\n<p align=\"justify\">中国电信集团工会时刻把基层员工的冷暖挂在心上，扎实推进基层“四小”（小食堂、小浴室、小卫生间、小活动室）建设。今年以来，集团工会进一步健全完善“四小”建设费用保障机制，对北方、西部15个省（区、市）追加“四小”建设成本预算，指导各省（区、市）持续抓好“四小”建设，改善基层单位工作环境，改善员工工作餐、健康饮水等，提升员工获得感、幸福感、安全感。</p>\r\n<p align=\"justify\">把党史学习教育同解决实际问题结合起来，把红色电信的优良传统和信息时代的先进服务结合起来，把员工成长和客户利益、社会福利结合起来，中国电信把惠民、利民、便民的实事办到群众心坎上，有力度、有温度。</p></div></p>', 4, 6, '0', '2', 0, 0, 0, 0, 4, 4, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000005, '套餐使用相关问题大全', 9, '2022-01-10 08:34:50', '2022-06-30 16:59:05', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">西北边陲的“千里牧道”有了满格网络，南海小岛居民告别“信息孤岛”接入智能通信新时代；5G网络覆盖越来越广，智慧家庭、智慧社区服务走进千家万户；企业“上云”数据跑起来，各行各业转型升级加速……</p>\r\n<p align=\"justify\">扎实开展“我为群众办实事”实践活动，中国电信聚焦为5G和智慧家庭客户提供更优质的综合智能信息服务，聚焦政企客户数字化转型，充分发挥云网融合及5G、宽带和信息化技术优势，满足人民群众日益增长的综合智能信息服务需求。</p>\r\n<p align=\"justify\"><strong>惠民：信息服务送进千家万户</strong>&nbsp;</p>\r\n<p align=\"justify\">“喂，10000号，我打电话是要感谢咱们的装机师傅小蒋！”这样的感谢电话，10000客服常常接到。在中国电信，千千万万个“小蒋”，用专业和真诚，把“值得信赖”的综合智能信息服务送进了千家万户，让更多用户尽享中国电信5G带来的高速度、低时延、大流量和多彩应用，共享美好信息新生活。</p>\r\n<p align=\"justify\">在湖北，“5G服务我先行”提供多项温馨举措，打消5G用户“不能用”“不会用”“不敢用”“不好用”“不想用”的顾虑，为广大用户提供贴心、舒心、放心的5G服务。在云南，通过提供线上一站式服务，用户足不出户即可办理业务，目前已实现全省平均每天通过线上平台提供近700户用户的装移修服务。在安徽，组织党员小组为小区业主提供免费的全屋智能咨询、定制化设计、智能化设备安装与调试、质保服务，截至今年10月，已经为全省1200多个新建小区提供了现场服务……</p>\r\n<p align=\"justify\">落实“为5G和智慧家庭客户提供更优质的综合智能信息服务”实践活动，中国电信全力推进5G网络建设，夯实网络覆盖质量，积极提升用户5G网络使用感知，同时持续丰富5G超高清视频、云游戏、云VR/AR等数字娱乐内容，为人民群众提供丰富、差异化的5G应用服务。</p>\r\n<p align=\"justify\">近日，一辆电信专属的智能“房车”开进江苏省13个地市的商业区、社区、乡镇，其加载的智能门铃、智能门锁、天翼看家、天翼高清、智能音箱等智慧家庭业务，给百姓带来了数字生活的沉浸式体验。</p>\r\n<p align=\"center\"><img style=\"border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-top-width: 0px\" alt=\"\" src=\"./W020211105372820281432.jpg\" OLDSRC=\"W020211105372820281432.jpg\" /></p>\r\n<p align=\"justify\">这样的智慧家庭、智慧社区服务已经“遍地开花”。下班时间，湖南省衡阳市石鼓区青山街道青山街社区居民李伟信站在自家楼栋门口“刷脸”，随着机器里传来“识别通过”的声音，楼栋大门也同步打开。在广东江门，全市首个天翼智慧社区示范小区不仅有人脸门禁和智慧车牌识别，还包括视频监控、智能烟感、智能云广播、社区电子通行证等智慧化服务……通过5G、物联网、人工智能、云计算和大数据等技术，中国电信持续提高智慧家庭、社区智能服务品质。截至2021年9月，已为近1.8亿用户提供快捷方便的远程网络排障服务。构建了丰富的家庭产品应用体系，为用户提供智能高效的家庭、社区信息化应用服务。</p>\r\n<p align=\"center\"><img style=\"border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-top-width: 0px\" alt=\"\" src=\"./W020211105372820439884.jpg\" OLDSRC=\"W020211105372820439884.jpg\" /></p>\r\n<p align=\"justify\"><strong>助企：让数据在云端“跑起来”</strong>&nbsp;</p>\r\n<p align=\"justify\">在中兴通讯南京滨江工厂的生产线上，一个个通信产品正被快速加工、检测、流转。由于整个工厂采用柔性生产方式，同一生产线上生产多种类产品，需要在较短时间内对通过的各类产品实现精准检测。过去，实现该目标的方式是进口价值上千万元的设备，同时配备专门的质检团队，成本高昂且依赖人力较多、准确性难以保障。</p>\r\n<p align=\"justify\">中国电信发挥“云、边、端”协同的优势，为中兴通讯打造5G智能车间，协助客户将质检模型部署在天翼云、调动AI能力，利用5G+MEC“大带宽、低时延”的特点，实现百兆照片上传、模型判断、结果回传等步骤“秒完”，准确率高达97%、漏检率比人工降低80%。</p>\r\n<p align=\"center\"><img style=\"border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-top-width: 0px\" alt=\"\" src=\"./W020211105372820442972.jpg\" OLDSRC=\"W020211105372820442972.jpg\" /></p>\r\n<p align=\"justify\">这是信息化赋能助力传统制造业的一个标杆项目，也是中国电信开展“客户IT上云工程”的一个缩影。通过“客户IT上云工程”实践活动，中国电信向政企客户输出高品质云网基础设施和高质量的云网服务能力，提供以客户为中心的场景化整体解决方案，帮助政企客户IT系统更好、更快上云，实现运营效率提升、客户体验提升、业务模式创新，助力政企客户数字化转型。</p>\r\n<p align=\"justify\">在北京，中国电信为全市各区提供240个疫苗接种点视频监控、620场流动接种点视频云监控，服务包含北京市7个行政区，1000万名群众，为疫情防控工作提供了智慧化保障。在浙江，中国电信空中应急通信平台在抗击“烟花”台风中“勇担重任”，为通信中断的区域及时提供应急通信保障服务。在新疆，中国电信的“智慧教育云平台”利用5G、大数据等信息化技术手段对各类优质教育资源进行整合优化，实现全州所有地区和各级各类学校宽带网络的全面覆盖，让全州1000多所中小幼学校的学生享受优质教学资源，提升全州教育信息化水平。在黑龙江，中国电信在哈尔滨嘉润医院建设远程诊疗中心、多功能5G云诊室，实现与上海武警医院5G云诊室互联互通……</p>\r\n<p align=\"justify\">从科技抗疫到助力防灾减灾，从“黑灯工厂”到智慧校园，“客户IT上云工程”启动以来，中国电信常态化开展“看网上云”服务，通过查线路、查机房、查设备，问系统、问规划、问痛点、问现状，准确、深入了解客户“急难愁盼”的信息化需求，为客户制定切实符合其业务需求的整体上云规划和上云方案。截至今年9月底，服务客户近10万家，超2万个上云项目，打造行业上云标杆。此外，组建千支上云青年突击队，完成客户“急难愁盼”调研。目前全国31省（区、市）已组建6千余人的上云服务团队，上云人才队伍建设初见成效。</p>\r\n<p align=\"justify\">人民群众对美好信息生活的向往，就是中国电信的奋斗目标。充分发挥云网技术优势，落实“我为群众办实事”，中国电信持续为用户打造有获得感、幸福感、安全感的信息化美好生活。</p></div></p>\r\n    <div class=\"fj\">', 5, 1, '0', '2', 0, 0, 0, 1, 5, 5, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000006, '电子发票相关问题大全', 4, '2022-01-10 08:34:53', '2022-07-01 16:59:54', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"center\"><img style=\"border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-top-width: 0px\" alt=\"\" oldsrc=\"W020211018743749226666.jpg\" src=\"./W020211018743749226666.jpg\" /></p>\r\n<p align=\"justify\">10月13日，2021年国家网络安全宣传周“电信日”主题论坛在西安举办。来自国内知名网络安全企业相关负责人及网信安全领域专家学者以“反诈勇担当 同心筑坚墙”为主题，围绕防范治理电信网络诈骗、5G应用等作主题演讲，宣传普及网络安全知识，提高全社会的网络安全意识和安全防护技能，共同筑起网络安全的“防火墙”。论坛上，中国电信集团有限公司网络和信息安全管理部副总经理张侃以《强化漏洞治理 夯实关基安全》为题，阐述了中国电信在夯实关键信息技术安全、防止隐患漏洞风险方面的认识与思考。</p>\r\n<p align=\"center\"><img style=\"border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-top-width: 0px\" alt=\"\" oldsrc=\"W020211018743749238863.jpg\" src=\"./W020211018743749238863.jpg\" /></p>\r\n<p align=\"justify\">他表示，万物互联时代，随着5G技术的应用普及、物联网的引入、供应链的层次、数量、内容更加复杂，网络面临大量未知的安全漏洞。而关键信息基础设施作为我们的神经中枢，也是我们网络安全的重中之重，夯实漏洞治理工作对保障关键信息基础设施安全具有重要意义。</p>\r\n<p align=\"justify\">他指出，漏洞治理是一项长期性、基础性、艰巨性工作。中国电信结合近年来的工作实践，以系统化思维和全周期理念，从资产管理、基线合规、检测评估、处置整改、能力建设、考核问责6个方面，贯穿事前、事中、事后全过程，通过闭环管理循环推进，夯实安全治理的基础。</p>\r\n<p align=\"justify\">事前，在产品和系统的设计阶段，提前考虑安全需求；加强上线前的安全审计和风险评估；探索通过靶场进行安全风险先期测试验证；加强资产管理，做好基线配置，规范定级备案；持续压缩互联网暴露面，收敛安全风险。</p>\r\n<p align=\"justify\">事中，加强安全漏洞威胁情报收集预警，发现新风险漏洞立刻采取措施；加强全网网络安全检查和远程检测，及时处置风险隐患；组织开展网络安全漏洞众测活动，提高漏洞自发现率；组织开展网络安全红蓝对抗实战演练；加强网络安全人才培养，提高队伍能力水平。</p>\r\n<p align=\"justify\">事后，针对发现的问题，及时开展闭环处置；做好举一反三和督导帮带；加强漏洞情况的全网通报、考核等工作；加强对供应商的管理，建立后评估机制；结合对案例等的总结反思，进一步完善标准规范流程和长效工作机制。</p>\r\n<p align=\"justify\">张侃表示，中国电信将持续采取措施，不断提高漏洞防治能力，贯彻落实《网络产品安全漏洞管理规定》有关要求，抓好漏洞治理工作。同时，建议加强各方合作，打造漏洞联防联控机制、威胁情报共享机制。</p>\r\n<p align=\"justify\">中国电信将不忘初心，牢记使命，充分发挥基础电信运营商的作用，为维护网络安全、保障关键信息基础设施安全做出应有的贡献。</p></div></p>', 6, 99, '1', '2', 87, 0, 0, 0, 6, 6, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000007, '详单查询相关问题大全', 7, '2022-01-10 08:34:50', '2022-08-01 16:04:12', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">恰逢塞外十月天，正是橙黄橘绿时。10月14日，2021“医生云”大会在宁夏银川举行，大会由宁夏回族自治区卫生健康委员主办，中国电信宁夏公司、中国整合医学发展战略研究院、广东省钟南山医学基金会、中国太平保险集团等联合承办。</p>\r\n<p align=\"justify\">本届大会旨在探讨建设“医生临床决策支持系统”，全力打造“居民健康管理支持系统”，实现“服务于民、服务于医”的医生云建设目标，为中国卫生健康的数字化发展贡献力量。宁夏作为国家首个“互联网+医疗健康”示范区，2021医生云大会在宁夏银川的举办，具有深远意义。</p>\r\n<p align=\"justify\">在大会上，自治区党委常委、组织部部长石岱、中国电信集团有限公司副总经理刘桂清等领导进行大会致辞，钟南山、樊代明、曾溢滔等多位院士发表主旨演讲。中国电信与宁夏卫健委、航天云网等单位共同启动“打造人工智能医学大脑发布仪式”。</p>\r\n<p align=\"justify\">中国电信集团有限公司副总经理刘桂清在大会上致辞表示，以5G、AI和云为主要代表的融合信息通信技术将成为医疗服务创新的重要驱动力。中国电信作为建设网络强国、数字中国和维护网信安全的国家队、主力军，致力于成为全球领先的大型全业务综合智能信息服务运营商，是国内唯一一家陆海空天一体化的电信运营商，是国内最大的IDC服务商，是国内排名第一的混合云服务商。在服务卫生健康行业信息化的过程中，中国电信的天翼云凸显三大优势：一是专业性，在31省建立了专门服务医疗机构的医疗云专区，目前正承载着超过1万家医疗机构的应用；二是多样性，针对医疗机构的业务特征，提供公有云、私有云、专属云和混合云的全栈服务，满足多场景需求；三是安全性，天翼医疗云不仅有央企背书，更是通过了医疗混合云、医疗私有云、影像云、心电云等十余项医疗可信云认证。</p>\r\n<p align=\"justify\">在宁夏卫健委大力支持下，2018年中国电信宁夏医疗云专区正式挂牌；2019年国家健康医疗大数据中心落户医疗云专区。目前，宁夏各类医疗机构、全国60%的互联网医院的医疗健康应用和数据，统一承载于天翼医疗云专区，有效地促进了医疗健康数据的互通共享。天翼医疗云专区正式成为医生云的能力底座，将为更多的云上应用保驾护航！医生云就是融合信息通信技术在医疗领域的典型应用，将汇聚更多新的技术和应用，以更高的效率，服务于医、服务于民！中国电信将积极发挥云网融合、5G技术、云计算、大数据、节能创新、信息安全、运维服务和政企业务信息化等方面的优势，加快产业合作推动健康中国的发展。</p>\r\n<p align=\"justify\">最后，刘桂清副总经理说，中国电信将坚持以习近平新时代中国特色社会主义思想为指导，立足新发展阶段，秉承“从半部电台到云监工”的红色基因，加快实施云改数转战略，打造服务型、科技型、安全型企业。中国电信将积极构建企业级数字化平台，与产业各方深化创新合作：一是和各级卫健委和广大医疗机构一起，不断筑牢能力底座，以信息化手段助力健康中国建设；二是与生态伙伴一起，共同促进医卫信息化端、管、云、用、服全产业繁荣，提升各场景的解决方案水平；三是发挥中国电信安全服务优势，开展“强基赋能，筑牢数字安全屏障”行动，为建设数字中国、健康中国作出新的更大贡献。</p></div></p>', 7, 2, '0', '2', 0, 0, 0, 0, 7, 7, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000008, '语音详单查询相关问题大全', 4, '2022-01-10 08:34:55', '2022-09-01 17:06:00', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">10月9日，中国电信智慧城市产业园项目暨雄安智慧城市运营中心（IOC）奠基仪式在雄安新区互联网产业园启动。中国电信总经理、党组副书记李正茂出席奠基仪式并与河北省委常委、副省长，雄安新区党工委书记、管委会主任张国华举行会谈。中国电信副总经理、党组成员唐珂，雄安新区党工委副书记、管委会常务副主任、雄安集团党委书记、董事长田金昌，雄安新区党工委委员、管委会副主任吴海军等出席奠基仪式。</p>\r\n<p align=\"justify\">李正茂在会谈中表示，设立河北雄安新区，是以习近平同志为核心的党中央作出的一项重大历史性战略选择。中国电信坚决落实党中央重大决策部署，高度重视、高效服务雄安新区建设发展，对雄安新区党工委、管委会一直以来对中国电信的信任和支持表示感谢。目前，中国电信充分发挥云网科技公司、中国电信集团投资公司、中电信数字城市科技公司等重要板块作用，以中国电信智慧城市产业园项目奠基为契机，结合新区智慧城市特点，在大数据、云计算等领域开展形式多样的探索创新，推动雄安智慧城市生态圈繁荣发展，为服务新区智能城市建设、推动国家重大战略落地见效作出更多贡献。</p>\r\n<p align=\"justify\">唐珂在奠基仪式致辞中表示，中国电信始终把支持雄安新区建设作为重大政治责任，不遗余力地在雄安投入资源、扩充队伍、创新应用；高质量建设5G、千兆光网、窄带物联网、临时数据中心等云网基础设施，筑牢智慧城市底座；车路协同、工业互联网、智慧城市生态等项目取得创新突破。中国电信聚焦“五新”雄安目标，将智慧城市产业园项目暨雄安智慧城市运营中心打造成科技创新产业聚集的生态园区、汇聚人才的创新园区、多维度的智能园区、环境宜人的低碳园区，使其成为支持数字雄安建设的“桥头堡”、示范数字中国建设能力输出的“蓄水池”。</p>\r\n<p align=\"justify\">据悉，为满足新区“上云、用数、赋智、绿色、安全”高质量发展需求，中国电信智慧城市产业园区以数字化底座赋能产业数字化。通过5G﹢全光网、云边协同、工业数字化平台、创新应用及安全保障，打造中国电信特有的数字资产运营体系，开发绿色机房、智慧灌溉、超宽网络、数字楼宇、排碳统计、应急指挥等多个应用，实现数字孪生、全域可视，为国家推进产业数字化和数字产业化探索道路，为产业结构转型升级和新动能培育提供雄安方案。</p></div></p>', 8, 6, '0', '2', 0, 0, 0, 0, 8, 8, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000009, '短信详单查询相关问题大全', 9, '2022-01-10 08:34:53', '2022-09-03 17:07:04', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">近日，中国电信股份有限公司（以下简称“中国电信”）与中国银行联合研发的“数字人民币”钱包正式上线，用户可在翼支付APP中(我的-基础服务)一键开启数字人民币钱包，在通过实名认证、绑定银行卡后，即可通过数字人民币进行存银行、换数币、转账等操作。此外，“钱到啦”POS机具也已经同步更新，可实现数字人民币受理功能，支持扫码、NFC收取数字人民币。</p>\r\n<p align=\"justify\">中国电信作为中国人民银行数字人民币首批参研单位，积极参与数字人民币业务研发和试点。</p>\r\n<p align=\"justify\">10月底后，中国电信还将试点推出电信SIM卡硬钱包功能，支持“离线”收付款。数字人民币的“离线”支付指数字人民币在交易过程中，收款方或付款方的终端处于离线无网络的情况下仍然能够完成支付。其能够满足在地下室、停车场、山区甚至是地理灾害等特殊环境下的支付需求。目前，数字人民币的双离线支付采用NFC技术来实现，需要收付双方设备具备内置安全芯片的硬件钱包功能。其中，基于NFC-SIM卡形式的手机硬件钱包，其SE安全芯片内置于SIM卡中，中国电信将联合中国银行来共同推动数字人民币SIM卡硬钱包产品的落地。此次中国电信研发的SIM卡硬钱包功能将首次将离线支付推入用户应用场景。</p>\r\n<p align=\"justify\">此外，为方便用户日常生活需要，结合运营商特点，中国电信数字人民币还将提供话费充值功能。用户若出现欠费停机、没有网络环境接入的情况，离线支付功能将方便用户快速实现手机话费的充值。</p>\r\n<p align=\"justify\">同时，随着数字人民币的不断普及，中国电信也将数字人民币与运营商的特色能力及场景相融合，聚焦“数字人民币+5G”、“数字人民币+物联网”等特色场景，加快产品研发和试点落地，并在多地与各大商家开拓更多线下应用场景，联合中国银行为用户提供数字人民币钱包全功能服务能力；陆续推出中国电信数字人民币钱包、数字人民币5G SIM卡硬钱包外，还将试点推广商家超级，受理终端、物联网钱包物物支付、数字人民币商城等。</p></div></p>', 9, 3, '0', '2', 3, 0, 0, 0, 9, 9, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000010, '上网详单查询相关问题大全', 1, '2022-01-10 08:34:55', '2022-11-01 17:07:34', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p>启航数字空间，智绘城市未来。10月9日，中国电信智慧城市产业园项目暨雄安智慧城市运营中心（IOC）奠基仪式在雄安新区互联网产业园启动。中国电信总经理、党组副书记李正茂出席奠基仪式并与河北省委常委、副省长，雄安新区党工委书记、管委会主任张国华举行会谈。中国电信副总经理、党组成员唐珂，雄安新区党工委副书记、管委会常务副主任、雄安集团党委书记、董事长田金昌，雄安新区党工委委员、管委会副主任吴海军等出席奠基仪式。</p>\r\n<p>李正茂在会谈中表示，设立河北雄安新区，是以习近平同志为核心的党中央作出的一项重大历史性战略选择。中国电信坚决落实党中央重大决策部署，高度重视、高效率服务雄安新区建设发展，对雄安新区党工委、管委会一直以来对中国电信的信任支持表示感谢。目前，中国电信充分发挥云网科技公司、中国电信集团投资公司、中电信数字城市科技公司等重要板块作用，以中国电信智慧城市产业园项目奠基为契机，结合新区智慧城市特点，在大数据、云计算等领域开展形式多样的探索创新，推动雄安智慧城市生态圈繁荣发展，为服务新区智能城市建设、推动国家重大战略落地见效作出更多贡献。</p>\r\n<p>唐珂在奠基仪式致辞中表示，中国电信始终把支持雄安新区建设作为重大政治责任，不遗余力地在雄安投入资源、扩充队伍、创新应用；高质量建设5G、千兆光网、NB物联网、临时数据中心等云网基础设施，筑牢智慧城市底座；车路协同、工业互联网、智慧城市生态等项目取得创新突破。中国电信聚焦“五新雄安”目标，将智慧城市产业园项目暨雄安智慧城市运营中心打造成科技创新产业聚集的生态园区、汇聚人才的创新园区、多重维度的智能园区、环境宜人的低碳园区，使其成为支持数字雄安建设的“桥头堡”、示范数字中国建设能力输出的“蓄水池”。</p>\r\n<p>据悉，为满足新区“上云、用数、赋智、绿色、安全”高质量发展需求，中国电信智慧城市产业园区以数字化底座赋能产业数字化。通过5G+全光网、云边协同、工业数字化平台、创新应用及安全保障，打造中国电信特有的数字资产运营体系，开发绿色机房、智慧灌溉、超宽网络、数字楼宇、排碳统计、应急指挥等多个应用服务，实现数字孪生，全域可视，为国家推进产业数字化和数字产业化探索道路，为产业结构转型升级和新动能培育提供雄安方案。</p></div></p>', 10, 19, '0', '2', 5, 0, 0, 1, 10, 10, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000011, '积分查兑相关问题大全', 7, '2022-01-10 10:00:36', '2022-06-30 18:14:44', '<div><h1>大风歌</h1> <img src = \"https://ae01.alicdn.com/kf/Hd60a3f7c06fd47ae85624badd32ce54dv.jpg\" width=\"80\" ><p>《大风歌》是汉朝皇帝刘邦创作的一首诗歌。此诗歌仅有三句，前二句直抒胸臆，雄豪自放，亦显得踌躇满志，第三句却突然透露出前途未卜的焦灼，抒发了作者内心表现出对国家尚不安定的浓郁的惆怅。全诗浑然一体、语言质朴、大气磅礴，包含了双重的思想感情，别具一格。</p><p>南朝梁·萧统将其选入《文选·卷二十八》杂歌类。</p><br><h2>1.作品原文</h2><p><strong>大风歌</strong></p><p>大风起兮云飞扬</p><p>威加海内兮归故乡</p><p>安得猛士兮守四方！</p><br><h2>2.文选原文</h2><p>高祖还，过沛，留。置酒沛宫，悉召故人、父老子弟佐酒。发沛中儿得百二十人，教之歌。酒酣，上击筑自歌曰：大风起兮云飞扬，威加海内兮归故乡，安得猛士兮守四方！</p><br>           <h2>3.作者简介</h2><p>刘邦（前256年—前195年），即汉高祖，沛县（今属江苏）人，字季，汉朝开国皇帝，汉民族和汉文化的开拓者之一、中国历史上的政治家、战略家和指挥家。对汉族的发展、华夏文明的延续，以及中国的统一和强大有突出贡献。代表作品有《大风歌》《鸿鹄歌》。</p><br>          <h2>4.创作背景</h2><p>汉高祖十二年（公元前196年）十月，淮南王英布起兵反叛；由于其英勇善战，军势甚盛，刘邦不得不亲自出征。后他击败了英布，在得胜还军途中，刘邦顺路回了一次自己的故乡——沛县（今属江苏省徐州），把昔日的朋友、尊长召来，共同欢饮十数日。一天酒酣，刘邦一面击筑、一面唱地即兴创作了这首《大风歌》。            在这首诗创作的前几年，新建的汉帝国相继经历了燕王臧荼、韩王信、陈豨的叛乱，如今英布造反被平定，但北面的匈奴虎视眈眈，国内反叛实力也伺机而动，整个国家摇摇欲坠。刘邦在这时返回到了故乡，想起了前半生的坎坷换来了如今的荣华，而各方势力又正欲把这个他亲手打造的帝国推向深渊，想必刘邦在吟唱这首诗歌时必是怀着一股被悲凉掩盖的豪气。</p>            <h2>5.作品鉴赏</h2><h3>5.1整体赏析</h3><p>《大风歌》一诗抒发了作者远大的政治抱负，也表达了他对国事忧虑的复杂心情。            此诗全篇只有区区三句，却包含了双重的思想感情，且出现别具一格的转折。其诗用大风、飞云开篇，令人拍案叫绝。作者并没有直接描写他与他的麾下在恢宏的战场上是如何歼剿重创叛乱的敌军，而是非常高明巧妙地运用大风和飞扬狂卷的乌云来暗喻这场惊心动魄的战争画面。“威加海内兮归故乡”，只一个“威”字就是那样生动贴切地阐明了各诸侯臣服于大汉天子刘邦的脚下，一个“威”字也直抒了刘邦的威风凛凛、所向披靡，天下无人能与之匹敌的那种巨无霸的冲天豪迈气概。但诗篇的着重点乃是后一句“安得猛士兮守四方”，这最后一句比照上一句，都是直抒胸臆，写他的心情与思想，但这最后一句，刘邦没有继续沉浸在胜利后的巨大喜悦与光环之中，而且是笔峰一转，写出内心又将面临的另一种巨大的压力。这一句既是希冀，又是疑问。它显露了刘邦的无奈不禁叩问天下，有谁能为他守住这片江山之感慨，昔日的功臣一个个谋反，独留他这个老朽在此老泪纵横。</p>         <h3>名家点评</h3><p>广西大学中文系教授李寅生《中国古典诗文精品读本》：“全诗共三句，由过去而现在而将来，浑然一体。语言质朴，风格雄劲。前二句写天下平定，后一句写渴望求得猛士守御四方。整首诗凝聚着作者对帝业和故土的感情，表达了刘邦既能创业又能守业的豪迈气慨。”</p></div>', 11, 419, '0', '2', 46, 1, 41, 10, 1, 11, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000012, '积分查询相关问题大全', 9, '2022-01-10 10:00:49', '2022-06-01 18:18:26', '<div id=\"divContent\" style=\"overflow-x: auto;\">\r\n                <div align=\"left\"><p>“村里的马路修好了，路灯也亮了，还有了村民自己的文体休闲广场，环境越来越好，政府和村民的收入都有了保障，我们村越来越好了！”2021年12月20日，湖南郴州永兴县高亭司镇大元村党支部书记王月平高兴地说。经了解，原来大元村通过投资由郴州联通承建的集体项目，使村里获得了一大笔收入，在短短数月之内就补齐了村内公共设施设备的资金缺口。</p><p>据了解，地处湖南省郴州市永兴县的高亭司镇，是一个典型的人口大镇，人员流动频繁，产业项目种类比较单一，整个镇的固定收入来源缺口较大，镇内各村的公共设施建设因资金不足导致停摆，收入也得不到保障。从2021年8月起，高亭司镇成了郴州联通的帮扶点之一，郴州联通除了为大元村建设村务管理、防疫、防溺水、云喇叭“四大数字乡村平台”，以数字化平台带动乡村村务治理外，还利用自身优势承建该镇的公共项目，并邀请镇政府以集体的名义投资入股，以少量的投资换来较大的收益，让镇政府的收入得到保障。</p><p>如今，走进高亭司镇，映入眼帘的是干净的路面、整齐的绿化带、宽阔的居民休闲广场，处处焕发着文明乡村的新气象。</p><p>郴州联通相关负责人表示：“搞好乡村振兴不光要搞好乡镇的基础设施建设，还必须让村民的钱袋子鼓起来。政府收入有保障，乡镇才能真正实现长足发展，郴州联通也将持续发挥自身优势带动项目建设，为高亭司镇的产业振兴注入源源不断的资金动能，同时还将继续想办法为村民解决困难事、忧心事，把‘为民办实事、办好事’作为工作落脚点持续推进，为助力乡村振兴贡献力量。” </p></div>\r\n	</div>', 12, 4799, '0', '2', 3426, 24, 7, 2, 2, 12, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000013, '积分兑换相关问题大全', 4, '2022-01-10 08:34:47', '2022-05-01 18:23:48', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">近日，由中国电信和中国联通联合自主研发的共建共享区块链调度平台在2021年中国国际信息通信展览会上首次亮相。</p>\r\n<p align=\"justify\">该平台以区块链技术为基础，构建多方共享互通互信的数据底座，通过充分调用双方云、大数据及现有系统能力，在天翼云与天宫云统一部署、跨云组链，共同打造联合数据管理、联合网络规划、联合建设调度、联合运营分析、联合办公协同等五大应用能力。平台原创性地设计了关键共享参数存证核验、工单双边确权、智能合约资源调度三大区块链生产应用场景，高效支撑共建共享模式下规建维优全流程协同，全面提升网络共建共维共管能力与效率。</p>\r\n<p align=\"justify\">共建共享区块链调度平台是首个基于区块链的跨运营商5G运营调度系统。原创设计区块链技术在共享网络中应用，首创运营商间区块链BaaS联盟，实现了区块链跨云互通组网治理和大数据无线网精准规划应用，为共享网络高效管理运营提供全新的解决方案。</p>\r\n<p align=\"justify\">中国电信和中国联通贯彻创新、协调、绿色、开放、共享理念，希望能携手行业伙伴，共谱合作新篇，为行业深化共享、合作共赢创造更大的价值。</p></div></p>', 13, 536, '0', '2', 468, 66, 2, 0, 2, 13, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000014, '星级服务相关问题大全', 7, '2022-01-10 08:34:50', '2022-06-01 18:24:42', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p>2021年9月26日，中国电信集团有限公司（简称“中国电信”）与中国铁路工程集团有限公司（简称“中国中铁”）在京签署战略合作协议，共同推进两化融合，推动中央企业产业数字化转型，共同打造智慧城市、智慧交通、智慧产业等新型基建产业新生态。中国电信总经理李正茂，中国中铁党委书记、董事长陈云出席签约仪式。中国电信副总经理唐珂与中国中铁党委常委、副总裁刘宝龙代表双方签署战略合作协议。</p>\r\n<p style=\"text-align: center\"><img style=\"border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-top-width: 0px\" alt=\"\" src=\"./W020210930700451364080.jpg\" OLDSRC=\"W020210930700451364080.jpg\" /></p>\r\n<p>根据协议，双方聚焦提升核心竞争力，深化现有合作基础、拓展合作领域。一是共同打造基于5G技术的“智慧工地、智慧建筑、智慧园区、智慧管理”等标杆应用，为基建产品增值赋能；二是双方共同探索通信产业基础设施合作新模式，针对通信产业重大基础设施投资，打造集投融资、建造、资产运管系统化解决方案；三是双方聚焦引领新基建业务的发展，共同探索5G、人工智能、物联网、云计算、大数据等技术在基础设施建设领域的融合创新，整合双方产业资源、市场资源，共同打造智慧城市、智慧交通、智慧产业等新型基建产业新生态；四是借助中国电信国际网络能力，共同打造海外市场协同机制和平台，共建一带一路产业发展。</p>\r\n<p>中国电信作为网络强国和数字中国建设的国家队、主力军，已建成全球领先的全光网络，是国内最大的IDC服务提供商，天翼云在全球运营商公有云IaaS中排名第一，5G SA网络领跑全球。中国电信坚定实施云改数转战略，以云网融合为基础，数字化平台为枢纽，生态合作为关键，机制体制改革为动力，网信安全为支撑，建设云网融合新型信息基础设施，构建数字经济发展基石。</p>\r\n<p>中国中铁是全国建筑行业的“领头羊”，业务范围涵盖了所有基本建设领域。双方此次合作，将借助中国电信在5G定制专网、云计算、云网融合、卫星通信以及智慧工地、智慧建筑等方面独特优势，助力中国中铁数字化转型和智能化战略转型升级。同时，借助中国中铁在基础建设领域“纵向一体化”服务的独特优势，双方推动协同创新、开展协同经营、打造协同生态，共建新基建产业新生态。</p>\r\n<p>在“十四五”开局之年和数字化时代发展的大背景下，中国电信将持续发挥云网融合优势，携手中国中铁，共同探索新技术在基础设施建设领域的融合创新，打造新型基建产业新生态，为数字中国建设提供有力支撑，为推进企业以及建筑行业数字化转型升级，推动建筑业高质量发展作出贡献，共创住建产业新未来。</p></div></p>', 14, 309, '0', '2', 267, 88, 2, 1, 3, 14, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000015, '充值交费相关问题大全', 9, '2022-01-10 10:01:02', '2022-08-01 18:26:31', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p>2021年9月26日世界互联网大会乌镇峰会在浙江乌镇召开。中国电信《“天通一号”卫星移动通信应用系统》项目，获选“世界互联网领先科技成果”，并应邀在大会现场进行发布。这是继2019年中国电信科技创新成果取得此项荣誉后，再获殊荣，标志着中国电信科技创新工作又结硕果。</p>\r\n<p>“世界互联网领先科技成果”发布作为世界互联网大会的重量级活动，致力于展现和表彰全球互联网领域最具价值的科技成果。今年共征集到来自中国、俄罗斯、美国、英国等国家和地区的各类科技成果300余项。来自全球互联网领域的近40位专家组成的领先科技成果专家推荐委员会，最终评选出14项年度领先的互联网科技成果进行现场发布。</p>\r\n<p>中国电信副总经理刘桂清向全球发布了《“天通一号”卫星移动通信应用系统》领先科技成果。中国电信作为全球领先的全业务综合智能信息服务运营商，一直致力于打造陆海空天一体化的通信能力，构建了首个自主研制的大容量卫星移动通信系统。随着“天通一号”系列卫星的成功发射，中国电信完成了3星协同组网，实现了天地一体化运营。天通一号覆盖了中国大陆、亚太地区及周边国家，提供全天时、稳定可靠的多媒体信息服务。</p>\r\n<p>“天通一号”卫星移动通信应用系统完成了多项技术创新，首次提出“天地融合、通导一体”的系统架构。实现了卫星通信、卫星导航的集成服务，在用户终端融合了通信、导航功能。创新提出了“星地一体、宽窄互补”的通信体制，实现星地网络全面融合。突破了终端“天地多模、低功耗、小型化”的技术难题。该应用系统已获得授权专利45件，行业标准4项，学术论文100余篇，填补了国内卫星移动通信系统空白，整体技术达到“国际先进”水平。</p>\r\n<p>“天通一号”卫星移动通信应用系统采用S频段组网，支持50万用户容量，提供全天候的语音、短信、数据通信服务，“看到天空即可通信”。目前，已有51款终端通过工信部入网检测，提供卫星、地面双卡双待服务。重点在偏远地区、极端环境下提供服务，应用于应急通信、抢险救灾、野外勘探等场景。天通一号自正式商用以来，用户已突破10万，并在今年郑州暴雨救援、台风登陆浙江等救灾行动中发挥了重要作用。</p>\r\n<p>中国电信始终坚持网络强国、科技强国战略，不断提升自主创新能力和核心竞争力，努力成为关键核心技术自主掌控的科技型企业。再次获评世界互联网大会“领先科技成果”，体现了业界对中国电信科技创新成果的高度认可。未来，中国电信将继续携手产业链合作伙伴，构建“天通一号”产业生态圈，加快天通系统基础设施建设，扩大覆盖范围，提升用户体验，让“天通一号”走进千行百业！</p></div></p>', 15, 549, '0', '2', 351, 13, 9, 0, 4, 15, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000016, '充值卡充值相关问题大全', 7, '2022-01-10 10:01:17', '2022-09-30 18:27:00', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p><span style=\"font-size: 12pt;\">9月26日，以“新起点、新机遇、新作为”为主题的第二届中国-非洲经贸博览会在长沙隆重开幕。中国电信作为央企唯一运营商代表，展示了以“共创、共赢、共享”为目标，在促进非洲基建、经济发展、民生改善方面的举措，特别是近年来在布局建设“数字丝绸之路”、加强非洲通信基础设施建设、促进非洲国家信息化的成果与案例，并以现场模拟、VR/AR等丰富的形式向非洲嘉宾展示了中国电信多项最新的5G和数字化应用。</span></p>\r\n<p style=\"text-align: center;\"><img src=\"./W020210926658886506735.jpg\" style=\"border-width: 0px;\" alt=\"\" oldsrc=\"W020210926658886506735.jpg\" /></p>\r\n<p><strong>助力“智慧非洲” 打造“数字丝路”</strong></p>\r\n<p>展会上，中国电信展示了在非洲的通信信息服务能力和资源布局，以及多类高性价比综合智能信息服务解决方案。目前，中国电信已在非洲11个国家建设了超过5万千米的光纤骨干网，打造了多个智慧应用标杆案例，还为肯尼亚、南非、埃及等5个国家与地区提供行业信息化解决方案项目。</p>\r\n<p>作为中国最早“走出去”的运营商，中国电信早在2008年就进入非洲市场，在25个非洲国家设立了分支机构，在近30个国家成立技术、工程及服务团队。2015年中国电信（非洲中东）有限公司正式成立，加速了非洲区域的业务拓展和布局。中国电信积极落实“一带一路”倡议，充分发挥自身网络和运营能力优势，已在南非、埃及、肯尼亚、加纳、坦桑尼亚、尼日利亚和吉布提等地建立了20多个网络节点，为用户提供一站式通信信息解决方案，有效提升了这些区域的信息化水平，助力“智慧非洲”建设，积极投身“一带一路”信息化高速公路大发展。</p>\r\n<p>中国电信在展会上介绍了多个助力“智慧非洲”建设的成功案例，具体包括数字马里项目、智慧布基纳法索项目、援毛里塔尼亚城市安全与监控系统项目等。此外，中国电信还为非洲多地的政府、企业和机构提供了国际互联网接入、网络安全系统和办公管理系统等一揽子解决方案，为其打造高效安全可靠的办公运营环境。</p>\r\n<p style=\"text-align: center;\"><img src=\"./W020210926658886510565.jpg\" style=\"border-width: 0px;\" alt=\"\" oldsrc=\"W020210926658886510565.jpg\" /></p>\r\n<p>下一步，中国电信将持续依托覆盖非洲地区和连接全球的网络资源，以卓越的综合信息服务能力和高性价比的专业解决方案，积极支持非洲地区的基础设施、数字经济发展和智慧城市建设。</p>\r\n<p><strong>5G</strong><strong>赋能社会 引领数字化新时代</strong></p>\r\n<p>除了助力智慧非洲展区，中国电信还向非洲嘉宾和参展观众展示了5G与智能制造、智慧城市、智慧医疗、智慧教育、数字乡村及疫情防控等各领域深度融合的案例和具体实践。</p>\r\n<p><strong>在工业制造领域，</strong>中国电信正助力制造业从制造走向“智”造，为企业提供5G定制专网、5G切片专线以及天翼混合云等服务，将连接、计算和AI智能等数字化能力进行融合定制，满足其信息化转型升级过程中端到端的数字化需求。</p>\r\n<p><strong>在智慧城市领域，</strong>中国电信以云计算、大数据、物联网等技术为手段，通过云优势将城市数据汇聚，利用智慧城市综合管理平台的协作能力，支撑政府管理，服务于城市以及百姓生活。用户在展台只要轻点平板电脑，就能利用增强现实技术，将空白的沙盘模型变成一座智慧城市及周边地区的三维景象，快速查看在相应领域的行业信息化解决方案。</p>\r\n<p><strong>在疫情防控领域，</strong>中国电信在现场展示了基于云计算和大数据分析技术自主研发的疫情防控信息监测管理平台，快速实现人员健康数据的动态监测、预警、统计和排查，实现防疫信息“精确”管控。今年8月湖南部分地区出现新冠疫情期间，该疫情防控信息监测管理平台在张家界、湘潭、株洲等多个城市投入使用，为科学防疫发挥了重要作用。</p>\r\n<p><strong>在乡村振兴方面，</strong>中国电信大力推进数字技术与农业农村融合发展，在展区展示的数字乡村平台，包括了乡村一张图、智慧党建、便民服务、智慧广播、视频会议等功能，能面向基层政府提供乡村治理管理服务，面向村民提供政务公开、在线办事、农技推广等乡村一体化服务，在智慧农业和乡村数字化治理体系及治理能力建设方面打造了一大批标杆项目。</p>\r\n<p>作为建设网络强国、数字中国和维护网信安全的主力军，中国电信将以“中国—非洲经贸博览会”为契机，积极履行央企责任，坚定实施云改数转战略，充分发挥自身在5G、云网融合、大数据、生态合作等方面优势，为助力智慧非洲建设和引领数字化转型贡献力量。</p></div></p>', 16, 671, '0', '2', 323, 57, 1, 0, 5, 16, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000017, '充值卡余额查询相关问题大全', 4, '2022-01-10 10:01:27', '2022-02-28 18:27:30', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p>9月18日，以“量子科技产业革命”为主题的2021量子产业大会在合肥市开幕。会上，中国电信和科大国盾量子联合成立的中电信量子科技有限公司正式揭牌。这是中国电信践行以科技创新引领企业高质量发展，加快科技自立自强，推动创新链和产业链深度融合的又一实质举措。安徽省委常委、合肥市委书记虞爱华，中国电信党组书记、董事长柯瑞文共同为量子公司揭牌。</p>\r\n<p>柯瑞文在致辞中表示，中国电信深刻学习领会习近平总书记关于推动量子科技发展的重要指示精神，积极参与量子科技研究，发挥企业优势，打造量子产业生态圈，推动量子通信科研成果转化。</p>\r\n<p>一是把握前瞻布局，推动科技创新。中国电信积极践行建设网络强国、数字中国和维护网信安全主力军的责任使命，着力打造服务型、科技型、安全型企业。把科技创新作为企业发展的战略支撑，与中科大开展深层次合作是中国电信加强科技创新的一项重要举措。通过聚焦量子信息产业发展，进一步加大研发力量和研发资源投入，加快量子科技在通信运营领域的技术验证、应用推广和标准制定，积极探索量子信息技术在5G、云、物联网、大数据等领域的应用，加快推动量子科技基础研究和技术研发成果向多行业领域的融合创新应用，形成量子信息产业化全链条布局。</p>\r\n<p>二是推进产学研结合，加快成果转化。中国电信联合中科大通过促进产学研协同创新，整合量子通信技术、国产商用密码技术、大数据、云计算等前沿技术，加快推动量子科技创新应用攻坚和成果转化。融合5G和量子信息技术，实现运营商首款量子密话产品商用；联合生态合作伙伴成功研制量子安全网关、量子安全通信模组、量子安全对讲、量子安全视频会议终端等产品；形成量子城域网、量子安全组网、量子安全移动办公等解决方案。</p>\r\n<p>三是积极打造生态，推动合作发展。中国电信始终坚持以积极开放的心态与量子科技产业链合作伙伴开展合作。目前中国电信已协同紫光、华为、中兴、新华三、奇安信等行业头部企业初步构建起科研-研发-量产-市场的量子科技产业链。未来，中国电信将在量子基础器件研发、量子核心设备研制、量子应用设备研制、集成及应用技术、建设及运营服务等领域联合生态伙伴联合攻坚、合作共赢。</p>\r\n<p>在本次大会上，中国电信发布了量子密话、量子物联网、量子安全云等创新应用成果。量子密话作为基于国家量子保密通信干线的首个5G加密通信应用，实现了用户通话、短信等通信信息端到端加密传输，全方位保护用户信息安全。量子物联网是中国电信具有完全知识产权的物联网量子加密安全产品，可为智慧燃气、智慧城市、智慧园区、工业物联网、车联网等物联网系统提供量子安全支撑。量子安全云则创新实现了量子密码服务与业务平台的紧密融合，可广泛应用于政务、金融、医疗、企业等领域。一系列量子安全产品的发布，展现了中国电信做强做优做大安全服务产品、筑牢安全屏障、维护网信安全的决心，也是“云改数转”战略中以客户为中心要求的具体实践。</p>\r\n<p>大会期间，中国电信与国盾量子、辰安科技、本源量子、中电信量子、国仪量子、新华三等单位共同启动量子信息应用产业生态合作仪式，并进行了量子产业标杆项目的集中签约，内容涵盖民生应用、工业物联网、量子安全通信模组、量子安全车联网、量子安全智能网络等领域。</p>\r\n<p>中国电信未来将坚定实施“云改数转”战略，进一步加大科技创新投入，发挥云网融合优势，促进创新链、产业链、价值链深度融合，为用户提供更安全的产品服务，护航千行百业，守护千家万户。</p></div></p>', 17, 592, '0', '2', 447, 33, 1, 0, 6, 17, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000018, '充值记录查询相关问题大全', 8, '2022-01-10 10:01:45', '2022-06-15 18:32:13', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p>作为国内水平最高、规模最大的综合性运动会，全运会赛程已经过半，许多赛事堪称比奥运会更难。在中秋之夜，当苏炳添以9秒95的成绩夺得自己运动生涯第一块全运男子百米金牌之时，西安奥体中心的上座率也达到了疫情防控下的最大值，中国电信通过天翼云打造的全新陕西全运通平台又一次面临了严峻考验。</p>\r\n<p><strong>国内首座“5G+智慧”场馆</strong></p>\r\n<p>作为国内首座5G全覆盖的体育场馆，中国电信基于天翼云智慧平台构建一网、一图、一平台的智能化赛事服务体系，实现场馆“一体化”管理，同时将5G+应用、人工智能、云、大数据等新一代信息技术融入体育赛事，提供智慧赛事、智慧运营、智慧安防、智慧停车、智慧物业等综合信息化服务，通过打造“未来场馆”，保障场馆内17000余名观众获得精彩赛事体验，同时也为打造高水平体育赛事提供了坚实的基础保障。</p>\r\n<p><strong>360</strong><strong>度全视角“智慧观赛”</strong></p>\r\n<p>本届全运会最大的亮点，就是首次将“智慧观赛”技术成规模地应用于国家顶级体育盛事。此次全运会打破了传统体育比赛观赛模式，基于5G+AI+VR等新技术，量身定制了自由视角、VR直播、多视角3种智慧观赛模式，为观众打造了一场极具真实感和现场感的全新视觉盛宴。</p>\r\n<p>智慧观赛与传统观赛最大的不同，是观众首次掌握了观赛的自主权，通过天翼超高清“十四运会”专题，观众可自行选择个性化的观赛视角。传统看比赛，导播决定了观众能够看到哪些画面。而智慧观赛的方式是在比赛馆内布置了百余路摄像机，通过视频融合技术拼接成了一路画面。</p>\r\n<p style=\"text-align: center;\"><img src=\"./W020210924710947790084.jpg\" style=\"border-width: 0px;\" alt=\"\" oldsrc=\"W020210924710947790084.jpg\" /></p>\r\n<p><strong>一个平台尽收竞赛信息</strong></p>\r\n<p>中国电信为全运会开发了一套基于天翼云的媒体资源管理系统。这是一个实现了“资源通融、内容兼融、宣传互融”的云上新型媒体，用于存储赛事期间媒体记者拍摄的高清、高容量赛事视频，在本次全运会举办期间，该系统为全国2500多名新闻媒体工作者提供了丰富、详实、专业、安全、高速的第一手赛事信息资料和高质量的影像资料支持。例如，在9月21日举办的男子百米田径决赛中，苏炳添以9秒95的成绩夺得冠军，各大新闻媒体立即做出反应，通过云上媒体资源库获取最新摘片、视频等资料，在一个小时内就发布报道。</p>\r\n<p style=\"text-align: center;\"><img src=\"./W020210924710947804976.jpg\" style=\"border-width: 0px;\" alt=\"\" oldsrc=\"W020210924710947804976.jpg\" /></p>\r\n<p><strong>智慧应用保障赛场千万人次的安全</strong></p>\r\n<p>此次全运会中，中国电信通过天翼云打造了全新的陕西全运通平台。该平台面向所有涉赛、观赛人员，实现了“防疫前置、远端防控、赛前验证、赛后跟踪”的全过程实时动态管理，能够实现身份证、票证、健康认证三证合一，让“集中统一”与“精细管理”在数字技术支撑下成为可能，实现了安全入陕、涉疫人员分钟级追踪。据中国电信西安分公司总经理助理杨帆介绍，目前，“一码通”平台注册人数超过2781万，日均访问量达千万人次，累计统计出行量达13.82亿人次。参加决赛阶段赛事的12000余名运动员获得了强大的安全保障。</p>\r\n<p>那么，是什么“黑科技”让十四运变得更智慧？据了解，作为此次十四运官方指定云服务商，天翼云为全运会提供了1600核云上算力、1300位技术专家、100路智慧影像采集，以硬核科技打造智慧全运。</p>\r\n<p>此外，在全运会信息安全保障方面，中国电信共投入了保障人数1300余人。其中全省现场场馆保障人数315人，周边巡检600人，应急支撑人员200人，全省共1100人保障队伍。开闭幕式260人队伍，其中现场保障人员36人。十四运场馆、火炬传递、接待酒店涉及网络全部纳入重点保障范畴。在影像采集维度，中国电信在全运会赛场架设四路六目摄像机共24路摄像头用于VR直播观赛、72路摄像头用于自由视角模式观赛、4个高清摄像机用于多视角模式观赛。天翼超高清向用户提供了VR直播、自由视角观赛的观赛入口，通过VR直播、自由视角、多视角等多个维度不同的观赛形式，让观众可以尽享精彩。</p>\r\n<p style=\"text-align: center;\"><img src=\"./W020210924710947819839.jpg\" style=\"border-width: 0px;\" alt=\"\" oldsrc=\"W020210924710947819839.jpg\" /></p></div></p>', 18, 272, '0', '2', 223, 90, 4, 0, 7, 18, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000019, '手机服务相关问题大全', 7, '2022-01-10 10:02:00', '2022-03-01 18:33:14', '<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信积极探索并在业内率先引入G.654E超低损耗及大有效面积新型光纤。在技术指标、施工工艺、建设方案和验收规范等方面，反复论证，明确了纤芯直径、有效面积、光衰指标等一系列技术参数，引导光缆生产商投入研发实现规模生产。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在现网工程阶段，中国电信协同产业链上下游企业，攻克了光纤熔接设备、测量设备和新型光纤不适配等诸多技术难题，完成了G.654E新型光纤通用熔接模式的开发和测试；推动三波长OTDR的开发与应用。克服疫情等多重困难，中国电信在国内率先建成了全G.654E陆地干线光缆，并通过现网工程积累了丰富的建设和运维经验，为下一步推动G.654E光纤的现网部署和产业链发展奠定了坚实的基础。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">本次试验，中国电信联合华为、中兴、烽火配置了多套环境，充分测试以比较G.654E和G.652D光纤环境下的系统性能差异。通过现网试验，在G.654E光纤环境中100G、200G、400G等速率均可实现上海-广州的全程无电中继传输，12小时以上连续测试无误码，三周测试期间系统运行稳定。经测算，满足标准OSNR余量要求下，PM-16QAM 400Gb/s可实现1500km左右的无电中继传输。现网对比测试结果表明，G.654E光缆的应用可以使得系统OSNR相较G.652D纤芯环境提升3.5dB，起到减少电中继数量和节能降耗等实际效果，对未来单波1T及更高速率传输系统的发展演进提供有力支撑。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信在国内率先建成该干线光缆，推动了G.654E产业链的成熟，对干线光缆网从G.652D迈入G.654E新型光纤时代具有引领作用，对中国电信建设绿色低碳全光网络具有积极重要的示范意义。</span></p>', 19, 2978, '0', '2', 2569, 62, 11, 1, 8, 19, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000020, '国际/港澳台相关问题大全', 1, '2022-01-10 10:02:08', '2022-04-01 18:34:00', '<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">2021年9月13日，中国电信股份有限公司（以下简称“中国电信”）与东软集团股份有限公司（以下简称“东软集团”）在沈阳签署产业数字化战略合作协议。双方将基于各自优势与能力禀赋，在多个重要行业领域展开合作实现产品、方案、渠道等能力的融合与互补，联合推动项目拓展。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">根据协议，双方将围绕5G产业生态建设，在医疗健康、智慧教育、智能网联等领域，就行业解决方案融合、云应用技术适配、队伍培训赋能、联合营销拓展、渠道资源覆盖等方面全面合作。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">创立于1991年的东软集团是中国第一家上市的软件公司，致力于以软件的创新，赋能新生活，推动社会发展。目前，东软在全球拥有近20000名员工，在中国建立了覆盖60多个城市的研发、销售及服务网络，在全球多个国家和地区设有子公司。东软集团以软件技术为核心，业务聚焦智慧城市、医疗健康、智能汽车互联以及软件产品与服务领域。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">作为建设网络强国和数字中国、维护网信安全的主力军，多年来，中国电信持续深耕综合智能信息服务市场，积极践行“云改数转”战略，组建了以客户为中心的行业型专业组织，充分发挥云网融合优势，紧抓经济社会数字化转型机遇，以5G赋能千行百业，引领产业数字化转型升级。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">此次双方基于相同的战略选择，围绕5G产业生态开展更加深入、更加全面的战略合作，这不仅有利于东软集团和中国电信未来的技术创新和业务拓展，还将有利于双方共同为客户提供满足实际需求和更加符合产业未来发展的产品与服务，为客户乃至整个产业创造更大的价值。</span></p>', 20, 908, '0', '2', 667, 60, 9, 0, 9, 20, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000021, '实名补登记相关问题大全', 9, '2022-01-10 08:34:50', '2022-02-01 18:45:53', '<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">9月2日至7日，以“数字开启未来，服务促进发展”为主题的2021年中国国际服务贸易交易会在北京举行。中国电信围绕“红色电信百年华章”“云改数转重塑安全”“科技引领开放生态”主题打造三大展区，展出多项5G创新成果，全方位展示中国电信5G赋能产业数字化转型的实践，呈现5G技术的无限可能。</span></p>\r\n<p><span style=\" \"><b>“数字”成为新焦点</b></span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">去年以来，新基建按下“加速键”，作为数字经济发展的底座，5G网络建设工作成为重中之重。一直以来，中国电信坚持5G SA引领，已建成全球规模最大的5G SA共建共享商用网络。</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">随着5G网络部署的深入，数字技术能力也在进一步升级。中国电信以科技创新夯实数字经济发展底座，在本次大会上，中国电信带来5G定制网、轻量级UPF等数字化创新技术展示。</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">中国电信打造了精品5G定制网络，包括面向广域优先型行业客户的“致远”模式，面向时延敏感型区域政企客户的“比邻”模式，以及面向安全敏感型客户的“如翼”模式，具备“定制服务更灵活、安全接入更可靠、性能保障更全面”三大特点，可以全面满足行业数字化转型需求。本次中国电信现场展示的轻量级边缘网关UPF，可以帮助企业降低业务获取延迟、提高用户体验，并提供快速、低成本、灵活部署的应用网络。</span></p>\r\n<p><span style=\" \"><b>“服务面”越来越广</b></span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">在数字化转型浪潮中，中国电信积极布局产业数字化转型，以科技创新为引擎，为各类垂直产业提供转型服务，推动医疗、工业、物流、城市管理、教育、娱乐等各个领域向数字化、智能化升级发展。</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">在医疗领域，5G赋能全场景智慧医院、云诊疗与疫苗接种等工作，以技术服务民生，践行责任担当；在工业领域，中国电信基于5G﹢云﹢AI能力，助力三一重工打造5G全连接工厂，成为5G﹢工业领域的“灯塔工厂”；在文旅领域，依托5G﹢4K/8K超高清直播，让观众足不出户即可遍览祖国大好河山……</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">“不久前，中国电信携手京东发布了5G智能无人仓，依托5G灵活定制、MEC及云边协同的技术优势，可全流程提高物流作业的效率与安全。”现场讲解员介绍，未来该5G智能无人仓还将在北京亚洲一号仓实现规模部署，开启“智慧物流”新局面。</span></p>\r\n<p><span style=\" \"><b>“5G未来”无限可能</b></span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">无人配送、自动驾驶、云上旅游……自5G商用以来，这些曾经存在于科幻小说中的情节正在一一实现，而5G仍有更多可能性等待挖掘。本次大会，中国电信带来了极具“未来感”的创新应用。</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">在“云改数转重塑安全”展区前，天翼云诸葛AI平台吸引了不少行业嘉宾的目光。天翼云诸葛AI平台可大幅降低复杂技术的使用门槛，满足各垂直行业客户对大数据AI快速落地的需求，为“数字经济”创新发展注入鲜活动力。</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">基于量子安全技术，中国电信打造的5G量子密话可为用户提供高等级通话安全防护，让用户体验绝密通话；可信通信则可实现为被叫用户展示主叫用户身份，有效解决骚扰电话、诈骗电话等困扰……</span></p>\r\n<p><span style=\" \"><b>一展“国际化”保障水平</b></span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">除了线下参展，今年“线上服贸会”平台持续开放，纯线上参展企业同比增长40%。此外，来自153个国家和地区的1万余家企业注册线上线下参展参会，整体国际化率达51%，同比提升9%。云会议、云直播、线上交流、在线交易等成为本次大会的重要组成部分，这也对网络提出了更高要求。</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">中国电信不仅是参展商，同时也是大会通信服务保障方。今年7月，中国电信成立服贸会通信保障领导小组，精密制定“两案两表”，提前完成各项网络测试与优化工作。展会期间，中国电信为来自全球各国的参展单位提供稳定、高速的5G网络，零差错、零失误保证各类展出、演讲直播等活动顺利进行。</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">本届服贸会上，中国电信集中展示了“云改数转”战略落地以来的新技术、新产品和新应用，彰显科技硬实力与创新软实力。中国电信将一如既往与合作伙伴共同创造5G新业态、新价值，践行建设网络强国和数字中国、维护网信安全的初心使命，为“十四五”开局做出新的贡献。</span></p>', 21, 104, '0', '2', 22, 0, 0, 0, 1, 21, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000022, '5G覆盖查询相关问题大全', 1, '2022-01-10 08:34:52', '2022-03-01 18:54:14', '<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">9月2日，在中国电信集团有限公司（以下简称“中国电信”）与苏州市人民政府（以下简称“苏州”）产业数字化战略合作协议签约现场，天翼安全科技有限公司（以下简称“安全公司”）与天翼交通科技有限公司（以下简称“交通公司”）正式揭牌。安全、交通两大科技公司落户苏州，意味着中国电信在回归A股发行上市后，围绕科技创新、推动产业数字化、促进数字经济发展、加强区域协作和资本合作等迈出实质性步伐。江苏省委常委、苏州市委书记许昆林，中国电信党组书记、董事长柯瑞文出席仪式并共同为安全公司、交通公司揭牌。苏州市委副书记、代市长吴庆文与中国电信副总经理唐珂代表双方签约。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>加强区域协同发展，深入推进产业数字化</b></span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信是全球领先的全业务综合智能信息服务运营商，致力于打造服务型、科技型、安全型企业，位列2021年《财富》世界500强第126位。得益于云改数转战略和5G应用发展，中国电信创新业务收入规模连续多年位居行业首位，今年上半年，中国电信产业数字化业务收入达到501亿元，同比增长16.8%。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">8月20日，中国电信（股票代码：601728）正式在上交所主板挂牌上市，正式实现“A+H”境内外资本市场的全布局。回归A股以来，中国电信继续坚持守正创新，开拓升级，加强区域合作、产业生态合作，实现共同繁荣、共同发展。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">此次与苏州在安全服务、车路协同、云计算、新基建、数字政府、数字乡村等诸多领域达成合作共识。根据协议，双方将建设科技创新产业园，中国电信旗下安全公司落户苏州积极打造网络信息安全服务，联合组建车路协同合资公司加快发展车路协同出行服务，拓展云计算新兴业务，着力建设配套基础设施；在新型基础设施建设、政府数字化转型、数字乡村、工业互联网等领域开展全面合作；围绕双方共同关注的产业领域，加强投资合作和产业培育。上述合作将助推苏州率先建成“数字化引领转型升级”标杆城市，也将进一步巩固中国电信在全地域、全业务发展中的优势地位。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>安全公司落户，构建国家网信安全能力底座</b></span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">安全公司落户苏州、服务覆盖全国，将作为区域协同发展的重要板块。安全公司是中国电信股份有限公司出资设立的子公司，是中国电信集约开展网络安全服务的科技型、平台型专业公司，以研发运营一体化方式，整合全集团云网、安全、数据等优势资源和能力，进行统一运营，为内外部客户提供云网安全、数据安全、信息安全等各类安全产品和服务。 </span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">从2015年起步，安全公司依托运营商云网资源优势，创立“云堤”网络安全服务品牌，6年时间，从第一款明星产品云堤·抗D问世到成为国家级网络安全保障防护平台，从提供基础防护服务到多场景服务覆盖，从默默守护到近万家客户信赖，中国电信始终不忘初心、牢记使命，坚持以人民为中心，以客户为中心，以安全保发展，以发展促安全，通过领先的网络安全能力履行社会责任、服务客户，为国计民生保驾护航。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">作为新时代的创新公司，安全公司坚持以技术立身，以开放的视野、积极的姿态，投身于数字化转型的浪潮。依托完备的应急保障管理支撑与过硬的安全技术支持，出色完成了国家重要活动的各项网络安全保障任务，有效保障了网络稳定畅通，坚决守护了网络空间安全，向党、向国家、向人民交出了满意的答卷，体现出了央企社会责任的担当，展现出了高水准的网络安全组织保障能力和技术水平。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">截至目前，安全公司已斩获国家级、省部级、行业级优秀项目奖百余项，授权专利10项，软件著作8项，入选国资委重大科技创新成果和年度网络安全优秀解决方案奖，工信部“网络安全试点示范项目”4个，中国通信学会科学技术奖一等奖，多次入围权威机构评选的网络安全百强企业，并跻身领军者行列。已为政务、金融、企业等全行业超过8000家客户提供了运营商级网络安全服务。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>交通公司揭牌，打造国家级车联网先导区</b></span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">交通公司由中国电信、苏州市有关国资平台和中智行公司联合组建，定位于车路协同技术研发及服务运营，旨在攻克5G+北斗融合定位、多源异构数据融合、全域协同控制、5G/V2X融合网络等关键技术，构建“深度感知、可靠通信、智慧决策、高效运营”的国家级智能车路协同系统，实现L3-L5级智能车路协同技术和场景的大规模验证与应用，服务苏州并逐步向全国推广。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">交通公司致力于苏州车联网（智能网联汽车）产业发展、智慧交通系统升级改造、车路协同云控平台研发运营以及无人公交、清扫车、网约车、自动代客泊车等自动驾驶场景应用落地运营；构建统一的城市级车路协同系统及云控平台技术标准规范，加速科技成果在苏州、长三角推广复制。定位于车路协同技术研发及服务运营，探索智能车路协同规模验证与应用，服务苏州并逐步向全国推广，助力打造国家级车联网先导区。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">许昆林在致辞中感谢中国电信长期以来给予苏州发展的大力支持。他希望中国电信进一步扩大在苏业务布局、提升基础设施能级，深度参与场景应用开发，推动更多新技术、新业务、新项目落户，共创智能时代、共享智能成果，携手打造永远在线的“数字苏州”。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">柯瑞文感谢苏州给予中国电信发展的支持帮助。他说，中国电信是建设网络强国、数字中国和维护网信安全的国家队和主力军，以A股上市为契机，进一步整合云网、用户、人才等资源，全力打造服务型、科技型、安全型企业，不断满足人民群众对美好数字生活的向往。未来将围绕产业数字化、生活数字化、治理数字化，强化基础设施支撑、核心技术赋能和数据安全保障，为苏州经济社会发展作出更大贡献。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">恒者行远，思者常新，博观约取，厚积薄发。未来，中国电信将继续坚持以习近平新时代中国特色社会主义思想为指导，立足新发展阶段，完整、准确、全面贯彻新发展理念，服务和融入新发展格局，认真践行建设网络强国、数字中国和维护网信安全的初心使命，坚定实施云改数转战略，加快打造云网融合的安全、绿色新型信息基础设施，助力经济社会发展转型，为网络强国、数字中国建设谱写华丽篇章。</span></p>', 22, 140, '0', '2', 0, 0, 0, 0, 2, 22, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000023, '一证通查相关问题大全', 4, '2022-01-10 10:02:29', '2022-04-30 19:17:15', '<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">8月20日，中国电信卫星公司与中国东航、松下航电合作，全面升级空中互联服务。MU5101航班作为国内Ku高通量卫星正式商用的首个高速网络航班顺利起飞，开启旅客万米高空网上冲浪之旅。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">此次网络升级，中国电信卫星公司采用的首颗国内自主研发Ku频段高通量卫星，是目前国内技术最先进、通信容量最大、终端速率最高的高通量卫星，可真正实现中国全境及亚太地区航线覆盖，整星容量达到50Gbps，单机带宽超过220Mbps。中国东航基于Ku高通量卫星和松下机载系统，大幅提升了空中互联网络速度，可面向乘客提供与地面网络近似一致的空中上网服务体验，极大增强乘客出行感知。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">中国电信作为我国唯一一家全业务牌照基础电信运营商，拥有功能完善、运营稳定的专用卫星主站和业务运营平台，支持全球主流机载通信系统，可以为客户提供“陆海空天一体”的全方位通信保障服务。从2014年开始，中国电信率先推出航空互联网业务，为中国东航等6家航空公司超200架飞机提供覆盖全球的空中宽带网络服务，累计为超过45万班次1000万人次提供航空互联网接入服务。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">今年5月，中国民用航空局发布了《中国民航新一代航空宽带通信技术路线图》，明确以5G为代表的新一代航空宽带通信系统的建设应用，是构建智慧民航系统的重要基础和技术支撑。中国电信投入电信频率100MHz资源，融合航空移动频率10MHz，采用混合组网方式，结合天翼云资源为中国民航定制5G ATG空地云专网，计划今年第三季度完成建网。据悉，5G ATG网络投入使用后，单架飞机峰值带宽高达1Gbps，可支持空中互联网和智慧民航服务等多种业务，实现机上智慧娱乐服务、智慧客舱服务，以及行李跟踪智慧出行服务、客舱视频智慧安防应用和地面指挥协同智慧运控应用。目前，中国电信已与长龙航空达成共识，作为首发用户，全机队实施运营5G ATG网络。</span></p>', 23, 225, '0', '2', 12, 2, 0, 0, 3, 23, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000024, '宽带服务相关问题大全', 2, '2022-01-10 10:03:19', '2022-04-30 19:17:45', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">8月20日，中国电信卫星公司与中国东航、松下航电合作，全面升级空中互联服务。MU5101航班作为国内Ku高通量卫星正式商用的首个高速网络航班顺利起飞，开启旅客万米高空网上冲浪之旅。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">此次网络升级，中国电信卫星公司采用的首颗国内自主研发Ku频段高通量卫星，是目前国内技术最先进、通信容量最大、终端速率最高的高通量卫星，可真正实现中国全境及亚太地区航线覆盖，整星容量达到50Gbps，单机带宽超过220Mbps。中国东航基于Ku高通量卫星和松下机载系统，大幅提升了空中互联网络速度，可面向乘客提供与地面网络近似一致的空中上网服务体验，极大增强乘客出行感知。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">中国电信作为我国唯一一家全业务牌照基础电信运营商，拥有功能完善、运营稳定的专用卫星主站和业务运营平台，支持全球主流机载通信系统，可以为客户提供“陆海空天一体”的全方位通信保障服务。从2014年开始，中国电信率先推出航空互联网业务，为中国东航等6家航空公司超200架飞机提供覆盖全球的空中宽带网络服务，累计为超过45万班次1000万人次提供航空互联网接入服务。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">今年5月，中国民用航空局发布了《中国民航新一代航空宽带通信技术路线图》，明确以5G为代表的新一代航空宽带通信系统的建设应用，是构建智慧民航系统的重要基础和技术支撑。中国电信投入电信频率100MHz资源，融合航空移动频率10MHz，采用混合组网方式，结合天翼云资源为中国民航定制5G ATG空地云专网，计划今年第三季度完成建网。据悉，5G ATG网络投入使用后，单架飞机峰值带宽高达1Gbps，可支持空中互联网和智慧民航服务等多种业务，实现机上智慧娱乐服务、智慧客舱服务，以及行李跟踪智慧出行服务、客舱视频智慧安防应用和地面指挥协同智慧运控应用。目前，中国电信已与长龙航空达成共识，作为首发用户，全机队实施运营5G ATG网络。</span></p>\r\n</div></div></p>', 24, 247, '0', '2', 76, 4, 0, 0, 4, 24, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000025, '卡号大全', 7, '2022-01-10 10:03:26', '2022-03-30 19:18:12', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"text-align: center; \"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><img src=\"./W020210825543169945334.jpg\" style=\"border-width: 0px;\" alt=\"\" OLDSRC=\"W020210825543169945334.jpg\" /><br />\r\n</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">8月25日，在全国低碳日当天，中国电信集团有限公司（以下简称“中国电信”）在京举行“节能降碳 绿色发展——中国电信碳达峰、碳中和行动计划”发布会。中国电信董事长柯瑞文、总经理李正茂、清华大学环境学院教授、中国工程院院士贺克斌、工信部信息通信发展司副司长梁斌、国家电投副总经理刘明胜、国家电网总经理助理赵庆波、中国信息通信研究院首席科学家孟艾立、华为副总裁周小华以及中兴副总裁张向阳出席会议并共同启动中国电信碳达峰、碳中和行动计划。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">梁斌在致辞中指出，中国电信自2007年起开展节能减排工作以来，建立了立足于行业的绿色发展理念，推动了网络单位能耗下降和节能降碳，取得了显著的成效，彰显了企业的社会责任，长期的积累为“双碳”工作奠定了坚实的基础。希望中国电信能够以此次“双碳”行动计划发布为契机，把握新机遇，勇担新使命，开创新局面，在实现自身绿色低碳发展的同时，以推动新型基础设施发展为依托，提升赋能数字经济绿色发展能力，为国家碳达峰、碳中和贡献行业力量。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">李正茂表示，中国电信作为信息通信领域的国家队和主力军，积极贯彻创新、协调、绿色、开放、共享的新发展理念,积极践行建设网络强国和数字中国、维护网信安全的初心使命，全面实施“云改数转”战略，努力构建云网融合的安全、绿色新型信息基础设施，赋能经济社会绿色发展，以实际行动为“双碳”工作作出积极贡献。在“十三五”期间，中国电信率先开展并全面完成FTTH光接入网改造升级，部署全球最大的ROADM网络，推动网络能耗强度持续下降，单位信息流量综合能耗比“十三五”期初下降60%。加大科研投入，推动核心技术攻关，不断探索节能降碳新技术，形成相关标准和专利近百件。自研节能技术覆盖95%以上的5G基站，年节电率近15%。发挥5G、云计算、大数据、区块链、物联网等新技术优势，赋能各行业数字化转型，减少资源消耗，高效支撑“新基建”和数字经济绿色发展。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">李正茂指出，站在“两个一百年”奋斗目标历史交汇的关键节点和股份公司回归A股上市的新起点上，中国电信坚持以习近平新时代中国特色社会主义思想为指导，深入贯彻习近平总书记关于碳达峰、碳中和的重要讲话重要指示批示精神，以经济社会发展全面绿色转型为引领，坚定不移走生态优先、绿色低碳的高质量发展道路，探索形成“1236”绿色低碳发展模式，助力“双碳”目标的实现。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">李正茂表示，下一步中国电信将重点从三个方面推进“双碳”工作，一是建设绿色新云网，打造绿色新运营。打造云网融合的安全、绿色新型信息基础设施，到“十四五”期末，实现单位电信业务总量综合能耗和单位电信业务总量碳排放下降23%以上。全面深化5G共建共享，加快推动4G网络存量资源深度共享，深入开展基站节能技术研究推广及应用，“十四五”期间，实现4/5G网络共建共享节电量超过450亿度，新建5G基站节电比例不低于20%。持续开展绿色数据中心先进节能技术应用，“十四五”期间，大型、超大型绿色数据中心占比超过80%，新建数据中心PUE低于1.3。有效提升企业运营数字化、智能化、绿色化水平，持续推进网络、平台及IT系统云化进程，加快推进数字化转型，积极倡导绿色办公、绿色出行，多措并举减少碳排放。二是构建绿色新生态，赋能绿色新发展。全面实施信息通信能源供给侧结构性改革，加快打造以绿色供应链为核心的低碳产业生态圈、以数字技术赋能绿色生产管理和以数字技术赋能绿色美好生活，通过智慧成果共享，为经济赋能的同时，提高人民群众美好生活的幸福成色。三是催生绿色新科技，筑牢绿色新支撑。加强低碳网络重大科技攻关能力建设，以科技创新打造低碳发展的竞争优势，推动源头创新和核心技术突破。牵头推进国内国际标准规范研究制定和建立健全企业级“双碳”管理体系，加大“双碳”关键资源投入，全力保障“双碳”工作落实到位。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">此次中国电信发布的碳达峰、碳中和“1236”行动计划，具有丰富的内涵意义。“1”是指坚持一个战略重点，绿色低碳发展是企业“云改数转”战略的重要内容。“2”是把握两个发力方向，即对内强化技术创新和管理升级，推动企业碳排放强度持续下降；对外优化产品供给和服务质量，以数字技术赋能全社会绿色低碳发展。“3”是践行三个基本策略，即处理好节能降碳与5G、数据中心高速发展的关系，全面推进云网融合的安全、绿色新型信息基础设施建设，确保高质量发展；处理好充分竞争与开放合作的关系，全面使能产业链、供应链和全社会绿色发展，实现合作共赢、协同发展；处理好科技创新与可持续发展的关系，加大科研攻关力度和关键资源投入，推动企业可持续发展。“6”是推进六大绿色行动，即建设绿色新云网、打造绿色新运营、构建绿色新生态、赋能绿色新发展、催生绿色新科技、筑牢绿色新支撑。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">“手种黄柑二百株，春来新叶遍城隅”。中国电信将以此次碳达峰、碳中和行动计划发布为契机，坚持以习近平新时代中国特色社会主义思想为指导，立足新发展阶段，完整、准确、全面贯彻新发展理念，服务和融入新发展格局，认真践行建设网络强国、数字中国和维护网信安全的初心使命，坚定实施云改数转战略，加快打造云网融合的安全、绿色新型信息基础设施，助力经济社会发展全面绿色转型，为我国如期实现“双碳”目标作出新的更大贡献。</span></p>\r\n</div></div></p>', 25, 65, '0', '2', 15, 0, 0, 0, 5, 25, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000026, '5G套餐相关问题大全', 2, '2022-01-10 10:03:34', '2022-03-01 19:19:31', '<p align=\"justify\" style=\";text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">8月31日晚，在教育部、国家体育总局和四川省协调组的指导下，在成都第31届世界大学生夏季运动会倒计时300天之际，成都大运会火炬“蓉火”在金沙遗址博物馆正式亮相，成都大运会火炬巡展同步启动。接下来，“蓉火”将在北京、上海、武汉、深圳、重庆等多座城市开展特色展览展示，让更多人了解大运、爱上成都。</span></p>\r\n<p align=\"justify\" style=\";text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">作为大运会综合信息类独家合作伙伴，中国电信冠名合作本届大运会火炬传递，以“智慧大运”传递体育激情，向全球发出最诚挚的成都邀约。中国电信四川公司党委书记、总经理郑成渝代表中国电信受颁成都大运会火炬传递“独家冠名商”纪念章。</span></p>\r\n<p align=\"justify\" style=\";text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">2019年12月18日，中国电信正式签约成为成都2021年第31届世界大学生夏季运动会综合信息类官方合作伙伴。签约以来，中国电信发挥在数字化、智能化等方面的整体优势和丰富经验，从精品网络、智能技术、平台管理等方面为成都大运会提供高品质网络支撑和全方位综合智能信息服务，全力打造“智慧大运”。</span></p>\r\n<p align=\"justify\" style=\";text-align:justify;text-justify:inter-ideograph;\"><span style=\" \"><b>精品网络、云网融合保驾护航“智慧大运”</b></span></p>\r\n<p align=\"justify\" style=\";text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">中国电信全面实施“云改数转”战略，提升科技创新能力，满足用户日益丰富的综合智能信息服务需求。并将以高品质的5G定制网、云网融合的新型基础设施、强大的数字化平台等为成都大运会提供开放、融合、绿色、智慧的服务，提升赛事的营销能力、服务能力、管理能力、运营能力以及大数据分析能力。</span></p>\r\n<p align=\"justify\" style=\";text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">中国电信充分发挥云网融合优势，全力支撑智慧大运建设。2021年7月，中国电信集团有限公司总经理李正茂在四川调研期间，深入成都大运会技术运营中心，观看5G+8K技术进行赛事直播及回放等画面，与成都大运会执委会深入沟通交流。李正茂表示，要一如既往做好成都大运会暨第31届世界大学生夏季运动会通信保障和服务支撑工作，发挥产品优势，为大运会提供全方位的网络防护；加快5G+8K技术应用推广，争取在全国率先实现5G+8K智慧家庭观赛。</span></p>\r\n<p align=\"justify\" style=\";text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">在“相约幸福成都”系列赛事中，中国电信成都分公司承建多个比赛场馆机房内的设备安装调试和运行保障工作。在支撑保障过程中，采用双活云技术，实现所有系统云化，使信息交互更加自由顺畅的同时还能实现数据的实时备份存储；所有交换机采用了物理双路由的建设方式，保证提供高速稳定的网络服务，更高效更可靠；实现了比赛场馆的5G全覆盖，有效支撑比赛用专网、办公专网、场馆互联网以及公共网络的使用。</span></p>\r\n<p align=\"justify\" style=\";text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">同时，中国电信聚焦网络结构、业务配置、运行环境、监控手段、运营管理等网络安全要素，为成都大运会建设智能安全的通信网络，量身定制针对赛事、管理、媒体、安保等不同需求的个性化专网，为“智慧大运”保驾护航。</span></p>\r\n<p align=\"justify\" style=\";text-align:justify;text-justify:inter-ideograph;\"><span style=\" \"><b>技术中心、智慧平台持续赋能“智慧大运”</b></span></p>\r\n<p align=\"justify\" style=\";text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">中国电信深入研究解决方案，运用5G 三千兆+、物联网、天翼云、大数据等为成都大运会打造智能综合管理平台，全面提升场馆和竞赛设施的建设水平，推动赛事管理、赛事组织、赛事传播的智能化、自动化、精细化、高清化以及集平台、网络、终端、人员、服务等为一体的系统化管理。</span></p>\r\n<p align=\"justify\" style=\";text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">2021年4月23日，成都大运会技术运行中心（TOC）正式投入运行。TOC是成都大运会信息技术的重要组成部分，是技术运行工作的指挥中心、监控中心、协调中心、应急中心，也是重大事件的指挥处理中心。作为成都大运会通信和信息化项目的总集成，中国电信成都分公司全力承接了“智慧大运”的建设工作，为TOC的正式试运行提供了有力支撑。</span></p>\r\n<p align=\"justify\" style=\";text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">同时，中国电信围绕成都打造世界赛事名城的理念，以办赛、营城、兴业、惠民为核心，以提升赛事全角色参与者的体验，优化城市功能，促进产业发展为目标，全新发布智慧赛事运营平台，通过打造核心赛事运营平台，为赛事提供专业的管理平台。而在大运会期间，智慧赛事运营平台将为活动组织服务、媒体服务、智慧服务、公众服务等四大类服务对象的信息化需求，提供解决方案，将大运赛事进行集中、实时、精准、直观地展示，为“智慧大运”持续赋能。</span></p>\r\n<p align=\"justify\" style=\";text-align:justify;text-justify:inter-ideograph;\"><span style=\" \"><b>科技应用、品质服务精彩呈现“智慧大运”</b></span></p>\r\n<p align=\"justify\" style=\";text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">2021年春节，中国电信在IPTV上线“i成都”专区，这是一个面向全体市民开放的生活服务类电视平台，在电视大屏上提供吃喝玩乐推荐、商超优惠信息、日常生活服务等各类信息内容，带大家体验别样春节。在“i成都”里专门设置了大运会专区，可以在这里了解成都大运会的最新消息，观看大运明星、运动赛事，体验智慧大运等，让美食、美景、运动相伴假期生活。</span></p>\r\n<p align=\"justify\" style=\";text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">2021年2月8日，中国电信“5G新春熙，8K大视界”央视8K春晚户外大屏暨全链路直播试验揭幕仪式在成都举行，揭开了中西部首块8K户外超高清大屏的神秘面纱。在大运会期间，中国电信将会通过这块8K大屏，采用5G+8K直播和8K录播等形式，将火炬传递和大运会的精彩赛事展现在广大市民面前，带给大家身临其境的体验，共同感受“智慧大运”。</span></p>\r\n<p align=\"justify\" style=\";text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">2021年5月14日至16日，在“相约幸福成都”系列赛事活动中，中国电信成都分公司在成都大运会执委会信息技术部的指导下，利用5G三千兆+、8K、天翼云等技术的融合，实现了全国首次5G+8K多视角赛事直播，通过电信5G三千兆+、云网、8K超高清视频、“5G+背包”多视角直播等技术，将运动员比赛瞬间精彩呈现，广大市民通过成都春熙路、宽窄巷子等地的直播播放点享受了一场高水平的田径盛宴。</span></p>\r\n<p align=\"justify\" style=\";text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">成都大运会火炬“蓉火”通过朱红、明黄、翠绿、湖蓝四个渐变色的完整整合，呈现成都热情、活力、时尚的多彩生活与大学生的斑斓青春。中国电信也将运用高品质网络和全方位综合智能信息服务，助力成都打造“智慧大运”，将成都的生活美学燃向世界！</span></p>', 26, 89, '0', '2', 20, 1, 0, 0, 6, 26, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000027, '4G套餐相关问题大全', 9, '2022-01-10 10:03:39', '2022-06-01 19:22:11', '<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">近日，2021网上丝绸之路大会——数字新基建与全民数字提升论坛在宁夏银川举办。论坛由宁夏回族自治区互联网信息办公室和中国电信宁夏公司联合主办，聚焦“数字创新融合，赋能产业发展”，线上线下同步进行。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">论坛现场举行了中国电信国家一体化大数据中心（宁夏·中卫）国家枢纽节点和国家北斗导航位置服务数据中心宁夏分中心揭牌仪式，同时发布了黄河云产业数字化平台和数字新基建基础平台。两个中心的揭牌和两大平台的发布，标志着宁夏数字化发展进入崭新阶段。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">据介绍，国家一体化大数据中心（宁夏·中卫）国家枢纽节点是中国电信立足宁夏实际，充分发挥云网融合、安全可信的数字化能力优势，重点打造的数据中心集群，是建设黄河流域生态保护和高质量发展先行区的核心数据载体，对赋能千行百业数字化转型升级具有重大意义。由宁夏电信规划资金2.12亿元，并于2021年4月13日投入试运营的国家北斗导航位置服务数据中心宁夏分中心，是全国第三个完成验收的省级北斗分中心，可面向各级政府、民生领域提供北斗时空大数据资源服务、北斗时空大数据共享服务，将成为全国与“一带一路”沿线国家在产业、经济、文化等领域合作的重要信息服务枢纽。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">近年，宁夏电信充分发挥信息赋能优势，以丰富的智慧信息应用促进经济发展方式转变、推动产业转型升级、加速新旧动能转换，取得了良好成效。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">本次论坛上，宁夏电信发布的黄河云产业数字化平台，结合了5G、云计算、物联网、大数据、人工智能等新兴技术，拥有红酒云、黄牛云、5G﹢工业云平台等智能应用场景；数字新基建基础平台依托云、网、安优势，结合通信、北斗、遥感卫星“三星融合”的新技术能力，构筑空天地一体化的信息服务体系，打造“云网安﹢通导遥”数字新基建底座。两大平台的发布，有利于加速宁夏九大特色产业数字化转型升级，助力黄河流域生态保护和高质量发展先行区建设。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">未来，宁夏电信将大力推进云改数转战略，为助力黄河流域生态保护和高质量发展先行区建设贡献电信人的力量，和宁夏区政府、产业合作伙伴共同推动“网上丝绸之路”取得更加丰硕的成果，造福“一带一路”沿线国家和人民。</span></p>\r\n</div></div></p>', 27, 385, '0', '2', 278, 57, 1, 1, 7, 27, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000028, '卡号专区相关问题大全', 2, '2022-01-10 10:03:45', '2022-03-01 19:38:34', ' <p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">8月20日，上海市人民政府与中国电信集团有限公司在沪签署“十四五”战略合作协议。上海市市委书记李强，市委副书记、市长龚正会见了中国电信董事长柯瑞文、总经理李正茂一行。龚正、柯瑞文出席签约仪式。市委常委、副市长吴清与李正茂代表双方签约。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">李强对中国电信长期以来积极参与和支持上海经济社会发展表示感谢。他说，当前，我们正在深入贯彻落实习近平总书记在浦东开发开放30周年庆祝大会上的重要讲话精神，全力以赴推动中央赋予上海的各项重大战略任务落地落实，更好服务国家改革发展大局。上海全面推进城市数字化转型与中国电信实施“云改数转”战略，方向目标契合，合作前景广阔。希望以此次协议签署为新的起点，深化双方合作对接，共同完善城市数字底座，共同发展新应用新业态，共同加大科技创新突破。欢迎中国电信持续提升新一代基础设施能级，深度参与场景开发并率先形成示范应用，推动新技术、新业务、新项目落地上海。我们将不断优化营商环境，创造良好创新生态，提供更多发展舞台，支持企业在沪做大做强。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">柯瑞文感谢上海长期以来给予中国电信的支持与帮助。他表示，中国电信在上海证券交易所主板上市，与上海市政府签约深化战略合作，对企业更好服务国家战略、助力城市发展具有重要意义。中国电信将加大在沪发展力度，积极参与上海城市数字化转型，围绕经济数字化、生活数字化、治理数字化强化基础设施支撑、核心技术赋能和数据安全保障，为上海经济社会发展作出更大贡献。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">根据协议，双方将共同围绕“双千兆宽带城市”能级提升、新一代信息技术研发与成果转化、城市数字化转型场景应用、信息基础设施保障等方面持续加大投入，深化合作对接，为上海提升城市软实力、服务新发展格局提供强有力支撑。</span></p>\r\n</div></div></p>', 28, 435, '0', '2', 56, 11, 0, 0, 8, 28, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000029, '热门推荐相关问题大全', 1, '2022-01-10 10:03:51', '2022-03-31 19:43:23', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">8月20日，中国电信集团有限公司（以下简称“中国电信”）与上海市人民政府在沪签署“十四五”战略合作协议。在“十四五”期间，双方将共同围绕“双千兆宽带城市”能级提升、新一代信息技术研发与成果转化、城市数字化转型场景应用、信息基础设施保障等方面持续加大投入，深化合作对接，为上海提升城市软实力、服务新发展格局提供强有力支撑。市委书记李强，市委副书记、市长龚正会见了中国电信董事长柯瑞文、总经理李正茂一行。市领导诸葛宇杰参加会见。龚正、柯瑞文出席签约仪式。市委常委、副市长吴清与李正茂代表双方签约。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">根据协议，到2025年底，中国电信将在上海投入资金不低于1000亿元，构筑坚实的连接+算力+安全的信息化底座，融入城市经济、生活、治理数字化进程，勇当上海城市数字化转型建设的主力军、城市网信安全的可靠国家队，向市民持续提供更好的产品品质和服务体验。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">在网络建设方面，巩固上海全球领先“双千兆宽带城市”地位，提升国际信息通信能力，助力上海打造全球信息通信枢纽。进一步开展5G网络深度覆盖工程，到2025年投入服务的5G基站超过4万个，推进光纤到房间到桌面（FTTR/ FTTD），主流用户普及千兆带宽；进一步推广基于IPv6+（互联网协议第6版）技术的应用；“十四五”期间建成第二海光缆登陆站，增加面向重点方向的国际海光缆；到2025年底，中国电信在上海的国际出口带宽合计超过6Tbps（太比特每秒），使上海保持国际网络访问感知领先全国；重点在临港园区建设算力平台，助力上海打造算力全球领先城市。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">在应用创新方面，加大科技创新投入力度，助力上海建设具有全球影响力的科技创新中心。“十四五”期间，在上海设立中国电信长三角区域研发实体，重点研究5G、工业互联网、人工智能、区块链、网信安全、量子通信等新一代信息技术，推动前沿科技成果转化落地。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">在推进数字化转型方面，聚焦城市经济、生活、治理数字化。经济数字化上，重点推进5G网络、智能物联网、边缘云计算与城市支柱行业的应用融合，打造至少一个具有全国影响力的工业互联网公共平台，形成不少于100个5G+工业互联网应用案例，助力十万家中小企业上云；生活数字化上，提升家庭WiFi品质，构筑智慧家庭、智慧社区领域的产业生态链，在教育、医疗、养老、社区服务等领域提升市民感知；治理数字化上，共同推进上海市“一网通办”、“一网统管”建设，以5G+XR赋能“一网统管”，同时开放电信大数据以支撑城市公共安全管理，并在全市公话亭全面推出市话限时长免费、市民热线一键直呼等服务。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">在信息通信基础保障方面，对接上海重点区域发展，重点服务五大新城、虹桥枢纽和长三角一体化。对接五大新城和虹桥国际开放枢纽总体规划，前瞻布局新一代信息通信基础设施与云资源，打造云边协同、随需计算的算力资源池，并在工业和信息化部统一规划部署下，积极探索新型互联网交换中心在上海临港试点；推进长三角区域的网络扁平化、服务一体化。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">此外，在网络信息安全方面，发挥运营商云网优势，提升全市网络安全防护水平、构筑政企客户网信安全底座。十四五期间，中国电信将组建不少于500人的专业团队，在政府部门指导下，当好全市网信安全服务保障主力军，对上海全市重要产业经济和城市运行领域的网络安全防护水平进行一次大提升：一方面将网信安全融入到云网基础业务中，向政企客户普遍提供内含主动安全防护的一体化云网服务；另一方面，深入政企客户的应用场景，提供网信安领域的咨询、诊断、部署、优化的一揽子服务。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">中国电信成立于2002年，目前是中国领先的大型全业务综合智能信息服务运营商，也是全球最大的4G、光纤宽带、IPTV和固定电话运营商。接应国家“网络强国”、“数字中国”战略，顺应信息通信行业的技术变革趋势，中国电信正积极以5G和云为核心打造新型信息基础设施，推动云网融合转型与数字化转型战略落地。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">中国电信上海公司（“上海电信”）作为中国电信的省级分公司，始终牢记央企责任，坚持将网络强国、数字中国战略与上海城市发展相结合，将推动企业经营发展与践行社会责任相融合，积极承担上海信息化建设主力军责任。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">截至2021年6月底，上海电信在上海地区的千兆光网端口数超千万个，覆盖全市家庭、产业园区、商务楼宇；投入使用的5G基站已经超过1.6万个，基本覆盖全市城区和街镇；互联网国际出口带宽超过4T；互联网数据中心（IDC）机架数超过6万个，是全市最大IDC运营商；通过“连接+算力+平台+应用”的服务模式，在线服务客户数超过2500万户。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">伴随“十四五”战略合作的开启，上海电信将全面融入城市数字化转型，恪守“以客户为中心”的发展理念，以科技创新为第一动能，以市场活力、组织活力为两大抓手，打造“服务型、科技型、安全型”三大企业硬实力，构建“学习型、平台型、共创型”三大企业软实力，支撑企业持续又快又好发展, 在上海建设具有世界影响力的国际数字之都的进程中，展现更大担当，作出更大贡献。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">与上海市政府签约深化战略合作，对企业更好服务国家战略、助力城市发展具有重要意义。中国电信将加大在沪发展力度，与上海市政府携手努力，全面推进城市数字化转型，建设具有世界影响力的国际数字之都，不断满足人民群众对美好数字生活的向往。</span></p>\r\n</div></div></p>', 29, 131, '0', '2', 78, 55, 0, 0, 9, 29, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000030, '流量套餐相关问题大全', 7, '2022-01-10 10:03:58', '2022-03-12 19:44:18', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"text-align: center; \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><img src=\"./W020210820549401912531.jpg\" style=\"border-width: 0px;\" alt=\"\" oldsrc=\"W020210820549401912531.jpg\" /><br />\r\n</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信迎来资本市场重要时刻，2021年8月20日，中国电信（股票代码：601728）正式在上交所主板挂牌上市，截止午间休盘涨超18%，报收5.39元/股，市值突破4174亿元。自此，中国电信正式实现“A+H”境内外资本市场的全布局。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>年营收超3,000亿，2021年上半年业绩表现亮眼</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">公开资料显示，中国电信成立于2002年，是中国领先的大型全业务综合智能信息服务运营商。目前，在三大运营商中，中国电信也是唯一一家连续三年实现移动用户净流入的企业。伴随着运营商行业整体回暖，以及中国电信5G、产业数字化业务的业绩释放，2021年上半年，中国电信再续佳绩，营收和净利润增幅均超两位数，分别同比增长13.1%、27.2%。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">多家研究机构对中国电信未来的业绩增长持积极乐观态度，纷纷出具“买入”评级研究报告。第一上海证券预计2021年-2023年，中国电信将实现净利润265亿元、279亿元、289亿元。华安证券在研报中称，中国电信是以历史最佳姿态回归A股，预计2021年公司的财务指标或将处于过去5年来最好水平。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">值得一提的是，得益于云网融合战略和5G应用发展，中国电信近几年的创新业务迸发出了极强的发展活力，其中又以产业数字化表现最为亮眼。数据显示，今年上半年，中国电信产业数字化业务收入达到501亿元，同比增长16.8%；5G应用场景较2020年底增长近一倍；云业务方面，上半年天翼云收入达到140亿元，仅上半年业绩就超去年全年，在运营商行业中持续领先。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>有效申购倍数超100倍，受到资本市场热烈追捧</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">作为今年以来首家回A上市的大型央企，中国电信受到了资本市场的热烈追捧。询价阶段，超2000家投资者参与中国电信询价，创下近年来大型主板IPO项目数量之最。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在业绩增速再创新高，叠加行业广阔的发展空间打开的背景下，中国电信在申购阶段的有效申购倍数超100倍，市场投资者用真金白银给中国电信的投资价值投出了“信任票”。专业人士分析称，中国电信各板块业务发展快速，业绩也在稳步增长，同时公司还提高了股息率，预计上市后会有一个比较好的投资回报。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>引入20家战投，配售超200亿元</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在战投方面，中国电信此次共引入20家战略投资者，包括大型央企、产业基金，以及知名互联网企业等，主要围绕中国电信所处行业应用场景及重点业务区域展开，基本覆盖了其产业链上下游的核心合作方。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">根据中国电信披露的战略配售结果，20家战略投资者中，既有国家电网、国家能源、国投集团、一汽集团、中国电子、中国电科等大型中央企业，也有中国诚通、中国国新、中非基金、集成电路基金等产业基金，还包括北京、上海、苏州、深圳、成都等地的地方产业基金，以及东方明珠、华为、安恒信息、深信服、哔哩哔哩在内的知名互联网及民营企业。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">本次发行中20家战略投资者累计获配数量为51.83亿股，按中国电信4.53元的发行价计算，战略配售总额为234.80亿元。根据锁定期安排，除东方明珠、华为、安恒信息、深信服、哔哩哔哩所持股份为36个月的锁定期以外，其余战配对象所持股份均为12个月锁定期。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">市场人士分析称，中国电信此次引入的20家战略投资者，除了围绕产业链上下游布局，还在地域上做了一定选择。如引入的北京、上海、苏州、深圳、成都等地方产业基金，均是我国经济发展的四大核心区域，也是中国电信开展产业数字化业务的核心区域。因此，引入这些地方产业基金，可以进一步巩固中国电信在全地域全业务发展的优势。</span></p>\r\n</div></div></p>', 30, 689, '0', '2', 95, 78, 0, 1, 1, 30, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000031, '智慧生活相关问题大全', 7, '2022-01-10 08:34:55', '2022-05-01 19:44:55', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">定了，中国电信公告称，公司股票将于今日（8月20日）在上海证券交易所上市。发行价格为4.53元，股票代码“601728”。若全额行使本次A股发行超额配售选择权，中国电信本次发行募集资金净额为537.27亿元。</span></p>\r\n<p><span style=\"\">常规的5G网络建设之外，在中国电信招股书中，有761处提及“安全”二字，包括做优做强安全服务，基于运营商网络安全优势，打造“云网端一体化”的安全能力等，多次强调要“夯实网络和信息安全底座”。</span></p>\r\n<p><span style=\"\">值得注意的是，8月18日中国移动（00941，HK）公告，移动也将在A股IPO。公告显示，中国移动拟公开发行不超过9.65亿股A股股份，募集资金将围绕“新基建、新要素、新动能”展开。中国移动此次募资金额或达560亿元，若以此计算，将超过同行中国电信，成为近10年来A股最大IPO。</span></p>\r\n<p><span style=\"\"><b>募投项目涉及量子通信</b></span></p>\r\n<p><span style=\"\">中国电信此次A股募集资金投向“5G产业互联网建设项目”“云网融合新型信息基础设施项目”“科技创新研发项目”，均提出了安全可信、安全融合等目标。</span></p>\r\n<p><span style=\"\">其中，中国电信对于量子保密通信显得尤为关注。中国电信在招股书中明确表示，将“密切跟踪量子信息的研究进展，探索量子信息与现有通信系统相结合的应用方案”。根据计划，中国电信将于2021年4月~12月研发内容为研究经典与量子共纤传输关键技术，研究量子密钥分发与语音通话、视频云会议等重点应用相结合的方案；2022年研发内容为研究星地一体化广域网、量子安全综合服务平台等技术架构，拓展量子安全产品解决方案；2023年研发内容为研究超长距量子密钥分发关键技术，研究量子保密通信设备小型化、量子与经典设备集成方案并制定相关标准。</span></p>\r\n<p><span style=\"\">一位量子通信行业人士向《每日经济新闻(博客,微博)》记者分析，中国电信的量子战略与目前国内广域量子通信网络的发展路线相契合，具体为通过光纤实现城域量子通信网络、通过中继器实现邻近两个城市之间的连接、通过卫星平台的中转实现遥远区域之间的连接。</span></p>\r\n<p><span style=\"\">实际上，作为最早践行“网络强国”战略的央企之一，中国电信在量子信息领域早已布局。2015年，中国电信就与国内国盾量子共同参与了上海“陆家嘴(600663,股吧)金融量子保密通信应用示范网”的建设。此外，去年11月，中国电信还有与国盾量子联合发布“量子铸盾行动”。具体为，中国电信将率先为10个城市的公共安全提供“量子安全云”，为100个城市提供量子安全组网方案，为10000个政企客户提供量子安全加密解决方案，为1000万移动终端用户提供量子安全通话服务。</span></p>\r\n<p><span style=\"\"><b>明确夯实网络安全底座</b></span></p>\r\n<p><span style=\"\">量子通信保障安全之外，中国电信的安全业务还建设覆盖“云、网、边、端、应用”的融合安全技术能力，面向政企客户提供DDoS攻击防护、网站安全、域名安全、反钓鱼、安全邮箱、Sim盾、安全服务平台、安全众测等安全服务。</span></p>\r\n<p><span style=\"\">目前我国数字化水平持续提升，也加大了网络攻击的安全风险，社会对网络安全的需求与日俱增。在业内人士看来，在市场竞争进一步加剧的情况下，高技术含量、高附加值的安全产品与服务，有望成为电信运营商业务的新增长点。</span></p>\r\n<p><span style=\"\">不论从市场拓展还是战略政策角度考虑，加强网络安全建设都是中国电信未来必不可少的重点之一，夯实网络和信息安全底座。政策方面，据不完全统计，从2016年起，国家出台的关于网络安全行业相关政策法规网络安全法律法规及标准就达到近30项，推进进程持续提速。</span></p>\r\n<p><span style=\"\">今年7月，工信部发布《网络安全产业高质量发展三年行动计划（2021~2023年）（征求意见稿）》。要求电信等重点行业网络安全投入占信息化投入比例达10%；并点名加强量子通信、卫星互联网等领域安全技术攻关，发展创新安全技术。8月，国务院公布《关键信息基础设施安全保护条例》，自2021年9月1日起施行。</span></p>\r\n<p><span style=\"\">值得一提的是，中国电信还提到要构建资本合作生态，强化资本在城市安全等关键领域、量子安全等关键技术的布局，完善产业生态。近期中国电信公布的战略配售结果显示，其引入的20家战略投资者中包括深信服(300454,股吧)、安恒信息等网络安全企业。</span></p>\r\n</div></div></p>', 31, 433, '0', '2', 56, 5, 0, 0, 2, 31, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000032, '自助服务相关问题大全', 2, '2022-01-10 08:34:50', '2022-06-21 19:45:24', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">中国电信股份有限公司8月10日在香港公布2021年中期业绩。2021年上半年，中国电信以A股上市为契机，进一步全方位推进“云改数转”战略，发展步入快车道，收入和利润实现双位数增长，盈利能力持续改善，经营业绩再攀新高。</span></p>\r\n<p><span style=\" \"><b>收入利润双位数增长高质量发展成效显现</b></span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">2021年上半年，中国电信经营收入为2192亿元，同比增长13.1%；服务收入为2035亿元，同比增长8.8%，高于行业平均增幅。EBITDA为663亿元，同比增长5.1%。净利润为177亿元，同比增长27.2%，剔除出售附属公司的一次性税后收益后，同比增长17.0%，每股基本净利润为0.219元。资本开支为270亿元，自由现金流达到268亿元。董事会决定，2021年度以现金方式分配的利润不少于该年度股东应占利润的60%，A股发行上市后三年内，每年以现金方式分配的利润逐步提升至当年股东应占利润的70%以上。同时，自2022年起宣派中期股息。</span></p>\r\n<p><span style=\" \"><b>5G﹢云网构建差异化综合智能信息服务优势</b></span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">2021年上半年，中国电信积极拥抱数字化转型机遇，以创新、融合、安全构建差异化的综合智能信息服务优势，全方位再创经营佳绩。</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">中国电信以5G为引领，持续深化共建共享。上半年，中国电信移动通信服务收入达到933亿元，同比增长6.9%；移动用户达到3.62亿户，净增1147万户，5G套餐用户达到1.31亿户，渗透率达到36.2%，继续领先行业平均水平。5G特色应用用户快速增长，用户升级5G保持良好价值增长，移动用户ARPU止跌并持续回升，达到45.7元，同比增长2.9%，增幅较一季度进一步提升。</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">中国电信基于云网融合能力，打造5G﹢光宽﹢WiFi 6的“三千兆”高质量泛连接服务。上半年，中国电信固网及智慧家庭服务收入达到574亿元，同比增长5.2%，有线宽带用户达到1.64亿户，宽带接入收入达到381亿元，同比增幅达到7.9%，宽带接入ARPU保持回升势头，达到39.4元，同比增长2.9%。智慧家庭收入达到72亿元，同比增长32.9%，全屋WiFi、天翼看家用户分别较去年同期增长99.5%和231.9%，智家平台纳管的家庭终端数已达到2.7亿，同比增长78.1%，宽带综合ARPU达到46.8元，同比增长5.9%。</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">中国电信发挥云网融合优势和产业数字化领域的丰富储备，打造数字化应用平台。上半年，中国电信行业云、IDC、组网专线、物联网、数字化平台和大数据等业务加速增长，收入达到501亿元，同比增长16.8%。5G政企应用步入收获期，5G应用场景较2020年底增长近1倍，市场需求呈现爆发式增长。天翼云优势全方位强化，成为网络强国和数字中国的重要基石。上半年，天翼云收入达到140亿元，同比增幅达到109.3%。</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">以A股上市为契机将“云改数转”战略推向纵深中国电信将以A股上市为契机，加大实施市场化约束激励机制，利用资本和生态的力量，进一步整合云网、用户、人才等资源；加强生态合作，强化战略协同，共同做大生态圈；优化组织、队伍、流程，提升运营服务能力；将资本市场和客户市场紧密结合，释放发展动能；推动改革走向纵深，推进绿色发展，全力打造新发展空间。</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">中国电信董事长柯瑞文指出，今年是“十四五”开局之年，中国数字经济蓬勃发展，中国电信将继续把握新发展阶段，贯彻新发展理念，构建新发展格局，紧抓当前重要战略机遇期，努力转变发展和增长方式，打造服务型、科技型和安全型企业。中国电信将以A股上市为契机，将“云改数转”战略推向纵深，以客户为中心拓展综合智能信息服务，推进关键技术突破和新一代技术储备，打造科技创新核心能力，构建绿色低碳的云网融合新型信息基础设施，以数字化平台赋能千行百业绿色发展，引入与中国电信具有协同效应的战略投资人，构建强强联合、开放合作的产业和资本生态，改革体制机制，激发企业活力和内生动力，筑牢网络和信息安全底座，努力构建数字经济发展基石，助力网络强国、数字中国建设，维护网信安全，推进乡村振兴，为客户创造美好数字生活，与股东共享高质量发展成果。</span></p>\r\n</div></div></p>', 32, 251, '0', '2', 88, 7, 0, 0, 3, 32, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000033, '热销推荐相关问题大全', 4, '2022-01-10 08:34:50', '2022-07-30 19:45:57', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\" \">在日前由中国电信主办的2021政法智能化建设技术装备及成果展——科技法治建设峰会上，中国电信发布涵盖法院大数据、5G互联网法院、公共法律服务云等多个领域智能化场景应用及解决方案的“智慧法治护航计划”，全面助力法治中国建设。</span></p>\r\n<p><span style=\" \">在法院大数据方面，通过混合云﹢大数据平台，实现纵向跨四级法院、横向跨外部单位、内部跨业务系统的数据共享交换体系，促进业务协同、数据互通。在5G互联网法院方面，充分发挥中国电信5G短消息即点即用、无须安装的特点，与法院业务整合，在立、审、执等各环节提供轻移动端、全面覆盖、组件化服务。在检务大数据方面，整合检察机关内外部相关系统及数据，实现内部外部数据互通及共享，复杂报表报告一键生成；基于数据分析研判，提供全业务的办案辅助支撑、全要素的管理决策支撑。在公共法律服务云方面，面对群众提供智能咨询、视频咨询、在线业务办理、司法信息查询等服务功能，打通公共法律服务“最后一公里”。面向中小企业提供多元化、一对一服务，帮助企业防范法律风险、维护合法权益。在移动检务方面，通过部级集约平台实现“覆盖全国、统筹利用、统一接入、共享开放”，在充分考虑业务实际应用及系统安全下，实现检务工作移动化、无纸化、可视化。</span></p>\r\n<p><span style=\" \">此外，中国电信充分发挥自身云网融合优势，聚焦远程提审、公益诉讼、智慧矫正、智慧监狱等领域，推动法治工作数字化、网络化、智能化，全面提高综合治理效率。</span></p>\r\n<p><span style=\" \">据介绍，中国电信已逐步形成智慧法院、智慧检务、智慧司法专属智能应用生态圈，面向法院、检察院、司法行政机关各业务场景提供智能化应用建设能力，建设标准统一、整体联动、业务协同、信息共享的法治信息化体系。</span></p>\r\n</div></div></p>', 33, 480, '0', '2', 144, 8, 0, 0, 3, 33, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000034, '客服服务相关问题大全', 2, '2022-01-10 08:34:52', '2022-03-18 19:46:30', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">为保障江苏全省核酸检测工作稳步、迅速开展，中国电信天翼云协助江苏省卫健委搭建全新的省级核酸检测平台，每秒查询速度可达100万条，大大提升了平台的数据处理能力。截至8月3日14时，该平台核酸检测查询已达260万余次。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">目前，由南京禄口国际机场外溢的新冠肺炎疫情感染链仍在延长，牵动着全国人民的心。面对此次来势汹汹的疫情，南京市目前已完成三轮核酸检测，共计产生2700万人次的检测结果。接下来，南京市将继续迎来第四轮核酸检测工作，扬州、淮安、宿迁等地将迎来第二次全民筛查。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">时有所需，必有所为。面对疫情，中国电信立即做出反应，争分夺秒彰显央企使命，全面响应江苏疫情防控战。7月30日，天翼云协助江苏省卫健委搭建全新的省级核酸检测平台。该平台承载全省“苏康码”、“我的南京”及省级和十三个地市平台的调用需求，包括核酸检测结果的查询需求及重要防疫信息发布等，为江苏全省疫情防控提供有力保障。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">8月1日下午，该核酸检测结果查询平台已顺利完成压力测试，并于当日24时正式上线，用于满足全省8000余万人口的查询需求。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">此次，天翼云根据核酸检测信息查询的动态需求，弹性扩展，目前网络带宽为1G，未来根据需要扩展至2G，同时采用SCDN技术，实现百万级信息量查询，使系统处理能力大大提升，为市民提供更快速的查询服务。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">除此之外，依托中国电信高速、稳定的5G网络和天翼云的云直播技术，南京核酸检测点云直播平台顺利搭建完成并投入使用，南京市民可以随时随地查看核酸检测点的人流情况，合理选择核酸检测时间段，避免由人员大量聚集引发的风险。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">“我们曾经经过的还不是最艰难的，更艰难的是需要长期与病毒共存的智慧。”如今，当疫情防控成为一场持久战，天翼云将继续以科技力量铸就“抗疫利剑”，以央企担当，保障人民生命安全。</span></p>\r\n</div></div></p>', 34, 355, '0', '2', 222, 7, 1, 0, 4, 34, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000035, '增值服务相关问题大全', 7, '2022-01-10 08:34:50', '2022-07-01 19:47:13', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">8月2日消息，超过2</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">000</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">个项目入围第四届“绽放杯”5G应用征集大赛工业互联网、数字治理、医疗健康三大赛道。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">由工业和信息化部主办的第四届“绽放杯”5G应用征集大赛于5月1</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">6</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">日启动项目征集，并于7月2</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">5</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">日结束征集。本届大赛中，由中国电信承办的工业互联网、数字治理、医疗健康三大赛道在两个月间共征集项目2000余个，其中，工业互联网、数字治理两大专题赛征集项目数量均超600个；中国信息通信研究院与中国电信联合承办的医疗健康专题赛征集项目数量达600余个，各赛道均完成项目预期征集计划。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">自三大专题赛开赛以来，中国电信采取定向邀请、广泛吸纳的方式，征集全面覆盖各行业细分领域的应用案例，得到社会各界广泛支持，来自全国各地的参赛团队展现了5G技术与千行百业融合落地的风采。对于5G应用优秀项目与标杆案例的挖掘，有助于深度推进我国5G技术与工业互联网、数字治理、医疗健康领域的融合，有利于发挥5G技术对经济社会数字化、网络化、智能化转型的重要引擎作用，有利于驱动生产方式、生活方式和治理方式升级。 </span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>5G+工业互联网 开启“智”造新时代</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">工业互联网是5G商用的重要领域，发挥5G技术的高可靠、低延时、抗干扰和安全性等特性，升级工业生产场景，是推动工业制造向工业“智”造转变的关键一环，是行业转型升级的新机遇。随着我国制造业转型升级的持续推进，我国工业企业数字化转型受到越来越多的重视，在近日工信部等十部门联合印发的《5G应用“扬帆”行动计划（2021-2023年）》中，5G+工业互联网被列为行业融合应用深化行动之一。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">本届“绽放杯”杯征集大赛中，中国电信主办的工业互联网专题赛围绕 “加快产业创新，重塑发展格局” 主题展开，征集的600余个参赛项目，主要覆盖电子设备生产、装备制造、钢铁、采矿、电力等五大行业，涉及装备制造、石油石化、电力、矿山、钢铁、水泥、汽车、军工、医药、烟草、化工、电子、电器、工程机械、纺织等工业细分领域以及协同研发设计、远程设备操控、柔性生产制造等应用场景。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在往届“绽放杯”中，三一重工、华润水泥、吉利汽车、海螺水泥等一批优秀的“5G+工业互联网”落地项目脱颖而出，成为我国加快“5G+工业互联网”应用落地的标杆。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">相信此次大赛中，越来越多的5G价值场景、标杆项目将会涌现，推动产业数字化转型升级，切实助力工业行业各细分领域降本、提质、增效，赋能中国智造。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>5G+数字治理加快治理能力现代化</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">4G改变生活，5G改变社会。依托5G网络的广泛覆盖、社会治理的感知触角将广泛延伸、深度下沉的数据开始为有关部门“出谋划策”，促进形成科学化、精细化、智能化的治理能力。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">本届大赛的数字治理赛道中，中国电信以“数字赋能、智慧治理”为主题展开征集，共征集600余项目报名参赛，主要集中在社会治理、乡村治理、数字政府治理、城市治理、居民服务、交通治理等领域。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">随着数字技术发展和各类政策红利的助推，我国各类企业纷纷驶入数字治理赛道，落地众多“数治”项目。此次数字治理专题大赛，旨在充分利用5G、大数据、云计算等前沿技术，通过多样化创新“数智融合”凝聚社会治理产业的全新力量，优化管理手段、管理模式，创新管理理念，推进共建共治共享的社会治理格局逐步形成，助力全面实现社会治理现代化。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>5G+医疗健康描绘未来医疗景象</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">5G推动远程医疗的快速发展，打破时间、空间限制，提高公共服务供给数量和质量。尤其在疫情防控和复工复产方面，依托5G技术推出的远程诊疗、智能医护机器人等应用，发挥了重要作用。《5G应用“扬帆”行动计划（2021-2023年）》就明确，5G+智慧医疗作为社会民生服务行动之一，将为民生健康赋能。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">据了解，本届“绽放杯”医疗健康专题赛以“智绘医疗</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">•</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">智享健康”为主题，征集的600余个项目主要围绕5G对医疗健康赋能，涵盖应急救治、远程诊断、远程ICU、远程治疗、医院管理、中医诊疗、智能疾控、健康管理等八大领域，展现了5G+医疗健康的充分融合，为大众描绘了未来医疗的别样景象，以技术应用创新积极响应国家“健康中国2030”战略。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">通过本次大赛将充分发挥行业需求引领作用，推进5G技术在医疗健康领域的进一步融合创新发展，丰富5G技术在医疗健康行业的应用场景，加快培育医疗健康行业新场景新模式新业态，提升医疗健康服务质量和普惠水平。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">随着5G应用征集大赛结束征集，工业和信息化部、中国信息通信研究院、高校或研究机构专家以及行业头部企业客户将于8月开始对各专题赛的百余个项目，进行初步评审。此轮将评选出一批创新能力突出、应用效果优秀、市场前景可观的项目，进入8月底-9月初的决赛。决赛将采取现场展示和答辩的方式，入围项目单位或团队通过PPT或VCR的形式对参赛作品进行全方位展示、陈述，并回答评委提问等。评审专家将根据参赛项目展示和现场答辩情况进行评分，最终评选出一等奖，二等奖，三等奖及各专题赛特别设置的创新奖等。对于落地性强，商业价值高的优秀项目，中国电信还将推荐至第四届“绽放杯”全国总决赛。</span></p>\r\n<p><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">对于在各专题赛决赛中角出的优秀项目，中国电信将引入中国电信5G开放实验室（5G应用产业方阵创新中心）和中国电信5G联合创新中心，引入中国电信投资公司和中国电信5G产业创新联盟投资类成员伙伴，为其提供孵化培育，使各项目得到5G的充分赋能，让其努力成长为数字中国新力量，为经济社会全面进入数字化新时代作出更大贡献。</span></p>\r\n</div></div></p>', 35, 124, '0', '2', 54, 6, 0, 1, 5, 35, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000036, '业务相关问题大全', 1, '2022-01-10 08:34:52', '2022-03-19 19:47:49', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">日前，中国电信与山东重工在济南举行战略合作框架协议签约仪式。中国电信党组书记、董事长柯瑞文，山东重工党委书记、董事长谭旭光出席签约仪式并见证签约。中国电信政企信息服务事业群总经理上官亚非、中国重汽常务副总经理王勇代表双方签约。这是中国电信在产业数字化领域，继与美的集团、三一重工、中兴通讯、中建集团等各行业龙头企业开展深度战略合作后落地的又一项重大项目。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">根据协议，双方将共同推进高端装备制造领域的重点项目。中国电信将发挥自身在云网融合、5G和网信安全等方面的突出优势，聚焦构建精品云网、工业智能制造平台、行业网络安全体系、5G应用、基础设施建设等方面，与山东重工进行全面深入合作，推动企业数字化转型，共同树立工业互联网智能制造领域新的标杆典范！</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">目前，中国电信以客户需求为中心，发挥运营商“云、边、端”的协同优势，利用DICT方面集成+运营的优势，从IaaS、PaaS、SaaS三个层面全面发力，在战略合作协议涉及的重点方向上与客户展开全面合作，为客户提供IT基础设施上云和应用上云的综合解决方案，助力客户加快实现自身云化、加快数字化转型。</span></p>\r\n</div></div></p>', 36, 208, '0', '2', 101, 0, 0, 1, 6, 36, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000037, '流量相关问题大全', 9, '2022-01-10 08:34:46', '2022-04-23 19:48:28', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">日前，中国电信与山东重工在济南举行战略合作框架协议签约仪式。中国电信党组书记、董事长柯瑞文，山东重工党委书记、董事长谭旭光出席签约仪式并见证签约。中国电信政企信息服务事业群总经理上官亚非、中国重汽常务副总经理王勇代表双方签约。这是中国电信在产业数字化领域，继与美的集团、三一重工、中兴通讯、中建集团等各行业龙头企业开展深度战略合作后落地的又一项重大项目。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">根据协议，双方将共同推进高端装备制造领域的重点项目。中国电信将发挥自身在云网融合、5G和网信安全等方面的突出优势，聚焦构建精品云网、工业智能制造平台、行业网络安全体系、5G应用、基础设施建设等方面，与山东重工进行全面深入合作，推动企业数字化转型，共同树立工业互联网智能制造领域新的标杆典范！</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">目前，中国电信以客户需求为中心，发挥运营商“云、边、端”的协同优势，利用DICT方面集成+运营的优势，从IaaS、PaaS、SaaS三个层面全面发力，在战略合作协议涉及的重点方向上与客户展开全面合作，为客户提供IT基础设施上云和应用上云的综合解决方案，助力客户加快实现自身云化、加快数字化转型。</span></p>\r\n</div></div></p>', 37, 63, '0', '2', 30, 2, 0, 0, 7, 37, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000038, '话费相关问题大全', 2, '2022-01-10 08:34:52', '2022-05-01 19:48:53', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">日前，中国电信与山东重工在济南举行战略合作框架协议签约仪式。中国电信党组书记、董事长柯瑞文，山东重工党委书记、董事长谭旭光出席签约仪式并见证签约。中国电信政企信息服务事业群总经理上官亚非、中国重汽常务副总经理王勇代表双方签约。这是中国电信在产业数字化领域，继与美的集团、三一重工、中兴通讯、中建集团等各行业龙头企业开展深度战略合作后落地的又一项重大项目。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">根据协议，双方将共同推进高端装备制造领域的重点项目。中国电信将发挥自身在云网融合、5G和网信安全等方面的突出优势，聚焦构建精品云网、工业智能制造平台、行业网络安全体系、5G应用、基础设施建设等方面，与山东重工进行全面深入合作，推动企业数字化转型，共同树立工业互联网智能制造领域新的标杆典范！</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">目前，中国电信以客户需求为中心，发挥运营商“云、边、端”的协同优势，利用DICT方面集成+运营的优势，从IaaS、PaaS、SaaS三个层面全面发力，在战略合作协议涉及的重点方向上与客户展开全面合作，为客户提供IT基础设施上云和应用上云的综合解决方案，助力客户加快实现自身云化、加快数字化转型。</span></p>\r\n</div></div></p>', 38, 93, '0', '2', 71, 70, 0, 0, 8, 38, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000039, '装维相关问题大全', 1, '2022-01-10 08:34:49', '2022-03-01 19:49:29', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">日前，国务院国资委公布了国有重点企业管理标杆创建行动标杆企业、标杆项目和标杆模式名单，中国电信安徽分公司、四川分公司被评为“国有重点企业管理标杆创建行动标杆企业”，中国电信集团公司基于“六力模型”的智能客服管理、大数据财务风险防控体系项目被评为“国有重点企业管理标杆创建行动标杆项目”。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信“基于‘六力模型’的智能客服管理”是围绕价值创造力、技术竞争力、自主可控力、感知引领力、应用创新力、专业运营力打造智能客服六力模型，持续开展行业对标，长长板、补短板。目前中国电信智能化服务规模、用户服务满意度水平等方面均达到行业领先水平，形成了覆盖服务前、中、后全流程的业务服务体系，实现31省10000热线上线应用，并全部开放全语音门户，智能服务年调用量超过80亿次。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">长期以来，中国电信经营业绩处于行业领先水平，管理体系健全，管理方法和手段科学有效，管理信息化水平高，示范带动作用强。中国电信高度重视对标国有重点企业管理标杆创建行动，将其作为提升管理现代化水平、实现管理增效、推动“十四五”规划落地的关键抓手，标杆企业、标杆项目的打造是以点带面推动全集团从上至下进一步提升运营管理能力的重要手段。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">“大数据财务风险防控体系”则是基于中国电信集团MSS/BSS/OSS系统，在数据挖掘中融入机器学习算法和数据训练等智能手段，对资金、资产、预算、成本、税务、效能等生产经营数据及流程数据，进行交叉扫描和智能化多维度分析，智慧识别存在的风险点，精准定位到责任单位，自动派单到相关责任人，实现了中国电信集团全级次、全流程风险预警防控，构建了“风险问题发现-问题核查整改-风险预警解除”风险闭环管理流程，形成了“以事先防范和过程控制为主，事后补救为辅”的风险管控体系。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">党的十九届五中全会提出，要加快构建以国内大循环为主体、国内国际双循环相互促进的新发展格局。加强合规管理是国企在构建新发展格局过程中发挥示范引领作用的必然要求。近年来，中国电信一直致力于完善风控体系建设，通过清单指引等强化重点领域合规管理，加强与审计、财务、网信、内控、纪检监察、市场等部门协同，完善合规评估标准。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">国有重点企业管理标杆创建行动是国务院国资委按照对标世界一流管理提升行动总体安排，分层分类总结提炼管理提升成功经验，打造管理提升样板和尖兵的重要举措。经综合比选、专家评审、征求意见等环节，遴选出管理提升标杆企业200家、标杆项目100个、标杆模式10个。中国电信两家分公司和两个项目成功入选是对中国电信运营管理能力和风险防控水平的高度认可。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">下一步，中国电信将扎实推进“云改数转”的战略部署，切实发挥标杆示范带头作用，持续加强管理能力和风控体系建设，为中国电信加快打造并充分展示新时代国有企业管理水平的优秀品牌，建成世界一流企业贡献力量。</span></p>\r\n</div></div></p>', 39, 2, '0', '2', 0, 0, 0, 0, 6, 39, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000040, '老用户相关问题大全', 2, '2022-01-10 08:34:49', '2022-03-31 19:50:01', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">连日来，暴雨袭城，造成郑州阜外华中心血管医院和郑州西30公里处的巩义市经济重镇——米河镇通讯中断，中国电信应急通信神器——系留无人机空中应急基站紧急升空。7月23日18时，米河镇通信恢复；７月24日13:30，郑州阜外华中心血管医院通信恢复。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>中国电信无人机助河南灾区恢复通讯</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在河南发生特大暴雨灾害后，中国电信立即启动“战区保障机制”，组织应急通信车辆、装备、人员时刻待命。灾情就是命令，作为国家一类应急通信专业保障队伍，湖北机动通信局在接到集团公司调度命令后立刻出发，全力支援河南防汛通信保障工作。7月22日23时，湖北机动通信局第二梯队11名突击队员携带系留式无人机基站、背负式基站等23台/套应急装备抵达郑州市。通信保障突击队第二梯队到达米河镇后，迅速利用</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Ka</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">卫星便携站开通系留式空中无人机基站，覆盖范围达50平方公里，使米河镇灾区的通信全面恢复。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">携系留无人机空中平台奔赴河南郑州的还有西安机动通信局应急分队。24日，该分队郑州油机支援组完成重要客户开通4G基站任务后，接到河南电信指挥部紧急通知：郑州阜外华中心血管医院受灾严重，医院一楼已经被完全淹没。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">接到通知后，支援队紧急赶往指令地点，12时20分到达郑州阜外华中心血管医院。因医院涉水严重，无法正常保障电力，支援队员第一时间通知指挥部派遣发电车保障电力通畅。13点30分，支援队伍通过系留式无人机、</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">K</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">a便携小站接通通信信号，完成基站开通。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>系留无人机空中基站应急通信优势明显</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">系留无人机作为应急通信基站，具有快速部署、轻便灵活、起降环境要求低等特点，能实现几十公里范围内快速、可靠、廉价的宽带通信，在突发自然灾害、通信基础设施受到破坏、通信环境恶劣等条件下，其应急通信能力优势明显。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">据了解，中国电信研发的系留无人机净载荷15kg，最大飞行高度为 200m，挂载4G/5G基站类设备，可24 小时不间断空中悬停作业，形成高空基站解决方案，为方圆50平方公里范围内的用户提供语音、数据服务。在小区，其滞空高度为30-200米，覆盖距离为2至20公里，能不间断飞行7×24小时，最高可同时保障800个用户，卫星基站上传最大速率30M，下载最大速率50M。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>应急通讯神器 防灾救灾屡屡显身手</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">近年来，中国电信系留式无人机空中平台不断在防灾救灾和应急演练大显身手。早在2017年6月，中国电信浙江公司就与北京卓翼智能科技有限公司共同完成了系留无人机在电信应急通信行业中的应用测试，效果卓越。同年8月，中国电信举办2017国防交通战备“天翼神剑”抗震救灾应急通信演练，更被外界视为系留式无人机高空基站应急通信的市场化和普及化。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在国家级新区雄安，2018年11月，中国电信河北公司在雄安新区开展抢险救灾应急通信演练，系留无人机完美地满足了河北电信在雄安新区应急高空基站通信预案的制定要求。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">2020年7月21日，湖北省恩施市屯堡乡马者村因山体滑坡淤塞清江发生堰塞湖险情，严重威胁下游屯堡乡及恩施州城区清江沿线群众生命财产安全，中国电信系留式无人机参与湖北恩施防汛通信保障，为恩施州屯堡乡马者村指挥部提供了通信保障。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">暴雨倾盆天如漏，紧急驰援如身受。现代科技无人机，快速精准全天候。驰援河南，从天通一号到系留式无人机空中平台，中国电信“全方位、立体式、天地一体、灵活机动”的强大应急通信保障能力和应急通信铁军的责任和担当一次次得到彰显。</span></p>\r\n</div></div></p>', 40, 3, '0', '2', 0, 0, 0, 0, 3, 40, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000041, '如何查询费用', 1, '2022-01-10 08:34:48', '2022-07-20 19:50:34', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">7月23日，2021中国电信终端评测发布会在线上召开。发布会由中国电信移动终端研究测试中心主办，以“翼矩·洞察”为主题，发布了两大CTTTC终端技术认证、三大自主创新翼矩终端测试系统和2021年第一期《终端洞察报告》，全方位展示中国电信创新性5G终端测试系统和专业化评测成果，共同探讨5G终端、AI终端、云终端新技术趋势，以及终端适老化等热点问题。</span></p>\r\n<p><span style=\"\">中国电信股份有限公司研究院副院长蔡康表示，当前处在新技术快速迭代与多技术跨域融合的时期，期待产业创新合作面向更广泛的技术领域与基础技术环节，合作模式上更灵活、更深入，联合攻关解决一系列关键技术难题与“卡脖子”问题。在终端评测领域，进一步加强测试技术与标准创新合作、测试系统联合研发，提升终端评测洞察深度与广度，向业界开放提供多专业融合、云网端一体的研发试验环境，为联合创新提供强有力的保障。</span></p>\r\n<p><span style=\"\">CTTTC是中国电信面向产业合作伙伴的终端技术认证体系，对符合中国电信终端技术要求与规范的产品、系统与实验室颁发认证证书，共同推动终端新技术的成熟商用，协同提升终端产品体验。会上，中国电信为通过测试认证的5G终端芯片和5G终端测试系统，颁发CTTTC终端芯片技术认证证书和CTTTC终端测试系统技术认证证书。未来，中国电信将与产业链伙伴共同推动终端新技术成熟商用，协同提升终端产品体验，构建高效的终端技术认证体系。</span></p>\r\n</div></div></p>', 1, 1, '0', '2', 0, 0, 0, 0, 6, 41, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000042, '话费余额查询方式', 4, '2022-01-10 08:34:54', '2022-04-29 19:51:03', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">“这次暴雨给医院正常运行造成极大影响，医院上万人转移协调难度大，常规联系方式失灵，中国电信天通卫星手机关键时刻功不可没。”郑大一附院副院长苟建军对应急通信神器忍不住点赞。</span></p>\r\n<p><span style=\"\">受持续强降雨影响，河南省郑州市单日降雨量突破历史极值，这场强降雨造成郑大一附院河医院区全部断电，且面临断水、断网、断药以及断粮的局面，几十台手术被迫中断，ICU里600多名病人失去设备支持，普通病房大量病人输氧告急。转移，成为没有选择的选择。中国电信河南公司在郑大一附院河医院区紧急开通天通卫星业务，全力保障医院转移调度卫星通话畅通，为及时安全转移11350名患者发挥了重要作用。</span></p>\r\n<p><span style=\"\">在这场与时间赛跑的救援中，中国电信抽调精兵强将组成的通信应急保障小分队携带100部天通卫星电话驰援河南灾区。据了解，卫星通信是利用地球同步卫星作为中继而进行的无线通信，是未来全球信息高速公路的重要组成部分，天通一号卫星系统定位于窄带移动卫星通信系统，具有覆盖广、通信距离远、不受地理环境限制等优点，无论是高原、深山还是海洋湖泊、戈壁荒滩，只要能看到天空的地方，都能搜到天通卫星信号，成为救灾应急通信保障和特殊环境通信使用的首选通信产品。</span></p>\r\n<p><span style=\"\">天通卫星移动通信系统是我国自主建设的首个卫星移动通信系统，摆脱了长期对国外卫星移动通信服务的依赖，填补了国内自主卫星移动通信系统的空白。中国电信是天通卫星通信唯一运营服务商，使用1740号段的手机号码作为业务号码，已经实现与国内外通信运营商通信网络的互联互通，为用户提供全天候、全天时、稳定可靠的移动通信服务，这次驰援河南成功实现天地一体的应急通信调度。</span></p>\r\n<p><span style=\"\">实际上，自2018年3月中国电信开展天通卫星业务试商用以来，已为水利、消防、林业、地质、武警、电力、海洋渔业等多个行业客户提供了通信服务，满足了客户在工作、生产中的通信保障需求。天通卫星通信服务与移动通信系统形成性能互补，从而实现海陆空地区全覆盖。作为“陆地有光纤、水下有海缆、空中有移动、天上有卫星”陆海空天一体化的电信运营商，中国电信在危急关头勇担央企责任，冲锋在前，将一批批通信信息“硬核”黑科技投入战斗中，为汛情监测、减灾救灾和城市建设插上“科技之翼”，在应急通信保障任务中发挥中坚力量。</span></p>\r\n</div></div></p>', 2, 4, '0', '2', 1, 0, 0, 0, 3, 42, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000043, '\r\n如何快速查询余额变动明细', 1, '2022-01-10 08:34:51', '2022-08-30 19:51:29', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">7月22日，中国电信发布公告称，中国证监会发行审核委员会当日审核并通过中国电信A股发行申请。</span></p>\r\n<p><span style=\"\">今年3月9日下午，中国电信在港交所发布公告称，拟申请本次A股发行并在上海证券交易所主板上市。公告显示，此次中国电信拟公开发行A股的数量不超过120.93亿股。</span></p>\r\n<p><span style=\"\">对回归A股的原因，中国电信在此前的公告中表示，一是把握数字化发展机遇，推动“云改数转”战略落地；二是拓宽融资渠道，增强可持续发展能力；三是完善公司治理，提升综合竞争实力。</span></p>\r\n<p><span style=\"\">据悉，本次募集资金净额拟用于5G产业互联网建设项目、云网融合新型信息基础设施项目及科技创新研发项目，未来三年总投资规模为1021亿元。</span></p>\r\n<p><span style=\"\">据介绍，通过深入实施“云改数转”战略和本次A股上市，中国电信将全面提升公司竞争力、创新力、控制力、影响力和抗风险能力，全力打造服务型、科技型、安全型企业。展望未来三年，中国电信的科技创新能力和人才创新活力明显增强，产业数字化拓展能力显著提升，业务结构进一步优化，产业数字化收入占比逐年提高。战略性新兴产业细分领域的布局进一步强化，发展模式与增长方式得到有效转变，经营收入稳定增长，收入利润率稳步提升，企业价值得到新提升。</span></p>\r\n</div></div></p>', 3, 3258, '0', '2', 0, 0, 0, 0, 2, 43, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000044, '本月账单查询', 7, '2022-01-10 08:34:54', '2022-07-01 19:52:16', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">7月16日，中国电信与华为和众多合作伙伴，共同发布了业界首个运营商5G融合应用开放实验室（5G OpenLab）。该实验室将为5G赋能千行百业提供测试验证平台，服务行业合作伙伴基于该平台进行验证、开发创新，将成为各领域行业解决方案的孵化器和赋能中心。</span></p>\r\n<p><span style=\"\">中国电信副总经理刘桂清表示，本次中国电信在业内首次成立5G融合应用开放实验室并与华为成立联合实验室，旨在推动5G产业生态格局的繁荣，是中国电信5G发展战略的重大布局。中国电信将以5G融合应用开放实验室为依托，一方面进行具有自主核心技术的5G定制网产品和解决方案的仿真验证及开展6G等未来网络领域的探索，另一方面将不断深化与行业伙伴的合作，共建融合、开放、共赢的产业新生态，不断提升5G产业现代化水平，为推动国家产业数字化转型贡献力量。</span></p>\r\n<p><span style=\"\">中国电信集团政企信息服务事业群总经理上官亚非透露，中国电信5G定制网已精准覆盖1600多家政企头部客户，为4500多家客户提供5G定制能力，落地超过360个定制网商用项目。此次发布的5G融合应用开放实验室，是中国电信5G定制网整体合作生态规划的重要一环，通过建设、运营5G应用端到端集成测试验证实验室，将为合作伙伴提供一个开放、创新的实体支撑中心，聚合各方能力与资源，共同为千行百业提供各类场景化解决方案。</span></p>\r\n<p><span style=\"\">据中国电信研究院副院长陈运清介绍，中国电信已建设“5G﹢云﹢AI”测试验证平台，实现了一期5G、天翼云、MEC、行业AI应用、PLC、工业机械臂、AGV等典型工业场景落地。中国电信后续将规划建设系列分中心，包括上海生态分中心、智慧煤矿分中心等。</span></p>\r\n<p><span style=\"\">自迈入5G时代以来，中国电信更加注重开放合作，构筑产业生态，赋能千行百业。2019年，中国电信5G产业创新联盟正式成立，截至目前，发展成员单位近300家，汇聚合作伙伴近千家。同时，中国电信创新性构建了中国电信5G产业创新联盟、5G 开放实验室、5G联合创新中心“1﹢1﹢1”联动发展模式，开展典型业务测试平台建设、行业应用标杆示范打造等工作。5G OpenLab是5G产业创新联盟面向合作伙伴打造的端到端的测试验证中心，是将中国电信5G﹢云网产品能力与合作伙伴能力进行整合和协同的赋能中心及创新平台。</span></p>\r\n<p><span style=\"\">相关专家表示，5G OpenLab的成立将加速5G技术与传统行业的融合，催生各种新应用、新模式、新业态，提升企业数字化能力，加速产业数字化转型。</span></p>', 4, 733, '0', '2', 60, 66, 0, 0, 7, 44, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000045, '套餐使用情况查询', 1, '2022-01-10 08:34:53', '2022-05-28 19:52:46', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">近日，在2021（第二十届）中国互联网大会科技兴警高峰论坛上，中国电信发布“科技兴警护航计划”。</span></p>\r\n<p><span style=\"\">据悉，“科技兴警护航计划”借助各类通用和公安专用AI算法，打造了包括天翼慧眼、5G公安立体巡防、公安情报大脑、量子加密对讲等面向公安各警种各条线、贴近实战、符合业务需求的智能化场景应用和解决方案。在创新智能警务应用方面，中国电信运用高新技术提供了多种系统服务，与公安部合作搭建的96110劝阻预警专线已在27个省（区、市）开通，“云堤-反资产仿冒欺诈服务”成为中国首家运营商级、基于网络控制能力实现反欺诈的创新型服务，能够有效发现并成功拦截在生效状态的钓鱼网站。</span></p>\r\n<p><span style=\"\">作为参与公安信息化建设的重要力量，中国电信以科技兴警战略对公安信息基础设施提出新的要求为指引，通过统一的行业专网、云基础设施安全底座及差异化原子能力基础，构建政务服务云网、智能感知云网、移动警务云网。以云、网、数、安、用五方面的能力优势构建云网融合、数据融合体系。在公安云网服务建设方面，截至2021年6月，中国电信承建的公安信息网已覆盖全国29个省（区、市），新一代公安信息网覆盖14个省（区、市），警务数字集群网在全国17个省（区、市）部署实施。</span></p>\r\n<p><span style=\"\">据了解，中国电信将继续发挥建设网络强国和数字中国、维护网信安全的主力军作用，积极响应国家战略、公安实战和服务群众需求，坚持以大数据为引领，以新技术手段为支撑，为推进平安中国、法治中国、社会治理能力现代化作出新的更大贡献。</span></p>\r\n</div></div></p>', 5, 264, '0', '2', 111, 50, 0, 0, 4, 45, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000046, '电子发票查询', 2, '2022-01-10 08:34:51', '2022-05-01 19:53:19', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">矿山里，装载百余吨矿石的卡车流畅、精准、平稳地进行着倒车入位、停靠、倾卸、避障等动作，但驾驶室却空无一人。这不是科幻电影中的场景，而是中国电信通过下沉式5G MEC部署，在安徽省马鞍山南山铁矿实现的国内首个冶金露天矿山多台矿车无人驾驶与有人驾驶混编运行。</span></p>\r\n<p><span style=\"\">随着5G、云计算、大数据、AI等新技术的加速普及，数字化应用正加速改变着我们身处的社会，从前人们想象科幻世界中才有的场景已逐步变为现实。</span></p>\r\n<p><span style=\"\"><b>云网融合通向ICT综合运营之路</b></span></p>\r\n<p><span style=\"\">当前，随着云技术应用的深化，越来越多的政企客户将核心业务上云，对网络的速率、时延、可靠性以及IT系统云化改造经验等要求明显提升，而运营商凭借自身网络优势及IT上云经验，融合网络、云及大数据、AI等能力，为客户提供一站式云网融合服务，打造全新的ICT综合运营模式。</span></p>\r\n<p><span style=\"\">依托行业领先的高质量云网基础设施及服务能力，结合自身BSS/OSS等核心业务系统上云积累的宝贵经验，中国电信围绕客户需求，融合网络、边缘计算、AI等能力，提供IT基础设施上云和应用上云的综合解决方案，帮助政企客户加快自身云化、数字化转型。</span></p>\r\n<p><span style=\"\">在中兴通讯南京滨江工厂的生产线上，一个个通信产品正被快速加工、检测、流转。由于整个工厂采用柔性生产方式，同一生产线上生产多种类产品，这对产品质检等生产环节提出了更高要求，需要在较短时间内对通过的各类产品实现精准检测。过去，实现该目标的方式依赖高昂的成本、人力投入，且准确性难以保障。中国电信发挥运营商“云、边、端”协同的优势，以ICT综合运营的方式为中兴通讯打造了安全可靠的5G智能车间，协助客户将质检模型部署在天翼云，并调动AI能力，利用5G﹢MEC“大带宽、低时延”的特点，实现百兆照片上传、模型判断、结果回传等步骤“秒完”，同时准确率高达97%、漏检率比人工降低80%，在提高效率的同时大幅降低成本。</span></p>\r\n<p><span style=\"\"><b>安全数字化可靠性的底座</b></span></p>\r\n<p><span style=\"\">产业数字化为政企客户带来便利、提升效率，而各类与数字化相关的风险也随之而来、与日俱增。由于网络使用的深化及大数据、云计算等新兴技术的应用，企业网络业务边界不断模糊，网络威胁持续升级，安全事件层出不穷。任何导致业务暂停的网络安全事故都可能给企业带来巨额损失。</span></p>\r\n<p><span style=\"\">中国电信以骨干网运营商独特的网络资源和能力优势为抓手，持续建设覆盖“云、网、边、端、应用”的融合安全技术能力，打造立体化网络安全防护体系。中国电信自主研发的“云堤”平台是国内唯一具有全网覆盖能力和全球触达能力的网络攻击防护平台，全球分布式部署36个DDoS攻击防护节点实现近源清洗，DNS域名解析具备全国监测能力和覆盖31个省（区、市）的DNS秒级同步修正能力。</span></p>\r\n<p><span style=\"\">新冠肺炎疫情防控期间，某重要网站连续被DDoS攻击，攻击峰值曾达13Gbps，其中来自国外的攻击流量占比为60.87%。在发生首次攻击后，中国电信第一时间提供了全流程、可视化的攻击行为监控，让“无形”的网络攻击“现身”。根据大部分攻击流量主要来自境外的特点，中国电信利用运营商的骨干网络防护能力，按照境外、境内两个维度，针对攻击源进行了分布式防护。凭借强大的网络安全能力，中国电信于疫情防控期间在网络空间守卫了国家安全，为产业数字化筑起坚实的安全底座。</span></p>\r\n<p><span style=\"\"><b>一体化服务复杂场景下的专业价值</b></span></p>\r\n<p><span style=\"\">面对客户数字化转型中的新需求，中国电信依托现有覆盖全国的全触点售前支撑服务体系，基于自身云网融合优势能力，深耕垂直行业领域，面向细分市场需求提供从标准化到场景化到定制化的端到端整体解决方案。建立工业、应急、交通物流、住建等十几个行业BG，探索跨界混营新合作模式。进一步强化自研数字平台、原子能力等数字化供给，为用户数字化转型全周期保驾护航。</span></p>\r\n<p><span style=\"\">同时，中国电信在现有服务体系基础上，打造了覆盖全国的属地化专业服务团队，拥有3.6万名具备产业数字化销售和服务能力的专家，其中包括1.6万名从事售中支撑和实施交付的技术型专家。凭借专业的服务能力，中国电信实现从单一网络交付到云网数字化服务整体交付的转变。</span></p>\r\n<p><span style=\"\">在甘肃，中国电信与甘肃省生态环境厅合作，打造覆盖全业务、全流程、全要素的生态环境监测大数据管理平台。中国电信在充分了解需求后，决定采用微服务﹢容器的方式在云端构建统一平台，以一体化交付方式打破原来各业务系统间的数据壁垒。该平台将自然资源、气象、农林、住建、公安等30个厅局级部门及生态环境厅72套在用系统全面打通，实现全省2342个监测站点的有效整合，构建省市县三级、天地空一体的综合大数据平台，为生态治理智能化打下坚实的数据基础。基于云端海量数据，中国电信积极进行政产学研合作，依托大数据、AI等技术，上线预测分析模型，帮助全省环境治理由被动响应向主动预测转变。目前，该模型在大气、水环境预警溯源方面准确率高达97.2%，处于全国先进水平。</span></p>\r\n<p><span style=\"\">5G、云、AI等数字化技术的发展正催生一场社会生产领域无声的革命。无人矿山、智能工厂、智慧生态，一个个高科技应用从想象走向现实，赋予社会发展新动能。作为云网基础设施运营商，中国电信充分发挥自身在云网融合、安全与一体化服务等方面的独特优势，为政企客户提供全新的ICT综合运营服务，赋能千行百业，在建设数字中国之路上砥砺前行。</span></p>\r\n</div></div></p>', 6, 884, '0', '2', 333, 336, 0, 0, 4, 46, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000047, '详单查询入口', 9, '2022-01-10 08:34:48', '2022-05-02 19:53:50', ' <p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">7月9日，在武汉召开的中国卫生信息技术交流大会“数智升级，健康添翼——数字化助力卫健高质量发展”研讨会上，中国电信发布了公共卫生应急管理与指挥决策平台，助力提升我国公共卫生应急管理与处理能力。平台日常以监测预警分析为重点进行常态化运行；遇突发公共卫生事件时，对事件进行全过程监管，实现事前预警防控、事中应急处置，事后评估分析的全流程管理。</span></p>\r\n<p style=\"text-align: center; \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><img src=\"./W020210713354202335137.png\" style=\"border-width: 0px;\" alt=\"\" oldsrc=\"W020210713354202335137.png\" /><br />\r\n</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">面对全球疫情防控新形势，接应国家“十四五”规划关于“构建强大公共卫生体系，为人民提供全方位全生命期健康服务”的工作要求，支持公共卫生信息化建设，中国电信积极探索“平战结合的多点触发监测预警公共卫生信息化建设”新思路，建设了“公共卫生应急管理与指挥决策平台”，旨在以重大传染病哨点医院为重点，强化医疗卫生机构、疾控机构疫情信息整合共享，实现疫情信息实时自动推送，完善传染病监测体系；同时结合大数据支撑重点人群排查，提升精准防控能力。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">平台日常运行时以监测为主，通过监测区域内各级各类公共卫生事件，实现各级单位业务资源共享，形成一套科学、智能化的管理体系，为突发公共卫生事件爆发提供数据支持。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">突发公共卫生事件时，平台以指挥决策为主，针对突发事件和紧急情况，支持指挥中心实时了解事件动态、进行事态评估和大规模综合性实时指挥调度，缩短反应时间，提高整体反应能力。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在功能上，平台将实现对重大突发公共卫生事件事前预防、事中处置及事后总结的闭环管理。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">事前预防环节，结合大数据和人工智能等技术建立疫情监测防控系统，实现疫情防控早识别、早预警和早处置。通过多点触发监测预警、应急预案管理、应急资源管理系统对突发公共应急事件的人员、机构、物资、预案等进行管理。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">事中指挥决策环节，支持指挥中心动态完成事件处置，包括指挥调度、综合监测、卫生应急、流行病学调查、突发公共卫生事件处置、紧急医学救援等。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">事后总结环节，通过调用专家库，根据事件进展、控制处理结果等因素进行后评估，为下一次紧急事件的处理和应对提供参考。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">参照国家卫生健康委办公厅和国家中医药局办公室联合发布的《全国公共卫生信息化建设标准与规范（试行）》要求，平台将与国家应急管理平台、全民健康信息平台对接，真正实现对各区域内各类突发公共卫生事件的动态监测与汇总。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">目前，中国电信公共卫生应急管理与指挥决策平台已在多个省市实践落地。其中厦门金砖会议重大活动医疗救治应急指挥平台能够及时发现事件苗头，快速、有效地处置突发公共卫生事件，会议期间支持完成5家定点医院、48辆120车辆、1000多路公安交通路况视频的接入。中国电信协助福建省卫健委建立了福建省医疗救治应急指挥平台，整合福建九地市120急救资源和六类卫生应急资源，形成了纵横连通、指挥迅达的省级卫生应急平台体系，实现应对突发事件卫生应急处置能力的大幅提升。</span></p>\r\n</div></div></p>', 7, 2560, '0', '2', 456, 0, 0, 0, 6, 47, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000048, '语音详单查询入口', 2, '2022-01-10 08:34:47', '2022-03-27 19:54:23', '<p><span style=\"\">IPv6将是网络基础设施发展以及产业生态构建的最终方向，加快部署IPv6是加快网络强国建设、加速国家信息化进程、助力经济社会发展、赢得未来国际竞争新优势的紧迫需求。现在我国IPv6部署情况如何，产业推进向何处发力？请关注本版报道。</span></p>\r\n<p><span style=\"\">互联网协议第六版（IPv6）是数字经济发展的关键性技术，在信息通信业发展中发挥着重要作用，其规模部署和广泛应用，将催生各种新技术新业态，有力支撑经济社会发展。构建基于IPv6的网络空间命运共同体，是适应全球信息通信业演变趋势的迫切需要，也是全球民众共享快速进步的信息文明的必要条件。通过分析研判信息通信业演变趋势，中国电信提出构建基于IPv6的网络空间命运共同体的倡议。</span></p>\r\n<p><span style=\"\"><b>信息通信业正沿着“ACT”的方向加速演进</b></span></p>\r\n<p><span style=\"\">当今世界正经历百年未有之大变局，新一轮科技革命和产业变革加速演进，正在重构全球创新版图、重塑全球经济结构。随着以人工智能、量子信息、移动通信、物联网、区块链为代表的新一代信息技术的广泛应用，信息通信业正沿着“ACT”的方向加速演进。</span></p>\r\n<p><span style=\"\">从行业成长的角度看，“三箭齐发”推动信息通信业螺旋式成长。“ACT”中的A是Arrow，即“箭”，指影响信息通信业成长的因素，根据影响时间的长短，把相关因素分为“短中长”三支利箭，短箭是AR、VR、MR以及toB市场的业务创新，将在未来5年驱动信息行业快速发展；中箭是5G的规模商用和快速发展，将在未来10年成为推动行业升级的重要力量；长箭是数字技术的广泛应用，推动生产、生活和社会的智能化升级，将在未来20至30年深刻影响人类社会的发展进程。当前，信息通信业正处于三支利箭同时发射、相互影响、互相促进的开端期，短箭大视频的突破将进一步丰富中箭5G的应用场景，进而推动长箭行业数字技术和应用的发展。</span></p>\r\n<p><span style=\"\">从价值创造的角度看，信息通信业正在加速实现3C转变。5G为社会带来新价值，推动传统的3C（即计算机Computer、通信Communication、消费电子ConsumerElectronics）向新3C（即“ACT”中的“C”）转变。第一个“C”是“Connection（连接）”，泛在连接带来的永远在线将为各行各业以及全社会的智能化发展提供基础，连接的价值将极大凸显。第二个“C”是“Control（控制）”，5G的通信交互将承载各种各样的控制信息，通过控制实现工业自动化、远程手术、远程施工、远程驾驶等，过去属于控制的事情，今天可能成为通信的一个应用。第三个“C”是“Convergence（融合）”，即5G将与各行各业垂直领域深度融合，为千行百业注智赋能，加快产业创新进程，产生新应用、催生新业务、创造新价值。据预测，到2025年，5G带动1.2万亿元网络建设投资，拉动8万亿元信息消费，直接带动经济增加值2.93万亿元。</span></p>\r\n<p><span style=\"\">从技术演进的角度看，信息通信业正加速转型升级。这种转型（即“ACT”中的“T”Transformation）主要体现在三个方面。</span></p>\r\n<p><span style=\"\"><b>——IP协议正加速从IPv4向IPv6转型升级</b></span></p>\r\n<p><span style=\"\">一方面，IPv6网络升级不断提速，全球大型网络运营商、网络接入服务提供商加快IPv6网络建设与升级并加快向IPv6单栈网络演进。另一方面，IPv6应用规模显著扩大，头部互联网企业及服务提供商加快各类应用由IPv4向IPv6的迁移进程，Alexa排名前1000的网站中，IPv6的支持率已近30%并呈稳步上升趋势。截至今年4月，国内IPv6活跃用户数已达5.15亿，占全部互联网用户的52.1%。</span></p>\r\n<p><span style=\"\"><b>——网络连接正加速从“人人互联”到“万物智联”转型升级</b></span></p>\r\n<p><span style=\"\">国内信息通信业的人口红利已接近“天花板”，2020年移动互联网用户达13.5亿户，普及率达95.5%，几近饱和，未来将走向存量市场的新常态。而物联网的发展进入井喷期，物的连接将成为下一个即将爆发的连接红利。2020年全球物联网连接数达117亿，首次超过非物联网连接数，实现历史性跨越。预计到2025年，全球物联网连接数达到309亿，远超非物联网连接数。我们正迈入万物智联时代，将为IPv6提供巨大的发展空间。</span></p>\r\n<p><span style=\"\"><b>——信息基础设施正加速从“云是云、网是网”向云网融合转型升级</b></span></p>', 8, 369, '0', '2', 50, 70, 0, 0, 2, 48, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000049, '短信详单查询释疑', 4, '2022-01-10 08:34:51', '2022-04-23 19:54:59', '<p><span style=\"\">随着数字技术由消费领域向生产领域、由虚拟经济向实体经济延伸，云计算逐渐成为人工智能、工业互联网、大数据、物联网等新技术新应用的基础承载。“一切业务由云提供，云提供一切业务”正走向现实。IDC预测，2025年中国90%以上的应用迁移到云上，数据中心将全面云化。从5G建设和发展看，5G核心网和应用均构建在云上，云成为加快推进5G领先战略的关键。Gartner预测，2022年全球80%的AI技术应用使用公有云基础设施。各行各业逐渐从“上网”演变到“上云”，云网成为赋能千行百业数字化转型的新型信息基础设施。</span></p>\r\n<p><span style=\"\"><b>中国电信推进基于IPv6的云网融合发展</b></span></p>\r\n<p><span style=\"\">中国电信作为我国信息化建设的主力军和国家队，积极适应全球信息通信业发展演变趋势，全面实施“云改数转”战略，加快推进基于IPv6的云网融合发展，加快打造“网是基础、云为核心、网随云动、云网一体”的新型信息基础设施。一是加快5G建设发展，通过与中国联通共建共享，率先建成全球规模最大的5G SA网络，累计开通5G基站43万站，网络覆盖全国所有地级以上城市和部分县城。二是持续深耕基础网络，率先建成覆盖全国城乡的全光网络，在300个城市部署千兆网络。三是加快数据中心和云业务布局，数据中心规模居国内第一位、全球第二位；天翼云是全球运营商最大的云，在国内混合云市场排名第一、公有云市场排名第四；率先研发云终端系列，包括云手机、云电脑、云桌面、云游戏等。</span></p>\r\n<p><span style=\"\">长期以来，中国电信高度重视并积极推动IPv6的技术创新和商用工作。早在2003年，中国电信就作为CNGI成员开展IPv6业务示范和试验。2009年，作为中国最早启动IPv6试商用的运营商，在江苏和湖南开展现网试用，实现了IPv6商用化的突破。2013年，对北京、上海等10个省（区、市）21个城市的城域网和接入网进行IPv6改造；中国电信4G LTE网络完全按照IPv6标准建设，在国内最早实现了IPv6在移动网的应用突破。</span></p>\r\n<p><span style=\"\">近几年，中国电信进一步深化IPv6规模部署和技术创新。一是全面推动基础设施的IPv6改造，目前固定网、移动网、IDC和云全部支持IPv6。二是持续深化IPv6技术创新，成功开展基于纯IPv6的5G SA现网试验，开始运营商网络从双栈向单栈演进的首例探索；推进SRv6在城域网、骨干网和移动承载网等多个场景的试点和部署，基本实现SRv6全国覆盖。三是利用IPv6的云网优势开展赋能，为200多家大型单位提供IPv6改造方案，为2000多家行业客户开通IPv6互联网专线。四是打造自有应用的IPv6示范，完成中国电信集团26个门户网站、54个APP的IPv6改造，中国电信集团官网获全球IPv6论坛颁发的中国首张IPv6二阶段认证证书。</span></p>\r\n<p><span style=\"\"><b>三向发力促进全球IPv6更好更快发展</b></span></p>\r\n<p><span style=\"\">为促进全球IPv6更好更快发展，加快构建基于IPv6的网络空间命运共同体，中国电信提出三点倡议。</span></p>\r\n<p><span style=\"\">一是“开放”，坚持技术无国界，加快推动技术融合发展。科学技术是世界性的，应打破技术的国界壁垒，把握IPv6带来的创新机遇，加快实现关键前沿技术的新突破，加强对下一代互联网基础性、前瞻性、创新性研究，推动IPv6与工业互联网、物联网、云计算、大数据、人工智能等融合发展，共同推动技术进步。</span></p>\r\n<p><span style=\"\">二是“合作”，加强技术合作，打造联合创新生态。运营商在网络建设和服务、内部数字化转型以及服务各行各业数字化转型中，积累了丰富经验。中国电信愿与产业各方加强合作，全面开展联合创新，共同打造、持续繁荣IPv6生态。</span></p>\r\n<p><span style=\"\">三是“共享”，加快技术推广应用，使全世界人民共享技术进步红利。推动IPv6新技术的广泛应用，进一步加强IPv6对千行百业的赋能，充分释放IPv6的技术潜能和优势。发挥运营商的云网优势，积极运用基于IPv6的数字化技术，助力全社会数字化转型，支撑“智能减碳、绿色发展”，加大科技扶贫和减贫力度，以技术力量造福人民。</span></p>\r\n<p><span style=\"\">* * *</span></p>\r\n<p><span style=\"\">新技术催生新动能，新动能激发新活力。作为用户规模最大的互联网大国，我国要加快推动IPv6技术创新和应用推广，促进下一代互联网在经济社会各领域深度融合应用，构建基于IPv6的网络空间命运共同体，推动经济社会发展和全球数字化转型。</span></p>', 9, 171, '0', '2', 111, 34, 0, 0, 7, 49, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000050, '上网详单查询释疑', 2, '2022-01-10 08:34:52', '2022-03-18 20:01:41', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">过去，当一位身处新疆的患者需要接受上海顶级专家的胃镜检查时，他和陪护家属都要经过舟车劳顿前往上海。一场检查下来，不仅花费巨大更让全家疲惫不堪。现在，随着智慧医疗不断发展，5G平台下磁控胶囊胃镜远程诊查的可行性被印证。新疆患者只要在家门口的医院，通过先进的5G磁控胶囊胃镜远程诊查，就能获得上海顶级专家的诊断资源，这不仅保证了检查的及时性、准确性和便利性，更使基层及边疆地区的消化道肿瘤早诊早治工作效率得到大幅提升。上海同济医院常态化开展与克拉玛依市中心医院的5G远程医疗，相隔千里不再成为分享优质医疗资源的阻碍。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">近年来，5G+医疗健康政策陆续出台，应用场景不断增加，加快推动5G在医疗行业的建设、应用和产业发展。走进5G时代，4K/8K的长距离高清巡诊和医学影像数据的高速保密传输和共享成为现实，相距千里的医疗专家随时都可以进行诊察，解决了过去存在的优质医疗资源供给不足、分布不均的问题，患者可以在家门口高质地享受到来自一线城市的医疗服务；同时，对医生而言，5G技术的加入有利于不同地区、不同医院之间专业业务的交流，信息加速互通帮助医生拥有更多机会交流、提升医务水平。此外，在医院内部管理方面，5G技术的赋能可以助力医院低成本实现精细化管理，达到“全面感知数字化、全景可视云端化、全局联动智能化”的“三化”升级。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">无疑，5G医疗时代，群众更便捷地享受优质医疗资源，医院和医生也有了全新的发展机遇，可以说，5G的出现让医疗行业朝着更优质、更灵活、更实惠的方向发展。但同时，如何不断升级、推动5G在医疗健康领域的应用则需要全行业共同努力。那么，关于5G智慧医疗，未来还有什么可能性？</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">为了推动5G技术在医疗领域的应用与融合发展，近日，工业和信息化部主办的第四届“绽放杯”5G应用征集大赛在北京正式启动，本次大赛中，由中国信息通信研究院联合中国电信主办的医疗健康专题赛以“智绘医疗·智享健康”为主题，旨在发挥行业需求引领作用，以技术应用创新积极响应国家“健康中国2030”战略，推进医疗健康与信息技术的创新融合。全社会各行各业在5G医疗健康领域的创新应用、所有与5G应用相关的智慧医疗健康类项目均可报名。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">如果你对5G智慧医疗有独到见解或是技术创新想法，不要犹豫，你就是下一个改变医疗领域的人！医疗健康专题赛本轮征集时间截止到2021年7月15日24:00前，赶快登录官网www.5gaia.org.cn，选择医疗健康专题赛即刻报名，未来世界健康由你定义！</span></p>\r\n</div></div></p>', 10, 250, '0', '2', 33, 2, 0, 0, 9, 50, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000051, '积分查兑规则', 7, '2022-01-10 08:34:49', '2022-05-01 11:26:14', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">日前，国务院国资委公布了国有重点企业管理标杆创建行动标杆企业、标杆项目和标杆模式名单，中国电信安徽分公司、四川分公司被评为“国有重点企业管理标杆创建行动标杆企业”，中国电信集团公司基于“六力模型”的智能客服管理、大数据财务风险防控体系项目被评为“国有重点企业管理标杆创建行动标杆项目”。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信“基于‘六力模型’的智能客服管理”是围绕价值创造力、技术竞争力、自主可控力、感知引领力、应用创新力、专业运营力打造智能客服六力模型，持续开展行业对标，长长板、补短板。目前中国电信智能化服务规模、用户服务满意度水平等方面均达到行业领先水平，形成了覆盖服务前、中、后全流程的业务服务体系，实现31省10000热线上线应用，并全部开放全语音门户，智能服务年调用量超过80亿次。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">长期以来，中国电信经营业绩处于行业领先水平，管理体系健全，管理方法和手段科学有效，管理信息化水平高，示范带动作用强。中国电信高度重视对标国有重点企业管理标杆创建行动，将其作为提升管理现代化水平、实现管理增效、推动“十四五”规划落地的关键抓手，标杆企业、标杆项目的打造是以点带面推动全集团从上至下进一步提升运营管理能力的重要手段。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">“大数据财务风险防控体系”则是基于中国电信集团MSS/BSS/OSS系统，在数据挖掘中融入机器学习算法和数据训练等智能手段，对资金、资产、预算、成本、税务、效能等生产经营数据及流程数据，进行交叉扫描和智能化多维度分析，智慧识别存在的风险点，精准定位到责任单位，自动派单到相关责任人，实现了中国电信集团全级次、全流程风险预警防控，构建了“风险问题发现-问题核查整改-风险预警解除”风险闭环管理流程，形成了“以事先防范和过程控制为主，事后补救为辅”的风险管控体系。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">党的十九届五中全会提出，要加快构建以国内大循环为主体、国内国际双循环相互促进的新发展格局。加强合规管理是国企在构建新发展格局过程中发挥示范引领作用的必然要求。近年来，中国电信一直致力于完善风控体系建设，通过清单指引等强化重点领域合规管理，加强与审计、财务、网信、内控、纪检监察、市场等部门协同，完善合规评估标准。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">国有重点企业管理标杆创建行动是国务院国资委按照对标世界一流管理提升行动总体安排，分层分类总结提炼管理提升成功经验，打造管理提升样板和尖兵的重要举措。经综合比选、专家评审、征求意见等环节，遴选出管理提升标杆企业200家、标杆项目100个、标杆模式10个。中国电信两家分公司和两个项目成功入选是对中国电信运营管理能力和风险防控水平的高度认可。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">下一步，中国电信将扎实推进“云改数转”的战略部署，切实发挥标杆示范带头作用，持续加强管理能力和风控体系建设，为中国电信加快打造并充分展示新时代国有企业管理水平的优秀品牌，建成世界一流企业贡献力量。</span></p>\r\n</div></div></p>', 11, 3265, '0', '2', 235, 0, 0, 0, 2, 51, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000052, '如何查询当前积分', 1, '2022-01-10 08:34:45', '2022-05-01 11:26:06', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">8月20日，上海市人民政府与中国电信集团有限公司在沪签署“十四五”战略合作协议。上海市市委书记李强，市委副书记、市长龚正会见了中国电信董事长柯瑞文、总经理李正茂一行。龚正、柯瑞文出席签约仪式。市委常委、副市长吴清与李正茂代表双方签约。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">李强对中国电信长期以来积极参与和支持上海经济社会发展表示感谢。他说，当前，我们正在深入贯彻落实习近平总书记在浦东开发开放30周年庆祝大会上的重要讲话精神，全力以赴推动中央赋予上海的各项重大战略任务落地落实，更好服务国家改革发展大局。上海全面推进城市数字化转型与中国电信实施“云改数转”战略，方向目标契合，合作前景广阔。希望以此次协议签署为新的起点，深化双方合作对接，共同完善城市数字底座，共同发展新应用新业态，共同加大科技创新突破。欢迎中国电信持续提升新一代基础设施能级，深度参与场景开发并率先形成示范应用，推动新技术、新业务、新项目落地上海。我们将不断优化营商环境，创造良好创新生态，提供更多发展舞台，支持企业在沪做大做强。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">柯瑞文感谢上海长期以来给予中国电信的支持与帮助。他表示，中国电信在上海证券交易所主板上市，与上海市政府签约深化战略合作，对企业更好服务国家战略、助力城市发展具有重要意义。中国电信将加大在沪发展力度，积极参与上海城市数字化转型，围绕经济数字化、生活数字化、治理数字化强化基础设施支撑、核心技术赋能和数据安全保障，为上海经济社会发展作出更大贡献。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\" \">根据协议，双方将共同围绕“双千兆宽带城市”能级提升、新一代信息技术研发与成果转化、城市数字化转型场景应用、信息基础设施保障等方面持续加大投入，深化合作对接，为上海提升城市软实力、服务新发展格局提供强有力支撑。</span></p>\r\n</div></div></p>', 12, 1242, '0', '2', 256, 0, 0, 0, 6, 52, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000053, '如何兑换我的积分', 9, '2022-01-10 08:34:54', '2022-05-01 11:26:06', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">8月20日，中国电信集团有限公司（以下简称“中国电信”）与上海市人民政府在沪签署“十四五”战略合作协议。在“十四五”期间，双方将共同围绕“双千兆宽带城市”能级提升、新一代信息技术研发与成果转化、城市数字化转型场景应用、信息基础设施保障等方面持续加大投入，深化合作对接，为上海提升城市软实力、服务新发展格局提供强有力支撑。市委书记李强，市委副书记、市长龚正会见了中国电信董事长柯瑞文、总经理李正茂一行。市领导诸葛宇杰参加会见。龚正、柯瑞文出席签约仪式。市委常委、副市长吴清与李正茂代表双方签约。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">根据协议，到2025年底，中国电信将在上海投入资金不低于1000亿元，构筑坚实的连接+算力+安全的信息化底座，融入城市经济、生活、治理数字化进程，勇当上海城市数字化转型建设的主力军、城市网信安全的可靠国家队，向市民持续提供更好的产品品质和服务体验。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">在网络建设方面，巩固上海全球领先“双千兆宽带城市”地位，提升国际信息通信能力，助力上海打造全球信息通信枢纽。进一步开展5G网络深度覆盖工程，到2025年投入服务的5G基站超过4万个，推进光纤到房间到桌面（FTTR/ FTTD），主流用户普及千兆带宽；进一步推广基于IPv6+（互联网协议第6版）技术的应用；“十四五”期间建成第二海光缆登陆站，增加面向重点方向的国际海光缆；到2025年底，中国电信在上海的国际出口带宽合计超过6Tbps（太比特每秒），使上海保持国际网络访问感知领先全国；重点在临港园区建设算力平台，助力上海打造算力全球领先城市。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">在应用创新方面，加大科技创新投入力度，助力上海建设具有全球影响力的科技创新中心。“十四五”期间，在上海设立中国电信长三角区域研发实体，重点研究5G、工业互联网、人工智能、区块链、网信安全、量子通信等新一代信息技术，推动前沿科技成果转化落地。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">在推进数字化转型方面，聚焦城市经济、生活、治理数字化。经济数字化上，重点推进5G网络、智能物联网、边缘云计算与城市支柱行业的应用融合，打造至少一个具有全国影响力的工业互联网公共平台，形成不少于100个5G+工业互联网应用案例，助力十万家中小企业上云；生活数字化上，提升家庭WiFi品质，构筑智慧家庭、智慧社区领域的产业生态链，在教育、医疗、养老、社区服务等领域提升市民感知；治理数字化上，共同推进上海市“一网通办”、“一网统管”建设，以5G+XR赋能“一网统管”，同时开放电信大数据以支撑城市公共安全管理，并在全市公话亭全面推出市话限时长免费、市民热线一键直呼等服务。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">在信息通信基础保障方面，对接上海重点区域发展，重点服务五大新城、虹桥枢纽和长三角一体化。对接五大新城和虹桥国际开放枢纽总体规划，前瞻布局新一代信息通信基础设施与云资源，打造云边协同、随需计算的算力资源池，并在工业和信息化部统一规划部署下，积极探索新型互联网交换中心在上海临港试点；推进长三角区域的网络扁平化、服务一体化。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">此外，在网络信息安全方面，发挥运营商云网优势，提升全市网络安全防护水平、构筑政企客户网信安全底座。十四五期间，中国电信将组建不少于500人的专业团队，在政府部门指导下，当好全市网信安全服务保障主力军，对上海全市重要产业经济和城市运行领域的网络安全防护水平进行一次大提升：一方面将网信安全融入到云网基础业务中，向政企客户普遍提供内含主动安全防护的一体化云网服务；另一方面，深入政企客户的应用场景，提供网信安领域的咨询、诊断、部署、优化的一揽子服务。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">中国电信成立于2002年，目前是中国领先的大型全业务综合智能信息服务运营商，也是全球最大的4G、光纤宽带、IPTV和固定电话运营商。接应国家“网络强国”、“数字中国”战略，顺应信息通信行业的技术变革趋势，中国电信正积极以5G和云为核心打造新型信息基础设施，推动云网融合转型与数字化转型战略落地。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">中国电信上海公司（“上海电信”）作为中国电信的省级分公司，始终牢记央企责任，坚持将网络强国、数字中国战略与上海城市发展相结合，将推动企业经营发展与践行社会责任相融合，积极承担上海信息化建设主力军责任。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">截至2021年6月底，上海电信在上海地区的千兆光网端口数超千万个，覆盖全市家庭、产业园区、商务楼宇；投入使用的5G基站已经超过1.6万个，基本覆盖全市城区和街镇；互联网国际出口带宽超过4T；互联网数据中心（IDC）机架数超过6万个，是全市最大IDC运营商；通过“连接+算力+平台+应用”的服务模式，在线服务客户数超过2500万户。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">伴随“十四五”战略合作的开启，上海电信将全面融入城市数字化转型，恪守“以客户为中心”的发展理念，以科技创新为第一动能，以市场活力、组织活力为两大抓手，打造“服务型、科技型、安全型”三大企业硬实力，构建“学习型、平台型、共创型”三大企业软实力，支撑企业持续又快又好发展, 在上海建设具有世界影响力的国际数字之都的进程中，展现更大担当，作出更大贡献。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">与上海市政府签约深化战略合作，对企业更好服务国家战略、助力城市发展具有重要意义。中国电信将加大在沪发展力度，与上海市政府携手努力，全面推进城市数字化转型，建设具有世界影响力的国际数字之都，不断满足人民群众对美好数字生活的向往。</span></p>\r\n</div></div></p>', 13, 66, '0', '2', 0, 0, 0, 0, 3, 53, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000054, '星级服务之300M十全十美全家享一年版', 2, '2022-01-10 08:34:47', '2022-06-01 11:26:06', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">8月20日，中国电信集团有限公司（以下简称“中国电信”）与上海市人民政府在沪签署“十四五”战略合作协议。在“十四五”期间，双方将共同围绕“双千兆宽带城市”能级提升、新一代信息技术研发与成果转化、城市数字化转型场景应用、信息基础设施保障等方面持续加大投入，深化合作对接，为上海提升城市软实力、服务新发展格局提供强有力支撑。市委书记李强，市委副书记、市长龚正会见了中国电信董事长柯瑞文、总经理李正茂一行。市领导诸葛宇杰参加会见。龚正、柯瑞文出席签约仪式。市委常委、副市长吴清与李正茂代表双方签约。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">根据协议，到2025年底，中国电信将在上海投入资金不低于1000亿元，构筑坚实的连接+算力+安全的信息化底座，融入城市经济、生活、治理数字化进程，勇当上海城市数字化转型建设的主力军、城市网信安全的可靠国家队，向市民持续提供更好的产品品质和服务体验。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">在网络建设方面，巩固上海全球领先“双千兆宽带城市”地位，提升国际信息通信能力，助力上海打造全球信息通信枢纽。进一步开展5G网络深度覆盖工程，到2025年投入服务的5G基站超过4万个，推进光纤到房间到桌面（FTTR/ FTTD），主流用户普及千兆带宽；进一步推广基于IPv6+（互联网协议第6版）技术的应用；“十四五”期间建成第二海光缆登陆站，增加面向重点方向的国际海光缆；到2025年底，中国电信在上海的国际出口带宽合计超过6Tbps（太比特每秒），使上海保持国际网络访问感知领先全国；重点在临港园区建设算力平台，助力上海打造算力全球领先城市。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">在应用创新方面，加大科技创新投入力度，助力上海建设具有全球影响力的科技创新中心。“十四五”期间，在上海设立中国电信长三角区域研发实体，重点研究5G、工业互联网、人工智能、区块链、网信安全、量子通信等新一代信息技术，推动前沿科技成果转化落地。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">在推进数字化转型方面，聚焦城市经济、生活、治理数字化。经济数字化上，重点推进5G网络、智能物联网、边缘云计算与城市支柱行业的应用融合，打造至少一个具有全国影响力的工业互联网公共平台，形成不少于100个5G+工业互联网应用案例，助力十万家中小企业上云；生活数字化上，提升家庭WiFi品质，构筑智慧家庭、智慧社区领域的产业生态链，在教育、医疗、养老、社区服务等领域提升市民感知；治理数字化上，共同推进上海市“一网通办”、“一网统管”建设，以5G+XR赋能“一网统管”，同时开放电信大数据以支撑城市公共安全管理，并在全市公话亭全面推出市话限时长免费、市民热线一键直呼等服务。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">在信息通信基础保障方面，对接上海重点区域发展，重点服务五大新城、虹桥枢纽和长三角一体化。对接五大新城和虹桥国际开放枢纽总体规划，前瞻布局新一代信息通信基础设施与云资源，打造云边协同、随需计算的算力资源池，并在工业和信息化部统一规划部署下，积极探索新型互联网交换中心在上海临港试点；推进长三角区域的网络扁平化、服务一体化。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">此外，在网络信息安全方面，发挥运营商云网优势，提升全市网络安全防护水平、构筑政企客户网信安全底座。十四五期间，中国电信将组建不少于500人的专业团队，在政府部门指导下，当好全市网信安全服务保障主力军，对上海全市重要产业经济和城市运行领域的网络安全防护水平进行一次大提升：一方面将网信安全融入到云网基础业务中，向政企客户普遍提供内含主动安全防护的一体化云网服务；另一方面，深入政企客户的应用场景，提供网信安领域的咨询、诊断、部署、优化的一揽子服务。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">中国电信成立于2002年，目前是中国领先的大型全业务综合智能信息服务运营商，也是全球最大的4G、光纤宽带、IPTV和固定电话运营商。接应国家“网络强国”、“数字中国”战略，顺应信息通信行业的技术变革趋势，中国电信正积极以5G和云为核心打造新型信息基础设施，推动云网融合转型与数字化转型战略落地。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">中国电信上海公司（“上海电信”）作为中国电信的省级分公司，始终牢记央企责任，坚持将网络强国、数字中国战略与上海城市发展相结合，将推动企业经营发展与践行社会责任相融合，积极承担上海信息化建设主力军责任。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">截至2021年6月底，上海电信在上海地区的千兆光网端口数超千万个，覆盖全市家庭、产业园区、商务楼宇；投入使用的5G基站已经超过1.6万个，基本覆盖全市城区和街镇；互联网国际出口带宽超过4T；互联网数据中心（IDC）机架数超过6万个，是全市最大IDC运营商；通过“连接+算力+平台+应用”的服务模式，在线服务客户数超过2500万户。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">伴随“十四五”战略合作的开启，上海电信将全面融入城市数字化转型，恪守“以客户为中心”的发展理念，以科技创新为第一动能，以市场活力、组织活力为两大抓手，打造“服务型、科技型、安全型”三大企业硬实力，构建“学习型、平台型、共创型”三大企业软实力，支撑企业持续又快又好发展, 在上海建设具有世界影响力的国际数字之都的进程中，展现更大担当，作出更大贡献。</span></p>\r\n<p align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"\">与上海市政府签约深化战略合作，对企业更好服务国家战略、助力城市发展具有重要意义。中国电信将加大在沪发展力度，与上海市政府携手努力，全面推进城市数字化转型，建设具有世界影响力的国际数字之都，不断满足人民群众对美好数字生活的向往。</span></p>\r\n</div></div></p>', 14, 4216, '0', '2', 468, 0, 0, 0, 2, 54, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000055, '话费支持微信自动交付啦', 1, '2022-01-10 08:34:45', '2022-05-05 11:26:06', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"text-align: center; \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><img src=\"./W020210820549401912531.jpg\" style=\"border-width: 0px;\" alt=\"\" oldsrc=\"W020210820549401912531.jpg\" /><br />\r\n</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信迎来资本市场重要时刻，2021年8月20日，中国电信（股票代码：601728）正式在上交所主板挂牌上市，截止午间休盘涨超18%，报收5.39元/股，市值突破4174亿元。自此，中国电信正式实现“A+H”境内外资本市场的全布局。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>年营收超3,000亿，2021年上半年业绩表现亮眼</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">公开资料显示，中国电信成立于2002年，是中国领先的大型全业务综合智能信息服务运营商。目前，在三大运营商中，中国电信也是唯一一家连续三年实现移动用户净流入的企业。伴随着运营商行业整体回暖，以及中国电信5G、产业数字化业务的业绩释放，2021年上半年，中国电信再续佳绩，营收和净利润增幅均超两位数，分别同比增长13.1%、27.2%。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">多家研究机构对中国电信未来的业绩增长持积极乐观态度，纷纷出具“买入”评级研究报告。第一上海证券预计2021年-2023年，中国电信将实现净利润265亿元、279亿元、289亿元。华安证券在研报中称，中国电信是以历史最佳姿态回归A股，预计2021年公司的财务指标或将处于过去5年来最好水平。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">值得一提的是，得益于云网融合战略和5G应用发展，中国电信近几年的创新业务迸发出了极强的发展活力，其中又以产业数字化表现最为亮眼。数据显示，今年上半年，中国电信产业数字化业务收入达到501亿元，同比增长16.8%；5G应用场景较2020年底增长近一倍；云业务方面，上半年天翼云收入达到140亿元，仅上半年业绩就超去年全年，在运营商行业中持续领先。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>有效申购倍数超100倍，受到资本市场热烈追捧</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">作为今年以来首家回A上市的大型央企，中国电信受到了资本市场的热烈追捧。询价阶段，超2000家投资者参与中国电信询价，创下近年来大型主板IPO项目数量之最。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在业绩增速再创新高，叠加行业广阔的发展空间打开的背景下，中国电信在申购阶段的有效申购倍数超100倍，市场投资者用真金白银给中国电信的投资价值投出了“信任票”。专业人士分析称，中国电信各板块业务发展快速，业绩也在稳步增长，同时公司还提高了股息率，预计上市后会有一个比较好的投资回报。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>引入20家战投，配售超200亿元</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在战投方面，中国电信此次共引入20家战略投资者，包括大型央企、产业基金，以及知名互联网企业等，主要围绕中国电信所处行业应用场景及重点业务区域展开，基本覆盖了其产业链上下游的核心合作方。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">根据中国电信披露的战略配售结果，20家战略投资者中，既有国家电网、国家能源、国投集团、一汽集团、中国电子、中国电科等大型中央企业，也有中国诚通、中国国新、中非基金、集成电路基金等产业基金，还包括北京、上海、苏州、深圳、成都等地的地方产业基金，以及东方明珠、华为、安恒信息、深信服、哔哩哔哩在内的知名互联网及民营企业。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">本次发行中20家战略投资者累计获配数量为51.83亿股，按中国电信4.53元的发行价计算，战略配售总额为234.80亿元。根据锁定期安排，除东方明珠、华为、安恒信息、深信服、哔哩哔哩所持股份为36个月的锁定期以外，其余战配对象所持股份均为12个月锁定期。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">市场人士分析称，中国电信此次引入的20家战略投资者，除了围绕产业链上下游布局，还在地域上做了一定选择。如引入的北京、上海、苏州、深圳、成都等地方产业基金，均是我国经济发展的四大核心区域，也是中国电信开展产业数字化业务的核心区域。因此，引入这些地方产业基金，可以进一步巩固中国电信在全地域全业务发展的优势。</span></p>\r\n</div></div></p>', 15, 3981, '0', '2', 278, 0, 0, 0, 6, 55, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000056, '全国充值卡充值', 4, '2022-01-10 12:09:57', '2022-09-01 11:26:06', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">中国电信股份有限公司8月10日在香港公布2021年中期业绩。2021年上半年，中国电信以A股上市为契机，进一步全方位推进“云改数转”战略，发展步入快车道，收入和利润实现双位数增长，盈利能力持续改善，经营业绩再攀新高。</span></p>\r\n<p><span style=\" \"><b>收入利润双位数增长高质量发展成效显现</b></span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">2021年上半年，中国电信经营收入为2192亿元，同比增长13.1%；服务收入为2035亿元，同比增长8.8%，高于行业平均增幅。EBITDA为663亿元，同比增长5.1%。净利润为177亿元，同比增长27.2%，剔除出售附属公司的一次性税后收益后，同比增长17.0%，每股基本净利润为0.219元。资本开支为270亿元，自由现金流达到268亿元。董事会决定，2021年度以现金方式分配的利润不少于该年度股东应占利润的60%，A股发行上市后三年内，每年以现金方式分配的利润逐步提升至当年股东应占利润的70%以上。同时，自2022年起宣派中期股息。</span></p>\r\n<p><span style=\" \"><b>5G﹢云网构建差异化综合智能信息服务优势</b></span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">2021年上半年，中国电信积极拥抱数字化转型机遇，以创新、融合、安全构建差异化的综合智能信息服务优势，全方位再创经营佳绩。</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">中国电信以5G为引领，持续深化共建共享。上半年，中国电信移动通信服务收入达到933亿元，同比增长6.9%；移动用户达到3.62亿户，净增1147万户，5G套餐用户达到1.31亿户，渗透率达到36.2%，继续领先行业平均水平。5G特色应用用户快速增长，用户升级5G保持良好价值增长，移动用户ARPU止跌并持续回升，达到45.7元，同比增长2.9%，增幅较一季度进一步提升。</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">中国电信基于云网融合能力，打造5G﹢光宽﹢WiFi 6的“三千兆”高质量泛连接服务。上半年，中国电信固网及智慧家庭服务收入达到574亿元，同比增长5.2%，有线宽带用户达到1.64亿户，宽带接入收入达到381亿元，同比增幅达到7.9%，宽带接入ARPU保持回升势头，达到39.4元，同比增长2.9%。智慧家庭收入达到72亿元，同比增长32.9%，全屋WiFi、天翼看家用户分别较去年同期增长99.5%和231.9%，智家平台纳管的家庭终端数已达到2.7亿，同比增长78.1%，宽带综合ARPU达到46.8元，同比增长5.9%。</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">中国电信发挥云网融合优势和产业数字化领域的丰富储备，打造数字化应用平台。上半年，中国电信行业云、IDC、组网专线、物联网、数字化平台和大数据等业务加速增长，收入达到501亿元，同比增长16.8%。5G政企应用步入收获期，5G应用场景较2020年底增长近1倍，市场需求呈现爆发式增长。天翼云优势全方位强化，成为网络强国和数字中国的重要基石。上半年，天翼云收入达到140亿元，同比增幅达到109.3%。</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">以A股上市为契机将“云改数转”战略推向纵深中国电信将以A股上市为契机，加大实施市场化约束激励机制，利用资本和生态的力量，进一步整合云网、用户、人才等资源；加强生态合作，强化战略协同，共同做大生态圈；优化组织、队伍、流程，提升运营服务能力；将资本市场和客户市场紧密结合，释放发展动能；推动改革走向纵深，推进绿色发展，全力打造新发展空间。</span></p>\r\n<p><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">中国电信董事长柯瑞文指出，今年是“十四五”开局之年，中国数字经济蓬勃发展，中国电信将继续把握新发展阶段，贯彻新发展理念，构建新发展格局，紧抓当前重要战略机遇期，努力转变发展和增长方式，打造服务型、科技型和安全型企业。中国电信将以A股上市为契机，将“云改数转”战略推向纵深，以客户为中心拓展综合智能信息服务，推进关键技术突破和新一代技术储备，打造科技创新核心能力，构建绿色低碳的云网融合新型信息基础设施，以数字化平台赋能千行百业绿色发展，引入与中国电信具有协同效应的战略投资人，构建强强联合、开放合作的产业和资本生态，改革体制机制，激发企业活力和内生动力，筑牢网络和信息安全底座，努力构建数字经济发展基石，助力网络强国、数字中国建设，维护网信安全，推进乡村振兴，为客户创造美好数字生活，与股东共享高质量发展成果。</span></p>\r\n</div></div></p>', 16, 1371, '0', '2', 409, 0, 0, 1, 8, 56, 'A');
INSERT INTO `knowledge` VALUES (00000000000000000057, '如何快速查询充值卡余额', 2, '2022-01-11 03:29:33', '2038-01-19 03:14:07', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\" \">在日前由中国电信主办的2021政法智能化建设技术装备及成果展——科技法治建设峰会上，中国电信发布涵盖法院大数据、5G互联网法院、公共法律服务云等多个领域智能化场景应用及解决方案的“智慧法治护航计划”，全面助力法治中国建设。</span></p>\r\n<p><span style=\" \">在法院大数据方面，通过混合云﹢大数据平台，实现纵向跨四级法院、横向跨外部单位、内部跨业务系统的数据共享交换体系，促进业务协同、数据互通。在5G互联网法院方面，充分发挥中国电信5G短消息即点即用、无须安装的特点，与法院业务整合，在立、审、执等各环节提供轻移动端、全面覆盖、组件化服务。在检务大数据方面，整合检察机关内外部相关系统及数据，实现内部外部数据互通及共享，复杂报表报告一键生成；基于数据分析研判，提供全业务的办案辅助支撑、全要素的管理决策支撑。在公共法律服务云方面，面对群众提供智能咨询、视频咨询、在线业务办理、司法信息查询等服务功能，打通公共法律服务“最后一公里”。面向中小企业提供多元化、一对一服务，帮助企业防范法律风险、维护合法权益。在移动检务方面，通过部级集约平台实现“覆盖全国、统筹利用、统一接入、共享开放”，在充分考虑业务实际应用及系统安全下，实现检务工作移动化、无纸化、可视化。</span></p>\r\n<p><span style=\" \">此外，中国电信充分发挥自身云网融合优势，聚焦远程提审、公益诉讼、智慧矫正、智慧监狱等领域，推动法治工作数字化、网络化、智能化，全面提高综合治理效率。</span></p>\r\n<p><span style=\" \">据介绍，中国电信已逐步形成智慧法院、智慧检务、智慧司法专属智能应用生态圈，面向法院、检察院、司法行政机关各业务场景提供智能化应用建设能力，建设标准统一、整体联动、业务协同、信息共享的法治信息化体系。</span></p>\r\n</div></div></p>', 17, 34, '0', '2', 0, 0, 1, 0, 2, 57, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000058, '在哪里能查询充值记录', 7, '2022-01-11 03:52:21', '2022-07-11 02:51:58', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">为保障江苏全省核酸检测工作稳步、迅速开展，中国电信天翼云协助江苏省卫健委搭建全新的省级核酸检测平台，每秒查询速度可达100万条，大大提升了平台的数据处理能力。截至8月3日14时，该平台核酸检测查询已达260万余次。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">目前，由南京禄口国际机场外溢的新冠肺炎疫情感染链仍在延长，牵动着全国人民的心。面对此次来势汹汹的疫情，南京市目前已完成三轮核酸检测，共计产生2700万人次的检测结果。接下来，南京市将继续迎来第四轮核酸检测工作，扬州、淮安、宿迁等地将迎来第二次全民筛查。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">时有所需，必有所为。面对疫情，中国电信立即做出反应，争分夺秒彰显央企使命，全面响应江苏疫情防控战。7月30日，天翼云协助江苏省卫健委搭建全新的省级核酸检测平台。该平台承载全省“苏康码”、“我的南京”及省级和十三个地市平台的调用需求，包括核酸检测结果的查询需求及重要防疫信息发布等，为江苏全省疫情防控提供有力保障。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">8月1日下午，该核酸检测结果查询平台已顺利完成压力测试，并于当日24时正式上线，用于满足全省8000余万人口的查询需求。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">此次，天翼云根据核酸检测信息查询的动态需求，弹性扩展，目前网络带宽为1G，未来根据需要扩展至2G，同时采用SCDN技术，实现百万级信息量查询，使系统处理能力大大提升，为市民提供更快速的查询服务。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">除此之外，依托中国电信高速、稳定的5G网络和天翼云的云直播技术，南京核酸检测点云直播平台顺利搭建完成并投入使用，南京市民可以随时随地查看核酸检测点的人流情况，合理选择核酸检测时间段，避免由人员大量聚集引发的风险。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">“我们曾经经过的还不是最艰难的，更艰难的是需要长期与病毒共存的智慧。”如今，当疫情防控成为一场持久战，天翼云将继续以科技力量铸就“抗疫利剑”，以央企担当，保障人民生命安全。</span></p>\r\n</div></div></p>', 18, 3, '0', '2', 1, 0, 0, 0, 9, 58, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000059, '需要购买一部CDMA手机才能加入中国电信CDMA网络吗？', 9, '2022-01-11 03:54:54', '2022-08-11 02:54:33', ' <p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">8月2日消息，超过2</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">000</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">个项目入围第四届“绽放杯”5G应用征集大赛工业互联网、数字治理、医疗健康三大赛道。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">由工业和信息化部主办的第四届“绽放杯”5G应用征集大赛于5月1</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">6</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">日启动项目征集，并于7月2</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">5</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">日结束征集。本届大赛中，由中国电信承办的工业互联网、数字治理、医疗健康三大赛道在两个月间共征集项目2000余个，其中，工业互联网、数字治理两大专题赛征集项目数量均超600个；中国信息通信研究院与中国电信联合承办的医疗健康专题赛征集项目数量达600余个，各赛道均完成项目预期征集计划。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">自三大专题赛开赛以来，中国电信采取定向邀请、广泛吸纳的方式，征集全面覆盖各行业细分领域的应用案例，得到社会各界广泛支持，来自全国各地的参赛团队展现了5G技术与千行百业融合落地的风采。对于5G应用优秀项目与标杆案例的挖掘，有助于深度推进我国5G技术与工业互联网、数字治理、医疗健康领域的融合，有利于发挥5G技术对经济社会数字化、网络化、智能化转型的重要引擎作用，有利于驱动生产方式、生活方式和治理方式升级。 </span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>5G+工业互联网 开启“智”造新时代</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">工业互联网是5G商用的重要领域，发挥5G技术的高可靠、低延时、抗干扰和安全性等特性，升级工业生产场景，是推动工业制造向工业“智”造转变的关键一环，是行业转型升级的新机遇。随着我国制造业转型升级的持续推进，我国工业企业数字化转型受到越来越多的重视，在近日工信部等十部门联合印发的《5G应用“扬帆”行动计划（2021-2023年）》中，5G+工业互联网被列为行业融合应用深化行动之一。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">本届“绽放杯”杯征集大赛中，中国电信主办的工业互联网专题赛围绕 “加快产业创新，重塑发展格局” 主题展开，征集的600余个参赛项目，主要覆盖电子设备生产、装备制造、钢铁、采矿、电力等五大行业，涉及装备制造、石油石化、电力、矿山、钢铁、水泥、汽车、军工、医药、烟草、化工、电子、电器、工程机械、纺织等工业细分领域以及协同研发设计、远程设备操控、柔性生产制造等应用场景。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在往届“绽放杯”中，三一重工、华润水泥、吉利汽车、海螺水泥等一批优秀的“5G+工业互联网”落地项目脱颖而出，成为我国加快“5G+工业互联网”应用落地的标杆。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">相信此次大赛中，越来越多的5G价值场景、标杆项目将会涌现，推动产业数字化转型升级，切实助力工业行业各细分领域降本、提质、增效，赋能中国智造。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>5G+数字治理加快治理能力现代化</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">4G改变生活，5G改变社会。依托5G网络的广泛覆盖、社会治理的感知触角将广泛延伸、深度下沉的数据开始为有关部门“出谋划策”，促进形成科学化、精细化、智能化的治理能力。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">本届大赛的数字治理赛道中，中国电信以“数字赋能、智慧治理”为主题展开征集，共征集600余项目报名参赛，主要集中在社会治理、乡村治理、数字政府治理、城市治理、居民服务、交通治理等领域。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">随着数字技术发展和各类政策红利的助推，我国各类企业纷纷驶入数字治理赛道，落地众多“数治”项目。此次数字治理专题大赛，旨在充分利用5G、大数据、云计算等前沿技术，通过多样化创新“数智融合”凝聚社会治理产业的全新力量，优化管理手段、管理模式，创新管理理念，推进共建共治共享的社会治理格局逐步形成，助力全面实现社会治理现代化。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>5G+医疗健康描绘未来医疗景象</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">5G推动远程医疗的快速发展，打破时间、空间限制，提高公共服务供给数量和质量。尤其在疫情防控和复工复产方面，依托5G技术推出的远程诊疗、智能医护机器人等应用，发挥了重要作用。《5G应用“扬帆”行动计划（2021-2023年）》就明确，5G+智慧医疗作为社会民生服务行动之一，将为民生健康赋能。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">据了解，本届“绽放杯”医疗健康专题赛以“智绘医疗</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">•</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">智享健康”为主题，征集的600余个项目主要围绕5G对医疗健康赋能，涵盖应急救治、远程诊断、远程ICU、远程治疗、医院管理、中医诊疗、智能疾控、健康管理等八大领域，展现了5G+医疗健康的充分融合，为大众描绘了未来医疗的别样景象，以技术应用创新积极响应国家“健康中国2030”战略。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">通过本次大赛将充分发挥行业需求引领作用，推进5G技术在医疗健康领域的进一步融合创新发展，丰富5G技术在医疗健康行业的应用场景，加快培育医疗健康行业新场景新模式新业态，提升医疗健康服务质量和普惠水平。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">随着5G应用征集大赛结束征集，工业和信息化部、中国信息通信研究院、高校或研究机构专家以及行业头部企业客户将于8月开始对各专题赛的百余个项目，进行初步评审。此轮将评选出一批创新能力突出、应用效果优秀、市场前景可观的项目，进入8月底-9月初的决赛。决赛将采取现场展示和答辩的方式，入围项目单位或团队通过PPT或VCR的形式对参赛作品进行全方位展示、陈述，并回答评委提问等。评审专家将根据参赛项目展示和现场答辩情况进行评分，最终评选出一等奖，二等奖，三等奖及各专题赛特别设置的创新奖等。对于落地性强，商业价值高的优秀项目，中国电信还将推荐至第四届“绽放杯”全国总决赛。</span></p>\r\n<p><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">对于在各专题赛决赛中角出的优秀项目，中国电信将引入中国电信5G开放实验室（5G应用产业方阵创新中心）和中国电信5G联合创新中心，引入中国电信投资公司和中国电信5G产业创新联盟投资类成员伙伴，为其提供孵化培育，使各项目得到5G的充分赋能，让其努力成长为数字中国新力量，为经济社会全面进入数字化新时代作出更大贡献。</span></p>\r\n</div></div></p>', 19, 5780, '0', '2', 348, 0, 2, 0, 2, 59, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000060, '国际/港澳台漫游业务介绍', 1, '2022-01-11 03:57:24', '2022-05-11 02:57:10', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">日前，中国电信与山东重工在济南举行战略合作框架协议签约仪式。中国电信党组书记、董事长柯瑞文，山东重工党委书记、董事长谭旭光出席签约仪式并见证签约。中国电信政企信息服务事业群总经理上官亚非、中国重汽常务副总经理王勇代表双方签约。这是中国电信在产业数字化领域，继与美的集团、三一重工、中兴通讯、中建集团等各行业龙头企业开展深度战略合作后落地的又一项重大项目。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">根据协议，双方将共同推进高端装备制造领域的重点项目。中国电信将发挥自身在云网融合、5G和网信安全等方面的突出优势，聚焦构建精品云网、工业智能制造平台、行业网络安全体系、5G应用、基础设施建设等方面，与山东重工进行全面深入合作，推动企业数字化转型，共同树立工业互联网智能制造领域新的标杆典范！</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">目前，中国电信以客户需求为中心，发挥运营商“云、边、端”的协同优势，利用DICT方面集成+运营的优势，从IaaS、PaaS、SaaS三个层面全面发力，在战略合作协议涉及的重点方向上与客户展开全面合作，为客户提供IT基础设施上云和应用上云的综合解决方案，助力客户加快实现自身云化、加快数字化转型。</span></p>\r\n</div></div></p>', 20, 3470, '0', '2', 142, 0, 0, 34, 2, 60, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000061, '如何进行实名补登记', 2, '2022-01-11 04:02:46', '2022-07-11 02:02:14', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">连日来，暴雨袭城，造成郑州阜外华中心血管医院和郑州西30公里处的巩义市经济重镇——米河镇通讯中断，中国电信应急通信神器——系留无人机空中应急基站紧急升空。7月23日18时，米河镇通信恢复；７月24日13:30，郑州阜外华中心血管医院通信恢复。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>中国电信无人机助河南灾区恢复通讯</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在河南发生特大暴雨灾害后，中国电信立即启动“战区保障机制”，组织应急通信车辆、装备、人员时刻待命。灾情就是命令，作为国家一类应急通信专业保障队伍，湖北机动通信局在接到集团公司调度命令后立刻出发，全力支援河南防汛通信保障工作。7月22日23时，湖北机动通信局第二梯队11名突击队员携带系留式无人机基站、背负式基站等23台/套应急装备抵达郑州市。通信保障突击队第二梯队到达米河镇后，迅速利用</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Ka</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">卫星便携站开通系留式空中无人机基站，覆盖范围达50平方公里，使米河镇灾区的通信全面恢复。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">携系留无人机空中平台奔赴河南郑州的还有西安机动通信局应急分队。24日，该分队郑州油机支援组完成重要客户开通4G基站任务后，接到河南电信指挥部紧急通知：郑州阜外华中心血管医院受灾严重，医院一楼已经被完全淹没。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">接到通知后，支援队紧急赶往指令地点，12时20分到达郑州阜外华中心血管医院。因医院涉水严重，无法正常保障电力，支援队员第一时间通知指挥部派遣发电车保障电力通畅。13点30分，支援队伍通过系留式无人机、</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">K</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">a便携小站接通通信信号，完成基站开通。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>系留无人机空中基站应急通信优势明显</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">系留无人机作为应急通信基站，具有快速部署、轻便灵活、起降环境要求低等特点，能实现几十公里范围内快速、可靠、廉价的宽带通信，在突发自然灾害、通信基础设施受到破坏、通信环境恶劣等条件下，其应急通信能力优势明显。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">据了解，中国电信研发的系留无人机净载荷15kg，最大飞行高度为 200m，挂载4G/5G基站类设备，可24 小时不间断空中悬停作业，形成高空基站解决方案，为方圆50平方公里范围内的用户提供语音、数据服务。在小区，其滞空高度为30-200米，覆盖距离为2至20公里，能不间断飞行7×24小时，最高可同时保障800个用户，卫星基站上传最大速率30M，下载最大速率50M。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>应急通讯神器 防灾救灾屡屡显身手</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">近年来，中国电信系留式无人机空中平台不断在防灾救灾和应急演练大显身手。早在2017年6月，中国电信浙江公司就与北京卓翼智能科技有限公司共同完成了系留无人机在电信应急通信行业中的应用测试，效果卓越。同年8月，中国电信举办2017国防交通战备“天翼神剑”抗震救灾应急通信演练，更被外界视为系留式无人机高空基站应急通信的市场化和普及化。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在国家级新区雄安，2018年11月，中国电信河北公司在雄安新区开展抢险救灾应急通信演练，系留无人机完美地满足了河北电信在雄安新区应急高空基站通信预案的制定要求。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">2020年7月21日，湖北省恩施市屯堡乡马者村因山体滑坡淤塞清江发生堰塞湖险情，严重威胁下游屯堡乡及恩施州城区清江沿线群众生命财产安全，中国电信系留式无人机参与湖北恩施防汛通信保障，为恩施州屯堡乡马者村指挥部提供了通信保障。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">暴雨倾盆天如漏，紧急驰援如身受。现代科技无人机，快速精准全天候。驰援河南，从天通一号到系留式无人机空中平台，中国电信“全方位、立体式、天地一体、灵活机动”的强大应急通信保障能力和应急通信铁军的责任和担当一次次得到彰显。</span></p>\r\n</div></div></p>', 21, 2, '0', '2', 20, 0, 0, 13, 1, 61, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000062, '5G覆盖区域查询', 4, '2022-01-11 04:07:35', '2022-08-11 02:07:21', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">7月23日，2021中国电信终端评测发布会在线上召开。发布会由中国电信移动终端研究测试中心主办，以“翼矩·洞察”为主题，发布了两大CTTTC终端技术认证、三大自主创新翼矩终端测试系统和2021年第一期《终端洞察报告》，全方位展示中国电信创新性5G终端测试系统和专业化评测成果，共同探讨5G终端、AI终端、云终端新技术趋势，以及终端适老化等热点问题。</span></p>\r\n<p><span style=\"\">中国电信股份有限公司研究院副院长蔡康表示，当前处在新技术快速迭代与多技术跨域融合的时期，期待产业创新合作面向更广泛的技术领域与基础技术环节，合作模式上更灵活、更深入，联合攻关解决一系列关键技术难题与“卡脖子”问题。在终端评测领域，进一步加强测试技术与标准创新合作、测试系统联合研发，提升终端评测洞察深度与广度，向业界开放提供多专业融合、云网端一体的研发试验环境，为联合创新提供强有力的保障。</span></p>\r\n<p><span style=\"\">CTTTC是中国电信面向产业合作伙伴的终端技术认证体系，对符合中国电信终端技术要求与规范的产品、系统与实验室颁发认证证书，共同推动终端新技术的成熟商用，协同提升终端产品体验。会上，中国电信为通过测试认证的5G终端芯片和5G终端测试系统，颁发CTTTC终端芯片技术认证证书和CTTTC终端测试系统技术认证证书。未来，中国电信将与产业链伙伴共同推动终端新技术成熟商用，协同提升终端产品体验，构建高效的终端技术认证体系。</span></p>\r\n</div></div></p>', 22, 2234, '0', '2', 152, 0, 0, 24, 1, 62, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000063, '一证通查规则介绍', 1, '2022-01-11 07:51:36', '2022-09-11 15:03:53', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">“这次暴雨给医院正常运行造成极大影响，医院上万人转移协调难度大，常规联系方式失灵，中国电信天通卫星手机关键时刻功不可没。”郑大一附院副院长苟建军对应急通信神器忍不住点赞。</span></p>\r\n<p><span style=\"\">受持续强降雨影响，河南省郑州市单日降雨量突破历史极值，这场强降雨造成郑大一附院河医院区全部断电，且面临断水、断网、断药以及断粮的局面，几十台手术被迫中断，ICU里600多名病人失去设备支持，普通病房大量病人输氧告急。转移，成为没有选择的选择。中国电信河南公司在郑大一附院河医院区紧急开通天通卫星业务，全力保障医院转移调度卫星通话畅通，为及时安全转移11350名患者发挥了重要作用。</span></p>\r\n<p><span style=\"\">在这场与时间赛跑的救援中，中国电信抽调精兵强将组成的通信应急保障小分队携带100部天通卫星电话驰援河南灾区。据了解，卫星通信是利用地球同步卫星作为中继而进行的无线通信，是未来全球信息高速公路的重要组成部分，天通一号卫星系统定位于窄带移动卫星通信系统，具有覆盖广、通信距离远、不受地理环境限制等优点，无论是高原、深山还是海洋湖泊、戈壁荒滩，只要能看到天空的地方，都能搜到天通卫星信号，成为救灾应急通信保障和特殊环境通信使用的首选通信产品。</span></p>\r\n<p><span style=\"\">天通卫星移动通信系统是我国自主建设的首个卫星移动通信系统，摆脱了长期对国外卫星移动通信服务的依赖，填补了国内自主卫星移动通信系统的空白。中国电信是天通卫星通信唯一运营服务商，使用1740号段的手机号码作为业务号码，已经实现与国内外通信运营商通信网络的互联互通，为用户提供全天候、全天时、稳定可靠的移动通信服务，这次驰援河南成功实现天地一体的应急通信调度。</span></p>\r\n<p><span style=\"\">实际上，自2018年3月中国电信开展天通卫星业务试商用以来，已为水利、消防、林业、地质、武警、电力、海洋渔业等多个行业客户提供了通信服务，满足了客户在工作、生产中的通信保障需求。天通卫星通信服务与移动通信系统形成性能互补，从而实现海陆空地区全覆盖。作为“陆地有光纤、水下有海缆、空中有移动、天上有卫星”陆海空天一体化的电信运营商，中国电信在危急关头勇担央企责任，冲锋在前，将一批批通信信息“硬核”黑科技投入战斗中，为汛情监测、减灾救灾和城市建设插上“科技之翼”，在应急通信保障任务中发挥中坚力量。</span></p>\r\n</div></div></p>', 23, 4, '0', '2', 5, 0, 0, 3, 1, 63, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000064, '天翼宽带续费', 7, '2022-01-11 08:43:33', '2022-04-11 16:37:55', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">7月22日，中国电信发布公告称，中国证监会发行审核委员会当日审核并通过中国电信A股发行申请。</span></p>\r\n<p><span style=\"\">今年3月9日下午，中国电信在港交所发布公告称，拟申请本次A股发行并在上海证券交易所主板上市。公告显示，此次中国电信拟公开发行A股的数量不超过120.93亿股。</span></p>\r\n<p><span style=\"\">对回归A股的原因，中国电信在此前的公告中表示，一是把握数字化发展机遇，推动“云改数转”战略落地；二是拓宽融资渠道，增强可持续发展能力；三是完善公司治理，提升综合竞争实力。</span></p>\r\n<p><span style=\"\">据悉，本次募集资金净额拟用于5G产业互联网建设项目、云网融合新型信息基础设施项目及科技创新研发项目，未来三年总投资规模为1021亿元。</span></p>\r\n<p><span style=\"\">据介绍，通过深入实施“云改数转”战略和本次A股上市，中国电信将全面提升公司竞争力、创新力、控制力、影响力和抗风险能力，全力打造服务型、科技型、安全型企业。展望未来三年，中国电信的科技创新能力和人才创新活力明显增强，产业数字化拓展能力显著提升，业务结构进一步优化，产业数字化收入占比逐年提高。战略性新兴产业细分领域的布局进一步强化，发展模式与增长方式得到有效转变，经营收入稳定增长，收入利润率稳步提升，企业价值得到新提升。</span></p>\r\n</div></div></p>', 24, 9, '0', '2', 0, 0, 0, 0, 2, 64, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000065, '新鲜优享号码上线', 1, '2022-01-11 11:05:04', '2022-05-11 19:04:10', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">7月16日，中国电信与华为和众多合作伙伴，共同发布了业界首个运营商5G融合应用开放实验室（5G OpenLab）。该实验室将为5G赋能千行百业提供测试验证平台，服务行业合作伙伴基于该平台进行验证、开发创新，将成为各领域行业解决方案的孵化器和赋能中心。</span></p>\r\n<p><span style=\"\">中国电信副总经理刘桂清表示，本次中国电信在业内首次成立5G融合应用开放实验室并与华为成立联合实验室，旨在推动5G产业生态格局的繁荣，是中国电信5G发展战略的重大布局。中国电信将以5G融合应用开放实验室为依托，一方面进行具有自主核心技术的5G定制网产品和解决方案的仿真验证及开展6G等未来网络领域的探索，另一方面将不断深化与行业伙伴的合作，共建融合、开放、共赢的产业新生态，不断提升5G产业现代化水平，为推动国家产业数字化转型贡献力量。</span></p>\r\n<p><span style=\"\">中国电信集团政企信息服务事业群总经理上官亚非透露，中国电信5G定制网已精准覆盖1600多家政企头部客户，为4500多家客户提供5G定制能力，落地超过360个定制网商用项目。此次发布的5G融合应用开放实验室，是中国电信5G定制网整体合作生态规划的重要一环，通过建设、运营5G应用端到端集成测试验证实验室，将为合作伙伴提供一个开放、创新的实体支撑中心，聚合各方能力与资源，共同为千行百业提供各类场景化解决方案。</span></p>\r\n<p><span style=\"\">据中国电信研究院副院长陈运清介绍，中国电信已建设“5G﹢云﹢AI”测试验证平台，实现了一期5G、天翼云、MEC、行业AI应用、PLC、工业机械臂、AGV等典型工业场景落地。中国电信后续将规划建设系列分中心，包括上海生态分中心、智慧煤矿分中心等。</span></p>\r\n<p><span style=\"\">自迈入5G时代以来，中国电信更加注重开放合作，构筑产业生态，赋能千行百业。2019年，中国电信5G产业创新联盟正式成立，截至目前，发展成员单位近300家，汇聚合作伙伴近千家。同时，中国电信创新性构建了中国电信5G产业创新联盟、5G 开放实验室、5G联合创新中心“1﹢1﹢1”联动发展模式，开展典型业务测试平台建设、行业应用标杆示范打造等工作。5G OpenLab是5G产业创新联盟面向合作伙伴打造的端到端的测试验证中心，是将中国电信5G﹢云网产品能力与合作伙伴能力进行整合和协同的赋能中心及创新平台。</span></p>\r\n<p><span style=\"\">相关专家表示，5G OpenLab的成立将加速5G技术与传统行业的融合，催生各种新应用、新模式、新业态，提升企业数字化能力，加速产业数字化转型。</span></p>\r\n</div></div></p>', 25, 4631, '0', '2', 22, 0, 0, 0, 1, 65, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000066, '5G畅享套餐', 9, '2022-01-12 01:49:40', '2022-07-12 02:49:14', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">近日，在2021（第二十届）中国互联网大会科技兴警高峰论坛上，中国电信发布“科技兴警护航计划”。</span></p>\r\n<p><span style=\"\">据悉，“科技兴警护航计划”借助各类通用和公安专用AI算法，打造了包括天翼慧眼、5G公安立体巡防、公安情报大脑、量子加密对讲等面向公安各警种各条线、贴近实战、符合业务需求的智能化场景应用和解决方案。在创新智能警务应用方面，中国电信运用高新技术提供了多种系统服务，与公安部合作搭建的96110劝阻预警专线已在27个省（区、市）开通，“云堤-反资产仿冒欺诈服务”成为中国首家运营商级、基于网络控制能力实现反欺诈的创新型服务，能够有效发现并成功拦截在生效状态的钓鱼网站。</span></p>\r\n<p><span style=\"\">作为参与公安信息化建设的重要力量，中国电信以科技兴警战略对公安信息基础设施提出新的要求为指引，通过统一的行业专网、云基础设施安全底座及差异化原子能力基础，构建政务服务云网、智能感知云网、移动警务云网。以云、网、数、安、用五方面的能力优势构建云网融合、数据融合体系。在公安云网服务建设方面，截至2021年6月，中国电信承建的公安信息网已覆盖全国29个省（区、市），新一代公安信息网覆盖14个省（区、市），警务数字集群网在全国17个省（区、市）部署实施。</span></p>\r\n<p><span style=\"\">据了解，中国电信将继续发挥建设网络强国和数字中国、维护网信安全的主力军作用，积极响应国家战略、公安实战和服务群众需求，坚持以大数据为引领，以新技术手段为支撑，为推进平安中国、法治中国、社会治理能力现代化作出新的更大贡献。</span></p>\r\n</div></div></p>', 26, 6, '0', '2', 0, 0, 0, 0, 1, 66, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000067, '电信4G畅享套餐69元起', 2, '2022-01-14 03:56:29', '2022-09-12 02:41:46', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">矿山里，装载百余吨矿石的卡车流畅、精准、平稳地进行着倒车入位、停靠、倾卸、避障等动作，但驾驶室却空无一人。这不是科幻电影中的场景，而是中国电信通过下沉式5G MEC部署，在安徽省马鞍山南山铁矿实现的国内首个冶金露天矿山多台矿车无人驾驶与有人驾驶混编运行。</span></p>\r\n<p><span style=\"\">随着5G、云计算、大数据、AI等新技术的加速普及，数字化应用正加速改变着我们身处的社会，从前人们想象科幻世界中才有的场景已逐步变为现实。</span></p>\r\n<p><span style=\"\"><b>云网融合通向ICT综合运营之路</b></span></p>\r\n<p><span style=\"\">当前，随着云技术应用的深化，越来越多的政企客户将核心业务上云，对网络的速率、时延、可靠性以及IT系统云化改造经验等要求明显提升，而运营商凭借自身网络优势及IT上云经验，融合网络、云及大数据、AI等能力，为客户提供一站式云网融合服务，打造全新的ICT综合运营模式。</span></p>\r\n<p><span style=\"\">依托行业领先的高质量云网基础设施及服务能力，结合自身BSS/OSS等核心业务系统上云积累的宝贵经验，中国电信围绕客户需求，融合网络、边缘计算、AI等能力，提供IT基础设施上云和应用上云的综合解决方案，帮助政企客户加快自身云化、数字化转型。</span></p>\r\n<p><span style=\"\">在中兴通讯南京滨江工厂的生产线上，一个个通信产品正被快速加工、检测、流转。由于整个工厂采用柔性生产方式，同一生产线上生产多种类产品，这对产品质检等生产环节提出了更高要求，需要在较短时间内对通过的各类产品实现精准检测。过去，实现该目标的方式依赖高昂的成本、人力投入，且准确性难以保障。中国电信发挥运营商“云、边、端”协同的优势，以ICT综合运营的方式为中兴通讯打造了安全可靠的5G智能车间，协助客户将质检模型部署在天翼云，并调动AI能力，利用5G﹢MEC“大带宽、低时延”的特点，实现百兆照片上传、模型判断、结果回传等步骤“秒完”，同时准确率高达97%、漏检率比人工降低80%，在提高效率的同时大幅降低成本。</span></p>\r\n<p><span style=\"\"><b>安全数字化可靠性的底座</b></span></p>\r\n<p><span style=\"\">产业数字化为政企客户带来便利、提升效率，而各类与数字化相关的风险也随之而来、与日俱增。由于网络使用的深化及大数据、云计算等新兴技术的应用，企业网络业务边界不断模糊，网络威胁持续升级，安全事件层出不穷。任何导致业务暂停的网络安全事故都可能给企业带来巨额损失。</span></p>\r\n<p><span style=\"\">中国电信以骨干网运营商独特的网络资源和能力优势为抓手，持续建设覆盖“云、网、边、端、应用”的融合安全技术能力，打造立体化网络安全防护体系。中国电信自主研发的“云堤”平台是国内唯一具有全网覆盖能力和全球触达能力的网络攻击防护平台，全球分布式部署36个DDoS攻击防护节点实现近源清洗，DNS域名解析具备全国监测能力和覆盖31个省（区、市）的DNS秒级同步修正能力。</span></p>\r\n<p><span style=\"\">新冠肺炎疫情防控期间，某重要网站连续被DDoS攻击，攻击峰值曾达13Gbps，其中来自国外的攻击流量占比为60.87%。在发生首次攻击后，中国电信第一时间提供了全流程、可视化的攻击行为监控，让“无形”的网络攻击“现身”。根据大部分攻击流量主要来自境外的特点，中国电信利用运营商的骨干网络防护能力，按照境外、境内两个维度，针对攻击源进行了分布式防护。凭借强大的网络安全能力，中国电信于疫情防控期间在网络空间守卫了国家安全，为产业数字化筑起坚实的安全底座。</span></p>\r\n<p><span style=\"\"><b>一体化服务复杂场景下的专业价值</b></span></p>\r\n<p><span style=\"\">面对客户数字化转型中的新需求，中国电信依托现有覆盖全国的全触点售前支撑服务体系，基于自身云网融合优势能力，深耕垂直行业领域，面向细分市场需求提供从标准化到场景化到定制化的端到端整体解决方案。建立工业、应急、交通物流、住建等十几个行业BG，探索跨界混营新合作模式。进一步强化自研数字平台、原子能力等数字化供给，为用户数字化转型全周期保驾护航。</span></p>\r\n<p><span style=\"\">同时，中国电信在现有服务体系基础上，打造了覆盖全国的属地化专业服务团队，拥有3.6万名具备产业数字化销售和服务能力的专家，其中包括1.6万名从事售中支撑和实施交付的技术型专家。凭借专业的服务能力，中国电信实现从单一网络交付到云网数字化服务整体交付的转变。</span></p>\r\n<p><span style=\"\">在甘肃，中国电信与甘肃省生态环境厅合作，打造覆盖全业务、全流程、全要素的生态环境监测大数据管理平台。中国电信在充分了解需求后，决定采用微服务﹢容器的方式在云端构建统一平台，以一体化交付方式打破原来各业务系统间的数据壁垒。该平台将自然资源、气象、农林、住建、公安等30个厅局级部门及生态环境厅72套在用系统全面打通，实现全省2342个监测站点的有效整合，构建省市县三级、天地空一体的综合大数据平台，为生态治理智能化打下坚实的数据基础。基于云端海量数据，中国电信积极进行政产学研合作，依托大数据、AI等技术，上线预测分析模型，帮助全省环境治理由被动响应向主动预测转变。目前，该模型在大气、水环境预警溯源方面准确率高达97.2%，处于全国先进水平。</span></p>\r\n<p><span style=\"\">5G、云、AI等数字化技术的发展正催生一场社会生产领域无声的革命。无人矿山、智能工厂、智慧生态，一个个高科技应用从想象走向现实，赋予社会发展新动能。作为云网基础设施运营商，中国电信充分发挥自身在云网融合、安全与一体化服务等方面的独特优势，为政企客户提供全新的ICT综合运营服务，赋能千行百业，在建设数字中国之路上砥砺前行。</span></p>\r\n</div></div></p>', 27, 3, '0', '2', 0, 0, 0, 0, 1, 67, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000068, '号码甄选馆', 1, '2022-01-14 03:57:27', '2022-09-12 02:43:15', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">7月1日上午，庆祝中国共产党成立100周年大会在北京天安门广场隆重举行</span><span style=\"\'yes\';;&#10;;\'Times New Roman\';&#10;;\">，中国电信全国劳模在各地观看庆典活动并纷纷留下自己的感言。</span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';\'Times New Roman\';&#10;;\"><b>山西太原分公司党政军分局副总经理、职工创新工作室带头人 薛万强</b></span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">作为基层一线党支部的一名党员干部，一是坚持党建统领，客户至上，变革进取，勇于担当，用党的理论成果指导生产，不断深入党业融合，充分发挥党员先锋模范作用，推动岗位创新，提高生产效率；二是坚持以人民为中心的发展理念，坚定信心顽强拼搏，日益进取，全面落实云改数转战略，全面深化企业改革，不断提升企业综合智能信息化要求，持续提升客户的体验感知，进一步树立中国电信值得信赖的品牌优势，通过抓触点、抓细节、抓过程，全方位推进企业高质量规模发展，顺利谱写新时代中国电信新篇章。</span></p>\r\n<p style=\";&#10;;\"><span style=\"\'yes\';\'Times New Roman\';&#10;;\"><b>内蒙古呼伦贝尔分公司莫尔道嘎营销中心支局长 柴瑞峰</b></span></p>\r\n<p style=\";&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">习近平总书记的讲话激情澎湃，振奋人心，全面回顾筚路蓝缕、披荆斩棘的百年关辉历程，向全党全国全社会发出了在更高起点上推进改革开放，乘势而上开启全面建设社会主义现代化国家新征程、向第二个百年奋斗目标进军而团结奋进的进军号令！作为中国电信一名基层党员，我将学史立行，扎根基层，不负青春与初心使命，为中国电信高质量发展贡献力量。</span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';\'Times New Roman\';&#10;;\"><b>辽宁沈阳分公司客户服务部主任 王玉杰</b></span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">深感生在红旗下的我是多么幸福！多么幸运！深感没有共产党就没有新中国！今天的中国实现了崛起！实现了跨越！实现了辉煌！这是百年来无数中国共产党员在看得见看不见的战场上，追求理想、坚定信念、披荆斩棘，从开天辟地到改天换地到翻天覆地的历史性成就！作为一名中国电信员工，我将继续以昂扬的斗志和饱满的热情，投身于全心全意为客户服务的工作中，传承好“人民邮电为人民”的红色基因。</span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';\'Times New Roman\';&#10;;\"><b>上海分公司崇明局实体渠道运营中心员工、上海分公司客户服务一级专家 邱莉娜</b></span></p>\r\n<p style=\";&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">生逢盛世，深感荣幸；恰逢百年，感恩我党。</span><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">我党百年来坚持真理、坚守理想、始终践行“以人民为中心”的根本宗旨，总书记说“只有中国特色社会主义才能发展中国”更坚定了我们强国的信心，坚定了我们电信人在数字中国发展中的信心。我将始终立足岗位，将劳模精神、劳动精神、工匠精神一以贯之的发扬和传递开来，全心全意服务好党员群众、服务好电信客户，在云改数转的前进道路上勇于担当、不断提升，为数字城市建设作出新的贡献！</span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';\'Times New Roman\';&#10;;\"><b>江苏南京六合分公司党总支书记、总经理 杨春泽</b></span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">100年的风风雨雨，100年的励精图治，我们的党带领我们披荆斩棘，一往无前。作为一名共产党员，一名电信人，我们要不忘初心和使命，发挥好先锋模范作用，把建设维护祖国通信网络的责任始终扛在肩上，时刻把人民邮电为人民记在心中，把我们的青春奉献给祖国和人民。祝愿伟大的党永葆青春，祝福伟大的祖国繁荣昌盛！</span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';\'Times New Roman\';&#10;;\"><b>江苏徐州分公司创新业务运营中心主任 董青</b></span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">伟大的中国共产党带领全国各族人民，在建国后的几十年时间里，我国小麦、水稻、土豆的产量世界第一！钢铁年产量不仅世界第一，而且超过日本和美国年产量之和的10倍！中国高速公路里程、高铁里程世界第一！一张张中国名片亮相世界！听到习近平总书记庄严宣告“我们实现了第一个百年奋斗目标，在中华大地上全面建成了小康社会！”我热泪盈眶，久久不能平静。我们站在这样一个新时代、新起点，做为一名党员，做为一名基层党支部书记，我们要紧紧跟着中国共产党，做好每一件事，向下一个百年目标进发！</span></p>\r\n<p style=\";&#10;;\"><b><span style=\"\'yes\';\'Times New Roman\';&#10;;\">安徽淮北分公司政企部信息化解决方案经理 </span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">刘红丽</span></b></p>\r\n<p style=\";&#10;;\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">我将珍惜荣誉、再接再厉，干在实处，走在前列，争做云改数转领航者，在服务客户中体现新担当、在云改数转中展现新作为，为企业高质量发展作出新的更大贡献！</span></p>\r\n<p style=\";;&#10;;\"><b><span style=\"\'yes\';\'Times New Roman\';&#10;;\">安徽分公司无线网络优化中心专业技术总监 </span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">刘通</span></b></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">我将深入学习贯彻习近平总书记在庆祝中国共产党成立</span><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">100周年大会上的重要讲话精神，继续以昂扬的斗志和饱满的热情投入到建设网络强国、数字中国、维护网信安全的各项工作中，为企业高质量发展再创佳绩，再立新功。</span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';\'Times New Roman\';&#10;;\"><b>江西九江分公司云网中心工业互联网团队长 屈勇</b></span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">作为一名党员，我深切感受到习近平总书记重要讲话中透出的强大信仰力量，深切领会到没有中国共产党就没有新中国。我将保持赤子之心，始终牢记从哪里来、到哪里去。永远保持干一行、爱一行，钻一行、精一行的敬业精神，立足本职，积极工作，把普通的岗位变成精彩的舞台，将平凡的事情做得更加精致，争做网络强国的奋进者。</span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';\'Times New Roman\';&#10;;\"><b>江西吉安分公司总经理助理 曾满春</b></span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">我是一名中国人，我是一名共产党员！当世界上很多人还受着战乱流离失所、受着饥饿的威胁，而我们能有今天这样幸福安定的生活，正是因为中国共产党的坚强领导，正是因为祖国的风雨兼程和强大！传承红色基因，赓续红色血脉。在今后的工作中，我将不忘初心、牢记使命，当好“红色电信基因”的传承人、守护者，践行云改数转战略，发扬劳模精神和工匠精神，立足岗位、苦练技能、积极创新，为企业发展做出更大贡献，为祖国和人民奉献一切。</span></p>\r\n<p style=\";;&#10;;\"><b><span style=\"\'yes\';\'Times New Roman\';&#10;;\">江西抚州分公司</span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">VIP保障班班长</span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">&nbsp;宗强</span></b></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">青春逢盛世，奋斗正当时。作为一名共产党员，作为一名新时代的基层劳模，是党把我从一个普通的装维员培养成为全国劳动模范，我将坚定做中国特色社会主义的信仰者、倡导者和传播者，做云改数转的领航者，在客户服务中体现新担当、在通信保障中展现新作为，用自己的信念与行动传承共产党人的精神谱系、赓续共产党人的红色血脉，让党旗更红党徽更亮。请党放心，网络强国有我，网信安全有我，再立新功有我！</span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';\'Times New Roman\';&#10;;\"><b>湖北武汉分公司数据维护室主管 潘圣宇</b></span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">一百年砥砺风雨，一百年沧海桑田，在党的领导下，中国在波澜壮阔的历史进程中不断壮大。在建党100周年之际，我们应当响应党中央的号召，在工作中不畏艰险，埋头苦干，攻坚克难。我们要传承红色电信精神，为人民提供更好的通信服务，为云改数转战略落地贡献力量，为开创中国电信高质量发展新局面拼搏奉献，为实现中华民族伟大复兴中国梦而不懈奋斗。</span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';\'Times New Roman\';&#10;;\"><b>湖北传输局技术总监、高级专家 郑成林</b></span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">百年恰是风华正茂，百年初心历久弥坚。我深深体会到一代代共产党人坚持真理、坚守理想，践行初心、担当使命，不怕牺牲、英勇斗争，对党忠诚、不负人民的伟大精神。作为党龄19年的我，更加坚定理想信念，践行党的宗旨，牢记人民邮电为人民的初心，传承发扬红色电信精神，在践行集团公司云改数转战略中，为网络强国、数字经济发展贡献更大的力量。</span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';\'Times New Roman\';&#10;;\"><b>湖南郴州宜章分公司副总经理 李乾初</b></span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">作为一名中国人，感恩生活在中国共产党领导的伟大复兴的新时代里，是中国共产党让每一位中国人当家作主，让所有中国人倍有安全感、获得感、幸福感！作为一名党员，感恩中国共产党的培养、考验和教导，是中国共产党引导我们追求向往幸福美好生活，让我们有理想信仰、有奋斗目标！作为一名电信人，感恩工作在中国共产党领导下有社会责任、有担当的国有企业，企业生机勃勃、员工干事创业激情高涨。艰辛百年历程，让我们更加珍惜来之不易的今天，作为新时代劳动者，发挥三牛精神，贯彻落实新发展理念坚持高质量发展，加快云改速转转型，为实现企业十四五发展目标担当作为、奋斗拼搏！</span></p>\r\n<p style=\";;&#10;;\"><b><span style=\"\'yes\';\'Times New Roman\';&#10;;\">广东广州分公司网络操作维护中心主任</span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">&nbsp;邓艳梅</span></b></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">作为一名光荣在党24年的党员和全国劳模，要继续坚持党建统领，始终将“传承自主创新精神，以高质量创新赋能高质量发展”牢记在心。作为全国示范性劳模和工匠人才创新工作室带头人，必须肩负起信息时代的历史重任，坚定传承红色电信基因，勇于创新作为。今后将继续大力弘扬劳模精神、劳动精神、工匠精神，聚焦云改数转，积极赋能千行百业数字化转型，带领创新团队继续发挥工作室的示范引领、集</span><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">智创新、协同攻关、传承技能、培育精神等作用，以高质量创新赋能高质量发展，在建设网络强国和数字中国、维护网信安全方面担当作为，奋力建功新时代。</span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';\'Times New Roman\';&#10;;\"><b>广东深圳分公司物联网中心经理 张蕴</b></span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">习近平总书记代表党中央在这样一个历史时刻，向全体党员发出了号召！强国有我，响应习近平总书记和党中央号召，就是要在深刻理解中华民族伟大复兴的中国梦——这一伟大目标基础上，我们更加脚踏实地、更加自信地、更高要求地做好自己的本职工作，知道为什么而干，怎么干才是真正干得好，不怕困难牺牲，敢于胜利！始终胸怀千秋伟业，始终坚定信仰，始终不忘初心，牢记使命，为实现第二个百年目标建功立业！</span></p>\r\n<p style=\";;&#10;;\"><b><span style=\"\'yes\';\'Times New Roman\';&#10;;\">海南分公司室分优化工程师 </span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">吴琦</span></b></p>\r\n<p style=\";&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">总书记总结了党百年来团结带领全国各族人民伟大的奋斗历程，在以后的新征程当中寄予了青年殷勤的期盼，以史为鉴，开创未来，我们唯有始终跟党走，紧密地团结在以习近平为核心的党中央周围，努力奋斗，才能实现中华民族伟大复兴的中国梦！</span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';\'Times New Roman\';&#10;;\"><b>贵州分公司网络优化支撑技术员 陈守益</b></span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">作为全国劳模，要坚定不移听党话、跟党走，要带头践行社会主义核心价值观，学习新知识，掌握新节能。近期，我在收集学习中国电信贵州公司1959年全国劳模王淑琴手动接通电话线路、打破并多次刷新全国接线记录的故事，接下来，我会将劳模精神继续传承和发扬下去，做好身边同事的楷模。</span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';\'Times New Roman\';&#10;;\"><b>西藏分公司党群部干事 罗布顿珠</b></span></p>\r\n<p style=\";;&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">没有共产党就没有新中国，没有共产党就没有新西藏的今天。一百年来，党一直带领着各族人民昂首跨步向前劈波斩浪，开辟航向。作为一名电信员工和共产党员，更是一名劳模，深感责任重大，使命光荣，我将积极响应总书记的号召，坚定理想信念，牢记党的初心与使命，发扬劳模精神，传承红色电信发展史，启航新征程，为实现第二个百年奋斗目标，责无旁贷，奉献青春力量。</span></p>\r\n<p style=\";&#10;;\"><span style=\"\'yes\';\'Times New Roman\';&#10;;\"><b>甘肃分公司网络监控维护中心基础设施维护部主任 王芙蓉</b></span></p>\r\n<p style=\";&#10;;\"><span style=\"\'yes\';;&#10;\'Times New Roman\';;\">我深深的感受到我党伟大和国家的强盛，真切感受到了人民对党的无限热爱和拥戴。我是感受着党带领人民站起来、富起来，到强起来的一代人，因此加倍的热爱生活，珍惜工作。30几年前的我，因没有作业本在操场地上用碳墨棒写字，因家里没电视到邻居家院子里看12寸的黑白电视，因一年做一套新衣服而高兴好久，觉得最好吃的就是过年一瓶罐头。这30多年，我真的看到了国家翻天覆地的变化，也身历其境的感受到了党领导人民一步步走向富裕的艰辛。中国共产党万岁！</span></p>\r\n</div></div></p>', 28, 1457, '0', '2', 61, 0, 0, 5, 1, 68, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000069, '中国电信推出天翼空中上网产品', 4, '2022-01-12 06:47:55', '2022-09-12 02:46:51', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">IPv6将是网络基础设施发展以及产业生态构建的最终方向，加快部署IPv6是加快网络强国建设、加速国家信息化进程、助力经济社会发展、赢得未来国际竞争新优势的紧迫需求。现在我国IPv6部署情况如何，产业推进向何处发力？请关注本版报道。</span></p>\r\n<p><span style=\"\">互联网协议第六版（IPv6）是数字经济发展的关键性技术，在信息通信业发展中发挥着重要作用，其规模部署和广泛应用，将催生各种新技术新业态，有力支撑经济社会发展。构建基于IPv6的网络空间命运共同体，是适应全球信息通信业演变趋势的迫切需要，也是全球民众共享快速进步的信息文明的必要条件。通过分析研判信息通信业演变趋势，中国电信提出构建基于IPv6的网络空间命运共同体的倡议。</span></p>\r\n<p><span style=\"\"><b>信息通信业正沿着“ACT”的方向加速演进</b></span></p>\r\n<p><span style=\"\">当今世界正经历百年未有之大变局，新一轮科技革命和产业变革加速演进，正在重构全球创新版图、重塑全球经济结构。随着以人工智能、量子信息、移动通信、物联网、区块链为代表的新一代信息技术的广泛应用，信息通信业正沿着“ACT”的方向加速演进。</span></p>\r\n<p><span style=\"\">从行业成长的角度看，“三箭齐发”推动信息通信业螺旋式成长。“ACT”中的A是Arrow，即“箭”，指影响信息通信业成长的因素，根据影响时间的长短，把相关因素分为“短中长”三支利箭，短箭是AR、VR、MR以及toB市场的业务创新，将在未来5年驱动信息行业快速发展；中箭是5G的规模商用和快速发展，将在未来10年成为推动行业升级的重要力量；长箭是数字技术的广泛应用，推动生产、生活和社会的智能化升级，将在未来20至30年深刻影响人类社会的发展进程。当前，信息通信业正处于三支利箭同时发射、相互影响、互相促进的开端期，短箭大视频的突破将进一步丰富中箭5G的应用场景，进而推动长箭行业数字技术和应用的发展。</span></p>\r\n<p><span style=\"\">从价值创造的角度看，信息通信业正在加速实现3C转变。5G为社会带来新价值，推动传统的3C（即计算机Computer、通信Communication、消费电子ConsumerElectronics）向新3C（即“ACT”中的“C”）转变。第一个“C”是“Connection（连接）”，泛在连接带来的永远在线将为各行各业以及全社会的智能化发展提供基础，连接的价值将极大凸显。第二个“C”是“Control（控制）”，5G的通信交互将承载各种各样的控制信息，通过控制实现工业自动化、远程手术、远程施工、远程驾驶等，过去属于控制的事情，今天可能成为通信的一个应用。第三个“C”是“Convergence（融合）”，即5G将与各行各业垂直领域深度融合，为千行百业注智赋能，加快产业创新进程，产生新应用、催生新业务、创造新价值。据预测，到2025年，5G带动1.2万亿元网络建设投资，拉动8万亿元信息消费，直接带动经济增加值2.93万亿元。</span></p>\r\n<p><span style=\"\">从技术演进的角度看，信息通信业正加速转型升级。这种转型（即“ACT”中的“T”Transformation）主要体现在三个方面。</span></p>\r\n<p><span style=\"\"><b>——IP协议正加速从IPv4向IPv6转型升级</b></span></p>\r\n<p><span style=\"\">一方面，IPv6网络升级不断提速，全球大型网络运营商、网络接入服务提供商加快IPv6网络建设与升级并加快向IPv6单栈网络演进。另一方面，IPv6应用规模显著扩大，头部互联网企业及服务提供商加快各类应用由IPv4向IPv6的迁移进程，Alexa排名前1000的网站中，IPv6的支持率已近30%并呈稳步上升趋势。截至今年4月，国内IPv6活跃用户数已达5.15亿，占全部互联网用户的52.1%。</span></p>\r\n<p><span style=\"\"><b>——网络连接正加速从“人人互联”到“万物智联”转型升级</b></span></p>\r\n<p><span style=\"\">国内信息通信业的人口红利已接近“天花板”，2020年移动互联网用户达13.5亿户，普及率达95.5%，几近饱和，未来将走向存量市场的新常态。而物联网的发展进入井喷期，物的连接将成为下一个即将爆发的连接红利。2020年全球物联网连接数达117亿，首次超过非物联网连接数，实现历史性跨越。预计到2025年，全球物联网连接数达到309亿，远超非物联网连接数。我们正迈入万物智联时代，将为IPv6提供巨大的发展空间。</span></p>\r\n<p><span style=\"\"><b>——信息基础设施正加速从“云是云、网是网”向云网融合转型升级</b></span></p>\r\n<p><span style=\"\">随着数字技术由消费领域向生产领域、由虚拟经济向实体经济延伸，云计算逐渐成为人工智能、工业互联网、大数据、物联网等新技术新应用的基础承载。“一切业务由云提供，云提供一切业务”正走向现实。IDC预测，2025年中国90%以上的应用迁移到云上，数据中心将全面云化。从5G建设和发展看，5G核心网和应用均构建在云上，云成为加快推进5G领先战略的关键。Gartner预测，2022年全球80%的AI技术应用使用公有云基础设施。各行各业逐渐从“上网”演变到“上云”，云网成为赋能千行百业数字化转型的新型信息基础设施。</span></p>\r\n<p><span style=\"\"><b>中国电信推进基于IPv6的云网融合发展</b></span></p>\r\n<p><span style=\"\">中国电信作为我国信息化建设的主力军和国家队，积极适应全球信息通信业发展演变趋势，全面实施“云改数转”战略，加快推进基于IPv6的云网融合发展，加快打造“网是基础、云为核心、网随云动、云网一体”的新型信息基础设施。一是加快5G建设发展，通过与中国联通共建共享，率先建成全球规模最大的5G SA网络，累计开通5G基站43万站，网络覆盖全国所有地级以上城市和部分县城。二是持续深耕基础网络，率先建成覆盖全国城乡的全光网络，在300个城市部署千兆网络。三是加快数据中心和云业务布局，数据中心规模居国内第一位、全球第二位；天翼云是全球运营商最大的云，在国内混合云市场排名第一、公有云市场排名第四；率先研发云终端系列，包括云手机、云电脑、云桌面、云游戏等。</span></p>\r\n<p><span style=\"\">长期以来，中国电信高度重视并积极推动IPv6的技术创新和商用工作。早在2003年，中国电信就作为CNGI成员开展IPv6业务示范和试验。2009年，作为中国最早启动IPv6试商用的运营商，在江苏和湖南开展现网试用，实现了IPv6商用化的突破。2013年，对北京、上海等10个省（区、市）21个城市的城域网和接入网进行IPv6改造；中国电信4G LTE网络完全按照IPv6标准建设，在国内最早实现了IPv6在移动网的应用突破。</span></p>\r\n<p><span style=\"\">近几年，中国电信进一步深化IPv6规模部署和技术创新。一是全面推动基础设施的IPv6改造，目前固定网、移动网、IDC和云全部支持IPv6。二是持续深化IPv6技术创新，成功开展基于纯IPv6的5G SA现网试验，开始运营商网络从双栈向单栈演进的首例探索；推进SRv6在城域网、骨干网和移动承载网等多个场景的试点和部署，基本实现SRv6全国覆盖。三是利用IPv6的云网优势开展赋能，为200多家大型单位提供IPv6改造方案，为2000多家行业客户开通IPv6互联网专线。四是打造自有应用的IPv6示范，完成中国电信集团26个门户网站、54个APP的IPv6改造，中国电信集团官网获全球IPv6论坛颁发的中国首张IPv6二阶段认证证书。</span></p>\r\n<p><span style=\"\"><b>三向发力促进全球IPv6更好更快发展</b></span></p>\r\n<p><span style=\"\">为促进全球IPv6更好更快发展，加快构建基于IPv6的网络空间命运共同体，中国电信提出三点倡议。</span></p>\r\n<p><span style=\"\">一是“开放”，坚持技术无国界，加快推动技术融合发展。科学技术是世界性的，应打破技术的国界壁垒，把握IPv6带来的创新机遇，加快实现关键前沿技术的新突破，加强对下一代互联网基础性、前瞻性、创新性研究，推动IPv6与工业互联网、物联网、云计算、大数据、人工智能等融合发展，共同推动技术进步。</span></p>\r\n<p><span style=\"\">二是“合作”，加强技术合作，打造联合创新生态。运营商在网络建设和服务、内部数字化转型以及服务各行各业数字化转型中，积累了丰富经验。中国电信愿与产业各方加强合作，全面开展联合创新，共同打造、持续繁荣IPv6生态。</span></p>\r\n<p><span style=\"\">三是“共享”，加快技术推广应用，使全世界人民共享技术进步红利。推动IPv6新技术的广泛应用，进一步加强IPv6对千行百业的赋能，充分释放IPv6的技术潜能和优势。发挥运营商的云网优势，积极运用基于IPv6的数字化技术，助力全社会数字化转型，支撑“智能减碳、绿色发展”，加大科技扶贫和减贫力度，以技术力量造福人民。</span></p>\r\n<p><span style=\"\">* * *</span></p>\r\n<p><span style=\"\">新技术催生新动能，新动能激发新活力。作为用户规模最大的互联网大国，我国要加快推动IPv6技术创新和应用推广，促进下一代互联网在经济社会各领域深度融合应用，构建基于IPv6的网络空间命运共同体，推动经济社会发展和全球数字化转型。</span></p>\r\n</div></div></p>', 29, 1578, '0', '2', 40, 0, 0, 2, 2, 69, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000070, '超值家庭套餐，语音流量共享', 7, '2022-01-12 06:58:27', '2022-08-12 02:57:50', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">过去，当一位身处新疆的患者需要接受上海顶级专家的胃镜检查时，他和陪护家属都要经过舟车劳顿前往上海。一场检查下来，不仅花费巨大更让全家疲惫不堪。现在，随着智慧医疗不断发展，5G平台下磁控胶囊胃镜远程诊查的可行性被印证。新疆患者只要在家门口的医院，通过先进的5G磁控胶囊胃镜远程诊查，就能获得上海顶级专家的诊断资源，这不仅保证了检查的及时性、准确性和便利性，更使基层及边疆地区的消化道肿瘤早诊早治工作效率得到大幅提升。上海同济医院常态化开展与克拉玛依市中心医院的5G远程医疗，相隔千里不再成为分享优质医疗资源的阻碍。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">近年来，5G+医疗健康政策陆续出台，应用场景不断增加，加快推动5G在医疗行业的建设、应用和产业发展。走进5G时代，4K/8K的长距离高清巡诊和医学影像数据的高速保密传输和共享成为现实，相距千里的医疗专家随时都可以进行诊察，解决了过去存在的优质医疗资源供给不足、分布不均的问题，患者可以在家门口高质地享受到来自一线城市的医疗服务；同时，对医生而言，5G技术的加入有利于不同地区、不同医院之间专业业务的交流，信息加速互通帮助医生拥有更多机会交流、提升医务水平。此外，在医院内部管理方面，5G技术的赋能可以助力医院低成本实现精细化管理，达到“全面感知数字化、全景可视云端化、全局联动智能化”的“三化”升级。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">无疑，5G医疗时代，群众更便捷地享受优质医疗资源，医院和医生也有了全新的发展机遇，可以说，5G的出现让医疗行业朝着更优质、更灵活、更实惠的方向发展。但同时，如何不断升级、推动5G在医疗健康领域的应用则需要全行业共同努力。那么，关于5G智慧医疗，未来还有什么可能性？</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">为了推动5G技术在医疗领域的应用与融合发展，近日，工业和信息化部主办的第四届“绽放杯”5G应用征集大赛在北京正式启动，本次大赛中，由中国信息通信研究院联合中国电信主办的医疗健康专题赛以“智绘医疗·智享健康”为主题，旨在发挥行业需求引领作用，以技术应用创新积极响应国家“健康中国2030”战略，推进医疗健康与信息技术的创新融合。全社会各行各业在5G医疗健康领域的创新应用、所有与5G应用相关的智慧医疗健康类项目均可报名。</span></p>\r\n<p style=\";\"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">如果你对5G智慧医疗有独到见解或是技术创新想法，不要犹豫，你就是下一个改变医疗领域的人！医疗健康专题赛本轮征集时间截止到2021年7月15日24:00前，赶快登录官网www.5gaia.org.cn，选择医疗健康专题赛即刻报名，未来世界健康由你定义！</span></p>\r\n</div></div></p>', 30, 19, '0', '2', 0, 0, 0, 0, 2, 70, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000071, '天翼高清（IPTV）', 1, '2022-01-12 11:33:59', '2022-07-12 19:33:12', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">初夏的八闽大地，万木葱茏。从福州的智慧社区到泉州的5G智慧园区，再到厦门的5G智慧医院，数字化之花盛放。</span></p>\r\n<p><span style=\"\">2000年，时任福建省省长的习近平在全国率先提出“数字福建”建设规划，成为“数字中国”的思想源头和实践起点。20年来，中国电信坚决响应，积极落实，充分发挥主力军作用，全身心投入数字福建的建设中。</span></p>\r\n<p><span style=\"\">“数字福建”的探索和收获，为数字中国开拓了道路。多年来，从数字福建到数字中国，中国电信始终如一，深度参与信息化建设，为社会发展方方面面不断注入新动能。</span></p>\r\n<p><span style=\"\">贯通数字中国信息大动脉</span></p>\r\n<p><span style=\"\">数字福建的实质是建设信息化的福建，而信息化的基础在于四通八达的“信息高速公路”。20年来，从数字福建建设的主力军到数字中国建设的排头兵，中国电信主动承接重点工程，全力构建信息“大动脉”，不断夯实社会数字化底座。</span></p>\r\n<p><span style=\"\">在有线网络方面，深入实施“数字福建·宽带工程”，持续推进宽带提速。2020年5月25日，中国电信在福建启动“三千兆”网络服务，目前，千兆光宽网络已基本覆盖福建省城区。在无线网络方面，从3G到4G再到5G，中国电信始终走在移动通信技术发展前沿。2020年7月底率先实现福建全省重点乡镇及以上区域5G网络全覆盖，累计建设5G基站超过1万个。在云资源方面，中国电信东南云基地推进“3﹢9﹢X”云数据中心布局，为各级政府重点网站提供云存储、云备份，服务200多家知名企业。</span></p>\r\n<p><span style=\"\">在“信息高速公路”上，数字福建的“点睛工程”——政务信息网建成开通。2002年1月，中国电信承建的“数字福建”骨干工程——福建省政务信息内网开通；2005年开通“数字福建”中小企业信息化平台；2009年建成农村党员远程教育系统，开通福建省电子政务外网；2012年福建政务内外网云平台启用；2020年8月起，承建全国首个省级信创云项目——福建省级自主可控云平台，充分满足各级政务部门信息上云需求。</span></p>\r\n<p><span style=\"\">在全国范围内，中国电信持续构建信息“大动脉”、加强数字化底座建设。截至2020年年底，中国电信和中国联通共建共享5G基站超过33万个，5G网络已覆盖全国地级以上城市及重点县市。在云资源方面，中国电信积极推进“天翼云”向“2﹢4﹢31﹢X﹢O”的层次化布局演进，在全国拥有315个云资源池，实现了网随云动、入云便捷、云间畅达，形成了具有独特优势的云网融合资源和服务能力。</span></p>\r\n<p><span style=\"\">“信息高速公路”贯通神州，成为数字中国建设的坚实基础。</span></p>\r\n<p><span style=\"\">打造数字化产业升级标杆</span></p>\r\n<p><span style=\"\">今天的福建，数字化对传统产业的赋能作用日渐凸显。</span></p>\r\n<p><span style=\"\">走进九牧5G智慧园区，记者看到施釉机器人正在工作间忙碌着，机械臂上下左右挥舞，釉浆就被均匀地施在马桶胚体表面。在低时延的5G专网支持下，施釉机器人可以远程下发、灵活配置施釉工艺参数，大大提高了操作的实时性和安全性。不远处，一台台AGV无人物流运送车满载着即将装箱的马桶，准确地送往放置点……中国电信联合九牧公司打造的5G智慧园区，实现了车间、厂间自动化出入库，AGV无人物流运送、5G﹢机器视觉检测产品等，促进九牧生产效率提高35%，能源用量减少7%，运营成本降低8%，产品不良成本率降低5%。</span></p>\r\n<p><span style=\"\">如今，像九牧5G智慧园区工厂这样的“灯塔工厂”在全国范围内日渐增多。中国电信推出5G定制网，满足垂直行业的差异化需求，打造了工业互联网、智慧园区等垂直行业标杆。截至2020年年底，中国电信5G行业应用累计签约近1900家，落地场景超过1100个。</span></p>\r\n<p><span style=\"\">2019年11月，厦门大学附属心血管病医院成功通过中国电信5G传输技术与台湾地区手术团队进行心脑血管手术双向直播，全程音视频传输无卡顿和时延，吸引海内外3000余名心血管界专家学者及线上近万名医生观摩。</span></p>\r\n<p><span style=\"\">厦门大学附属心血管病医院是福建首家5G全覆盖医院，在这里，不仅远程医疗成为可能，全程信息化的就医流程更给患者和家属带来了良好体验。能够自由穿梭在医院各处复杂环境与人流中，会自动呼叫并自行搭乘电梯，运送所有病区的临时医嘱、针剂、出院带药等物品的5G医院物流机器人；能提供高清的影像资料，提高医生阅片效率和准确性的“云胶片”服务；还有智能药柜、智能床垫、5G消毒机器人等一系列智能化设备，让厦心医院成为5G﹢智慧医院的标杆。</span></p>\r\n<p><span style=\"\">现在，5G﹢远程医疗从“试验阶段”走向“临床阶段”。基于中国电信5G网络，安徽大山里的百姓能够足不出户便能得到权威专家的远程诊断；疫情期间，四川大学华西医院放射科利用5G双千兆﹢远程CT扫描助手，为湖北黄冈新冠肺炎患者进行远程CT扫描；千里送爱，京藏成功实施国内首例大骨节病5G远程手术……</span></p>\r\n<p><span style=\"\">随着信息大动脉贯通神州大地，中国电信积极落实“云改数转”战略，充分运用5G、云计算、大数据、AI等信息技术，深化与工业、医疗、交通等各领域的创新合作，为数字中国增添新动能。</span></p>\r\n<p><span style=\"\">绘就信息化服务民生蓝图</span></p>\r\n<p><span style=\"\">走出流水线繁忙的工厂，走进烟火气萦绕的社区，记者看到信息化正悄然触及榕城的基本民生。如今，“推动信息化更好造福社会、造福人民”的美好愿景正成为惠及人民大众日常生活的生动现实。</span></p>\r\n<p><span style=\"\">位于福州市鼓楼区中心的军门社区建于1952年，拥有居民3000多户、人口1.3万余人。踏进这个历史悠久的社区，智慧生活的气息扑面而来。智能门禁系统为居民提供人脸、IC卡、实名制二维码、随机密码等多种开门方式；基于物联网地磁提车系统，居民只要通过社区公众号就可实时掌握小区空闲车位分布情况，以迅速找到停车位……</span></p>\r\n<p><span style=\"\">在全国，像军门社区这样的智慧化社区越来越多，“出入一张脸”、服务“一键办理”成为居民生活的常态。在更多地区，中国电信积极运用物联网、人工智能、大数据和5G技术，在社区部署智能音箱、智能门禁、智能消防栓等创新应用，为更多居民创造了安全、舒适、便捷、幸福的现代化生活空间。</span></p>\r\n<p><span style=\"\">治水之困、停车之难，给福州居民的生活带来了极大不便，也给社会治理增加了难度。物联网技术运用于基层治理之后，状况得到了极大改善。</span></p>\r\n<p><span style=\"\">从2017年起，针对福州台风季引起的城市内涝难题，中国电信首创物联网水系联排联调平台，在47个易涝区域、833个智能井盖、260个水位监控点、107个江河流速监测点、12个小型气象站部署了1500个物联网传感器，实时采集、监测城区水库、湖泊、闸站、内河水位和路面积水数据，提升城市排涝物资的调配和响应效率。福州市联排联调指挥中心相关负责人表示：“通过智慧治理，福州市城区排水防涝应急处置效率提高了50%，库湖河调蓄效益提高了30%以上。现在，福州城区内河水系治理和内涝防治正从‘九龙治水’向‘统一作战’转型。”</span></p>\r\n<p><span style=\"\">2020年2月，华榕集团与中国电信共建的第三代“城市大脑·智慧停车系统”正式上线，通过智能化的信息采集终端，智能化调度福州城区超过3万个公共停车泊位的动态信息。从此，福州的车主告别了“抢车位”的困窘。</span></p>\r\n<p><span style=\"\">从福建到全国，中国电信在赋能社会现代化治理方面不断探索，越来越多的“福建样本”在各地落地。集信息采集和数据分析于一体的“智慧城市大脑”向城市治理注智赋能；“天翼看家”进村入户，为平安乡村建设添砖加瓦；火神山、雷神山医院“云监工”更让我们看到了未来社会治理的场景……</span></p>\r\n<p><span style=\"\">潮起东南，数字中国正汹涌澎湃。“十四五”规划纲要为数字中国建设描绘了新蓝图，中国电信将持续深入数字福建建设，充分发挥数字中国建设主力军作用，加快推进“云改数转”战略，助力开启数字中国建设新征程。</span></p>\r\n</div></div></p>', 31, 1, '0', '2', 0, 0, 0, 0, 1, 71, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000072, '一站式服务', 9, '2022-01-13 11:56:22', '2022-06-13 03:55:58', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信签约利好接二连三。6月9日，中国电信一日内先后与华为、哈电和中兴三家龙头企业签署战略合作协议，并与紫光股份进行了深入交流。中国电信系列战略合作升级，聚焦云网核心能力战略，落实创新驱动发展，加强产业生态的联合创新，有望搭建技术创新与产业发展桥梁，推动深化“云改数转”战略，推进企业高质量发展。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>与华为战略合作全面升级共筑科技创新高地</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">6月9日上午，中国电信与华为公司在京举办战略合作升级签约仪式，中国电信董事长柯瑞文、华为轮值董事长徐直军出席。中国电信副总经理刘桂清、华为中国地区部总裁鲁勇代表双方签署《云网核心能力战略合作协议》。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">作为中国电信长期战略合作伙伴，除传统ICT产品技术领域的持续合作，华为从2015年就与中国电信在天翼云、BJIC(商业联合创新中心)等领域进行了业界开创性合作并取得丰硕成果。基于科技强国、十四五发展大背景，本次双方进一步深化战略协同，再次引领行业战略合作新模式，共谱云网融合发展新篇章。根据协议，中国电信与华为将进一步深化战略协同，以科技创新为核心，在云和云网操作系统、网络信息安全、业务创新三大领域深度合作，以云和云网操作系统领域为例，双方将基于OpenEuler和OpenGauss等国产化开源社区，开展操作系统、数据库和服务器等根技术攻关，解决“卡脖子”问题。在安全领域，双方联合产业伙伴在CCSA/TC260/ETSI等推动电信行业安全标准完善，从国家标准到国际标准，从源头增强电信网络的安全能力。发挥双方技术优势开展场景化安全解决方案创新，为社会经济的数字化转型提供安全保障。在业务创新方面， 双方在toB领域开展5G工业行业创新，打造可规模复制的平台和能力，矿山、钢铁、化工、电力行业树立规模落地标杆，通过5G+云+AI赋能行业数字化转型; 在5G行业方案创新、智能云网、车路协同等方向打造支撑“数字中国”国家战略的新型基础设施，面向商业场景构筑新的增长引擎，实现高质量发展。在toH和toC领域，推进直播、教育等场景化宽带、5G终端应用切片加速等应用创新和规模商用，提供差异化的网络体验保障，打造网络竞争力，探索新商业模式提升网络价值。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>联手哈电集团打造“上云用数赋智”标杆</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信也在寻求与更多的生态伙伴达成战略合作。同日上午，中国电信与哈电集团签署战略合作协议。中国电信总经理李正茂、哈电集团总经理吴伟章出席签约仪式。中国电信副总经理唐珂与哈尔滨电气股份有限公司副总裁、电机公司董事长、党委书记王贵代表双方签署战略合作协议。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">协议指出，双方将发挥各自专业技术和产业优势，进一步深化合作基础，拓展新的合作领域。双方将成立联合工作组，在新基建及数字化转型领域积极开展合作，如联合推进电气行业5G全连接工厂，推动哈电集团企业上云，助力哈电建设工业大数据平台，共同组建安全产业生态联盟，开展核心技术攻关，提供面向电气行业的安全解决方案等。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>与中兴强强联合聚焦云网能力提升</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信与中兴通讯的合作也在深入加强。同日下午，中国电信与中兴通讯签署《云网核心能力战略合作协议》。中国电信集团董事长柯瑞文、副总经理刘桂清，中兴通讯董事长李自学、CTO王喜瑜等出席战略合作签约仪式。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">根据协议规定，双方将，开展云网能力接口开放、可编程数据中心网络、5G定制网行业应用、云XR等联合创新，拓展数字化时代业务新空间。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">此外，同日下午，中国电信总经理李正茂还在京会见了紫光股份董事长于英涛，双方就当前通信领域发展以及双方未来在5G移动通信网络及政企行业领域的合作进行了深入交流，希望双方发挥各自优势，以科技创新推动行业高质量发展。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>安全、科技、服务，中国电信发力点齐备</b></span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信与华为、中兴、哈电和紫光各方具有较强的业务协同性、互补性，通过战略合作，可以实现优势互补、资源共享，推动面向“安全型、科技型、服务型”企业转型，推进企业高质量发展。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">一是产学研用深度融合，共同推进创新突破。中国电信与华为成立云网核心能力战略合作办公室，双方在信创产业联合高校、国家实验室、产业链上下游伙伴，产学研一体推动关键基础技术研究和创新。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">二是携手产业链，构建自主可控云生态。中国电信联合华为发展自主可控根技术，打造全国产化自主可控云平台，同时与中兴一起构筑研发云，助力中国电信成为关键核心技术自主掌控的科技型企业。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">三是推动云网融合创新合作，提升专业服务能力。中国电信联合华为，围绕设备级、网络级、运营级安全，分层分级打造最安全的网构筑差异化竞争力，助力数字产业化发展，并与华为、中兴开展云网能力接口开放以及云网大脑的联合创新。合作推进云网能力开放、云网智慧运营，共同打造全球最高效的云网一体化运营能力。四是推进生态聚合，赋能产业数字化升级。据悉，中国电信和华为在toB领域将开展5G工业行业创新，打造可规模复制的平台和能力，通过5G+云+AI赋能行业数字化转型。同时在智能云网、车路协同等方向打造支撑“数字中国”国家战略的新型基础设施，共同构建领先的云网安融合能力，面向商业场景构筑新的增长引擎，实现高质量发展。共同构建领先的云网安融合能力，面向商业场景构筑新的增长引擎。此次中国电信和哈电合作将结合边缘计算、机器视觉等技术能力打造电气行业智能制造标杆，共同探讨海底光缆巡检、维护创新模式等，为服务中国发电装备制造行业产业升级提供动力。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">独行者速，众行者远。展望未来，中国电信将一如既往与行业合作伙伴一道，通过多种方式进行广泛合作，深度融合，协同创新，共同创造5G的新业态、新价值，推动行业高质量发展，推动网络强国、数字中国建设，为“十四五”开局做出新的更大贡献。</span></p>\r\n</div></div></p>', 32, 3, '0', '2', 0, 0, 0, 0, 1, 72, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000073, '\r\n送光猫，包年更优惠', 1, '2022-01-13 12:00:34', '2022-05-13 03:59:11', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">6月20日下午，全球IPv6论坛“2020-2021全球IPv6发展展望”暨IPv6互联网名人堂2021颁奖仪式在北京举行。中国电信总经理李正茂正式入选“全球IPv6互联网名人堂”。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在颁奖仪式上，李正茂做了《构建基于IPv6的网络空间命运共同体》的发言，从信息通信业演变趋势、中国电信加快推进IPv6、如何构建基于IPv6的网络空间命运共同体三方面，分享了中国电信基于IPv6的云网融合赋能未来互联网发展的实践和思考。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">李正茂入选“全球IPv6互联网名人堂”</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在“全球IPv6互联网名人堂”颁奖仪式上的发言中，李正茂表示，能够入选2021年度全球IPv6互联网名人堂，这个名誉不仅仅对其个人的鼓励和激励，更是对中国信息通信产业扎实推进IPv6规模部署的一个重要肯定，将一如既往地支持全球IPv6，推动IPv6事业蓬勃发展，为信息文明进步作出新的更大贡献。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">全球IPv6论坛主席拉提夫</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">•</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">拉蒂德对李正茂总经理入选“全球IPv6互联网名人堂”表示衷心的敬意。他希望通过“名人堂”评选，可以鼓励和带动更多有志之士参与到IPv6实践中来，共同推进IPv6规模部署与IPv6融合技术，推进数字经济的繁荣。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">全球IPv6论坛是一个由全世界主要的互联网提供商、行业专家、科研教育网等力量组成的国际联盟，是IPv6产业界和技术社群影响范围最广的国际组织，自1999年成立以来，一直致力于IPv6技术、市场和部署应用等方面的推广，对于推动IPv6行业的发展以及完善互联网在全世界的公平应用发挥了巨大作用。“全球IPv6互联网名人堂”由全球IPv6论坛（IPv6 Forum）发起，每年评选一次，旨在表彰、致敬为IPv6不断完善发展和创新做出突出贡献的专家、学者和实践者。此前，互联网之父、TCP/IP协议发明人温顿</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">•</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">瑟夫，中国工程院院士邬贺铨，日本互联网之父村井纯，原工业和信息化部通信发展司司长闻库等专家曾获此殊荣。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信积极推进IPv6技术创新和商用</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在发言中，李正茂对信息通信业正加速演进的趋势做了阐述。他表示，从行业成长的角度看，AR、VR、MR以及2B市场的业务创新、5G的规模商用和快速发展、数字技术的广泛应用“三箭齐发”推动信息通信行业螺旋式增长。从价值创造的角度看，信息通信业正从传统的3C（计算机、通信、消费电子）加速向新3C（连接、控制、融合）转变。从技术演进的角度看，信息通信业正加速转型升级。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">长期以来，中国电信一直高度重视并积极推动IPv6的技术创新和商用工作。早在2003年，中国电信作为CNGI成员，承接了国家下一代互联网的第一批示范工程，开展IPv6业务示范和试验。2009年，作为中国最早启动IPv6试商用的运营商，中国电信在江苏和湖南进行了现网试用，实现了IPv6商用化的突破。2013年，对北京、上海、等10省21个城市的城域网和接入网进行改造，实现了IPv6更大规模的试商用部署。同时，中国电信4G LTE网络完全按照IPv6标准建设，在国内最早实现了IPv6在移动网的应用突破。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">党的十八大以来,以习近平同志为核心的党中央高度重视下一代互联网发展工作。2017年，中办、国办印发了《推进互联网协议第六版（IPv6）规模部署行动计划》。2021年3月，十三届全国人大第四次会议审议通过的《国民经济和社会发展第十四个五年规划和2035年远景目标纲要》提出“全面推进互联网协议第六版（IPv6）商用部署”。中国电信认真贯彻习近平总书记关于网络强国的重要思想，在中央网信办、国家发改委、工业和信息化部等部门的指导下，加快IPv6规模部署和升级改造工作，取得显著成效。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">近几年，中国电信进一步深化IPv6规模部署和技术创新，在“云改数转”战略推动下，正加快推进基于IPv6的云网融合发展。在全面推动基础设施的IPv6改造方面，完成现网1万多台城域网设备、2400多台骨干网设备、近2万条骨干电路、470个IDC的IPv6改造和配置，目前固定网络、移动网络、IDC和云全部支持IPv6。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在持续深化IPv6技术创新方面，成功开展基于纯IPv6的5G SA组网现网试验，开创了运营商网络从双栈向单栈演进的首例探索；推进SRv6在城域网、骨干网和移动承载等多个场景的试点和部署，基本实现SRv6全国覆盖。2019年10月在乌镇第六届世界互联网大会上，中国电信“IPv6超大规模部署实践与技术创新项目”被评为“世界互联网领先科技成果”，这是中国的电信运营商在世界互联网大会首次获此奖项。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在利用IPv6的云网优势开展赋能方面，为100多家大型单位提供IPv6改造的解决方案；为数百家行业客户开通IPv6互联网专线；在多地为TOP 100互联网客户提供数据中心IPv6服务，有力支撑了IPv6生态发展。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">在打造自有应用的IPv6示范方面，完成了全集团26个门户网站和在线服务窗口的深度改造；全网54个APP均完成了IPv6改造。中国电信官网2019年4月获全球IPv6论坛颁发的中国首张IPv6二阶段（Phase-2）认证证书。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">开放合作共享推广IPv6</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">对于未来，中国电信提出促进全球IPv6更好更快发展三点倡议。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">第一是“开放”，坚持技术无国界，加快推动技术融合发展。科学技术本身是世界性的，要打破技术的国界壁垒，把握IPv6带来的创新机遇，加快实现关键前沿技术的新突破，加大对下一代互联网基础性、前瞻性、创新性研究的支持力度，推动IPv6与工业互联网、物联网、云计算、大数据、人工智能等融合发展，共同促进技术进步。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">第二是“合作”，加强技术合作，打造联合创新生态。运营商在网络建设和服务、内部数字化转型以及服务社会各界数字化转型中，积累了丰富的应用经验。中国电信愿与国际组织、高校、设备商、互联网应用服务提供商等加强合作，全面开展联合创新，共同打造、持续繁荣IPv6生态体系。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">第三是“共享”，加快技术推广应用，使全世界人民共享技术进步红利。要推动IPv6和基于IPv6的新技术的广泛应用，进一步加强IPv6对金融、教育、医疗、水利、工业等千行百业的赋能，充分释放IPv6的技术潜能和优势。发挥运营商的云网优势，积极运用基于IPv6的数字化技术，助力千行百业数字化转型，支撑“智能减碳、绿色发展”，加强科技扶贫和减贫力度，以技术力量造福各国人民。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">新技术催生新动能，新动能激发新活力。身处用户规模最大的互联网大国，中国电信将致力于推动IPv6技术创新和应用推广，促进下一代互联网在经济社会各领域深度融合应用，携手各方构建基于IPv6的网络空间命运共同体，有力支撑经济社会发展和全球数字化转型。</span></p>\r\n</div></div></p>', 33, 4, '0', '2', 0, 0, 0, 0, 4, 73, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000074, '基础业务办理', 2, '2022-01-13 12:01:32', '2022-04-13 02:00:53', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">6月20日上午，中国电信博物馆全新开馆，以“百年电信 红色传承”为主题，重温了中国电信业百年来自强不息、艰苦奋斗，从艰难起步到发展、跨越、腾飞的历史画卷，展示中国电信奋发进取建设网络强国和数字中国、维护网信安全取得的丰硕成果，向建党100周年献礼。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">博物馆分为“烽燧连天 电信之光”“百年电信 艰难起步”“电信使命 红色基因”“人民邮电 砥砺前行”“改革开放 历史跨越”“信通四海 赋能未来”六个单元，利用丰富的实物收藏、详实的文献资料、模型并融合声光电的现代科技手段，回顾红色电信在党的领导下从“半部电台”到“云监工”走过的百年历程。工业和信息化部副部长刘烈宏、中国博物馆协会理事长刘曙光、北京市文物局局长陈名杰、中国电信董事长柯瑞文、中国电信总经理李正茂，以及党史学习教育领导小组办公室、中国移动、中国联通、中国铁塔和行业博物馆等领导出席中国电信博物馆开馆仪式。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">藏品上万件，记录电信人百年辉煌印记</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信博物馆1999年成立至今，经过了22载春秋，如今基本陈列全面升级，展馆面积近5000平方米，现有藏品6428件套、13000余件，是国内电信行业博物馆中文物品类最为齐全的综合性博物馆。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信董事长柯瑞文在致辞时表示，中国电信博物馆作为通信行业唯一的国家级综合性博物馆，为迎接建党一百周年，进一步丰富馆藏内容、升级改造，向社会开放，恰逢其时，意义重大。这是贯彻落实总书记重要指示精神、用好红色电信资源、引导社会大众深入了解党领导红色电信事业取得伟大成就的实际行动，对于推动电信行业文化遗产保护利用，对于广大电信员工传承红色基因、弘扬优良传统、凝聚高质量发展的磅礴力量，具有重要推动作用。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">工业和信息化部副部长刘烈宏也对中国电信博物馆开馆给予充分肯定。他表示，中国电信博物馆开馆是中国电信的一件大事，也是信息通信业的一件喜事，为行业百年逐梦、追本溯源提供了宝贵的文史资料。希望广大电信人从百年党史中汲取营养和力量，从红色电信的历史中坚守初心使命，更好地将党史学习教育成效转化为把握新发展阶段、贯彻新发展理念、服务构建新发展格局的能力，转化为加快网络强国、数字中国建设，维护网信安全，推动信息通信业高质量发展的动力，为建设社会主义现代化国家作出新的更大贡献。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">北京市文物局局长陈名杰对中国电信博物馆的后续发展提出三点要求：一是做好教育工作，成为大专院校的校外课堂，中小学校开展科普教育的场所；二是引进智慧化的手段，建设智慧博物馆，加强博物馆的智慧管理；三是与北京各大行业博物馆联合发展，争做行业博物馆的排头兵。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">走近半部电台，溯源电信红色基因</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">走进中国电信博物馆一层展厅，序厅内，“百年电信 红色传承——中国电信业发展史陈列”的主题格外醒目，通过主题雕塑和现代大屏相结合形式，融合了中国电信通信史上重要的事件和人物、文化脉络、地标建筑等元素，艺术解读中国电信事业的发展历史。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">“烽火连三月，家书抵万金”，通信是人们进行社会交往的重要手段，在首个主题展区——“烽燧连天 电信之光”里，生动展示了古人利用烽燧燃料、金鼓、传信铁炮、旌旗等声光传递信息。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">接下来的“百年电信 艰难起步”展区，展示了1837年的摩尔斯电报机模型、1876年贝尔获得专利的电话模型、1894年马可尼实验室的无线电发报机模型以及大量与电报电话发展有关的文献资料等，让我们深切感受到百年电信从无到有的艰难起步。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">红色电信在中国近代电信发展史上具有独特的地位。“电信使命 红色基因”展区展出了土地革命战争、全民族抗日战争时期、全国解放战争时期使用过的信号灯、各类通信器材和电文等各种文献资料，介绍了红色电信代表人物开国中将王诤从“半部电台”起家，开创了解放军无线电通信事业的时光印记。1930年12月30日，红军在第一次反“围剿”战斗中，缴获国民党张辉瓒部半部电台（发信机损坏）；时隔4天后的，红军又全歼了国民党军谭道源第50师，缴获了一部完整电台。在此基础上，1931年1月6日王诤建立了红军第一个无线电台和第一支无线电队，从此，源源不断的电讯经过王诤的手传入苏区，也为新中国人民电信事业的建立、成长、发展奠定了基石。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">红色电信守初心，人民邮电为人民</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">新中国成立后，中国电信发扬无私奉献、艰苦奋斗的精神，投入通信建设，揭开了我国电信发展的新篇章。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">“人民邮电 砥砺前行”展区，以实物和图片形式展示了电信事业恢复和发展的成果：1950年中国电信建立第一条有线国际电话电路；1957年底，全国建成以北京、上海、新疆电台为骨干的国际无线通信网，以及北京为中心的国内长途有线通信网，1959年建成了第一条微波电路。在地域辽阔的神州大地上，电信人坚韧不拔，克服重重困难，初步建立了一张通达全国的通信网。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">同时通信设备也在不断发展，我国第一台自主研制的电传打字机面世、第一家自动电话交换设备厂建成投产、第一部16路载波电报机研制成功、第一部纵横制局用自动电话交换机研制成功、第一颗人造地球卫星升空等展现了我国装备水平和通信能力的大幅提升。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">改革开放开启了中国电信事业的腾飞。在“改革开放，历史跨越”版块，现场展示大哥大、寻呼机、摇把电话机等历史实物，全面展现了中国电信业固定电话以及移动通信的大发展。这一时期，中国第一套万门程控电话交换系统开通，一步跨越50年；覆盖中国的“八纵八横”光缆干线网络形成，彻底改变了我国长途通信的面貌。同时中国电信积极建设国际海缆和卫星通信，形成海、陆、空全方位的立体信息网络。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">提速“云改数转”，筑力“网络强国”</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">新一代信息技术呼啸而来，中国从“网络大国”迈向“网络强国”，进入“万物互联”的云网融合新时代。在中国电信博物馆二层展厅“信通四海赋能未来”展区，综合运用图片、视频、VR等多媒体方式充分展示了中国电信在建设网络强国、引领智能未来的道路上的丰硕成果：建设全球最大规模IMS网络、全球最大中文宽带互联网络、全球最大IP承载网络CN2、全球最大FDD 4G网络、全球最大共建共享5G SA网络、全球首个全覆盖的新一代物联网（NB-IoT）商用网络、全球最大用户接入光网，在网络建设的战场上，中国电信不断铸就辉煌。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">当前中国电信积极实施云改数转战略，大力发展5G网络、千兆光纤、云计算、量子通信等现代信息网络。2020年初，中国电信仅用3天时间，就为火神山医院开通了超高速5G网络连接，依托云网融合优势与央视联合打造了亿万人关注的“云监工”，向世界展现了中国速度。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信是我国电信业改革的母体和发展的摇篮，传承了百年电信的深厚积淀。从“半部电台”到“云监工”，百年红色电信精神赓续传承，熠熠生辉。作为中央企业，中国电信将充分发挥博物馆作用，全方位展现中国电信跌拓起伏的历史、风貌和变革发展的辉煌历程，同时坚持用好红色电信资源，做好爱国主义教育、科普教育和企业文化教育，将红色电信首创、奋斗、奉献的基因融入到发展拼搏的血脉中，践行初心使命，全面实施云改数转战略，加快打造服务型、科技型、安全型企业，为建设网络强国、数字中国，维护国家网信安全贡献电信力量。</span></p>\r\n</div></div></p>', 34, 8, '0', '2', 0, 0, 0, 0, 1, 74, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000075, '新装赠好礼，每月仅需77元起', 1, '2022-01-13 13:17:52', '2022-05-13 21:17:15', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"  \"><span style=\"\'yes\';   \">本报讯&nbsp;6月10日，中国电信要客灾备中心武汉基地正式揭牌。据了解，这是中国电信继陕西西安、江苏苏州、山东青岛、广东深圳四个基地之后，打造的第五个全国性灾备基地。</span><span style=\"\'yes\';   \"><br />\r\n</span><span style=\"\'yes\';   \">该基地由地上7层、地下1层构成，具有八级抗震、一级耐火、一级防水等特性。</span><span style=\"\'yes\';   \"><br />\r\n</span><span style=\"\'yes\';   \">在机房内，10列约2米高的白色机柜纵向排开，设备高速运转。工作人员介绍，机房建筑单机房配置了专用精密空调系统，冷量直达机柜，满足托管服务器散热需求。此外，整栋大楼主体及灾备中心还配备了较高灵敏度的烟雾探测和消防系统，所有通道、机房内均设置摄像头和7×24小时闭路电视监控。</span><span style=\"\'yes\';   \"><br />\r\n</span><span style=\"\'yes\';   \">据悉，武汉基地主要面向政府、金融、企业、医疗、教育、交通等重要客户，为其提供咨询规划、集成实施、灾备运维等全生命周期高等级灾备服务。当客户后台数据因故中断或丢失时，武汉基地就能通过云资源池快速实现数据备份、业务接管、数据归档等，让客户丝毫没有数据中断的感知。</span><span style=\"\'yes\';   \"><br />\r\n</span><span style=\"\'yes\';   \">灾备中心配套设施区包括演练大厅、指挥中心、新闻发布区、客户办公区等，不仅能定期进行灾备演练，还能为客户提供长期办公区及临时流动工位。在中心设置的体验馆内，展示了中国电信在数字政府、网信安全、5G数字工厂、智慧园区等方面的应用。</span><span style=\"\'yes\';   \"><br />\r\n</span><span style=\"\'yes\';   \">“武汉基地主要采用服务﹢平台﹢资源的模式。”中国电信集团系统集成有限公司负责人介绍，武汉基地具备优质的云、网、端等基础设施，不仅能为客户提供优质的资源基础，还能结合电信自研的数据备份、复制、自动化切换等功能，为客户提供运营保障。</span><span style=\"\'yes\';   \"><br />\r\n</span><span style=\"\'yes\';   \">据介绍，目前，爱奇艺、光大银行等十多家企业的灾备数据服务已“落户”武汉基地。该基地将建设二期项目，二期规划用地120亩，建筑面积达6万平方米，机房面积达1.8万平方米，能容纳2000台以上机架。</span><span style=\"\'yes\';   \"><br />\r\n</span><span style=\"\'yes\';   \">武汉是中国电信五大高速环网汇接中心和宽带互联网八大核心节点之一。武汉基地能实现对华中、西南、长江流域的区域覆盖，且居五大灾备基地中间位置，可辐射全国。中国电信将以武汉基地为契机，打造以武汉为中心的新型全国灾备基地群落。</span></p>\r\n</div></div></p>', 35, 4, '0', '2', 4, 0, 1, 0, 1, 75, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000076, '全部产品及服务', 4, '2022-01-14 01:43:27', '2022-06-14 03:42:29', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">6月9日，中国电信集团有限公司（简称中国电信）与哈尔滨电气集团有限公司（简称哈电集团）在京签署战略合作协议。中国电信集团有限公司总经理、党组副书记李正茂，哈尔滨电气集团有限公司总经理、党委副书记吴伟章出席签约仪式。中国电信集团有限公司副总经理、党组成员唐珂与哈尔滨电气股份有限公司副总裁、电机公司董事长、党委书记王贵代表双方签署战略合作协议。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">根据协议，双方将发挥各自专业技术和产业优势，进一步深化合作基础，拓展新的合作领域。双方将成立联合工作组，在新基建及数字化转型领域积极开展合作，一是联合推进电气行业5G全连接工厂，结合5G、物联网、工业PON等新技术，联合打造高质量内外网标杆；二是推动哈电集团企业上云，打造业界领先的电气行业企业上云标杆；三是发挥中国电信工业大数据能力，助力哈电建设工业大数据平台；四是共同组建安全产业生态联盟，开展核心技术攻关，提供面向电气行业的安全解决方案；五是结合边缘计算、机器视觉等技术能力打造电气行业智能制造标杆。共同探讨海底光缆巡检、维护创新模式等，为服务中国发电装备制造行业产业升级提供动力。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">本次战略合作协议的签署，必将促进双方结成更为紧密的合作伙伴关系，实现优势互补、资源共享，共同肩负起东北老工业基地央企数字化转型的责任和担当，为双方的发展注入新的生机与活力，对各自企业的转型升级起到重要的推动与促进作用。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">哈电集团是我国最早的发电设备研制基地，也是中央管理的关系国家安全和国民经济命脉的国有重要骨干企业，经过不断发展与成长，现已形成核电、水电、煤电、气电、电气驱动装置、电站交钥匙工程等为主导产品的产业布局，走出了一条独具特色的创新发展之路，目前正向世界一流企业迈进。</span></p>\r\n<p style=\"\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信作为建设网络强国、数字中国的主力军，坚定实施云改数转战略，以云网融合为基础，数字化平台为枢纽，生态合作为关键，机制体制改革为动力，网信安全为支撑，建设云网融合新型信息基础设施，构建数字经济发展基石。目前已建成全球领先的全光网络，天翼云成为全球运营商最大规模云，5G SA网络领跑全球。中国电信将深入落实本次合作协议，持续发挥云网融合优势，以5G、云计算、大数据、人工智能、安全技术为引领，携手哈电集团，以服务中国发电装备制造业产业升级为目标，为哈电集团产业互联网的大发展提供更优质的服务和支撑，共同推进央企“两化”融合。</span></p>\r\n</div></div></p>', 36, 9, '0', '2', 0, 0, 0, 0, 1, 76, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000077, '5G流量如何申请', 1, '2022-01-14 02:48:51', '2022-07-14 02:42:02', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">通信世界网消息（CWW）\"采菊东篱下，悠然见南山\"是千百年前诗人们所追寻的浪漫。而今天，现代科学技术也赋予了生活别样的浪漫，让普通的日常变得甚是有趣。人与人之间的交流能够演变出万千形态，从诗词歌赋到人生哲学，从鸿雁传书到拇指生活……如今，在数字化的作用下，不仅缩短了人与人的信息传递距离，而且给了物品以\"生命\"，实现了人与物、物与物之间的对话与交流。物联产生了数据，数据生出了智慧，智慧在社会的每个角落悄然播种，等待着一场盛大的花开——数字经济时代的到来。</span></p>\r\n<p><span style=\"\">数字化转型\"持久战\"已全面打响</span></p>\r\n<p><span style=\"\">什么是数字经济时代？实际上，我们当前就处在数字经济时代的初级阶段。信号以“1”“0”这种我们所熟悉的二进制来传送就是数字化；数字时代是指一个信息存在方式，正越来越趋向于数字形式，以数字技术为运作规则的时代；而数字经济是指随着信息技术革命发展而产生的新经济形态。</span></p>\r\n<p><span style=\"\">当前，以5G、物联网、大数据、人工智能、工业互联网等为代表的新一代信息基础设施加速发展，数字化浪潮席卷而来，我们离真正的数字经济时代越来越近。\"数字经济\"也俨然成为近年热词，多次出现在政府工作报告中。2021年政府工作报告提出，\"加快数字化发展，打造数字经济新优势，协同推进数字产业化和产业数字化转型，加快数字社会建设步伐，提高数字政府建设水平，营造良好数字生态，建设数字中国\"。</span></p>\r\n<p><span style=\"\">这已经是“数字经济”第四次被写入政府工作报告。从2017年的“促进数字经济快速成长”，到2019年的“促进新兴产业加快发展，壮大数字经济”，到2020年的“全面推进互联网+，打造数字经济新优势”，再到2021年的“协同推进数字产业化转型和产业数字化转型”，数字经济发展肩负的使命越来越重。</span></p>\r\n<p><span style=\"\">十四五年规划和2035年远景目标纲要草案中亦明确提出，“迎接数字时代，激活数据要素潜能，推进网络强国建设，加快建设数字经济、数字社会、数字政府，以数字化转型整体驱动生产方式、生活方式和治理方式变革。”</span></p>\r\n<p><span style=\"\">值得注意的是，在新冠肺炎疫情催化下，更多的人在加速拥抱数字化的生活方式。在线教育、远程办公、线上会议、在线问诊、健康申报、4K/8K超高清等等数字场景已成为日常，政府、企业正在合力推动数字经济发展；大数据、云计算、人工智能等技术迎来爆发式增长，为数字化转型奠定了坚实基础，拓展了数字经济发展的新空间。而我们也终于全面打响了数字化转型的“持久战”。</span></p>\r\n<p><span style=\"\">种种迹象表明，现在就是打响这一“持久战”的最佳时机，关于这一“战”该如何打，从哪里开始打？中国电信从实践中探索出属于自己的答案。</span></p>\r\n<p><span style=\"\">数字化转型突破口之智慧家庭</span></p>\r\n<p><span style=\"\">抗疫常态化，让人们待在家中的时间比以往更久，也为数字化转型提供了突破口——智慧家庭。智慧家庭是智慧城市的最小单元，是离人的生活最近的地方。在寻找转型道路的过程中，中国电信选择智慧家庭作为突破口，有其深厚的背景积淀。</span></p>\r\n<p><span style=\"\">中国电信拥有国内更优质的宽带网络，主要体现在快和稳定：快主要指速率和服务；稳则因为电信宽带是独享型宽带，用户间不会互相影响。同时，中国电信还在加快“2+4+31+X”云网融合资源池布局与京津冀、长三角、粤港澳、陕川渝等重点区域的大数据中心建设。目前，中国电信在全国拥有315个云资源池，形成了独特的云网融合资源优势和突出服务能力。以上优势，为中国电信发力智慧家庭提供了得天独厚的条件，却又远远不止于此。</span></p>\r\n<p><span style=\"\">四川电信“魔方平台”，打造真正的智慧家庭</span></p>\r\n<p><span style=\"\">你想象中的智慧家庭是怎样的？你是否也因为购买了好几款智慧家庭产品，而不得不安装不同的APP而苦恼？未来的智慧家庭究竟是什么样的？</span></p>\r\n<p><span style=\"\">4月25日，笔者走进了成都市金牛区金沙路76号沙湾标杆营业厅，参观了中国电信四川公司（以下简称“四川电信”）打造的全屋智能体验中心。笔者看到，在沙湾营业厅中，有一个面积约50平米的体验中心，全屋模拟真实家庭环境，安装了全套智能设备。全屋智能模块按照智能家庭网络、智能交互中心、智能光线管理、智能安防系统、能源环境管理、智能家电娱乐六大模块布局，用户在这里就能切身感受到数字化为家庭生活带来的便利。</span></p>\r\n<p><span style=\"\">四川电信工作人员告诉笔者，基于技术演进和市场需求，四川电信自主研发、建设的物联网能力开放平台“魔方平台”，可提供泛物联网终端接入管理及应用开发、部署能力。“魔方平台”主要有三无关特点：与接入方式无关，满足各类通信标准、协议类型的接入适配；与厂家品牌无关，通过魔方接入服务和协议转换服务，为应用提供统一终端接入标准和标准API接口；与厂家应用无关，终端与应用完全解绑，通过魔方灵活组合多种应用，且平台可汇聚多个单一场景应用，实现各类型应用场景联动。通俗来讲，就是市面上见到的所有智能家居设备，都能接入“魔方平台”，实现统一管理，无需通过各个APP逐一操作，也不需要考虑标准问题。</span></p>\r\n<p><span style=\"\">为便捷用户体验、受理，四川电信还推出了全屋智能数字平台，具备体验、销售、设计、分销、订单管理、交付评价等功能。在该平台中，用户通过搭建的中国电信三千兆+全屋智能VR虚拟场景，选择户型、品牌就能自动生成匹配设计方案，或根据需求自主设计方案。通过这一平台用户能够更加方便的了解中国电信全屋智能，也可以帮助用户DIY全屋智能解决方案，让用户与智能家居的互动体验感进一步增强。</span></p>\r\n<p><span style=\"\">路已建好，“车”在哪里？笔者带着这样的疑问，来到了成都市经开区2666号用户潘邓浩家中，体验了一把真正的智慧生活。在潘邓浩推开家门的同时，笔者看到窗帘在徐徐打开，灯光一盏盏亮起，音乐缓缓响起……据潘邓浩介绍，通过中国电信\"魔方平台\"，他就能操控家中所有的智能设备，当然，更多时候一句“你好，天猫”“小爱同学”就能控制家里所有的智能家电。此外，远程开门、风雨天气自动关窗、空气超标自动净化、煤气泄露自动告警、远程可视对讲、视频监控、一键离家模式等等操作，更是潘邓浩和家人的日常生活。谈及对智慧生活的感受，潘邓浩表示：“智能生活不是当下刚需，而是提升生活品质的标配。”曾经只出现在科幻电影中的场景，正通过中国电信全屋智能服务，在我们普通家庭中成为现实。</span></p>\r\n<p><span style=\"\">正如前文所述，智慧家庭仅仅是中国电信云改数转战略探索道路的“冰山一角”。 在积极落实中央关于乡村振兴和数字乡村建设的决策部署的征途中，中国电信同样走出了很远。</span></p>\r\n<p><span style=\"\">助力数字乡村建设 服务乡村全面振兴</span></p>\r\n<p><span style=\"\">民族要复兴，乡村必振兴。脱贫攻坚取得胜利后，要全面推进乡村振兴，这是“三农”工作重心的历史性转移。建设数字乡村既是乡村振兴的战略方向，也是建设数字中国的重要内容。党的十八大以来，党中央高度重视农村信息化建设，作为重要抓手的数字乡村建设正在整体带动和提升农业农村现代化发展，为乡村经济社会发展提供了强大动力。</span></p>\r\n<p><span style=\"\">作为建设网络强国和数字中国、维护网信安全的主力军，中国电信坚决贯彻落实党中央、国务院各项决策，履行央企责任，大力推进农村信息化建设，服务农村各项事业发展，并取得了积极成效。</span></p>\r\n<p><span style=\"\">在四川省绵阳市江油市，四川电信快速推进“慧眼工程”等技防举措在城乡综合治理工作的落地实施。据悉，目前江油市已建成慧眼点位2.8万个，镇村监控中心303个，初步构建起以“天网”“雪亮”“慧眼”三大工程为主体，覆盖城区、场镇、村社的多级治安监防体系，提升了基层农村的社会治安治理效能，为政府提供更高效、精细的帮手。</span></p>\r\n<p><span style=\"\">江油市青莲镇双石村党总支副书记赵林在接受笔者采访时表示，与中国电信展开合作建设起双石村的治安防控体系，是双石村的平安乡村建设迈出的重要一步。“智慧化、智能化的生活可以为基层治理增效赋能，有效提升村民的幸福指数。”赵林说道。据了解，双石村常驻人口有400多户，目前已有近半数安装了魔镜慧眼，确保每个院落都有一只“千里眼”，编织出一张安全网，形成从点到面、联防到户、技防到人的治安防控体系。</span></p>\r\n<p><span style=\"\">当然，“慧眼工程”在保护村民人身、财产安全的同时还发挥了其它功效。湖南省长沙县果园镇花果村的村民，将“慧眼工程”玩出了新花样。养殖户不仅在家安装了中国电信天翼看家摄像头，还将摄像头装在了田间地头。这样他们通过手机就能清楚地看到养殖水田的场景，再也无须实时蹲守在田间地头观察养殖情况。中国电信湖南分公司（以下简称“湖南电信”）表示，摄像头背后的可视化监控系统，既能看家护院，还能帮助当地农民增收。</span></p>\r\n<p><span style=\"\">除“慧眼工程”外，中国电信还根据实际情况，为乡村、社区量身定制了“天翼大喇叭”。笔者在采访过程中了解到，“天翼大喇叭”是基于物联网云平台开发，综合利用4G/5G传输、云端实时控制、数字音频编解码等技术整合而成的绵阳本地研发、制造的新型融合产品，可广泛应用于基层治理、应急指挥、实时信息通告等多领域，有助于提高应对突发社会事件预警及指挥能力，助推平安乡村、平安社区建设。目前该产品已在全国多地试点使用。</span></p>\r\n<p><span style=\"\">笔者认为，与传统喇叭相较，天翼大喇叭的差异化优势主要有远程快捷广播、管控统一便捷，分区分域管理、安全保密机制高，设备管理透明清晰等特点。安装\"天翼大喇叭\"后，无需到广播室，手机小程序就能快速实现远程智能管控，信息发布更便捷，覆盖范围更广。\"天翼大喇叭\"不仅满足了村政府各类信息的实时通告、社会管理、基层治理、应急疏散指挥等多种能力需求，平时还可用作党建知识宣传、精神文明建设宣传、政策信息广播、日常信息及新闻广播等，提高社区的生活娱乐质量实现智慧社区。</span></p>\r\n<p><span style=\"\">值得一提的是，在2020年初的疫情防控过程中，“天翼大喇叭”发挥了重要作用。在面向公众的信息传播、情况传送、应急指挥方面，助力解决了对社区、对村社、对村民的到达率难控、及时性难控、分级指挥难控等问题。进一步提高了农村在公共卫生事件、自然灾害、处突维稳等各类突发社会事件的应对能力，建设更完善、更先进、更实用信息发布预警和调度指挥系统。</span></p>\r\n<p><span style=\"\">如果说，智慧家庭、“魔方平台”是以家为单位，给我们平凡的生活带来极大便利；“慧眼工程”“天翼大喇叭”为广大乡村、社区的村民、居民提供了数字化服务，那么智慧园区的建设就是在为每一个“打工人”注入数字化的灵魂。</span></p>\r\n<p><span style=\"\">在中国电信的蓝图里，智慧园区可采用云计算、物联网、5G、人脸识别、大数据等技术，实现\"一张脸、一张卡、一平台\"的园区无忧智能体验，实现园区的统一管理、资源共享和智能联动。通过智慧车辆、智能安防、智慧访客、智慧会议、智能考勤、智慧餐饮、智慧发布、智慧物业、智慧能耗等九大功能及园区大数据分析等智能应用，真正实现园区智慧化管理。</span></p>\r\n<p><span style=\"\">写在最后</span></p>\r\n<p><span style=\"\">“行路难！行路难！多歧路，今安在？”中国电信寻求转型已有多年，从传统的“管道工”到今天的综合智能信息服务商，中国电信正是紧紧抓住了经济社会数字化转型机遇，以5G和云为核心，打造了云网融合支撑体系，才走出了一条可持续发展的、差异化的道路，成为2020年唯一实现移动用户正增长的运营商。</span></p>\r\n<p><span style=\"\">“长风破浪会有时，直挂云帆济沧海”。 2020年，中国电信首次提出云改数转战略。2021年，中国电信围绕云网融合、科技创新、数字化平台建设、体制机制改革、生态合作及网信安全等方面，积极推进云改数转战略的落地，加速数字化转型和全面上云，推动我国数字经济高质量发展。笔者也相信，在中国电信云改数转战略的持续推进下，这个运营商的“老大哥”，会焕发出别样风采！</span></p>\r\n</div></div></p>', 37, 11, '0', '2', 6, 0, 3, 1, 5, 77, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000078, '当前话费余额', 7, '2022-01-14 06:45:49', '2022-08-14 03:45:17', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">7月16日，中国电信与华为和众多合作伙伴，共同发布了业界首个运营商5G融合应用开放实验室（5G OpenLab）。该实验室将为5G赋能千行百业提供测试验证平台，服务行业合作伙伴基于该平台进行验证、开发创新，将成为各领域行业解决方案的孵化器和赋能中心。</span></p>\r\n<p><span style=\"\">中国电信副总经理刘桂清表示，本次中国电信在业内首次成立5G融合应用开放实验室并与华为成立联合实验室，旨在推动5G产业生态格局的繁荣，是中国电信5G发展战略的重大布局。中国电信将以5G融合应用开放实验室为依托，一方面进行具有自主核心技术的5G定制网产品和解决方案的仿真验证及开展6G等未来网络领域的探索，另一方面将不断深化与行业伙伴的合作，共建融合、开放、共赢的产业新生态，不断提升5G产业现代化水平，为推动国家产业数字化转型贡献力量。</span></p>\r\n<p><span style=\"\">中国电信集团政企信息服务事业群总经理上官亚非透露，中国电信5G定制网已精准覆盖1600多家政企头部客户，为4500多家客户提供5G定制能力，落地超过360个定制网商用项目。此次发布的5G融合应用开放实验室，是中国电信5G定制网整体合作生态规划的重要一环，通过建设、运营5G应用端到端集成测试验证实验室，将为合作伙伴提供一个开放、创新的实体支撑中心，聚合各方能力与资源，共同为千行百业提供各类场景化解决方案。</span></p>\r\n<p><span style=\"\">据中国电信研究院副院长陈运清介绍，中国电信已建设“5G﹢云﹢AI”测试验证平台，实现了一期5G、天翼云、MEC、行业AI应用、PLC、工业机械臂、AGV等典型工业场景落地。中国电信后续将规划建设系列分中心，包括上海生态分中心、智慧煤矿分中心等。</span></p>\r\n<p><span style=\"\">自迈入5G时代以来，中国电信更加注重开放合作，构筑产业生态，赋能千行百业。2019年，中国电信5G产业创新联盟正式成立，截至目前，发展成员单位近300家，汇聚合作伙伴近千家。同时，中国电信创新性构建了中国电信5G产业创新联盟、5G 开放实验室、5G联合创新中心“1﹢1﹢1”联动发展模式，开展典型业务测试平台建设、行业应用标杆示范打造等工作。5G OpenLab是5G产业创新联盟面向合作伙伴打造的端到端的测试验证中心，是将中国电信5G﹢云网产品能力与合作伙伴能力进行整合和协同的赋能中心及创新平台。</span></p>\r\n<p><span style=\"\">相关专家表示，5G OpenLab的成立将加速5G技术与传统行业的融合，催生各种新应用、新模式、新业态，提升企业数字化能力，加速产业数字化转型。</span></p>\r\n</div></div></p>', 38, 10, '0', '2', 0, 0, 0, 0, 1, 78, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000079, '天翼宽带装移修进度查询', 9, '2022-01-14 06:51:50', '2022-09-14 02:51:31', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">近日，在2021（第二十届）中国互联网大会科技兴警高峰论坛上，中国电信发布“科技兴警护航计划”。</span></p>\r\n<p><span style=\"\">据悉，“科技兴警护航计划”借助各类通用和公安专用AI算法，打造了包括天翼慧眼、5G公安立体巡防、公安情报大脑、量子加密对讲等面向公安各警种各条线、贴近实战、符合业务需求的智能化场景应用和解决方案。在创新智能警务应用方面，中国电信运用高新技术提供了多种系统服务，与公安部合作搭建的96110劝阻预警专线已在27个省（区、市）开通，“云堤-反资产仿冒欺诈服务”成为中国首家运营商级、基于网络控制能力实现反欺诈的创新型服务，能够有效发现并成功拦截在生效状态的钓鱼网站。</span></p>\r\n<p><span style=\"\">作为参与公安信息化建设的重要力量，中国电信以科技兴警战略对公安信息基础设施提出新的要求为指引，通过统一的行业专网、云基础设施安全底座及差异化原子能力基础，构建政务服务云网、智能感知云网、移动警务云网。以云、网、数、安、用五方面的能力优势构建云网融合、数据融合体系。在公安云网服务建设方面，截至2021年6月，中国电信承建的公安信息网已覆盖全国29个省（区、市），新一代公安信息网覆盖14个省（区、市），警务数字集群网在全国17个省（区、市）部署实施。</span></p>\r\n<p><span style=\"\">据了解，中国电信将继续发挥建设网络强国和数字中国、维护网信安全的主力军作用，积极响应国家战略、公安实战和服务群众需求，坚持以大数据为引领，以新技术手段为支撑，为推进平安中国、法治中国、社会治理能力现代化作出新的更大贡献。</span></p>\r\n</div></div></p>', 39, 0, '0', '2', 0, 0, 0, 0, 11, 79, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000080, '老用户专区', 1, '2022-01-14 06:54:56', '2022-10-14 14:02:26', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\" \">在日前由中国电信主办的2021政法智能化建设技术装备及成果展——科技法治建设峰会上，中国电信发布涵盖法院大数据、5G互联网法院、公共法律服务云等多个领域智能化场景应用及解决方案的“智慧法治护航计划”，全面助力法治中国建设。</span></p>\r\n<p><span style=\" \">在法院大数据方面，通过混合云﹢大数据平台，实现纵向跨四级法院、横向跨外部单位、内部跨业务系统的数据共享交换体系，促进业务协同、数据互通。在5G互联网法院方面，充分发挥中国电信5G短消息即点即用、无须安装的特点，与法院业务整合，在立、审、执等各环节提供轻移动端、全面覆盖、组件化服务。在检务大数据方面，整合检察机关内外部相关系统及数据，实现内部外部数据互通及共享，复杂报表报告一键生成；基于数据分析研判，提供全业务的办案辅助支撑、全要素的管理决策支撑。在公共法律服务云方面，面对群众提供智能咨询、视频咨询、在线业务办理、司法信息查询等服务功能，打通公共法律服务“最后一公里”。面向中小企业提供多元化、一对一服务，帮助企业防范法律风险、维护合法权益。在移动检务方面，通过部级集约平台实现“覆盖全国、统筹利用、统一接入、共享开放”，在充分考虑业务实际应用及系统安全下，实现检务工作移动化、无纸化、可视化。</span></p>\r\n<p><span style=\" \">此外，中国电信充分发挥自身云网融合优势，聚焦远程提审、公益诉讼、智慧矫正、智慧监狱等领域，推动法治工作数字化、网络化、智能化，全面提高综合治理效率。</span></p>\r\n<p><span style=\" \">据介绍，中国电信已逐步形成智慧法院、智慧检务、智慧司法专属智能应用生态圈，面向法院、检察院、司法行政机关各业务场景提供智能化应用建设能力，建设标准统一、整体联动、业务协同、信息共享的法治信息化体系。</span></p>\r\n</div></div></p>', 40, 0, '0', '2', 0, 0, 0, 0, 1, 80, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000081, '实时话费查询', 2, '2022-01-14 06:55:25', '2022-11-14 14:02:26', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">5月19日上午，“中电万维信息技术有限责任公司博士后科研工作站”在甘肃兰州正式揭牌成立。甘肃省人力资源和社会保障厅巡视员陈志平为博士后工作站揭牌，中国电信甘肃公司总经理秦学寿、兰州交通大学党委书记杨子江在揭牌仪式上致辞。</span></p>\r\n<p><span style=\"\">中电万维博士后科研工作站是中国电信首个国家级博士后工作站，它的成立是甘肃电信践行初心使命，建设网络强国、数字中国的重大举措，是甘肃电信实施科技立企、科技强企、科技兴企系统布局，以科技创新服务地方经济社会发展的重要一环。“十三五”期间，甘肃电信牢牢把握新基建的机遇，快速建设全省5G网络、打造融合行业应用标杆，树立了天水华天、金川公司等“5G﹢工业互联网”应用标杆；建设物联网平台、大视频平台、区块链平台等一系列新技术服务平台，在智慧城市、精准扶贫、医疗健康、数字政府等项目应用中发挥了重要作用。“十四五”开局以来，甘肃电信推进科技创新，相继成立了科技创新委员会、科技创新与发展部、中电万维研究院，对科技创新机制体制、科技研究孵化、科研体系建设进行了体系化谋划推进。</span></p>\r\n<p><span style=\"\">中国电信甘肃公司总经理秦学寿表示，中电万维博士后科研工作站将面向科技前沿、面向经济主战场、面向国家重大需求、面向人民生命健康，从承担科技创新突破重任的角度把握科技创新方向，锁定云网融合、网信安全等领域，集中力量开展科研攻关，真正形成一批关键核心技术成果，并让科技成果走出去，让客户感受到科技创新提供的优质产品和服务，不断提升科技创新为客户带来的获得感、幸福感、安全感；将积极落实甘肃省委省政府关于科技创新的工作要求，加快云计算、大数据、物联网、5G通信、人工智能、区块链等新技术的创新应用研究，为助力乡村振兴、助推各行业客户数字化转型作出贡献。</span></p>\r\n</div></div></p>', 38, 2, '0', '2', 0, 0, 0, 0, 11, 81, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000082, '话费交费助手', 4, '2022-01-14 06:55:55', '2022-03-14 14:02:26', ' <p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p align=\"center\" style=\"text-align: left;\"><span style=\"\">国家统计局数据显示，1-4月份，社会消费品零售总额同比增长近30%，消费升级成为社会经济增长的重要驱动力，品质化、多样化也成为了居民消费的重要特点。</span></p>\r\n<p><span style=\"\">5月，中国电信翼支付举办“嗨5生活节”活动，推出电信超级plus月卡、寻味家乡农副产品优惠购，以及特约商户消费立减，通过直播带货、线上销售的方式，满足居民消费多元化需求，同时帮助小微商户、农户连接市场需求，提升农副产品和实体店面的营销效率。</span></p>\r\n<p><span style=\"\">根据日前发布的《中华人民共和国乡村振兴促进法》，县域是乡村的主要场景。2021年是“十四五”规划开局之年，也是全面推进乡村振兴的关键一年。</span></p>\r\n<p><span style=\"\">翼支付此前分别在南宁市、贵阳市开阳县举办“甄选好味‘桂’在有你”、“多彩贵州 尝鲜黔味”两场主题直播，并分别与当地政府启动乡村振兴合作。</span></p>\r\n<p><span style=\"\">5月18日，中国电信四川公司数字乡村推进高峰论坛顺利举办。活动现场，中国电信翼支付、中国电信四川公司与威远县、荣县、犍为县、通江县、木里县、盐源县、普格县、盐边县等14个区县政府及十余家农特企业签署了乡村振兴战略及生态合作协议。</span></p>\r\n<p><span style=\"\">据介绍，“寻味家乡”是翼支付2021年推出的乡村振兴主题活动，依托原有的供应链营销服务基础，通过线上营销、直播带货等创新渠道，将地方特色农副产品与市场消费需求进行精准对接，提升优质农副产品的知名度和销量。</span></p>\r\n<p><span style=\"\">翼支付“寻味家乡”主题活动已经走过湖北、宁夏、广西、贵州、四川等5个省份，此前线上展示销售的恩施土豆、宁夏枸杞、大石山糯玉米、葛根粗粮面等“土特产”，也成为了用户们争相购买的新晋网红美食。</span></p>\r\n<p><span style=\"\">在5月的“嗨5生活节”活动中，翼支付集中上架了5个省份的特色美食，一次性满足消费者的购买需求。同时，借助优惠券发放，帮助各地农产品实现大卖。</span></p>\r\n<p><span style=\"\">作为贯穿全年的主题活动，翼支付从31个省份及直辖市甄选出百余款具有地方代表性的特色农副产品，每月选择两个省份的特色产品重点展示，并在翼支付APP首页、购物频道、微信公众号、中国电信5G会员小程序等平台配合进行营销推广。</span></p>\r\n<p><span style=\"\">在此次“嗨5生活节”活动当中，翼支付全面展示了以数智营销为基础，全面服务实体经济发展的平台能力。乡村振兴的关键在于振兴乡村经济，而农副产品则是大幅提升乡村经济发展的核心，拓宽特色化农产品销路正是一个有效抓手。翼支付也正是基于这一洞察，推出了“寻味家乡”系列活动，在田间地头和城市餐桌之间搭建了一座桥梁，让城市居民足不出户就能享受到货真价实、原汁原味的地方特色农副产品，也让包括农户在内的农副产品产业链直接受益，进而助力乡村振兴发展。</span></p>\r\n<p><span style=\"\">翼支付用实践探索证明，利用线上平台的强流量资源优势，对接城乡差异化供求关系，为特色农副产品实现产销一体化，在完成需求精准对接的同时，间接拉动内需，逐渐探索出一条可持续可复制的有效助农路径，借势消费复苏的热潮让乡村振兴的脚步更加快速、稳健。</span></p>\r\n<p><span style=\"\">在中国电信四川公司数字乡村推进高峰论坛，翼支付还提出了三个具体方向：整合数字营销科技能力与农业产业链，建设供销一体的助农惠农平台，打造乡村产业品牌；推动乡村居民普惠金融可得性与便捷性，深化乡村服务智能化，提升乡村消费金融能力；积极探索线上线下融合的乡村缴费模式，加快实现乡村治理数字化，助力平安乡村建设。</span></p>\r\n<p><span style=\"\">随着“寻味家乡”活动参与省份的逐渐增加，翼支付也将聚焦更多地区农产品的线上销售平台搭建及农村数字化建设，全力助推乡村振兴，展现央企社会责任。</span></p>\r\n</div></div></p>', 38, 0, '0', '2', 0, 0, 0, 0, 1, 82, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000083, '年终送话费', 1, '2022-01-14 06:56:25', '2022-04-14 14:02:26', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">7月23日，2021中国电信终端评测发布会在线上召开。发布会由中国电信移动终端研究测试中心主办，以“翼矩·洞察”为主题，发布了两大CTTTC终端技术认证、三大自主创新翼矩终端测试系统和2021年第一期《终端洞察报告》，全方位展示中国电信创新性5G终端测试系统和专业化评测成果，共同探讨5G终端、AI终端、云终端新技术趋势，以及终端适老化等热点问题。</span></p>\r\n<p><span style=\"\">中国电信股份有限公司研究院副院长蔡康表示，当前处在新技术快速迭代与多技术跨域融合的时期，期待产业创新合作面向更广泛的技术领域与基础技术环节，合作模式上更灵活、更深入，联合攻关解决一系列关键技术难题与“卡脖子”问题。在终端评测领域，进一步加强测试技术与标准创新合作、测试系统联合研发，提升终端评测洞察深度与广度，向业界开放提供多专业融合、云网端一体的研发试验环境，为联合创新提供强有力的保障。</span></p>\r\n<p><span style=\"\">CTTTC是中国电信面向产业合作伙伴的终端技术认证体系，对符合中国电信终端技术要求与规范的产品、系统与实验室颁发认证证书，共同推动终端新技术的成熟商用，协同提升终端产品体验。会上，中国电信为通过测试认证的5G终端芯片和5G终端测试系统，颁发CTTTC终端芯片技术认证证书和CTTTC终端测试系统技术认证证书。未来，中国电信将与产业链伙伴共同推动终端新技术成熟商用，协同提升终端产品体验，构建高效的终端技术认证体系。</span></p>\r\n</div></div></p>', 38, 0, '0', '2', 0, 0, 0, 0, 11, 83, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000084, '升5G返90元话费', 2, '2022-01-14 06:57:15', '2022-05-14 14:02:26', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">近日，国际电信联盟电信标准化部门（ITU- T）第16研究组（SG16）召开了全体会议。在此次会议上，由中国电信牵头并联合中兴、华为、中国联通、中科院计算机技术研究所发起的“F.MOCN-MS on requirements for multi-operator core network enabled multimedia services（基于共建共享网络的多媒体服务需求）”新立项正式获批。该项目将在IMT-2020架构下，研究基于共建共享网络的多媒体应用场景和服务相关要求，将作为共建共享网络的业务服务基础性国际标准，推动5G共建共享网络在新媒体业务和垂直行业应用中的扩展和普及。该立项是我国牵头的首个业务应用对5G共建共享网络能力需求和功能定义的国际标准。</span></p>\r\n<p><span style=\"\">中国电信携手中国联通坚持创新引领5G发展，在全球率先制定5G共建共享系列技术方案和运营模式，累计开通共享基站达到35万站，100%实现共享，覆盖全国所有城市地区、部分县城及发达乡镇，形成全球最大规模的共建共享5G商用网络，推动实施5G引领的国家战略。5G业务是5G商业成功的关键，随着各种新型多媒体服务和垂直行业无线用网需求的快速增长，5G共建共享网络的优势也日益凸显。一方面，共建共享能够突破单个运营商投入成本和无线网络资源的局限性，聚合多运营商的资源，快速部署一张广域覆盖、能力增强且高效协同的移动网络，可在实现降本增效的同时拓宽新业务应用。另一方面，共享能力等特有信息的开放与应用也必将拓展和提升新媒体业务与垂直行业业务应用及体验。</span></p>\r\n<p><span style=\"\">该立项获得了中兴、华为、中国联通、中科院计算所、中国信息通信研究院等合作伙伴的大力支持，中国电信将继续该立项的探索、创新和突破，积极开展共建共享对未来网络架构、行业应用等重要方向的标准化规划布局，提升在国际标准方面的话语权和竞争力。</span></p>\r\n</div></div></p>', 38, 0, '0', '2', 0, 0, 0, 0, 2, 84, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000085, '抢先体验超快网速', 7, '2022-01-14 06:57:26', '2022-06-14 14:02:26', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">5月13日，中国电信携手多家产业合作伙伴在京启动“5G模组合作行动”，加速推进5G、NB-IoT和LTECat1物联网产业规模发展，力促物联网产业壮大。2021年，中国电信计划新增1亿个物联网连接，集采物联网模组3000万片。</span></p>\r\n<p><span style=\"\">中国电信物联网连接服务规模已超过2.6亿；NB-IoT网络在全球持续保持领先，连接规模超1亿；5G SA网络率先规模商用，打造云网端融合崭新应用；发布致远、比邻、如翼三类模式5G定制网，提供5G行业领先综合解决方案。物联网模组是实现5G时代“万物互联”的关键，中国电信携手模组伙伴，加速推进5G物联网走向规模商用。</span></p>\r\n<p><span style=\"\">本次多方合作行动的重点：一是推广覆盖高、中、低速全场景的物联网服务及解决方案，助力社会治理智能化、产业数字化、生活智慧化的升级；二是多措并举，牵引产业链不断提升5G、NB- IoT和LTE-Cat1模组性价比，加速物联网普及；三是成立5G模组创新开放实验室，邀请产业链各方开展高清视频、安防监控、工业互联网、车联网、机器人/无人车等典型场景的5G研发；四是提供资源和服务保障，为物联网模组提供专属流量套餐、专享金融服务和商机对接。</span></p>\r\n</div></div></p>', 24, 6, '0', '2', 0, 0, 0, 0, 3, 85, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000086, '网上预约装宽带', 1, '2022-01-14 06:57:57', '2022-07-14 14:02:26', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">六一儿童节期间，中国电信湖北分公司通过线上线下相结合的形式开展爱心志愿服务活动。本次活动发挥直播带货的宣传优势进行预热推广，线上收集客户爱心能量，线下组织党员和团员青年前往武汉市爱心花朵儿童福利院开展关心慰问和爱心志愿服务。</span></p>\r\n<p><span style=\"\">活动前期，湖北电信以省电渠中心牵头组织，通过湖北电信官方旗舰店直播间宣传爱心志愿服务活动内容，不仅介绍了中国电信一直以来积极支撑精准扶贫、持续助力公益事业的具体举措，而且结合公益活动中的实际案例宣传了天翼看家、全屋WiFi、高速宽带等中国电信业务，推荐了直播间专属的特惠活动，引导用户通过直播间下单、点赞分享、留言互动等方式积攒“爱心能量”，共同助力开展本次爱心志愿服务活动。</span></p>\r\n<p><span style=\"\">活动当天，湖北电信的党员和团员青年首先为武汉市爱心花朵儿童福利院的孩子们带去了大米、面条、食用油等生活慰问品；随后，大家一起欣赏了福利院儿童表演的歌舞和朗诵节目；最后，党员和团员青年为孩子们现场朗诵了爱国主义教育题材的诗歌，弘扬了爱国主义精神。</span></p>\r\n<p><span style=\"\">通过此次活动，湖北电信充分发挥了直播带货等新媒体运营渠道的宣传能力和传播效应，将线上积攒的爱心汇聚到线下活动中，不仅为日常营销工作注入了中国电信的爱心和温暖，体现了中国电信作为央企关心关爱儿童的社会责任感，而且进一步提升了中国电信员工的思想觉悟，培养大家树立关注弱势群体、关心爱护下一代、积极奉献爱心的意识，发扬乐于助人、无私奉献的公益精神。</span></p>\r\n</div></div></p>', 24, 0, '0', '3', 0, 0, 0, 0, 4, 86, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000087, '宽带大提速，最高1000M', 9, '2022-01-14 06:58:27', '2022-08-14 14:02:26', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">数字经济在2020年的全球抗疫中扮演重要角色，今年世界电信和信息社会日的主题是：在充满挑战的时代加速数字化转型。世界各国达成共识，后疫情时代，数字化转型将成为推动全球经济社会发展的新引擎。</span></p>\r\n<p><span style=\"\">我国早就开始重视数字化转型。2000年，时任福建省省长的习近平在全国率先提出“数字福建”建设规划，成为数字中国的思想源头和实践起点。2017年，“数字中国”被写入党的十九大报告。习近平总书记指出，要建设网络强国、数字中国、智慧社会，加强信息基础设施建设，推动互联网、大数据、人工智能和实体经济深度融合，发展数字经济、共享经济，培育新增长点，形成新动能。“十四五”规划和2035年远景目标纲要提出“加快数字化发展，建设数字中国”，围绕打造数字经济新优势、加快数字社会建设步伐、提高数字政府建设水平、营造良好数字生态四方面举旗定向、谋篇布局，为“十四五”开局之年信息通信业开好局、起好步提供了重要的行动指南。</span></p>\r\n<p><span style=\"\">在后疫情时代的新一轮数字化浪潮中，在社会经济和行业转型的重要战略机遇期，千行百业面临革新。中国电信牢牢把握历史机遇，立足长远，先行先试，运用“数字福建”建设积累的经验方法，把“数字中国”建设作为自身的责任和使命，加速实现自身数字化转型和全面上云，重塑企业发展核心竞争力。同时，切实履行央企责任，以自身的数字化转型服务各行业各领域的数字化转型，培育壮大经济新动能。未来，中国电信将坚持以人民为中心的发展思想，不断夯实现代信息网络根基，自主掌控关键核心技术，积极营造开放的数字生态，维护网络信息安全，加快推进云改数转战略，强化生态合作，携手各方合作伙伴努力激发数据要素新动能，开启数字中国建设新征程。</span></p>\r\n<p><span style=\"\">云网融合赋能千行百业</span></p>\r\n<p><span style=\"\">中国电信是全球首家提出“云改”概念的电信运营商，2018年就倡导“像光改一样做云改”，其后不断演进和丰富“云改”的内涵。近年来，随着数字化经济在国家发展战略中的地位日益提高，中国电信顺应潮流，不断进行战略迭代，从网络智能化、业务生态化和运营智慧化到“云改数转”，更有力地支撑数字经济转型。2021年是“十四五”规划实施的开局之年，是我国现代化建设进程中具有特殊重要性的一年，中国电信再次将数字化转型提升至统领集团工作的战略位置，将2021年定义为全面实施“云改数转”、开创新局面的关键之年。</span></p>\r\n<p><span style=\"\">云改数转加快自身转型</span></p>\r\n<p><span style=\"\">中国电信坚持“网是基础，云为核心，网随云动，云网一体”的云网融合战略方向。目前，中国电信正在加快打造5G、大数据中心等新型数字化基础设施，积极构建云网融合的数字化底座。“云网”理念已渗透到中国电信网络建设、运营、维护、应用等环节，贯穿主业全链条。中国电信希望能够按照云、网、系统深度融合方式建立生产运营和管理体系，实现全集团“一张网、一朵云、一个系统、一套流程”，加快推进云网融合和数字化转型。中国电信的企业云改战略包括业务上云、系统上云、网络上云，其中最基础的环节是系统上云。2020年7月，中国电信对系统全面上云工作进行部署，明确提出“新建系统100%上云，存量系统三年上云”的工作目标。系统上云后，大数据的融合运用和企业智能化改造将全面启动，成为高质量发展的助推器。目前，在云资源布局上，中国电信在全国拥有315个云资源池，实现了网随云动、入云便捷、云间畅达，形成了具有独特优势的云网融合资源和服务能力。</span></p>\r\n<p><span style=\"\">顺应趋势满足行业需求</span></p>\r\n<p><span style=\"\">作为云建设、云应用的先行者和引领者，中国电信自身数字化转型的实践，成为为千行百业赋能的基础。2020年，新冠肺炎疫情肆虐全球，智能工厂、远程医疗、网上课堂等新的生产和生活方式在短时期内迅速普及，推动数字化与实体经济深度融合。2020年4月7日，国家发改委与中央网信办推出“上云用数赋智”行动，中国电信积极参与行动。2020年5月13日，国家发改委联合17个部门、100多家数字化龙头企业共同发布“数字化转型伙伴行动”倡议，中国电信成为首批倡议单位之一。</span></p>\r\n<p><span style=\"\">为适应数字技术全面融入社会交往和日常生活的新趋势，中国电信积极利用信息化技术促进公共服务和社会运行方式创新，聚焦政务、制造、电力、教育、医疗、养老、文体等重点行业领域，推动数字化服务普惠应用，持续提升用户获得感。</span></p>\r\n<p><span style=\"\">面向政务和公共服务需求，中国电信积极与各级政府一道，助力政务上云，发挥现代信息技术在辅助政府决策、优化城市治理、保障公共安全、提升服务质量等方面的作用。在浙江，中国电信承建全省及各地市政务云，为61个省级局委办和1500多家市县级单位提供上云服务；基层治理“四个平台”覆盖全省54个区县、727个乡镇，助力基层“最多跑一次”；深耕智慧城市重点项目，接应“雪亮工程”，部署60多万个视频点位，推动视频平台升级演进。</span></p>\r\n<p><span style=\"\">面向企业，中国电信提供丰富的上云咨询方案、迭代云公司IaaS/PaaS产品和运维能力。其天翼云工业互联网平台提供工业PON（无源光网）网络连接、数据采集、设备监控、数据存储、数据分析、运营优化、资源管理等先进服务，帮助企业提高生产效率、缩短研发和生产周期。西安曲江新区智诚跨境电商数字文化产业园，借助中国电信云计算（陕西）基地的云网融合基础设施，快速实现了产品的全球采集、多店铺远程管理、在线物流系统对接、远程仓储监管等。疫情之下，园区企业在一季度实现产值4000多万元，增长34%。长安福特通过重庆电信灵活开放的云化网络架构引入物联网、人工智能、大数据、边缘计算等技术，优化企业生产流水线，提升智能控制、智慧仓储、智慧物流的效能。</span></p>\r\n<p><span style=\"\">面向家庭，中国电信推出共享“云”应用，联合300多个智慧家庭产业联盟成员为家庭提供智慧解决方案，让人们得以居家实现看病、工作、上学、购物。同时，还为全国中小学提供云课堂，近千万中小学生借助云平台复课复学。</span></p>\r\n<p><span style=\"\">勇立数字化转型的潮头，中国电信致力于发挥云网融合的优势，推动和加速全社会信息化、网络化、数字化和智能化的进程，促进社会各行各业数字化转型。</span></p>\r\n<p><span style=\"\">用数注智抗击新冠疫情</span></p>\r\n<p><span style=\"\">今年世界电信和信息社会日的主题是：在充满挑战的时代加速数字化转型。国际电信联盟称，新冠肺炎疫情彰显了信息通信技术对社会持续运转的关键作用。疫情期间，全球各地的信息通信行业挺身而出，助力拯救生命和维持经济活动，信息通信技术和服务在充满挑战的时代展现出了非凡的韧性。</span></p>\r\n<p><span style=\"\">疫情发生以来，中国电信主动担当，利用自身的技术优势为社会生产、经济运转、民众生活和工作学习等插上了信息化的翅膀。</span></p>\r\n<p><span style=\"\">新冠肺炎疫情期间，武汉火神山和雷神山医院建设展现了“中国速度”。2020年1月27日清晨，中国电信接到指令，须在火神山、雷神山医院开通央视直播。蔡甸、江夏分公司组织突击队迅速勘察安装地点，快速完成选址、布放光缆及电源线和设备安装调试；中国电信集团相关单位高效协同，1月27日20时，完成功能设置和能力部署，央视对两家医院建设工地实景直播顺利开通。广大网友“身临其境”和现场数千名工人一起争分夺秒、并肩作战！一起为武汉加油，见证中国速度、中国力量！</span></p>\r\n<p><span style=\"\">2020年2月18日，在浙江省人民医院远程超声波医学中心内，利用中国电信5G技术，浙江省人民医院超声科副主任彭成忠、检查医生叶瑞忠与远在武汉的主任医师李亚清、护士长俞平连线，通过手柄操作，远程控制距离杭州700多公里的武汉黄陂方舱医院的超声机器人，隔空为新冠肺炎患者进行超声检查。</span></p>\r\n<p><span style=\"\">2020年2月24日，中国-世卫组织联合考察组外方组长、世卫组织总干事高级顾问布鲁斯·艾尔沃德对中国电信在四川利用5G 开展流行病学调查指导、重症危重症患者远程会诊给予高度评价：“中国将很多常规诊疗项目转变到以在线的方式去提供，在此方面展现出极大的优势。在四川偏远地区，通过5G平台实时对话来协调工作。通过实时5G视频对话界面，看到偏远地区的流行病学调查团队开展工作，他们通过平台与四川省内的高级别专家实现互动。这一点让我们感到非常惊艳。”</span></p>\r\n<p><span style=\"\">疫情发生后，中国电信系列智慧社区“黑科技”产品强力上线，全方位助力社区精细化治理和数字化升级。社区电子通行证、体温检测、口罩监测、视频监控、人脸门禁、车牌识别、智能门磁、智能云广播、安全充电插座、智能烟感、燃气报警器等智慧化社区服务，可快速弥补社区信息不全、数据孤岛、技术集成能力弱、网格职能不清晰、运营人员不足等诸多短板，提升社区智能化水平，实现社区精细化管理。</span></p>\r\n<p><span style=\"\">打好疫情防控阻击战，确保安全有序复工复产是一场“硬仗”，中国电信科学部署、多措并举，利用硬核科技与企业一起联防联控，有效加强疫情精准防控，化解人员流动带来的风险，大幅缩短排查时间，提升疫情防控效率。针对各地特色设计的复工复产系统包括返工、返岗以及企业联系人等多个模块，让返工返岗动态一清二楚。</span></p>\r\n<p><span style=\"\">为贯彻落实教育部“停课不停学”工作要求，中国电信急用户所急，快速消除网络盲区，加速创新业务，力争为孩子们呈现最顺畅、最稳定的“空中课堂”。不管条件多恶劣，不管时间多紧急，首要的任务是保证孩子们“停课不停学”。为了上网课，曾经在雪山顶上一坐就是4个小时的西藏昌都姑娘斯朗巴珍，拿到了中国电信免费办理的号卡，终于在家里就可以收看“线上教学”。全国多个地区上演着类似的故事，温暖着人心。</span></p>\r\n<p><span style=\"\">遇见5G畅享美好生活</span></p>\r\n<p><span style=\"\">作为通信行业的最新技术，5G在推进数字化转型的过程中被寄予厚望。随着几年深耕，5G已经从梦想走进现实，走入千行百业，走到你我身边，与我们熟知的行业碰撞出闪亮的火花……</span></p>\r\n<p><span style=\"\">当5G遇见文旅</span></p>\r\n<p><span style=\"\">每逢节假日，总会见到“某某景区游客爆满”的新闻头条，5G时代，与其看人山人海，不如通过5G超高清直播、5G﹢VR直播来一场新鲜的“云”旅行。第26届中国·砀山梨花节开幕式当天，吸引全国近3万名游客参加。中国电信全程为梨花节开幕式提供优质的通信保障服务，并在赛马场、梨树王等活动地通过5G﹢VR直播技术进行多点位360度7×24小时全景直播，让游客不管身在何处，只要打开手机就能“云赏”梨花盛开的瞬间。</span></p>\r\n<p><span style=\"\">当5G遇见农业</span></p>\r\n<p><span style=\"\">中国“大国小农”的农业模式要变革，必须在信息化、智慧化方面发力。无人化农业植保服务是未来趋势，它能实现对农作物的智能化、精准化管理，解放劳动力，降低生产成本，帮助农民增产增收。中国电信与广州极飞电子科技有限公司共同构建了“无人化”农业生态系统，借助中国电信5G、物联网技术，为新疆提供了千架无人机，完成了上万亩次的无人机农业植保，让新疆棉花生产从“传统农业”向“智慧农业”转变，为农业向高质量发展提供了强大动力。</span></p>\r\n<p><span style=\"\">当5G遇见制造业</span></p>\r\n<p><span style=\"\">曾几何时，科幻电影所描绘的“未来工厂”赚足了观众的眼球，灵活自如的机械臂、往来如梭的运输机器人……如今，这样的场景就出现在我们最熟悉的工厂里。</span></p>\r\n<p><span style=\"\">搭载中国电信5G信号的AGV（自动导引运输车）、无人仓库、无人码头形成的完整闭环，让上海的宝钢工厂实现了“无人化”作业模式。从仓库到码头，整个厂内物流过程在指挥中心完全透明化、实时化，各部门可以对计划把握得非常精准，与车队的调度完美衔接。5G网为无人重载框架车提供导航服务，提高了运输效率，管理人员从原来的130人减少到30人。</span></p>\r\n<p><span style=\"\">当5G遇见养老</span></p>\r\n<p><span style=\"\">技术的本质是为人类造福，先进科技和老年群体从来不是对立的两个名词。5G时代，智慧养老应用让“夕阳红”绽放出最美的色彩。</span></p>\r\n<p><span style=\"\">中国电信开发的舟山智慧养老平台公众服务系统“颐舟慧”手机端上线运行。用户打开微信小程序，就可以看到关于老年人的相关政策法规、活动安排；可以搜索浙江舟山的为老服务组织，查看全市的养老服务中心地点。老年人可以下单钟点家政、上门助浴、衣服清洗、养老保姆、上门做餐等养老服务。目前，智慧养老平台已逐步为舟山市养老服务通办、部门联办提供了信息化手段。</span></p>\r\n<p><span style=\"\">当5G遇见医疗</span></p>\r\n<p><span style=\"\">长期以来，看病难困扰着每一个人，对偏远地区群众尤甚。依托5G低时延的网络特性，远程医疗项目如雨后春笋般涌现，为广大患者提供了优质便利的诊疗服务。今年年初，由中国电信提供支持的江西省首辆5G﹢AI肿瘤筛查车开进沿溪镇，为70多名贫困户提供了公益免费肿瘤筛查服务。5G﹢AI肿瘤筛查车上配备了车载乳腺钼靶机、彩超机等先进的检测设备，通过5G技术将影像数据传送到医院的AI影像服务器，快速给出检测报告和初步诊疗意见，让老百姓在家门口实现癌症早筛、早诊、早治。</span></p>\r\n<p><span style=\"\">当5G遇见城市</span></p>\r\n<p><span style=\"\">随着网络覆盖率的快速提高，5G正在改变城市生活的方方面面。中国电信“5G新城市”将5G、云计算、大数据等新一代信息通信技术应用于不同的生活场景，催生出一大批智慧应用。“5G智能环卫监管平台”结合了5G、物联网、大数据、云存储等技术手段，实现了多种投放方式有机补充。AI机器人应用于医疗机构、政务服务大厅，可以为老百姓提供贴心的咨询和引导服务。5G、云计算和大数据等技术的结合，使综合管理平台的智慧终端可对微型社区进行智慧化管理，方便居民的日常生活。5G和人工智能技术接入警用无人机、警用机器人等终端后，传统警务正朝着天地空一体化管理转变，人民群众的生命财产安全又多了一份坚强保护。</span></p>\r\n</div></div></p>', 24, 0, '0', '2', 0, 0, 0, 0, 5, 87, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000088, '天翼宽带续费', 1, '2022-01-14 06:59:03', '2022-09-14 14:02:26', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">矿山里，装载百余吨矿石的卡车流畅、精准、平稳地进行着倒车入位、停靠、倾卸、避障等动作，但驾驶室却空无一人。这不是科幻电影中的场景，而是中国电信通过下沉式5G MEC部署，在安徽省马鞍山南山铁矿实现的国内首个冶金露天矿山多台矿车无人驾驶与有人驾驶混编运行。</span></p>\r\n<p><span style=\"\">随着5G、云计算、大数据、AI等新技术的加速普及，数字化应用正加速改变着我们身处的社会，从前人们想象科幻世界中才有的场景已逐步变为现实。</span></p>\r\n<p><span style=\"\"><b>云网融合通向ICT综合运营之路</b></span></p>\r\n<p><span style=\"\">当前，随着云技术应用的深化，越来越多的政企客户将核心业务上云，对网络的速率、时延、可靠性以及IT系统云化改造经验等要求明显提升，而运营商凭借自身网络优势及IT上云经验，融合网络、云及大数据、AI等能力，为客户提供一站式云网融合服务，打造全新的ICT综合运营模式。</span></p>\r\n<p><span style=\"\">依托行业领先的高质量云网基础设施及服务能力，结合自身BSS/OSS等核心业务系统上云积累的宝贵经验，中国电信围绕客户需求，融合网络、边缘计算、AI等能力，提供IT基础设施上云和应用上云的综合解决方案，帮助政企客户加快自身云化、数字化转型。</span></p>\r\n<p><span style=\"\">在中兴通讯南京滨江工厂的生产线上，一个个通信产品正被快速加工、检测、流转。由于整个工厂采用柔性生产方式，同一生产线上生产多种类产品，这对产品质检等生产环节提出了更高要求，需要在较短时间内对通过的各类产品实现精准检测。过去，实现该目标的方式依赖高昂的成本、人力投入，且准确性难以保障。中国电信发挥运营商“云、边、端”协同的优势，以ICT综合运营的方式为中兴通讯打造了安全可靠的5G智能车间，协助客户将质检模型部署在天翼云，并调动AI能力，利用5G﹢MEC“大带宽、低时延”的特点，实现百兆照片上传、模型判断、结果回传等步骤“秒完”，同时准确率高达97%、漏检率比人工降低80%，在提高效率的同时大幅降低成本。</span></p>\r\n<p><span style=\"\"><b>安全数字化可靠性的底座</b></span></p>\r\n<p><span style=\"\">产业数字化为政企客户带来便利、提升效率，而各类与数字化相关的风险也随之而来、与日俱增。由于网络使用的深化及大数据、云计算等新兴技术的应用，企业网络业务边界不断模糊，网络威胁持续升级，安全事件层出不穷。任何导致业务暂停的网络安全事故都可能给企业带来巨额损失。</span></p>\r\n<p><span style=\"\">中国电信以骨干网运营商独特的网络资源和能力优势为抓手，持续建设覆盖“云、网、边、端、应用”的融合安全技术能力，打造立体化网络安全防护体系。中国电信自主研发的“云堤”平台是国内唯一具有全网覆盖能力和全球触达能力的网络攻击防护平台，全球分布式部署36个DDoS攻击防护节点实现近源清洗，DNS域名解析具备全国监测能力和覆盖31个省（区、市）的DNS秒级同步修正能力。</span></p>\r\n<p><span style=\"\">新冠肺炎疫情防控期间，某重要网站连续被DDoS攻击，攻击峰值曾达13Gbps，其中来自国外的攻击流量占比为60.87%。在发生首次攻击后，中国电信第一时间提供了全流程、可视化的攻击行为监控，让“无形”的网络攻击“现身”。根据大部分攻击流量主要来自境外的特点，中国电信利用运营商的骨干网络防护能力，按照境外、境内两个维度，针对攻击源进行了分布式防护。凭借强大的网络安全能力，中国电信于疫情防控期间在网络空间守卫了国家安全，为产业数字化筑起坚实的安全底座。</span></p>\r\n<p><span style=\"\"><b>一体化服务复杂场景下的专业价值</b></span></p>\r\n<p><span style=\"\">面对客户数字化转型中的新需求，中国电信依托现有覆盖全国的全触点售前支撑服务体系，基于自身云网融合优势能力，深耕垂直行业领域，面向细分市场需求提供从标准化到场景化到定制化的端到端整体解决方案。建立工业、应急、交通物流、住建等十几个行业BG，探索跨界混营新合作模式。进一步强化自研数字平台、原子能力等数字化供给，为用户数字化转型全周期保驾护航。</span></p>\r\n<p><span style=\"\">同时，中国电信在现有服务体系基础上，打造了覆盖全国的属地化专业服务团队，拥有3.6万名具备产业数字化销售和服务能力的专家，其中包括1.6万名从事售中支撑和实施交付的技术型专家。凭借专业的服务能力，中国电信实现从单一网络交付到云网数字化服务整体交付的转变。</span></p>\r\n<p><span style=\"\">在甘肃，中国电信与甘肃省生态环境厅合作，打造覆盖全业务、全流程、全要素的生态环境监测大数据管理平台。中国电信在充分了解需求后，决定采用微服务﹢容器的方式在云端构建统一平台，以一体化交付方式打破原来各业务系统间的数据壁垒。该平台将自然资源、气象、农林、住建、公安等30个厅局级部门及生态环境厅72套在用系统全面打通，实现全省2342个监测站点的有效整合，构建省市县三级、天地空一体的综合大数据平台，为生态治理智能化打下坚实的数据基础。基于云端海量数据，中国电信积极进行政产学研合作，依托大数据、AI等技术，上线预测分析模型，帮助全省环境治理由被动响应向主动预测转变。目前，该模型在大气、水环境预警溯源方面准确率高达97.2%，处于全国先进水平。</span></p>\r\n<p><span style=\"\">5G、云、AI等数字化技术的发展正催生一场社会生产领域无声的革命。无人矿山、智能工厂、智慧生态，一个个高科技应用从想象走向现实，赋予社会发展新动能。作为云网基础设施运营商，中国电信充分发挥自身在云网融合、安全与一体化服务等方面的独特优势，为政企客户提供全新的ICT综合运营服务，赋能千行百业，在建设数字中国之路上砥砺前行。</span></p>\r\n</div></div></p>', 24, 8, '0', '2', 0, 0, 0, 0, 6, 88, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000089, '天翼宽带报装', 2, '2022-01-14 06:59:25', '2022-10-14 14:02:26', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">本报讯 近日，中国电信首个“5G﹢智慧供应链示范单位”在四川挂牌，标志着中国电信采购供应链数字化转型迈出了新的步伐。在当前5G行业场景化应用普遍缺乏的情况下，中国电信运用“5G﹢云﹢AI﹢大数据”等前沿技术对传统产业进行数字化转型升级，为企业创新动能、创造效益、提升效率，并在仓储物流企业率先实现了应用。</span></p>\r\n<p><span style=\"\">中国电信旗下中通服四川公司，依托5G定制网，引入自动化分拣平台、5G工业自然导航AGV（自动导引车）、RFID流转标签识别系统、AI行为算法等信息技术，构建需求数字化管理、配送路由自动规划、质量在线反馈和物流智能交付的能力，彻底打通末梢物流的“最后一公里”。通过一个省级云仓可将1000多万台终端产品快速配送至21个城市的2万余家单位，终端产品供应链层级由原来的五级压降为两级，终端月均库存量降低30%，供应链总成本降低40%，配送效率提升50%以上。</span></p>\r\n<p><span style=\"\">据介绍，打造“5G﹢智慧供应链”是中国电信通过5G赋能千行百业供应链数字化转型的重要举措。中国电信在逐步构建新型供应链生态合作体系提升企业智慧运营水平的同时，希望以智慧供应链解决方案为样板，为政府企事业单位和广大中小企业客户提供更优质的综合智能信息服务，与合作伙伴共建共赢、协同发展。</span></p>\r\n</div></div></p>', 24, 0, '0', '2', 0, 0, 0, 0, 7, 89, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000090, '宽带订单查询', 1, '2022-01-14 06:59:55', '2022-11-14 14:02:26', ' <p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p align=\"left\" style=\"text-align:left;&#10;\"><span lang=\"EN-US\" style=\";background:white\">5G</span><span style=\";&#10;background:white\">将为民用航空带来新变革。<span lang=\"EN-US\">5</span>月<span lang=\"EN-US\">27</span>日，中国电信集团有限公司副总经理张志勇应邀出席中国民用航空局召开的航班正常和服务质量工作会，分享了中国电信“云改数转”战略、<span lang=\"EN-US\">5G</span>定制网建设的实践和“<span lang=\"EN-US\">5G</span>地空通信应用”的举措，表示中国电信将充分发挥<span lang=\"EN-US\">5G</span>、云网融合、安全可信的数字化能力优势，全面推动民航“新基建”，生态化赋能民航数字化转型，推进数字民航建设。</span></p>\r\n<p align=\"left\" style=\"text-align:left;&#10;\"><span style=\";&#10;background:white\"><b>云网融合夯实智慧民航技术底座</b></span></p>\r\n<p align=\"left\" style=\"text-align:left;&#10;\"><span lang=\"EN-US\" style=\";background:white\">2021</span><span style=\";&#10;background:white\">年<span lang=\"EN-US\">5</span>月，中国民用航空局发布了《中国民航新一代航空宽带通信技术路线图》，明确以<span lang=\"EN-US\">5G</span>为代表的新一代航空宽带通信系统的建设应用，是构建智慧民航系统的重要基础和技术支撑。中国电信通过云网融合赋能民航转型，助力民航强国战略，全面推动民航领域的“新基建”，为智慧民航带来数字时代新动能。</span></p>\r\n<p align=\"left\" style=\"text-align:left;&#10;\"><span style=\"&#10;;background:white\">围绕智慧民航建设需求，中国电信以<span lang=\"EN-US\">5G+</span>云网融合为牵引，不断提升数字化供给能力，推进智慧民航定制<span lang=\"EN-US\">5G</span>专网建设，通过“<span lang=\"EN-US\">5G+</span>边<span lang=\"EN-US\">+</span>云<span lang=\"EN-US\">+X</span>”， 实现“云网一体，按需定制”，让<span lang=\"EN-US\">5G</span>技术在民航行业落地生根。</span></p>\r\n<p align=\"left\" style=\"text-align:left;&#10;\"><span style=\"&#10;;background:white\">为真正解决民航旅客上网服务的迫切需求，中国电信投入电信频率<span lang=\"EN-US\">100MHz</span>资源，融合航空移动频率<span lang=\"EN-US\">10MHz</span>，采用混合组网方式，结合天翼云资源为中国民航定制<span lang=\"EN-US\">5G ATG</span>空地云专网，目前，中国电信已经启动<span lang=\"EN-US\">5G ATG</span>网络建设，计划今年三季度完成建网，实现全国航线的网络覆盖，机载设备同步完成适航。单架飞机峰值带宽高达<span lang=\"EN-US\">1Gbps</span>，使乘客在万米高空享受高速带宽的上网体验。</span></p>\r\n<p align=\"left\" style=\"text-align:left;&#10;\"><b><span lang=\"EN-US\" style=\";&#10;background:white\">5G</span><span style=\";&#10;background:white\">多场景支持民航应用</span></b></p>\r\n<p align=\"left\" style=\"text-align:left;&#10;\"><span style=\"&#10;;background:white\">据悉，去年底中国电信已开通北京至成都、北京至上海、北京至广州三条<span lang=\"EN-US\">ATG</span>试验航线，<span lang=\"EN-US\">2021</span>年将实现全球首张<span lang=\"EN-US\">5G ATG</span>网络正式商用。中国电信<span lang=\"EN-US\">5G ATG</span>可以完美支持多种业务，为全民航提供空中互联网和智慧民航服务，可实现视频直播等智慧娱乐服务，订票改签等智慧客舱服务，以及行李跟踪等智慧出行服务，同时也将实现实时<span lang=\"EN-US\">QAR</span>等智慧飞行应用，客舱视频等智慧安防应用，以及地面指挥协同等智慧运控应用。中国电信<span lang=\"EN-US\">5G</span>定制网还可以覆盖机场、空管、航空公司、监管等运行场景，创新更多的行业应用服务民航系统建设。</span></p>\r\n<p align=\"left\" style=\"text-align:left;&#10;\"><span style=\"&#10;;background:white\">张志勇表示，目前，中国电信已与长龙航空达成共识，作为首发用户，全机队实施运营<span lang=\"EN-US\">5G ATG</span>网络。中国电信将与航空公司共同推进<span lang=\"EN-US\">5G ATG</span>合作，完善空中互联网生态，形成多方共赢局面。</span></p>\r\n<p align=\"left\" style=\"text-align:left;&#10;\"><span style=\";&#10;background:white\"><b>全生态化运营赋能智慧民航</b></span></p>\r\n<p align=\"left\" style=\"text-align:left;&#10;\"><span style=\"&#10;;background:white\">面对构建国际一流的现代化民航通信基础设施体系诉求，中国电信坚守与民航行业共生、共建、共享，通过与民航单位跨界合作，加大投入力度、加快创新步伐，为应用创新和产业创新提前培育土壤。中国电信除旗下卫星通信有限公司之外，已陆续联合民航相关单位成立空地互联网络科技股份有限公司和天翼智慧航空科技股份有限公司。</span></p>\r\n<p align=\"left\" style=\"text-align:left;&#10;\"><span style=\"&#10;;background:white\">天翼智航负责运营<span lang=\"EN-US\">5G ATG</span>空地云网，负责高质量国内覆盖的<span lang=\"EN-US\">5G </span>空地云网运营，提供空地网络、机载设备、运营平台软件、技术服务一站式解决方案，帮助航空公司实现飞行大数据运营＋空中互联网服务，促进民航产业数字化转型升级。此外，在构建<span lang=\"EN-US\">5G ATG</span>航空专用无线宽带网的同时，天翼智航还在积极结合中国电信天翼云、大数据、<span lang=\"EN-US\">AI</span>智能、物联网、区块链平台资源，构建<span lang=\"EN-US\">5G ATG</span>空地云网，构筑电信高等级网络安全保障。</span></p>\r\n<p align=\"left\" style=\"text-align:left;&#10;\"><span style=\"&#10;;background:white\">空地互联公司则是全球首家航空公司与电信运营商通过股权合作，共同从事空地互联服务的专业公司，作为中国电信实现“陆海空天”场景通信全覆盖的重要一环，将联合航司共同开发各类增值应用，深度参与数字客舱建设，构建航空互联网产业生态，全生态化赋能中国民航数字化转型。</span></p>\r\n<p align=\"left\" style=\"text-align:left;&#10;\"><span style=\"&#10;;background:white\">守正创新，再接再厉。中国电信是建设网络强国和数字中国、维护网信安全的主力军，实施<span lang=\"EN-US\">5G</span>发展战略的国家队。张志勇表示，在中国民航的大力支持下，中国电信<span lang=\"EN-US\">5G</span>时代以深化民航与互联网的融合为己任，聚焦产品创新、技术创新、机制创新，加快建设步伐和应用生态建设，不断探索推出体验更优、服务更好的航空互联网产品，携手民航同仁深化合作，共塑“<span lang=\"EN-US\">5G+</span>智慧民航”的美好未来！</span></p>\r\n</div></div></p>', 24, 9, '0', '2', 0, 0, 0, 0, 8, 90, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000091, '企业预约天翼宽带', 7, '2022-01-14 07:00:25', '2022-10-14 14:02:26', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">当前，人民生活面临全面数字化转型，恰逢以“在充满挑战的时代加速数字化转型”为主题的世界电信和信息社会日到来之际，中国电信创新性地推出“5G云套餐”，为满足个人和家庭多场景信息消费需求创造条件，赋能数字生活。</span></p>\r\n<p style=\"  \"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>套餐含云盘：5G云套餐助用户畅享“云”上数字生活</b></span></p>\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">近两年，全民“云”上生活成为新常态，“云”在人们日常生活、工作中扮演着越来越重要的角色。今年“517”，中国电信率先推出“5G云套餐”，打破了传统套餐只有流量、语音和短信等通信连接功能的模式，开创性地将60GB云空间纳入5G基础套餐，将套餐升级为“云空间+流量+语音+短信”的云化套餐。用户新办理5G套餐，将同步自动开通免费云空间；已经办理了5G套餐的用户，也可以登录中国电信的APP领取、查询自己的免费云空间。</span></p>\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">“517”期间，电信5G用户还可以5.17元的超低价体验3个月4TB的超大云空间，后续中国电信还将根据用户的通信消费、服务积分等，不断推出优惠的云空间升级方案。</span></p>\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">长期以来中国电信着力打造安全、可信的云服务，手机号码即为云空间账号，号码在即云在，其稳定性、持久性、安全性方面具有充分保障。在“5G云套餐”服务方面，中国电信已对相关系统进行改造，未来在欢go客户端，可方便地进行云空间的订购、升级、查询、使用等服务。</span></p>\r\n<p style=\"  \"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>云中有应用：拓展云应用构建多场景智慧生活</b></span></p>\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">借助自身强大的云网能力、中国电信旨在打造“人人一朵云、家家一朵云”，构建智慧生活的数字底座，同时提供云在生活领域的多场景应用。</span></p>\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">面向个人用户，中国电信提供天翼云会议、天翼云电脑、天翼云相册等应用。以天翼云电脑为例，具有多终端适配能力，电视可秒变电脑，用户可以随时随地访问云端应用和数据。“517”期间，中国电信推出云电脑优惠活动，5G个人用户自订购之日起，可在一年内享受5.5折，费用低至每月13.75元。</span></p>\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">面对家庭用户，中国电信提供天翼看家、家庭共享空间、家庭健康监测等服务。以“天翼看家”为例，用户只需将手机绑定云存储服务和“天翼看家”视频监控，无论是看护孩子、陪伴家人，以及家附近的安全情况，都能自动传到云盘上，可以随时调看直播和回看，不受时间、地点限制。</span></p>\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">为了让用户真正感受到智能化时代的高品质生活，中国电信致力于为家庭用户提供专业化、个性化、智能化的智慧家庭多场景服务，打造极致畅享体验。</span></p>\r\n<p style=\"  \"><span style=\"    background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b>“云+”新生态：推动数字生活全面升级</b></span></p>\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">近年来，中国电信积极拓展云终端能力边界，打通研发、商品化全链条，构建繁荣新分享生态。</span></p>\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">2021年，中国电信发布首款全屋智能业务，面向家庭用户提供综合信息化服务解决方案，包含智能安全、家电控制、照明控制、智能环境、智能窗帘、智能晾晒六个场景。用户可购买搭配好的场景化业务，还可根据个人需求，自由选择产品组合和专业化定制。</span></p>\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">同时，为了使用户放心、安全地畅享数字生活，中国电信还推出隐私哨兵、安全提醒、天翼防骚扰等服务，最大限度保护用户合法权益，提供防骚扰、防诈骗提醒、防数据泄露、来电验证、拦截验证等。</span></p>\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">作为综合信息服务商和经济社会数字化发展的中坚力量，中国电信积极拓展云网融合应用规模，发力布局云端应用，构建全新的“云+网+应用”生态共同体，为人们美好智慧生活增色添彩。</span></p>\r\n</div></div></p>', 24, 0, '0', '2', 0, 0, 0, 0, 9, 91, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000092, '宽带自助排障', 1, '2022-01-14 07:00:55', '2022-09-14 14:02:26', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"  \"><span style=\"\'yes\';   \">2021年5月17日世界电信和信息社会日的主题是“在充满挑战的时代加速数字化转型”。中国电信充分发挥云网融合技术优势，在5.17发布了面向个人/家庭、企业和政府的数字生活、数字产业、数字治理等全方位的推进计划，助力全社会的数字化转型升级，持续为客户创造价值。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \"><b>数字生活推进计划赋能云上生活</b></span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">数字要素是未来生活的关键词，“十四五”规划明确提出，迎接数字时代，以数字化转型整体驱动生产方式、生活方式和治理方式变革。中国电信顺应时代潮流，推出5G云套餐，满足个人和家庭多场景信息消费需求，构筑云上数字生活。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">5G云套餐打破传统套餐以流量、语音、短信为基本架构的通信服务模式，开创性地将60GB免费云空间纳入套餐基础组成部分，实现人人一朵云、家家一朵云。用户的手机号就是云空间账号，云空间与手机号码共生共存，号码在即云在。用户新办理5G套餐，将同步自动开通免费云空间；已经办理了5G套餐的用户，也可以登录中国电信的APP领取、查询自己的免费云空间。基于中国电信的央企特性和云网能力，提供的云服务在稳定性、持久性、安全性方面具有充分保障。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">中国电信还为用户提供了便捷优惠的升级云空间的方式，用户可根据自身需求将云空间升级到4TB、10TB。“517”期间，5G用户可以5.17元的特惠价体验3个月的4TB的云空间。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">数字时代，大量基于云端数据能力的智能应用应运而生。中国电信5G云套餐旨在构建“云+网+应用”的生态共同体，将数字生活中的智慧应用、智能终端、消费权益有机联结，在云端为多场景数字生活打造统一的数字资产存储中心，构建智慧生活的数字底座。在云上应用服务方面，面向个人用户提供云电脑、文件备份、在线编辑、云相册等业务；面向家庭用户提供天翼看家、家庭共享空间、家庭健康监测等服务。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">5G云套餐的推出，从供给侧方面推动数字生活消费升级，驱动智慧家庭生态迎来全新发展变革。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \"><b>数字产业推进计划加速企业数字化转型</b></span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">依托自身云网融合资源禀赋，结合云计算、大数据、AI等自主研发技术，中国电信推出数字产业推进计划，推动企业上云、助力企业数字化转型，降低企业信息化成本。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">一是针对中小企业用户开展提速惠企行动。针对中小企业普通宽带及专线用户，推出提速升级、融合升级、服务升级等举措，标准宽带100Mbps以下的中小企业免费升级至100Mbps，互联网专线速率50Mbps以下免费提速至50Mbps。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">二是开展企业上云行动。针对推出“云+应用”的优惠服务，降低整体信息化成本，助推企业数字化转型升级，提高经营效率，，如天翼企业云盘、天翼云电脑、天翼云会议、安全专线等均有不同程度的打折特惠。以天翼云电脑为例，推出三款云电脑政企版配置，最低至91元/月（4.5折）。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">三是进一步加快5G定制网业务发展，聚焦5G定制网“致远”“比邻”“如翼”三类模式，全面满足企业网络个性化需求，助力千行百业数字化转型升级。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \"><b>数字治理推进计划助力社会治理</b></span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">在本次数字化转型活动中，中国电信还提出了数字治理推进计划，通过以5G、千兆光纤、云计算等为基础，结合城市、乡村的不同应用场景，赋能政府，推动社会治理能力升级。一方面，是通过提供以“智能门禁+物管平台+社区电视”为核心的标准化智慧社区解决方案，在全国开展合作签约，助力社区信息化和基层治理。另一方面，中国电信还把服务乡村发展作为转型工作重点，打造了一批标杆数字乡村，为乡村数字化治理能力提升和线上便民服务提供了强大支撑。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">奋楫恰当时，风正好扬帆。当前，数字化转型正在加速向前。中国电信将立足新发展阶段，贯彻新发展理念，构建新发展格局，把握社会加快数字化转型的全新机遇，全面深入推进“云改数转”战略，从数字政府、数字产业、数字社会、数字民生等多方面推进数字中国建设，助力数字化转型。</span></p>\r\n</div></div></p>', 24, 1, '0', '2', 1, 0, 0, 0, 9, 92, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000093, '宽带故障单查询', 4, '2022-01-14 07:01:26', '2022-08-14 14:02:26', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\";\"><span style=\"\'yes\';\'Times New Roman\';&#10;;\">5月17日，中国电信参与投资的菲律宾第三家电信全业务运营商DITO TELECOMMUNITY CORPORATION（简称：DITO）在菲首都马尼拉举行正式商用仪式，标志着DITO公司在菲律宾全境超过100个主要城市正式商用，将为菲律宾通信行业注入新鲜活力，为菲律宾人民提供更快捷、优质的通信网络服务。</span></p>\r\n<p style=\";\"><span style=\"\'yes\';\'Times New Roman\';&#10;;\">作为投资股东，中国电信</span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">对</span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">DITO公司</span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">的正式商用表示祝贺</span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">。</span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">正值</span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">517</span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">世界电信和信息社会日</span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">，</span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">今年的主题为“在充满挑战的时代加速数字化转型”</span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">，</span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">希望DITO公司的成功商用能够为菲律宾人民带来卓越的信息体验和高标准的客户服务，助力菲律宾</span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">加速</span><span style=\"\'yes\';\'Times New Roman\';&#10;;\">社会数字化转型、缩小数字鸿沟、创造就业机会、推动经济发展，造福社会和中菲两国人民的友谊。</span></p>\r\n</div></div></p>', 24, 0, '0', '2', 0, 0, 0, 0, 11, 93, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000094, '如何进行宽带报障', 9, '2022-01-14 07:01:56', '2022-07-14 14:02:26', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\";&#10;;\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">2021年5月13日，中国电信携手信通院、高通、MTK、海思、展锐、ASR、芯翼、移芯、移远、广合通、芯讯通、高新兴、有方、美格、利尔达等产业合作伙伴在京启动“5G模组合作行动”，加速推进5G、NB-IoT和LTE-Cat1物联网产业规模发展，力促物联网产业壮大。2021年，中国电信计划</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">新增1亿个物联网连接，</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">集采物联网模组</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">3000万片。</span></p>\r\n<p style=\";&#10;;\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信积极响应落实国家加速5G新基建和深化物联网发展的要求，物联网连接服务规模已超过2.6亿；</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">NB-IoT网络全球持续保持领先，连接规模超1亿；5G SA网络率先规模商用，打造云网端融合崭新实践；发布致远、比邻、如翼三类模式5G定制网，提供5G行业领先综合解决方案。</span><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">物联网模组是实现5G时代“万物互联”的关键，中国电信携手模组伙伴，加速推进5G物联网成熟走向规模商用。</span></p>\r\n<p style=\";&#10;;\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">本次多方合作行动的重点：一是推广覆盖高中低速全场景的物联网服务及解决方案，助力社会治理智能化、产业数字化、生活智慧化的升级；二是多措并举，牵引产业链不断提升5G、NB-IoT和LTE-Cat1模组性价比，加速物联网普及；三是成立5G模组创新开放实验室，广泛邀请产业链各方开展高清视频、安防监控、工业互联网、车联网、机器人/无人车等典型场景的5G解决方案联合研发,推进5G安全、物联网OS、端云融合的持续创新，加速5G产业互联网应用落地；四是提供资源和服务保障，为物联网模组提供专属流量套餐、专享金融服务和商机对接，深化合作伙伴互利互惠，提质联盟服务水平。</span></p>\r\n<p style=\";&#10;;\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">聚物上云，万物生智，在2021年5.17电信日来临之际，中国电信携手产业链共筑新业态、共享新生态，共创5G时代物联网产业发展新格局！</span></p>\r\n</div></div></p>', 24, 4, '0', '2', 0, 0, 0, 0, 3, 94, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000095, '多档宽带套餐', 1, '2022-01-14 07:02:25', '2022-06-14 14:02:26', ' <p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">5月13日，在世界电信和信息社会日来临之际，天翼物联举办了中国电信物联网开放平台CTWing 5.0线上发布会，对外发布了CTWing的全新形象、全新能力、全新生态和全新服务，推出5G物联网一站式线上交易平台，实现物联网产品、应用买卖一体化，首次发布多款物联网芯片模组，打造数字经济基础设施，赋能产业数字化转型。</span></p>\r\n<p><span style=\"\">据悉，作为中国电信新型数字基础设施能力底座，CTWing是中国电信物联网能力的统一数字开放平台，汇聚了中国电信云网融合、5G全连接管理、设备管理、城市感知、端到端安全等综合能力。截至目前，平台已服务2.6亿用户，其中5G NB-IoT用户规模突破1亿，全球第一，成为全球规模最大的窄带物联网服务平台；物联网设备连接超6000万，平台月均调用次数近200亿次；平台打造的天翼智慧社区行业应用产品，全国落地部署超2万个。</span></p>\r\n<p><span style=\"\">当前，物联网产业正在加速进入到跨界融合、集成创新、规模化发展的新阶段。以CTWing数字化平台为核心能力底座，中国电信正在实现云网融合和物云融合发展，深度赋能产业数字化转型。</span></p>\r\n<p><span style=\"\">据介绍，CTWing 5.0基于云原生架构，提供集约、分布式的平台部署能力，实现按需灵活部署，全方位满足企业个性化的信息需求，助力企业数字化转型；推出量子安全能力，提供密钥管理服务，实现物联感知终端的量子密钥充注管理、业务数据解密，保障物联网业务数据的绝对安全；推出超120款标准物模型，打通数据壁垒，推动物模型向数字孪生标准演进。</span></p>\r\n<p><span style=\"\">此外，天翼物联还在本次发布会上启动了第三届开发者大赛，将为参赛者提供CTWing平台、开发套件、云容器等开发资源，助力快速开发作品。</span></p>\r\n</div></div></p>', 24, 0, '0', '2', 0, 0, 0, 0, 4, 95, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000096, '电信光宽带，提速又降费', 2, '2022-01-15 01:35:12', '2022-05-19 03:14:07', ' <p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p align=\"center\" style=\"text-align: left;\"><span style=\"\">国家统计局数据显示，1-4月份，社会消费品零售总额同比增长近30%，消费升级成为社会经济增长的重要驱动力，品质化、多样化也成为了居民消费的重要特点。</span></p>\r\n<p><span style=\"\">5月，中国电信翼支付举办“嗨5生活节”活动，推出电信超级plus月卡、寻味家乡农副产品优惠购，以及特约商户消费立减，通过直播带货、线上销售的方式，满足居民消费多元化需求，同时帮助小微商户、农户连接市场需求，提升农副产品和实体店面的营销效率。</span></p>\r\n<p><span style=\"\">根据日前发布的《中华人民共和国乡村振兴促进法》，县域是乡村的主要场景。2021年是“十四五”规划开局之年，也是全面推进乡村振兴的关键一年。</span></p>\r\n<p><span style=\"\">翼支付此前分别在南宁市、贵阳市开阳县举办“甄选好味‘桂’在有你”、“多彩贵州 尝鲜黔味”两场主题直播，并分别与当地政府启动乡村振兴合作。</span></p>\r\n<p><span style=\"\">5月18日，中国电信四川公司数字乡村推进高峰论坛顺利举办。活动现场，中国电信翼支付、中国电信四川公司与威远县、荣县、犍为县、通江县、木里县、盐源县、普格县、盐边县等14个区县政府及十余家农特企业签署了乡村振兴战略及生态合作协议。</span></p>\r\n<p><span style=\"\">据介绍，“寻味家乡”是翼支付2021年推出的乡村振兴主题活动，依托原有的供应链营销服务基础，通过线上营销、直播带货等创新渠道，将地方特色农副产品与市场消费需求进行精准对接，提升优质农副产品的知名度和销量。</span></p>\r\n<p><span style=\"\">翼支付“寻味家乡”主题活动已经走过湖北、宁夏、广西、贵州、四川等5个省份，此前线上展示销售的恩施土豆、宁夏枸杞、大石山糯玉米、葛根粗粮面等“土特产”，也成为了用户们争相购买的新晋网红美食。</span></p>\r\n<p><span style=\"\">在5月的“嗨5生活节”活动中，翼支付集中上架了5个省份的特色美食，一次性满足消费者的购买需求。同时，借助优惠券发放，帮助各地农产品实现大卖。</span></p>\r\n<p><span style=\"\">作为贯穿全年的主题活动，翼支付从31个省份及直辖市甄选出百余款具有地方代表性的特色农副产品，每月选择两个省份的特色产品重点展示，并在翼支付APP首页、购物频道、微信公众号、中国电信5G会员小程序等平台配合进行营销推广。</span></p>\r\n<p><span style=\"\">在此次“嗨5生活节”活动当中，翼支付全面展示了以数智营销为基础，全面服务实体经济发展的平台能力。乡村振兴的关键在于振兴乡村经济，而农副产品则是大幅提升乡村经济发展的核心，拓宽特色化农产品销路正是一个有效抓手。翼支付也正是基于这一洞察，推出了“寻味家乡”系列活动，在田间地头和城市餐桌之间搭建了一座桥梁，让城市居民足不出户就能享受到货真价实、原汁原味的地方特色农副产品，也让包括农户在内的农副产品产业链直接受益，进而助力乡村振兴发展。</span></p>\r\n<p><span style=\"\">翼支付用实践探索证明，利用线上平台的强流量资源优势，对接城乡差异化供求关系，为特色农副产品实现产销一体化，在完成需求精准对接的同时，间接拉动内需，逐渐探索出一条可持续可复制的有效助农路径，借势消费复苏的热潮让乡村振兴的脚步更加快速、稳健。</span></p>\r\n<p><span style=\"\">在中国电信四川公司数字乡村推进高峰论坛，翼支付还提出了三个具体方向：整合数字营销科技能力与农业产业链，建设供销一体的助农惠农平台，打造乡村产业品牌；推动乡村居民普惠金融可得性与便捷性，深化乡村服务智能化，提升乡村消费金融能力；积极探索线上线下融合的乡村缴费模式，加快实现乡村治理数字化，助力平安乡村建设。</span></p>\r\n<p><span style=\"\">随着“寻味家乡”活动参与省份的逐渐增加，翼支付也将聚焦更多地区农产品的线上销售平台搭建及农村数字化建设，全力助推乡村振兴，展现央企社会责任。</span></p>\r\n</div></div></p>', 24, 0, '0', '2', 0, 0, 0, 0, 5, 96, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000097, '天翼看家', 1, '2022-01-15 01:35:43', '2022-04-19 03:14:07', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"  \"><span style=\"\'yes\';   \">本报讯&nbsp;日前，在“庆建党百年华诞迎杭州亚运盛会”系列活动中，中国电信正式发布首个为杭州亚运会定制的公益视频彩铃。</span><span style=\"\'yes\';   \"><br />\r\n</span><span style=\"\'yes\';   \">伴随着5G网络建设及短视频应用的风靡，中国电信5G新应用——视频彩铃应运而生。为共同营造“人人知晓亚运，人人参与亚运，人人服务亚运”的氛围，助力亚运体育精神广泛传播，中国电信特别推出的2022年第19届亚运会首个公益视频彩铃正式发布。亚运视频彩铃含“相约杭州亚运”“杭州亚运会主题口号”“杭州亚运吉祥物”“杭州亚运礼仪”等多个主题，只需扫描二维码即可免费开通使用，让用户的每次呼叫等待都有亚运相伴，让每次来电都能达成一次亚运宣传，让每个用户都成为杭州亚运的“代言人”，向全世界传递亚运的声音和梦想。</span><span style=\"\'yes\';   \"><br />\r\n</span><span style=\"\'yes\';   \">据悉，中国电信视频彩铃是基于VoLTE或5G技术，实现政企客户的电话在被叫振铃时回放短视频的服务，帮助客户充分利用通话前的黄金时间开展文化传播和品牌宣传。对于政企单位来说，视频彩铃可以展示党政建设成果，宣贯环保、公益、社会主义核心价值观。中小商户可以进行店铺信息展示、新品推介、促销信息展示。集团型大企业可以宣传品牌、产品。服务型企业可以展示界面。</span></p>\r\n</div></div></p>', 31, 7, '0', '2', 0, 0, 4, 0, 6, 97, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000098, '全屋WiFi', 4, '2022-01-15 01:41:50', '2022-05-15 09:41:24', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">六一儿童节期间，中国电信湖北分公司通过线上线下相结合的形式开展爱心志愿服务活动。本次活动发挥直播带货的宣传优势进行预热推广，线上收集客户爱心能量，线下组织党员和团员青年前往武汉市爱心花朵儿童福利院开展关心慰问和爱心志愿服务。</span></p>\r\n<p><span style=\"\">活动前期，湖北电信以省电渠中心牵头组织，通过湖北电信官方旗舰店直播间宣传爱心志愿服务活动内容，不仅介绍了中国电信一直以来积极支撑精准扶贫、持续助力公益事业的具体举措，而且结合公益活动中的实际案例宣传了天翼看家、全屋WiFi、高速宽带等中国电信业务，推荐了直播间专属的特惠活动，引导用户通过直播间下单、点赞分享、留言互动等方式积攒“爱心能量”，共同助力开展本次爱心志愿服务活动。</span></p>\r\n<p><span style=\"\">活动当天，湖北电信的党员和团员青年首先为武汉市爱心花朵儿童福利院的孩子们带去了大米、面条、食用油等生活慰问品；随后，大家一起欣赏了福利院儿童表演的歌舞和朗诵节目；最后，党员和团员青年为孩子们现场朗诵了爱国主义教育题材的诗歌，弘扬了爱国主义精神。</span></p>\r\n<p><span style=\"\">通过此次活动，湖北电信充分发挥了直播带货等新媒体运营渠道的宣传能力和传播效应，将线上积攒的爱心汇聚到线下活动中，不仅为日常营销工作注入了中国电信的爱心和温暖，体现了中国电信作为央企关心关爱儿童的社会责任感，而且进一步提升了中国电信员工的思想觉悟，培养大家树立关注弱势群体、关心爱护下一代、积极奉献爱心的意识，发扬乐于助人、无私奉献的公益精神。</span></p>\r\n</div></div></p>', 31, 0, '0', '2', 0, 0, 0, 0, 1, 98, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000099, '光纤改造申报', 1, '2022-01-15 01:47:11', '2022-06-19 03:14:07', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\";&#10;;\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">2021年4月28日，在由国家发改委指导、中国电信主办的“融通创新”主题日上，边缘（上海）科技有限公司正式揭牌成立，中国电信集团有限公司副总经理刘桂清为公司成立进行揭牌。</span></p>\r\n<p style=\";&#10;;\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">边缘（上海）科技有限公司是由天翼创投公司为主体，以混合所有制方式投资设立的科研成果转化公司，致力于打通中国电信自研成果产业化之路。公司初期主要负责承接中国电信集团的科技创新成果转化，实现成果及产品的运营支撑服务、新兴市场拓展及部分产品的迭代开发，促进中国电信自主掌控的关键核心能力和核心技术的落地转化。未来也可以承接各类成果的孵化转化。</span></p>\r\n<p style=\";&#10;;\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">公司秉承市场化、专业化、风险利益共担、先行先试的原则，通过成果作价入股、科研骨干及管理层持股等方式探索研发成果与市场对接创新模式，基于新型体制机制，实现研发人员成果价值共享和中长期激励。</span></p>\r\n<p style=\";&#10;;\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">边缘（上海）科技有限公司的成立，是贯彻落实党的十九届五中全会“坚持创新驱动发展，完善科技创新体制机制”精神的具体举措。中国电信将以此为契机，推动科技成果转化新的跨越式发展，激发科技人员活力，助力实现将“中国电信打造成为关键核心技术自主掌控的科技型企业，进入国家科技创新企业第一阵营”的战略目标。</span></p>\r\n</div></div></p>', 31, 1, '0', '2', 0, 0, 0, 0, 4, 99, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000100, '百兆光纤，飞速畅享', 9, '2022-03-01 12:16:25', '2022-07-15 10:42:59', '阿莎', 31, 2, '0', '2', 1, 0, 0, 0, 9, 100, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000101, '在用套餐详情', 7, '2022-01-15 02:46:00', '2022-08-15 10:45:34', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">近日，工业和信息化部在拉萨组织召开第四次全国工业和信息化系统援藏工作座谈会，总结近年来全国工业和信息化系统援藏工作取得的进展，就下一步支持西藏工业和信息化高质量发展作出部署。中国电信集团有限公司党组成员、副总经理刘桂清出席会议并作交流发言。</span></p>\r\n<p><span style=\"\">刘桂清表示，中国电信高度重视援藏工作，深入贯彻习近平总书记关于西藏工作的重要论述，坚决贯彻新时代党的治藏方略，积极履行央企责任，发挥建设网络强国和数字中国、维护网信安全的主力军作用，持续加大投入，狠抓工作落实，援藏工作取得积极成效。一是以“消除盲区”为着力点，加强西藏通信基础设施建设，推进电信普遍服务试点工作，积极参与信息化建设，推动西藏和四省涉藏州县通信业与信息化跨越式发展。二是坚持援藏先“援智”，深化“请进来、走出去”政策，加大对西藏人才智力的支持。三是建立健全深化中国电信大扶贫工作体系，主动担当发挥优势，实现网络扶贫、产业扶贫、就业扶贫、消费扶贫等协同推进，助力对口支援地区打赢脱贫攻坚战。</span></p>\r\n<p><span style=\"\">刘桂清强调，下一阶段，中国电信将进一步发挥信息网络在促进地方经济发展、社会和谐稳定等方面的支撑作用，加大电信普遍服务工作力度，做好边境地区网络建设；推进IT上云，加快信息化系统建设；加强干部人才队伍建设，建立健全“帮带提升”工作机制；巩固拓展脱贫攻坚成果，助力全面推进乡村振兴，为促进西藏和四省涉藏州县繁荣进步、长治久安作出新的更大贡献。</span></p>\r\n</div></div></p>', 30, 1, '0', '2', 0, 0, 0, 0, 1, 101, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000102, '领券到厅得流量', 1, '2022-01-15 02:49:53', '2022-09-19 03:14:07', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">数字经济时代，作为数据、内容和算力的承载平台，大数据中心在新基建中，毫无疑问成为国家基础战略性资源和重要生产要素。以大数据赋能高质量转型发展，为中国数字经济发展提供强大的基础资源支撑，是中国电信坚持不懈的追求与使命。作为国内领先的数据中心和云计算服务商，中国电信按照国家新基建战略部署，不断加强顶层设计和总体布局，积极创新变革，全面实施促进大数据发展行动，加快推动数据资源共享及开发应用，助力产业转型升级。</span></p>\r\n<p><span style=\"\">近年来，中国电信青海公司坚持以习近平新时代中国特色社会主义思想为指导，结合青海省委、省政府大数据战略的实施，树立“国之大者”的思想自觉，不断加快推进5G基站、大数据、人工智能等信息领域新基建。同时，以《云网融合2030技术》白皮书为指导，积极推动大数据与实体经济深度融合，培育新增长点、形成新动能；加快科技创新，建设网络强国、数字中国、智慧社会。</span></p>\r\n<p><span style=\"\">目前，中国电信在青海已建成中国电信青海云网大数据中心、柴达木云数据中心暨青藏高原数据灾备中心、8个市州大数据中心及44个区县边缘数据中心。为全省200余家委办厅局、企事业单位提供数据中心服务，为千家企业客户提供数据中心服务，全面助力青海数字经济发展。</span></p>\r\n<p><span style=\"\">今年是“十四五”规划开局之年，也是中国共产党建党100周年，在这特殊的一年里，中国电信青海公司决意秉承“兰西一体”的城市群发展理念，凭借拥有的丰富清洁能源、气候干冷、地质地貌适宜建造大数据中心等诸多先天优势，准确定位并加大对数据中心的建设投入，助力数字经济与实体经济的深度融合及高质量发展，助力青海推进“一优两高”、建设“五个示范省”，为青海省全面推进产业数字化、推动经济高质量发展，提供更强大的动能。</span></p>\r\n<p><span style=\"\">即将在海东河湟新区开工建设的中国电信（国家）数字青海新型大数据中心项目，将作为中国电信在青海的标杆数据中心，与现有的中国电信青海云网大数据中心、青藏高原数据灾备中心多节点互补，全面形成“3﹢8﹢X”的数据中心整体布局及云数能力，有力支撑经济发展新旧动能转换，为推进“云上青海”，推动大数据与经济社会发展深度融合作出应有的贡献。</span></p>\r\n</div></div></p>', 30, 0, '0', '2', 0, 0, 0, 0, 1, 102, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000103, '\r\n新版流量频道上线了！', 2, '2022-01-15 03:29:53', '2022-01-15 11:28:57', ' <p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">4月19日至4月23日，中国电信集团有限公司在贵州遵义干部学院举办党组理论学习中心组党史学习教育（扩大）专题读书班，学习党的光辉历史，做到学史明理、学史增信、学史崇德、学史力行，学党史、悟思想、办实事、开新局，并结合行业特点和企业实际，深入开展专题研讨，凝心聚力开创企业高质量发展新局面。集团公司党组书记、董事长柯瑞文以“从‘半部电台’到‘云监工’”为主题讲授了专题党课，并通过视频会议系统延伸到全国各省公司、专业公司、直属单位以及地市分公司、县级分公司。集团公司党组副书记、总经理李正茂进行了学习动员并作读书班总结讲话。党史学习教育中央宣讲团成员、原中共中央文献研究室常务副主任杨胜群应邀解读了党的百年奋斗史。</span></p>\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">柯瑞文带领大家深入学习领会习近平总书记在党史学习教育动员大会上的重要讲话精神，学习党的光辉历史，引导大家更加深刻认识到红色政权来之不易、新中国来之不易、中国特色社会主义来之不易。柯瑞文在党课中系统梳理红色电信走过的百年历程，缅怀红色电信先辈立下的不朽功绩，深入阐述了以“听党指挥、信念坚定、一心为民、变革创新、崇尚科技、安全畅通”为内涵的红色电信精神，强调要把红色资源利用好、把红色传统发扬好、把红色基因传承好，从红色电信精神中汲取砥砺奋进的力量，不忘初心再出发，牢记使命勇担当。柯瑞文强调，以人民为中心是习近平新时代中国特色社会主义思想的根本立场，人民邮电为人民是中国电信的光荣传统，要永葆为民本色，聚焦解决人民群众最关心最直接最现实的利益问题，扎实开展“我为群众办实事”实践活动，让群众有更多更实在的获得感、幸福感、安全感。柯瑞文指出，要把握历史发展大势，因应产业发展趋势，抓住关键战略机遇期，坚定实施云改数转战略，勇担建设网络强国、数字中国，维护网信安全主力军的使命责任，坚持党建统领、守正创新、开拓升级、担当落实，开创企业高质量发展新局，在全面建设社会主义现代化国家新征程中作出更大贡献。</span></p>\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">李正茂在读书班总结讲话中强调，要通过四个“下功夫”推动党史学习教育走深走实。要在学深悟透上下功夫，党员领导干部要带头抓好学习，讲好党课，扎实开展好专题学习，确保基层党员干部党史学习教育全覆盖。要在办实办好上下功夫，掌握群众需求办实事、突出重点办实事、激发党员干部模范作用办实事，深入推动“我为群众办实事”实践活动开展。要在深化改革上下功夫，按照国企改革三年行动方案的要求，扎实推进政企改革等各项改革工作，不断提升公司治理水平和运营效率，不断开拓事业发展新局。要在抓紧抓实上下功夫，抓牢主体责任的落实、抓牢“关键少数”责任的落实、抓牢支部书记责任的落实，坚决履行好责任，开创企业高质量发展新局面。&nbsp;</span></p>\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">集团公司党组成员及与会代表围绕党史学习教育，结合本次读书班的相关课程内容的学习,联系各自分管领域工作分别作了交流发言。大家一致认为必须把党的历史学习好、总结好，把党的成功经验传承好、发扬好。要从长征精神和遵义会议精神中深刻感悟共产党人的初心和使命，落实新时代党的建设总要求，转化为中国电信建设网络强国和数字中国、维护网信安全的强大动力和最佳实践。</span></p>\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">本次专题读书班采取专题授课、现场教学、个人自学、专题研讨相结合的形式，创新方式方法、讲活历史故事，用活红色资源，搞活教育形式。遵义干部学院的教授讲授了《遵义会议与遵义会议精神》的专题课程，中国信息通信研究院和行业技术专家就行业趋势和科技创新进行了专题交流。专题读书班充分发挥革命老区的生动教材作用，到遵义会议纪念馆参加中国电信革命传统教育基地揭牌仪式，到红军烈士陵园向革命先烈敬献花篮，重温入党誓词，参观娄山关红军战斗遗址并开展现场教学活动，在现场教学中感悟思想伟力，体悟为民情怀，感受真实场景。读书班上，全体学员读原著、悟原理，认真研读习近平《论中国共产党历史》等四本指定学习材料，并紧密结合内心感悟、思想认识和企业改革发展实际，深入研讨交流，做到在思想认识上有新提高、工作思路上有新拓展、破解难题上有新对策。</span></p>\r\n<p style=\"  \"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">中国电信集团有限公司党组成员，集团公司纪检监察组、总部部门、省级公司、专业公司和直属单位党组织书记、主要负责人90余人参加专题读书班。</span></p>\r\n</div></div></p>', 30, 0, '0', '2', 0, 0, 0, 0, 1, 103, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000104, '流量超市', 2, '2022-01-15 03:56:49', '2022-01-15 11:02:47', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\"  \"><span style=\"\'yes\';   \">2021年5月17日世界电信和信息社会日的主题是“在充满挑战的时代加速数字化转型”。中国电信充分发挥云网融合技术优势，在5.17发布了面向个人/家庭、企业和政府的数字生活、数字产业、数字治理等全方位的推进计划，助力全社会的数字化转型升级，持续为客户创造价值。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \"><b>数字生活推进计划赋能云上生活</b></span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">数字要素是未来生活的关键词，“十四五”规划明确提出，迎接数字时代，以数字化转型整体驱动生产方式、生活方式和治理方式变革。中国电信顺应时代潮流，推出5G云套餐，满足个人和家庭多场景信息消费需求，构筑云上数字生活。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">5G云套餐打破传统套餐以流量、语音、短信为基本架构的通信服务模式，开创性地将60GB免费云空间纳入套餐基础组成部分，实现人人一朵云、家家一朵云。用户的手机号就是云空间账号，云空间与手机号码共生共存，号码在即云在。用户新办理5G套餐，将同步自动开通免费云空间；已经办理了5G套餐的用户，也可以登录中国电信的APP领取、查询自己的免费云空间。基于中国电信的央企特性和云网能力，提供的云服务在稳定性、持久性、安全性方面具有充分保障。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">中国电信还为用户提供了便捷优惠的升级云空间的方式，用户可根据自身需求将云空间升级到4TB、10TB。“517”期间，5G用户可以5.17元的特惠价体验3个月的4TB的云空间。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">数字时代，大量基于云端数据能力的智能应用应运而生。中国电信5G云套餐旨在构建“云+网+应用”的生态共同体，将数字生活中的智慧应用、智能终端、消费权益有机联结，在云端为多场景数字生活打造统一的数字资产存储中心，构建智慧生活的数字底座。在云上应用服务方面，面向个人用户提供云电脑、文件备份、在线编辑、云相册等业务；面向家庭用户提供天翼看家、家庭共享空间、家庭健康监测等服务。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">5G云套餐的推出，从供给侧方面推动数字生活消费升级，驱动智慧家庭生态迎来全新发展变革。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \"><b>数字产业推进计划加速企业数字化转型</b></span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">依托自身云网融合资源禀赋，结合云计算、大数据、AI等自主研发技术，中国电信推出数字产业推进计划，推动企业上云、助力企业数字化转型，降低企业信息化成本。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">一是针对中小企业用户开展提速惠企行动。针对中小企业普通宽带及专线用户，推出提速升级、融合升级、服务升级等举措，标准宽带100Mbps以下的中小企业免费升级至100Mbps，互联网专线速率50Mbps以下免费提速至50Mbps。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">二是开展企业上云行动。针对推出“云+应用”的优惠服务，降低整体信息化成本，助推企业数字化转型升级，提高经营效率，，如天翼企业云盘、天翼云电脑、天翼云会议、安全专线等均有不同程度的打折特惠。以天翼云电脑为例，推出三款云电脑政企版配置，最低至91元/月（4.5折）。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">三是进一步加快5G定制网业务发展，聚焦5G定制网“致远”“比邻”“如翼”三类模式，全面满足企业网络个性化需求，助力千行百业数字化转型升级。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \"><b>数字治理推进计划助力社会治理</b></span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">在本次数字化转型活动中，中国电信还提出了数字治理推进计划，通过以5G、千兆光纤、云计算等为基础，结合城市、乡村的不同应用场景，赋能政府，推动社会治理能力升级。一方面，是通过提供以“智能门禁+物管平台+社区电视”为核心的标准化智慧社区解决方案，在全国开展合作签约，助力社区信息化和基层治理。另一方面，中国电信还把服务乡村发展作为转型工作重点，打造了一批标杆数字乡村，为乡村数字化治理能力提升和线上便民服务提供了强大支撑。</span></p>\r\n<p style=\"  \"><span style=\"\'yes\';   \">奋楫恰当时，风正好扬帆。当前，数字化转型正在加速向前。中国电信将立足新发展阶段，贯彻新发展理念，构建新发展格局，把握社会加快数字化转型的全新机遇，全面深入推进“云改数转”战略，从数字政府、数字产业、数字社会、数字民生等多方面推进数字中国建设，助力数字化转型。</span></p>\r\n</div></div></p>', 30, 0, '0', '2', 0, 0, 0, 0, 2, 104, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000105, '积分服务新通知', 4, '2022-01-15 04:12:25', '2022-01-14 18:12:08', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">中新网上海4月20日电 (记者 吴涛)近日，“百年党旗红 国企新征程”暨“强国中坚 高质量发展看国企”网络主题采访活动走进中国电信，在拥有百年历史的上海电信博物馆拉开帷幕。</span></p>\r\n<p><span style=\"\">媒体代表参观了上海电信博物馆、信息生活体验馆，全进程回顾我国通信发展历史，生动感受未来智慧城市场景，并通过天翼云视频会议系统进行北京、上海、瑞金、湘西的四地实时互动采访。</span></p>\r\n<p><span style=\"\">国资委新闻中心副主任闫永表示，从半部电台起家的红色电信事业，队伍越来越壮大、战略地位也越来越重要。当下，作为建设网络强国的先锋队和主力军，中国电信正努力让人民群众切实感受到网络强国、数字中国建设带来的获得感、幸福感、安全感，凝聚起奋斗百年路、启航新征程的强大精神力量，并不断把学习教育成效转化为推动高质量发展的强大动力。</span></p>\r\n<p><span style=\"\">四地实时视频连线，讲述红色电信精神驱动下，不同时代的电信事业。</span></p>\r\n<p><span style=\"\">江西瑞金主讲人讲述了新中国通信事业从无到有、从小到大、从弱到强的艰难历程。1930年12月，在反击国民党军队对中央苏区的第一次“围剿”中缴获了一台电台设备，但是这台设备只能收听不能发报，故被称为“半部电台”。它陪伴红军战士走完了漫漫长征路，在一次次战斗中立下了赫赫战功。人民军队的无线电通信事业由此起步。</span></p>\r\n<p><span style=\"\">湖南湘西十八洞村讲述人称，十八洞村位于武陵山腹地，交通不便，通信设施极度落后。中国电信勇担责任，积极履行央企职责，抽调精干力量来到这里开展通信建设扶贫攻坚工作。截至目前，十八洞村已经实现了光纤入户，并实现了4G、5G网络的覆盖。一条“云端上的信息路”让越来越多的村民当上了网店老板，为全国打造了脱贫致富的村级样本。</span></p>\r\n<p><span style=\"\">据介绍，在疫情之际，中国电信仅用3天时间，就为火神山医院开通了超高速5G网络连接，依托云网融合优势与央视频打造了亿万人关注的“云监工”，这一现象级的“慢直播”为“中国速度”作出了生动有力的“电信注脚”。这些都见证着中国电信的高质量发展。(完)</span></p>\r\n</div></div></p>', 11, 3, '0', '2', 0, 0, 0, 1, 1, 105, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000106, '积分获取记录', 7, '2022-01-15 04:17:05', '2022-01-15 12:16:09', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">近日，中国电信天翼物联科技有限公司举办“5G定制﹢助力云改数转”5G物联定制能力开放线上发布会，对外发布了5G物联定制能力和物联网联合开放实验室，推出5G物联网全国十大示范项目。发布会上介绍，中国电信现已实现5G定制网络的全国覆盖，2021年将打造百个5G定制网标杆，实现1000个5G定制网商用项目落地，推动行业数字化转型升级。</span></p>\r\n<p><span style=\"\">为推动行业数字化转型，加快5G应用场景拓展，2020年11月，中国电信发布了致远、比邻、如翼三种5G定制网服务模式，全面满足企业网络个性化需求。在发布会上，中国电信政企信息服务事业群副总经理冯炜表示，云网融合及企业数字化转型已成为行业发展的主旋律，中国电信将进一步加快5G定制网业务发展，打造有影响力、有场景、有价值、有协同、有生态、有展示的百个定制网标杆项目，提升行业影响力。</span></p>\r\n<p><span style=\"\">天翼物联总经理钟平介绍，天翼物联自主研发的5G连接管理平台，可提供连接管理、切片运营、网络能力开放、业务编排、数据分析、增值服务等功能，全面满足5G定制网客户的自管理、自服务需求，加速推进产业数字化转型。截至目前，天翼物联已在北京、广东、江苏等省市支撑了120多个5G定制项目，覆盖致远、比邻、如翼三种定制网服务模式，在医疗、制造、钢铁、化工、矿业等领域实现突破，得到了客户的高度认可。</span></p>\r\n<p><span style=\"\">据悉，中国电信5G定制网不仅是基于5G SA架构的网络，还可以实现“云网一体、按需定制”，具备“定制服务更灵活、安全接入更可靠、性能保障更全面”的三大特点，能全面满足行业数字化转型需求。目前，中国电信5G定制网已深入应用于智慧公安、智慧城市、智慧园区、智慧电网等场景。</span></p>\r\n<p><span style=\"\">在此次发布会上，中国电信成立了物联网联合开放实验室，旨在以自有能力和服务，帮助合作伙伴快速推出可规模推广的5G物联网商用产品。同时，中国电信还对外发布了5G物联网全国十大示范项目，涵盖深圳数字孪生城市、苏州5G智慧园区、安徽5G智慧矿山、浙江5G智慧医疗、四川智慧燃气、湖北智慧水务、佛山智慧乡村、江西智慧消防等场景。</span></p>\r\n</div></div></p>', 11, 0, '0', '2', 0, 0, 0, 0, 1, 106, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000107, '\r\n积分计算最新规则', 9, '2022-01-15 04:17:22', '2022-01-15 04:16:09', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p><span style=\"\">中新网上海4月20日电 (记者 吴涛)近日，“百年党旗红 国企新征程”暨“强国中坚 高质量发展看国企”网络主题采访活动走进中国电信，在拥有百年历史的上海电信博物馆拉开帷幕。</span></p>\r\n<p><span style=\"\">媒体代表参观了上海电信博物馆、信息生活体验馆，全进程回顾我国通信发展历史，生动感受未来智慧城市场景，并通过天翼云视频会议系统进行北京、上海、瑞金、湘西的四地实时互动采访。</span></p>\r\n<p><span style=\"\">国资委新闻中心副主任闫永表示，从半部电台起家的红色电信事业，队伍越来越壮大、战略地位也越来越重要。当下，作为建设网络强国的先锋队和主力军，中国电信正努力让人民群众切实感受到网络强国、数字中国建设带来的获得感、幸福感、安全感，凝聚起奋斗百年路、启航新征程的强大精神力量，并不断把学习教育成效转化为推动高质量发展的强大动力。</span></p>\r\n<p><span style=\"\">四地实时视频连线，讲述红色电信精神驱动下，不同时代的电信事业。</span></p>\r\n<p><span style=\"\">江西瑞金主讲人讲述了新中国通信事业从无到有、从小到大、从弱到强的艰难历程。1930年12月，在反击国民党军队对中央苏区的第一次“围剿”中缴获了一台电台设备，但是这台设备只能收听不能发报，故被称为“半部电台”。它陪伴红军战士走完了漫漫长征路，在一次次战斗中立下了赫赫战功。人民军队的无线电通信事业由此起步。</span></p>\r\n<p><span style=\"\">湖南湘西十八洞村讲述人称，十八洞村位于武陵山腹地，交通不便，通信设施极度落后。中国电信勇担责任，积极履行央企职责，抽调精干力量来到这里开展通信建设扶贫攻坚工作。截至目前，十八洞村已经实现了光纤入户，并实现了4G、5G网络的覆盖。一条“云端上的信息路”让越来越多的村民当上了网店老板，为全国打造了脱贫致富的村级样本。</span></p>\r\n<p><span style=\"\">据介绍，在疫情之际，中国电信仅用3天时间，就为火神山医院开通了超高速5G网络连接，依托云网融合优势与央视频打造了亿万人关注的“云监工”，这一现象级的“慢直播”为“中国速度”作出了生动有力的“电信注脚”。这些都见证着中国电信的高质量发展。(完)</span></p>\r\n</div></div></p>', 11, 10, '0', '2', 1, 0, 17, 1, 1, 107, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000108, '协议期以及赠返费查询', 1, '2022-01-15 04:23:31', '2022-01-15 12:03:39', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"Custom_UnionStyle\">\r\n<p style=\";&#10;;\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">2021年4月28日，在由国家发改委指导、中国电信主办的“融通创新”主题日上，边缘（上海）科技有限公司正式揭牌成立，中国电信集团有限公司副总经理刘桂清为公司成立进行揭牌。</span></p>\r\n<p style=\";&#10;;\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">边缘（上海）科技有限公司是由天翼创投公司为主体，以混合所有制方式投资设立的科研成果转化公司，致力于打通中国电信自研成果产业化之路。公司初期主要负责承接中国电信集团的科技创新成果转化，实现成果及产品的运营支撑服务、新兴市场拓展及部分产品的迭代开发，促进中国电信自主掌控的关键核心能力和核心技术的落地转化。未来也可以承接各类成果的孵化转化。</span></p>\r\n<p style=\";&#10;;\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">公司秉承市场化、专业化、风险利益共担、先行先试的原则，通过成果作价入股、科研骨干及管理层持股等方式探索研发成果与市场对接创新模式，基于新型体制机制，实现研发人员成果价值共享和中长期激励。</span></p>\r\n<p style=\";&#10;;\"><span style=\"   background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">边缘（上海）科技有限公司的成立，是贯彻落实党的十九届五中全会“坚持创新驱动发展，完善科技创新体制机制”精神的具体举措。中国电信将以此为契机，推动科技成果转化新的跨越式发展，激发科技人员活力，助力实现将“中国电信打造成为关键核心技术自主掌控的科技型企业，进入国家科技创新企业第一阵营”的战略目标。</span></p>\r\n</div></div></p>', 29, 7, '0', '2', 0, 0, 1, 1, 2, 108, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000109, '立足科技自立自强，全面推进云网融合', 2, '2022-01-15 05:01:50', '2022-10-15 05:01:36', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">编者按：云网融合是科技自立自强的内在要求，是发展数字经济的坚实支撑，是维护国家信息安全的有效保证，对于我国网络强国建设具有重要战略意义。日前，中国电信集团有限公司党组书记、董事长柯瑞文在人民日报社《人民论坛》杂志发表署名文章指出，我国云网融合起步早，推进力度大，已经形成先发优势。未来，我国云网融合发展，必须以网络强国战略为指引，遵循新发展理念，坚持以人民为中心的发展，坚持产业链的共同发展，坚持绿色低碳的发展，坚持安全可控的发展，构建具有中国特色的发展模式，现予以全文转载。</p>\r\n<p align=\"center\"><strong>立足科技自立自强，全面推进云网融合</strong>&nbsp;</p>\r\n<p align=\"center\">中国电信集团有限公司 &nbsp;党组书记、董事长 &nbsp;柯瑞文</p>\r\n<p align=\"justify\">习近平总书记在主持中共中央政治局第三十四次集体学习时提出，“要加快新型基础设施建设，加强战略布局，加快建设高速泛在、天地一体、云网融合、智能敏捷、绿色低碳、安全可控的智能化综合性数字信息基础设施”，标志着云网融合正式成为我国数字信息基础设施建设的重要内容，极大鼓舞了中国电信坚持云网融合的战略信心。</p>\r\n<p align=\"justify\">2016年，中国电信在业内率先提出云网融合的发展方向，是全球最早提出云网融合发展理念的电信运营商。2018年，中国电信发布了业界首个云网融合白皮书。2020年，又率先发布《云网融合2030技术白皮书》。几年来，中国电信对云网融合的理解不断深化，坚持以云网融合牵引发展实践和科技创新，为打通经济社会发展的信息“大动脉”贡献了重要力量。</p>\r\n<p align=\"justify\"><strong>云网融合是建设网络强国的必然选择</strong>&nbsp;</p>\r\n<p align=\"justify\">习近平总书记强调，我们必须敏锐抓住信息化发展历史机遇，自主创新推进网络强国建设。云网融合对于我国网络强国建设具有重要战略意义。</p>\r\n<p align=\"justify\">第一，云网融合是科技自立自强的内在要求。我国是最先提出云网融合的国家，发展水平居于世界前列。加强云网融合原创性、引领性技术攻关，形成局部优势，可以带动服务器芯片、操作系统、开源软硬件等一系列相关技术的进步，并为人工智能、大数据、区块链、物联网等多项创新技术融合协同提供重要载体，成为打破西方国家在信息通信产业技术垄断的关键入口。</p>\r\n<p align=\"justify\">第二，云网融合是发展数字经济的坚实支撑。云网分离的传统架构无法满足数字经济迅猛发展带来的企业大规模上云需求。云网融合在统一云网资源技术底座、供给方式和运营管理的基础上，实现云网能力的服务化，有力推动融合行业应用创新和运营模式变革，赋能千行百业。在新冠肺炎疫情暴发初期，中国电信展现了强大的云网融合优势，在48小时内完成火神山和雷神山医院的5G网络部署，同步构建4K超高清MEC直播边缘能力，不仅为亿万网友提供安全稳定的“云直播”平台，而且通过医疗上云、远程会诊等信息化应用为战“疫”赢得时间和空间。</p>\r\n<p align=\"justify\">第三，云网融合是维护国家信息安全的有效保证。业务和数据安全已成为当前国家关键部门和企业核心系统上云最关注的因素之一。通过云网融合，可以打通原先端、网、云各自独立的安全架构，建立具备防御、检测、响应、预测能力的一体化安全体系，维护党政军以及电力、交通、金融等关键领域的信息安全。中国电信率先将具有全球覆盖能力的网络攻击防护服务产品“云堤”引入天翼云，实现年均防御大规模网络攻击33万次，处置网络仿冒、钓鱼站点28.2万个，挽回经济损失数亿元。</p>\r\n<p align=\"justify\"><strong>云网融合是数字信息基础设施的核心特征</strong>&nbsp;</p>\r\n<p align=\"justify\">通信技术和信息技术的快速融合，推动着云和网从独立发展走向全面融合，给信息基础设施的技术架构、业务形态和运营模式带来深刻变革。云和网都将采用虚拟化、云化的部署方式，甚至基于统一的逻辑技术架构，在通用物理资源、基础能力平台和数字化应用等各个层面催生云网融合新架构、新技术、新业务。</p>\r\n<p align=\"justify\">在业务数字化、技术融合化和数据价值化的推动下，云网融合已经成为数字信息基础设施的核心特征。高清视频和AI等网络和算力强依赖型业务，正成为业务数字化的标配和主体，它们需要云网融合提供泛在的算力。虚拟化、软件化、云化和AI等技术加快与通信技术的融合，推动网络功能从硬件设备中分离，并使云和网可以采用一致的技术架构，为云网资源的统一调度和智能化运维奠定了技术基础。</p>\r\n<p align=\"justify\">云网融合作为数字信息基础设施的核心特征，具体表现在云、网和数字化平台相互之间的能力需求和协同上。一方面，随着数字化转型的加速，云更加强调灵活定制和快速交付能力，需要网络具有更强的敏捷性、可用性、智能性、安全性和适配能力 ；另一方面，为了灵活适应互联网和云业务的发展，传统封闭刚性的网络从以硬件为主体的架构向虚拟化、云化、服务化的方向发展，需要云提供统一业务承载与集约运营、虚拟网元能力开放以及电信级安全性。与此同时，数字化平台需要云资源备份和多线接入、云网能力的服务化提供，以及云原生开发和云网内生安全环境。</p>\r\n<p align=\"justify\"><strong>云网融合是信息通信科技创新的技术方向</strong>&nbsp;</p>\r\n<p align=\"justify\">习近平总书记指出，“必须坚持走中国特色自主创新道路，面向世界科技前沿、面向经济主战场、面向国家重大需求，加快各领域科技创新，掌握全球科技竞争先机”。云网融合是信息通信科技创新的重要方向。从技术内涵来看，云网融合实现了三个维度的一体化能力：一是一体化供给，对网络资源和云资源统一定义、封装和编排，形成统一、敏捷、弹性的资源供给体系；二是一体化运营，实现云网全域资源感知、一致质量保障、一体化规划和运维管理；三是一体化服务，云网业务可以统一受理、统一交付、统一呈现。</p>\r\n<p align=\"justify\">从技术架构来看，云网融合主要发生在云网基础资源、云网操作系统和数字化平台等三个层面上，它们相互支撑和依赖，需要协同推进。其中，云网基础资源包括云资源（算力资源、存储资源和算法资源）、网络资源、数据资源等，应尽量采用通用化、标准化的硬件形态。云网操作系统需要对云网基础资源进行统一抽象、管理和编排，实现云网业务一体化快速开通和高质量保障，并支持云网原生的开发环境。云网操作系统之上是数字化平台，应提供云网能力开放、数字化开发运行环境和数据多方共享，并服务各行业的数字化解决方案。</p>\r\n<p align=\"justify\">从技术创新来看，云网融合要重点攻关六大类关键核心技术。一是空天地海一体化的泛在连接，目的是提升网络连接的性能质量与覆盖范围；二是云网边端智能协同，要实现网络在云侧、边侧、终端侧的高效分布和智能协同 ；三是数据和算力等新型资源融合，实现对多维资源的统一管控与调度；四是云网资源统一管控的云网操作系统，把云网底层基础设施抽象为通用能力与服务，支撑业务系统的实时、按需、动态化部署；五是一体化智能内生机制，利用 AI 技术实现端到端的自适应、自学习、自纠错和自优化；六是端到端安全内生机制，构建防御、检测、响应、预测一体的内生安全体系。</p>\r\n<p align=\"justify\"><strong>践行网络强国战略，夯实云网融合新型基础设施</strong>&nbsp;</p>\r\n<p align=\"justify\">实施网络强国战略，建设云网融合数字信息基础设施，关键在于技术要强、覆盖要广，要规模推进信息基础设施向云网融合升级，提高渗透率，推动更多企业“上云用数赋智”，成为数字经济持续发展的坚实底座。作为数字中国和网络强国建设的主力军，中国电信全力践行云网融合，坚持“网是基础、云为核心、网随云动、云网一体”的原则，在规模开展信息基础设施建设的同时，加强关键核心运营技术攻关，努力实现高水平科技自立自强。</p>\r\n<p align=\"justify\">在“网是基础”方面，中国电信积极打造高速泛在、天地一体的基础网络，现已建成全球最大的5GSA共建共享网络、最大的NB-IoT网络、最大的千兆光纤网络，是全球领先的互联网运营商，是国内唯一卫星移动通信运营商。中国电信率先规模引入ROADM技术实现全光交换，正逐步迈向全光网2.0时代 ；率先规模引入SRv6技术构建新型城域网和CN2骨干网新平面，使得入云、云间、多云等业务可以一跳直达、一站开通 ；率先规模部署IPv6单栈提升IPv6网络流量。在第六届世界互联网大会“领先科技成果发布活动”上，中国电信的“运营级IPv6技术创新与超大规模部署”研发成果获评“世界互联网领先科技成果”</p>\r\n<p align=\"justify\">在“云为核心”方面，中国电信持续加强云的建设和部署，为云网融合战略打下坚实基础。目前中国电信IDC 规模在中国居于首位，IaaS份额在全球运营商中居于首位，公有云客户数居国内第二。同时，不断加大对云基础软硬件、云技术底座、云创新服务等关键核心技术的攻关力度，突破了分布式数据库、云操作系统、弹性计算、云存储、云网络、CDN 等一系列关键核心技术，开展了服务器、交换机、SDWAN、信创云等多形态基础设施和云服务的定制开发，目前自主研发的天翼云 4.0已具备分布式、自主可控、安全可信和开放合作的重要功能和特性，可向客户提供公有云、私有云、专属云、混合云、边缘云等全栈云服务。</p>\r\n<p align=\"justify\">在“网随云动、云网一体”方面，中国电信依照网络资源按云所需、网络调度随云而动、网络和云一体部署的三大原则，实现“云在哪里，网络部署在哪里”。中国电信率先提出“三朵云”5G网络架构，将5G视为现阶段云网融合的最佳实践，实现了5G核心网、接入网及网络边缘的云化。此外，自研的新一代云网运营系统，已突破云网自动编排等关键技术，可实现业务分钟级开通、故障分钟级恢复，下一步还将构建云网操作系统，对云网资源、数据、能力进行全面管理和统一调度，对全行业的云网应用进行赋能。</p>\r\n<p align=\"justify\"><strong>打造有中国特色的云网融合发展模式</strong>&nbsp;</p>\r\n<p align=\"justify\">习近平总书记指出，“发展必须是科学发展，必须坚定不移贯彻创新、协调、绿色、开放、共享的发展理念”。我国云网融合发展，必须以网络强国战略为指引，遵循新发展理念，构建具有中国特色的发展模式。</p>\r\n<p align=\"justify\">首先，要坚持以人民为中心，实现普惠、均衡和充分发展。要以服务我国经济社会发展大局为出发点，加快云网融合基础设施升级和普及，持续提升用户体验，满足人们的获得感、幸福感、安全感。中国电信一直坚持“用户至上，用心服务”理念，全力推动普遍服务，特别是推动贫困地区的通信网络建设，助力国家精准脱贫 ；积极落实提速降费，推动我国固定宽带和手机流量平均资费五年内下降超过95% ；积极推动全网通手机发展，降低用户换机入网门槛。</p>\r\n<p align=\"justify\">其次，要坚持产学研用协同创新，实现产业链共同发展。云网融合数字信息基础设施关系到我国国民经济的健康安全发展，并且目前正处于创新发展的关键阶段，亟需多方共同参与，营造健康有序的产业生态。中国电信在云网资源建设、技术研发和业务创新等方面积极发挥主力军作用，云网融合已成为企业深入实施“云改数转”战略的重要优势 ；通过战略合作、行业协同、产学研合作和资本布局等手段积极打造云网融合生态，以回归 A股为契机，在5G、云网融合等重点领域引入20家重量级战略投资人，有力推动产业链、供应链和创新链的发展。</p>\r\n<p align=\"justify\">再次，要坚持绿色低碳的发展。为实现“双碳”目标，云网融合的发展积极采用新技术、新模式，持续推进节能降耗，提高可再生能源占比，减少碳排放，打造绿色云网基础设施 ；通过数字赋能，帮助其他行业实现绿色发展。中国电信发布碳达峰、碳中和“1236”行动计划，目标是到“十四五”期末，实现单位电信业务总量综合能耗和单位电信业务总量碳排放下降23%以上。</p>\r\n<p align=\"justify\">最后，要坚持安全可控的发展。没有网络安全就没有国家安全，云网融合发展一定要确保安全可控。中国电信坚持自研安全平台和产品，全面支撑云网安全，提供包括云堤、量子城域网和密流安全计算平台等主流安全产品，构建了国内唯一具有全球覆盖能力的网络攻击防护平台。与此同时，聚焦云网安全和数据安全的核心技术，重点攻关网络内生安全、云原生安全和数据安全。</p>\r\n<p align=\"justify\">未来，中国电信将继续坚定贯彻落实习近平总书记关于发展数字经济的重要论述，切实履行建设网络强国和数字中国、维护网信安全的主力军职责，加大云网融合关键核心技术创新，加快向科技型企业转型发展，努力成为国家战略科技力量的重要支撑。</p></div></p>', 29, 469, '0', '2', 2, 0, 1, 0, 1, 109, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000110, 'HJD04大型数字程控交换机', 1, '2022-01-15 05:02:02', '2022-09-15 13:01:36', '<p style=\"text-align:justify;\"><div class=TRS_Editor><div class=\"TRS_PreAppend\" style=\"overflow-x: hidden; word-break: break-all\"><span><font size=\"+0\">\r\n<p align=\"center\"><img style=\"border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-top-width: 0px\" alt=\"\" src=\"./W020220104407060021971.jpg\" oldsrc=\"W020220104407060021971.jpg\" /></p>\r\n<p align=\"justify\">HJD04机被誉为中国信息通信技术和产业领域的“原子弹”。该成果通过“引进、消化吸收、创新”研制成功,从根本上扭转了我国电信网现代化建设受制于人的被动态势,使“巴黎统筹委员会”始于1989年对我国实施的大型程控交换机禁运制裁行动彻底流产，为我国通信网络的快速现代化和成为全球最大规模的信息通信基础网做出了巨大的贡献。</p>\r\n<p align=\"justify\">在HJD04机的带动下,培育出中兴、华为等位于全球信息通信设备制造业“第一集团”的著名企业。中国政府“友谊奖”获奖专家、我国高科技领域第一家合资企业上海贝尔电话设备制造有限公司副董事长莫瑞尔为数字程控技术和生产线的引进、中外合作、技术转让发挥了十分重要的作用。</p>\r\n<p align=\"justify\"><font face=\"楷体,楷体_GB2312\">原载中国日报网2014年9月16日</font></p>\r\n</font></span></div></div></p>', 29, 6, '0', '2', 0, 0, 0, 0, 3, 110, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000111, '中国电信2022年度工作会议在京召开', 4, '2022-01-15 05:02:32', '2022-09-15 13:01:36', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">12月21日至23日，中国电信2022年度工作会议在京召开。会议以习近平新时代中国特色社会主义思想为指导，全面贯彻党的十九大、十九届历次全会和中央经济工作会议精神，落实中央企业负责人会议和全国工业和信息化工作会议的要求，总结2021年工作，分析面临的形势，部署2022年重点工作任务，全面实施云改数转战略，全力推进企业高质量发展，以优异成绩迎接党的二十大胜利召开。工业和信息化部总工程师韩夏出席会议并讲话，工信部、审计署、财政部及国资委等相关领导出席会议。</p>\r\n<p align=\"center\"><img style=\"border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-top-width: 0px\" alt=\"\" src=\"./W020211223750182415692.jpg\" OLDSRC=\"W020211223750182415692.jpg\" /></p>\r\n<p align=\"justify\">韩夏在讲话中充分肯定了中国电信2021年取得的成绩，介绍了2021年信息通信业发展情况，分析了行业发展面临的新形势，传达了工信部对2022年信息通信工作部署。她指出，一年来，中国电信以习近平新时代中国特色社会主义思想为指导，牢固树立新发展理念，坚决贯彻落实党中央、国务院决策部署，认真落实工信部、国资委等部门有关工作要求，扎实履行政治责任、经济责任、社会责任，顺利完成全年各项工作目标，为加快网络强国、数字中国建设做出了重要贡献。面对严峻复杂的国际形势和新冠疫情的严重冲击，中国电信做了大量扎实有效的工作，取得了显著成绩，科技创新进展显著，云网建设纵深推进，业务转型成效突出，民生服务不断改善，治理改革逐步深入。对中国电信下一步工作，她提出“五个加快”：加快科技创新，推动关键技术攻关取得新突破；加快云网融合，推动基础设施建设取得新进展；加快业务转型，推动数字经济发展取得新成果；加快服务升级，推动社会责任落实取得新成效；加快改革步伐，推动企业活力动力取得新提升。韩夏表示，信息通信行业正面临着新机遇新挑战、肩负着新使命新任务，希望中国电信全体干部员工开拓进取、砥砺前行，以实际行动把党中央决策部署落实到位，为新时代建设网络强国、制造强国、数字中国作出新的更大贡献，以优异成绩迎接党的二十大胜利召开。</p>\r\n<p align=\"justify\">中国电信董事长、党组书记柯瑞文作题为《党建统领 守正创新 开拓升级 担当落实 全面实施云改数转战略 推进企业高质量发展》的讲话，回顾了2021年实现“十四五”良好开局的进展情况，以及在推进企业高质量发展中富有成效的探索和实践。中国电信更加坚决做到“两个维护”，更加坚定捍卫“两个确立”；坚持党建统领，不断强化党的政治建设；坚持守正创新，传承红色电信基因；坚持开拓升级，深化行业协同，推进共建共享，在高效网络覆盖的同时有效降低成本、增强用户体验，加大开放合作力度，主动营造发展大环境，构建互利共赢的生态圈；坚持担当落实，改进作风、深化改革，扎扎实实干出实效；坚持云改数转战略，加快建设“高速泛在、天地一体、云网融合、智能敏捷、绿色低碳、安全可控”的智能化综合性数字信息基础设施，推进高质量发展，重点分析企业当前面临的形势，对做好2022年的重点工作提出了明确要求。</p>\r\n<p align=\"justify\">中国电信总经理、党组副书记李正茂在会上做工作报告，总结回顾了2021年主要工作情况，肯定了全年在党史学习教育、拓展市场改善服务、加快推进新型基础设施建设、科技创新、企业管理、关心关爱员工、履行央企责任等方面取得的成绩，强调要结合宏观大势、行业趋势和企业实际，准确识变、科学应变、主动求变，明确了2022年主要发展目标，并对具体工作进行了部署。</p>\r\n<p align=\"justify\">会议指出，2021年是党和国家历史上具有里程碑意义的一年，是我国现代化进程中具有特殊重要性的一年。2021年也是中国电信具有里程碑意义的一年，全集团在以习近平同志为核心的党中央坚强领导下，坚持以习近平新时代中国特色社会主义思想为指导，自觉在思想上、政治上、行动上同党中央保持高度一致，认真贯彻落实党中央重大决策部署，不断统一思想，不惯性重复和简单延续过去，积极践行建设网络强国、数字中国和维护网信安全主力军的初心使命，坚持党建统领、守正创新、开拓升级、担当落实，抓住难得的战略机遇期，实施云改数转战略，全面完成各项任务，实现了“十四五”良好开局。具体体现在坚持党建统领，不断加强党的政治建设；成功完成股份回A、天翼云建设等具有里程碑意义的工作，呈现新气象，取得新成效；经营发展、客户服务稳中有进；科技创新、生态、AI等领域的战略性布局初步完成；云网融合、深化改革纵深推进；心怀“国之大者”，践行央企责任，在乡村振兴、通信安全保障任务、疫情防控等方面充分彰显社会责任。</p>\r\n<p align=\"justify\">会议认为，当前，世纪疫情持续冲击，百年变局加速演进，与此同时，互联网、大数据、云计算、人工智能、区块链等技术加速创新，数字经济正在成为重组全球要素资源、重塑全球经济结构、改变全球竞争格局的关键力量，发展数字经济是把握新一轮科技革命和产业变革新机遇的战略选择。中国电信正处于大有可为的战略机遇期，要稳中求进，乘势而上，全面实施云改数转战略，以客户为中心，坚持创新驱动，深化改革开放，加快实现从局部突破向规模拓展转变，推动企业高质量发展。</p>\r\n<p align=\"justify\">会议强调，2022年要以习近平新时代中国特色社会主义思想为指导，全面贯彻党的十九大、十九届历次全会和中央经济工作会议精神，落实中央企业负责人会议和全国工业和信息化工作会议的要求，坚持稳中求进工作总基调，完整、准确、全面贯彻新发展理念，积极服务和融入新发展格局，统筹发展和安全，坚持党建统领、守正创新、开拓升级、担当落实，全面实施云改数转战略，大力推进科技创新，持续深化企业改革，充分调动广大干部员工的积极性、主动性、创造性，抢抓重大战略机遇，乘势而上，真抓实干，推进企业高质量发展，以优异成绩迎接党的二十大胜利召开。</p>\r\n<p align=\"justify\">会议明确了七个方面的重点工作：<strong>一是大力推进科技创新，持续打造科技型企业。</strong>加快研发领域重点突破，优化科研机制，建强人才队伍。加大科研资源投入，加快成果产业化，强化科研生态合作，提升行业影响力。<strong>二是坚持以客户为中心，决胜数字经济新航道。</strong>筑牢基本盘，实现基础业务规模发展，加快产业数字化业务规模突破。加强主实协同和国内国际双环互促，积极推进生态布局，全面提升客户服务水平。<strong>三是加快构建数字信息基础设施，夯实数字化转型的能力基础。</strong>加快建设高速泛在的精品网络，形成天地一体的全业务能力，构建云网融合新型信息基础设施并持续提升智能敏捷能力。坚持绿色低碳发展模式、安全可控目标，全面深化共建共享合作，加快打造集约统一的数字化平台。<strong>四是全面深化企业改革，激发企业动力活力。</strong>坚决完成国企改革三年行动任务，推动完善中国特色现代企业制度。加快推进三项制度改革，一体推进政企改革并深化专业公司改革。<strong>五是增强企业治理水平，持续提升企业管理效益效率。</strong>优化四位一体管理体系，持续提升资源效能和产业链供应链管理， 推进依法治企，积极履行央企社会责任。<strong>六是防范化解各类风险，牢牢守住不发生重大风险的底线。</strong>防范投资、财务、云网运营和安全生产等风险，积极应对涉外风险等。<strong>七是加强党的全面领导，切实增强党建引领保障作用。</strong>加强政治理论学习，推动基层党建工作提质升级，加强干部员工队伍建设，扎实推进全面从严治党。</p>\r\n<p align=\"center\"><img style=\"border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-top-width: 0px\" alt=\"\" src=\"./W020211223750182429688.jpg\" OLDSRC=\"W020211223750182429688.jpg\" /></p>\r\n<p align=\"justify\">本次会议表彰了中国电信先进集体和劳动模范，此次获奖的集体和个人在落实集团战略、推进科技创新、深化企业改革、促进经营发展等工作中取得了优异成绩，激励广大干部员工同心同德、锐意进取，在推动高质量发展新征程中创新创造潜能，实现自身价值和企业价值的双赢。</p>\r\n<p align=\"justify\">中国电信一届五次职工代表大会于同期召开，全体职工代表认真聆听学习了工信部总工程师韩夏和集团公司董事长、党组书记柯瑞文的讲话，听取并审议了总经理、党组副书记李正茂所作的工作报告、职代会工作情况报告等相关报告。大家表示，要进一步深入学习、深刻领会董事长讲话精神，提高站位、把握大局，按照工作报告中对2022年的谋划和部署切实抓好落实；积极履行好职工代表的权利和义务，增强主人翁意识，发扬奋斗精神，为推进企业高质量发展再立新功。</p>\r\n<p align=\"justify\">“伟大梦想不是等得来、喊得来的，而是拼出来、干出来的。”会议号召全体干部员工要更加紧密团结在以习近平同志为核心的党中央周围，坚持以习近平新时代中国特色社会主义思想为指导，增强“四个意识”、坚定“四个自信”、做到“两个维护”，不断提高政治判断力、政治领悟力、政治执行力，立足新发展阶段，完整、准确、全面贯彻新发展理念，积极服务和融入新发展格局，弘扬红色电信精神，坚持党建统领、守正创新、开拓升级、担当落实，全面实施云改数转战略，推进企业高质量发展，以优异成绩迎接党的二十大胜利召开。</p>\r\n<p align=\"justify\">本次会议以“现场+视频”方式召开。集团公司党组成员、外部董事、老领导、集团公司总部部分部门主要负责人在现场参会，其他会议代表通过视频会议远程参会。</p></div></p>', 29, 38, '0', '2', 2, 0, 7, 3, 4, 111, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000112, '中国电信集团概况', 7, '2022-01-15 05:03:02', '2022-09-15 13:01:36', '<p> <div class=TRS_Editor><p align=\"justify\">中国电信集团有限公司是中国特大型通信运营企业，连续多年入选《财富》杂志“世界 500 强企业”，主要经营移动通信、互联网接入及应用、固定电话、卫星通信、ICT 集成等综合信息服务。集团公司总资产 9078 亿元，员工 40万人。</p>\r\n<p align=\"justify\">中国电信集团有限公司是由国家单独出资设立的中央企业。国务院国资委根据国务院的授权，代表国务院履行出资人职责，向集团公司派驻监事会。集团公司根据国务院国资委要求设立董事会，下设提名委员会、薪酬与考核委员会、审计和风险管理委员会及战略委员会。</p>\r\n<p align=\"justify\">中国电信集团有限公司在31 个省（自治区、直辖市）和美洲、欧洲、香港、澳门等地设有运营机构。集团公司控股“中国电信股份有限公司”“中国通信服务股份有限公司”“新国脉数字文化股份有限公司”和“北京辰安科技股份有限公司”等上市公司。</p></div></p>', 29, 5, '0', '2', 1, 0, 0, 0, 6, 112, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000113, '2022 MWC上海五大主题抢先看', 1, '2022-01-15 05:03:32', '2022-09-15 13:01:36', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">极具影响力的行业盛会MWC上海将于2022年6月29日至7月1日再度举行。此次盛会以“连接无限可能（Connectivity Unleashed）”为主题，云集全球移动运营商、设备制造商、技术提供商、供应商以及内容所有者。</p>\r\n<p align=\"justify\">2022 MWC上海将围绕云网络、5G连接、万物互联、新科技、AI演进五大主题展开。观众可根据不同主题进行日程制定，以便快速找到最感兴趣的相关会议、主题演讲、合作伙伴活动、活动参展商及研讨会。</p>\r\n<p align=\"justify\"><strong>云网络</strong>&nbsp;</p>\r\n<p align=\"justify\">早在全球疫情发生之前，电信行业十多年来就一直在应对由数字原生企业带来的挑战，比如阿里巴巴、腾讯和百度等，这些企业为无缝在线体验设定了新标准。网络环境在持续变化以支持服务的交付；现如今，云被视为大规模转型的关键推动因素，预计到2026年，市场份额可达到750亿美元。云迁移、私有云以及OpenRAN和边缘计算等技术，能够发挥其真正的作用，创造新的蓝图，重塑未来网络经济，但需要悉心引导，以确保为移动网络运营商创造价值。</p>\r\n<p align=\"justify\"><strong>5G连接</strong>&nbsp;</p>\r\n<p align=\"justify\">中国正在持续推出全球最快的5G网络，5G连接数量达到近3亿。交互性是5G互联领域的核心要素，而行业合作则是实现创新的基石。随着医疗保健、汽车、航空和制造业不断寻求移动解决方案，5G使用的相关案例也随之增加，这充分表明5G有着比新技术本身更深层的意义。5G连接这一主题也将继续探索在5G助力下的未来格局，以及向6G过渡的发展蓝图。</p>\r\n<p align=\"justify\"><strong>万物互联</strong>&nbsp;</p>\r\n<p align=\"justify\">万物互联是互联时代的下一个演进阶段。随着400多亿终端设备的出现，越来越多的设备能够连接到互联网，将有望彻底改变我们生活的诸多方面。智能技术让城市、家庭和企业能够实现物理空间的重构与转型，使其更具适应性和个性化，甚至可预见即将出现的新需求。随着世界的重启，这一主题将展示万物互联如何以惊人的全新方式推动社会的数字化与数据化进程。</p>\r\n<p align=\"justify\"><strong>新科技</strong>&nbsp;</p>\r\n<p align=\"justify\">新科技主题旨在探索移动是如何借助那些跨行业的创新来实现未来转型的。随着新互联网市场的兴起，Metaverse和NFT市场快速发展，创造了前所未有的良好机遇。更广泛地讲，数字化转型正飞速发展，在相对较短的时间内，中国已经成为全球最大的数字经济体之一。新科技旨在实现创新与变革，让我们重构并重塑后疫情时代。</p>\r\n<p align=\"justify\"><strong>AI演进</strong>&nbsp;</p>\r\n<p align=\"justify\">AI（人工智能）是第四次工业革命和创新的关键驱动因素。随着网络越来越智能化，其产生的影响不仅体现在网络规划方面，也辐射到企业和行业的其他方面。到2025年，全球投资将达1700亿英镑，AI对数据的使用，以及在开发量子计算和机器人技术等新行业方面哪里需要合作、如何进行合作，这些都促进新变革的形成。虽然人工智能对于网络和社会的变革性影响十分显著，但目前我们仍未能深涉其中。</p></div></p>', 29, 0, '0', '2', 0, 0, 0, 0, 5, 113, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000114, '“村村通宽带”打通乡村振兴信息“大动脉”', 9, '2022-01-15 05:04:15', '2022-09-15 05:04:04', '<div id=\"divContent\" style=\"overflow-x: auto;\">\r\n                <p>近日，国家发展改革委发布《关于做好近期促进消费工作的通知》（以下简称《通知》），提出打造线上节庆消费提质升级版、有效拓展县域乡村消费等十项举措，重点抓住春节、元宵节等传统佳节消费旺季契机，适应居民消费习惯变化和提质升级需要，挖掘消费热点和增长点，进一步释放居民消费潜力，推动实现第一季度经济平稳开局。</p><p>《通知》提出，打造线上节庆消费提质升级版。引导电商企业开启春节“不打烊”模式，线上举办年货采办、赶大集等促销活动。结合节庆特点，推出更多定制化、智能化、绿色化商品，重点推广品牌农产品、地理标志产品、老字号等优质特色产品。开展形式多样的促销活动，有条件的地方可联合企业发放消费券、惠民券。支持孝文化家庭式消费，鼓励面向老人、儿童等群体推出“一站式购齐”平价年货大礼包。维护春节市场秩序，严禁不公平竞争、“二选一”及“大数据杀熟”、销售侵权假冒伪劣商品等违法行为。</p><p>《通知》要求，进一步激发智慧零售新活力。推动实体商场、超市、便利店等数字化改造和线上线下协同，发展仓储会员店、“门店到家”服务等零售新业态，加快培育体验式、沉浸式消费新场景，提升消费智慧化、便利化水平。鼓励办公楼宇、住宅小区、社区商圈等加快布局配套智慧超市、智慧商店、智慧书店、智慧药房，优化自提柜、云柜等新业态服务，发展无接触交易服务，满足“宅经济”“云生活”等新消费需求。</p><p>据悉，《通知》在满足居民节日消费需求方面提到“适老化”服务，要求顺应老人赴子女居住地团聚需要，做好老年人等特殊群体传统与智能、线上与线下相结合的出行服务。</p>\r\n	</div>', 29, 20, '0', '2', 0, 0, 0, 1, 1, 114, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000115, '中央网络安全和信息化委员会印发《“十四五”国家信息化规划》', 2, '2022-01-15 05:06:27', '2022-10-15 13:05:01', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">近日，中央网络安全和信息化委员会印发《“十四五”国家信息化规划》（以下简称《规划》），对我国“十四五”时期信息化发展作出部署安排。</p>\r\n<p align=\"justify\">《规划》提出，到2025年，数字中国建设取得决定性进展，信息化发展水平大幅跃升。《规划》围绕确定的发展目标部署了10项重大任务，一是建设泛在智联的数字基础设施体系，二是建立高效利用的数据要素资源体系，三是构建释放数字生产力的创新发展体系，四是培育先进安全的数字产业体系，五是构建产业数字化转型发展体系，六是构筑共建共治共享的数字社会治理体系，七是打造协同高效的数字政府服务体系，八是构建普惠便捷的数字民生保障体系，九是拓展互利共赢的数字领域国际合作体系，十是建立健全规范有序的数字化发展治理体系，并明确了5G创新应用工程等17项重点工程作为落实任务的重要抓手。</p>\r\n<p align=\"justify\">《规划》把基础能力、战略前沿、民生保障等摆在优先位置，确定了全民数字素养与技能提升、企业数字能力提升、前沿数字技术突破、数字贸易开放合作、基层智慧治理能力提升、绿色智慧生态文明建设、数字乡村发展、数字普惠金融服务、公共卫生应急数字化建设、智慧养老服务拓展10项优先行动。从加强组织领导、健全政策体系、强化队伍建设、规范试点示范、强化战略研究和加强舆论宣传6个方面保障实施，确保目标任务落到实处。</p></div></p>', 29, 1, '0', '2', 0, 0, 0, 0, 1, 115, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000116, '从R15到R18，由现在向未来', 4, '2022-01-15 06:08:23', '2022-10-15 14:07:52', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">3GPP作为全球影响力最大、落地商用最成功的通信标准化组织之一，其制定的5G标准已于2020年7月被国际电信联盟（ITU）确认为在IMT-2020框架下的唯一 5G标准。5G标准化在推出R15、R16和R17三个版本之后，3GPP在2021年4月决定从R18 开始正式启动5G演进标准的制定，并且正式将5G演进标准定名为5G-Advanced。</p>\r\n<p align=\"justify\">众所周知，5G标准在制定伊始，便致力于支持ITU定义的5G三大类应用场景，即增强移动宽带（eMBB）、超高可靠低时延通信（uRLLC）和海量机器类通信（mMTC）。3GPP制定的第一个5G标准版本R15，支持5G独立组网及非独立组网，在空口上引入大规模天线、灵活帧结构、补充上行及双连接等技术，重点满足增强移动宽带业务的需求；R16致力于5G能力的拓展与延伸，以垂直行业应用为抓手，通过工业物联网、专用网络、5G车联网等一系列立项的支持，重点满足超高可靠低时延通信业务的需求，并且通过网络大数据采集、5G远端基站干扰管理等立项，初步解决了运营商降本增效的痛点问题。</p>\r\n<p align=\"justify\">正在制定的R17对5G能力进行了进一步拓展，在无线侧标准化方面，主要从使能更多行业和应用、解决5G网络运营需求及基础能力持续提升3个方向对5G能力提出了更高的要求。</p>\r\n<p align=\"justify\">一是使能对5G无线切片的支持，通过支持基于切片的小区选择/重选和业务连续性，以及基于资源隔离的差异化随机接入等一系列技术手段，在无线侧为实现功能定制、资源隔离及质量保障三大5G切片特征进行了初次探索，并为完成5G端到端切片打通打下了良好的无线侧标准化基础。</p>\r\n<p align=\"justify\">二是使能对5G多播广播业务的支持。与LTE不同，5G多播广播设计在网络架构和业务流程上尽量减小与单播的差异性，并且通过灵活的调度方案和协议栈设计，提升了空口的资源利用效率；为提升多播广播业务传输可靠性，增加了反馈机制并对移动性管理进行了增强，确保用户体验。</p>\r\n<p align=\"justify\">三是继续对5G网络自动化进行增强，3GPP从R16便开展对自优化网络与最小化路测课题的研究与标准化工作，并在R16版本中完成了5G系统内的移动鲁棒性优化、移动性负载均衡、随机接入优化、基站节能等多个用例的标准化工作，为运营商实现网络自优化配置打下了坚实的基础。R17在R16的基础上，一方面为满足5G引入两步随机接入、双连接、切片、移动性增强等新功能，继续对5G系统内用例进行增强；另一方面立足运营商需求，对运营商最为关心的覆盖与容量优化、4G和5G系统间移动性负载均衡以及系统间节能用例进行了标准化讨论，为运营商进一步实现降本增效提供了可靠的方法与手段。</p></div></p>', 29, 0, '0', '2', 0, 0, 0, 0, 1, 116, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000117, '推动IPv6规模部署 打造坚实“数字底座”', 1, '2022-01-15 06:08:29', '2022-10-15 06:07:52', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">数字经济的蓬勃发展，需要先进“数字底座”的有力支撑。作为下一代互联网的“基石”，IPv6被认为是助力互联网与实体经济深度融合的重要力量，推进IPv6的规模部署，将有力支撑“万物智联”，加速整个社会的数字化转型，助推经济社会高质量发展。</p>\r\n<p align=\"justify\"><strong>政策接续落地</strong><strong>IPv6</strong><strong>发展提速</strong>&nbsp;</p>\r\n<p align=\"justify\">近年来，我国高度重视IPv6发展，出台了一系列重磅政策。早在2017年，我国就正式发布《推进互联网协议第六版（IPv6）规模部署行动计划》，明确了推进IPv6规模部署的时间表和路线图。随后，工业和信息化部相继开展了“IPv6网络就绪”“IPv6端到端贯通能力提升”“IPv6流量提升”等系列专项工作。</p>\r\n<p align=\"justify\">在今年7月正式发布《IPv6流量提升三年专项行动计划（2021-2023年）》的基础上，工信部不久前正式发布《“十四五”信息通信行业发展规划》（以下简称《规划》），进一步明确了IPv6发展目标，提出要提升IPv6端到端贯通能力，实施“IPv6网络服务能力提升工程”。</p>\r\n<p align=\"justify\">《规划》指出，在提升IPv6端到端贯通能力方面，要加快网络、数据中心、内容分发网络（CDN）、云服务等基础设施IPv6升级改造，提升IPv6网络性能和服务水平；加快应用、终端IPv6升级改造，实现IPv6用户规模和业务流量双增长；推动IPv6与人工智能、云计算、工业互联网、物联网等融合发展，支持在金融、能源、交通、教育、政务等重点行业开展“IPv6﹢”创新技术试点以及规模应用，增强IPv6网络对产业数字化转型升级的支撑能力。</p>\r\n<p align=\"justify\">随着国家政策的落地，各地也纷纷出台政策，加快推进IPv6规模发展。最近一段时间，全国多个省份发布“十四五”发展规划，对于发展IPv6提出了明确要求。比如，福建省明确要求开展IPv6流量提升专项行动，推动福建省的IPv6规模部署从“通路”走向“通车”，并且提出了移动网络IPv6流量占比提升至70%的明确发展目标。河北省则在不久前宣布，河北省移动网络IPv6流量占比超20%，固网IPv6流量较2020年提升20%以上，提前3个月完成年度目标任务。</p>\r\n<p align=\"justify\">在全行业的共同努力下，我国IPv6发展取得了显著成效，IPv6“高速路”已建成。目前，我国4G、5G和固定宽带网络IPv6升级改造全面完成，IPv6网络基础设施规模全球领先。主要数据中心、CDN、云服务企业初步具备覆盖全国范围的IPv6服务能力。已申请的IPv6地址资源位居全球第一，占全球已分配IPv6地址总量的近五分之一。</p>\r\n<p align=\"justify\"><strong>构建“</strong><strong>IPv6</strong><strong>﹢”体系赋能数字化转型</strong>&nbsp;</p>\r\n<p align=\"justify\">随着数字化浪潮的兴起，网络的赋能效应日渐凸显，网络的演进步伐也随之加快。在IPv6规模部署持续推进的同时，产业界正在加快“IPv6﹢”创新体系建设，充分释放IPv6的创新活力，为各行各业乃至整个社会的数字化转型赋能。</p>\r\n<p align=\"justify\">“IPv6﹢”是什么？“IPv6﹢”是IPv6下一代互联网的升级，是面向5G和云时代的IP网络创新体系。中国信息通信研究院发布的《IPv6﹢技术创新白皮书》指出，“IPv6 ﹢”代表IPv6技术体系的“再”完善、核心技术的“再”创新、网络能力的“再”提升、产业生态的“再”升级。相比IPv6，“IPv6﹢”可以实现更加开放活跃的技术与业务创新、更加高效灵活的组网与业务提供、更加优异的性能与用户体验、更加智能可靠的运维与安全保障。</p>\r\n<p align=\"justify\">简单而言，“IPv6 ﹢”是面向5G和云时代的网络体系创新，是数字化时代的“基石”和“底座”。《IPv6﹢技术创新白皮书》认为，“IPv6﹢”将助推从“万物互联”到“万物智联”升级，还将推动从“消费互联网”向“产业互联网”的升级。一方面，“IPv6﹢”全面升级IPv6技术体系，推动IPv6走向万物智联，满足多元化应用承载需求，释放产业效能；另一方面，“IPv6﹢”全面升级各行业网络基础设施和应用基础设施，赋能行业数字化、网络化和智能化转型。</p>\r\n<p align=\"justify\">如果说“IPv6”更多的是立足于当下的网络需求，那么“IPv6﹢”则是面向更加先进的未来网络。因而，工信部在《IPv6流量提升三年专项行动计划（2021-2023年）》和《“十四五”信息通信行业发展规划》中都对加快推进“IPv6﹢”创新体系建设提出了明确要求，加快推进“IPv6﹢”在金融、能源、交通、教育、政务等重点行业的落地。</p>\r\n<p align=\"justify\">令人欣喜的是，随着5G、大数据、人工智能、工业互联网等新一代信息通信技术加速融入实体经济，“IPv6﹢”在传统应用中的应用前景正在打开。比如，业界正在尝试应用“IPv6﹢”技术升级改造企业的内网和园区网络，支撑海量终端的高速连接需求，助力企业数字化转型。又比如，业界正在打造基于“IPv6﹢”的数字政府平台，建设云网安一体的融合、智能、安全的新一代政府网络，为广大民众提供更加优质的“互联网﹢政务”服务。</p>\r\n<p align=\"justify\">“十四五”时期，我国IPv6发展将从“通路”大步迈向“通车”，在这个过程中，如何更快地消除IPv6终端和应用支持的痛点，加速推进“IPv6﹢”创新体系构建，是产业界各方的责任和使命。</p></div></p>', 29, 3, '0', '2', 0, 0, 0, 0, 1, 117, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000118, '5G 赋能实现碳达峰碳中和', 7, '2022-01-15 06:09:38', '2022-09-15 14:09:07', '<p align=\"justify\"><strong>5G﹢煤炭：科技助力实现“碳减排”</strong>&nbsp;</p>\r\n<p align=\"justify\">“机械化换人、自动化减人、智能化无人”曾是煤炭行业的一句响亮口号。面对2030年碳达峰和2060年碳中和的目标，煤炭业作为实施减排的重点领域，利用5G、大数据等新技术新手段，实施智能采矿，将煤矿工人从艰苦的工作环境和高强度的体力劳动中解放出来，最大限度实现“少人则安，无人则安”。</p>\r\n<p align=\"justify\">在采矿行业，碳排放的主要来源是矿产在勘查、开采过程中产生的排放，矿产选冶及加工过程中产生的排放，以及车辆使用化石燃料产生的排放。如今，有了5G技术的加持，不但矿井下作业可以实现无人化，矿区运送煤炭也逐渐向无人驾驶方向发展。</p>\r\n<p align=\"justify\">视频通话、高清4K影像的实时传送是黄陵矿业一号煤矿5G专网与十万兆环网等新型基础设施建设的一个缩影。今年，该矿加快以5G先进技术为引领的数字化、网络化、智能化矿山建设，通过与十万兆环网、WiFi、4G融合通信，形成了矿井数据立体化高速传输模式，开启通信的新时代。</p>\r\n<p align=\"justify\">早在2020年9月，中国电信依托“一云一网”（天翼云、电信5G网络）优势，建设了全国首个5G﹢煤机行业工业互联网平台，并在井下5G无线通信系统、三维可视化透明矿山、5G﹢智慧选煤厂以及AI煤矿智慧集运站四大5G煤炭行业应用方面深入实践，取得显著成效，有效推进了5G赋能煤炭生产、洗选、运销和安全等煤炭产业链。</p>\r\n<p align=\"justify\">今年5月，陕西省咸阳市首家5G﹢智慧矿山正式建成并投入使用。利用5G技术大宽带、低时延、广连接的特点，该矿山打造了5G“1﹢1﹢4”智慧矿山解决方案。即1张矿山5G专网、1个矿山工业互联网平台、4个5G智慧矿山细分应用场景，包括井下融合组网、高清视频监控、综采工作面和综掘工作面，将人工智能、云计算、大数据等与煤炭开采深度融合，从顶层设计、算力分配、数据应用和敏捷响应等环节，重塑煤矿开采模式和运行方式，实现远程控制采煤、一键启停等智慧开采，将创新技术应用、商业模式和服务体系、工具转化为生产力，工作面减员达70%，生产效率提升23%，实现智慧开采、少人则安的预期目标。</p>\r\n<p align=\"justify\">随着“5G﹢工业互联网”赋能采矿行业的典型案例不断涌现，5G技术革新着传统采矿作业的模式，让采矿业实现智能化嬗变。</p>\r\n<p align=\"justify\"><strong>5G﹢油气：四大典型应用场景催生行业新机遇</strong>&nbsp;</p>\r\n<p align=\"justify\">5G前进的步伐正在加快，它自身低时延、高速率、广连接的特点为各行各业深度赋能。具体到油气领域，以5G为代表的新一代信息技术的飞速发展，为行业向绿色低碳转型升级提供了一条全新的进阶路径。</p>\r\n<p align=\"justify\">油气行业的四大典型应用场景即智能勘探、智能油气井、智能炼厂、智能管输。5G技术的加速推广，势必为这些典型应用场景带来新机遇、新变革。</p>\r\n<p align=\"justify\">在智能勘探应用场景中，5G可以助其实现大规模地震节点仪集中接入、数据实时回传和实时预处理，大幅提升油气地震勘探作业及数据分析效率。</p>\r\n<p align=\"justify\">在智能油气井应用场景中，实现油田各场站、单井、仪表等实时数据的稳定传输，钻井、定向、录井、压裂实时数据和视频数据的统一管理与及时传输，以及机器人/无人机巡检、AR巡检维护及大型机器远程操控。</p>\r\n<p align=\"justify\">在智能炼厂应用场景中，实现视频、仪表数据、高危作业、危化品运输、中控室、管廊等监控任务，治污设施检测、异味溯源等环保任务，以及消防、应急智慧车、无人机等应急任务。</p>\r\n<p align=\"justify\">在智能管输场景中，实现场站生产数据、设备状态、环境信息的实时采集与传输，输送管道状态监测、泄漏检测、地质灾害监测，以及长输管线的应急通信、智能巡检、无人机巡检。</p>\r\n<p align=\"justify\">事实上，我国油气领域在5G应用上已开始不少探索。今年初，中国海油的首个“5G﹢海上智能平台”试点项目也在文昌气田开启试运行。通过5G与海上平台生产中现有通信传输系统、生产控制系统及服务管理系统等的结合，实现多个通信系统之间的互联互通、集成显示，解决了普通指挥中心资源不能共享、多媒体调度指挥烦琐、效率低下的难题。</p>\r\n<p align=\"justify\">6月10日，国内首个“5G专网全覆盖，5G运营全流程，5G合作全生态，5G应用全场景”智能炼厂在长庆石化正式发布，标志着我国石化行业开启了5G﹢智能应用。通过部署5G SA网络、移动边缘计算（MEC）平台，构建高速率、大带宽、低时延、高可靠的5G云网基础设施，满足了长庆石化在网络时延、数据安全等方面的应用需求，成功打造出国内首个5G智能炼厂在MEC平台上部署的5G﹢动设备智能预警系统，可自动跟踪厂区内数百台动设备的运行状态，保障了炼油生产的安全平稳运行。</p>\r\n<p align=\"justify\">总的来看，在油气行业，5G能助力人们完成一些高难高危工作，实现生产运行监控、实时数据采集分析、事件自动报警、事件应急处理等。这对于能源行业来说，都是技术性的突破，既能推动行业绿色低碳发展，也能给更多企业带来“弯道超车”的机会。</p>\r\n<p align=\"justify\"><strong>5G﹢电力：为电网五大环节带来变革</strong>&nbsp;</p>\r\n<p align=\"justify\">从电流走向视角来看，电网主要包括五大环节：发电、输电、变电、配电及用电。随着5G商用化深入推进，千行百业积极探索5G赋能行业的新方式。电力作为与通信息息相关的行业，5G的到来势必对这五大环节及现有的电力行业运行带来变革。</p>\r\n<p align=\"justify\">目前，光纤在电力通信系统中占有重要的地位，短期来看，光纤的优势更明显，但5G拥有独特的优势：在河流交叉的山区等地貌非常复杂的情况下架设电力设备，光纤接入难度和成本远高于5G，此时，5G的商用价值就能得到凸显。同时，5G为在环境恶劣情况下铺设电力设备提供了可能性。5G网络的超快速响应可以提高现有电网的可靠性，并将一些以前无法实现的管理功能变为现实，拓宽电力行业的边界。</p>\r\n<p align=\"justify\">在应用中，5G在电力行业已有多个场景。在输电线路智能巡检装置上应用5G技术，大大解放了人力。以前，巡检装置每隔半个小时进行监测拍照，用上5G技术后，巡检装置不仅能实时监测拍照，传回的画面也更加稳定、清晰，隐患源一目了然，有助于运维人员判别故障类型，缩短抢修时间；5G将为变电站设备运行状态监控、变电站机器人巡检、远程移动视频监控等新型运维业务提供支持，大幅降低人工操作的安全生产风险，推动变电站监控、安防等业务向智能化、可视化、高清化升级。同时，变电站内部的一部分光纤和电缆将被取代，大大缩小站内有线网络的建设规模；在配电房测温方面，目前已建成的基于5G云化小基站的智能配电房新增了红外在线测温和环境在线监测功能，可通过安装的卡片式测温热像仪实时监测设备温度，并能快速提供各类突发事故的应急处置预案。</p>\r\n<p align=\"justify\">此外，在用电方面，运营商正在积极试点5G基站削峰填谷供电的应用：在用电低谷时段储存能源，在高峰时段使用储存能源为5G基站供电，可以平衡电网用电高峰和低谷时段的整体负荷。据测算，单基站可节省用电费用20%，大大降低5G基站运维成本。另外，由于5G基站布点密集，目前已广泛布局的电力杆塔是建设5G基站可利用的优良资源。部分地区已经在积极探索合作，实现社会基础资源的共建共享共用。</p>\r\n<p align=\"justify\">从长远看，5G对电力行业带来的影响是深刻的。由于光纤目前在电力行业仍然占据通信方面主要优势，5G替代现有的基础电力设备通信模式的现实性仍较小，但在电力行业的移动终端设备通信中，5G的优势不言而喻。5G的大带宽、低时延、广连接特性为电网的不同业务提供了差异化网络的服务能力，同时为智慧电网的建设带来新机遇。可以预见，不久的将来5G和电力行业将形成相互受益、共同促进的局面。</p>\r\n<p align=\"justify\"><strong>达到双碳目标5G大有可为</strong>&nbsp;</p>\r\n<p align=\"justify\">今年中央经济工作会议提出，实现碳达峰、碳中和是推动高质量发展的内在要求，要坚定不移推进。传统能源逐步退出要建立在新能源安全可靠的替代基础上。要立足以煤为主的基本国情，抓好煤炭清洁高效利用，增加新能源消纳能力，推动煤炭和新能源优化组合。要狠抓绿色低碳技术攻关。要深入推动能源革命，加快建设能源强国。</p>\r\n<p align=\"justify\">煤炭、油气、电力等能源在国家能源体系中占有重要的地位，对于实现碳达峰、碳中和目标有重要影响。传统能源如何在保障国家能源安全的前提下与新能源优化组合、降低污染、提升效率、助力实现“双碳”目标，成为我国建设能源强国亟待探索的课题。</p>\r\n<p align=\"justify\">5G为能源领域高质量发展带来了新方案。5G具有高速率、低时延、广连接等特征，是支撑能源转型的重要战略资源和新型基础设施。5G与能源领域各行业深度融合，将有效带动能源生产和消费模式创新，为能源革命注入强大动力。拓展能源领域5G应用场景，探索可复制、易推广的5G应用新模式、新业态，从长远看，是支撑能源产业高质量发展的有效路径。</p>\r\n<p align=\"justify\">目前，在煤炭、油气、电力等能源领域，5G已展现出强大的潜力。在煤炭应用场景中，5G助力企业从安全生产、环境改善、减员增效三方面提升生产效能，解决了深井安全、高效开采难题，通过5G可以把工人从生产一线换下来，促进矿工从“黑领”向“蓝领”转变。在油气应用场景中，由于油气田通常处于远郊，人烟稀少且地域宽广，值守和维护工作量很大。同时，油气田的工作环境具有高危险性，油气一旦泄漏，会对人体、周围环境产生重大影响。5G解决了传统炼厂在安全环保管控、生产效率提升和工艺运行优化等领域的问题。在电力应用场景中，5G在电网主要环节——发电、输电、变电、配电及用电方面，都展现了赋能的价值，为智慧电网的建设带来新机遇。</p>\r\n<p align=\"justify\">推动5G与能源深度结合，努力达到“双碳”目标，接下来，需要加快能源领域5G专用技术研发。研制一批关键共性技术，例如，加快5G虚拟专网建设所需的网络切片、多接入边缘计算、定制化核心网网元、5G LAN等关键设备研发及产业化；研制一批场景配套专用技术和产品，针对不同场景满足不同需求；研究建立能源领域5G应用技术标准体系，规范5G技术在能源领域的推广应用等。</p>\r\n<p align=\"justify\">此外，加快相关基础设施和安全保障能力建设。一方面，推进基础资源共建共享，鼓励电网企业与电信运营商、铁塔公司等加强合作，在确保安全、符合规范、责任明确的前提下，通过电力杆塔加挂通信天线和光缆，以及共享电力光缆、纤芯、变电站站址等资源，支撑电信运营商节约高效建设5G网络；另一方面，构建5G应用安全保障体系，统筹安全与发展，将5G网络安全保障纳入能源领域5G应用的全流程全环节。</p></div></p>', 29, 1, '0', '2', 1, 0, 0, 1, 1, 118, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000119, '第三季度电信服务质量情况发布', 1, '2022-01-15 06:10:57', '2027-01-12 03:14:07', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">日前，工业和信息化部对2021年第三季度电信服务质量有关情况进行了通告。</p>\r\n<p align=\"justify\">组织开展互联网行业专项整治行动。2021年7月，启动互联网行业专项整治行动，对扰乱竞争秩序、侵害用户权益、威胁数据安全、违反资源和资质管理规定等四方面8类问题进行集中整治。截至第三季度，企业合规意识普遍增强，内部管理制度逐步健全，一些突出问题得到初步解决，“黑带宽”等违规行为得到进一步规范，屏蔽网址链接问题取得阶段性进展，用户体验逐步改善。</p>\r\n<p align=\"justify\">强化APP侵害用户权益行为整治力度。统筹全国各省（区、市）通信管理局力量，持续深化APP综合治理，2021年第三季度，组织对国内主流手机应用商店的55万款应用软件进行技术检测，公开通报了601款APP存在违规收集使用个人信息及强制、频繁、过度索权等问题，下架163款拒不整改的APP，主要互联网企业开屏信息“关不掉”问题基本解决，“乱跳转”误导用户问题发现率大幅下降至1%。</p>\r\n<p align=\"justify\">持续推进互联网应用适老化及无障碍改造专项行动。目前，已有158个网站和APP初步完成改造。一些政府官方网站、老年人常用的新闻类应用设计了字体放大、语音播报等功能，页面信息更醒目，老年人看得更清楚；一些重点互联网企业的电子商务类应用专为老年人简化搜索、选购、支付等操作流程，帮助老年人网购更便利。</p>\r\n<p align=\"justify\">扎实做好应急通信保障工作。圆满完成中国共产党成立100周年庆祝活动等重大活动通信保障工作。第三季度，全行业累计出动应急人员43.8万人次、应急车辆14.66万台次、发电油机及其他应急设备15.74万台次，抢修恢复基站14.74万站次、光缆1.32万条共3.14万公里，发送应急预警短信息36.16亿条，全国通信网络运行平稳。</p>\r\n<p align=\"justify\">2021年第三季度，各级电信用户申诉受理机构受理电信用户申诉36199件。互联网信息服务投诉平台共收到互联网用户投诉55932件。企业服务功能类投诉、个人信息保护类投诉增加。工业和信息化部已督促相关互联网企业抓紧提升处理及时率。12321网络不良与垃圾信息举报受理中心共接到不良手机应用有效投诉35089件次，同比下降26.26%，环比下降19.03%。</p>\r\n<p align=\"justify\">在电信服务监管方面，一是持续提升电信服务质量。针对第三季度用户申、投诉反映出的电信企业存在夸大虚假宣传误导用户、设置障碍影响用户携号转网等问题，工业和信息化部组织召开座谈会、开展实地调查，督促电信企业要把群众的利益摆在首位，坚持规范经营、公平理性竞争，充分保障用户的知情权和选择权。二是加大监督执法和信用监管力度。组织各省（区、市）通信管理局加强监督执法，查处违规电信企业283家次。向社会公布18家企业被纳入电信业务经营不良和失信名单。三是加强电信设备事中事后监管。组织开展电信设备获得进网许可证前后一致性的监督检查工作，随机抽查了16家企业的16款产品，发现其中6款产品存在不同程度的安全防护能力缺陷、新增预置应用未报备等问题。工业和信息化部已督促相关企业对发现的问题进行整改。</p>\r\n<p align=\"justify\">2021年11月1日，《个人信息保护法》正式实施。工业和信息化部提示各电信企业和互联网信息服务企业要遵循合法、正当、必要和诚信原则，依法处理个人信息；提醒广大用户，养成“非必要不提供”的良好习惯，维护好个人信息权益。</p></div></p>', 29, 2, '0', '2', 0, 0, 0, 0, 1, 119, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000120, '中国电信与上海人工智能实验室签署战略合作协议', 9, '2022-01-15 06:12:15', '2022-01-15 14:11:14', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">12月15日，中国电信与上海人工智能实验室通过视频会议方式，举行战略合作签约仪式。中国电信董事长柯瑞文、党组副书记邵广禄，上海人工智能实验室主任汤晓鸥及相关领导出席签约仪式。</p>\r\n<p align=\"justify\">根据协议，双方将基于“资源共享、优势互补、战略协同、共赢发展”原则，充分发挥各自优势，共同致力于人工智能科技创新，推进合作纵深发展。一是联合开展全方位科技创新合作。双方围绕重大战略任务和核心关键技术问题，持续加大研发投入，联合开展多领域、跨学科、大协同的科技创新研究，推动云网算力基础设施一体化建设，加强人工智能基础算法领域研发，为国家科技创新重大突破贡献力量。二是联合推进科研成果共享。充分发挥实验室与企业两个关键主体的积极性，开展产学研用深层次务实合作，建立健全科研成果转化及共享机制，共同探索推进实验室的创新发展。三是联合培养高水平创新人才。围绕合作课题和项目，共建科技创新团队，加强人才联合培养，实现优秀人才资源共享。</p>\r\n<p align=\"justify\">上海人工智能实验室是我国人工智能领域的新型科研机构，开展战略性、原创性、前瞻性的科学研究与技术攻关，突破人工智能的重要基础理论和关键核心技术，打造“突破型、引领型、平台型”一体化的大型综合性研究基地，支撑我国人工智能产业实现跨越式发展，目标建成国际一流的人工智能实验室，成为享誉全球的人工智能原创理论和技术的策源地。中国电信作为上海人工智能实验室首个签署战略合作协议的中央企业，将与合作伙伴共同进行技术研发和生态合作，协同开展科研创新，共同推动人工智能产业发展。</p></div></p>', 29, 1, '0', '2', 0, 0, 0, 0, 3, 128, 'A');
INSERT INTO `knowledge` VALUES (00000000000000000121, '中国电信重磅发布天通卫星物联网', 2, '2022-01-15 06:12:45', '2022-01-15 14:11:14', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">11月12日，中国电信卫星产业合作论坛暨中国电信天通物联网发布会在广州召开。会议以“天地一体，智联世界”为主题，携手合作伙伴探讨卫星产业发展，共谋多元合作共赢之道。</p>\r\n<p align=\"center\"><img style=\"border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-top-width: 0px\" alt=\"\" src=\"./W020211112587261490772.jpg\" OLDSRC=\"W020211112587261490772.jpg\" /></p>\r\n<p align=\"justify\">中国电信副总经理唐珂出席合作论坛并致辞，唐总表示，中国电信牢记建设网络强国、数字中国和网信安全的初心使命，致力于打造“陆海空天”一体化通信能力，构建天地协同融合网络，为客户提供天地一体、星网融合、万物互联的智能综合信息服务；同时，在国家“一带一路”号召下，积极推动卫星国际通信互联互通水平，畅通国际信息之路。中国电信将秉承开放合作的理念同各位嘉宾、合作伙伴、各位朋友携手迈向合作共赢、共同发展的新时代。</p>\r\n<p align=\"center\"><img style=\"border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-top-width: 0px\" alt=\"\" src=\"./W020211112587261490329.jpg\" OLDSRC=\"W020211112587261490329.jpg\" /></p>\r\n<p align=\"justify\">“作为卫星通信网络运营商和卫星通信解决方案提供商，中国电信以建设区域领先、国际知名的卫星通信综合智能信息服务提供商为愿景，秉承天地一体，协同创新，连接美好生活的使命”，中国电信卫星公司总经理杨岭才在主旨演讲中表示，中国电信积极推进高速泛在、天地一体、云网融合、智能敏捷、绿色低碳、安全可控的智能化综合性数字信息基础设施建设，深度探索综合智能信息服务新领域，不断夯实卫星通信在中国电信智能连接中的重要作用。</p>\r\n<p align=\"justify\">本次论坛上发布的天通卫星物联网业务，是将天通卫星通信网络与地面物联网技术深度融合，结合中国电信地面物联网业务，为客户提供的综合通信解决方案。天通物联网业务是中国电信“陆海空天”一体化泛在信息网络建设的重要组成部分，是构建万物互联的智慧世界和数据经济的重要支撑。中国电信将秉持“共生、共享、共赢”理念，联合生态合作伙伴，共同打造泛在连接、数智相生的信息服务。</p>\r\n<p align=\"justify\">此次论坛由中国电信卫星公司主办，卫星行业专家、产业链代表、重要客户代表、合作伙伴、媒体代表参加会议。</p>\r\n<p align=\"justify\">中国电信愿与国内外各位伙伴携起手来，共同把握数字化、网络化、智能化发展机遇，努力探索卫星新技术、新业态、新模式，共同推动数字经济发展，共创更加繁荣美好的未来。</p></div></p>', 29, 3, '0', '2', 0, 0, 0, 0, 4, 128, 'A');
INSERT INTO `knowledge` VALUES (00000000000000000122, '中国电信天翼云进入4.0时代', 1, '2022-01-15 06:21:12', '2022-01-15 06:20:42', '<p align=\"justify\">天翼云4.0是一朵高速泛在的分布式云。从分布式云连续两年成为企业上云的新范式可以看出，天翼分布式云在企业数字化转型方面具有显著的优势。中国电信拥有高速的云网资源，包含700多个遍布全国的数据中心，6万多个边缘局所，具有无可比拟的云网资源优势。</p>\r\n<p align=\"justify\">天翼云4.0能够提供更贴近用户的云。作为全国智慧交通的典型案例，广州快速交通建设有限公司总经理董军现场分享了与天翼云共同打造的数字化拟合平台，打造融合大数据、5G应用、云计算等技术手段，集数字孪生系统、智能收费机器人、收费车道无岛化等九项智慧交通建设创新应用于一体的现代智能收费站；此外，天翼云还为高海拔的西藏教育珠峰旗云的3000多所学校提供教育信息化的技术支持。</p>\r\n<p align=\"justify\">天翼云生态合作体系也在不断加强，天翼云4.0正在全面升级产业生态圈。包括中国电子、华为、英特尔、中兴、用友等重要的产业伙伴，应邀参与大会共同探讨与分享产业与行业的前沿趋势，构建共赢生态圈。此外，大会现场还举行了与中国电子战略合作签约暨成果发布仪式、天翼云鲲鹏联合创新实验室发布仪式以及天翼云与用友网络战略合作签约仪式。</p>\r\n<p align=\"justify\">根据Gartner预测，2025年约超过75%的数据将在边缘侧处理。因此，云服务商必须具备近场处理的能力，要求算力实现层次化布局，逐步基础设施化。天翼云4.0能够让数据和算法变成基础设施，承接算力基建，满足下沉需求，在边缘市场拥有更广阔的发展空间。</p>', 29, 126, '0', '2', 57, 0, 1, 36, 1, 122, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000123, '中国电信“三步走”打造科技领军企业', 4, '2022-01-15 06:21:12', '2022-01-15 14:20:42', '<div class=\"xw_zj_encryption\">\r\n    <p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">11月12日，中国电信5G创新应用合作论坛在广州召开。论坛以“盘古开天地 创新拓未来”为主题，聚焦新国脉元宇宙战略布局，以元宇宙新型基础设施建设者为定位，立足创新应用成果，启动2022年“盘古计划”。此次论坛创新XR内容生态合作，丰富元宇宙产品矩阵，推进资本投资产业孵化，全面卡位元宇宙赛道，加速5G创新应用融合发展。</p>\r\n<p align=\"justify\"><strong>构建5G创新应用基石 元宇宙布局场景落地</strong>&nbsp;</p>\r\n<p align=\"justify\">在“十四五”规划提出的“加快数字化发展，建设数字中国”战略背景下，中国电信立足新发展阶段、贯彻新发展理念、开拓新发展格局，提供基于云网融合丰富的5G创新应用，赋能产业数字化，服务社会数字化转型。</p>\r\n<p align=\"justify\">中国电信副总经理唐珂在致辞中表示，新国脉元宇宙布局将依托中国电信云改数转战略，围绕产品研发、内容汇聚、应用创新等方面，加大5G业务和终端创新，推进天翼超高清、云VR、云AR、云游戏等生态合作，助力元宇宙场景快速落地，满足美好数字文化需求。</p>\r\n<p align=\"justify\"><strong>数创宇宙智拓未来 数字员工演绎虚实共生</strong>&nbsp;</p>\r\n<p align=\"justify\">当前大火的元宇宙呈现了现实与虚拟世界互动的多样性、丰富性和娱乐性，而XR提供了从终端到技术的连接桥梁，是元宇宙最重要的构成之一，作为中国电信旗下上市公司，新国脉肩负5G应用打造和运营的使命，依托云网融合资源优势，经过近3年发展，建设了先进的5G XR一体化平台。</p>\r\n<p align=\"justify\">2021年被称为元宇宙元年，全球科技巨头聚焦VR、AR、云技术和区块链等赛道布局元宇宙相关产业。这一年中，新国脉坚定实施云改数转战略，积极探索元宇宙投资发展。面向个人/家庭市场，提供VR视频、VR直播、VR游戏和巨幕影院等高品质娱乐服务，全面革新视听娱乐体验。面向垂直行业市场，打造XR+全域文旅、XR+智慧教育、XR+新零售综合体、XR+娱乐空间站等应用场景，成为数字化工具助力千行百业数字化转型。</p>\r\n<p align=\"justify\">新国脉董事长李安民在主题演讲中描绘了以元宇宙的新型基础设施建设者为定位的战略布局。他表示，新国脉致力打造元宇宙平台及算力的建设整合者、元宇宙软件及应用的服务集成者、元宇宙社会生态及内容建设的协同创新者。未来，将分为两阶段实现发展目标：近若干年，在以现实世界为基础，一系列大大小小的虚拟世界相结合的过程中，提供平台和云网基础能力，服务好各类虚拟世界业态；在多年发展后的第二阶段，将会逐步形成超级虚拟世界，新国脉依靠国有身份和业务技术基础，力争成为虚拟世界底座提供的“国家队、主力军”。</p>', 29, 216, '0', '2', 123, 0, 1, 75, 5, 123, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000124, '数字生活 美好已来 中国电信布局数字生活新生态', 7, '2022-01-15 07:13:02', '2022-01-15 15:12:01', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">顺应数字化发展趋势，把握数字化、网络化、智能化方向，搭建数字底座核心能力，不断挖掘和丰富数字生活应用场景......在11月11日开幕的2021国际数字科技展暨天翼智能生态博览会上，中国电信以“云网融合 数智相生”为主题全方位展现了积极践行云改数转战略，推动全民共享数字生活新时代、加速数字产业新布局和繁荣数字产业新生态上的具体实践。</p>\r\n<p align=\"center\"><img style=\"border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-top-width: 0px\" alt=\"\" oldsrc=\"W020211111740530691229.jpg\" src=\"./W020211111740530691229.jpg\" /></p>\r\n<p align=\"justify\"><strong>数字成果涌现 全民共享数字生活新时代</strong></p>\r\n<p align=\"justify\">数字技术融入实体经济，经济社会数字化转型迈入新阶段，美好生活在社会每个角落悄然播种。“加快数字化发展，建设数字中国”被列为“十四五”时期的目标任务，数字生活消费需求日益高涨，中国电信积极拥抱数字化转型机遇，探索云网融合的新型基础设施建设，不断夯实数字经济发展底座，深耕客户需求及应用场景，搭建一体化数字生活产品和服务体系，为城乡居民提供全方位的数字生活服务。今年7月，中国电信成立天翼数字生活科技有限公司，把满足人民对数字科技带来美好生活的期盼，视为公司服务客户的担当使命。</p>\r\n<p align=\"justify\">中国电信在主展区呈现了全场景的数字生活业务，聚焦数字生活领域专门搭建“数字生活馆”。全屋家电只需一个“小翼管家App”就可轻松掌控，城乡居民的生活因“智能门禁”、“智慧大屏”等产品的应用变得更加便捷......从数字家庭、智慧社区到数字乡村，再到数字治理和平台能力，数字生活展区全方位地展现覆盖居民生活的数字化成果，也展现了中国电信着力营造良好数字生态的强大动能。</p>\r\n<p align=\"justify\"><strong>夯实云网融合新基建 加速数字产业新布局</strong></p>\r\n<p align=\"justify\">在11日上午举行的高峰论坛上，中国电信发布了天翼视联网和数字生活重点产品，成立了数字生活生态联盟并启动运营商首个信息消费节——数字生活节，以数字化底座赋能产业数字化、生活智慧化，加速数字生活布局。</p>\r\n<p align=\"justify\">天翼视联网是中国电信基于云网深度融合的能力底座，整合在视频监控领域云、网、边、端、用、智、安、维的优质核心能力，同AI等新兴信息技术深度融合，打造继移动网、宽带网、卫星网、物联网之后的第五张基础网络。该产品将全方位服务于数字家庭、乡村、社区、城市等多维场景，以满足不同行业应用场景的定制化需求。</p>\r\n<p align=\"center\"><img style=\"border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-top-width: 0px\" alt=\"\" oldsrc=\"W020211111740530692912.jpg\" src=\"./W020211111740530692912.jpg\" /></p>\r\n<p align=\"justify\">此外，中国电信全方位为广大客户提供“一体两翼” 数字生活服务，正式发布“数字家庭”“智慧社区”“数字乡村”三大重点产品，基于千兆光网能力，扩大和升级新型信息消费，助力基层治理体系再创新、提升居民生活水平再创新、提高公共服务能力再创新、拉动产业发展空间再创新，满足人们对美好数字生活的向往。</p>\r\n<p align=\"justify\">中国电信还启动了数字生活节，以“5G+宽带+WiFi”三千兆为基础，汇聚丰富的泛智能终端品类，提供个性设计、自有组合、专业交付的全屋智能定制化解决方案，基于多款爆款终端，重点打造安全守护、家电控制、家门看护、智能开门、智能照明5类场景，给用户多样化的选择，通过平台搭建、渠道赋能，提供高额资源投入，加速数字信息消费普及，助力万千家庭开启美好数字生活。</p>\r\n<p align=\"justify\"><strong>携手构建“数字共同体”繁荣数字产业新生态</strong></p>\r\n<p align=\"justify\">在高峰论坛上，中国电信携手华为、中兴、科大讯飞、绿米、欧瑞博、依图、阿里、百视通、爱奇艺、腾讯、百度、小米、涂鸦、华脉、华视网聚、数联天下、猎户星空、哈奇智能、亲邻等产业合作伙伴代表启动数字生活生态联盟成立仪式。在11日下午举行的数字生活合作论坛现场，天翼数字生活科技有限公司牵头与合作伙伴代表参加了数字生活合作共建仪式，共同汇聚生态力量，构筑“数字生活共同体”。</p>\r\n<p align=\"justify\">数字生活生态联盟的成立以及相关合作共建的开展，预示着中国电信将开放数字生活核心原子能力，共同汇聚生态力量，以科技赋能、标准引领、场景落地及生态融通为核心职责，持续打造数字生活开放生态，通过标准共建、平台融通、能力开放、产业突破等四大举措大力推进与合作伙伴的融通互促，在终端、服务、应用、内容、渠道、技术、能力等多维度实现跨品牌联合，携手推进数字生活行业的快速发展，加速生态繁荣。</p>\r\n<p align=\"justify\">“凡益之道，与时偕行”。中国电信始终秉承以用户为中心、用心服务社会的宗旨。展望未来，中国电信更将以开放融合的发展理念，持续携手产业伙伴互惠共赢，着力构建数字生活创新生态，更好满足人民日益增长的美好数字生活需要。</p></div></p>', 29, 748, '0', '2', 153, 0, 2, 213, 1, 124, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000125, '中国电信启动室外光缆集采', 9, '2022-01-15 07:13:24', '2022-01-15 07:12:01', '<p style=\"text-align:justify;\"><div class=TRS_Editor><p align=\"justify\">近日，中国电信在官网发布了室外光缆（2021年）集中采购项目，启动了资格预审。此次集采预估规模为4300万芯公里，项目不划分标包。</p>\r\n<p align=\"justify\">中国电信官网发布的公告显示，此次项目采购内容为中国电信集团有限公司和中国电信股份有限公司及其下属子公司、分公司在2022年各工程所需的室外光缆产品（不含省级一级光缆线路工程建设所需的室外光缆），包括GYTA、GYTS、GYDTA、GYDXTW等类型的室外光缆。</p>\r\n<p align=\"justify\">按照资格要求，参与投标的光纤光缆企业应通过质量管理体系（ISO9000系列）认证，并且认证覆盖范围包含光缆类产品；应有稳定的光纤来源，保证投标产品年生产能力不低于150万芯公里。</p>\r\n<p align=\"justify\">在技术方面，中国电信对光纤性能也提出了明确诉求。其中的一项关键指标为：G.652D光纤成缆后，光纤在1310nm波长上的最大衰减系数为0.35dB/km。</p></div></p>', 29, 10, '0', '2', 0, 0, 0, 0, 1, 125, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000126, '北京2022年冬奥会和冬残奥会期间无线电管制通告发布', 9, '2022-01-19 01:33:39', '2038-01-19 03:14:07', '<div id=\"divContent\" style=\"overflow-x: auto;\">\r\n                <p>1月14日，北京市人民政府、河北省人民政府同期发布了各自辖区内的2022年冬奥会和冬残奥会期间无线电管制通告，依法对部分区域实施无线电管制，确保冬奥会和冬残奥会期间场馆及核心区域内的各类无线电设备在没有干扰的电磁环境下正常运行。</p><p>根据通告，北京市将于2022年2月4日12时至3月14日0时，对北京赛区部分场馆及服务设施（国家游泳中心、国家体育馆、五棵松体育中心、国家速滑馆、首都体育馆、首钢滑雪大跳台中心、北京冬奥村/北京冬残奥村、主媒体中心、北京颁奖广场、奥林匹克大家庭酒店、残奥大家庭酒店、北京首都国际机场、北京冬奥组委总部、北京奥林匹克公园公共区）周边1公里范围内、延庆赛区部分场馆（国家高山滑雪中心、国家雪车雪橇中心、延庆冬奥村/延庆冬残奥村、延庆残奥颁奖广场、延庆阪泉综合服务中心）周边3公里范围内实施无线电管制。于2022年2月4日12时至2月5日0时、2月20日12时至2月21日0时、3月4日12时至3月5日0时、3月13日12时至3月14日0时，对以国家体育场为中心，上清桥向东沿五环路至来广营桥以南；来广营桥向南沿京承高速至太阳宫桥以西；太阳宫桥向西沿三环路至蓟门桥以北；蓟门桥向北沿学院路、学清路至上清桥以东的区域实施无线电管制。河北省将于2022年2月4日12时至3月14日0时，对张家口赛区所有场馆（云顶滑雪公园、国家越野滑雪中心、国家跳台滑雪中心、国家冬季两项中心、张家口山地新闻中心、张家口山地转播中心、张家口冬奥村/张家口冬残奥村、张家口颁奖广场、张家口制服和注册分中心）周边3公里范围内实施无线电管制。</p><p>管制期间，除经无线电行政主管部门批准用于服务北京2022年冬奥会和冬残奥会的无线电台（站）外，禁止使用无线对讲机（包括手持机、车载台和中继台）、内部无线寻呼台、无线局域网（WLAN）室外基站、无线扩频室外台（站）、无线传声器（无线话筒）、大功率无绳电话等无线电发射设备，以及大型（大功率）辐射无线电波的非无线电设备；北京市朝阳区、海淀区、石景山区、延庆区以及河北省张家口市崇礼区范围内禁止使用便携式和车载式业余无线电台、校园调频广播电台、无线寻呼台、手机干扰器和卫星导航干扰器等干扰设备、遥控遥测无线电设备，以及采用寻呼方式设置的发射台；路由经过管制区域的微波链路和设置在北京及河北省张家口市区域内的广播电视、雷达、短波等无线电发射台（站）不得改变已经核准的技术参数。</p><p>根据通告，管制区域以外的无线电发射设备如对用于服务北京2022年冬奥会和冬残奥会的无线电台（站）和无线电设备产生有害干扰，有关单位和个人应按照无线电管理机构的要求，立即采取措施消除干扰。违反相关规定的，将由无线电管理机构依法处理；构成犯罪的，将移送司法机关依法追究刑事责任。</p>\r\n	</div>', 29, 43, '0', '2', 1, 0, 4, 1, 11, 126, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000127, '冬奥通信人 一起向未来｜他们冻僵了手冻红了脸', 2, '2022-01-19 08:21:47', '2022-01-19 08:21:00', '<p class=\"ql-align-justify\">1月13日，国家跳台滑雪中心格外的冷。我早上刚到场馆就感到寒风阵阵袭来，夹杂着雪花拍在脸上，但严寒并没有影响中国联通团队成员的工作热情。</p><p class=\"ql-align-justify\">冬奥会的脚步日益临近，后期工作越做越细。面对疫情防控的复杂形势，工程队进不来，我们密切关注闭环区的消杀解封消息，和安保、防疫领域工作人员紧密沟通的同时，自己动手加班加点部署赛道摄影区域80个摄影点位的网络测试工作。19时闭环内人员退场并完成消杀后，场馆通信经理吴俊峰、柯春轩带队对施工情况进行周密安排，每到一处都要细细查看，不落下任何一个隐患。天气寒冷，地面湿滑，施工难度大，乔立龙、郜彦辉、候双虎、王成志、陶丙申、籍江波、荣记鹏克服种种困难，快速响应，积极配合景观和摄影部门的工作，对木质围栏区的线缆逐一进行定位、整理、布放，消除网络隐患。在场的几位同事冻僵了手、冻红了脸，眉毛上也结了一层薄薄的冰。</p><p class=\"ql-align-justify\">通过今天的工作，我对冬奥会保障有了更深的认识——对工作要兢兢业业、精益求精，对潜在的风险要抽丝剥茧、细致分析。我和团队将继续秉持工匠精神完成冬奥会通信保障工作，确保网络安全可靠、万无一失。</p><p><br></p>', 29, 0, '0', '2', 0, 0, 0, 0, 2, 127, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000128, '“十四五”时期将加快5G等智能技术在交通运输业的深度应用', 4, '2022-01-19 08:29:35', '2022-01-19 08:29:04', '<p class=\"ql-align-justify\">近日，国务院印发《“十四五”现代综合交通运输体系发展规划》（以下简称《规划》）。《规划》提出，到2025年，交通运输技术装备更加先进，第五代移动通信（5G）、物联网、大数据、云计算、人工智能等技术与交通运输深度融合，交通运输领域新型基础设施建设取得重要进展，交通基础设施数字化率显著提高，数据开放共享和平台整合优化取得实质性突破。</p><p class=\"ql-align-justify\">《规划》要求，加快智能技术深度推广应用，坚持创新驱动发展，推动互联网、大数据、人工智能、区块链等新技术与交通行业深度融合，推进先进技术装备应用，构建泛在互联、柔性协同、具有全球竞争力的智能交通系统，加强科技自立自强，夯实创新发展基础，增强综合交通运输发展新动能。</p><p class=\"ql-align-justify\">在推进基础设施智能化升级方面，要构建设施设备信息交互网络。稳步推进5G等网络通信设施覆盖，提升交通运输领域信息传输覆盖度、实时性和可靠性。在智能交通领域开展基于5G的应用场景和产业生态试点示范。推动车联网部署和应用，支持构建“车-路-交通管理”一体化协作的智能管理系统。打造新一代轨道交通移动通信和航空通信系统，研究推动多层次轨道交通信号系统兼容互通，同步优化列车、航空器等移动互联网接入条件。提升邮政机要通信信息化水平。同时，要整合优化综合交通运输信息平台。完善综合交通运输信息平台监管服务功能，推动在具备条件地区建设自动驾驶监管平台。建设基于区块链技术的全球航运服务网络。优化整合民航数据信息平台。提升物流信息平台运力整合能力，加强智慧云供应链管理和智慧物流大数据应用，精准匹配供给需求。有序建设城市交通智慧管理平台，加强城市交通精细化管理。</p><p><br></p>', 29, 3978, '0', '2', 342, 0, 21, 105, 3, 128, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000129, '中国电信重磅打造96110反诈平台', 9, '2022-01-19 08:30:43', '2022-01-19 08:30:00', '<p class=\"ql-align-justify\">年关将至，盯着你年终奖的不只有各种促销活动，还有各种手段花样翻新的电信网络诈骗，让人防不胜防。中国电信推出96110反诈平台，有效对贷款诈骗、裸聊诈骗、刷单诈骗、色情博彩诈骗等12个大类，480余万条诈骗网址或APP进行智能识别，为电信网络用户营造清朗、安全的用网空间。目前，96110反诈平台已经在江苏10余地市、浙江全省11地市、江西、甘肃等全国大部分地区投入使用，协助当地公安系统编织反诈密网，维护人民的生命财产安全。</p><p class=\"ql-align-center\"><strong>深耕AI+反诈</strong></p><p class=\"ql-align-center\"><strong>数智化赋能打好“科技反诈战”</strong></p><p class=\"ql-align-justify\">纵观通信诈骗的“升级”之路，从过去制作钓鱼网站、利用伪基站发送短信、制作木马、盗取QQ这些老套路，到现在已经转变为利用AI、VPN虚拟机等更高级技术的新手段。2020年，全国共立案电信网络诈骗案件92.7万起，占全部刑事警情的比例超过40%，案件造成群众损失353.7亿元；电信网络诈骗已成为群众深恶痛绝的第一大犯罪类型。</p><p class=\"ql-align-justify\">作为网络强国、数字中国和网信安全的主力军，中国电信积极履行央企的社会责任和担当，高度重视反诈工作，围绕号码安全、通话安全、上网安全、信息安全，打造符合国家和公安部要求的中国电信96110反诈云平台，以大数据反诈短信宣传、诈骗网址预警拦截系统、96110诈骗电话预警系统、96110呼叫劝阻云系统等业务功能，全方位、多形式、深层次助力国家反诈工作开展。</p><p class=\"ql-align-center\"><img src=\"http://www.cnii.com.cn/rmydb/202201/W020220119559451146008.png\" alt=\"图片7.png\" width=\"550\"></p><p class=\"ql-align-justify\">“96110”专号为“城市区号＋96110”，是全国统一的反诈劝阻电话，通过96110反诈云平台在日常反诈宣传、事前预警提醒、事中精准劝阻、事后破案协助等反诈环节的赋能，通过一系列“组合拳”，协助打击防范网络诈骗，为政法公安反诈提供“大数据中脑”。</p><p class=\"ql-align-justify\">当用户在收到疑似诈骗电话来电时，96110反诈会预警劝阻，手机屏幕上显示 “公安机关提醒您该号码为疑似诈骗电话”闪信内容，降低受害人的被骗概率。当用户在访问疑似诈骗网站或APP时，96110反诈会实时阻断用户的访问操作，用技术手段阻断诈骗传播信息流。将案件防控提前到事前阶段，一方面有效压降案件，另一方面也节约了大量的警力资源。</p><p class=\"ql-align-center\"><strong>编织反诈密网</strong></p><p class=\"ql-align-center\"><strong>为政法公安提供“大数据中脑”</strong></p><p class=\"ql-align-justify\">尽管公安机关坚持打击治理通信网络诈骗取得阶段性成效，但诈骗手段不断升级，犯罪过程愈发隐蔽，形势依然十分严峻。为打好这场“数据科技战”，号百信息有限公司支撑中国电信96110反诈产品在全国各省落地，通过整合中国电信雄厚的云、网、边、端的核心原子能力，覆盖多省96110反诈支撑工作，为政府公安打击诈骗分子提供科技利器，为守住人民的钱袋子编织反诈密网。</p><p class=\"ql-align-justify\">2021年3月，96110反诈平台的诈骗网站智能识别拦截系统在江苏常州率先上线，强势助力常州市打击治理通信诈骗。半年内，识别并拦截诈骗网站310万个，收集各地警情信息9000余条，日均拦截访问达420亿次。据省公安厅反诈中心统计，平台上线后全省诈骗警情同比下降30%。按照2020年平均单起案件金额4万元，平台半年已挽损近8亿元。</p><p class=\"ql-align-justify\">在助力苏州公安打击治理电信网络新型违法犯罪止损控案“百日会战”行动中，96110反诈协助将预警数据动态下发至全市1.2万个社区网格，“百日会战”期间，全市共推送易受骗人员预警数据17.2万条，避免造成案件2013起，紧急劝阻损失2457万元，发案数、损失数双双出现拐点，案件高发势头得到强力遏制，在“精准防”方面取得积极成效。</p><p class=\"ql-align-justify\">“以正合，以奇胜。”如今，人工智能等新兴技术为反通信诈骗提供了新的解题思路，可以预见，未来以中国电信96110反诈产品为代表的数智化产品，将越来越在网络安全、数字安全等“非传统安全”领域发挥关键作用，为守住人民的钱袋子编织反诈密网。(编辑 张鸣)</p><p><br></p>', 29, 17, '0', '2', 2, 0, 2, 1, 7, 128, 'A');
INSERT INTO `knowledge` VALUES (00000000000000000130, '输入国家地区了解漫游地资费网络等信息', 9, '2022-01-20 07:19:51', '2022-09-19 03:14:07', '<div id=\"divContent\" style=\"overflow-x: auto;\">\r\n                <p>近日，以“5G新生态，赋能新经济”为主题的第一届厦门5G应用大赛颁奖典礼暨5G应用项目对接会成功举办。</p><p>据悉，此次厦门5G应用大赛由中国电信福建厦门分公司、厦门市5G产业联盟承办，经过数月的精心筹备，最终圆满落下帷幕。大赛自启动以来受到社会各界的高度关注，共收到来自101家单位的129个项目报名参赛，涉及5G﹢医疗、5G﹢城市治理、5G﹢教育、5G﹢人工智能、5G﹢智能制造、5G﹢AR/VR等多个领域。参赛队伍通过对解决方案以及应用案例的展示，为解决行业难题提供了新思路、新方法。</p><p>厦门电信积极探索“5G﹢”新模式，推动“5G﹢”应用落地，与工业、医疗、教育、传媒等不同行业伙伴开展深度合作，助力打造的“海润码头5G无线通信网络系统”“基于5G智能无人移动平台的园区综合服务”“基于5G的叉车远程驾驶”“厦门日报社5G新媒体”“厦门大学百年校庆5G﹢ VR﹢8K高清直播”“5G﹢ICU全病程管理平台”等多个项目在本次大赛中分别获得了一、二、三等奖和最佳创意、最佳社会效益奖。</p><p>本次大赛作为跨界融合交流的平台，切实推动了5G应用产业生态构建，为推进厦门乃至区域5G应用“扬帆远航”发挥了重要作用。未来，厦门5G应用大赛将继续以打造5G创新应用展示、交流和合作平台，深入挖掘“5G﹢”典型应用，加快建设5G产业生态为目标，注智5G应用新生态，赋能数字新经济。</p>\r\n	</div>', 29, 333, '0', '2', 23, 0, 6, 56, 11, 130, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000534, '厦门电信承办全市首届5G应用大赛', 1, '2022-01-20 08:33:24', '2038-01-19 03:14:07', '<p class=\"ql-align-justify\">近日，以“5G新生态，赋能新经济”为主题的第一届厦门5G应用大赛颁奖典礼暨5G应用项目对接会成功举办。</p><p class=\"ql-align-justify\">据悉，此次厦门5G应用大赛由中国电信福建厦门分公司、厦门市5G产业联盟承办，经过数月的精心筹备，最终圆满落下帷幕。大赛自启动以来受到社会各界的高度关注，共收到来自101家单位的129个项目报名参赛，涉及5G﹢医疗、5G﹢城市治理、5G﹢教育、5G﹢人工智能、5G﹢智能制造、5G﹢AR/VR等多个领域。参赛队伍通过对解决方案以及应用案例的展示，为解决行业难题提供了新思路、新方法。</p><p class=\"ql-align-justify\">厦门电信积极探索“5G﹢”新模式，推动“5G﹢”应用落地，与工业、医疗、教育、传媒等不同行业伙伴开展深度合作，助力打造的“海润码头5G无线通信网络系统”“基于5G智能无人移动平台的园区综合服务”“基于5G的叉车远程驾驶”“厦门日报社5G新媒体”“厦门大学百年校庆5G﹢ VR﹢8K高清直播”“5G﹢ICU全病程管理平台”等多个项目在本次大赛中分别获得了一、二、三等奖和最佳创意、最佳社会效益奖。</p><p class=\"ql-align-justify\">本次大赛作为跨界融合交流的平台，切实推动了5G应用产业生态构建，为推进厦门乃至区域5G应用“扬帆远航”发挥了重要作用。未来，厦门5G应用大赛将继续以打造5G创新应用展示、交流和合作平台，深入挖掘“5G﹢”典型应用，加快建设5G产业生态为目标，注智5G应用新生态，赋能数字新经济。</p><p><br></p>', NULL, 0, '1', '0', 0, 0, 0, 0, NULL, 130, 'A');
INSERT INTO `knowledge` VALUES (00000000000000000536, '加速产融合作机制创新', 1, '2022-01-20 08:36:34', '2022-06-03 16:00:00', '<p><br></p>', 21, 0, '0', '1', 0, 0, 0, 0, 4, 128, 'A');
INSERT INTO `knowledge` VALUES (00000000000000000537, '每个人都能实现“数字人自由”？', 1, '2022-01-20 08:37:44', '2022-09-02 16:00:00', '<p><br></p>', 33, 1, '0', '0', 0, 0, 0, 0, 4, 128, 'A');
INSERT INTO `knowledge` VALUES (00000000000000000539, '“断网”上热搜！中国电信回应：网络设备故障', 4, '2022-01-21 02:01:30', '2022-01-30 16:00:00', '<p><span style=\"color: rgb(51, 51, 51);\">1月12日凌晨，有大量用户反映中国电信出现断网，波及全国多个城市，目前已经登上微博热搜。此外，有消息称，中国电信AS4134骨干网广州出境光缆中断，影响部分海外地区访问，目前处于降级服务并将流量从广州出口转移到上海出口。</span></p>', 40, 1, '0', '1', 0, 0, 0, 0, 1, 540, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000540, '湖北电信适老化服务助力年长客户跨越“123', 4, '2022-01-21 02:15:03', '2022-01-30 16:00:00', '<h1>满意服务、十分信赖——湖北电信适老化服务助力年长客户跨越“数字鸿沟”</h1><h1>满意服务、十分信赖——湖北电信适老化服务助力年长客户跨越“数字鸿沟”</h1><h1>满意服务、十分信赖——湖北电信适老化服务助力年长客户跨越“数字鸿沟”</h1><p><br></p>', 34, 2, '0', '1', 0, 0, 0, 0, 2, 541, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000541, '老乡别走！中国电信：将确定具体稳定股价措施', 4, '2022-01-21 02:18:47', '2022-01-28 16:00:00', '<p>	不得不说，虽然A股市场比较难熬，但是时间过的还是很快的。电信运行商三巨头：移动、电信、联通齐聚A股的情形似乎还未从脑海中散去，突然就发现中国电信已经登陆A股将近5个月时间了。</p><p>	但5个月过去，中国电信的表现却让不少投资者俯首叹息。</p><p>	数据显示，中国电信于2021年8月20日在上交所挂牌上市，发行价4.53元。虽然中国电信IPO引入了“绿鞋机制”并在登陆A股首日盘中创下6.52元的高位，但此后就持续走低，股价破发不说，甚至一度下探至4.13元。此后，虽然股价有所回升，但也相对有限。</p><p>	截止19日收盘，中国电信跌0.7%，报4.26元/股，当前市值3898亿元。相比6.52元的高位，跌幅超34%。截至2021年9月30日，中国电信股东人数为109.8万户。</p><h1>	而对于股价的长时间低迷，今日晚间中国电信终于有了回应。</h1><p><br></p>', NULL, 0, '0', '0', 0, 0, 0, 0, NULL, 543, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000543, '中国电信：已触发稳定股价措施启动条件', 4, '2022-01-21 02:19:45', '2022-01-30 16:00:00', '<h1>中国电信：已触发稳定股价措施启动条件</h1><h1>中国电信：已触发稳定股价措施启动条件</h1><h1>中国电信：已触发稳定股价措施启动条件</h1><p><br></p>', 4, 0, '0', '0', 0, 0, 0, 0, 2, 544, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000545, '按时', 4, '2022-01-21 02:31:37', '2022-01-30 16:00:00', '<pre class=\"ql-syntax\" spellcheck=\"false\">info.id=this.collectForm.id;\ninfo.id=this.collectForm.id;\n</pre><p><br></p>', 2, 0, '0', '0', 0, 0, 0, 0, 2, 546, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000546, '呃呃呃3', 4, '2022-01-21 02:33:37', '2022-01-30 16:00:00', '<p>2223333q</p>', 2, 0, '0', '0', 0, 0, 0, 0, 2, 547, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000547, '123', 4, '2022-01-21 02:35:29', '2022-01-30 16:00:00', '<p>33333333333</p>', 2, 0, '0', '0', 0, 0, 0, 0, 3, 548, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000548, '宽带账号密码忘了怎么办？三种方法教你如何找回宽带帐号密码！', 4, '2022-01-21 03:35:08', '2022-01-30 16:00:00', '<p><strong>第一种方法找回宽带帐号密码：</strong></p><p>&nbsp;当我们没有使用路由器而是直接拨号的话，那么我们可以下载一个ADSL密码查看器，然后点击就可以查看帐号跟密码了，如果没有直接显示出来，它一般自动保存在D盘，可以到D盘去查看文件。</p><p class=\"ql-align-center\">&nbsp;</p><p class=\"ql-align-center\"><img src=\"http://www.lotpc.com/uploads/allimg/161204/1-161204135602510.jpg\" alt=\"宽带账号密码忘了怎么办？三种方法教你如何找回宽带帐号密码！\"></p><p><strong>第二种方法找回宽带帐号密码：（查看路由器）</strong></p><p>查看路由器宽带密码方法原理是，通过原来的路由器备份配置文件，然后借助路由器密码查看工具，查看密码即可，以下是具体的步骤教程。</p><p>一、首先登陆原来路由器管理界面，输入路由器账号密码登陆，如下图所示：</p><p class=\"ql-align-center\"><img src=\"http://www.lotpc.com/uploads/allimg/161204/1351062206-0.jpg\" alt=\"宽带账号密码忘了怎么办？三种方法教你如何找回宽带帐号密码！\"></p><p class=\"ql-align-center\">路由器登陆设置</p><p>二、进入路由器管理界面后，点击进入“备份和载入配置”，然后点击“备份配置文件”，然后将备份的配置文件存放在电脑桌面中，如下图所示：</p><p class=\"ql-align-center\"><img src=\"http://www.lotpc.com/uploads/allimg/161204/13510635a-1.jpg\" alt=\"宽带用户名和密码忘了怎么办？三种方法教你如何找回宽带帐号密码！\"></p><p>&nbsp;使用工具：RouterPassView 路由器密码查看器；</p><p>&nbsp;下载后直接运行解压文件夹里面的“RouterPass”路由器工具，然后点击“文件”-&gt;“打开路由器配置文件”，如下图所示：</p><p class=\"ql-align-center\"><img src=\"http://www.lotpc.com/uploads/allimg/161204/1352445343-0.jpg\" alt=\"宽带账号密码忘了怎么办？三种方法教你如何找回宽带帐号密码！\"></p><p class=\"ql-align-center\">打开路由器配置文件</p><p>&nbsp;之后浏览打开刚才备份的<strong>config.bin路由器备份的配置文件</strong>，之后即可查看到宽带密码了，如下图所示：</p><p class=\"ql-align-center\"><img src=\"http://www.lotpc.com/uploads/allimg/161204/135244D92-1.jpg\" alt=\"宽带用户名和密码忘了怎么办,三种方法教你如何找回宽带帐号密码！\"></p><p class=\"ql-align-center\">查看路由器宽带密码方法</p><p>&nbsp;通过以上简单几步就可以查看到PPPOE宽带账号和密码了，我们可以记录下来，然后在新路由器或者在路由器恢复出厂设置之后，重新设置路由器的时候，就可以派上用场了。</p><p><strong>第三种方法找回宽带帐号密码：</strong></p><p>&nbsp;不管是装的哪种宽带，或者有没有装路由器，我们都可以通过拨打服务电话来询问到帐号跟密码，不过需要所办宽带人的身份证跟姓名，地址。我们最好是拨打人工服务的，比如电信的宽带，我们先打10000，然后点击0，再点击1就转到人工了。</p><p>&nbsp;对于小白来说，第三种方法找回宽带用户名密码是最方便、快捷、简单的，以上三种找回宽带帐号密码的方法希望能够帮助到你！</p>', 32, 5, '0', '2', 2, 0, 0, 2, 1, 549, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000549, '网上注销手机号码的方法。', 4, '2022-01-21 07:14:47', '2022-01-30 16:00:00', '<p>1、首先需要登录联通手机营业厅。点击上方的“登录”选项，输入需要办理销户的联通手机号码及服务密码进行登录。</p><p><a href=\"https://iknow-pic.cdn.bcebos.com/5fdf8db1cb134954ea366df65b4e9258d1094a7c\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(63, 136, 191);\"><img src=\"https://iknow-pic.cdn.bcebos.com/5fdf8db1cb134954ea366df65b4e9258d1094a7c?x-bce-process%3Dimage%2Fresize%2Cm_lfit%2Cw_600%2Ch_800%2Climit_1%2Fquality%2Cq_85%2Fformat%2Cf_jpg\"></a></p><p>2、登录成功后，点击下方的“服务”选项，进入到服务列表中。</p><p><a href=\"https://iknow-pic.cdn.bcebos.com/0eb30f2442a7d933f5ee4ee7a04bd11372f001db\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(63, 136, 191);\"><img src=\"https://iknow-pic.cdn.bcebos.com/0eb30f2442a7d933f5ee4ee7a04bd11372f001db?x-bce-process%3Dimage%2Fresize%2Cm_lfit%2Cw_600%2Ch_800%2Climit_1%2Fquality%2Cq_85%2Fformat%2Cf_jpg\"></a></p><p>3、点击左侧列表的“办理”。</p><p><a href=\"https://iknow-pic.cdn.bcebos.com/72f082025aafa40f7fb44b4fa664034f78f01935\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(63, 136, 191);\"><img src=\"https://iknow-pic.cdn.bcebos.com/72f082025aafa40f7fb44b4fa664034f78f01935?x-bce-process%3Dimage%2Fresize%2Cm_lfit%2Cw_600%2Ch_800%2Climit_1%2Fquality%2Cq_85%2Fformat%2Cf_jpg\"></a></p><p>4、在办理界面的最下面可以找到“销户”的选项，点击进入。</p><p><a href=\"https://iknow-pic.cdn.bcebos.com/a1ec08fa513d26972cc38dcf58fbb2fb4316d814\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(63, 136, 191);\"><img src=\"https://iknow-pic.cdn.bcebos.com/a1ec08fa513d26972cc38dcf58fbb2fb4316d814?x-bce-process%3Dimage%2Fresize%2Cm_lfit%2Cw_600%2Ch_800%2Climit_1%2Fquality%2Cq_85%2Fformat%2Cf_jpg\"></a></p><p>5、选择“销户”原因。</p><p><a href=\"https://iknow-pic.cdn.bcebos.com/d31b0ef41bd5ad6ec497e1788ccb39dbb6fd3c31\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(63, 136, 191);\"><img src=\"https://iknow-pic.cdn.bcebos.com/d31b0ef41bd5ad6ec497e1788ccb39dbb6fd3c31?x-bce-process%3Dimage%2Fresize%2Cm_lfit%2Cw_600%2Ch_800%2Climit_1%2Fquality%2Cq_85%2Fformat%2Cf_jpg\"></a></p><p>6、点击后，同意销户的相关协议，然后验证个人信息即可办理异地销户业务。</p><p><a href=\"https://iknow-pic.cdn.bcebos.com/71cf3bc79f3df8dcd4680a03c011728b461028ce\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(63, 136, 191);\"><img src=\"https://iknow-pic.cdn.bcebos.com/71cf3bc79f3df8dcd4680a03c011728b461028ce?x-bce-process%3Dimage%2Fresize%2Cm_lfit%2Cw_600%2Ch_800%2Climit_1%2Fquality%2Cq_85%2Fformat%2Cf_jpg\"></a></p>', 6, 4, '0', '2', 0, 0, 0, 0, 2, 550, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000552, '宽带连接不上怎么办', 4, '2022-01-21 12:26:41', '2022-01-30 16:00:00', '<p class=\"ql-align-justify\">多朋友在使用电脑时，发现电脑宽带连接不上，不知道是什么原因导致的，又不知道该如何解决，本期文章就教教大家如何解决此类问题。</p><p class=\"ql-align-justify\">在说解决办法之前，先说说宽带连接不上的几个主要原因。一般情况下，宽带是不会出现问题的，而导致宽带连接不上的原因有三类，要么是外部网络出了问题，要么是室内网络出了问题，而最后一种就是宽带欠费。</p><p class=\"ql-align-center\"><img src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0306%2F5d67739ej00qpja03001fc000hs00cag.jpg&amp;thumbnail=650x2147483647&amp;quality=80&amp;type=jpg\"></p><p class=\"ql-align-center\"><br></p><h5>一、宽带欠费</h5><p class=\"ql-align-justify\">当用户发现宽带无法正常连接时，先不要擅自改动设备或线路，首先要做的是给网络运营商的客服打电话，咨询一下宽带是否欠费。</p><p class=\"ql-align-justify\">现在不像以前，宽带付费都是包月的，如果宽带出现了欠费的话，那么网络运营商会断开宽带，而这是可以通过拨打客服电话查询的，提供机主的身份证号码，查询宽带服务状态即可。</p><p class=\"ql-align-justify\">如果确定是欠费造成的宽带无法连接，就通过网络或线下营运大厅缴费即可。</p><p class=\"ql-align-center\"><img src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0306%2F1d0a1373j00qpja03000pc000hs00a0g.jpg&amp;thumbnail=650x2147483647&amp;quality=80&amp;type=jpg\"></p><p class=\"ql-align-center\"><br></p><h5>二、外部网络故障</h5><p class=\"ql-align-justify\">外部网络是分层级的，用户使用宽带拨号上网，实际上是从主光缆连接到网络运营商架设的分光器上，然后再从分光器接出一根光纤，接入用户家中的光猫上。</p><p class=\"ql-align-justify\">如果这部分线路或主光缆出了故障，就会导致用户无法正常联网。早些年的光猫没有任何提示的，但随着4G网络的普及，光猫是可以看到网络状态的。</p><p class=\"ql-align-justify\">如果宽带连接不上的话，可以先检查一下光猫，如果光猫的指示灯发出红光，那基本可以确定是外部网络故障造成的，拨打网络客服电话保修，或者联系联通的维修人员上门修理即可。</p><p class=\"ql-align-center\"><img src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0306%2F240d92fdj00qpja04000vc000hs00npg.jpg&amp;thumbnail=650x2147483647&amp;quality=80&amp;type=jpg\"></p><p class=\"ql-align-center\"><br></p><h5>三、内部网络故障</h5><p class=\"ql-align-justify\">随着4G网络的普及，大多数家庭已经不再使用手动拨号的上网方式，而是采用路由器使用网关代替手工拨号。</p><p class=\"ql-align-justify\">如果发现宽带无法正常使用，可以先检查下光猫的指示灯和室内的线路，如果没有发红光、线路也没有出现破损的话，可以将光猫和路由器的电源关掉，等待3~5分钟后，在将电源开关打开，网络有可能恢复。</p><p class=\"ql-align-justify\">而造成网络无法正常使用的原因是光猫或路由器长期运行，产生的缓存较多，造成光猫或路由器死机，重启这两个设备，就相当于清除了设备的缓存，所以网络会恢复正常。</p><p class=\"ql-align-center\"><img src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0306%2F29791c8dj00qpja04000zc000hs00bug.jpg&amp;thumbnail=650x2147483647&amp;quality=80&amp;type=jpg\"></p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-justify\">题外话：造成宽带无法连接的原因有很多，而我说的这三种只是比较常见的，对于个人用户来说，哪怕说出了方法，估计也是很难找到故障原因的，最稳妥的办法就是找专业的维修人员上门查看一下。</p><p><br></p>', 24, 1, '0', '0', 0, 0, 0, 0, 1, 553, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000553, '如果现在新入网，是不是只能办理5G套餐？', 1, '2022-01-21 12:33:33', '2022-01-30 16:00:00', '<p><span style=\"color: rgb(51, 51, 51);\">如果现在新入网，是不是只能办理5G套餐？如果现在新入网，是不是只能办理5G套餐？如果现在新入网，是不是只能办理5G套餐？如果现在新入网，是不是只能办理5G套餐？如果现在新入网，是不是只能办理5G套餐？</span></p>', 5, 0, '0', '1', 0, 0, 0, 0, 2, 554, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000554, '升级5G套餐后，还能变更回原来的4G套餐么？', 1, '2022-01-21 12:34:09', '2022-01-30 16:00:00', '<p><span style=\"color: rgb(51, 51, 51);\">升级5G套餐后，还能变更回原来的4G套餐么？升级5G套餐后，还能变更回原来的4G套餐么？升级5G套餐后，还能变更回原来的4G套餐么？</span></p>', 5, 0, '0', '1', 0, 0, 0, 0, 2, 555, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000555, '怎么才能使用5G服务呢？', 1, '2022-01-21 12:34:41', '2022-01-30 16:00:00', '<p><span style=\"color: rgb(51, 51, 51);\">怎么才能使用5G服务呢？怎么才能使用5G服务呢？怎么才能使用5G服务呢？</span></p>', 14, 1, '0', '1', 0, 0, 0, 0, 4, 556, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000556, '现在都什么地方有5G网络呢？我在的地方是不是有5G网络呢？', 1, '2022-01-21 12:35:16', '2022-01-30 16:00:00', '<p class=\"ql-align-justify\">答：目前全国所有地级市和部分重点县城已经实现5G网络覆盖，您可通过运营商客服热线、掌上营业厅或营业厅查询您身边的5G网络覆盖情况。</p><p><span style=\"color: rgb(51, 51, 51);\">现在都什么地方有5G网络呢？我在的地方是不是有5G网络呢？</span></p>', 5, 0, '0', '1', 0, 0, 0, 0, 1, 557, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000557, '一部5G手机只能使用一家运营商的5G服务么？', 1, '2022-01-21 12:35:50', '2022-01-27 16:00:00', '<p class=\"ql-align-justify\">答：一般情况下，同一部5G手机支持不同运营商提供的5G服务，但一部5G手机同一时间仅能连接一家运营商提供的5G网络。具体以手机厂商介绍为准。</p><p><br></p>', 5, 2, '0', '0', 0, 0, 0, 0, 5, 558, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000558, 'Q5:我的5G手机上显示了“5G”标识，但使用的是4G套餐，请问我用的是5G网络么？', 1, '2022-01-21 12:36:38', '2022-01-27 16:00:00', '<p class=\"ql-align-justify\">答：若您现在使用的是4G套餐,只要您的5G手机设置正确，在5G网络覆盖范围内，您也可以接入5G网络。如果您使用5G套餐，可享受更快的5G网络服务。</p><p><br></p>', 5, 1, '0', '0', 0, 0, 0, 0, 8, 559, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000561, '宽带连接不上怎么办？', 4, '2022-01-21 14:35:39', '2022-01-30 16:00:00', '<p class=\"ql-align-justify\">很多朋友在使用电脑时，发现电脑宽带连接不上，不知道是什么原因导致的，又不知道该如何解决，本期文章就教教大家如何解决此类问题。</p><p class=\"ql-align-justify\">在说解决办法之前，先说说宽带连接不上的几个主要原因。一般情况下，宽带是不会出现问题的，而导致宽带连接不上的原因有三类，要么是外部网络出了问题，要么是室内网络出了问题，而最后一种就是宽带欠费。</p><p class=\"ql-align-center\"><img src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0306%2F5d67739ej00qpja03001fc000hs00cag.jpg&amp;thumbnail=650x2147483647&amp;quality=80&amp;type=jpg\"></p><p class=\"ql-align-center\"><br></p><h5>一、宽带欠费</h5><p class=\"ql-align-justify\">当用户发现宽带无法正常连接时，先不要擅自改动设备或线路，首先要做的是给网络运营商的客服打电话，咨询一下宽带是否欠费。</p><p class=\"ql-align-justify\">现在不像以前，宽带付费都是包月的，如果宽带出现了欠费的话，那么网络运营商会断开宽带，而这是可以通过拨打客服电话查询的，提供机主的身份证号码，查询宽带服务状态即可。</p><p class=\"ql-align-justify\">如果确定是欠费造成的宽带无法连接，就通过网络或线下营运大厅缴费即可。</p><p class=\"ql-align-center\"><img src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0306%2F1d0a1373j00qpja03000pc000hs00a0g.jpg&amp;thumbnail=650x2147483647&amp;quality=80&amp;type=jpg\"></p><p class=\"ql-align-center\"><br></p><h5>二、外部网络故障</h5><p class=\"ql-align-justify\">外部网络是分层级的，用户使用宽带拨号上网，实际上是从主光缆连接到网络运营商架设的分光器上，然后再从分光器接出一根光纤，接入用户家中的光猫上。</p><p class=\"ql-align-justify\">如果这部分线路或主光缆出了故障，就会导致用户无法正常联网。早些年的光猫没有任何提示的，但随着4G网络的普及，光猫是可以看到网络状态的。</p><p class=\"ql-align-justify\">如果宽带连接不上的话，可以先检查一下光猫，如果光猫的指示灯发出红光，那基本可以确定是外部网络故障造成的，拨打网络客服电话保修，或者联系联通的维修人员上门修理即可。</p><p class=\"ql-align-center\"><img src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0306%2F240d92fdj00qpja04000vc000hs00npg.jpg&amp;thumbnail=650x2147483647&amp;quality=80&amp;type=jpg\"></p><p><br></p>', 14, 2, '0', '2', 0, 0, 0, 0, 1, 563, 'C');
INSERT INTO `knowledge` VALUES (00000000000000000562, '5g宽带', 1, '2022-01-22 04:22:11', '2021-12-31 08:00:00', '<p>你如</p>', 3, 2, '0', '2', 0, 0, 0, 0, 2, 565, 'C');

-- ----------------------------
-- Table structure for knowledge_audit
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_audit`;
CREATE TABLE `knowledge_audit`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `knowledge_id` bigint(0) NOT NULL,
  `reviewer_id` bigint(0) NOT NULL,
  `reject_reason` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驳回原因',
  `process_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge_audit
-- ----------------------------
INSERT INTO `knowledge_audit` VALUES (1, 41, 1, '', '2022-01-04 21:14:35');
INSERT INTO `knowledge_audit` VALUES (2, 42, 2, NULL, '2021-12-02 21:35:59');
INSERT INTO `knowledge_audit` VALUES (3, 43, 3, NULL, '2022-01-06 16:10:48');
INSERT INTO `knowledge_audit` VALUES (4, 44, 5, NULL, '2022-01-06 16:11:16');
INSERT INTO `knowledge_audit` VALUES (5, 45, 6, NULL, '2022-01-06 16:39:20');
INSERT INTO `knowledge_audit` VALUES (6, 46, 8, NULL, '2022-01-06 16:39:51');
INSERT INTO `knowledge_audit` VALUES (7, 47, 2, NULL, '2022-01-05 16:40:20');
INSERT INTO `knowledge_audit` VALUES (8, 48, 3, NULL, '2022-01-06 16:40:36');
INSERT INTO `knowledge_audit` VALUES (9, 49, 5, NULL, '2022-01-05 16:40:57');
INSERT INTO `knowledge_audit` VALUES (10, 50, 6, NULL, '2022-01-06 16:41:34');
INSERT INTO `knowledge_audit` VALUES (11, 51, 9, NULL, '2022-01-02 10:45:26');
INSERT INTO `knowledge_audit` VALUES (12, 52, 5, NULL, '2021-11-18 10:46:13');
INSERT INTO `knowledge_audit` VALUES (13, 53, 2, NULL, '2021-11-03 10:46:52');
INSERT INTO `knowledge_audit` VALUES (14, 54, 3, NULL, '2021-12-02 10:47:25');
INSERT INTO `knowledge_audit` VALUES (15, 55, 5, NULL, '2021-10-02 10:48:15');
INSERT INTO `knowledge_audit` VALUES (16, 56, 6, NULL, '2021-12-02 10:49:37');
INSERT INTO `knowledge_audit` VALUES (17, 57, 8, NULL, '2021-12-10 10:50:18');
INSERT INTO `knowledge_audit` VALUES (18, 58, 1, NULL, '2021-11-02 10:50:35');
INSERT INTO `knowledge_audit` VALUES (19, 59, 2, NULL, '2021-11-02 10:51:14');
INSERT INTO `knowledge_audit` VALUES (20, 60, 3, NULL, '2021-07-02 10:52:13');
INSERT INTO `knowledge_audit` VALUES (32, 61, 5, NULL, '2022-01-07 03:20:56');
INSERT INTO `knowledge_audit` VALUES (33, 1, 6, NULL, '2022-01-07 03:30:10');
INSERT INTO `knowledge_audit` VALUES (34, 2, 8, NULL, '2022-01-07 04:11:22');
INSERT INTO `knowledge_audit` VALUES (35, 3, 2, NULL, '2022-01-07 04:28:24');
INSERT INTO `knowledge_audit` VALUES (36, 4, 3, NULL, '2022-01-07 06:54:54');
INSERT INTO `knowledge_audit` VALUES (37, 5, 5, NULL, '2022-01-07 06:55:41');
INSERT INTO `knowledge_audit` VALUES (38, 6, 6, NULL, '2022-01-07 07:01:09');
INSERT INTO `knowledge_audit` VALUES (39, 7, 8, NULL, '2022-01-07 07:08:55');
INSERT INTO `knowledge_audit` VALUES (40, 8, 2, NULL, '2022-01-07 07:10:27');
INSERT INTO `knowledge_audit` VALUES (41, 9, 3, NULL, '2022-01-07 07:11:27');
INSERT INTO `knowledge_audit` VALUES (42, 10, 1, NULL, '2022-01-07 07:13:47');
INSERT INTO `knowledge_audit` VALUES (43, 11, 5, NULL, '2022-01-07 07:25:12');
INSERT INTO `knowledge_audit` VALUES (44, 12, 6, NULL, '2022-01-07 08:22:46');
INSERT INTO `knowledge_audit` VALUES (45, 13, 8, NULL, '2022-01-07 08:22:56');
INSERT INTO `knowledge_audit` VALUES (46, 62, 2, NULL, '2022-01-11 07:35:51');
INSERT INTO `knowledge_audit` VALUES (47, 14, 3, NULL, '2022-01-11 07:36:03');
INSERT INTO `knowledge_audit` VALUES (48, 15, 5, NULL, '2022-01-11 07:36:46');
INSERT INTO `knowledge_audit` VALUES (49, 16, 6, NULL, '2022-01-11 07:37:46');
INSERT INTO `knowledge_audit` VALUES (50, 42, 8, NULL, '2022-01-11 07:39:58');
INSERT INTO `knowledge_audit` VALUES (51, 17, 2, NULL, '2022-01-11 07:44:06');
INSERT INTO `knowledge_audit` VALUES (52, 18, 1, NULL, '2022-01-11 07:46:55');
INSERT INTO `knowledge_audit` VALUES (53, 43, 3, NULL, '2022-01-11 07:49:16');
INSERT INTO `knowledge_audit` VALUES (54, 92, 5, NULL, '2022-01-11 07:53:57');
INSERT INTO `knowledge_audit` VALUES (55, 95, 6, NULL, '2022-01-11 08:46:56');
INSERT INTO `knowledge_audit` VALUES (56, 96, 8, NULL, '2022-01-11 10:59:38');
INSERT INTO `knowledge_audit` VALUES (57, 97, 1, NULL, '2022-01-11 11:05:48');
INSERT INTO `knowledge_audit` VALUES (58, 92, 2, NULL, '2022-01-12 10:24:02');
INSERT INTO `knowledge_audit` VALUES (59, 99, 3, NULL, '2022-01-12 11:32:14');
INSERT INTO `knowledge_audit` VALUES (60, 103, 5, NULL, '2022-01-12 11:36:02');
INSERT INTO `knowledge_audit` VALUES (61, 87, 6, NULL, '2022-01-12 11:36:32');
INSERT INTO `knowledge_audit` VALUES (62, 107, 8, NULL, '2022-01-13 13:18:08');
INSERT INTO `knowledge_audit` VALUES (63, 40, 2, NULL, '2022-01-14 02:04:54');
INSERT INTO `knowledge_audit` VALUES (64, 106, 1, NULL, '2022-01-14 02:05:01');
INSERT INTO `knowledge_audit` VALUES (65, 109, 3, NULL, '2022-01-14 03:08:55');
INSERT INTO `knowledge_audit` VALUES (66, 110, 5, NULL, '2022-01-14 03:08:58');
INSERT INTO `knowledge_audit` VALUES (67, 108, 6, NULL, '2022-01-15 03:57:11');
INSERT INTO `knowledge_audit` VALUES (68, 107, 8, NULL, '2022-01-15 04:24:24');
INSERT INTO `knowledge_audit` VALUES (69, 106, 2, NULL, '2022-01-15 04:24:48');
INSERT INTO `knowledge_audit` VALUES (70, 105, 3, NULL, '2022-01-15 04:46:44');
INSERT INTO `knowledge_audit` VALUES (71, 104, 5, NULL, '2022-01-15 06:09:01');
INSERT INTO `knowledge_audit` VALUES (72, 103, 6, NULL, '2022-01-15 06:13:16');
INSERT INTO `knowledge_audit` VALUES (73, 102, 8, NULL, '2022-01-15 06:21:28');
INSERT INTO `knowledge_audit` VALUES (74, 101, 2, NULL, '2022-01-15 06:21:39');
INSERT INTO `knowledge_audit` VALUES (75, 100, 3, NULL, '2022-01-15 07:14:02');
INSERT INTO `knowledge_audit` VALUES (76, 98, 1, NULL, '2022-01-15 07:14:16');
INSERT INTO `knowledge_audit` VALUES (77, 94, 5, NULL, '2022-01-18 04:05:31');
INSERT INTO `knowledge_audit` VALUES (78, 112, 6, NULL, '2022-01-18 04:05:38');
INSERT INTO `knowledge_audit` VALUES (79, 29, 8, NULL, '2022-01-18 07:59:55');
INSERT INTO `knowledge_audit` VALUES (80, 113, 2, NULL, '2022-01-18 12:58:11');
INSERT INTO `knowledge_audit` VALUES (81, 114, 1, NULL, '2022-01-19 03:48:51');
INSERT INTO `knowledge_audit` VALUES (82, 115, 3, NULL, '2022-01-19 08:31:16');
INSERT INTO `knowledge_audit` VALUES (83, 548, 7, NULL, '2022-01-21 03:37:33');
INSERT INTO `knowledge_audit` VALUES (84, 549, 7, NULL, '2022-01-21 07:15:20');
INSERT INTO `knowledge_audit` VALUES (86, 2, 2, '知识存在错误', '2022-01-21 13:36:05');
INSERT INTO `knowledge_audit` VALUES (88, 558, 7, '意义不大', '2022-01-21 13:42:03');
INSERT INTO `knowledge_audit` VALUES (90, 537, 7, '不符合规范', '2022-01-21 14:06:51');
INSERT INTO `knowledge_audit` VALUES (91, 561, 7, NULL, '2022-01-21 14:39:08');
INSERT INTO `knowledge_audit` VALUES (92, 552, 7, '冗余', '2022-01-21 14:39:25');
INSERT INTO `knowledge_audit` VALUES (93, 2, 2, '知识存在错误', '2022-01-21 23:33:44');
INSERT INTO `knowledge_audit` VALUES (94, 562, 1, NULL, '2022-01-22 04:22:32');
INSERT INTO `knowledge_audit` VALUES (95, 557, 1, '驳回', '2022-01-22 04:22:53');
INSERT INTO `knowledge_audit` VALUES (96, 2, 2, '知识存在错误', '2022-02-24 11:09:58');
INSERT INTO `knowledge_audit` VALUES (97, 2, 2, '知识存在错误', '2022-02-27 13:50:35');
INSERT INTO `knowledge_audit` VALUES (98, 2, 2, '知识存在错误', '2022-03-01 12:16:21');

-- ----------------------------
-- Table structure for knowledge_collection
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_collection`;
CREATE TABLE `knowledge_collection`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `knowledge_id` bigint(0) NOT NULL COMMENT '知识id',
  `collect_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '点赞时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge_collection
-- ----------------------------
INSERT INTO `knowledge_collection` VALUES (1, 1, 11, '2022-01-06 06:09:23');
INSERT INTO `knowledge_collection` VALUES (2, 2, 12, '2022-01-06 06:09:23');
INSERT INTO `knowledge_collection` VALUES (3, 3, 13, '2022-01-08 06:09:02');
INSERT INTO `knowledge_collection` VALUES (4, 4, 14, '2022-01-06 08:40:47');
INSERT INTO `knowledge_collection` VALUES (5, 5, 15, '2022-01-07 20:48:28');
INSERT INTO `knowledge_collection` VALUES (6, 6, 16, '2022-01-08 20:48:34');
INSERT INTO `knowledge_collection` VALUES (7, 7, 17, '2022-01-08 20:48:40');
INSERT INTO `knowledge_collection` VALUES (8, 8, 18, '2022-01-09 20:48:48');
INSERT INTO `knowledge_collection` VALUES (9, 9, 19, '2022-01-09 20:48:55');
INSERT INTO `knowledge_collection` VALUES (10, 3, 20, '2022-01-10 20:49:01');
INSERT INTO `knowledge_collection` VALUES (11, 4, 23, '2022-01-10 20:49:08');
INSERT INTO `knowledge_collection` VALUES (12, 5, 24, '2022-01-11 20:49:14');
INSERT INTO `knowledge_collection` VALUES (13, 6, 25, '2022-01-11 20:49:21');
INSERT INTO `knowledge_collection` VALUES (14, 7, 26, '2022-01-12 20:49:28');
INSERT INTO `knowledge_collection` VALUES (15, 8, 27, '2022-01-13 20:49:35');
INSERT INTO `knowledge_collection` VALUES (16, 9, 28, '2022-01-13 20:49:42');
INSERT INTO `knowledge_collection` VALUES (17, 1, 29, '2022-01-14 20:49:48');
INSERT INTO `knowledge_collection` VALUES (18, 1, 30, '2022-01-15 20:49:53');
INSERT INTO `knowledge_collection` VALUES (19, 3, 31, '2022-01-16 20:49:59');
INSERT INTO `knowledge_collection` VALUES (20, 4, 32, '2022-01-17 20:50:06');
INSERT INTO `knowledge_collection` VALUES (21, 5, 33, '2022-01-18 20:50:13');
INSERT INTO `knowledge_collection` VALUES (22, 6, 34, '2022-01-20 20:50:20');
INSERT INTO `knowledge_collection` VALUES (23, 7, 35, '2022-01-21 20:50:29');
INSERT INTO `knowledge_collection` VALUES (25, 9, 37, '2022-01-23 20:50:43');
INSERT INTO `knowledge_collection` VALUES (26, 1, 38, '2022-01-24 20:50:54');
INSERT INTO `knowledge_collection` VALUES (27, 1, 11, '2022-01-24 20:23:34');
INSERT INTO `knowledge_collection` VALUES (33, 1, 12, '2022-01-12 02:15:52');
INSERT INTO `knowledge_collection` VALUES (38, 1, 57, '2022-01-12 03:42:27');
INSERT INTO `knowledge_collection` VALUES (43, 1, 11, '2022-01-14 01:51:42');
INSERT INTO `knowledge_collection` VALUES (44, 1, 11, '2022-01-14 01:51:44');
INSERT INTO `knowledge_collection` VALUES (45, 1, 11, '2022-01-14 01:51:46');
INSERT INTO `knowledge_collection` VALUES (46, 1, 11, '2022-01-14 01:51:47');
INSERT INTO `knowledge_collection` VALUES (47, 1, 11, '2022-01-14 01:51:48');
INSERT INTO `knowledge_collection` VALUES (48, 3, 11, '2022-01-14 03:13:58');
INSERT INTO `knowledge_collection` VALUES (49, 4, 11, '2022-01-15 01:42:11');
INSERT INTO `knowledge_collection` VALUES (50, 5, 11, '2022-01-15 01:42:12');
INSERT INTO `knowledge_collection` VALUES (51, 6, 39, '2022-01-15 03:58:21');
INSERT INTO `knowledge_collection` VALUES (52, 7, 19, '2022-01-15 06:27:13');
INSERT INTO `knowledge_collection` VALUES (53, 8, 11, '2022-01-15 07:12:04');
INSERT INTO `knowledge_collection` VALUES (54, 1, 38, '2022-01-17 08:27:22');
INSERT INTO `knowledge_collection` VALUES (55, 1, 34, '2022-01-17 08:27:40');
INSERT INTO `knowledge_collection` VALUES (57, 7, 32, '2022-01-18 06:28:58');
INSERT INTO `knowledge_collection` VALUES (59, 7, 27, '2022-01-18 07:15:19');
INSERT INTO `knowledge_collection` VALUES (60, 1, 10, '2022-01-18 07:31:48');
INSERT INTO `knowledge_collection` VALUES (61, 9, 19, '2022-01-18 09:28:31');
INSERT INTO `knowledge_collection` VALUES (62, 9, 30, '2022-01-18 09:28:43');
INSERT INTO `knowledge_collection` VALUES (63, 1, 14, '2022-01-19 01:33:01');
INSERT INTO `knowledge_collection` VALUES (65, 9, 52, '2022-01-19 08:31:47');
INSERT INTO `knowledge_collection` VALUES (67, 5, 12, '2022-01-20 07:07:21');
INSERT INTO `knowledge_collection` VALUES (68, 1, 123, '2022-01-20 11:16:19');
INSERT INTO `knowledge_collection` VALUES (70, 7, 11, '2022-01-20 11:17:36');
INSERT INTO `knowledge_collection` VALUES (71, 8, 107, '2022-01-20 11:21:47');
INSERT INTO `knowledge_collection` VALUES (72, 8, 36, '2022-01-20 11:22:57');
INSERT INTO `knowledge_collection` VALUES (74, 8, 35, '2022-01-20 11:23:49');
INSERT INTO `knowledge_collection` VALUES (76, 4, 123, '2022-01-21 02:36:35');
INSERT INTO `knowledge_collection` VALUES (78, 4, 105, '2022-01-21 02:37:02');
INSERT INTO `knowledge_collection` VALUES (79, 4, 118, '2022-01-21 02:37:58');
INSERT INTO `knowledge_collection` VALUES (81, 5, 548, '2022-01-21 03:39:33');
INSERT INTO `knowledge_collection` VALUES (82, 4, 130, '2022-01-21 07:12:02');
INSERT INTO `knowledge_collection` VALUES (83, 4, 548, '2022-01-21 11:51:41');
INSERT INTO `knowledge_collection` VALUES (85, 5, 128, '2022-01-21 12:31:14');
INSERT INTO `knowledge_collection` VALUES (88, 5, 126, '2022-01-21 13:15:12');
INSERT INTO `knowledge_collection` VALUES (92, 4, 128, '2022-01-21 14:32:22');
INSERT INTO `knowledge_collection` VALUES (97, 3, 5, '2022-03-01 12:16:21');

-- ----------------------------
-- Table structure for knowledge_comment
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_comment`;
CREATE TABLE `knowledge_comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `knowledge_id` bigint(0) NOT NULL,
  `user_id` bigint(0) NOT NULL,
  `parent_id` bigint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `knowledge_id`(`knowledge_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  CONSTRAINT `knowledge_comment_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `knowledge_comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 185 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge_comment
-- ----------------------------
INSERT INTO `knowledge_comment` VALUES (0, '总评论', '2022-01-11 10:50:29', 0, 0, NULL);
INSERT INTO `knowledge_comment` VALUES (1, 'sdqwd', '2022-01-04 21:16:11', 11, 3, 0);
INSERT INTO `knowledge_comment` VALUES (2, '司法权威父亲俄文法文', '2022-01-04 21:36:57', 12, 4, 0);
INSERT INTO `knowledge_comment` VALUES (3, '爱的好的哈', '2022-01-07 16:23:43', 11, 5, 1);
INSERT INTO `knowledge_comment` VALUES (4, '阿好滴哈', '2022-01-27 07:17:03', 11, 2, 3);
INSERT INTO `knowledge_comment` VALUES (5, '阿萨德凯撒', '2022-01-26 09:23:12', 15, 2, 0);
INSERT INTO `knowledge_comment` VALUES (6, '学不会学不会', '2022-01-04 16:32:06', 16, 1, 0);
INSERT INTO `knowledge_comment` VALUES (7, 'asdjlgja', '2022-01-15 20:57:19', 17, 6, 0);
INSERT INTO `knowledge_comment` VALUES (8, '惆怅惆怅错错错错错错错错', '2022-01-07 10:22:49', 12, 1, 2);
INSERT INTO `knowledge_comment` VALUES (9, '咔咔咔咔咔咔扩扩扩扩', '2022-01-20 10:27:22', 11, 9, 1);
INSERT INTO `knowledge_comment` VALUES (10, '顶顶顶顶顶顶顶顶', '2022-01-06 10:34:23', 13, 11, 0);
INSERT INTO `knowledge_comment` VALUES (11, '快快快快快快快快快', '2022-01-07 11:29:10', 11, 8, 0);
INSERT INTO `knowledge_comment` VALUES (12, '啦啦啦啦啦啦啦啦绿绿', '2022-01-08 11:29:52', 11, 7, 0);
INSERT INTO `knowledge_comment` VALUES (13, '噢噢噢噢噢噢', '2022-01-09 11:30:27', 11, 2, 0);
INSERT INTO `knowledge_comment` VALUES (15, '阿萨德丧尸', '2022-01-13 12:43:33', 13, 3, 10);
INSERT INTO `knowledge_comment` VALUES (19, 'admin123', '2022-01-07 07:22:48', 12, 4, 0);
INSERT INTO `knowledge_comment` VALUES (20, 'admin123', '2022-01-07 07:25:49', 12, 5, 0);
INSERT INTO `knowledge_comment` VALUES (21, 'admin123', '2022-01-07 08:12:56', 12, 6, 0);
INSERT INTO `knowledge_comment` VALUES (22, 'admin123', '2022-01-07 08:13:08', 12, 7, 0);
INSERT INTO `knowledge_comment` VALUES (23, 'sadsad', '2022-01-07 08:13:54', 11, 9, 0);
INSERT INTO `knowledge_comment` VALUES (24, '评论内容测试', '2022-01-08 09:24:50', 15, 9, 0);
INSERT INTO `knowledge_comment` VALUES (26, '评论内容测试', '2022-01-08 15:25:02', 15, 11, 0);
INSERT INTO `knowledge_comment` VALUES (35, '努力让评论看上去显得正常', '2022-01-11 10:51:03', 11, 1, 0);
INSERT INTO `knowledge_comment` VALUES (36, '嘿嘿IEhi额', '2022-01-11 10:53:22', 11, 2, 0);
INSERT INTO `knowledge_comment` VALUES (37, 'sadsda', '2022-01-11 10:55:11', 11, 3, 0);
INSERT INTO `knowledge_comment` VALUES (38, 'sadsad', '2022-01-11 10:56:18', 11, 4, 0);
INSERT INTO `knowledge_comment` VALUES (39, 'asdasdsad', '2022-01-11 10:56:40', 11, 5, 0);
INSERT INTO `knowledge_comment` VALUES (40, '乡村振兴创造性啊', '2022-01-11 10:57:35', 11, 6, 0);
INSERT INTO `knowledge_comment` VALUES (41, 'asdsadsd', '2022-01-11 10:58:30', 11, 7, 0);
INSERT INTO `knowledge_comment` VALUES (42, '我再试试', '2022-01-11 11:00:46', 11, 8, 0);
INSERT INTO `knowledge_comment` VALUES (43, 'sad', '2022-01-11 11:19:02', 11, 9, 0);
INSERT INTO `knowledge_comment` VALUES (44, 'time test', '2022-01-11 11:57:53', 11, 6, 0);
INSERT INTO `knowledge_comment` VALUES (45, 'time test 2', '2022-01-11 12:40:14', 11, 11, 0);
INSERT INTO `knowledge_comment` VALUES (46, 'time test 3', '2022-01-11 13:41:49', 11, 1, 0);
INSERT INTO `knowledge_comment` VALUES (47, 'sad', '2022-01-12 02:22:52', 14, 2, 0);
INSERT INTO `knowledge_comment` VALUES (48, 'sadzxc', '2022-01-12 02:23:09', 14, 3, 0);
INSERT INTO `knowledge_comment` VALUES (49, '我再看看', '2022-01-12 02:39:49', 11, 4, 0);
INSERT INTO `knowledge_comment` VALUES (50, '试试看', '2022-01-12 02:45:53', 11, 5, 0);
INSERT INTO `knowledge_comment` VALUES (51, '看看', '2022-01-12 02:53:00', 86, 6, 0);
INSERT INTO `knowledge_comment` VALUES (52, '这是加上去额', '2022-01-13 09:59:34', 11, 6, 0);
INSERT INTO `knowledge_comment` VALUES (53, '我再加一条', '2022-01-13 09:59:46', 11, 7, 0);
INSERT INTO `knowledge_comment` VALUES (54, '评论评论评论', '2022-01-13 10:18:50', 11, 8, 0);
INSERT INTO `knowledge_comment` VALUES (55, '小烦', '2022-01-13 10:29:51', 11, 9, 0);
INSERT INTO `knowledge_comment` VALUES (56, '我试试看', '2022-01-13 11:13:34', 11, 11, 0);
INSERT INTO `knowledge_comment` VALUES (57, '嘿嘿', '2022-01-13 11:13:52', 11, 1, 0);
INSERT INTO `knowledge_comment` VALUES (58, '还是前端及时刷新看着爽', '2022-01-13 11:14:04', 11, 2, 0);
INSERT INTO `knowledge_comment` VALUES (59, '我试试看', '2022-01-13 12:14:59', 11, 3, 0);
INSERT INTO `knowledge_comment` VALUES (60, 'asdasdsad', '2022-01-14 02:28:33', 11, 4, 59);
INSERT INTO `knowledge_comment` VALUES (61, '收到了吗', '2022-01-14 03:15:05', 11, 5, 0);
INSERT INTO `knowledge_comment` VALUES (62, '测试', '2022-01-14 03:15:26', 12, 6, 0);
INSERT INTO `knowledge_comment` VALUES (64, 'sadsadsad', '2022-01-14 03:49:46', 14, 8, 0);
INSERT INTO `knowledge_comment` VALUES (65, 'ceshi', '2022-01-14 03:50:08', 55, 9, 0);
INSERT INTO `knowledge_comment` VALUES (67, '你好呀！', '2022-01-14 11:14:54', 11, 7, 60);
INSERT INTO `knowledge_comment` VALUES (69, '你好呀', '2022-01-15 03:58:26', 39, 8, 0);
INSERT INTO `knowledge_comment` VALUES (71, '很好', '2022-01-15 06:27:23', 31, 4, 0);
INSERT INTO `knowledge_comment` VALUES (73, 'henhao ', '2022-01-15 07:12:10', 11, 2, 0);
INSERT INTO `knowledge_comment` VALUES (75, '好好说话', '2022-01-15 08:14:57', 11, 4, 73);
INSERT INTO `knowledge_comment` VALUES (76, '妙啊', '2022-01-15 08:15:14', 11, 9, 75);
INSERT INTO `knowledge_comment` VALUES (77, 'this is test', '2022-01-18 03:52:31', 107, 8, 0);
INSERT INTO `knowledge_comment` VALUES (78, '评论测试一下', '2022-01-18 06:19:20', 31, 8, 0);
INSERT INTO `knowledge_comment` VALUES (81, '支持', '2022-01-18 06:20:12', 32, 8, 0);
INSERT INTO `knowledge_comment` VALUES (82, '必须同意', '2022-01-18 06:20:23', 31, 8, 78);
INSERT INTO `knowledge_comment` VALUES (83, '233', '2022-01-18 06:20:26', 34, 8, 0);
INSERT INTO `knowledge_comment` VALUES (84, '1111', '2022-01-18 06:20:41', 34, 8, 82);
INSERT INTO `knowledge_comment` VALUES (85, '下班了下班了', '2022-01-18 06:20:51', 34, 8, 84);
INSERT INTO `knowledge_comment` VALUES (86, '测试', '2022-01-18 06:25:52', 34, 7, 85);
INSERT INTO `knowledge_comment` VALUES (87, 'asdsadasd', '2022-01-18 07:00:13', 11, 7, 61);
INSERT INTO `knowledge_comment` VALUES (88, '你看看', '2022-01-18 07:17:55', 27, 7, 0);
INSERT INTO `knowledge_comment` VALUES (89, 'asd', '2022-01-18 07:46:18', 38, 7, 0);
INSERT INTO `knowledge_comment` VALUES (90, 'hah', '2022-01-18 07:49:54', 39, 7, 0);
INSERT INTO `knowledge_comment` VALUES (91, '嘿嘿', '2022-01-18 07:50:06', 38, 7, 0);
INSERT INTO `knowledge_comment` VALUES (92, '看看', '2022-01-18 07:51:54', 39, 7, 0);
INSERT INTO `knowledge_comment` VALUES (93, '哇咔咔', '2022-01-18 07:54:48', 37, 7, 0);
INSERT INTO `knowledge_comment` VALUES (94, '可以', '2022-01-18 07:54:55', 89, 7, 0);
INSERT INTO `knowledge_comment` VALUES (95, '芜湖齐飞', '2022-01-18 07:56:14', 76, 1, 0);
INSERT INTO `knowledge_comment` VALUES (97, '不见了吗', '2022-01-18 07:56:39', 76, 1, 95);
INSERT INTO `knowledge_comment` VALUES (98, '如此', '2022-01-18 07:56:59', 76, 1, 97);
INSERT INTO `knowledge_comment` VALUES (99, '测试', '2022-01-18 11:54:39', 11, 7, 0);
INSERT INTO `knowledge_comment` VALUES (100, '火钳刘明', '2022-01-18 12:01:24', 30, 7, 0);
INSERT INTO `knowledge_comment` VALUES (101, '真不错啊', '2022-01-18 12:05:12', 108, 1, 0);
INSERT INTO `knowledge_comment` VALUES (103, '不见了', '2022-01-19 01:58:00', 108, 7, 98);
INSERT INTO `knowledge_comment` VALUES (104, 'qweqwe', '2022-01-19 02:14:09', 108, 7, 92);
INSERT INTO `knowledge_comment` VALUES (105, 'qweqweqwe', '2022-01-19 02:14:13', 108, 7, 92);
INSERT INTO `knowledge_comment` VALUES (106, 'oishfsiqeweqwe', '2022-01-19 02:14:18', 108, 7, 92);
INSERT INTO `knowledge_comment` VALUES (108, '这是ylj第一条通过采编审核的知识，撒花🎉', '2022-01-19 08:32:59', 52, 9, 0);
INSERT INTO `knowledge_comment` VALUES (109, '很不错', '2022-01-20 06:56:47', 129, 5, 0);
INSERT INTO `knowledge_comment` VALUES (110, '明白了！', '2022-01-20 07:26:03', 77, 5, 0);
INSERT INTO `knowledge_comment` VALUES (111, '好极了', '2022-01-20 07:26:12', 77, 5, 0);
INSERT INTO `knowledge_comment` VALUES (112, '很好', '2022-01-20 07:26:20', 77, 5, 0);
INSERT INTO `knowledge_comment` VALUES (113, '的', '2022-01-21 02:37:25', 34, 4, 0);
INSERT INTO `knowledge_comment` VALUES (114, '第一排', '2022-01-21 03:22:03', 128, 4, 0);
INSERT INTO `knowledge_comment` VALUES (115, '不错', '2022-01-21 03:59:12', 130, 6, 0);
INSERT INTO `knowledge_comment` VALUES (116, '很有用', '2022-01-21 04:05:30', 128, 6, 0);
INSERT INTO `knowledge_comment` VALUES (117, '期待这一天的到来', '2022-01-21 04:06:07', 124, 6, 0);
INSERT INTO `knowledge_comment` VALUES (118, '期待未来', '2022-01-21 04:06:41', 123, 6, 0);
INSERT INTO `knowledge_comment` VALUES (119, '很棒', '2022-01-21 04:07:12', 122, 6, 0);
INSERT INTO `knowledge_comment` VALUES (120, '让我们一起展望未来', '2022-01-21 04:13:06', 128, 1, 0);
INSERT INTO `knowledge_comment` VALUES (121, '携手共同努力', '2022-01-21 04:16:08', 128, 10, 120);
INSERT INTO `knowledge_comment` VALUES (122, '已了解', '2022-01-21 04:19:06', 130, 10, 0);
INSERT INTO `knowledge_comment` VALUES (123, '未来更美好', '2022-01-21 04:19:54', 124, 10, 0);
INSERT INTO `knowledge_comment` VALUES (124, '嗯', '2022-01-21 04:24:51', 128, 7, 116);
INSERT INTO `knowledge_comment` VALUES (125, '一起努力', '2022-01-21 04:26:53', 128, 5, 120);
INSERT INTO `knowledge_comment` VALUES (126, '我觉得也不错', '2022-01-21 07:12:14', 130, 4, 115);
INSERT INTO `knowledge_comment` VALUES (127, 'sd', '2022-01-21 12:23:40', 128, 4, 121);
INSERT INTO `knowledge_comment` VALUES (128, '让我们期待马上来临的假期！！！', '2022-01-21 12:31:52', 128, 5, 0);
INSERT INTO `knowledge_comment` VALUES (129, '哈哈哈哈', '2022-01-21 12:32:25', 128, 5, 0);
INSERT INTO `knowledge_comment` VALUES (130, '耶耶耶', '2022-01-21 12:32:49', 128, 5, 128);
INSERT INTO `knowledge_comment` VALUES (131, '耶耶耶', '2022-01-21 12:32:50', 128, 5, 128);
INSERT INTO `knowledge_comment` VALUES (132, '耶耶耶', '2022-01-21 12:32:52', 128, 5, 128);
INSERT INTO `knowledge_comment` VALUES (133, '耶耶耶', '2022-01-21 12:32:52', 128, 5, 128);
INSERT INTO `knowledge_comment` VALUES (134, '耶耶耶', '2022-01-21 12:32:53', 128, 5, 128);
INSERT INTO `knowledge_comment` VALUES (135, '耶耶耶', '2022-01-21 12:32:53', 128, 5, 128);
INSERT INTO `knowledge_comment` VALUES (136, '耶耶耶', '2022-01-21 12:32:53', 128, 5, 128);
INSERT INTO `knowledge_comment` VALUES (137, '耶耶耶', '2022-01-21 12:32:54', 128, 5, 128);
INSERT INTO `knowledge_comment` VALUES (138, '耶耶耶', '2022-01-21 12:32:59', 128, 5, 128);
INSERT INTO `knowledge_comment` VALUES (139, '耶耶耶', '2022-01-21 12:33:05', 128, 5, 128);
INSERT INTO `knowledge_comment` VALUES (140, '耶耶耶', '2022-01-21 12:33:05', 128, 5, 128);
INSERT INTO `knowledge_comment` VALUES (141, 'hsad', '2022-01-21 12:40:38', 130, 7, 0);
INSERT INTO `knowledge_comment` VALUES (143, '你看看', '2022-01-21 12:41:57', 130, 7, 0);
INSERT INTO `knowledge_comment` VALUES (144, '你再看看', '2022-01-21 12:43:09', 130, 7, 0);
INSERT INTO `knowledge_comment` VALUES (146, '但', '2022-01-21 12:44:12', 107, 7, 77);
INSERT INTO `knowledge_comment` VALUES (147, 'sad', '2022-01-21 12:47:30', 107, 7, 77);
INSERT INTO `knowledge_comment` VALUES (148, 'sad', '2022-01-21 12:52:17', 107, 7, 77);
INSERT INTO `knowledge_comment` VALUES (149, '继续', '2022-01-21 12:52:57', 107, 7, 146);
INSERT INTO `knowledge_comment` VALUES (150, '大g', '2022-01-21 12:53:17', 107, 7, 77);
INSERT INTO `knowledge_comment` VALUES (151, '哈哈', '2022-01-21 12:54:21', 107, 7, 77);
INSERT INTO `knowledge_comment` VALUES (152, '哈', '2022-01-21 12:55:24', 107, 7, 77);
INSERT INTO `knowledge_comment` VALUES (153, '看看', '2022-01-21 12:55:49', 107, 7, 77);
INSERT INTO `knowledge_comment` VALUES (155, '我g了', '2022-01-21 12:57:47', 107, 7, 149);
INSERT INTO `knowledge_comment` VALUES (156, '我g了', '2022-01-21 12:57:48', 107, 7, 149);
INSERT INTO `knowledge_comment` VALUES (157, '我g了', '2022-01-21 12:57:48', 107, 7, 149);
INSERT INTO `knowledge_comment` VALUES (158, '我g了', '2022-01-21 12:57:48', 107, 7, 149);
INSERT INTO `knowledge_comment` VALUES (159, '我g了', '2022-01-21 12:58:08', 107, 7, 155);
INSERT INTO `knowledge_comment` VALUES (160, '我真的g了', '2022-01-21 12:58:22', 107, 7, 159);
INSERT INTO `knowledge_comment` VALUES (161, '很好！', '2022-01-21 13:02:02', 19, 5, 0);
INSERT INTO `knowledge_comment` VALUES (162, '非常好！', '2022-01-21 13:02:25', 19, 5, 0);
INSERT INTO `knowledge_comment` VALUES (163, '歇了', '2022-01-21 13:04:11', 107, 7, 0);
INSERT INTO `knowledge_comment` VALUES (164, '真的歇了', '2022-01-21 13:05:54', 107, 7, 0);
INSERT INTO `knowledge_comment` VALUES (165, '真的歇了', '2022-01-21 13:06:19', 107, 7, 0);
INSERT INTO `knowledge_comment` VALUES (166, '哈哈哈', '2022-01-21 13:06:20', 19, 5, 0);
INSERT INTO `knowledge_comment` VALUES (167, '好！', '2022-01-21 13:07:23', 97, 5, 0);
INSERT INTO `knowledge_comment` VALUES (168, '最后一个奋战的晚上啦！', '2022-01-21 13:09:06', 12, 9, 0);
INSERT INTO `knowledge_comment` VALUES (169, 'gg', '2022-01-21 13:10:14', 97, 5, 0);
INSERT INTO `knowledge_comment` VALUES (170, '看好了', '2022-01-21 13:11:23', 97, 5, 0);
INSERT INTO `knowledge_comment` VALUES (171, '看', '2022-01-21 13:11:36', 97, 5, 169);
INSERT INTO `knowledge_comment` VALUES (172, 'henbuc', '2022-01-21 13:13:47', 126, 5, 0);
INSERT INTO `knowledge_comment` VALUES (173, 'enen\n', '2022-01-21 13:13:54', 126, 5, 0);
INSERT INTO `knowledge_comment` VALUES (175, 'dongle', '2022-01-21 13:15:05', 126, 5, 172);
INSERT INTO `knowledge_comment` VALUES (176, '1232', '2022-01-21 13:15:08', 126, 5, 0);
INSERT INTO `knowledge_comment` VALUES (177, '评论内容测试', '2022-01-21 13:36:02', 15, 1, 0);
INSERT INTO `knowledge_comment` VALUES (178, '评论内容测试', '2022-01-21 23:33:41', 15, 1, 0);
INSERT INTO `knowledge_comment` VALUES (179, '很好', '2022-01-22 04:20:45', 59, 1, 0);
INSERT INTO `knowledge_comment` VALUES (180, '好', '2022-01-22 04:20:49', 59, 1, 0);
INSERT INTO `knowledge_comment` VALUES (182, '评论内容测试', '2022-02-24 11:09:52', 15, 1, 0);
INSERT INTO `knowledge_comment` VALUES (183, '评论内容测试', '2022-02-27 13:50:08', 15, 1, 0);
INSERT INTO `knowledge_comment` VALUES (184, '评论内容测试', '2022-03-01 12:16:16', 15, 1, 0);
INSERT INTO `knowledge_comment` VALUES (185, '有用', '2022-03-02 13:22:35', 128, 1, 0);

-- ----------------------------
-- Table structure for knowledge_depart
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_depart`;
CREATE TABLE `knowledge_depart`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `knowledge_id` bigint(0) NOT NULL,
  `depart_id` bigint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 326 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge_depart
-- ----------------------------
INSERT INTO `knowledge_depart` VALUES (1, 1, 100);
INSERT INTO `knowledge_depart` VALUES (2, 2, 101);
INSERT INTO `knowledge_depart` VALUES (3, 3, 5);
INSERT INTO `knowledge_depart` VALUES (4, 4, 1);
INSERT INTO `knowledge_depart` VALUES (5, 5, 1);
INSERT INTO `knowledge_depart` VALUES (6, 6, 2);
INSERT INTO `knowledge_depart` VALUES (7, 7, 1);
INSERT INTO `knowledge_depart` VALUES (8, 8, 2);
INSERT INTO `knowledge_depart` VALUES (9, 9, 2);
INSERT INTO `knowledge_depart` VALUES (10, 10, 103);
INSERT INTO `knowledge_depart` VALUES (11, 85, 104);
INSERT INTO `knowledge_depart` VALUES (12, 86, 105);
INSERT INTO `knowledge_depart` VALUES (13, 87, 100);
INSERT INTO `knowledge_depart` VALUES (14, 88, 101);
INSERT INTO `knowledge_depart` VALUES (15, 89, 101);
INSERT INTO `knowledge_depart` VALUES (16, 90, 100);
INSERT INTO `knowledge_depart` VALUES (17, 91, 100);
INSERT INTO `knowledge_depart` VALUES (18, 92, 100);
INSERT INTO `knowledge_depart` VALUES (19, 93, 102);
INSERT INTO `knowledge_depart` VALUES (20, 94, 101);
INSERT INTO `knowledge_depart` VALUES (21, 94, 102);
INSERT INTO `knowledge_depart` VALUES (22, 95, 100);
INSERT INTO `knowledge_depart` VALUES (23, 96, 101);
INSERT INTO `knowledge_depart` VALUES (24, 97, 100);
INSERT INTO `knowledge_depart` VALUES (25, 98, 100);
INSERT INTO `knowledge_depart` VALUES (26, 98, 107);
INSERT INTO `knowledge_depart` VALUES (27, 99, 100);
INSERT INTO `knowledge_depart` VALUES (28, 100, 100);
INSERT INTO `knowledge_depart` VALUES (29, 100, 106);
INSERT INTO `knowledge_depart` VALUES (30, 101, 100);
INSERT INTO `knowledge_depart` VALUES (31, 102, 100);
INSERT INTO `knowledge_depart` VALUES (32, 103, 100);
INSERT INTO `knowledge_depart` VALUES (33, 104, 100);
INSERT INTO `knowledge_depart` VALUES (34, 106, 100);
INSERT INTO `knowledge_depart` VALUES (35, 107, 101);
INSERT INTO `knowledge_depart` VALUES (36, 108, 100);
INSERT INTO `knowledge_depart` VALUES (37, 109, 100);
INSERT INTO `knowledge_depart` VALUES (38, 109, 104);
INSERT INTO `knowledge_depart` VALUES (39, 109, 103);
INSERT INTO `knowledge_depart` VALUES (40, 110, 100);
INSERT INTO `knowledge_depart` VALUES (41, 110, 107);
INSERT INTO `knowledge_depart` VALUES (42, 111, 100);
INSERT INTO `knowledge_depart` VALUES (43, 112, 100);
INSERT INTO `knowledge_depart` VALUES (44, 112, 105);
INSERT INTO `knowledge_depart` VALUES (45, 130, 100);
INSERT INTO `knowledge_depart` VALUES (46, 130, 105);
INSERT INTO `knowledge_depart` VALUES (47, 84, 100);
INSERT INTO `knowledge_depart` VALUES (48, 84, 101);
INSERT INTO `knowledge_depart` VALUES (49, 83, 101);
INSERT INTO `knowledge_depart` VALUES (50, 83, 106);
INSERT INTO `knowledge_depart` VALUES (51, 82, 108);
INSERT INTO `knowledge_depart` VALUES (52, 82, 103);
INSERT INTO `knowledge_depart` VALUES (53, 81, 100);
INSERT INTO `knowledge_depart` VALUES (54, 81, 102);
INSERT INTO `knowledge_depart` VALUES (55, 80, 109);
INSERT INTO `knowledge_depart` VALUES (56, 80, 108);
INSERT INTO `knowledge_depart` VALUES (61, 80, 107);
INSERT INTO `knowledge_depart` VALUES (62, 80, 106);
INSERT INTO `knowledge_depart` VALUES (63, 79, 100);
INSERT INTO `knowledge_depart` VALUES (65, 79, 107);
INSERT INTO `knowledge_depart` VALUES (67, 78, 100);
INSERT INTO `knowledge_depart` VALUES (68, 78, 101);
INSERT INTO `knowledge_depart` VALUES (69, 77, 102);
INSERT INTO `knowledge_depart` VALUES (70, 77, 103);
INSERT INTO `knowledge_depart` VALUES (71, 77, 100);
INSERT INTO `knowledge_depart` VALUES (73, 76, 100);
INSERT INTO `knowledge_depart` VALUES (74, 76, 102);
INSERT INTO `knowledge_depart` VALUES (75, 76, 101);
INSERT INTO `knowledge_depart` VALUES (76, 75, 103);
INSERT INTO `knowledge_depart` VALUES (81, 74, 100);
INSERT INTO `knowledge_depart` VALUES (82, 73, 101);
INSERT INTO `knowledge_depart` VALUES (83, 72, 100);
INSERT INTO `knowledge_depart` VALUES (84, 71, 101);
INSERT INTO `knowledge_depart` VALUES (85, 70, 100);
INSERT INTO `knowledge_depart` VALUES (87, 69, 100);
INSERT INTO `knowledge_depart` VALUES (88, 68, 100);
INSERT INTO `knowledge_depart` VALUES (89, 67, 102);
INSERT INTO `knowledge_depart` VALUES (90, 66, 102);
INSERT INTO `knowledge_depart` VALUES (91, 65, 100);
INSERT INTO `knowledge_depart` VALUES (92, 64, 101);
INSERT INTO `knowledge_depart` VALUES (93, 63, 100);
INSERT INTO `knowledge_depart` VALUES (94, 62, 101);
INSERT INTO `knowledge_depart` VALUES (100, 61, 100);
INSERT INTO `knowledge_depart` VALUES (101, 60, 100);
INSERT INTO `knowledge_depart` VALUES (102, 59, 100);
INSERT INTO `knowledge_depart` VALUES (103, 58, 100);
INSERT INTO `knowledge_depart` VALUES (104, 57, 100);
INSERT INTO `knowledge_depart` VALUES (105, 56, 101);
INSERT INTO `knowledge_depart` VALUES (107, 55, 100);
INSERT INTO `knowledge_depart` VALUES (108, 54, 100);
INSERT INTO `knowledge_depart` VALUES (109, 53, 100);
INSERT INTO `knowledge_depart` VALUES (110, 52, 100);
INSERT INTO `knowledge_depart` VALUES (111, 51, 106);
INSERT INTO `knowledge_depart` VALUES (114, 50, 100);
INSERT INTO `knowledge_depart` VALUES (115, 49, 100);
INSERT INTO `knowledge_depart` VALUES (116, 48, 100);
INSERT INTO `knowledge_depart` VALUES (118, 47, 100);
INSERT INTO `knowledge_depart` VALUES (119, 46, 100);
INSERT INTO `knowledge_depart` VALUES (120, 45, 100);
INSERT INTO `knowledge_depart` VALUES (121, 44, 104);
INSERT INTO `knowledge_depart` VALUES (122, 44, 102);
INSERT INTO `knowledge_depart` VALUES (123, 44, 100);
INSERT INTO `knowledge_depart` VALUES (124, 43, 100);
INSERT INTO `knowledge_depart` VALUES (125, 42, 101);
INSERT INTO `knowledge_depart` VALUES (126, 42, 102);
INSERT INTO `knowledge_depart` VALUES (127, 42, 100);
INSERT INTO `knowledge_depart` VALUES (128, 41, 100);
INSERT INTO `knowledge_depart` VALUES (147, 41, 103);
INSERT INTO `knowledge_depart` VALUES (148, 40, 102);
INSERT INTO `knowledge_depart` VALUES (149, 40, 101);
INSERT INTO `knowledge_depart` VALUES (150, 40, 104);
INSERT INTO `knowledge_depart` VALUES (151, 40, 105);
INSERT INTO `knowledge_depart` VALUES (152, 40, 106);
INSERT INTO `knowledge_depart` VALUES (153, 39, 103);
INSERT INTO `knowledge_depart` VALUES (154, 39, 102);
INSERT INTO `knowledge_depart` VALUES (155, 39, 101);
INSERT INTO `knowledge_depart` VALUES (156, 39, 104);
INSERT INTO `knowledge_depart` VALUES (157, 39, 105);
INSERT INTO `knowledge_depart` VALUES (158, 39, 106);
INSERT INTO `knowledge_depart` VALUES (159, 39, 100);
INSERT INTO `knowledge_depart` VALUES (160, 38, 100);
INSERT INTO `knowledge_depart` VALUES (161, 38, 101);
INSERT INTO `knowledge_depart` VALUES (162, 37, 107);
INSERT INTO `knowledge_depart` VALUES (163, 37, 100);
INSERT INTO `knowledge_depart` VALUES (164, 37, 101);
INSERT INTO `knowledge_depart` VALUES (165, 36, 100);
INSERT INTO `knowledge_depart` VALUES (166, 36, 101);
INSERT INTO `knowledge_depart` VALUES (167, 35, 102);
INSERT INTO `knowledge_depart` VALUES (168, 35, 101);
INSERT INTO `knowledge_depart` VALUES (169, 34, 103);
INSERT INTO `knowledge_depart` VALUES (170, 34, 105);
INSERT INTO `knowledge_depart` VALUES (171, 34, 101);
INSERT INTO `knowledge_depart` VALUES (172, 33, 101);
INSERT INTO `knowledge_depart` VALUES (173, 33, 102);
INSERT INTO `knowledge_depart` VALUES (174, 33, 100);
INSERT INTO `knowledge_depart` VALUES (175, 32, 100);
INSERT INTO `knowledge_depart` VALUES (176, 32, 104);
INSERT INTO `knowledge_depart` VALUES (177, 32, 103);
INSERT INTO `knowledge_depart` VALUES (178, 32, 102);
INSERT INTO `knowledge_depart` VALUES (179, 31, 100);
INSERT INTO `knowledge_depart` VALUES (180, 31, 105);
INSERT INTO `knowledge_depart` VALUES (181, 31, 104);
INSERT INTO `knowledge_depart` VALUES (182, 31, 107);
INSERT INTO `knowledge_depart` VALUES (183, 31, 101);
INSERT INTO `knowledge_depart` VALUES (184, 31, 102);
INSERT INTO `knowledge_depart` VALUES (185, 30, 102);
INSERT INTO `knowledge_depart` VALUES (186, 29, 102);
INSERT INTO `knowledge_depart` VALUES (187, 29, 101);
INSERT INTO `knowledge_depart` VALUES (188, 28, 101);
INSERT INTO `knowledge_depart` VALUES (189, 28, 100);
INSERT INTO `knowledge_depart` VALUES (190, 27, 100);
INSERT INTO `knowledge_depart` VALUES (191, 26, 100);
INSERT INTO `knowledge_depart` VALUES (192, 25, 100);
INSERT INTO `knowledge_depart` VALUES (193, 24, 101);
INSERT INTO `knowledge_depart` VALUES (194, 24, 102);
INSERT INTO `knowledge_depart` VALUES (195, 24, 100);
INSERT INTO `knowledge_depart` VALUES (196, 23, 100);
INSERT INTO `knowledge_depart` VALUES (197, 23, 101);
INSERT INTO `knowledge_depart` VALUES (198, 22, 100);
INSERT INTO `knowledge_depart` VALUES (199, 22, 101);
INSERT INTO `knowledge_depart` VALUES (200, 21, 100);
INSERT INTO `knowledge_depart` VALUES (201, 21, 102);
INSERT INTO `knowledge_depart` VALUES (202, 21, 101);
INSERT INTO `knowledge_depart` VALUES (203, 20, 101);
INSERT INTO `knowledge_depart` VALUES (204, 20, 105);
INSERT INTO `knowledge_depart` VALUES (205, 19, 100);
INSERT INTO `knowledge_depart` VALUES (206, 18, 100);
INSERT INTO `knowledge_depart` VALUES (207, 17, 100);
INSERT INTO `knowledge_depart` VALUES (209, 16, 100);
INSERT INTO `knowledge_depart` VALUES (210, 15, 100);
INSERT INTO `knowledge_depart` VALUES (211, 14, 100);
INSERT INTO `knowledge_depart` VALUES (212, 13, 100);
INSERT INTO `knowledge_depart` VALUES (213, 13, 101);
INSERT INTO `knowledge_depart` VALUES (214, 12, 101);
INSERT INTO `knowledge_depart` VALUES (215, 12, 109);
INSERT INTO `knowledge_depart` VALUES (216, 12, 106);
INSERT INTO `knowledge_depart` VALUES (217, 12, 108);
INSERT INTO `knowledge_depart` VALUES (218, 11, 101);
INSERT INTO `knowledge_depart` VALUES (219, 11, 109);
INSERT INTO `knowledge_depart` VALUES (220, 11, 106);
INSERT INTO `knowledge_depart` VALUES (221, 11, 108);
INSERT INTO `knowledge_depart` VALUES (222, 535, 100);
INSERT INTO `knowledge_depart` VALUES (223, 535, 102);
INSERT INTO `knowledge_depart` VALUES (224, 536, 104);
INSERT INTO `knowledge_depart` VALUES (225, 536, 103);
INSERT INTO `knowledge_depart` VALUES (226, 537, 101);
INSERT INTO `knowledge_depart` VALUES (227, 537, 102);
INSERT INTO `knowledge_depart` VALUES (228, 537, 103);
INSERT INTO `knowledge_depart` VALUES (229, 538, 100);
INSERT INTO `knowledge_depart` VALUES (230, 539, 100);
INSERT INTO `knowledge_depart` VALUES (239, 540, 100);
INSERT INTO `knowledge_depart` VALUES (240, 540, 101);
INSERT INTO `knowledge_depart` VALUES (241, 540, 102);
INSERT INTO `knowledge_depart` VALUES (242, 540, 103);
INSERT INTO `knowledge_depart` VALUES (243, 542, 100);
INSERT INTO `knowledge_depart` VALUES (244, 542, 101);
INSERT INTO `knowledge_depart` VALUES (247, 543, 100);
INSERT INTO `knowledge_depart` VALUES (248, 543, 101);
INSERT INTO `knowledge_depart` VALUES (250, 544, 101);
INSERT INTO `knowledge_depart` VALUES (260, 545, 100);
INSERT INTO `knowledge_depart` VALUES (265, 546, 100);
INSERT INTO `knowledge_depart` VALUES (266, 546, 101);
INSERT INTO `knowledge_depart` VALUES (269, 547, 100);
INSERT INTO `knowledge_depart` VALUES (270, 547, 101);
INSERT INTO `knowledge_depart` VALUES (271, 548, 100);
INSERT INTO `knowledge_depart` VALUES (275, 549, 100);
INSERT INTO `knowledge_depart` VALUES (276, 549, 101);
INSERT INTO `knowledge_depart` VALUES (277, 549, 102);
INSERT INTO `knowledge_depart` VALUES (278, 550, 100);
INSERT INTO `knowledge_depart` VALUES (279, 550, 102);
INSERT INTO `knowledge_depart` VALUES (280, 551, 100);
INSERT INTO `knowledge_depart` VALUES (281, 551, 102);
INSERT INTO `knowledge_depart` VALUES (284, 552, 100);
INSERT INTO `knowledge_depart` VALUES (285, 552, 104);
INSERT INTO `knowledge_depart` VALUES (286, 553, 100);
INSERT INTO `knowledge_depart` VALUES (287, 553, 101);
INSERT INTO `knowledge_depart` VALUES (288, 554, 100);
INSERT INTO `knowledge_depart` VALUES (289, 554, 101);
INSERT INTO `knowledge_depart` VALUES (290, 555, 100);
INSERT INTO `knowledge_depart` VALUES (291, 555, 107);
INSERT INTO `knowledge_depart` VALUES (292, 556, 100);
INSERT INTO `knowledge_depart` VALUES (293, 557, 100);
INSERT INTO `knowledge_depart` VALUES (294, 557, 101);
INSERT INTO `knowledge_depart` VALUES (295, 557, 105);
INSERT INTO `knowledge_depart` VALUES (296, 558, 104);
INSERT INTO `knowledge_depart` VALUES (297, 558, 103);
INSERT INTO `knowledge_depart` VALUES (298, 12, 103);
INSERT INTO `knowledge_depart` VALUES (299, 12, 104);
INSERT INTO `knowledge_depart` VALUES (300, 12, 105);
INSERT INTO `knowledge_depart` VALUES (303, 559, 100);
INSERT INTO `knowledge_depart` VALUES (304, 559, 104);
INSERT INTO `knowledge_depart` VALUES (307, 560, 100);
INSERT INTO `knowledge_depart` VALUES (308, 560, 103);
INSERT INTO `knowledge_depart` VALUES (311, 561, 100);
INSERT INTO `knowledge_depart` VALUES (312, 561, 101);
INSERT INTO `knowledge_depart` VALUES (313, 12, 103);
INSERT INTO `knowledge_depart` VALUES (314, 12, 104);
INSERT INTO `knowledge_depart` VALUES (315, 12, 105);
INSERT INTO `knowledge_depart` VALUES (316, 562, 100);
INSERT INTO `knowledge_depart` VALUES (317, 12, 103);
INSERT INTO `knowledge_depart` VALUES (318, 12, 104);
INSERT INTO `knowledge_depart` VALUES (319, 12, 105);
INSERT INTO `knowledge_depart` VALUES (320, 12, 103);
INSERT INTO `knowledge_depart` VALUES (321, 12, 104);
INSERT INTO `knowledge_depart` VALUES (322, 12, 105);
INSERT INTO `knowledge_depart` VALUES (323, 12, 103);
INSERT INTO `knowledge_depart` VALUES (324, 12, 104);
INSERT INTO `knowledge_depart` VALUES (325, 12, 105);

-- ----------------------------
-- Table structure for knowledge_likes
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_likes`;
CREATE TABLE `knowledge_likes`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `knowledge_id` bigint(0) NOT NULL COMMENT '知识id',
  `like_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '点赞时间',
  PRIMARY KEY (`id`, `user_id`, `knowledge_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 162 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge_likes
-- ----------------------------
INSERT INTO `knowledge_likes` VALUES (2, 1, 14, '2022-01-06 09:03:23');
INSERT INTO `knowledge_likes` VALUES (3, 3, 16, '2022-01-06 09:03:38');
INSERT INTO `knowledge_likes` VALUES (4, 2, 11, '2022-01-10 10:00:36');
INSERT INTO `knowledge_likes` VALUES (5, 2, 12, '2022-01-10 10:00:49');
INSERT INTO `knowledge_likes` VALUES (6, 2, 15, '2022-01-10 10:01:02');
INSERT INTO `knowledge_likes` VALUES (7, 2, 16, '2022-01-10 10:01:11');
INSERT INTO `knowledge_likes` VALUES (8, 3, 16, '2022-01-10 10:01:17');
INSERT INTO `knowledge_likes` VALUES (9, 4, 17, '2022-01-10 10:01:27');
INSERT INTO `knowledge_likes` VALUES (10, 5, 18, '2022-01-10 10:01:38');
INSERT INTO `knowledge_likes` VALUES (11, 4, 18, '2022-01-10 10:01:45');
INSERT INTO `knowledge_likes` VALUES (12, 5, 19, '2022-01-10 10:02:00');
INSERT INTO `knowledge_likes` VALUES (13, 6, 20, '2022-01-10 10:02:08');
INSERT INTO `knowledge_likes` VALUES (14, 7, 23, '2022-01-10 10:02:29');
INSERT INTO `knowledge_likes` VALUES (15, 3, 24, '2022-01-10 10:03:19');
INSERT INTO `knowledge_likes` VALUES (16, 2, 25, '2022-01-10 10:03:26');
INSERT INTO `knowledge_likes` VALUES (17, 5, 26, '2022-01-10 10:03:34');
INSERT INTO `knowledge_likes` VALUES (18, 6, 27, '2022-01-10 10:03:39');
INSERT INTO `knowledge_likes` VALUES (19, 4, 28, '2022-01-10 10:03:45');
INSERT INTO `knowledge_likes` VALUES (20, 5, 29, '2022-01-10 10:03:51');
INSERT INTO `knowledge_likes` VALUES (21, 7, 30, '2022-01-10 10:03:58');
INSERT INTO `knowledge_likes` VALUES (88, 1, 11, '2022-01-15 07:12:03');
INSERT INTO `knowledge_likes` VALUES (91, 1, 100, '2022-01-18 03:03:19');
INSERT INTO `knowledge_likes` VALUES (92, 1, 90, '2022-01-18 03:03:52');
INSERT INTO `knowledge_likes` VALUES (111, 9, 80, '2022-01-18 09:28:35');
INSERT INTO `knowledge_likes` VALUES (112, 9, 70, '2022-01-18 09:28:42');
INSERT INTO `knowledge_likes` VALUES (113, 1, 66, '2022-01-18 12:12:26');
INSERT INTO `knowledge_likes` VALUES (114, 6, 78, '2022-01-19 02:00:13');
INSERT INTO `knowledge_likes` VALUES (115, 5, 40, '2022-01-19 02:12:34');
INSERT INTO `knowledge_likes` VALUES (117, 1, 50, '2022-01-19 03:08:17');
INSERT INTO `knowledge_likes` VALUES (119, 9, 55, '2022-01-19 08:33:27');
INSERT INTO `knowledge_likes` VALUES (120, 8, 65, '2022-01-19 09:41:30');
INSERT INTO `knowledge_likes` VALUES (121, 8, 90, '2022-01-19 09:41:35');
INSERT INTO `knowledge_likes` VALUES (123, 5, 69, '2022-01-20 06:56:43');
INSERT INTO `knowledge_likes` VALUES (124, 5, 52, '2022-01-20 07:24:53');
INSERT INTO `knowledge_likes` VALUES (125, 5, 122, '2022-01-20 07:25:38');
INSERT INTO `knowledge_likes` VALUES (126, 1, 92, '2022-01-20 11:16:10');
INSERT INTO `knowledge_likes` VALUES (132, 8, 58, '2022-01-20 11:20:08');
INSERT INTO `knowledge_likes` VALUES (133, 8, 107, '2022-01-20 11:21:47');
INSERT INTO `knowledge_likes` VALUES (134, 8, 36, '2022-01-20 11:22:58');
INSERT INTO `knowledge_likes` VALUES (135, 8, 42, '2022-01-20 11:23:56');
INSERT INTO `knowledge_likes` VALUES (137, 4, 123, '2022-01-21 02:36:35');
INSERT INTO `knowledge_likes` VALUES (138, 4, 118, '2022-01-21 02:36:56');
INSERT INTO `knowledge_likes` VALUES (139, 4, 34, '2022-01-21 02:37:20');
INSERT INTO `knowledge_likes` VALUES (141, 5, 548, '2022-01-21 03:39:33');
INSERT INTO `knowledge_likes` VALUES (142, 6, 122, '2022-01-21 04:07:21');
INSERT INTO `knowledge_likes` VALUES (143, 4, 130, '2022-01-21 07:11:59');
INSERT INTO `knowledge_likes` VALUES (144, 4, 548, '2022-01-21 11:51:41');
INSERT INTO `knowledge_likes` VALUES (146, 5, 128, '2022-01-21 12:31:13');
INSERT INTO `knowledge_likes` VALUES (149, 5, 126, '2022-01-21 13:15:13');
INSERT INTO `knowledge_likes` VALUES (150, 5, 9, '2022-01-21 13:17:35');
INSERT INTO `knowledge_likes` VALUES (154, 4, 128, '2022-01-21 14:32:20');
INSERT INTO `knowledge_likes` VALUES (156, 5, 100, '2022-01-22 02:01:15');
INSERT INTO `knowledge_likes` VALUES (159, 1, 10, '2022-02-25 12:25:34');

-- ----------------------------
-- Table structure for knowledge_rank_setting
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_rank_setting`;
CREATE TABLE `knowledge_rank_setting`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '知识推荐设置参数表主键',
  `limit_time` int(0) NOT NULL DEFAULT 7 COMMENT '设置7天、一个月、半年、一年',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '1代表浏览量、2代表点赞量、3代表收藏量',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge_rank_setting
-- ----------------------------
INSERT INTO `knowledge_rank_setting` VALUES (1, 365, '1', 1);
INSERT INTO `knowledge_rank_setting` VALUES (2, 7, '1', 2);
INSERT INTO `knowledge_rank_setting` VALUES (3, 30, '1', 3);
INSERT INTO `knowledge_rank_setting` VALUES (4, 180, '2', 4);
INSERT INTO `knowledge_rank_setting` VALUES (5, 365, '1', 5);
INSERT INTO `knowledge_rank_setting` VALUES (6, 7, '3', 6);
INSERT INTO `knowledge_rank_setting` VALUES (7, 30, '3', 7);
INSERT INTO `knowledge_rank_setting` VALUES (8, 7, '3', 8);
INSERT INTO `knowledge_rank_setting` VALUES (9, 180, '2', 9);
INSERT INTO `knowledge_rank_setting` VALUES (10, 365, '3', 10);
INSERT INTO `knowledge_rank_setting` VALUES (11, 7, '1', 11);

-- ----------------------------
-- Table structure for knowledge_tag
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_tag`;
CREATE TABLE `knowledge_tag`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `knowledge_id` bigint(0) NOT NULL,
  `tag_id` bigint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `konwledge_id`(`knowledge_id`) USING BTREE,
  INDEX `tag_id`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 261 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge_tag
-- ----------------------------
INSERT INTO `knowledge_tag` VALUES (1, 22, 1);
INSERT INTO `knowledge_tag` VALUES (2, 23, 2);
INSERT INTO `knowledge_tag` VALUES (3, 23, 3);
INSERT INTO `knowledge_tag` VALUES (4, 24, 4);
INSERT INTO `knowledge_tag` VALUES (5, 25, 5);
INSERT INTO `knowledge_tag` VALUES (6, 26, 6);
INSERT INTO `knowledge_tag` VALUES (7, 27, 7);
INSERT INTO `knowledge_tag` VALUES (8, 28, 8);
INSERT INTO `knowledge_tag` VALUES (9, 29, 9);
INSERT INTO `knowledge_tag` VALUES (10, 30, 5);
INSERT INTO `knowledge_tag` VALUES (11, 31, 1);
INSERT INTO `knowledge_tag` VALUES (12, 32, 3);
INSERT INTO `knowledge_tag` VALUES (13, 33, 4);
INSERT INTO `knowledge_tag` VALUES (14, 34, 4);
INSERT INTO `knowledge_tag` VALUES (15, 35, 14);
INSERT INTO `knowledge_tag` VALUES (16, 1, 1);
INSERT INTO `knowledge_tag` VALUES (17, 1, 2);
INSERT INTO `knowledge_tag` VALUES (18, 2, 1);
INSERT INTO `knowledge_tag` VALUES (19, 3, 1);
INSERT INTO `knowledge_tag` VALUES (20, 4, 1);
INSERT INTO `knowledge_tag` VALUES (21, 5, 1);
INSERT INTO `knowledge_tag` VALUES (22, 5, 2);
INSERT INTO `knowledge_tag` VALUES (23, 6, 1);
INSERT INTO `knowledge_tag` VALUES (24, 7, 1);
INSERT INTO `knowledge_tag` VALUES (25, 8, 1);
INSERT INTO `knowledge_tag` VALUES (26, 9, 1);
INSERT INTO `knowledge_tag` VALUES (27, 9, 4);
INSERT INTO `knowledge_tag` VALUES (28, 10, 1);
INSERT INTO `knowledge_tag` VALUES (29, 10, 5);
INSERT INTO `knowledge_tag` VALUES (30, 11, 1);
INSERT INTO `knowledge_tag` VALUES (31, 11, 2);
INSERT INTO `knowledge_tag` VALUES (32, 11, 3);
INSERT INTO `knowledge_tag` VALUES (33, 12, 1);
INSERT INTO `knowledge_tag` VALUES (34, 12, 2);
INSERT INTO `knowledge_tag` VALUES (35, 13, 1);
INSERT INTO `knowledge_tag` VALUES (36, 14, 1);
INSERT INTO `knowledge_tag` VALUES (37, 15, 1);
INSERT INTO `knowledge_tag` VALUES (38, 16, 1);
INSERT INTO `knowledge_tag` VALUES (39, 16, 2);
INSERT INTO `knowledge_tag` VALUES (40, 17, 1);
INSERT INTO `knowledge_tag` VALUES (41, 17, 2);
INSERT INTO `knowledge_tag` VALUES (42, 18, 1);
INSERT INTO `knowledge_tag` VALUES (43, 18, 5);
INSERT INTO `knowledge_tag` VALUES (44, 19, 1);
INSERT INTO `knowledge_tag` VALUES (45, 20, 2);
INSERT INTO `knowledge_tag` VALUES (46, 21, 1);
INSERT INTO `knowledge_tag` VALUES (47, 44, 1);
INSERT INTO `knowledge_tag` VALUES (48, 44, 3);
INSERT INTO `knowledge_tag` VALUES (49, 45, 4);
INSERT INTO `knowledge_tag` VALUES (50, 46, 15);
INSERT INTO `knowledge_tag` VALUES (51, 47, 1);
INSERT INTO `knowledge_tag` VALUES (52, 48, 1);
INSERT INTO `knowledge_tag` VALUES (53, 49, 1);
INSERT INTO `knowledge_tag` VALUES (54, 50, 1);
INSERT INTO `knowledge_tag` VALUES (55, 51, 1);
INSERT INTO `knowledge_tag` VALUES (56, 52, 2);
INSERT INTO `knowledge_tag` VALUES (57, 53, 2);
INSERT INTO `knowledge_tag` VALUES (58, 54, 1);
INSERT INTO `knowledge_tag` VALUES (62, 55, 1);
INSERT INTO `knowledge_tag` VALUES (63, 56, 1);
INSERT INTO `knowledge_tag` VALUES (65, 57, 1);
INSERT INTO `knowledge_tag` VALUES (67, 58, 1);
INSERT INTO `knowledge_tag` VALUES (68, 59, 1);
INSERT INTO `knowledge_tag` VALUES (70, 60, 1);
INSERT INTO `knowledge_tag` VALUES (71, 61, 1);
INSERT INTO `knowledge_tag` VALUES (74, 62, 1);
INSERT INTO `knowledge_tag` VALUES (75, 63, 1);
INSERT INTO `knowledge_tag` VALUES (76, 64, 1);
INSERT INTO `knowledge_tag` VALUES (78, 65, 2);
INSERT INTO `knowledge_tag` VALUES (79, 66, 2);
INSERT INTO `knowledge_tag` VALUES (80, 67, 4);
INSERT INTO `knowledge_tag` VALUES (81, 68, 4);
INSERT INTO `knowledge_tag` VALUES (82, 69, 4);
INSERT INTO `knowledge_tag` VALUES (83, 70, 4);
INSERT INTO `knowledge_tag` VALUES (89, 71, 3);
INSERT INTO `knowledge_tag` VALUES (90, 72, 3);
INSERT INTO `knowledge_tag` VALUES (91, 73, 1);
INSERT INTO `knowledge_tag` VALUES (92, 74, 3);
INSERT INTO `knowledge_tag` VALUES (93, 75, 1);
INSERT INTO `knowledge_tag` VALUES (94, 76, 2);
INSERT INTO `knowledge_tag` VALUES (96, 77, 1);
INSERT INTO `knowledge_tag` VALUES (97, 78, 1);
INSERT INTO `knowledge_tag` VALUES (98, 79, 1);
INSERT INTO `knowledge_tag` VALUES (99, 80, 3);
INSERT INTO `knowledge_tag` VALUES (100, 81, 1);
INSERT INTO `knowledge_tag` VALUES (103, 82, 1);
INSERT INTO `knowledge_tag` VALUES (104, 83, 1);
INSERT INTO `knowledge_tag` VALUES (105, 84, 1);
INSERT INTO `knowledge_tag` VALUES (107, 85, 1);
INSERT INTO `knowledge_tag` VALUES (108, 86, 2);
INSERT INTO `knowledge_tag` VALUES (109, 87, 1);
INSERT INTO `knowledge_tag` VALUES (110, 88, 1);
INSERT INTO `knowledge_tag` VALUES (111, 89, 3);
INSERT INTO `knowledge_tag` VALUES (112, 90, 1);
INSERT INTO `knowledge_tag` VALUES (113, 91, 3);
INSERT INTO `knowledge_tag` VALUES (114, 92, 1);
INSERT INTO `knowledge_tag` VALUES (115, 93, 1);
INSERT INTO `knowledge_tag` VALUES (117, 94, 1);
INSERT INTO `knowledge_tag` VALUES (118, 95, 2);
INSERT INTO `knowledge_tag` VALUES (120, 96, 4);
INSERT INTO `knowledge_tag` VALUES (122, 97, 1);
INSERT INTO `knowledge_tag` VALUES (123, 98, 1);
INSERT INTO `knowledge_tag` VALUES (124, 99, 2);
INSERT INTO `knowledge_tag` VALUES (125, 100, 1);
INSERT INTO `knowledge_tag` VALUES (126, 101, 7);
INSERT INTO `knowledge_tag` VALUES (127, 102, 6);
INSERT INTO `knowledge_tag` VALUES (128, 103, 2);
INSERT INTO `knowledge_tag` VALUES (129, 104, 2);
INSERT INTO `knowledge_tag` VALUES (130, 105, 1);
INSERT INTO `knowledge_tag` VALUES (131, 106, 3);
INSERT INTO `knowledge_tag` VALUES (132, 107, 4);
INSERT INTO `knowledge_tag` VALUES (133, 108, 5);
INSERT INTO `knowledge_tag` VALUES (134, 108, 1);
INSERT INTO `knowledge_tag` VALUES (135, 109, 1);
INSERT INTO `knowledge_tag` VALUES (136, 109, 6);
INSERT INTO `knowledge_tag` VALUES (137, 110, 6);
INSERT INTO `knowledge_tag` VALUES (138, 110, 4);
INSERT INTO `knowledge_tag` VALUES (139, 111, 4);
INSERT INTO `knowledge_tag` VALUES (140, 112, 1);
INSERT INTO `knowledge_tag` VALUES (141, 113, 1);
INSERT INTO `knowledge_tag` VALUES (142, 114, 1);
INSERT INTO `knowledge_tag` VALUES (143, 115, 1);
INSERT INTO `knowledge_tag` VALUES (144, 116, 2);
INSERT INTO `knowledge_tag` VALUES (145, 116, 1);
INSERT INTO `knowledge_tag` VALUES (146, 117, 2);
INSERT INTO `knowledge_tag` VALUES (147, 117, 1);
INSERT INTO `knowledge_tag` VALUES (148, 118, 1);
INSERT INTO `knowledge_tag` VALUES (149, 118, 2);
INSERT INTO `knowledge_tag` VALUES (150, 119, 2);
INSERT INTO `knowledge_tag` VALUES (151, 120, 7);
INSERT INTO `knowledge_tag` VALUES (152, 120, 8);
INSERT INTO `knowledge_tag` VALUES (153, 120, 1);
INSERT INTO `knowledge_tag` VALUES (154, 121, 1);
INSERT INTO `knowledge_tag` VALUES (155, 122, 3);
INSERT INTO `knowledge_tag` VALUES (156, 122, 1);
INSERT INTO `knowledge_tag` VALUES (157, 123, 1);
INSERT INTO `knowledge_tag` VALUES (158, 124, 1);
INSERT INTO `knowledge_tag` VALUES (161, 125, 1);
INSERT INTO `knowledge_tag` VALUES (162, 126, 2);
INSERT INTO `knowledge_tag` VALUES (163, 126, 1);
INSERT INTO `knowledge_tag` VALUES (164, 127, 1);
INSERT INTO `knowledge_tag` VALUES (165, 128, 2);
INSERT INTO `knowledge_tag` VALUES (166, 128, 1);
INSERT INTO `knowledge_tag` VALUES (167, 129, 1);
INSERT INTO `knowledge_tag` VALUES (168, 130, 1);
INSERT INTO `knowledge_tag` VALUES (169, 534, 1);
INSERT INTO `knowledge_tag` VALUES (170, 535, 1);
INSERT INTO `knowledge_tag` VALUES (171, 536, 10);
INSERT INTO `knowledge_tag` VALUES (172, 537, 6);
INSERT INTO `knowledge_tag` VALUES (173, 537, 18);
INSERT INTO `knowledge_tag` VALUES (174, 36, 4);
INSERT INTO `knowledge_tag` VALUES (175, 37, 6);
INSERT INTO `knowledge_tag` VALUES (176, 38, 9);
INSERT INTO `knowledge_tag` VALUES (177, 39, 7);
INSERT INTO `knowledge_tag` VALUES (178, 40, 6);
INSERT INTO `knowledge_tag` VALUES (179, 41, 4);
INSERT INTO `knowledge_tag` VALUES (180, 42, 7);
INSERT INTO `knowledge_tag` VALUES (181, 43, 9);
INSERT INTO `knowledge_tag` VALUES (182, 538, 1);
INSERT INTO `knowledge_tag` VALUES (183, 538, 5);
INSERT INTO `knowledge_tag` VALUES (184, 539, 1);
INSERT INTO `knowledge_tag` VALUES (185, 539, 5);
INSERT INTO `knowledge_tag` VALUES (190, 540, 1);
INSERT INTO `knowledge_tag` VALUES (191, 540, 6);
INSERT INTO `knowledge_tag` VALUES (192, 542, 1);
INSERT INTO `knowledge_tag` VALUES (193, 542, 6);
INSERT INTO `knowledge_tag` VALUES (194, 542, 18);
INSERT INTO `knowledge_tag` VALUES (197, 543, 5);
INSERT INTO `knowledge_tag` VALUES (198, 543, 7);
INSERT INTO `knowledge_tag` VALUES (200, 544, 1);
INSERT INTO `knowledge_tag` VALUES (210, 545, 1);
INSERT INTO `knowledge_tag` VALUES (213, 546, 1);
INSERT INTO `knowledge_tag` VALUES (215, 547, 1);
INSERT INTO `knowledge_tag` VALUES (216, 548, 11);
INSERT INTO `knowledge_tag` VALUES (219, 549, 1);
INSERT INTO `knowledge_tag` VALUES (220, 549, 5);
INSERT INTO `knowledge_tag` VALUES (221, 550, 1);
INSERT INTO `knowledge_tag` VALUES (222, 550, 9);
INSERT INTO `knowledge_tag` VALUES (223, 551, 1);
INSERT INTO `knowledge_tag` VALUES (224, 551, 9);
INSERT INTO `knowledge_tag` VALUES (226, 552, 11);
INSERT INTO `knowledge_tag` VALUES (227, 553, 1);
INSERT INTO `knowledge_tag` VALUES (228, 554, 2);
INSERT INTO `knowledge_tag` VALUES (229, 554, 1);
INSERT INTO `knowledge_tag` VALUES (230, 555, 1);
INSERT INTO `knowledge_tag` VALUES (231, 556, 1);
INSERT INTO `knowledge_tag` VALUES (232, 556, 19);
INSERT INTO `knowledge_tag` VALUES (233, 557, 1);
INSERT INTO `knowledge_tag` VALUES (234, 557, 8);
INSERT INTO `knowledge_tag` VALUES (235, 558, 1);
INSERT INTO `knowledge_tag` VALUES (236, 558, 2);
INSERT INTO `knowledge_tag` VALUES (237, 558, 9);
INSERT INTO `knowledge_tag` VALUES (238, 15, 1);
INSERT INTO `knowledge_tag` VALUES (239, 15, 3);
INSERT INTO `knowledge_tag` VALUES (240, 15, 4);
INSERT INTO `knowledge_tag` VALUES (242, 559, 11);
INSERT INTO `knowledge_tag` VALUES (244, 560, 11);
INSERT INTO `knowledge_tag` VALUES (246, 561, 12);
INSERT INTO `knowledge_tag` VALUES (247, 15, 1);
INSERT INTO `knowledge_tag` VALUES (248, 15, 3);
INSERT INTO `knowledge_tag` VALUES (249, 15, 4);
INSERT INTO `knowledge_tag` VALUES (250, 562, 1);
INSERT INTO `knowledge_tag` VALUES (251, 562, 2);
INSERT INTO `knowledge_tag` VALUES (252, 15, 1);
INSERT INTO `knowledge_tag` VALUES (253, 15, 3);
INSERT INTO `knowledge_tag` VALUES (254, 15, 4);
INSERT INTO `knowledge_tag` VALUES (255, 15, 1);
INSERT INTO `knowledge_tag` VALUES (256, 15, 3);
INSERT INTO `knowledge_tag` VALUES (257, 15, 4);
INSERT INTO `knowledge_tag` VALUES (258, 15, 1);
INSERT INTO `knowledge_tag` VALUES (259, 15, 3);
INSERT INTO `knowledge_tag` VALUES (260, 15, 4);

-- ----------------------------
-- Table structure for knowledge_ticket
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_ticket`;
CREATE TABLE `knowledge_ticket`  (
  `knowledge_id` bigint(0) NOT NULL COMMENT '知识id',
  `ticket_id` bigint(0) NOT NULL COMMENT '工单id',
  PRIMARY KEY (`knowledge_id`, `ticket_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge_ticket
-- ----------------------------
INSERT INTO `knowledge_ticket` VALUES (2, 5);
INSERT INTO `knowledge_ticket` VALUES (19, 31);
INSERT INTO `knowledge_ticket` VALUES (34, 27);
INSERT INTO `knowledge_ticket` VALUES (38, 33);
INSERT INTO `knowledge_ticket` VALUES (39, 30);
INSERT INTO `knowledge_ticket` VALUES (39, 34);
INSERT INTO `knowledge_ticket` VALUES (90, 27);
INSERT INTO `knowledge_ticket` VALUES (91, 24);
INSERT INTO `knowledge_ticket` VALUES (92, 24);
INSERT INTO `knowledge_ticket` VALUES (99, 28);
INSERT INTO `knowledge_ticket` VALUES (119, 45);
INSERT INTO `knowledge_ticket` VALUES (122, 37);
INSERT INTO `knowledge_ticket` VALUES (128, 48);
INSERT INTO `knowledge_ticket` VALUES (548, 40);
INSERT INTO `knowledge_ticket` VALUES (549, 47);
INSERT INTO `knowledge_ticket` VALUES (561, 61);
INSERT INTO `knowledge_ticket` VALUES (562, 34);

-- ----------------------------
-- Table structure for knowledge_version
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_version`;
CREATE TABLE `knowledge_version`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `version_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本名称',
  `knowledge_id` bigint(0) NULL DEFAULT NULL COMMENT '知识id',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '版本创建时间',
  `creator_id` bigint(0) NULL DEFAULT NULL COMMENT '创建者id',
  `newversion_id` int(0) NULL DEFAULT NULL COMMENT '最新版本id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge_version
-- ----------------------------
INSERT INTO `knowledge_version` VALUES (1, '1.0', 11, '2022-01-04 21:18:00', 1, NULL);
INSERT INTO `knowledge_version` VALUES (2, '1.1', 12, '2022-01-04 21:24:05', 1, NULL);
INSERT INTO `knowledge_version` VALUES (3, '1.0', 13, '2022-01-04 16:24:54', 1, NULL);
INSERT INTO `knowledge_version` VALUES (4, '1.0', 14, '2022-01-04 16:25:20', 1, NULL);
INSERT INTO `knowledge_version` VALUES (5, '1.1', 13, '2022-01-05 16:25:42', 1, NULL);
INSERT INTO `knowledge_version` VALUES (6, '1.0', 16, '2022-01-03 16:26:17', 2, NULL);
INSERT INTO `knowledge_version` VALUES (7, '1.1', 16, '2022-01-04 16:27:00', 2, NULL);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '公告状态 0正常 1关闭',
  `creator_id` bigint(0) NOT NULL COMMENT '创建者id',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `valid_time` timestamp(0) NOT NULL DEFAULT '2038-01-19 03:14:07' COMMENT '截止时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '套餐加量', '阿萨法卫斯理和非u而后覅u使得埃斯基哦按时间', 1, 1, '2022-01-07 21:19:01', '2022-01-30 21:19:03');
INSERT INTO `notice` VALUES (2, '套餐降价', '降价了！！！', 1, 1, '2022-01-04 21:23:31', '2022-01-30 21:23:33');
INSERT INTO `notice` VALUES (3, '流量赠送', '免费送流量了！！', 0, 1, '2022-01-06 16:19:40', '2022-02-06 16:19:55');
INSERT INTO `notice` VALUES (4, '星级服务', '享受星级服务', 0, 2, '2022-01-05 16:21:39', '2022-02-06 16:21:53');
INSERT INTO `notice` VALUES (5, '实名补登记', '开始补登记', 0, 2, '2022-01-06 16:22:52', '2022-03-06 16:22:56');
INSERT INTO `notice` VALUES (6, '积分查询', '欢迎查询积分', 0, 2, '2022-01-06 16:23:57', '2022-01-06 16:24:11');

-- ----------------------------
-- Table structure for source
-- ----------------------------
DROP TABLE IF EXISTS `source`;
CREATE TABLE `source`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of source
-- ----------------------------
INSERT INTO `source` VALUES (1, '公众号');
INSERT INTO `source` VALUES (2, '人民网');
INSERT INTO `source` VALUES (3, '中国日报网');
INSERT INTO `source` VALUES (4, '光明网');
INSERT INTO `source` VALUES (5, '新华网');
INSERT INTO `source` VALUES (6, '中华网');
INSERT INTO `source` VALUES (7, '新浪网');
INSERT INTO `source` VALUES (8, '环球网');
INSERT INTO `source` VALUES (9, '工信部');
INSERT INTO `source` VALUES (10, '司法部');
INSERT INTO `source` VALUES (11, '人民邮电报');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '客服部门', 0, '李洛', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-06 01:56:14', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '文化部门', 1, '楠晗', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-06 01:56:14', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '监察部门', 2, '萧炎', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-06 01:56:15', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '林动', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-06 01:56:16', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '楚风', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-06 01:56:17', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, 'hangover', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-06 01:56:17', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, 'shmily', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-06 01:56:18', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '季风', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-06 01:56:19', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '技术部门', 1, '王梦', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-06 01:56:19', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '采购部门', 2, '张若尘', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-06 01:56:20', '', NULL);

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1114 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1124, '2019212682', '36.5.61.82', '安徽省 合肥市', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-02 12:17:35');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1077 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', '', 1, 0, 'M', '0', '0', 'system', 'system', 'admin', '2022-01-13 02:43:32', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '业务管理', 0, 0, '', NULL, 1, 0, 'M', '0', '0', 'business', '#', 'admin', '2022-01-13 02:47:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-01-13 02:45:45', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-01-13 02:45:45', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-01-13 02:45:45', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (105, '反馈管理', 2, 3, '', NULL, 1, 0, 'C', '0', '0', 'business:feedback:list', '#', 'admin', '2022-01-13 02:47:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (106, '工单管理', 2, 1, '', NULL, 1, 0, 'C', '0', '0', 'business:ticket:list', '#', 'admin', '2022-01-13 02:47:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (107, '知识管理', 1, 0, '', NULL, 1, 0, 'C', '0', '0', 'business:knowledge:list', '#', 'admin', '2022-01-13 02:47:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', 1, 0, 'M', '0', '0', 'system:log:list', 'log', 'admin', '2022-01-13 02:47:59', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:query', 'form', 'admin', '2022-01-13 02:49:02', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:query', 'logininfor', 'admin', '2022-01-13 02:49:02', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-01-13 02:32:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-01-13 02:32:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-01-13 02:33:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-01-13 02:33:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-01-13 02:33:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-01-13 02:39:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-01-13 02:39:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-01-13 02:39:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-01-13 02:39:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-01-13 02:40:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-01-13 02:40:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-01-13 02:40:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-01-13 02:40:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-01-13 02:42:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-01-13 02:42:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-01-13 02:42:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-01-13 02:42:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '反馈新赠', 105, 0, '', NULL, 1, 0, 'F', '0', '0', 'business:feedback:add', '#', 'admin', '2022-01-13 02:47:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '反馈查询', 105, 0, '', NULL, 1, 0, 'F', '0', '0', 'business:feedback:query', '#', 'admin', '2022-01-13 02:47:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '反馈处理', 105, 0, '', NULL, 1, 0, 'F', '0', '0', 'business:feedback:audit', '#', 'admin', '2022-01-13 02:47:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '工单新赠', 106, 0, '', NULL, 1, 0, 'F', '0', '0', 'business:ticket:add', '#', 'admin', '2022-01-13 02:47:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1062, '工单查询', 106, 1, '', NULL, 1, 0, 'F', '0', '0', 'business:ticket:query', '#', 'admin', '2022-01-13 02:47:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1063, '工单审核', 106, 2, '', NULL, 1, 0, 'F', '0', '0', 'business:ticket:audit', '#', 'admin', '2022-01-13 02:47:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1071, '知识查询', 107, 0, '', NULL, 1, 0, 'F', '0', '0', 'business:knowledge:query', '#', 'admin', '2022-01-13 02:47:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1072, '知识新赠', 107, 1, '', NULL, 1, 0, 'F', '0', '0', 'business:knowledge:add', '#', 'admin', '2022-01-13 02:47:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1073, '知识修改', 107, 2, '', NULL, 1, 0, 'F', '0', '0', 'business:knowledge:edit', '#', 'admin', '2022-01-13 02:47:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1074, '知识删除', 107, 3, '', NULL, 1, 0, 'F', '0', '0', 'business:knowledge:remove', '#', 'admin', '2022-01-13 02:47:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1075, '知识审核', 107, 4, '', NULL, 1, 0, 'F', '0', '0', 'business:knowledge:audit', '#', 'admin', '2022-01-13 02:47:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1076, '发布知识查看', 107, 0, '', NULL, 1, 0, 'F', '0', '0', 'business:knowledge:individual:query', '#', 'admin', '2022-01-13 02:47:59', '', NULL, '');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (3109, '评论', 1, 'com.nyanner.govii.elementary.controller.knowledge.UserCommentController.addComment()', 'POST', 1, 'admin', NULL, '/api/comment/addComment', '36.5.61.82', '安徽省 合肥市', '{\"knowledgeId\":128,\"userId\":1,\"content\":\"有用\",\"parentId\":0}', '{\"error\":0}', 0, NULL, '2022-03-02 13:22:35');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-01-13 02:50:59', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '客服人员', 'staff', 2, '1', 1, 1, '0', '0', 'admin', '2022-01-13 09:50:34', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (3, '知识采编员', 'editor', 3, '1', 1, 1, '0', '0', 'admin', '2022-01-13 09:52:57', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (4, '知识审核员', 'knowledge_auditor', 4, '1', 1, 1, '0', '0', 'admin', '2022-01-13 09:53:40', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (5, '工单审核员', 'ticket_auditor', 5, '1', 1, 1, '0', '0', 'admin', '2022-01-13 09:54:29', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (6, '反馈处理员', 'feedback_process', 6, '1', 1, 1, '0', '0', 'admin', '2022-01-18 08:09:44', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (8, '测试员2', 'test02', 8, '1', 1, 1, '0', '0', 'admin', '2022-01-20 06:28:11', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (9, '测试员3', 'test03', 9, '1', 1, 1, '0', '0', 'admin', '2022-01-20 06:28:36', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (10, '测试员4', 'test04', 10, '1', 1, 1, '0', '0', 'admin', '2022-01-20 06:28:58', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1061);
INSERT INTO `sys_role_menu` VALUES (3, 1062);
INSERT INTO `sys_role_menu` VALUES (3, 1071);
INSERT INTO `sys_role_menu` VALUES (3, 1072);
INSERT INTO `sys_role_menu` VALUES (3, 1073);
INSERT INTO `sys_role_menu` VALUES (3, 1074);
INSERT INTO `sys_role_menu` VALUES (3, 1076);
INSERT INTO `sys_role_menu` VALUES (4, 1061);
INSERT INTO `sys_role_menu` VALUES (4, 1075);
INSERT INTO `sys_role_menu` VALUES (5, 1063);
INSERT INTO `sys_role_menu` VALUES (6, 1052);
INSERT INTO `sys_role_menu` VALUES (6, 1053);
INSERT INTO `sys_role_menu` VALUES (6, 1061);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'hangover', '00', '1791479155@qq.com', '15888888888', '1', 'https://q.qlogo.cn/g?b=qq&nk=3189019385&s=100', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-01-06 01:56:22', 'admin', '2022-01-06 01:56:22', '', '2022-01-21 14:10:28', 'NY2Ch1');
INSERT INTO `sys_user` VALUES (2, 105, 'user1', 'gangofSeven', '00', 'gangofSeven@qq.com', '15666666666', '1', 'https://q.qlogo.cn/g?b=qq&nk=1265205686&s=100', '$2a$10$/9uhAX7A8qllCT3qGJJgBOMZZyVAHZfaFnjbN991QxTuDh9Kxu2u.', '0', '0', '127.0.0.1', '2022-01-06 01:56:23', 'admin', '2022-01-06 01:56:22', 'admin', '2022-01-21 13:47:55', '测试员');
INSERT INTO `sys_user` VALUES (3, 101, 'zhaohaotian', 'zht', '00', '1731990711@qq.com', '15124567464', '0', 'https://q.qlogo.cn/g?b=qq&nk=1731990711&s=100', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-01-06 01:56:23', 'admin', '2022-01-06 01:56:22', 'zhaohaotian', '2022-01-21 12:51:35', NULL);
INSERT INTO `sys_user` VALUES (4, 101, 'pangqianqian', '庞倩倩', '00', '1678310850@qq.com', '15612538962', '0', 'https://q.qlogo.cn/g?b=qq&nk=1678310850&s=100', '$2a$10$2/K7tMMjuXCUD47IKonBLeGtxLekzZdrdUyBniJJLXFEgRDQp6ey6', '0', '0', '127.0.0.1', '2022-01-06 01:56:23', 'admin', '2022-01-06 01:56:22', 'pangqianqian', '2022-01-21 14:30:07', '');
INSERT INTO `sys_user` VALUES (5, 102, 'caotianhong', '曹天红', '00', '2285047800@qq.com', '1234567890', '1', 'https://q.qlogo.cn/g?b=qq&nk=1791479155&s=100', '$2a$10$Fa5dRZoVJtov6wp8H2wP1u35kCJAMFLzYebXgrakKuJUyqPDb/YlO', '0', '0', '127.0.0.1', '2022-01-06 01:56:23', 'admin', '2022-01-06 01:56:22', 'caotianhong', '2022-01-22 02:02:03', 'HUiL1Q');
INSERT INTO `sys_user` VALUES (6, 102, '2019212682', '楠晗', '00', '2019212682@qq.com', '12666666666', '0', 'https://q.qlogo.cn/g?b=qq&nk=2033279818&s=100', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-01-06 01:56:23', 'admin', '2022-01-06 01:56:22', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (7, 103, 'sunyu', 'sy', '00', '2573326085@qq.com', '15999999999', '0', 'https://q.qlogo.cn/g?b=qq&nk=2573326085&s=100', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-01-06 01:56:23', 'admin', '2022-01-06 01:56:22', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (8, 103, 'liujunmin', 'ljm', '00', '956299887@qq.com', '17888345633', '0', 'https://q.qlogo.cn/g?b=qq&nk=956299887&s=100', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-01-06 01:56:23', 'admin', '2022-01-06 01:56:22', '', '2022-01-18 17:37:48', 'lb78RH');
INSERT INTO `sys_user` VALUES (9, 104, 'yulijia', 'ylj', '00', '2824068888@qq.com', '15111111111', '1', 'https://q.qlogo.cn/g?b=qq&nk=2824061102&s=100', '$2a$10$AEpJFzCnT2.rvPpfXk2ewuM/e3gJHY56bbVr7jvlBXOg7qvy5sJ4K', '0', '0', '127.0.0.1', '2022-01-06 01:56:23', 'admin', '2022-01-06 01:56:22', 'yulijia', '2022-01-21 13:03:51', '');
INSERT INTO `sys_user` VALUES (10, 106, '2019666666', 'shmily', '00', '3189019385@qq.com', '15478888844', '0', 'https://q.qlogo.cn/g?b=qq&nk=2228207151&s=100', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '1', '0', '127.0.0.1', '2022-01-06 01:56:23', 'admin', '2022-01-06 01:56:22', '', '2022-03-01 12:16:30', '');
INSERT INTO `sys_user` VALUES (11, 102, 'test1', 'nick01', '00', '1111111111@qq.com', '11111111111', '0', 'https://q.qlogo.cn/g?b=qq&nk=2228207151&s=100', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-01-06 01:56:23', 'admin', '2022-01-06 01:56:22', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (12, 106, 'test2', 'nick02', '00', '2222222222@qq.com', '22222222222', '0', 'https://q.qlogo.cn/g?b=qq&nk=2228207151&s=100', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (3, 2);
INSERT INTO `sys_user_role` VALUES (4, 3);
INSERT INTO `sys_user_role` VALUES (5, 5);
INSERT INTO `sys_user_role` VALUES (6, 6);
INSERT INTO `sys_user_role` VALUES (7, 4);
INSERT INTO `sys_user_role` VALUES (8, 5);
INSERT INTO `sys_user_role` VALUES (9, 6);
INSERT INTO `sys_user_role` VALUES (10, 2);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, '5G');
INSERT INTO `tag` VALUES (2, '4G');
INSERT INTO `tag` VALUES (3, '流量');
INSERT INTO `tag` VALUES (4, '话费');
INSERT INTO `tag` VALUES (5, '装维');
INSERT INTO `tag` VALUES (6, '客服');
INSERT INTO `tag` VALUES (7, '卡号');
INSERT INTO `tag` VALUES (8, '手机');
INSERT INTO `tag` VALUES (9, '套餐');
INSERT INTO `tag` VALUES (10, '靓号');
INSERT INTO `tag` VALUES (11, '宽带');
INSERT INTO `tag` VALUES (12, '充值');
INSERT INTO `tag` VALUES (13, '智能');
INSERT INTO `tag` VALUES (14, '费用');
INSERT INTO `tag` VALUES (15, '业务');
INSERT INTO `tag` VALUES (16, '新品');
INSERT INTO `tag` VALUES (17, '特价');
INSERT INTO `tag` VALUES (18, '续费');
INSERT INTO `tag` VALUES (19, '家庭');
INSERT INTO `tag` VALUES (20, '提速');
INSERT INTO `tag` VALUES (21, '家居');
INSERT INTO `tag` VALUES (22, '发票');
INSERT INTO `tag` VALUES (23, '账单');
INSERT INTO `tag` VALUES (24, '详单');
INSERT INTO `tag` VALUES (26, '测试标签');
INSERT INTO `tag` VALUES (27, '测试标签');
INSERT INTO `tag` VALUES (28, '测试标签');

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工单标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工单内容',
  `creator_id` bigint(0) NOT NULL COMMENT '创建者id',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '工单状态 0待审核 1审核不通过 2待接单 3已接单、4已完成、5已关闭',
  `auditor_id` bigint(0) NULL DEFAULT NULL COMMENT '工单审核者id',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `audit_time` timestamp(0) NULL DEFAULT NULL COMMENT '审核时间',
  `receiver_id` bigint(0) NULL DEFAULT NULL COMMENT '工单接收者id',
  `receive_time` timestamp(0) NULL DEFAULT NULL COMMENT '接单时间',
  `finish_time` timestamp(0) NULL DEFAULT NULL COMMENT '完成时间',
  `close_time` timestamp(0) NULL DEFAULT NULL COMMENT '关闭时间',
  `not_finish_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核工单不完成的驳回理由',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES (22, '费用查询工单', '费用查询工单', 1, '2022-01-13 12:59:36', '1', 1, '不知道', '2022-01-13 13:02:12', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (23, '花费余额工单', '花费余额工单花费余额工单花费余额工单花费余额工单', 1, '2022-01-13 13:01:01', '3', 1, NULL, '2022-01-13 13:40:06', 9, '2022-01-19 07:59:24', NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (24, '充值缴费工单', '充值缴费工单充值缴费工单充值缴费工单充值缴费工单', 1, '2022-01-13 13:01:40', '5', 1, NULL, '2022-01-13 13:02:01', 1, '2022-01-13 13:02:25', '2022-01-14 02:15:58', '2022-01-14 02:16:36', NULL);
INSERT INTO `ticket` VALUES (25, '1111', '222222', 1, '2022-01-13 13:41:17', '3', 1, NULL, '2022-01-21 04:02:07', 1, '2022-01-21 06:05:23', NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (26, '1111', '222222', 1, '2022-01-13 13:41:19', '1', 1, '内容无错字', '2022-01-15 04:25:51', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (27, '1111', '222222', 1, '2022-01-13 13:41:24', '5', 1, NULL, '2022-01-13 13:41:40', 1, '2022-01-13 13:42:45', '2022-01-15 06:14:21', '2022-01-19 03:13:56', NULL);
INSERT INTO `ticket` VALUES (28, '5G工单', '5G工单5G工单5G工单', 1, '2022-01-14 02:07:00', '5', 1, NULL, '2022-01-14 02:07:10', 1, '2022-01-14 02:07:15', '2022-01-14 02:07:23', '2022-01-14 02:08:54', NULL);
INSERT INTO `ticket` VALUES (29, '欠费工单', '欠费工单欠费工单欠费工单欠费工单', 1, '2022-01-14 06:06:56', '3', 8, NULL, '2022-01-19 02:34:18', 9, '2022-01-19 07:58:57', NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (30, '5G流量如何申请', '内容存在错字', 1, '2022-01-15 04:00:24', '5', 1, NULL, '2022-01-15 04:01:37', 1, '2022-01-15 04:01:46', '2022-01-15 04:02:03', '2022-01-15 04:03:13', NULL);
INSERT INTO `ticket` VALUES (31, '套餐话费', '内容 有错字', 1, '2022-01-15 04:25:10', '5', 1, NULL, '2022-01-15 04:25:54', 1, '2022-01-15 04:26:25', '2022-01-15 04:26:35', '2022-01-15 04:26:52', NULL);
INSERT INTO `ticket` VALUES (32, '如何查询话费余额', '我让其', 1, '2022-01-15 06:13:37', '3', 1, NULL, '2022-01-15 06:13:57', 9, '2022-01-19 07:57:53', NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (33, '套餐', '采编知识', 1, '2022-01-15 06:22:25', '2', 1, NULL, '2022-01-21 12:32:42', 1, '2022-01-15 06:23:21', '2022-01-15 06:23:34', '2022-01-15 06:24:03', NULL);
INSERT INTO `ticket` VALUES (34, '如何查询 话费', '采编话费', 1, '2022-01-15 07:14:45', '4', 1, NULL, '2022-01-15 07:15:14', 1, '2022-01-15 07:15:28', '2022-01-22 04:24:47', '2022-01-15 07:15:52', NULL);
INSERT INTO `ticket` VALUES (35, '123', '213', 1, '2022-01-15 08:00:18', '3', 1, NULL, '2022-01-19 08:16:09', 9, '2022-01-19 08:16:27', NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (37, '2021.1.18', '2021.1.182021.1.182021.1.182021.1.18', 1, '2022-01-18 11:07:48', '2', 1, NULL, '2022-01-21 12:32:41', 1, '2022-01-19 08:15:08', '2022-01-21 04:05:13', '2022-01-21 04:09:05', NULL);
INSERT INTO `ticket` VALUES (38, 'ylj测试发起工单', '寻找关于xxx的知识', 9, '2022-01-19 07:57:21', '2', 1, NULL, '2022-01-19 08:17:31', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (39, '工单', '工单', 1, '2022-01-19 08:18:18', '3', 1, NULL, '2022-01-19 08:18:38', 9, '2022-01-19 08:19:04', NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (40, '宽带忘记密码怎么处理？', '解答宽带忘记密码，简单快捷的办法', 3, '2022-01-21 03:25:12', '5', 5, NULL, '2022-01-21 03:33:10', 4, '2022-01-21 03:33:49', '2022-01-21 03:37:56', '2022-01-21 03:45:21', NULL);
INSERT INTO `ticket` VALUES (41, '办理新的套餐怎么在网上自助办理', '解决在线自助办理新套餐的流程', 3, '2022-01-21 03:29:36', '1', 5, NULL, '2022-01-21 12:25:09', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (42, '查询费用怎么自助办理？', '解决自助查询费用', 3, '2022-01-21 03:31:24', '2', 1, NULL, '2022-01-21 12:32:40', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (43, '宽带忘记密码怎么处理', '解决自助处理忘记宽带密码的情况\n', 1, '2022-01-21 04:03:11', '2', 1, '认为其内容不符合', '2022-01-21 12:32:40', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (44, '流量查询工单', '网上自助查询流量。修改套餐', 1, '2022-01-21 04:03:44', '2', 5, NULL, '2022-01-21 12:27:42', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (45, '11111111111', '22222', 1, '2022-01-21 04:03:55', '3', 1, NULL, '2022-01-21 04:04:02', 1, '2022-01-21 04:04:34', '2022-01-21 06:06:53', NULL, NULL);
INSERT INTO `ticket` VALUES (46, '开端', '45路公交车有一枚炸弹', 6, '2022-01-21 06:45:50', '2', 5, NULL, '2022-01-21 11:56:35', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (47, '异地注销手机号', '如何实现异地注销手机号?', 3, '2022-01-21 07:12:41', '5', 5, NULL, '2022-01-21 07:13:44', 4, '2022-01-21 07:13:53', '2022-01-21 07:15:44', '2022-01-21 07:17:30', NULL);
INSERT INTO `ticket` VALUES (48, '4G能否使用5G网络?', '回答4G能否使用5G网络详细信息', 3, '2022-01-21 11:52:39', '3', 5, NULL, '2022-01-21 11:52:55', 4, '2022-01-21 11:53:34', '2022-01-21 11:56:10', NULL, NULL);
INSERT INTO `ticket` VALUES (50, '怎么才能使用5G服务呢？', '解决5G服务的实现', 1, '2022-01-21 12:30:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (51, '现在都什么地方有5G网络呢？我在的地方是不是有5G网络呢？', '答：目前全国所有地级市和部分重点县城已经实现5G网络覆盖，您可通过运营商客服热线、掌上营业厅或营业厅查询您身边的5G网络覆盖情况。', 1, '2022-01-21 12:31:13', '2', 1, NULL, '2022-01-21 12:32:39', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (52, '使用5G手机是否需要更换原有手机卡？', '答：运营商推出了5G快捷服务，4G用户更换5G手机后，打开5G开关，不换卡、不换号，即可接入5G网络。订购5G套餐后，可享受更快的5G上网体验。', 1, '2022-01-21 12:31:33', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (53, 'Q4:一部5G手机只能使用一家运营商的5G服务么？', '答：一般情况下，同一部5G手机支持不同运营商提供的5G服务，但一部5G手机同一时间仅能连接一家运营商提供的5G网络。具体以手机厂商介绍为准。', 1, '2022-01-21 12:31:49', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (54, '我的5G手机上显示了“5G”标识，但使用的是4G套餐，请问我用的是5G网络么？', '我的5G手机上显示了“5G”标识，但使用的是4G套餐，请问我用的是5G网络么？我的5G手机上显示了“5G”标识，但使用的是4G套餐，请问我用的是5G网络么？', 1, '2022-01-21 12:32:03', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (55, '我用的是4G手机，能用5G套餐吗？', '我用的是4G手机，能用5G套餐吗？我用的是4G手机，能用5G套餐吗？', 1, '2022-01-21 12:32:15', '2', 1, NULL, '2022-01-22 04:24:28', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (56, '5G套餐是不是比4G套餐贵很多？', '5G套餐是不是比4G套餐贵很多？5G套餐是不是比4G套餐贵很多？5G套餐是不是比4G套餐贵很多？', 1, '2022-01-21 12:32:26', '1', 5, '不需要', '2022-01-21 14:34:30', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (57, '如果现在新入网，是不是只能办理5G套餐？', '如果现在新入网，是不是只能办理5G套餐？如果现在新入网，是不是只能办理5G套餐？', 1, '2022-01-21 12:32:55', '1', 5, '不需要', '2022-01-21 14:04:26', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (58, '啊哈', '工单测试内容', 3, '2022-01-21 13:36:11', '1', 5, '不符合', '2022-01-21 13:38:54', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (61, '宽带故障怎么处理', '列举宽带故障的详细原因以及解决方法', 3, '2022-01-21 14:33:40', '5', 5, NULL, '2022-01-21 14:34:10', 4, '2022-01-21 14:34:52', '2022-01-21 14:39:50', '2022-01-21 14:40:24', NULL);
INSERT INTO `ticket` VALUES (62, '啊哈', '工单测试内容', 3, '2022-01-21 23:33:51', '3', 1, NULL, '2022-01-22 04:24:06', 1, '2022-01-22 04:24:38', NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (63, '啊哈', '工单测试内容', 3, '2022-02-24 11:10:08', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES (64, '啊哈', '工单测试内容', 3, '2022-03-01 12:16:29', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for widget
-- ----------------------------
DROP TABLE IF EXISTS `widget`;
CREATE TABLE `widget`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 569 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of widget
-- ----------------------------
INSERT INTO `widget` VALUES (1);
INSERT INTO `widget` VALUES (2);
INSERT INTO `widget` VALUES (3);
INSERT INTO `widget` VALUES (4);
INSERT INTO `widget` VALUES (5);
INSERT INTO `widget` VALUES (6);
INSERT INTO `widget` VALUES (7);
INSERT INTO `widget` VALUES (8);
INSERT INTO `widget` VALUES (9);
INSERT INTO `widget` VALUES (10);
INSERT INTO `widget` VALUES (11);
INSERT INTO `widget` VALUES (12);
INSERT INTO `widget` VALUES (13);
INSERT INTO `widget` VALUES (14);
INSERT INTO `widget` VALUES (15);
INSERT INTO `widget` VALUES (16);
INSERT INTO `widget` VALUES (17);
INSERT INTO `widget` VALUES (18);
INSERT INTO `widget` VALUES (19);
INSERT INTO `widget` VALUES (20);
INSERT INTO `widget` VALUES (21);
INSERT INTO `widget` VALUES (22);
INSERT INTO `widget` VALUES (23);
INSERT INTO `widget` VALUES (24);
INSERT INTO `widget` VALUES (25);
INSERT INTO `widget` VALUES (26);
INSERT INTO `widget` VALUES (27);
INSERT INTO `widget` VALUES (28);
INSERT INTO `widget` VALUES (29);
INSERT INTO `widget` VALUES (30);
INSERT INTO `widget` VALUES (31);
INSERT INTO `widget` VALUES (32);
INSERT INTO `widget` VALUES (33);
INSERT INTO `widget` VALUES (34);
INSERT INTO `widget` VALUES (35);
INSERT INTO `widget` VALUES (36);
INSERT INTO `widget` VALUES (37);
INSERT INTO `widget` VALUES (38);
INSERT INTO `widget` VALUES (39);
INSERT INTO `widget` VALUES (40);
INSERT INTO `widget` VALUES (41);
INSERT INTO `widget` VALUES (42);
INSERT INTO `widget` VALUES (43);
INSERT INTO `widget` VALUES (44);
INSERT INTO `widget` VALUES (45);
INSERT INTO `widget` VALUES (46);
INSERT INTO `widget` VALUES (47);
INSERT INTO `widget` VALUES (48);
INSERT INTO `widget` VALUES (49);
INSERT INTO `widget` VALUES (50);
INSERT INTO `widget` VALUES (51);
INSERT INTO `widget` VALUES (52);
INSERT INTO `widget` VALUES (53);
INSERT INTO `widget` VALUES (54);
INSERT INTO `widget` VALUES (55);
INSERT INTO `widget` VALUES (56);
INSERT INTO `widget` VALUES (57);
INSERT INTO `widget` VALUES (58);
INSERT INTO `widget` VALUES (59);
INSERT INTO `widget` VALUES (60);
INSERT INTO `widget` VALUES (61);
INSERT INTO `widget` VALUES (62);
INSERT INTO `widget` VALUES (63);
INSERT INTO `widget` VALUES (64);
INSERT INTO `widget` VALUES (65);
INSERT INTO `widget` VALUES (66);
INSERT INTO `widget` VALUES (67);
INSERT INTO `widget` VALUES (68);
INSERT INTO `widget` VALUES (69);
INSERT INTO `widget` VALUES (70);
INSERT INTO `widget` VALUES (71);
INSERT INTO `widget` VALUES (72);
INSERT INTO `widget` VALUES (73);
INSERT INTO `widget` VALUES (74);
INSERT INTO `widget` VALUES (75);
INSERT INTO `widget` VALUES (76);
INSERT INTO `widget` VALUES (77);
INSERT INTO `widget` VALUES (78);
INSERT INTO `widget` VALUES (79);
INSERT INTO `widget` VALUES (80);
INSERT INTO `widget` VALUES (81);
INSERT INTO `widget` VALUES (82);
INSERT INTO `widget` VALUES (83);
INSERT INTO `widget` VALUES (84);
INSERT INTO `widget` VALUES (85);
INSERT INTO `widget` VALUES (86);
INSERT INTO `widget` VALUES (87);
INSERT INTO `widget` VALUES (88);
INSERT INTO `widget` VALUES (89);
INSERT INTO `widget` VALUES (90);
INSERT INTO `widget` VALUES (91);
INSERT INTO `widget` VALUES (92);
INSERT INTO `widget` VALUES (93);
INSERT INTO `widget` VALUES (94);
INSERT INTO `widget` VALUES (95);
INSERT INTO `widget` VALUES (96);
INSERT INTO `widget` VALUES (97);
INSERT INTO `widget` VALUES (98);
INSERT INTO `widget` VALUES (99);
INSERT INTO `widget` VALUES (100);
INSERT INTO `widget` VALUES (101);
INSERT INTO `widget` VALUES (102);
INSERT INTO `widget` VALUES (103);
INSERT INTO `widget` VALUES (104);
INSERT INTO `widget` VALUES (105);
INSERT INTO `widget` VALUES (106);
INSERT INTO `widget` VALUES (107);
INSERT INTO `widget` VALUES (108);
INSERT INTO `widget` VALUES (109);
INSERT INTO `widget` VALUES (110);
INSERT INTO `widget` VALUES (111);
INSERT INTO `widget` VALUES (112);
INSERT INTO `widget` VALUES (113);
INSERT INTO `widget` VALUES (114);
INSERT INTO `widget` VALUES (115);
INSERT INTO `widget` VALUES (116);
INSERT INTO `widget` VALUES (117);
INSERT INTO `widget` VALUES (118);
INSERT INTO `widget` VALUES (119);
INSERT INTO `widget` VALUES (120);
INSERT INTO `widget` VALUES (121);
INSERT INTO `widget` VALUES (122);
INSERT INTO `widget` VALUES (123);
INSERT INTO `widget` VALUES (124);
INSERT INTO `widget` VALUES (125);
INSERT INTO `widget` VALUES (126);
INSERT INTO `widget` VALUES (127);
INSERT INTO `widget` VALUES (128);
INSERT INTO `widget` VALUES (129);
INSERT INTO `widget` VALUES (130);
INSERT INTO `widget` VALUES (131);
INSERT INTO `widget` VALUES (132);
INSERT INTO `widget` VALUES (133);
INSERT INTO `widget` VALUES (134);
INSERT INTO `widget` VALUES (135);
INSERT INTO `widget` VALUES (136);
INSERT INTO `widget` VALUES (137);
INSERT INTO `widget` VALUES (138);
INSERT INTO `widget` VALUES (139);
INSERT INTO `widget` VALUES (140);
INSERT INTO `widget` VALUES (141);
INSERT INTO `widget` VALUES (142);
INSERT INTO `widget` VALUES (143);
INSERT INTO `widget` VALUES (144);
INSERT INTO `widget` VALUES (145);
INSERT INTO `widget` VALUES (146);
INSERT INTO `widget` VALUES (147);
INSERT INTO `widget` VALUES (148);
INSERT INTO `widget` VALUES (149);
INSERT INTO `widget` VALUES (150);
INSERT INTO `widget` VALUES (151);
INSERT INTO `widget` VALUES (152);
INSERT INTO `widget` VALUES (153);
INSERT INTO `widget` VALUES (154);
INSERT INTO `widget` VALUES (155);
INSERT INTO `widget` VALUES (156);
INSERT INTO `widget` VALUES (157);
INSERT INTO `widget` VALUES (158);
INSERT INTO `widget` VALUES (159);
INSERT INTO `widget` VALUES (160);
INSERT INTO `widget` VALUES (161);
INSERT INTO `widget` VALUES (162);
INSERT INTO `widget` VALUES (163);
INSERT INTO `widget` VALUES (164);
INSERT INTO `widget` VALUES (165);
INSERT INTO `widget` VALUES (166);
INSERT INTO `widget` VALUES (167);
INSERT INTO `widget` VALUES (168);
INSERT INTO `widget` VALUES (169);
INSERT INTO `widget` VALUES (170);
INSERT INTO `widget` VALUES (171);
INSERT INTO `widget` VALUES (172);
INSERT INTO `widget` VALUES (173);
INSERT INTO `widget` VALUES (174);
INSERT INTO `widget` VALUES (175);
INSERT INTO `widget` VALUES (176);
INSERT INTO `widget` VALUES (177);
INSERT INTO `widget` VALUES (178);
INSERT INTO `widget` VALUES (179);
INSERT INTO `widget` VALUES (180);
INSERT INTO `widget` VALUES (181);
INSERT INTO `widget` VALUES (182);
INSERT INTO `widget` VALUES (183);
INSERT INTO `widget` VALUES (184);
INSERT INTO `widget` VALUES (185);
INSERT INTO `widget` VALUES (186);
INSERT INTO `widget` VALUES (187);
INSERT INTO `widget` VALUES (188);
INSERT INTO `widget` VALUES (189);
INSERT INTO `widget` VALUES (190);
INSERT INTO `widget` VALUES (191);
INSERT INTO `widget` VALUES (192);
INSERT INTO `widget` VALUES (193);
INSERT INTO `widget` VALUES (194);
INSERT INTO `widget` VALUES (195);
INSERT INTO `widget` VALUES (196);
INSERT INTO `widget` VALUES (197);
INSERT INTO `widget` VALUES (198);
INSERT INTO `widget` VALUES (199);
INSERT INTO `widget` VALUES (200);
INSERT INTO `widget` VALUES (201);
INSERT INTO `widget` VALUES (202);
INSERT INTO `widget` VALUES (203);
INSERT INTO `widget` VALUES (204);
INSERT INTO `widget` VALUES (205);
INSERT INTO `widget` VALUES (206);
INSERT INTO `widget` VALUES (207);
INSERT INTO `widget` VALUES (208);
INSERT INTO `widget` VALUES (209);
INSERT INTO `widget` VALUES (210);
INSERT INTO `widget` VALUES (211);
INSERT INTO `widget` VALUES (212);
INSERT INTO `widget` VALUES (213);
INSERT INTO `widget` VALUES (214);
INSERT INTO `widget` VALUES (215);
INSERT INTO `widget` VALUES (216);
INSERT INTO `widget` VALUES (217);
INSERT INTO `widget` VALUES (218);
INSERT INTO `widget` VALUES (219);
INSERT INTO `widget` VALUES (220);
INSERT INTO `widget` VALUES (221);
INSERT INTO `widget` VALUES (222);
INSERT INTO `widget` VALUES (223);
INSERT INTO `widget` VALUES (224);
INSERT INTO `widget` VALUES (225);
INSERT INTO `widget` VALUES (226);
INSERT INTO `widget` VALUES (227);
INSERT INTO `widget` VALUES (228);
INSERT INTO `widget` VALUES (229);
INSERT INTO `widget` VALUES (230);
INSERT INTO `widget` VALUES (231);
INSERT INTO `widget` VALUES (232);
INSERT INTO `widget` VALUES (233);
INSERT INTO `widget` VALUES (234);
INSERT INTO `widget` VALUES (235);
INSERT INTO `widget` VALUES (236);
INSERT INTO `widget` VALUES (237);
INSERT INTO `widget` VALUES (238);
INSERT INTO `widget` VALUES (239);
INSERT INTO `widget` VALUES (240);
INSERT INTO `widget` VALUES (241);
INSERT INTO `widget` VALUES (242);
INSERT INTO `widget` VALUES (243);
INSERT INTO `widget` VALUES (244);
INSERT INTO `widget` VALUES (245);
INSERT INTO `widget` VALUES (246);
INSERT INTO `widget` VALUES (247);
INSERT INTO `widget` VALUES (248);
INSERT INTO `widget` VALUES (249);
INSERT INTO `widget` VALUES (250);
INSERT INTO `widget` VALUES (251);
INSERT INTO `widget` VALUES (252);
INSERT INTO `widget` VALUES (253);
INSERT INTO `widget` VALUES (254);
INSERT INTO `widget` VALUES (255);
INSERT INTO `widget` VALUES (256);
INSERT INTO `widget` VALUES (257);
INSERT INTO `widget` VALUES (258);
INSERT INTO `widget` VALUES (259);
INSERT INTO `widget` VALUES (260);
INSERT INTO `widget` VALUES (261);
INSERT INTO `widget` VALUES (262);
INSERT INTO `widget` VALUES (263);
INSERT INTO `widget` VALUES (264);
INSERT INTO `widget` VALUES (265);
INSERT INTO `widget` VALUES (266);
INSERT INTO `widget` VALUES (267);
INSERT INTO `widget` VALUES (268);
INSERT INTO `widget` VALUES (269);
INSERT INTO `widget` VALUES (270);
INSERT INTO `widget` VALUES (271);
INSERT INTO `widget` VALUES (272);
INSERT INTO `widget` VALUES (273);
INSERT INTO `widget` VALUES (274);
INSERT INTO `widget` VALUES (275);
INSERT INTO `widget` VALUES (276);
INSERT INTO `widget` VALUES (277);
INSERT INTO `widget` VALUES (278);
INSERT INTO `widget` VALUES (279);
INSERT INTO `widget` VALUES (280);
INSERT INTO `widget` VALUES (281);
INSERT INTO `widget` VALUES (282);
INSERT INTO `widget` VALUES (283);
INSERT INTO `widget` VALUES (284);
INSERT INTO `widget` VALUES (285);
INSERT INTO `widget` VALUES (286);
INSERT INTO `widget` VALUES (287);
INSERT INTO `widget` VALUES (288);
INSERT INTO `widget` VALUES (289);
INSERT INTO `widget` VALUES (290);
INSERT INTO `widget` VALUES (291);
INSERT INTO `widget` VALUES (292);
INSERT INTO `widget` VALUES (293);
INSERT INTO `widget` VALUES (294);
INSERT INTO `widget` VALUES (295);
INSERT INTO `widget` VALUES (296);
INSERT INTO `widget` VALUES (297);
INSERT INTO `widget` VALUES (298);
INSERT INTO `widget` VALUES (299);
INSERT INTO `widget` VALUES (300);
INSERT INTO `widget` VALUES (301);
INSERT INTO `widget` VALUES (302);
INSERT INTO `widget` VALUES (303);
INSERT INTO `widget` VALUES (304);
INSERT INTO `widget` VALUES (305);
INSERT INTO `widget` VALUES (306);
INSERT INTO `widget` VALUES (307);
INSERT INTO `widget` VALUES (308);
INSERT INTO `widget` VALUES (309);
INSERT INTO `widget` VALUES (310);
INSERT INTO `widget` VALUES (311);
INSERT INTO `widget` VALUES (312);
INSERT INTO `widget` VALUES (313);
INSERT INTO `widget` VALUES (314);
INSERT INTO `widget` VALUES (315);
INSERT INTO `widget` VALUES (316);
INSERT INTO `widget` VALUES (317);
INSERT INTO `widget` VALUES (318);
INSERT INTO `widget` VALUES (319);
INSERT INTO `widget` VALUES (320);
INSERT INTO `widget` VALUES (321);
INSERT INTO `widget` VALUES (322);
INSERT INTO `widget` VALUES (323);
INSERT INTO `widget` VALUES (324);
INSERT INTO `widget` VALUES (325);
INSERT INTO `widget` VALUES (326);
INSERT INTO `widget` VALUES (327);
INSERT INTO `widget` VALUES (328);
INSERT INTO `widget` VALUES (329);
INSERT INTO `widget` VALUES (330);
INSERT INTO `widget` VALUES (331);
INSERT INTO `widget` VALUES (332);
INSERT INTO `widget` VALUES (333);
INSERT INTO `widget` VALUES (334);
INSERT INTO `widget` VALUES (335);
INSERT INTO `widget` VALUES (336);
INSERT INTO `widget` VALUES (337);
INSERT INTO `widget` VALUES (338);
INSERT INTO `widget` VALUES (339);
INSERT INTO `widget` VALUES (340);
INSERT INTO `widget` VALUES (341);
INSERT INTO `widget` VALUES (342);
INSERT INTO `widget` VALUES (343);
INSERT INTO `widget` VALUES (344);
INSERT INTO `widget` VALUES (345);
INSERT INTO `widget` VALUES (346);
INSERT INTO `widget` VALUES (347);
INSERT INTO `widget` VALUES (348);
INSERT INTO `widget` VALUES (349);
INSERT INTO `widget` VALUES (350);
INSERT INTO `widget` VALUES (351);
INSERT INTO `widget` VALUES (352);
INSERT INTO `widget` VALUES (353);
INSERT INTO `widget` VALUES (354);
INSERT INTO `widget` VALUES (355);
INSERT INTO `widget` VALUES (356);
INSERT INTO `widget` VALUES (357);
INSERT INTO `widget` VALUES (358);
INSERT INTO `widget` VALUES (359);
INSERT INTO `widget` VALUES (360);
INSERT INTO `widget` VALUES (361);
INSERT INTO `widget` VALUES (362);
INSERT INTO `widget` VALUES (363);
INSERT INTO `widget` VALUES (364);
INSERT INTO `widget` VALUES (365);
INSERT INTO `widget` VALUES (366);
INSERT INTO `widget` VALUES (367);
INSERT INTO `widget` VALUES (368);
INSERT INTO `widget` VALUES (369);
INSERT INTO `widget` VALUES (370);
INSERT INTO `widget` VALUES (371);
INSERT INTO `widget` VALUES (372);
INSERT INTO `widget` VALUES (373);
INSERT INTO `widget` VALUES (374);
INSERT INTO `widget` VALUES (375);
INSERT INTO `widget` VALUES (376);
INSERT INTO `widget` VALUES (377);
INSERT INTO `widget` VALUES (378);
INSERT INTO `widget` VALUES (379);
INSERT INTO `widget` VALUES (380);
INSERT INTO `widget` VALUES (381);
INSERT INTO `widget` VALUES (382);
INSERT INTO `widget` VALUES (383);
INSERT INTO `widget` VALUES (384);
INSERT INTO `widget` VALUES (385);
INSERT INTO `widget` VALUES (386);
INSERT INTO `widget` VALUES (387);
INSERT INTO `widget` VALUES (388);
INSERT INTO `widget` VALUES (389);
INSERT INTO `widget` VALUES (390);
INSERT INTO `widget` VALUES (391);
INSERT INTO `widget` VALUES (392);
INSERT INTO `widget` VALUES (393);
INSERT INTO `widget` VALUES (394);
INSERT INTO `widget` VALUES (395);
INSERT INTO `widget` VALUES (396);
INSERT INTO `widget` VALUES (397);
INSERT INTO `widget` VALUES (398);
INSERT INTO `widget` VALUES (399);
INSERT INTO `widget` VALUES (400);
INSERT INTO `widget` VALUES (401);
INSERT INTO `widget` VALUES (402);
INSERT INTO `widget` VALUES (403);
INSERT INTO `widget` VALUES (404);
INSERT INTO `widget` VALUES (405);
INSERT INTO `widget` VALUES (406);
INSERT INTO `widget` VALUES (407);
INSERT INTO `widget` VALUES (408);
INSERT INTO `widget` VALUES (409);
INSERT INTO `widget` VALUES (410);
INSERT INTO `widget` VALUES (411);
INSERT INTO `widget` VALUES (412);
INSERT INTO `widget` VALUES (413);
INSERT INTO `widget` VALUES (414);
INSERT INTO `widget` VALUES (415);
INSERT INTO `widget` VALUES (416);
INSERT INTO `widget` VALUES (417);
INSERT INTO `widget` VALUES (418);
INSERT INTO `widget` VALUES (419);
INSERT INTO `widget` VALUES (420);
INSERT INTO `widget` VALUES (421);
INSERT INTO `widget` VALUES (422);
INSERT INTO `widget` VALUES (423);
INSERT INTO `widget` VALUES (424);
INSERT INTO `widget` VALUES (425);
INSERT INTO `widget` VALUES (426);
INSERT INTO `widget` VALUES (427);
INSERT INTO `widget` VALUES (428);
INSERT INTO `widget` VALUES (429);
INSERT INTO `widget` VALUES (430);
INSERT INTO `widget` VALUES (431);
INSERT INTO `widget` VALUES (432);
INSERT INTO `widget` VALUES (433);
INSERT INTO `widget` VALUES (434);
INSERT INTO `widget` VALUES (435);
INSERT INTO `widget` VALUES (436);
INSERT INTO `widget` VALUES (437);
INSERT INTO `widget` VALUES (438);
INSERT INTO `widget` VALUES (439);
INSERT INTO `widget` VALUES (440);
INSERT INTO `widget` VALUES (441);
INSERT INTO `widget` VALUES (442);
INSERT INTO `widget` VALUES (443);
INSERT INTO `widget` VALUES (444);
INSERT INTO `widget` VALUES (445);
INSERT INTO `widget` VALUES (446);
INSERT INTO `widget` VALUES (447);
INSERT INTO `widget` VALUES (448);
INSERT INTO `widget` VALUES (449);
INSERT INTO `widget` VALUES (450);
INSERT INTO `widget` VALUES (451);
INSERT INTO `widget` VALUES (452);
INSERT INTO `widget` VALUES (453);
INSERT INTO `widget` VALUES (454);
INSERT INTO `widget` VALUES (455);
INSERT INTO `widget` VALUES (456);
INSERT INTO `widget` VALUES (457);
INSERT INTO `widget` VALUES (458);
INSERT INTO `widget` VALUES (459);
INSERT INTO `widget` VALUES (460);
INSERT INTO `widget` VALUES (461);
INSERT INTO `widget` VALUES (462);
INSERT INTO `widget` VALUES (463);
INSERT INTO `widget` VALUES (464);
INSERT INTO `widget` VALUES (465);
INSERT INTO `widget` VALUES (466);
INSERT INTO `widget` VALUES (467);
INSERT INTO `widget` VALUES (468);
INSERT INTO `widget` VALUES (469);
INSERT INTO `widget` VALUES (470);
INSERT INTO `widget` VALUES (471);
INSERT INTO `widget` VALUES (472);
INSERT INTO `widget` VALUES (473);
INSERT INTO `widget` VALUES (474);
INSERT INTO `widget` VALUES (475);
INSERT INTO `widget` VALUES (476);
INSERT INTO `widget` VALUES (477);
INSERT INTO `widget` VALUES (478);
INSERT INTO `widget` VALUES (479);
INSERT INTO `widget` VALUES (480);
INSERT INTO `widget` VALUES (481);
INSERT INTO `widget` VALUES (482);
INSERT INTO `widget` VALUES (483);
INSERT INTO `widget` VALUES (484);
INSERT INTO `widget` VALUES (485);
INSERT INTO `widget` VALUES (486);
INSERT INTO `widget` VALUES (487);
INSERT INTO `widget` VALUES (488);
INSERT INTO `widget` VALUES (489);
INSERT INTO `widget` VALUES (490);
INSERT INTO `widget` VALUES (491);
INSERT INTO `widget` VALUES (492);
INSERT INTO `widget` VALUES (493);
INSERT INTO `widget` VALUES (494);
INSERT INTO `widget` VALUES (495);
INSERT INTO `widget` VALUES (496);
INSERT INTO `widget` VALUES (497);
INSERT INTO `widget` VALUES (498);
INSERT INTO `widget` VALUES (499);
INSERT INTO `widget` VALUES (500);
INSERT INTO `widget` VALUES (501);
INSERT INTO `widget` VALUES (502);
INSERT INTO `widget` VALUES (503);
INSERT INTO `widget` VALUES (504);
INSERT INTO `widget` VALUES (505);
INSERT INTO `widget` VALUES (506);
INSERT INTO `widget` VALUES (507);
INSERT INTO `widget` VALUES (508);
INSERT INTO `widget` VALUES (509);
INSERT INTO `widget` VALUES (510);
INSERT INTO `widget` VALUES (511);
INSERT INTO `widget` VALUES (512);
INSERT INTO `widget` VALUES (513);
INSERT INTO `widget` VALUES (514);
INSERT INTO `widget` VALUES (515);
INSERT INTO `widget` VALUES (516);
INSERT INTO `widget` VALUES (517);
INSERT INTO `widget` VALUES (518);
INSERT INTO `widget` VALUES (519);
INSERT INTO `widget` VALUES (520);
INSERT INTO `widget` VALUES (521);
INSERT INTO `widget` VALUES (522);
INSERT INTO `widget` VALUES (523);
INSERT INTO `widget` VALUES (524);
INSERT INTO `widget` VALUES (525);
INSERT INTO `widget` VALUES (526);
INSERT INTO `widget` VALUES (527);
INSERT INTO `widget` VALUES (528);
INSERT INTO `widget` VALUES (529);
INSERT INTO `widget` VALUES (530);
INSERT INTO `widget` VALUES (531);
INSERT INTO `widget` VALUES (532);
INSERT INTO `widget` VALUES (533);
INSERT INTO `widget` VALUES (534);
INSERT INTO `widget` VALUES (535);
INSERT INTO `widget` VALUES (536);
INSERT INTO `widget` VALUES (537);
INSERT INTO `widget` VALUES (538);
INSERT INTO `widget` VALUES (539);
INSERT INTO `widget` VALUES (540);
INSERT INTO `widget` VALUES (541);
INSERT INTO `widget` VALUES (542);
INSERT INTO `widget` VALUES (543);
INSERT INTO `widget` VALUES (544);
INSERT INTO `widget` VALUES (545);
INSERT INTO `widget` VALUES (546);
INSERT INTO `widget` VALUES (547);
INSERT INTO `widget` VALUES (548);
INSERT INTO `widget` VALUES (549);
INSERT INTO `widget` VALUES (550);
INSERT INTO `widget` VALUES (551);
INSERT INTO `widget` VALUES (552);
INSERT INTO `widget` VALUES (553);
INSERT INTO `widget` VALUES (554);
INSERT INTO `widget` VALUES (555);
INSERT INTO `widget` VALUES (556);
INSERT INTO `widget` VALUES (557);
INSERT INTO `widget` VALUES (558);
INSERT INTO `widget` VALUES (559);
INSERT INTO `widget` VALUES (560);
INSERT INTO `widget` VALUES (561);
INSERT INTO `widget` VALUES (562);
INSERT INTO `widget` VALUES (563);
INSERT INTO `widget` VALUES (564);
INSERT INTO `widget` VALUES (565);
INSERT INTO `widget` VALUES (566);
INSERT INTO `widget` VALUES (567);
INSERT INTO `widget` VALUES (568);

-- ----------------------------
-- Triggers structure for table history
-- ----------------------------
DROP TRIGGER IF EXISTS `t_inst_history`;
delimiter ;;
CREATE TRIGGER `t_inst_history` AFTER INSERT ON `history` FOR EACH ROW begin
			update knowledge set view_counts = view_counts + 1
			where id = NEW.knowledge_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table knowledge_collection
-- ----------------------------
DROP TRIGGER IF EXISTS `t_inst_collect`;
delimiter ;;
CREATE TRIGGER `t_inst_collect` AFTER INSERT ON `knowledge_collection` FOR EACH ROW begin
			update knowledge set collect_counts = collect_counts + 1
			where id = NEW.knowledge_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table knowledge_collection
-- ----------------------------
DROP TRIGGER IF EXISTS `t_del_collect`;
delimiter ;;
CREATE TRIGGER `t_del_collect` AFTER DELETE ON `knowledge_collection` FOR EACH ROW begin
			update knowledge set collect_counts = collect_counts - 1
			where id = OLD.knowledge_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table knowledge_comment
-- ----------------------------
DROP TRIGGER IF EXISTS `t_inst_comment`;
delimiter ;;
CREATE TRIGGER `t_inst_comment` AFTER INSERT ON `knowledge_comment` FOR EACH ROW begin
			update knowledge set comment_counts = comment_counts + 1
			where id = NEW.knowledge_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table knowledge_comment
-- ----------------------------
DROP TRIGGER IF EXISTS `t_dele_comment`;
delimiter ;;
CREATE TRIGGER `t_dele_comment` AFTER DELETE ON `knowledge_comment` FOR EACH ROW begin
			update knowledge set comment_counts = comment_counts - 1
			where id = OLD.knowledge_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table knowledge_likes
-- ----------------------------
DROP TRIGGER IF EXISTS `t_inst_likes`;
delimiter ;;
CREATE TRIGGER `t_inst_likes` AFTER INSERT ON `knowledge_likes` FOR EACH ROW begin
			update knowledge set like_counts = like_counts + 1
			where id = NEW.knowledge_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table knowledge_likes
-- ----------------------------
DROP TRIGGER IF EXISTS `t_dele_likes`;
delimiter ;;
CREATE TRIGGER `t_dele_likes` AFTER DELETE ON `knowledge_likes` FOR EACH ROW begin
			update knowledge set like_counts = like_counts - 1
			where id = OLD.knowledge_id;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
