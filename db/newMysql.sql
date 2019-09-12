/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : renren_fast

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2019-09-12 10:51:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016C754C1C507874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'LAPTOP-LFVKUBN11568081838721', '1568088367332', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1565337600000', '-1', '5', 'PAUSED', 'CRON', '1565336382000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016C754C1C507874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'renren', '0 0/30 * * * ?', '1', '参数测试', '2019-08-09 15:33:38');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'renren', '0', null, '1', '2019-08-09 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'renren', '0', null, '3', '2019-08-09 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'renren', '0', null, '2', '2019-08-09 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'testTask', 'renren', '0', null, '1', '2019-08-13 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'renren', '0', null, '1', '2019-08-13 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('6', '1', 'testTask', 'renren', '0', null, '0', '2019-08-14 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'testTask', 'renren', '0', null, '1', '2019-08-14 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'testTask', 'renren', '0', null, '1', '2019-08-19 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('9', '1', 'testTask', 'renren', '0', null, '2', '2019-08-19 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('10', '1', 'testTask', 'renren', '0', null, '2', '2019-08-19 17:30:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('17cb32b6-3d86-4a76-89e2-da31a6217b60', 'a6yfa', '2019-08-13 17:25:08');
INSERT INTO `sys_captcha` VALUES ('7739851f-7607-42f0-8f09-79be8f33ddb2', '3wyxg', '2019-08-12 17:09:50');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"type\":1,\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"qiniuBucketName\":\"ios-app\",\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"\"}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"1\",\"password\":\"535d410f7c5de5c2dd01fa590474c1ffc2911ff05e7553c6e3fcb76e706c7af4\",\"salt\":\"mpsSha5SVdLBgK2twO7U\",\"email\":\"1@qq.com\",\"mobile\":\"12345678910\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Aug 9, 2019 5:24:25 PM\"}]', '228', '0:0:0:0:0:0:0:1', '2019-08-09 17:24:25');
INSERT INTO `sys_log` VALUES ('2', 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[2]]', '54', '0:0:0:0:0:0:0:1', '2019-08-09 17:26:30');
INSERT INTO `sys_log` VALUES ('3', 'admin', '暂停定时任务', 'io.renren.modules.job.controller.ScheduleJobController.pause()', '[[1]]', '65', '0:0:0:0:0:0:0:1', '2019-08-19 17:50:58');
INSERT INTO `sys_log` VALUES ('4', 'admin', '修改密码', 'io.renren.modules.sys.controller.SysUserController.password()', '[{\"password\":\"123456\",\"newPassword\":\"123456\"}]', '126', '0:0:0:0:0:0:0:1', '2019-08-19 18:00:24');
INSERT INTO `sys_log` VALUES ('5', 'admin', '修改密码', 'io.renren.modules.sys.controller.SysUserController.password()', '[{\"password\":\"admin\",\"newPassword\":\"123456\"}]', '74', '0:0:0:0:0:0:0:1', '2019-08-19 18:00:34');
INSERT INTO `sys_log` VALUES ('6', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"商品管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"zhedie\",\"orderNum\":1}]', '44', '0:0:0:0:0:0:0:1', '2019-08-22 11:24:40');
INSERT INTO `sys_log` VALUES ('7', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"商品分类\",\"url\":\"goods/fenlei\",\"perms\":\"\",\"type\":1,\"icon\":\"xiangqu\",\"orderNum\":0}]', '127', '0:0:0:0:0:0:0:1', '2019-08-22 11:38:44');
INSERT INTO `sys_log` VALUES ('8', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":31,\"name\":\"商品信息\",\"url\":\"goods/info\",\"perms\":\"\",\"type\":1,\"icon\":\"xiangqu\",\"orderNum\":0}]', '137', '0:0:0:0:0:0:0:1', '2019-08-22 11:39:13');
INSERT INTO `sys_log` VALUES ('9', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":34,\"parentId\":32,\"name\":\"新增\",\"url\":\"\",\"perms\":\"fenlei:add\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '137', '0:0:0:0:0:0:0:1', '2019-08-22 11:40:40');
INSERT INTO `sys_log` VALUES ('10', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":32,\"name\":\"新增\",\"url\":\"\",\"perms\":\"goods:fenlei:add\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '31', '0:0:0:0:0:0:0:1', '2019-08-22 11:41:05');
INSERT INTO `sys_log` VALUES ('11', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":35,\"parentId\":0,\"name\":\"客户信息\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"geren\",\"orderNum\":2}]', '46', '0:0:0:0:0:0:0:1', '2019-08-22 11:54:24');
INSERT INTO `sys_log` VALUES ('12', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":35,\"parentId\":0,\"name\":\"客户管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"geren\",\"orderNum\":2}]', '38', '0:0:0:0:0:0:0:1', '2019-08-22 11:55:21');
INSERT INTO `sys_log` VALUES ('13', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":36,\"parentId\":35,\"name\":\"进货商管理\",\"url\":\"customer/jinhuo\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '29', '0:0:0:0:0:0:0:1', '2019-08-22 11:57:26');
INSERT INTO `sys_log` VALUES ('14', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":37,\"parentId\":35,\"name\":\"出货商信息\",\"url\":\"customer/chuhuo\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '43', '0:0:0:0:0:0:0:1', '2019-08-22 11:58:00');
INSERT INTO `sys_log` VALUES ('15', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":37,\"parentId\":35,\"name\":\"出货商管理\",\"url\":\"customer/chuhuo\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '128', '0:0:0:0:0:0:0:1', '2019-08-22 11:58:28');
INSERT INTO `sys_log` VALUES ('16', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":38,\"parentId\":33,\"name\":\"新增\",\"url\":\"\",\"perms\":\"goods:info:add\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '135', '0:0:0:0:0:0:0:1', '2019-08-22 12:00:29');
INSERT INTO `sys_log` VALUES ('17', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":39,\"parentId\":0,\"name\":\"发票账单管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"log\",\"orderNum\":3}]', '36', '0:0:0:0:0:0:0:1', '2019-08-22 12:06:24');
INSERT INTO `sys_log` VALUES ('18', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":40,\"parentId\":39,\"name\":\"进货发票\",\"url\":\"bill/buy\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '129', '0:0:0:0:0:0:0:1', '2019-08-22 12:07:49');
INSERT INTO `sys_log` VALUES ('19', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":41,\"parentId\":39,\"name\":\"出货账单\",\"url\":\"bill/sell\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '134', '0:0:0:0:0:0:0:1', '2019-08-22 12:08:28');
INSERT INTO `sys_log` VALUES ('20', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"zxy\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[31,32,34,33,38,35,36,37,39,40,41,-666666],\"createTime\":\"Aug 22, 2019 12:13:24 PM\"}]', '254', '0:0:0:0:0:0:0:1', '2019-08-22 12:13:25');
INSERT INTO `sys_log` VALUES ('21', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"zxyadmin\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[31,32,34,33,38,35,36,37,39,40,41,-666666]}]', '196', '0:0:0:0:0:0:0:1', '2019-08-22 12:15:02');
INSERT INTO `sys_log` VALUES ('22', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"zxy\",\"password\":\"534f98734df5ca6370213844495cf86cf09de9cab70d1058503bdb4f9d71f666\",\"salt\":\"riUOJv5P7uauLE9TCnCE\",\"email\":\"zxy@163.com\",\"mobile\":\"13687322468\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Aug 22, 2019 12:15:57 PM\"}]', '255', '0:0:0:0:0:0:0:1', '2019-08-22 12:15:58');
INSERT INTO `sys_log` VALUES ('23', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[39]', '2', '0:0:0:0:0:0:0:1', '2019-08-29 10:32:21');
INSERT INTO `sys_log` VALUES ('24', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[32]', '2', '0:0:0:0:0:0:0:1', '2019-08-29 10:32:31');
INSERT INTO `sys_log` VALUES ('25', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[38]', '76', '0:0:0:0:0:0:0:1', '2019-08-29 10:32:39');
INSERT INTO `sys_log` VALUES ('26', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[33]', '66', '0:0:0:0:0:0:0:1', '2019-08-29 10:32:47');
INSERT INTO `sys_log` VALUES ('27', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[34]', '168', '0:0:0:0:0:0:0:1', '2019-08-29 10:32:53');
INSERT INTO `sys_log` VALUES ('28', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[32]', '202', '0:0:0:0:0:0:0:1', '2019-08-29 10:32:59');
INSERT INTO `sys_log` VALUES ('29', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[31]', '0', '0:0:0:0:0:0:0:1', '2019-08-29 10:33:04');
INSERT INTO `sys_log` VALUES ('30', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[31]', '0', '0:0:0:0:0:0:0:1', '2019-08-29 10:33:11');
INSERT INTO `sys_log` VALUES ('31', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[37]', '201', '0:0:0:0:0:0:0:1', '2019-08-29 10:33:18');
INSERT INTO `sys_log` VALUES ('32', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[36]', '74', '0:0:0:0:0:0:0:1', '2019-08-29 10:33:24');
INSERT INTO `sys_log` VALUES ('33', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[35]', '205', '0:0:0:0:0:0:0:1', '2019-08-29 10:33:29');
INSERT INTO `sys_log` VALUES ('34', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[31]', '0', '0:0:0:0:0:0:0:1', '2019-08-29 10:33:35');
INSERT INTO `sys_log` VALUES ('35', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[41]', '163', '0:0:0:0:0:0:0:1', '2019-08-29 10:33:40');
INSERT INTO `sys_log` VALUES ('36', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[40]', '200', '0:0:0:0:0:0:0:1', '2019-08-29 10:33:45');
INSERT INTO `sys_log` VALUES ('37', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[39]', '196', '0:0:0:0:0:0:0:1', '2019-08-29 10:33:50');
INSERT INTO `sys_log` VALUES ('38', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[31]', '0', '0:0:0:0:0:0:0:1', '2019-08-29 10:34:18');
INSERT INTO `sys_log` VALUES ('39', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[31]', '0', '0:0:0:0:0:0:0:1', '2019-08-29 10:34:31');
INSERT INTO `sys_log` VALUES ('40', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":42,\"parentId\":0,\"name\":\"商品管理\",\"url\":\"goods/goods\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', '42', '0:0:0:0:0:0:0:1', '2019-08-29 10:45:26');
INSERT INTO `sys_log` VALUES ('41', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"zxyadmin\",\"remark\":\"总管理\",\"createUserId\":1,\"menuIdList\":[-666666]}]', '210', '0:0:0:0:0:0:0:1', '2019-09-03 09:39:20');
INSERT INTO `sys_log` VALUES ('42', 'admin', '删除商品', 'io.renren.modules.goods.controller.GoodsController.delete()', '[[16]]', '252', '0:0:0:0:0:0:0:1', '2019-09-06 10:52:07');
INSERT INTO `sys_log` VALUES ('43', 'admin', '修改商品分类', 'io.renren.modules.itemize.controller.ItemizeController.update()', '[{\"id\":1,\"name\":\"矿泉水\",\"remark\":\"\",\"createBy\":\"\",\"updateBy\":\"admin\",\"updateDate\":\"Sep 6, 2019 10:52:51 AM\"}]', '74', '0:0:0:0:0:0:0:1', '2019-09-06 10:52:51');
INSERT INTO `sys_log` VALUES ('44', 'admin', '保存商品', 'io.renren.modules.goods.controller.GoodsController.save()', '[{\"id\":20,\"name\":\"1\",\"num\":1,\"price\":1,\"specs\":\"1\",\"unitPrice\":1,\"customerName\":\"1\",\"storageDate\":\"Sep 6, 2019 2:28:30 AM\",\"createDate\":\"Sep 6, 2019 2:28:31 PM\",\"createBy\":\"admin\",\"updateBy\":\"\",\"itemizeId\":\"1\"}]', '52', '0:0:0:0:0:0:0:1', '2019-09-06 14:28:32');
INSERT INTO `sys_log` VALUES ('45', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"zxyadmin\",\"remark\":\"总管理\",\"createUserId\":1,\"menuIdList\":[30,42,43,44,45,46,52,53,54,55,56,-666666,1]}]', '183', '0:0:0:0:0:0:0:1', '2019-09-06 16:39:07');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'system', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user', null, '1', 'admin', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role', null, '1', 'role', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu', null, '1', 'menu', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', null, '1', 'sql', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'job/schedule', null, '1', 'job', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'sys/log', 'sys:log:list', '1', 'log', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'oss/oss', 'sys:oss:all', '1', 'oss', '6');
INSERT INTO `sys_menu` VALUES ('42', '0', '商品管理', 'goods/goods', null, '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('43', '42', '查看', null, 'goods:goods:list,goods:goods:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('44', '42', '新增', null, 'goods:goods:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('45', '42', '修改', null, 'goods:goods:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('46', '42', '删除', null, 'goods:goods:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('52', '0', '分类管理', 'itemize/itemize', null, '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('53', '52', '查看', null, 'itemize:itemize:list,itemize:itemize:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('54', '52', '新增', null, 'itemize:itemize:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('55', '52', '修改', null, 'itemize:itemize:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('56', '52', '删除', null, 'itemize:itemize:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('57', '0', '客户管理', 'customer/customer', null, '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('58', '57', '查看', null, 'customer:customer:list,customer:customer:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('59', '57', '新增', null, 'customer:customer:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('60', '57', '修改', null, 'customer:customer:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('61', '57', '删除', null, 'customer:customer:delete', '2', null, '6');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'zxyadmin', '总管理', '1', '2019-08-22 12:13:24');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('26', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('27', '1', '42');
INSERT INTO `sys_role_menu` VALUES ('28', '1', '43');
INSERT INTO `sys_role_menu` VALUES ('29', '1', '44');
INSERT INTO `sys_role_menu` VALUES ('30', '1', '45');
INSERT INTO `sys_role_menu` VALUES ('31', '1', '46');
INSERT INTO `sys_role_menu` VALUES ('32', '1', '52');
INSERT INTO `sys_role_menu` VALUES ('33', '1', '53');
INSERT INTO `sys_role_menu` VALUES ('34', '1', '54');
INSERT INTO `sys_role_menu` VALUES ('35', '1', '55');
INSERT INTO `sys_role_menu` VALUES ('36', '1', '56');
INSERT INTO `sys_role_menu` VALUES ('37', '1', '-666666');
INSERT INTO `sys_role_menu` VALUES ('38', '1', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'cdac762d0ba79875489f6a8b430fa8b5dfe0cdd81da38b80f02f33328af7fd4a', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', '1', '1', '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES ('2', 'zxy', '534f98734df5ca6370213844495cf86cf09de9cab70d1058503bdb4f9d71f666', 'riUOJv5P7uauLE9TCnCE', 'zxy@163.com', '13687322468', '1', '1', '2019-08-22 12:15:58');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '2', '1');

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', 'f5b4a9ad89158145e415c0a01445f654', '2019-09-10 21:33:35', '2019-09-10 09:33:35');
INSERT INTO `sys_user_token` VALUES ('2', 'e0f7f2513238e932a3fda3cdf4912a48', '2019-09-07 04:40:08', '2019-09-06 16:40:08');

-- ----------------------------
-- Table structure for tb_customer
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `address` varchar(255) DEFAULT NULL COMMENT '客户地址',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `contacts` varchar(255) DEFAULT NULL COMMENT '联系人',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `itemize` int(11) DEFAULT NULL COMMENT '客户分类',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_customer
-- ----------------------------
INSERT INTO `tb_customer` VALUES ('1', '哇哈哈集团', '湖南长沙分区', '136456789', '宗庆后', null, null, 'admin', '2019-09-10 10:14:24', '1', '这是一个备注!');
INSERT INTO `tb_customer` VALUES ('2', '1', '1', '1', '1', 'admin', '2019-09-09 11:01:08', null, null, '2', null);
INSERT INTO `tb_customer` VALUES ('3', '1', '1', '1', '1', 'admin', '2019-09-09 14:09:39', 'admin', '2019-09-09 14:22:26', '1', null);

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `num` int(11) DEFAULT NULL COMMENT '商品数量',
  `price` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `specs` varchar(255) DEFAULT NULL COMMENT '规格',
  `unit_price` decimal(10,0) DEFAULT NULL COMMENT '单价',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `customer_name` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `storage_date` datetime DEFAULT NULL COMMENT '生产日期',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `itemize_id` varchar(255) DEFAULT NULL COMMENT '商品分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('1', '哇哈哈矿泉水', '10', '100', '24/箱', '10', '1', '哇哈哈集团', '2019-08-28 00:00:00', null, null, 'admin', '2019-09-02 14:24:22', '1');
INSERT INTO `tb_goods` VALUES ('6', '1', '1', '1', '1', '1', '1', '1', '2019-08-08 00:00:00', '2019-09-02 10:44:47', 'admin', 'admin', '2019-09-02 14:37:14', '3');
INSERT INTO `tb_goods` VALUES ('10', '1', '1', '1', '1', '1', null, '1', '2019-09-02 02:54:49', '2019-09-02 14:54:52', 'admin', 'admin', '2019-09-02 15:05:55', '1');
INSERT INTO `tb_goods` VALUES ('12', '2', '2', '2', '2', '2', null, '2', '2019-09-02 03:11:27', '2019-09-02 15:11:36', 'admin', 'admin', '2019-09-03 11:13:34', '6');
INSERT INTO `tb_goods` VALUES ('13', '1', '3', '1', '1', '1', '1', '1', '2019-09-03 10:03:01', '2019-09-03 10:03:07', 'admin', 'admin', '2019-09-03 11:10:42', '2');
INSERT INTO `tb_goods` VALUES ('15', '1', '1', '1', '1', '1', '1', '1', '2019-09-03 10:40:13', '2019-09-03 10:40:15', 'admin', 'admin', '2019-09-03 11:24:23', '3');
INSERT INTO `tb_goods` VALUES ('20', '1', '1', '1', '1', '1', null, '1', '2019-09-06 02:28:30', '2019-09-06 14:28:32', 'admin', '', null, '1');

-- ----------------------------
-- Table structure for tb_itemize
-- ----------------------------
DROP TABLE IF EXISTS `tb_itemize`;
CREATE TABLE `tb_itemize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(255) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_itemize
-- ----------------------------
INSERT INTO `tb_itemize` VALUES ('1', '矿泉水', '', '', null, 'admin', '2019-09-06 10:52:51');
INSERT INTO `tb_itemize` VALUES ('2', '啤酒', '', '', '2019-08-29 15:52:42', '', null);
INSERT INTO `tb_itemize` VALUES ('3', '白酒', '', 'admin', '2019-08-29 16:18:51', '', null);
INSERT INTO `tb_itemize` VALUES ('5', '饮料', '', 'admin', '2019-08-30 17:57:59', '', null);
INSERT INTO `tb_itemize` VALUES ('6', '果汁', '', 'admin', '2019-08-30 17:58:05', '', null);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
