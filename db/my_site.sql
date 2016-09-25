/*
Navicat MySQL Data Transfer

Source Server         : 本地连接5.0
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : my_site

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-08-02 13:44:25
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `sc_admin`
-- ----------------------------
DROP TABLE IF EXISTS `sc_admin`;
CREATE TABLE `sc_admin` (
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
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_admin
-- ----------------------------
INSERT INTO sc_admin VALUES ('1', 'admin', '96e79218965eb72c92a549dd5a330112', '超级管理员', '1', null, 'zongadming', '0', '{\"2\":{\"id\":2,\"name\":\"\\u5e74\\u7ea7\\u7ba1\\u7406\",\"url\":\"grade\\/index\"},\"3\":{\"id\":3,\"name\":\"\\u5b66\\u671f\\u7ba1\\u7406\",\"url\":\"term\\/index\"},\"4\":{\"id\":4,\"name\":\"\\u51fd\\u6388\\u7ad9\\u7ba1\\u7406\",\"url\":\"correspondence\\/index\"},\"12\":{\"id\":12,\"name\":\"\\u8bfe\\u7a0b\\u8bbe\\u7f6e\",\"url\":\"course\\/index\"},\"34\":{\"id\":34,\"name\":\"\\u6559\\u5e08\\u7ba1\\u7406\",\"url\":\"teacher\\/index\"}}', '', '');

-- ----------------------------
-- Table structure for `sc_auth_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `sc_auth_assignment`;
CREATE TABLE `sc_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `created_at` (`created_at`),
  KEY `item_name` (`item_name`),
  CONSTRAINT `sc_auth_assignment_ibfk_2` FOREIGN KEY (`item_name`) REFERENCES `sc_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员授权表';

-- ----------------------------
-- Records of sc_auth_assignment
-- ----------------------------
INSERT INTO sc_auth_assignment VALUES ('jiaowu', '112', '1444274494');
INSERT INTO sc_auth_assignment VALUES ('zongadming', '109', '1444274510');
INSERT INTO sc_auth_assignment VALUES ('jiaowu', '111', '1444274529');
INSERT INTO sc_auth_assignment VALUES ('zongadming', '114', '1454310979');
INSERT INTO sc_auth_assignment VALUES ('teacher', '113', '1454311026');
INSERT INTO sc_auth_assignment VALUES ('zongadming', '115', '1454339913');
INSERT INTO sc_auth_assignment VALUES ('jiaowu', '116', '1454593211');
INSERT INTO sc_auth_assignment VALUES ('zongadming', '1', '1456122308');
INSERT INTO sc_auth_assignment VALUES ('jiaowu', '117', '1456846740');
INSERT INTO sc_auth_assignment VALUES ('jiaowu', '118', '1456846765');
INSERT INTO sc_auth_assignment VALUES ('jiaowu', '119', '1456846820');

-- ----------------------------
-- Table structure for `sc_auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `sc_auth_item`;
CREATE TABLE `sc_auth_item` (
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
  KEY `created_at` (`created_at`),
  CONSTRAINT `sc_auth_item_ibfk_2` FOREIGN KEY (`rule_name`) REFERENCES `sc_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理权权限条目';

-- ----------------------------
-- Records of sc_auth_item
-- ----------------------------
INSERT INTO sc_auth_item VALUES ('admin_create', '2', '用户添加', null, null, null, null, '35');
INSERT INTO sc_auth_item VALUES ('admin_delete', '2', '用户删除', null, null, null, null, '35');
INSERT INTO sc_auth_item VALUES ('admin_quickentry', '2', '快捷入口设置', null, null, null, null, '35');
INSERT INTO sc_auth_item VALUES ('admin_update', '2', '用户修改', null, null, null, null, '35');
INSERT INTO sc_auth_item VALUES ('jiaowu', '1', '教务管理员', null, null, null, null, null);
INSERT INTO sc_auth_item VALUES ('menu_create', '2', '菜单添加', null, null, null, null, '32');
INSERT INTO sc_auth_item VALUES ('menu_delete', '2', '菜单删除', null, null, null, null, '32');
INSERT INTO sc_auth_item VALUES ('menu_taxis', '2', '菜单排序', null, null, null, null, '32');
INSERT INTO sc_auth_item VALUES ('menu_update', '2', '菜单修改', null, null, null, null, '32');
INSERT INTO sc_auth_item VALUES ('password_update', '2', '修改密码', null, null, null, null, '75');
INSERT INTO sc_auth_item VALUES ('permission_create', '2', '权限添加', null, null, null, null, '30');
INSERT INTO sc_auth_item VALUES ('permission_delete', '2', '权限删除', null, null, null, null, '30');
INSERT INTO sc_auth_item VALUES ('permission_update', '2', '权限修改', null, null, null, null, '30');
INSERT INTO sc_auth_item VALUES ('role_create', '2', '角色添加', null, null, null, null, '31');
INSERT INTO sc_auth_item VALUES ('role_delete', '2', '角色删除', null, null, null, null, '31');
INSERT INTO sc_auth_item VALUES ('role_permission', '2', '角色权限设置', null, null, null, null, '31');
INSERT INTO sc_auth_item VALUES ('role_update', '2', '角色修改', null, null, null, null, '31');
INSERT INTO sc_auth_item VALUES ('shortcut_update', '2', '设置快捷方式', null, null, null, null, '74');
INSERT INTO sc_auth_item VALUES ('teacher', '1', '任课老师', null, null, null, null, null);
INSERT INTO sc_auth_item VALUES ('zongadming', '1', '总管理员', null, null, null, null, null);

-- ----------------------------
-- Table structure for `sc_auth_item_child`
-- ----------------------------
DROP TABLE IF EXISTS `sc_auth_item_child`;
CREATE TABLE `sc_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员权限关系表';

-- ----------------------------
-- Records of sc_auth_item_child
-- ----------------------------
INSERT INTO sc_auth_item_child VALUES ('zongadming', 'admin_create');
INSERT INTO sc_auth_item_child VALUES ('zongadming', 'admin_delete');
INSERT INTO sc_auth_item_child VALUES ('zongadming', 'admin_quickentry');
INSERT INTO sc_auth_item_child VALUES ('zongadming', 'admin_update');
INSERT INTO sc_auth_item_child VALUES ('teacher', 'enroll_score');
INSERT INTO sc_auth_item_child VALUES ('zongadming', 'menu_create');
INSERT INTO sc_auth_item_child VALUES ('zongadming', 'menu_delete');
INSERT INTO sc_auth_item_child VALUES ('zongadming', 'menu_taxis');
INSERT INTO sc_auth_item_child VALUES ('zongadming', 'menu_update');
INSERT INTO sc_auth_item_child VALUES ('teacher', 'notice_create');
INSERT INTO sc_auth_item_child VALUES ('teacher', 'notice_delete');
INSERT INTO sc_auth_item_child VALUES ('teacher', 'notice_edit');
INSERT INTO sc_auth_item_child VALUES ('zongadming', 'password_update');
INSERT INTO sc_auth_item_child VALUES ('zongadming', 'permission_create');
INSERT INTO sc_auth_item_child VALUES ('zongadming', 'permission_delete');
INSERT INTO sc_auth_item_child VALUES ('zongadming', 'permission_update');
INSERT INTO sc_auth_item_child VALUES ('zongadming', 'role_create');
INSERT INTO sc_auth_item_child VALUES ('zongadming', 'role_delete');
INSERT INTO sc_auth_item_child VALUES ('zongadming', 'role_permission');
INSERT INTO sc_auth_item_child VALUES ('zongadming', 'role_update');
INSERT INTO sc_auth_item_child VALUES ('zongadming', 'shortcut_update');

-- ----------------------------
-- Table structure for `sc_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `sc_auth_rule`;
CREATE TABLE `sc_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `name` (`name`),
  KEY `created_at` (`created_at`),
  KEY `updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员权限规则表';

-- ----------------------------
-- Records of sc_auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `sc_domain`
-- ----------------------------
DROP TABLE IF EXISTS `sc_domain`;
CREATE TABLE `sc_domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `domain` varchar(255) DEFAULT NULL COMMENT '域名',
  `site_id` int(11) DEFAULT NULL COMMENT '站点表id',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '是否删除 0：未删除 1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_domain
-- ----------------------------
INSERT INTO sc_domain VALUES ('44', 'www.zgl.com', '17', '0');
INSERT INTO sc_domain VALUES ('69', 'www.gxut.com', '57', '0');
INSERT INTO sc_domain VALUES ('67', 'cjnew2016v2-lzjtu', '55', '0');
INSERT INTO sc_domain VALUES ('23', 'cjnew2016-sxcj', '17', '0');
INSERT INTO sc_domain VALUES ('66', 'cjnew2016v2-zgs', '54', '0');
INSERT INTO sc_domain VALUES ('36', 'www.newcj2-lz.com', '17', '0');
INSERT INTO sc_domain VALUES ('70', 'www.gxdx.com', '57', '0');
INSERT INTO sc_domain VALUES ('38', 'cjnew2016v2-nuc', '17', '0');
INSERT INTO sc_domain VALUES ('39', 'www.zhanggl_cjnew2016.com', '17', '0');
INSERT INTO sc_domain VALUES ('40', 'local-nuc', '17', '0');
INSERT INTO sc_domain VALUES ('41', 'www.gzf.com', '17', '0');
INSERT INTO sc_domain VALUES ('71', 'www.newcj.com', '17', '0');

-- ----------------------------
-- Table structure for `sc_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sc_menu`;
CREATE TABLE `sc_menu` (
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='系统管理员菜单权限表\r\n';

-- ----------------------------
-- Records of sc_menu
-- ----------------------------
INSERT INTO sc_menu VALUES ('29', '系统设置', '0', null, '40', null, '');
INSERT INTO sc_menu VALUES ('30', '权限管理', '29', null, null, null, 'permission-form/index');
INSERT INTO sc_menu VALUES ('31', '角色管理', '29', null, null, null, 'role-form/index');
INSERT INTO sc_menu VALUES ('32', '菜单管理', '29', null, null, null, 'menu/index');
INSERT INTO sc_menu VALUES ('35', '用户管理', '29', null, null, null, 'admin/index');
INSERT INTO sc_menu VALUES ('74', '设置快捷方式', '29', null, '1', null, 'shortcut/index');
INSERT INTO sc_menu VALUES ('75', '修改密码', '29', null, '2', null, 'admin/edit-password');

-- ----------------------------
-- Table structure for `sc_site`
-- ----------------------------
DROP TABLE IF EXISTS `sc_site`;
CREATE TABLE `sc_site` (
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
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_site
-- ----------------------------
INSERT INTO sc_site VALUES ('17', '中北大学', 'nbu', '{\"driver\":\"mysqli\",\"host\":\"10.82.97.41\",\"database\":\"new_db\",\"login\":\"cj_scadmin\",\"password\":\"Rmc2zQ7yKHJhPHzVdb\",\"charset\":\"utf8\"}', '{\"driver\":\"mysqli\",\"host\":\"10.82.97.41\",\"database\":\"cjnew_nuc_db\",\"login\":\"cj_scadmin\",\"password\":\"Rmc2zQ7yKHJhPHzVdb\",\"charset\":\"utf8\"}', '{\"site_name\":\"\\u4e2d\\u5317\\u5927\\u5b66\\u5b66\\u4e60\\u7cfb\\u7edf\",\"lms_web_site_id\":\"34\",\"upload_file\":\"upload_files\\/nbu\",\"resource\":\"resources\\/nbu\\/lms\",\"logo\":\"resources\\/nbu\\/lms\\/logo.jpg\",\"college\":\"resources\\/nbu\\/lms\\/college.jpg\",\"site_about\":\"\\u4e2d\\u5317\\u5927\\u5b66\\u662f\\u4e00\\u6240\\u7531\\u5c71\\u897f\\u7701\\u4eba\\u6c11\\u653f\\u5e9c\\u4e0e\\u56fd\\u5bb6\\u56fd\\u9632\\u79d1\\u6280\\u5de5\\u4e1a\\u5c40\\u5171\\u5efa\\u3001\\u5c71\\u897f\\u7701\\u4eba\\u6c11\\u653f\\u5e9c\\u7ba1\\u7406\\u7684\\u591a\\u79d1\\u6027\\u6559\\u5b66\\u7814\\u7a76\\u578b\\u5927\\u5b66\\u3002\\u5b66\\u6821\\u7684\\u524d\\u8eab\\u662f1941\\u5e74\\u516b\\u8def\\u519b\\u603b\\u53f8\\u4ee4\\u90e8\\u5728\\u592a\\u884c\\u6297\\u65e5\\u6839\\u636e\\u5730\\u521b\\u529e\\u7684\\u6211\\u515a\\u6211\\u519b\\u7b2c\\u4e00\\u6240\\u5175\\u5de5\\u5b66\\u6821&mdash;&mdash;\\u592a\\u884c\\u5de5\\u4e1a\\u5b66\\u6821\\uff0c\\u5386\\u7ecf\\u592a\\u539f\\u673a\\u68b0\\u5b66\\u9662\\u3001\\u534e\\u5317\\u5de5\\u5b66\\u9662\\uff0c2004\\u5e746\\u6708\\u7ecf\\u6559\\u80b2\\u90e8\\u6279\\u51c6\\u66f4\\u540d\\u4e3a\\u4e2d\\u5317\\u5927\\u5b66\\u3002\",\"file_server\":\"http:\\/\\/cjnepstore\",\"template\":{\"menu\":{\"1\":{\"name\":\"\\u9996\\u9875\",\"url\":\"default\\/main\",\"menu_tag\":\"main\"},\"2\":{\"name\":\"\\u6211\\u7684\\u8bfe\\u7a0b\",\"url\":\"course\",\"menu_tag\":\"course\"},\"3\":{\"name\":\"\\u6211\\u7684\\u7ec3\\u4e60\",\"url\":\"phase\",\"menu_tag\":\"coursepractice\"},\"4\":{\"name\":\"\\u6559\\u52a1\\u8ba1\\u5212\",\"url\":\"javascript:void(0);\",\"menu_tag\":\"plan\",\"son\":{\"4_1\":{\"name\":\"\\u6559\\u5b66\\u8ba1\\u5212\",\"url\":\"planteach\",\"menu_tag\":\"plan\"},\"4_2\":{\"name\":\"\\u6210\\u7ee9\\u67e5\\u8be2\",\"url\":\"planscore\",\"menu_tag\":\"plan\"},\"4_3\":{\"name\":\"\\u5b66\\u4e60\\u8fdb\\u5ea6\",\"url\":\"learnprocess\",\"menu_tag\":\"plan\"}}},\"5\":{\"name\":\"\\u6d88\\u606f\\u4e2d\\u5fc3\",\"url\":\"javascript:void(0);\",\"menu_tag\":\"message\",\"son\":{\"5_1\":{\"name\":\"\\u901a\\u77e5\\u516c\\u544a\",\"url\":\"message\\/notif\",\"menu_tag\":\"message\"},\"5_2\":{\"name\":\"\\u4e2a\\u4eba\\u6d88\\u606f\",\"url\":\"message\\/mymessage\",\"menu_tag\":\"message\"},\"5_3\":{\"name\":\"\\u7cfb\\u7edf\\u6d88\\u606f\",\"url\":\"message\\/sysmsg\",\"menu_tag\":\"message\"}}},\"6\":{\"name\":\"\\u77e5\\u8bc6\\u95ee\\u7b54\",\"url\":\"catechism\",\"menu_tag\":\"catechism\"},\"7\":{\"name\":\"\\u4e2a\\u4eba\\u4fe1\\u606f\",\"url\":\"info\",\"menu_tag\":\"info\"},\"8\":{\"name\":\"\\u6bd5\\u4e1a\\u8bbe\\u8ba1\",\"url\":\"#\",\"menu_tag\":\"\"}}}}', '{\"site_name\":\"\\u4e2d\\u5317\\u5927\\u5b66\\u7ba1\\u7406\\u7cfb\\u7edf\",\"sims_web_site_id\":\"34\",\"upload_file\":\"upload_files\\/nbu\",\"resource\":\"resources\\/nbu\\/sims\",\"logo\":\"resources\\/nbu\\/sims\\/logo.jpg\",\"background\":\"resources\\/nbu\\/sims\\/background.png\",\"file_server\":\"http:\\/\\/cjnepstore\",\"template\":{\"perms\":{\"studentNumber_index\":\"studentNumber_index\",\"studentNumber_update\":\"studentNumber_update\",\"grade_create\":\"grade_create\",\"grade_delete\":\"grade_delete\",\"grade_update\":\"grade_update\",\"term_create\":\"term_create\",\"term_delete\":\"term_delete\",\"term_update\":\"term_update\",\"correspondence_create\":\"correspondence_create\",\"studyType_create\":\"studyType_create\",\"studyType_delete\":\"studyType_delete\",\"studyType_update\":\"studyType_update\",\"studyLevel_create\":\"studyLevel_create\",\"studyLevel_delete\":\"studyLevel_delete\",\"studyLevel_update\":\"studyLevel_update\",\"disciplineType_create\":\"disciplineType_create\",\"discipline_create\":\"discipline_create\",\"classInfo_create\":\"classInfo_create\",\"classInfo_delete\":\"classInfo_delete\",\"classInfo_openCourse\":\"classInfo_openCourse\",\"classInfo_update\":\"classInfo_update\",\"download_create\":\"download_create\",\"download_delete\":\"download_delete\",\"download_index\":\"download_index\",\"download_update\":\"download_update\",\"enroll_create\":\"enroll_create\",\"enroll_import\":\"enroll_import\",\"enroll_score\":\"enroll_score\",\"enroll_delete\":\"enroll_delete\",\"enroll_enter\":\"enroll_enter\",\"enroll_update\":\"enroll_update\",\"enroll_placement\":\"enroll_placement\",\"userbc_check\":\"userbc_check\",\"userbc_create\":\"userbc_create\",\"userbc_delete\":\"userbc_delete\",\"userbc_edit\":\"userbc_edit\",\"userbc_import\":\"userbc_import\",\"userbc_index\":\"userbc_index\",\"user_register-term\":\"user_register-term\",\"user_register-term-cancel\":\"user_register-term-cancel\",\"user_register-term-register\":\"user_register-term-register\",\"user_edit\":\"user_edit\",\"user_index\":\"user_index\",\"teachPlan_create\":\"teachPlan_create\",\"teachPlan_delete\":\"teachPlan_delete\",\"teachPlan_update\":\"teachPlan_update\",\"teachPlanShlist_pass\":\"teachPlanShlist_pass\",\"teachPlanSplist_pass\":\"teachPlanSplist_pass\",\"teachPlanAdjust_pass\":\"teachPlanAdjust_pass\",\"building_create\":\"building_create\",\"building_delete\":\"building_delete\",\"building_freeze\":\"building_freeze\",\"building_taxis\":\"building_taxis\",\"building_update\":\"building_update\",\"roomType_create\":\"roomType_create\",\"roomType_delete\":\"roomType_delete\",\"roomType_taxis\":\"roomType_taxis\",\"roomType_update\":\"roomType_update\",\"room_create\":\"room_create\",\"room_delete\":\"room_delete\",\"room_taxis\":\"room_taxis\",\"room_update\":\"room_update\",\"teachingTask_create\":\"teachingTask_create\",\"teachingTask_delete\":\"teachingTask_delete\",\"teachingTask_update\":\"teachingTask_update\",\"courseNum_create\":\"courseNum_create\",\"courseNum_delete\":\"courseNum_delete\",\"courseNum_update\":\"courseNum_update\",\"handwork_create_class\":\"handwork_create_class\",\"handwork_create_select\":\"handwork_create_select\",\"handwork_delete\":\"handwork_delete\",\"handwork_update\":\"handwork_update\",\"handwork_view\":\"handwork_view\",\"studyProgress_index\":\"studyProgress_index\",\"coursetalk_delete\":\"coursetalk_delete\",\"coursetalk_index\":\"coursetalk_index\",\"coursetalk_reply\":\"coursetalk_reply\",\"coursetalk_update\":\"coursetalk_update\",\"quiz_index\":\"quiz_index\",\"itemsbug_delete\":\"itemsbug_delete\",\"itemsbug_export\":\"itemsbug_export\",\"itemsbug_view\":\"itemsbug_view\",\"resource_create\":\"resource_create\",\"resource_delete\":\"resource_delete\",\"resource_download\":\"resource_download\",\"resource_view\":\"resource_view\",\"score_create\":\"score_create\",\"score_delete\":\"score_delete\",\"score_index\":\"score_index\",\"score_update\":\"score_update\",\"waiver_create\":\"waiver_create\",\"waiver_delete\":\"waiver_delete\",\"waiver_index\":\"waiver_index\",\"waiver_update\":\"waiver_update\",\"replace_create\":\"replace_create\",\"replace_delete\":\"replace_delete\",\"replace_index\":\"replace_index\",\"replace_update\":\"replace_update\",\"testplan_create\":\"testplan_create\",\"testplan_delete\":\"testplan_delete\",\"testplan_edit\":\"testplan_edit\",\"testplan_index\":\"testplan_index\",\"examplan_create\":\"examplan_create\",\"examplan_delete\":\"examplan_delete\",\"examplan_exit\":\"examplan_exit\",\"examplan_index\":\"examplan_index\",\"makeup_index\":\"makeup_index\",\"leave_degree-apply\":\"leave_degree-apply\",\"leave_graduate\":\"leave_graduate\",\"leave_back-school\":\"leave_back-school\",\"leave_drop\":\"leave_drop\",\"leave_back-school2\":\"leave_back-school2\",\"leave_suspension\":\"leave_suspension\",\"delete_engage\":\"delete_engage\",\"update_engage\":\"update_engage\",\"leave_change-roll\":\"leave_change-roll\",\"leave_drop-create\":\"leave_drop-create\",\"leave_graduate-create\":\"leave_graduate-create\",\"leave_suspension-create\":\"leave_suspension-create\",\"user_change-correspondence-create\":\"user_change-correspondence-create\",\"leave_degree\":\"leave_degree\",\"user_change-discipline\":\"user_change-discipline\",\"user_change-discipline-do\":\"user_change-discipline-do\",\"courseNature_create\":\"courseNature_create\",\"courseNature_delete\":\"courseNature_delete\",\"courseNature_freeze\":\"courseNature_freeze\",\"courseNature_taxis\":\"courseNature_taxis\",\"courseNature_update\":\"courseNature_update\",\"courseType_create\":\"courseType_create\",\"courseType_delete\":\"courseType_delete\",\"courseType_freeze\":\"courseType_freeze\",\"courseType_taxis\":\"courseType_taxis\",\"courseType_update\":\"courseType_update\",\"course_create\":\"course_create\",\"course_delete\":\"course_delete\",\"course_update\":\"course_update\",\"knowledge_create\":\"knowledge_create\",\"knowledge_delete\":\"knowledge_delete\",\"knowledge_update\":\"knowledge_update\",\"questiontype_view\":\"questiontype_view\",\"questions_add\":\"questions_add\",\"questions_del\":\"questions_del\",\"questions_export\":\"questions_export\",\"questions_update\":\"questions_update\",\"questions_upload\":\"questions_upload\",\"questions_view\":\"questions_view\",\"coursetemplate_create\":\"coursetemplate_create\",\"coursetemplate_delete\":\"coursetemplate_delete\",\"coursetemplate_update\":\"coursetemplate_update\",\"coursetemplate_view\":\"coursetemplate_view\",\"phaseemplate_create\":\"phaseemplate_create\",\"phaseemplate_delete\":\"phaseemplate_delete\",\"phaseemplate_update\":\"phaseemplate_update\",\"phaseemplate_view\":\"phaseemplate_view\",\"yearsemplate_create\":\"yearsemplate_create\",\"yearsemplate_delete\":\"yearsemplate_delete\",\"yearsemplate_update\":\"yearsemplate_update\",\"yearsemplate_view\":\"yearsemplate_view\",\"teacher_create\":\"teacher_create\",\"teacher_delete\":\"teacher_delete\",\"teacher_update\":\"teacher_update\",\"notice_create\":\"notice_create\",\"notice_delete\":\"notice_delete\",\"notice_edit\":\"notice_edit\",\"count_student\":\"count_student\",\"password_update\":\"password_update\",\"log_restore\":\"log_restore\",\"log_view\":\"log_view\",\"shortcut_update\":\"shortcut_update\",\"permission_create\":\"permission_create\",\"permission_delete\":\"permission_delete\",\"permission_update\":\"permission_update\",\"role_create\":\"role_create\",\"role_delete\":\"role_delete\",\"role_permission\":\"role_permission\",\"role_update\":\"role_update\",\"menu_create\":\"menu_create\",\"menu_delete\":\"menu_delete\",\"menu_taxis\":\"menu_taxis\",\"menu_update\":\"menu_update\",\"admin_quickentry\":\"admin_quickentry\",\"admin_update\":\"admin_update\"},\"menu\":{\"83\":83,\"1\":1,\"2\":2,\"3\":3,\"4\":4,\"5\":5,\"6\":6,\"7\":7,\"8\":8,\"9\":9,\"80\":80,\"24\":24,\"23\":23,\"25\":25,\"26\":26,\"27\":27,\"28\":28,\"14\":14,\"79\":79,\"16\":16,\"15\":15,\"37\":37,\"36\":36,\"38\":38,\"49\":49,\"50\":50,\"40\":40,\"42\":42,\"43\":43,\"48\":48,\"53\":53,\"54\":54,\"72\":72,\"71\":71,\"76\":76,\"77\":77,\"81\":81,\"82\":82,\"45\":45,\"44\":44,\"46\":46,\"47\":47,\"51\":51,\"52\":52,\"63\":63,\"39\":39,\"13\":13,\"22\":22,\"21\":21,\"61\":61,\"18\":18,\"41\":41,\"19\":19,\"10\":10,\"78\":78,\"11\":11,\"12\":12,\"65\":65,\"64\":64,\"66\":66,\"67\":67,\"68\":68,\"69\":69,\"70\":70,\"34\":34,\"33\":33,\"60\":60,\"73\":73,\"59\":59,\"58\":58,\"75\":75,\"29\":29,\"57\":57,\"74\":74,\"30\":30,\"31\":31,\"32\":32,\"35\":35}}}', '20', '0');
INSERT INTO sc_site VALUES ('54', '浙江工商大学继续教育学院', 'zgs', '{\"driver\":\"mysqli\",\"host\":\"10.82.97.41\",\"database\":\"cj_zgs_db\",\"login\":\"cj_scadmin\",\"password\":\"Rmc2zQ7yKHJhPHzVdb\",\"charset\":\"utf8\"}', '{\"driver\":\"mysqli\",\"host\":\"10.82.97.41\",\"database\":\"cjnew_zgs_db\",\"login\":\"cj_scadmin\",\"password\":\"Rmc2zQ7yKHJhPHzVdb\",\"charset\":\"utf8\"}', '{\"site_name\":\"\\u6d59\\u6c5f\\u5de5\\u5546\\u5927\\u5b66\\u5b66\\u4e60\\u7cfb\\u7edf\",\"lms_web_site_id\":\"37\",\"upload_file\":\"upload_files\\/zgs\",\"resource\":\"resources\\/public\\/lms\",\"logo\":\"resources\\/zgs\\/lms\\/logo.png\",\"college\":\"resources\\/zgs\\/lms\\/college.png\",\"site_about\":\"\\u7ad9\\u70b9\\u4ecb\\u7ecd\",\"template\":{\"menu\":{\"1\":{\"name\":\"\\u9996\\u9875\",\"url\":\"default\\/main\"},\"2\":{\"name\":\"\\u6211\\u7684\\u8bfe\\u7a0b\",\"url\":\"course\"},\"3\":{\"name\":\"\\u6211\\u7684\\u7ec3\\u4e60\",\"url\":\"phase\"},\"5\":{\"name\":\"\\u6d88\\u606f\\u4e2d\\u5fc3\",\"url\":\"javascript:void(0);\",\"son\":{\"5_1\":{\"name\":\"\\u901a\\u77e5\\u516c\\u544a\",\"url\":\"message\\/notif\"},\"5_2\":{\"name\":\"\\u4e2a\\u4eba\\u6d88\\u606f\",\"url\":\"message\\/mymessage\"},\"5_3\":{\"name\":\"\\u7cfb\\u7edf\\u6d88\\u606f\",\"url\":\"message\\/sysmsg\"}}},\"6\":{\"name\":\"\\u77e5\\u8bc6\\u95ee\\u7b54\",\"url\":\"catechism\"},\"7\":{\"name\":\"\\u4e2a\\u4eba\\u4fe1\\u606f\",\"url\":\"info\"},\"8\":{\"name\":\"\\u6bd5\\u4e1a\\u8bbe\\u8ba1\",\"url\":\"#\"}}}}', '{\"site_name\":\"\\u6d59\\u6c5f\\u5de5\\u5546\\u5927\\u5b66\\u7ba1\\u7406\\u7cfb\\u7edf\",\"sims_web_site_id\":\"37\",\"upload_file\":\"upload_files\\/zgs\",\"resource\":\"resources\\/public\\/sims\",\"logo\":\"resources\\/zgs\\/sims\\/logo.png\",\"background\":\"resources\\/zgs\\/sims\\/background.png\",\"template\":{\"perms\":{\"studentNumber_index\":\"studentNumber_index\",\"studentNumber_update\":\"studentNumber_update\",\"grade_create\":\"grade_create\",\"grade_delete\":\"grade_delete\",\"grade_update\":\"grade_update\",\"term_create\":\"term_create\",\"term_delete\":\"term_delete\",\"term_update\":\"term_update\",\"correspondence_create\":\"correspondence_create\",\"studyType_create\":\"studyType_create\",\"studyType_delete\":\"studyType_delete\",\"studyType_update\":\"studyType_update\",\"studyLevel_create\":\"studyLevel_create\",\"studyLevel_delete\":\"studyLevel_delete\",\"studyLevel_update\":\"studyLevel_update\",\"disciplineType_create\":\"disciplineType_create\",\"discipline_create\":\"discipline_create\",\"classInfo_create\":\"classInfo_create\",\"classInfo_delete\":\"classInfo_delete\",\"classInfo_openCourse\":\"classInfo_openCourse\",\"classInfo_update\":\"classInfo_update\",\"download_create\":\"download_create\",\"download_delete\":\"download_delete\",\"download_index\":\"download_index\",\"download_update\":\"download_update\",\"enroll_create\":\"enroll_create\",\"enroll_import\":\"enroll_import\",\"enroll_score\":\"enroll_score\",\"enroll_delete\":\"enroll_delete\",\"enroll_enter\":\"enroll_enter\",\"enroll_update\":\"enroll_update\",\"enroll_placement\":\"enroll_placement\",\"userbc_check\":\"userbc_check\",\"userbc_create\":\"userbc_create\",\"userbc_delete\":\"userbc_delete\",\"userbc_edit\":\"userbc_edit\",\"userbc_import\":\"userbc_import\",\"userbc_index\":\"userbc_index\",\"user_register-term\":\"user_register-term\",\"user_register-term-cancel\":\"user_register-term-cancel\",\"user_register-term-register\":\"user_register-term-register\",\"user_edit\":\"user_edit\",\"user_index\":\"user_index\",\"teachPlan_create\":\"teachPlan_create\",\"teachPlan_delete\":\"teachPlan_delete\",\"teachPlan_update\":\"teachPlan_update\",\"teachPlanShlist_pass\":\"teachPlanShlist_pass\",\"teachPlanSplist_pass\":\"teachPlanSplist_pass\",\"teachPlanAdjust_pass\":\"teachPlanAdjust_pass\",\"building_create\":\"building_create\",\"building_delete\":\"building_delete\",\"building_freeze\":\"building_freeze\",\"building_taxis\":\"building_taxis\",\"building_update\":\"building_update\",\"roomType_create\":\"roomType_create\",\"roomType_delete\":\"roomType_delete\",\"roomType_taxis\":\"roomType_taxis\",\"roomType_update\":\"roomType_update\",\"room_create\":\"room_create\",\"room_delete\":\"room_delete\",\"room_taxis\":\"room_taxis\",\"room_update\":\"room_update\",\"teachingTask_create\":\"teachingTask_create\",\"teachingTask_delete\":\"teachingTask_delete\",\"teachingTask_update\":\"teachingTask_update\",\"courseNum_create\":\"courseNum_create\",\"courseNum_delete\":\"courseNum_delete\",\"courseNum_update\":\"courseNum_update\",\"handwork_create_class\":\"handwork_create_class\",\"handwork_create_select\":\"handwork_create_select\",\"handwork_delete\":\"handwork_delete\",\"handwork_update\":\"handwork_update\",\"handwork_view\":\"handwork_view\",\"studyProgress_index\":\"studyProgress_index\",\"coursetalk_delete\":\"coursetalk_delete\",\"coursetalk_index\":\"coursetalk_index\",\"coursetalk_reply\":\"coursetalk_reply\",\"coursetalk_update\":\"coursetalk_update\",\"quiz_index\":\"quiz_index\",\"itemsbug_delete\":\"itemsbug_delete\",\"itemsbug_export\":\"itemsbug_export\",\"itemsbug_view\":\"itemsbug_view\",\"resource_create\":\"resource_create\",\"resource_delete\":\"resource_delete\",\"resource_download\":\"resource_download\",\"resource_view\":\"resource_view\",\"score_create\":\"score_create\",\"score_delete\":\"score_delete\",\"score_index\":\"score_index\",\"score_update\":\"score_update\",\"waiver_create\":\"waiver_create\",\"waiver_delete\":\"waiver_delete\",\"waiver_index\":\"waiver_index\",\"waiver_update\":\"waiver_update\",\"replace_create\":\"replace_create\",\"replace_delete\":\"replace_delete\",\"replace_index\":\"replace_index\",\"replace_update\":\"replace_update\",\"testplan_create\":\"testplan_create\",\"testplan_delete\":\"testplan_delete\",\"testplan_edit\":\"testplan_edit\",\"testplan_index\":\"testplan_index\",\"examplan_create\":\"examplan_create\",\"examplan_delete\":\"examplan_delete\",\"examplan_exit\":\"examplan_exit\",\"examplan_index\":\"examplan_index\",\"makeup_index\":\"makeup_index\",\"leave_degree-apply\":\"leave_degree-apply\",\"leave_graduate\":\"leave_graduate\",\"leave_back-school\":\"leave_back-school\",\"leave_drop\":\"leave_drop\",\"leave_back-school2\":\"leave_back-school2\",\"leave_suspension\":\"leave_suspension\",\"delete_engage\":\"delete_engage\",\"update_engage\":\"update_engage\",\"leave_change-roll\":\"leave_change-roll\",\"leave_drop-create\":\"leave_drop-create\",\"leave_graduate-create\":\"leave_graduate-create\",\"leave_suspension-create\":\"leave_suspension-create\",\"user_change-correspondence-create\":\"user_change-correspondence-create\",\"leave_degree\":\"leave_degree\",\"user_change-discipline\":\"user_change-discipline\",\"user_change-discipline-do\":\"user_change-discipline-do\",\"courseNature_create\":\"courseNature_create\",\"courseNature_delete\":\"courseNature_delete\",\"courseNature_freeze\":\"courseNature_freeze\",\"courseNature_taxis\":\"courseNature_taxis\",\"courseNature_update\":\"courseNature_update\",\"courseType_create\":\"courseType_create\",\"courseType_delete\":\"courseType_delete\",\"courseType_freeze\":\"courseType_freeze\",\"courseType_taxis\":\"courseType_taxis\",\"courseType_update\":\"courseType_update\",\"course_create\":\"course_create\",\"course_delete\":\"course_delete\",\"course_update\":\"course_update\",\"knowledge_create\":\"knowledge_create\",\"knowledge_delete\":\"knowledge_delete\",\"knowledge_update\":\"knowledge_update\",\"questiontype_view\":\"questiontype_view\",\"questions_add\":\"questions_add\",\"questions_del\":\"questions_del\",\"questions_export\":\"questions_export\",\"questions_update\":\"questions_update\",\"questions_upload\":\"questions_upload\",\"questions_view\":\"questions_view\",\"coursetemplate_create\":\"coursetemplate_create\",\"coursetemplate_delete\":\"coursetemplate_delete\",\"coursetemplate_update\":\"coursetemplate_update\",\"coursetemplate_view\":\"coursetemplate_view\",\"phaseemplate_create\":\"phaseemplate_create\",\"phaseemplate_delete\":\"phaseemplate_delete\",\"phaseemplate_update\":\"phaseemplate_update\",\"phaseemplate_view\":\"phaseemplate_view\",\"yearsemplate_create\":\"yearsemplate_create\",\"yearsemplate_delete\":\"yearsemplate_delete\",\"yearsemplate_update\":\"yearsemplate_update\",\"yearsemplate_view\":\"yearsemplate_view\",\"teacher_create\":\"teacher_create\",\"teacher_delete\":\"teacher_delete\",\"teacher_update\":\"teacher_update\",\"notice_create\":\"notice_create\",\"notice_delete\":\"notice_delete\",\"notice_edit\":\"notice_edit\",\"count_student\":\"count_student\",\"password_update\":\"password_update\",\"log_restore\":\"log_restore\",\"log_view\":\"log_view\",\"shortcut_update\":\"shortcut_update\",\"permission_create\":\"permission_create\",\"permission_delete\":\"permission_delete\",\"permission_update\":\"permission_update\",\"role_create\":\"role_create\",\"role_delete\":\"role_delete\",\"role_permission\":\"role_permission\",\"role_update\":\"role_update\",\"menu_create\":\"menu_create\",\"menu_delete\":\"menu_delete\",\"menu_taxis\":\"menu_taxis\",\"menu_update\":\"menu_update\",\"admin_create\":\"admin_create\",\"admin_delete\":\"admin_delete\",\"admin_quickentry\":\"admin_quickentry\",\"admin_update\":\"admin_update\"},\"menu\":{\"83\":83,\"1\":1,\"2\":2,\"3\":3,\"4\":4,\"5\":5,\"6\":6,\"7\":7,\"8\":8,\"9\":9,\"80\":80,\"24\":24,\"23\":23,\"25\":25,\"26\":26,\"27\":27,\"28\":28,\"14\":14,\"79\":79,\"16\":16,\"15\":15,\"37\":37,\"36\":36,\"38\":38,\"49\":49,\"50\":50,\"40\":40,\"42\":42,\"43\":43,\"48\":48,\"53\":53,\"54\":54,\"72\":72,\"71\":71,\"76\":76,\"77\":77,\"81\":81,\"82\":82,\"45\":45,\"44\":44,\"46\":46,\"47\":47,\"51\":51,\"52\":52,\"63\":63,\"39\":39,\"13\":13,\"22\":22,\"21\":21,\"61\":61,\"18\":18,\"41\":41,\"19\":19,\"10\":10,\"78\":78,\"11\":11,\"12\":12,\"65\":65,\"64\":64,\"66\":66,\"67\":67,\"68\":68,\"69\":69,\"70\":70,\"34\":34,\"33\":33,\"60\":60,\"73\":73,\"59\":59,\"58\":58,\"75\":75,\"29\":29,\"57\":57,\"74\":74,\"30\":30,\"31\":31,\"32\":32,\"35\":35}}}', '20', '0');
INSERT INTO sc_site VALUES ('55', '兰州交通大学', 'lzjtu', '{\"driver\":\"mysqli\",\"host\":\"10.82.97.41\",\"database\":\"cj_lzjtu_db\",\"login\":\"cj_scadmin\",\"password\":\"Rmc2zQ7yKHJhPHzVdb\",\"charset\":\"utf8\"}', '{\"driver\":\"mysqli\",\"host\":\"10.82.97.41\",\"database\":\"cjnew_lzjtu_db\",\"login\":\"cj_scadmin\",\"password\":\"Rmc2zQ7yKHJhPHzVdb\",\"charset\":\"utf8\"}', '{\"site_name\":\"\\u5170\\u5dde\\u4ea4\\u901a\\u5927\\u5b66\\u5b66\\u4e60\\u7cfb\\u7edf\",\"lms_web_site_id\":\"38\",\"upload_file\":\"upload_files\\/lzjtu\",\"resource\":\"resources\\/public\\/lms\",\"logo\":\"resources\\/lzjtu\\/lms\\/logo.png\",\"college\":\"resources\\/lzjtu\\/lms\\/college.jpg\",\"site_about\":\"\\u5170\\u5dde\\u4ea4\\u901a\\u5927\\u5b66\\u521b\\u5efa\\u4e8el958\\u5e74\\uff0c\\u7531\\u5510\\u5c71\\u94c1\\u9053\\u5b66\\u9662\\uff08\\u73b0\\u897f\\u5357\\u4ea4\\u901a\\u5927\\u5b66\\uff09\\u548c\\u5317\\u4eac\\u94c1\\u9053\\u5b66\\u9662\\uff08\\u73b0\\u5317\\u4eac\\u4ea4\\u901a\\u5927\\u5b66\\uff09\\u90e8\\u5206\\u7cfb\\u79d1\\u6210\\u5efa\\u5236\\u8fc1\\u5170\\u7ec4\\u5efa\\uff0c\\u539f\\u540d\\u5170\\u5dde\\u94c1\\u9053\\u5b66\\u9662\\uff0c\\u662f\\u6211\\u56fd\\u7b2c\\u4e09\\u6240\\u94c1\\u8def\\u9662\\u6821\\u300250\\u5e74\\u4ee3\\u672b\\u81f390\\u5e74\\u4ee3\\u672b\\uff0c\\u5b66\\u6821\\u96b6\\u5c5e\\u94c1\\u9053\\u90e8\\u9886\\u5bfc\\uff0c\\u5b9e\\u884c\\u884c\\u4e1a\\u529e\\u5b66\\u7ba1\\u7406\\u4f53\\u5236\\u30022000\\u5e74\\uff0c\\u6839\\u636e\\u56fd\\u5bb6\\u7edf\\u7b79\\u89c4\\u5212\\uff0c\\u5212\\u5f52\\u7518\\u8083\\u7701\\u7ba1\\u7406\\uff0c\\u5b9e\\u884c&ldquo;\\u4e2d\\u592e\\u4e0e\\u5730\\u65b9\\u5171\\u5efa\\uff0c\\u4ee5\\u5730\\u65b9\\u653f\\u5e9c\\u7ba1\\u7406\\u4e3a\\u4e3b&rdquo;\\u7684\\u7ba1\\u7406\\u4f53\\u5236\\u30022003\\u5e744\\u6708\\uff0c\\u7ecf\\u6559\\u80b2\\u90e8\\u6279\\u51c6\\uff0c\\u66f4\\u540d\\u4e3a&ldquo;\\u5170\\u5dde\\u4ea4\\u901a\\u5927\\u5b66&rdquo;\\u3002\",\"template\":{\"menu\":{\"1\":{\"name\":\"\\u9996\\u9875\",\"url\":\"default\\/main\"},\"2\":{\"name\":\"\\u6211\\u7684\\u8bfe\\u7a0b\",\"url\":\"course\"},\"3\":{\"name\":\"\\u6211\\u7684\\u7ec3\\u4e60\",\"url\":\"phase\"},\"5\":{\"name\":\"\\u6d88\\u606f\\u4e2d\\u5fc3\",\"url\":\"javascript:void(0);\",\"son\":{\"5_1\":{\"name\":\"\\u901a\\u77e5\\u516c\\u544a\",\"url\":\"message\\/notif\"},\"5_2\":{\"name\":\"\\u4e2a\\u4eba\\u6d88\\u606f\",\"url\":\"message\\/mymessage\"},\"5_3\":{\"name\":\"\\u7cfb\\u7edf\\u6d88\\u606f\",\"url\":\"message\\/sysmsg\"}}},\"6\":{\"name\":\"\\u77e5\\u8bc6\\u95ee\\u7b54\",\"url\":\"catechism\"},\"7\":{\"name\":\"\\u4e2a\\u4eba\\u4fe1\\u606f\",\"url\":\"info\"},\"8\":{\"name\":\"\\u6bd5\\u4e1a\\u8bbe\\u8ba1\",\"url\":\"#\"}}}}', '{\"site_name\":\"\\u5170\\u5dde\\u4ea4\\u901a\\u5927\\u5b66\\u7ba1\\u7406\\u7cfb\\u7edf\",\"sims_web_site_id\":\"38\",\"upload_file\":\"upload_files\\/lzjtu\",\"resource\":\"resources\\/public\\/sims\",\"logo\":\"resources\\/lzjtu\\/sims\\/logo.png\",\"background\":\"resources\\/lzjtu\\/sims\\/background.png\",\"template\":{\"perms\":{\"studentNumber_index\":\"studentNumber_index\",\"studentNumber_update\":\"studentNumber_update\",\"grade_create\":\"grade_create\",\"grade_delete\":\"grade_delete\",\"grade_update\":\"grade_update\",\"term_create\":\"term_create\",\"term_delete\":\"term_delete\",\"term_update\":\"term_update\",\"correspondence_create\":\"correspondence_create\",\"studyType_create\":\"studyType_create\",\"studyType_delete\":\"studyType_delete\",\"studyType_update\":\"studyType_update\",\"studyLevel_create\":\"studyLevel_create\",\"studyLevel_delete\":\"studyLevel_delete\",\"studyLevel_update\":\"studyLevel_update\",\"disciplineType_create\":\"disciplineType_create\",\"discipline_create\":\"discipline_create\",\"classInfo_create\":\"classInfo_create\",\"classInfo_delete\":\"classInfo_delete\",\"classInfo_openCourse\":\"classInfo_openCourse\",\"classInfo_update\":\"classInfo_update\",\"download_create\":\"download_create\",\"download_delete\":\"download_delete\",\"download_index\":\"download_index\",\"download_update\":\"download_update\",\"enroll_create\":\"enroll_create\",\"enroll_import\":\"enroll_import\",\"enroll_score\":\"enroll_score\",\"enroll_delete\":\"enroll_delete\",\"enroll_enter\":\"enroll_enter\",\"enroll_update\":\"enroll_update\",\"enroll_placement\":\"enroll_placement\",\"userbc_check\":\"userbc_check\",\"userbc_create\":\"userbc_create\",\"userbc_delete\":\"userbc_delete\",\"userbc_edit\":\"userbc_edit\",\"userbc_import\":\"userbc_import\",\"userbc_index\":\"userbc_index\",\"user_register-term\":\"user_register-term\",\"user_register-term-cancel\":\"user_register-term-cancel\",\"user_register-term-register\":\"user_register-term-register\",\"user_edit\":\"user_edit\",\"user_index\":\"user_index\",\"teachPlan_create\":\"teachPlan_create\",\"teachPlan_delete\":\"teachPlan_delete\",\"teachPlan_update\":\"teachPlan_update\",\"teachPlanShlist_pass\":\"teachPlanShlist_pass\",\"teachPlanSplist_pass\":\"teachPlanSplist_pass\",\"teachPlanAdjust_pass\":\"teachPlanAdjust_pass\",\"building_create\":\"building_create\",\"building_delete\":\"building_delete\",\"building_freeze\":\"building_freeze\",\"building_taxis\":\"building_taxis\",\"building_update\":\"building_update\",\"roomType_create\":\"roomType_create\",\"roomType_delete\":\"roomType_delete\",\"roomType_taxis\":\"roomType_taxis\",\"roomType_update\":\"roomType_update\",\"room_create\":\"room_create\",\"room_delete\":\"room_delete\",\"room_taxis\":\"room_taxis\",\"room_update\":\"room_update\",\"teachingTask_create\":\"teachingTask_create\",\"teachingTask_delete\":\"teachingTask_delete\",\"teachingTask_update\":\"teachingTask_update\",\"courseNum_create\":\"courseNum_create\",\"courseNum_delete\":\"courseNum_delete\",\"courseNum_update\":\"courseNum_update\",\"handwork_create_class\":\"handwork_create_class\",\"handwork_create_select\":\"handwork_create_select\",\"handwork_delete\":\"handwork_delete\",\"handwork_update\":\"handwork_update\",\"handwork_view\":\"handwork_view\",\"studyProgress_index\":\"studyProgress_index\",\"coursetalk_delete\":\"coursetalk_delete\",\"coursetalk_index\":\"coursetalk_index\",\"coursetalk_reply\":\"coursetalk_reply\",\"coursetalk_update\":\"coursetalk_update\",\"quiz_index\":\"quiz_index\",\"itemsbug_delete\":\"itemsbug_delete\",\"itemsbug_export\":\"itemsbug_export\",\"itemsbug_view\":\"itemsbug_view\",\"resource_create\":\"resource_create\",\"resource_delete\":\"resource_delete\",\"resource_download\":\"resource_download\",\"resource_view\":\"resource_view\",\"score_create\":\"score_create\",\"score_delete\":\"score_delete\",\"score_index\":\"score_index\",\"score_update\":\"score_update\",\"waiver_create\":\"waiver_create\",\"waiver_delete\":\"waiver_delete\",\"waiver_index\":\"waiver_index\",\"waiver_update\":\"waiver_update\",\"replace_create\":\"replace_create\",\"replace_delete\":\"replace_delete\",\"replace_index\":\"replace_index\",\"replace_update\":\"replace_update\",\"testplan_create\":\"testplan_create\",\"testplan_delete\":\"testplan_delete\",\"testplan_edit\":\"testplan_edit\",\"testplan_index\":\"testplan_index\",\"examplan_create\":\"examplan_create\",\"examplan_delete\":\"examplan_delete\",\"examplan_exit\":\"examplan_exit\",\"examplan_index\":\"examplan_index\",\"makeup_index\":\"makeup_index\",\"leave_degree-apply\":\"leave_degree-apply\",\"leave_graduate\":\"leave_graduate\",\"leave_back-school\":\"leave_back-school\",\"leave_drop\":\"leave_drop\",\"leave_back-school2\":\"leave_back-school2\",\"leave_suspension\":\"leave_suspension\",\"delete_engage\":\"delete_engage\",\"update_engage\":\"update_engage\",\"leave_change-roll\":\"leave_change-roll\",\"leave_drop-create\":\"leave_drop-create\",\"leave_graduate-create\":\"leave_graduate-create\",\"leave_suspension-create\":\"leave_suspension-create\",\"user_change-correspondence-create\":\"user_change-correspondence-create\",\"leave_degree\":\"leave_degree\",\"user_change-discipline\":\"user_change-discipline\",\"user_change-discipline-do\":\"user_change-discipline-do\",\"courseNature_create\":\"courseNature_create\",\"courseNature_delete\":\"courseNature_delete\",\"courseNature_freeze\":\"courseNature_freeze\",\"courseNature_taxis\":\"courseNature_taxis\",\"courseNature_update\":\"courseNature_update\",\"courseType_create\":\"courseType_create\",\"courseType_delete\":\"courseType_delete\",\"courseType_freeze\":\"courseType_freeze\",\"courseType_taxis\":\"courseType_taxis\",\"courseType_update\":\"courseType_update\",\"course_create\":\"course_create\",\"course_delete\":\"course_delete\",\"course_update\":\"course_update\",\"knowledge_create\":\"knowledge_create\",\"knowledge_delete\":\"knowledge_delete\",\"knowledge_update\":\"knowledge_update\",\"questiontype_view\":\"questiontype_view\",\"questions_add\":\"questions_add\",\"questions_del\":\"questions_del\",\"questions_export\":\"questions_export\",\"questions_update\":\"questions_update\",\"questions_upload\":\"questions_upload\",\"questions_view\":\"questions_view\",\"coursetemplate_create\":\"coursetemplate_create\",\"coursetemplate_delete\":\"coursetemplate_delete\",\"coursetemplate_update\":\"coursetemplate_update\",\"coursetemplate_view\":\"coursetemplate_view\",\"phaseemplate_create\":\"phaseemplate_create\",\"phaseemplate_delete\":\"phaseemplate_delete\",\"phaseemplate_update\":\"phaseemplate_update\",\"phaseemplate_view\":\"phaseemplate_view\",\"yearsemplate_create\":\"yearsemplate_create\",\"yearsemplate_delete\":\"yearsemplate_delete\",\"yearsemplate_update\":\"yearsemplate_update\",\"yearsemplate_view\":\"yearsemplate_view\",\"teacher_create\":\"teacher_create\",\"teacher_delete\":\"teacher_delete\",\"teacher_update\":\"teacher_update\",\"notice_create\":\"notice_create\",\"notice_delete\":\"notice_delete\",\"notice_edit\":\"notice_edit\",\"count_student\":\"count_student\",\"password_update\":\"password_update\",\"log_restore\":\"log_restore\",\"log_view\":\"log_view\",\"shortcut_update\":\"shortcut_update\",\"permission_create\":\"permission_create\",\"permission_delete\":\"permission_delete\",\"permission_update\":\"permission_update\",\"role_create\":\"role_create\",\"role_delete\":\"role_delete\",\"role_permission\":\"role_permission\",\"role_update\":\"role_update\",\"menu_create\":\"menu_create\",\"menu_delete\":\"menu_delete\",\"menu_taxis\":\"menu_taxis\",\"menu_update\":\"menu_update\",\"admin_create\":\"admin_create\",\"admin_delete\":\"admin_delete\",\"admin_quickentry\":\"admin_quickentry\",\"admin_update\":\"admin_update\"},\"menu\":{\"83\":83,\"1\":1,\"2\":2,\"3\":3,\"4\":4,\"5\":5,\"6\":6,\"7\":7,\"8\":8,\"9\":9,\"80\":80,\"24\":24,\"23\":23,\"25\":25,\"26\":26,\"27\":27,\"28\":28,\"14\":14,\"79\":79,\"16\":16,\"15\":15,\"37\":37,\"36\":36,\"38\":38,\"49\":49,\"50\":50,\"40\":40,\"42\":42,\"43\":43,\"48\":48,\"53\":53,\"54\":54,\"72\":72,\"71\":71,\"76\":76,\"77\":77,\"81\":81,\"82\":82,\"45\":45,\"44\":44,\"46\":46,\"47\":47,\"51\":51,\"52\":52,\"63\":63,\"39\":39,\"13\":13,\"22\":22,\"21\":21,\"61\":61,\"18\":18,\"41\":41,\"19\":19,\"10\":10,\"78\":78,\"11\":11,\"12\":12,\"65\":65,\"64\":64,\"66\":66,\"67\":67,\"68\":68,\"69\":69,\"70\":70,\"34\":34,\"33\":33,\"60\":60,\"73\":73,\"59\":59,\"58\":58,\"75\":75,\"29\":29,\"57\":57,\"74\":74,\"30\":30,\"31\":31,\"32\":32,\"35\":35}}}', '20', '0');
INSERT INTO sc_site VALUES ('57', '广西科技大学', 'gxut', '{\"driver\":\"mysqli\",\"host\":\"10.82.97.41\",\"database\":\"cj_gxut_db\",\"login\":\"cj_gxut\",\"password\":\"1sen161s2LkJCnye\",\"charset\":\"utf8\"}', null, '{\"site_name\":\"\\u5e7f\\u897f\\u79d1\\u6280\\u5927\\u5b66\\u5b66\\u4e60\\u7cfb\\u7edf\",\"lms_web_site_id\":\"34\",\"upload_file\":\"upload_files\\/gxut\",\"resource\":\"resources\\/public\\/lms\",\"logo\":\"resources\\/gxut\\/lms\\/logo.jpg\",\"college\":\"resources\\/gxut\\/lms\\/college.jpg\",\"site_about\":\"\\u7684\\u5feb\\u9012\\u8d39\",\"template\":{\"menu\":{\"1\":{\"name\":\"\\u9996\\u9875\",\"url\":\"default\\/main\"},\"2\":{\"name\":\"\\u6211\\u7684\\u8bfe\\u7a0b\",\"url\":\"course\"},\"3\":{\"name\":\"\\u6211\\u7684\\u7ec3\\u4e60\",\"url\":\"phase\"},\"5\":{\"name\":\"\\u6d88\\u606f\\u4e2d\\u5fc3\",\"url\":\"javascript:void(0);\",\"son\":{\"5_1\":{\"name\":\"\\u901a\\u77e5\\u516c\\u544a\",\"url\":\"message\\/notif\"},\"5_2\":{\"name\":\"\\u4e2a\\u4eba\\u6d88\\u606f\",\"url\":\"message\\/mymessage\"},\"5_3\":{\"name\":\"\\u7cfb\\u7edf\\u6d88\\u606f\",\"url\":\"message\\/sysmsg\"}}},\"6\":{\"name\":\"\\u77e5\\u8bc6\\u95ee\\u7b54\",\"url\":\"catechism\"},\"7\":{\"name\":\"\\u4e2a\\u4eba\\u4fe1\\u606f\",\"url\":\"info\"},\"8\":{\"name\":\"\\u6bd5\\u4e1a\\u8bbe\\u8ba1\",\"url\":\"#\"}}}}', '{\"site_name\":\"\\u5e7f\\u897f\\u79d1\\u6280\\u5927\\u5b66\\u7ba1\\u7406\\u7cfb\\u7edf\",\"sims_web_site_id\":\"34\",\"upload_file\":\"upload_files\\/gxut\",\"resource\":\"resources\\/public\\/sims\",\"logo\":\"resources\\/gxut\\/sims\\/logo.jpg\",\"background\":\"\",\"template\":{\"perms\":{\"studentNumber_index\":\"studentNumber_index\",\"studentNumber_update\":\"studentNumber_update\",\"grade_create\":\"grade_create\",\"grade_delete\":\"grade_delete\",\"grade_update\":\"grade_update\",\"term_create\":\"term_create\",\"term_delete\":\"term_delete\",\"term_update\":\"term_update\",\"correspondence_create\":\"correspondence_create\",\"studyType_create\":\"studyType_create\",\"studyType_delete\":\"studyType_delete\",\"studyType_update\":\"studyType_update\",\"studyLevel_create\":\"studyLevel_create\",\"studyLevel_delete\":\"studyLevel_delete\",\"studyLevel_update\":\"studyLevel_update\",\"disciplineType_create\":\"disciplineType_create\",\"discipline_create\":\"discipline_create\",\"classInfo_create\":\"classInfo_create\",\"classInfo_delete\":\"classInfo_delete\",\"classInfo_openCourse\":\"classInfo_openCourse\",\"classInfo_update\":\"classInfo_update\",\"download_create\":\"download_create\",\"download_delete\":\"download_delete\",\"download_index\":\"download_index\",\"download_update\":\"download_update\",\"enroll_create\":\"enroll_create\",\"enroll_import\":\"enroll_import\",\"enroll_score\":\"enroll_score\",\"enroll_delete\":\"enroll_delete\",\"enroll_enter\":\"enroll_enter\",\"enroll_update\":\"enroll_update\",\"enroll_placement\":\"enroll_placement\",\"userbc_check\":\"userbc_check\",\"userbc_create\":\"userbc_create\",\"userbc_delete\":\"userbc_delete\",\"userbc_edit\":\"userbc_edit\",\"userbc_import\":\"userbc_import\",\"userbc_index\":\"userbc_index\",\"user_register-term\":\"user_register-term\",\"user_register-term-cancel\":\"user_register-term-cancel\",\"user_register-term-register\":\"user_register-term-register\",\"user_edit\":\"user_edit\",\"user_index\":\"user_index\",\"teachPlan_create\":\"teachPlan_create\",\"teachPlan_delete\":\"teachPlan_delete\",\"teachPlan_update\":\"teachPlan_update\",\"teachPlanShlist_pass\":\"teachPlanShlist_pass\",\"teachPlanSplist_pass\":\"teachPlanSplist_pass\",\"teachPlanAdjust_pass\":\"teachPlanAdjust_pass\",\"building_create\":\"building_create\",\"building_delete\":\"building_delete\",\"building_freeze\":\"building_freeze\",\"building_taxis\":\"building_taxis\",\"building_update\":\"building_update\",\"roomType_create\":\"roomType_create\",\"roomType_delete\":\"roomType_delete\",\"roomType_taxis\":\"roomType_taxis\",\"roomType_update\":\"roomType_update\",\"room_create\":\"room_create\",\"room_delete\":\"room_delete\",\"room_taxis\":\"room_taxis\",\"room_update\":\"room_update\",\"teachingTask_create\":\"teachingTask_create\",\"teachingTask_delete\":\"teachingTask_delete\",\"teachingTask_update\":\"teachingTask_update\",\"courseNum_create\":\"courseNum_create\",\"courseNum_delete\":\"courseNum_delete\",\"courseNum_update\":\"courseNum_update\",\"handwork_create_class\":\"handwork_create_class\",\"handwork_create_select\":\"handwork_create_select\",\"handwork_delete\":\"handwork_delete\",\"handwork_update\":\"handwork_update\",\"handwork_view\":\"handwork_view\",\"studyProgress_index\":\"studyProgress_index\",\"coursetalk_delete\":\"coursetalk_delete\",\"coursetalk_index\":\"coursetalk_index\",\"coursetalk_reply\":\"coursetalk_reply\",\"coursetalk_update\":\"coursetalk_update\",\"quiz_index\":\"quiz_index\",\"itemsbug_delete\":\"itemsbug_delete\",\"itemsbug_export\":\"itemsbug_export\",\"itemsbug_view\":\"itemsbug_view\",\"resource_create\":\"resource_create\",\"resource_delete\":\"resource_delete\",\"resource_download\":\"resource_download\",\"resource_view\":\"resource_view\",\"score_create\":\"score_create\",\"score_delete\":\"score_delete\",\"score_index\":\"score_index\",\"score_update\":\"score_update\",\"waiver_create\":\"waiver_create\",\"waiver_delete\":\"waiver_delete\",\"waiver_index\":\"waiver_index\",\"waiver_update\":\"waiver_update\",\"replace_create\":\"replace_create\",\"replace_delete\":\"replace_delete\",\"replace_index\":\"replace_index\",\"replace_update\":\"replace_update\",\"testplan_create\":\"testplan_create\",\"testplan_delete\":\"testplan_delete\",\"testplan_edit\":\"testplan_edit\",\"testplan_index\":\"testplan_index\",\"examplan_create\":\"examplan_create\",\"examplan_delete\":\"examplan_delete\",\"examplan_exit\":\"examplan_exit\",\"examplan_index\":\"examplan_index\",\"makeup_index\":\"makeup_index\",\"leave_degree-apply\":\"leave_degree-apply\",\"leave_graduate\":\"leave_graduate\",\"leave_back-school\":\"leave_back-school\",\"leave_drop\":\"leave_drop\",\"leave_back-school2\":\"leave_back-school2\",\"leave_suspension\":\"leave_suspension\",\"delete_engage\":\"delete_engage\",\"update_engage\":\"update_engage\",\"leave_change-roll\":\"leave_change-roll\",\"leave_drop-create\":\"leave_drop-create\",\"leave_graduate-create\":\"leave_graduate-create\",\"leave_suspension-create\":\"leave_suspension-create\",\"user_change-correspondence-create\":\"user_change-correspondence-create\",\"leave_degree\":\"leave_degree\",\"user_change-discipline\":\"user_change-discipline\",\"user_change-discipline-do\":\"user_change-discipline-do\",\"courseNature_create\":\"courseNature_create\",\"courseNature_delete\":\"courseNature_delete\",\"courseNature_freeze\":\"courseNature_freeze\",\"courseNature_taxis\":\"courseNature_taxis\",\"courseNature_update\":\"courseNature_update\",\"courseType_create\":\"courseType_create\",\"courseType_delete\":\"courseType_delete\",\"courseType_freeze\":\"courseType_freeze\",\"courseType_taxis\":\"courseType_taxis\",\"courseType_update\":\"courseType_update\",\"course_create\":\"course_create\",\"course_delete\":\"course_delete\",\"course_update\":\"course_update\",\"knowledge_create\":\"knowledge_create\",\"knowledge_delete\":\"knowledge_delete\",\"knowledge_update\":\"knowledge_update\",\"questiontype_view\":\"questiontype_view\",\"questions_add\":\"questions_add\",\"questions_del\":\"questions_del\",\"questions_export\":\"questions_export\",\"questions_update\":\"questions_update\",\"questions_upload\":\"questions_upload\",\"questions_view\":\"questions_view\",\"coursetemplate_create\":\"coursetemplate_create\",\"coursetemplate_delete\":\"coursetemplate_delete\",\"coursetemplate_update\":\"coursetemplate_update\",\"coursetemplate_view\":\"coursetemplate_view\",\"phaseemplate_create\":\"phaseemplate_create\",\"phaseemplate_delete\":\"phaseemplate_delete\",\"phaseemplate_update\":\"phaseemplate_update\",\"phaseemplate_view\":\"phaseemplate_view\",\"yearsemplate_create\":\"yearsemplate_create\",\"yearsemplate_delete\":\"yearsemplate_delete\",\"yearsemplate_update\":\"yearsemplate_update\",\"yearsemplate_view\":\"yearsemplate_view\",\"teacher_create\":\"teacher_create\",\"teacher_delete\":\"teacher_delete\",\"teacher_update\":\"teacher_update\",\"notice_create\":\"notice_create\",\"notice_delete\":\"notice_delete\",\"notice_edit\":\"notice_edit\",\"count_student\":\"count_student\",\"password_update\":\"password_update\",\"log_restore\":\"log_restore\",\"log_view\":\"log_view\",\"shortcut_update\":\"shortcut_update\",\"permission_create\":\"permission_create\",\"permission_delete\":\"permission_delete\",\"permission_update\":\"permission_update\",\"role_create\":\"role_create\",\"role_delete\":\"role_delete\",\"role_permission\":\"role_permission\",\"role_update\":\"role_update\",\"menu_create\":\"menu_create\",\"menu_delete\":\"menu_delete\",\"menu_taxis\":\"menu_taxis\",\"menu_update\":\"menu_update\",\"admin_create\":\"admin_create\",\"admin_delete\":\"admin_delete\",\"admin_quickentry\":\"admin_quickentry\",\"admin_update\":\"admin_update\"},\"menu\":{\"83\":83,\"1\":1,\"2\":2,\"3\":3,\"4\":4,\"5\":5,\"6\":6,\"7\":7,\"8\":8,\"9\":9,\"80\":80,\"24\":24,\"23\":23,\"25\":25,\"26\":26,\"27\":27,\"28\":28,\"14\":14,\"79\":79,\"16\":16,\"15\":15,\"37\":37,\"36\":36,\"38\":38,\"49\":49,\"50\":50,\"40\":40,\"42\":42,\"43\":43,\"48\":48,\"53\":53,\"54\":54,\"72\":72,\"71\":71,\"76\":76,\"77\":77,\"81\":81,\"82\":82,\"45\":45,\"44\":44,\"46\":46,\"47\":47,\"51\":51,\"52\":52,\"63\":63,\"39\":39,\"13\":13,\"22\":22,\"21\":21,\"61\":61,\"18\":18,\"41\":41,\"19\":19,\"10\":10,\"78\":78,\"11\":11,\"12\":12,\"65\":65,\"64\":64,\"66\":66,\"67\":67,\"68\":68,\"69\":69,\"70\":70,\"34\":34,\"33\":33,\"60\":60,\"73\":73,\"59\":59,\"58\":58,\"75\":75,\"29\":29,\"57\":57,\"74\":74,\"30\":30,\"31\":31,\"32\":32,\"35\":35}}}', '20', '0');

-- ----------------------------
-- Table structure for `sc_template`
-- ----------------------------
DROP TABLE IF EXISTS `sc_template`;
CREATE TABLE `sc_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(100) DEFAULT NULL COMMENT '模板名称',
  `lms_template` text COMMENT '学习系统模板信息',
  `sims_template` text COMMENT '管理系统模板信息',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '是否删除 0：未删除 1：已删除',
  `sims_perms` text COMMENT '管理系统权限 json格式',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_template
-- ----------------------------
INSERT INTO sc_template VALUES ('21', 'ww', '{\"menu\":{\"1\":{\"name\":\"\\u9996\\u9875\",\"url\":\"default\\/main\"}}}', '{\"perms\":{\"ss_create\":\"ss_create\",\"ss_son_create\":\"ss_son_create\"},\"menu\":{\"85\":85,\"87\":87}}', '1', '{\"85\":[\"ss_create\"],\"87\":[\"ss_son_create\"]}');
INSERT INTO sc_template VALUES ('20', '新的菜单测试', '{\"menu\":{\"1\":{\"name\":\"\\u9996\\u9875\",\"url\":\"default\\/main\",\"menu_tag\":\"main\"},\"2\":{\"name\":\"\\u6211\\u7684\\u8bfe\\u7a0b\",\"url\":\"course\",\"menu_tag\":\"course\"},\"3\":{\"name\":\"\\u6211\\u7684\\u7ec3\\u4e60\",\"url\":\"phase\",\"menu_tag\":\"coursepractice\"},\"4\":{\"name\":\"\\u6559\\u52a1\\u8ba1\\u5212\",\"url\":\"javascript:void(0);\",\"menu_tag\":\"plan\",\"son\":{\"4_1\":{\"name\":\"\\u6559\\u5b66\\u8ba1\\u5212\",\"url\":\"planteach\",\"menu_tag\":\"plan\"},\"4_2\":{\"name\":\"\\u6210\\u7ee9\\u67e5\\u8be2\",\"url\":\"planscore\",\"menu_tag\":\"plan\"},\"4_3\":{\"name\":\"\\u5b66\\u4e60\\u8fdb\\u5ea6\",\"url\":\"learnprocess\",\"menu_tag\":\"plan\"}}},\"5\":{\"name\":\"\\u6d88\\u606f\\u4e2d\\u5fc3\",\"url\":\"javascript:void(0);\",\"menu_tag\":\"message\",\"son\":{\"5_1\":{\"name\":\"\\u901a\\u77e5\\u516c\\u544a\",\"url\":\"message\\/notif\",\"menu_tag\":\"message\"},\"5_2\":{\"name\":\"\\u4e2a\\u4eba\\u6d88\\u606f\",\"url\":\"message\\/mymessage\",\"menu_tag\":\"message\"},\"5_3\":{\"name\":\"\\u7cfb\\u7edf\\u6d88\\u606f\",\"url\":\"message\\/sysmsg\",\"menu_tag\":\"message\"}}},\"6\":{\"name\":\"\\u77e5\\u8bc6\\u95ee\\u7b54\",\"url\":\"catechism\",\"menu_tag\":\"catechism\"},\"7\":{\"name\":\"\\u4e2a\\u4eba\\u4fe1\\u606f\",\"url\":\"info\",\"menu_tag\":\"info\"},\"8\":{\"name\":\"\\u6bd5\\u4e1a\\u8bbe\\u8ba1\",\"url\":\"#\",\"menu_tag\":\"\"}}}', '{\"perms\":{\"studentNumber_index\":\"studentNumber_index\",\"studentNumber_update\":\"studentNumber_update\",\"grade_create\":\"grade_create\",\"grade_delete\":\"grade_delete\",\"grade_update\":\"grade_update\",\"term_create\":\"term_create\",\"term_delete\":\"term_delete\",\"term_update\":\"term_update\",\"correspondence_create\":\"correspondence_create\",\"studyType_create\":\"studyType_create\",\"studyType_delete\":\"studyType_delete\",\"studyType_update\":\"studyType_update\",\"studyLevel_create\":\"studyLevel_create\",\"studyLevel_delete\":\"studyLevel_delete\",\"studyLevel_update\":\"studyLevel_update\",\"disciplineType_create\":\"disciplineType_create\",\"discipline_create\":\"discipline_create\",\"classInfo_create\":\"classInfo_create\",\"classInfo_delete\":\"classInfo_delete\",\"classInfo_openCourse\":\"classInfo_openCourse\",\"classInfo_update\":\"classInfo_update\",\"download_create\":\"download_create\",\"download_delete\":\"download_delete\",\"download_index\":\"download_index\",\"download_update\":\"download_update\",\"enroll_create\":\"enroll_create\",\"enroll_import\":\"enroll_import\",\"enroll_score\":\"enroll_score\",\"enroll_delete\":\"enroll_delete\",\"enroll_enter\":\"enroll_enter\",\"enroll_update\":\"enroll_update\",\"enroll_placement\":\"enroll_placement\",\"userbc_check\":\"userbc_check\",\"userbc_create\":\"userbc_create\",\"userbc_delete\":\"userbc_delete\",\"userbc_edit\":\"userbc_edit\",\"userbc_import\":\"userbc_import\",\"userbc_index\":\"userbc_index\",\"user_register-term\":\"user_register-term\",\"user_register-term-cancel\":\"user_register-term-cancel\",\"user_register-term-register\":\"user_register-term-register\",\"user_edit\":\"user_edit\",\"user_index\":\"user_index\",\"teachPlan_create\":\"teachPlan_create\",\"teachPlan_delete\":\"teachPlan_delete\",\"teachPlan_update\":\"teachPlan_update\",\"teachPlanShlist_pass\":\"teachPlanShlist_pass\",\"teachPlanSplist_pass\":\"teachPlanSplist_pass\",\"teachPlanAdjust_pass\":\"teachPlanAdjust_pass\",\"building_create\":\"building_create\",\"building_delete\":\"building_delete\",\"building_freeze\":\"building_freeze\",\"building_taxis\":\"building_taxis\",\"building_update\":\"building_update\",\"roomType_create\":\"roomType_create\",\"roomType_delete\":\"roomType_delete\",\"roomType_taxis\":\"roomType_taxis\",\"roomType_update\":\"roomType_update\",\"room_create\":\"room_create\",\"room_delete\":\"room_delete\",\"room_taxis\":\"room_taxis\",\"room_update\":\"room_update\",\"teachingTask_create\":\"teachingTask_create\",\"teachingTask_delete\":\"teachingTask_delete\",\"teachingTask_update\":\"teachingTask_update\",\"courseNum_create\":\"courseNum_create\",\"courseNum_delete\":\"courseNum_delete\",\"courseNum_update\":\"courseNum_update\",\"handwork_create_class\":\"handwork_create_class\",\"handwork_create_select\":\"handwork_create_select\",\"handwork_delete\":\"handwork_delete\",\"handwork_update\":\"handwork_update\",\"handwork_view\":\"handwork_view\",\"studyProgress_index\":\"studyProgress_index\",\"coursetalk_delete\":\"coursetalk_delete\",\"coursetalk_index\":\"coursetalk_index\",\"coursetalk_reply\":\"coursetalk_reply\",\"coursetalk_update\":\"coursetalk_update\",\"quiz_index\":\"quiz_index\",\"itemsbug_delete\":\"itemsbug_delete\",\"itemsbug_export\":\"itemsbug_export\",\"itemsbug_view\":\"itemsbug_view\",\"resource_create\":\"resource_create\",\"resource_delete\":\"resource_delete\",\"resource_download\":\"resource_download\",\"resource_view\":\"resource_view\",\"score_create\":\"score_create\",\"score_delete\":\"score_delete\",\"score_index\":\"score_index\",\"score_update\":\"score_update\",\"waiver_create\":\"waiver_create\",\"waiver_delete\":\"waiver_delete\",\"waiver_index\":\"waiver_index\",\"waiver_update\":\"waiver_update\",\"replace_create\":\"replace_create\",\"replace_delete\":\"replace_delete\",\"replace_index\":\"replace_index\",\"replace_update\":\"replace_update\",\"testplan_create\":\"testplan_create\",\"testplan_delete\":\"testplan_delete\",\"testplan_edit\":\"testplan_edit\",\"testplan_index\":\"testplan_index\",\"examplan_create\":\"examplan_create\",\"examplan_delete\":\"examplan_delete\",\"examplan_exit\":\"examplan_exit\",\"examplan_index\":\"examplan_index\",\"makeup_index\":\"makeup_index\",\"leave_degree-apply\":\"leave_degree-apply\",\"leave_graduate\":\"leave_graduate\",\"leave_back-school\":\"leave_back-school\",\"leave_drop\":\"leave_drop\",\"leave_back-school2\":\"leave_back-school2\",\"leave_suspension\":\"leave_suspension\",\"delete_engage\":\"delete_engage\",\"update_engage\":\"update_engage\",\"leave_change-roll\":\"leave_change-roll\",\"leave_drop-create\":\"leave_drop-create\",\"leave_graduate-create\":\"leave_graduate-create\",\"leave_suspension-create\":\"leave_suspension-create\",\"user_change-correspondence-create\":\"user_change-correspondence-create\",\"leave_degree\":\"leave_degree\",\"user_change-discipline\":\"user_change-discipline\",\"user_change-discipline-do\":\"user_change-discipline-do\",\"courseNature_create\":\"courseNature_create\",\"courseNature_delete\":\"courseNature_delete\",\"courseNature_freeze\":\"courseNature_freeze\",\"courseNature_taxis\":\"courseNature_taxis\",\"courseNature_update\":\"courseNature_update\",\"courseType_create\":\"courseType_create\",\"courseType_delete\":\"courseType_delete\",\"courseType_freeze\":\"courseType_freeze\",\"courseType_taxis\":\"courseType_taxis\",\"courseType_update\":\"courseType_update\",\"course_create\":\"course_create\",\"course_delete\":\"course_delete\",\"course_update\":\"course_update\",\"knowledge_create\":\"knowledge_create\",\"knowledge_delete\":\"knowledge_delete\",\"knowledge_update\":\"knowledge_update\",\"questiontype_view\":\"questiontype_view\",\"questions_add\":\"questions_add\",\"questions_del\":\"questions_del\",\"questions_export\":\"questions_export\",\"questions_update\":\"questions_update\",\"questions_upload\":\"questions_upload\",\"questions_view\":\"questions_view\",\"coursetemplate_create\":\"coursetemplate_create\",\"coursetemplate_delete\":\"coursetemplate_delete\",\"coursetemplate_update\":\"coursetemplate_update\",\"coursetemplate_view\":\"coursetemplate_view\",\"phaseemplate_create\":\"phaseemplate_create\",\"phaseemplate_delete\":\"phaseemplate_delete\",\"phaseemplate_update\":\"phaseemplate_update\",\"phaseemplate_view\":\"phaseemplate_view\",\"yearsemplate_create\":\"yearsemplate_create\",\"yearsemplate_delete\":\"yearsemplate_delete\",\"yearsemplate_update\":\"yearsemplate_update\",\"yearsemplate_view\":\"yearsemplate_view\",\"teacher_create\":\"teacher_create\",\"teacher_delete\":\"teacher_delete\",\"teacher_update\":\"teacher_update\",\"notice_create\":\"notice_create\",\"notice_delete\":\"notice_delete\",\"notice_edit\":\"notice_edit\",\"count_student\":\"count_student\",\"password_update\":\"password_update\",\"log_restore\":\"log_restore\",\"log_view\":\"log_view\",\"shortcut_update\":\"shortcut_update\",\"permission_create\":\"permission_create\",\"permission_delete\":\"permission_delete\",\"permission_update\":\"permission_update\",\"role_create\":\"role_create\",\"role_delete\":\"role_delete\",\"role_permission\":\"role_permission\",\"role_update\":\"role_update\",\"menu_create\":\"menu_create\",\"menu_delete\":\"menu_delete\",\"menu_taxis\":\"menu_taxis\",\"menu_update\":\"menu_update\",\"admin_quickentry\":\"admin_quickentry\",\"admin_update\":\"admin_update\"},\"menu\":{\"83\":83,\"1\":1,\"2\":2,\"3\":3,\"4\":4,\"5\":5,\"6\":6,\"7\":7,\"8\":8,\"9\":9,\"80\":80,\"24\":24,\"23\":23,\"25\":25,\"26\":26,\"27\":27,\"28\":28,\"14\":14,\"79\":79,\"16\":16,\"15\":15,\"37\":37,\"36\":36,\"38\":38,\"49\":49,\"50\":50,\"40\":40,\"42\":42,\"43\":43,\"48\":48,\"53\":53,\"54\":54,\"72\":72,\"71\":71,\"76\":76,\"77\":77,\"81\":81,\"82\":82,\"45\":45,\"44\":44,\"46\":46,\"47\":47,\"51\":51,\"52\":52,\"63\":63,\"39\":39,\"13\":13,\"22\":22,\"21\":21,\"61\":61,\"18\":18,\"41\":41,\"19\":19,\"10\":10,\"78\":78,\"11\":11,\"12\":12,\"65\":65,\"64\":64,\"66\":66,\"67\":67,\"68\":68,\"69\":69,\"70\":70,\"34\":34,\"33\":33,\"60\":60,\"73\":73,\"59\":59,\"58\":58,\"75\":75,\"29\":29,\"57\":57,\"74\":74,\"30\":30,\"31\":31,\"32\":32,\"35\":35}}', '0', '{\"87\":[\"ss_son_create\"]}');
INSERT INTO sc_template VALUES ('22', '测试菜单', '{\"menu\":{\"2\":{\"name\":\"\\u6211\\u7684\\u8bfe\\u7a0b\",\"url\":\"course\",\"menu_tag\":\"course\"}}}', '{\"perms\":{\"studentNumber_index\":\"studentNumber_index\",\"studentNumber_update\":\"studentNumber_update\"},\"menu\":{\"83\":83,\"1\":1}}', '0', '{\"83\":[\"studentNumber_index\"]}');

-- ----------------------------
-- Table structure for `sms_auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `sms_auth_item`;
CREATE TABLE `sms_auth_item` (
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
  KEY `created_at` (`created_at`),
  CONSTRAINT `sms_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `crjy_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理权权限条目';

-- ----------------------------
-- Records of sms_auth_item
-- ----------------------------
INSERT INTO sms_auth_item VALUES ('admin_create', '2', '用户添加', null, null, null, null, '35');
INSERT INTO sms_auth_item VALUES ('admin_delete', '2', '用户删除', null, null, null, null, '35');
INSERT INTO sms_auth_item VALUES ('admin_quickentry', '2', '快捷入口设置', null, null, null, null, '35');
INSERT INTO sms_auth_item VALUES ('admin_update', '2', '用户修改', null, null, null, null, '35');
INSERT INTO sms_auth_item VALUES ('building_create', '2', '教学楼添加', null, null, null, null, '40');
INSERT INTO sms_auth_item VALUES ('building_delete', '2', '教学楼删除', null, null, null, null, '40');
INSERT INTO sms_auth_item VALUES ('building_freeze', '2', '教学楼冻结', null, null, null, null, '40');
INSERT INTO sms_auth_item VALUES ('building_taxis', '2', '教学楼排序', null, null, null, null, '40');
INSERT INTO sms_auth_item VALUES ('building_update', '2', '教学楼修改', null, null, null, null, '40');
INSERT INTO sms_auth_item VALUES ('classInfo_create', '2', '班级添加', null, null, null, null, '9');
INSERT INTO sms_auth_item VALUES ('classInfo_delete', '2', '班级删除', null, null, null, null, '9');
INSERT INTO sms_auth_item VALUES ('classInfo_openCourse', '2', '开课', null, null, null, null, '9');
INSERT INTO sms_auth_item VALUES ('classInfo_update', '2', '班级修改', null, null, null, null, '9');
INSERT INTO sms_auth_item VALUES ('correspondence_create', '2', '函授站添加', null, null, null, null, '4');
INSERT INTO sms_auth_item VALUES ('count_student', '2', '学生统计查看', null, null, null, null, '59');
INSERT INTO sms_auth_item VALUES ('courseNature_create', '2', '课程性质添加', null, null, null, null, '10');
INSERT INTO sms_auth_item VALUES ('courseNature_delete', '2', '课程性质删除', null, null, null, null, '10');
INSERT INTO sms_auth_item VALUES ('courseNature_freeze', '2', '课程性质冻结', null, null, null, null, '10');
INSERT INTO sms_auth_item VALUES ('courseNature_taxis', '2', '课程性质排序', null, null, null, null, '10');
INSERT INTO sms_auth_item VALUES ('courseNature_update', '2', '课程性质修改', null, null, null, null, '10');
INSERT INTO sms_auth_item VALUES ('courseNum_create', '2', '添加上课节次', null, null, null, null, '53');
INSERT INTO sms_auth_item VALUES ('courseNum_delete', '2', '删除上课节次', null, null, null, null, '53');
INSERT INTO sms_auth_item VALUES ('courseNum_update', '2', '更新上课节次', null, null, null, null, '53');
INSERT INTO sms_auth_item VALUES ('coursetalk_delete', '2', '课堂讨论删除', null, null, null, null, '76');
INSERT INTO sms_auth_item VALUES ('coursetalk_index', '2', '课堂讨论查看', null, null, null, null, '76');
INSERT INTO sms_auth_item VALUES ('coursetalk_reply', '2', '课堂讨论回复', null, null, null, null, '76');
INSERT INTO sms_auth_item VALUES ('coursetalk_update', '2', '课堂讨论更新', null, null, null, null, '76');
INSERT INTO sms_auth_item VALUES ('coursetemplate_create', '2', '课程作业添加', null, null, null, null, '68');
INSERT INTO sms_auth_item VALUES ('coursetemplate_delete', '2', '课程作业删除', null, null, null, null, '68');
INSERT INTO sms_auth_item VALUES ('coursetemplate_update', '2', '课程作业修改', null, null, null, null, '68');
INSERT INTO sms_auth_item VALUES ('coursetemplate_view', '2', '课程作业查看', null, null, null, null, '68');
INSERT INTO sms_auth_item VALUES ('courseType_create', '2', '课程类型添加', null, null, null, null, '11');
INSERT INTO sms_auth_item VALUES ('courseType_delete', '2', '课程类型删除', null, null, null, null, '11');
INSERT INTO sms_auth_item VALUES ('courseType_freeze', '2', '课程类型冻结', null, null, null, null, '11');
INSERT INTO sms_auth_item VALUES ('courseType_taxis', '2', '课程类型排序', null, null, null, null, '11');
INSERT INTO sms_auth_item VALUES ('courseType_update', '2', '课程类型修改', null, null, null, null, '11');
INSERT INTO sms_auth_item VALUES ('course_create', '2', '课程添加', null, null, null, null, '12');
INSERT INTO sms_auth_item VALUES ('course_delete', '2', '课程删除', null, null, null, null, '12');
INSERT INTO sms_auth_item VALUES ('course_update', '2', '课程修改', null, null, null, null, '12');
INSERT INTO sms_auth_item VALUES ('delete_engage', '2', '删除进修学生', null, null, null, null, '61');
INSERT INTO sms_auth_item VALUES ('disciplineType_create', '2', '专业类别添加', null, null, null, null, '7');
INSERT INTO sms_auth_item VALUES ('discipline_create', '2', '专业添加', null, null, '1442477748', '1442477748', '8');
INSERT INTO sms_auth_item VALUES ('download_create', '2', '资料增加', null, null, null, null, '80');
INSERT INTO sms_auth_item VALUES ('download_delete', '2', '资料删除', null, null, null, null, '80');
INSERT INTO sms_auth_item VALUES ('download_index', '2', '资料查看', null, null, null, null, '80');
INSERT INTO sms_auth_item VALUES ('download_update', '2', '资料更新', null, null, null, null, '80');
INSERT INTO sms_auth_item VALUES ('enroll_create', '2', '成考报名', null, null, null, null, '24');
INSERT INTO sms_auth_item VALUES ('enroll_delete', '2', '删除录取', null, null, null, null, '27');
INSERT INTO sms_auth_item VALUES ('enroll_enter', '2', '成考录取', null, null, null, null, '27');
INSERT INTO sms_auth_item VALUES ('enroll_import', '2', '报名导入', null, null, null, null, '25');
INSERT INTO sms_auth_item VALUES ('enroll_placement', '2', '分班', null, null, null, null, '28');
INSERT INTO sms_auth_item VALUES ('enroll_score', '2', '成绩导入', null, null, null, null, '26');
INSERT INTO sms_auth_item VALUES ('enroll_update', '2', '录取修改', null, null, null, null, '27');
INSERT INTO sms_auth_item VALUES ('examplan_create', '2', '添加考场安排', null, null, null, null, '52');
INSERT INTO sms_auth_item VALUES ('examplan_delete', '2', '删除考场安排', null, null, null, null, '52');
INSERT INTO sms_auth_item VALUES ('examplan_exit', '2', '修改考场安排', null, null, null, null, '52');
INSERT INTO sms_auth_item VALUES ('examplan_index', '2', '查询考场安排', null, null, null, null, '52');
INSERT INTO sms_auth_item VALUES ('grade_create', '2', '年级添加', null, null, null, null, '2');
INSERT INTO sms_auth_item VALUES ('grade_delete', '2', '年级删除', null, null, null, null, '2');
INSERT INTO sms_auth_item VALUES ('grade_update', '2', '年级修改', null, null, null, null, '2');
INSERT INTO sms_auth_item VALUES ('handwork_create_class', '2', '按班级排课', null, null, null, null, '54');
INSERT INTO sms_auth_item VALUES ('handwork_create_select', '2', '排选修课', null, null, null, null, '54');
INSERT INTO sms_auth_item VALUES ('handwork_delete', '2', '删除排课', null, null, null, null, '54');
INSERT INTO sms_auth_item VALUES ('handwork_update', '2', '修改排课', null, null, null, null, '54');
INSERT INTO sms_auth_item VALUES ('handwork_view', '2', '查看排课表', null, null, null, null, '54');
INSERT INTO sms_auth_item VALUES ('itemsbug_delete', '2', '课程纠错删除', null, null, null, null, '81');
INSERT INTO sms_auth_item VALUES ('itemsbug_export', '2', '课程纠错导出', null, null, null, null, '81');
INSERT INTO sms_auth_item VALUES ('itemsbug_view', '2', '课程纠错查看', null, null, null, null, '81');
INSERT INTO sms_auth_item VALUES ('knowledge_create', '2', '知识点添加', null, null, null, null, '65');
INSERT INTO sms_auth_item VALUES ('knowledge_delete', '2', '知识点删除', null, null, null, null, '65');
INSERT INTO sms_auth_item VALUES ('knowledge_update', '2', '知识点修改', null, null, null, null, '65');
INSERT INTO sms_auth_item VALUES ('leave_back-school', '2', '退学学生复学', null, null, null, null, '22');
INSERT INTO sms_auth_item VALUES ('leave_back-school2', '2', '休学学生复学', null, null, null, null, '21');
INSERT INTO sms_auth_item VALUES ('leave_change-roll', '2', '学籍异动', null, null, null, null, '18');
INSERT INTO sms_auth_item VALUES ('leave_degree', '2', '学位管理查看', null, null, null, null, '41');
INSERT INTO sms_auth_item VALUES ('leave_degree-apply', '2', '学位申请', null, null, null, null, '39');
INSERT INTO sms_auth_item VALUES ('leave_drop', '2', '退学学生', null, null, null, null, '22');
INSERT INTO sms_auth_item VALUES ('leave_drop-create', '2', '退学学生添加', null, null, null, null, '18');
INSERT INTO sms_auth_item VALUES ('leave_graduate', '2', '毕业学生', null, null, null, null, '39');
INSERT INTO sms_auth_item VALUES ('leave_graduate-create', '2', '毕业学生添加', null, null, null, null, '18');
INSERT INTO sms_auth_item VALUES ('leave_suspension', '2', '休学学生', null, null, null, null, '21');
INSERT INTO sms_auth_item VALUES ('leave_suspension-create', '2', '休学学生添加', null, null, null, null, '18');
INSERT INTO sms_auth_item VALUES ('log_restore', '2', '日志恢复', null, null, null, null, '57');
INSERT INTO sms_auth_item VALUES ('log_view', '2', '日志查看', null, null, null, null, '57');
INSERT INTO sms_auth_item VALUES ('makeup_index', '2', '补考成绩查看', null, null, null, null, '63');
INSERT INTO sms_auth_item VALUES ('menu_create', '2', '菜单添加', null, null, null, null, '32');
INSERT INTO sms_auth_item VALUES ('menu_delete', '2', '菜单删除', null, null, null, null, '32');
INSERT INTO sms_auth_item VALUES ('menu_taxis', '2', '菜单排序', null, null, null, null, '32');
INSERT INTO sms_auth_item VALUES ('menu_update', '2', '菜单修改', null, null, null, null, '32');
INSERT INTO sms_auth_item VALUES ('notice_create', '2', '添加通知公告', null, null, null, null, '60');
INSERT INTO sms_auth_item VALUES ('notice_delete', '2', '删除通知公告', null, null, null, null, '60');
INSERT INTO sms_auth_item VALUES ('notice_edit', '2', '编辑通知公告', null, null, null, null, '60');
INSERT INTO sms_auth_item VALUES ('password_update', '2', '修改密码', null, null, null, null, '75');
INSERT INTO sms_auth_item VALUES ('permission_create', '2', '权限添加', null, null, null, null, '30');
INSERT INTO sms_auth_item VALUES ('permission_delete', '2', '权限删除', null, null, null, null, '30');
INSERT INTO sms_auth_item VALUES ('permission_update', '2', '权限修改', null, null, null, null, '30');
INSERT INTO sms_auth_item VALUES ('phaseemplate_create', '2', '预测模拟添加', null, null, null, null, '69');
INSERT INTO sms_auth_item VALUES ('phaseemplate_delete', '2', '预测模拟删除', null, null, null, null, '69');
INSERT INTO sms_auth_item VALUES ('phaseemplate_update', '2', '预测模拟修改', null, null, null, null, '69');
INSERT INTO sms_auth_item VALUES ('phaseemplate_view', '2', '预测模拟查看', null, null, null, null, '69');
INSERT INTO sms_auth_item VALUES ('questions_add', '2', '题库添加', null, null, null, null, '67');
INSERT INTO sms_auth_item VALUES ('questions_del', '2', '题库删除', null, null, null, null, '67');
INSERT INTO sms_auth_item VALUES ('questions_export', '2', '题库导出', null, null, null, null, '67');
INSERT INTO sms_auth_item VALUES ('questions_update', '2', '题库修改', null, null, null, null, '67');
INSERT INTO sms_auth_item VALUES ('questions_upload', '2', '题库导入', null, null, null, null, '67');
INSERT INTO sms_auth_item VALUES ('questions_view', '2', '题库查看', null, null, null, null, '67');
INSERT INTO sms_auth_item VALUES ('questiontype_view', '2', '题型查看', null, null, null, null, '66');
INSERT INTO sms_auth_item VALUES ('quiz_index', '2', '查看问答管理', null, null, null, null, '77');
INSERT INTO sms_auth_item VALUES ('replace_create', '2', '证书顶替添加', null, null, null, null, '47');
INSERT INTO sms_auth_item VALUES ('replace_delete', '2', '证书顶替删除', null, null, null, null, '47');
INSERT INTO sms_auth_item VALUES ('replace_index', '2', '证书顶替查看', null, null, null, null, '47');
INSERT INTO sms_auth_item VALUES ('replace_update', '2', '证书顶替修改', null, null, null, null, '47');
INSERT INTO sms_auth_item VALUES ('resource_create', '2', '资源管理添加', null, null, null, null, '82');
INSERT INTO sms_auth_item VALUES ('resource_delete', '2', '资料删除', null, null, null, null, '82');
INSERT INTO sms_auth_item VALUES ('resource_download', '2', '资源管理下载', null, null, null, null, '82');
INSERT INTO sms_auth_item VALUES ('resource_view', '2', '资源管理查看', null, null, null, null, '82');
INSERT INTO sms_auth_item VALUES ('role_create', '2', '角色添加', null, null, null, null, '31');
INSERT INTO sms_auth_item VALUES ('role_delete', '2', '角色删除', null, null, null, null, '31');
INSERT INTO sms_auth_item VALUES ('role_permission', '2', '角色权限设置', null, null, null, null, '31');
INSERT INTO sms_auth_item VALUES ('role_update', '2', '角色修改', null, null, null, null, '31');
INSERT INTO sms_auth_item VALUES ('roomType_create', '2', '教室类型添加', null, null, null, null, '42');
INSERT INTO sms_auth_item VALUES ('roomType_delete', '2', '教室类型删除', null, null, null, null, '42');
INSERT INTO sms_auth_item VALUES ('roomType_taxis', '2', '教室类型排序', null, null, null, null, '42');
INSERT INTO sms_auth_item VALUES ('roomType_update', '2', '教室类型修改', null, null, null, null, '42');
INSERT INTO sms_auth_item VALUES ('room_create', '2', '教室添加', null, null, null, null, '43');
INSERT INTO sms_auth_item VALUES ('room_delete', '2', '教室删除', null, null, null, null, '43');
INSERT INTO sms_auth_item VALUES ('room_taxis', '2', '教室排序', null, null, null, null, '43');
INSERT INTO sms_auth_item VALUES ('room_update', '2', '教室修改', null, null, null, null, '43');
INSERT INTO sms_auth_item VALUES ('score_create', '2', '成绩添加', null, null, null, null, '45');
INSERT INTO sms_auth_item VALUES ('score_delete', '2', '成绩删除', null, null, null, null, '45');
INSERT INTO sms_auth_item VALUES ('score_index', '2', '成绩管理查看', null, null, null, null, '45');
INSERT INTO sms_auth_item VALUES ('score_update', '2', '成绩修改', null, null, null, null, '45');
INSERT INTO sms_auth_item VALUES ('shortcut_update', '2', '设置快捷方式', null, null, null, null, '74');
INSERT INTO sms_auth_item VALUES ('studentNumber_index', '2', '查看生成规则', null, null, null, null, '83');
INSERT INTO sms_auth_item VALUES ('studentNumber_update', '2', '修改学号生成规则', null, null, null, null, '83');
INSERT INTO sms_auth_item VALUES ('studyLevel_create', '2', '学习层次添加', null, null, null, null, '6');
INSERT INTO sms_auth_item VALUES ('studyLevel_delete', '2', '学习层次删除', null, null, null, null, '6');
INSERT INTO sms_auth_item VALUES ('studyLevel_update', '2', '学习层次更新', null, null, null, null, '6');
INSERT INTO sms_auth_item VALUES ('studyProgress_index', '2', '查看学习过程', null, null, null, null, '72');
INSERT INTO sms_auth_item VALUES ('studyTypeTest_create', '2', '测试模板添加', null, null, null, null, '55');
INSERT INTO sms_auth_item VALUES ('studyType_create', '2', '学习类型添加', null, null, null, null, '5');
INSERT INTO sms_auth_item VALUES ('studyType_delete', '2', '学习类型删除', null, null, null, null, '5');
INSERT INTO sms_auth_item VALUES ('studyType_update', '2', '学习类型更新', null, null, null, null, '5');
INSERT INTO sms_auth_item VALUES ('teacher_create', '2', '教师添加', null, null, null, null, '34');
INSERT INTO sms_auth_item VALUES ('teacher_delete', '2', '教师删除', null, null, null, null, '34');
INSERT INTO sms_auth_item VALUES ('teacher_update', '2', '教师修改', null, null, null, null, '34');
INSERT INTO sms_auth_item VALUES ('teachingTask_create', '2', '教学任务添加', null, null, null, null, '48');
INSERT INTO sms_auth_item VALUES ('teachingTask_delete', '2', '教学任务删除', null, null, null, null, '48');
INSERT INTO sms_auth_item VALUES ('teachingTask_update', '2', '教学任务修改', null, null, null, null, '48');
INSERT INTO sms_auth_item VALUES ('teachPlanAdjust_pass', '2', '教学计划调整', null, null, null, null, '50');
INSERT INTO sms_auth_item VALUES ('teachPlanShlist_pass', '2', '教学计划审核', null, null, null, null, '38');
INSERT INTO sms_auth_item VALUES ('teachPlanSplist_pass', '2', '教学计划审批', null, null, null, null, '49');
INSERT INTO sms_auth_item VALUES ('teachPlan_create', '2', '添加教学计划', null, null, null, null, '37');
INSERT INTO sms_auth_item VALUES ('teachPlan_delete', '2', '删除教学计划', null, null, null, null, '37');
INSERT INTO sms_auth_item VALUES ('teachPlan_update', '2', '修改教学计划', null, null, null, null, '37');
INSERT INTO sms_auth_item VALUES ('term_create', '2', '学期添加', null, null, '1', null, '3');
INSERT INTO sms_auth_item VALUES ('term_delete', '2', '学期删除', null, null, null, null, '3');
INSERT INTO sms_auth_item VALUES ('term_update', '2', '学期修改', null, null, null, null, '3');
INSERT INTO sms_auth_item VALUES ('testplan_create', '2', '添加考试计划', null, null, null, null, '51');
INSERT INTO sms_auth_item VALUES ('testplan_delete', '2', '删除考试计划', null, null, null, null, '51');
INSERT INTO sms_auth_item VALUES ('testplan_edit', '2', '修改考试计划', null, null, null, null, '51');
INSERT INTO sms_auth_item VALUES ('testplan_index', '2', '查询考试计划', null, null, null, null, '51');
INSERT INTO sms_auth_item VALUES ('update_engage', '2', '修改进修学生', null, null, null, null, '61');
INSERT INTO sms_auth_item VALUES ('userbc_check', '2', '学生录入审核', null, null, null, null, '14');
INSERT INTO sms_auth_item VALUES ('userbc_create', '2', '学生添加', null, null, null, null, '14');
INSERT INTO sms_auth_item VALUES ('userbc_delete', '2', '学生删除', null, null, null, null, '14');
INSERT INTO sms_auth_item VALUES ('userbc_edit', '2', '学生修改', null, null, null, null, '14');
INSERT INTO sms_auth_item VALUES ('userbc_import', '2', '学生批量导入', null, null, null, null, '14');
INSERT INTO sms_auth_item VALUES ('userbc_index', '2', '学生录入查看', null, null, null, null, '14');
INSERT INTO sms_auth_item VALUES ('user_change-correspondence-create', '2', '转函授点添加', null, null, null, null, '18');
INSERT INTO sms_auth_item VALUES ('user_change-discipline', '2', '转专业查看', null, null, null, null, '19');
INSERT INTO sms_auth_item VALUES ('user_change-discipline-do', '2', '转专业添加', null, null, null, null, '19');
INSERT INTO sms_auth_item VALUES ('user_degree', '2', '学位管理', null, null, null, null, '17');
INSERT INTO sms_auth_item VALUES ('user_edit', '2', '学生修改', null, null, null, null, '15');
INSERT INTO sms_auth_item VALUES ('user_index', '2', '学生管理查看', null, null, null, null, '15');
INSERT INTO sms_auth_item VALUES ('user_register-term', '2', '学期注册查看', null, null, null, null, '16');
INSERT INTO sms_auth_item VALUES ('user_register-term-cancel', '2', '取消注册', null, null, null, null, '16');
INSERT INTO sms_auth_item VALUES ('user_register-term-register', '2', '注册学期', null, null, null, null, '16');
INSERT INTO sms_auth_item VALUES ('waiver_create', '2', '免考免修添加', null, null, null, null, '46');
INSERT INTO sms_auth_item VALUES ('waiver_delete', '2', '免考免修删除', null, null, null, null, '46');
INSERT INTO sms_auth_item VALUES ('waiver_index', '2', '免考免修查看', null, null, null, null, '46');
INSERT INTO sms_auth_item VALUES ('waiver_update', '2', '免考免修更新', null, null, null, null, '46');
INSERT INTO sms_auth_item VALUES ('yearsemplate_create', '2', '历年真题添加', null, null, null, null, '70');
INSERT INTO sms_auth_item VALUES ('yearsemplate_delete', '2', '历年真题删除', null, null, null, null, '70');
INSERT INTO sms_auth_item VALUES ('yearsemplate_update', '2', '历年真题修改', null, null, null, null, '70');
INSERT INTO sms_auth_item VALUES ('yearsemplate_view', '2', '历年真题查看', null, null, null, null, '70');
INSERT INTO sms_auth_item VALUES ('zongadming', '1', '总管理员', null, null, null, null, null);

-- ----------------------------
-- Table structure for `sms_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sms_menu`;
CREATE TABLE `sms_menu` (
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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='系统管理员菜单权限表\r\n';

-- ----------------------------
-- Records of sms_menu
-- ----------------------------
INSERT INTO sms_menu VALUES ('1', '基础管理', '0', null, '100', null, '');
INSERT INTO sms_menu VALUES ('2', '年级管理', '1', null, null, null, 'grade/index');
INSERT INTO sms_menu VALUES ('3', '学期管理', '1', null, null, null, 'term/index');
INSERT INTO sms_menu VALUES ('4', '函授站管理', '1', null, null, null, 'correspondence/index');
INSERT INTO sms_menu VALUES ('5', '学习类型', '1', null, null, null, 'study-type/index');
INSERT INTO sms_menu VALUES ('6', '学习层次', '1', null, null, null, 'study-level/index');
INSERT INTO sms_menu VALUES ('7', '专业类别管理', '1', null, null, null, 'discipline-type/index');
INSERT INTO sms_menu VALUES ('8', '专业管理', '1', null, null, null, 'discipline/index');
INSERT INTO sms_menu VALUES ('9', '班级管理', '1', null, null, null, 'class-info/index');
INSERT INTO sms_menu VALUES ('10', '课程性质', '78', null, null, null, 'course-nature/index');
INSERT INTO sms_menu VALUES ('11', '课程类型', '78', null, null, null, 'course-type/index');
INSERT INTO sms_menu VALUES ('12', '课程设置', '78', null, null, null, 'course/index');
INSERT INTO sms_menu VALUES ('13', '学籍管理', '0', null, '70', null, '');
INSERT INTO sms_menu VALUES ('14', '学生录入', '79', null, '11', null, 'userbc/index');
INSERT INTO sms_menu VALUES ('15', '学生管理', '79', null, '9', null, 'user/index');
INSERT INTO sms_menu VALUES ('16', '学期注册', '79', null, '10', null, 'user/register-term');
INSERT INTO sms_menu VALUES ('18', '学籍异动', '13', null, '4', null, 'leave/change-roll');
INSERT INTO sms_menu VALUES ('19', '转专业', '13', null, '1', null, 'user/change-discipline');
INSERT INTO sms_menu VALUES ('20', '转函授站', '13', null, '2', null, 'user/change-correspondence');
INSERT INTO sms_menu VALUES ('21', '休学学生', '13', null, '6', null, 'leave/suspension');
INSERT INTO sms_menu VALUES ('22', '退学学生', '13', null, '7', null, 'leave/drop');
INSERT INTO sms_menu VALUES ('23', '招生管理', '0', null, '95', null, '');
INSERT INTO sms_menu VALUES ('24', '成考报名', '23', null, null, null, 'enroll/create');
INSERT INTO sms_menu VALUES ('25', '报名导入', '23', null, null, null, 'enroll/import');
INSERT INTO sms_menu VALUES ('26', '成绩管理', '23', null, null, null, 'enroll/score');
INSERT INTO sms_menu VALUES ('27', '录取管理', '23', null, null, null, 'enroll/enter');
INSERT INTO sms_menu VALUES ('28', '分班管理', '23', null, null, null, 'enroll/placement');
INSERT INTO sms_menu VALUES ('29', '系统设置', '0', null, '40', null, '');
INSERT INTO sms_menu VALUES ('30', '权限管理', '29', null, null, null, 'permission-form/index');
INSERT INTO sms_menu VALUES ('31', '角色管理', '29', null, null, null, 'role-form/index');
INSERT INTO sms_menu VALUES ('32', '菜单管理', '29', null, null, null, 'menu/index');
INSERT INTO sms_menu VALUES ('33', '教师管理', '0', null, '55', null, '');
INSERT INTO sms_menu VALUES ('34', '教师管理', '33', null, null, null, 'teacher/index');
INSERT INTO sms_menu VALUES ('35', '用户管理', '29', null, null, null, 'admin/index');
INSERT INTO sms_menu VALUES ('36', '教学管理', '0', null, '85', null, '');
INSERT INTO sms_menu VALUES ('37', '教学计划起草', '36', null, '100', null, 'teach-plan/index');
INSERT INTO sms_menu VALUES ('38', '教学计划审核', '36', null, '95', null, 'teach-plan/shlist');
INSERT INTO sms_menu VALUES ('39', '毕业学生', '13', null, '8', null, 'leave/graduate');
INSERT INTO sms_menu VALUES ('40', '教学楼管理', '36', null, '80', null, 'building/index');
INSERT INTO sms_menu VALUES ('41', '学位管理', '13', null, '3', null, 'leave/degree');
INSERT INTO sms_menu VALUES ('42', '教室类型管理', '36', null, '75', null, 'room-type/index');
INSERT INTO sms_menu VALUES ('43', '教室管理', '36', null, '70', null, 'room/index');
INSERT INTO sms_menu VALUES ('44', '考务管理', '0', null, '75', null, '');
INSERT INTO sms_menu VALUES ('45', '成绩管理', '44', null, null, null, 'score/index');
INSERT INTO sms_menu VALUES ('46', '免考免修', '44', null, null, null, 'waiver/index');
INSERT INTO sms_menu VALUES ('47', '证书顶替', '44', null, null, null, 'replace/index');
INSERT INTO sms_menu VALUES ('48', '开课管理', '36', null, '60', null, 'teaching-task/index');
INSERT INTO sms_menu VALUES ('49', '教学计划审批', '36', null, '90', null, 'teach-plan/splist');
INSERT INTO sms_menu VALUES ('50', '教学计划调整', '36', null, '85', null, 'teach-plan/adjust');
INSERT INTO sms_menu VALUES ('51', '考试计划', '44', null, null, null, 'testplan/index');
INSERT INTO sms_menu VALUES ('52', '考场安排', '44', null, null, null, 'testplan-room/index');
INSERT INTO sms_menu VALUES ('53', '设置上课节次', '36', null, '50', null, 'course-num/index');
INSERT INTO sms_menu VALUES ('54', '手动排课', '36', null, '10', null, 'handwork/index');
INSERT INTO sms_menu VALUES ('57', '日志管理', '29', null, '1', null, 'log/index');
INSERT INTO sms_menu VALUES ('58', '统计管理', '0', null, '45', null, '');
INSERT INTO sms_menu VALUES ('59', '学生统计', '58', null, null, null, 'count-management/student');
INSERT INTO sms_menu VALUES ('60', '通知公告', '73', null, '1', null, 'notice/index');
INSERT INTO sms_menu VALUES ('61', '进修学生', '13', null, '5', null, 'engage/index');
INSERT INTO sms_menu VALUES ('63', '补考管理', '44', null, null, null, 'makeup/index');
INSERT INTO sms_menu VALUES ('64', '题库管理', '0', null, '60', null, '');
INSERT INTO sms_menu VALUES ('65', '知识点管理', '64', null, null, null, 'knowledge/index');
INSERT INTO sms_menu VALUES ('66', '题型管理', '64', null, null, null, 'question-type/index');
INSERT INTO sms_menu VALUES ('67', '题库详情', '64', null, null, null, 'questions/list');
INSERT INTO sms_menu VALUES ('68', '课程作业模板', '64', null, null, null, 'course-practice/index');
INSERT INTO sms_menu VALUES ('69', '预测模拟模板', '64', null, null, null, 'phase/index');
INSERT INTO sms_menu VALUES ('70', '历年真题模板', '64', null, null, null, 'years/index');
INSERT INTO sms_menu VALUES ('71', '学习管理', '0', null, '80', null, '');
INSERT INTO sms_menu VALUES ('72', '学习过程', '71', null, null, null, 'study-manage/index');
INSERT INTO sms_menu VALUES ('73', '消息中心', '0', null, '50', null, '');
INSERT INTO sms_menu VALUES ('74', '设置快捷方式', '29', null, '1', null, 'shortcut/index');
INSERT INTO sms_menu VALUES ('75', '修改密码', '29', null, '2', null, 'admin/edit-password');
INSERT INTO sms_menu VALUES ('76', '课堂讨论', '71', null, null, null, 'course-talk/index');
INSERT INTO sms_menu VALUES ('77', '问答管理', '71', null, null, null, 'quiz/index');
INSERT INTO sms_menu VALUES ('78', '课程管理', '0', null, '65', null, '');
INSERT INTO sms_menu VALUES ('79', '学生管理', '0', null, '90', null, '');
INSERT INTO sms_menu VALUES ('80', '资料下载', '1', null, null, null, 'download/index');
INSERT INTO sms_menu VALUES ('81', '课程纠错', '71', null, null, null, 'items-bug/index');
INSERT INTO sms_menu VALUES ('82', '资源管理', '71', null, null, null, 'resource/index');
INSERT INTO sms_menu VALUES ('83', '学号生成规则', '1', null, '0', null, 'student-number/index');
