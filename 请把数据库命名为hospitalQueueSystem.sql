/*
 Navicat Premium Data Transfer

 Source Server         : SQL Server
 Source Server Type    : SQL Server
 Source Server Version : 16001135 (16.00.1135)
 Source Catalog        : hospitalQueueSystem
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 16001135 (16.00.1135)
 File Encoding         : 65001

 Date: 29/05/2025 01:30:28
*/


-- ----------------------------
-- Table structure for department
-- ----------------------------
IF EXISTS (SELECT *
           FROM sys.all_objects
           WHERE object_id = OBJECT_ID(N'[dbo].[department]')
             AND type IN ('U'))
    DROP TABLE [dbo].[department]
GO

CREATE TABLE [dbo].[department]
(
    [departmentID]      int IDENTITY (1,1)                    NOT NULL,
    [name]              varchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
    [headID]            int                                   NULL,
    [managerPhonePhone] varchar(50) COLLATE Chinese_PRC_CI_AS NULL
)
GO

ALTER TABLE [dbo].[department]
    SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of department
-- ----------------------------
SET IDENTITY_INSERT [dbo].[department] ON
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'1', N'儿科', N'16', N'162-9758-3635')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'2', N'耳鼻喉科', N'22', N'769-559-5312')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'3', N'妇科', N'8', N'150-1122-3809')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'4', N'男科', N'44', N'21-116-3739')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'5', N'消化道科', N'48', N'10-186-2728')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'6', N'肛肠科', N'13', N'170-1905-1448')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'7', N'呼吸内科', N'21', N'760-2686-1214')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'8', N'心血管内科', N'84', N'760-0440-5623')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'9', N'消化内科', N'23', N'142-8519-7154')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'10', N'内分泌科', N'76', N'20-4386-6843')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'11', N'普外科', N'82', N'755-6109-2655')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'12', N'骨科', N'79', N'146-6696-2246')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'13', N'神经外科', N'68', N'10-278-9750')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'14', N'皮肤科', N'67', N'195-2818-1846')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'15', N'肿瘤科', N'58', N'157-1393-9151')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'16', N'风湿免疫科', N'1', N'192-2449-0287')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'17', N'眼科', N'77', N'176-4770-7689')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'18', N'放射科', N'56', N'178-1510-0207')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'19', N'疼痛科', N'90', N'199-4799-1441')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'20', N'整形内科（烧伤科）', N'100', N'195-1773-0176')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'21', N'内科', NULL, N'13800138001')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'22', N'外科', NULL, N'13800138002')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'23', N'儿科', NULL, N'13800138003')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'24', N'妇产科', NULL, N'13800138004')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'25', N'眼科', NULL, N'13800138005')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'26', N'急诊科', NULL, N'13800138006')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'27', N'内科', NULL, N'13800138001')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'28', N'外科', NULL, N'13800138002')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'29', N'儿科', NULL, N'13800138003')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'30', N'妇产科', NULL, N'13800138004')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'31', N'眼科', NULL, N'13800138005')
GO

INSERT INTO [dbo].[department] ([departmentID], [name], [headID], [managerPhonePhone])
VALUES (N'32', N'急诊科', NULL, N'13800138006')
GO

SET IDENTITY_INSERT [dbo].[department] OFF
GO


-- ----------------------------
-- Table structure for doctor
-- ----------------------------
IF EXISTS (SELECT *
           FROM sys.all_objects
           WHERE object_id = OBJECT_ID(N'[dbo].[doctor]')
             AND type IN ('U'))
    DROP TABLE [dbo].[doctor]
GO

CREATE TABLE [dbo].[doctor]
(
    [doctorID]        int                                    NOT NULL,
    [name]            varchar(255) COLLATE Chinese_PRC_CI_AS NOT NULL,
    [departmentID]    int                                    NULL,
    [position]        varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
    [expertiseField]  varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
    [telephoneNumber] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
    [isLogoff]        bit                                    NULL,
    [userID]          int                                    NULL
)
GO

ALTER TABLE [dbo].[doctor]
    SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'1', N'秦宇宁', N'3', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'2', N'赵宇宁', N'6', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'3', N'郑嘉伦', N'6', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'4', N'唐詩涵', N'1', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'5', N'郭杰宏', N'0', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'6', N'董岚', N'3', N'医士', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'7', N'于璐', N'8', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'8', N'夏杰宏', N'5', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'9', N'徐子韬', N'4', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'10', N'程晓明', N'10', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'11', N'许詩涵', N'5', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'12', N'陈致远', N'7', N'医士', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'13', N'郭杰宏', N'10', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'14', N'沈睿', N'8', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'15', N'孔杰宏', N'3', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'16', N'赵安琪', N'7', N'医士', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'17', N'田云熙', N'9', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'18', N'黄震南', N'8', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'19', N'邱子异', N'3', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'20', N'钟杰宏', N'7', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'21', N'石震南', N'2', N'医士', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'22', N'姜杰宏', N'4', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'23', N'苏秀英', N'4', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'24', N'陶致远', N'3', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'25', N'江安琪', N'3', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'26', N'雷璐', N'4', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'27', N'于晓明', N'6', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'28', N'邱子韬', N'1', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'29', N'罗岚', N'2', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'30', N'熊睿', N'1', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'31', N'戴云熙', N'1', N'医士', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'32', N'江晓明', N'7', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'33', N'陈睿', N'6', N'医士', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'34', N'苏子韬', N'9', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'35', N'卢子韬', N'3', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'36', N'傅宇宁', N'9', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'37', N'唐睿', N'3', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'38', N'董晓明', N'8', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'39', N'毛震南', N'0', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'40', N'韩詩涵', N'9', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'41', N'贾子异', N'1', N'医士', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'42', N'谭震南', N'9', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'43', N'高岚', N'7', N'医士', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'44', N'石詩涵', N'9', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'45', N'陈嘉伦', N'5', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'46', N'何杰宏', N'3', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'47', N'郭晓明', N'5', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'48', N'孙子异', N'3', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'49', N'李璐', N'2', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'50', N'崔杰宏', N'8', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'51', N'常璐', N'8', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'52', N'薛詩涵', N'8', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'53', N'向秀英', N'0', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'54', N'熊子韬', N'9', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'55', N'曹安琪', N'7', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'56', N'邓璐', N'8', N'医士', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'57', N'黎秀英', N'3', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'58', N'谢宇宁', N'6', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'59', N'马子异', N'5', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'60', N'毛云熙', N'9', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'61', N'顾致远', N'1', N'医士', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'62', N'梁晓明', N'5', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'63', N'雷安琪', N'6', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'64', N'萧震南', N'8', N'医士', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'65', N'邱嘉伦', N'5', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'66', N'雷嘉伦', N'8', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'67', N'宋秀英', N'3', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'68', N'王秀英', N'5', N'医士', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'69', N'贺致远', N'6', N'医士', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'70', N'曹宇宁', N'8', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'71', N'何秀英', N'0', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'72', N'田璐', N'7', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'73', N'金云熙', N'1', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'74', N'姜致远', N'3', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'75', N'郝云熙', N'1', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'76', N'曾詩涵', N'9', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'77', N'胡宇宁', N'2', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'78', N'谭詩涵', N'5', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'79', N'贺璐', N'9', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'80', N'江宇宁', N'2', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'81', N'雷岚', N'8', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'82', N'曹嘉伦', N'7', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'83', N'萧宇宁', N'7', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'84', N'严詩涵', N'1', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'85', N'熊宇宁', N'4', N'医士', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'86', N'钱云熙', N'7', N'医士', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'87', N'邵子韬', N'1', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'88', N'董晓明', N'7', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'89', N'高嘉伦', N'4', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'90', N'钱詩涵', N'1', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'91', N'顾嘉伦', N'6', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'92', N'薛宇宁', N'2', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'93', N'萧璐', N'4', N'医士', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'94', N'毛震南', N'4', N'医士', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'95', N'黎云熙', N'5', N'
主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'96', N'汤岚', N'3', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'97', N'吕宇宁', N'4', N'
主治医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'98', N'曹秀英', N'2', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'99', N'蒋嘉伦', N'3', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'100', N'方宇宁', N'9', N'
副主任医师', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'1001', N'张建国', N'1', N'主任医师', N'心血管疾病', N'010-88888881', N'0', N'3')
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'1002', N'李华', N'2', N'主治医师', N'骨科手术', N'010-88888882', N'0', N'4')
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'1003', N'王芳', N'3', N'主治医师', N'儿童呼吸科', N'010-88888883', N'0', N'7')
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'1004', N'陈雨', N'4', N'副主任医师', N'妇科肿瘤', N'010-88888884', N'0', N'8')
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'1005', N'刘伟', N'5', N'医师', N'白内障手术', N'010-88888885', N'0', N'9')
GO

INSERT INTO [dbo].[doctor] ([doctorID], [name], [departmentID], [position], [expertiseField], [telephoneNumber],
                            [isLogoff], [userID])
VALUES (N'1006', N'赵强', N'6', N'主任医师', N'急诊创伤', N'010-88888886', N'0', N'10')
GO


-- ----------------------------
-- Table structure for oldAppointment
-- ----------------------------
IF EXISTS (SELECT *
           FROM sys.all_objects
           WHERE object_id = OBJECT_ID(N'[dbo].[oldAppointment]')
             AND type IN ('U'))
    DROP TABLE [dbo].[oldAppointment]
GO

CREATE TABLE [dbo].[oldAppointment]
(
    [orderID]         bigint                                NOT NULL,
    [patientID]       int                                   NULL,
    [doctorID]        int                                   NULL,
    [priority]        int                                   NULL,
    [scheduledTime]   varchar(50) COLLATE Chinese_PRC_CI_AS NULL,
    [firstTimeCalled] datetime                              NULL,
    [isComein]        bit                                   NULL
)
GO

ALTER TABLE [dbo].[oldAppointment]
    SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of oldAppointment
-- ----------------------------
INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'1', N'11', N'1002', N'5', N'2025-06-13 13:00', N'2025-06-13 14:05:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'2', N'7', N'1006', N'2', N'2025-06-24 11:30', N'2025-06-24 14:07:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'3', N'12', N'1001', N'2', N'2025-06-08 13:45', N'2025-06-08 15:20:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'4', N'8', N'1001', N'5', N'2025-06-03 16:00', N'2025-06-03 17:50:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'5', N'10', N'1006', N'5', N'2025-06-11 14:15', N'2025-06-11 14:34:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'6', N'10', N'1002', N'5', N'2025-06-19 12:45', N'2025-06-19 13:21:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'7', N'11', N'1001', N'5', N'2025-06-20 15:15', N'2025-06-20 16:34:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'8', N'9', N'1004', N'3', N'2025-06-24 17:30', N'2025-06-24 20:07:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'9', N'8', N'1006', N'1', N'2025-06-15 10:30', N'2025-06-15 12:25:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'10', N'9', N'1003', N'3', N'2025-06-24 08:00', N'2025-06-24 08:52:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'11', N'9', N'1005', N'3', N'2025-06-17 12:30', N'2025-06-17 13:58:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'12', N'7', N'1002', N'5', N'2025-06-22 15:15', N'2025-06-22 16:09:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'13', N'12', N'1001', N'5', N'2025-06-04 16:15', N'2025-06-04 16:57:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'14', N'7', N'1005', N'1', N'2025-06-09 13:15', N'2025-06-09 14:53:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'15', N'8', N'1003', N'3', N'2025-06-12 08:45', N'2025-06-12 11:22:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'16', N'9', N'1006', N'1', N'2025-06-19 15:00', N'2025-06-19 15:24:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'17', N'7', N'1006', N'5', N'2025-06-11 13:15', N'2025-06-11 15:35:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'18', N'10', N'1002', N'1', N'2025-06-29 12:45', N'2025-06-29 13:46:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'19', N'7', N'1004', N'1', N'2025-06-12 13:45', N'2025-06-12 16:14:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'20', N'12', N'1002', N'3', N'2025-06-17 15:15', N'2025-06-17 15:56:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'21', N'9', N'1006', N'4', N'2025-06-05 15:15', N'2025-06-05 16:37:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'22', N'7', N'1001', N'3', N'2025-06-03 11:15', N'2025-06-03 11:38:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'23', N'11', N'1004', N'4', N'2025-06-29 12:00', N'2025-06-29 13:53:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'24', N'11', N'1002', N'1', N'2025-06-11 13:45', N'2025-06-11 13:50:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'25', N'9', N'1001', N'3', N'2025-06-27 10:15', N'2025-06-27 11:21:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'26', N'9', N'1001', N'5', N'2025-06-05 14:15', N'2025-06-05 15:32:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'27', N'10', N'1004', N'4', N'2025-06-04 17:30', N'2025-06-04 17:47:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'28', N'9', N'1005', N'1', N'2025-06-17 14:00', N'2025-06-17 15:39:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'29', N'12', N'1001', N'3', N'2025-06-03 09:30', N'2025-06-03 11:54:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'30', N'12', N'1004', N'4', N'2025-06-09 11:15', N'2025-06-09 13:41:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'31', N'10', N'1005', N'5', N'2025-06-09 14:00', N'2025-06-09 14:07:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'32', N'7', N'1006', N'4', N'2025-06-19 12:15', N'2025-06-19 13:21:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'33', N'12', N'1004', N'1', N'2025-06-28 09:30', N'2025-06-28 10:38:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'34', N'7', N'1005', N'3', N'2025-06-27 15:30', N'2025-06-27 18:01:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'35', N'9', N'1003', N'5', N'2025-06-09 11:15', N'2025-06-09 12:29:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'36', N'9', N'1004', N'2', N'2025-06-14 08:45', N'2025-06-14 09:19:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'37', N'11', N'1004', N'2', N'2025-06-19 12:45', N'2025-06-19 13:55:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'38', N'12', N'1004', N'1', N'2025-06-10 08:30', N'2025-06-10 08:52:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'39', N'8', N'1001', N'3', N'2025-06-28 16:15', N'2025-06-28 18:01:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'40', N'11', N'1001', N'2', N'2025-06-12 08:45', N'2025-06-12 09:47:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'41', N'10', N'1006', N'3', N'2025-06-23 08:15', N'2025-06-23 08:31:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'42', N'8', N'1006', N'1', N'2025-06-08 09:45', N'2025-06-08 12:21:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'43', N'11', N'1003', N'1', N'2025-06-24 09:45', N'2025-06-24 11:03:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'44', N'12', N'1004', N'3', N'2025-06-17 08:15', N'2025-06-17 09:08:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'45', N'12', N'1002', N'3', N'2025-06-25 13:00', N'2025-06-25 13:14:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'46', N'12', N'1003', N'2', N'2025-06-09 15:30', N'2025-06-09 17:09:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'47', N'8', N'1002', N'5', N'2025-06-18 16:45', N'2025-06-18 17:06:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'48', N'12', N'1002', N'5', N'2025-06-09 10:30', N'2025-06-09 13:02:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'49', N'7', N'1001', N'3', N'2025-06-06 09:30', N'2025-06-06 10:37:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'50', N'12', N'1006', N'2', N'2025-06-21 08:15', N'2025-06-21 08:49:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'51', N'11', N'1006', N'3', N'2025-06-02 12:45', N'2025-06-02 13:34:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'52', N'8', N'1001', N'5', N'2025-06-14 08:15', N'2025-06-14 08:55:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'53', N'7', N'1001', N'1', N'2025-06-24 08:00', N'2025-06-24 08:18:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'54', N'9', N'1006', N'1', N'2025-06-03 13:30', N'2025-06-03 15:33:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'55', N'7', N'1004', N'4', N'2025-06-16 10:45', N'2025-06-16 13:19:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'56', N'7', N'1003', N'1', N'2025-06-28 15:45', N'2025-06-28 17:23:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'57', N'12', N'1004', N'3', N'2025-06-11 11:00', N'2025-06-11 11:23:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'58', N'12', N'1005', N'3', N'2025-06-17 09:45', N'2025-06-17 10:57:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'59', N'11', N'1004', N'2', N'2025-06-24 17:45', N'2025-06-24 19:44:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'60', N'11', N'1005', N'5', N'2025-06-03 17:45', N'2025-06-03 18:51:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'61', N'12', N'1003', N'5', N'2025-06-14 17:00', N'2025-06-14 17:16:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'62', N'7', N'1004', N'5', N'2025-06-04 11:30', N'2025-06-04 12:06:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'63', N'10', N'1001', N'1', N'2025-06-01 15:00', N'2025-06-01 15:54:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'64', N'10', N'1005', N'3', N'2025-06-29 11:00', N'2025-06-29 12:05:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'65', N'11', N'1004', N'4', N'2025-06-08 10:30', N'2025-06-08 12:45:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'66', N'10', N'1003', N'1', N'2025-06-20 09:45', N'2025-06-20 10:19:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'67', N'9', N'1002', N'3', N'2025-06-06 13:15', N'2025-06-06 14:52:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'68', N'9', N'1001', N'1', N'2025-06-09 13:45', N'2025-06-09 14:24:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'69', N'7', N'1005', N'3', N'2025-06-25 11:45', N'2025-06-25 13:57:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'70', N'12', N'1001', N'5', N'2025-06-26 17:00', N'2025-06-26 17:36:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'71', N'12', N'1004', N'5', N'2025-06-19 12:15', N'2025-06-19 14:10:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'72', N'7', N'1002', N'4', N'2025-06-08 16:00', N'2025-06-08 16:42:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'73', N'12', N'1004', N'5', N'2025-06-19 09:15', N'2025-06-19 10:14:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'74', N'12', N'1002', N'2', N'2025-06-02 16:00', N'2025-06-02 17:24:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'75', N'7', N'1005', N'5', N'2025-06-22 16:00', N'2025-06-22 17:40:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'76', N'7', N'1005', N'5', N'2025-06-02 17:00', N'2025-06-02 17:49:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'77', N'11', N'1004', N'2', N'2025-06-25 16:45', N'2025-06-25 18:08:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'78', N'9', N'1006', N'3', N'2025-06-06 11:15', N'2025-06-06 12:11:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'79', N'10', N'1005', N'5', N'2025-06-01 08:00', N'2025-06-01 09:19:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'80', N'11', N'1004', N'5', N'2025-06-07 10:30', N'2025-06-07 12:31:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'81', N'11', N'1001', N'3', N'2025-06-10 11:15', N'2025-06-10 13:42:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'82', N'9', N'1006', N'1', N'2025-06-11 09:00', N'2025-06-11 09:36:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'83', N'8', N'1006', N'5', N'2025-06-27 09:45', N'2025-06-27 11:11:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'84', N'11', N'1003', N'1', N'2025-06-23 10:00', N'2025-06-23 11:21:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'85', N'7', N'1005', N'3', N'2025-06-07 17:15', N'2025-06-07 19:39:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'86', N'7', N'1005', N'3', N'2025-06-24 17:00', N'2025-06-24 17:48:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'87', N'11', N'1005', N'2', N'2025-06-02 09:00', N'2025-06-02 09:43:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'88', N'11', N'1002', N'5', N'2025-06-19 11:15', N'2025-06-19 13:21:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'89', N'10', N'1006', N'5', N'2025-06-28 08:15', N'2025-06-28 08:55:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'90', N'12', N'1006', N'1', N'2025-06-14 13:00', N'2025-06-14 15:13:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'91', N'12', N'1006', N'4', N'2025-06-29 10:00', N'2025-06-29 11:55:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'92', N'9', N'1003', N'1', N'2025-06-21 10:00', N'2025-06-21 11:47:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'93', N'8', N'1004', N'5', N'2025-06-19 10:30', N'2025-06-19 11:20:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'94', N'10', N'1003', N'4', N'2025-06-25 15:45', N'2025-06-25 17:44:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'95', N'9', N'1002', N'5', N'2025-06-07 13:15', N'2025-06-07 15:11:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'96', N'9', N'1004', N'2', N'2025-06-30 14:30', N'2025-06-30 15:11:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'97', N'11', N'1001', N'5', N'2025-06-06 13:15', N'2025-06-06 14:20:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'98', N'10', N'1003', N'3', N'2025-06-14 13:15', N'2025-06-14 15:37:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'99', N'8', N'1001', N'4', N'2025-06-17 14:15', N'2025-06-17 14:29:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'100', N'8', N'1005', N'3', N'2025-06-20 17:00', N'2025-06-20 17:41:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'101', N'9', N'1003', N'4', N'2025-06-29 08:15', N'2025-06-29 09:01:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'102', N'12', N'1004', N'2', N'2025-06-20 15:45', N'2025-06-20 15:50:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'103', N'8', N'1002', N'1', N'2025-06-27 16:45', N'2025-06-27 19:05:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'104', N'11', N'1001', N'2', N'2025-06-05 14:45', N'2025-06-05 16:20:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'105', N'10', N'1006', N'1', N'2025-06-06 12:30', N'2025-06-06 13:02:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'106', N'11', N'1001', N'5', N'2025-06-07 15:15', N'2025-06-07 17:09:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'107', N'7', N'1004', N'5', N'2025-06-14 08:15', N'2025-06-14 10:41:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'108', N'10', N'1006', N'4', N'2025-06-23 12:45', N'2025-06-23 13:37:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'109', N'10', N'1005', N'2', N'2025-06-13 08:45', N'2025-06-13 10:53:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'110', N'9', N'1002', N'5', N'2025-06-12 11:45', N'2025-06-12 12:35:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'111', N'12', N'1001', N'1', N'2025-06-03 08:15', N'2025-06-03 09:53:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'112', N'7', N'1001', N'1', N'2025-06-05 11:15', N'2025-06-05 13:51:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'113', N'12', N'1005', N'4', N'2025-06-08 08:45', N'2025-06-08 11:06:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'114', N'9', N'1002', N'4', N'2025-06-16 16:15', N'2025-06-16 17:54:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'115', N'12', N'1004', N'4', N'2025-06-13 15:00', N'2025-06-13 16:44:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'116', N'9', N'1006', N'5', N'2025-06-29 16:00', N'2025-06-29 18:28:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'117', N'7', N'1005', N'2', N'2025-06-02 16:15', N'2025-06-02 17:26:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'118', N'10', N'1005', N'1', N'2025-06-07 11:45', N'2025-06-07 13:31:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'119', N'12', N'1001', N'4', N'2025-06-30 13:00', N'2025-06-30 14:17:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'120', N'10', N'1006', N'2', N'2025-06-09 12:15', N'2025-06-09 12:41:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'121', N'12', N'1006', N'3', N'2025-06-23 17:15', N'2025-06-23 19:09:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'122', N'11', N'1004', N'2', N'2025-06-21 16:30', N'2025-06-21 18:19:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'123', N'12', N'1004', N'4', N'2025-06-08 10:00', N'2025-06-08 10:56:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'124', N'8', N'1005', N'3', N'2025-06-15 09:00', N'2025-06-15 09:20:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'125', N'7', N'1006', N'5', N'2025-06-05 14:45', N'2025-06-05 16:19:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'126', N'7', N'1004', N'4', N'2025-06-26 15:15', N'2025-06-26 15:52:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'127', N'9', N'1002', N'4', N'2025-06-20 13:15', N'2025-06-20 14:37:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'128', N'9', N'1002', N'2', N'2025-06-15 15:00', N'2025-06-15 17:33:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'129', N'10', N'1005', N'5', N'2025-06-05 10:30', N'2025-06-05 11:31:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'130', N'7', N'1003', N'1', N'2025-06-15 15:30', N'2025-06-15 15:54:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'131', N'8', N'1005', N'2', N'2025-06-04 12:00', N'2025-06-04 13:25:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'132', N'10', N'1005', N'2', N'2025-06-29 16:30', N'2025-06-29 18:21:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'133', N'7', N'1006', N'3', N'2025-06-30 13:15', N'2025-06-30 14:30:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'134', N'7', N'1003', N'1', N'2025-06-04 16:45', N'2025-06-04 19:10:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'135', N'12', N'1002', N'1', N'2025-06-01 13:15', N'2025-06-01 14:11:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'136', N'11', N'1006', N'2', N'2025-06-14 12:30', N'2025-06-14 14:39:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'137', N'10', N'1001', N'3', N'2025-06-23 09:00', N'2025-06-23 11:06:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'138', N'10', N'1001', N'5', N'2025-06-05 10:15', N'2025-06-05 12:10:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'139', N'10', N'1005', N'3', N'2025-06-16 15:15', N'2025-06-16 15:28:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'140', N'8', N'1001', N'1', N'2025-06-23 10:30', N'2025-06-23 12:07:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'141', N'12', N'1001', N'2', N'2025-06-10 12:30', N'2025-06-10 12:49:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'142', N'10', N'1002', N'1', N'2025-06-21 15:45', N'2025-06-21 16:43:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'143', N'8', N'1002', N'1', N'2025-06-16 17:30', N'2025-06-16 20:00:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'144', N'11', N'1003', N'4', N'2025-06-07 16:15', N'2025-06-07 17:47:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'145', N'7', N'1005', N'3', N'2025-06-10 14:00', N'2025-06-10 16:04:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'146', N'12', N'1003', N'3', N'2025-06-22 10:30', N'2025-06-22 10:59:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'147', N'8', N'1004', N'5', N'2025-06-25 14:00', N'2025-06-25 15:07:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'148', N'7', N'1004', N'2', N'2025-06-28 16:30', N'2025-06-28 18:48:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'149', N'10', N'1003', N'5', N'2025-06-14 17:15', N'2025-06-14 17:33:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'150', N'10', N'1004', N'4', N'2025-06-20 17:45', N'2025-06-20 19:48:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'151', N'7', N'1004', N'1', N'2025-06-19 10:45', N'2025-06-19 12:19:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'152', N'9', N'1005', N'4', N'2025-06-08 14:45', N'2025-06-08 15:52:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'153', N'11', N'1003', N'3', N'2025-06-05 09:15', N'2025-06-05 11:12:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'154', N'8', N'1001', N'4', N'2025-06-16 08:00', N'2025-06-16 10:38:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'155', N'9', N'1006', N'4', N'2025-06-29 08:30', N'2025-06-29 10:17:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'156', N'9', N'1004', N'3', N'2025-06-14 10:15', N'2025-06-14 11:26:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'157', N'9', N'1006', N'1', N'2025-06-03 14:45', N'2025-06-03 15:53:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'158', N'11', N'1002', N'3', N'2025-06-10 09:00', N'2025-06-10 11:10:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'159', N'11', N'1004', N'2', N'2025-06-28 17:45', N'2025-06-28 19:29:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'160', N'9', N'1004', N'2', N'2025-06-10 14:45', N'2025-06-10 16:56:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'161', N'9', N'1004', N'2', N'2025-06-29 15:15', N'2025-06-29 16:26:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'162', N'10', N'1002', N'2', N'2025-06-20 13:30', N'2025-06-20 15:25:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'163', N'9', N'1003', N'5', N'2025-06-20 15:00', N'2025-06-20 16:37:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'164', N'8', N'1003', N'3', N'2025-06-26 16:30', N'2025-06-26 18:32:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'165', N'9', N'1002', N'4', N'2025-06-29 13:15', N'2025-06-29 15:26:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'166', N'8', N'1001', N'1', N'2025-06-06 16:15', N'2025-06-06 17:10:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'167', N'11', N'1002', N'3', N'2025-06-09 16:15', N'2025-06-09 17:23:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'168', N'11', N'1004', N'4', N'2025-06-07 13:30', N'2025-06-07 13:43:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'169', N'10', N'1004', N'2', N'2025-06-05 14:30', N'2025-06-05 15:58:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'170', N'7', N'1001', N'4', N'2025-06-13 09:30', N'2025-06-13 11:31:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'171', N'9', N'1005', N'3', N'2025-06-16 10:00', N'2025-06-16 10:54:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'172', N'9', N'1001', N'2', N'2025-06-29 17:00', N'2025-06-29 17:43:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'173', N'12', N'1001', N'5', N'2025-06-14 14:00', N'2025-06-14 16:27:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'174', N'10', N'1005', N'4', N'2025-06-25 15:45', N'2025-06-25 16:58:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'175', N'11', N'1004', N'2', N'2025-06-24 08:15', N'2025-06-24 10:05:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'176', N'11', N'1001', N'3', N'2025-06-17 17:30', N'2025-06-17 18:03:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'177', N'11', N'1002', N'4', N'2025-06-20 16:45', N'2025-06-20 18:19:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'178', N'8', N'1002', N'4', N'2025-06-07 10:00', N'2025-06-07 10:26:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'179', N'8', N'1006', N'2', N'2025-06-09 09:30', N'2025-06-09 10:36:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'180', N'11', N'1003', N'3', N'2025-06-21 16:15', N'2025-06-21 18:05:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'181', N'9', N'1003', N'3', N'2025-06-21 09:45', N'2025-06-21 10:35:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'182', N'12', N'1001', N'5', N'2025-06-22 09:15', N'2025-06-22 11:21:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'183', N'7', N'1006', N'5', N'2025-06-03 15:45', N'2025-06-03 15:55:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'184', N'11', N'1002', N'2', N'2025-06-04 11:00', N'2025-06-04 11:14:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'185', N'11', N'1003', N'2', N'2025-06-07 11:00', N'2025-06-07 12:18:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'186', N'9', N'1006', N'1', N'2025-06-24 17:45', N'2025-06-24 19:24:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'187', N'7', N'1005', N'2', N'2025-06-27 13:30', N'2025-06-27 15:35:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'188', N'12', N'1005', N'3', N'2025-06-12 14:45', N'2025-06-12 16:38:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'189', N'11', N'1005', N'4', N'2025-06-29 12:45', N'2025-06-29 15:18:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'190', N'12', N'1003', N'4', N'2025-06-25 08:15', N'2025-06-25 09:09:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'191', N'10', N'1004', N'3', N'2025-06-17 14:00', N'2025-06-17 15:57:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'192', N'11', N'1001', N'2', N'2025-06-21 17:30', N'2025-06-21 19:40:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'193', N'12', N'1001', N'3', N'2025-06-21 16:30', N'2025-06-21 16:38:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'194', N'12', N'1002', N'1', N'2025-06-17 12:00', N'2025-06-17 12:44:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'195', N'11', N'1005', N'5', N'2025-06-29 09:30', N'2025-06-29 10:07:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'196', N'10', N'1003', N'4', N'2025-06-21 17:45', N'2025-06-21 18:23:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'197', N'11', N'1002', N'3', N'2025-06-03 10:15', N'2025-06-03 12:14:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'198', N'8', N'1002', N'4', N'2025-06-22 10:30', N'2025-06-22 11:05:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'199', N'9', N'1002', N'5', N'2025-06-10 08:00', N'2025-06-10 08:23:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'200', N'12', N'1005', N'2', N'2025-06-05 08:15', N'2025-06-05 10:23:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'201', N'10', N'1003', N'1', N'2025-06-01 17:30', N'2025-06-01 17:53:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'202', N'7', N'1003', N'5', N'2025-06-19 09:45', N'2025-06-19 10:44:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'203', N'12', N'1003', N'5', N'2025-06-23 11:30', N'2025-06-23 12:48:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'204', N'12', N'1005', N'1', N'2025-06-05 14:30', N'2025-06-05 17:07:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'205', N'12', N'1004', N'4', N'2025-06-22 14:30', N'2025-06-22 14:56:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'206', N'9', N'1003', N'1', N'2025-06-01 10:30', N'2025-06-01 11:19:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'207', N'9', N'1002', N'5', N'2025-06-15 09:30', N'2025-06-15 10:31:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'208', N'8', N'1006', N'1', N'2025-06-08 09:30', N'2025-06-08 11:28:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'209', N'8', N'1006', N'4', N'2025-06-01 10:15', N'2025-06-01 11:24:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'210', N'7', N'1005', N'4', N'2025-06-05 10:30', N'2025-06-05 11:56:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'211', N'11', N'1002', N'2', N'2025-06-17 16:00', N'2025-06-17 18:16:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'212', N'11', N'1001', N'3', N'2025-06-11 15:15', N'2025-06-11 17:04:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'213', N'10', N'1005', N'5', N'2025-06-03 17:30', N'2025-06-03 20:04:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'214', N'12', N'1004', N'3', N'2025-06-09 16:15', N'2025-06-09 18:04:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'215', N'7', N'1004', N'4', N'2025-06-21 17:15', N'2025-06-21 18:58:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'216', N'10', N'1005', N'4', N'2025-06-03 17:30', N'2025-06-03 18:31:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'217', N'10', N'1003', N'1', N'2025-06-24 08:30', N'2025-06-24 10:43:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'218', N'12', N'1006', N'3', N'2025-06-17 09:30', N'2025-06-17 10:20:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'219', N'7', N'1003', N'1', N'2025-06-19 16:30', N'2025-06-19 17:09:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'220', N'7', N'1003', N'3', N'2025-06-03 08:15', N'2025-06-03 10:41:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'221', N'10', N'1001', N'5', N'2025-06-06 14:00', N'2025-06-06 16:39:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'222', N'11', N'1005', N'4', N'2025-06-06 17:45', N'2025-06-06 20:19:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'223', N'7', N'1001', N'3', N'2025-06-03 12:45', N'2025-06-03 15:11:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'224', N'10', N'1003', N'5', N'2025-06-21 09:45', N'2025-06-21 12:22:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'225', N'10', N'1003', N'5', N'2025-06-09 08:00', N'2025-06-09 09:44:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'226', N'9', N'1001', N'1', N'2025-06-30 16:00', N'2025-06-30 18:00:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'227', N'9', N'1004', N'4', N'2025-06-13 11:45', N'2025-06-13 13:07:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'228', N'10', N'1003', N'4', N'2025-06-14 14:15', N'2025-06-14 14:41:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'229', N'10', N'1002', N'2', N'2025-06-13 11:15', N'2025-06-13 13:43:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'230', N'8', N'1001', N'5', N'2025-06-29 11:45', N'2025-06-29 12:55:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'231', N'11', N'1004', N'4', N'2025-06-27 17:30', N'2025-06-27 17:43:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'232', N'12', N'1006', N'4', N'2025-06-14 12:00', N'2025-06-14 12:48:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'233', N'7', N'1002', N'1', N'2025-06-15 17:45', N'2025-06-15 19:12:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'234', N'10', N'1002', N'4', N'2025-06-29 16:00', N'2025-06-29 17:31:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'235', N'7', N'1003', N'2', N'2025-06-23 11:45', N'2025-06-23 12:03:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'236', N'10', N'1002', N'4', N'2025-06-12 17:30', N'2025-06-12 19:37:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'237', N'12', N'1002', N'5', N'2025-06-02 09:15', N'2025-06-02 10:50:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'238', N'11', N'1004', N'1', N'2025-06-02 11:45', N'2025-06-02 13:31:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'239', N'11', N'1005', N'2', N'2025-06-28 13:30', N'2025-06-28 15:47:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'240', N'11', N'1002', N'5', N'2025-06-24 11:00', N'2025-06-24 12:53:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'241', N'8', N'1002', N'5', N'2025-06-20 13:30', N'2025-06-20 14:00:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'242', N'7', N'1002', N'1', N'2025-06-11 11:15', N'2025-06-11 13:38:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'243', N'10', N'1005', N'5', N'2025-06-21 17:30', N'2025-06-21 19:30:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'244', N'10', N'1005', N'4', N'2025-06-28 13:00', N'2025-06-28 13:26:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'245', N'7', N'1001', N'4', N'2025-06-13 17:30', N'2025-06-13 19:11:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'246', N'7', N'1001', N'2', N'2025-06-19 08:15', N'2025-06-19 10:40:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'247', N'8', N'1006', N'3', N'2025-06-04 16:45', N'2025-06-04 18:45:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'248', N'7', N'1002', N'3', N'2025-06-30 09:30', N'2025-06-30 11:21:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'249', N'7', N'1006', N'2', N'2025-06-16 13:30', N'2025-06-16 15:19:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'250', N'9', N'1005', N'3', N'2025-06-26 10:15', N'2025-06-26 11:35:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'251', N'9', N'1001', N'2', N'2025-06-11 14:30', N'2025-06-11 15:35:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'252', N'10', N'1006', N'3', N'2025-06-25 12:00', N'2025-06-25 13:36:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'253', N'7', N'1006', N'2', N'2025-06-02 08:15', N'2025-06-02 10:50:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'254', N'7', N'1002', N'2', N'2025-06-29 17:00', N'2025-06-29 19:07:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'255', N'11', N'1001', N'2', N'2025-06-28 17:00', N'2025-06-28 19:17:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'256', N'7', N'1001', N'3', N'2025-06-25 12:45', N'2025-06-25 15:17:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'257', N'9', N'1005', N'4', N'2025-06-13 13:15', N'2025-06-13 15:47:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'258', N'9', N'1003', N'5', N'2025-06-08 09:45', N'2025-06-08 11:15:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'259', N'8', N'1002', N'4', N'2025-06-15 12:15', N'2025-06-15 14:47:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'260', N'12', N'1001', N'3', N'2025-06-13 10:15', N'2025-06-13 10:39:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'261', N'7', N'1001', N'1', N'2025-06-24 12:00', N'2025-06-24 14:13:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'262', N'7', N'1006', N'4', N'2025-06-27 12:45', N'2025-06-27 12:54:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'263', N'10', N'1004', N'5', N'2025-06-12 12:15', N'2025-06-12 14:52:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'264', N'10', N'1005', N'2', N'2025-06-20 17:45', N'2025-06-20 19:23:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'265', N'11', N'1001', N'2', N'2025-06-30 08:00', N'2025-06-30 08:53:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'266', N'11', N'1006', N'2', N'2025-06-29 15:30', N'2025-06-29 17:04:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'267', N'11', N'1005', N'5', N'2025-06-04 15:30', N'2025-06-04 16:29:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'268', N'9', N'1002', N'1', N'2025-06-11 10:00', N'2025-06-11 12:27:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'269', N'7', N'1001', N'4', N'2025-06-20 13:00', N'2025-06-20 15:12:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'270', N'11', N'1004', N'3', N'2025-06-22 12:30', N'2025-06-22 14:47:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'271', N'12', N'1006', N'2', N'2025-06-30 08:00', N'2025-06-30 10:19:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'272', N'8', N'1003', N'1', N'2025-06-06 14:30', N'2025-06-06 17:07:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'273', N'10', N'1005', N'4', N'2025-06-08 08:00', N'2025-06-08 08:56:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'274', N'9', N'1005', N'1', N'2025-06-12 14:30', N'2025-06-12 16:09:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'275', N'9', N'1002', N'3', N'2025-06-22 14:30', N'2025-06-22 14:52:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'276', N'9', N'1005', N'5', N'2025-06-26 09:45', N'2025-06-26 10:08:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'277', N'10', N'1001', N'3', N'2025-06-22 10:15', N'2025-06-22 10:23:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'278', N'12', N'1002', N'4', N'2025-06-19 08:00', N'2025-06-19 10:27:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'279', N'8', N'1003', N'1', N'2025-06-28 13:45', N'2025-06-28 16:17:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'280', N'11', N'1001', N'3', N'2025-06-10 09:45', N'2025-06-10 11:30:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'281', N'12', N'1002', N'1', N'2025-06-29 11:15', N'2025-06-29 11:21:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'282', N'7', N'1001', N'5', N'2025-06-06 13:15', N'2025-06-06 14:36:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'283', N'12', N'1003', N'2', N'2025-06-09 13:30', N'2025-06-09 16:01:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'284', N'11', N'1002', N'2', N'2025-06-03 12:30', N'2025-06-03 13:07:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'285', N'8', N'1001', N'3', N'2025-06-21 14:00', N'2025-06-21 16:32:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'286', N'7', N'1004', N'1', N'2025-06-17 12:15', N'2025-06-17 13:30:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'287', N'8', N'1004', N'1', N'2025-06-19 17:45', N'2025-06-19 20:17:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'288', N'9', N'1005', N'1', N'2025-06-22 17:00', N'2025-06-22 18:42:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'289', N'12', N'1005', N'3', N'2025-06-25 12:30', N'2025-06-25 12:48:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'290', N'12', N'1002', N'5', N'2025-06-28 09:15', N'2025-06-28 11:15:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'291', N'9', N'1002', N'2', N'2025-06-18 09:00', N'2025-06-18 11:25:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'292', N'8', N'1006', N'2', N'2025-06-02 15:30', N'2025-06-02 16:36:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'293', N'10', N'1002', N'5', N'2025-06-28 08:00', N'2025-06-28 08:13:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'294', N'8', N'1006', N'4', N'2025-06-23 16:15', N'2025-06-23 18:25:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'295', N'8', N'1003', N'5', N'2025-06-10 12:15', N'2025-06-10 14:47:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'296', N'12', N'1006', N'1', N'2025-06-06 10:45', N'2025-06-06 11:36:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'297', N'9', N'1001', N'3', N'2025-06-01 13:00', N'2025-06-01 15:18:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'298', N'9', N'1005', N'2', N'2025-06-14 10:45', N'2025-06-14 11:09:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'299', N'9', N'1006', N'1', N'2025-06-01 15:00', N'2025-06-01 16:13:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'300', N'7', N'1001', N'5', N'2025-06-25 16:00', N'2025-06-25 18:28:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'301', N'12', N'1001', N'1', N'2025-06-18 08:30', N'2025-06-18 08:37:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'302', N'7', N'1003', N'4', N'2025-06-16 15:15', N'2025-06-16 17:37:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'303', N'9', N'1002', N'3', N'2025-06-17 10:30', N'2025-06-17 12:47:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'304', N'7', N'1004', N'2', N'2025-06-21 09:15', N'2025-06-21 11:49:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'305', N'12', N'1006', N'2', N'2025-06-18 17:30', N'2025-06-18 19:52:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'306', N'8', N'1003', N'1', N'2025-06-07 08:30', N'2025-06-07 10:40:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'307', N'12', N'1002', N'1', N'2025-06-04 13:45', N'2025-06-04 14:14:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'308', N'9', N'1002', N'4', N'2025-06-10 11:30', N'2025-06-10 13:19:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'309', N'8', N'1002', N'1', N'2025-06-25 11:30', N'2025-06-25 13:07:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'310', N'12', N'1003', N'5', N'2025-06-01 08:15', N'2025-06-01 10:37:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'311', N'8', N'1005', N'4', N'2025-06-26 14:00', N'2025-06-26 15:39:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'312', N'8', N'1002', N'2', N'2025-06-15 16:15', N'2025-06-15 16:39:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'313', N'11', N'1001', N'2', N'2025-06-28 13:15', N'2025-06-28 15:10:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'314', N'9', N'1004', N'2', N'2025-06-04 12:30', N'2025-06-04 14:35:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'315', N'10', N'1002', N'3', N'2025-06-19 17:00', N'2025-06-19 17:12:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'316', N'10', N'1003', N'5', N'2025-06-28 11:00', N'2025-06-28 13:18:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'317', N'7', N'1003', N'2', N'2025-06-03 11:45', N'2025-06-03 12:54:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'318', N'12', N'1006', N'2', N'2025-06-09 13:00', N'2025-06-09 15:04:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'319', N'11', N'1006', N'2', N'2025-06-12 08:30', N'2025-06-12 09:05:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'320', N'12', N'1002', N'5', N'2025-06-08 12:30', N'2025-06-08 13:09:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'321', N'11', N'1004', N'2', N'2025-06-26 11:00', N'2025-06-26 13:30:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'322', N'12', N'1006', N'1', N'2025-06-28 09:15', N'2025-06-28 11:51:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'323', N'10', N'1006', N'4', N'2025-06-26 12:45', N'2025-06-26 12:55:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'324', N'10', N'1001', N'1', N'2025-06-30 16:15', N'2025-06-30 16:37:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'325', N'8', N'1001', N'5', N'2025-06-12 17:30', N'2025-06-12 19:35:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'326', N'12', N'1005', N'5', N'2025-06-15 14:45', N'2025-06-15 17:07:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'327', N'12', N'1005', N'1', N'2025-06-28 16:45', N'2025-06-28 18:54:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'328', N'9', N'1005', N'4', N'2025-06-16 15:30', N'2025-06-16 15:36:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'329', N'9', N'1001', N'3', N'2025-06-29 15:30', N'2025-06-29 17:34:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'330', N'8', N'1003', N'2', N'2025-06-12 15:00', N'2025-06-12 16:22:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'331', N'7', N'1005', N'1', N'2025-06-24 15:00', N'2025-06-24 17:18:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'332', N'12', N'1002', N'4', N'2025-06-14 17:00', N'2025-06-14 19:11:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'333', N'10', N'1006', N'3', N'2025-06-14 08:30', N'2025-06-14 10:46:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'334', N'8', N'1006', N'4', N'2025-06-04 13:15', N'2025-06-04 13:27:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'335', N'9', N'1002', N'4', N'2025-06-07 13:15', N'2025-06-07 13:24:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'336', N'10', N'1005', N'1', N'2025-06-19 10:30', N'2025-06-19 11:25:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'337', N'7', N'1005', N'4', N'2025-06-05 08:30', N'2025-06-05 10:36:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'338', N'8', N'1004', N'3', N'2025-06-29 08:30', N'2025-06-29 10:02:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'339', N'9', N'1005', N'4', N'2025-06-23 10:00', N'2025-06-23 11:44:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'340', N'9', N'1002', N'2', N'2025-06-12 12:15', N'2025-06-12 14:12:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'341', N'11', N'1002', N'5', N'2025-06-08 17:15', N'2025-06-08 17:35:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'342', N'7', N'1002', N'1', N'2025-06-24 09:30', N'2025-06-24 11:53:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'343', N'9', N'1001', N'2', N'2025-06-03 14:00', N'2025-06-03 15:18:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'344', N'10', N'1006', N'3', N'2025-06-18 17:45', N'2025-06-18 19:48:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'345', N'7', N'1004', N'5', N'2025-06-19 17:45', N'2025-06-19 18:34:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'346', N'10', N'1004', N'1', N'2025-06-21 11:15', N'2025-06-21 13:53:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'347', N'10', N'1004', N'3', N'2025-06-15 14:15', N'2025-06-15 14:38:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'348', N'8', N'1003', N'2', N'2025-06-08 10:15', N'2025-06-08 11:05:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'349', N'11', N'1004', N'5', N'2025-06-06 15:15', N'2025-06-06 15:24:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'350', N'12', N'1006', N'5', N'2025-06-23 14:30', N'2025-06-23 16:43:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'351', N'7', N'1003', N'3', N'2025-06-13 13:15', N'2025-06-13 15:41:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'352', N'11', N'1004', N'4', N'2025-06-13 09:15', N'2025-06-13 11:19:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'353', N'11', N'1005', N'3', N'2025-06-19 12:15', N'2025-06-19 12:52:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'354', N'10', N'1001', N'1', N'2025-06-21 08:45', N'2025-06-21 09:26:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'355', N'11', N'1004', N'5', N'2025-06-10 16:00', N'2025-06-10 18:14:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'356', N'11', N'1005', N'5', N'2025-06-02 08:15', N'2025-06-02 09:01:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'357', N'7', N'1005', N'5', N'2025-06-30 12:15', N'2025-06-30 13:50:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'358', N'11', N'1003', N'1', N'2025-06-15 08:30', N'2025-06-15 08:50:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'359', N'7', N'1006', N'3', N'2025-06-21 16:00', N'2025-06-21 16:22:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'360', N'11', N'1006', N'3', N'2025-06-07 11:30', N'2025-06-07 13:53:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'361', N'9', N'1001', N'2', N'2025-06-05 13:00', N'2025-06-05 13:53:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'362', N'11', N'1005', N'2', N'2025-06-20 08:15', N'2025-06-20 08:33:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'363', N'9', N'1003', N'4', N'2025-06-07 11:15', N'2025-06-07 12:04:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'364', N'9', N'1003', N'5', N'2025-06-06 16:15', N'2025-06-06 16:30:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'365', N'9', N'1001', N'2', N'2025-06-04 10:30', N'2025-06-04 11:53:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'366', N'12', N'1001', N'3', N'2025-06-19 12:00', N'2025-06-19 14:25:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'367', N'9', N'1001', N'4', N'2025-06-19 12:45', N'2025-06-19 15:11:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'368', N'8', N'1001', N'1', N'2025-06-07 17:15', N'2025-06-07 19:24:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'369', N'9', N'1002', N'3', N'2025-06-26 14:45', N'2025-06-26 15:27:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'370', N'11', N'1004', N'4', N'2025-06-05 09:15', N'2025-06-05 11:01:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'371', N'10', N'1001', N'3', N'2025-06-24 15:45', N'2025-06-24 16:50:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'372', N'7', N'1003', N'2', N'2025-06-20 15:15', N'2025-06-20 17:32:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'373', N'9', N'1001', N'5', N'2025-06-02 10:30', N'2025-06-02 11:46:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'374', N'8', N'1003', N'1', N'2025-06-02 13:30', N'2025-06-02 13:44:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'375', N'9', N'1003', N'5', N'2025-06-01 15:30', N'2025-06-01 16:00:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'376', N'9', N'1002', N'5', N'2025-06-19 12:30', N'2025-06-19 14:48:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'377', N'8', N'1006', N'4', N'2025-06-20 16:15', N'2025-06-20 16:34:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'378', N'12', N'1006', N'1', N'2025-06-14 15:45', N'2025-06-14 15:53:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'379', N'8', N'1003', N'4', N'2025-06-24 17:30', N'2025-06-24 18:24:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'380', N'8', N'1006', N'2', N'2025-06-07 16:00', N'2025-06-07 18:30:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'381', N'11', N'1001', N'4', N'2025-06-03 16:30', N'2025-06-03 18:43:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'382', N'9', N'1003', N'5', N'2025-06-15 17:00', N'2025-06-15 19:01:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'383', N'10', N'1003', N'3', N'2025-06-09 15:45', N'2025-06-09 18:24:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'384', N'10', N'1001', N'1', N'2025-06-22 13:00', N'2025-06-22 14:20:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'385', N'12', N'1003', N'2', N'2025-06-22 16:45', N'2025-06-22 17:18:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'386', N'7', N'1004', N'3', N'2025-06-24 14:45', N'2025-06-24 15:42:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'387', N'11', N'1001', N'4', N'2025-06-04 08:30', N'2025-06-04 08:59:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'388', N'7', N'1002', N'4', N'2025-06-06 10:00', N'2025-06-06 11:02:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'389', N'8', N'1003', N'1', N'2025-06-29 10:45', N'2025-06-29 11:12:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'390', N'10', N'1004', N'4', N'2025-06-11 09:00', N'2025-06-11 09:42:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'391', N'9', N'1005', N'2', N'2025-06-18 11:30', N'2025-06-18 13:22:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'392', N'7', N'1006', N'4', N'2025-06-28 16:30', N'2025-06-28 17:43:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'393', N'8', N'1006', N'4', N'2025-06-30 11:15', N'2025-06-30 12:04:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'394', N'7', N'1002', N'5', N'2025-06-12 12:30', N'2025-06-12 13:08:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'395', N'8', N'1001', N'2', N'2025-06-01 14:30', N'2025-06-01 14:46:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'396', N'12', N'1004', N'2', N'2025-06-06 16:00', N'2025-06-06 16:54:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'397', N'7', N'1001', N'4', N'2025-06-02 17:15', N'2025-06-02 17:56:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'398', N'10', N'1001', N'2', N'2025-06-17 11:45', N'2025-06-17 12:40:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'399', N'11', N'1003', N'4', N'2025-06-30 09:45', N'2025-06-30 10:52:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'400', N'12', N'1005', N'3', N'2025-06-18 14:30', N'2025-06-18 16:06:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'401', N'9', N'1006', N'1', N'2025-06-24 16:15', N'2025-06-24 16:56:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'402', N'11', N'1005', N'1', N'2025-06-08 10:30', N'2025-06-08 11:35:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'403', N'7', N'1004', N'4', N'2025-06-08 09:45', N'2025-06-08 10:02:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'404', N'12', N'1004', N'5', N'2025-06-18 10:45', N'2025-06-18 13:18:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'405', N'7', N'1004', N'5', N'2025-06-03 10:45', N'2025-06-03 12:41:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'406', N'10', N'1002', N'1', N'2025-06-08 15:45', N'2025-06-08 18:09:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'407', N'11', N'1002', N'1', N'2025-06-07 13:30', N'2025-06-07 13:39:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'408', N'10', N'1001', N'5', N'2025-06-02 17:00', N'2025-06-02 17:26:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'409', N'10', N'1002', N'5', N'2025-06-02 14:00', N'2025-06-02 16:00:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'410', N'7', N'1004', N'4', N'2025-06-29 09:45', N'2025-06-29 10:26:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'411', N'9', N'1002', N'4', N'2025-06-10 17:45', N'2025-06-10 20:08:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'412', N'12', N'1003', N'1', N'2025-06-22 17:15', N'2025-06-22 19:31:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'413', N'7', N'1003', N'2', N'2025-06-09 09:00', N'2025-06-09 09:38:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'414', N'9', N'1006', N'4', N'2025-06-30 12:15', N'2025-06-30 14:29:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'415', N'8', N'1006', N'2', N'2025-06-17 12:00', N'2025-06-17 14:30:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'416', N'7', N'1001', N'5', N'2025-06-16 14:00', N'2025-06-16 15:38:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'417', N'12', N'1001', N'5', N'2025-06-22 15:45', N'2025-06-22 16:37:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'418', N'8', N'1001', N'5', N'2025-06-22 13:30', N'2025-06-22 15:27:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'419', N'9', N'1006', N'3', N'2025-06-08 17:45', N'2025-06-08 18:55:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'420', N'7', N'1005', N'5', N'2025-06-08 14:30', N'2025-06-08 15:21:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'421', N'11', N'1005', N'2', N'2025-06-12 16:00', N'2025-06-12 16:58:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'422', N'10', N'1001', N'2', N'2025-06-03 13:00', N'2025-06-03 13:11:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'423', N'9', N'1001', N'3', N'2025-06-08 12:45', N'2025-06-08 14:21:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'424', N'10', N'1002', N'5', N'2025-06-14 17:00', N'2025-06-14 19:13:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'425', N'7', N'1006', N'1', N'2025-06-26 13:00', N'2025-06-26 13:58:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'426', N'7', N'1002', N'2', N'2025-06-07 10:15', N'2025-06-07 12:14:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'427', N'8', N'1001', N'5', N'2025-06-07 08:30', N'2025-06-07 08:51:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'428', N'7', N'1002', N'2', N'2025-06-04 17:15', N'2025-06-04 17:45:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'429', N'10', N'1006', N'4', N'2025-06-04 14:00', N'2025-06-04 16:20:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'430', N'9', N'1005', N'4', N'2025-06-26 08:15', N'2025-06-26 10:33:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'431', N'11', N'1006', N'4', N'2025-06-06 15:00', N'2025-06-06 17:07:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'432', N'9', N'1001', N'4', N'2025-06-27 15:00', N'2025-06-27 15:23:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'433', N'10', N'1005', N'1', N'2025-06-07 16:45', N'2025-06-07 18:07:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'434', N'8', N'1003', N'5', N'2025-06-21 08:15', N'2025-06-21 10:16:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'435', N'10', N'1006', N'4', N'2025-06-17 08:00', N'2025-06-17 10:23:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'436', N'12', N'1003', N'1', N'2025-06-08 08:00', N'2025-06-08 09:47:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'437', N'10', N'1001', N'5', N'2025-06-08 12:15', N'2025-06-08 13:54:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'438', N'11', N'1003', N'2', N'2025-06-13 14:30', N'2025-06-13 14:51:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'439', N'11', N'1002', N'1', N'2025-06-18 11:00', N'2025-06-18 11:35:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'440', N'10', N'1004', N'3', N'2025-06-29 08:45', N'2025-06-29 10:45:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'441', N'11', N'1004', N'3', N'2025-06-10 11:15', N'2025-06-10 11:23:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'442', N'11', N'1004', N'5', N'2025-06-27 14:15', N'2025-06-27 15:32:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'443', N'9', N'1005', N'1', N'2025-06-18 08:30', N'2025-06-18 09:58:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'444', N'11', N'1003', N'2', N'2025-06-09 16:00', N'2025-06-09 16:32:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'445', N'11', N'1001', N'5', N'2025-06-21 10:00', N'2025-06-21 12:36:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'446', N'12', N'1002', N'4', N'2025-06-01 12:45', N'2025-06-01 14:53:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'447', N'12', N'1004', N'2', N'2025-06-15 15:45', N'2025-06-15 17:49:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'448', N'11', N'1005', N'2', N'2025-06-20 17:15', N'2025-06-20 18:26:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'449', N'10', N'1003', N'2', N'2025-06-07 08:15', N'2025-06-07 09:02:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'450', N'10', N'1005', N'4', N'2025-06-29 17:30', N'2025-06-29 19:29:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'451', N'8', N'1001', N'1', N'2025-06-15 08:00', N'2025-06-15 09:37:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'452', N'9', N'1001', N'3', N'2025-06-21 08:45', N'2025-06-21 10:43:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'453', N'9', N'1005', N'2', N'2025-06-05 08:00', N'2025-06-05 08:09:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'454', N'9', N'1006', N'3', N'2025-06-17 17:45', N'2025-06-17 19:12:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'455', N'12', N'1004', N'5', N'2025-06-06 17:15', N'2025-06-06 18:03:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'456', N'10', N'1005', N'1', N'2025-06-24 12:15', N'2025-06-24 14:20:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'457', N'9', N'1006', N'5', N'2025-06-17 08:00', N'2025-06-17 10:20:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'458', N'11', N'1002', N'1', N'2025-06-03 11:30', N'2025-06-03 12:49:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'459', N'9', N'1004', N'3', N'2025-06-08 08:15', N'2025-06-08 10:06:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'460', N'12', N'1005', N'2', N'2025-06-24 10:00', N'2025-06-24 12:30:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'461', N'7', N'1005', N'1', N'2025-06-13 15:45', N'2025-06-13 17:10:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'462', N'7', N'1001', N'4', N'2025-06-28 15:15', N'2025-06-28 15:33:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'463', N'8', N'1006', N'5', N'2025-06-24 08:00', N'2025-06-24 08:05:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'464', N'9', N'1005', N'3', N'2025-06-19 12:45', N'2025-06-19 13:52:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'465', N'11', N'1003', N'5', N'2025-06-22 12:15', N'2025-06-22 13:47:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'466', N'10', N'1004', N'4', N'2025-06-08 13:15', N'2025-06-08 15:16:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'467', N'9', N'1004', N'3', N'2025-06-18 14:30', N'2025-06-18 15:32:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'468', N'9', N'1006', N'4', N'2025-06-07 10:30', N'2025-06-07 11:25:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'469', N'7', N'1001', N'2', N'2025-06-13 10:00', N'2025-06-13 11:04:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'470', N'9', N'1005', N'3', N'2025-06-04 09:00', N'2025-06-04 09:27:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'471', N'12', N'1001', N'4', N'2025-06-05 17:30', N'2025-06-05 18:24:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'472', N'8', N'1001', N'1', N'2025-06-19 11:45', N'2025-06-19 13:31:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'473', N'8', N'1005', N'4', N'2025-06-12 13:15', N'2025-06-12 14:31:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'474', N'10', N'1003', N'5', N'2025-06-16 10:30', N'2025-06-16 11:49:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'475', N'12', N'1001', N'4', N'2025-06-18 15:00', N'2025-06-18 16:56:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'476', N'10', N'1005', N'4', N'2025-06-24 14:30', N'2025-06-24 15:53:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'477', N'12', N'1003', N'5', N'2025-06-13 17:00', N'2025-06-13 18:54:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'478', N'7', N'1006', N'1', N'2025-06-12 13:00', N'2025-06-12 13:55:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'479', N'9', N'1006', N'1', N'2025-06-07 17:45', N'2025-06-07 19:05:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'480', N'12', N'1002', N'3', N'2025-06-05 09:00', N'2025-06-05 11:18:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'481', N'11', N'1004', N'4', N'2025-06-25 10:30', N'2025-06-25 11:31:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'482', N'9', N'1003', N'5', N'2025-06-22 15:15', N'2025-06-22 15:44:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'483', N'11', N'1002', N'4', N'2025-06-21 10:15', N'2025-06-21 10:40:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'484', N'10', N'1004', N'1', N'2025-06-18 09:15', N'2025-06-18 09:48:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'485', N'7', N'1002', N'3', N'2025-06-06 10:30', N'2025-06-06 12:04:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'486', N'12', N'1005', N'3', N'2025-06-13 13:30', N'2025-06-13 14:45:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'487', N'10', N'1004', N'2', N'2025-06-09 12:15', N'2025-06-09 12:36:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'488', N'12', N'1003', N'4', N'2025-06-18 15:00', N'2025-06-18 17:14:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'489', N'10', N'1005', N'4', N'2025-06-08 14:45', N'2025-06-08 16:20:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'490', N'12', N'1003', N'2', N'2025-06-06 08:30', N'2025-06-06 09:51:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'491', N'7', N'1003', N'3', N'2025-06-21 13:15', N'2025-06-21 15:12:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'492', N'8', N'1001', N'2', N'2025-06-06 11:45', N'2025-06-06 11:51:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'493', N'7', N'1001', N'3', N'2025-06-12 16:15', N'2025-06-12 16:31:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'494', N'9', N'1001', N'4', N'2025-06-26 09:15', N'2025-06-26 10:54:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'495', N'11', N'1003', N'3', N'2025-06-08 13:45', N'2025-06-08 15:04:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'496', N'11', N'1003', N'2', N'2025-06-07 11:45', N'2025-06-07 12:38:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'497', N'9', N'1005', N'5', N'2025-06-07 09:15', N'2025-06-07 10:05:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'498', N'10', N'1005', N'5', N'2025-06-14 13:45', N'2025-06-14 14:27:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'499', N'10', N'1005', N'1', N'2025-06-11 14:00', N'2025-06-11 15:18:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'500', N'10', N'1002', N'5', N'2025-06-05 12:45', N'2025-06-05 13:41:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'100001', N'1', N'1001', N'1', N'2025-06-01 08:30', N'2025-06-01 08:40:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'100002', N'3', N'1001', N'1', N'2025-06-01 09:15', N'2025-06-01 09:20:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'100003', N'2', N'1002', N'2', N'2025-06-01 09:15', N'2025-06-01 09:25:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'100004', N'4', N'1002', N'2', N'2025-06-01 10:00', N'2025-06-01 10:10:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'100005', N'4', N'1003', N'2', N'2025-06-01 14:30', N'2025-06-01 14:40:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'100006', N'5', N'1003', N'1', N'2025-06-01 15:00', N'2025-06-01 15:10:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'100007', N'5', N'1004', N'1', N'2025-06-01 09:00', N'2025-06-01 09:10:00.000', N'1')
GO

INSERT INTO [dbo].[oldAppointment] ([orderID], [patientID], [doctorID], [priority], [scheduledTime], [firstTimeCalled],
                                    [isComein])
VALUES (N'100008', N'6', N'1006', N'3', N'2025-06-01 20:00', N'2025-06-01 20:05:00.000', N'1')
GO


-- ----------------------------
-- Table structure for patient
-- ----------------------------
IF EXISTS (SELECT *
           FROM sys.all_objects
           WHERE object_id = OBJECT_ID(N'[dbo].[patient]')
             AND type IN ('U'))
    DROP TABLE [dbo].[patient]
GO

CREATE TABLE [dbo].[patient]
(
    [patientID]                  int IDENTITY (1,1)                     NOT NULL,
    [name]                       varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
    [birthday]                   date                                   NULL,
    [phoneNumber]                varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
    [medicalInsuranceCardNumber] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
    [address]                    varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
    [allergyMedication]          varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
    [isLogoff]                   bit                                    NOT NULL,
    [userID]                     int                                    NOT NULL
)
GO

ALTER TABLE [dbo].[patient]
    SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of patient
-- ----------------------------
SET IDENTITY_INSERT [dbo].[patient] ON
GO

INSERT INTO [dbo].[patient] ([patientID], [name], [birthday], [phoneNumber], [medicalInsuranceCardNumber], [address],
                             [allergyMedication], [isLogoff], [userID])
VALUES (N'7', N'周小明', N'2000-01-01', N'13500000001', N'医保001', N'北京市朝阳区', N'青霉素', N'0', N'5')
GO

INSERT INTO [dbo].[patient] ([patientID], [name], [birthday], [phoneNumber], [medicalInsuranceCardNumber], [address],
                             [allergyMedication], [isLogoff], [userID])
VALUES (N'8', N'王芳', N'1985-05-10', N'13600000002', N'医保002', N'上海市黄浦区', N'无', N'0', N'6')
GO

INSERT INTO [dbo].[patient] ([patientID], [name], [birthday], [phoneNumber], [medicalInsuranceCardNumber], [address],
                             [allergyMedication], [isLogoff], [userID])
VALUES (N'9', N'李磊', N'1990-12-20', N'13700000003', N'医保003', N'广州市天河区', N'磺胺类', N'0', N'11')
GO

INSERT INTO [dbo].[patient] ([patientID], [name], [birthday], [phoneNumber], [medicalInsuranceCardNumber], [address],
                             [allergyMedication], [isLogoff], [userID])
VALUES (N'10', N'赵敏', N'2015-03-05', N'13800000004', N'医保004', N'深圳市南山区', N'无', N'0', N'12')
GO

INSERT INTO [dbo].[patient] ([patientID], [name], [birthday], [phoneNumber], [medicalInsuranceCardNumber], [address],
                             [allergyMedication], [isLogoff], [userID])
VALUES (N'11', N'陈红', N'1978-08-15', N'13900000005', N'医保005', N'杭州市西湖区', N'阿司匹林', N'0', N'13')
GO

INSERT INTO [dbo].[patient] ([patientID], [name], [birthday], [phoneNumber], [medicalInsuranceCardNumber], [address],
                             [allergyMedication], [isLogoff], [userID])
VALUES (N'12', N'刘伟', N'1965-04-28', N'14000000006', N'医保006', N'成都市武侯区', N'无', N'0', N'14')
GO

SET IDENTITY_INSERT [dbo].[patient] OFF
GO


-- ----------------------------
-- Table structure for patientType-priority
-- ----------------------------
IF EXISTS (SELECT *
           FROM sys.all_objects
           WHERE object_id = OBJECT_ID(N'[dbo].[patientType-priority]')
             AND type IN ('U'))
    DROP TABLE [dbo].[patientType-priority]
GO

CREATE TABLE [dbo].[patientType-priority]
(
    [patientType] varchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
    [priority]    int                                   NOT NULL
)
GO

ALTER TABLE [dbo].[patientType-priority]
    SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of patientType-priority
-- ----------------------------
INSERT INTO [dbo].[patientType-priority] ([patientType], [priority])
VALUES (N'VIP患者', N'1')
GO

INSERT INTO [dbo].[patientType-priority] ([patientType], [priority])
VALUES (N'儿童患者', N'2')
GO

INSERT INTO [dbo].[patientType-priority] ([patientType], [priority])
VALUES (N'急诊患者', N'3')
GO

INSERT INTO [dbo].[patientType-priority] ([patientType], [priority])
VALUES (N'加急患者', N'2')
GO

INSERT INTO [dbo].[patientType-priority] ([patientType], [priority])
VALUES (N'老年患者', N'2')
GO

INSERT INTO [dbo].[patientType-priority] ([patientType], [priority])
VALUES (N'普通患者', N'1')
GO


-- ----------------------------
-- Table structure for recentAppointment
-- ----------------------------
IF EXISTS (SELECT *
           FROM sys.all_objects
           WHERE object_id = OBJECT_ID(N'[dbo].[recentAppointment]')
             AND type IN ('U'))
    DROP TABLE [dbo].[recentAppointment]
GO

CREATE TABLE [dbo].[recentAppointment]
(
    [orderID]         bigint IDENTITY (1,1)                  NOT NULL,
    [userName]        varchar(255) COLLATE Chinese_PRC_CI_AS NOT NULL,
    [doctorID]        int                                    NOT NULL,
    [priority]        int                                    NOT NULL,
    [scheduledTime]   varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
    [firstTimeCalled] datetime                               NULL,
    [isComein]        bit DEFAULT 0                          NULL
)
GO

ALTER TABLE [dbo].[recentAppointment]
    SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of recentAppointment
-- ----------------------------
SET IDENTITY_INSERT [dbo].[recentAppointment] ON
GO

INSERT INTO [dbo].[recentAppointment] ([orderID], [userName], [doctorID], [priority], [scheduledTime],
                                       [firstTimeCalled], [isComein])
VALUES (N'1', N'admin', N'7', N'5', N'05 26 2025 10:34AM', NULL, N'0')
GO

INSERT INTO [dbo].[recentAppointment] ([orderID], [userName], [doctorID], [priority], [scheduledTime],
                                       [firstTimeCalled], [isComein])
VALUES (N'2', N'admin', N'27', N'5', N'05 26 2025 10:36AM', NULL, N'0')
GO

INSERT INTO [dbo].[recentAppointment] ([orderID], [userName], [doctorID], [priority], [scheduledTime],
                                       [firstTimeCalled], [isComein])
VALUES (N'3', N'admin', N'16', N'5', N'05 26 2025 11:02AM', NULL, N'0')
GO

SET IDENTITY_INSERT [dbo].[recentAppointment] OFF
GO


-- ----------------------------
-- Table structure for schedule
-- ----------------------------
IF EXISTS (SELECT *
           FROM sys.all_objects
           WHERE object_id = OBJECT_ID(N'[dbo].[schedule]')
             AND type IN ('U'))
    DROP TABLE [dbo].[schedule]
GO

CREATE TABLE [dbo].[schedule]
(
    [scheduleID]   bigint                                NOT NULL,
    [doctorID]     int                                   NOT NULL,
    [date]         date                                  NOT NULL,
    [startTime]    varchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
    [endTime]      varchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
    [maxSize]      int                                   NOT NULL,
    [leftSchedule] int                                   NOT NULL,
    [scheduleType] varchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL
)
GO

ALTER TABLE [dbo].[schedule]
    SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO [dbo].[schedule] ([scheduleID], [doctorID], [date], [startTime], [endTime], [maxSize], [leftSchedule],
                              [scheduleType])
VALUES (N'20250601001', N'1001', N'2025-06-01', N'08:00', N'12:00', N'20', N'20', N'普通门诊')
GO

INSERT INTO [dbo].[schedule] ([scheduleID], [doctorID], [date], [startTime], [endTime], [maxSize], [leftSchedule],
                              [scheduleType])
VALUES (N'20250601002', N'1002', N'2025-06-01', N'09:00', N'11:00', N'15', N'15', N'专家门诊')
GO

INSERT INTO [dbo].[schedule] ([scheduleID], [doctorID], [date], [startTime], [endTime], [maxSize], [leftSchedule],
                              [scheduleType])
VALUES (N'20250601003', N'1003', N'2025-06-01', N'14:00', N'17:00', N'10', N'10', N'普通门诊')
GO

INSERT INTO [dbo].[schedule] ([scheduleID], [doctorID], [date], [startTime], [endTime], [maxSize], [leftSchedule],
                              [scheduleType])
VALUES (N'20250601004', N'1004', N'2025-06-01', N'08:30', N'11:30', N'12', N'12', N'普通门诊')
GO

INSERT INTO [dbo].[schedule] ([scheduleID], [doctorID], [date], [startTime], [endTime], [maxSize], [leftSchedule],
                              [scheduleType])
VALUES (N'20250601005', N'1005', N'2025-06-01', N'13:00', N'16:00', N'8', N'8', N'专科门诊')
GO

INSERT INTO [dbo].[schedule] ([scheduleID], [doctorID], [date], [startTime], [endTime], [maxSize], [leftSchedule],
                              [scheduleType])
VALUES (N'20250601006', N'1006', N'2025-06-01', N'00:00', N'23:59', N'50', N'50', N'急诊')
GO


-- ----------------------------
-- Table structure for userTable
-- ----------------------------
IF EXISTS (SELECT *
           FROM sys.all_objects
           WHERE object_id = OBJECT_ID(N'[dbo].[userTable]')
             AND type IN ('U'))
    DROP TABLE [dbo].[userTable]
GO

CREATE TABLE [dbo].[userTable]
(
    [userID]       int IDENTITY (1,1)                     NOT NULL,
    [userName]     varchar(255) COLLATE Chinese_PRC_CI_AS NOT NULL,
    [userType]     varchar(255) COLLATE Chinese_PRC_CI_AS NOT NULL,
    [userPassword] varchar(255) COLLATE Chinese_PRC_CI_AS NOT NULL
)
GO

ALTER TABLE [dbo].[userTable]
    SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of userTable
-- ----------------------------
SET IDENTITY_INSERT [dbo].[userTable] ON
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'47', N'patient_liu', N'患者', N'pat012')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'46', N'patient_chen', N'患者', N'pat901')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'45', N'patient_zhao', N'患者', N'pat890')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'44', N'patient_li', N'患者', N'pat789')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'43', N'doc_zhao', N'医生', N'doc012')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'42', N'doc_liu', N'医生', N'doc901')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'41', N'doc_chen', N'医生', N'doc890')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'40', N'doc_wang', N'医生', N'doc789')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'39', N'patient_wang', N'患者', N'pat456')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'38', N'patient_zhou', N'患者', N'pat123')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'37', N'doc_li', N'医生', N'doc456')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'36', N'doc_zhang', N'医生', N'doc123')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'35', N'dept_manager', N'科室管理员', N'dept123')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'34', N'admin', N'系统管理员', N'admin123')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'33', N'patient_liu', N'患者', N'pat012')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'32', N'patient_chen', N'患者', N'pat901')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'31', N'patient_zhao', N'患者', N'pat890')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'30', N'patient_li', N'患者', N'pat789')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'29', N'doc_zhao', N'医生', N'doc012')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'28', N'doc_liu', N'医生', N'doc901')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'27', N'doc_chen', N'医生', N'doc890')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'26', N'doc_wang', N'医生', N'doc789')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'25', N'patient_wang', N'患者', N'pat456')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'24', N'patient_zhou', N'患者', N'pat123')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'23', N'doc_li', N'医生', N'doc456')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'22', N'doc_zhang', N'医生', N'doc123')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'21', N'dept_manager', N'科室管理员', N'dept123')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'20', N'admin', N'系统管理员', N'admin123')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'17', N'admin1231', N'patient', N'这是新密码')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'9', N'Rebecca Mcdonald', N'patient', N'JGw')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'8', N'Elaine Robertson', N'patient', N'y72')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'7', N'Susan Rogers', N'patient', N'ZSK')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'6', N'Jean Black', N'patient', N'w88')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'5', N'Billy Wagner', N'patient', N'4o7')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'4', N'Laura Coleman', N'patient', N'C1B')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'3', N'Arthur Stone', N'patient', N'd2f')
GO

INSERT INTO [dbo].[userTable] ([userID], [userName], [userType], [userPassword])
VALUES (N'2', N'admin', N'patient', N'admin')
GO

SET IDENTITY_INSERT [dbo].[userTable] OFF
GO


-- ----------------------------
-- procedure structure for sp_DepartmentDailyStatistics
-- ----------------------------
IF EXISTS (SELECT *
           FROM sys.all_objects
           WHERE object_id = OBJECT_ID(N'[dbo].[sp_DepartmentDailyStatistics]')
             AND type IN ('P', 'PC', 'RF', 'X'))
    DROP PROCEDURE [dbo].[sp_DepartmentDailyStatistics]
GO

CREATE PROCEDURE [dbo].[sp_DepartmentDailyStatistics] @StartDate DATE,
                                                      @EndDate DATE,
                                                      @DeptId INT = 0
AS
BEGIN
    SET NOCOUNT ON;

    WITH DateRange AS (SELECT DATEADD(DAY, n, @StartDate) AS StatDate
                       FROM (SELECT TOP (DATEDIFF(DAY, @StartDate, @EndDate) + 1) ROW_NUMBER() OVER (ORDER BY [object_id]) - 1 AS n
                             FROM sys.all_objects) AS nums)

    SELECT ISNULL(d.name, '所有科室')                                                                              AS deptName,
           CONVERT(VARCHAR(10), dr.StatDate, 120)                                                                  AS timeUnit, -- 改为 timeUnit
           COUNT(oa.orderID)                                                                                       AS patientCount,
           ISNULL(CONVERT(VARCHAR(10), AVG(DATEDIFF(MINUTE, oa.scheduledTime, oa.firstTimeCalled))), '0') +
           '分钟'                                                                                                  AS avgWaitTime,
           CONCAT(ROUND(COUNT(oa.orderID) * 100.0 / NULLIF(SUM(s.maxSize), 1), 2),
                  '%')                                                                                             AS resourceUtilization
    FROM DateRange dr
             LEFT JOIN oldAppointment oa
                       ON CONVERT(DATE, oa.firstTimeCalled) = dr.StatDate
                           AND oa.isComein = 1
                           AND (@DeptId = 0 OR EXISTS (SELECT 1
                                                       FROM doctor doc
                                                       WHERE doc.doctorID = oa.doctorID
                                                         AND doc.departmentID = @DeptId))
             LEFT JOIN doctor doc ON oa.doctorID = doc.doctorID
             LEFT JOIN department d ON doc.departmentID = d.departmentID
             LEFT JOIN schedule s
                       ON doc.doctorID = s.doctorID
                           AND s.date = dr.StatDate
    GROUP BY d.name, dr.StatDate
    ORDER BY dr.StatDate, d.name;
END;
GO


-- ----------------------------
-- procedure structure for sp_DepartmentHourlyStatistics
-- ----------------------------
IF EXISTS (SELECT *
           FROM sys.all_objects
           WHERE object_id = OBJECT_ID(N'[dbo].[sp_DepartmentHourlyStatistics]')
             AND type IN ('P', 'PC', 'RF', 'X'))
    DROP PROCEDURE [dbo].[sp_DepartmentHourlyStatistics]
GO

CREATE PROCEDURE [dbo].[sp_DepartmentHourlyStatistics] @StartDate DATETIME,
                                                       @EndDate DATETIME,
                                                       @DeptId INT = 0
AS
BEGIN
    SELECT d.name                                                                                                  AS deptName,
           FORMAT(oa.firstTimeCalled, 'yyyy-MM-dd HH')                                                             AS timeUnit, -- 改为 timeUnit
           COUNT(oa.orderID)                                                                                       AS patientCount,
           ISNULL(CONVERT(VARCHAR(10), AVG(DATEDIFF(MINUTE, oa.scheduledTime, oa.firstTimeCalled))), '0') +
           '分钟'                                                                                                  AS avgWaitTime,
           CONCAT(ROUND(COUNT(oa.orderID) * 100.0 / NULLIF(SUM(s.maxSize) * 1.0, 1), 2),
                  '%')                                                                                             AS resourceUtilization
    FROM oldAppointment oa
             JOIN doctor doc ON oa.doctorID = doc.doctorID
             JOIN department d ON doc.departmentID = d.departmentID
             LEFT JOIN schedule s
                       ON oa.doctorID = s.doctorID
                           AND CONVERT(DATE, oa.firstTimeCalled) = s.date
    WHERE oa.isComein = 1
      AND oa.firstTimeCalled BETWEEN @StartDate AND @EndDate
      AND (@DeptId = 0 OR d.departmentID = @DeptId)
    GROUP BY d.name, FORMAT(oa.firstTimeCalled, 'yyyy-MM-dd HH')
    ORDER BY timeUnit, d.name;
END;
GO


-- ----------------------------
-- procedure structure for sp_DepartmentWeeklyStatistics
-- ----------------------------
IF EXISTS (SELECT *
           FROM sys.all_objects
           WHERE object_id = OBJECT_ID(N'[dbo].[sp_DepartmentWeeklyStatistics]')
             AND type IN ('P', 'PC', 'RF', 'X'))
    DROP PROCEDURE [dbo].[sp_DepartmentWeeklyStatistics]
GO

CREATE PROCEDURE [dbo].[sp_DepartmentWeeklyStatistics] @StartDate DATE,
                                                       @EndDate DATE,
                                                       @DeptId INT = 0
AS
BEGIN
    SELECT d.name                                                                                                  AS deptName,
           '第 ' + CAST(DATEPART(WEEK, oa.firstTimeCalled) AS VARCHAR) + ' 周'                                     AS timeUnit, -- 改为 timeUnit
           COUNT(oa.orderID)                                                                                       AS patientCount,
           ISNULL(CONVERT(VARCHAR(10), AVG(DATEDIFF(MINUTE, oa.scheduledTime, oa.firstTimeCalled))), '0') +
           '分钟'                                                                                                  AS avgWaitTime,
           CONCAT(ROUND(COUNT(oa.orderID) * 100.0 / NULLIF(SUM(s.maxSize), 1), 2),
                  '%')                                                                                             AS resourceUtilization
    FROM oldAppointment oa
             JOIN doctor doc ON oa.doctorID = doc.doctorID
             JOIN department d ON doc.departmentID = d.departmentID
             LEFT JOIN schedule s
                       ON oa.doctorID = s.doctorID
                           AND DATEADD(WEEK, DATEDIFF(WEEK, 0, oa.firstTimeCalled), 0) = s.date
    WHERE oa.isComein = 1
      AND oa.firstTimeCalled BETWEEN @StartDate AND @EndDate
      AND (@DeptId = 0 OR d.departmentID = @DeptId)
    GROUP BY d.name, DATEPART(WEEK, oa.firstTimeCalled)
    ORDER BY DATEPART(WEEK, oa.firstTimeCalled), d.name;
END;
GO


-- ----------------------------
-- procedure structure for sp_CalculateDoctorEfficiency
-- ----------------------------
IF EXISTS (SELECT *
           FROM sys.all_objects
           WHERE object_id = OBJECT_ID(N'[dbo].[sp_CalculateDoctorEfficiency]')
             AND type IN ('P', 'PC', 'RF', 'X'))
    DROP PROCEDURE [dbo].[sp_CalculateDoctorEfficiency]
GO

CREATE PROCEDURE [dbo].[sp_CalculateDoctorEfficiency] @StartDate DATE,
                                                      @EndDate DATE
AS
BEGIN
    SELECT doc.name                                                                         AS doctorName,
           d.name                                                                           AS deptName,
           COUNT(oa.orderID)                                                                AS actualCount,
           SUM(s.maxSize)                                                                   AS scheduleMax,
           CONCAT(ROUND(COUNT(oa.orderID) * 1.0 / NULLIF(SUM(s.maxSize), 1) * 100, 2), '%') AS efficiencyRate,
           CASE
               WHEN COUNT(oa.orderID) * 1.0 / NULLIF(SUM(s.maxSize), 1) >= 0.8 THEN '高效'
               WHEN COUNT(oa.orderID) * 1.0 / NULLIF(SUM(s.maxSize), 1) >= 0.5 THEN '正常'
               ELSE '需调整'
               END                                                                          AS efficiencyLevel
    FROM schedule s
             JOIN doctor doc ON s.doctorID = doc.doctorID
             JOIN department d ON doc.departmentID = d.departmentID
             LEFT JOIN oldAppointment oa
                       ON s.doctorID = oa.doctorID
                           AND CONVERT(DATE, oa.firstTimeCalled) = s.date
                           AND oa.isComein = 1
    WHERE s.date BETWEEN @StartDate AND @EndDate
    GROUP BY doc.name, d.name
    ORDER BY efficiencyRate DESC;
END;
GO


-- ----------------------------
-- procedure structure for sp_PatientWaitTimeAnalysis
-- ----------------------------
IF EXISTS (SELECT *
           FROM sys.all_objects
           WHERE object_id = OBJECT_ID(N'[dbo].[sp_PatientWaitTimeAnalysis]')
             AND type IN ('P', 'PC', 'RF', 'X'))
    DROP PROCEDURE [dbo].[sp_PatientWaitTimeAnalysis]
GO

CREATE PROCEDURE [dbo].[sp_PatientWaitTimeAnalysis] @StartDate DATE,
                                                    @EndDate DATE,
                                                    @DeptId INT = 0,
                                                    @TimeUnit VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    -- 修正：结束日期+1天以包含全天数据
    DECLARE @RealEndDate DATE = DATEADD(DAY, 1, @EndDate)

    IF @StartDate > @RealEndDate OR @TimeUnit NOT IN ('day', 'hour', 'week')
        BEGIN
            RAISERROR ('参数错误', 16, 1);
            RETURN;
        END;

    WITH GroupedData AS (SELECT DeptName      = ISNULL(d.name, '所有科室'),
                                TimeKey       = CASE @TimeUnit
                                                    WHEN 'day' THEN CONVERT(DATE, oa.firstTimeCalled)
                                                    WHEN 'hour'
                                                        THEN DATEADD(HOUR, DATEDIFF(HOUR, 0, oa.firstTimeCalled), 0)
                                                    WHEN 'week'
                                                        THEN DATEADD(WEEK, DATEDIFF(WEEK, 0, oa.firstTimeCalled), 0)
                                    END,
                                WeekNumber    = DATEPART(ISO_WEEK, oa.firstTimeCalled),
                                TotalPatients = COUNT(oa.orderID),
                                AvgWait       = AVG(DATEDIFF(MINUTE, oa.scheduledTime, oa.firstTimeCalled)),
                                MaxWait       = MAX(DATEDIFF(MINUTE, oa.scheduledTime, oa.firstTimeCalled)),
                                MinWait       = MIN(DATEDIFF(MINUTE, oa.scheduledTime, oa.firstTimeCalled))
                         FROM oldAppointment oa
                                  LEFT JOIN doctor doc ON oa.doctorID = doc.doctorID
                                  LEFT JOIN department d ON doc.departmentID = d.departmentID
                         WHERE oa.firstTimeCalled >= @StartDate
                           AND oa.firstTimeCalled < @RealEndDate -- 修正：使用<而不是BETWEEN
                           AND oa.isComein = 1
                           AND (@DeptId = 0 OR doc.departmentID = @DeptId)
                         GROUP BY d.name,
                                  CASE @TimeUnit
                                      WHEN 'day' THEN CONVERT(DATE, oa.firstTimeCalled)
                                      WHEN 'hour' THEN DATEADD(HOUR, DATEDIFF(HOUR, 0, oa.firstTimeCalled), 0)
                                      WHEN 'week' THEN DATEADD(WEEK, DATEDIFF(WEEK, 0, oa.firstTimeCalled), 0)
                                      END,
                                  DATEPART(ISO_WEEK, oa.firstTimeCalled))

    SELECT DeptName,
           TimePeriod      = CASE @TimeUnit
                                 WHEN 'day' THEN CONVERT(VARCHAR, TimeKey, 23)
                                 WHEN 'hour' THEN FORMAT(TimeKey, 'yyyy-MM-dd HH') + ':00 - ' +
                                                  FORMAT(TimeKey, 'yyyy-MM-dd HH') + ':59'
                                 WHEN 'week' THEN '第 ' + CAST(WeekNumber AS VARCHAR) + ' 周（' +
                                                  CONVERT(VARCHAR, TimeKey, 23) + ' - ' +
                                                  CONVERT(VARCHAR, DATEADD(DAY, 6, TimeKey), 23) + '）'
               END,
           TotalPatients,
           AverageWaitTime = CONCAT(ISNULL(ROUND(AvgWait, 2), 0), ' 分钟'), -- 修复空值
           MaxWaitTime     = CONCAT(ISNULL(MaxWait, 0), ' 分钟'),
           MinWaitTime     = CONCAT(ISNULL(MinWait, 0), ' 分钟')
    FROM GroupedData
    ORDER BY TimeKey,
             DeptName;
END;


    --存储过程测试实现
    EXEC sp_DepartmentDailyStatistics '2025-06-01', '2025-06-01', 0;
    EXEC sp_DepartmentHourlyStatistics '2025-06-01 00:00:00', '2025-06-01 23:59:59', 1;
    EXEC sp_CalculateDoctorEfficiency '2025-06-01', '2025-06-01';
    EXEC sp_DoctorDailyStatistics '2025-06-01', '2025-06-01';
    EXEC sp_PatientWaitTimeAnalysis '2025-05-26', '2025-06-02', 6, 'week';
    EXEC sp_PatientWaitTimeAnalysis @StartDate='2025-06-01', @EndDate='2025-06-30', @DeptId=0, @TimeUnit='day';


    -- 确保存在测试数据
SELECT *
FROM oldAppointment
WHERE firstTimeCalled BETWEEN '2025-06-01' AND '2025-06-01 23:59:59';
GO


-- ----------------------------
-- Auto increment value for department
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[department]', RESEED, 32)
GO


-- ----------------------------
-- Primary Key structure for table department
-- ----------------------------
ALTER TABLE [dbo].[department]
    ADD CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED ([departmentID])
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
        ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table doctor
-- ----------------------------
CREATE NONCLUSTERED INDEX [name]
    ON [dbo].[doctor] (
                       [name] ASC
        )
GO


-- ----------------------------
-- Primary Key structure for table doctor
-- ----------------------------
ALTER TABLE [dbo].[doctor]
    ADD CONSTRAINT [PK__doctor__722485963C24B923] PRIMARY KEY CLUSTERED ([doctorID])
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
        ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table oldAppointment
-- ----------------------------
ALTER TABLE [dbo].[oldAppointment]
    ADD CONSTRAINT [PK_oldAppointment] PRIMARY KEY CLUSTERED ([orderID])
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
        ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for patient
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[patient]', RESEED, 12)
GO


-- ----------------------------
-- Indexes structure for table patient
-- ----------------------------
CREATE NONCLUSTERED INDEX [name]
    ON [dbo].[patient] (
                        [name] ASC
        )
GO


-- ----------------------------
-- Primary Key structure for table patient
-- ----------------------------
ALTER TABLE [dbo].[patient]
    ADD CONSTRAINT [PK_patient] PRIMARY KEY CLUSTERED ([patientID])
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
        ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table patientType-priority
-- ----------------------------
ALTER TABLE [dbo].[patientType-priority]
    ADD CONSTRAINT [PK_patientType-priority] PRIMARY KEY CLUSTERED ([patientType])
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
        ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for recentAppointment
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[recentAppointment]', RESEED, 3)
GO


-- ----------------------------
-- Primary Key structure for table recentAppointment
-- ----------------------------
ALTER TABLE [dbo].[recentAppointment]
    ADD CONSTRAINT [PK_recentAppointment] PRIMARY KEY CLUSTERED ([orderID])
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
        ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table schedule
-- ----------------------------
CREATE NONCLUSTERED INDEX [doctorID_schedule]
    ON [dbo].[schedule] (
                         [doctorID] ASC
        )
GO


-- ----------------------------
-- Primary Key structure for table schedule
-- ----------------------------
ALTER TABLE [dbo].[schedule]
    ADD CONSTRAINT [PK_schedule] PRIMARY KEY CLUSTERED ([scheduleID])
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
        ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for userTable
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[userTable]', RESEED, 47)
GO


-- ----------------------------
-- Indexes structure for table userTable
-- ----------------------------
CREATE NONCLUSTERED INDEX [userName_index]
    ON [dbo].[userTable] (
                          [userName] ASC
        )
GO


-- ----------------------------
-- Primary Key structure for table userTable
-- ----------------------------
ALTER TABLE [dbo].[userTable]
    ADD CONSTRAINT [PK__user__3465E3208BAB2746] PRIMARY KEY CLUSTERED ([userID] DESC)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
        ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table department
-- ----------------------------
ALTER TABLE [dbo].[department]
    ADD CONSTRAINT [head] FOREIGN KEY ([headID]) REFERENCES [dbo].[doctor] ([doctorID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table doctor
-- ----------------------------
ALTER TABLE [dbo].[doctor]
    ADD CONSTRAINT [userID(Doc)] FOREIGN KEY ([userID]) REFERENCES [dbo].[userTable] ([userID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[doctor]
    NOCHECK CONSTRAINT [userID(Doc)]
GO


-- ----------------------------
-- Foreign Keys structure for table patient
-- ----------------------------
ALTER TABLE [dbo].[patient]
    ADD CONSTRAINT [userID(Patient)] FOREIGN KEY ([userID]) REFERENCES [dbo].[userTable] ([userID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[patient]
    NOCHECK CONSTRAINT [userID(Patient)]
GO


-- ----------------------------
-- Foreign Keys structure for table recentAppointment
-- ----------------------------
ALTER TABLE [dbo].[recentAppointment]
    ADD CONSTRAINT [appointment_doctorID] FOREIGN KEY ([doctorID]) REFERENCES [dbo].[doctor] ([doctorID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table schedule
-- ----------------------------
ALTER TABLE [dbo].[schedule]
    ADD CONSTRAINT [schedule_doctorID] FOREIGN KEY ([doctorID]) REFERENCES [dbo].[doctor] ([doctorID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

