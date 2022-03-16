USE `shl`;

DROP TABLE IF EXISTS `invoice`;
DROP TABLE IF EXISTS `address`;
DROP TABLE IF EXISTS `adlog`;
DROP TABLE IF EXISTS `admin`;
DROP TABLE IF EXISTS `complain`;
DROP TABLE IF EXISTS `member`;
DROP TABLE IF EXISTS `depart`;
DROP TABLE IF EXISTS `dlog`;
DROP TABLE IF EXISTS `refundapp`;
DROP TABLE IF EXISTS `ulog`;
DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `goods`;
DROP TABLE IF EXISTS `driver`;
DROP TABLE IF EXISTS `taguser`;
DROP TABLE IF EXISTS `taglevel`;


CREATE TABLE `address`  (
  `add_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `u_id_a` int UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `defultloc` int NULL COMMENT '0默认,1其他',
  PRIMARY KEY (`add_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `adlog`  (
  `al_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `addtime` datetime NOT NULL COMMENT '登录时间',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆地址',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器名称',
  PRIMARY KEY (`al_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `admin`  (
  `a_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`a_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `complain`  (
  `c_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `o_id_c` int UNSIGNED NULL COMMENT '订单id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投诉详情',
  `date` datetime NULL COMMENT '投诉时间',
  PRIMARY KEY (`c_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `depart`  (
  `dept_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `dname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `member` int NULL COMMENT '成员',
  `desc` varchar(255) NULL COMMENT '描述',
  `active` int NULL DEFAULT 0 COMMENT '0未启用;1启用',
  PRIMARY KEY (`dept_id`) USING BTREE,
  UNIQUE INDEX `dname`(`dname`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `dlog`  (
  `dl_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `addtime` datetime NOT NULL COMMENT '登录时间',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆地址',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录方式',
  PRIMARY KEY (`dl_id`)
);

CREATE TABLE `driver`  (
  `d_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NULL COMMENT '账号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `username` varchar(255) NOT NULL COMMENT '司机昵称',
  `tname_d` varchar(255) NULL COMMENT '司机标签',
  `phone` varchar(255) NULL COMMENT '手机号',
  `sex` int NULL COMMENT '性别(0女,1男)',
  `birthday` datetime NULL COMMENT '生日',
  `city` varchar(255) NULL COMMENT '城市',
  `vocation` varchar(255) NULL COMMENT '职业',
  `signature` varchar(255) NULL COMMENT '个性签名',
  `hobby` varchar(255) NULL COMMENT '兴趣',
  `from` varchar(255) NULL COMMENT '用户来源',
  `enable` int ZEROFILL NULL DEFAULT 0 COMMENT '是否黑名单(0否，1是)',
  `addtime` datetime NULL COMMENT '注册时间',
  `status` int ZEROFILL NULL DEFAULT 0 COMMENT '是否审核(0待审核,1已审核,2未通过)',
  `idcard` varchar(255) NULL COMMENT '身份证路径',
  `idno` varchar(255) NULL COMMENT '身份证号',
  `dlisense` varchar(255) NULL COMMENT '行驶证路径',
  `insurance` varchar(255) NULL COMMENT '保险单路径',
  `head` varchar(255) NULL COMMENT '头像路径',
  `distance` double NULL COMMENT '行驶里程 ',
  PRIMARY KEY (`d_id`),
  UNIQUE INDEX `account`(`account`)
);

CREATE TABLE `goods`  (
  `g_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `gname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `price` double NULL DEFAULT NULL COMMENT '价格',
  `volume` double NULL COMMENT '体积',
  `weight` double NULL COMMENT '重量',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`g_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `invoice`  (
  `i_Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NULL COMMENT '发票类型',
  `title` varchar(255) NULL COMMENT '发票抬头',
  `content` varchar(255) NULL COMMENT '内容',
  `o_id_i` int UNSIGNED NULL COMMENT '订单id',
  PRIMARY KEY (`i_Id`)
);

CREATE TABLE `member`  (
  `m_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `post` varchar(255) NULL COMMENT '成员职称',
  `email` varchar(255) NULL COMMENT '邮箱',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `dept` varchar(255) NULL COMMENT '所属部门',
  PRIMARY KEY (`m_id`)
);

CREATE TABLE `order`  (
  `o_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ordernum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `status` int NULL DEFAULT 1 COMMENT '订单状态(1待付款,2待发货,3正配送,4已完成,5已关闭)',
  `addtime` datetime NOT NULL COMMENT '订单时间',
  `rectime` datetime NULL COMMENT '收货时间(完成时间)',
  `consignee_o` int UNSIGNED NOT NULL COMMENT '收货人用户id',
  `shipper_o` int UNSIGNED NOT NULL COMMENT '发货人id',
  `g_id_o` int UNSIGNED NOT NULL COMMENT '商品id',
  `d_id_o` int UNSIGNED NOT NULL COMMENT '司机id',
  `price` double NOT NULL COMMENT '价格',
  `progress` int NULL DEFAULT 1 COMMENT '进度(1提交订单,2支付订单,3司机取货,4确认收货,5完成评价)',
  `starlevel` varchar(255) NULL DEFAULT '' COMMENT '0到5星',
  `evaluation` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评价',
  `address_c` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单收货地址',
  `address_s` varchar(255) NOT NULL COMMENT '订单发货地址',
  `note` varchar(255) NULL COMMENT '订单备注',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消订单原因',
  `comment` varchar(255) NULL COMMENT '订单取消备注',
  PRIMARY KEY (`o_id`) USING BTREE,
  UNIQUE INDEX `ordernum`(`ordernum`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `refundapp`  (
  `r_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `sernum` varchar(255) NULL COMMENT '服务单号',
  `o_id_r` int UNSIGNED NULL COMMENT '订单',
  `appdate` datetime NULL COMMENT '申请时间',
  `type` varchar(255) NULL COMMENT '退款类型',
  PRIMARY KEY (`r_id`),
  UNIQUE INDEX `sernum`(`sernum`)
);

CREATE TABLE `taglevel`  (
  `t_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `tname` varchar(255) NULL,
  `negcom` int NULL COMMENT ' 累计差评数',
  `comp` int NULL COMMENT '累计投诉数',
  `poscom` int NULL COMMENT '累计好评个数',
  `success` int NULL COMMENT '累计差评个数',
  PRIMARY KEY (`t_id`),
  UNIQUE INDEX `tname`(`tname`)
);

CREATE TABLE `taguser`  (
  `tu_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `tname` varchar(255) NULL COMMENT '标签名称',
  `money` int NULL COMMENT '累计金额',
  `success` int NULL COMMENT '累计成功交易个数',
  PRIMARY KEY (`tu_id`),
  UNIQUE INDEX `tname`(`tname`)
);

CREATE TABLE `ulog`  (
  `ul_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `addtime` datetime NOT NULL COMMENT '登录时间',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆地址',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录方式',
  PRIMARY KEY (`ul_id`)
);

CREATE TABLE `user`  (
  `u_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `email` varchar(255) NULL COMMENT '邮箱',
  `addtime` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `phone` varchar(255) NOT NULL COMMENT '手机号',
  `sex` int NULL COMMENT '性别(0女,1男)',
  `birthday` datetime NULL COMMENT '生日',
  `city` varchar(255) NULL COMMENT '城市',
  `vocation` varchar(255) NULL COMMENT '职业',
  `signature` varchar(255) NULL COMMENT '个性签名',
  `hobby` varchar(255) NULL COMMENT '兴趣',
  `from` varchar(255) NULL COMMENT '用户来源',
  `level_u` varchar(255) NULL DEFAULT NULL COMMENT '等级',
  `value` int NULL DEFAULT 0 COMMENT '成长值',
  `money` int NOT NULL DEFAULT 0 COMMENT '郎币',
  PRIMARY KEY (`u_id`) USING BTREE,
  UNIQUE INDEX `account`(`account`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

ALTER TABLE `address` ADD CONSTRAINT `u_id_a` FOREIGN KEY (`u_id_a`) REFERENCES `user` (`u_id`);
ALTER TABLE `complain` ADD CONSTRAINT `o_id_c` FOREIGN KEY (`o_id_c`) REFERENCES `order` (`o_id`);
ALTER TABLE `driver` ADD CONSTRAINT `tname_d` FOREIGN KEY (`tname_d`) REFERENCES `taglevel` (`tname`);
ALTER TABLE `invoice` ADD CONSTRAINT `o_id_i` FOREIGN KEY (`o_id_i`) REFERENCES `order` (`o_id`);
ALTER TABLE `member` ADD CONSTRAINT `dept` FOREIGN KEY (`dept`) REFERENCES `depart` (`dname`);
ALTER TABLE `order` ADD CONSTRAINT `consignee_o` FOREIGN KEY (`consignee_o`) REFERENCES `user` (`u_id`);
ALTER TABLE `order` ADD CONSTRAINT `shpper_o` FOREIGN KEY (`shipper_o`) REFERENCES `user` (`u_id`);
ALTER TABLE `order` ADD CONSTRAINT `g_id_o` FOREIGN KEY (`g_id_o`) REFERENCES `goods` (`g_id`);
ALTER TABLE `order` ADD CONSTRAINT `d_id_o` FOREIGN KEY (`d_id_o`) REFERENCES `driver` (`d_id`);
ALTER TABLE `refundapp` ADD CONSTRAINT `o_id_r` FOREIGN KEY (`o_id_r`) REFERENCES `order` (`o_id`);
ALTER TABLE `user` ADD CONSTRAINT `level_u` FOREIGN KEY (`level_u`) REFERENCES `taguser` (`tname`);

