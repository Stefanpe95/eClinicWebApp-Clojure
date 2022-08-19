[
"CREATE DATABASE IF NOT EXISTS `clinic`;"
"USE `clinic`;"

"DROP TABLE IF EXISTS `department`;"
"CREATE TABLE `department` (
  `departmentid` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;"
"LOCK TABLES `department` WRITE;"
"INSERT INTO `department` VALUES (7,'cardiology'),(9,'ORL'),(11,'hirurgy');"
"UNLOCK TABLES;"

"DROP TABLE IF EXISTS `doctor`;"
"CREATE TABLE `doctor` (
  `doctorid` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `doctorpid` bigint NOT NULL,
  `departmentid` bigint NOT NULL,
  PRIMARY KEY (`doctorid`),
  KEY `fk_doctor_department1_idx` (`departmentid`),
  CONSTRAINT `fk_doctor_department1` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;"
"LOCK TABLES `doctor` WRITE;"
"INSERT INTO `doctor` VALUES (13,'stefan.pejanovic@gmail.com','Stefan','Pejanovic',10001,7),(15,'doctor2@gmail.com','Bogdan','Pejanovic',10002,9);"
"UNLOCK TABLES;"

"DROP TABLE IF EXISTS `gender`;"
"CREATE TABLE `gender` (
  `genderid` bigint NOT NULL AUTO_INCREMENT,
  `genderlabel` varchar(45) NOT NULL,
  PRIMARY KEY (`genderid`),
  UNIQUE KEY `genderlabel_UNIQUE` (`genderlabel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;"
"LOCK TABLES `gender` WRITE;"
"INSERT INTO `gender` VALUES (1,'MALE'),(2,'FEMALE');"
"UNLOCK TABLES;"

"DROP TABLE IF EXISTS `bloodtype`;"
"CREATE TABLE `bloodtype` (
  `bloodtypeid` bigint NOT NULL AUTO_INCREMENT,
  `bloodtypelabel` varchar(45) NOT NULL,
  PRIMARY KEY (`bloodtypeid`),
  UNIQUE KEY `bloodtypelabel_UNIQUE` (`bloodtypelabel`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;"
"LOCK TABLES `bloodtype` WRITE;"
"INSERT INTO `bloodtype` VALUES (1,'0+'),(2,'0-'),(3,'A+'),(4,'A-'),(5,'AB+'),(6,'AB-'),(7,'B+'),(8,'B-');"
"UNLOCK TABLES;"

"DROP TABLE IF EXISTS `patient`;"
"CREATE TABLE `patient` (
  `patientid` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `genderid` bigint NOT NULL,
  `bloodtypeid` bigint NOT NULL,
  PRIMARY KEY (`patientid`),
  KEY `fk_patient_gender1_idx` (`genderid`),
  KEY `fk_patient_bloodtype1_idx` (`bloodtypeid`),
  CONSTRAINT `fk_patient_bloodtype1` FOREIGN KEY (`bloodtypeid`) REFERENCES `bloodtype` (`bloodtypeid`),
  CONSTRAINT `fk_patient_gender1` FOREIGN KEY (`genderid`) REFERENCES `gender` (`genderid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;"
"LOCK TABLES `patient` WRITE;"
"INSERT INTO `patient` VALUES (8,'patient1@gmail.com','Pera','Peric','1960-07-19',2,3),(11,'patient2@gmail.com','Bogdan','Bogdanovic','1975-06-07',2,7);"
"UNLOCK TABLES;"

"DROP TABLE IF EXISTS `appointment`;"
"CREATE TABLE `appointment` (
  `appointmentid` bigint NOT NULL AUTO_INCREMENT,
  `note` varchar(1000) NOT NULL,
  `date` datetime NOT NULL,
  `doctorid` bigint NOT NULL,
  `patientid` bigint NOT NULL,
  PRIMARY KEY (`appointmentid`),
  KEY `fk_appointment_doctor1_idx` (`doctorid`),
  KEY `fk_appointment_patient1_idx` (`patientid`),
  CONSTRAINT `fk_appointment_doctor1` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`),
  CONSTRAINT `fk_appointment_patient1` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;"
"LOCK TABLES `appointment` WRITE;"
"INSERT INTO `appointment` VALUES (11,' pain in the right ear','2022-08-19 07:26:00',15,11),(15,' pelvic pain','2022-08-24 11:30:00',13,8);"
"UNLOCK TABLES;"


]