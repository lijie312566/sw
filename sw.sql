-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2018-01-08 03:34:19
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sw`
--

-- --------------------------------------------------------

--
-- 表的结构 `sw_admin`
--

CREATE TABLE IF NOT EXISTS `sw_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(100) NOT NULL COMMENT '管理员账号',
  `password` varchar(100) NOT NULL COMMENT '管理员密码',
  `time` int(11) unsigned NOT NULL COMMENT '添加时间',
  `phone` varchar(100) NOT NULL COMMENT '电话',
  `status` int(1) NOT NULL COMMENT '状态：0可用，1禁用',
  `identity` int(1) NOT NULL DEFAULT '1' COMMENT '身份证明',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `sw_admin`
--

INSERT INTO `sw_admin` (`id`, `username`, `password`, `time`, `phone`, `status`, `identity`) VALUES
(3, 'admin', '21232f297a57a5a743894a0e4a801fc3', 0, '18888887777', 1, 1),
(4, 'zhaozilong', '60c23700993d48a5ecc93eecf68b6057', 0, '1666888888', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sw_article`
--

CREATE TABLE IF NOT EXISTS `sw_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `abstract` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `author` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `del` int(1) DEFAULT '0' COMMENT '0代表正常，1代表删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- 转存表中的数据 `sw_article`
--

INSERT INTO `sw_article` (`id`, `title`, `abstract`, `create_time`, `author`, `content`, `del`) VALUES
(1, '大家好', '呵呵哒，还斩妖', '2017-01-12 16:55:55', 'admin', '阿萨飒飒飒飒飒飒撒飒飒飒飒飒飒飒飒飒飒飒飒飒飒所所所所所所所所', 0),
(2, '12', '12', '2017-01-13 11:36:33', 'admin', '12', 0),
(3, '这是我的新文章嘿嘿', '你想看吗', '2017-01-13 15:00:59', 'admin', '你是谁？', 0),
(4, '有时间了！1', '你看', '2017-01-13 14:47:16', 'admin', '上看看', 0),
(5, '你好', '怎么好', '2017-01-13 11:36:16', 'admin', '我也不知道', 0),
(6, '阿萨德', '在线', '2017-01-13 11:40:34', 'admin', '121212啊', 0),
(7, '12', '12', '2017-01-13 14:47:27', 'admin', '12', 1),
(8, '12', '12', '2017-01-13 14:47:35', 'admin', '12', 1),
(9, '12', '12', '2017-01-13 11:44:34', 'admin', '12', 0),
(10, '12', '12', '2017-01-13 11:49:50', 'admin', '12', 0),
(11, '可以吗', 'assassin', '2017-01-13 11:51:23', 'admin', '好吧', 0),
(12, '是', '2', '2017-01-13 11:52:10', 'admin', '场', 0),
(13, '撒', '手', '2017-01-13 11:52:44', 'admin', '吧', 0),
(14, '阿萨', '在学校', '2017-01-13 11:53:36', 'admin', '撒啊飒飒', 0),
(15, '1必须好啊！', '2', '2017-01-13 14:50:28', 'admin', '3', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sw_auth_group`
--

CREATE TABLE IF NOT EXISTS `sw_auth_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text COMMENT '规则id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户组表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `sw_auth_group`
--

INSERT INTO `sw_auth_group` (`id`, `title`, `status`, `rules`) VALUES
(1, '系统管理员', 1, '1,14,143,144,6,2,3,15,16,17,18,4,20,21,7,8,10,19,150,152,147,155,156,148,157,158,159'),
(2, '客户', 1, '1,14,143,144,6,2,3,15,16,17,18,4,20,21,10,19,152,154,147,155,153'),
(3, '维护工', 1, '1,14,143,144,154,147');

-- --------------------------------------------------------

--
-- 表的结构 `sw_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `sw_auth_group_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `group_id` int(11) unsigned NOT NULL COMMENT '用户组id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户组明细表' AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `sw_auth_group_access`
--

INSERT INTO `sw_auth_group_access` (`id`, `uid`, `group_id`) VALUES
(1, 3, 1),
(2, 4, 1),
(3, 88, 1),
(4, 500000, 2),
(5, 500001, 2),
(6, 1000000, 3),
(7, 1000001, 3),
(8, 1000002, 3),
(9, 1000003, 3),
(10, 1000004, 3),
(11, 1000005, 3),
(12, 1000006, 3),
(13, 1000007, 3),
(14, 1000008, 3),
(15, 500002, 2);

-- --------------------------------------------------------

--
-- 表的结构 `sw_auth_rule`
--

CREATE TABLE IF NOT EXISTS `sw_auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '导航是否显示：0显示，1隐藏',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='规则表' AUTO_INCREMENT=160 ;

--
-- 转存表中的数据 `sw_auth_rule`
--

INSERT INTO `sw_auth_rule` (`id`, `pid`, `name`, `title`, `status`, `type`, `condition`, `state`) VALUES
(1, 0, 'Admin/Index/index', '控制台', 1, 1, '', 0),
(2, 6, 'Admin/Rule/rule_list', '权限管理', 1, 1, '', 0),
(3, 6, 'Admin/Rule/rule_group', '角色管理', 1, 1, '', 0),
(4, 6, 'Admin/User/index', '用户管理', 1, 1, '', 0),
(6, 0, 'Admin/Rule/', '权限控制台', 1, 1, '', 0),
(7, 6, 'Admin/Rule/add', '添加权限', 1, 1, '', 1),
(8, 6, 'Admin/Rule/edit', '修改权限', 1, 1, '', 1),
(10, 6, 'Admin/ShowNav/posts', '退出登录', 1, 1, '', 0),
(14, 1, 'index/index', '测试权限', 1, 1, '', 0),
(15, 3, 'Admin/Rule/rule_distribution', '角色分配权限', 1, 1, '', 0),
(16, 3, 'Admin/Rule/add_group', '添加角色', 1, 1, '', 0),
(17, 3, 'Admin/Rule/edit_group', '修改角色', 1, 1, '', 0),
(18, 3, 'Admin/Rule/delete_group', '删除角色', 1, 1, '', 0),
(19, 10, 'Admin/Index/logout', '退出登录', 1, 1, '', 0),
(20, 4, 'Admin/User/add_user', '添加用户（管理员）', 1, 1, '', 0),
(21, 4, 'Admin/User/edit_user', '修改用户', 1, 1, '', 0),
(143, 1, 'Admin/User/my_center', '个人中心', 1, 1, '', 0),
(144, 143, 'Admin/User/change_msg', '修改个人资料', 1, 1, '', 0),
(147, 0, 'Admin/Equipment/index', '设备列表', 1, 1, '', 0),
(148, 0, 'Admin/Company/index', '系统管理', 1, 1, '', 0),
(150, 6, 'Admin/Rule/delete', '删除权限', 1, 1, '', 1),
(152, 6, 'Admin/Company/login', '返回管理账户', 1, 1, '', 1),
(153, 0, 'Admin/Swuser/index', '用户管理', 1, 1, '', 0),
(154, 6, 'Admin/Swuser/login', '返回客户账户', 1, 1, '', 1),
(155, 147, 'Admin/Equipment/dataadd', '添加设备', 1, 1, '', 1),
(156, 147, 'Admin/Equipment/ajax', '设备列表', 1, 1, '', 1),
(157, 0, 'Admin/Cycle/add', 'POST', 1, 1, '', 0),
(158, 0, 'Admin/Cycle/updateDevice', '接口', 1, 1, '', 0),
(159, 0, 'Admin/Cycle/index', '数据展示', 1, 1, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sw_category`
--

CREATE TABLE IF NOT EXISTS `sw_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(100) NOT NULL COMMENT '栏目标题',
  `identity` int(1) NOT NULL DEFAULT '0' COMMENT '0可显示，1管理员禁用，2客户禁用，3用禁用',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sw_category`
--

INSERT INTO `sw_category` (`id`, `title`, `identity`, `url`) VALUES
(1, '设备列表', 0, 'Index/index'),
(2, '地图地理', 3, 'Indexaaaa/index');

-- --------------------------------------------------------

--
-- 表的结构 `sw_company`
--

CREATE TABLE IF NOT EXISTS `sw_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代理商ID',
  `username` varchar(100) NOT NULL COMMENT '代理商账号',
  `password` varchar(100) NOT NULL COMMENT '代理商密码',
  `examine` int(1) NOT NULL DEFAULT '0' COMMENT '代理商审核:0未审核，1已审核',
  `time` int(11) unsigned NOT NULL COMMENT '添加代理商时间',
  `position` varchar(255) NOT NULL COMMENT '地址',
  `phone` varchar(100) NOT NULL COMMENT '电话',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态：0可用，1禁用',
  `identity` int(1) NOT NULL DEFAULT '2' COMMENT '商家身份认证2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=500002 ;

--
-- 转存表中的数据 `sw_company`
--

INSERT INTO `sw_company` (`id`, `username`, `password`, `examine`, `time`, `position`, `phone`, `status`, `identity`) VALUES
(500000, 'company', '93c731f1c3a84ef05cd54d044c379eaa', 0, 0, '', '1322222222', 1, 2),
(500001, 'caocao', '1abb3521ceb70ef277bec804912287ff', 0, 0, '', '155555555555', 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `sw_cycle`
--

CREATE TABLE IF NOT EXISTS `sw_cycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '采集ID',
  `device_sn` varchar(100) NOT NULL COMMENT '设备编码',
  `concentration` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT '--' COMMENT '气体浓度',
  `electricity` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT '--' COMMENT '设备电量',
  `temperature` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT '--' COMMENT '设备温度',
  `humidity` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT '--' COMMENT '设备湿度',
  `time` int(11) unsigned NOT NULL COMMENT '采集设备时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `sw_cycle`
--

INSERT INTO `sw_cycle` (`id`, `device_sn`, `concentration`, `electricity`, `temperature`, `humidity`, `time`) VALUES
(1, 'B4', '10', '1', '1', '1', 1514739600),
(2, 'B4', '20', '1', '--', '1', 1514754000),
(4, 'B4', '30', '100', '--', '100', 1514768400),
(5, 'B4', '40', '100', '--', '100', 1514782800),
(6, 'B4', '50', '122', '122', '122', 1514797200),
(7, 'B4', '60', '80', '70', '70', 1514811600),
(9, 'B5', '100', '--', '--', '--', 1514736000),
(10, 'B5', '200', '--', '--', '--', 1514750400),
(11, 'B5', '300', '--', '--', '--', 1514764800),
(12, 'B5', '400', '--', '--', '--', 1514779200),
(13, 'B5', '500', '--', '--', '--', 1514793600),
(14, 'B5', '600', '--', '--', '--', 1514808000),
(15, 'B5', '700', '--', '--', '--', 1514822400);

-- --------------------------------------------------------

--
-- 表的结构 `sw_equipment`
--

CREATE TABLE IF NOT EXISTS `sw_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `company_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `device_sn` varchar(100) NOT NULL COMMENT '设备编码',
  `custom` varchar(100) NOT NULL COMMENT '自定义信息',
  `time` int(10) unsigned NOT NULL COMMENT '添加设备时间',
  `telephone` text NOT NULL COMMENT '设备关联人电话，多以逗号隔开',
  `warehouse_id` int(11) NOT NULL COMMENT '库区ID',
  `floor_id` int(11) NOT NULL COMMENT '楼区ID',
  `layer_id` int(11) NOT NULL COMMENT '层区ID',
  `concentration` varchar(100) NOT NULL COMMENT '气体浓度',
  `electricity` varchar(100) NOT NULL COMMENT '设备电量',
  `temperature` varchar(100) NOT NULL COMMENT '设备温度',
  `humidity` varchar(100) NOT NULL COMMENT '设备湿度',
  `lamp` int(1) NOT NULL DEFAULT '0' COMMENT '设备呼叫 （灯闪）:0关灯，1开灯',
  `state` int(1) NOT NULL DEFAULT '1' COMMENT '开机状态：0关机，1开机',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`device_sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `sw_equipment`
--

INSERT INTO `sw_equipment` (`id`, `company_id`, `device_sn`, `custom`, `time`, `telephone`, `warehouse_id`, `floor_id`, `layer_id`, `concentration`, `electricity`, `temperature`, `humidity`, `lamp`, `state`) VALUES
(1, 500001, 'A1', 'A1', 1513159133, '1000003,1000005', 0, 0, 0, '10', '20', '30', '40', 0, 1),
(2, 500001, 'A2', 'A2', 1513159168, '1000004,1000005,1000006', 0, 0, 0, '11', '21', '31', '41', 0, 1),
(3, 500001, 'A3', 'A3', 1513159209, '', 0, 0, 0, '80', '80', '70', '70', 0, 1),
(4, 500001, 'A4', 'A4', 1513159227, '1000003,1000004,1000006', 0, 0, 0, '13', '23', '', '', 0, 1),
(5, 500001, 'A5', 'A5', 1513159252, '', 0, 0, 0, '14', '', '', '', 0, 1),
(6, 500001, 'A6', 'A6', 1513159267, '1000003,1000004,1000005,1000006', 0, 0, 0, '', '', '', '', 0, 1),
(7, 500001, 'A7', 'A7', 1513159345, '1000003', 0, 0, 0, '', '', '', '', 0, 1),
(8, 500001, 'A8', 'A8', 1513159381, '1000003,1000004,1000005,1000006', 0, 0, 0, '', '', '', '', 0, 1),
(9, 500000, 'B1', 'B1', 1513159630, '1000008', 0, 0, 0, '', '', '', '', 0, 1),
(10, 500000, 'B2', 'B2', 1513159654, '1000007,1000008', 0, 0, 0, '', '', '', '', 0, 1),
(11, NULL, 'B3', '', 1514284862, '', 0, 0, 0, '10', '10', '10', '10', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sw_floor`
--

CREATE TABLE IF NOT EXISTS `sw_floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '楼ID',
  `floor` varchar(11) NOT NULL COMMENT '楼',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sw_floor`
--

INSERT INTO `sw_floor` (`id`, `floor`) VALUES
(1, '1');

-- --------------------------------------------------------

--
-- 表的结构 `sw_journal`
--

CREATE TABLE IF NOT EXISTS `sw_journal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL COMMENT '维护工ID',
  `company_id` int(11) NOT NULL COMMENT '所属公司ID',
  `content` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '操作内容',
  `time` int(11) unsigned NOT NULL COMMENT '操作时间',
  `state` int(1) NOT NULL COMMENT '是否操作成功：0失败，1成功',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sw_journal`
--

INSERT INTO `sw_journal` (`id`, `user_id`, `company_id`, `content`, `time`, `state`) VALUES
(1, 1, 1, '1', 1497427270, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sw_ layer`
--

CREATE TABLE IF NOT EXISTS `sw_ layer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `layer` varchar(100) NOT NULL COMMENT '层 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sw_ layer`
--

INSERT INTO `sw_ layer` (`id`, `layer`) VALUES
(1, '1');

-- --------------------------------------------------------

--
-- 表的结构 `sw_lose`
--

CREATE TABLE IF NOT EXISTS `sw_lose` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '失联ID',
  `equipment_id` int(11) NOT NULL COMMENT '设备ID',
  `time` int(11) unsigned NOT NULL COMMENT '失联时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sw_lose`
--

INSERT INTO `sw_lose` (`id`, `equipment_id`, `time`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sw_move`
--

CREATE TABLE IF NOT EXISTS `sw_move` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '移机ID',
  `user_id` int(11) NOT NULL COMMENT '维护工ID',
  `once_ warehouse` varchar(100) NOT NULL COMMENT '原始位置',
  `once_ floor` varchar(100) NOT NULL COMMENT '原始楼',
  `once_ layer` varchar(100) NOT NULL COMMENT '原始层',
  `present_ warehouse` varchar(100) NOT NULL COMMENT '移至位置',
  `present_ floor` varchar(100) NOT NULL COMMENT '移至楼',
  `present_ layer` varchar(100) NOT NULL COMMENT '移至层',
  `time` int(11) unsigned NOT NULL COMMENT '移至时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sw_move`
--

INSERT INTO `sw_move` (`id`, `user_id`, `once_ warehouse`, `once_ floor`, `once_ layer`, `present_ warehouse`, `present_ floor`, `present_ layer`, `time`) VALUES
(1, 1, '1', '1', '1', '11', '1', '1', 1497427270);

-- --------------------------------------------------------

--
-- 表的结构 `sw_prompt`
--

CREATE TABLE IF NOT EXISTS `sw_prompt` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '报警ID',
  `equipment_id` int(11) NOT NULL COMMENT '设备ID',
  `high_ concentration` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT '最高气体浓度报警值',
  `high_ electricity` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT '最高设备电量报警值',
  `high_ temperature` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT '最高设备温度报警值',
  `high_ humidity` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT '最高设备湿度报警值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sw_prompt`
--

INSERT INTO `sw_prompt` (`id`, `equipment_id`, `high_ concentration`, `high_ electricity`, `high_ temperature`, `high_ humidity`) VALUES
(1, 1, '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- 表的结构 `sw_user`
--

CREATE TABLE IF NOT EXISTS `sw_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '维护工ID',
  `company_id` int(11) NOT NULL COMMENT '所属公司ID ',
  `equipment_id` varchar(255) NOT NULL COMMENT '设备ID ，多个以逗号隔开',
  `username` varchar(255) NOT NULL COMMENT '维护工账号',
  `password` varchar(255) NOT NULL COMMENT '维护工密码',
  `phone` varchar(255) NOT NULL COMMENT '维护工电话',
  `mail` varchar(255) NOT NULL COMMENT '维护工邮件',
  `time` int(11) unsigned NOT NULL COMMENT '添加时间',
  `identity` int(1) NOT NULL DEFAULT '3' COMMENT '维护工身份认证3',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态：0可用，1禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000009 ;

--
-- 转存表中的数据 `sw_user`
--

INSERT INTO `sw_user` (`id`, `company_id`, `equipment_id`, `username`, `password`, `phone`, `mail`, `time`, `identity`, `status`) VALUES
(1000003, 500001, '1,4,6,7,8', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', '18888888888', '', 0, 3, 1),
(1000004, 500001, '2,4,6,8', 'usera', '697aa03927398125bb6282e2f414a6be', '18888888881', '', 0, 3, 1),
(1000005, 500001, '1,2,6,8', 'userb', '4e1bdf42c33b390163a92510397d97b0', '18888888882', '', 0, 3, 1),
(1000006, 500001, '2,4,6,8', 'userc', 'cc558eab13f85d21d1f2395bb7799076', '18888888883', '', 0, 3, 1),
(1000007, 500000, '10', 'Luser', '4102b15a76979a789eab44dde4d51f8f', '16666666661', '', 0, 3, 1),
(1000008, 500000, '9,10', 'Lusera', 'b7079719302bdcaf2493c48a2e5640df', '16666666662', '', 0, 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sw_warehouse`
--

CREATE TABLE IF NOT EXISTS `sw_warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库表 ID',
  `name` varchar(100) NOT NULL COMMENT '库区名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sw_warehouse`
--

INSERT INTO `sw_warehouse` (`id`, `name`) VALUES
(1, '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
