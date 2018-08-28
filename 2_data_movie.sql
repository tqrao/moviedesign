/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50638
Source Host           : localhost:3306
Source Database       : data_movie

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-06-10 12:43:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_account
-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account` (
  `name` varchar(20) DEFAULT NULL,
  `pswd` varchar(20) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_account
-- ----------------------------
INSERT INTO `t_account` VALUES ('acc', '123456', '7452.00', 'vx');

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `admin_name` varchar(20) NOT NULL,
  `admin_pswd` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('admin', '123456');
INSERT INTO `t_admin` VALUES ('root', '123456');

-- ----------------------------
-- Table structure for t_cinema
-- ----------------------------
DROP TABLE IF EXISTS `t_cinema`;
CREATE TABLE `t_cinema` (
  `cinema_id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_name` varchar(50) DEFAULT NULL,
  `cinema_addr` varchar(50) DEFAULT NULL,
  `cinema_info` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`cinema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cinema
-- ----------------------------
INSERT INTO `t_cinema` VALUES ('5', '中影国际影城合肥中环店', ' 合肥市经开发区繁华大道与翡翠路交叉口中环购物中心3楼', '合肥中影国际影城中环店，是由中国电影集团公司斥资千余万倾力打造的一流五星级全数字化豪华影城。影城位于经开区中环城核心地带，拥有9个影厅，1630个豪华坐席，全数字化放映设备，3D立体电影，画面更加逼真、立体可感，安徽省首家应用TMS中央控制播放系统，是目前合肥政经区档次最高、设备最新的现代化国际影城。音响设备采用最先进的美国JBL扬声器，环绕声场，音效还原效果极佳。SR.D数码环绕立体声还音设备等钻石级视听设备。使电影声音的感染力、震撼力达到了前所未有的水平。影城整体设计华丽时尚，超大迷幻星际吊顶设计，让顾客如置身于炫丽的迷幻星际之中，举手抬足、应接无暇般的视觉冲击给顾客遐想萦绕万千、冲击思维巅峰的不同感受。影厅内全部采用人性化设计的高档座椅，每个厅超大的视觉坡度，更宽的排距，同时加上影厅开阔的空间，充分保证了高品质的观影所需。VIP厅更有尊贵商务机舱座椅配置，可躺可卧舒适入微。');
INSERT INTO `t_cinema` VALUES ('6', '大地影院合肥港澳影院', '安徽合肥蜀山区经济开发区翡翠路港澳广场4楼大地数字影院', '影迷群：118459268 \r\nqq号码：1486069702 \r\n新浪微博：http://weibo.com/dadifeicui \r\n微信号：大地数字影院--合肥港澳 \r\n腾讯微博：http://t.qq.com/dadi-feicui \r\n合肥大地数字影院欢迎您的光临！');
INSERT INTO `t_cinema` VALUES ('7', '万达影城', '蜀山区 长江西路与肥西路交叉口之心城商业中心7楼', '保利DMC合肥国际影城是中国保利影业在合肥三里庵黄金商圈倾力打造的国际影城。 影城秉承公司“创百年老店、造精品影城”的经营理念，携保利影业数字放映系统——POLY MAX(保利巨幕)进驻合肥。POLY MAX是保利影业运用新式电影科技建设的高清晰、高亮度、大银幕画面和高保真立体声音响的数字立体电影放映系统。该系统具备高清巨幕实况远程转播功能，银幕宽度达16米，声道可达13.1个。它借助独特的放映系统：包括影像投影捕捉，音响系统和加上特殊规划的座位设计，使观众完全融入电影情景中。共有8个厅，包含一个POLY MAX巨幕厅和一个VIP厅，可容纳1500人同时观影。全金属屏幕，更好的还原影片色彩；双机2K分辨率，13.1声道，著名音响品牌JBL音响，共同打造保利影城优质视听体验；27寸苹果一体机售票系统，一站式自动购票体系，让“轻松选位无需排队”的**购票体验成为可能。影城将结合保利集团在电影产业的全产业链优势，立足三里庵商圈，辐射整个合肥市区，体现人性化服务，享受影城多元化的功能，为市民的多彩生活注入新的时尚元素，全心全意为合肥居民提供观影体验。');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(20) DEFAULT NULL,
  `comment_content` varchar(200) DEFAULT NULL,
  `comment_time` datetime DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('4', '厉害了，我的国', '好看好看', '2018-05-02 23:21:58', 'tqr');
INSERT INTO `t_comment` VALUES ('5', '厉害了，我的国', '大国形象复苏', '2018-05-17 23:22:37', 'money');
INSERT INTO `t_comment` VALUES ('23', '大话西游', '3242343252', '2018-05-30 23:49:41', 'user');
INSERT INTO `t_comment` VALUES ('24', '厉害了，我的国', '厉害呀', '2018-05-30 23:56:23', 'user');
INSERT INTO `t_comment` VALUES ('25', '大话西游', '还不错', '2018-05-31 00:25:04', 'user');
INSERT INTO `t_comment` VALUES ('26', '后来的我们', '挺好看的', '2018-05-31 02:51:05', 'user');
INSERT INTO `t_comment` VALUES ('27', '大话西游', '还不错的样子', '2018-05-31 03:23:21', 'user');

-- ----------------------------
-- Table structure for t_movie
-- ----------------------------
DROP TABLE IF EXISTS `t_movie`;
CREATE TABLE `t_movie` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(50) NOT NULL,
  `movie_type` varchar(20) DEFAULT NULL,
  `movie_price` decimal(10,2) DEFAULT NULL,
  `movie_info` varchar(200) DEFAULT NULL,
  `director` varchar(20) DEFAULT NULL,
  `roles` varchar(200) DEFAULT NULL,
  `screentime` date DEFAULT NULL,
  `movie_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='电影表';

-- ----------------------------
-- Records of t_movie
-- ----------------------------
INSERT INTO `t_movie` VALUES ('1', '后来的我们', '剧情、爱情', '55.00', '这是一个爱情故事，关于一对异乡漂泊的年轻人。十年前，林见清（井柏然 饰）和方小晓（周冬雨 饰）偶然地相识在归乡过年的火车上。两人怀揣着共同的梦想，一起在北京打拼，并开始了一段相聚相离的情感之路。十年后，见清和小晓在飞机上再次偶然重逢……命运似乎是一个轮回。在一次次的偶然下，平行线交叉，再平行，故事始终有“然后”。可后来的他们，学会如何去爱了吗？', '刘若', '井柏然，周冬雨，田壮壮', '2019-04-03', 'img/001.jpg');
INSERT INTO `t_movie` VALUES ('2', '大话西游3', '魔幻、爱情、喜剧', '48.00', '孙悟空（周星驰 饰）护送唐三藏（罗家英 饰）去西天取经路上，与牛魔王（陆树铭 饰）合谋欲杀害唐三藏，并偷走了月光宝盒，此举使观音萌生将其铲除心思，经唐三藏请求，孙悟空被判五百年后重新投胎做人赎其罪孽。', '刘镇伟、朱锐斌', '黄子韬，尹正，赵艺，刘天佐，杜若溪，温心', '2017-09-28', 'img/002.jpg');
INSERT INTO `t_movie` VALUES ('3', '厉害了，我的国', '纪录片', '34.00', '《厉害了我的国》是在中央电视台财经频道在2017年9月隆重推出的内容众筹纪录片 。该片向全国观众发出邀请：用自己的镜头记录下身边的发展变化，讲述百姓眼中的中国故事。', '央视财经频道', '', '2018-05-10', 'img/003.jpg');
INSERT INTO `t_movie` VALUES ('4', '红海行动', '动作、剧情、战争', '43.00', '该片讲述了中国海军“蛟龙突击队”8人小组奉命执行撤侨任务，突击队兵分两路进行救援，但不幸遭到伏击，人员伤亡；同时在粉碎叛军武装首领的惊天阴谋中惨胜的故事', '林超贤', '张译，黄景瑜，海清，杜江，蒋璐霞', '2018-05-16', 'img/004.jpg');
INSERT INTO `t_movie` VALUES ('5', '既然青春留不住', '喜剧、爱情', '35.00', '影片改编自小说《当菠菜遇上空心菜》，讲述了张翰饰演的王劲辉与陈乔恩饰演的周蕙从大学时期的青涩恋爱开始，跨越十年的爱情故事。', '田蒙', '张翰，陈乔恩，王啸坤，施予斐，贾盛强', '2018-05-10', 'img/005.jpg');
INSERT INTO `t_movie` VALUES ('6', '三生三世十里桃花', '古装、爱情、玄幻', '56.00', '翼君擎苍向神族挑起战争，神族付出惨痛代价封印了擎苍，同年天孙夜华出世。七万年后擎苍破出封印，青丘狐帝幺女白浅再次将擎苍封印，因此被封法力、记忆和容貌，落入凡尘与夜华相识、相恋，后被带入天宫。', '林玉芬', '杨幂，赵又廷，张智尧，迪丽热巴，连奕名', '2018-05-15', 'img/006.jpg');
INSERT INTO `t_movie` VALUES ('18', '超时空同居', '喜剧,爱情,奇幻', '38.50', '来自2018年谷小焦（佟丽娅 饰）与1999年陆鸣（雷佳音 饰），两人时空重叠意外住在同一个房间。从互相嫌弃到试图“共谋大业”，阴差阳错发生了一系列好笑的事情。乐在其中的两人并不知道操控这一切的神秘人竟是想要去2037年“投机取巧”的2018年的……', '苏伦', '雷佳音，佟丽娅，徐峥', '2018-05-18', 'img/超时空同居.jpg');
INSERT INTO `t_movie` VALUES ('19', '复仇者联盟3：无限战争', '动作,冒险,科幻', '45.00', '银河系中的至尊霸主灭霸（乔什·布洛林饰）带着几个得力手下洗劫了全宇宙，只为了将所有的无限宝石镶嵌于金属手套上，这个手套可以将整个银河系毁灭于弹指间。为了拯救宇宙，托尼·斯塔克（小罗伯特·唐尼饰）和史蒂夫·罗杰斯（克里斯·埃文斯饰）需要摒弃前嫌，重组复仇者联盟，并与蜘蛛侠（汤姆·赫兰德饰）、奇异博士（本尼迪克特·康伯巴奇饰）、银河护卫队、黑豹（查德维克·博斯曼饰）以及瓦坎达人民的力量一同作战', '安东尼·罗素', '小罗伯特·唐尼，乔什·布洛林，克里斯·埃文斯，克里斯·海姆斯沃斯，斯嘉丽·约翰逊，马克·鲁法洛，本尼迪克特·康伯巴奇，克里斯·帕拉特', '2018-04-27', 'img/复仇者联盟3：无限战争.jpg');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `order_id` varchar(15) NOT NULL,
  `user_id` varchar(13) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `cinema_id` int(11) DEFAULT NULL,
  `cinema_name` varchar(20) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `cinema_addr` varchar(20) DEFAULT NULL,
  `movie_name` varchar(20) DEFAULT NULL,
  `movie_type` varchar(20) DEFAULT NULL,
  `showtime` datetime DEFAULT NULL,
  `seat_row` int(11) DEFAULT NULL,
  `order_count` int(11) DEFAULT NULL,
  `movie_price` decimal(10,2) DEFAULT NULL,
  `seat_col` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `room_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_room
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(20) DEFAULT NULL,
  `cinema_name` varchar(20) DEFAULT NULL,
  `row` int(11) DEFAULT NULL,
  `col` int(11) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room
-- ----------------------------
INSERT INTO `t_room` VALUES ('8', '1号厅', '中影国际影城合肥中环店', '10', '10');
INSERT INTO `t_room` VALUES ('9', '3号厅', '大地影院合肥港澳影院', '12', '12');
INSERT INTO `t_room` VALUES ('11', '4号厅', '大地影院合肥港澳影院', '15', '15');
INSERT INTO `t_room` VALUES ('12', '8号厅', '大地影院合肥港澳影院', '30', '26');
INSERT INTO `t_room` VALUES ('13', '2号厅', '万达影城', '20', '20');
INSERT INTO `t_room` VALUES ('14', '1号厅', '万达影城', '15', '20');
INSERT INTO `t_room` VALUES ('15', '3号厅', '万达影城', '24', '25');
INSERT INTO `t_room` VALUES ('19', '2号厅', '中影国际影城合肥中环店', '20', '20');
INSERT INTO `t_room` VALUES ('20', '3号厅', '中影国际影城合肥中环店', '30', '30');

-- ----------------------------
-- Table structure for t_seat
-- ----------------------------
DROP TABLE IF EXISTS `t_seat`;
CREATE TABLE `t_seat` (
  `show_id` int(11) DEFAULT NULL,
  `seat_row` int(11) DEFAULT NULL,
  `seat_col` int(11) DEFAULT NULL,
  `seat_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_seat
-- ----------------------------
INSERT INTO `t_seat` VALUES ('8', '1', '1', '2');
INSERT INTO `t_seat` VALUES ('8', '1', '2', '2');
INSERT INTO `t_seat` VALUES ('8', '1', '14', '2');
INSERT INTO `t_seat` VALUES ('8', '2', '2', '2');
INSERT INTO `t_seat` VALUES ('8', '3', '3', '2');
INSERT INTO `t_seat` VALUES ('8', '4', '4', '2');
INSERT INTO `t_seat` VALUES ('8', '5', '8', '2');

-- ----------------------------
-- Table structure for t_show
-- ----------------------------
DROP TABLE IF EXISTS `t_show`;
CREATE TABLE `t_show` (
  `show_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(20) DEFAULT NULL,
  `cinema_name` varchar(20) DEFAULT NULL,
  `room_name` varchar(20) DEFAULT NULL,
  `show_time` datetime DEFAULT NULL,
  PRIMARY KEY (`show_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='档期表';

-- ----------------------------
-- Records of t_show
-- ----------------------------
INSERT INTO `t_show` VALUES ('4', '厉害了，我的国', '中影国际影城合肥中环店', '1号厅', '2018-05-11 04:05:00');
INSERT INTO `t_show` VALUES ('5', '大话西游', '中影国际影城合肥中环店', '1号厅', '2018-05-02 08:30:00');
INSERT INTO `t_show` VALUES ('6', '厉害了，我的国', '大地影院合肥港澳影院', '1号厅', '2018-05-12 04:35:00');
INSERT INTO `t_show` VALUES ('7', '厉害了，我的国', '万达影城', '1号厅', '2018-05-09 02:02:00');
INSERT INTO `t_show` VALUES ('8', '后来的我们', '中影国际影城合肥中环店', '1号厅', '2018-06-01 10:00:00');
INSERT INTO `t_show` VALUES ('9', '后来的我们', '中影国际影城合肥中环店', '2号厅', '2018-06-01 06:02:00');
INSERT INTO `t_show` VALUES ('10', '后来的我们', '中影国际影城合肥中环店', '3号厅', '2018-06-02 20:23:00');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` varchar(13) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_age` int(11) DEFAULT NULL,
  `user_sex` varchar(4) DEFAULT NULL,
  `user_pswd` varchar(20) NOT NULL,
  `user_money` decimal(10,2) DEFAULT NULL,
  `user_phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1525855023248', 'xzdc', '7', '女', '123456', '43.00', '12345678900');
SET FOREIGN_KEY_CHECKS=1;
