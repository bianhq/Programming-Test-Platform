-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: localhost    Database: db_ptp
-- ------------------------------------------------------
-- Server version	5.5.9

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `db_ptp`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_ptp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_ptp`;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Cour_Id` int(11) NOT NULL,
  `Stu_No` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Course_Class` (`Cour_Id`),
  KEY `Student_Class` (`Stu_No`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`Cour_Id`) REFERENCES `course` (`Cour_Id`),
  CONSTRAINT `class_ibfk_2` FOREIGN KEY (`Stu_No`) REFERENCES `student` (`Stu_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='授课班表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `Cour_Id` int(11) NOT NULL,
  `CName` varchar(40) NOT NULL,
  `Teacher_Id` int(11) NOT NULL,
  `Lang_Id` int(11) NOT NULL,
  PRIMARY KEY (`Cour_Id`),
  KEY `Teacher_Course` (`Teacher_Id`),
  KEY `Lang_Course` (`Lang_Id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Teacher_Id`) REFERENCES `teacher` (`Teacher_Id`),
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`Lang_Id`) REFERENCES `lang` (`Lang_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师授课表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examinations`
--

DROP TABLE IF EXISTS `examinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examinations` (
  `Exam_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Exam_Name` varchar(20) NOT NULL,
  `Cate` varchar(20) NOT NULL,
  `Start_Time` datetime NOT NULL,
  `End_Time` datetime NOT NULL,
  `Last` int(11) NOT NULL,
  `Pass` varchar(20) NOT NULL,
  `Teacher_Id` int(11) NOT NULL,
  PRIMARY KEY (`Exam_Id`),
  KEY `Teacher_Examinations` (`Teacher_Id`),
  CONSTRAINT `examinations_ibfk_1` FOREIGN KEY (`Teacher_Id`) REFERENCES `teacher` (`Teacher_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examinations`
--

LOCK TABLES `examinations` WRITE;
/*!40000 ALTER TABLE `examinations` DISABLE KEYS */;
/*!40000 ALTER TABLE `examinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examscore`
--

DROP TABLE IF EXISTS `examscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examscore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Exam_Id` int(11) NOT NULL,
  `Stu_No` varchar(40) NOT NULL,
  `Score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Exam_Id` (`Exam_Id`),
  KEY `Stu_No` (`Stu_No`),
  CONSTRAINT `Exam_Id` FOREIGN KEY (`Exam_Id`) REFERENCES `examinations` (`Exam_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试结果表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examscore`
--

LOCK TABLES `examscore` WRITE;
/*!40000 ALTER TABLE `examscore` DISABLE KEYS */;
/*!40000 ALTER TABLE `examscore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examsub`
--

DROP TABLE IF EXISTS `examsub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examsub` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Exam_Id` int(11) NOT NULL,
  `Sub_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Examinations_ExamSub` (`Exam_Id`),
  KEY `Subjects_ExamSub` (`Sub_Id`),
  CONSTRAINT `examsub_ibfk_1` FOREIGN KEY (`Exam_Id`) REFERENCES `examinations` (`Exam_Id`),
  CONSTRAINT `examsub_ibfk_2` FOREIGN KEY (`Sub_Id`) REFERENCES `subjects` (`Sub_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试题目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examsub`
--

LOCK TABLES `examsub` WRITE;
/*!40000 ALTER TABLE `examsub` DISABLE KEYS */;
/*!40000 ALTER TABLE `examsub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excises`
--

DROP TABLE IF EXISTS `excises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `excises` (
  `Ex_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pass` varchar(1) NOT NULL COMMENT '是否通过全部测试',
  `Sbts` int(11) NOT NULL COMMENT '提交的次数',
  `Sub_Id` int(11) NOT NULL,
  `Stu_No` varchar(20) NOT NULL,
  `Lang_Id` int(11) NOT NULL,
  PRIMARY KEY (`Ex_Id`),
  KEY `Subjects_Excises` (`Sub_Id`),
  KEY `Student_Excises` (`Stu_No`),
  KEY `Lang_Excises` (`Lang_Id`),
  CONSTRAINT `excises_ibfk_1` FOREIGN KEY (`Sub_Id`) REFERENCES `subjects` (`Sub_Id`),
  CONSTRAINT `excises_ibfk_2` FOREIGN KEY (`Stu_No`) REFERENCES `student` (`Stu_No`),
  CONSTRAINT `excises_ibfk_3` FOREIGN KEY (`Lang_Id`) REFERENCES `lang` (`Lang_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='训练集表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excises`
--

LOCK TABLES `excises` WRITE;
/*!40000 ALTER TABLE `excises` DISABLE KEYS */;
/*!40000 ALTER TABLE `excises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exinfor`
--

DROP TABLE IF EXISTS `exinfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exinfor` (
  `Infor_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Test_Id` int(11) NOT NULL COMMENT '测试样例的标识',
  `Pass` varchar(1) NOT NULL COMMENT '是否通过该测试样例',
  `Get_Score` int(11) NOT NULL COMMENT '该测试样例的分值',
  `Stu_No` varchar(20) NOT NULL,
  `Sub_Id` int(11) NOT NULL,
  `Lang_Id` int(11) NOT NULL,
  `Test_Time` datetime NOT NULL COMMENT '测试时间(一次提交的所有测试都是一样的时间)',
  PRIMARY KEY (`Infor_Id`),
  KEY `Test_Id` (`Test_Id`),
  CONSTRAINT `Test_Id` FOREIGN KEY (`Test_Id`) REFERENCES `testsets` (`Test_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='训练题目细节信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exinfor`
--

LOCK TABLES `exinfor` WRITE;
/*!40000 ALTER TABLE `exinfor` DISABLE KEYS */;
/*!40000 ALTER TABLE `exinfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lang`
--

DROP TABLE IF EXISTS `lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lang` (
  `Lang_Id` int(11) NOT NULL AUTO_INCREMENT,
  `LName` varchar(10) NOT NULL,
  PRIMARY KEY (`Lang_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='程序设计语言表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lang`
--

LOCK TABLES `lang` WRITE;
/*!40000 ALTER TABLE `lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `Log_id` int(11) NOT NULL AUTO_INCREMENT,
  `Log_date` datetime NOT NULL,
  `Log_infor` varchar(100) NOT NULL,
  PRIMARY KEY (`Log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `News_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Brief` varchar(45) NOT NULL COMMENT '标题',
  `Content` text NOT NULL COMMENT '内容',
  `Public_Time` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`News_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power`
--

DROP TABLE IF EXISTS `power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `power` (
  `Prior` varchar(2) NOT NULL,
  `PName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Prior`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power`
--

LOCK TABLES `power` WRITE;
/*!40000 ALTER TABLE `power` DISABLE KEYS */;
/*!40000 ALTER TABLE `power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `UName` varchar(20) NOT NULL,
  `Pwd` varchar(20) NOT NULL,
  `RName` varchar(20) NOT NULL,
  `Stu_No` varchar(40) NOT NULL,
  `Sex` char(1) NOT NULL,
  `Grade` int(11) NOT NULL,
  `Major` varchar(20) NOT NULL,
  `Prior` varchar(2) NOT NULL,
  `Motto` varchar(45) DEFAULT NULL,
  `LastLogOn` datetime DEFAULT NULL,
  PRIMARY KEY (`Stu_No`),
  KEY `student_ibfk_1` (`Prior`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Prior`) REFERENCES `power` (`Prior`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `Sub_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` text NOT NULL,
  `Description` text NOT NULL,
  `Input` text NOT NULL,
  `Output` text NOT NULL,
  `Sample_Input` text NOT NULL,
  `Sample_Output` text NOT NULL,
  `Category` varchar(100) NOT NULL,
  `Visible` varchar(1) NOT NULL,
  `Teacher_Id` int(11) NOT NULL,
  PRIMARY KEY (`Sub_Id`),
  KEY `Teacher_Id` (`Teacher_Id`),
  CONSTRAINT `Teacher_Id` FOREIGN KEY (`Teacher_Id`) REFERENCES `teacher` (`Teacher_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题库表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submits`
--

DROP TABLE IF EXISTS `submits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submits` (
  `Sbt_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Accepts` int(11) NOT NULL DEFAULT '0',
  `Sbts` int(11) NOT NULL DEFAULT '0',
  `Sub_Id` int(11) NOT NULL,
  PRIMARY KEY (`Sbt_Id`),
  KEY `Subjects_Submits` (`Sub_Id`),
  CONSTRAINT `submits_ibfk_1` FOREIGN KEY (`Sub_Id`) REFERENCES `subjects` (`Sub_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提交表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submits`
--

LOCK TABLES `submits` WRITE;
/*!40000 ALTER TABLE `submits` DISABLE KEYS */;
/*!40000 ALTER TABLE `submits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `Teacher_Id` int(11) NOT NULL AUTO_INCREMENT,
  `RegName` varchar(20) NOT NULL,
  `TName` varchar(20) NOT NULL,
  `Pwd` varchar(20) NOT NULL,
  `Sex` varchar(1) NOT NULL,
  `Prior` varchar(2) NOT NULL,
  `LastLogOn` datetime DEFAULT NULL,
  PRIMARY KEY (`Teacher_Id`),
  KEY `teacher_ibfk_1` (`Prior`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`Prior`) REFERENCES `power` (`Prior`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testsets`
--

DROP TABLE IF EXISTS `testsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testsets` (
  `Test_Id` int(11) NOT NULL AUTO_INCREMENT,
  `TData` text,
  `Result` text NOT NULL,
  `Score` int(11) NOT NULL,
  `Sub_Id` int(11) NOT NULL,
  PRIMARY KEY (`Test_Id`),
  KEY `Subjects_Datasets` (`Sub_Id`),
  CONSTRAINT `testsets_ibfk_1` FOREIGN KEY (`Sub_Id`) REFERENCES `subjects` (`Sub_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testsets`
--

LOCK TABLES `testsets` WRITE;
/*!40000 ALTER TABLE `testsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `testsets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-04-12 12:03:45
