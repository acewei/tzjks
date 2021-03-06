/*
 Navicat Premium Data Transfer

 Source Server         : sqlserver_l
 Source Server Type    : SQL Server
 Source Server Version : 14001000
 Source Host           : CGC-PC:1433
 Source Catalog        : work-study
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 14001000
 File Encoding         : 65001

 Date: 07/07/2018 10:58:11
*/


-- ----------------------------
-- Table structure for Apply
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Apply]') AND type IN ('U'))
	DROP TABLE [dbo].[Apply]
GO

CREATE TABLE [dbo].[Apply] (
  [ApplyId] char(22) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Reason] varchar(200) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [ApplyTime] date NOT NULL,
  [SId] char(10) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [PostId] char(6) COLLATE Chinese_PRC_CI_AS NOT NULL
)
GO

ALTER TABLE [dbo].[Apply] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'学号10+岗位号4+申请时间8',
'SCHEMA', N'dbo',
'TABLE', N'Apply',
'COLUMN', N'ApplyId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'申请时间',
'SCHEMA', N'dbo',
'TABLE', N'Apply',
'COLUMN', N'ApplyTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学号',
'SCHEMA', N'dbo',
'TABLE', N'Apply',
'COLUMN', N'SId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位号',
'SCHEMA', N'dbo',
'TABLE', N'Apply',
'COLUMN', N'PostId'
GO


-- ----------------------------
-- Records of [Apply]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[Apply]  VALUES (N'1511240142010620180630', N'我擅长杀鸡', N'2018-06-30', N'1511240142', N'0106  '), (N'1511240143010420180707', N'', N'2018-07-07', N'1511240143', N'0104  '), (N'1511240143010620180707', N'的飒飒发顺丰', N'2018-07-07', N'1511240143', N'0106  '), (N'1511240143020120180702', N'阿萨啊大大撒', N'2018-07-02', N'1511240143', N'0201  ')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for Employer
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Employer]') AND type IN ('U'))
	DROP TABLE [dbo].[Employer]
GO

CREATE TABLE [dbo].[Employer] (
  [EmployerId] char(2) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [EmployerName] varchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [EmployerSite] varchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL
)
GO

ALTER TABLE [dbo].[Employer] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位号',
'SCHEMA', N'dbo',
'TABLE', N'Employer',
'COLUMN', N'EmployerId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位名',
'SCHEMA', N'dbo',
'TABLE', N'Employer',
'COLUMN', N'EmployerName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位地址',
'SCHEMA', N'dbo',
'TABLE', N'Employer',
'COLUMN', N'EmployerSite'
GO


-- ----------------------------
-- Records of [Employer]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[Employer]  VALUES (N'01', N'西苑', N'西苑餐厅'), (N'02', N'东苑', N'东苑餐厅'), (N'03', N'报亭公司', N'各报亭')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for Salary
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Salary]') AND type IN ('U'))
	DROP TABLE [dbo].[Salary]
GO

CREATE TABLE [dbo].[Salary] (
  [SalaryId] char(22) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [SId] char(10) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [PostId] char(4) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [EmployerId] char(2) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [RealTotalHour] decimal(5,1) NULL,
  [ShouldHour] decimal(5,1) NULL,
  [LossHour] decimal(5,1) NULL,
  [TotalPay] decimal(8,2) NULL,
  [FinalPay] decimal(8,2) NULL,
  [Payday] datetime NULL
)
GO

ALTER TABLE [dbo].[Salary] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'学号10+岗位号4+结算日期8',
'SCHEMA', N'dbo',
'TABLE', N'Salary',
'COLUMN', N'SalaryId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'被结算时期总共实际工作时间',
'SCHEMA', N'dbo',
'TABLE', N'Salary',
'COLUMN', N'RealTotalHour'
GO

EXEC sp_addextendedproperty
'MS_Description', N'被结算时期总共应该工作时间，即各考勤时长相加',
'SCHEMA', N'dbo',
'TABLE', N'Salary',
'COLUMN', N'ShouldHour'
GO

EXEC sp_addextendedproperty
'MS_Description', N'被结算时期总共缺勤的时长',
'SCHEMA', N'dbo',
'TABLE', N'Salary',
'COLUMN', N'LossHour'
GO

EXEC sp_addextendedproperty
'MS_Description', N'满勤时应该支付的工资',
'SCHEMA', N'dbo',
'TABLE', N'Salary',
'COLUMN', N'TotalPay'
GO

EXEC sp_addextendedproperty
'MS_Description', N'最终支付的工资',
'SCHEMA', N'dbo',
'TABLE', N'Salary',
'COLUMN', N'FinalPay'
GO

EXEC sp_addextendedproperty
'MS_Description', N'结算的时间',
'SCHEMA', N'dbo',
'TABLE', N'Salary',
'COLUMN', N'Payday'
GO


-- ----------------------------
-- Records of [Salary]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[Salary]  VALUES (N'1511240143010320180701', N'1511240143', N'0103', N'01', N'12.0', N'12.0', N'.0', N'132.00', N'132.00', N'2018-07-01 13:40:54.903')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for Schedule
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Schedule]') AND type IN ('U'))
	DROP TABLE [dbo].[Schedule]
GO

CREATE TABLE [dbo].[Schedule] (
  [SId] char(10) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [PostId] char(4) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [TId] char(2) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [ScId] char(22) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [ValidStart] date SPARSE NULL,
  [ValidEnd] date NULL
)
GO

ALTER TABLE [dbo].[Schedule] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'时间号',
'SCHEMA', N'dbo',
'TABLE', N'Schedule',
'COLUMN', N'TId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Sid+postid+tid+validstart年月',
'SCHEMA', N'dbo',
'TABLE', N'Schedule',
'COLUMN', N'ScId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'安排开始',
'SCHEMA', N'dbo',
'TABLE', N'Schedule',
'COLUMN', N'ValidStart'
GO

EXEC sp_addextendedproperty
'MS_Description', N'安排结束',
'SCHEMA', N'dbo',
'TABLE', N'Schedule',
'COLUMN', N'ValidEnd'
GO


-- ----------------------------
-- Records of [Schedule]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[Schedule]  VALUES (N'1511240143', N'0103', N'11', N'1511240143010311201805', N'2018-05-07', N'2018-11-15'), (N'1511240143', N'0103', N'12', N'1511240143010312201805', N'2018-05-07', N'2018-11-15'), (N'1511240143', N'0103', N'13', N'1511240143010313201805', N'2018-05-07', N'2018-11-15'), (N'1511240143', N'0103', N'23', N'1511240143010323201805', N'2018-05-07', N'2018-11-15'), (N'1511240143', N'0103', N'33', N'1511240143010333201805', N'2018-05-07', N'2018-11-15'), (N'1511240143', N'0106', N'11', N'1511240143010611201805', N'2018-05-15', N'2018-12-12'), (N'1511240143', N'0106', N'12', N'1511240143010612201805', N'2018-05-15', N'2018-12-12'), (N'1511240143', N'0106', N'13', N'1511240143010613201805', N'2018-05-15', N'2018-12-12')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for SHInfo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SHInfo]') AND type IN ('U'))
	DROP TABLE [dbo].[SHInfo]
GO

CREATE TABLE [dbo].[SHInfo] (
  [ApplyId] char(22) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Reviewer] char(10) COLLATE Chinese_PRC_CI_AS NULL,
  [ReviewTime] datetime NULL,
  [ReviewResult] varchar(10) COLLATE Chinese_PRC_CI_AS NULL
)
GO

ALTER TABLE [dbo].[SHInfo] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'学号10+岗位号4+申请时间8',
'SCHEMA', N'dbo',
'TABLE', N'SHInfo',
'COLUMN', N'ApplyId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审核人',
'SCHEMA', N'dbo',
'TABLE', N'SHInfo',
'COLUMN', N'Reviewer'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审核时间',
'SCHEMA', N'dbo',
'TABLE', N'SHInfo',
'COLUMN', N'ReviewTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审核结果或状态',
'SCHEMA', N'dbo',
'TABLE', N'SHInfo',
'COLUMN', N'ReviewResult'
GO


-- ----------------------------
-- Records of [SHInfo]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[SHInfo]  VALUES (N'1511240142010620180630', N'sdf       ', N'2018-06-30 22:06:27.497', N'通过'), (N'1511240143010420180707', N'          ', N'2018-07-07 10:48:02.063', N'不通过'), (N'1511240143010620180707', N'          ', N'2018-07-07 08:40:39.717', N'通过'), (N'1511240143020120180702', NULL, NULL, N'待审核')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for Student
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type IN ('U'))
	DROP TABLE [dbo].[Student]
GO

CREATE TABLE [dbo].[Student] (
  [SId] char(10) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Sname] varchar(6) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Ssex] char(2) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Sey] date NOT NULL,
  [BCname] varchar(16) COLLATE Chinese_PRC_CI_AS NULL,
  [BCid] char(19) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Class] varchar(15) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Institute] varchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [SGid] char(7) COLLATE Chinese_PRC_CI_AS NOT NULL
)
GO

ALTER TABLE [dbo].[Student] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'入学年月',
'SCHEMA', N'dbo',
'TABLE', N'Student',
'COLUMN', N'Sey'
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位号',
'SCHEMA', N'dbo',
'TABLE', N'Student',
'COLUMN', N'SGid'
GO


-- ----------------------------
-- Records of [Student]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[Student]  VALUES (N'1511240102', N'曽白', N'男', N'2015-09-13', N'中国银行', N'2144333779700      ', N'信管151', N'数信', N'805315 '), (N'1511240103', N'张三', N'男', N'2015-09-13', N'中国银行', N'3242546321311      ', N'信管151', N'数信', N'346541 '), (N'1511240113', N'李威', N'男', N'2015-09-01', N'工商银行', N'1225478965231      ', N'信管151', N'数信', N'805315 '), (N'1511240142', N'阿斯弗', N'男', N'2017-12-01', N'中国银行', N'2358273592130485392', N'信管151', N'数信', N'234445 '), (N'1511240143', N'李四', N'男', N'2018-06-19', N'中国银行', N'2358273592130485392', N'信管151', N'数信', N'343545 ')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for StuFreeTime
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[StuFreeTime]') AND type IN ('U'))
	DROP TABLE [dbo].[StuFreeTime]
GO

CREATE TABLE [dbo].[StuFreeTime] (
  [SId] char(10) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [TId] char(2) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [SFId] char(12) COLLATE Chinese_PRC_CI_AS NOT NULL
)
GO

ALTER TABLE [dbo].[StuFreeTime] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'学生空闲时间的编号Sid+tid',
'SCHEMA', N'dbo',
'TABLE', N'StuFreeTime',
'COLUMN', N'SFId'
GO


-- ----------------------------
-- Records of [StuFreeTime]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[StuFreeTime]  VALUES (N'1511240142', N'11', N'151124014211'), (N'1511240142', N'12', N'151124014212'), (N'1511240142', N'13', N'151124014213'), (N'1511240143', N'11', N'151124014311')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for Time
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Time]') AND type IN ('U'))
	DROP TABLE [dbo].[Time]
GO

CREATE TABLE [dbo].[Time] (
  [TId] char(2) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [WhatDay] char(6) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [StartTime] time(1) NOT NULL,
  [EndTime] time(1) NOT NULL,
  [TimeLength] decimal(3,1) NULL
)
GO

ALTER TABLE [dbo].[Time] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'是星期几',
'SCHEMA', N'dbo',
'TABLE', N'Time',
'COLUMN', N'WhatDay'
GO

EXEC sp_addextendedproperty
'MS_Description', N'此时间段几点开始',
'SCHEMA', N'dbo',
'TABLE', N'Time',
'COLUMN', N'StartTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'此时间段几点结束',
'SCHEMA', N'dbo',
'TABLE', N'Time',
'COLUMN', N'EndTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'此时间段长度',
'SCHEMA', N'dbo',
'TABLE', N'Time',
'COLUMN', N'TimeLength'
GO


-- ----------------------------
-- Records of [Time]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[Time]  VALUES (N'11', N'星期一', N'08:00:00.0', N'10:30:00.0', N'2.0'), (N'12', N'星期一', N'09:00:00.0', N'10:40:00.0', N'1.7'), (N'13', N'星期一', N'09:00:00.0', N'12:00:00.0', N'3.0'), (N'23', N'星期二', N'10:22:10.0', N'13:22:12.0', N'3.0'), (N'33', N'星期三', N'10:22:57.0', N'15:23:00.0', N'5.0'), (N'41', N'星期四', N'15:00:00.0', N'17:00:00.0', N'2.0')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for User
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type IN ('U'))
	DROP TABLE [dbo].[User]
GO

CREATE TABLE [dbo].[User] (
  [UserName] varchar(10) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Password] varchar(32) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [UserId] varchar(8) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Remark] varchar(10) COLLATE Chinese_PRC_CI_AS NULL
)
GO

ALTER TABLE [dbo].[User] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户标识，学生、学工组。。',
'SCHEMA', N'dbo',
'TABLE', N'User',
'COLUMN', N'UserId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'注明那个学院，哪个用人单位',
'SCHEMA', N'dbo',
'TABLE', N'User',
'COLUMN', N'Remark'
GO


-- ----------------------------
-- Records of [User]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[User]  VALUES (N'1511240101', N'e10adc3949ba59abbe56e057f20f883e', N'学生', NULL), (N'1511240102', N'e10adc3949ba59abbe56e057f20f883e', N'学生', NULL), (N'1511240103', N'e10adc3949ba59abbe56e057f20f883e', N'学生', NULL), (N'1511240113', N'e10adc3949ba59abbe56e057f20f883e', N'学生', NULL), (N'1511240140', N'e10adc3949ba59abbe56e057f20f883e', N'学生', NULL), (N'1511240142', N'e10adc3949ba59abbe56e057f20f883e', N'学生', NULL), (N'1511240143', N'e10adc3949ba59abbe56e057f20f883e', N'学生', NULL), (N'1511250113', N'e10adc3949ba59abbe56e057f20f883e', N'用人单位', N''), (N'e1', N'e10adc3949ba59abbe56e057f20f883e', N'用人单位', N'西苑'), (N'e2', N'e10adc3949ba59abbe56e057f20f883e', N'用人单位', N'东苑'), (N's1', N'e10adc3949ba59abbe56e057f20f883e', N'学生', NULL), (N't1', N'e10adc3949ba59abbe56e057f20f883e', N'学工组', N'数信'), (N'z1', N'e10adc3949ba59abbe56e057f20f883e', N'资助中心', N''), (N'z2', N'e10adc3949ba59abbe56e057f20f883e', N'资助中心', N'')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for WorkCheck
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkCheck]') AND type IN ('U'))
	DROP TABLE [dbo].[WorkCheck]
GO

CREATE TABLE [dbo].[WorkCheck] (
  [WCId] char(24) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [SId] char(10) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [PostId] char(4) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [TId] char(2) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [InputTime] datetime NULL,
  [IsFinishWC] bit NULL,
  [IsAttend] bit NULL,
  [IsSettle] bit NULL,
  [DetailDate] date NULL
)
GO

ALTER TABLE [dbo].[WorkCheck] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'scid+开始工作第几周（2）',
'SCHEMA', N'dbo',
'TABLE', N'WorkCheck',
'COLUMN', N'WCId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'录入考勤的时候',
'SCHEMA', N'dbo',
'TABLE', N'WorkCheck',
'COLUMN', N'InputTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否完成考勤，区分缺勤和未考勤',
'SCHEMA', N'dbo',
'TABLE', N'WorkCheck',
'COLUMN', N'IsFinishWC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否缺勤',
'SCHEMA', N'dbo',
'TABLE', N'WorkCheck',
'COLUMN', N'IsAttend'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否已对此次考勤结算',
'SCHEMA', N'dbo',
'TABLE', N'WorkCheck',
'COLUMN', N'IsSettle'
GO

EXEC sp_addextendedproperty
'MS_Description', N'欲考勤的具体时间',
'SCHEMA', N'dbo',
'TABLE', N'WorkCheck',
'COLUMN', N'DetailDate'
GO


-- ----------------------------
-- Records of [WorkCheck]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[WorkCheck]  VALUES (N'151124014201061120180503', N'1511240142', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-05-21'), (N'151124014201061120180504', N'1511240142', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-05-28'), (N'151124014201061120180505', N'1511240142', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-06-04'), (N'151124014201061120180506', N'1511240142', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-06-11'), (N'151124014201061120180507', N'1511240142', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-06-18'), (N'151124014201061120180508', N'1511240142', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-06-25'), (N'151124014201061120180509', N'1511240142', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-07-02'), (N'151124014201061120180510', N'1511240142', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-07-09'), (N'151124014201061120180511', N'1511240142', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-07-16'), (N'151124014201061120180512', N'1511240142', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-07-23'), (N'151124014201061120180513', N'1511240142', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-07-30'), (N'151124014201061120180514', N'1511240142', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-08-06'), (N'151124014201061120180515', N'1511240142', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-08-13'), (N'151124014201061120180516', N'1511240142', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-08-20'), (N'151124014201061220180503', N'1511240142', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-05-21'), (N'151124014201061220180504', N'1511240142', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-05-28'), (N'151124014201061220180505', N'1511240142', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-06-04'), (N'151124014201061220180506', N'1511240142', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-06-11'), (N'151124014201061220180507', N'1511240142', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-06-18'), (N'151124014201061220180508', N'1511240142', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-06-25'), (N'151124014201061220180509', N'1511240142', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-07-02'), (N'151124014201061220180510', N'1511240142', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-07-09'), (N'151124014201061220180511', N'1511240142', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-07-16'), (N'151124014201061220180512', N'1511240142', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-07-23'), (N'151124014201061220180513', N'1511240142', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-07-30'), (N'151124014201061220180514', N'1511240142', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-08-06'), (N'151124014201061220180515', N'1511240142', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-08-13'), (N'151124014201061220180516', N'1511240142', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-08-20'), (N'151124014201061320180503', N'1511240142', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-05-21'), (N'151124014201061320180504', N'1511240142', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-05-28'), (N'151124014201061320180505', N'1511240142', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-06-04'), (N'151124014201061320180506', N'1511240142', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-06-11'), (N'151124014201061320180507', N'1511240142', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-06-18'), (N'151124014201061320180508', N'1511240142', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-06-25'), (N'151124014201061320180509', N'1511240142', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-07-02'), (N'151124014201061320180510', N'1511240142', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-07-09'), (N'151124014201061320180511', N'1511240142', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-07-16'), (N'151124014201061320180512', N'1511240142', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-07-23'), (N'151124014201061320180513', N'1511240142', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-07-30'), (N'151124014201061320180514', N'1511240142', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-08-06'), (N'151124014201061320180515', N'1511240142', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-08-13'), (N'151124014201061320180516', N'1511240142', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-08-20'), (N'151124014301031120180502', N'1511240143', N'0103', N'11', NULL, N'1', N'1', NULL, N'2018-05-21'), (N'151124014301031120180503', N'1511240143', N'0103', N'11', NULL, N'1', N'1', NULL, N'2018-05-28'), (N'151124014301031120180504', N'1511240143', N'0103', N'11', NULL, N'1', N'1', NULL, N'2018-06-04'), (N'151124014301031120180505', N'1511240143', N'0103', N'11', N'2018-07-07 09:01:32.100', N'1', N'1', NULL, N'2018-06-11'), (N'151124014301031120180506', N'1511240143', N'0103', N'11', N'2018-07-07 09:01:35.960', N'1', N'1', NULL, N'2018-06-18'), (N'151124014301031120180507', N'1511240143', N'0103', N'11', N'2018-07-07 09:01:40.337', N'1', N'1', NULL, N'2018-06-25'), (N'151124014301031120180508', N'1511240143', N'0103', N'11', NULL, N'1', N'1', NULL, N'2018-07-02'), (N'151124014301031120180509', N'1511240143', N'0103', N'11', NULL, N'1', N'1', NULL, N'2018-07-09'), (N'151124014301031120180510', N'1511240143', N'0103', N'11', NULL, N'1', N'1', NULL, N'2018-07-16'), (N'151124014301031120180511', N'1511240143', N'0103', N'11', NULL, N'1', N'1', NULL, N'2018-07-23'), (N'151124014301031120180512', N'1511240143', N'0103', N'11', NULL, N'1', N'1', NULL, N'2018-07-30'), (N'151124014301031120180513', N'1511240143', N'0103', N'11', NULL, N'1', N'1', NULL, N'2018-08-06'), (N'151124014301031120180514', N'1511240143', N'0103', N'11', NULL, N'1', N'1', NULL, N'2018-08-13'), (N'151124014301031120180515', N'1511240143', N'0103', N'11', NULL, N'1', N'1', NULL, N'2018-08-20'), (N'151124014301031220180502', N'1511240143', N'0103', N'12', NULL, N'1', N'1', NULL, N'2018-05-21'), (N'151124014301031220180503', N'1511240143', N'0103', N'12', NULL, N'1', N'1', NULL, N'2018-05-28'), (N'151124014301031220180504', N'1511240143', N'0103', N'12', NULL, N'1', N'1', NULL, N'2018-06-04'), (N'151124014301031220180505', N'1511240143', N'0103', N'12', NULL, N'1', N'1', NULL, N'2018-06-11'), (N'151124014301031220180506', N'1511240143', N'0103', N'12', NULL, N'1', N'1', NULL, N'2018-06-18'), (N'151124014301031220180507', N'1511240143', N'0103', N'12', NULL, N'1', N'1', NULL, N'2018-06-25'), (N'151124014301031220180508', N'1511240143', N'0103', N'12', NULL, N'1', N'1', NULL, N'2018-07-02'), (N'151124014301031220180509', N'1511240143', N'0103', N'12', NULL, N'1', N'1', NULL, N'2018-07-09'), (N'151124014301031220180510', N'1511240143', N'0103', N'12', NULL, N'1', N'1', NULL, N'2018-07-16'), (N'151124014301031220180511', N'1511240143', N'0103', N'12', NULL, N'1', N'1', NULL, N'2018-07-23'), (N'151124014301031220180512', N'1511240143', N'0103', N'12', NULL, N'1', N'1', NULL, N'2018-07-30'), (N'151124014301031220180513', N'1511240143', N'0103', N'12', NULL, N'1', N'1', NULL, N'2018-08-06'), (N'151124014301031220180514', N'1511240143', N'0103', N'12', NULL, N'1', N'1', NULL, N'2018-08-13'), (N'151124014301031220180515', N'1511240143', N'0103', N'12', NULL, N'1', N'1', NULL, N'2018-08-20'), (N'151124014301031320180502', N'1511240143', N'0103', N'13', NULL, N'1', N'1', NULL, N'2018-05-21'), (N'151124014301031320180503', N'1511240143', N'0103', N'13', NULL, N'1', N'1', NULL, N'2018-05-28'), (N'151124014301031320180504', N'1511240143', N'0103', N'13', NULL, N'1', N'1', NULL, N'2018-06-04'), (N'151124014301031320180505', N'1511240143', N'0103', N'13', NULL, N'1', N'1', NULL, N'2018-06-11'), (N'151124014301031320180506', N'1511240143', N'0103', N'13', NULL, N'1', N'1', NULL, N'2018-06-18'), (N'151124014301031320180507', N'1511240143', N'0103', N'13', NULL, N'1', N'1', NULL, N'2018-06-25'), (N'151124014301031320180508', N'1511240143', N'0103', N'13', NULL, N'1', N'1', NULL, N'2018-07-02'), (N'151124014301031320180509', N'1511240143', N'0103', N'13', NULL, N'1', N'1', NULL, N'2018-07-09'), (N'151124014301031320180510', N'1511240143', N'0103', N'13', NULL, N'1', N'1', NULL, N'2018-07-16'), (N'151124014301031320180511', N'1511240143', N'0103', N'13', NULL, N'1', N'1', NULL, N'2018-07-23'), (N'151124014301031320180512', N'1511240143', N'0103', N'13', NULL, N'1', N'1', NULL, N'2018-07-30'), (N'151124014301031320180513', N'1511240143', N'0103', N'13', NULL, N'1', N'1', NULL, N'2018-08-06'), (N'151124014301031320180514', N'1511240143', N'0103', N'13', NULL, N'1', N'1', NULL, N'2018-08-13'), (N'151124014301031320180515', N'1511240143', N'0103', N'13', NULL, N'1', N'1', NULL, N'2018-08-20'), (N'151124014301032320180501', N'1511240143', N'0103', N'23', NULL, N'1', N'1', NULL, N'2018-05-15'), (N'151124014301032320180502', N'1511240143', N'0103', N'23', NULL, N'1', N'1', NULL, N'2018-05-22'), (N'151124014301032320180503', N'1511240143', N'0103', N'23', NULL, N'1', N'1', NULL, N'2018-05-29'), (N'151124014301032320180504', N'1511240143', N'0103', N'23', NULL, N'1', N'1', NULL, N'2018-06-05'), (N'151124014301032320180505', N'1511240143', N'0103', N'23', NULL, N'1', N'1', NULL, N'2018-06-12'), (N'151124014301032320180506', N'1511240143', N'0103', N'23', NULL, N'1', N'1', NULL, N'2018-06-19'), (N'151124014301032320180507', N'1511240143', N'0103', N'23', NULL, N'1', N'1', NULL, N'2018-06-26'), (N'151124014301032320180508', N'1511240143', N'0103', N'23', NULL, N'1', N'1', NULL, N'2018-07-03'), (N'151124014301032320180509', N'1511240143', N'0103', N'23', NULL, N'1', N'1', NULL, N'2018-07-10'), (N'151124014301032320180510', N'1511240143', N'0103', N'23', NULL, N'1', N'1', NULL, N'2018-07-17'), (N'151124014301032320180511', N'1511240143', N'0103', N'23', NULL, N'1', N'1', NULL, N'2018-07-24'), (N'151124014301032320180512', N'1511240143', N'0103', N'23', NULL, N'1', N'1', NULL, N'2018-07-31'), (N'151124014301032320180513', N'1511240143', N'0103', N'23', NULL, N'1', N'1', NULL, N'2018-08-07'), (N'151124014301032320180514', N'1511240143', N'0103', N'23', NULL, N'1', N'1', NULL, N'2018-08-14'), (N'151124014301032320180515', N'1511240143', N'0103', N'23', NULL, N'1', N'1', NULL, N'2018-08-21'), (N'151124014301033320180501', N'1511240143', N'0103', N'33', NULL, N'1', N'1', NULL, N'2018-05-16'), (N'151124014301033320180502', N'1511240143', N'0103', N'33', NULL, N'1', N'1', NULL, N'2018-05-23'), (N'151124014301033320180503', N'1511240143', N'0103', N'33', NULL, N'1', N'1', NULL, N'2018-05-30'), (N'151124014301033320180504', N'1511240143', N'0103', N'33', NULL, N'1', N'1', NULL, N'2018-06-06'), (N'151124014301033320180505', N'1511240143', N'0103', N'33', NULL, N'1', N'1', NULL, N'2018-06-13'), (N'151124014301033320180506', N'1511240143', N'0103', N'33', NULL, N'1', N'1', NULL, N'2018-06-20'), (N'151124014301033320180507', N'1511240143', N'0103', N'33', NULL, N'1', N'1', NULL, N'2018-06-27'), (N'151124014301033320180508', N'1511240143', N'0103', N'33', NULL, N'1', N'1', NULL, N'2018-07-04'), (N'151124014301033320180509', N'1511240143', N'0103', N'33', NULL, N'1', N'1', NULL, N'2018-07-11'), (N'151124014301033320180510', N'1511240143', N'0103', N'33', NULL, N'1', N'1', NULL, N'2018-07-18'), (N'151124014301033320180511', N'1511240143', N'0103', N'33', NULL, N'1', N'1', NULL, N'2018-07-25'), (N'151124014301033320180512', N'1511240143', N'0103', N'33', NULL, N'1', N'1', NULL, N'2018-08-01'), (N'151124014301033320180513', N'1511240143', N'0103', N'33', NULL, N'1', N'1', NULL, N'2018-08-08'), (N'151124014301033320180514', N'1511240143', N'0103', N'33', NULL, N'1', N'1', NULL, N'2018-08-15'), (N'151124014301033320180515', N'1511240143', N'0103', N'33', NULL, N'1', N'1', NULL, N'2018-08-22'), (N'151124014301061120180501', N'1511240143', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-05-21'), (N'151124014301061120180502', N'1511240143', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-05-28'), (N'151124014301061120180503', N'1511240143', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-06-04'), (N'151124014301061120180504', N'1511240143', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-06-11'), (N'151124014301061120180505', N'1511240143', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-06-18'), (N'151124014301061120180506', N'1511240143', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-06-25'), (N'151124014301061120180507', N'1511240143', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-07-02'), (N'151124014301061120180508', N'1511240143', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-07-09'), (N'151124014301061120180509', N'1511240143', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-07-16'), (N'151124014301061120180510', N'1511240143', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-07-23'), (N'151124014301061120180511', N'1511240143', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-07-30'), (N'151124014301061120180512', N'1511240143', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-08-06'), (N'151124014301061120180513', N'1511240143', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-08-13'), (N'151124014301061120180514', N'1511240143', N'0106', N'11', NULL, N'1', N'1', NULL, N'2018-08-20'), (N'151124014301061220180501', N'1511240143', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-05-21'), (N'151124014301061220180502', N'1511240143', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-05-28'), (N'151124014301061220180503', N'1511240143', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-06-04'), (N'151124014301061220180504', N'1511240143', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-06-11'), (N'151124014301061220180505', N'1511240143', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-06-18'), (N'151124014301061220180506', N'1511240143', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-06-25'), (N'151124014301061220180507', N'1511240143', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-07-02'), (N'151124014301061220180508', N'1511240143', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-07-09'), (N'151124014301061220180509', N'1511240143', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-07-16'), (N'151124014301061220180510', N'1511240143', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-07-23'), (N'151124014301061220180511', N'1511240143', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-07-30'), (N'151124014301061220180512', N'1511240143', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-08-06'), (N'151124014301061220180513', N'1511240143', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-08-13'), (N'151124014301061220180514', N'1511240143', N'0106', N'12', NULL, N'1', N'1', NULL, N'2018-08-20'), (N'151124014301061320180501', N'1511240143', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-05-21'), (N'151124014301061320180502', N'1511240143', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-05-28'), (N'151124014301061320180503', N'1511240143', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-06-04'), (N'151124014301061320180504', N'1511240143', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-06-11'), (N'151124014301061320180505', N'1511240143', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-06-18'), (N'151124014301061320180506', N'1511240143', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-06-25'), (N'151124014301061320180507', N'1511240143', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-07-02'), (N'151124014301061320180508', N'1511240143', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-07-09'), (N'151124014301061320180509', N'1511240143', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-07-16'), (N'151124014301061320180510', N'1511240143', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-07-23'), (N'151124014301061320180511', N'1511240143', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-07-30'), (N'151124014301061320180512', N'1511240143', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-08-06'), (N'151124014301061320180513', N'1511240143', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-08-13'), (N'151124014301061320180514', N'1511240143', N'0106', N'13', NULL, N'1', N'1', NULL, N'2018-08-20')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for WorkInfo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkInfo]') AND type IN ('U'))
	DROP TABLE [dbo].[WorkInfo]
GO

CREATE TABLE [dbo].[WorkInfo] (
  [PostId] char(4) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Post] varchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [WorkPlace] varchar(30) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [HourlyWage] decimal(8,2) NOT NULL,
  [GenderReq] char(2) COLLATE Chinese_PRC_CI_AS NULL,
  [BelongUnit] varchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [GradeReq] varchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [LossForAbsence] decimal(8,2) NOT NULL,
  [JobDescription] varchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [ApplyTimeBe] date NOT NULL,
  [ApplyTimeFi] date NOT NULL,
  [PeoNumberDemand] int NOT NULL,
  [IsConfirm] bit SPARSE NULL
)
GO

ALTER TABLE [dbo].[WorkInfo] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'PostId=单位号+两位编号',
'SCHEMA', N'dbo',
'TABLE', N'WorkInfo',
'COLUMN', N'PostId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'时薪',
'SCHEMA', N'dbo',
'TABLE', N'WorkInfo',
'COLUMN', N'HourlyWage'
GO

EXEC sp_addextendedproperty
'MS_Description', N'性别要求',
'SCHEMA', N'dbo',
'TABLE', N'WorkInfo',
'COLUMN', N'GenderReq'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所属单位',
'SCHEMA', N'dbo',
'TABLE', N'WorkInfo',
'COLUMN', N'BelongUnit'
GO

EXEC sp_addextendedproperty
'MS_Description', N'年级要求',
'SCHEMA', N'dbo',
'TABLE', N'WorkInfo',
'COLUMN', N'GradeReq'
GO

EXEC sp_addextendedproperty
'MS_Description', N'缺勤每小时倒扣工资',
'SCHEMA', N'dbo',
'TABLE', N'WorkInfo',
'COLUMN', N'LossForAbsence'
GO

EXEC sp_addextendedproperty
'MS_Description', N'可以申请的开始时间',
'SCHEMA', N'dbo',
'TABLE', N'WorkInfo',
'COLUMN', N'ApplyTimeBe'
GO

EXEC sp_addextendedproperty
'MS_Description', N'申请结束的时间',
'SCHEMA', N'dbo',
'TABLE', N'WorkInfo',
'COLUMN', N'ApplyTimeFi'
GO

EXEC sp_addextendedproperty
'MS_Description', N'要求人数',
'SCHEMA', N'dbo',
'TABLE', N'WorkInfo',
'COLUMN', N'PeoNumberDemand'
GO

EXEC sp_addextendedproperty
'MS_Description', N'资助中心确认后才能发布给学生',
'SCHEMA', N'dbo',
'TABLE', N'WorkInfo',
'COLUMN', N'IsConfirm'
GO


-- ----------------------------
-- Records of [WorkInfo]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[WorkInfo]  VALUES (N'0101', N'洗碗', N'西苑', N'12.00', N'男', N'西苑', N'大三', N'2.00', N'开始加快分解', N'1900-01-01', N'1900-01-01', N'1', N'1'), (N'0102', N'扫地', N'西苑', N'11.00', N'无', N'西苑', N'大二,大三', N'1.00', N'但人感染登革热打广告的如果的如果但如果', N'2018-07-06', N'2018-08-07', N'4', N'1'), (N'0103', N'切菜', N'西苑', N'11.00', N'无', N'西苑', N'大二,大三', N'1.00', N'但人感染登革热打广告的如果的如果但如果而隔热隔热隔热特瑞特瑞特瑞特他', N'2018-07-06', N'2018-08-07', N'4', N'1'), (N'0104', N'345', N'55', N'12.00', N'无', N'西苑', N'大一,大四', N'1.00', N'tertert', N'2018-07-06', N'2018-08-07', N'9', N'1'), (N'0105', N'行政', N'西苑', N'9.00', N'女', N'西苑', N'大一', N'2.00', N'整理资料、帮忙送材料', N'2018-06-13', N'2018-07-13', N'2', N'1'), (N'0106', N'杀鸡', N'西苑', N'23.00', N'无', N'西苑', N'大二,大三', N'1.00', N'34543fdgf发火点发货的风格和的发表的回复v房管局佛教基督教刚刚回归方法和发挥发挥规范化规范化', N'2018-07-06', N'2018-08-07', N'9', N'1'), (N'0107', N'shuaka22', N'西苑', N'16.00', N'无', N'西苑', N'大二,大三,大四', N'2.00', N'豆腐干大师傅公司的故事', N'2018-07-06', N'2018-08-07', N'4', N'1'), (N'0108', N'shuaka2233', N'西苑', N'16.00', N'无', N'西苑', N'大三,大四', N'2.00', N'豆腐干大师傅公司的故事', N'2018-07-06', N'2018-08-07', N'4', N'1'), (N'0109', N'刷晚', N'西苑', N'16.00', N'无', N'西苑', N'大一,大二           ', N'12.00', N'士大夫但是古代服饰公司', N'2018-07-06', N'2018-08-07', N'12', NULL), (N'0110', N'刷晚2', N'西苑', N'16.00', N'无', N'西苑', N'大一,大二           ', N'12.00', N'士大夫但是古代服饰公司', N'2018-07-06', N'2018-08-07', N'12', NULL), (N'0111', N'22刷晚2', N'西苑', N'16.00', N'无', N'西苑', N'大一,大二           ', N'12.00', N'士大夫但是古代服饰公司', N'2018-07-06', N'2018-08-07', N'12', NULL), (N'0112', N'322刷晚2', N'西苑', N'16.00', N'无', N'西苑', N'大一,大二           ', N'12.00', N'士大夫但是古代服饰公司', N'2018-07-06', N'2018-08-07', N'12', NULL), (N'0113', N'322刷晚223', N'西苑', N'16.00', N'无', N'西苑', N'大一,大二           ', N'12.00', N'士大夫但是古代服饰公司', N'2018-07-06', N'2018-08-07', N'12', NULL), (N'0201', N'洗碟子', N'东苑', N'12.00', N'无', N'东苑', N'大一,大二,大三,大四', N'1.00', N'sdfs', N'2018-07-01', N'2018-07-26', N'2', N'1')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for WorkReqTime
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkReqTime]') AND type IN ('U'))
	DROP TABLE [dbo].[WorkReqTime]
GO

CREATE TABLE [dbo].[WorkReqTime] (
  [PostId] char(4) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [TId] char(2) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [WRId] char(8) COLLATE Chinese_PRC_CI_AS NOT NULL
)
GO

ALTER TABLE [dbo].[WorkReqTime] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'POst+Tid',
'SCHEMA', N'dbo',
'TABLE', N'WorkReqTime',
'COLUMN', N'WRId'
GO


-- ----------------------------
-- Records of [WorkReqTime]
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [dbo].[WorkReqTime]  VALUES (N'0101', N'11', N'010111  '), (N'0101', N'12', N'010112  '), (N'0101', N'13', N'010113  '), (N'0101', N'23', N'010123  '), (N'0101', N'33', N'010133  '), (N'0102', N'12', N'010212  '), (N'0103', N'11', N'010311  '), (N'0103', N'12', N'010312  '), (N'0103', N'13', N'010313  '), (N'0103', N'23', N'010323  '), (N'0103', N'33', N'010333  '), (N'0104', N'11', N'010411  '), (N'0104', N'12', N'010412  '), (N'0104', N'13', N'010413  '), (N'0104', N'23', N'010423  '), (N'0104', N'33', N'010433  '), (N'0105', N'12', N'010512  '), (N'0106', N'11', N'010611  '), (N'0106', N'12', N'010612  '), (N'0106', N'13', N'010613  '), (N'0107', N'11', N'010711  '), (N'0107', N'12', N'010712  '), (N'0108', N'11', N'010811  '), (N'0108', N'12', N'010812  '), (N'0109', N'11', N'010911  '), (N'0109', N'12', N'010912  '), (N'0109', N'13', N'010913  '), (N'0110', N'11', N'011011  '), (N'0110', N'12', N'011012  '), (N'0110', N'13', N'011013  '), (N'0111', N'11', N'011111  '), (N'0111', N'12', N'011112  '), (N'0111', N'13', N'011113  '), (N'0112', N'11', N'011211  '), (N'0112', N'12', N'011212  '), (N'0112', N'13', N'011213  '), (N'0113', N'11', N'011311  '), (N'0113', N'12', N'011312  '), (N'0113', N'13', N'011313  '), (N'0201', N'11', N'020111  '), (N'0201', N'13', N'020113  '), (N'0201', N'23', N'020123  ')
GO

COMMIT
GO


-- ----------------------------
-- Procedure structure for countWagesforSingle
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[countWagesforSingle]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[countWagesforSingle]
GO

CREATE PROCEDURE [dbo].[countWagesforSingle]
  @Sname AS varchar(10) 
AS
BEGIN
	-- routine body goes here, e.g.
	-- SELECT 'Navicat for SQL Server'
	DECLARE @Payday datetime,@stunum int,@SId char(10),@LossHour DECIMAL(5,1),@RealTotalHour DECIMAL(5,1),@TotalPay decimal(8,2),@FinalPay decimal(8,2),@PostId char(4)
	set @Payday=GETDATE()
	--UPDATE WorkCheck set IsSettle=1 WHERE DetailDate<@Payday and IsAttend=1
	SELECT @SId=SId from Student WHERE Sname=@Sname
	select @RealTotalHour=sum(TimeLength) from WorkCheck,[time] WHERE WorkCheck.TId=[time].TId and SId=@sid and IsAttend=1
  SELECT @LossHour=sum(TimeLength) from WorkCheck,[time] WHERE WorkCheck.TId=[time].TId and SId=@sid and IsAttend is null and IsFinishWC=1
	if @LossHour is null set @LossHour=0
 	set @PostId=(SELECT top 1 PostId from WorkCheck WHERE SId=@SId and IsSettle is null)
 	set @TotalPay=@RealTotalHour*(SELECT HourlyWage FROM WorkInfo where PostId=@PostId)
 	set @FinalPay=@TotalPay-@LossHour*(SELECT LossForAbsence FROM WorkInfo where PostId=@PostId)
 	INSERT into Salary VALUES(@sid+@PostId+CONVERT(varchar(100),@Payday,112),@SId,@PostId,(SELECT EmployerId from WorkInfo,Employer WHERE PostId=@PostId and BelongUnit=EmployerName),@RealTotalHour,convert(decimal(5,1),@RealTotalHour+@LossHour),@LossHour,@TotalPay,@FinalPay,@Payday)
UPDATE WorkCheck set IsSettle=1 WHERE IsFinishWC=1 and IsSettle is null and SId=@SId
END
GO


-- ----------------------------
-- Procedure structure for addwork
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[addwork]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[addwork]
GO

CREATE PROCEDURE [dbo].[addwork]
  @Post AS varchar(20) ,
  @WorkPlace AS varchar(30),
@HourlyWage As DECIMAL(8,2),
@GenderReq as char(2),
@BelongUnit as VARCHAR(20),
@GradeReq as char(20),
@LossForAbsence as DECIMAL(8,2),
@JobDescription as VARCHAR(100),
@ApplyTimeBe as date,
@ApplyTimeFi as date,
@PeoNumberDemand as int
AS
BEGIN
	-- routine body goes here, e.g.
	-- SELECT 'Navicat for SQL Server'
	DECLARE @newid char(4)
	set @newid=dbo.newpostid(@BelongUnit)
	if not EXISTS(SELECT post from WorkInfo where post=@Post)
	insert into workinfo values(@newid,@post,@workplace,@hourlywage,@genderreq,@belongunit,@gradereq,@lossforabsence,@jobdescription,@applytimebe,@applytimefi,@peonumberdemand,null)
END
GO


-- ----------------------------
-- Procedure structure for createWC
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[createWC]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[createWC]
GO

CREATE PROCEDURE [dbo].[createWC]
( @days AS int,@EmployerId char(2))
AS
BEGIN
	-- routine body goes here, e.g.
	-- SELECT 'Navicat for SQL Server'
	DECLARE @WCId char(24),@weekst int,@lastday date,@st char(2),@nextday int,@nextday1 int,@sid char(10),@PostId char(4),@TId char(2),@sccount int,@cal int,@firstday date
	select @sccount=count(*) from Schedule WHERE LEFT(PostId, 2)=@EmployerId /*werwerwerwerwerwetwetwetwetwetewtwet*/
	set @lastday=(SELECT top 1 DetailDate FROM WorkCheck WHERE LEFT(PostId, 2)=@EmployerId ORDER BY DetailDate DESC)
	set @nextday1=1
	set @days=@days+1
	IF @lastday is null
	BEGIN
	set @lastday=(SELECT top 1 ValidStart FROM Schedule WHERE LEFT(PostId, 2)=@EmployerId ORDER BY ValidStart DESC)
	set @nextday1=0
	set @days=@days-1
  END
	---------------'''
	DECLARE @ScId char(22),@nextSc char(22),@thisday date
	DECLARE ScIds CURSOR FAST_FORWARD FOR SELECT ScId FROM Schedule WHERE LEFT(PostId, 2)=@EmployerId
	SELECT @lastday
	OPEN ScIds
	
	WHILE @sccount>0
  begin
	FETCH NEXT FROM ScIds INTO @nextSc
	set @nextday=@nextday1
	WHILE @nextday<@days
	 BEGIN
	 set @firstday=(SELECT ValidStart FROM Schedule WHERE ScId=@nextSc)
	 set @thisday=DATEADD(day, @nextday, @lastday)
	 --------
	 --SELECT @nextSc
-- 	 SELECT (SELECT WhatDay from [Time],Schedule WHERE ScId=@nextSc and Schedule.TId=time.TId)
-- 	 +'--'+datename(weekday,@thisday)
	 IF @thisday>=(SELECT ValidStart from Schedule WHERE ScId=@nextSc) and @thisday<=(SELECT ValidEnd from Schedule WHERE ScId=@nextSc) 
	 and (SELECT WhatDay from [Time],Schedule WHERE ScId=@nextSc and Schedule.TId=time.TId)=datename(weekday,@thisday)
	 BEGIN

	------获取第几次
	 set @weekst=datepart(wk,@thisday)-DATEPART(wk, @firstday)
	 ------
	 IF @weekst<10 BEGIN
	 set @st='0'+CONVERT(char(1),@weekst)
   END
   ELSE BEGIN
	 set @st=CONVERT(char(2),@weekst)
   END
---------
	 set @WCId=@nextSc+@st
	 SELECT @SId=SId,@PostId=PostId,@TId=TId from Schedule WHERE ScId=@nextsc
	 INSERT INTO WorkCheck(WCId,SId,PostId,TId,DetailDate)VALUES(@wcid,@sid,@postid,@tid,@thisday)
	 
   END
   set @nextday=@nextday+1
   END
	 set @sccount=@sccount-1
	 
	 end
	 
	 CLOSE ScIds
   DEALLOCATE ScIds
	 --SELECT * FROM WorkCheck ORDER BY DetailDate
	 --DELETE from WorkCheck
END
GO


-- ----------------------------
-- Function structure for newpostid
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[newpostid]') AND type IN ('FN', 'FS', 'FT', 'IF', 'TF'))
	DROP FUNCTION[dbo].[newpostid]
GO

CREATE FUNCTION [dbo].[newpostid]
(
 @BelongUnit as VARCHAR(20)
)
RETURNS char(4) -- nvarchar
AS
BEGIN
	DECLARE @newid char(4),@newint int,@tem char(2)
	set @newint= (SELECT top 1 right(PostId,2) from WorkInfo WHERE BelongUnit=@BelongUnit ORDER BY PostId DESC)+1
	if @newint is null set @newint=1
	if(@newint<10)set @tem='0'+CONVERT(char,@newint)
	else set @tem=CONVERT(char(2),@newint)
	set @newid=(SELECT EmployerId from Employer WHERE EmployerName=@BelongUnit)+@tem
	RETURN @newid
END
GO


-- ----------------------------
-- Procedure structure for addtime
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[addtime]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[addtime]
GO

CREATE PROCEDURE [dbo].[addtime]
  @WhatDay AS char(6) ,
  @StartTime AS time ,
  @EndTime AS time 
AS
BEGIN
	-- routine body goes here, e.g.
	-- SELECT 'Navicat for SQL Server'
	DECLARE @fc char,@sc char,@newtid char(2)
	if @WhatDay='星期一' set @fc='1'
	if @WhatDay='星期二' set @fc='2'
	if @WhatDay='星期三' set @fc='3'
	if @WhatDay='星期四' set @fc='4'
	if @WhatDay='星期五' set @fc='5'
	if @WhatDay='星期六' set @fc='6'
	if @WhatDay='星期日' set @fc='7'
	set @sc=(SELECT top 1 right(tid,1) from time WHERE left(tid,1)=@fc ORDER BY right(tid,1) desc)+1
	set @newtid=@fc+@sc
	insert into time(tid,WhatDay,StartTime,EndTime)VALUES(@newtid,@WhatDay,@StartTime,@EndTime)
END
GO


-- ----------------------------
-- Procedure structure for arrangeWork
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[arrangeWork]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[arrangeWork]
GO

CREATE PROCEDURE [dbo].[arrangeWork]
  @SId AS char(10) ,
  @PostId AS  char(4),
	@TId AS  char(2),
  @ValidStart AS date,
  @ValidEnd AS date
AS
BEGIN
    declare @ScId char(22)
	-- routine body goes here, e.g.
	-- SELECT 'Navicat for SQL Server'
	set @ScId=@SId+@PostId+@TId+convert(char(4),datename(yyyy,@ValidStart))+convert(char(2),datename(mm,@ValidStart))
	if(not EXISTS(SELECT * from Schedule WHERE scid=@scid))
	INSERT into Schedule VALUES(@SId,@PostId,@TId,@ScId,@ValidStart,@ValidEnd)
END
GO


-- ----------------------------
-- Procedure structure for countWages
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[countWages]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[countWages]
GO

CREATE PROCEDURE [dbo].[countWages]
AS
BEGIN
	-- routine body goes here, e.g.
	-- SELECT 'Navicat for SQL Server'
	DECLARE @Payday datetime,@stunum int,@SId char(10),@LossHour DECIMAL(5,1),@RealTotalHour DECIMAL(5,1),@TotalPay decimal(8,2),@FinalPay decimal(8,2),@PostId char(4)
	set @Payday=GETDATE()
	select @stunum=count(distinct SId) from WorkCheck where IsFinishWC=1 and IsSettle is null
	--select @stunum as 'countsid'--test
	--UPDATE WorkCheck set IsSettle=1 WHERE DetailDate<@Payday and IsAttend=1
	DECLARE stus CURSOR FAST_FORWARD for SELECT distinct SId from WorkCheck where IsFinishWC=1 and IsSettle is null
	open stus
	WHILE @stunum>0 BEGIN
	fetch next from stus into @sid
	select @RealTotalHour=sum(TimeLength) from WorkCheck,[time] WHERE WorkCheck.TId=[time].TId and SId=@sid and IsAttend=1 and IsSettle is null
  SELECT @LossHour=sum(TimeLength) from WorkCheck,[time] WHERE WorkCheck.TId=[time].TId and SId=@sid and IsAttend is null and IsFinishWC=1 and IsSettle is null
	if @LossHour is null set @LossHour=0
 	set @PostId=(SELECT top 1 PostId from WorkCheck WHERE SId=@SId and IsSettle is null)
 	set @TotalPay=@RealTotalHour*(SELECT HourlyWage FROM WorkInfo where PostId=@PostId)
 	set @FinalPay=@TotalPay-@LossHour*(SELECT LossForAbsence FROM WorkInfo where PostId=@PostId)
	UPDATE WorkCheck set IsSettle=1 WHERE sid=@sid and IsFinishWC=1 and IsSettle is null
 	INSERT into Salary VALUES(@sid+@PostId+CONVERT(varchar(100),@Payday,112),@SId,@PostId,(SELECT EmployerId from WorkInfo,Employer WHERE PostId=@PostId and BelongUnit=EmployerName),@RealTotalHour,convert(decimal(5,1),@RealTotalHour+@LossHour),@LossHour,@TotalPay,@FinalPay,@Payday)
 	set @stunum=@stunum-1
END
CLOSE stus
DEALLOCATE stus
--UPDATE WorkCheck set IsSettle=1 WHERE IsFinishWC=1 and IsSettle is null
END
GO


-- ----------------------------
-- Triggers structure for table Apply
-- ----------------------------
CREATE TRIGGER [dbo].[applyandreview]
ON [dbo].[Apply]
WITH EXECUTE AS CALLER
FOR INSERT, DELETE
AS
BEGIN
  -- Type the SQL Here.
	if ((SELECT count(*) from inserted)>0)
	INSERT into SHInfo VALUES((SELECT ApplyId from inserted),null,null,'待审核')
	if((SELECT count(*) from deleted)>0)
	DELETE from SHInfo WHERE ApplyId=(SELECT ApplyId from inserted)
END
GO


-- ----------------------------
-- Primary Key structure for table Apply
-- ----------------------------
ALTER TABLE [dbo].[Apply] ADD CONSTRAINT [PK__Apply__F0687FB16208AE8F] PRIMARY KEY CLUSTERED ([ApplyId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)  
ON [PRIMARY]
GO


-- ----------------------------
-- Uniques structure for table Employer
-- ----------------------------
ALTER TABLE [dbo].[Employer] ADD CONSTRAINT [UQ__Employer__4FAE35989FE49E33] UNIQUE NONCLUSTERED ([EmployerName] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Employer
-- ----------------------------
ALTER TABLE [dbo].[Employer] ADD CONSTRAINT [PK__Employer__CA4452613D1329F3] PRIMARY KEY CLUSTERED ([EmployerId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Salary
-- ----------------------------
ALTER TABLE [dbo].[Salary] ADD CONSTRAINT [PK__Salary__4BE204572E610D93] PRIMARY KEY CLUSTERED ([SalaryId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)  
ON [PRIMARY]
GO


-- ----------------------------
-- Checks structure for table Schedule
-- ----------------------------
ALTER TABLE [dbo].[Schedule] ADD CONSTRAINT [CK__Schedule__2334397B] CHECK ([ScId]=(((([SId]+[PostId])+[TId])+CONVERT([char](4),datename(year,[ValidStart])))+CONVERT([char](2),datename(month,[ValidStart]))))
GO


-- ----------------------------
-- Primary Key structure for table Schedule
-- ----------------------------
ALTER TABLE [dbo].[Schedule] ADD CONSTRAINT [PK__Schedule__ACB791DA8016CCEF] PRIMARY KEY CLUSTERED ([ScId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table SHInfo
-- ----------------------------
ALTER TABLE [dbo].[SHInfo] ADD CONSTRAINT [PK__SHInfo__F0687FB140F7C062] PRIMARY KEY CLUSTERED ([ApplyId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)  
ON [PRIMARY]
GO


-- ----------------------------
-- Triggers structure for table Student
-- ----------------------------
CREATE TRIGGER [dbo].[adduseryy]
ON [dbo].[Student]
WITH EXECUTE AS CALLER
FOR INSERT
AS
BEGIN
  -- Type the SQL Here.
	--DECLARE @sid char(10)
	--SELECT @sid=SId from inserted
	INSERT into [User] VALUES((SELECT SId from inserted),substring(sys.fn_sqlvarbasetostr(HashBytes('MD5','123456')),3,32),'学生',null)
END
GO


-- ----------------------------
-- Checks structure for table Student
-- ----------------------------
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [CK__Student__Ssex__74AE54BC] CHECK ([Ssex]='女' OR [Ssex]='男')
GO


-- ----------------------------
-- Primary Key structure for table Student
-- ----------------------------
ALTER TABLE [dbo].[Student] ADD CONSTRAINT [PK__Student__CA195950CDA865AA] PRIMARY KEY CLUSTERED ([SId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table StuFreeTime
-- ----------------------------
ALTER TABLE [dbo].[StuFreeTime] ADD CONSTRAINT [PK__StuFreeT__F4AC9CB6C992A821] PRIMARY KEY CLUSTERED ([SFId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)  
ON [PRIMARY]
GO


-- ----------------------------
-- Triggers structure for table Time
-- ----------------------------
CREATE TRIGGER [dbo].[timelencacl]
ON [dbo].[Time]
WITH EXECUTE AS CALLER
INSTEAD OF INSERT, UPDATE
AS
BEGIN
  -- Type the SQL Here.
	DECLARE @TId char(2),@WhatDay char(6),@StartTime time,@EndTime time
	SELECT @TId=TId,@WhatDay=WhatDay,@StartTime=StartTime,@EndTime=EndTime FROM inserted
	DELETE from Time WHERE tid=@TId
	INSERT into [dbo].[Time] VALUES(@TId,@WhatDay,@StartTime,@EndTime,datediff(minute,@StartTime,@EndTime)/(60.0))
END
GO


-- ----------------------------
-- Checks structure for table Time
-- ----------------------------
ALTER TABLE [dbo].[Time] ADD CONSTRAINT [CK__Time__WhatDay__18EBB532] CHECK ([WhatDay]='星期日' OR [WhatDay]='星期六' OR [WhatDay]='星期五' OR [WhatDay]='星期四' OR [WhatDay]='星期三' OR [WhatDay]='星期二' OR [WhatDay]='星期一')
GO


-- ----------------------------
-- Primary Key structure for table Time
-- ----------------------------
ALTER TABLE [dbo].[Time] ADD CONSTRAINT [PK__Time__C456D749C3EA87D4] PRIMARY KEY CLUSTERED ([TId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)  
ON [PRIMARY]
GO


-- ----------------------------
-- Checks structure for table User
-- ----------------------------
ALTER TABLE [dbo].[User] ADD CONSTRAINT [CK__User__UserId__339FAB6E] CHECK ([UserId]='资助中心' OR [UserId]='用人单位' OR [UserId]='学工组' OR [UserId]='学生')
GO


-- ----------------------------
-- Primary Key structure for table User
-- ----------------------------
ALTER TABLE [dbo].[User] ADD CONSTRAINT [PK__User__C9F28457519192D8] PRIMARY KEY CLUSTERED ([UserName])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)  
ON [PRIMARY]
GO


-- ----------------------------
-- Triggers structure for table WorkCheck
-- ----------------------------
CREATE TRIGGER [dbo].[wcsyn]
ON [dbo].[WorkCheck]
WITH EXECUTE AS CALLER
FOR UPDATE
AS
if UPDATE(IsAttend)
BEGIN
  -- Type the SQL Here.
	if((SELECT IsAttend from inserted)=1)UPDATE WorkCheck set IsFinishWC=1 WHERE WCId=(SELECT WCId from inserted)
	if UPDATE(IsFinishWC) or UPDATE(IsAttend)
	UPDATE WorkCheck set InputTime=GETDATE() WHERE WCId=(SELECT WCId FROM inserted)
END
GO


-- ----------------------------
-- Primary Key structure for table WorkCheck
-- ----------------------------
ALTER TABLE [dbo].[WorkCheck] ADD CONSTRAINT [PK__WorkChec__FFA16C43948B8DD5] PRIMARY KEY CLUSTERED ([WCId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)  
ON [PRIMARY]
GO


-- ----------------------------
-- Uniques structure for table WorkInfo
-- ----------------------------
ALTER TABLE [dbo].[WorkInfo] ADD CONSTRAINT [UQ__WorkInfo__A4DFCAAF66FAA572] UNIQUE NONCLUSTERED ([Post] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table WorkInfo
-- ----------------------------
ALTER TABLE [dbo].[WorkInfo] ADD CONSTRAINT [PK__WorkInfo__AA12601895AD114E] PRIMARY KEY CLUSTERED ([PostId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table WorkReqTime
-- ----------------------------
ALTER TABLE [dbo].[WorkReqTime] ADD CONSTRAINT [PK__WorkReqT__8DB3499773C9C1BB] PRIMARY KEY CLUSTERED ([WRId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table Salary
-- ----------------------------
ALTER TABLE [dbo].[Salary] ADD CONSTRAINT [FK__Salary__SId__1AD3FDA4] FOREIGN KEY ([SId]) REFERENCES [Student] ([SId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Salary] ADD CONSTRAINT [FK__Salary__PostId__1CBC4616] FOREIGN KEY ([PostId]) REFERENCES [WorkInfo] ([PostId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Salary] ADD CONSTRAINT [FK__Salary__Employer__1DB06A4F] FOREIGN KEY ([EmployerId]) REFERENCES [Employer] ([EmployerId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Schedule
-- ----------------------------
ALTER TABLE [dbo].[Schedule] ADD CONSTRAINT [FK__Schedule__SId__51300E55] FOREIGN KEY ([SId]) REFERENCES [Student] ([SId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Schedule] ADD CONSTRAINT [FK__Schedule__PostId__5224328E] FOREIGN KEY ([PostId]) REFERENCES [WorkInfo] ([PostId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Schedule] ADD CONSTRAINT [FK__Schedule__TId__531856C7] FOREIGN KEY ([TId]) REFERENCES [Time] ([TId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table SHInfo
-- ----------------------------
ALTER TABLE [dbo].[SHInfo] ADD CONSTRAINT [FK__SHInfo__ApplyId__245D67DE] FOREIGN KEY ([ApplyId]) REFERENCES [Apply] ([ApplyId]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table StuFreeTime
-- ----------------------------
ALTER TABLE [dbo].[StuFreeTime] ADD CONSTRAINT [FK__StuFreeTime__SId__2645B050] FOREIGN KEY ([SId]) REFERENCES [Student] ([SId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[StuFreeTime] ADD CONSTRAINT [FK__StuFreeTime__TId__2739D489] FOREIGN KEY ([TId]) REFERENCES [Time] ([TId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table WorkCheck
-- ----------------------------
ALTER TABLE [dbo].[WorkCheck] ADD CONSTRAINT [FK__WorkCheck__PostI__2DE6D218] FOREIGN KEY ([PostId]) REFERENCES [WorkInfo] ([PostId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[WorkCheck] ADD CONSTRAINT [FK__WorkCheck__TId__2EDAF651] FOREIGN KEY ([TId]) REFERENCES [Time] ([TId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[WorkCheck] ADD CONSTRAINT [FK__WorkCheck__SId__2CF2ADDF] FOREIGN KEY ([SId]) REFERENCES [Student] ([SId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table WorkInfo
-- ----------------------------
ALTER TABLE [dbo].[WorkInfo] ADD CONSTRAINT [FK__WorkInfo__Belong__797309D9] FOREIGN KEY ([BelongUnit]) REFERENCES [Employer] ([EmployerName]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table WorkReqTime
-- ----------------------------
ALTER TABLE [dbo].[WorkReqTime] ADD CONSTRAINT [FK__WorkReqTime__TId__32AB8735] FOREIGN KEY ([TId]) REFERENCES [Time] ([TId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[WorkReqTime] ADD CONSTRAINT [FK__WorkReqTi__PostI__31B762FC] FOREIGN KEY ([PostId]) REFERENCES [WorkInfo] ([PostId]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

