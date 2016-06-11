
LOCK TABLES `academic_performance` WRITE;
/*!40000 ALTER TABLE `academic_performance` DISABLE KEYS */;
/*!40000 ALTER TABLE `academic_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `academic_plan`
--

LOCK TABLES `academic_plan` WRITE;
/*!40000 ALTER TABLE `academic_plan` DISABLE KEYS */;
INSERT INTO `academic_plan` VALUES (1,4,8,'FULL_TIME',1,72,42,30,0,'EXAM',1),(2,1,1,'FULL_TIME',5,87,42,30,15,'EXAM',0),(3,1,2,'FULL_TIME',5,87,42,30,15,'EXAM',1),(4,2,3,'FULL_TIME',5,60,0,30,30,'CP',1),(5,2,4,'FULL_TIME',6,72,42,30,0,'EXAM',1),(6,4,8,'FULL_TIME',3,28,14,14,0,'CREDIT',1),(7,4,8,'FULL_TIME',4,28,14,14,0,'CREDIT',1),(8,3,5,'FULL_TIME',6,30,0,0,30,'CP',1),(9,4,8,'FULL_TIME',2,72,42,30,0,'EXAM',1),(10,3,5,'FULL_TIME',7,72,42,30,0,'EXAM',1),(11,3,6,'FULL_TIME',7,60,0,30,30,'CP',1);
/*!40000 ALTER TABLE `academic_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (1,'МУ2016',0,'doc',NULL,'https://docs.google.com/document/d/1T2W_92tlOOOOGAVYM_62sJ8XZT7-DSUXHDaGn4oTs90/edit','MANUAL');
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `department_details`
--

LOCK TABLES `department_details` WRITE;
/*!40000 ALTER TABLE `department_details` DISABLE KEYS */;
INSERT INTO `department_details` VALUES (1,1,'описание севгу',NULL,1);
/*!40000 ALTER TABLE `department_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'ИТиКС','ИТиКС',1,1);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `disciplines`
--

LOCK TABLES `disciplines` WRITE;
/*!40000 ALTER TABLE `disciplines` DISABLE KEYS */;
INSERT INTO `disciplines` VALUES (1,'Базы Данных',1),(2,'Защита Информации',1),(3,'Облачные и Grid технологии',1),(4,'Переферийные устройства',1),(5,'Программирование',1),(6,'Системное программирование',1),(7,'Системное программное обеспечение',1),(8,'Архитектура компьютера',1),(9,'Схематехника',1);
/*!40000 ALTER TABLE `disciplines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `faculties`
--

LOCK TABLES `faculties` WRITE;
/*!40000 ALTER TABLE `faculties` DISABLE KEYS */;
INSERT INTO `faculties` VALUES (1,'ИТиУВТС','ИТиУВТС',1,1,'INSTITUTE'),(2,'Физика','Физика',2,1,'FACULTY');
/*!40000 ALTER TABLE `faculties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'ИВТ-41',1);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `housings`
--

LOCK TABLES `housings` WRITE;
/*!40000 ALTER TABLE `housings` DISABLE KEYS */;
INSERT INTO `housings` VALUES (1,'ул. Гоголя','[0,0]');
/*!40000 ALTER TABLE `housings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `institutions`
--

LOCK TABLES `institutions` WRITE;
/*!40000 ALTER TABLE `institutions` DISABLE KEYS */;
INSERT INTO `institutions` VALUES (1,'СевГУ','СевГУ',1,'UNIVERSITY'),(2,'КФУ','КФУ',1,'UNIVERSITY');
/*!40000 ALTER TABLE `institutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lector_discipline`
--

LOCK TABLES `lector_discipline` WRITE;
/*!40000 ALTER TABLE `lector_discipline` DISABLE KEYS */;
/*!40000 ALTER TABLE `lector_discipline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lectors`
--

LOCK TABLES `lectors` WRITE;
/*!40000 ALTER TABLE `lectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `lectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `manuals`
--

LOCK TABLES `manuals` WRITE;
/*!40000 ALTER TABLE `manuals` DISABLE KEYS */;
INSERT INTO `manuals` VALUES (1,1,1);
/*!40000 ALTER TABLE `manuals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `persistant_logins`
--

LOCK TABLES `persistant_logins` WRITE;
/*!40000 ALTER TABLE `persistant_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistant_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `semester_results`
--

LOCK TABLES `semester_results` WRITE;
/*!40000 ALTER TABLE `semester_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `semester_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shedule`
--

LOCK TABLES `shedule` WRITE;
/*!40000 ALTER TABLE `shedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `shedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,123,1,2,1),(7,1234,2,1,1),(8,14,6,2,1);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Артём','Валерьевич','Какаев',0,0,NULL,'kakayev','$2a$10$4eqIF5s/ewJwHK1p8lqlFOEm2QIA0S8g6./Lok.pQxqcxaBZYChRm','STUDENT'),(2,'Тигран','Арутюнович','Абрамов',0,0,NULL,'abramov','$2a$10$4eqIF5s/ewJwHK1p8lqlFOEm2QIA0S8g6./Lok.pQxqcxaBZYChRm','LECTOR'),(6,'Дмитрий','Валерьевич','Боднар',0,0,NULL,'bodnar@mail.ru','$2a$10$B1iE2/3YaCRwS3y2gwTy2O7hCkFKJ5L1wY41fG9HSgBzcTbTfeRme','STUDENT');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
INSERT INTO `works` VALUES (3,1,1,'1','введение в SQL ','2016-06-11 09:43:24'),(4,1,1,'2','Запросы Inser, Select','2016-06-11 16:28:33'),(5,1,1,'3','Связывание таблиц','2016-06-11 16:29:42'),(6,1,1,'4','сложные запросы','2016-06-11 16:29:42');
/*!40000 ALTER TABLE `works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `works_kinds`
--

LOCK TABLES `works_kinds` WRITE;
/*!40000 ALTER TABLE `works_kinds` DISABLE KEYS */;
INSERT INTO `works_kinds` VALUES (1,'Лабораторная работа'),(2,'Реферат'),(3,'РГЗ'),(4,'Курсовая работа'),(5,'Курсовой проект'),(6,'Доклад');
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

-- Dump completed on 2016-06-11 19:32:41
