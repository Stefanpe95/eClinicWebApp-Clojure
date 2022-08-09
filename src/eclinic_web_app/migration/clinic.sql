CREATE DATABASE IF NOT EXISTS `clinic`;
USE `clinic`;

-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: clinic
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `departmentid` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'admin'),(2,'hirurgy'),(3,'cardiology'),(4,'ORL');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `roleid` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctorid` bigint NOT NULL AUTO_INCREMENT,
  `doctorpid` bigint DEFAULT NULL,
  `speciality` varchar(255) DEFAULT NULL,
  `departmentid` bigint NOT NULL,
  PRIMARY KEY (`doctorid`),
  UNIQUE KEY `UK_e1dcr4rgseylenjxuyyxpu0uu` (`doctorpid`),
  KEY `FKdow9v3y2xni4r4w9mjv65momc` (`departmentid`),
  CONSTRAINT `FKdow9v3y2xni4r4w9mjv65momc` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,11111,'cardiologist',3),(2,11112,'ophtamologist',4);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patientid` bigint NOT NULL AUTO_INCREMENT,
  `age` int NOT NULL,
  `bloodtype` int DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `patientpid` bigint DEFAULT NULL,
  PRIMARY KEY (`patientid`),
  UNIQUE KEY `UK_ho4e8sayhvsynnjcn3p76sdby` (`patientpid`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (2,20,0,0,22225),(90,26,1,0,11112),(106,26,6,0,2809995),(107,26,5,0,657843);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `doctorid` bigint DEFAULT NULL,
  `patientid` bigint DEFAULT NULL,
  `roleid` bigint NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `FKdavwua8eluvm7onwvi1u4gkoi` (`doctorid`),
  KEY `FK6i92wjxdqjwrdx77oxj52pi5i` (`patientid`),
  KEY `FK2ovmsl4hvm5vu1w8i308r5j6w` (`roleid`),
  CONSTRAINT `FK2ovmsl4hvm5vu1w8i308r5j6w` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`),
  CONSTRAINT `FK6i92wjxdqjwrdx77oxj52pi5i` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`),
  CONSTRAINT `FKdavwua8eluvm7onwvi1u4gkoi` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('101306202345277440022','stefanpejanovic604@gmail.com','Stefan',NULL,90,2),('110275363468626236479','ppptest995@gmail.com','Ppp Test',NULL,107,2),('311e2d0069142c81','user@user.com','user',NULL,106,2),('857db1006a94a590','admin@admin.com','admin',1,NULL,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointmentid` bigint NOT NULL AUTO_INCREMENT,
  `appointment_note` varchar(5000) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `doctorid` bigint NOT NULL,
  `patientid` bigint NOT NULL,
  PRIMARY KEY (`appointmentid`),
  UNIQUE KEY `UK_r218bwndc7nbylup3ytpntf0l` (`date`),
  KEY `FKrni1ea9yguo96jtpbnov75o5l` (`doctorid`),
  KEY `FK45u34ll44t8g0iedip6slmemt` (`patientid`),
  CONSTRAINT `FK45u34ll44t8g0iedip6slmemt` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`),
  CONSTRAINT `FKrni1ea9yguo96jtpbnov75o5l` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (23,'Potrebno obaviti ocni pregled, desno oko kriticno, levo oko jos jednom detaljniji oftamoloski pregled.','2022-02-24 23:11:46.000000',1,90),(24,'All works included in the Historical Texts EEBO collection have page images (digital facsimiles). These pages have been digitised by opening (which often means there are two physical pages per image) from microfilms, which is why they are black and white, and provided by ProQuest. Currently, for around 25% of this collection, there are also searchable plain text transcriptions. These are manually transcribed versions of the page images, produced by the Text Creation Partnership (TCP). The text transcriptions for individual works can be identified in Historical Texts on the results page by having a \"full text\" label underneath them.\n\nThe full text available for the page images in the EEBO collection have been created by the EEBO-TCP. EEBO-TCP is a partnership between ProQuest and over 150 libraries to create searchable, TEI-compliant SGML/XML texts to support the page images for titles in the EEBO collection. The texts are created by manual transcription, rather than OCR which has been used for the ECCO and BL collections, as OCR would not be able to easily decipher the images for these pre-1700 works.\n\nEEBO-TCP Phase I began in 1999 as a collaboration between ProQuest, the University of Michigan and Oxford University and created searchable texts for 25,000 titles. This phase is complete and the works are available within Historical Texts.\n\nEEBO-TCP Phase II was announced in 2008 and aims to create searchable text for the remaining 44,000 unique monographs in the EEBO collection. Historical Texts will be adding these text updates as and when they are made available. **UPDATE** as of June 21, 2016, text for 20,000 more titles has been added, taking the amount of EEBO records with searchable text on Historical texts to around 40%.\n\nA digital collection of all the books published in Great Britain and its colonies during the eighteenth century, comprising some 33 million pages from more than 180,000 titles. The collection includes works in English, Dutch, French, German, Italian, Latin, Spanish and Welsh.\n\nEighteenth Century Collections Online contains a variety of printed materials including books, Bibles, sheet music, sermons and advertisements published from 1700-1799 and the content is comprised from eight subject areas:\n\nHistory and Geography\nSocial Science\nFine Arts, Music, Art & Architecture\nMedicine, Science and Technology\nLiterature and Language\nReligion and Philosophy\nLaw\nGeneral Reference','2022-02-25 23:12:29.000000',1,90),(25,'test','2022-03-03 14:55:02.424000',1,2),(27,'Diagnosis is often challenging, because many signs and symptoms are nonspecific, and can only be undertaken by registered and licensed health professionals. For example, redness of the skin (erythema), by itself, is a sign of many disorders and thus does not tell the healthcare professional what is wrong. Thus differential diagnosis, in which several possible explanations are compared and contrasted, must be performed. This involves the correlation of various pieces of information followed by the recognition and differentiation of patterns. Occasionally the process is made easy by a sign or symptom (or a group of several) that is pathognomonic.\n\nDiagnosis is a major component of the procedure of a doctor\'s visit. From the point of view of statistics, the diagnostic procedure involves classification tests.','2022-03-16 22:35:16.000000',1,2),(31,'Pacijentu je u prvoj fazi otkriveno lumbalno zakrivljenje kicme.','2022-03-14 09:00:11.000000',1,90),(32,'Opsti lekarski pregled koji ukljucuje analizu krvi,urina,EKG.','2022-03-14 10:15:05.000000',1,2),(33,'sdfsdfsdfasgsfgsfgsdfgsdf','2022-03-21 00:23:49.000000',1,90),(35,'Potreban pregled oba oka','2022-03-28 09:30:27.000000',1,106),(36,'Potreban pregled oba oka','2022-03-28 09:00:35.000000',2,107);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-09 16:59:02
