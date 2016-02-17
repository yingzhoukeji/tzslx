# -----------------------------------------------------------
# PHP-Amateur database backup files
# Blog: http://blog.51edm.org
# Type: 系统自动备份
# Description:当前SQL文件包含了表：pa_access、pa_ad、pa_admin、pa_apply、pa_category、pa_city、pa_field、pa_images、pa_input、pa_link、pa_marathon、pa_member、pa_message、pa_model、pa_nav、pa_news、pa_node、pa_page、pa_product、pa_role、pa_role_user、pa_tag、pa_wxhd的结构信息，表：pa_access、pa_ad、pa_admin、pa_apply、pa_category、pa_city、pa_field、pa_images、pa_input、pa_link、pa_marathon、pa_member、pa_message、pa_model、pa_nav、pa_news、pa_node、pa_page、pa_product、pa_role、pa_role_user、pa_tag、pa_wxhd的数据
# Time: 2015-09-04 03:04:51
# -----------------------------------------------------------
# 当前SQL卷标：#1
# -----------------------------------------------------------


# 数据库表：pa_access 结构信息
DROP TABLE IF EXISTS `pa_access`;
CREATE TABLE `pa_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限分配表' ;

# 数据库表：pa_ad 结构信息
DROP TABLE IF EXISTS `pa_ad`;
CREATE TABLE `pa_ad` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(60) NOT NULL DEFAULT '',
  `ad_link` varchar(255) NOT NULL DEFAULT '',
  `ad_img` varchar(255) NOT NULL,
  `position` char(10) NOT NULL DEFAULT '0',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_admin 结构信息
DROP TABLE IF EXISTS `pa_admin`;
CREATE TABLE `pa_admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL COMMENT '登录账号',
  `pwd` char(32) DEFAULT NULL COMMENT '登录密码',
  `status` int(11) DEFAULT '1' COMMENT '账号状态',
  `remark` varchar(255) DEFAULT '' COMMENT '备注信息',
  `find_code` char(5) DEFAULT NULL COMMENT '找回账号验证码',
  `time` int(10) DEFAULT NULL COMMENT '开通时间',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='网站后台管理员表' ;

# 数据库表：pa_apply 结构信息
DROP TABLE IF EXISTS `pa_apply`;
CREATE TABLE `pa_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `adress` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `hdid` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ;

# 数据库表：pa_category 结构信息
DROP TABLE IF EXISTS `pa_category`;
CREATE TABLE `pa_category` (
  `cid` int(5) NOT NULL AUTO_INCREMENT,
  `pid` int(5) DEFAULT NULL COMMENT 'parentCategory上级分类',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `type` char(2) NOT NULL DEFAULT 'n',
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='新闻分类表' ;

# 数据库表：pa_city 结构信息
DROP TABLE IF EXISTS `pa_city`;
CREATE TABLE `pa_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

# 数据库表：pa_field 结构信息
DROP TABLE IF EXISTS `pa_field`;
CREATE TABLE `pa_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `model_id` int(11) NOT NULL COMMENT '所属模型id',
  `name` varchar(128) NOT NULL COMMENT '字段名称',
  `comment` varchar(32) NOT NULL COMMENT '字段注释',
  `type` varchar(32) NOT NULL COMMENT '字段类型',
  `length` varchar(16) NOT NULL COMMENT '字段长度',
  `value` varchar(128) NOT NULL COMMENT '字段默认值',
  `is_require` tinyint(4) DEFAULT '0' COMMENT '是否必需',
  `is_unique` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否唯一',
  `is_index` tinyint(4) DEFAULT '0' COMMENT '是否添加索引',
  `is_system` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否系统字段',
  `is_list_show` tinyint(4) NOT NULL DEFAULT '1' COMMENT '列表中显示',
  `auto_filter` varchar(32) NOT NULL COMMENT '自动过滤函数',
  `auto_fill` varchar(32) NOT NULL COMMENT '自动完成函数',
  `fill_time` varchar(16) NOT NULL DEFAULT 'both' COMMENT '填充时机',
  `relation_model` int(11) NOT NULL COMMENT '关联的模型',
  `relation_field` varchar(128) NOT NULL COMMENT '关联的字段',
  `relation_value` varchar(128) NOT NULL COMMENT '关联显示的值',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `fk_field_model` (`model_id`),
  CONSTRAINT `pa_field_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `pa_model` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据模型字段' ;

# 数据库表：pa_images 结构信息
DROP TABLE IF EXISTS `pa_images`;
CREATE TABLE `pa_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(20) NOT NULL,
  `savename` varchar(100) NOT NULL,
  `savepath` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=723 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_input 结构信息
DROP TABLE IF EXISTS `pa_input`;
CREATE TABLE `pa_input` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `field_id` int(11) NOT NULL COMMENT '字段id',
  `is_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT '表单域是否显示',
  `label` varchar(32) NOT NULL COMMENT '表单域标签',
  `remark` varchar(128) NOT NULL COMMENT '表单域域',
  `type` varchar(32) NOT NULL COMMENT '表单域类型',
  `width` int(11) NOT NULL DEFAULT '20' COMMENT '表单域宽度',
  `height` int(11) NOT NULL DEFAULT '8' COMMENT '表单域高度',
  `opt_value` text NOT NULL COMMENT '表单域可选值',
  `value` varchar(128) NOT NULL COMMENT '表单域默认值',
  `editor` varchar(32) NOT NULL COMMENT '编辑器类型',
  `html` text NOT NULL COMMENT '表单域html替换',
  `show_order` int(11) DEFAULT NULL COMMENT '表单域显示顺序',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `fk_field_input` (`field_id`),
  CONSTRAINT `pa_input_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `pa_field` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字段表单域信息' ;

# 数据库表：pa_link 结构信息
DROP TABLE IF EXISTS `pa_link`;
CREATE TABLE `pa_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `display` int(1) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `target` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_marathon 结构信息
DROP TABLE IF EXISTS `pa_marathon`;
CREATE TABLE `pa_marathon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(3) DEFAULT NULL COMMENT '0,迷你，1，半马，2全马',
  `name` varchar(50) DEFAULT NULL COMMENT '参赛人姓名',
  `sex` tinyint(1) DEFAULT NULL COMMENT '0男 1女',
  `telephone` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `weixin` varchar(50) DEFAULT NULL,
  `bloodtype` tinyint(1) DEFAULT NULL COMMENT '血型0=A,1=B,2=AB,3=O',
  `birthday` datetime DEFAULT NULL,
  `schooling` int(2) DEFAULT NULL COMMENT '学历0=小学，1=初中，2=高中，3=大学',
  `occupation` varchar(30) DEFAULT NULL COMMENT '职业',
  `cardid` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `nationalityid` int(11) DEFAULT NULL COMMENT '国籍id',
  `cityid` int(11) DEFAULT NULL COMMENT '地区id',
  `adress` varchar(100) DEFAULT NULL COMMENT '地址',
  `postcode` int(11) DEFAULT NULL COMMENT '邮编',
  `clothessize` tinyint(1) DEFAULT NULL COMMENT '0超大、1大号、2中号、3小号、4偏小号',
  `joinin` varchar(255) DEFAULT NULL COMMENT '参与过的赛事',
  `istest` tinyint(1) DEFAULT '0' COMMENT '是否通过体检0，未通过，1通过',
  `trainrate` varchar(100) DEFAULT NULL COMMENT '训练频率',
  `mileage` int(11) DEFAULT '0' COMMENT '训练里程',
  `besttype1score` int(11) DEFAULT NULL,
  `besttype2score` int(11) DEFAULT NULL,
  `emergencycontactname` varchar(30) DEFAULT NULL COMMENT '紧急联系人姓名',
  `emergencycontactphone` varchar(11) DEFAULT NULL COMMENT '紧急联系人电话',
  `guardian` varchar(30) DEFAULT NULL COMMENT '监护人姓名',
  `guardianphone` varchar(11) DEFAULT NULL COMMENT '监护人电话',
  `guardiancid` varchar(18) DEFAULT NULL COMMENT '监护人身份证号',
  `guardianrelationship` varchar(30) DEFAULT NULL COMMENT '与监护人关系',
  `ispay` tinyint(1) DEFAULT '0' COMMENT '是否支付，0未支付，1已支付',
  `ordercode` varchar(32) DEFAULT NULL COMMENT '支付订单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

# 数据库表：pa_member 结构信息
DROP TABLE IF EXISTS `pa_member`;
CREATE TABLE `pa_member` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `weibo_uid` varchar(15) DEFAULT NULL COMMENT '对应的新浪微博uid',
  `headimgurl` varchar(200) DEFAULT NULL,
  `srcoe` int(11) DEFAULT '0',
  `openid` varchar(50) DEFAULT NULL,
  `tencent_uid` varchar(20) DEFAULT NULL COMMENT '腾讯微博UID',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `pwd` char(32) DEFAULT NULL COMMENT '密码',
  `reg_date` int(10) DEFAULT NULL,
  `reg_ip` char(15) DEFAULT NULL COMMENT '注册IP地址',
  `verify_status` int(1) DEFAULT '0' COMMENT '电子邮件验证标示 0未验证，1已验证',
  `verify_code` varchar(32) DEFAULT NULL COMMENT '电子邮件验证随机码',
  `verify_time` int(10) DEFAULT NULL COMMENT '邮箱验证时间',
  `verify_exp_time` int(10) DEFAULT NULL COMMENT '验证邮件过期时间',
  `find_fwd_code` varchar(32) DEFAULT NULL COMMENT '找回密码验证随机码',
  `find_pwd_time` int(10) DEFAULT NULL COMMENT '找回密码申请提交时间',
  `find_pwd_exp_time` int(10) DEFAULT NULL COMMENT '找回密码验证随机码过期时间',
  `avatar` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `birthday` int(10) DEFAULT NULL COMMENT '用户生日',
  `sex` int(1) DEFAULT NULL COMMENT '0女1男',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `province` varchar(100) DEFAULT NULL COMMENT '省份',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `intr` varchar(500) DEFAULT NULL COMMENT '个人介绍',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `phone` varchar(30) DEFAULT NULL COMMENT '电话',
  `fax` varchar(30) DEFAULT NULL,
  `qq` int(15) DEFAULT NULL,
  `msn` varchar(100) DEFAULT NULL,
  `login_ip` varchar(15) DEFAULT NULL COMMENT '登录ip',
  `login_time` int(10) DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=604 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='网站前台会员表' ;

# 数据库表：pa_message 结构信息
DROP TABLE IF EXISTS `pa_message`;
CREATE TABLE `pa_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `email` varchar(32) NOT NULL,
  `moblie` char(15) NOT NULL,
  `display` int(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `content` text NOT NULL,
  `headimgurl` varchar(500) DEFAULT NULL,
  `openid` varchar(100) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_model 结构信息
DROP TABLE IF EXISTS `pa_model`;
CREATE TABLE `pa_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(32) NOT NULL COMMENT '模型名称',
  `tbl_name` varchar(32) NOT NULL COMMENT '数据表名称',
  `menu_name` varchar(32) NOT NULL COMMENT '菜单名称',
  `is_inner` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为内部表',
  `has_pk` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否包含主键',
  `tbl_engine` varchar(16) NOT NULL DEFAULT 'InnoDB' COMMENT '引擎类型',
  `description` text NOT NULL COMMENT '模型描述',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据模型信息' ;

# 数据库表：pa_nav 结构信息
DROP TABLE IF EXISTS `pa_nav`;
CREATE TABLE `pa_nav` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL,
  `nav_name` varchar(255) NOT NULL,
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `guide` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `link` varchar(225) NOT NULL,
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn' COMMENT '语言',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `target` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=281 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_news 结构信息
DROP TABLE IF EXISTS `pa_news`;
CREATE TABLE `pa_news` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `cid` smallint(3) DEFAULT NULL COMMENT '所在分类',
  `title` varchar(200) DEFAULT NULL COMMENT '新闻标题',
  `keywords` varchar(50) DEFAULT NULL COMMENT '文章关键字',
  `description` mediumtext COMMENT '文章描述',
  `status` tinyint(1) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL COMMENT '文章摘要',
  `published` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `content` text,
  `click` int(11) NOT NULL DEFAULT '0',
  `aid` smallint(3) DEFAULT NULL COMMENT '发布者UID',
  `is_recommend` int(1) NOT NULL DEFAULT '0',
  `image_id` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(5) NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='新闻表' ;

# 数据库表：pa_node 结构信息
DROP TABLE IF EXISTS `pa_node`;
CREATE TABLE `pa_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='权限节点表' ;

# 数据库表：pa_page 结构信息
DROP TABLE IF EXISTS `pa_page`;
CREATE TABLE `pa_page` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(30) NOT NULL DEFAULT '',
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `page_name` varchar(150) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `display` int(1) NOT NULL DEFAULT '0',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_product 结构信息
DROP TABLE IF EXISTS `pa_product`;
CREATE TABLE `pa_product` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `cid` smallint(3) DEFAULT NULL COMMENT '所在分类',
  `title` varchar(200) DEFAULT NULL COMMENT '产品标题',
  `price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `psize` varchar(32) NOT NULL,
  `image_id` varchar(255) NOT NULL COMMENT '图片',
  `keywords` varchar(200) DEFAULT NULL COMMENT '产品关键字',
  `description` mediumtext COMMENT '产品描述',
  `status` tinyint(1) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL COMMENT '产品摘要',
  `published` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `content` text,
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  `aid` smallint(3) DEFAULT NULL COMMENT '发布者UID',
  `click` int(11) NOT NULL DEFAULT '0',
  `is_recommend` int(1) NOT NULL DEFAULT '0',
  `wap_display` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=482 DEFAULT CHARSET=utf8 COMMENT='产品表' ;

# 数据库表：pa_role 结构信息
DROP TABLE IF EXISTS `pa_role`;
CREATE TABLE `pa_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='权限角色表' ;

# 数据库表：pa_role_user 结构信息
DROP TABLE IF EXISTS `pa_role_user`;
CREATE TABLE `pa_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色表' ;

# 数据库表：pa_tag 结构信息
DROP TABLE IF EXISTS `pa_tag`;
CREATE TABLE `pa_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  `unique_id` char(20) NOT NULL,
  `content` text NOT NULL,
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_wxhd 结构信息
DROP TABLE IF EXISTS `pa_wxhd`;
CREATE TABLE `pa_wxhd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `endtime` int(10) DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `srcoe` int(11) DEFAULT NULL,
  `summary` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` text COLLATE utf8_bin,
  `published` int(10) DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;



# 数据库表：pa_access 数据信息
INSERT INTO `pa_access` VALUES ('2','8','3','14','');
INSERT INTO `pa_access` VALUES ('2','14','2','1','');
INSERT INTO `pa_access` VALUES ('2','10','3','4','');
INSERT INTO `pa_access` VALUES ('2','4','2','1','');
INSERT INTO `pa_access` VALUES ('2','7','3','3','');
INSERT INTO `pa_access` VALUES ('2','3','2','1','');
INSERT INTO `pa_access` VALUES ('2','6','3','2','');
INSERT INTO `pa_access` VALUES ('2','5','3','2','');
INSERT INTO `pa_access` VALUES ('2','2','2','1','');
INSERT INTO `pa_access` VALUES ('2','1','1','0','');
INSERT INTO `pa_access` VALUES ('3','14','2','1','');
INSERT INTO `pa_access` VALUES ('3','13','3','4','');
INSERT INTO `pa_access` VALUES ('3','12','3','4','');
INSERT INTO `pa_access` VALUES ('3','11','3','4','');
INSERT INTO `pa_access` VALUES ('3','10','3','4','');
INSERT INTO `pa_access` VALUES ('3','4','2','1','');
INSERT INTO `pa_access` VALUES ('3','9','3','3','');
INSERT INTO `pa_access` VALUES ('3','8','3','3','');
INSERT INTO `pa_access` VALUES ('3','7','3','3','');
INSERT INTO `pa_access` VALUES ('3','3','2','1','');
INSERT INTO `pa_access` VALUES ('3','6','3','2','');
INSERT INTO `pa_access` VALUES ('3','5','3','2','');
INSERT INTO `pa_access` VALUES ('3','2','2','1','');
INSERT INTO `pa_access` VALUES ('3','1','1','0','');
INSERT INTO `pa_access` VALUES ('4','7','3','3','');
INSERT INTO `pa_access` VALUES ('4','3','2','1','');
INSERT INTO `pa_access` VALUES ('4','6','3','2','');
INSERT INTO `pa_access` VALUES ('4','5','3','2','');
INSERT INTO `pa_access` VALUES ('4','2','2','1','');
INSERT INTO `pa_access` VALUES ('4','1','1','0','');
INSERT INTO `pa_access` VALUES ('2','9','3','14','');
INSERT INTO `pa_access` VALUES ('2','15','3','14','');
INSERT INTO `pa_access` VALUES ('2','16','3','14','');
INSERT INTO `pa_access` VALUES ('2','17','3','14','');
INSERT INTO `pa_access` VALUES ('2','18','3','14','');
INSERT INTO `pa_access` VALUES ('2','19','3','14','');
INSERT INTO `pa_access` VALUES ('2','20','3','14','');
INSERT INTO `pa_access` VALUES ('2','21','3','14','');
INSERT INTO `pa_access` VALUES ('2','22','3','14','');
INSERT INTO `pa_access` VALUES ('2','23','3','14','');
INSERT INTO `pa_access` VALUES ('2','24','3','14','');
INSERT INTO `pa_access` VALUES ('2','25','3','14','');
INSERT INTO `pa_access` VALUES ('2','26','2','1','');
INSERT INTO `pa_access` VALUES ('2','27','3','26','');
INSERT INTO `pa_access` VALUES ('2','28','3','26','');
INSERT INTO `pa_access` VALUES ('2','29','3','26','');
INSERT INTO `pa_access` VALUES ('2','30','3','26','');
INSERT INTO `pa_access` VALUES ('2','31','3','26','');


# 数据库表：pa_ad 数据信息
INSERT INTO `pa_ad` VALUES ('23','首页1','http://www.YZ1681.COM','531e85f90bcc1.png','index','10','zh-cn');
INSERT INTO `pa_ad` VALUES ('24','首页2','http://www.YZ1681.COM','531e88216e887.png','index','9','zh-cn');
INSERT INTO `pa_ad` VALUES ('25','首页3','http://www.YZ1681.COM','531e88325b1c2.png','index','8','zh-cn');


# 数据库表：pa_admin 数据信息
INSERT INTO `pa_admin` VALUES ('1','超级管理员','hylxinlang@sina.cn','5bc94f7298d654a5afec588df6f52018','1','我是超级管理员 哈哈~~','','1436535143');


# 数据库表：pa_apply 数据信息


# 数据库表：pa_category 数据信息
INSERT INTO `pa_category` VALUES ('1','0','赛事新闻','n','zh-cn');
INSERT INTO `pa_category` VALUES ('2','0','比赛公告','n','zh-cn');
INSERT INTO `pa_category` VALUES ('4','0','媒体中心','n','zh-cn');
INSERT INTO `pa_category` VALUES ('5','0','照片库','n','zh-cn');
INSERT INTO `pa_category` VALUES ('3','0','健康知识','n','zh-cn');
INSERT INTO `pa_category` VALUES ('55','0','国际比赛片段','p','zh-cn');
INSERT INTO `pa_category` VALUES ('54','0','比赛知识','n','zh-cn');
INSERT INTO `pa_category` VALUES ('56','0','中国比赛片段','p','zh-cn');
INSERT INTO `pa_category` VALUES ('57','0','台州比赛片段','p','zh-cn');
INSERT INTO `pa_category` VALUES ('58','0','媒体报道','p','zh-cn');


# 数据库表：pa_city 数据信息


# 数据库表：pa_field 数据信息


# 数据库表：pa_images 数据信息
INSERT INTO `pa_images` VALUES ('722','product','1.jpg','/Uploads/image/product/1.jpg','1441272267');
INSERT INTO `pa_images` VALUES ('720','product','2.png','/Uploads/image/product/2.png','1441272195');
INSERT INTO `pa_images` VALUES ('721','product','3.png','/Uploads/image/product/3.png','1441272220');


# 数据库表：pa_input 数据信息


# 数据库表：pa_link 数据信息


# 数据库表：pa_marathon 数据信息


# 数据库表：pa_member 数据信息
INSERT INTO `pa_member` VALUES ('417','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiakBzVias6BsABQIOfaTtOmskCbeSlxNS45UApsGDUGg5ds9mdlFPtfRUIlxKBuiaUw4GcnkVwLLf0u0Cics22sb0R6/0','0','oXU1ruNR37vyiIXgHyfs7SCj3GD4','','','天天制衣','123456','','','0','','','','','','','','','','','西藏','山南','','','','','','','','');
INSERT INTO `pa_member` VALUES ('407','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5ahcc9t3xAmmWtuGJLlLIsnqmY8Hb25Xog5IiaxPVS7eXfX6jicdaUbSGQp27V46Pvowic7sdX6Q9ibOA/0','366','oXU1ruE213ejSN72siQVNwud_Itk','','','闲茶良味','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('416','','http://wx.qlogo.cn/mmopen/McYMgia19V0UqIoRlLtsic8Y31icTnPFYrQre8iagtKKiaAsXptZZPEu6ELiaIVC9x5WDHT008K4o7L93gsseGVrib6FQ/0','7','oXU1ruD4JtCtS0IlUnDpdxVDQF7c','','','APP手机软件开发--聚塔工作室','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('392','','http://wx.qlogo.cn/mmopen/McYMgia19V0WQMMjXjpxRSH9e4K09Qibv4icd6DnibjVeVmiaZ4ILN1rQ0pyD3V4mVOPEoibpzzuNYCTekDwCibuK1TZw/0','0','oXU1ruJvDzat7-ro760B4jOUiQGk','','','俞叶飞','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('393','','http://wx.qlogo.cn/mmopen/tNvDKLVOkzfPyHuveyuzBdag4EamfDFJA9fg9Osbz4icY6LPTdB3CVqt2134Eu3IFpzEtQHOcbw4IYRCLrk88H9yZftmjXsDG/0','0','oXU1ruCy88spoN-qg9wJuuAeNQww','','','厚土','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('394','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI6599XTMVic0DFIYu4GuKPZib9RXtBw2eRUDianTvOW7INahCoXTGOwSgng4R3cicAaqRrC15sdt8zNxT5D/0','0','oXU1ruKASezeNUVXzqrjqF9oA7Ro','','','K.K','123456','','','0','','','','','','','','','','','浙江','绍兴','','','','','','','','');
INSERT INTO `pa_member` VALUES ('395','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI6599N6LH65fqRahtrmRdt4pVHnnuN3kvTXXBK2cScG1RYGoDibQxYic1ibicC4lwleuicpiasSQyCzB3ZXmQ/0','0','oXU1ruGKb03C2kaPY4RU7bcdgXK8','','','自由快乐','123456','','','0','','','','','','','','','','','浙江','杭州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('396','','http://wx.qlogo.cn/mmopen/McYMgia19V0VHxjnuPh5w6BQfmIqknjRPupmGOk4IwSxY6JndxnDTNgGXEvWW5u9icawiaFVcgMhLetoibnCHdjYUHFKAhMppsuQ/0','0','oXU1ruBvyjdiekacWSdg9X4DkNaw','','','丁丁','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('415','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5YhjO4dC797ZOVAsibpln6rHgDpkSiaannl9HsZibnLaOZCXRJDO7OmAxje9XTia091DL8LtoQtdJbrgyhvnAoYoLhd/0','920','oXU1ruKrST1KKNNky4pIk130BrcY','','','HYL','123456','','','0','','','','','','','','','','','四川','成都','','','','','','','','');
INSERT INTO `pa_member` VALUES ('398','','http://wx.qlogo.cn/mmopen/Q3auHgzwzM6icxVTqz4Uv1eMGhP34zSz1VhribJDPZhP3maP8unOMtXwN7VnXASP5xcnib3h2nibHBGtCeZmYopv6g/0','1','oXU1ruLfwyA9MOTkTFYb-ysjqxYc','','','蔡景眼','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('418','','','0','oXU1ruEam7Ufhkk42nRohSlg2iA0','','','陈智豪','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('419','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI65914X24aSxl3FlcDJHVpInckruZOiamzg6SVWlib0u0Mf7GuXQxCsJTHSPEhbGxBRgcyCWyQGYTd17T/0','0','oXU1ruNeWzrO92g-nP6ZXbSG0PL0','','','David','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('420','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyXhuqlOf33x93obJsGEjlJHpxqiaR32yo75DRWucrupvt5O1oasCMNnxmWz1C1deE1sJxb6QNmXTU/0','0','oXU1ruDP-Gg9uFnsR1rSyRzi_PD8','','','LHB','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('421','','http://wx.qlogo.cn/mmopen/Q3auHgzwzM7xPzypCJjK64rHNfj3GAvIbA2NoRKwbRKKZXmhiagU760t9wktCuLj4WQ3gatzUQf9MySKWX9icKfzxC8mibAk7sNAD3MwXZicpr0/0','1','oXU1ruPivK5g8Dv7zvDzevQWt2eo','','','星海','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('422','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI659yfjJ6y94oNlTicQMNVxrktWl8o7pH4Qq06oY9RniaQxPePicFlVsyz9kYPjiaRpwuBO6xpsAwKbDA61/0','0','oXU1ruCkFo-InZAA-tc-L513PUoQ','','','A0000 大森缝纫设备--小彭','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('423','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI6593lbPIrxQRkA5iaVEY5AOpRXKVGoqqtp03pgCP1uFWvhHNpFqZ5ajOTFnbpGfIiaVD6rxgZCqT13jm/0','0','oXU1ruPlMNyMwqTQcb0JdDBn1s0k','','','喵帕斯','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('424','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiakAv23geU0LxVlCVibFcNHJLtXCEjZlwPcFglQ9oYWOyZQ7LuLoCmHMf02nbwicBibjLKBVGIQvnRtwyial7aFyQHw7/0','0','oXU1ruEgU1TW30VXiphZqCh5PJOE','','','严进','123456','','','0','','','','','','','','','','','浙江','嘉兴','','','','','','','','');
INSERT INTO `pa_member` VALUES ('425','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WySJOObDUibBB7VqcGM2IeutBicA2UGMS4FuvzfjmjfL979dnZUXhIsfD6ozqxN2HBK6o6VOWO6loPw/0','0','oXU1ruJKUmSQt9NWWES4vd7HLeDw','','','丁정!어떻게?','123456','','','0','','','','','','','','','','','浙江','宁波','','','','','','','','');
INSERT INTO `pa_member` VALUES ('426','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tsou3Yt8gJb7zTEQRNyKsuZeiauhXyTib7aw0IbTv6gvFyiborcbic5e1fXI8vZjNTBu5vb03LWTHOLjNmqIvcyt6l1/0','0','oXU1ruJpADKkDflbwg2BkLq91hlo','','','♛呆萌少女','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('427','','http://wx.qlogo.cn/mmopen/9kXFsjUA12S2GG5sBicZ3OsNCcLibFVydGpD1icGtJbvyHmgXdOCfg5TcfSnAHyEC0VeyDqKQc8ETuIFKrqKjbiaficzQkv1Ksw4I/0','0','oXU1ruBZtCphdv9_8vgHbTb_NrRU','','','杰','123456','','','0','','','','','','','','','','','河南','洛阳','','','','','','','','');
INSERT INTO `pa_member` VALUES ('428','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqYUgX3HNqjCwjmCluPHnZZerPZmVQt9y85ImXE8sdQbUicN6rjhX4iaibuoYQtAuwDlySibhbBbF5iaM0/0','0','oXU1ruFT7scb7ELkFsO6oa3hUvRY','','','王晶晶','123456','','','0','','','','','','','','','','','辽宁','铁岭','','','','','','','','');
INSERT INTO `pa_member` VALUES ('429','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI659ibQ1yl8icXibKeT0IKsF4WcaHDcs3Gb8ZQq8mria8ERAk2nHyb4bpVDTxNwc048ZsOTRxRRowTWecb9/0','3','oXU1ruBB2_6xRtUdqoZOgxjGjkLs','','','杰克','123456','','','0','','','','','','','','','','','福建','莆田','','','','','','','','');
INSERT INTO `pa_member` VALUES ('430','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI659xkVJVQes1fRA0BgkwVHLGaKXh7u9bC2D6zJE1ZSG957QYFL2rvgskrnic6IatPqFmkRAyBXRefyib/0','0','oXU1ruNEJ5HbBYb0RNrlKJKpc4iw','','','嘘…安静','123456','','','0','','','','','','','','','','','河北','保定','','','','','','','','');
INSERT INTO `pa_member` VALUES ('431','','','0','oXU1ruGSuNR1n-eKDoIAcJD0vntM','','','谷田','123456','','','0','','','','','','','','','','','黑龙江','哈尔滨','','','','','','','','');
INSERT INTO `pa_member` VALUES ('432','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqYxy29YMO3ibMuwL5TYhX3IC7Pbw4SNafgQEoL7AyMVgD7iaIhEHxVeprv5iakwLw9pVO2aZ1icaXBQ5/0','0','oXU1ruDfPezo4YwJ65GS5uKQ1AfE','','','Sunny°小海','123456','','','0','','','','','','','','','','','浙江','杭州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('433','','http://wx.qlogo.cn/mmopen/McYMgia19V0XFKt3B0hnrfW9X6M3icjFKHp1xNYnriaOcE8fD0gV51rvmpbXqBiaBtFxVLstaNbPr6yI47V8kujBNQun5Vk8APH3/0','0','oXU1ruEGIMaASJ2UlHQ_UC_W_uR4','','','@','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('434','','http://wx.qlogo.cn/mmopen/PiajxSqBRaELfCiapQpn19uqE4CO2YL0JmbCngpvbnU6LFccs0dJ6mo8RnePIBSicc6Mm7MrR7ph6eLheJjwDXe0A/0','0','oXU1ruGV062kNTJbxznKD2Ja00_U','','','我不是我','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('435','','http://wx.qlogo.cn/mmopen/tNvDKLVOkzfPyHuveyuzBQyoOzDbE1F12iaAibuvMdHPJjsvm3PicuJu8x9ndlcAVBDzPPJK4cPApKFv0WQia1xuBhFc49WOkayI/0','8','oXU1ruCq9dYVfCN1-5YhkMqy-05E','','','木木哥','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('436','','http://wx.qlogo.cn/mmopen/tNvDKLVOkzfPyHuveyuzBVVDWdeBXzlSzmic5S3yld5u5a9gD9tsXGRCnCb8JB4OsFXY5OleDN5eqBzT5yFF7sbBzmxIaCvNz/0','4','oXU1ruCxZodGTbI2NdnrPfNp2Xzw','','','GJD','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('437','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyTiaY9AYWvbiaNMMmYKXib3BxVLbo0KfOYIQMNXodjKqOWUSSNkgM7ktwUW5MCicaFP6a5TCicSvRX43e/0','0','oXU1ruI0Kxzs0R8sc0xf_VqyH85Q','','','doso','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('438','','http://wx.qlogo.cn/mmopen/McYMgia19V0VHxjnuPh5w6JxZribnLRUIpyjAETZpwjK6WEncPRibdlKCS53bexGYtQibnvic6FK1vziaY6YvI03MPnktAODTibu8lS/0','0','oXU1ruFKC-FCA0UrCWTqQBfoM3so','','','马海龙','123456','','','0','','','','','','','','','','','湖北','襄阳','','','','','','','','');
INSERT INTO `pa_member` VALUES ('439','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyQndBRumEu1o4LjOnwrypo3awpnguPKcHeeiaiasicU6XGhGbU4zN8YoiazRyxENvUx7enic1ysDSon34/0','0','oXU1ruMLhv2OQSsEaffDbhlHGBIQ','','','江山制衣','123456','','','0','','','','','','','','','','','江苏','泰州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('440','','http://wx.qlogo.cn/mmopen/Q3auHgzwzM5TkiccgEUX1UXuPZaHOMJ7ysjw3Yt0bwYPre8M6TrI7sljUyoIdsUhBJaVbNiaoDGf05t0quic81Omw/0','0','oXU1ruN1-joLJlEvsucAcVfwjgkQ','','','绒王实业-王志','123456','','','0','','','','','','','','','','','江苏','苏州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('441','','http://wx.qlogo.cn/mmopen/ajNVdqHZLLAicc1ia4Bw6fmiaUqia348Pu3Sh2FTBtjvsjqGxqkpjZicV7AZicyw0Wc4X7S0yib59yicCrXyjWVS8OK9JA/0','0','oXU1ruDThKJj-N2jGILxW9jYrVDc','','','淡淡的活着','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('442','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyVmbziakjNlcoCaCVnZfJAF8hQpFopCEDyB4ShYicdTRoIJc1UjxeCmf0cgycamSKISJFdibFwTUnx5/0','0','oXU1ruIDM34mibSkfi-822MBhdag','','','吴彬','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('443','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tunKQ76e9pcqFkog51LRBY1qZ5uDeqsdHiaMEj461Tibmjh8v0YSpzHQYZtU1yfDgCUP2fnoNzvgMic9NBXBSiaQztx/0','1','oXU1ruDsrd7k-eDv4KleoYt0JAKo','','','天缘儆伶','123456','','','0','','','','','','','','','','','四川','成都','','','','','','','','');
INSERT INTO `pa_member` VALUES ('444','','http://wx.qlogo.cn/mmopen/McYMgia19V0VzyibYPKexWicnSwVyhGiclaEvoEkJVRvOKZcHBGV4MDjaGibM3mOD0GY1SQBuzx9xiatyfAUbtia599QQ/0','0','oXU1ruNscXKdJ0mepW7wneBzo0eU','','','CPL','123456','','','0','','','','','','','','','','','陕西','西安','','','','','','','','');
INSERT INTO `pa_member` VALUES ('445','','http://wx.qlogo.cn/mmopen/tNvDKLVOkzfPyHuveyuzBQ0ia9hjyfMz2zUCjrDbicnaPBOs6RVhyfLXbYDJicamNzUIcaWAbmYv9xKywYqRI3XTcQze6nUdqzq/0','0','oXU1ruHNwaUglZwODa24AcVBMId8','','','抬头看天','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('446','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyQDca4pTWtT9H2kWCianXhFIDc422FLy8htrbKvfskP8jEicACLKy1lJ8MUw0UWnkvTUd0bK978YTia/0','0','oXU1ruCrcxx6huGP3gJBIpyLse6E','','','褚兵丶','123456','','','0','','','','','','','','','','','宁夏','银川','','','','','','','','');
INSERT INTO `pa_member` VALUES ('447','','http://wx.qlogo.cn/mmopen/tNvDKLVOkzfPyHuveyuzBdWNYdZhcVA2mxibE7QuAuqic2EDsgG5MTFRibkicfiaZw4xYiaDYa7YJHgJ6eFqMMqomY8uvTcWIgI7a6/0','9','oXU1ruAVWpOd8TsrWMYIqGHbP2Dc','','','腾一','123456','','','0','','','','','','','','','','','上海','浦东新区','','','','','','','','');
INSERT INTO `pa_member` VALUES ('448','','http://wx.qlogo.cn/mmopen/ajNVdqHZLLDAvjDatTE0Tib1235QvOMcGbaNPZsDTXJNQ93uyj1nxOHVic7Yk1ATSlhEXQvdQX8s3Rv9dYY8SQfQ/0','0','oXU1ruOj1MnqVLfIZjQXRwW7pg4s','','','李刚','123456','','','0','','','','','','','','','','','浙江','湖州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('449','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyVtHDvnblmicAD2AEasiaaemcfZ34eoJ6g3z6SibObzfRSwKrpCyRZYZOnF3mJk0AQRo2iaWwPzTToBp/0','0','oXU1ruM-X3Bs-qdtnD2pal5dvDNs','','','LILI','123456','','','0','','','','','','','','','','','上海','奉贤','','','','','','','','');
INSERT INTO `pa_member` VALUES ('450','','http://wx.qlogo.cn/mmopen/McYMgia19V0VHxjnuPh5w6D3JmuTb65gCNtMSGodrVM4Hia502hlND3uhqdkXqUwUGS2Ymsgoy8k0bJBfvB8ebNsZW7ViavVb3M/0','0','oXU1ruI1ndD0L_F9ljYLtfe7-GVU','','','   敌敌卫','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('451','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI659258fM6twW4dCSALkYdIonL6nD8dwctjXqLavafugscKy1VO9mJibzPwaFBd7823md1xFmyyHPm0E/0','0','oXU1ruMmket55rL9MmvDQ9sGOZfY','','',' A王軍','123456','','','0','','','','','','','','','','','福建','泉州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('452','','http://wx.qlogo.cn/mmopen/McYMgia19V0VHxjnuPh5w6J08BOWxLPbELtcAA3C35gz8fyXIzxGzDAg6wAwvCBw9ibCZqyPYpr0XmHqhNpvcBero6YBeWTJRZ/0','0','oXU1ruIs2WQicPX2DVau_rqni4ag','','','智诚 智能模板服务中心','123456','','','0','','','','','','','','','','','浙江','湖州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('453','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bofVqydBzu6bsMGOUpNpHsRTYpSdkbZgJl3ACQdJNfePDBzMJadtpbgvbEAFK8UxcxvP8EJMicdxTjWxHKlu0AH/0','0','oXU1ruAKfy_IX93oJqtfQk8Rkthw','','','‮','123456','','','0','','','','','','','','','','','湖北','武汉','','','','','','','','');
INSERT INTO `pa_member` VALUES ('454','','http://wx.qlogo.cn/mmopen/ajNVdqHZLLAIOU79eiacSL4lYSMZbur8Tzray0tpl1MDqFptMlu4pZrtSd0ahWVZYFPfxuFicZ5DvPibFKqLM76ng/0','0','oXU1ruPvXwmErEi8kaZPSuVm3kEE','','','tzrlf001','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('455','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqevDN5205KGmb1eHf5Qt3V1ajow4Oz1kGLGuL1BpKvV0DqCibtXt5gQ0amKEbQONYUfUT8gdZYuiaN/0','0','oXU1ruFky7T9XFyYwaLsjcrMCMHc','','','爱家好男人','123456','','','0','','','','','','','','','','','上海','虹口','','','','','','','','');
INSERT INTO `pa_member` VALUES ('456','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqePa7LfgnicLJlnVqjEk55ztm9sfWjDSiavBQMibq1JLzJ8LicpDqiaKSTkO0fIgZzvgUyaYyiaH5QD2Iv/0','0','oXU1ruCqb-i6pRrHT6K_5gCGuYg0','','','乐乐','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('457','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqekPLK9f6ELJWYwjvVcP4KTyLicNbEeeYelKf09loicHI4NRpzKvbFURHcTLq7QdryZicsrOwICnGvE/0','0','oXU1ruEM3aPbzgt8MisPJyqtqJ7U','','','海阔天空','123456','','','0','','','','','','','','','','','安徽','芜湖','','','','','','','','');
INSERT INTO `pa_member` VALUES ('458','','http://wx.qlogo.cn/mmopen/PiajxSqBRaEK6GLzJiaGDZZsVxib3ezMMTBz3YuBicRyTOZHONlzXeq4TzR5Et526icpOjWhTLAxvIyiaRnDv9kuaJ2g/0','0','oXU1ruK_nXQxcPIquBc3vc_lBaZ4','','','蜗牛慢慢爬','123456','','','0','','','','','','','','','','','浙江','杭州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('459','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyVsU52SZTKtniczn0Rr95MYGyabN5eaDyibuchFFv3xImbSffOJs2uibtGlDtnib4MYWK8CEtPhGdGYT/0','0','oXU1ruK1MjcFDhmWVEBxHaJ6db28','','','伍小明','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('460','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tvtA6bbicvKWq4QEUldRDNVIP4b0Wq333fIVEIhfWwc5aB1Gx5hsUk6LEWib7IKny5KcETwvmXrYy2rxvibkgLOz54/0','0','oXU1ruOP63tpHY13b3-y4PXO0-B4','','','Mr廖','123456','','','0','','','','','','','','','','','北京','东城','','','','','','','','');
INSERT INTO `pa_member` VALUES ('461','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqSiaRGdg9eHgUibukAAOiafzXLI1s3vNyl0DW2k3DySkKpVBnPj8BfCMXynkvbz7YzNRNde7d40xced/0','0','oXU1ruOxd-pp1oQIJmseAZEB-EBQ','','','龙之吻','123456','','','0','','','','','','','','','','','安徽','黄山','','','','','','','','');
INSERT INTO `pa_member` VALUES ('462','','http://wx.qlogo.cn/mmopen/McYMgia19V0VHxjnuPh5w6CIfQyzkyRib3Q2zkmEAYJwXpQ1g764zSiaXZShsAMxkr0pXLe7PC309Zia8Wqx7Oty6E4csL3WDDvS/0','0','oXU1ruGG-vCe2J_4kBTSBu1Exex0','','','张兴龙','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('463','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5YJdON9dkicRNG6bVicx1lxswqahKZGXslyYpmT4utxTlNp0Riakm5Mx4keCRDLP3lxflvYy5eAm4ZjcELF4Vwa9QA/0','12','oXU1ruEpqgfF-G9jyAfds2zRVSRU','','','川仔','123456','','','0','','','','','','','','','','','上海','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('464','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI6597FhnLQjrib617oafKBsAvqqoHreSEx6PzibTfqAH7ibnibuHuo3OoshXtP8nbvXcaxgApVwSodGZRFq/0','0','oXU1ruLsLwFE6_XCv12UIQ5vxX8o','','','H.kun','123456','','','0','','','','','','','','','','','北京','昌平','','','','','','','','');
INSERT INTO `pa_member` VALUES ('465','','http://wx.qlogo.cn/mmopen/McYMgia19V0VHxjnuPh5w6NzmoFNibobWUia4zO9yLMFiaHnhdu4kTNwN6PxaX7icGsDJNjXNXklzbEYEHIpTnbPlNg11PPcQuFW2/0','0','oXU1ruHZz2LWO_u9__K9kZKX01Mo','','','乖乖女℡','123456','','','0','','','','','','','','','','','上海','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('466','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI65908heHfDWJ9TlicfSqKic9oxSQuoZzGcPXD5YjmibODLBdd4Tiay4hiaBm4SovJxZibK41s0rYGGM1tcC3/0','0','oXU1ruHOiFLXJIrTBVJGMHsuq7bs','','','君','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('467','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyTn1jH871EvEsAQZAYjQjrT0Bp1r2tgMmN47oxYDDSVI8aXZch0f97RGM0WDFXtxL5Bbv5uADdZY/0','0','oXU1ruIOla_xuRNJk6UGX9D9IteU','','','淡淡青春','123456','','','0','','','','','','','','','','','上海','奉贤','','','','','','','','');
INSERT INTO `pa_member` VALUES ('468','','http://wx.qlogo.cn/mmopen/tNvDKLVOkzfPyHuveyuzBQdp9Nlen4dVtb7rm886gfKx60wzCBZM5NAtxVfGp3yHKMosOJ6a1WVgvhKpHzEsiaV0J7Q4kzJ8s/0','0','oXU1ruNezDJqXyrXB-nZD8A6_ans','','','深山虎啸　　　','123456','','','0','','','','','','','','','','','江苏','镇江','','','','','','','','');
INSERT INTO `pa_member` VALUES ('469','','http://wx.qlogo.cn/mmopen/rcXiaLuictdrAqnMVOic6jDbJdiavNDqZLfiarjv5yJon0IqRoqE0zhumNGNNjJy5UY14M6ydSWGYYaqPZmiaQREaTJnxue9yEqplI/0','0','oXU1ruNIVvYmLwObkhWKMIKSf_xc','','','吴国珍','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('470','','http://wx.qlogo.cn/mmopen/tNvDKLVOkzfPyHuveyuzBUTq4yf36MwFJpLyCMeV4B0UMTERic6Y7F8SEn5Ogbj6klmUnARJNh1WvUEuHMUVYlmDc2ZIa1mXR/0','0','oXU1ruF_-IM3ISQWk_EPMvGq2Jsc','','','13235821363','123456','','','0','','','','','','','','','','','浙江','湖州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('471','','http://wx.qlogo.cn/mmopen/PiajxSqBRaELgtPvu3Ufjwqr0nChQ99RCeIOO1XhcNV1BzHWVvgYx3lcmo6qn5QGhM19sXDY4tScJKHx490Xp7A/0','0','oXU1ruPMtzm9eZGpC8U6GE34-vZo','','','二蛋','123456','','','0','','','','','','','','','','','山东','青岛','','','','','','','','');
INSERT INTO `pa_member` VALUES ('472','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyVNxaAWibyvnoSYKFGRI7y6icbFH0Odfou6d4RUxTxeyK3gEdw3d0pWVib2cgAjhZVJdOk4LQMlfLDM/0','21','oXU1ruFjzHudpx4K6KhP4N--zEv0','','','DOSO','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('473','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI6597Z5uIablxAbNYyZZRkpk0JOd0xDUIr4RgDgVBx6IaZGeWRKGeu3ER7vZ9ZctyZwnmbDWqg1SJ58/0','0','oXU1ruCJRYT2SPLLafoHCWtsK-_k','','','高山流水','123456','','','0','','','','','','','','','','','北京','大兴','','','','','','','','');
INSERT INTO `pa_member` VALUES ('474','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamBwEJ56bDbt30HhbIt3moDtSkIvicdWSDt56dne5ayXNKibpp9OTW2Dh0Qfrzow1FA8Hicyn3kx8laddEcZ1SduBq/0','0','oXU1ruEQ67DrzX2r8LeQ78Y9l2vs','','','朱','123456','','','0','','','','','','','','','','','广东','深圳','','','','','','','','');
INSERT INTO `pa_member` VALUES ('475','','http://wx.qlogo.cn/mmopen/Q3auHgzwzM4QTUsldZuLiaKpkmynJo1wiaZ0vYaA4kqIdvObSvq293h2Nl7wBQSRuxo0BR62bteWiarbNUP3N43xQd8Pic7FmP4c4YXyRewszgw/0','2','oXU1ruJF_K2auKq7SDR_rQAe0lxs','','','忠哥','123456','','','0','','','','','','','','','','','江苏','常州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('476','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5YnWQZWZXBr0t1AVO4fuh06EtZ6U4wuK9NwqHxFxKpAtOE0lcaYBW7iap77ps1jSOA7XO9wn1x3DY7xDK4dbE5O4/0','0','oXU1ruM1BcYInwwcNq9h5JEHR7QE','','','大李','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('477','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyUdy5AwnK7Rj4MWpn4s7ZPWVsS2ibvU905KYyb4snWA1nDaAcciaOvE39f22t314hbSkFHU6TLvg6r/0','0','oXU1ruOyUJdbzrxpymLIk83DcuFo','','','仲秀云','123456','','','0','','','','','','','','','','','江苏','南京','','','','','','','','');
INSERT INTO `pa_member` VALUES ('478','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WycSicx4tHbGYnnezefMtfRJywjYSzUthPYKzCvk8bkRjDiayUYHp51uJ3LLD0my7HOv5BemJboRomV/0','0','oXU1ruNEr7k9D28m-RWuSwEJbDXs','','','小王','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('479','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tvjUiczQq0xfAcxpgVy6cE65h5Adib0Z1aNg8xJyMetoWufib3kFjIvWYqhg7iazEzqNPr9mK0GXtPDTibTjAOxe1RL8/0','0','oXU1ruEyOVkLNbqeGz2o_V_H0nps','','','徐彩凤','123456','','','0','','','','','','','','','','','上海','奉贤','','','','','','','','');
INSERT INTO `pa_member` VALUES ('480','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WybBZtwBgm6GbzIKNcEGCdqwztHuaLxD9gb6Jl17IE7QlwXbCYFY3cHDbrGyDfcibzlFml4yvM6NrE/0','14','oXU1ruMcR4whdbCO8JTUf1f9OhbQ','','','舒烈华（大森美机缝纫机）','123456','','','0','','','','','','','','','','','浙江','金华','','','','','','','','');
INSERT INTO `pa_member` VALUES ('481','','http://wx.qlogo.cn/mmopen/ajNVdqHZLLCnah3iavyUjaV7SwvnMe2y2TaWYXGCOUu8ibMSIicGlVuHdicicNcztGgEiaibtkb9SOHpUIKIK3FWPEqkicsYeGX0dcgYjfsicKxoMsAk/0','0','oXU1ruFNZz8GxI3l6zHxq0beBxYI','','','恨地无环','123456','','','0','','','','','','','','','','','安徽','黄山','','','','','','','','');
INSERT INTO `pa_member` VALUES ('482','','http://wx.qlogo.cn/mmopen/McYMgia19V0VjibOKDvDYn7iaibMgEpOtrT04ny7UksA24omMIoyTzEHh0iaO3hpdJAPibBuX7PzvySuDon7QZLthAfg/0','0','oXU1ruJeZpHoHqCP9o6xgmLIhsqY','','','瑞安华大针车行蒋楠','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('483','','http://wx.qlogo.cn/mmopen/ajNVdqHZLLBZwzFtJNZ4BbyfPvtedxZplKx9vqKYfZIIeBVuib769803ia3Hr0ELZcAagEPAWO5V1xf6m6kXsq3w/0','0','oXU1ruCxiDahE19HW7VwckTzECps','','','A暖阳箱包厂','123456','','','0','','','','','','','','','','','湖北','襄阳','','','','','','','','');
INSERT INTO `pa_member` VALUES ('484','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5aicegRYpvXq42oianICwQCo6Zl2gLCwvyWBzSua3hpTKZ73C3FQ5Mib703VHW7pVLf1CAFiawXnmJb5XCTbHXVV5Br/0','0','oXU1ruDTpvApDby67VRFB3PCaBkg','','','远晨','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('485','','http://wx.qlogo.cn/mmopen/ajNVdqHZLLAicFO2OSTGN2TBzPiav6g7sHlGhRpNXKlM2rhWIibnUaEs1BSj8Sdlp2zBJHbJACTLd4aCQp3POj2ng/0','0','oXU1ruLdF4n8JjXU589dfdmY5sqw','','','马小飞','123456','','','0','','','','','','','','','','','江苏','南通','','','','','','','','');
INSERT INTO `pa_member` VALUES ('486','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqSGCpykngMjFo1zOqriahxrLKFWIpKkFfcyraA4GmHr1LY49qzubmcvWCh5TkSsMKAafQnzgTytxz/0','0','oXU1ruKjVF9ahCWdIjUsr5gXKRlM','','','颜学习','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('487','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqenJ73CFnyBicicSriaZ2ChT8lBL1Df84qm0vRFcm9nAeVG7iaMoZeJV0IVsNfTAysK57MoFpoN9BibSO/0','0','oXU1ruJF4f4i4f8Wuy4vU0skiQjQ','','','明天更好','123456','','','0','','','','','','','','','','','上海','奉贤','','','','','','','','');
INSERT INTO `pa_member` VALUES ('488','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI6597k2qVoNxpQibibdUulcu0mZnTOUVzkiajW1f3zFQm85pnswqJibX6tVX4BAh8TuL56ZXVwDtMxgpzrC/0','12','oXU1ruHYguoQ04hk3ywf8bnaYwLQ','','','蒋伍佰','123456','','','0','','','','','','','','','','','福建','厦门','','','','','','','','');
INSERT INTO `pa_member` VALUES ('489','','http://wx.qlogo.cn/mmopen/McYMgia19V0VHxjnuPh5w6KI9Zrofic6GibTfZCXqfXg0LxdarQGicmardexUDCiaKueCPQn8GicYYfbGEcWQJ002CeP3rictmFZO66/0','0','oXU1ruBS7r-Go13e-sLrzeWTA5zU','','','丰资彩自动缝纫机','123456','','','0','','','','','','','','','','','福建','泉州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('490','','http://wx.qlogo.cn/mmopen/BcQRZIbPSialf9ia9AT2M520BrGnXwIyHA1xQcAA6RgVoN0bZLvWC1sa7pBAVnc2fkJwPUx8ANckV4icGBg9bFoRhXZxrWFJsjA/0','0','oXU1ruKJbraTQD5_LQroCuOCAycE','','','小平','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('491','','http://wx.qlogo.cn/mmopen/BcQRZIbPSianuofxhwotjSZ3GUFgM4de2juh0mTGhQ6LgRWjd3HzfgyQ1XLaFHdkr68ERQmY7Ejy3MI19YR6bwRCaq39f1ZXu/0','16','oXU1ruGn_vYDhcZS709766e0KX9Q','','','何礼明 （杰克）','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('492','','http://wx.qlogo.cn/mmopen/McYMgia19V0VHxjnuPh5w6LBuZTAhq1CatYaVeCYy9HqtJZwdrkN7ebtNyZOC067nCMibBDLk9L2CKIreXPLxQeCn8qQmicR9Rl/0','0','oXU1ruCT7RTlLWsNTTDV3lQPY6Jc','','','逆境丛生','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('493','','http://wx.qlogo.cn/mmopen/Q3auHgzwzM4pLS2xNz3VIxksg0jmXX5MapydQoWwtFjaYCLvkDh2KkKjV1kgnq71FU2H6eXne8qicRAVAuxQHmQ/0','0','oXU1ruBalImF9RrG_7lwrFAhm4LQ','','','李先森','123456','','','0','','','','','','','','','','','福建','厦门','','','','','','','','');
INSERT INTO `pa_member` VALUES ('494','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyYJ15URsNeCvn3YXjPo6xaXrJlxNl72GTTfkgqw2k4EyQd8Cfat0NfFv3HVD4uHVJGnLja9Dbbiaa/0','0','oXU1ruHqVBv07cLNcjugccz7NJF0','','','土土','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('495','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5YhgmTcWTECR7fMp0nR3f944sVB35B8MJ0APqyadbfFMGB3OJQorJCn36PQrfdve7OiaVdStiaEwrkS7bNflwTC8W/0','0','oXU1ruJYIy6iAO6CUalLCgfRGfUo','','','淡若天涯','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('496','','','6','oXU1ruJai8EvUUv_KwvoeSsyqpD8','','','缝纫设备','123456','','','0','','','','','','','','','','','福建','厦门','','','','','','','','');
INSERT INTO `pa_member` VALUES ('497','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqZwzFxfzIlalg6snbaI8f1RyceAyhwmCA6nvx5ISkpQUtTWgo4FFw2rmoibcWSaezicZfewlibyBtyA/0','0','oXU1ruFZ9W0kXLtABHNlmwiceBBg','','','腾龙缝纫设备       徐选棒','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('498','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiancG8HlGgEB9fXmCLBRHezuPJiciaxJ37LnxFQ9FJcHeViabKoVvzm0ZUpMWM3Z2iayz97ZgB8thlvkKefpENiaqcwHE/0','0','oXU1ruBCFNY2gbdoiIkq32sCopkQ','','','现实改变人','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('499','','http://wx.qlogo.cn/mmopen/McYMgia19V0VQxSuLicls6HSNrwawFLKyCz7QCerhvM6WpJJQicEcGlbwGSagFsUdicZ34GU7g6icUFxq6ribvjpLZcA/0','0','oXU1ruJosf2dkEyQJ0bIdRg9RLCA','','','闵祥恒','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('500','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI659yDzticyVdhnURecDKx4o7b3YncP9NlcHVR46WLIz2NpToZ2P8hm270fJ2OAlXz1eyr2hHdSVJibMib/0','0','oXU1ruAzAvebBGKJIOPIjbwg8-9c','','','曾    健','123456','','','0','','','','','','','','','','','四川','南充','','','','','','','','');
INSERT INTO `pa_member` VALUES ('501','','http://wx.qlogo.cn/mmopen/McYMgia19V0Vh5XuN6HNRTLgESmuDfL9yFeiaa5U5omTChyib4tfEMJwgDW2TbkCMISCXzZLlqNaYdnBWKzN7ryVA/0','0','oXU1ruAiW6jqUHie3uyHIsKx-MYA','','','针车','123456','','','0','','','','','','','','','','','福建','厦门','','','','','','','','');
INSERT INTO `pa_member` VALUES ('502','','http://wx.qlogo.cn/mmopen/BcQRZIbPSianKX4zSNofbzqa14XhD4bsYU2zCBEsu55PnibicPicjIibaKRfdqU7IoEvVTvSph590QpCfFZogJvCOSdhPibwYGGuNZ/0','0','oXU1ruCzKH69J4GYH3G8By-TamJ0','','','美好的明天','123456','','','0','','','','','','','','','','','广东','肇庆','','','','','','','','');
INSERT INTO `pa_member` VALUES ('503','','http://wx.qlogo.cn/mmopen/ajNVdqHZLLAs0PUe6JKW0ebRvELbhfRm0SS9JBZ6icdy21AfiaDHR4Ck23HTCVms5ePYWu3vIg5o4xLmsyffDLfQ/0','0','oXU1ruC7cDgc5i3x93-ryk92iliw','','','各大品牌手机专卖','123456','','','0','','','','','','','','','','','广东','广州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('504','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyTjESNVgiajHR9eaayZp1dTA4MgepPqqzBSMA8wUPIicwpywKU20Vr4NoO7bImYXM0FzuGGsQzibnJI/0','0','oXU1ruE_Mj-EpEZ4OoZMJYoqzdQc','','','刘哲','123456','','','0','','','','','','','','','','','福建','厦门','','','','','','','','');
INSERT INTO `pa_member` VALUES ('505','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiancJ061pibWMPO2MibsX4gQtluZq4PcicVYibMaL1jFWVnVibR58RicjicRr4NKbMCdHxkM3ia7Na1PtrMMicMQLa3Mz7wRo/0','2','oXU1ruKRl_dkPFme14SsdkblCYIM','','','黄应饶','123456','','','0','','','','','','','','','','','江西','上饶','','','','','','','','');
INSERT INTO `pa_member` VALUES ('506','','http://wx.qlogo.cn/mmopen/Q3auHgzwzM4QTUsldZuLiaKpkmynJo1wiaevt6gHUslZicTke7wx0e57NjibTk9P2v1yH02VHvVlRZc0Kibt9Zxaz0WFvpeiblsFUvSEJcicKqAYfY/0','0','oXU1ruIeLl32noDMKtMjkW8UF1kM','','','张烽','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('507','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyZsXFSp2FmOJLicZL26YKKrJFxwfU7XWdpg5u5C6c70CRaD7bnupXmeN98yHdBWyg2sqxAwNL8hfQ/0','2','oXU1ruHtc4EjSiDoTS1XJ1bZzc-o','','','小邵','123456','','','0','','','','','','','','','','','四川','宜宾','','','','','','','','');
INSERT INTO `pa_member` VALUES ('508','','http://wx.qlogo.cn/mmopen/McYMgia19V0VJAyz6X5yWEGyKpQUgQ2bGOYdtYrNFUQ4CeVMWFZic1twsbwgbtM19U2zZ4iapThueAsAAEMd67lxg/0','0','oXU1ruGu7hNcDLAGe_mm1N_b1Gkk','','','杨飞','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('509','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqafZkVDoTQogNM9rSG1jqXV5k89pm8J5wh299eN0uLicwtSyJh5Ouduntu6rxtmqEdNXoxKPiaWV1e/0','0','oXU1ruI4ScXjgNKQSwH2OP-C8eJE','','','黄波','123456','','','0','','','','','','','','','','','福建','厦门','','','','','','','','');
INSERT INTO `pa_member` VALUES ('510','','http://wx.qlogo.cn/mmopen/3hsWdj2E9ttIgf2d8HmELI6JZ6E3tS1RMs9lAlXnT1cNiaibJ1EpoqPN5orX2e7p9hMz6zopzykMGXYibAWlKDv0HnNLwgKwoyW/0','0','oXU1ruNg01XiVwBlXvV8lqeJ_FO4','','','林林','123456','','','0','','','','','','','','','','','广东','中山','','','','','','','','');
INSERT INTO `pa_member` VALUES ('511','','http://wx.qlogo.cn/mmopen/Q3auHgzwzM7El46p9CD3falFAfIaD6NUSAoXkuyAEc0ibC8sT0ftkGYV2vtlOQibPGX8GWHDMibCS86Vg32EnsaQQ/0','0','oXU1ruHu_u2DwXTOLUdFI4k8JTQI','','','天地人','123456','','','0','','','','','','','','','','','浙江','金华','','','','','','','','');
INSERT INTO `pa_member` VALUES ('512','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI6596QCU44JWuft2WwPJRibH0Bfx5g6hF4HB6sWt0KSJdMck9icpmHxX5YhGSaWIr6dbUiafJ2ssPiaBO27/0','0','oXU1ruLK2d4S9FNXx5T9t-P8seXE','','','黄东','123456','','','0','','','','','','','','','','','上海','奉贤','','','','','','','','');
INSERT INTO `pa_member` VALUES ('513','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tvaHKnWmO6butprJ1P8a4JxCldURicm95qTfWcqlIgbWicp6crPQGibw4wTrlvjhcOfbnyR15Mdd68zXjalGtialBmS/0','1','oXU1ruH6kyO0XLkcaYlEZ2gp3l-k','','','WZG','123456','','','0','','','','','','','','','','','江苏','苏州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('514','','http://wx.qlogo.cn/mmopen/McYMgia19V0UMV3oGFPQdEt8aHHHmGrwQyBd9yaOPmLmtdicJK6zqPEAwgiaRnjXZPXQyvvjYcRBw94lzj9Mg6WCKn6cLBicl00p/0','0','oXU1ruNj-XXRhEXLH_c41RC_Okzc','','','卢庆良','123456','','','0','','','','','','','','','','','北京','大兴','','','','','','','','');
INSERT INTO `pa_member` VALUES ('515','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiakVBrG53FMdVYW2FVQb6uvf1LQquCQCKm5BtlrGF3ygiaSWLJt53WuwoHfFM7wJlR9P0ibOcRlmQJnUwfWCvq7nkm/0','0','oXU1ruH92FfP_a_oy9NUJKTxzm7Q','','','济南市天桥区新飞跃缝纫设备销售处','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('516','','http://wx.qlogo.cn/mmopen/tNvDKLVOkzfPyHuveyuzBZKGY11bR2ic2srxxcgD4olKbxGZz2RJMISXgBMMZsicwp3c82jH2P18Sl6dLMrxY1N6cvJ9vkxqoE/0','0','oXU1ruPQZt4PT8g2mpO5Ig1Mv4NQ','','','秋天落叶','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('517','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqZ1US2XJvhyicRHcPo7ibtSkDfLClpcrWR6ENOv3t2SUkFbVaK4F8ny81CsypSA2ktY32IRcE0UdAw/0','0','oXU1ruDOq-bBxFCN-mECD_ZMqw3g','','','共青城至诚缝纫设备商行','123456','','','0','','','','','','','','','','','江西','九江','','','','','','','','');
INSERT INTO `pa_member` VALUES ('518','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqdPwm7CXS4YkfB8sksdBFeU8zicdDgUmNVTAC4hgkxN1AbNeVspYlBZmEC5vd4lV9mFru5tnIVg51/0','0','oXU1ruNhp2iTP4vDh5_Cho2haumY','','','景轁','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('519','','','0','oXU1ruPwTVcCPU5N5jmeuDhhQQI4','','','陈峰','123456','','','0','','','','','','','','','','','浙江','嘉兴','','','','','','','','');
INSERT INTO `pa_member` VALUES ('520','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5YmWJwcumibGl83LaibatSyjUWbNFwxdicTibz8hEtZMzrMqdOoMwZxYB4G481SOWB4ZlXx8H7JKDZ79jurXat1u2Sx/0','0','oXU1ruL8Icysl_OJAoqiNqwFg0S0','','','安徽精箭','123456','','','0','','','','','','','','','','','安徽','安庆','','','','','','','','');
INSERT INTO `pa_member` VALUES ('521','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5Wya8TNdBBKoE9Rdib8kt9fZia2LFf0q9fzNrpicu6WF7MFgL4rexaXyqJZQCiboSQIA9a21f8ibLOdlbrm/0','0','oXU1ruLMtEFn3mw5aaDaWcFWIEd8','','','阿隆丶','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('522','','http://wx.qlogo.cn/mmopen/BcQRZIbPSianTIstRzxJuCfqe1ZkoNFXwOlhvqNNVymlb8m0P8iaXrBNG8JAokOMjX3c5EAqBRmCszrOFwZQOFqoib0OIbb3hYb/0','0','oXU1ruEZ6M8XaO812pWNFvlp4jic','','','吴金阳','123456','','','0','','','','','','','','','','','浙江','金华','','','','','','','','');
INSERT INTO `pa_member` VALUES ('523','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9Lkqb2aZBicYFGg6qlIhca8rZ4iccK9JUOybDdazwibiaaqzPQem09siaeYhtw3Vq3hfibqc8hiczNaYNI9KGF/0','0','oXU1ruB3TB_Y17gl0HDF8zTOeKfs','','','长春市鸿圆缝纫设备有限公司','123456','','','0','','','','','','','','','','','山东','济宁','','','','','','','','');
INSERT INTO `pa_member` VALUES ('524','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI6590K5djAdnia0j1oiansUiaULdkI8R0OslicAOzZVQPia3SuZaxZoranRpoDPzjvQN9mjG9NkoQJzxkuTo/0','0','oXU1ruKrQ6xIig6Xtjg_oijnbpOM','','','你好大爷','123456','','','0','','','','','','','','','','','四川','成都','','','','','','','','');
INSERT INTO `pa_member` VALUES ('525','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tuIiaHDbicicSgHibKaPXlVZvUZeppX9aMW30RTJqzXicL2GeNgDFrVIssw1Pl8DYpaVOjZvUqbW8swnTO5Y23Dvmqu9/0','1','oXU1ruEZlwryYiW8TDehWvT8SDFY','','','友','123456','','','0','','','','','','','','','','','江西','上饶','','','','','','','','');
INSERT INTO `pa_member` VALUES ('526','','http://wx.qlogo.cn/mmopen/tNvDKLVOkzfPyHuveyuzBTJaUxfL570HXgzdLhD5M2fbgphvu30ic1oljX6fksa9vrYkIZNVuELuxdX8dcKjIHgKMJ5HAOLvia/0','0','oXU1ruPbeXScQSjd32RCPHLBATks','','','小卓','123456','','','0','','','','','','','','','','','福建','厦门','','','','','','','','');
INSERT INTO `pa_member` VALUES ('527','','http://wx.qlogo.cn/mmopen/BcQRZIbPSian8lhUmu2ky1InQoofXkuFDqaqQOjGxkic6HBy4SQCrEZiaPmmhWXhsDAW4ibxmk2ujC7qicIBKc40K7zNzrblRNmGG/0','0','oXU1ruMttm-MnLYjTplCkHnNZ1OQ','','','华仔','123456','','','0','','','','','','','','','','','江苏','常州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('528','','http://wx.qlogo.cn/mmopen/3hsWdj2E9ttwTH9n1SF8k9uWXGv5uWkR6WesahET1Sxxayw5tGkBibZicu67Lvt2ZmIkoX9nGg7aKKKIPuXOZdL2MGvXE0OtOQ/0','0','oXU1ruOxVGQVvhzVPGm5rskOQuXk','','','义乌恒昌缝纫机有限公司。','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('529','','http://wx.qlogo.cn/mmopen/ajNVdqHZLLAKkHReTm9iaWOxYmwW8G4LMWz6Bp2w2hawmPTYqH7aNyegkUUuWuwVro7icvdavudT2S9oCPtkAAcA/0','0','oXU1ruMlxNx7_gQMpdcWEAe327YY','','','韩锋','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('530','','http://wx.qlogo.cn/mmopen/ajNVdqHZLLAz2gxjmGyBiaGe7YVIjg3qGotJNGsp03viaBnNibqdkoaZHW3ccWpPelFIqM5iboNh2cbUmRgs7iaueGg/0','2','oXU1ruPWNqb2FU5JCrKciPHX-zhs','','','夜枭……波哥','123456','','','0','','','','','','','','','','','湖南','湘西','','','','','','','','');
INSERT INTO `pa_member` VALUES ('531','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5YmWJwcumibGl1HzI5beIApuicFwL6U3ZyTQVIS4yRhGW5R3bHMvGjgh4uaJMdiavkmS9ia2icS0rftWEt1z0db6Vs7q/0','0','oXU1ruIQcj5khJ3nPYB0WLcPL7vo','','','马鞍山建辉缝纫设备有限公司','123456','','','0','','','','','','','','','','','安徽','马鞍山','','','','','','','','');
INSERT INTO `pa_member` VALUES ('532','','http://wx.qlogo.cn/mmopen/ajNVdqHZLLDd0b69v6icj30KWXrX8t9VxCbmYRNhkcI65QiciaXjYeXFF5ZCIIx4iaCkNhexhUkWJxQxK08t2q2kKg/0','0','oXU1ruP9NHzShLGiAEFVtKqBQydQ','','','文哥','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('533','','http://wx.qlogo.cn/mmopen/BcQRZIbPSianE0lbm5ZUxGKqSJeNKibSMVmtUW9epS16aWJ224HGicDXtEooSCsF6ZMuHOqIia4D1ic12rP5Zckt1DiaGuvZmTk1Et/0','0','oXU1ruLbUZQb0WY8pKSNKljfK4Q4','','','天空','123456','','','0','','','','','','','','','','','上海','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('534','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqQUFSsQ9RIibspk6URBPfElhNzqVW6mibryeOsBAa3xYvaIdQx8B2GpBX9R32bxDWhgp85zNRDpzWE/0','0','oXU1ruBZMKOidRuVcWfzVap-aoUc','','','聚诚网络','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('535','','http://wx.qlogo.cn/mmopen/ajNVdqHZLLCdYazZBicwBQibDnJiaHzaciaGXEvVEfH1UiaCelYfg4ARI4K6tANT3ee0JAxcVHjZwrrpUlVKDLwTpjQ/0','0','oXU1ruMncu95rYa8mvOmanqljuqU','','','中屹，大森福鼎代理13859608952','123456','','','0','','','','','','','','','','','福建','宁德','','','','','','','','');
INSERT INTO `pa_member` VALUES ('536','','http://wx.qlogo.cn/mmopen/ajNVdqHZLLDeEK6eibf1S80R6DH7OF9hModn6CgsFicbweCGXd0YSsPz93x0AADbjq88JFH9fCfhL7hqaqc1ibRBg/0','5','oXU1ruNFGw9O8duoRytXQlMk-2bE','','','联狮针车行  小李','123456','','','0','','','','','','','','','','','福建','泉州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('537','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyWicFK7OzGujtH8E4W8xbXZZUVkZkwgjuR5MqR6uxXCTzkg9DiayZiaeEicg4gj2zaq9RxnVkrRLUutC/0','0','oXU1ruM8Z2_GlRceiGQKLLczWLgo','','','一洲制衣厂','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('538','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyZaZRWV6HSC55gPmMibIZHawiamEBBosk7cfVialOChYZeriayaaMicTZE2NQEz1TBgNatHN59jB6Wz1g/0','0','oXU1ruB63Sr-tQbbn9mS0oZv9qBc','','','陆洋洋','123456','','','0','','','','','','','','','','','江苏','宿迁','','','','','','','','');
INSERT INTO `pa_member` VALUES ('539','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamsP3ZnFhpJ7eRDFMiarSv3ZHXehsXS2JOxAAVMDUafpS0FDajQiamILY6r35VegT86T4wkdiaBKW38diaO3nxtz0Bb/0','0','oXU1ruChmCtS7TYEf_xRItpmU8xc','','','娟子','123456','','','0','','','','','','','','','','','江西','上饶','','','','','','','','');
INSERT INTO `pa_member` VALUES ('540','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamBwEJ56bDbtwyR3YgNz1oyTPJCB0OvtPRskiceaNNbTLMnbQkwGtC9G4iba9Bd3kmQcOdr1iaoE8stHeFJWD9nUBL/0','0','oXU1ruMb_f4P-nbpRc48vGLcpiEA','','','曹建伟','123456','','','0','','','','','','','','','','','山东','青岛','','','','','','','','');
INSERT INTO `pa_member` VALUES ('541','','http://wx.qlogo.cn/mmopen/McYMgia19V0VHxjnuPh5w6Nv8mDJWdpDdVu5JHUHdqSxqtV61tY2kBdxpoHg0bVboIdPmjqviaVnqyYVrfLOkcTGG3NZc9vZzn/0','0','oXU1ruEXXAXVIkL1ueqZAlHAds6w','','','付红涛免费送玻璃水，安平车主加我','123456','','','0','','','','','','','','','','','河北','衡水','','','','','','','','');
INSERT INTO `pa_member` VALUES ('542','','','0','oXU1ruLxSYGudFZtWa3cUs770zyU','','','逆转','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('543','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI6592J38mX72TCF0qo58yHLPmfApFhSgEj6taL6BMf7645vAMEtpISl7M4gvQmer2sdEBvrDOXdzzyf/0','0','oXU1ruF5lo5JrrBhA2jK4IrVvhhU','','','现实','123456','','','0','','','','','','','','','','','安徽','六安','','','','','','','','');
INSERT INTO `pa_member` VALUES ('544','','http://wx.qlogo.cn/mmopen/9kXFsjUA12S2GG5sBicZ3OoNia25faxpvTz7hGibndAznbhqlU4siba9X2t3dqrNgLRibDQvY41N7pgfcSibmofPWiav23751sESlhK/0','0','oXU1ruK9ZFO61V_2QtWKiyOD3qEE','','','新❤️静','123456','','','0','','','','','','','','','','','安徽','六安','','','','','','','','');
INSERT INTO `pa_member` VALUES ('545','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyROjaX7uTDpmtDxbBzgnFB18UlbERicPCLPzzoaes4deicoicftxLLgTfoUvMFlEHVsPSGGcMYGmZ5j/0','0','oXU1ruLvkzo6ktNZYRHjjT66298w','','','平平','123456','','','0','','','','','','','','','','','江苏','常州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('546','','http://wx.qlogo.cn/mmopen/ajNVdqHZLLBCgmcHtTXwzLxSkDYSOXiaSp2T0P80jQJjFE6CqpnjibfIYchNJQrKOZbrYRia7KGwL4fib8wd2cCBQA/0','0','oXU1ruHExq1Nh7mTTPBWfgj-_1OY','','','诚信是金18839968583杰克针车纸','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('547','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI659wqltjVNPdR9SqDqYyUycP140qeicQw2V7Fvt9RB34h9gAXEBEFBic5zuFSicaW6wwVfulHAlPQ7z6F/0','0','oXU1ruGCn1KwRJ1W_8GGL3mS6qOY','','','邱恩辉','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('548','','','0','oXU1ruDIVxcIUdFnIUAboBswoKaA','','','林水福','123456','','','0','','','','','','','','','','','福建','泉州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('549','','http://wx.qlogo.cn/mmopen/ajNVdqHZLLDkHDptS5fKericK49J6VWd9velynia8CtKicq8gjbfLMaEM7DMBMaq0UiaCdGAuyas2aMdufic3ibjlEnA/0','2','oXU1ruNAel29dWhceUwJ_GYZhyZM','','','红太阳','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('550','','http://wx.qlogo.cn/mmopen/PiajxSqBRaEKB91XicRibhaRnyFrSekpTAd5ByqTUmgydyR45FSrYLEQzIvuzv9KHbrF1A9mQ7CzVPvqic41b5vNSg/0','0','oXU1ruNFD1uYqWnfJlu2yzkecdGY','','','红细胞','123456','','','0','','','','','','','','','','','上海','奉贤','','','','','','','','');
INSERT INTO `pa_member` VALUES ('551','','http://wx.qlogo.cn/mmopen/McYMgia19V0VHxjnuPh5w6FTq9jqQXJCeYmkiaMr1sicLeaXXH7pSrEYnxxPvnHiaKyAMrL2v9a2oLOrYSiaASESh8dEUICbMCVNO/0','0','oXU1ruI3xiJeWsoTzBjoLrENdIX8','','','老大','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('552','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI659yzsl6TGDWO5V8ib1qfP8w7mibo13ibMobMRH2Zjic6gFjMs7EICXmE4VSvXIZ1dia7mCh10IY60SH7v9/0','0','oXU1ruDAii5-xDGzIMXNb2Dmuu5g','','','水到绝境是飞瀑！人到绝境是重生！','123456','','','0','','','','','','','','','','','福建','厦门','','','','','','','','');
INSERT INTO `pa_member` VALUES ('553','','http://wx.qlogo.cn/mmopen/McYMgia19V0VHxjnuPh5w6NRtoENjibCylcwBIJK9KfL8sqzhBDmtCqEsxNYkWYian9CRn3lAibkKCePYYPtkp3xVm6wqTqGcdTV/0','0','oXU1ruJY_DrJGsgLYUZ699Aik4E8','','','竭诚缝纫设备商','123456','','','0','','','','','','','','','','','江西','上饶','','','','','','','','');
INSERT INTO `pa_member` VALUES ('554','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI6593NwqODuPxIl5c2ZPYQVicUk0ls2pL1VRsYEn6paDYjib05Bg9wmEMWBFMkt35OF2W7m9w2q1so3JS/0','0','oXU1ruDn_NECmPQcfrjg8KSHhPm0','','','黄枝新','123456','','','0','','','','','','','','','','','江苏','无锡','','','','','','','','');
INSERT INTO `pa_member` VALUES ('555','','http://wx.qlogo.cn/mmopen/9kXFsjUA12S2GG5sBicZ3OuWjP6u7tjJ0KppxU3u6ic5MLV55icJjNP2cr4my6atqc4cibcrODcaick0Sicic8K2SZge5NyPG1cFB3G/0','0','oXU1ruG0KP4dk5zYKFuAg5hWojYk','','','一生牵挂','123456','','','0','','','','','','','','','','','福建','泉州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('556','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bN4kjTtyLgrncHvb98g7zFnq5bwysHO9H13Hby4EvsHz9YS3Xpys4eibVA7OoUpnnCjAYvQg8OKvYvjeWN5UXlC/0','0','oXU1ruNAwLmy7WHbPcivY8AJ9TIA','','','香樟树','123456','','','0','','','','','','','','','','','浙江','杭州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('557','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyXIicWTD6m0wYptibH0QxQFiaYzsg5sMtrPibYbSvB6A3ZIKab5xemG3a7nsVdpZqSoqPcXUAKuuJIm2/0','0','oXU1ruIj325IrqxPbfdI6pJzll0Q','','','阿福','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('558','','http://wx.qlogo.cn/mmopen/ajNVdqHZLLBBE9cqQf9JiajCFPqpZ6jyx18J43ib4kBlUYHic4ib1WeLBxTI48yfPsxkicoXiaX5459DmP4qwBYsVTmw/0','0','oXU1ruGEhE-XaTC0FREY_mbYK1-o','','','虫矢口虫朱','123456','','','0','','','','','','','','','','','福建','厦门','','','','','','','','');
INSERT INTO `pa_member` VALUES ('559','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WycibARQ0UAWolMEkXPNAIYbqvia8FFDR9ynIWW33nLOg48XEibJQj5uVTxgDUiaJJzeHcibpQulAuQNRib/0','0','oXU1ruMlqWOWUw0BwpLTHhtJtL2E','','','@￥—￥@','123456','','','0','','','','','','','','','','','福建','福州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('560','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqR7oZapnBuNU3J2J79sh37jndiaxAKGQdCsU5ZL24Pzd9jvMcS34eu5oV31NHO3CsFTOicjOkNu1fU/0','0','oXU1ruNFxsxNc0mwDN0sVriSTLGI','','','勿忘我','123456','','','0','','','','','','','','','','','上海','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('561','','','0','oXU1ruNkxZi4fGOqHm0FyDm7Bie8','','','丽丽','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('562','','http://wx.qlogo.cn/mmopen/tNvDKLVOkzfPyHuveyuzBQtMwR9xsfqibqIHDRJCTxiahiaMMteKnb2dLwnCYMVX3IXNNIMGmYNdwah41wnd1gr28zCtIBVibPlj/0','0','oXU1ruGgo3hVcSSso4oVze-Vr99E','','','轩彤宝贝','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('563','','http://wx.qlogo.cn/mmopen/tNvDKLVOkzfPyHuveyuzBQlOGiaVibATq5LGK57oFAR3Ml6w1svlmaibGV60hVIwIWPaaMRHzPs6x1kps8UOljPHHHf4jbmI8p5/0','0','oXU1ruAQ6gZi6tD7_rObeV0HGwog','','','尹玉光','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('564','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiakRPdxBib6peS6WZNpUiaraSHlveVXMEJYUFACq1uN4micJMkgp9nB2tlNicDyEaVLV6hA0SuicncgOTh4M1uEticmMJQ/0','0','oXU1ruB63Wi1ldxSzcf52F4O9j94','','','华典福','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('565','','http://wx.qlogo.cn/mmopen/Q3auHgzwzM6Oyia6Djx2AkupicwaFgq81ocTjjI3PZ3HSReFuJLEScc9DnWLgVLx64fIkKTEOLR1dTCappeacIiblGBVsH9H0FAguet7fT3RuE/0','0','oXU1ruEji72quMmknlH_U1HYJ6Z8','','','汤姆','123456','','','0','','','','','','','','','','','安徽','池州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('566','','http://wx.qlogo.cn/mmopen/McYMgia19V0WIDZ2OKXWfmibetbW34FOglRFpyosqBPujvS6jGrYcOf2Aib86WyxutxW1KXicJVOAQicGsNlTXgiaUTMyg4ZvUcZjy/0','0','oXU1ruI0mQ26HUkb19O10eoPJRA0','','','cloud','123456','','','0','','','','','','','','','','','广东','佛山','','','','','','','','');
INSERT INTO `pa_member` VALUES ('567','','http://wx.qlogo.cn/mmopen/McYMgia19V0VHxjnuPh5w6CvonBKP58iaiaM3waWhQTBbMxo78dpttjMKZtk9m0p7yHMFKjNUboXP7ZSpc2EPz811A8Vtibeicib8Q/0','0','oXU1ruBQpzc8Cjx56QMqHnDExDJ0','','','张小华','123456','','','0','','','','','','','','','','','福建','厦门','','','','','','','','');
INSERT INTO `pa_member` VALUES ('568','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqbWWfWFEBjGfcDa0sawkXq5EtgZvzic04ib7ZP1VibP3NufEk5Nh4Z8YMP7EBKVNFlYXYmk9D0yecPf/0','0','oXU1ruDWwYTm3g3lC_zmM48xAzGI','','','康康','123456','','','0','','','','','','','','','','','上海','奉贤','','','','','','','','');
INSERT INTO `pa_member` VALUES ('569','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bgGYztwWGAoIu8MExSVOJicFUOWpOP22dsFb6RbDMBbejHQEXh5c9gzsxBv09bX3KhaDZoVt8nMRxKxpPgQyd0N/0','0','oXU1ruOT9CDtN7isjEDxL4QZ7hC0','','','没有签名','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('570','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5Wybr0ib1EcYASowNiaRu6ES16eGnqwbmoHHibKXUGV5DCwLayjoxdicaoByVXiaF8jIXI7xOdAd2DeRnas/0','0','oXU1ruB2grNTYNIJ4e-gpjlXenYI','','','xuanxuan','123456','','','0','','','','','','','','','','','江西','上饶','','','','','','','','');
INSERT INTO `pa_member` VALUES ('571','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tumiaNaBENhqh4DyfjqMsHy1FbOPibHZg6ibXicUm1Dia2aM7sKB7CkTDnRhFUb5kBh5UD2fMznbFrphsq3XsTbGkF4f/0','0','oXU1ruM2SwYiyeToUnEP3qjAM24s','','','波兄','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('572','','http://wx.qlogo.cn/mmopen/McYMgia19V0VHxjnuPh5w6P0ScV8sOr4tzS1vc4ESgo8JEiaalZRzHOUR7ibkibUV1lUicSCeI1Q6LqKwIVNMKE4CNa9FmxfO5oZia/0','0','oXU1ruGcCoPYLK-AxCmpq_avva5c','','','言午服装模板','123456','','','0','','','','','','','','','','','安徽','池州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('573','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI6598oMr2JHMMuzfAm0zwlnOsj0ngdGKK6on4kQ8vhmiciaGV6RtMbBCDuvDkhmYrfibic6Hgiat9kXxYe7S/0','0','oXU1ruNojLN8YVqFZHJ1jJnPRCX4','','','燕','123456','','','0','','','','','','','','','','','安徽','六安','','','','','','','','');
INSERT INTO `pa_member` VALUES ('574','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI6598uXLaokoRCSZNLsCOYhzDy8tibGlsWHZTeVBgiaAyAWo9Ctalx3FIh3jeyDa9IS01iacoTqaSGYUrA/0','0','oXU1ruM9nCDoWclp2MP4VRMQ9Cac','','','叶仙方','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('575','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI659xkVfkuiaDU5p8hAyPklxmFEkrSH7bx1EWaJCaOVicA9CpibQzCoRaGmC0ibYxa5pjmUdYPyejaIOYt1/0','0','oXU1ruGq-lOkXfmZPfv5d3mXlO0Q','','','艺诚·锦龙','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('576','','http://wx.qlogo.cn/mmopen/jzZKG5sj3hTVF4MiaA16Panp9M59gNdmRY2D1ApcIn4WqnXyqUFnicXZrfexLzWHVIajIfkUtpjgmdHOUv08ia6iamcKfyiadVSMt/0','0','oXU1ruDJ565urXEs4-aOWYCxtmVo','','','a天宇缝纫设备a','123456','','','0','','','','','','','','','','','浙江','金华','','','','','','','','');
INSERT INTO `pa_member` VALUES ('577','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WySEkcFLcxLpHWYULhP6AVulbG45fadfm7UEPh5Jp5X6mKOhib1rdiblCk12mMDY1icjdQUA6et8mtvZ/0','0','oXU1ruBtH70qtwnhmS6c4XaB0yUE','','','魅力人生','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('578','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyRvVW1zD2k4uITUqqmXz3XV3iaNdD50ERpgjpP6OtHOg7mEWLWicQDXWtQRibnSS2icHic67YMhZSvBvX/0','0','oXU1ruCCZn-t2-CMJFKIbnlMP2fQ','','','贤贤贤','123456','','','0','','','','','','','','','','','福建','泉州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('579','','http://wx.qlogo.cn/mmopen/McYMgia19V0VHxjnuPh5w6D9JDDl5VxflibVGPHzAuksUfoJ8yqwLV0ODCXUXrOXECIhAoQOr4vMdvWpvwxPHiaQ7olKCEKtcK9/0','0','oXU1ruJN4xG_HYgqCVpWy5g2O33I','','','林钦培（钦培针车行）1505950678','123456','','','0','','','','','','','','','','','福建','泉州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('580','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tv9MXPGz2Zb9Ptq3XcomupBSkGXgPibJR4NyG763urFXxx0veqqAqKicDtDnKUZZRq9D7GerOFjTgyfs53Ml0D1Ho/0','0','oXU1ruFgTT_ylC1u_OJ2UCTnOZy0','','','宗武','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('581','','http://wx.qlogo.cn/mmopen/PiajxSqBRaEKVfu7Ll0GwewxFMfcZliaq7aofu46lKr2N8UaHgLt6xxIYl15VoAemE6wZhr7JFiaUIYxBrPtJeUHA/0','0','oXU1ruBbZnyiqNlACpcuG8j9nIc0','','','燕子','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('582','','','0','oXU1ruL4AskBT46b3x9IVlVazcIM','','','小波','123456','','','0','','','','','','','','','','','山东','临沂','','','','','','','','');
INSERT INTO `pa_member` VALUES ('583','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI6599YHpEb8osoI7TjeQmYmEaT9x39u3XYGYMmmlljiajAOSX6P3icQpUp14RaqN7fzJ74elKgqHOtyIp/0','0','oXU1ruOimda5NF3TYT83bSUa4vsI','','','林','123456','','','0','','','','','','','','','','','湖北','襄阳','','','','','','','','');
INSERT INTO `pa_member` VALUES ('584','','http://wx.qlogo.cn/mmopen/McYMgia19V0WZx0hOwuChnfDzJ9Y3IvlvaYsbZozxHkkUM0qp6vC0XwHLr2QsFIRSDthwCk1P1gFEA4Ao0BdGqQ/0','0','oXU1ruOsDqeKcYKmBp95SUHyQXx0','','','左小飞','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('585','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI659yQH57KopZ4KKVkvNOlWHdibJhYsXgudY0dLVwtUa2ib2qHnpblwWeL7xVxbicXxiahFm2VbNbUkibuEn/0','0','oXU1ruItFB-aRCHWRb5v7SBJdzsc','','','上饶衬衫加工厂','123456','','','0','','','','','','','','','','','江西','上饶','','','','','','','','');
INSERT INTO `pa_member` VALUES ('586','','http://wx.qlogo.cn/mmopen/BcQRZIbPSianNcJ0MxRfbx7zrlN2d2HEVibocfjJgkiarHubTPUR5R2VH0Ayuc7wuPx7CtHZJfh4wN7JNgScpPYJX1SuibQvvg7H/0','0','oXU1ruD75i2QpDS3_NfK_S_0Y1yk','','','雨天','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('587','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5YhjO4dC797ZLibxlYlibZ5TwiccnyMY14842Ow0ibiacFrYGfiaRCnuRzLbxcYVJuPmrtMhzqIHLaRPFJVdlKib3U2MP8/0','0','oXU1ruJVHJD2VgQ-ivwpCP1jw2P8','','','杨志贤','123456','','','0','','','','','','','','','','','广东','深圳','','','','','','','','');
INSERT INTO `pa_member` VALUES ('588','','http://wx.qlogo.cn/mmopen/ajNVdqHZLLAlL8SMyNHpoOib0icOZrIgcPRrs05IzQ2tWYsm3eF7rGAsaJTkRWo1hbJeWVKsDlP1jwF9WEzs1ibbg/0','0','oXU1ruMXrcwDSFASmu0aLGROLLts','','','冯明举','123456','','','0','','','','','','','','','','','浙江','温州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('589','','','4','oXU1ruBFpWRkKoy0fel4zozXkcJE','','','餐饮家俱','123456','','','0','','','','','','','','','','','福建','厦门','','','','','','','','');
INSERT INTO `pa_member` VALUES ('590','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqWicAyLlErbsyoGwOfwcxxoQggic57rQC4TFHuF08R74hLSQhrRQ6FPD4ISAjH2Rl1hxqqplWMIW2K/0','0','oXU1ruJ6V7693wRsr0yeDX1c2o3g','','','风云','123456','','','0','','','','','','','','','','','福建','厦门','','','','','','','','');
INSERT INTO `pa_member` VALUES ('591','','http://wx.qlogo.cn/mmopen/tNvDKLVOkzfPyHuveyuzBesrPmnKblJIMvIe3FyN9jPg6eCHcKibp89QaPDpbvYIFC6LtKTt0jBNQ2Xr6bz9a9pkT4SGqsMMs/0','0','oXU1ruBOF4cGmcblP5pK_Y-23-CY','','','安全','123456','','','0','','','','','','','','','','','福建','厦门','','','','','','','','');
INSERT INTO `pa_member` VALUES ('592','','http://wx.qlogo.cn/mmopen/Q3auHgzwzM4QTUsldZuLiaKpkmynJo1wiatHbicofVllKHTIJKLqXdmCRDFibLnrBsOtFdkay6ZUIXf9kPdIEjh7J5aJ98OQ7ee63QmW71eFSdA/0','0','oXU1ruIYhD-APizin4k2a6GTkUSc','','','强盛隆针车贸易有限公司','123456','','','0','','','','','','','','','','','福建','厦门','','','','','','','','');
INSERT INTO `pa_member` VALUES ('593','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyQ8cZ0EiatibRWYzngxjic7OGRxgZwKgGpN9357brLpibdDwJNvUH6aDK4qqcEbo6FyXHJiaCBh9A4GPib/0','0','oXU1ruJ4627ZhYSQAafpg1g3AVJc','','','才子 小瑜','123456','','','0','','','','','','','','','','','福建','莆田','','','','','','','','');
INSERT INTO `pa_member` VALUES ('594','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamBwEJ56bDbt2Rf16soSmFjEKPq3OlD36c22qNqicvKNS419AurpZypS1zmzABoU1kUCfCo1okbqcnx4iajGrWxr8/0','1','oXU1ruBHEgcCyyrsx5NPeEmZ2JEE','','','杨大琴','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('595','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5YUOjEEibpnotPoRyhLKKX0MWTF09vXNxD5hictyzoz6XDMlibDQa6Sr9WFiakFC98rkicEJESmSHmeP7iarib1Cxsk2Xc/0','0','oXU1ruO3tBObeRfnyiJthWJE34NI','','','陈国荣','123456','','','0','','','','','','','','','','','福建','莆田','','','','','','','','');
INSERT INTO `pa_member` VALUES ('596','','http://wx.qlogo.cn/mmopen/McYMgia19V0VHxjnuPh5w6B23zvzQhQnbZAmicFQ0ycMc6L4EMfgy8grJyPiaEY1yNtdGBDicE79AOXiabBC7ayanobF8Giau6kbuq/0','0','oXU1ruJYT6nBsBQFG44NeaqYpPCs','','','如果','123456','','','0','','','','','','','','','','','福建','莆田','','','','','','','','');
INSERT INTO `pa_member` VALUES ('597','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tsnrY4gX6x2J9Ll5heDFfbIeYHHuVwapRTX1RAQZIHFdRyPOibTysPBteUxU5d6ZgYMxM72sTibb09W9IqR72KOD9/0','2','oXU1ruCU1ceYG3UYkcsf394HbWDQ','','','陈','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('598','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tv9MXPGz2Zb9LWn2HZB0scAJMYdPMtpd1ZkXTia1QMmTM1fCKaaMdOlerR4xBwiauDXFia1rvXfrBCCViaKWpPRV6iby/0','0','oXU1ruAMrMYbcMjjxNtvWT3eXRiQ','','','春暖花开','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('599','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bXla7mT9nHcZ36OnFLrkwCYw0icsf0AJStCFJZibrTibGz0ynXItCjQLtF8IFdHZDUEtG5ZGOQxBfEcREEt279lmG/0','0','oXU1ruH6jpEehi12yTU7w83QBIbw','','','那一刻的我','123456','','','0','','','','','','','','','','','贵州','遵义','','','','','','','','');
INSERT INTO `pa_member` VALUES ('600','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyRHY7KBCY45UlDMFE0Dx8DIDYEs6CJFEZtbFIODJhiaEAJIE4SNmZ1O19qUbr6lZswzVZbzDQWyBh/0','0','oXU1ruEAxDjlvQcDJSbz_sCAcB-4','','','大庆市肇州鑫多利服装厂','123456','','','0','','','','','','','','','','','黑龙江','大庆','','','','','','','','');
INSERT INTO `pa_member` VALUES ('601','','http://wx.qlogo.cn/mmopen/McYMgia19V0UciaRmfJJjrbXmVWu9JE4qnc7UlScIbGLWbTtY3QaXPutJ3U8ibIGbFmw5yUWbxTMI4UaibzmNmb2nw/0','0','oXU1ruN9D2m3jQkeZCwLXWl12HiQ','','','妙妙','123456','','','0','','','','','','','','','','','浙江','宁波','','','','','','','','');
INSERT INTO `pa_member` VALUES ('602','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5YhjO4dC797ZNXaReGDmic5J2aLGw2ImVZW4coFV2S7GhiaMXvsNW0TZhXOnPBbfR5aXgSG4h2tjwC7Yek9SfarDj/0','0','oXU1ruI1zNvSIrB0OD0ZQ2LBAz_w','','','姚茂胜','123456','','','0','','','','','','','','','','','广东','韶关','','','','','','','','');
INSERT INTO `pa_member` VALUES ('603','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI6598sFPha5HFSXDPSShlo5HibVichRoCu5htpXr1fJvtPd0zzEMNEXp6tgPlJzQibmOqJph7Oc41nNUgg/0','0','oXU1ruCB-0dw0h-o-OoNxYu-4v8g','','','宇宙之*','123456','','','0','','','','','','','','','','','福建','厦门','','','','','','','','');


# 数据库表：pa_message 数据信息
INSERT INTO `pa_message` VALUES ('14','a106079595','a106079595@qq.com','15355688333','0','1437144254','118','非常好，谢谢','','','');
INSERT INTO `pa_message` VALUES ('15','黄杨侣','hylxinlang@sina.cn','18382307097','0','1437146028','157','留言7月17号','','','');
INSERT INTO `pa_message` VALUES ('16','xiaoyong030107','215654740@qq.com','undefined','0','1437296410','157','不错','','','');
INSERT INTO `pa_message` VALUES ('17','陈恩华','15355688333@189.cn','15355688333','0','1437338019','63','测试下','','','');
INSERT INTO `pa_message` VALUES ('18','b106079595','a106079595@qq.com','15355688333','0','1439571807','42','wo shi xia','','','');
INSERT INTO `pa_message` VALUES ('19','b106079595','a106079595@qq.com','15355688333','0','1439571879','455','ce shi xia liu yai','','','');


# 数据库表：pa_model 数据信息


# 数据库表：pa_nav 数据信息
INSERT INTO `pa_nav` VALUES ('52','page','赛事信息','0','20','middle','/index.php/page/index/name/zjds','zh-cn','6','0');
INSERT INTO `pa_nav` VALUES ('53','page','报名参赛','52','21','middle','/index.php/page/index/name/gsjj','zh-cn','11','0');
INSERT INTO `pa_nav` VALUES ('54','page','竞赛规程','52','22','middle','/index.php/page/index/name/dszzc','zh-cn','10','0');
INSERT INTO `pa_nav` VALUES ('55','page','报名指南','52','23','middle','/index.php/page/index/name/dsys','zh-cn','9','0');
INSERT INTO `pa_nav` VALUES ('56','page','竞赛办法','52','24','middle','/index.php/page/index/name/qywh','zh-cn','8','0');
INSERT INTO `pa_nav` VALUES ('57','page','奖励办法','52','25','middle','/index.php/page/index/name/gsryt','zh-cn','7','0');
INSERT INTO `pa_nav` VALUES ('58','page','比赛线路','52','26','middle','/index.php/page/index/name/zzjig','zh-cn','6','0');
INSERT INTO `pa_nav` VALUES ('59','page','历届赛事','52','27','middle','/index.php/page/index/name/dszjg','zh-cn','5','0');
INSERT INTO `pa_nav` VALUES ('60','page','常见问题','52','28','middle','/index.php/page/index/name/qyyjd','zh-cn','4','0');
INSERT INTO `pa_nav` VALUES ('64','news','新闻媒体','0','0','middle','/index.php/news/index','zh-cn','5','0');
INSERT INTO `pa_nav` VALUES ('65','news','赛事新闻','64','1','middle','/index.php/news/index/cid/1','zh-cn','3','0');
INSERT INTO `pa_nav` VALUES ('66','news','比赛公告','64','2','middle','/index.php/news/index/cid/2','zh-cn','2','0');
INSERT INTO `pa_nav` VALUES ('67','news','媒体中心','64','4','middle','/index.php/news/index/cid/3','zh-cn','1','0');
INSERT INTO `pa_nav` VALUES ('68','news','照片库','64','5','middle','/index.php/news/index/cid/4','zh-cn','7','0');
INSERT INTO `pa_nav` VALUES ('69','news','比赛知识','64','53','middle','/index.php/news/index/cid/53','zh-cn','11','0');
INSERT INTO `pa_nav` VALUES ('71','product','比赛视频','0','0','middle','/index.php/product/index','zh-cn','4','0');
INSERT INTO `pa_nav` VALUES ('72','product','国际比赛片段','71','55','middle','/index.php/product/index/cid/55','zh-cn','17','0');
INSERT INTO `pa_nav` VALUES ('73','product','中国比赛片段','71','56','middle','/index.php/product/index/cid/56','zh-cn','16','0');
INSERT INTO `pa_nav` VALUES ('74','product','台州比赛片段','71','57','middle','/index.php/product/index/cid/57','zh-cn','15','0');
INSERT INTO `pa_nav` VALUES ('75','product','媒体报道','71','58','middle','/index.php/product/index/cid/58','zh-cn','14','0');
INSERT INTO `pa_nav` VALUES ('77','page','合作伙伴','0','32','middle','/index.php/page/index/name/rlzy','zh-cn','3','0');
INSERT INTO `pa_nav` VALUES ('82','page','冠名赞助商','77','33','middle','/index.php/page/index/name/rczpp','zh-cn','7','0');
INSERT INTO `pa_nav` VALUES ('90','page','钻石赞助商','77','34','middle','/index.php/page/index/name/yggh','zh-cn','20','0');
INSERT INTO `pa_nav` VALUES ('91','page','白金赞助商','77','35','middle','/index.php/page/index/name/rczl','zh-cn','8','0');
INSERT INTO `pa_nav` VALUES ('92','page','官方供应商','77','36','middle','/index.php/page/index/name/jltd','zh-cn','7','0');
INSERT INTO `pa_nav` VALUES ('93','page','赛事支持企业','77','37','middle','/index.php/page/index/name/fwzx','zh-cn','6','0');
INSERT INTO `pa_nav` VALUES ('94','page','官方合作媒体','77','38','middle','/index.php/page/index/name/qqyxwl','zh-cn','5','0');
INSERT INTO `pa_nav` VALUES ('95','page','关于活动','0','39','middle','/index.php/page/index/name/gnxswl','zh-cn','2','0');
INSERT INTO `pa_nav` VALUES ('96','page','关于我们','95','40','middle','/index.php/page/index/name/qyvixx','zh-cn','4','0');
INSERT INTO `pa_nav` VALUES ('97','page','联系我们','95','41','middle','/index.php/page/index/name/shfw','zh-cn','3','0');
INSERT INTO `pa_nav` VALUES ('98','page','马拉松历史','95','42','middle','/index.php/page/index/name/dszlxz','zh-cn','2','0');
INSERT INTO `pa_nav` VALUES ('99','page','台州马拉松介绍','95','43','middle','/index.php/page/index/name/spzx','zh-cn','1','0');


# 数据库表：pa_news 数据信息
INSERT INTO `pa_news` VALUES ('19','1','如何预防和处理小腿肚抽筋?','马拉松','如何预防和处理小腿肚抽筋?','1','如何预防和处理小腿肚抽筋?','1436936280','1441263596','<P>　　在比赛中有时会出现小腿肚抽筋或小腿肌肉长时间不自主地收缩现象。原因是准备活动做得不充分，比赛时肌肉从静止状态突然进入比较剧烈的运动状态，小腿肌肉不能马上适应，尤其在气温比较低的情况下，穿短裤比赛腿部肌肉突然受到寒冷刺激或由于身体大量出汗带走许多盐份而引起小腿抽筋。因此，赛前准备活动一定要做得充分，要达到身体发热的效果，天气冷时要适当延长准备时间，还要注意小腿保暖。比赛中若出现小腿抽筋应该马上减慢速度逐渐停下来，然后进行小腿处理如按摩和揉搓抽筋部位，如不能缓解应进入救 护站处理。</P>','36','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('74','3','如何预防和处理踝关节扭伤? ','马拉松','如何预防和处理踝关节扭伤? ','1','如何预防和处理踝关节扭伤? ','1441263738','','<P>　　踝关节扭伤俗称“崴脚”，是比赛中经常遇到的一种意外情况。“崴脚”会造成踝关节周围的肌肉、韧带等软组织撕裂，踝关节出现淤血、肿胀、疼痛。原因是准备活动不充分，跑步技术不正确，注意力不集中，路面不平及其他的影响等。预防踝关节扭伤的关键是做好充分的准备活动，完善技术，在比 赛中提高安全意识，集中注意力以及平时加强对踝关节的锻炼。比赛中一旦出现踝关节扭伤，一般应退出比赛，进入救护站进行治疗。</P>','1','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('75','3','如何预防和处理肌肉拉伤? ','马拉松','如何预防和处理肌肉拉伤? ','1','如何预防和处理肌肉拉伤? ','1441263765','1441263835','<p>
	　　比赛中如出现肌肉拉伤，一般应退出比赛，进入救护站进行治疗。为了防止比赛中出现肌肉拉伤，在赛前要做好充分的准备活动，尤其要活动开下肢。
</p>
<p>
	　　体质较弱、训练水平不高的在比赛中要量力而行，不要速度过快，注意正确的 技术动作，不要在后蹬和向前摆腿时用力过猛。同时在身体疲劳或肌肉酸痛的 状态下应放弃参赛。
</p>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('76','3','运动过后出现昏厥怎么办? ','马拉松','运动过后出现昏厥怎么办? ','1','运动过后出现昏厥怎么办? ','1441263800','','<p>
	　　昏厥是由于脑中血液补充量减少，所造成的短暂没有知觉，通常几分钟后就会恢复。常见面色苍白、四肢湿冷、出冷汗、头晕、恶心、心跳急速、脉搏细弱、呼吸表浅甚至昏迷不醒等症状，这些症状可能发生在昏厥之前或当中。 处理方法是让患者脸朝上平躺，抬高脚部20-30公分，头部稍低于下肢，维持畅通的气道和放松衣物，尤其是颈部衣物。如果患者呕吐，应让他侧卧防止堵塞呼吸道。经过上述处理病人清醒后应送救护站治疗。
</p>','1','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('77','3','赛后如何进行放松?','马拉松','赛后如何进行放松?','1','赛后如何进行放松?','1441263824','1441263916','<p>
	　　马拉松运动后认真放松，能使人从运动到停止运动之间有一个缓冲和整理的过程。比赛结束后应变为小步慢跑逐步停止不要突然停止，然后进行全身放松活动。上肢放松活动：站立，上肢前倾，双肩双臂反复抖动至发热止。下肢放松运动：仰卧、举腿、拍打、按摩，颤抖大腿内、前、后侧和小腿后侧，以及臀、腹、侧腰部。团身抱膝放松运动：双手抱膝，下蹲，低头，反复上下颤动至腰椎发热止。全身休整运动：站立，双膝屈，双手体前扶地，充分运用气息，深吸气于胸，“屏息”(即不呼也不吸，不是憋气)慢吐气于腹(即丹田)。如此反复几次，同时上肢慢慢抬起、直立，直至脉搏恢复至运动前正常 脉搏。
</p>','2','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('20','3','如何预防和处理比赛中所出现的腹痛?','马拉松','如何预防和处理比赛中所出现的腹痛?','1','如何预防和处理比赛中所出现的腹痛?','1436936422','1441263572','<P>　　比赛中有的运动员会突然出现腹痛，其原因一般来说是准备活动做得不充分，加上天气比较冷，开始跑时吸入了大量的冷空气或起跑速度过快等出现的“岔气”现象。出现腹痛时，应减慢速度，用手使劲压住疼痛部位，经过短时间的调整处理后，疼痛感会减轻或消失。如果经上述处理仍然无法缓解，应退出比赛进入救护站处理。为了预防比赛中出现腹痛，在赛前做好充分的准备活 动是非常重要的。</P>','36','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('21','3','马拉松运动员喝什么样的“水”?','马拉松','马拉松运动员喝什么样的“水”?','1','马拉松运动员喝什么样的“水”?','1436936504','1441263540','<p>
	　　在马拉松运动中，身体大量出汗而汗液的主要成分是水，还有钠、钾、氯、镁、钙、磷等矿物质。大量出汗后，随着水分的丧失，也失去很多盐分，体内的电解质因此而失去平衡，以致于人体对视、听觉刺激明显过敏，机体的调节能力也随之降低，此时如果单纯补充水分，会事与愿违越喝越渴，既达不到补水的目的，甚至会导致体温升高，小腿肌肉痉挛，昏迷等"水中毒"症状的 发生。因此补充水分要喝电解质饮料，又称矿物质饮料，饮料中除了水外还包括钠、钾、氯、镁、钙、磷等矿物质及适量含糖物质，以矫正口味，补充机体 的能量消耗。业余马拉松运动员可在比赛前2小时适当吃一些糖补充比赛能量消耗，一般按每千克体重1克左右为宜。比赛中及比赛后可以饮用盐开水，按1：15的比例添加盐和一些糖。
</p>','36','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('78','5','2015台州马拉松电脑桌面','','','1','','1441265475','','<img src="/Uploads/image/news/20150903/20150903093112_18772.jpg" alt="" />','2','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('79','5','2015台州马拉松电脑桌面 2','','','1','','1441265496','','<img src="/Uploads/image/news/20150903/20150903093134_41055.jpg" alt="" />','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('80','5','2015台州马拉松电脑桌面 3','','','1','','1441265511','1441265569','<img src="/Uploads/image/news/20150903/20150903093149_27248.jpg" alt="" />','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('81','5','2015台州马拉松电脑桌面 4','','','1','','1441265528','','<img src="/Uploads/image/news/20150903/20150903093206_22746.jpg" alt="" />','2','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('82','54','比赛规模','比赛规模','赛事规模设计为10000人，其中全程和半程马拉松运动员3000人;迷你马拉松7000人，报名人数报满为止。','1','赛事规模设计为10000人，其中全程和半程马拉松运动员3000人;迷你马拉松7000人，报名人数报满为止。','1441270897','','<span style="color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;line-height:18.0960006713867px;">赛事规模设计为10000人，其中全程和半程马拉松运动员3000人;迷你马拉松7000人，报名人数报满为止。</span>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('83','54','出发时间及顺序','出发时间及顺序','　比赛采用1枪发令。8:00准时出发，顺序按照全程马拉松、半程马拉松、迷你马拉松依次排列进行。','1','　比赛采用1枪发令。8:00准时出发，顺序按照全程马拉松、半程马拉松、迷你马拉松依次排列进行。','1441270927','','<span style="color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;line-height:18.0960006713867px;">　比赛采用1枪发令。8:00准时出发，顺序按照全程马拉松、半程马拉松、迷你马拉松依次排列进行。</span>','2','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('22','3','选择什么样的鞋好呢?','马拉松','选择什么样的鞋好呢?','1','选择什么样的鞋好呢?','1436936718','1441263510','<p>
	　　应当选用胶鞋或越野跑鞋为好，鞋内的海绵最好是泡沫橡胶的，这种鞋具有较大的缓冲性和保护作用，使脚掌不易疲劳也可以大大减小受伤的可能性。
</p>
<p>
	　　其次，要选择适宜的鞋号，过大过小都不好。最好是穿上鞋后，脚感舒适，并稍有空隙。鞋太小会使脚趾相互挤压，容易打血泡;鞋大穿上不跟脚且脚在鞋内晃动，容易损伤脚。比赛时最好穿八成新的跑鞋，脚对这样的鞋已经适应，不易打血泡，同时鞋的弹性还比较好，比较柔软，鞋底的纹路还没有磨掉，跑起来能用上劲。
</p>
<p>
	　　比赛出发时，如果跑鞋意外脱落，不要慌张，更不能弯腰处理，避免发生拥挤和摔倒。
</p>','38','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('84','54','竞赛办法','竞赛办法','比赛当天封路起至各公里点关门前，比赛线路为公路赛道，出于对参赛者的安全负责，各公里点关门后，比赛线路(即公路)解除交通管制，参赛者须退出比赛，就近疏散或上援助车。如不听劝阻继续跑步者，安全责任自负。发生特殊情况时，组委会可决定提前关门，参赛者须服从指挥。','1','比赛当天封路起至各公里点关门前，比赛线路为公路赛道，出于对参赛者的安全负责，各公里点关门后，比赛线路(即公路)解除交通管制，参赛者须退出比赛，就近疏散或上援助车。如不听劝阻继续跑步者，安全责任自负。发生特殊情况时，组委会可决定提前关门，参赛者须服从指挥。','1441270956','','<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　(一)采用国际田联最新竞赛规则和本届马拉松竞赛规程。
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　(二)相关距离的关门时间：(具体时间以发令时间为准)
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	<br />
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	<br />
</p>
<div align="center" style="margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	<table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style="margin:0px;padding:0px;border:1pt outset;">
		<tbody>
			<tr>
				<td width="138" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<b><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">距离<span style="vertical-align:baseline;"></span></span></b>
					</p>
				</td>
				<td width="147" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<b><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">关门时间<span style="vertical-align:baseline;"></span></span></b>
					</p>
				</td>
				<td width="182" valign="top" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" style="vertical-align:baseline;text-indent:41.3pt;">
						<b><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">具体时间<span style="vertical-align:baseline;"></span></span></b>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">5</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">公里<span style="vertical-align:baseline;"></span></span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">1</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">小时<span style="vertical-align:baseline;"></span></span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">9:00</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">7</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">公里<span style="vertical-align:baseline;"></span></span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">1</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">小时</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">15</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">分钟<span style="vertical-align:baseline;"></span></span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">9:15</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">10</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">公里<span style="vertical-align:baseline;"></span></span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">1</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">小时</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">30</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">分<span style="vertical-align:baseline;"></span></span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" style="vertical-align:baseline;text-indent:49pt;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">9:30</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">12</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">公里<span style="vertical-align:baseline;"></span></span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">1</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">小时</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">45</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">分<span style="vertical-align:baseline;"></span></span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">9:45</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">21.0975</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">公里<span style="vertical-align:baseline;"></span></span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">3</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">小时<span style="vertical-align:baseline;"></span></span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">11:00</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">30</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">公里<span style="vertical-align:baseline;"></span></span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">4</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">小时</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">10</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">分<span style="vertical-align:baseline;"></span></span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">12:10</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">35</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">公里<span style="vertical-align:baseline;"></span></span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">5</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">小时<span style="vertical-align:baseline;"></span></span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">13:00</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">42.195</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">公里<span style="vertical-align:baseline;"></span></span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">6</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;">小时<span style="vertical-align:baseline;"></span></span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;vertical-align:baseline;">
					<p class="MsoNormal" align="center" style="vertical-align:baseline;text-align:center;">
						<span style="vertical-align:baseline;font-size:14pt;font-family:宋体;">14:00</span><span style="vertical-align:baseline;font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	<br />
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	<br />
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　<span style="vertical-align:baseline;color:#FFE500;background-color:#E53333;">特别提示：</span>比赛当天封路起至各公里点关门前，比赛线路为公路赛道，出于对参赛者的安全负责，各公里点关门后，比赛线路(即公路)解除交通管制，参赛者须退出比赛，就近疏散或上援助车。如不听劝阻继续跑步者，安全责任自负。发生特殊情况时，组委会可决定提前关门，参赛者须服从指挥。
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	<br />
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　(三)马拉松比赛采用感应器计时系统服务，组委会提供一次性计时芯片，参赛者须佩带芯片;在起终点及每5公里点都设有计时感应地毯，参赛者行进中必须逐一通过地面的计时感应地毯，如参赛者缺少任何一个计时点的成绩，则取消该参赛者的比赛成绩。除起终点外，选手间在其他计时点曾出现两次(含两次)以上的成绩误差少于0.1秒，也将取消比赛成绩。详情请参阅《运动员参赛指南》。
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	<br />
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　(四)马拉松参赛者，完成比赛后凭两块齐全的号码布到赛后服务区领取本人的寄存衣物。赛后服务区工作到当日16:00，其余未领取的改为第二天到市体育中心组委会办理。本届比赛现场不发放成绩证书，请在关门时间内跑完马拉松的选手赛后登陆台州马拉松官方网站，进行成绩查询并自行打印成绩证书。
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	<br />
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　(五)半程马拉松参赛者，完成比赛后凭号码布到终点衣物寄存点领取衣物，终点衣物寄存点工作到当日13：00，其余未领取的改为第二天到市体育中心组委会办理。详情请参阅《运动员参赛指南》联系电话：
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	<br />
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　半程马拉松比赛的运动员赛后请凭号码布到半程马拉松终点原寄存车领取。半程终点衣物寄存点工作到当日13:00。
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	<br />
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　(八)有关竞赛的具体要求和安排，请详细阅读各项目《运动员参赛指南》。
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	<br />
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　(九)组委会将对参赛者进行兴奋剂抽查。
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	<br />
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　(十)组委会将对起点、终点及每5公里计时点进行录像监控，出现以下违反比赛规定的参赛者将被取消参赛成绩。
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	<br />
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　1、虚假年龄报名或报名后由他人替跑的;
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　2、运动员携带他人计时芯片或一名运动员同时携带2枚或2枚以上计时芯片参加比赛的;
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　3、不按规定的起跑顺序在非本人报名项目区检录起跑的;
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　4、起跑活动中出发抢跑的;
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　5、关门时间后不停止比赛或退出比赛后又插入赛道的;
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　6、采用多人接力等作弊方式完成比赛的;
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　7、没有沿规定线路跑完所报项目的全程，抄近道或乘交通工具途中插入的;
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　8、马拉松项目运动员没有按规定分道及未携带自己的两块号码布通过终点的;
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　9、马拉松项目运动员未跑完全程，违规通过终点领取纪念品的或重复通过终点领取纪念品的;
</p>
<p style="vertical-align:baseline;color:#666666;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:12.0640001296997px;">
	　　10、不服从赛事工作人员的指挥，干扰赛事，聚众闹事的。
</p>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('23','3','如何消除比赛前的紧张情绪?','马拉松','如何消除比赛前的紧张情绪?','1','如何消除比赛前的紧张情绪?','1436936807','1441263476','<P>　　有些人参加马拉松比赛难免会产生一些不必要的紧张，主要表现为临近比赛情绪紧张、提早兴奋、坐立不安、睡眠不好、多汗、尿频等。由于过度兴奋、情绪紧张加上休息不好等原因，造成神经能量和体力消耗过大，到比赛时就很容易疲劳，从而影响比赛中的发挥和取得理想成绩。消除赛前的紧张情绪一般可采用转移兴奋点的方法，可以在赛前进行一些其他有益身心健康的比较平静、舒缓的活动，如看书、下棋、垂钓和散步等，也可采用按摩等方法，消除赛前紧张状态。</P>
','37','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('24','3','为什么赛前要做好充分的准备活动?','马拉松','为什么赛前要做好充分的准备活动?','1','为什么赛前要做好充分的准备活动?','1436936887','1441263445','<p>
	　　马拉松运动是一项长距离有氧运动，比赛前必须刺激运动中枢神经的兴奋灶，使身体各系统、器官(肌肉、血液系统、呼吸系统、运动系统)之间建立一定的协调性，而这一切必须通过循序渐进的准备活动才能达到。通过准备活动，使人体体温升高，肌肉的协调性、伸展性和弹性会得到提高，而肌肉的粘滞性则会降低。如果准备活动不充分，比赛时很快会出现疲劳、肌肉僵硬和酸痛、呼吸急促，甚至不想继续跑下去。因此，只有做好充分的准备活动，才能适应比赛的需要，更好的进入运动状态，避免运动损伤和发生意外。
</p>','50','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('25','3','为什么赛前要排空大小便？ ','马拉松','为什么赛前要排空大小便？ ','1','为什么赛前要排空大小便？ ','1436936955','1441263403','<P>　　食物通过胃肠的消化，营养成分被身体吸收了，剩下的残渣就结成了粪便。身体内多余的水分，加上肌肉和血液中代谢的废物，通过肾脏的过滤，形成了尿液。由于这些代谢废物在直肠和膀胱内积存，增加了身体的重量和负 担，使人运动时不轻松。此外，膀胱壁很薄，被尿液充满后，容易受到运动中意外的碰撞而发生破裂，造成严重的后果。因此，在比赛前排空大小便是很有必要的。</P>','49','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('26','3','为什么参加马拉松比赛前要进行体检？ ','马拉松','为什么参加马拉松比赛前要进行体检？ ','1','为什么参加马拉松比赛前要进行体检？ ','1436937116','1441263190','<p>
	　　参加马拉松比赛前几天一定要进行身体检查，以防参赛过程中发生意外事故。因为有些人身体本来就存在着隐疾(有些疾病自己尚未发现)，如参加运动强度和紧张程度比较大的比赛，有可能促使隐疾爆发，发生意外。特别是患有心血管病人如早期高血压、隐性冠心病、糖尿病;呼吸系统疾病如肺心病、 慢性支气管炎以及肝炎、肾炎、老年骨质疏松等，不宜参加比赛。正常人体检 如发现下列情况之一者不应参加比赛：安静时心率达85次/分;血压在140/90 毫米汞柱以上;冠心病、频发性心率不齐、房室传导阻滞及其它心脑血管疾病;有慢性病史现活动期、有慢性病史现稳定期但继续参加专项运动时间不满三个月以上者; 赛前一周内患感冒发烧、胸闷憋气、心悸症状连续三天以上;严重失眠;胃肠道疾病;赛前72小时内有外伤史者;安静时呼吸频率达24次/分;体温在摄氏37度以上;肝功能异常;尿检查有尿蛋白及管型等。
</p>','39','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('27','2','我市将举办首届马拉松邀请赛','马拉松','我市将举办首届马拉松邀请赛','1','我市将举办首届马拉松邀请赛','1436937201','1441263053','<P>　　8月25日上午，2015中国·台州首届马拉松邀请赛新闻发布会在椒江召开，台州市人民政府副秘书长、本届马拉松邀请赛组委会委员茅国春介绍2015中国·台州首届马拉松邀请赛的赛事筹备情况，台州市体育局局长、本届马拉松邀请赛组委会委员、办公室主任卢颖才回答了社会各界比较关心的有关问题。</P>
<P>　　2015年中国·台州首届马拉松邀请赛将于11月15日在台州市区鸣枪开跑。这是继今年七月份举办的美国著名球星“NBA”麦迪告别赛、10月份即将举办的台州市第四届运动会之后的又一次最有影响力、参赛人数最多、规模最高，而且最具有社会意义的一次体育盛事。</P>
<P>　　2015年中国·台州首届马拉松邀请赛的举办得到市委、市政府领导的高度重视，市主要领导多次听取筹备工作汇报情况汇报并作重要指示，市委常委会、市长办公会议分别进行专题研究。举办2015中国·台州首届马拉松邀请赛是为了更好地贯彻落实党的“十八”大精神，加快推进市委、市政府确定的“一都三城”战略目标的实现，激发台州人民的热情，聚凝人心，共同建设台州“山海美城”，推动体育事业与城市建设社会事业的共同进步与发展。</P>
<P>　　2015年中国·台州首届马拉松邀请赛是台州历史空前的一项赛事。届时将会有来自全国各地的10000多名运动员参加,其中3000人参加全程和半程马拉松赛，7000人参加迷你马拉松等赛项，合计裁判人员、工作人员和广大志愿工作者总人数达15000人。</P>
<P>　　为了更好地推动全民健身活动的需要，使广大市民能够在自己的家门口就能亲身感受和体验群众性体育活动的深厚魅力，组委会根据专家的意见，确定本次马拉松比赛的线路：从市体育中心出发，沿着市区主要干道至台州湾集聚区一线，途径台州市区主要的标志性建筑及新区建设区域，体现“绿色马拉松、美丽新台州”的活动主题。</P>
<P>　　为了充分吸引海内外和广大市民的踊跃积极参与，本次马拉松比赛设置了男、女全程马拉松和男、女半程马拉松、男、女迷你马拉松等赛项组别，每项设20个奖项，最高奖额为5万元。</P>
<P>　　2015中国·台州马拉松邀请赛由台州市人民政府主办，台州市体育局、台州市体育总会、椒江区人民政府承办。</P>
<P>　　目前距离市首届马拉松邀请赛举办已指日可待，各项筹备工作都已进入倒计时。台马赛LOGO和主题口号已向全社会公开征集，筹委会办公室已全面启动，其它相关工作都在顺利进行中。我们期待着2015中国·台州首届马拉松邀请赛取得圆满成功，也期待着社会各界朋友们对本次活动的大力支持和积极参与。</P>','39','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('28','2','做好台州首届马拉松筹备工作','马拉松','做好台州首届马拉松筹备工作','1','做好台州首届马拉松筹备工作','1436937288','1441262889','<p>
	　　2015中国·台州首届马拉松邀请赛将在11月15日举行。8月28日，市领导和市体育局、市公安局等相关部门工作人员一起，对马拉松路线进行了实地勘察，并召开工作汇报会，根据相关部门的建议，对路线进行优化。
</p>
<p>
	　　此次马拉松设男女全程、半程和迷你马拉松6个组别，每个项目设奖达20个，最高奖额为5万元人民币。马拉松初步设计路线是从市体育中心出发，途经市民广场、市府大道、开发大道等主干道至集聚区管委会。全程马拉松从市体育中心出发至集聚区管委会，再返回市体育中心，来回路线总长42.195公里。半程马拉松终点为台州经济开发区滨海展示馆，全长21公里。迷你马拉松为5公里。目前，马拉松尚未开始报名。
</p>
<p>
	　　会议指出，此次台州马拉松邀请赛的举行，将有利于提升台州的美誉度，展示台州的城市形象，推动全民健身运动深入发展。各相关部门在筹备工作中，要制定、细化专项方案，确保在马拉松邀请赛期间的餐饮、住宿安全，做好马拉松沿线安保、交通疏导等工作。
</p>','53','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('29','4','2015中国·台州首届马拉松邀请赛将于11月15日举行','马拉松','2015中国·台州首届马拉松邀请赛将于11月15日举行','1','2015中国·台州首届马拉松邀请赛将于11月15日举行','1436937349','1441262780','<P>　　昨天上午，记者从市体育局召开的新闻发布会获悉：2015中国·台州首届马拉松邀请赛将于11月15日在台州市区鸣枪开跑，届时将有来自全国各地的10000多名运动员参加。台州籍世界极限马拉松运动员陈盆滨有望亮相并领跑。</P>
<P>　　据市体育局局长卢颖才介绍，2015中国·台州首届马拉松邀请赛是台州历史空前的一项赛事。届时将会有来自全国各地的10000多名运动员参加，其中3000人参加全程和半程马拉松赛，7000人参加迷你马拉松等赛项，合计裁判人员、工作人员和广大志愿工作者人数达15000人。</P>
<P>　　为了充分吸引海内外和广大市民的参与，本次马拉松比赛设置了全程、半程、迷你马拉松等赛项组别，每项设20个奖项，最高奖额为5万元。</P>
<P>　　据了解，为了更好地推动全民健身活动，使广大市民能够在家门口就能亲身感受和体验群众性体育活动的深厚魅力，组委会对本次马拉松的跑步线路做了周密的安排。</P>
<P>　　“本次马拉松的比赛线路是这样的：从市体育中心出发，沿着市区主要干道至台州湾集聚区一线，途经台州市区主要的标志性建筑及新区建设区域。”卢颖才说，这个线路的安排是为了充分体现“绿色马拉松、美丽新台州”的活动主题。</P>
<P>　　我市热爱跑步的人很多，玉环的陈盆滨就是典型代表。今年4月2日陈盆滨开始“100马拉松”活动，用三个多月时间从广州跑到北京;上周他又在印度列城获得222公里高海拔极限马拉松冠军，创造了新的奇迹。</P>
<P>　　卢颖才介绍，市体育局已经和陈盆滨取得联系，邀请他参加我市首届马拉松邀请比赛并担任领跑。</P>
<P>　　据了解，我市首届马拉松邀请赛是继今年7月份举办的美国著名“NBA”球星麦迪告别赛、10月份即将举办的台州市第四届运动会之后的又一次最有影响力、参赛人数最多、规模最高，而且最具有社会意义的一次体育盛事。</P>
<P>　　目前距离市首届马拉松邀请赛举办已不到三个月，各项筹备工作已进入倒计时。台州首届马拉松邀请赛会标和主题口号已向全社会公开征集，筹委会办公室已全面启动，其他相关工作都在顺利进行中。</P>
<P>　　据悉，2015中国·台州首届马拉松邀请赛由台州市人民政府主办，台州市体育局、台州市体育总会、椒江区人民政府承办。</P>','49','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('30','1','今年台州将举办马拉松赛事','马拉松','今年台州将举办马拉松赛事','1','今年台州将举办马拉松赛事','1436937403','1441262729','<p>
	　　2015厦门国际马拉松比赛昨日举行，台州路跑分会60名选手参赛，陈盆滨作为嘉宾跑完全程。
</p>
<p>
	　　市体育局相关负责人透露——
</p>
<p>
	　　昨天上午，2015厦门国际马拉松比赛在厦门五通灯塔公园鸣枪开赛。台州田径协会路跑分会组织了陆建明等60名选手参赛，我市著名极限马拉松运动员陈盆滨作为嘉宾也参与了比赛。他们都圆满完成了全部赛程，展示了台州马拉松爱好者的良好风采。
</p>
<p>
	　　今年厦门马拉松只保留全程马拉松和半程马拉松两个项目，共有53个国家和地区的43064人报名参赛。自2003年以来，厦门国际马拉松赛已经成功举办了12届，连续8届荣获“国际田联路跑协会金牌赛事”的称号。
</p>
<p>
	　　经过一番比拼，肯尼亚选手摩西·莫索普打破中国境内马拉松赛记录，以2小时6分19秒的成绩夺得冠军。来自大连的选手李少壮以1小时12分12秒的成绩夺得男子半程第一。
</p>
<p>
	　　“厦门马拉松赛事在世界上的知名度很高，可以说是中国马拉松比赛的楷模。”陈盆滨在电话中说，厦门马拉松的大众参与度高，后勤保障完善，给广大市民提供了一个参与马拉松的良好平台。
</p>
<p>
	　　“这次我陪朋友过来参加，我们都顺利地跑完全程，充分体会到跑步带来的乐趣。”陈盆滨说，今年4月份开始，他在100天里将跑100个马拉松，用这种方式推广马拉松这项运动。
</p>
<p>
	　　陈盆滨擅长极限马拉松比赛，它的赛程更长、挑战性更大。9月份开始，他将会参加两三个国际极限马拉松赛事。
</p>
<p>
	　　台州路跑分会这次组织了60名选手参加厦门马拉松比赛，除了3名选手跑半程马拉松以外，其余的都参加全程马拉松比赛。其中椒江行政服务中心的陆建明以3小时1分的成绩，在台州选手中名列第一。
</p>
<p>
	　　“这项运动增强了我的体质，从中收获了不断超越自我的快乐。”陆建明说，他平时每天晚上都到市民广场跑10公里左右，偶尔组织大家到临海小芝去拉练，增强体力。陆建明2012年开始跑马拉松，2013年杭州国际马拉松比赛中他曾获得半程第三的好成绩。
</p>
<p>
	　　市体育局群体处处长沈伟林也带队在厦门考察本届马拉松比赛。“我们过来考察学习厦门的赛事举办、后勤保障等各项工作，2015年台州也准备举行马拉松比赛，为广大马拉松运动爱好者提供展示的平台。”沈伟林说。
</p>','46','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('31','1','关于征集2015中国台州首届马拉松邀请赛LOGO、主题口号的启事','马拉松','2015中国台州首届马拉松邀请赛于2015年11月15日在台州市区举行。本次赛事由台州市人民政府主办，台州市体育局承办。','1','2015中国台州首届马拉松邀请赛于2015年11月15日在台州市区举行。本次赛事由台州市人民政府主办，台州市体育局承办。','1436937461','1441262720','<p>
	　　2015中国台州首届马拉松邀请赛于2015年11月15日在台州市区举行。本次赛事由台州市人民政府主办，台州市体育局承办。
</p>
<p>
	　　为更好地彰显马拉松体育精神，展示台州市区及台州湾集聚区的自然、人文风光，提高城市知名度、美誉度，现面向全社会公开征集台州市首届马拉松邀请赛LOGO、主题口号。
</p>
<p>
	　　一、赛事背景
</p>
<p>
	　　本次马拉松赛规模为1万人，分为全程马拉松、半程马拉松和迷你马拉松3个项目，赛道设置涵盖台州市区、台州湾集聚区。赛事将全面展现台州“国际智造名城”、“海上丝路港城”、“山海宜居美城”的城市特色。
</p>
<p>
	　　二、征集内容
</p>
<p>
	　　2015中国台州首届马拉松邀请赛LOGO、主题口号。
</p>
<p>
	　　三、作品要求
</p>
<p>
	　　1.能准确反映台州的地域特色，充分体现台州城市特征、资源优势和人文精髓，并与国际马拉松比赛的赛事特色、体育精神深度融合。
</p>
<p>
	　　2.LOGO作品要求简洁明了，具有较强的视觉冲击力，适合平面宣传的各种用途。设计方案要求为A4彩色稿，并附简要创意说明。
</p>
<p>
	　　3.主题口号要求朗朗上口，易读易记，便于宣传和推广。
</p>
<p>
	　　四、征集时间
</p>
<p>
	　　征集时间：自公告发布之日起至2015年9月1日;获奖作品公布时间：2015年9月5日。
</p>
<p>
	　　五、投稿方式
</p>
<p>
	　　所有投稿作品通过电子邮件形式发至：3184640231@qq.com邮箱(请注明作者姓名及联系电话)
</p>
<p>
	　　六、评选及奖励
</p>
<p>
	　　此次征集2015中国台州首届马拉松邀请赛LOGO、主题口号，组委会将聘请专家组成评委会，在认真审阅、充分比较的基础上，评出部分优秀作品。评选结果将通过媒体公布。
</p>
<p>
	　　奖项设置：LOGO、主题口号征集设一等奖各1名，各奖励人民币3000元;设入围奖各2名，各奖励人民币1000元。
</p>
<p>
	　　七、有关说明
</p>
<p>
	　　1.投稿作品应为原创作品，并确保从未以任何形式公开发表过。
</p>
<p>
	　　2.应征者须保证所投稿件未侵犯他人知识产权。凡涉及著作权、版权纠纷等法律问题，均由应征人自行承担后果。
</p>
<p>
	　　3.所有作品一旦投稿，版权、使用权等归2015中国台州首届马拉松邀请赛组委会所有。
</p>
<p>
	　　4.本次活动不收取任何费用，应征者在应征过程中产生的一切费用自理。
</p>
<p>
	　　5.本次征集活动最终解释权归2015中国台州首届马拉松邀请赛组委会。凡投稿者均视为同意并遵守活动主办方的一切规定及要求。
</p>
<p>
	　　2015中国台州首届马拉松邀请赛组委会
</p>
<p>
	　　2015年8月18日
</p>','38','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('32','2','关于举办台州马拉松赛的倡议','马拉松','体育运动与经济发展及文明程度密切相关，进入二十世纪六七十年代，马拉松运动在全世界得到了普及，特别是在发达国家，普及程度更高，几乎所有的国际大都市都有自己的马拉松赛。','1','体育运动与经济发展及文明程度密切相关，进入二十世纪六七十年代，马拉松运动在全世界得到了普及，特别是在发达国家，普及程度更高，几乎所有的国际大都市都有自己的马拉松赛。人口3亿的美国平均每天不少于一场马拉松赛事;我们的近邻韩国和日本每年都有100多场。2006年美国有37.9万人次完成了马拉松赛;在我国大陆，2007年度完成人次数首次超过1万，为1.14万人次。','1436937682','1441263089','<p>
	　　一、前言
</p>
<p>
	　　关于举办台州马拉松赛的倡议，笔者曾于2008年委托友人作为市政协提案提出，也曾于2009年发至市体育局及市长信箱，还曾于2010年写信给市长。彼时，职能部门认为台州市尚不具备举办马拉松的条件，主要理由是：从马拉松运动的角度来看，台州举办马拉松赛合适的路线是连接三区的大环线。而在当时，大环线是台州市仅有的一条连接三区的大动脉，是台州市交通生命线。倘若在大环线实施交通管制、封闭，将直接导致台州市三区交通瘫痪。对于这样的理由，笔者是理解并认同的。但是现在，中心大道等连接三区的道路陆续开通，大环线不再是连接三区的唯一道路，在大环线举办马拉松赛已经成为可能。
</p>
<p>
	　　二、马拉松赛的起源
</p>
<p>
	　　现代马拉松比赛起源于一个希腊历史故事。公元前490年，希腊与波斯两国军队在距雅典约40千米的马拉松村进行了一场会战。希腊军队以少胜多，打败了强大的波斯侵略军。传令兵菲迪皮得斯奉命将这一胜利消息尽快告诉雅典居民，他从马拉松村跑到雅典，传达了胜利的消息后，便因精疲力竭而牺牲。
</p>
<p>
	　　法国语言学家米歇尔·布里尔非常钦佩这位马拉松战役中的战士，他向现代奥林匹克之父顾拜旦建议在1896年第一届(雅典)奥运会上增设一项以“马拉松”命名的长跑赛，以纪念这位可歌可泣的战士。这个建议被欣然采纳，从此，马拉松比赛诞生了，并作为奥运会的传统比赛项目保留至今。
</p>
<p>
	　　前三届奥运会马拉松比赛的距离都是40千米左右，但具体距离不尽相同。到了1908年第四届(伦敦)奥运会，为照顾英国王室成员观看马拉松比赛，大会组委会就将起点安排在温莎尔宫的草坪前，终点设在白城运动场。从起点温莎尔宫的草坪到终点白城运动场王室成员的包厢前，全程26英里385码，即42.195千米。至此，马拉松赛的正式距离固定为42.195千米。
</p>
<p>
	　　三、马拉松运动的现状
</p>
<p>
	　　体育运动与经济发展及文明程度密切相关，进入二十世纪六七十年代，马拉松运动在全世界得到了普及，特别是在发达国家，普及程度更高，几乎所有的国际大都市都有自己的马拉松赛。人口3亿的美国平均每天不少于一场马拉松赛事;我们的近邻韩国和日本每年都有100多场。2006年美国有37.9万人次完成了马拉松赛;在我国大陆，2007年度完成人次数首次超过1万，为1.14万人次。
</p>
<p>
	　　我国大陆的马拉松运动水平整体偏低，能够跑完全程的选手只占参赛选手总数的20-30%。由于参加全程比赛的人数有限，包括北京、厦门、上海在内的中国城市马拉松，普遍设立了5千米、10千米、半程和全程等多个项目。在欧美国家的马拉松赛事中，马拉松就是42.195千米的比赛，且马拉松赛的完成率普遍达90%以上。
</p>
<p>
	　　虽然我国大陆的城市马拉松运动起步晚、水平低，但是近年发展迅速。2000年之前，大陆地区的城市马拉松赛只有北京、上海、杭州、大连等城市每年举办一次。2007年，被业界称为“中国马拉松元年”，那一年，中国大陆马拉松赛数量陡增，达14个，笔者也是于2007年初首次参加，迄今已完成22个马拉松赛。至2014年底，在中国田径协会注册的中国大陆地区马拉松赛已达40个。2015年，可谓“浙江马拉松元年”，浙江省由历年来杭州马拉松一枝独秀，骤然发展到9个马拉松赛。
</p>
<p>
	　　四、马拉松赛的魅力
</p>
<p>
	　　跑步是人类与生俱来的技能，跑步的装备简单，又不受时间、地点的限制，它最容易、最普及、最为民众所接受。马拉松运动是历史最悠久、最具影响力、最能彰显奥运精神的跑步项目。马拉松精神是顽强拼搏、锐意进取、勇往直前、永不止步的精神，它代表着毅力、希望、喜悦与和平。
</p>
<p>
	　　马拉松运动具有强大的整合资源功能。城市马拉松赛在得到社会各方面支持的同时，也毫不吝啬地给城市和所有参与者以巨大的回报，这便是马拉松运动的魅力所在。
</p>
<p>
	　　对于举办城市而言，马拉松赛是一张名片，向全国乃至全世界介绍自己的城市，展示城市的发展和魅力。同时，由于举办马拉松赛而吸引到的资金、带来的旅游、餐饮、交通等服务的消费增长，以及由此引起的投资和消费的乘数效应，无疑为城市的繁荣发展注入了营养和动力。马拉松赛是城市的节日，是所有参与者共同的事业，自然也成为所有参与者协作的桥梁和交流的纽带。通过参与这个共同的事业，不仅有利于促进城市的和谐发展，还有利于增进市民的认同感和主人翁意识，增强城市的凝聚力。
</p>
<p>
	　　对于商家而言，马拉松赛由于观众多、媒体宣传广泛、影响力大，是一个极好的营销载体。在传统营销载体和营销手段效能逐渐减弱的情况下，与体育相结合开展营销活动的优势日渐突出，特别是与城市马拉松赛这样一个群体互动的赛事相结合，既体现了企业的实力，又提升了企业和产品的知名度和美誉度，经济效益和社会效益不言而喻。
</p>
<p>
	　　对于参赛民众而言，参加马拉松运动同时达到了强身健体、社会交往和满足自我实现的需求。在众多的体育运动中，只有城市马拉松这个运动项目可以实现竞技体育和群众体育的完美结合，顶尖高手与普通民众同场竞技，既有观赏性，又能亲身参与互动。群众的参与可以是几千人，也可以是几万人，这是其它任何运动项目所无法比拟的。于是，马拉松赛让一个城市活跃起来，让一个地方健康起来。健康是永恒的主题，体育与健康密不可分，全民健身活动的开展有赖于城市马拉松赛这样群体活动的普及。
</p>
<p>
	　　五、台州举办马拉松赛的必要性
</p>
<p>
	　　台州市经过20年的孕育、发展，已经成为一个重要的工业化城市，经济发达，民众富足。体育运动的发展轨迹与社会经济发展密切相关，在一定程度上体现了社会经济的发展。借用马斯洛的需要层次论分析，当经济发展到一定程度，人们较低层次的需求得到满足后，最高层次的“自我实现”需求便成为关注的中心。马拉松运动正迎合了人们这一需求，因此必将随台州经济社会发展而不断普及。台州的马拉松赛人数由2007年的数十人，发展到如今的近千人，中、短距离的跑步健身爱好者，早已不计其数。这些，就是最好的例证。
</p>
<p>
	　　成功举办台州马拉松赛，将成为台州的一张亮丽名片，会更好地展示城市形象，提升城市品位，锤炼城市文化。以体育赛事搭建交流的舞台，展示台州地理、历史、文化等社会资源，将有力地促进和推动台州的发展。随着经济基础的巩固，越来越多的人会将关注的目光和参与的脚步转向台州这片神奇的土地。而马拉松赛事正好以此为契机，挖掘并利用台州独有的社会资源，培育和发展台州体育产业，促进全民健身，带动旅游、文化等相关产业的发展，为建设富裕台州、和谐台州、文明台州、健康台州作出贡献。
</p>
<p>
	　　六、结束语
</p>
<p>
	　　随着椒江至路桥的中心大道的开通，台州大环线全长缩短至约41千米，这不仅给马拉松的起终点一致提供了必要前提，而且给马拉松线路设计留有余地。主城区椒江至路桥已经有2条以上主干道，如此，就可以考虑在马拉松赛时对中心大道全线或半道封闭，而宽阔的中心大道，足以满足5千米、10千米、半程马拉松比赛的需求。职能部门担忧的交通压力，从根本上得以缓解。考虑到全程马拉松参赛人数有限，路桥、黄岩、椒江一线可以实行半道封闭，或者在非机动车道上举行，从而兼顾交通、比赛的需求。
</p>
<p>
	　　台州大环线把台州市三区连在一起，是台州的城市快速通道，希望这条通道也将是台州马拉松赛的最好赛道。
</p>
<p>
	　　台州马拉松赛将不仅仅是台州的体育盛事，还将成为台州民众期盼的狂欢节。让我们共同努力，把台州马拉松赛打造成体育的舞台、城市的盛会、民众的节日。
</p>','73','1','0','0','zh-cn');


# 数据库表：pa_node 数据信息
INSERT INTO `pa_node` VALUES ('1','Admin','后台管理','1','网站后台管理项目','10','0','1');
INSERT INTO `pa_node` VALUES ('2','Index','管理首页','1','','1','1','2');
INSERT INTO `pa_node` VALUES ('3','Member','注册会员管理','1','','3','1','2');
INSERT INTO `pa_node` VALUES ('4','Webinfo','系统管理','1','','4','1','2');
INSERT INTO `pa_node` VALUES ('5','index','默认页','1','','5','2','3');
INSERT INTO `pa_node` VALUES ('6','myInfo','我的个人信息','1','','6','2','3');
INSERT INTO `pa_node` VALUES ('7','index','会员首页','1','','7','3','3');
INSERT INTO `pa_node` VALUES ('8','index','管理员列表','1','','8','14','3');
INSERT INTO `pa_node` VALUES ('9','addAdmin','添加管理员','1','','9','14','3');
INSERT INTO `pa_node` VALUES ('10','index','系统设置首页','1','','10','4','3');
INSERT INTO `pa_node` VALUES ('11','setEmailConfig','设置系统邮件','1','','12','4','3');
INSERT INTO `pa_node` VALUES ('12','testEmailConfig','发送测试邮件','1','','0','4','3');
INSERT INTO `pa_node` VALUES ('13','setSafeConfig','系统安全设置','1','','0','4','3');
INSERT INTO `pa_node` VALUES ('14','Access','权限管理','1','权限管理，为系统后台管理员设置不同的权限','0','1','2');
INSERT INTO `pa_node` VALUES ('15','nodeList','查看节点','1','节点列表信息','0','14','3');
INSERT INTO `pa_node` VALUES ('16','roleList','角色列表查看','1','角色列表查看','0','14','3');
INSERT INTO `pa_node` VALUES ('17','addRole','添加角色','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('18','editRole','编辑角色','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('19','opNodeStatus','便捷开启禁用节点','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('20','opRoleStatus','便捷开启禁用角色','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('21','editNode','编辑节点','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('22','addNode','添加节点','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('23','addAdmin','添加管理员','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('24','editAdmin','编辑管理员信息','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('25','changeRole','权限分配','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('26','News','资讯管理','1','','0','1','2');
INSERT INTO `pa_node` VALUES ('27','index','新闻列表','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('28','category','新闻分类管理','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('29','add','发布新闻','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('30','edit','编辑新闻','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('31','del','删除信息','0','','0','26','3');
INSERT INTO `pa_node` VALUES ('32','SysData','数据库管理','1','包含数据库备份、还原、打包等','0','1','2');
INSERT INTO `pa_node` VALUES ('33','index','查看数据库表结构信息','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('34','backup','备份数据库','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('35','restore','查看已备份SQL文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('36','restoreData','执行数据库还原操作','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('37','delSqlFiles','删除SQL文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('38','sendSql','邮件发送SQL文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('39','zipSql','打包SQL文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('40','zipList','查看已打包SQL文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('41','unzipSqlfile','解压缩ZIP文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('42','delZipFiles','删除zip压缩文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('43','downFile','下载备份的SQL,ZIP文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('44','repair','数据库优化修复','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('46','Siteinfo','网站功能','1','','0','1','2');
INSERT INTO `pa_node` VALUES ('47','index','菜单列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('48','add_nav','添加/编辑菜单','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('49','adindex','轮播列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('50','add_ad','添加/编辑轮播','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('51','page','单页列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('52','add_page','添加/编辑单页','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('53','tag_index','标签列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('54','add_tag','添加/编辑标签','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('55','create_tag','模版标签生成','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('56','file_index','文件管理','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('57','link_index','友情链接列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('58','add_link','添加/编辑友情链接','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('59','message','留言信息列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('60','Product','产品管理','1','','0','1','2');
INSERT INTO `pa_node` VALUES ('61','delpage','删除单页','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('62','delad','删除轮播','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('63','dellink','删除友情链接','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('64','delmessage','删除留言','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('65','deltag','删除标签','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('66','selectCat','文章分类','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('67','index','产品列表','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('68','edit','编辑产品','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('69','add','添加产品','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('70','category','分类列表','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('71','del','删除产品','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('72','changeAttr','快速推荐','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('73','changeStatus','快速审核','0','','0','60','3');
INSERT INTO `pa_node` VALUES ('74','changePhoneStatus','手机推荐','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('75','checkProductTitle','标题检查','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('76','changeAttr','快速推荐','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('77','changeStatus','快速审核','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('78','Models','模型管理','1','','0','1','2');
INSERT INTO `pa_node` VALUES ('79','index','模型列表','1','','0','78','3');
INSERT INTO `pa_node` VALUES ('80','add','添加模型','1','','0','78','3');


# 数据库表：pa_page 数据信息
INSERT INTO `pa_page` VALUES ('20','zjds','0','赛事信息','<p>
	<span style="font-size:18px;">一、主办单位</span>
</p>
<p>
	　　浙江省体育局、台州市人民政府
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">二、承办单位</span>
</p>
<p>
	　　组委会各成员单位
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">三、执行承单位</span>
</p>
<p>
	　　台州市体育局
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">四、比赛时间、地点</span>
</p>
<p>
	　　比赛时间：2015年11月15日8：00(星期日)
</p>
<p>
	　　比赛地点：台州市区
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">五、比赛项目</span>
</p>
<p>
	　　(一)男、女马拉松(42.195公里)
</p>
<p>
	　　(二)男、女半程马拉松(21.0975公里)
</p>
<p>
	　　(三)迷你马拉松(5公里)
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">六、比赛路线</span>
</p>
<p>
	　　<span style="color:#009900;">全程马拉松：</span>台州市体育中心体育场(起点)→学院路→市府大道→中心大道→广场中路→祥云路→群韵路→祥和路→白云山中路→市府大道→经中路→开发大道→开发大道东段→聚海大道折返→开发大道东段→开发大道→机场北路路→机场路→市府大道→学院路→台州市体育中心体育场(终点)
</p>
<p>
	　　<span style="color:#009900;">半程马拉松：</span>台州市体育中心体育场(起点)→学院路→市府大道→中心大道→广场中路→祥云路→群韵路→祥和路→白云山中路→市府大道→经中路→开发大道折返→机场北路路→机场路→市府大道→学院路→台州市体育中心体育场(终点)
</p>
<p>
	　　<span style="color:#009900;">迷你马拉松：</span>台州市体育中心体育场(起点)→学院路→市府大道→中心大道→广场中路→爱华路→耀达路→市府大道→学院路→台州市体育中心体育场(终点)
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">七、报名办法</span>
</p>
<p>
	　　<span style="color:#E53333;">(一)年龄要求</span>
</p>
<p>
	　　1.马拉松项目年龄限20岁以上(1995年1月3日以前出生);
</p>
<p>
	　　2.半程马拉松项目年龄限18岁以上(1997年1月3日以前出生)。
</p>
<p>
	　　<span style="color:#E53333;">(二)健康要求</span>
</p>
<p>
	　　参赛者应身体健康，经常参加跑步锻炼或训练。参赛者可根据自己的身体状况和能力，选择参赛项目。以下疾病患者不宜参加比赛：
</p>
<p>
	　　1、先天性心脏病和风湿性心脏病患者;
</p>
<p>
	　　2、高血压和脑血管疾病患者;
</p>
<p>
	　　3、心肌炎和其它心脏病患者;
</p>
<p>
	　　4、冠状动脉病患者和严重心律不齐者;
</p>
<p>
	　　5、血糖过高或过低的糖尿病患者;
</p>
<p>
	　　6、其他不适合运动的疾病患者。
</p>
<p>
	　　<span style="color:#E53333;">(三)报名办法(另定)</span>
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">八、比赛规模</span>
</p>
<p>
	　　赛事规模设计为10000人，其中全程和半程马拉松运动员3000人;迷你马拉松7000人，报名人数报满为止。
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">九、出发时间及顺序</span>
</p>
<p>
	　　比赛采用1枪发令。8:00准时出发，顺序按照全程马拉松、半程马拉松、迷你马拉松依次排列进行。
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">十、竞赛办法</span>
</p>
<p>
	　　(一)采用国际田联最新竞赛规则和本届马拉松竞赛规程。
</p>
<p>
	　　(二)相关距离的关门时间：(具体时间以发令时间为准)
</p>
<p>
	<br />
</p>
<p>
	<br />
</p>
<div align="center">
	<table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style="border:1pt outset;">
		<tbody>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<b><span style="font-size:14pt;font-family:宋体-PUA;">距离</span></b>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<b><span style="font-size:14pt;font-family:宋体-PUA;">关门时间</span></b>
					</p>
				</td>
				<td width="182" valign="top" style="border:1pt inset;">
					<p class="MsoNormal" style="text-indent:41.3pt;">
						<b><span style="font-size:14pt;font-family:宋体-PUA;">具体时间</span></b>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">5</span><span style="font-size:14pt;font-family:宋体-PUA;">公里</span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">1</span><span style="font-size:14pt;font-family:宋体-PUA;">小时</span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">9:00</span><span style="font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">7</span><span style="font-size:14pt;font-family:宋体-PUA;">公里</span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">1</span><span style="font-size:14pt;font-family:宋体-PUA;">小时</span><span style="font-size:14pt;font-family:宋体;">15</span><span style="font-size:14pt;font-family:宋体-PUA;">分钟</span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">9:15</span><span style="font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">10</span><span style="font-size:14pt;font-family:宋体-PUA;">公里</span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">1</span><span style="font-size:14pt;font-family:宋体-PUA;">小时</span><span style="font-size:14pt;font-family:宋体;">30</span><span style="font-size:14pt;font-family:宋体-PUA;">分</span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;">
					<p class="MsoNormal" style="text-indent:49pt;">
						<span style="font-size:14pt;font-family:宋体;">9:30</span><span style="font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">12</span><span style="font-size:14pt;font-family:宋体-PUA;">公里</span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">1</span><span style="font-size:14pt;font-family:宋体-PUA;">小时</span><span style="font-size:14pt;font-family:宋体;">45</span><span style="font-size:14pt;font-family:宋体-PUA;">分</span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">9:45</span><span style="font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">21.0975</span><span style="font-size:14pt;font-family:宋体-PUA;">公里</span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">3</span><span style="font-size:14pt;font-family:宋体-PUA;">小时</span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">11:00</span><span style="font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">30</span><span style="font-size:14pt;font-family:宋体-PUA;">公里</span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">4</span><span style="font-size:14pt;font-family:宋体-PUA;">小时</span><span style="font-size:14pt;font-family:宋体;">10</span><span style="font-size:14pt;font-family:宋体-PUA;">分</span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">12:10</span><span style="font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">35</span><span style="font-size:14pt;font-family:宋体-PUA;">公里</span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">5</span><span style="font-size:14pt;font-family:宋体-PUA;">小时</span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">13:00</span><span style="font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">42.195</span><span style="font-size:14pt;font-family:宋体-PUA;">公里</span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">6</span><span style="font-size:14pt;font-family:宋体-PUA;">小时</span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">14:00</span><span style="font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<p>
	<br />
</p>
<p>
	<br />
</p>
<p>
	　　<span style="color:#FFE500;background-color:#E53333;">特别提示：</span>比赛当天封路起至各公里点关门前，比赛线路为公路赛道，出于对参赛者的安全负责，各公里点关门后，比赛线路(即公路)解除交通管制，参赛者须退出比赛，就近疏散或上援助车。如不听劝阻继续跑步者，安全责任自负。发生特殊情况时，组委会可决定提前关门，参赛者须服从指挥。
</p>
<p>
	<br />
</p>
<p>
	　　(三)马拉松比赛采用感应器计时系统服务，组委会提供一次性计时芯片，参赛者须佩带芯片;在起终点及每5公里点都设有计时感应地毯，参赛者行进中必须逐一通过地面的计时感应地毯，如参赛者缺少任何一个计时点的成绩，则取消该参赛者的比赛成绩。除起终点外，选手间在其他计时点曾出现两次(含两次)以上的成绩误差少于0.1秒，也将取消比赛成绩。详情请参阅《运动员参赛指南》。
</p>
<p>
	<br />
</p>
<p>
	　　(四)马拉松参赛者，完成比赛后凭两块齐全的号码布到赛后服务区领取本人的寄存衣物。赛后服务区工作到当日16:00，其余未领取的改为第二天到市体育中心组委会办理。本届比赛现场不发放成绩证书，请在关门时间内跑完马拉松的选手赛后登陆台州马拉松官方网站，进行成绩查询并自行打印成绩证书。
</p>
<p>
	<br />
</p>
<p>
	　　(五)半程马拉松参赛者，完成比赛后凭号码布到终点衣物寄存点领取衣物，终点衣物寄存点工作到当日13：00，其余未领取的改为第二天到市体育中心组委会办理。详情请参阅《运动员参赛指南》联系电话：
</p>
<p>
	<br />
</p>
<p>
	　　半程马拉松比赛的运动员赛后请凭号码布到半程马拉松终点原寄存车领取。半程终点衣物寄存点工作到当日13:00。
</p>
<p>
	<br />
</p>
<p>
	　　(八)有关竞赛的具体要求和安排，请详细阅读各项目《运动员参赛指南》。
</p>
<p>
	<br />
</p>
<p>
	　　(九)组委会将对参赛者进行兴奋剂抽查。
</p>
<p>
	<br />
</p>
<p>
	　　(十)组委会将对起点、终点及每5公里计时点进行录像监控，出现以下违反比赛规定的参赛者将被取消参赛成绩。
</p>
<p>
	<br />
</p>
<p>
	　　1、虚假年龄报名或报名后由他人替跑的;
</p>
<p>
	　　2、运动员携带他人计时芯片或一名运动员同时携带2枚或2枚以上计时芯片参加比赛的;
</p>
<p>
	　　3、不按规定的起跑顺序在非本人报名项目区检录起跑的;
</p>
<p>
	　　4、起跑活动中出发抢跑的;
</p>
<p>
	　　5、关门时间后不停止比赛或退出比赛后又插入赛道的;
</p>
<p>
	　　6、采用多人接力等作弊方式完成比赛的;
</p>
<p>
	　　7、没有沿规定线路跑完所报项目的全程，抄近道或乘交通工具途中插入的;
</p>
<p>
	　　8、马拉松项目运动员没有按规定分道及未携带自己的两块号码布通过终点的;
</p>
<p>
	　　9、马拉松项目运动员未跑完全程，违规通过终点领取纪念品的或重复通过终点领取纪念品的;
</p>
<p>
	　　10、不服从赛事工作人员的指挥，干扰赛事，聚众闹事的。
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">十一、收费标准</span>
</p>
<p>
	　<strong>　(一)全程马拉松收费标准</strong>
</p>
<p>
	　　(1)参赛者：每人80元人民币。
</p>
<p>
	<br />
</p>
<p>
	　　<strong>(二)半程马拉松收费标准</strong>
</p>
<p>
	　　(1)参赛者：每人40元人民币。
</p>
<p>
	<br />
</p>
<p>
	　<strong>　(三)迷你马拉松收费标准</strong>
</p>
<p>
	　　每人20元人民币。
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">十二、奖励办法(单位：人民币)</span>
</p>
<p>
	<span style="font-size:18px;"><br />
</span>
</p>
<p>
	　　(一)男、女全程马拉松奖金
</p>
<p>
	<br />
</p>
<table class="MsoNormalTable" border="1" cellpadding="0" style="border:1pt solid windowtext;background:white;">
	<tbody>
		<tr>
			<td width="60" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">名次</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">一</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">二</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">三</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">四</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">五</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">六</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">七</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">八至</span>
				</p>
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">十二</span>
				</p>
			</td>
			<td width="52" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">十三</span>
				</p>
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">至二十</span>
				</p>
			</td>
		</tr>
		<tr>
			<td width="60" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">奖金</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">50000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">30000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">10000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">8000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">6000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">5000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">3000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">1000</span>
				</p>
			</td>
			<td width="52" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">500</span>
				</p>
			</td>
		</tr>
	</tbody>
</table>
<p>
	<br />
</p>
<p>
	<br />
</p>
<p>
	　　(二)男、女半程马拉松奖金
</p>
<p>
	<br />
</p>
<table class="MsoNormalTable" border="1" cellpadding="0" style="border:1pt solid windowtext;background:white;">
	<tbody>
		<tr>
			<td width="59" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">名次</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">一</span>
				</p>
			</td>
			<td width="60" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">二</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">三</span>
				</p>
			</td>
			<td width="60" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">四</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">五</span>
				</p>
			</td>
			<td width="60" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">六</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">七</span>
				</p>
			</td>
			<td width="60" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">八至</span>
				</p>
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">十二</span>
				</p>
			</td>
			<td width="60" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">十三</span>
				</p>
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">至二十</span>
				</p>
			</td>
		</tr>
		<tr>
			<td width="59" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">奖金</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">10000</span>
				</p>
			</td>
			<td width="60" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">6000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">4000</span>
				</p>
			</td>
			<td width="60" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">2000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">1000</span>
				</p>
			</td>
			<td width="60" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">800</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">600</span>
				</p>
			</td>
			<td width="60" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">400</span>
				</p>
			</td>
			<td width="60" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">200</span>
				</p>
			</td>
		</tr>
	</tbody>
</table>
<p>
	<br />
</p>
<p>
	<br />
</p>
<p>
	　　<span style="color:#FFE500;background-color:#E53333;">注:</span>(1)所有获奖运动员的成绩在赛事官方网站公示10日后，并确认无兴奋剂问题后再行发放奖金。
</p>
<p>
	　　(2)上述奖金将按照中国税法规定，征收20%的个人所得税。
</p>
<p>
	　　(3)在规定时间内跑完全程者颁发补给包及完赛奖牌。
</p>
<p>
	　　(4)凡参加比赛者赛前均发纪念衫、号码布和盛衣包。
</p>
<p>
	　　(5)发放参赛纪念证书，参赛者可登录官网下载打印成绩。
</p>
<p>
	　　(6)领奖有效期为正式公布获奖名单后30天内，超期未办理者按弃奖处理。
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">十三、医疗救护</span>
</p>
<p>
	　　(一)组委会沿马拉松赛道路线每2.5公里设立一个固定医疗点，医疗点前50米有明显的标志。参赛选手遇有身体不适等紧急情况，可就近治疗。
</p>
<p>
	　　(二)组委会将沿赛道布置医疗救护车，及时处理紧急医疗情况。
</p>
<p>
	　　(三)赛道沿线，组委会将在每100米处设置一名志愿者，协助医疗救护、维护比赛秩序，参赛选手可以随时向他们请求帮助。
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">十四、台州马拉松组委会联系方式</span>
</p>
<p>
	　　地址：台州市体育中心东门马拉松组委会办公室
</p>
<p>
	　　邮政编码：318000
</p>
<p>
	　　办公室电话：0576-89811730592-(上班时间内拨打即上午8：00-12:00下午14:30-17:30) 92-5121241
</p>
<p>
	　　台州马拉松赛官方网址：http://mls.ddl666.com
</p>
<p>
	　　官方邮箱：3273609935@qq.com
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">十五、未尽事项，另行通知。</span>
</p>
<p>
	<br />
</p>
<p>
	<strong>本规程以此次发布为准，解释权属于2015台州马拉松赛组委会。</strong>
</p>','1','台州体育局,马拉松,台州马拉松,赛事信息','2015年台州体育局举办台州马拉松活动官方网站，介绍赛事信息内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('21','gsjj','20','报名参赛','<p>
	　　(一)年龄要求
</p>
<p>
	<br />
</p>
<p>
	　　1.马拉松项目年龄限20岁以上(1995年1月3日以前出生);
</p>
<p>
	　　2.半程马拉松项目年龄限18岁以上(1997年1月3日以前出生)。
</p>
<p>
	<br />
</p>
<p>
	　　(二)健康要求
</p>
<p>
	<br />
</p>
<p>
	　　参赛者应身体健康，经常参加跑步锻炼或训练。参赛者可根据自己的身体状况和能力，选择参赛项目。以下疾病患者不宜参加比赛：
</p>
<p>
	　　1、先天性心脏病和风湿性心脏病患者;
</p>
<p>
	　　2、高血压和脑血管疾病患者;
</p>
<p>
	　　3、心肌炎和其它心脏病患者;
</p>
<p>
	　　4、冠状动脉病患者和严重心律不齐者;
</p>
<p>
	　　5、血糖过高或过低的糖尿病患者;
</p>
<p>
	　　6、其他不适合运动的疾病患者。
</p>
<p>
	<br />
</p>
<p>
	　　(三)报名办法(另定)
</p>','1','台州体育局,马拉松,台州马拉松,报名参赛','2015年台州体育局举办台州马拉松活动官方网站，介绍报名参赛内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('22','dszzc','20','竞赛规程','<p>
	<span style="font-size:18px;">一、主办单位</span> 
</p>
<p>
	　　浙江省体育局、台州市人民政府
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">二、承办单位</span> 
</p>
<p>
	　　组委会各成员单位
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">三、执行承单位</span> 
</p>
<p>
	　　台州市体育局
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">四、比赛时间、地点</span> 
</p>
<p>
	　　比赛时间：2015年11月15日8：00(星期日)
</p>
<p>
	　　比赛地点：台州市区
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">五、比赛项目</span> 
</p>
<p>
	　　(一)男、女马拉松(42.195公里)
</p>
<p>
	　　(二)男、女半程马拉松(21.0975公里)
</p>
<p>
	　　(三)迷你马拉松(5公里)
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">六、比赛路线</span> 
</p>
<p>
	　　<span style="color:#009900;">全程马拉松：</span>台州市体育中心体育场(起点)→学院路→市府大道→中心大道→广场中路→祥云路→群韵路→祥和路→白云山中路→市府大道→经中路→开发大道→开发大道东段→聚海大道折返→开发大道东段→开发大道→机场北路路→机场路→市府大道→学院路→台州市体育中心体育场(终点)
</p>
<p>
	　　<span style="color:#009900;">半程马拉松：</span>台州市体育中心体育场(起点)→学院路→市府大道→中心大道→广场中路→祥云路→群韵路→祥和路→白云山中路→市府大道→经中路→开发大道折返→机场北路路→机场路→市府大道→学院路→台州市体育中心体育场(终点)
</p>
<p>
	　　<span style="color:#009900;">迷你马拉松：</span>台州市体育中心体育场(起点)→学院路→市府大道→中心大道→广场中路→爱华路→耀达路→市府大道→学院路→台州市体育中心体育场(终点)
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">七、报名办法</span> 
</p>
<p>
	　　<span style="color:#E53333;">(一)年龄要求</span> 
</p>
<p>
	　　1.马拉松项目年龄限20岁以上(1995年1月3日以前出生);
</p>
<p>
	　　2.半程马拉松项目年龄限18岁以上(1997年1月3日以前出生)。
</p>
<p>
	　　<span style="color:#E53333;">(二)健康要求</span> 
</p>
<p>
	　　参赛者应身体健康，经常参加跑步锻炼或训练。参赛者可根据自己的身体状况和能力，选择参赛项目。以下疾病患者不宜参加比赛：
</p>
<p>
	　　1、先天性心脏病和风湿性心脏病患者;
</p>
<p>
	　　2、高血压和脑血管疾病患者;
</p>
<p>
	　　3、心肌炎和其它心脏病患者;
</p>
<p>
	　　4、冠状动脉病患者和严重心律不齐者;
</p>
<p>
	　　5、血糖过高或过低的糖尿病患者;
</p>
<p>
	　　6、其他不适合运动的疾病患者。
</p>
<p>
	　　<span style="color:#E53333;">(三)报名办法(另定)</span> 
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">八、比赛规模</span> 
</p>
<p>
	　　赛事规模设计为10000人，其中全程和半程马拉松运动员3000人;迷你马拉松7000人，报名人数报满为止。
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">九、出发时间及顺序</span> 
</p>
<p>
	　　比赛采用1枪发令。8:00准时出发，顺序按照全程马拉松、半程马拉松、迷你马拉松依次排列进行。
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">十、竞赛办法</span> 
</p>
<p>
	　　(一)采用国际田联最新竞赛规则和本届马拉松竞赛规程。
</p>
<p>
	　　(二)相关距离的关门时间：(具体时间以发令时间为准)
</p>
<p>
	<br />
</p>
<p>
	<br />
</p>
<div align="center">
	<table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style="border:outset 1.0pt;">
		<tbody>
			<tr>
				<td width="138" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<b><span style="font-size:14.0pt;font-family:宋体-PUA;">距离<span></span></span></b> 
					</p>
				</td>
				<td width="147" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<b><span style="font-size:14.0pt;font-family:宋体-PUA;">关门时间<span></span></span></b> 
					</p>
				</td>
				<td width="182" valign="top" style="border:inset 1.0pt;">
					<p class="MsoNormal" style="text-indent:41.3pt;">
						<b><span style="font-size:14.0pt;font-family:宋体-PUA;">具体时间<span></span></span></b> 
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">5</span><span style="font-size:14.0pt;font-family:宋体-PUA;">公里<span></span></span> 
					</p>
				</td>
				<td width="147" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">1</span><span style="font-size:14.0pt;font-family:宋体-PUA;">小时<span></span></span> 
					</p>
				</td>
				<td width="182" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">9:00</span><span style="font-size:14.0pt;font-family:宋体-PUA;"></span> 
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">7</span><span style="font-size:14.0pt;font-family:宋体-PUA;">公里<span></span></span> 
					</p>
				</td>
				<td width="147" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">1</span><span style="font-size:14.0pt;font-family:宋体-PUA;">小时</span><span style="font-size:14.0pt;font-family:宋体;">15</span><span style="font-size:14.0pt;font-family:宋体-PUA;">分钟<span></span></span> 
					</p>
				</td>
				<td width="182" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">9:15</span><span style="font-size:14.0pt;font-family:宋体-PUA;"></span> 
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">10</span><span style="font-size:14.0pt;font-family:宋体-PUA;">公里<span></span></span> 
					</p>
				</td>
				<td width="147" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">1</span><span style="font-size:14.0pt;font-family:宋体-PUA;">小时</span><span style="font-size:14.0pt;font-family:宋体;">30</span><span style="font-size:14.0pt;font-family:宋体-PUA;">分<span></span></span> 
					</p>
				</td>
				<td width="182" style="border:inset 1.0pt;">
					<p class="MsoNormal" style="text-indent:49.0pt;">
						<span style="font-size:14.0pt;font-family:宋体;">9:30</span><span style="font-size:14.0pt;font-family:宋体-PUA;"></span> 
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">12</span><span style="font-size:14.0pt;font-family:宋体-PUA;">公里<span></span></span> 
					</p>
				</td>
				<td width="147" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">1</span><span style="font-size:14.0pt;font-family:宋体-PUA;">小时</span><span style="font-size:14.0pt;font-family:宋体;">45</span><span style="font-size:14.0pt;font-family:宋体-PUA;">分<span></span></span> 
					</p>
				</td>
				<td width="182" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">9:45</span><span style="font-size:14.0pt;font-family:宋体-PUA;"></span> 
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">21.0975</span><span style="font-size:14.0pt;font-family:宋体-PUA;">公里<span></span></span> 
					</p>
				</td>
				<td width="147" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">3</span><span style="font-size:14.0pt;font-family:宋体-PUA;">小时<span></span></span> 
					</p>
				</td>
				<td width="182" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">11:00</span><span style="font-size:14.0pt;font-family:宋体-PUA;"></span> 
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">30</span><span style="font-size:14.0pt;font-family:宋体-PUA;">公里<span></span></span> 
					</p>
				</td>
				<td width="147" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">4</span><span style="font-size:14.0pt;font-family:宋体-PUA;">小时</span><span style="font-size:14.0pt;font-family:宋体;">10</span><span style="font-size:14.0pt;font-family:宋体-PUA;">分<span></span></span> 
					</p>
				</td>
				<td width="182" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">12:10</span><span style="font-size:14.0pt;font-family:宋体-PUA;"></span> 
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">35</span><span style="font-size:14.0pt;font-family:宋体-PUA;">公里<span></span></span> 
					</p>
				</td>
				<td width="147" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">5</span><span style="font-size:14.0pt;font-family:宋体-PUA;">小时<span></span></span> 
					</p>
				</td>
				<td width="182" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">13:00</span><span style="font-size:14.0pt;font-family:宋体-PUA;"></span> 
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">42.195</span><span style="font-size:14.0pt;font-family:宋体-PUA;">公里<span></span></span> 
					</p>
				</td>
				<td width="147" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">6</span><span style="font-size:14.0pt;font-family:宋体-PUA;">小时<span></span></span> 
					</p>
				</td>
				<td width="182" style="border:inset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14.0pt;font-family:宋体;">14:00</span><span style="font-size:14.0pt;font-family:宋体-PUA;"></span> 
					</p>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<p>
	<br />
</p>
<p>
	<br />
</p>
<p>
	　　<span style="color:#FFE500;background-color:#E53333;">特别提示：</span>比赛当天封路起至各公里点关门前，比赛线路为公路赛道，出于对参赛者的安全负责，各公里点关门后，比赛线路(即公路)解除交通管制，参赛者须退出比赛，就近疏散或上援助车。如不听劝阻继续跑步者，安全责任自负。发生特殊情况时，组委会可决定提前关门，参赛者须服从指挥。
</p>
<p>
	<br />
</p>
<p>
	　　(三)马拉松比赛采用感应器计时系统服务，组委会提供一次性计时芯片，参赛者须佩带芯片;在起终点及每5公里点都设有计时感应地毯，参赛者行进中必须逐一通过地面的计时感应地毯，如参赛者缺少任何一个计时点的成绩，则取消该参赛者的比赛成绩。除起终点外，选手间在其他计时点曾出现两次(含两次)以上的成绩误差少于0.1秒，也将取消比赛成绩。详情请参阅《运动员参赛指南》。
</p>
<p>
	<br />
</p>
<p>
	　　(四)马拉松参赛者，完成比赛后凭两块齐全的号码布到赛后服务区领取本人的寄存衣物。赛后服务区工作到当日16:00，其余未领取的改为第二天到市体育中心组委会办理。本届比赛现场不发放成绩证书，请在关门时间内跑完马拉松的选手赛后登陆台州马拉松官方网站，进行成绩查询并自行打印成绩证书。
</p>
<p>
	<br />
</p>
<p>
	　　(五)半程马拉松参赛者，完成比赛后凭号码布到终点衣物寄存点领取衣物，终点衣物寄存点工作到当日13：00，其余未领取的改为第二天到市体育中心组委会办理。详情请参阅《运动员参赛指南》联系电话：
</p>
<p>
	<br />
</p>
<p>
	　　半程马拉松比赛的运动员赛后请凭号码布到半程马拉松终点原寄存车领取。半程终点衣物寄存点工作到当日13:00。
</p>
<p>
	<br />
</p>
<p>
	　　(八)有关竞赛的具体要求和安排，请详细阅读各项目《运动员参赛指南》。
</p>
<p>
	<br />
</p>
<p>
	　　(九)组委会将对参赛者进行兴奋剂抽查。
</p>
<p>
	<br />
</p>
<p>
	　　(十)组委会将对起点、终点及每5公里计时点进行录像监控，出现以下违反比赛规定的参赛者将被取消参赛成绩。
</p>
<p>
	<br />
</p>
<p>
	　　1、虚假年龄报名或报名后由他人替跑的;
</p>
<p>
	　　2、运动员携带他人计时芯片或一名运动员同时携带2枚或2枚以上计时芯片参加比赛的;
</p>
<p>
	　　3、不按规定的起跑顺序在非本人报名项目区检录起跑的;
</p>
<p>
	　　4、起跑活动中出发抢跑的;
</p>
<p>
	　　5、关门时间后不停止比赛或退出比赛后又插入赛道的;
</p>
<p>
	　　6、采用多人接力等作弊方式完成比赛的;
</p>
<p>
	　　7、没有沿规定线路跑完所报项目的全程，抄近道或乘交通工具途中插入的;
</p>
<p>
	　　8、马拉松项目运动员没有按规定分道及未携带自己的两块号码布通过终点的;
</p>
<p>
	　　9、马拉松项目运动员未跑完全程，违规通过终点领取纪念品的或重复通过终点领取纪念品的;
</p>
<p>
	　　10、不服从赛事工作人员的指挥，干扰赛事，聚众闹事的。
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">十一、收费标准</span> 
</p>
<p>
	　<strong>　(一)全程马拉松收费标准</strong> 
</p>
<p>
	　　(1)参赛者：每人80元人民币。
</p>
<p>
	<br />
</p>
<p>
	　　<strong>(二)半程马拉松收费标准</strong> 
</p>
<p>
	　　(1)参赛者：每人40元人民币。
</p>
<p>
	<br />
</p>
<p>
	　<strong>　(三)迷你马拉松收费标准</strong> 
</p>
<p>
	　　每人20元人民币。
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">十二、奖励办法(单位：人民币)</span> 
</p>
<p>
	<span style="font-size:18px;"><br />
</span> 
</p>
<p>
	　　(一)男、女全程马拉松奖金
</p>
<p>
	<br />
</p>
<p>
	<table class="MsoNormalTable" border="1" cellpadding="0" style="background:white;border:solid windowtext 1.0pt;">
		<tbody>
			<tr>
				<td width="60" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">名次<span></span></span> 
					</p>
				</td>
				<td width="61" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">一<span></span></span> 
					</p>
				</td>
				<td width="61" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">二<span></span></span> 
					</p>
				</td>
				<td width="61" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">三<span></span></span> 
					</p>
				</td>
				<td width="61" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">四<span></span></span> 
					</p>
				</td>
				<td width="61" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">五<span></span></span> 
					</p>
				</td>
				<td width="61" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">六<span></span></span> 
					</p>
				</td>
				<td width="61" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">七<span></span></span> 
					</p>
				</td>
				<td width="61" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">八至<span></span></span> 
					</p>
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">十二<span></span></span> 
					</p>
				</td>
				<td width="52" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">十三<span></span></span> 
					</p>
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">至二十<span></span></span> 
					</p>
				</td>
			</tr>
			<tr>
				<td width="60" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">奖金<span></span></span> 
					</p>
				</td>
				<td width="61" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">50000</span> 
					</p>
				</td>
				<td width="61" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">30000</span> 
					</p>
				</td>
				<td width="61" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">10000</span> 
					</p>
				</td>
				<td width="61" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">8000</span> 
					</p>
				</td>
				<td width="61" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">6000</span> 
					</p>
				</td>
				<td width="61" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">5000</span> 
					</p>
				</td>
				<td width="61" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">3000</span> 
					</p>
				</td>
				<td width="61" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">1000</span> 
					</p>
				</td>
				<td width="52" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">500</span> 
					</p>
				</td>
			</tr>
		</tbody>
	</table>
</p>
<p>
	<br />
</p>
<p>
	<br />
</p>
<p>
	　　(二)男、女半程马拉松奖金
</p>
<p>
	<br />
</p>
<p>
	<table class="MsoNormalTable" border="1" cellpadding="0" style="background:white;border:solid windowtext 1.0pt;">
		<tbody>
			<tr>
				<td width="59" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">名次<span></span></span> 
					</p>
				</td>
				<td width="61" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">一<span></span></span> 
					</p>
				</td>
				<td width="60" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">二<span></span></span> 
					</p>
				</td>
				<td width="61" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">三<span></span></span> 
					</p>
				</td>
				<td width="60" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">四<span></span></span> 
					</p>
				</td>
				<td width="61" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">五<span></span></span> 
					</p>
				</td>
				<td width="60" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">六<span></span></span> 
					</p>
				</td>
				<td width="61" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">七<span></span></span> 
					</p>
				</td>
				<td width="60" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">八至<span></span></span> 
					</p>
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">十二<span></span></span> 
					</p>
				</td>
				<td width="60" style="border:outset 1.0pt;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">十三<span></span></span> 
					</p>
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">至二十<span></span></span> 
					</p>
				</td>
			</tr>
			<tr>
				<td width="59" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">奖金<span></span></span> 
					</p>
				</td>
				<td width="61" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">10000</span> 
					</p>
				</td>
				<td width="60" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">6000</span> 
					</p>
				</td>
				<td width="61" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">4000</span> 
					</p>
				</td>
				<td width="60" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">2000</span> 
					</p>
				</td>
				<td width="61" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">1000</span> 
					</p>
				</td>
				<td width="60" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">800</span> 
					</p>
				</td>
				<td width="61" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">600</span> 
					</p>
				</td>
				<td width="60" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">400</span> 
					</p>
				</td>
				<td width="60" style="border:none;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:16.0pt;font-family:仿宋_GB2312;">200</span> 
					</p>
				</td>
			</tr>
		</tbody>
	</table>
</p>
<p>
	<br />
</p>
<p>
	<br />
</p>
<p>
	　　<span style="color:#FFE500;background-color:#E53333;">注:</span>(1)所有获奖运动员的成绩在赛事官方网站公示10日后，并确认无兴奋剂问题后再行发放奖金。
</p>
<p>
	　　(2)上述奖金将按照中国税法规定，征收20%的个人所得税。
</p>
<p>
	　　(3)在规定时间内跑完全程者颁发补给包及完赛奖牌。
</p>
<p>
	　　(4)凡参加比赛者赛前均发纪念衫、号码布和盛衣包。
</p>
<p>
	　　(5)发放参赛纪念证书，参赛者可登录官网下载打印成绩。
</p>
<p>
	　　(6)领奖有效期为正式公布获奖名单后30天内，超期未办理者按弃奖处理。
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">十三、医疗救护</span> 
</p>
<p>
	　　(一)组委会沿马拉松赛道路线每2.5公里设立一个固定医疗点，医疗点前50米有明显的标志。参赛选手遇有身体不适等紧急情况，可就近治疗。
</p>
<p>
	　　(二)组委会将沿赛道布置医疗救护车，及时处理紧急医疗情况。
</p>
<p>
	　　(三)赛道沿线，组委会将在每100米处设置一名志愿者，协助医疗救护、维护比赛秩序，参赛选手可以随时向他们请求帮助。
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">十四、台州马拉松组委会联系方式</span> 
</p>
<p>
	<p>
		　　地址：台州市体育中心东门马拉松组委会办公室
	</p>
	<p>
		　　邮政编码：318000
	</p>
	<p>
		　　办公室电话：0576-89811730592-(上班时间内拨打即上午8：00-12:00下午14:30-17:30) 92-5121241
	</p>
	<p>
		　　台州马拉松赛官方网址：http://mls.ddl666.com
	</p>
	<p>
		　　官方邮箱：3273609935@qq.com
	</p>
</p>
<p>
	<br />
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:18px;">十五、未尽事项，另行通知。</span> 
</p>
<p>
	<br />
</p>
<p>
	<strong>本规程以此次发布为准，解释权属于2015台州马拉松赛组委会。</strong> 
</p>','1','台州体育局,马拉松,台州马拉松,竞赛规程','2015年台州体育局举办台州马拉松活动官方网站，介绍竞赛规程内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('23','dsys','20','报名指南','<p>
	　　(一)年龄要求
</p>
<p>
	<br />
</p>
<p>
	　　1.马拉松项目年龄限20岁以上(1995年1月3日以前出生);
</p>
<p>
	　　2.半程马拉松项目年龄限18岁以上(1997年1月3日以前出生)。
</p>
<p>
	<br />
</p>
<p>
	　　(二)健康要求
</p>
<p>
	<br />
</p>
<p>
	　　参赛者应身体健康，经常参加跑步锻炼或训练。参赛者可根据自己的身体状况和能力，选择参赛项目。以下疾病患者不宜参加比赛：
</p>
<p>
	　　1、先天性心脏病和风湿性心脏病患者;
</p>
<p>
	　　2、高血压和脑血管疾病患者;
</p>
<p>
	　　3、心肌炎和其它心脏病患者;
</p>
<p>
	　　4、冠状动脉病患者和严重心律不齐者;
</p>
<p>
	　　5、血糖过高或过低的糖尿病患者;
</p>
<p>
	　　6、其他不适合运动的疾病患者。
</p>
<p>
	<br />
</p>
<p>
	　　(三)报名办法(另定)
</p>
<p>
	<br />
</p>
<p>
	　　1、下载台州马拉松APP
</p>
<p>
	　　2、进入微信官方服务号
</p>
<p>
	　　3、网站上直接报名
</p>','1','台州体育局,马拉松,台州马拉松,报名指南','2015年台州体育局举办台州马拉松活动官方网站，介绍报名指南内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('24','qywh','20','竞赛办法','<p>
	　　(一)采用国际田联最新竞赛规则和本届马拉松竞赛规程。
</p>
<p>
	<br />
</p>
<p>
	　　(二)相关距离的关门时间：(具体时间以发令时间为准)
</p>
<p>
	<br />
</p>
<p>
	<br />
</p>
<div align="center">
	<table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style="border:1pt outset;">
		<tbody>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<b><span style="font-size:14pt;font-family:宋体-PUA;">距离</span></b>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<b><span style="font-size:14pt;font-family:宋体-PUA;">关门时间</span></b>
					</p>
				</td>
				<td width="182" valign="top" style="border:1pt inset;">
					<p class="MsoNormal" style="text-indent:41.3pt;">
						<b><span style="font-size:14pt;font-family:宋体-PUA;">具体时间</span></b>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">5</span><span style="font-size:14pt;font-family:宋体-PUA;">公里</span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">1</span><span style="font-size:14pt;font-family:宋体-PUA;">小时</span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">9:00</span><span style="font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">7</span><span style="font-size:14pt;font-family:宋体-PUA;">公里</span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">1</span><span style="font-size:14pt;font-family:宋体-PUA;">小时</span><span style="font-size:14pt;font-family:宋体;">15</span><span style="font-size:14pt;font-family:宋体-PUA;">分钟</span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">9:15</span><span style="font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">10</span><span style="font-size:14pt;font-family:宋体-PUA;">公里</span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">1</span><span style="font-size:14pt;font-family:宋体-PUA;">小时</span><span style="font-size:14pt;font-family:宋体;">30</span><span style="font-size:14pt;font-family:宋体-PUA;">分</span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;">
					<p class="MsoNormal" style="text-indent:49pt;">
						<span style="font-size:14pt;font-family:宋体;">9:30</span><span style="font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">12</span><span style="font-size:14pt;font-family:宋体-PUA;">公里</span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">1</span><span style="font-size:14pt;font-family:宋体-PUA;">小时</span><span style="font-size:14pt;font-family:宋体;">45</span><span style="font-size:14pt;font-family:宋体-PUA;">分</span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">9:45</span><span style="font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">21.0975</span><span style="font-size:14pt;font-family:宋体-PUA;">公里</span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">3</span><span style="font-size:14pt;font-family:宋体-PUA;">小时</span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">11:00</span><span style="font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">30</span><span style="font-size:14pt;font-family:宋体-PUA;">公里</span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">4</span><span style="font-size:14pt;font-family:宋体-PUA;">小时</span><span style="font-size:14pt;font-family:宋体;">10</span><span style="font-size:14pt;font-family:宋体-PUA;">分</span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">12:10</span><span style="font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">35</span><span style="font-size:14pt;font-family:宋体-PUA;">公里</span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">5</span><span style="font-size:14pt;font-family:宋体-PUA;">小时</span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">13:00</span><span style="font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="138" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">42.195</span><span style="font-size:14pt;font-family:宋体-PUA;">公里</span>
					</p>
				</td>
				<td width="147" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">6</span><span style="font-size:14pt;font-family:宋体-PUA;">小时</span>
					</p>
				</td>
				<td width="182" style="border:1pt inset;">
					<p class="MsoNormal" align="center" style="text-align:center;">
						<span style="font-size:14pt;font-family:宋体;">14:00</span><span style="font-size:14pt;font-family:宋体-PUA;"></span>
					</p>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<p>
	<br />
</p>
<p>
	<br />
</p>
<p>
	　　<span style="color:#FFE500;background-color:#E53333;">特别提示：</span>比赛当天封路起至各公里点关门前，比赛线路为公路赛道，出于对参赛者的安全负责，各公里点关门后，比赛线路(即公路)解除交通管制，参赛者须退出比赛，就近疏散或上援助车。如不听劝阻继续跑步者，安全责任自负。发生特殊情况时，组委会可决定提前关门，参赛者须服从指挥。
</p>
<p>
	<br />
</p>
<p>
	　　(三)马拉松比赛采用感应器计时系统服务，组委会提供一次性计时芯片，参赛者须佩带芯片;在起终点及每5公里点都设有计时感应地毯，参赛者行进中必须逐一通过地面的计时感应地毯，如参赛者缺少任何一个计时点的成绩，则取消该参赛者的比赛成绩。除起终点外，选手间在其他计时点曾出现两次(含两次)以上的成绩误差少于0.1秒，也将取消比赛成绩。详情请参阅《运动员参赛指南》。
</p>
<p>
	<br />
</p>
<p>
	　　(四)马拉松参赛者，完成比赛后凭两块齐全的号码布到赛后服务区领取本人的寄存衣物。赛后服务区工作到当日16:00，其余未领取的改为第二天到市体育中心组委会办理。本届比赛现场不发放成绩证书，请在关门时间内跑完马拉松的选手赛后登陆台州马拉松官方网站，进行成绩查询并自行打印成绩证书。
</p>
<p>
	<br />
</p>
<p>
	　　(五)半程马拉松参赛者，完成比赛后凭号码布到终点衣物寄存点领取衣物，终点衣物寄存点工作到当日13：00，其余未领取的改为第二天到市体育中心组委会办理。详情请参阅《运动员参赛指南》联系电话：
</p>
<p>
	<br />
</p>
<p>
	　　半程马拉松比赛的运动员赛后请凭号码布到半程马拉松终点原寄存车领取。半程终点衣物寄存点工作到当日13:00。
</p>
<p>
	<br />
</p>
<p>
	　　(八)有关竞赛的具体要求和安排，请详细阅读各项目《运动员参赛指南》。
</p>
<p>
	<br />
</p>
<p>
	　　(九)组委会将对参赛者进行兴奋剂抽查。
</p>
<p>
	<br />
</p>
<p>
	　　(十)组委会将对起点、终点及每5公里计时点进行录像监控，出现以下违反比赛规定的参赛者将被取消参赛成绩。
</p>
<p>
	<br />
</p>
<p>
	　　1、虚假年龄报名或报名后由他人替跑的;
</p>
<p>
	　　2、运动员携带他人计时芯片或一名运动员同时携带2枚或2枚以上计时芯片参加比赛的;
</p>
<p>
	　　3、不按规定的起跑顺序在非本人报名项目区检录起跑的;
</p>
<p>
	　　4、起跑活动中出发抢跑的;
</p>
<p>
	　　5、关门时间后不停止比赛或退出比赛后又插入赛道的;
</p>
<p>
	　　6、采用多人接力等作弊方式完成比赛的;
</p>
<p>
	　　7、没有沿规定线路跑完所报项目的全程，抄近道或乘交通工具途中插入的;
</p>
<p>
	　　8、马拉松项目运动员没有按规定分道及未携带自己的两块号码布通过终点的;
</p>
<p>
	　　9、马拉松项目运动员未跑完全程，违规通过终点领取纪念品的或重复通过终点领取纪念品的;
</p>
<p>
	　　10、不服从赛事工作人员的指挥，干扰赛事，聚众闹事的。
</p>
<div>
	<br />
</div>','1','台州体育局,马拉松,台州马拉松,竞赛办法','2015年台州体育局举办台州马拉松活动官方网站，介绍竞赛办法内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('25','gsryt','20','奖励办法','<p>
	　(一)男、女全程马拉松奖金
</p>
<p>
	<br />
</p>
<table class="MsoNormalTable" border="1" cellpadding="0" style="border:1pt solid windowtext;background:white;">
	<tbody>
		<tr>
			<td width="60" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">名次</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">一</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">二</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">三</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">四</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">五</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">六</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">七</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">八至</span>
				</p>
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">十二</span>
				</p>
			</td>
			<td width="52" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">十三</span>
				</p>
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">至二十</span>
				</p>
			</td>
		</tr>
		<tr>
			<td width="60" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">奖金</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">50000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">30000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">10000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">8000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">6000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">5000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">3000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">1000</span>
				</p>
			</td>
			<td width="52" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">500</span>
				</p>
			</td>
		</tr>
	</tbody>
</table>
<p>
	<br />
</p>
<p>
	<br />
</p>
<p>
	　　(二)男、女半程马拉松奖金
</p>
<p>
	<br />
</p>
<table class="MsoNormalTable" border="1" cellpadding="0" style="border:1pt solid windowtext;background:white;">
	<tbody>
		<tr>
			<td width="59" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">名次</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">一</span>
				</p>
			</td>
			<td width="60" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">二</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">三</span>
				</p>
			</td>
			<td width="60" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">四</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">五</span>
				</p>
			</td>
			<td width="60" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">六</span>
				</p>
			</td>
			<td width="61" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">七</span>
				</p>
			</td>
			<td width="60" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">八至</span>
				</p>
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">十二</span>
				</p>
			</td>
			<td width="60" style="border:1pt outset;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">十三</span>
				</p>
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">至二十</span>
				</p>
			</td>
		</tr>
		<tr>
			<td width="59" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">奖金</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">10000</span>
				</p>
			</td>
			<td width="60" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">6000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">4000</span>
				</p>
			</td>
			<td width="60" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">2000</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">1000</span>
				</p>
			</td>
			<td width="60" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">800</span>
				</p>
			</td>
			<td width="61" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">600</span>
				</p>
			</td>
			<td width="60" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">400</span>
				</p>
			</td>
			<td width="60" style="border:none;">
				<p class="MsoNormal" align="center" style="text-align:center;">
					<span style="font-size:16pt;font-family:仿宋_GB2312;">200</span>
				</p>
			</td>
		</tr>
	</tbody>
</table>
<p>
	<br />
</p>
<p>
	<br />
</p>
<p>
	　　<span style="color:#FFE500;background-color:#E53333;">注:</span>(1)所有获奖运动员的成绩在赛事官方网站公示10日后，并确认无兴奋剂问题后再行发放奖金。
</p>
<p>
	　　(2)上述奖金将按照中国税法规定，征收20%的个人所得税。
</p>
<p>
	　　(3)在规定时间内跑完全程者颁发补给包及完赛奖牌。
</p>
<p>
	　　(4)凡参加比赛者赛前均发纪念衫、号码布和盛衣包。
</p>
<p>
	　　(5)发放参赛纪念证书，参赛者可登录官网下载打印成绩。
</p>
<p>
	　　(6)领奖有效期为正式公布获奖名单后30天内，超期未办理者按弃奖处理。
</p>','1','台州体育局,马拉松,台州马拉松,奖励办法','2015年台州体育局举办台州马拉松活动官方网站，介绍奖励办法内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('26','zzjig','20','比赛线路','<p>
	　　<strong>全程马拉松：</strong>
</p>
<p>
	<br />
</p>
<p>
	台州市体育中心体育场(起点)→学院路→市府大道→中心大道→广场中路→祥云路→群韵路→祥和路→白云山中路→市府大道→经中路→开发大道→开发大道东段→聚海大道折返→开发大道东段→开发大道→机场北路路→机场路→市府大道→学院路→台州市体育中心体育场(终点)
</p>
<p>
	<br />
</p>
<p>
	<strong>　　半程马拉松：</strong>
</p>
<p>
	<br />
</p>
<p>
	台州市体育中心体育场(起点)→学院路→市府大道→中心大道→广场中路→祥云路→群韵路→祥和路→白云山中路→市府大道→经中路→开发大道折返→机场北路路→机场路→市府大道→学院路→台州市体育中心体育场(终点)
</p>
<p>
	<br />
</p>
<p>
	<strong>　　迷你马拉松：</strong>
</p>
<p>
	<br />
</p>
<p>
	台州市体育中心体育场(起点)→学院路→市府大道→中心大道→广场中路→爱华路→耀达路→市府大道→学院路→台州市体育中心体育场(终点)
</p>
<p>
	<br />
</p>
<p>
	<img src="/Uploads/image/page/20150903/20150903100311_93161.jpg" alt="" /> 
</p>
<p>
	<img src="/Uploads/image/page/20150903/20150903100322_77519.jpg" alt="" /> 
</p>','1','台州体育局,马拉松,台州马拉松,比赛线路','2015年台州体育局举办台州马拉松活动官方网站，介绍比赛线路内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('27','dszjg','20','历届赛事','2015 中国•台州首届马拉松邀请赛竞赛规程 为 第一届','1','台州体育局,马拉松,台州马拉松,历届赛事','2015年台州体育局举办台州马拉松活动官方网站，介绍历届赛事内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('28','qyyjd','20','常见问题','&nbsp; &nbsp;1.运动员“极点”现象。指在比赛中出现胸闷、气喘、呼吸困难、肌肉酸痛、速度减慢等现象。当出现“极点”现象时，应适当降低跑速、多做几次深呼吸后，就能恢复正常，继续参加比赛。而未经过系统训练的运动员或经过上述处理无法恢复正常的运动员应退出比赛。<br />
<br />
&nbsp; &nbsp; 2.腹痛。马拉松比赛前期间，一旦出现腹痛现象，可适当减速，调整呼吸，按压腹部，如疼痛有所缓减，运动员可继续参赛；如有所加重应停止运动。<br />
<br />
&nbsp; &nbsp; 3.小腿抽筋。出现小腿抽筋时应立即停止运动，伸直膝关节，勾足尖，并按摩小腿肌肉。按摩的方法是：用拇指捏揉小腿肚中央，便可使抽筋部位得到缓解。<br />
<br />
&nbsp; &nbsp; 4.低血糖。发生运动性低血糖时，饮浓糖水并吃甜食一般可恢复正常。如果症状严重，应立即停止比赛，接受治疗。<br />
<br />
&nbsp; &nbsp; 5.热应激。马拉松比赛或训练时必须要补充水分，运动中补液要采取少量多次的办法，每隔15分钟-20分钟可补液150ml-250ml。一般情况下，每小时的补液总量不超过800买了，应补充运动饮料。如果出现面色潮红、多汗、脉搏加快等表现，应停止运动，向就近的医疗志愿者或医疗点寻求帮助。<br />
<br />
&nbsp; &nbsp; 6.虚脱状态。比赛中如果出现眼前阵发性发黑，严重憋气，有窒息感，周身出冷汗呈虚脱状态，应立即停止比赛。<br />
<br />
&nbsp; &nbsp; 7.肌肉拉伤、裸关节扭伤。应退出比赛，到就近的医疗站（点）接受治疗。兰州晚报记者罗嫣整理<br />','1','台州体育局,马拉松,台州马拉松,常见问题','2015年台州体育局举办台州马拉松活动官方网站，介绍常见问题内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('29','lnzhg','20','医疗救护','<p>
	　　(一)组委会沿马拉松赛道路线每2.5公里设立一个固定医疗点，医疗点前50米有明显的标志。参赛选手遇有身体不适等紧急情况，可就近治疗。
</p>
<p>
	　　(二)组委会将沿赛道布置医疗救护车，及时处理紧急医疗情况。
</p>
<p>
	　　(三)赛道沿线，组委会将在每100米处设置一名志愿者，协助医疗救护、维护比赛秩序，参赛选手可以随时向他们请求帮助。
</p>','1','台州体育局,马拉松,台州马拉松,医疗救护','2015年台州体育局举办台州马拉松活动官方网站，介绍医疗救护内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('30','fsdfg','20','收费标准','<p>
	(一)全程马拉松收费标准
</p>
<p>
	　　(1)参赛者：每人80元人民币。
</p>
<p>
	<br />
</p>
<p>
	(二)半程马拉松收费标准
</p>
<p>
	　　(1)参赛者：每人40元人民币。
</p>
<p>
	<br />
</p>
<p>
	(三)迷你马拉松收费标准
</p>
<p>
	　　每人20元人民币。
</p>','1','台州体育局,马拉松,台州马拉松,收费标准','2015年台州体育局举办台州马拉松活动官方网站，介绍收费标准内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('31','dsship','20','台州马拉松','<p>
	　　8月25日上午，2015中国·台州首届马拉松邀请赛新闻发布会在椒江召开，台州市人民政府副秘书长、本届马拉松邀请赛组委会委员茅国春介绍2015中国·台州首届马拉松邀请赛的赛事筹备情况，台州市体育局局长、本届马拉松邀请赛组委会委员、办公室主任卢颖才回答了社会各界比较关心的有关问题。
</p>
<p>
	　　2015年中国·台州首届马拉松邀请赛将于11月15日在台州市区鸣枪开跑。这是继今年七月份举办的美国著名球星“NBA”麦迪告别赛、10月份即将举办的台州市第四届运动会之后的又一次最有影响力、参赛人数最多、规模最高，而且最具有社会意义的一次体育盛事。
</p>
<p>
	　　2015年中国·台州首届马拉松邀请赛的举办得到市委、市政府领导的高度重视，市主要领导多次听取筹备工作汇报情况汇报并作重要指示，市委常委会、市长办公会议分别进行专题研究。举办2015中国·台州首届马拉松邀请赛是为了更好地贯彻落实党的“十八”大精神，加快推进市委、市政府确定的“一都三城”战略目标的实现，激发台州人民的热情，聚凝人心，共同建设台州“山海美城”，推动体育事业与城市建设社会事业的共同进步与发展。
</p>
<p>
	　　2015年中国·台州首届马拉松邀请赛是台州历史空前的一项赛事。届时将会有来自全国各地的10000多名运动员参加,其中3000人参加全程和半程马拉松赛，7000人参加迷你马拉松等赛项，合计裁判人员、工作人员和广大志愿工作者总人数达15000人。
</p>
<p>
	　　为了更好地推动全民健身活动的需要，使广大市民能够在自己的家门口就能亲身感受和体验群众性体育活动的深厚魅力，组委会根据专家的意见，确定本次马拉松比赛的线路：从市体育中心出发，沿着市区主要干道至台州湾集聚区一线，途径台州市区主要的标志性建筑及新区建设区域，体现“绿色马拉松、美丽新台州”的活动主题。
</p>
<p>
	　　为了充分吸引海内外和广大市民的踊跃积极参与，本次马拉松比赛设置了男、女全程马拉松和男、女半程马拉松、男、女迷你马拉松等赛项组别，每项设20个奖项，最高奖额为5万元。
</p>
<p>
	　　2015中国·台州马拉松邀请赛由台州市人民政府主办，台州市体育局、台州市体育总会、椒江区人民政府承办。
</p>
<p>
	　　目前距离市首届马拉松邀请赛举办已指日可待，各项筹备工作都已进入倒计时。台马赛LOGO和主题口号已向全社会公开征集，筹委会办公室已全面启动，其它相关工作都在顺利进行中。我们期待着2015中国·台州首届马拉松邀请赛取得圆满成功，也期待着社会各界朋友们对本次活动的大力支持和积极参与。
</p>','1','台州体育局,马拉松,台州马拉松,台州马拉松','2015年台州体育局举办台州马拉松活动官方网站，介绍台州马拉松内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('32','rlzy','0','合作伙伴','<img src="/Uploads/image/page/20150903/20150903103613_52275.png" alt="" />','1','台州体育局,马拉松,台州马拉松,合作伙伴','2015年台州体育局举办台州马拉松活动官方网站，介绍合作伙伴内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('33','rczpp','32','冠名赞助商','<img src="/Uploads/image/page/20150903/20150903103613_52275.png" alt="" />','1','台州体育局,马拉松,台州马拉松,冠名赞助商','2015年台州体育局举办台州马拉松活动官方网站，介绍冠名赞助商内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('34','yggh','32','钻石赞助商','<img src="/Uploads/image/page/20150903/20150903103613_52275.png" alt="" />','1','台州体育局,马拉松,台州马拉松,钻石赞助商','2015年台州体育局举办台州马拉松活动官方网站，介绍钻石赞助商内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('35','rczl','32','白金赞助商','<img src="/Uploads/image/page/20150903/20150903103613_52275.png" alt="" />','1','台州体育局,马拉松,台州马拉松,白金赞助商','2015年台州体育局举办台州马拉松活动官方网站，介绍白金赞助商内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('36','jltd','32','官方供应商','<img src="/Uploads/image/page/20150903/20150903103613_52275.png" alt="" />','1','台州体育局,马拉松,台州马拉松,官方供应商','2015年台州体育局举办台州马拉松活动官方网站，介绍官方供应商内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('37','fwzx','32','赛事支持企业','<img src="/Uploads/image/page/20150903/20150903103613_52275.png" alt="" />','1','台州体育局,马拉松,台州马拉松,赛事支持企业','2015年台州体育局举办台州马拉松活动官方网站，介绍赛事支持企业内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('38','qqyxwl','32','官方合作媒体','<img src="/Uploads/image/page/20150903/20150903103317_71051.png" alt="" />','1','台州体育局,马拉松,台州马拉松,官方合作媒体','2015年台州体育局举办台州马拉松活动官方网站，介绍官方合作媒体内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('39','gnxswl','0','关于活动','<p style="vertical-align:baseline;color:#404040;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:14.4767999649048px;">
	　　为了更好地推动全民健身活动的需要，使广大市民能够在自己的家门口就能亲身感受和体验群众性体育活动的深厚魅力，组委会根据专家的意见，确定本次马拉松比赛的线路：从市体育中心出发，沿着市区主要干道至台州湾集聚区一线，途径台州市区主要的标志性建筑及新区建设区域，体现“绿色马拉松、美丽新台州”的活动主题。
</p>
<p style="vertical-align:baseline;color:#404040;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:14.4767999649048px;">
	　　为了充分吸引海内外和广大市民的踊跃积极参与，本次马拉松比赛设置了男、女全程马拉松和男、女半程马拉松、男、女迷你马拉松等赛项组别，每项设20个奖项，最高奖额为5万元。
</p>
<p style="vertical-align:baseline;color:#404040;font-family:微软雅黑, 黑体, 宋体, 'Nanum Gothic', NanumGothicWeb, Dotum, Gulim, sans-serif;font-size:14.4767999649048px;">
	　　2015中国·台州马拉松邀请赛由台州市人民政府主办，台州市体育局、台州市体育总会、椒江区人民政府承办。
</p>','1','台州体育局,马拉松,台州马拉松,关于活动','2015年台州体育局举办台州马拉松活动官方网站，介绍关于活动内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('40','qyvixx','39','关于我们','<p>
	　　台州体育局
</p>
<p>
	　　(一)研究制定台州体育工作的政策法规和发展规划并监督实施。
</p>
<p>
	　　(二)指导和推动<span>台州</span>体育体制改革，指定体育发展战略，编制体育事业的中长期发展规划;协调区域性体育发展。
</p>
<p>
	　　(三)推行<span>台州</span>全民健身计划，指导并开展群众性体育活动，实施国家体育锻炼标准，开展国民体质监测。
</p>
<p>
	　　(四)统筹规划竞技体育发展，研究和平衡全国性体育竞赛、竞技运动项目设置与重点布局;组织开展反兴奋剂工作。
</p>
<p>
	　　(五)管理<span>台州</span>体育工作，开展国际间和与香港特别行政区及澳门、台湾地区的体育合作与交流;组织参加和举办重大国际体育竞赛。
</p>
<p>
	　　(六)组织<span>台州</span>体育领域重大科技研究的攻关和成果推广。
</p>
<p>
	　　(七)研究拟定<span>台州</span>体育产业政策，发展体育市场;制定<span>台州</span>体育经营活动从业条件和审批程序。
</p>
<p>
	　　(八)负责<span>台州</span>体育社团的资格审查。
</p>
<p>
	　　(九)承办<span>台州体育</span>其他事项。
</p>','1','台州体育局,马拉松,台州马拉松,关于我们','2015年台州体育局举办台州马拉松活动官方网站，介绍关于我们内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('41','shfw','39','联系我们','<p>
	　　地址：台州市体育中心东门马拉松组委会办公室
</p>
<p>
	<br />
</p>
<p>
	　　邮政编码：318000
</p>
<p>
	<br />
</p>
<p>
	　　办公室电话：0576-89811730592-(上班时间内拨打即上午8：00-12:00下午14:30-17:30) 92-5121241
</p>
<p>
	<br />
</p>
<p>
	　　台州马拉松赛官方网址：http://mls.ddl666.com
</p>
<p>
	<br />
</p>
<p>
	　　官方邮箱：3273609935@qq.com
</p>','1','台州体育局,马拉松,台州马拉松,联系我们','2015年台州体育局举办台州马拉松活动官方网站，介绍联系我们内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('42','dszlxz','39','马拉松历史','<p>
	　　马拉松赛是一项长跑比赛项目，其距离为42.195公里(也有说法为42.193公里，但比赛都是用42.195公里)。这个比赛项目的起源要从公元前490年9月12日发生的一场战役讲起。
</p>
<p>
	　　这场战役是波斯人和雅典人在离雅典不远的马拉松海边发生的，史称希波战争，雅典人最终获得了反侵略的胜利。为了让故乡人民尽快知道胜利的喜讯，统帅米勒狄派一个叫菲迪皮茨的士兵回去报信。
</p>
<p>
	　　菲迪皮茨是个有名的“飞毛腿”，为了让故乡人早知道好消息，他一个劲地快跑，当他跑到雅典时，已上气不接下气，激动地喊道“欢......乐吧，雅典人，我们......胜利了”说完，就倒在地上死了。
</p>
<p>
	　　为了纪念这一事件，在1896年举行的现代第一届奥林匹克运动会上，设立了马拉松赛跑这个项目，把当年菲迪皮茨送信跑的里程——42.193公里作为赛跑的距离。马拉松原为希腊的一个地名。在雅典东北30公里。其名源出腓尼基语marathus，意即“多茴香的”，因古代此地生长众多茴香树而得名。体育运动中的马拉松赛跑就得名于此。
</p>','1','台州体育局,马拉松,台州马拉松,马拉松历史','2015年台州体育局举办台州马拉松活动官方网站，介绍马拉松历史内容。','zh-cn');
INSERT INTO `pa_page` VALUES ('43','spzx','39','台州马拉松介绍','<p>
	　　8月25日上午，2015中国·台州首届马拉松邀请赛新闻发布会在椒江召开，台州市人民政府副秘书长、本届马拉松邀请赛组委会委员茅国春介绍2015中国·台州首届马拉松邀请赛的赛事筹备情况，台州市体育局局长、本届马拉松邀请赛组委会委员、办公室主任卢颖才回答了社会各界比较关心的有关问题。
</p>
<p>
	　　2015年中国·台州首届马拉松邀请赛将于11月15日在台州市区鸣枪开跑。这是继今年七月份举办的美国著名球星“NBA”麦迪告别赛、10月份即将举办的台州市第四届运动会之后的又一次最有影响力、参赛人数最多、规模最高，而且最具有社会意义的一次体育盛事。
</p>
<p>
	　　2015年中国·台州首届马拉松邀请赛的举办得到市委、市政府领导的高度重视，市主要领导多次听取筹备工作汇报情况汇报并作重要指示，市委常委会、市长办公会议分别进行专题研究。举办2015中国·台州首届马拉松邀请赛是为了更好地贯彻落实党的“十八”大精神，加快推进市委、市政府确定的“一都三城”战略目标的实现，激发台州人民的热情，聚凝人心，共同建设台州“山海美城”，推动体育事业与城市建设社会事业的共同进步与发展。
</p>
<p>
	　　2015年中国·台州首届马拉松邀请赛是台州历史空前的一项赛事。届时将会有来自全国各地的10000多名运动员参加,其中3000人参加全程和半程马拉松赛，7000人参加迷你马拉松等赛项，合计裁判人员、工作人员和广大志愿工作者总人数达15000人。
</p>
<p>
	　　为了更好地推动全民健身活动的需要，使广大市民能够在自己的家门口就能亲身感受和体验群众性体育活动的深厚魅力，组委会根据专家的意见，确定本次马拉松比赛的线路：从市体育中心出发，沿着市区主要干道至台州湾集聚区一线，途径台州市区主要的标志性建筑及新区建设区域，体现“绿色马拉松、美丽新台州”的活动主题。
</p>
<p>
	　　为了充分吸引海内外和广大市民的踊跃积极参与，本次马拉松比赛设置了男、女全程马拉松和男、女半程马拉松、男、女迷你马拉松等赛项组别，每项设20个奖项，最高奖额为5万元。
</p>
<p>
	　　2015中国·台州马拉松邀请赛由台州市人民政府主办，台州市体育局、台州市体育总会、椒江区人民政府承办。
</p>
<p>
	　　目前距离市首届马拉松邀请赛举办已指日可待，各项筹备工作都已进入倒计时。台马赛LOGO和主题口号已向全社会公开征集，筹委会办公室已全面启动，其它相关工作都在顺利进行中。我们期待着2015中国·台州首届马拉松邀请赛取得圆满成功，也期待着社会各界朋友们对本次活动的大力支持和积极参与。
</p>','1','台州体育局,马拉松,台州马拉松,台州马拉松介绍','2015年台州体育局举办台州马拉松活动官方网站，介绍台州马拉松介绍内容。','zh-cn');


# 数据库表：pa_product 数据信息
INSERT INTO `pa_product` VALUES ('481','58','马拉松片段','0.00','','721','马拉松片段','马拉松片段','1','马拉松片段','1441272220','','<p style="text-align:center;">
<video src="http://mls.ddl666.com/upload/3.MP4" style="width:100%; height:400%;" controls="controls">您的浏览器不支持此种视频格式。</video> 
</p>','zh-cn','1','4','0','0');
INSERT INTO `pa_product` VALUES ('480','56','马拉松片段','0.00','','720','马拉松片段','马拉松片段','1','马拉松片段','1441272195','','<p style="text-align:center;">
<video src="http://mls.ddl666.com/upload/2.MP4" style="width:100%; height:400%;" controls="controls">您的浏览器不支持此种视频格式。</video> 
</p>','zh-cn','1','4','0','0');
INSERT INTO `pa_product` VALUES ('42','55','马拉松片段','0.00','001','722','马拉松片段','马拉松片段','1','马拉松片段','1436609188','1441272267','<p style="text-align:center;">
<video src="http://mls.ddl666.com/upload/1.MP4" style="width:100%; height:400%;" controls="controls">您的浏览器不支持此种视频格式。</video> 
</p>','zh-cn','44','16','0','0');


# 数据库表：pa_role 数据信息
INSERT INTO `pa_role` VALUES ('1','超级管理员','0','1','系统内置超级管理员组，不受权限分配账号限制');
INSERT INTO `pa_role` VALUES ('2','管理员','1','1','拥有系统仅此于超级管理员的权限');
INSERT INTO `pa_role` VALUES ('3','领导','1','1','拥有所有操作的读权限，无增加、删除、修改的权限');
INSERT INTO `pa_role` VALUES ('4','测试组','1','1','测试');


# 数据库表：pa_role_user 数据信息
INSERT INTO `pa_role_user` VALUES ('3','4');


# 数据库表：pa_tag 数据信息
INSERT INTO `pa_tag` VALUES ('6','关于我们','aboutus','<h3> <img src="/newconist/Uploads/image/product/20140303/20140303081406_87297.jpg" width="100" height="100" align="left" alt="" /> </h3><p>  在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多<span></span></span></span></span></span></span></span></span></span></span></p>','zh-cn');


# 数据库表：pa_wxhd 数据信息
INSERT INTO `pa_wxhd` VALUES ('2','分享','1477843200','/Uploads/image/wxhd/20150814/20150814163946_96926.jpg','0','1','分享','分享','1437900633','4009260070','80');
INSERT INTO `pa_wxhd` VALUES ('3','分享','1443542400','/Uploads/image/wxhd/20150814/20150814163722_66807.jpg','0','1','分享','分享','1438010159','4009260070','80000000');
