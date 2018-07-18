/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : recommendfood

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-03-28 12:15:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_check
-- ----------------------------
DROP TABLE IF EXISTS `admin_check`;
CREATE TABLE `admin_check` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `recommend_id` bigint(11) DEFAULT NULL,
  `check_info` int(2) DEFAULT NULL,
  `check_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_check
-- ----------------------------
INSERT INTO `admin_check` VALUES ('1', '1', '1', '2017-09-26 21:51:08');
INSERT INTO `admin_check` VALUES ('2', '2', '1', '2017-10-03 15:20:13');
INSERT INTO `admin_check` VALUES ('3', '3', '1', '2017-10-10 15:20:21');
INSERT INTO `admin_check` VALUES ('4', '4', '1', '2017-10-05 11:20:14');
INSERT INTO `admin_check` VALUES ('5', '5', '1', '2017-10-13 11:20:21');
INSERT INTO `admin_check` VALUES ('6', '6', '1', '2017-11-07 19:36:03');
INSERT INTO `admin_check` VALUES ('7', '7', '1', '2017-11-15 19:36:41');
INSERT INTO `admin_check` VALUES ('8', '8', '1', '2017-11-15 19:36:38');
INSERT INTO `admin_check` VALUES ('9', '9', '1', '2017-11-08 19:36:35');
INSERT INTO `admin_check` VALUES ('10', '10', '1', '2017-11-07 17:02:35');
INSERT INTO `admin_check` VALUES ('11', '11', '1', '2017-11-08 15:50:10');
INSERT INTO `admin_check` VALUES ('12', '12', '1', '2018-03-19 19:37:51');

-- ----------------------------
-- Table structure for admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `log_msg` varchar(255) DEFAULT NULL,
  `log_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_log
-- ----------------------------
INSERT INTO `admin_log` VALUES ('1', 'aa', null);

-- ----------------------------
-- Table structure for category_system
-- ----------------------------
DROP TABLE IF EXISTS `category_system`;
CREATE TABLE `category_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_system
-- ----------------------------
INSERT INTO `category_system` VALUES ('1', '菜式');
INSERT INTO `category_system` VALUES ('2', '菜系');
INSERT INTO `category_system` VALUES ('3', '场合');
INSERT INTO `category_system` VALUES ('4', '人群');
INSERT INTO `category_system` VALUES ('5', '口味');

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  `stuff` varchar(255) DEFAULT NULL,
  `seasoning` varchar(255) DEFAULT NULL,
  `manufacturing_process` text,
  `introduce` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `food_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('2', '紫苏砂锅鲫鱼蒸', 'resource/pic/1.png', '鲫鱼=一条%紫苏=两颗', '油=适量%盐=适量%青椒=一个%红椒=一个%姜丝=适量%生油=两勺', '食材准备好，鲫鱼宰杀处理干净=resource/pic/11.jpg%紫苏杆放在碟子里=resource/pic/12.jpg%鲫鱼双面都打上花刀，放在紫苏上=resource/pic/14.jpg%将鱼放在蒸笼里，蒸笼装在砂锅上=resource/pic/15.jpg%蒸好后，碟子里会有很多汤汁，将汤汁倒掉，鱼身下的紫苏杆去掉=resource/pic/17.jpg%油锅烧热，炒香青红椒丝和紫苏后加入两勺生抽，适量盐，烧开=resource/pic/19.jpg%淋在鱼身上即可=resource/pic/20.jpg', '鲫鱼是饮食中常见的佳肴，有很高的营养价值，因为鲫鱼含动物蛋白和不饱和脂肪酸，常吃鲫鱼不仅能健身，还能减少肥胖，有助于降血压和降血脂，使人延年益寿。中医认为鲫鱼能补虚、温中下气、利水消肿，清烧能治胃肠道出血和呕吐反胃。外用还有解毒消炎的作用。(', '1', '50,44');
INSERT INTO `food` VALUES ('3', '宫爆鸡丁', 'resource/pic/213.jpg', '鸡胸肉=一块', '胡萝卜=100克%青椒=50克%青椒=100克%胡萝卜=100克%姜=适量%蒜=适量%老抽=适量', '\r\n鸡胸肉去皮洗净切成丁，胡萝卜、黄瓜、青椒切丁，红干辣椒切段，姜切片，蒜切末，葱切葱花备用，花生洗净沥干水分备用=resource/pic/211.jpg%锅中倒入适量西王玉米胚芽油烧至五成热时放入花生炸熟后盛出备用=resource/pic/212.jpg%放入花生米翻炒均匀即可盛出备用=resource/pic/213.jpg', '青椒：增强免疫力、抗氧化、抗癌防癌。胡萝卜：养肝明目、健脾、化痰止咳。黄瓜：利水、清热、解毒', '1', '1,30');
INSERT INTO `food` VALUES ('4', '青椒炒鸡丁 ', 'resource/pic/3.jpg', '鸡脯=一个', '青椒=2个%生抽=少许%盐=少许%葱=少许%料酒=少许', '鸡脯切丁，加入料酒、胡椒、生抽、油腌制=resource/pic/311.jpg%锅中留底油，放入葱、姜、辣椒=resource/pic/312.jpg%倒入鸡丁，加少许生抽翻炒均与=resource/pic/313.jpg', '青椒含有丰富的维生素C，辣椒味较淡甚至不辣。青椒特有的味道和所含的辣椒素有刺激唾液和胃液分泌的作用，能增进食欲、帮助消化、促进肠蠕动、防止便秘。鸡肉蛋白质中富含全部必需氨基酸，其含量与蛋、乳中的氨基酸谱式极为相似，因此为优质的蛋白质来源.', '1', '1,40');
INSERT INTO `food` VALUES ('8', '油泼面', 'images/shoucang/蛋炒饭.png', '中筋面粉=500g', '温水=适量%盐=一小勺%大蒜=半头', '500g面粉中依次加入适量温水和盐=resource/pic\\foodprocess201710261519270.jpg%大蒜剁成末，小青菜和豆芽摘洗干净备用=resource/pic\\foodprocess201710261519271.jpg%将面条煮至自己喜欢的软硬程度后捞到碗里， 放上煮好的小青菜，蒜末，辣椒面=resource/pic\\foodprocess201710261519272.jpg%再来一瓣蒜=resource/pic\\foodprocess201710261519273.jpg', '一碗好的油泼面，大蒜剁的不要太细，但是辣椒面要细，配上劲道弹牙的裤带面，新鲜的豆芽和青菜，加上比例合适的调料底，再泼上滚油，听着滋滋的声音，端着大海碗，一根一根将面条送进嘴里。。。。', '1', '1,23');
INSERT INTO `food` VALUES ('20', '红烧排骨', 'images/shoucang/蛋炒饭.png', '排骨=500g', '盐=适量%酱油=适量%醋=适量%', '洗排骨=resource/pic\\foodprocess201710281539320.jpg%烧排骨=resource/pic\\foodprocess201710281539321.jpg%出锅=resource/pic\\foodprocess201710281539322.jpg', '家常美食，味道可口', '1', '1,10,');
INSERT INTO `food` VALUES ('25', '凉调黄瓜', 'images/shoucang/糖炒栗子.png', '黄瓜=3根', '蒜=半瓣%酱油=适量', '洗黄瓜=resource/pic\\foodprocess201710281559270.png%切黄瓜=resource/pic\\foodprocess201710281559271.jpg%完成=resource/pic\\foodprocess201710281559272.jpg', '夏日精品', '1', '1,2,');
INSERT INTO `food` VALUES ('26', '油泼面', 'images/shoucang/糖炒栗子.png', '中筋面粉=500g', '温水=适量%盐=一小勺%大蒜=半头', '500g面粉中依次加入适量温水和盐=resource/pic\\foodprocess201710261519270.jpg%大蒜剁成末，小青菜和豆芽摘洗干净备用=resource/pic\\foodprocess201710261519271.jpg%将面条煮至自己喜欢的软硬程度后捞到碗里， 放上煮好的小青菜，蒜末，辣椒面=resource/pic\\foodprocess201710261519272.jpg%再来一瓣蒜=resource/pic\\foodprocess201710261519273.jpg', '一碗好的油泼面，大蒜剁的不要太细，但是辣椒面要细，配上劲道弹牙的裤带面，新鲜的豆芽和青菜，加上比例合适的调料底，再泼上滚油，听着滋滋的声音，端着大海碗，一根一根将面条送进嘴里。。。。', '1', '1,23');
INSERT INTO `food` VALUES ('27', '红烧排骨', 'images/zuopin/猪肉脯.png', '排骨=500g', '盐=适量%酱油=适量%醋=适量%', '洗排骨=resource/pic\\foodprocess201710281539320.jpg%烧排骨=resource/pic\\foodprocess201710281539321.jpg%出锅=resource/pic\\foodprocess201710281539322.jpg', '家常美食，味道可口', '1', '1,10,');
INSERT INTO `food` VALUES ('30', '青菜豆腐', 'images/zuopin/甜甜圈.png', '青菜=500g%豆腐=一块', '盐=适量%葱=适量', '清洗食材=resource/pic\\foodprocess201711071702350.png%完成=resource/pic\\foodprocess201711071702351.jpg', '家常美食', '1', '1,10,');
INSERT INTO `food` VALUES ('31', '牛肉面', 'images/shoucang/奶油蘑菇汤.png', '牛肉=适量%面粉=适量', '盐=适量%葱=适量', '清洗食材=resource/pic\\foodprocess201711081550090.png%爆炒=resource/pic\\foodprocess201711081550091.png%添加调料=resource/pic\\foodprocess201711081550092.png%过油=resource/pic\\foodprocess201711081550093.png%完成=resource/pic\\foodprocess201711081550094.png', '家常美食', '1', '1,10,');
INSERT INTO `food` VALUES ('32', '蛋炒饭', 'images/shoucang/蛋炒饭.png', null, null, null, '家常美食', '1', '1,10');
INSERT INTO `food` VALUES ('33', '汉堡', 'images/shoucang/汉堡.png', null, null, null, '家常美食', '1', '1,10');
INSERT INTO `food` VALUES ('34', '奶油蘑菇汤', 'images/shoucang/奶油蘑菇汤.png', null, null, null, '家常美食', '1', '1,10');
INSERT INTO `food` VALUES ('35', '糖炒栗子', 'images/shoucang/糖炒栗子.png', null, null, null, '家常美食', '1', '1,10');
INSERT INTO `food` VALUES ('36', '牛排', 'images/zuopin/牛排.png', null, null, null, '家常美食', '1', '1,10');
INSERT INTO `food` VALUES ('37', '水煮鱼', 'images/zuopin/烧烤.png', null, null, null, '家常美食', '1', '1,10');
INSERT INTO `food` VALUES ('38', '猪肉脯', 'images/zuopin/猪肉脯.png', null, null, null, '家常美食', '1', '1,10');
INSERT INTO `food` VALUES ('39', '甜甜圈', 'images/zuopin/甜甜圈.png', null, null, null, '家常美食', '1', '1,10');
INSERT INTO `food` VALUES ('40', '红烧鸡块', 'resource/pic\\foodpic201803191937500.jpg', '鸡块=若干', '盐=10g%葱=适量', '清洗鸡块，然后小火慢炖=resource/pic\\foodprocess201803191937500.jpg%待煮熟后，加上葱姜佐料，焖几分钟=resource/pic\\foodprocess201803191937501.jpg%完成=resource/pic\\foodprocess201803191937502.jpg', '新鲜无比的鸡块，红烧之后为更加美味', '1', '1,10,');

-- ----------------------------
-- Table structure for food_category
-- ----------------------------
DROP TABLE IF EXISTS `food_category`;
CREATE TABLE `food_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food_category
-- ----------------------------
INSERT INTO `food_category` VALUES ('1', '家常菜', '1');
INSERT INTO `food_category` VALUES ('2', '凉菜', '1');
INSERT INTO `food_category` VALUES ('3', '面食', '1');
INSERT INTO `food_category` VALUES ('4', '小吃', '1');
INSERT INTO `food_category` VALUES ('5', '粥', '1');
INSERT INTO `food_category` VALUES ('6', '汤', '1');
INSERT INTO `food_category` VALUES ('7', '糕点', '1');
INSERT INTO `food_category` VALUES ('8', '饮品', '1');
INSERT INTO `food_category` VALUES ('9', '腌制', '1');
INSERT INTO `food_category` VALUES ('10', '热菜', '1');
INSERT INTO `food_category` VALUES ('11', '海鲜', '1');
INSERT INTO `food_category` VALUES ('12', '卤菜', '1');
INSERT INTO `food_category` VALUES ('13', '酱料', '1');
INSERT INTO `food_category` VALUES ('14', '鲁菜', '2');
INSERT INTO `food_category` VALUES ('15', '川菜', '2');
INSERT INTO `food_category` VALUES ('16', '东北菜', '2');
INSERT INTO `food_category` VALUES ('17', '粤菜', '2');
INSERT INTO `food_category` VALUES ('18', '湘菜', '2');
INSERT INTO `food_category` VALUES ('19', '淮扬菜', '2');
INSERT INTO `food_category` VALUES ('20', '闽菜', '2');
INSERT INTO `food_category` VALUES ('21', '浙菜', '2');
INSERT INTO `food_category` VALUES ('22', '京菜', '2');
INSERT INTO `food_category` VALUES ('23', '韩式料理', '2');
INSERT INTO `food_category` VALUES ('24', '日式料理', '2');
INSERT INTO `food_category` VALUES ('25', '台湾美食', '2');
INSERT INTO `food_category` VALUES ('26', '早餐', '3');
INSERT INTO `food_category` VALUES ('27', '晚餐', '3');
INSERT INTO `food_category` VALUES ('28', '中餐', '3');
INSERT INTO `food_category` VALUES ('29', '宵夜', '3');
INSERT INTO `food_category` VALUES ('30', '冬季菜', '3');
INSERT INTO `food_category` VALUES ('31', '春季菜', '3');
INSERT INTO `food_category` VALUES ('32', '夏季菜', '3');
INSERT INTO `food_category` VALUES ('33', '秋季菜', '3');
INSERT INTO `food_category` VALUES ('34', '孕妇', '4');
INSERT INTO `food_category` VALUES ('35', '儿童', '4');
INSERT INTO `food_category` VALUES ('36', '老人', '4');
INSERT INTO `food_category` VALUES ('37', '健身餐', '4');
INSERT INTO `food_category` VALUES ('38', '减肥餐', '4');
INSERT INTO `food_category` VALUES ('39', '清淡', '5');
INSERT INTO `food_category` VALUES ('40', '麻辣', '5');
INSERT INTO `food_category` VALUES ('41', '甜', '5');
INSERT INTO `food_category` VALUES ('42', '酸辣', '5');
INSERT INTO `food_category` VALUES ('43', '酸甜', '5');
INSERT INTO `food_category` VALUES ('44', '鲜', '5');
INSERT INTO `food_category` VALUES ('45', '苦', '5');
INSERT INTO `food_category` VALUES ('46', '香酥', '5');
INSERT INTO `food_category` VALUES ('47', '酱香', '5');
INSERT INTO `food_category` VALUES ('48', '椒盐', '5');
INSERT INTO `food_category` VALUES ('49', '果味', '5');
INSERT INTO `food_category` VALUES ('50', '大众', '4');

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `note_msg` varchar(255) DEFAULT NULL,
  `note_time` datetime DEFAULT NULL,
  `upvote_total` int(6) DEFAULT NULL,
  `comment_total` int(6) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES ('1', '1', '美食旅行记录', '身份证名字能当“肉 ”吃？劲爆免单+7折福利！肉食控警告你！这家烤肉店会把你朋友圈仇恨值翻倍！连续一个月给你送外卖，外卖堂食全场8折！这家网红小龙虾正式落地上邦，据说有人已经等了它365天…百年殿堂级抹茶认证！超高颜值抹茶店已被挤爆，“1”你所想！“1”你疯狂！双“11”大奖等你来拿啦~新晋街霸椰子的100种玩法，连续九天大放价！还要免费送你【古法制作】的牛奶龟苓膏！风靡全海口的蒸汽海鲜料理两岁了！敢蒸就是真新鲜，吃出健康本真的味道！', '2017-09-26 16:49:17', '1', '4', '');
INSERT INTO `note` VALUES ('2', '2', '日月广场最新美味', '日月广场藏着一只玻璃烧鹅，从头脆到尾，全场7.8折吃鹅还有五折劵送！日月广场这家店女神节，将是全海口女神最多的地方！日月广场迎来3月份超强福利！6.8折吃海鲜！龙虾100一只！双子座打卡！在日月广场6.8折吃地道の日本料理！别人的手艺拼料理，而你的手艺…日月广场开了一家,超大的必胜客!不要再问我去哪里聚餐了,我只能帮你到这里....日月广场这家店要火火火！57度湘免单福利！颠覆你三观！', '2017-10-03 16:49:28', '1', '1', '');
INSERT INTO `note` VALUES ('3', '2', '用一锅武林秘籍，称霸武林！大侠请收下我の膝盖~', '水果捞之王，开到府城！秘制奶茶加首创配料！打造最“捞”甜品店，来这吃一碗“彩虹色”吧。', '2017-10-03 16:49:40', '1', '1', '');
INSERT INTO `note` VALUES ('4', '2', '一人我饮酒醉，不如花雕与鸡配！', '6.8折深扒一家最适合吃鸡的店！这家音乐餐吧为每一位吃货量身定制折扣福利！这么有腔调的玩法我也是头一次见！将粤菜精粹拆解再匠心升华，这家正宗粤式酒楼，100+道美味6.8折开吃!舌尖大爆炸！5折吃蒸汽海鲜！还玩全自动新花样？必须曝光这家搞事情的海鲜店~5折就能吃到这么正宗的东南亚菜！还可以边看夜景边吃海鲜！咖喱迷已经失控！顺德醉鹅万华新店璀璨开业！', '2017-09-26 16:49:50', '1', '2', '');
INSERT INTO `note` VALUES ('5', '2', '【大福利】碰“瓷”？！', '免单？！人均四十吃撑你的胃！50+种菜品任你吃在海甸岛这家优雅别致的花园别墅里，不仅可以品咖啡看樱花，还有超正宗的湖北私房菜！榴莲发烧友|从屏幕里溢出来的重口味道！16元就能吃正宗的榴莲蜜烤！！', '2017-10-02 16:49:57', '1', '1', '');
INSERT INTO `note` VALUES ('6', '3', '3', '3', '2017-10-17 16:50:04', '1', '4', '');
INSERT INTO `note` VALUES ('49', '2', '11', '11', '2018-03-26 15:22:05', '0', '0', '\0');
INSERT INTO `note` VALUES ('50', '2', '22', '222', '2018-03-26 15:22:07', '0', '0', '\0');
INSERT INTO `note` VALUES ('51', '2', '33', '333', '2018-03-26 15:22:09', '0', '0', '\0');

-- ----------------------------
-- Table structure for note_reply
-- ----------------------------
DROP TABLE IF EXISTS `note_reply`;
CREATE TABLE `note_reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `note_id` bigint(20) DEFAULT NULL,
  `reply_msg` varchar(255) DEFAULT NULL,
  `reply_time` datetime DEFAULT NULL,
  `see` bit(1) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `floor_number` int(5) DEFAULT NULL,
  `resp_user_id` bigint(20) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of note_reply
-- ----------------------------
INSERT INTO `note_reply` VALUES ('1', '1', '1', '记录写的不错，点个赞', '2017-10-03 19:28:42', '\0', '0', '2', '0', null);
INSERT INTO `note_reply` VALUES ('2', '1', '2', '', '2017-10-04 19:28:57', '\0', '0', '2', '0', null);
INSERT INTO `note_reply` VALUES ('3', '2', '1', '这是我见过个的比较好的记录了，详细且真实', '2017-10-26 16:08:47', '\0', '0', '3', '0', null);
INSERT INTO `note_reply` VALUES ('4', '3', '3', 'ss', '2017-10-11 16:15:51', '\0', '0', '1', '0', null);
INSERT INTO `note_reply` VALUES ('5', '4', '4', 'xx', '2017-10-04 16:16:04', '', '0', '3', '0', null);
INSERT INTO `note_reply` VALUES ('6', '4', '5', 'cc', '2017-10-04 10:32:39', '\0', '0', '1', '0', null);
INSERT INTO `note_reply` VALUES ('7', '4', '4', 'xx', '2017-10-04 16:16:04', '', '0', '2', '0', null);
INSERT INTO `note_reply` VALUES ('13', '2', '1', '<p><strong>这篇文章真不错</strong><br/></p>', '2018-03-24 09:03:07', '\0', '1', '1', '0', null);
INSERT INTO `note_reply` VALUES ('14', '2', '1', '<p><strong>这是一篇好文章</strong><br/></p>', '2018-03-24 09:17:18', '\0', '1', '2', '2', null);
INSERT INTO `note_reply` VALUES ('31', '2', '1', '<p><span style=\"color: rgb(192, 0, 0);\">点个赞</span><br/></p>', '2018-03-24 10:42:19', '\0', '0', '4', '0', null);
INSERT INTO `note_reply` VALUES ('137', '2', '1', '<p>aaa<br/></p>', '2018-03-25 17:52:57', '\0', '0', '5', '0', null);
INSERT INTO `note_reply` VALUES ('138', '2', '1', '<p>aaa<br/></p>', '2018-03-25 17:52:57', '\0', '0', '6', '0', null);
INSERT INTO `note_reply` VALUES ('144', '2', '6', '<p>aaaa<br/></p>', '2018-03-25 17:55:57', '\0', '0', '1', '0', null);
INSERT INTO `note_reply` VALUES ('145', '2', '6', '<p>aaa<br/></p>', '2018-03-25 17:59:37', '\0', '0', '2', '0', null);
INSERT INTO `note_reply` VALUES ('155', '2', '3', 'aa', '2018-03-26 14:57:17', '\0', '4', '1', '0', null);
INSERT INTO `note_reply` VALUES ('156', '2', '3', 'zzz', '2018-03-26 14:57:20', '\0', '4', '2', '2', null);
INSERT INTO `note_reply` VALUES ('157', '2', '6', '<p><span style=\"color: rgb(192, 80, 77);\">太菜了2018-03-26</span></p>', '2018-03-26 20:58:21', '\0', '0', '3', '0', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(30) DEFAULT NULL,
  `login_password` varchar(30) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `user_type` int(2) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `notes` varchar(50) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '高港华', '1997', 'resource/pic\\15.jpg', '15754335612', '1657150887@qq.com', '1', '2', null, '橘子很好吃', '1960-01-01');
INSERT INTO `user` VALUES ('2', '刘世博', '1234', 'resource/pic\\userphoto20180325193607.jpg', '15754335611', '2563214521@qq.com', '1', '1', '山东-济南', 'sunshineboy', '1960-01-01');
INSERT INTO `user` VALUES ('3', '赵兰奇', '19970901', 'resource/pic\\12.jpg', '15754335689', '1234567891@qq.com', '1', '1', null, null, null);
INSERT INTO `user` VALUES ('4', '龚其', '1995', 'resource/pic\\13.jpg', '15754335689', '897845561@qq.com', '1', '1', null, null, null);
INSERT INTO `user` VALUES ('5', '吴兴超', '19960520', 'resource/pic\\14.jpg', '15265321142', '4556122306@qq.com', '0', '1', null, null, null);
INSERT INTO `user` VALUES ('6', '方倩雯', '19980521', 'resource/pic\\userphoto201711041.jpg', '', null, '1', '1', null, null, null);
INSERT INTO `user` VALUES ('7', '夏安娜', '19970911', 'resource/pic\\userphoto201711041.jpg', '15754335612', '1565451@qq.com', '0', '1', null, null, null);
INSERT INTO `user` VALUES ('32', '陈栓栓', 'aa', 'resource/pic\\userphoto20171106175736.jpg', '15754665239', 'fasdfas@qq.com', '0', '1', '河北-石家庄', 'aa', null);
INSERT INTO `user` VALUES ('33', '赵兰泣', '1997', null, '15754335619', 'fasdfasdfasdf@qq.com', '0', '1', '吉林-长春', 'fasdfasd', null);
INSERT INTO `user` VALUES ('34', '区号', '1234', null, '15754335968', '15754335682@qq.com', '1', '1', '吉林-松原', 'fasdfas', null);

-- ----------------------------
-- Table structure for user_category
-- ----------------------------
DROP TABLE IF EXISTS `user_category`;
CREATE TABLE `user_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_category
-- ----------------------------
INSERT INTO `user_category` VALUES ('1', '普通用户');
INSERT INTO `user_category` VALUES ('2', '管理员');
INSERT INTO `user_category` VALUES ('3', '商家');

-- ----------------------------
-- Table structure for user_comment
-- ----------------------------
DROP TABLE IF EXISTS `user_comment`;
CREATE TABLE `user_comment` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) DEFAULT NULL,
  `food_id` bigint(11) DEFAULT NULL,
  `score` float(3,2) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `comment_time` datetime DEFAULT NULL,
  `read` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_comment
-- ----------------------------
INSERT INTO `user_comment` VALUES ('1', '1', '2', '2.20', 'very eat', '2017-09-26 09:42:34', '');
INSERT INTO `user_comment` VALUES ('2', '2', '2', '1.33', 'this is delicious foodgsdfgsdfgsdfgsdfgsdfgsd', '2017-10-21 10:13:30', '');
INSERT INTO `user_comment` VALUES ('3', '1', '3', '1.64', 'this is delicious food', '2017-10-21 11:02:46', '');
INSERT INTO `user_comment` VALUES ('4', '3', '2', '1.00', 'this is delicious food', '2017-10-21 11:02:56', '');
INSERT INTO `user_comment` VALUES ('5', '1', '2', '0.00', '你想说些什么吗？', '2017-11-05 11:03:13', null);
INSERT INTO `user_comment` VALUES ('6', '1', '2', '0.00', '你想说些什么吗？', '2017-11-05 11:12:06', null);
INSERT INTO `user_comment` VALUES ('50', '1', '2', '0.00', '你想说些什么吗？fasdfasdfsadfasdfasdfasdfasdfsaaaaaaaaaaaaaaaaaaaaa', '2017-11-05 11:38:51', null);
INSERT INTO `user_comment` VALUES ('51', '1', '2', '0.00', '很好吃', '2017-11-05 11:39:39', null);
INSERT INTO `user_comment` VALUES ('52', '1', '3', '0.00', '很好吃', '2017-11-05 11:40:09', null);
INSERT INTO `user_comment` VALUES ('53', '1', '4', '0.00', 'very good', '2017-11-05 11:40:38', null);
INSERT INTO `user_comment` VALUES ('54', '1', '4', '0.00', '你想说些什么吗？', '2017-11-05 12:13:06', null);
INSERT INTO `user_comment` VALUES ('55', '1', '4', '0.00', '你想说些什么吗？', '2017-11-05 12:19:24', null);
INSERT INTO `user_comment` VALUES ('56', '1', '3', '0.00', '你想说些什么吗？', '2017-11-05 12:35:44', null);
INSERT INTO `user_comment` VALUES ('57', '1', '26', '0.00', '你想说些什么吗？', '2017-11-06 20:00:55', null);
INSERT INTO `user_comment` VALUES ('58', '1', '3', '0.00', '你想说些什么吗？', '2017-11-07 16:29:10', null);
INSERT INTO `user_comment` VALUES ('59', '1', '3', '0.00', '你想说些什么吗？fsdafasdfasdfasd', '2017-11-07 16:29:45', null);
INSERT INTO `user_comment` VALUES ('60', '1', '3', '0.00', '你想说些什么吗？', '2017-11-07 16:30:28', null);
INSERT INTO `user_comment` VALUES ('61', '2', '4', '0.00', '你想说些什么吗？', '2017-11-07 16:41:48', null);
INSERT INTO `user_comment` VALUES ('62', '2', '4', '0.00', '你想说些什么吗？', '2017-11-07 16:41:51', null);
INSERT INTO `user_comment` VALUES ('63', '2', '4', '0.00', 'fasdfasd', '2018-03-19 19:29:13', null);
INSERT INTO `user_comment` VALUES ('64', '1', '40', '0.00', '尝试了一下，吃起来特别不错', '2018-03-19 19:39:45', null);

-- ----------------------------
-- Table structure for user_favorites
-- ----------------------------
DROP TABLE IF EXISTS `user_favorites`;
CREATE TABLE `user_favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `food_id` bigint(20) DEFAULT NULL,
  `collect_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_favorites
-- ----------------------------
INSERT INTO `user_favorites` VALUES ('5', '2', '2', '2017-10-18 16:34:40');
INSERT INTO `user_favorites` VALUES ('6', '3', '3', '2017-10-12 16:34:49');
INSERT INTO `user_favorites` VALUES ('7', '4', '3', '2017-10-25 16:36:14');
INSERT INTO `user_favorites` VALUES ('17', '1', '8', '2017-10-30 09:47:10');
INSERT INTO `user_favorites` VALUES ('19', '1', '2', '2017-10-30 09:47:13');
INSERT INTO `user_favorites` VALUES ('42', '1', '4', '2017-11-06 20:04:17');
INSERT INTO `user_favorites` VALUES ('47', '1', '3', '2017-11-07 16:30:26');
INSERT INTO `user_favorites` VALUES ('52', '2', '31', '2017-11-08 20:45:40');
INSERT INTO `user_favorites` VALUES ('54', '2', '4', '2018-03-19 19:29:21');
INSERT INTO `user_favorites` VALUES ('55', '2', '40', '2018-03-19 19:40:19');

-- ----------------------------
-- Table structure for user_food_thumbsup
-- ----------------------------
DROP TABLE IF EXISTS `user_food_thumbsup`;
CREATE TABLE `user_food_thumbsup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `food_id` bigint(20) DEFAULT NULL,
  `thumbsup_time` datetime DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_food_thumbsup
-- ----------------------------
INSERT INTO `user_food_thumbsup` VALUES ('1', '3', '2', '2017-10-04 21:32:27', '1');
INSERT INTO `user_food_thumbsup` VALUES ('2', '4', '2', '2017-09-27 21:32:38', '1');
INSERT INTO `user_food_thumbsup` VALUES ('3', '5', '2', '2017-09-27 21:32:47', '1');
INSERT INTO `user_food_thumbsup` VALUES ('4', '4', '3', '2017-10-03 21:33:00', '1');
INSERT INTO `user_food_thumbsup` VALUES ('5', '1', '3', '2017-10-04 15:29:52', '1');
INSERT INTO `user_food_thumbsup` VALUES ('7', '1', '8', '2017-10-29 19:39:26', '1');
INSERT INTO `user_food_thumbsup` VALUES ('8', '1', '4', '2017-10-29 19:40:46', '1');
INSERT INTO `user_food_thumbsup` VALUES ('10', '1', '2', '2017-10-29 20:13:06', '1');
INSERT INTO `user_food_thumbsup` VALUES ('11', '2', '4', '2017-11-07 16:41:42', '1');
INSERT INTO `user_food_thumbsup` VALUES ('12', '2', '30', '2017-11-07 17:21:04', '1');
INSERT INTO `user_food_thumbsup` VALUES ('13', '2', '31', '2017-11-08 20:45:36', '1');

-- ----------------------------
-- Table structure for user_recommend
-- ----------------------------
DROP TABLE IF EXISTS `user_recommend`;
CREATE TABLE `user_recommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `food_id` int(11) DEFAULT NULL,
  `recommend_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_recommend
-- ----------------------------
INSERT INTO `user_recommend` VALUES ('1', '1', '2', '2017-09-27 21:43:35');
INSERT INTO `user_recommend` VALUES ('2', '1', '3', '2017-10-12 15:13:18');
INSERT INTO `user_recommend` VALUES ('3', '2', '4', '2017-10-20 15:13:25');
INSERT INTO `user_recommend` VALUES ('4', '1', '4', '2017-10-04 11:16:26');
INSERT INTO `user_recommend` VALUES ('5', '1', '8', '2017-10-04 11:16:34');
INSERT INTO `user_recommend` VALUES ('6', '1', '25', '2017-11-08 19:35:17');
INSERT INTO `user_recommend` VALUES ('7', '1', '26', '2017-11-22 19:35:23');
INSERT INTO `user_recommend` VALUES ('8', '1', '27', '2017-11-02 19:35:35');
INSERT INTO `user_recommend` VALUES ('9', '1', '28', '2017-11-15 19:35:42');
INSERT INTO `user_recommend` VALUES ('10', '2', '30', '2017-11-07 17:02:35');
INSERT INTO `user_recommend` VALUES ('11', '2', '31', '2017-11-08 15:50:10');
INSERT INTO `user_recommend` VALUES ('12', '2', '40', '2018-03-19 19:37:51');
