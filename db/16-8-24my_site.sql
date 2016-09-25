-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-08-24 08:36:23
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `my_site`
--

-- --------------------------------------------------------

--
-- 表的结构 `sc_admin`
--

CREATE TABLE IF NOT EXISTS `sc_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL COMMENT '用户登录名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `gender` tinyint(4) DEFAULT '1' COMMENT '性别(0：女；1：男；)',
  `correspondence_id` int(11) DEFAULT NULL COMMENT '函授站',
  `role_name` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '是否删除',
  `my_quickentry` text COMMENT '快捷入口',
  `courseids` varchar(255) DEFAULT NULL COMMENT '任课老师课程',
  `disciplineids` varchar(255) DEFAULT NULL COMMENT '任课老师的专业',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `sc_admin`
--

INSERT INTO `sc_admin` (`id`, `username`, `password`, `name`, `gender`, `correspondence_id`, `role_name`, `is_delete`, `my_quickentry`, `courseids`, `disciplineids`) VALUES
(1, 'admin', '96e79218965eb72c92a549dd5a330112', '超级管理员', 1, NULL, 'zongadming', 0, '{"2":{"id":2,"name":"\\u5e74\\u7ea7\\u7ba1\\u7406","url":"grade\\/index"},"3":{"id":3,"name":"\\u5b66\\u671f\\u7ba1\\u7406","url":"term\\/index"},"4":{"id":4,"name":"\\u51fd\\u6388\\u7ad9\\u7ba1\\u7406","url":"correspondence\\/index"},"12":{"id":12,"name":"\\u8bfe\\u7a0b\\u8bbe\\u7f6e","url":"course\\/index"},"34":{"id":34,"name":"\\u6559\\u5e08\\u7ba1\\u7406","url":"teacher\\/index"}}', '', ''),
(5, '董', '96e79218965eb72c92a549dd5a330112', '董', 1, NULL, 'zongadming', 0, NULL, NULL, NULL),
(7, '朱', '96e79218965eb72c92a549dd5a330112', '朱', 1, NULL, 'test', 0, NULL, NULL, NULL),
(8, '江', '96e79218965eb72c92a549dd5a330112', '江', 0, NULL, 'test', 0, NULL, NULL, NULL),
(9, '徐', '96e79218965eb72c92a549dd5a330112', '徐', 1, NULL, 'test', 0, NULL, NULL, NULL),
(10, '盛', '96e79218965eb72c92a549dd5a330112', '盛', 1, NULL, 'test', 0, NULL, NULL, NULL),
(13, '史', '96e79218965eb72c92a549dd5a330112', '史', 1, NULL, 'zongadming', 0, NULL, NULL, NULL),
(14, '潘', '96e79218965eb72c92a549dd5a330112', '潘', 1, NULL, 'test', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sc_auth_assignment`
--

CREATE TABLE IF NOT EXISTS `sc_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `created_at` (`created_at`),
  KEY `item_name` (`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员授权表';

--
-- 转存表中的数据 `sc_auth_assignment`
--

INSERT INTO `sc_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('jiaowu', '112', 1444274494),
('zongadming', '109', 1444274510),
('jiaowu', '111', 1444274529),
('zongadming', '114', 1454310979),
('teacher', '113', 1454311026),
('zongadming', '115', 1454339913),
('jiaowu', '116', 1454593211),
('zongadming', '1', 1456122308),
('jiaowu', '117', 1456846740),
('jiaowu', '118', 1456846765),
('jiaowu', '119', 1456846820),
('jiaowu', '3', 1470295239),
('zongadming', '2', 1470812238),
('zongadming', '5', 1471420654),
('test', '7', 1471420674),
('test', '8', 1471420703),
('test', '9', 1471420733),
('test', '10', 1471420749),
('zongadming', '13', 1471420784),
('test', '14', 1471420836);

-- --------------------------------------------------------

--
-- 表的结构 `sc_auth_item`
--

CREATE TABLE IF NOT EXISTS `sc_auth_item` (
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  `type` int(11) NOT NULL COMMENT '类型{1：角色；2：权限；}',
  `description` text COMMENT '描述',
  `rule_name` varchar(64) DEFAULT NULL COMMENT '规则名称',
  `data` text COMMENT '数据',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL COMMENT '权限所属菜单',
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  KEY `name` (`name`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理权权限条目';

--
-- 转存表中的数据 `sc_auth_item`
--

INSERT INTO `sc_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`, `menu_id`) VALUES
('admin_create', 2, '用户添加', NULL, NULL, NULL, NULL, 35),
('admin_delete', 2, '用户删除', NULL, NULL, NULL, NULL, 35),
('admin_quickentry', 2, '快捷入口设置', NULL, NULL, NULL, NULL, 35),
('admin_update', 2, '用户修改', NULL, NULL, NULL, NULL, 35),
('jiaowu', 1, '教务管理员', NULL, NULL, NULL, NULL, NULL),
('menu_create', 2, '菜单添加', NULL, NULL, NULL, NULL, 32),
('menu_delete', 2, '菜单删除', NULL, NULL, NULL, NULL, 32),
('menu_taxis', 2, '菜单排序', NULL, NULL, NULL, NULL, 32),
('menu_update', 2, '菜单修改', NULL, NULL, NULL, NULL, 32),
('password_update', 2, '修改密码', NULL, NULL, NULL, NULL, 75),
('permission_create', 2, '权限添加', NULL, NULL, NULL, NULL, 30),
('permission_delete', 2, '权限删除', NULL, NULL, NULL, NULL, 30),
('permission_update', 2, '权限修改', NULL, NULL, NULL, NULL, 30),
('project_create', 2, '项目添加', NULL, NULL, NULL, NULL, 76),
('project_delete', 2, '项目删除', NULL, NULL, NULL, NULL, 76),
('project_update', 2, '项目更新', NULL, NULL, NULL, NULL, 76),
('role_create', 2, '角色添加', NULL, NULL, NULL, NULL, 31),
('role_delete', 2, '角色删除', NULL, NULL, NULL, NULL, 31),
('role_permission', 2, '角色权限设置', NULL, NULL, NULL, NULL, 31),
('role_update', 2, '角色修改', NULL, NULL, NULL, NULL, 31),
('shortcut_update', 2, '设置快捷方式', NULL, NULL, NULL, NULL, 74),
('statistics_look', 2, '统计查看', NULL, NULL, NULL, NULL, 79),
('teacher', 1, '任课老师', NULL, NULL, NULL, NULL, NULL),
('test', 1, '测试', NULL, NULL, NULL, NULL, NULL),
('worktime_create', 2, '工时添加', NULL, NULL, NULL, NULL, 77),
('worktime_delete', 2, '工时删除', NULL, NULL, NULL, NULL, 77),
('worktime_update', 2, '工时更新', NULL, NULL, NULL, NULL, 77),
('zongadming', 1, '总管理员', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sc_auth_item_child`
--

CREATE TABLE IF NOT EXISTS `sc_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员权限关系表';

--
-- 转存表中的数据 `sc_auth_item_child`
--

INSERT INTO `sc_auth_item_child` (`parent`, `child`) VALUES
('zongadming', 'admin_create'),
('zongadming', 'admin_delete'),
('zongadming', 'admin_quickentry'),
('zongadming', 'admin_update'),
('zongadming', 'menu_create'),
('zongadming', 'menu_delete'),
('zongadming', 'menu_taxis'),
('zongadming', 'menu_update'),
('zongadming', 'password_update'),
('zongadming', 'permission_create'),
('zongadming', 'permission_delete'),
('zongadming', 'permission_update'),
('zongadming', 'project_create'),
('zongadming', 'project_delete'),
('zongadming', 'project_update'),
('zongadming', 'role_create'),
('zongadming', 'role_delete'),
('zongadming', 'role_permission'),
('zongadming', 'role_update'),
('zongadming', 'shortcut_update'),
('zongadming', 'statistics_look'),
('test', 'worktime_create'),
('zongadming', 'worktime_create'),
('test', 'worktime_delete'),
('zongadming', 'worktime_delete'),
('zongadming', 'worktime_update');

-- --------------------------------------------------------

--
-- 表的结构 `sc_auth_rule`
--

CREATE TABLE IF NOT EXISTS `sc_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `name` (`name`),
  KEY `created_at` (`created_at`),
  KEY `updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员权限规则表';

-- --------------------------------------------------------

--
-- 表的结构 `sc_domain`
--

CREATE TABLE IF NOT EXISTS `sc_domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `domain` varchar(255) DEFAULT NULL COMMENT '域名',
  `site_id` int(11) DEFAULT NULL COMMENT '站点表id',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '是否删除 0：未删除 1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=72 ;

--
-- 转存表中的数据 `sc_domain`
--

INSERT INTO `sc_domain` (`id`, `domain`, `site_id`, `is_delete`) VALUES
(44, 'www.zgl.com', 17, 0),
(69, 'www.gxut.com', 57, 0),
(67, 'cjnew2016v2-lzjtu', 55, 0),
(23, 'cjnew2016-sxcj', 17, 0),
(66, 'cjnew2016v2-zgs', 54, 0),
(36, 'www.newcj2-lz.com', 17, 0),
(70, 'www.gxdx.com', 57, 0),
(38, 'cjnew2016v2-nuc', 17, 0),
(39, 'www.zhanggl_cjnew2016.com', 17, 0),
(40, 'local-nuc', 17, 0),
(41, 'www.gzf.com', 17, 0),
(71, 'www.newcj.com', 17, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sc_menu`
--

CREATE TABLE IF NOT EXISTS `sc_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '名称',
  `parent` int(11) DEFAULT '0' COMMENT '上级菜单',
  `route` varchar(256) DEFAULT NULL,
  `taxis` int(11) DEFAULT '0' COMMENT '排序字段 默认0,以数字倒序排列',
  `data` text,
  `url` varchar(100) DEFAULT NULL COMMENT '菜单链接地址',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `name` (`name`),
  KEY `route` (`route`(255)),
  KEY `order` (`taxis`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统管理员菜单权限表\r\n' AUTO_INCREMENT=80 ;

--
-- 转存表中的数据 `sc_menu`
--

INSERT INTO `sc_menu` (`id`, `name`, `parent`, `route`, `taxis`, `data`, `url`) VALUES
(29, '系统设置', 0, NULL, 40, NULL, ''),
(30, '权限管理', 29, NULL, NULL, NULL, 'permission-form/index'),
(31, '角色管理', 29, NULL, NULL, NULL, 'role-form/index'),
(32, '菜单管理', 29, NULL, NULL, NULL, 'menu/index'),
(35, '用户管理', 29, NULL, NULL, NULL, 'admin/index'),
(74, '设置快捷方式', 29, NULL, 1, NULL, 'shortcut/index'),
(75, '修改密码', 29, NULL, 2, NULL, 'admin/edit-password'),
(76, '项目管理', 78, NULL, NULL, NULL, 'project-management/index'),
(77, '工时管理', 78, NULL, NULL, NULL, 'worktime/index'),
(78, '项目工时管理', 0, NULL, 25, NULL, ''),
(79, '统计管理', 78, NULL, NULL, NULL, 'statistics/index ');

-- --------------------------------------------------------

--
-- 表的结构 `sc_project_management`
--

CREATE TABLE IF NOT EXISTS `sc_project_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pr_name` varchar(100) NOT NULL COMMENT '项目名称',
  `person` int(11) NOT NULL COMMENT '负责人',
  `pro_describe` varchar(255) NOT NULL COMMENT '项目描述',
  `pro_information` varchar(255) NOT NULL COMMENT '项目压缩包路径',
  `member` varchar(100) NOT NULL COMMENT '项目成员',
  `state` int(10) NOT NULL COMMENT '项目状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `sc_project_management`
--

INSERT INTO `sc_project_management` (`id`, `pr_name`, `person`, `pro_describe`, `pro_information`, `member`, `state`) VALUES
(12, '项目1', 5, 'test项目1', '/uploads/2016-08-17/lulublog.rar', '7,8,9,10,13,14', 1),
(13, '项目2', 13, 'test项目2', '/uploads/2016-08-17/lulublog.rar', '7,8,9,10,13,14', 1),
(14, '项目3', 1, 'test项目3', '/uploads/2016-08-18/lulublog.rar', '5,7,8,9,10,13,14', 1),
(15, '项目4', 1, 'test项目4', '/uploads/2016-08-18/lulublog.rar', '5,7,8,9,10,13,14', 3),
(17, '项目5', 1, 'test项目5', '/uploads/2016-08-18/lulublog.rar', '13', 1),
(18, '项目7', 1, 'test项目7', '/uploads/2016-08-18/lulublog.rar', '5,7', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sc_site`
--

CREATE TABLE IF NOT EXISTS `sc_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(100) DEFAULT NULL COMMENT '站点名称',
  `site_code` varchar(100) DEFAULT NULL COMMENT '站点编号',
  `database_info` text COMMENT '数据库配置信息',
  `database_info_old` text,
  `lms_info` text COMMENT '学习系统配置信息',
  `sims_info` text COMMENT '管理系统配置信息',
  `tmp_id` int(11) DEFAULT NULL COMMENT '模板编号',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '是否删除 0：未删除 1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- 转存表中的数据 `sc_site`
--

INSERT INTO `sc_site` (`id`, `name`, `site_code`, `database_info`, `database_info_old`, `lms_info`, `sims_info`, `tmp_id`, `is_delete`) VALUES
(17, '中北大学', 'nbu', '{"driver":"mysqli","host":"10.82.97.41","database":"new_db","login":"cj_scadmin","password":"Rmc2zQ7yKHJhPHzVdb","charset":"utf8"}', '{"driver":"mysqli","host":"10.82.97.41","database":"cjnew_nuc_db","login":"cj_scadmin","password":"Rmc2zQ7yKHJhPHzVdb","charset":"utf8"}', '{"site_name":"\\u4e2d\\u5317\\u5927\\u5b66\\u5b66\\u4e60\\u7cfb\\u7edf","lms_web_site_id":"34","upload_file":"upload_files\\/nbu","resource":"resources\\/nbu\\/lms","logo":"resources\\/nbu\\/lms\\/logo.jpg","college":"resources\\/nbu\\/lms\\/college.jpg","site_about":"\\u4e2d\\u5317\\u5927\\u5b66\\u662f\\u4e00\\u6240\\u7531\\u5c71\\u897f\\u7701\\u4eba\\u6c11\\u653f\\u5e9c\\u4e0e\\u56fd\\u5bb6\\u56fd\\u9632\\u79d1\\u6280\\u5de5\\u4e1a\\u5c40\\u5171\\u5efa\\u3001\\u5c71\\u897f\\u7701\\u4eba\\u6c11\\u653f\\u5e9c\\u7ba1\\u7406\\u7684\\u591a\\u79d1\\u6027\\u6559\\u5b66\\u7814\\u7a76\\u578b\\u5927\\u5b66\\u3002\\u5b66\\u6821\\u7684\\u524d\\u8eab\\u662f1941\\u5e74\\u516b\\u8def\\u519b\\u603b\\u53f8\\u4ee4\\u90e8\\u5728\\u592a\\u884c\\u6297\\u65e5\\u6839\\u636e\\u5730\\u521b\\u529e\\u7684\\u6211\\u515a\\u6211\\u519b\\u7b2c\\u4e00\\u6240\\u5175\\u5de5\\u5b66\\u6821&mdash;&mdash;\\u592a\\u884c\\u5de5\\u4e1a\\u5b66\\u6821\\uff0c\\u5386\\u7ecf\\u592a\\u539f\\u673a\\u68b0\\u5b66\\u9662\\u3001\\u534e\\u5317\\u5de5\\u5b66\\u9662\\uff0c2004\\u5e746\\u6708\\u7ecf\\u6559\\u80b2\\u90e8\\u6279\\u51c6\\u66f4\\u540d\\u4e3a\\u4e2d\\u5317\\u5927\\u5b66\\u3002","file_server":"http:\\/\\/cjnepstore","template":{"menu":{"1":{"name":"\\u9996\\u9875","url":"default\\/main","menu_tag":"main"},"2":{"name":"\\u6211\\u7684\\u8bfe\\u7a0b","url":"course","menu_tag":"course"},"3":{"name":"\\u6211\\u7684\\u7ec3\\u4e60","url":"phase","menu_tag":"coursepractice"},"4":{"name":"\\u6559\\u52a1\\u8ba1\\u5212","url":"javascript:void(0);","menu_tag":"plan","son":{"4_1":{"name":"\\u6559\\u5b66\\u8ba1\\u5212","url":"planteach","menu_tag":"plan"},"4_2":{"name":"\\u6210\\u7ee9\\u67e5\\u8be2","url":"planscore","menu_tag":"plan"},"4_3":{"name":"\\u5b66\\u4e60\\u8fdb\\u5ea6","url":"learnprocess","menu_tag":"plan"}}},"5":{"name":"\\u6d88\\u606f\\u4e2d\\u5fc3","url":"javascript:void(0);","menu_tag":"message","son":{"5_1":{"name":"\\u901a\\u77e5\\u516c\\u544a","url":"message\\/notif","menu_tag":"message"},"5_2":{"name":"\\u4e2a\\u4eba\\u6d88\\u606f","url":"message\\/mymessage","menu_tag":"message"},"5_3":{"name":"\\u7cfb\\u7edf\\u6d88\\u606f","url":"message\\/sysmsg","menu_tag":"message"}}},"6":{"name":"\\u77e5\\u8bc6\\u95ee\\u7b54","url":"catechism","menu_tag":"catechism"},"7":{"name":"\\u4e2a\\u4eba\\u4fe1\\u606f","url":"info","menu_tag":"info"},"8":{"name":"\\u6bd5\\u4e1a\\u8bbe\\u8ba1","url":"#","menu_tag":""}}}}', '{"site_name":"\\u4e2d\\u5317\\u5927\\u5b66\\u7ba1\\u7406\\u7cfb\\u7edf","sims_web_site_id":"34","upload_file":"upload_files\\/nbu","resource":"resources\\/nbu\\/sims","logo":"resources\\/nbu\\/sims\\/logo.jpg","background":"resources\\/nbu\\/sims\\/background.png","file_server":"http:\\/\\/cjnepstore","template":{"perms":{"studentNumber_index":"studentNumber_index","studentNumber_update":"studentNumber_update","grade_create":"grade_create","grade_delete":"grade_delete","grade_update":"grade_update","term_create":"term_create","term_delete":"term_delete","term_update":"term_update","correspondence_create":"correspondence_create","studyType_create":"studyType_create","studyType_delete":"studyType_delete","studyType_update":"studyType_update","studyLevel_create":"studyLevel_create","studyLevel_delete":"studyLevel_delete","studyLevel_update":"studyLevel_update","disciplineType_create":"disciplineType_create","discipline_create":"discipline_create","classInfo_create":"classInfo_create","classInfo_delete":"classInfo_delete","classInfo_openCourse":"classInfo_openCourse","classInfo_update":"classInfo_update","download_create":"download_create","download_delete":"download_delete","download_index":"download_index","download_update":"download_update","enroll_create":"enroll_create","enroll_import":"enroll_import","enroll_score":"enroll_score","enroll_delete":"enroll_delete","enroll_enter":"enroll_enter","enroll_update":"enroll_update","enroll_placement":"enroll_placement","userbc_check":"userbc_check","userbc_create":"userbc_create","userbc_delete":"userbc_delete","userbc_edit":"userbc_edit","userbc_import":"userbc_import","userbc_index":"userbc_index","user_register-term":"user_register-term","user_register-term-cancel":"user_register-term-cancel","user_register-term-register":"user_register-term-register","user_edit":"user_edit","user_index":"user_index","teachPlan_create":"teachPlan_create","teachPlan_delete":"teachPlan_delete","teachPlan_update":"teachPlan_update","teachPlanShlist_pass":"teachPlanShlist_pass","teachPlanSplist_pass":"teachPlanSplist_pass","teachPlanAdjust_pass":"teachPlanAdjust_pass","building_create":"building_create","building_delete":"building_delete","building_freeze":"building_freeze","building_taxis":"building_taxis","building_update":"building_update","roomType_create":"roomType_create","roomType_delete":"roomType_delete","roomType_taxis":"roomType_taxis","roomType_update":"roomType_update","room_create":"room_create","room_delete":"room_delete","room_taxis":"room_taxis","room_update":"room_update","teachingTask_create":"teachingTask_create","teachingTask_delete":"teachingTask_delete","teachingTask_update":"teachingTask_update","courseNum_create":"courseNum_create","courseNum_delete":"courseNum_delete","courseNum_update":"courseNum_update","handwork_create_class":"handwork_create_class","handwork_create_select":"handwork_create_select","handwork_delete":"handwork_delete","handwork_update":"handwork_update","handwork_view":"handwork_view","studyProgress_index":"studyProgress_index","coursetalk_delete":"coursetalk_delete","coursetalk_index":"coursetalk_index","coursetalk_reply":"coursetalk_reply","coursetalk_update":"coursetalk_update","quiz_index":"quiz_index","itemsbug_delete":"itemsbug_delete","itemsbug_export":"itemsbug_export","itemsbug_view":"itemsbug_view","resource_create":"resource_create","resource_delete":"resource_delete","resource_download":"resource_download","resource_view":"resource_view","score_create":"score_create","score_delete":"score_delete","score_index":"score_index","score_update":"score_update","waiver_create":"waiver_create","waiver_delete":"waiver_delete","waiver_index":"waiver_index","waiver_update":"waiver_update","replace_create":"replace_create","replace_delete":"replace_delete","replace_index":"replace_index","replace_update":"replace_update","testplan_create":"testplan_create","testplan_delete":"testplan_delete","testplan_edit":"testplan_edit","testplan_index":"testplan_index","examplan_create":"examplan_create","examplan_delete":"examplan_delete","examplan_exit":"examplan_exit","examplan_index":"examplan_index","makeup_index":"makeup_index","leave_degree-apply":"leave_degree-apply","leave_graduate":"leave_graduate","leave_back-school":"leave_back-school","leave_drop":"leave_drop","leave_back-school2":"leave_back-school2","leave_suspension":"leave_suspension","delete_engage":"delete_engage","update_engage":"update_engage","leave_change-roll":"leave_change-roll","leave_drop-create":"leave_drop-create","leave_graduate-create":"leave_graduate-create","leave_suspension-create":"leave_suspension-create","user_change-correspondence-create":"user_change-correspondence-create","leave_degree":"leave_degree","user_change-discipline":"user_change-discipline","user_change-discipline-do":"user_change-discipline-do","courseNature_create":"courseNature_create","courseNature_delete":"courseNature_delete","courseNature_freeze":"courseNature_freeze","courseNature_taxis":"courseNature_taxis","courseNature_update":"courseNature_update","courseType_create":"courseType_create","courseType_delete":"courseType_delete","courseType_freeze":"courseType_freeze","courseType_taxis":"courseType_taxis","courseType_update":"courseType_update","course_create":"course_create","course_delete":"course_delete","course_update":"course_update","knowledge_create":"knowledge_create","knowledge_delete":"knowledge_delete","knowledge_update":"knowledge_update","questiontype_view":"questiontype_view","questions_add":"questions_add","questions_del":"questions_del","questions_export":"questions_export","questions_update":"questions_update","questions_upload":"questions_upload","questions_view":"questions_view","coursetemplate_create":"coursetemplate_create","coursetemplate_delete":"coursetemplate_delete","coursetemplate_update":"coursetemplate_update","coursetemplate_view":"coursetemplate_view","phaseemplate_create":"phaseemplate_create","phaseemplate_delete":"phaseemplate_delete","phaseemplate_update":"phaseemplate_update","phaseemplate_view":"phaseemplate_view","yearsemplate_create":"yearsemplate_create","yearsemplate_delete":"yearsemplate_delete","yearsemplate_update":"yearsemplate_update","yearsemplate_view":"yearsemplate_view","teacher_create":"teacher_create","teacher_delete":"teacher_delete","teacher_update":"teacher_update","notice_create":"notice_create","notice_delete":"notice_delete","notice_edit":"notice_edit","count_student":"count_student","password_update":"password_update","log_restore":"log_restore","log_view":"log_view","shortcut_update":"shortcut_update","permission_create":"permission_create","permission_delete":"permission_delete","permission_update":"permission_update","role_create":"role_create","role_delete":"role_delete","role_permission":"role_permission","role_update":"role_update","menu_create":"menu_create","menu_delete":"menu_delete","menu_taxis":"menu_taxis","menu_update":"menu_update","admin_quickentry":"admin_quickentry","admin_update":"admin_update"},"menu":{"83":83,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9,"80":80,"24":24,"23":23,"25":25,"26":26,"27":27,"28":28,"14":14,"79":79,"16":16,"15":15,"37":37,"36":36,"38":38,"49":49,"50":50,"40":40,"42":42,"43":43,"48":48,"53":53,"54":54,"72":72,"71":71,"76":76,"77":77,"81":81,"82":82,"45":45,"44":44,"46":46,"47":47,"51":51,"52":52,"63":63,"39":39,"13":13,"22":22,"21":21,"61":61,"18":18,"41":41,"19":19,"10":10,"78":78,"11":11,"12":12,"65":65,"64":64,"66":66,"67":67,"68":68,"69":69,"70":70,"34":34,"33":33,"60":60,"73":73,"59":59,"58":58,"75":75,"29":29,"57":57,"74":74,"30":30,"31":31,"32":32,"35":35}}}', 20, 0),
(54, '浙江工商大学继续教育学院', 'zgs', '{"driver":"mysqli","host":"10.82.97.41","database":"cj_zgs_db","login":"cj_scadmin","password":"Rmc2zQ7yKHJhPHzVdb","charset":"utf8"}', '{"driver":"mysqli","host":"10.82.97.41","database":"cjnew_zgs_db","login":"cj_scadmin","password":"Rmc2zQ7yKHJhPHzVdb","charset":"utf8"}', '{"site_name":"\\u6d59\\u6c5f\\u5de5\\u5546\\u5927\\u5b66\\u5b66\\u4e60\\u7cfb\\u7edf","lms_web_site_id":"37","upload_file":"upload_files\\/zgs","resource":"resources\\/public\\/lms","logo":"resources\\/zgs\\/lms\\/logo.png","college":"resources\\/zgs\\/lms\\/college.png","site_about":"\\u7ad9\\u70b9\\u4ecb\\u7ecd","template":{"menu":{"1":{"name":"\\u9996\\u9875","url":"default\\/main"},"2":{"name":"\\u6211\\u7684\\u8bfe\\u7a0b","url":"course"},"3":{"name":"\\u6211\\u7684\\u7ec3\\u4e60","url":"phase"},"5":{"name":"\\u6d88\\u606f\\u4e2d\\u5fc3","url":"javascript:void(0);","son":{"5_1":{"name":"\\u901a\\u77e5\\u516c\\u544a","url":"message\\/notif"},"5_2":{"name":"\\u4e2a\\u4eba\\u6d88\\u606f","url":"message\\/mymessage"},"5_3":{"name":"\\u7cfb\\u7edf\\u6d88\\u606f","url":"message\\/sysmsg"}}},"6":{"name":"\\u77e5\\u8bc6\\u95ee\\u7b54","url":"catechism"},"7":{"name":"\\u4e2a\\u4eba\\u4fe1\\u606f","url":"info"},"8":{"name":"\\u6bd5\\u4e1a\\u8bbe\\u8ba1","url":"#"}}}}', '{"site_name":"\\u6d59\\u6c5f\\u5de5\\u5546\\u5927\\u5b66\\u7ba1\\u7406\\u7cfb\\u7edf","sims_web_site_id":"37","upload_file":"upload_files\\/zgs","resource":"resources\\/public\\/sims","logo":"resources\\/zgs\\/sims\\/logo.png","background":"resources\\/zgs\\/sims\\/background.png","template":{"perms":{"studentNumber_index":"studentNumber_index","studentNumber_update":"studentNumber_update","grade_create":"grade_create","grade_delete":"grade_delete","grade_update":"grade_update","term_create":"term_create","term_delete":"term_delete","term_update":"term_update","correspondence_create":"correspondence_create","studyType_create":"studyType_create","studyType_delete":"studyType_delete","studyType_update":"studyType_update","studyLevel_create":"studyLevel_create","studyLevel_delete":"studyLevel_delete","studyLevel_update":"studyLevel_update","disciplineType_create":"disciplineType_create","discipline_create":"discipline_create","classInfo_create":"classInfo_create","classInfo_delete":"classInfo_delete","classInfo_openCourse":"classInfo_openCourse","classInfo_update":"classInfo_update","download_create":"download_create","download_delete":"download_delete","download_index":"download_index","download_update":"download_update","enroll_create":"enroll_create","enroll_import":"enroll_import","enroll_score":"enroll_score","enroll_delete":"enroll_delete","enroll_enter":"enroll_enter","enroll_update":"enroll_update","enroll_placement":"enroll_placement","userbc_check":"userbc_check","userbc_create":"userbc_create","userbc_delete":"userbc_delete","userbc_edit":"userbc_edit","userbc_import":"userbc_import","userbc_index":"userbc_index","user_register-term":"user_register-term","user_register-term-cancel":"user_register-term-cancel","user_register-term-register":"user_register-term-register","user_edit":"user_edit","user_index":"user_index","teachPlan_create":"teachPlan_create","teachPlan_delete":"teachPlan_delete","teachPlan_update":"teachPlan_update","teachPlanShlist_pass":"teachPlanShlist_pass","teachPlanSplist_pass":"teachPlanSplist_pass","teachPlanAdjust_pass":"teachPlanAdjust_pass","building_create":"building_create","building_delete":"building_delete","building_freeze":"building_freeze","building_taxis":"building_taxis","building_update":"building_update","roomType_create":"roomType_create","roomType_delete":"roomType_delete","roomType_taxis":"roomType_taxis","roomType_update":"roomType_update","room_create":"room_create","room_delete":"room_delete","room_taxis":"room_taxis","room_update":"room_update","teachingTask_create":"teachingTask_create","teachingTask_delete":"teachingTask_delete","teachingTask_update":"teachingTask_update","courseNum_create":"courseNum_create","courseNum_delete":"courseNum_delete","courseNum_update":"courseNum_update","handwork_create_class":"handwork_create_class","handwork_create_select":"handwork_create_select","handwork_delete":"handwork_delete","handwork_update":"handwork_update","handwork_view":"handwork_view","studyProgress_index":"studyProgress_index","coursetalk_delete":"coursetalk_delete","coursetalk_index":"coursetalk_index","coursetalk_reply":"coursetalk_reply","coursetalk_update":"coursetalk_update","quiz_index":"quiz_index","itemsbug_delete":"itemsbug_delete","itemsbug_export":"itemsbug_export","itemsbug_view":"itemsbug_view","resource_create":"resource_create","resource_delete":"resource_delete","resource_download":"resource_download","resource_view":"resource_view","score_create":"score_create","score_delete":"score_delete","score_index":"score_index","score_update":"score_update","waiver_create":"waiver_create","waiver_delete":"waiver_delete","waiver_index":"waiver_index","waiver_update":"waiver_update","replace_create":"replace_create","replace_delete":"replace_delete","replace_index":"replace_index","replace_update":"replace_update","testplan_create":"testplan_create","testplan_delete":"testplan_delete","testplan_edit":"testplan_edit","testplan_index":"testplan_index","examplan_create":"examplan_create","examplan_delete":"examplan_delete","examplan_exit":"examplan_exit","examplan_index":"examplan_index","makeup_index":"makeup_index","leave_degree-apply":"leave_degree-apply","leave_graduate":"leave_graduate","leave_back-school":"leave_back-school","leave_drop":"leave_drop","leave_back-school2":"leave_back-school2","leave_suspension":"leave_suspension","delete_engage":"delete_engage","update_engage":"update_engage","leave_change-roll":"leave_change-roll","leave_drop-create":"leave_drop-create","leave_graduate-create":"leave_graduate-create","leave_suspension-create":"leave_suspension-create","user_change-correspondence-create":"user_change-correspondence-create","leave_degree":"leave_degree","user_change-discipline":"user_change-discipline","user_change-discipline-do":"user_change-discipline-do","courseNature_create":"courseNature_create","courseNature_delete":"courseNature_delete","courseNature_freeze":"courseNature_freeze","courseNature_taxis":"courseNature_taxis","courseNature_update":"courseNature_update","courseType_create":"courseType_create","courseType_delete":"courseType_delete","courseType_freeze":"courseType_freeze","courseType_taxis":"courseType_taxis","courseType_update":"courseType_update","course_create":"course_create","course_delete":"course_delete","course_update":"course_update","knowledge_create":"knowledge_create","knowledge_delete":"knowledge_delete","knowledge_update":"knowledge_update","questiontype_view":"questiontype_view","questions_add":"questions_add","questions_del":"questions_del","questions_export":"questions_export","questions_update":"questions_update","questions_upload":"questions_upload","questions_view":"questions_view","coursetemplate_create":"coursetemplate_create","coursetemplate_delete":"coursetemplate_delete","coursetemplate_update":"coursetemplate_update","coursetemplate_view":"coursetemplate_view","phaseemplate_create":"phaseemplate_create","phaseemplate_delete":"phaseemplate_delete","phaseemplate_update":"phaseemplate_update","phaseemplate_view":"phaseemplate_view","yearsemplate_create":"yearsemplate_create","yearsemplate_delete":"yearsemplate_delete","yearsemplate_update":"yearsemplate_update","yearsemplate_view":"yearsemplate_view","teacher_create":"teacher_create","teacher_delete":"teacher_delete","teacher_update":"teacher_update","notice_create":"notice_create","notice_delete":"notice_delete","notice_edit":"notice_edit","count_student":"count_student","password_update":"password_update","log_restore":"log_restore","log_view":"log_view","shortcut_update":"shortcut_update","permission_create":"permission_create","permission_delete":"permission_delete","permission_update":"permission_update","role_create":"role_create","role_delete":"role_delete","role_permission":"role_permission","role_update":"role_update","menu_create":"menu_create","menu_delete":"menu_delete","menu_taxis":"menu_taxis","menu_update":"menu_update","admin_create":"admin_create","admin_delete":"admin_delete","admin_quickentry":"admin_quickentry","admin_update":"admin_update"},"menu":{"83":83,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9,"80":80,"24":24,"23":23,"25":25,"26":26,"27":27,"28":28,"14":14,"79":79,"16":16,"15":15,"37":37,"36":36,"38":38,"49":49,"50":50,"40":40,"42":42,"43":43,"48":48,"53":53,"54":54,"72":72,"71":71,"76":76,"77":77,"81":81,"82":82,"45":45,"44":44,"46":46,"47":47,"51":51,"52":52,"63":63,"39":39,"13":13,"22":22,"21":21,"61":61,"18":18,"41":41,"19":19,"10":10,"78":78,"11":11,"12":12,"65":65,"64":64,"66":66,"67":67,"68":68,"69":69,"70":70,"34":34,"33":33,"60":60,"73":73,"59":59,"58":58,"75":75,"29":29,"57":57,"74":74,"30":30,"31":31,"32":32,"35":35}}}', 20, 0),
(55, '兰州交通大学', 'lzjtu', '{"driver":"mysqli","host":"10.82.97.41","database":"cj_lzjtu_db","login":"cj_scadmin","password":"Rmc2zQ7yKHJhPHzVdb","charset":"utf8"}', '{"driver":"mysqli","host":"10.82.97.41","database":"cjnew_lzjtu_db","login":"cj_scadmin","password":"Rmc2zQ7yKHJhPHzVdb","charset":"utf8"}', '{"site_name":"\\u5170\\u5dde\\u4ea4\\u901a\\u5927\\u5b66\\u5b66\\u4e60\\u7cfb\\u7edf","lms_web_site_id":"38","upload_file":"upload_files\\/lzjtu","resource":"resources\\/public\\/lms","logo":"resources\\/lzjtu\\/lms\\/logo.png","college":"resources\\/lzjtu\\/lms\\/college.jpg","site_about":"\\u5170\\u5dde\\u4ea4\\u901a\\u5927\\u5b66\\u521b\\u5efa\\u4e8el958\\u5e74\\uff0c\\u7531\\u5510\\u5c71\\u94c1\\u9053\\u5b66\\u9662\\uff08\\u73b0\\u897f\\u5357\\u4ea4\\u901a\\u5927\\u5b66\\uff09\\u548c\\u5317\\u4eac\\u94c1\\u9053\\u5b66\\u9662\\uff08\\u73b0\\u5317\\u4eac\\u4ea4\\u901a\\u5927\\u5b66\\uff09\\u90e8\\u5206\\u7cfb\\u79d1\\u6210\\u5efa\\u5236\\u8fc1\\u5170\\u7ec4\\u5efa\\uff0c\\u539f\\u540d\\u5170\\u5dde\\u94c1\\u9053\\u5b66\\u9662\\uff0c\\u662f\\u6211\\u56fd\\u7b2c\\u4e09\\u6240\\u94c1\\u8def\\u9662\\u6821\\u300250\\u5e74\\u4ee3\\u672b\\u81f390\\u5e74\\u4ee3\\u672b\\uff0c\\u5b66\\u6821\\u96b6\\u5c5e\\u94c1\\u9053\\u90e8\\u9886\\u5bfc\\uff0c\\u5b9e\\u884c\\u884c\\u4e1a\\u529e\\u5b66\\u7ba1\\u7406\\u4f53\\u5236\\u30022000\\u5e74\\uff0c\\u6839\\u636e\\u56fd\\u5bb6\\u7edf\\u7b79\\u89c4\\u5212\\uff0c\\u5212\\u5f52\\u7518\\u8083\\u7701\\u7ba1\\u7406\\uff0c\\u5b9e\\u884c&ldquo;\\u4e2d\\u592e\\u4e0e\\u5730\\u65b9\\u5171\\u5efa\\uff0c\\u4ee5\\u5730\\u65b9\\u653f\\u5e9c\\u7ba1\\u7406\\u4e3a\\u4e3b&rdquo;\\u7684\\u7ba1\\u7406\\u4f53\\u5236\\u30022003\\u5e744\\u6708\\uff0c\\u7ecf\\u6559\\u80b2\\u90e8\\u6279\\u51c6\\uff0c\\u66f4\\u540d\\u4e3a&ldquo;\\u5170\\u5dde\\u4ea4\\u901a\\u5927\\u5b66&rdquo;\\u3002","template":{"menu":{"1":{"name":"\\u9996\\u9875","url":"default\\/main"},"2":{"name":"\\u6211\\u7684\\u8bfe\\u7a0b","url":"course"},"3":{"name":"\\u6211\\u7684\\u7ec3\\u4e60","url":"phase"},"5":{"name":"\\u6d88\\u606f\\u4e2d\\u5fc3","url":"javascript:void(0);","son":{"5_1":{"name":"\\u901a\\u77e5\\u516c\\u544a","url":"message\\/notif"},"5_2":{"name":"\\u4e2a\\u4eba\\u6d88\\u606f","url":"message\\/mymessage"},"5_3":{"name":"\\u7cfb\\u7edf\\u6d88\\u606f","url":"message\\/sysmsg"}}},"6":{"name":"\\u77e5\\u8bc6\\u95ee\\u7b54","url":"catechism"},"7":{"name":"\\u4e2a\\u4eba\\u4fe1\\u606f","url":"info"},"8":{"name":"\\u6bd5\\u4e1a\\u8bbe\\u8ba1","url":"#"}}}}', '{"site_name":"\\u5170\\u5dde\\u4ea4\\u901a\\u5927\\u5b66\\u7ba1\\u7406\\u7cfb\\u7edf","sims_web_site_id":"38","upload_file":"upload_files\\/lzjtu","resource":"resources\\/public\\/sims","logo":"resources\\/lzjtu\\/sims\\/logo.png","background":"resources\\/lzjtu\\/sims\\/background.png","template":{"perms":{"studentNumber_index":"studentNumber_index","studentNumber_update":"studentNumber_update","grade_create":"grade_create","grade_delete":"grade_delete","grade_update":"grade_update","term_create":"term_create","term_delete":"term_delete","term_update":"term_update","correspondence_create":"correspondence_create","studyType_create":"studyType_create","studyType_delete":"studyType_delete","studyType_update":"studyType_update","studyLevel_create":"studyLevel_create","studyLevel_delete":"studyLevel_delete","studyLevel_update":"studyLevel_update","disciplineType_create":"disciplineType_create","discipline_create":"discipline_create","classInfo_create":"classInfo_create","classInfo_delete":"classInfo_delete","classInfo_openCourse":"classInfo_openCourse","classInfo_update":"classInfo_update","download_create":"download_create","download_delete":"download_delete","download_index":"download_index","download_update":"download_update","enroll_create":"enroll_create","enroll_import":"enroll_import","enroll_score":"enroll_score","enroll_delete":"enroll_delete","enroll_enter":"enroll_enter","enroll_update":"enroll_update","enroll_placement":"enroll_placement","userbc_check":"userbc_check","userbc_create":"userbc_create","userbc_delete":"userbc_delete","userbc_edit":"userbc_edit","userbc_import":"userbc_import","userbc_index":"userbc_index","user_register-term":"user_register-term","user_register-term-cancel":"user_register-term-cancel","user_register-term-register":"user_register-term-register","user_edit":"user_edit","user_index":"user_index","teachPlan_create":"teachPlan_create","teachPlan_delete":"teachPlan_delete","teachPlan_update":"teachPlan_update","teachPlanShlist_pass":"teachPlanShlist_pass","teachPlanSplist_pass":"teachPlanSplist_pass","teachPlanAdjust_pass":"teachPlanAdjust_pass","building_create":"building_create","building_delete":"building_delete","building_freeze":"building_freeze","building_taxis":"building_taxis","building_update":"building_update","roomType_create":"roomType_create","roomType_delete":"roomType_delete","roomType_taxis":"roomType_taxis","roomType_update":"roomType_update","room_create":"room_create","room_delete":"room_delete","room_taxis":"room_taxis","room_update":"room_update","teachingTask_create":"teachingTask_create","teachingTask_delete":"teachingTask_delete","teachingTask_update":"teachingTask_update","courseNum_create":"courseNum_create","courseNum_delete":"courseNum_delete","courseNum_update":"courseNum_update","handwork_create_class":"handwork_create_class","handwork_create_select":"handwork_create_select","handwork_delete":"handwork_delete","handwork_update":"handwork_update","handwork_view":"handwork_view","studyProgress_index":"studyProgress_index","coursetalk_delete":"coursetalk_delete","coursetalk_index":"coursetalk_index","coursetalk_reply":"coursetalk_reply","coursetalk_update":"coursetalk_update","quiz_index":"quiz_index","itemsbug_delete":"itemsbug_delete","itemsbug_export":"itemsbug_export","itemsbug_view":"itemsbug_view","resource_create":"resource_create","resource_delete":"resource_delete","resource_download":"resource_download","resource_view":"resource_view","score_create":"score_create","score_delete":"score_delete","score_index":"score_index","score_update":"score_update","waiver_create":"waiver_create","waiver_delete":"waiver_delete","waiver_index":"waiver_index","waiver_update":"waiver_update","replace_create":"replace_create","replace_delete":"replace_delete","replace_index":"replace_index","replace_update":"replace_update","testplan_create":"testplan_create","testplan_delete":"testplan_delete","testplan_edit":"testplan_edit","testplan_index":"testplan_index","examplan_create":"examplan_create","examplan_delete":"examplan_delete","examplan_exit":"examplan_exit","examplan_index":"examplan_index","makeup_index":"makeup_index","leave_degree-apply":"leave_degree-apply","leave_graduate":"leave_graduate","leave_back-school":"leave_back-school","leave_drop":"leave_drop","leave_back-school2":"leave_back-school2","leave_suspension":"leave_suspension","delete_engage":"delete_engage","update_engage":"update_engage","leave_change-roll":"leave_change-roll","leave_drop-create":"leave_drop-create","leave_graduate-create":"leave_graduate-create","leave_suspension-create":"leave_suspension-create","user_change-correspondence-create":"user_change-correspondence-create","leave_degree":"leave_degree","user_change-discipline":"user_change-discipline","user_change-discipline-do":"user_change-discipline-do","courseNature_create":"courseNature_create","courseNature_delete":"courseNature_delete","courseNature_freeze":"courseNature_freeze","courseNature_taxis":"courseNature_taxis","courseNature_update":"courseNature_update","courseType_create":"courseType_create","courseType_delete":"courseType_delete","courseType_freeze":"courseType_freeze","courseType_taxis":"courseType_taxis","courseType_update":"courseType_update","course_create":"course_create","course_delete":"course_delete","course_update":"course_update","knowledge_create":"knowledge_create","knowledge_delete":"knowledge_delete","knowledge_update":"knowledge_update","questiontype_view":"questiontype_view","questions_add":"questions_add","questions_del":"questions_del","questions_export":"questions_export","questions_update":"questions_update","questions_upload":"questions_upload","questions_view":"questions_view","coursetemplate_create":"coursetemplate_create","coursetemplate_delete":"coursetemplate_delete","coursetemplate_update":"coursetemplate_update","coursetemplate_view":"coursetemplate_view","phaseemplate_create":"phaseemplate_create","phaseemplate_delete":"phaseemplate_delete","phaseemplate_update":"phaseemplate_update","phaseemplate_view":"phaseemplate_view","yearsemplate_create":"yearsemplate_create","yearsemplate_delete":"yearsemplate_delete","yearsemplate_update":"yearsemplate_update","yearsemplate_view":"yearsemplate_view","teacher_create":"teacher_create","teacher_delete":"teacher_delete","teacher_update":"teacher_update","notice_create":"notice_create","notice_delete":"notice_delete","notice_edit":"notice_edit","count_student":"count_student","password_update":"password_update","log_restore":"log_restore","log_view":"log_view","shortcut_update":"shortcut_update","permission_create":"permission_create","permission_delete":"permission_delete","permission_update":"permission_update","role_create":"role_create","role_delete":"role_delete","role_permission":"role_permission","role_update":"role_update","menu_create":"menu_create","menu_delete":"menu_delete","menu_taxis":"menu_taxis","menu_update":"menu_update","admin_create":"admin_create","admin_delete":"admin_delete","admin_quickentry":"admin_quickentry","admin_update":"admin_update"},"menu":{"83":83,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9,"80":80,"24":24,"23":23,"25":25,"26":26,"27":27,"28":28,"14":14,"79":79,"16":16,"15":15,"37":37,"36":36,"38":38,"49":49,"50":50,"40":40,"42":42,"43":43,"48":48,"53":53,"54":54,"72":72,"71":71,"76":76,"77":77,"81":81,"82":82,"45":45,"44":44,"46":46,"47":47,"51":51,"52":52,"63":63,"39":39,"13":13,"22":22,"21":21,"61":61,"18":18,"41":41,"19":19,"10":10,"78":78,"11":11,"12":12,"65":65,"64":64,"66":66,"67":67,"68":68,"69":69,"70":70,"34":34,"33":33,"60":60,"73":73,"59":59,"58":58,"75":75,"29":29,"57":57,"74":74,"30":30,"31":31,"32":32,"35":35}}}', 20, 0),
(57, '广西科技大学', 'gxut', '{"driver":"mysqli","host":"10.82.97.41","database":"cj_gxut_db","login":"cj_gxut","password":"1sen161s2LkJCnye","charset":"utf8"}', NULL, '{"site_name":"\\u5e7f\\u897f\\u79d1\\u6280\\u5927\\u5b66\\u5b66\\u4e60\\u7cfb\\u7edf","lms_web_site_id":"34","upload_file":"upload_files\\/gxut","resource":"resources\\/public\\/lms","logo":"resources\\/gxut\\/lms\\/logo.jpg","college":"resources\\/gxut\\/lms\\/college.jpg","site_about":"\\u7684\\u5feb\\u9012\\u8d39","template":{"menu":{"1":{"name":"\\u9996\\u9875","url":"default\\/main"},"2":{"name":"\\u6211\\u7684\\u8bfe\\u7a0b","url":"course"},"3":{"name":"\\u6211\\u7684\\u7ec3\\u4e60","url":"phase"},"5":{"name":"\\u6d88\\u606f\\u4e2d\\u5fc3","url":"javascript:void(0);","son":{"5_1":{"name":"\\u901a\\u77e5\\u516c\\u544a","url":"message\\/notif"},"5_2":{"name":"\\u4e2a\\u4eba\\u6d88\\u606f","url":"message\\/mymessage"},"5_3":{"name":"\\u7cfb\\u7edf\\u6d88\\u606f","url":"message\\/sysmsg"}}},"6":{"name":"\\u77e5\\u8bc6\\u95ee\\u7b54","url":"catechism"},"7":{"name":"\\u4e2a\\u4eba\\u4fe1\\u606f","url":"info"},"8":{"name":"\\u6bd5\\u4e1a\\u8bbe\\u8ba1","url":"#"}}}}', '{"site_name":"\\u5e7f\\u897f\\u79d1\\u6280\\u5927\\u5b66\\u7ba1\\u7406\\u7cfb\\u7edf","sims_web_site_id":"34","upload_file":"upload_files\\/gxut","resource":"resources\\/public\\/sims","logo":"resources\\/gxut\\/sims\\/logo.jpg","background":"","template":{"perms":{"studentNumber_index":"studentNumber_index","studentNumber_update":"studentNumber_update","grade_create":"grade_create","grade_delete":"grade_delete","grade_update":"grade_update","term_create":"term_create","term_delete":"term_delete","term_update":"term_update","correspondence_create":"correspondence_create","studyType_create":"studyType_create","studyType_delete":"studyType_delete","studyType_update":"studyType_update","studyLevel_create":"studyLevel_create","studyLevel_delete":"studyLevel_delete","studyLevel_update":"studyLevel_update","disciplineType_create":"disciplineType_create","discipline_create":"discipline_create","classInfo_create":"classInfo_create","classInfo_delete":"classInfo_delete","classInfo_openCourse":"classInfo_openCourse","classInfo_update":"classInfo_update","download_create":"download_create","download_delete":"download_delete","download_index":"download_index","download_update":"download_update","enroll_create":"enroll_create","enroll_import":"enroll_import","enroll_score":"enroll_score","enroll_delete":"enroll_delete","enroll_enter":"enroll_enter","enroll_update":"enroll_update","enroll_placement":"enroll_placement","userbc_check":"userbc_check","userbc_create":"userbc_create","userbc_delete":"userbc_delete","userbc_edit":"userbc_edit","userbc_import":"userbc_import","userbc_index":"userbc_index","user_register-term":"user_register-term","user_register-term-cancel":"user_register-term-cancel","user_register-term-register":"user_register-term-register","user_edit":"user_edit","user_index":"user_index","teachPlan_create":"teachPlan_create","teachPlan_delete":"teachPlan_delete","teachPlan_update":"teachPlan_update","teachPlanShlist_pass":"teachPlanShlist_pass","teachPlanSplist_pass":"teachPlanSplist_pass","teachPlanAdjust_pass":"teachPlanAdjust_pass","building_create":"building_create","building_delete":"building_delete","building_freeze":"building_freeze","building_taxis":"building_taxis","building_update":"building_update","roomType_create":"roomType_create","roomType_delete":"roomType_delete","roomType_taxis":"roomType_taxis","roomType_update":"roomType_update","room_create":"room_create","room_delete":"room_delete","room_taxis":"room_taxis","room_update":"room_update","teachingTask_create":"teachingTask_create","teachingTask_delete":"teachingTask_delete","teachingTask_update":"teachingTask_update","courseNum_create":"courseNum_create","courseNum_delete":"courseNum_delete","courseNum_update":"courseNum_update","handwork_create_class":"handwork_create_class","handwork_create_select":"handwork_create_select","handwork_delete":"handwork_delete","handwork_update":"handwork_update","handwork_view":"handwork_view","studyProgress_index":"studyProgress_index","coursetalk_delete":"coursetalk_delete","coursetalk_index":"coursetalk_index","coursetalk_reply":"coursetalk_reply","coursetalk_update":"coursetalk_update","quiz_index":"quiz_index","itemsbug_delete":"itemsbug_delete","itemsbug_export":"itemsbug_export","itemsbug_view":"itemsbug_view","resource_create":"resource_create","resource_delete":"resource_delete","resource_download":"resource_download","resource_view":"resource_view","score_create":"score_create","score_delete":"score_delete","score_index":"score_index","score_update":"score_update","waiver_create":"waiver_create","waiver_delete":"waiver_delete","waiver_index":"waiver_index","waiver_update":"waiver_update","replace_create":"replace_create","replace_delete":"replace_delete","replace_index":"replace_index","replace_update":"replace_update","testplan_create":"testplan_create","testplan_delete":"testplan_delete","testplan_edit":"testplan_edit","testplan_index":"testplan_index","examplan_create":"examplan_create","examplan_delete":"examplan_delete","examplan_exit":"examplan_exit","examplan_index":"examplan_index","makeup_index":"makeup_index","leave_degree-apply":"leave_degree-apply","leave_graduate":"leave_graduate","leave_back-school":"leave_back-school","leave_drop":"leave_drop","leave_back-school2":"leave_back-school2","leave_suspension":"leave_suspension","delete_engage":"delete_engage","update_engage":"update_engage","leave_change-roll":"leave_change-roll","leave_drop-create":"leave_drop-create","leave_graduate-create":"leave_graduate-create","leave_suspension-create":"leave_suspension-create","user_change-correspondence-create":"user_change-correspondence-create","leave_degree":"leave_degree","user_change-discipline":"user_change-discipline","user_change-discipline-do":"user_change-discipline-do","courseNature_create":"courseNature_create","courseNature_delete":"courseNature_delete","courseNature_freeze":"courseNature_freeze","courseNature_taxis":"courseNature_taxis","courseNature_update":"courseNature_update","courseType_create":"courseType_create","courseType_delete":"courseType_delete","courseType_freeze":"courseType_freeze","courseType_taxis":"courseType_taxis","courseType_update":"courseType_update","course_create":"course_create","course_delete":"course_delete","course_update":"course_update","knowledge_create":"knowledge_create","knowledge_delete":"knowledge_delete","knowledge_update":"knowledge_update","questiontype_view":"questiontype_view","questions_add":"questions_add","questions_del":"questions_del","questions_export":"questions_export","questions_update":"questions_update","questions_upload":"questions_upload","questions_view":"questions_view","coursetemplate_create":"coursetemplate_create","coursetemplate_delete":"coursetemplate_delete","coursetemplate_update":"coursetemplate_update","coursetemplate_view":"coursetemplate_view","phaseemplate_create":"phaseemplate_create","phaseemplate_delete":"phaseemplate_delete","phaseemplate_update":"phaseemplate_update","phaseemplate_view":"phaseemplate_view","yearsemplate_create":"yearsemplate_create","yearsemplate_delete":"yearsemplate_delete","yearsemplate_update":"yearsemplate_update","yearsemplate_view":"yearsemplate_view","teacher_create":"teacher_create","teacher_delete":"teacher_delete","teacher_update":"teacher_update","notice_create":"notice_create","notice_delete":"notice_delete","notice_edit":"notice_edit","count_student":"count_student","password_update":"password_update","log_restore":"log_restore","log_view":"log_view","shortcut_update":"shortcut_update","permission_create":"permission_create","permission_delete":"permission_delete","permission_update":"permission_update","role_create":"role_create","role_delete":"role_delete","role_permission":"role_permission","role_update":"role_update","menu_create":"menu_create","menu_delete":"menu_delete","menu_taxis":"menu_taxis","menu_update":"menu_update","admin_create":"admin_create","admin_delete":"admin_delete","admin_quickentry":"admin_quickentry","admin_update":"admin_update"},"menu":{"83":83,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9,"80":80,"24":24,"23":23,"25":25,"26":26,"27":27,"28":28,"14":14,"79":79,"16":16,"15":15,"37":37,"36":36,"38":38,"49":49,"50":50,"40":40,"42":42,"43":43,"48":48,"53":53,"54":54,"72":72,"71":71,"76":76,"77":77,"81":81,"82":82,"45":45,"44":44,"46":46,"47":47,"51":51,"52":52,"63":63,"39":39,"13":13,"22":22,"21":21,"61":61,"18":18,"41":41,"19":19,"10":10,"78":78,"11":11,"12":12,"65":65,"64":64,"66":66,"67":67,"68":68,"69":69,"70":70,"34":34,"33":33,"60":60,"73":73,"59":59,"58":58,"75":75,"29":29,"57":57,"74":74,"30":30,"31":31,"32":32,"35":35}}}', 20, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sc_statistics`
--

CREATE TABLE IF NOT EXISTS `sc_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `y_month` varchar(100) DEFAULT NULL COMMENT '年月',
  `pr_name` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `contain` varchar(225) DEFAULT NULL COMMENT '记录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `sc_statistics`
--

INSERT INTO `sc_statistics` (`id`, `y_month`, `pr_name`, `contain`) VALUES
(17, '2016-08', '项目3', '58,60'),
(20, '2016-09', '项目3', '62'),
(21, '2017-01', '项目3', '64'),
(23, '2016-08', '项目4', '66'),
(24, '2016-10', '项目3', '67');

-- --------------------------------------------------------

--
-- 表的结构 `sc_template`
--

CREATE TABLE IF NOT EXISTS `sc_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(100) DEFAULT NULL COMMENT '模板名称',
  `lms_template` text COMMENT '学习系统模板信息',
  `sims_template` text COMMENT '管理系统模板信息',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '是否删除 0：未删除 1：已删除',
  `sims_perms` text COMMENT '管理系统权限 json格式',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `sc_template`
--

INSERT INTO `sc_template` (`id`, `name`, `lms_template`, `sims_template`, `is_delete`, `sims_perms`) VALUES
(21, 'ww', '{"menu":{"1":{"name":"\\u9996\\u9875","url":"default\\/main"}}}', '{"perms":{"ss_create":"ss_create","ss_son_create":"ss_son_create"},"menu":{"85":85,"87":87}}', 1, '{"85":["ss_create"],"87":["ss_son_create"]}'),
(20, '新的菜单测试', '{"menu":{"1":{"name":"\\u9996\\u9875","url":"default\\/main","menu_tag":"main"},"2":{"name":"\\u6211\\u7684\\u8bfe\\u7a0b","url":"course","menu_tag":"course"},"3":{"name":"\\u6211\\u7684\\u7ec3\\u4e60","url":"phase","menu_tag":"coursepractice"},"4":{"name":"\\u6559\\u52a1\\u8ba1\\u5212","url":"javascript:void(0);","menu_tag":"plan","son":{"4_1":{"name":"\\u6559\\u5b66\\u8ba1\\u5212","url":"planteach","menu_tag":"plan"},"4_2":{"name":"\\u6210\\u7ee9\\u67e5\\u8be2","url":"planscore","menu_tag":"plan"},"4_3":{"name":"\\u5b66\\u4e60\\u8fdb\\u5ea6","url":"learnprocess","menu_tag":"plan"}}},"5":{"name":"\\u6d88\\u606f\\u4e2d\\u5fc3","url":"javascript:void(0);","menu_tag":"message","son":{"5_1":{"name":"\\u901a\\u77e5\\u516c\\u544a","url":"message\\/notif","menu_tag":"message"},"5_2":{"name":"\\u4e2a\\u4eba\\u6d88\\u606f","url":"message\\/mymessage","menu_tag":"message"},"5_3":{"name":"\\u7cfb\\u7edf\\u6d88\\u606f","url":"message\\/sysmsg","menu_tag":"message"}}},"6":{"name":"\\u77e5\\u8bc6\\u95ee\\u7b54","url":"catechism","menu_tag":"catechism"},"7":{"name":"\\u4e2a\\u4eba\\u4fe1\\u606f","url":"info","menu_tag":"info"},"8":{"name":"\\u6bd5\\u4e1a\\u8bbe\\u8ba1","url":"#","menu_tag":""}}}', '{"perms":{"studentNumber_index":"studentNumber_index","studentNumber_update":"studentNumber_update","grade_create":"grade_create","grade_delete":"grade_delete","grade_update":"grade_update","term_create":"term_create","term_delete":"term_delete","term_update":"term_update","correspondence_create":"correspondence_create","studyType_create":"studyType_create","studyType_delete":"studyType_delete","studyType_update":"studyType_update","studyLevel_create":"studyLevel_create","studyLevel_delete":"studyLevel_delete","studyLevel_update":"studyLevel_update","disciplineType_create":"disciplineType_create","discipline_create":"discipline_create","classInfo_create":"classInfo_create","classInfo_delete":"classInfo_delete","classInfo_openCourse":"classInfo_openCourse","classInfo_update":"classInfo_update","download_create":"download_create","download_delete":"download_delete","download_index":"download_index","download_update":"download_update","enroll_create":"enroll_create","enroll_import":"enroll_import","enroll_score":"enroll_score","enroll_delete":"enroll_delete","enroll_enter":"enroll_enter","enroll_update":"enroll_update","enroll_placement":"enroll_placement","userbc_check":"userbc_check","userbc_create":"userbc_create","userbc_delete":"userbc_delete","userbc_edit":"userbc_edit","userbc_import":"userbc_import","userbc_index":"userbc_index","user_register-term":"user_register-term","user_register-term-cancel":"user_register-term-cancel","user_register-term-register":"user_register-term-register","user_edit":"user_edit","user_index":"user_index","teachPlan_create":"teachPlan_create","teachPlan_delete":"teachPlan_delete","teachPlan_update":"teachPlan_update","teachPlanShlist_pass":"teachPlanShlist_pass","teachPlanSplist_pass":"teachPlanSplist_pass","teachPlanAdjust_pass":"teachPlanAdjust_pass","building_create":"building_create","building_delete":"building_delete","building_freeze":"building_freeze","building_taxis":"building_taxis","building_update":"building_update","roomType_create":"roomType_create","roomType_delete":"roomType_delete","roomType_taxis":"roomType_taxis","roomType_update":"roomType_update","room_create":"room_create","room_delete":"room_delete","room_taxis":"room_taxis","room_update":"room_update","teachingTask_create":"teachingTask_create","teachingTask_delete":"teachingTask_delete","teachingTask_update":"teachingTask_update","courseNum_create":"courseNum_create","courseNum_delete":"courseNum_delete","courseNum_update":"courseNum_update","handwork_create_class":"handwork_create_class","handwork_create_select":"handwork_create_select","handwork_delete":"handwork_delete","handwork_update":"handwork_update","handwork_view":"handwork_view","studyProgress_index":"studyProgress_index","coursetalk_delete":"coursetalk_delete","coursetalk_index":"coursetalk_index","coursetalk_reply":"coursetalk_reply","coursetalk_update":"coursetalk_update","quiz_index":"quiz_index","itemsbug_delete":"itemsbug_delete","itemsbug_export":"itemsbug_export","itemsbug_view":"itemsbug_view","resource_create":"resource_create","resource_delete":"resource_delete","resource_download":"resource_download","resource_view":"resource_view","score_create":"score_create","score_delete":"score_delete","score_index":"score_index","score_update":"score_update","waiver_create":"waiver_create","waiver_delete":"waiver_delete","waiver_index":"waiver_index","waiver_update":"waiver_update","replace_create":"replace_create","replace_delete":"replace_delete","replace_index":"replace_index","replace_update":"replace_update","testplan_create":"testplan_create","testplan_delete":"testplan_delete","testplan_edit":"testplan_edit","testplan_index":"testplan_index","examplan_create":"examplan_create","examplan_delete":"examplan_delete","examplan_exit":"examplan_exit","examplan_index":"examplan_index","makeup_index":"makeup_index","leave_degree-apply":"leave_degree-apply","leave_graduate":"leave_graduate","leave_back-school":"leave_back-school","leave_drop":"leave_drop","leave_back-school2":"leave_back-school2","leave_suspension":"leave_suspension","delete_engage":"delete_engage","update_engage":"update_engage","leave_change-roll":"leave_change-roll","leave_drop-create":"leave_drop-create","leave_graduate-create":"leave_graduate-create","leave_suspension-create":"leave_suspension-create","user_change-correspondence-create":"user_change-correspondence-create","leave_degree":"leave_degree","user_change-discipline":"user_change-discipline","user_change-discipline-do":"user_change-discipline-do","courseNature_create":"courseNature_create","courseNature_delete":"courseNature_delete","courseNature_freeze":"courseNature_freeze","courseNature_taxis":"courseNature_taxis","courseNature_update":"courseNature_update","courseType_create":"courseType_create","courseType_delete":"courseType_delete","courseType_freeze":"courseType_freeze","courseType_taxis":"courseType_taxis","courseType_update":"courseType_update","course_create":"course_create","course_delete":"course_delete","course_update":"course_update","knowledge_create":"knowledge_create","knowledge_delete":"knowledge_delete","knowledge_update":"knowledge_update","questiontype_view":"questiontype_view","questions_add":"questions_add","questions_del":"questions_del","questions_export":"questions_export","questions_update":"questions_update","questions_upload":"questions_upload","questions_view":"questions_view","coursetemplate_create":"coursetemplate_create","coursetemplate_delete":"coursetemplate_delete","coursetemplate_update":"coursetemplate_update","coursetemplate_view":"coursetemplate_view","phaseemplate_create":"phaseemplate_create","phaseemplate_delete":"phaseemplate_delete","phaseemplate_update":"phaseemplate_update","phaseemplate_view":"phaseemplate_view","yearsemplate_create":"yearsemplate_create","yearsemplate_delete":"yearsemplate_delete","yearsemplate_update":"yearsemplate_update","yearsemplate_view":"yearsemplate_view","teacher_create":"teacher_create","teacher_delete":"teacher_delete","teacher_update":"teacher_update","notice_create":"notice_create","notice_delete":"notice_delete","notice_edit":"notice_edit","count_student":"count_student","password_update":"password_update","log_restore":"log_restore","log_view":"log_view","shortcut_update":"shortcut_update","permission_create":"permission_create","permission_delete":"permission_delete","permission_update":"permission_update","role_create":"role_create","role_delete":"role_delete","role_permission":"role_permission","role_update":"role_update","menu_create":"menu_create","menu_delete":"menu_delete","menu_taxis":"menu_taxis","menu_update":"menu_update","admin_quickentry":"admin_quickentry","admin_update":"admin_update"},"menu":{"83":83,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9,"80":80,"24":24,"23":23,"25":25,"26":26,"27":27,"28":28,"14":14,"79":79,"16":16,"15":15,"37":37,"36":36,"38":38,"49":49,"50":50,"40":40,"42":42,"43":43,"48":48,"53":53,"54":54,"72":72,"71":71,"76":76,"77":77,"81":81,"82":82,"45":45,"44":44,"46":46,"47":47,"51":51,"52":52,"63":63,"39":39,"13":13,"22":22,"21":21,"61":61,"18":18,"41":41,"19":19,"10":10,"78":78,"11":11,"12":12,"65":65,"64":64,"66":66,"67":67,"68":68,"69":69,"70":70,"34":34,"33":33,"60":60,"73":73,"59":59,"58":58,"75":75,"29":29,"57":57,"74":74,"30":30,"31":31,"32":32,"35":35}}', 0, '{"87":["ss_son_create"]}'),
(22, '测试菜单', '{"menu":{"2":{"name":"\\u6211\\u7684\\u8bfe\\u7a0b","url":"course","menu_tag":"course"}}}', '{"perms":{"studentNumber_index":"studentNumber_index","studentNumber_update":"studentNumber_update"},"menu":{"83":83,"1":1}}', 0, '{"83":["studentNumber_index"]}');

-- --------------------------------------------------------

--
-- 表的结构 `sc_worktime`
--

CREATE TABLE IF NOT EXISTS `sc_worktime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pr_id` int(100) DEFAULT NULL COMMENT '项目ID',
  `pr_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '项目名称',
  `person_id` int(11) NOT NULL COMMENT '工作人员ID',
  `day_time` int(20) DEFAULT NULL COMMENT '工时日期',
  `worktime` decimal(10,1) DEFAULT NULL COMMENT '工作时间',
  `notes` varchar(225) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `commit_time` int(100) DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- 转存表中的数据 `sc_worktime`
--

INSERT INTO `sc_worktime` (`id`, `pr_id`, `pr_name`, `person_id`, `day_time`, `worktime`, `notes`, `commit_time`) VALUES
(58, 14, '项目3', 1, 1471536000, '12.0', 'test', 1471571958),
(60, 14, '项目3', 1, 1471968000, '10.0', 'test', 1471571994),
(62, 14, '项目3', 5, 1474214400, '5.5', 'test', 1471572058),
(64, 14, '项目3', 1, 1503331200, '11.0', 'test', 1471851683),
(66, 15, '项目4', 1, 1471881600, '12.0', 'test', 1471924714),
(67, 14, '项目3', 1, 1477152000, '12.0', 'test', 1471929679);

-- --------------------------------------------------------

--
-- 表的结构 `sms_auth_item`
--

CREATE TABLE IF NOT EXISTS `sms_auth_item` (
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  `type` int(11) NOT NULL COMMENT '类型{1：角色；2：权限；}',
  `description` text COMMENT '描述',
  `rule_name` varchar(64) DEFAULT NULL COMMENT '规则名称',
  `data` text COMMENT '数据',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL COMMENT '权限所属菜单',
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  KEY `name` (`name`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理权权限条目';

--
-- 转存表中的数据 `sms_auth_item`
--

INSERT INTO `sms_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`, `menu_id`) VALUES
('admin_create', 2, '用户添加', NULL, NULL, NULL, NULL, 35),
('admin_delete', 2, '用户删除', NULL, NULL, NULL, NULL, 35),
('admin_quickentry', 2, '快捷入口设置', NULL, NULL, NULL, NULL, 35),
('admin_update', 2, '用户修改', NULL, NULL, NULL, NULL, 35),
('building_create', 2, '教学楼添加', NULL, NULL, NULL, NULL, 40),
('building_delete', 2, '教学楼删除', NULL, NULL, NULL, NULL, 40),
('building_freeze', 2, '教学楼冻结', NULL, NULL, NULL, NULL, 40),
('building_taxis', 2, '教学楼排序', NULL, NULL, NULL, NULL, 40),
('building_update', 2, '教学楼修改', NULL, NULL, NULL, NULL, 40),
('classInfo_create', 2, '班级添加', NULL, NULL, NULL, NULL, 9),
('classInfo_delete', 2, '班级删除', NULL, NULL, NULL, NULL, 9),
('classInfo_openCourse', 2, '开课', NULL, NULL, NULL, NULL, 9),
('classInfo_update', 2, '班级修改', NULL, NULL, NULL, NULL, 9),
('correspondence_create', 2, '函授站添加', NULL, NULL, NULL, NULL, 4),
('count_student', 2, '学生统计查看', NULL, NULL, NULL, NULL, 59),
('courseNature_create', 2, '课程性质添加', NULL, NULL, NULL, NULL, 10),
('courseNature_delete', 2, '课程性质删除', NULL, NULL, NULL, NULL, 10),
('courseNature_freeze', 2, '课程性质冻结', NULL, NULL, NULL, NULL, 10),
('courseNature_taxis', 2, '课程性质排序', NULL, NULL, NULL, NULL, 10),
('courseNature_update', 2, '课程性质修改', NULL, NULL, NULL, NULL, 10),
('courseNum_create', 2, '添加上课节次', NULL, NULL, NULL, NULL, 53),
('courseNum_delete', 2, '删除上课节次', NULL, NULL, NULL, NULL, 53),
('courseNum_update', 2, '更新上课节次', NULL, NULL, NULL, NULL, 53),
('coursetalk_delete', 2, '课堂讨论删除', NULL, NULL, NULL, NULL, 76),
('coursetalk_index', 2, '课堂讨论查看', NULL, NULL, NULL, NULL, 76),
('coursetalk_reply', 2, '课堂讨论回复', NULL, NULL, NULL, NULL, 76),
('coursetalk_update', 2, '课堂讨论更新', NULL, NULL, NULL, NULL, 76),
('coursetemplate_create', 2, '课程作业添加', NULL, NULL, NULL, NULL, 68),
('coursetemplate_delete', 2, '课程作业删除', NULL, NULL, NULL, NULL, 68),
('coursetemplate_update', 2, '课程作业修改', NULL, NULL, NULL, NULL, 68),
('coursetemplate_view', 2, '课程作业查看', NULL, NULL, NULL, NULL, 68),
('courseType_create', 2, '课程类型添加', NULL, NULL, NULL, NULL, 11),
('courseType_delete', 2, '课程类型删除', NULL, NULL, NULL, NULL, 11),
('courseType_freeze', 2, '课程类型冻结', NULL, NULL, NULL, NULL, 11),
('courseType_taxis', 2, '课程类型排序', NULL, NULL, NULL, NULL, 11),
('courseType_update', 2, '课程类型修改', NULL, NULL, NULL, NULL, 11),
('course_create', 2, '课程添加', NULL, NULL, NULL, NULL, 12),
('course_delete', 2, '课程删除', NULL, NULL, NULL, NULL, 12),
('course_update', 2, '课程修改', NULL, NULL, NULL, NULL, 12),
('delete_engage', 2, '删除进修学生', NULL, NULL, NULL, NULL, 61),
('disciplineType_create', 2, '专业类别添加', NULL, NULL, NULL, NULL, 7),
('discipline_create', 2, '专业添加', NULL, NULL, 1442477748, 1442477748, 8),
('download_create', 2, '资料增加', NULL, NULL, NULL, NULL, 80),
('download_delete', 2, '资料删除', NULL, NULL, NULL, NULL, 80),
('download_index', 2, '资料查看', NULL, NULL, NULL, NULL, 80),
('download_update', 2, '资料更新', NULL, NULL, NULL, NULL, 80),
('enroll_create', 2, '成考报名', NULL, NULL, NULL, NULL, 24),
('enroll_delete', 2, '删除录取', NULL, NULL, NULL, NULL, 27),
('enroll_enter', 2, '成考录取', NULL, NULL, NULL, NULL, 27),
('enroll_import', 2, '报名导入', NULL, NULL, NULL, NULL, 25),
('enroll_placement', 2, '分班', NULL, NULL, NULL, NULL, 28),
('enroll_score', 2, '成绩导入', NULL, NULL, NULL, NULL, 26),
('enroll_update', 2, '录取修改', NULL, NULL, NULL, NULL, 27),
('examplan_create', 2, '添加考场安排', NULL, NULL, NULL, NULL, 52),
('examplan_delete', 2, '删除考场安排', NULL, NULL, NULL, NULL, 52),
('examplan_exit', 2, '修改考场安排', NULL, NULL, NULL, NULL, 52),
('examplan_index', 2, '查询考场安排', NULL, NULL, NULL, NULL, 52),
('grade_create', 2, '年级添加', NULL, NULL, NULL, NULL, 2),
('grade_delete', 2, '年级删除', NULL, NULL, NULL, NULL, 2),
('grade_update', 2, '年级修改', NULL, NULL, NULL, NULL, 2),
('handwork_create_class', 2, '按班级排课', NULL, NULL, NULL, NULL, 54),
('handwork_create_select', 2, '排选修课', NULL, NULL, NULL, NULL, 54),
('handwork_delete', 2, '删除排课', NULL, NULL, NULL, NULL, 54),
('handwork_update', 2, '修改排课', NULL, NULL, NULL, NULL, 54),
('handwork_view', 2, '查看排课表', NULL, NULL, NULL, NULL, 54),
('itemsbug_delete', 2, '课程纠错删除', NULL, NULL, NULL, NULL, 81),
('itemsbug_export', 2, '课程纠错导出', NULL, NULL, NULL, NULL, 81),
('itemsbug_view', 2, '课程纠错查看', NULL, NULL, NULL, NULL, 81),
('knowledge_create', 2, '知识点添加', NULL, NULL, NULL, NULL, 65),
('knowledge_delete', 2, '知识点删除', NULL, NULL, NULL, NULL, 65),
('knowledge_update', 2, '知识点修改', NULL, NULL, NULL, NULL, 65),
('leave_back-school', 2, '退学学生复学', NULL, NULL, NULL, NULL, 22),
('leave_back-school2', 2, '休学学生复学', NULL, NULL, NULL, NULL, 21),
('leave_change-roll', 2, '学籍异动', NULL, NULL, NULL, NULL, 18),
('leave_degree', 2, '学位管理查看', NULL, NULL, NULL, NULL, 41),
('leave_degree-apply', 2, '学位申请', NULL, NULL, NULL, NULL, 39),
('leave_drop', 2, '退学学生', NULL, NULL, NULL, NULL, 22),
('leave_drop-create', 2, '退学学生添加', NULL, NULL, NULL, NULL, 18),
('leave_graduate', 2, '毕业学生', NULL, NULL, NULL, NULL, 39),
('leave_graduate-create', 2, '毕业学生添加', NULL, NULL, NULL, NULL, 18),
('leave_suspension', 2, '休学学生', NULL, NULL, NULL, NULL, 21),
('leave_suspension-create', 2, '休学学生添加', NULL, NULL, NULL, NULL, 18),
('log_restore', 2, '日志恢复', NULL, NULL, NULL, NULL, 57),
('log_view', 2, '日志查看', NULL, NULL, NULL, NULL, 57),
('makeup_index', 2, '补考成绩查看', NULL, NULL, NULL, NULL, 63),
('menu_create', 2, '菜单添加', NULL, NULL, NULL, NULL, 32),
('menu_delete', 2, '菜单删除', NULL, NULL, NULL, NULL, 32),
('menu_taxis', 2, '菜单排序', NULL, NULL, NULL, NULL, 32),
('menu_update', 2, '菜单修改', NULL, NULL, NULL, NULL, 32),
('notice_create', 2, '添加通知公告', NULL, NULL, NULL, NULL, 60),
('notice_delete', 2, '删除通知公告', NULL, NULL, NULL, NULL, 60),
('notice_edit', 2, '编辑通知公告', NULL, NULL, NULL, NULL, 60),
('password_update', 2, '修改密码', NULL, NULL, NULL, NULL, 75),
('permission_create', 2, '权限添加', NULL, NULL, NULL, NULL, 30),
('permission_delete', 2, '权限删除', NULL, NULL, NULL, NULL, 30),
('permission_update', 2, '权限修改', NULL, NULL, NULL, NULL, 30),
('phaseemplate_create', 2, '预测模拟添加', NULL, NULL, NULL, NULL, 69),
('phaseemplate_delete', 2, '预测模拟删除', NULL, NULL, NULL, NULL, 69),
('phaseemplate_update', 2, '预测模拟修改', NULL, NULL, NULL, NULL, 69),
('phaseemplate_view', 2, '预测模拟查看', NULL, NULL, NULL, NULL, 69),
('questions_add', 2, '题库添加', NULL, NULL, NULL, NULL, 67),
('questions_del', 2, '题库删除', NULL, NULL, NULL, NULL, 67),
('questions_export', 2, '题库导出', NULL, NULL, NULL, NULL, 67),
('questions_update', 2, '题库修改', NULL, NULL, NULL, NULL, 67),
('questions_upload', 2, '题库导入', NULL, NULL, NULL, NULL, 67),
('questions_view', 2, '题库查看', NULL, NULL, NULL, NULL, 67),
('questiontype_view', 2, '题型查看', NULL, NULL, NULL, NULL, 66),
('quiz_index', 2, '查看问答管理', NULL, NULL, NULL, NULL, 77),
('replace_create', 2, '证书顶替添加', NULL, NULL, NULL, NULL, 47),
('replace_delete', 2, '证书顶替删除', NULL, NULL, NULL, NULL, 47),
('replace_index', 2, '证书顶替查看', NULL, NULL, NULL, NULL, 47),
('replace_update', 2, '证书顶替修改', NULL, NULL, NULL, NULL, 47),
('resource_create', 2, '资源管理添加', NULL, NULL, NULL, NULL, 82),
('resource_delete', 2, '资料删除', NULL, NULL, NULL, NULL, 82),
('resource_download', 2, '资源管理下载', NULL, NULL, NULL, NULL, 82),
('resource_view', 2, '资源管理查看', NULL, NULL, NULL, NULL, 82),
('role_create', 2, '角色添加', NULL, NULL, NULL, NULL, 31),
('role_delete', 2, '角色删除', NULL, NULL, NULL, NULL, 31),
('role_permission', 2, '角色权限设置', NULL, NULL, NULL, NULL, 31),
('role_update', 2, '角色修改', NULL, NULL, NULL, NULL, 31),
('roomType_create', 2, '教室类型添加', NULL, NULL, NULL, NULL, 42),
('roomType_delete', 2, '教室类型删除', NULL, NULL, NULL, NULL, 42),
('roomType_taxis', 2, '教室类型排序', NULL, NULL, NULL, NULL, 42),
('roomType_update', 2, '教室类型修改', NULL, NULL, NULL, NULL, 42),
('room_create', 2, '教室添加', NULL, NULL, NULL, NULL, 43),
('room_delete', 2, '教室删除', NULL, NULL, NULL, NULL, 43),
('room_taxis', 2, '教室排序', NULL, NULL, NULL, NULL, 43),
('room_update', 2, '教室修改', NULL, NULL, NULL, NULL, 43),
('score_create', 2, '成绩添加', NULL, NULL, NULL, NULL, 45),
('score_delete', 2, '成绩删除', NULL, NULL, NULL, NULL, 45),
('score_index', 2, '成绩管理查看', NULL, NULL, NULL, NULL, 45),
('score_update', 2, '成绩修改', NULL, NULL, NULL, NULL, 45),
('shortcut_update', 2, '设置快捷方式', NULL, NULL, NULL, NULL, 74),
('studentNumber_index', 2, '查看生成规则', NULL, NULL, NULL, NULL, 83),
('studentNumber_update', 2, '修改学号生成规则', NULL, NULL, NULL, NULL, 83),
('studyLevel_create', 2, '学习层次添加', NULL, NULL, NULL, NULL, 6),
('studyLevel_delete', 2, '学习层次删除', NULL, NULL, NULL, NULL, 6),
('studyLevel_update', 2, '学习层次更新', NULL, NULL, NULL, NULL, 6),
('studyProgress_index', 2, '查看学习过程', NULL, NULL, NULL, NULL, 72),
('studyTypeTest_create', 2, '测试模板添加', NULL, NULL, NULL, NULL, 55),
('studyType_create', 2, '学习类型添加', NULL, NULL, NULL, NULL, 5),
('studyType_delete', 2, '学习类型删除', NULL, NULL, NULL, NULL, 5),
('studyType_update', 2, '学习类型更新', NULL, NULL, NULL, NULL, 5),
('teacher_create', 2, '教师添加', NULL, NULL, NULL, NULL, 34),
('teacher_delete', 2, '教师删除', NULL, NULL, NULL, NULL, 34),
('teacher_update', 2, '教师修改', NULL, NULL, NULL, NULL, 34),
('teachingTask_create', 2, '教学任务添加', NULL, NULL, NULL, NULL, 48),
('teachingTask_delete', 2, '教学任务删除', NULL, NULL, NULL, NULL, 48),
('teachingTask_update', 2, '教学任务修改', NULL, NULL, NULL, NULL, 48),
('teachPlanAdjust_pass', 2, '教学计划调整', NULL, NULL, NULL, NULL, 50),
('teachPlanShlist_pass', 2, '教学计划审核', NULL, NULL, NULL, NULL, 38),
('teachPlanSplist_pass', 2, '教学计划审批', NULL, NULL, NULL, NULL, 49),
('teachPlan_create', 2, '添加教学计划', NULL, NULL, NULL, NULL, 37),
('teachPlan_delete', 2, '删除教学计划', NULL, NULL, NULL, NULL, 37),
('teachPlan_update', 2, '修改教学计划', NULL, NULL, NULL, NULL, 37),
('term_create', 2, '学期添加', NULL, NULL, 1, NULL, 3),
('term_delete', 2, '学期删除', NULL, NULL, NULL, NULL, 3),
('term_update', 2, '学期修改', NULL, NULL, NULL, NULL, 3),
('testplan_create', 2, '添加考试计划', NULL, NULL, NULL, NULL, 51),
('testplan_delete', 2, '删除考试计划', NULL, NULL, NULL, NULL, 51),
('testplan_edit', 2, '修改考试计划', NULL, NULL, NULL, NULL, 51),
('testplan_index', 2, '查询考试计划', NULL, NULL, NULL, NULL, 51),
('update_engage', 2, '修改进修学生', NULL, NULL, NULL, NULL, 61),
('userbc_check', 2, '学生录入审核', NULL, NULL, NULL, NULL, 14),
('userbc_create', 2, '学生添加', NULL, NULL, NULL, NULL, 14),
('userbc_delete', 2, '学生删除', NULL, NULL, NULL, NULL, 14),
('userbc_edit', 2, '学生修改', NULL, NULL, NULL, NULL, 14),
('userbc_import', 2, '学生批量导入', NULL, NULL, NULL, NULL, 14),
('userbc_index', 2, '学生录入查看', NULL, NULL, NULL, NULL, 14),
('user_change-correspondence-create', 2, '转函授点添加', NULL, NULL, NULL, NULL, 18),
('user_change-discipline', 2, '转专业查看', NULL, NULL, NULL, NULL, 19),
('user_change-discipline-do', 2, '转专业添加', NULL, NULL, NULL, NULL, 19),
('user_degree', 2, '学位管理', NULL, NULL, NULL, NULL, 17),
('user_edit', 2, '学生修改', NULL, NULL, NULL, NULL, 15),
('user_index', 2, '学生管理查看', NULL, NULL, NULL, NULL, 15),
('user_register-term', 2, '学期注册查看', NULL, NULL, NULL, NULL, 16),
('user_register-term-cancel', 2, '取消注册', NULL, NULL, NULL, NULL, 16),
('user_register-term-register', 2, '注册学期', NULL, NULL, NULL, NULL, 16),
('waiver_create', 2, '免考免修添加', NULL, NULL, NULL, NULL, 46),
('waiver_delete', 2, '免考免修删除', NULL, NULL, NULL, NULL, 46),
('waiver_index', 2, '免考免修查看', NULL, NULL, NULL, NULL, 46),
('waiver_update', 2, '免考免修更新', NULL, NULL, NULL, NULL, 46),
('yearsemplate_create', 2, '历年真题添加', NULL, NULL, NULL, NULL, 70),
('yearsemplate_delete', 2, '历年真题删除', NULL, NULL, NULL, NULL, 70),
('yearsemplate_update', 2, '历年真题修改', NULL, NULL, NULL, NULL, 70),
('yearsemplate_view', 2, '历年真题查看', NULL, NULL, NULL, NULL, 70),
('zongadming', 1, '总管理员', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sms_menu`
--

CREATE TABLE IF NOT EXISTS `sms_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '名称',
  `parent` int(11) DEFAULT '0' COMMENT '上级菜单',
  `route` varchar(256) DEFAULT NULL,
  `taxis` int(11) DEFAULT '0' COMMENT '排序字段 默认0,以数字倒序排列',
  `data` text,
  `url` varchar(100) DEFAULT NULL COMMENT '菜单链接地址',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `name` (`name`),
  KEY `route` (`route`(255)),
  KEY `order` (`taxis`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统管理员菜单权限表\r\n' AUTO_INCREMENT=84 ;

--
-- 转存表中的数据 `sms_menu`
--

INSERT INTO `sms_menu` (`id`, `name`, `parent`, `route`, `taxis`, `data`, `url`) VALUES
(1, '基础管理', 0, NULL, 100, NULL, ''),
(2, '年级管理', 1, NULL, NULL, NULL, 'grade/index'),
(3, '学期管理', 1, NULL, NULL, NULL, 'term/index'),
(4, '函授站管理', 1, NULL, NULL, NULL, 'correspondence/index'),
(5, '学习类型', 1, NULL, NULL, NULL, 'study-type/index'),
(6, '学习层次', 1, NULL, NULL, NULL, 'study-level/index'),
(7, '专业类别管理', 1, NULL, NULL, NULL, 'discipline-type/index'),
(8, '专业管理', 1, NULL, NULL, NULL, 'discipline/index'),
(9, '班级管理', 1, NULL, NULL, NULL, 'class-info/index'),
(10, '课程性质', 78, NULL, NULL, NULL, 'course-nature/index'),
(11, '课程类型', 78, NULL, NULL, NULL, 'course-type/index'),
(12, '课程设置', 78, NULL, NULL, NULL, 'course/index'),
(13, '学籍管理', 0, NULL, 70, NULL, ''),
(14, '学生录入', 79, NULL, 11, NULL, 'userbc/index'),
(15, '学生管理', 79, NULL, 9, NULL, 'user/index'),
(16, '学期注册', 79, NULL, 10, NULL, 'user/register-term'),
(18, '学籍异动', 13, NULL, 4, NULL, 'leave/change-roll'),
(19, '转专业', 13, NULL, 1, NULL, 'user/change-discipline'),
(20, '转函授站', 13, NULL, 2, NULL, 'user/change-correspondence'),
(21, '休学学生', 13, NULL, 6, NULL, 'leave/suspension'),
(22, '退学学生', 13, NULL, 7, NULL, 'leave/drop'),
(23, '招生管理', 0, NULL, 95, NULL, ''),
(24, '成考报名', 23, NULL, NULL, NULL, 'enroll/create'),
(25, '报名导入', 23, NULL, NULL, NULL, 'enroll/import'),
(26, '成绩管理', 23, NULL, NULL, NULL, 'enroll/score'),
(27, '录取管理', 23, NULL, NULL, NULL, 'enroll/enter'),
(28, '分班管理', 23, NULL, NULL, NULL, 'enroll/placement'),
(29, '系统设置', 0, NULL, 40, NULL, ''),
(30, '权限管理', 29, NULL, NULL, NULL, 'permission-form/index'),
(31, '角色管理', 29, NULL, NULL, NULL, 'role-form/index'),
(32, '菜单管理', 29, NULL, NULL, NULL, 'menu/index'),
(33, '教师管理', 0, NULL, 55, NULL, ''),
(34, '教师管理', 33, NULL, NULL, NULL, 'teacher/index'),
(35, '用户管理', 29, NULL, NULL, NULL, 'admin/index'),
(36, '教学管理', 0, NULL, 85, NULL, ''),
(37, '教学计划起草', 36, NULL, 100, NULL, 'teach-plan/index'),
(38, '教学计划审核', 36, NULL, 95, NULL, 'teach-plan/shlist'),
(39, '毕业学生', 13, NULL, 8, NULL, 'leave/graduate'),
(40, '教学楼管理', 36, NULL, 80, NULL, 'building/index'),
(41, '学位管理', 13, NULL, 3, NULL, 'leave/degree'),
(42, '教室类型管理', 36, NULL, 75, NULL, 'room-type/index'),
(43, '教室管理', 36, NULL, 70, NULL, 'room/index'),
(44, '考务管理', 0, NULL, 75, NULL, ''),
(45, '成绩管理', 44, NULL, NULL, NULL, 'score/index'),
(46, '免考免修', 44, NULL, NULL, NULL, 'waiver/index'),
(47, '证书顶替', 44, NULL, NULL, NULL, 'replace/index'),
(48, '开课管理', 36, NULL, 60, NULL, 'teaching-task/index'),
(49, '教学计划审批', 36, NULL, 90, NULL, 'teach-plan/splist'),
(50, '教学计划调整', 36, NULL, 85, NULL, 'teach-plan/adjust'),
(51, '考试计划', 44, NULL, NULL, NULL, 'testplan/index'),
(52, '考场安排', 44, NULL, NULL, NULL, 'testplan-room/index'),
(53, '设置上课节次', 36, NULL, 50, NULL, 'course-num/index'),
(54, '手动排课', 36, NULL, 10, NULL, 'handwork/index'),
(57, '日志管理', 29, NULL, 1, NULL, 'log/index'),
(58, '统计管理', 0, NULL, 45, NULL, ''),
(59, '学生统计', 58, NULL, NULL, NULL, 'count-management/student'),
(60, '通知公告', 73, NULL, 1, NULL, 'notice/index'),
(61, '进修学生', 13, NULL, 5, NULL, 'engage/index'),
(63, '补考管理', 44, NULL, NULL, NULL, 'makeup/index'),
(64, '题库管理', 0, NULL, 60, NULL, ''),
(65, '知识点管理', 64, NULL, NULL, NULL, 'knowledge/index'),
(66, '题型管理', 64, NULL, NULL, NULL, 'question-type/index'),
(67, '题库详情', 64, NULL, NULL, NULL, 'questions/list'),
(68, '课程作业模板', 64, NULL, NULL, NULL, 'course-practice/index'),
(69, '预测模拟模板', 64, NULL, NULL, NULL, 'phase/index'),
(70, '历年真题模板', 64, NULL, NULL, NULL, 'years/index'),
(71, '学习管理', 0, NULL, 80, NULL, ''),
(72, '学习过程', 71, NULL, NULL, NULL, 'study-manage/index'),
(73, '消息中心', 0, NULL, 50, NULL, ''),
(74, '设置快捷方式', 29, NULL, 1, NULL, 'shortcut/index'),
(75, '修改密码', 29, NULL, 2, NULL, 'admin/edit-password'),
(76, '课堂讨论', 71, NULL, NULL, NULL, 'course-talk/index'),
(77, '问答管理', 71, NULL, NULL, NULL, 'quiz/index'),
(78, '课程管理', 0, NULL, 65, NULL, ''),
(79, '学生管理', 0, NULL, 90, NULL, ''),
(80, '资料下载', 1, NULL, NULL, NULL, 'download/index'),
(81, '课程纠错', 71, NULL, NULL, NULL, 'items-bug/index'),
(82, '资源管理', 71, NULL, NULL, NULL, 'resource/index'),
(83, '学号生成规则', 1, NULL, 0, NULL, 'student-number/index');

--
-- 限制导出的表
--

--
-- 限制表 `sc_auth_assignment`
--
ALTER TABLE `sc_auth_assignment`
  ADD CONSTRAINT `sc_auth_assignment_ibfk_2` FOREIGN KEY (`item_name`) REFERENCES `sc_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `sc_auth_item`
--
ALTER TABLE `sc_auth_item`
  ADD CONSTRAINT `sc_auth_item_ibfk_2` FOREIGN KEY (`rule_name`) REFERENCES `sc_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
