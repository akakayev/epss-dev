CREATE DATABASE  IF NOT EXISTS `epss` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `epss`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: epss
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `academic_performance`
--

DROP TABLE IF EXISTS `academic_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academic_performance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `work-id` int(11) NOT NULL,
  `score` int(11) DEFAULT '0',
  `date` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`student_id`,`work-id`),
  KEY `work_idx` (`work-id`),
  CONSTRAINT `student` FOREIGN KEY (`id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_performance`
--

LOCK TABLES `academic_performance` WRITE;
/*!40000 ALTER TABLE `academic_performance` DISABLE KEYS */;
/*!40000 ALTER TABLE `academic_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_plan`
--

DROP TABLE IF EXISTS `academic_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academic_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `education_form` enum('FULL_TIME','EXTRAMURAL') NOT NULL,
  `discipline_id` int(11) NOT NULL,
  `hours` int(11) DEFAULT '0',
  `lectures` int(11) DEFAULT '0',
  `labs` int(11) DEFAULT '0',
  `seminars` int(11) DEFAULT '0',
  `evaluation` set('EXAM','CP','CW','CREDIT') DEFAULT 'EXAM',
  `diploma` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`,`course`,`semester`,`education_form`,`discipline_id`),
  KEY `subject_idx` (`discipline_id`),
  CONSTRAINT `subject` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_plan`
--

LOCK TABLES `academic_plan` WRITE;
/*!40000 ALTER TABLE `academic_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `academic_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(45) NOT NULL,
  `size` int(11) DEFAULT '0',
  `format` varchar(45) DEFAULT NULL,
  `file` longblob NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `attachment_kind` enum('REPORT','MANUAL') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_details`
--

DROP TABLE IF EXISTS `department_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager` int(11) DEFAULT NULL,
  `description` mediumtext,
  `logo` mediumblob,
  `housing_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `housing_idx` (`housing_id`),
  KEY `manager_idx` (`manager`),
  CONSTRAINT `housing` FOREIGN KEY (`housing_id`) REFERENCES `housings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `manager` FOREIGN KEY (`manager`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_details`
--

LOCK TABLES `department_details` WRITE;
/*!40000 ALTER TABLE `department_details` DISABLE KEYS */;
INSERT INTO `department_details` VALUES (1,1,'описание севгу',NULL,1);
/*!40000 ALTER TABLE `department_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `abbreviation` varchar(45) DEFAULT '',
  `faculty_id` int(11) NOT NULL,
  `details` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `details_idx` (`details`),
  KEY `faculty_idx` (`faculty_id`),
  CONSTRAINT `department_details` FOREIGN KEY (`details`) REFERENCES `department_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'ИТиКС','ИТиКС',1,1);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplines`
--

DROP TABLE IF EXISTS `disciplines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`name`,`department_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `department_idx` (`department_id`),
  CONSTRAINT `discipline_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplines`
--

LOCK TABLES `disciplines` WRITE;
/*!40000 ALTER TABLE `disciplines` DISABLE KEYS */;
/*!40000 ALTER TABLE `disciplines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculties`
--

DROP TABLE IF EXISTS `faculties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `abbreviation` varchar(45) DEFAULT '',
  `institution_id` int(11) DEFAULT NULL,
  `details_id` int(11) NOT NULL,
  `gradation` enum('FACULTY','INSTITUTE','OTHER') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `details_idx` (`details_id`),
  KEY `institution_idx` (`institution_id`),
  CONSTRAINT `faculty_details` FOREIGN KEY (`details_id`) REFERENCES `department_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `institution` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculties`
--

LOCK TABLES `faculties` WRITE;
/*!40000 ALTER TABLE `faculties` DISABLE KEYS */;
INSERT INTO `faculties` VALUES (1,'ИТиУВТС','ИТиУВТС',1,1,'INSTITUTE');
/*!40000 ALTER TABLE `faculties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`group_name`,`department_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `department_idx` (`department_id`),
  CONSTRAINT `department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'ИВТ-41',1);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housings`
--

DROP TABLE IF EXISTS `housings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(45) NOT NULL,
  `coordinates` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`address`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `address_UNIQUE` (`address`),
  UNIQUE KEY `coordinates_UNIQUE` (`coordinates`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housings`
--

LOCK TABLES `housings` WRITE;
/*!40000 ALTER TABLE `housings` DISABLE KEYS */;
INSERT INTO `housings` VALUES (1,'ул. Гоголя','[0,0]');
/*!40000 ALTER TABLE `housings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutions`
--

DROP TABLE IF EXISTS `institutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(45) NOT NULL,
  `abbreviation` varchar(10) DEFAULT '',
  `details_id` int(11) NOT NULL,
  `gradation` enum('UNIVERSITY','INSTITUTE','ACADEMY','OTHER') NOT NULL,
  PRIMARY KEY (`id`,`full_name`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `full_name_UNIQUE` (`full_name`),
  UNIQUE KEY `details_id_UNIQUE` (`details_id`),
  CONSTRAINT `details` FOREIGN KEY (`details_id`) REFERENCES `department_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutions`
--

LOCK TABLES `institutions` WRITE;
/*!40000 ALTER TABLE `institutions` DISABLE KEYS */;
INSERT INTO `institutions` VALUES (1,'СевГУ','СевГУ',1,'UNIVERSITY');
/*!40000 ALTER TABLE `institutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lector_descipline`
--

DROP TABLE IF EXISTS `lector_descipline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lector_descipline` (
  `lector_id` int(11) NOT NULL,
  `discipline_id` int(11) NOT NULL,
  PRIMARY KEY (`lector_id`,`discipline_id`),
  KEY `discipline_idx` (`discipline_id`),
  CONSTRAINT `discipline` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lector` FOREIGN KEY (`lector_id`) REFERENCES `lectors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lector_descipline`
--

LOCK TABLES `lector_descipline` WRITE;
/*!40000 ALTER TABLE `lector_descipline` DISABLE KEYS */;
/*!40000 ALTER TABLE `lector_descipline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lectors`
--

DROP TABLE IF EXISTS `lectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lectors` (
  `id` int(11) NOT NULL,
  `degree` varchar(45) DEFAULT NULL,
  `position` varchar(45) NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `department_idx` (`department_id`),
  KEY `lector_idx` (`user_id`),
  CONSTRAINT `lector_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lector_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectors`
--

LOCK TABLES `lectors` WRITE;
/*!40000 ALTER TABLE `lectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `lectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manuals`
--

DROP TABLE IF EXISTS `manuals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manuals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discipline` int(11) NOT NULL,
  `attachment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`discipline`,`attachment_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `file_idx` (`attachment_id`),
  KEY `manual_subject_idx` (`discipline`),
  CONSTRAINT `file` FOREIGN KEY (`attachment_id`) REFERENCES `attachments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `manual_subject` FOREIGN KEY (`discipline`) REFERENCES `academic_plan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manuals`
--

LOCK TABLES `manuals` WRITE;
/*!40000 ALTER TABLE `manuals` DISABLE KEYS */;
/*!40000 ALTER TABLE `manuals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `quote` longtext,
  `author_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `referense_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `private` tinyint(1) DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `message_idx` (`referense_id`),
  KEY `attachment_idx` (`attachment_id`),
  KEY `author_id_idx` (`author_id`),
  KEY `recepient_id_idx` (`recipient_id`),
  CONSTRAINT `attachment` FOREIGN KEY (`attachment_id`) REFERENCES `attachments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `author_id` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message` FOREIGN KEY (`referense_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recepient_id` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistant_logins`
--

DROP TABLE IF EXISTS `persistant_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persistant_logins` (
  `username` varchar(45) NOT NULL,
  `series` varchar(45) NOT NULL,
  `token` varchar(45) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistant_logins`
--

LOCK TABLES `persistant_logins` WRITE;
/*!40000 ALTER TABLE `persistant_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistant_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `work_id` int(11) NOT NULL,
  `version` int(11) DEFAULT '0',
  `attachment_id` int(11) NOT NULL,
  `accepted` tinyint(1) DEFAULT '0',
  `date` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `student_idx` (`student_id`),
  KEY `work_report_idx` (`work_id`),
  KEY `report_file_idx` (`attachment_id`),
  CONSTRAINT `author` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `report_file` FOREIGN KEY (`attachment_id`) REFERENCES `attachments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `work_report` FOREIGN KEY (`work_id`) REFERENCES `works` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester_results`
--

DROP TABLE IF EXISTS `semester_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester_results` (
  `student_id` int(11) NOT NULL,
  `discipline` int(11) NOT NULL,
  `score` int(11) DEFAULT '0',
  `date` timestamp DEFAULT CURRENT_TIMESTAMP,
  KEY `student_id_idx` (`student_id`),
  KEY `subject_result_idx` (`discipline`),
  CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subject_result` FOREIGN KEY (`discipline`) REFERENCES `academic_plan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester_results`
--

LOCK TABLES `semester_results` WRITE;
/*!40000 ALTER TABLE `semester_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `semester_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shedule`
--

DROP TABLE IF EXISTS `shedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `class_name` int(11) NOT NULL,
  `class_number` int(11) NOT NULL,
  `time` time NOT NULL,
  `lector_id` int(11) NOT NULL,
  `week` enum('EVEN','UNEVEN') NOT NULL,
  `housing_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`group_id`,`class_name`,`class_number`,`time`,`lector_id`,`week`,`housing_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `group_id_UNIQUE` (`group_id`),
  UNIQUE KEY `class_name_UNIQUE` (`class_name`),
  UNIQUE KEY `class_number_UNIQUE` (`class_number`),
  UNIQUE KEY `time_UNIQUE` (`time`),
  UNIQUE KEY `lector_id_UNIQUE` (`lector_id`),
  UNIQUE KEY `week_UNIQUE` (`week`),
  UNIQUE KEY `house_id_UNIQUE` (`housing_id`),
  CONSTRAINT `class_lector` FOREIGN KEY (`lector_id`) REFERENCES `lectors` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `group_class` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `housing_id` FOREIGN KEY (`housing_id`) REFERENCES `housings` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shedule`
--

LOCK TABLES `shedule` WRITE;
/*!40000 ALTER TABLE `shedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `shedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_book_number` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `semester` tinyint(2) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`record_book_number`),
  UNIQUE KEY `id_UNIQUE` (`record_book_number`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `group_id_idx` (`group_id`),
  KEY `user_idx` (`user_id`),
  CONSTRAINT `group_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,123,1,2,1),(7,1234,2,1,1);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `approved` tinyint(1) DEFAULT '0',
  `disabled` tinyint(1) DEFAULT '0',
  `photo` mediumblob,
  `login` varchar(45) NOT NULL,
  `password` varchar(3000) NOT NULL,
  `primary_role` enum('STUDENT','LECTOR') DEFAULT NULL,
  PRIMARY KEY (`id`,`login`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Артём','Валерьевич','Какаев',0,0,NULL,'kakayev','$2a$10$4eqIF5s/ewJwHK1p8lqlFOEm2QIA0S8g6./Lok.pQxqcxaBZYChRm','STUDENT'),(2,'Тигран','Арутюнович','Абрамов',0,0,NULL,'abramov','$2a$10$4eqIF5s/ewJwHK1p8lqlFOEm2QIA0S8g6./Lok.pQxqcxaBZYChRm','LECTOR'),(3,'firstName','middleName','lastName',0,0,NULL,'login','$2a$10$3.j7qvY/7zhA5F14LLpyHuLI1ekuYdtHDKxu7DYZrJbZ5Vj0tXQIi','STUDENT');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `works` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discipline_id` int(11) NOT NULL,
  `work_kind_id` int(11) NOT NULL,
  `number` varchar(10) DEFAULT NULL,
  `theme` varchar(45) DEFAULT NULL,
  `deadline` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `kind_work_idx` (`work_kind_id`),
  KEY `subject_idx` (`discipline_id`),
  CONSTRAINT `kind_work` FOREIGN KEY (`work_kind_id`) REFERENCES `works_kinds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `work_subject` FOREIGN KEY (`discipline_id`) REFERENCES `academic_plan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
/*!40000 ALTER TABLE `works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_kinds`
--

DROP TABLE IF EXISTS `works_kinds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `works_kinds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`name`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_kinds`
--

LOCK TABLES `works_kinds` WRITE;
/*!40000 ALTER TABLE `works_kinds` DISABLE KEYS */;
/*!40000 ALTER TABLE `works_kinds` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-28 11:45:32
