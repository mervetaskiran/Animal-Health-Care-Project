CREATE DATABASE  IF NOT EXISTS `ahcdbms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ahcdbms`;
SET FOREIGN_KEY_CHECKS=0;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: ahcdbms
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `activepharmaceuticalingredient`
--

DROP TABLE IF EXISTS `activepharmaceuticalingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activepharmaceuticalingredient` (
  `api_id` int NOT NULL AUTO_INCREMENT,
  `api_name` varchar(100) NOT NULL,
  PRIMARY KEY (`api_id`),
  UNIQUE KEY `api_name` (`api_name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activepharmaceuticalingredient`
--

LOCK TABLES `activepharmaceuticalingredient` WRITE;
/*!40000 ALTER TABLE `activepharmaceuticalingredient` DISABLE KEYS */;
INSERT INTO `activepharmaceuticalingredient` VALUES (3,'Amoxicillin'),(11,'Ceftriaxone'),(15,'Chloramphenicol'),(9,'Clindamycin'),(7,'Dexamethasone'),(5,'Enrofloxacin'),(16,'Florfenicol'),(13,'Flunixin Meglumine'),(12,'Gentamicin'),(2,'Ibuprofen'),(20,'Ivermectin'),(10,'Ketoprofen'),(18,'Levamisole'),(17,'Marbofloxacin'),(14,'Meloxicam'),(6,'Metronidazole'),(8,'Oxytetracycline'),(1,'Paracetamol'),(19,'Praziquantel'),(4,'Tetracycline');
/*!40000 ALTER TABLE `activepharmaceuticalingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `animal_id` int NOT NULL AUTO_INCREMENT,
  `animal_type_id` int DEFAULT NULL,
  `farm_id` int DEFAULT NULL,
  `breed_id` int DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `tag_number` bigint NOT NULL,
  PRIMARY KEY (`animal_id`),
  UNIQUE KEY `tag_number` (`tag_number`),
  KEY `idx_animal_animal_type_id` (`animal_type_id`),
  KEY `idx_animal_farm_id` (`farm_id`),
  KEY `idx_animal_breed_id` (`breed_id`),
  CONSTRAINT `animal_ibfk_2` FOREIGN KEY (`farm_id`) REFERENCES `farm` (`farm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_animal_type_id` FOREIGN KEY (`animal_type_id`) REFERENCES `animaltype` (`animal_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_breed_id` FOREIGN KEY (`breed_id`) REFERENCES `breed` (`breed_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (1,1,1,1,'Alaca İnek','2019-02-15','2019-06-20',1001),(2,3,1,11,'Merinos Koyun','2020-03-10','2020-05-15',2001),(3,5,1,21,'Golden Retriever','2021-08-05','2021-08-15',3001),(4,2,2,6,'Saanen Keçisi','2018-10-20','2018-12-01',4001),(5,4,2,16,'Arap Atı','2017-06-15','2017-08-10',5001),(6,6,2,26,'Van Kedisi','2022-01-01','2022-02-15',6001),(7,1,3,2,'Simmental','2020-04-25','2020-06-10',1002),(8,6,3,27,'British Shorthair','2021-12-12','2022-01-05',6002),(9,3,3,14,'Dorset Koyun','2019-11-01','2019-11-20',2002),(10,1,4,3,'Hereford İnek','2018-07-05','2018-09-15',1003),(11,2,4,7,'Halep Keçisi','2017-03-30','2017-05-10',4002),(12,4,4,20,'Quarter Horse','2020-06-06','2020-07-20',5002),(13,1,5,1,'Montofon','2020-05-15','2020-06-30',1004),(14,3,5,10,'Angora Koyun','2019-10-20','2019-11-25',2003),(15,6,5,28,'Siyam Kedisi','2021-09-01','2021-09-10',6003),(16,1,6,2,'Simmental','2021-03-10','2021-03-20',1005),(17,5,6,21,'Golden Retriever','2020-11-05','2020-11-15',3002),(18,4,6,19,'Friesian','2020-01-10','2020-02-01',5003),(19,1,7,3,'Hereford İnek','2019-08-20','2019-09-10',1006),(20,2,7,8,'Kıl Keçisi','2021-04-15','2021-05-01',4003),(21,4,7,16,'Arap Atı','2022-02-05','2022-02-20',5004),(22,6,8,29,'Maine Coon','2022-01-01','2022-01-10',6004),(23,3,8,11,'Merinos Koyun','2020-07-15','2020-08-10',2004),(24,5,8,24,'Beagle','2019-06-20','2019-07-15',3003);
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CheckJoinDateBeforeInsert` BEFORE INSERT ON `animal` FOR EACH ROW BEGIN
    IF NEW.join_date < NEW.birth_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Hata: Katılma tarihi doğum tarihinden önce olamaz.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `animal_insert_audit` AFTER INSERT ON `animal` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'INSERT',
            CONCAT('INSERT on animal: ', 
                NEW.animal_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CheckJoinDateBeforeUpdate` BEFORE UPDATE ON `animal` FOR EACH ROW BEGIN
    IF NEW.join_date < NEW.birth_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Hata: Katılma tarihi doğum tarihinden önce olamaz.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `animal_update_audit` AFTER UPDATE ON `animal` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'UPDATE',
            CONCAT('UPDATE on animal: ', 
                NEW.animal_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `animal_delete_audit` AFTER DELETE ON `animal` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'DELETE',
            CONCAT('DELETE on animal: ', 
                OLD.animal_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `LogAnimalDeletion` AFTER DELETE ON `animal` FOR EACH ROW BEGIN
    INSERT INTO DeletedAnimals (
        animal_id, 
        name, 
        animal_type, 
        tag_number, 
        deleted_at, 
        deleted_by, 
        deletion_reason
    )
    VALUES (
        OLD.animal_id, 
        OLD.name, 
        (SELECT animal_type_name FROM AnimalType WHERE animal_type_id = OLD.animal_type_id),
        OLD.tag_number, 
        NOW(), 
        CURRENT_USER, -- Kullanıcıyı kaydetmek için
        'Silme işlemi' -- Varsayılan sebep
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `animalidentifier`
--

DROP TABLE IF EXISTS `animalidentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animalidentifier` (
  `animal_id` int NOT NULL,
  `identifier_type_id` int NOT NULL,
  `identifier_value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`animal_id`,`identifier_type_id`),
  KEY `idx_animalidentifier_animal_id` (`animal_id`),
  KEY `idx_animalidentifier_identifier_type_id` (`identifier_type_id`),
  CONSTRAINT `animalidentifier_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `animalidentifier_ibfk_2` FOREIGN KEY (`identifier_type_id`) REFERENCES `identifiertype` (`identifier_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animalidentifier`
--

LOCK TABLES `animalidentifier` WRITE;
/*!40000 ALTER TABLE `animalidentifier` DISABLE KEYS */;
INSERT INTO `animalidentifier` VALUES (1,1,'MC1234567890'),(2,2,'ET5678901234'),(3,1,'MC0987654321'),(4,2,'ET1234509876'),(5,1,'MC1122334455'),(6,2,'ET9988776655'),(7,1,'MC6677889900');
/*!40000 ALTER TABLE `animalidentifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animaloutbreakparticipation`
--

DROP TABLE IF EXISTS `animaloutbreakparticipation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animaloutbreakparticipation` (
  `outbreak_id` int NOT NULL,
  `visit_id` int NOT NULL,
  PRIMARY KEY (`outbreak_id`,`visit_id`),
  KEY `idx_animaloutbreakparticipation_visit_id` (`visit_id`),
  KEY `idx_animaloutbreakparticipation_outbreak_id` (`outbreak_id`),
  CONSTRAINT `animaloutbreakparticipation_ibfk_1` FOREIGN KEY (`outbreak_id`) REFERENCES `diseaseoutbreak` (`outbreak_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `animaloutbreakparticipation_ibfk_2` FOREIGN KEY (`visit_id`) REFERENCES `animalvisit` (`visit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animaloutbreakparticipation`
--

LOCK TABLES `animaloutbreakparticipation` WRITE;
/*!40000 ALTER TABLE `animaloutbreakparticipation` DISABLE KEYS */;
/*!40000 ALTER TABLE `animaloutbreakparticipation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animalparentage`
--

DROP TABLE IF EXISTS `animalparentage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animalparentage` (
  `animal_id` int NOT NULL,
  `mother_id` int DEFAULT NULL,
  `father_id` int DEFAULT NULL,
  PRIMARY KEY (`animal_id`),
  KEY `idx_animalparentage_mother_id` (`mother_id`),
  KEY `idx_animalparentage_father_id` (`father_id`),
  CONSTRAINT `animalparentage_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `animalparentage_ibfk_2` FOREIGN KEY (`mother_id`) REFERENCES `animal` (`animal_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `animalparentage_ibfk_3` FOREIGN KEY (`father_id`) REFERENCES `animal` (`animal_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animalparentage`
--

LOCK TABLES `animalparentage` WRITE;
/*!40000 ALTER TABLE `animalparentage` DISABLE KEYS */;
/*!40000 ALTER TABLE `animalparentage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animaltype`
--

DROP TABLE IF EXISTS `animaltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animaltype` (
  `animal_type_id` int NOT NULL AUTO_INCREMENT,
  `animal_type_name` varchar(20) NOT NULL,
  PRIMARY KEY (`animal_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animaltype`
--

LOCK TABLES `animaltype` WRITE;
/*!40000 ALTER TABLE `animaltype` DISABLE KEYS */;
INSERT INTO `animaltype` VALUES (1,'Sığır'),(2,'Keçi'),(3,'Koyun'),(4,'At'),(5,'Köpek'),(6,'Kedi');
/*!40000 ALTER TABLE `animaltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animalvisit`
--

DROP TABLE IF EXISTS `animalvisit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animalvisit` (
  `visit_id` int NOT NULL AUTO_INCREMENT,
  `animal_id` int NOT NULL,
  `visit_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `veterinarian_id` int DEFAULT NULL,
  `diagnosis_id` int DEFAULT NULL,
  `notes` text,
  `is_spreading` tinyint(1) DEFAULT '0',
  `is_critical` tinyint(1) DEFAULT '0',
  `result` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`visit_id`),
  KEY `idx_animalvisit_animal_id` (`animal_id`),
  KEY `idx_animalvisit_veterinarian_id` (`veterinarian_id`),
  KEY `idx_animalvisit_diagnosis_id` (`diagnosis_id`),
  CONSTRAINT `animalvisit_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `animalvisit_ibfk_2` FOREIGN KEY (`veterinarian_id`) REFERENCES `veterinarian` (`vet_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `animalvisit_ibfk_3` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnosis` (`diagnosis_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animalvisit`
--

LOCK TABLES `animalvisit` WRITE;
/*!40000 ALTER TABLE `animalvisit` DISABLE KEYS */;
INSERT INTO `animalvisit` VALUES (1,1,'2024-01-15','2024-12-24',1,1,'Routine check-up for mastitis.',0,0,'Şifa'),(2,2,'2024-01-20',NULL,2,3,'Detected pneumonia symptoms.',1,1,NULL),(3,3,'2024-02-10',NULL,3,2,'Foot and mouth disease treatment ongoing.',1,1,NULL),(4,4,'2024-02-25',NULL,4,4,'General health evaluation, minor issues detected.',0,0,NULL),(6,6,'2024-03-10',NULL,6,10,'Vaccination completed for rabies.',0,0,NULL),(7,7,'2024-03-18',NULL,7,15,'Brucellosis test conducted.',1,0,NULL),(8,8,'2024-03-25',NULL,8,14,'Animal showing lameness, additional care needed.',0,1,NULL),(9,9,'2024-04-05',NULL,9,9,'Dietary supplements provided for malnutrition.',0,0,NULL),(10,10,'2024-04-15',NULL,10,8,'Fungal infection detected and treated.',0,1,NULL),(11,11,'2024-04-20',NULL,11,6,'Heat stress management protocol initiated.',0,1,NULL),(12,12,'2024-05-01',NULL,12,13,'Viral diarrhea symptoms treated.',1,1,NULL),(13,13,'2024-05-10','2024-12-24',13,11,'Parasitic infestation treated successfully.',0,0,'Ölüm'),(14,14,'2024-05-20',NULL,14,7,'Minor dermatitis observed and treated.',0,0,NULL),(17,1,'2024-12-25',NULL,1,3,'Yearly check-up',0,0,NULL),(18,1,'2024-12-23',NULL,NULL,NULL,'',1,0,NULL),(19,1,'2024-12-23',NULL,NULL,NULL,'Colic',1,0,NULL),(20,19,'2024-12-23','2024-12-24',NULL,NULL,'not mot',0,1,'Kesim'),(21,19,'2024-12-23',NULL,NULL,NULL,'not mot',0,1,NULL),(22,19,'2024-12-23',NULL,NULL,NULL,'',0,1,NULL),(23,13,'2024-12-23',NULL,NULL,NULL,'',0,1,NULL),(24,13,'2024-12-23',NULL,NULL,NULL,'322',0,1,NULL),(25,16,'2024-12-23','2024-12-23',NULL,NULL,'34223',0,1,'Şifa'),(26,1,'2024-12-23',NULL,NULL,NULL,'4545644',1,0,NULL),(27,24,'2024-12-24',NULL,NULL,13,'Köpüş çok hastaydı, biraz daha iyi oldu',0,0,NULL),(28,22,'2024-12-24','2024-12-24',NULL,NULL,'üzücü bir gelişme',1,1,'System.Windows.Controls.ComboBoxItem: Şifa');
/*!40000 ALTER TABLE `animalvisit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CheckVisitDatesBeforeInsert` BEFORE INSERT ON `animalvisit` FOR EACH ROW BEGIN
    IF NEW.end_date IS NOT NULL AND NEW.end_date < NEW.visit_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Hata: Ziyaretin bitiş tarihi başlangıç tarihinden önce olamaz.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AnimalVisitInsertAudit` AFTER INSERT ON `animalvisit` FOR EACH ROW BEGIN
    INSERT INTO AuditLog (action_type, animal_id, visit_id, changed_data)
    VALUES (
        'INSERT', 
        NEW.animal_id, 
        NEW.visit_id, 
        CONCAT('Ziyaret eklendi: ', 
               'Ziyaret Tarihi: ', NEW.visit_date, ', ',
               'Sonlanma Tarihi: ', NEW.end_date, ', ',
               'Veteriner ID: ', NEW.veterinarian_id, ', ',
               'Notlar: ', NEW.notes)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AnimalVisitUpdateAudit` AFTER UPDATE ON `animalvisit` FOR EACH ROW BEGIN
    INSERT INTO AuditLog (action_type, animal_id, visit_id, changed_data)
    VALUES (
        'UPDATE', 
        NEW.animal_id, 
        NEW.visit_id, 
        CONCAT('Ziyaret güncellendi: ',
               'Eski Veri: (Ziyaret Tarihi: ', OLD.visit_date, ', ',
               'Sonlanma Tarihi: ', OLD.end_date, ', ',
               'Veteriner ID: ', OLD.veterinarian_id, ', ',
               'Notlar: ', OLD.notes, '), ',
               'Yeni Veri: (Ziyaret Tarihi: ', NEW.visit_date, ', ',
               'Sonlanma Tarihi: ', NEW.end_date, ', ',
               'Veteriner ID: ', NEW.veterinarian_id, ', ',
               'Notlar: ', NEW.notes, ')')
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AnimalVisitDeleteAudit` AFTER DELETE ON `animalvisit` FOR EACH ROW BEGIN
    INSERT INTO AuditLog (action_type, animal_id, visit_id, changed_data)
    VALUES (
        'DELETE', 
        OLD.animal_id, 
        OLD.visit_id, 
        CONCAT('Ziyaret silindi: ',
               'Ziyaret Tarihi: ', OLD.visit_date, ', ',
               'Sonlanma Tarihi: ', OLD.end_date, ', ',
               'Veteriner ID: ', OLD.veterinarian_id, ', ',
               'Notlar: ', OLD.notes)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditlog` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `action_type` varchar(50) DEFAULT NULL,
  `action_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `animal_id` int DEFAULT NULL,
  `visit_id` int DEFAULT NULL,
  `changed_data` text,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog`
--

LOCK TABLES `auditlog` WRITE;
/*!40000 ALTER TABLE `auditlog` DISABLE KEYS */;
INSERT INTO `auditlog` VALUES (1,'INSERT','2024-12-24 02:45:12',24,27,NULL),(2,'INSERT','2024-12-24 02:47:44',22,28,NULL),(3,'UPDATE','2024-12-24 02:57:17',22,28,NULL),(4,'UPDATE','2024-12-24 02:59:52',19,20,NULL),(5,'UPDATE','2024-12-24 03:03:17',1,1,'Ziyaret güncellendi: Eski Veri: (Ziyaret Tarihi: 2024-01-15, Sonlanma Tarihi: 2024-12-23, Veteriner ID: 1, Notlar: Routine check-up for mastitis.), Yeni Veri: (Ziyaret Tarihi: 2024-01-15, Sonlanma Tarihi: 2024-12-24, Veteriner ID: 1, Notlar: Routine check-up for mastitis.)'),(6,'UPDATE','2024-12-24 03:09:06',1,1,'Ziyaret güncellendi: Eski Veri: (Ziyaret Tarihi: 2024-01-15, Sonlanma Tarihi: 2024-12-24, Veteriner ID: 1, Notlar: Routine check-up for mastitis.), Yeni Veri: (Ziyaret Tarihi: 2024-01-15, Sonlanma Tarihi: 2024-12-24, Veteriner ID: 1, Notlar: Routine check-up for mastitis.)'),(7,'END','2024-12-24 03:09:06',1,1,'Tedavi sonuçlandı: Şifa'),(8,'UPDATE','2024-12-24 03:16:19',24,27,NULL),(9,'UPDATE','2024-12-24 03:16:19',24,27,'Notes: Köpüş çok hasta -> Köpüş çok hastaydı, biraz daha iyi oldu; Diagnosis:  -> Tick Fever; ');
/*!40000 ALTER TABLE `auditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breed`
--

DROP TABLE IF EXISTS `breed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breed` (
  `breed_id` int NOT NULL AUTO_INCREMENT,
  `breed_name` varchar(20) NOT NULL,
  `animal_type_id` int DEFAULT NULL,
  PRIMARY KEY (`breed_id`),
  KEY `idx_breed_animal_type_id` (`animal_type_id`),
  CONSTRAINT `breed_ibfk_1` FOREIGN KEY (`animal_type_id`) REFERENCES `animaltype` (`animal_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breed`
--

LOCK TABLES `breed` WRITE;
/*!40000 ALTER TABLE `breed` DISABLE KEYS */;
INSERT INTO `breed` VALUES (1,'Holstein',1),(2,'Montofon',1),(3,'Simmental',1),(4,'Jersey',1),(5,'Hereford',1),(6,'Saanen',2),(7,'Kıl Keçisi',2),(8,'Halep',2),(9,'Alpine',2),(10,'Angora',2),(11,'Merinos',3),(12,'Kıvırcık',3),(13,'Suffolk',3),(14,'Dorset',3),(15,'Hampshire',3),(16,'Ardennes',4),(17,'Arap Atı',4),(18,'Friesian',4),(19,'Mustang',4),(20,'Quarter Horse',4),(21,'Golden Retriever',5),(22,'Alman Çoban Köpeği',5),(23,'Labrador Retriever',5),(24,'Beagle',5),(25,'Rottweiler',5),(26,'Van Kedisi',6),(27,'British Shorthair',6),(28,'Siyam Kedisi',6),(29,'Maine Coon',6),(30,'Scottish Fold',6);
/*!40000 ALTER TABLE `breed` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `breed_insert_audit` AFTER INSERT ON `breed` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'INSERT',
            CONCAT('INSERT on breed: ', 
                NEW.breed_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `breed_update_audit` AFTER UPDATE ON `breed` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'UPDATE',
            CONCAT('UPDATE on breed: ', 
                NEW.breed_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `breed_delete_audit` AFTER DELETE ON `breed` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'DELETE',
            CONCAT('DELETE on breed: ', 
                OLD.breed_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cattle`
--

DROP TABLE IF EXISTS `cattle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cattle` (
  `animal_id` int NOT NULL,
  `herd_group_number` int DEFAULT NULL,
  PRIMARY KEY (`animal_id`),
  CONSTRAINT `cattle_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cattle`
--

LOCK TABLES `cattle` WRITE;
/*!40000 ALTER TABLE `cattle` DISABLE KEYS */;
/*!40000 ALTER TABLE `cattle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deletedanimals`
--

DROP TABLE IF EXISTS `deletedanimals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deletedanimals` (
  `animal_id` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `animal_type` varchar(50) DEFAULT NULL,
  `tag_number` bigint DEFAULT NULL,
  `deleted_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletedanimals`
--

LOCK TABLES `deletedanimals` WRITE;
/*!40000 ALTER TABLE `deletedanimals` DISABLE KEYS */;
/*!40000 ALTER TABLE `deletedanimals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis` (
  `diagnosis_id` int NOT NULL AUTO_INCREMENT,
  `diagnosis_name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`diagnosis_id`),
  UNIQUE KEY `diagnosis_name` (`diagnosis_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (1,'Mastitis','Inflammation of the mammary gland.'),(2,'Foot and Mouth Disease','Highly contagious viral disease.'),(3,'Pneumonia','Inflammation of the lungs.'),(4,'Rabies','Fatal viral disease affecting the nervous system.'),(5,'Parasitic Infestation','Infestation by internal or external parasites.'),(6,'Colic','Severe abdominal pain.'),(7,'Arthritis','Inflammation of the joints.'),(8,'Brucellosis','Infectious disease caused by Brucella bacteria.'),(9,'Dermatitis','Inflammation of the skin.'),(10,'Malnutrition','Deficiency or excess of essential nutrients.'),(11,'Heat Stress','Body overheating due to high temperature or exertion.'),(12,'Viral Diarrhea','Viral infection causing severe diarrhea.'),(13,'Tick Fever','Fever caused by tick-borne parasites.'),(14,'Lameness','Abnormal gait or inability to walk.'),(15,'Fungal Infection','Infection caused by fungi.'),(16,'Diğer','Tanı Açıklaması Bulunmamaktadır');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `diagnosis_insert_audit` AFTER INSERT ON `diagnosis` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'INSERT',
            CONCAT('INSERT on diagnosis: ', 
                NEW.diagnosis_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `diagnosis_update_audit` AFTER UPDATE ON `diagnosis` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'UPDATE',
            CONCAT('UPDATE on diagnosis: ', 
                NEW.diagnosis_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `diagnosis_delete_audit` AFTER DELETE ON `diagnosis` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'DELETE',
            CONCAT('DELETE on diagnosis: ', 
                OLD.diagnosis_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `diagnosisapplicability`
--

DROP TABLE IF EXISTS `diagnosisapplicability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosisapplicability` (
  `diagnosis_id` int DEFAULT NULL,
  `animal_type_id` int DEFAULT NULL,
  `breed_id` int DEFAULT NULL,
  UNIQUE KEY `diagnosis_id` (`diagnosis_id`,`animal_type_id`,`breed_id`),
  KEY `animal_type_id` (`animal_type_id`),
  KEY `breed_id` (`breed_id`),
  CONSTRAINT `diagnosisapplicability_ibfk_1` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnosis` (`diagnosis_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `diagnosisapplicability_ibfk_2` FOREIGN KEY (`animal_type_id`) REFERENCES `animaltype` (`animal_type_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `diagnosisapplicability_ibfk_3` FOREIGN KEY (`breed_id`) REFERENCES `breed` (`breed_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosisapplicability`
--

LOCK TABLES `diagnosisapplicability` WRITE;
/*!40000 ALTER TABLE `diagnosisapplicability` DISABLE KEYS */;
INSERT INTO `diagnosisapplicability` VALUES (1,1,1),(2,1,5),(3,2,8),(4,3,11),(5,4,17),(6,1,2),(7,5,24),(8,6,29),(9,3,10),(10,2,7),(11,4,21),(12,6,30),(13,1,3);
/*!40000 ALTER TABLE `diagnosisapplicability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diseaseoutbreak`
--

DROP TABLE IF EXISTS `diseaseoutbreak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diseaseoutbreak` (
  `outbreak_id` int NOT NULL AUTO_INCREMENT,
  `outbreak_start_date` date NOT NULL,
  `outbreak_end_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `farm_id` int DEFAULT NULL,
  `diagnosis_id` int DEFAULT NULL,
  `outbreak_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`outbreak_id`),
  KEY `farm_id` (`farm_id`),
  KEY `idx_diseaseoutbreak_diagnosis_id` (`diagnosis_id`),
  CONSTRAINT `diseaseoutbreak_ibfk_1` FOREIGN KEY (`farm_id`) REFERENCES `farm` (`farm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `diseaseoutbreak_ibfk_2` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnosis` (`diagnosis_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseaseoutbreak`
--

LOCK TABLES `diseaseoutbreak` WRITE;
/*!40000 ALTER TABLE `diseaseoutbreak` DISABLE KEYS */;
/*!40000 ALTER TABLE `diseaseoutbreak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farm`
--

DROP TABLE IF EXISTS `farm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farm` (
  `farm_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`farm_id`),
  UNIQUE KEY `UC_FarmNameCity` (`name`,`city`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farm`
--

LOCK TABLES `farm` WRITE;
/*!40000 ALTER TABLE `farm` DISABLE KEYS */;
INSERT INTO `farm` VALUES (1,'Gökova Çiftliği','Kuzey Mah.','İzmir','1234567890'),(2,'Mavi Dağ Çiftliği','Çayır Köyü','Manisa','2345678901'),(3,'Zümrüt Bahçe Çiftliği','Yeşiltepe Mah.','İstanbul','3456789012'),(4,'Bereket Tarlası Çiftliği','Doğanyurt','Antalya','4567890123'),(5,'Doğa Dolu Çiftliği','Karaorman','Sakarya','5678901234'),(6,'Yıldız Vadisi Çiftliği','Aladağ','Kayseri','6789012345'),(7,'Ayışığı Çiftliği','Gölköy','Bolu','7890123456'),(8,'Altınbaşak Çiftliği','Ovabaşı','Şanlıurfa','8901234567'),(9,'Güvenli Tarla Çiftliği','Kuzeyova','Trabzon','9012345678'),(10,'Sevimli Köşe Çiftliği','Derebaşı','Rize','1123456789'),(11,'Mutlu Yuva Çiftliği','Güzelyurt','Mersin','2123456789'),(12,'Doğa Harikası Çiftliği','Dağyaka','Denizli','3123456789'),(13,'Sakin Bahar Çiftliği','Yeşildere','Adana','4123456789'),(14,'Çiçek Bahçe Çiftliği','Güneşli Köy','Konya','5123456789');
/*!40000 ALTER TABLE `farm` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `farm_insert_audit` AFTER INSERT ON `farm` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'INSERT',
            CONCAT('INSERT on farm: ', 
                NEW.farm_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `farm_update_audit` AFTER UPDATE ON `farm` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'UPDATE',
            CONCAT('UPDATE on farm: ', 
                NEW.farm_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `farm_delete_audit` AFTER DELETE ON `farm` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'DELETE',
            CONCAT('DELETE on farm: ', 
                OLD.farm_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `healthhistory`
--

DROP TABLE IF EXISTS `healthhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `healthhistory` (
  `health_history_id` int NOT NULL AUTO_INCREMENT,
  `notes` varchar(255) NOT NULL,
  `health_record_date` date NOT NULL,
  `animal_id` int DEFAULT NULL,
  `diagnosis_id` int DEFAULT NULL,
  `treatment_id` int DEFAULT NULL,
  `visit_id` int DEFAULT NULL,
  PRIMARY KEY (`health_history_id`),
  KEY `idx_healthhistory_animal_id` (`animal_id`),
  KEY `idx_healthhistory_diagnosis_id` (`diagnosis_id`),
  KEY `idx_healthhistory_treatment_id` (`treatment_id`),
  KEY `idx_healthhistory_visit_id` (`visit_id`),
  KEY `idx_healthhistory_health_record_date` (`health_record_date`),
  CONSTRAINT `healthhistory_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `healthhistory_ibfk_2` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnosis` (`diagnosis_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `healthhistory_ibfk_3` FOREIGN KEY (`treatment_id`) REFERENCES `treatment` (`treatment_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `healthhistory_ibfk_4` FOREIGN KEY (`visit_id`) REFERENCES `animalvisit` (`visit_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthhistory`
--

LOCK TABLES `healthhistory` WRITE;
/*!40000 ALTER TABLE `healthhistory` DISABLE KEYS */;
INSERT INTO `healthhistory` VALUES (1,'Routine mastitis check-up completed.','2024-01-01',1,1,2,1),(2,'Pneumonia symptoms treated successfully.','2024-01-20',2,3,1,2),(3,'Treatment for foot and mouth disease ongoing.','2024-02-15',3,5,4,2),(4,'Tick fever resolved after treatment.','2024-03-01',5,2,1,3),(5,'Vaccination for rabies completed.','2024-03-10',6,6,2,3),(6,'Brucellosis treatment in progress.','2024-03-15',6,5,4,NULL),(7,'Dietary supplements provided for malnutrition.','2024-04-01',7,3,3,4),(8,'Heat stress management successfully implemented.','2024-04-10',8,5,3,2),(9,'Parasitic infestation eradicated.','2024-05-10',9,6,3,2);
/*!40000 ALTER TABLE `healthhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identifiertype`
--

DROP TABLE IF EXISTS `identifiertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identifiertype` (
  `identifier_type_id` int NOT NULL AUTO_INCREMENT,
  `identifier_type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`identifier_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identifiertype`
--

LOCK TABLES `identifiertype` WRITE;
/*!40000 ALTER TABLE `identifiertype` DISABLE KEYS */;
INSERT INTO `identifiertype` VALUES (1,'Mikroçip'),(2,'Kulak Etiketi'),(3,'Mikroçip'),(4,'Kulak Etiketi');
/*!40000 ALTER TABLE `identifiertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measurement`
--

DROP TABLE IF EXISTS `measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measurement` (
  `measurement_id` int NOT NULL AUTO_INCREMENT,
  `visit_id` int DEFAULT NULL,
  `measurement_type_id` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `value` float NOT NULL,
  `measurement_date` date DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`measurement_id`),
  KEY `idx_measurement_visit_id` (`visit_id`),
  KEY `idx_measurement_measurement_type_id` (`measurement_type_id`),
  KEY `idx_measurement_unit_id` (`unit_id`),
  CONSTRAINT `fk_measurement_unit` FOREIGN KEY (`unit_id`) REFERENCES `measurementunit` (`unit_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `measurement_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `animalvisit` (`visit_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `measurement_ibfk_2` FOREIGN KEY (`measurement_type_id`) REFERENCES `measurementtype` (`measurement_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurement`
--

LOCK TABLES `measurement` WRITE;
/*!40000 ALTER TABLE `measurement` DISABLE KEYS */;
INSERT INTO `measurement` VALUES (1,9,1,11,38.5,'2024-01-01','Normal body temperature recorded.'),(2,10,2,11,72,'2024-01-20','Healthy heart rate observed.'),(3,11,3,12,18,'2024-02-15','Normal breathing rate.'),(4,12,4,14,150,'2024-03-01','Weight check completed.'),(5,13,5,10,120,'2024-03-10','Blood pressure within healthy range.');
/*!40000 ALTER TABLE `measurement` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `measurement_insert_audit` AFTER INSERT ON `measurement` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'INSERT',
            CONCAT('INSERT on measurement: ', 
                NEW.measurement_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `measurement_update_audit` AFTER UPDATE ON `measurement` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'UPDATE',
            CONCAT('UPDATE on measurement: ', 
                NEW.measurement_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `measurement_delete_audit` AFTER DELETE ON `measurement` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'DELETE',
            CONCAT('DELETE on measurement: ', 
                OLD.measurement_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `measurementtype`
--

DROP TABLE IF EXISTS `measurementtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measurementtype` (
  `measurement_type_id` int NOT NULL AUTO_INCREMENT,
  `measurement_type_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`measurement_type_id`),
  UNIQUE KEY `measurement_type_name` (`measurement_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurementtype`
--

LOCK TABLES `measurementtype` WRITE;
/*!40000 ALTER TABLE `measurementtype` DISABLE KEYS */;
INSERT INTO `measurementtype` VALUES (1,'Vücut Sıcaklığı','Hayvanın vücut sıcaklığını ölçer.'),(2,'Kalp Atış Hızı','Hayvanın dakikadaki kalp atış sayısını ölçer.'),(3,'Solunum Hızı','Hayvanın dakikadaki nefes sayısını ölçer.'),(4,'Ağırlık','Hayvanın ağırlığını ölçer.'),(5,'Kan Basıncı','Hayvanın kan basıncını ölçer.');
/*!40000 ALTER TABLE `measurementtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measurementunit`
--

DROP TABLE IF EXISTS `measurementunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measurementunit` (
  `unit_id` int NOT NULL AUTO_INCREMENT,
  `measurement_type_id` int DEFAULT NULL,
  `unit_name` varchar(50) NOT NULL,
  `unit_symbol` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`unit_id`),
  KEY `measurement_type_id` (`measurement_type_id`),
  CONSTRAINT `measurementunit_ibfk_1` FOREIGN KEY (`measurement_type_id`) REFERENCES `measurementtype` (`measurement_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurementunit`
--

LOCK TABLES `measurementunit` WRITE;
/*!40000 ALTER TABLE `measurementunit` DISABLE KEYS */;
INSERT INTO `measurementunit` VALUES (9,1,'Celsius','°C'),(10,2,'Fahrenheit','°F'),(11,3,'Beats per Minute','BPM'),(12,4,'Breaths per Minute','BPM'),(13,2,'Kilogram','kg'),(14,3,'Gram','g'),(15,4,'Pound','lb'),(16,5,'Millimeter of Mercury','mmHg');
/*!40000 ALTER TABLE `measurementunit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication` (
  `medication_id` int NOT NULL AUTO_INCREMENT,
  `api_id` int DEFAULT NULL,
  `trade_name` varchar(100) DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `stock_quantity` int DEFAULT NULL,
  PRIMARY KEY (`medication_id`),
  KEY `fk_api_id` (`api_id`),
  CONSTRAINT `fk_api_id` FOREIGN KEY (`api_id`) REFERENCES `activepharmaceuticalingredient` (`api_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` VALUES (1,3,'Paravet','VetPharma',100),(2,11,'Oxytet Injection','AgriVet',150),(3,15,'AmoxyVet','BioVet',200),(4,9,'Ivomec','Merial',300),(5,7,'Multivitamin Oral','NutriVet',500),(6,5,'Cephalexin Capsules','FarmaVet',400),(7,16,'Doxyvet Injection','AnimalCare',250),(8,13,'Florfenicol','VetHealth',350),(9,12,'Levamisole HCL','AgriVet',220),(10,2,'Meloxicam','MedPharma',180);
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `medication_insert_audit` AFTER INSERT ON `medication` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'INSERT',
            CONCAT('INSERT on medication: ', 
                NEW.medication_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `medication_update_audit` AFTER UPDATE ON `medication` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'UPDATE',
            CONCAT('UPDATE on medication: ', 
                NEW.medication_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `medication_delete_audit` AFTER DELETE ON `medication` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'DELETE',
            CONCAT('DELETE on medication: ', 
                OLD.medication_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sheep`
--

DROP TABLE IF EXISTS `sheep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sheep` (
  `animal_id` int NOT NULL,
  `herd_group_number` int DEFAULT NULL,
  PRIMARY KEY (`animal_id`),
  CONSTRAINT `sheep_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sheep`
--

LOCK TABLES `sheep` WRITE;
/*!40000 ALTER TABLE `sheep` DISABLE KEYS */;
/*!40000 ALTER TABLE `sheep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestedtreatment`
--

DROP TABLE IF EXISTS `suggestedtreatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suggestedtreatment` (
  `diagnosis_id` int NOT NULL,
  `treatment_id` int NOT NULL,
  `animal_type_id` int NOT NULL,
  `breed_id` int NOT NULL,
  `is_recommended` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`diagnosis_id`,`treatment_id`,`animal_type_id`,`breed_id`),
  KEY `idx_suggestedtreatment_diagnosis_id` (`diagnosis_id`),
  KEY `idx_suggestedtreatment_treatment_id` (`treatment_id`),
  KEY `idx_suggestedtreatment_animal_type_id` (`animal_type_id`),
  KEY `idx_suggestedtreatment_breed_id` (`breed_id`),
  CONSTRAINT `suggestedtreatment_ibfk_1` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnosis` (`diagnosis_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suggestedtreatment_ibfk_2` FOREIGN KEY (`treatment_id`) REFERENCES `treatment` (`treatment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suggestedtreatment_ibfk_3` FOREIGN KEY (`animal_type_id`) REFERENCES `animaltype` (`animal_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suggestedtreatment_ibfk_4` FOREIGN KEY (`breed_id`) REFERENCES `breed` (`breed_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestedtreatment`
--

LOCK TABLES `suggestedtreatment` WRITE;
/*!40000 ALTER TABLE `suggestedtreatment` DISABLE KEYS */;
INSERT INTO `suggestedtreatment` VALUES (1,1,1,1,1),(2,3,1,5,1),(3,2,2,8,1),(4,7,3,11,1),(5,5,4,17,1),(6,6,1,2,1),(7,4,5,24,1),(8,9,6,29,1),(9,4,3,10,1),(10,6,2,7,1),(11,5,4,21,1),(12,6,6,30,1),(13,3,1,3,1);
/*!40000 ALTER TABLE `suggestedtreatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment` (
  `treatment_id` int NOT NULL AUTO_INCREMENT,
  `treatment_name` varchar(100) NOT NULL,
  `treatment_details` text,
  PRIMARY KEY (`treatment_id`),
  UNIQUE KEY `treatment_name` (`treatment_name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES (1,'Antibiotic Treatment','Broad-spectrum antibiotics administered.'),(2,'Respiratory Support','Oxygen therapy and anti-inflammatory medications.'),(3,'Foot Bath','Disinfectant footbath for hoof treatment.'),(4,'Anti-Parasitic Treatment','Topical application for external parasites.'),(5,'Pain Management','Analgesics administered to reduce pain.'),(6,'Nutritional Supplements','Vitamin and mineral supplements provided.'),(7,'Hydration Therapy','IV fluids to address dehydration.'),(8,'Vaccination','Vaccination protocol completed.'),(9,'Antifungal Treatment','Topical antifungal applied to infected area.'),(10,'Wound Dressing','Sterile dressing applied to wound.'),(13,'Tedavi','Provides hydration to animals suffering from dehydration.');
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `treatment_insert_audit` AFTER INSERT ON `treatment` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'INSERT',
            CONCAT('INSERT on treatment: ', 
                NEW.treatment_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `treatment_update_audit` AFTER UPDATE ON `treatment` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'UPDATE',
            CONCAT('UPDATE on treatment: ', 
                NEW.treatment_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `treatment_delete_audit` AFTER DELETE ON `treatment` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'DELETE',
            CONCAT('DELETE on treatment: ', 
                OLD.treatment_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `treatmentapplication`
--

DROP TABLE IF EXISTS `treatmentapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatmentapplication` (
  `treatment_application_id` int NOT NULL AUTO_INCREMENT,
  `dosage` float DEFAULT NULL,
  `dosage_unit` varchar(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `treatment_id` int DEFAULT NULL,
  `medication_id` int DEFAULT NULL,
  `api_id` int DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `treatment_outcome` enum('Şifa','Kesim','Ölüm','Kesim/İmha') DEFAULT NULL,
  `visit_id` int DEFAULT NULL,
  `animal_id` int DEFAULT NULL,
  PRIMARY KEY (`treatment_application_id`),
  KEY `idx_treatmentapplication_treatment_id` (`treatment_id`),
  KEY `idx_treatmentapplication_medication_id` (`medication_id`),
  KEY `idx_treatmentapplication_api_id` (`api_id`),
  KEY `visit_id` (`visit_id`),
  KEY `fk_animal_id` (`animal_id`),
  CONSTRAINT `fk_animal_id` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `treatmentapplication_ibfk_1` FOREIGN KEY (`treatment_id`) REFERENCES `treatment` (`treatment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `treatmentapplication_ibfk_2` FOREIGN KEY (`medication_id`) REFERENCES `medication` (`medication_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `treatmentapplication_ibfk_3` FOREIGN KEY (`api_id`) REFERENCES `activepharmaceuticalingredient` (`api_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `treatmentapplication_ibfk_4` FOREIGN KEY (`visit_id`) REFERENCES `animalvisit` (`visit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatmentapplication`
--

LOCK TABLES `treatmentapplication` WRITE;
/*!40000 ALTER TABLE `treatmentapplication` DISABLE KEYS */;
INSERT INTO `treatmentapplication` VALUES (1,50,'ml',NULL,1,1,3,'2024-12-23','Şifa',1,1),(2,20,'mg',NULL,2,2,11,NULL,'Kesim',NULL,NULL),(3,30,'ml',NULL,3,3,15,NULL,'Ölüm',NULL,NULL),(4,40,'mg',NULL,4,4,9,NULL,'Kesim/İmha',NULL,NULL),(5,25,'ml',NULL,5,5,7,NULL,NULL,NULL,NULL),(6,15,'mg',NULL,6,6,5,NULL,NULL,NULL,NULL),(7,10,'ml',NULL,7,7,16,NULL,NULL,NULL,NULL),(8,5,'mg',NULL,8,8,13,NULL,NULL,NULL,NULL),(9,35,'ml',NULL,9,9,12,NULL,NULL,NULL,NULL),(10,60,'ml',NULL,10,10,2,NULL,NULL,NULL,NULL),(11,50,'ml','2024-12-20',8,6,7,'2024-12-30',NULL,NULL,NULL),(12,NULL,NULL,'2024-12-23',NULL,NULL,NULL,NULL,NULL,23,13),(13,NULL,NULL,'2024-12-23',NULL,NULL,NULL,NULL,NULL,24,13);
/*!40000 ALTER TABLE `treatmentapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_role_id` int DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `idx_user_user_role_id` (`user_role_id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`user_role_id`) REFERENCES `userrole` (`user_role_id`) ON DELETE CASCADE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `userrole` (`user_role_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','test',1,'Sistem','Yöneticisi');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `user_insert_audit` AFTER INSERT ON `user` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'INSERT',
            CONCAT('INSERT on user: ', 
                NEW.user_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `user_update_audit` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'UPDATE',
            CONCAT('UPDATE on user: ', 
                NEW.user_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `user_delete_audit` AFTER DELETE ON `user` FOR EACH ROW BEGIN
        INSERT INTO `auditlog` (`action_type`, `action_description`, `user_id`)
        VALUES (
            'DELETE',
            CONCAT('DELETE on user: ', 
                OLD.user_id
            ),
            @current_user_id
        );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userrole` (
  `user_role_id` int NOT NULL AUTO_INCREMENT,
  `user_role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `user_role_name` (`user_role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (1,'Sistem Yöneticisi'),(2,'Veteriner');
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinarian`
--

DROP TABLE IF EXISTS `veterinarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinarian` (
  `vet_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `farm_id` int DEFAULT NULL,
  `tc_no` varchar(11) NOT NULL,
  PRIMARY KEY (`vet_id`),
  UNIQUE KEY `tc_no` (`tc_no`),
  KEY `idx_veterinarian_farm_id` (`farm_id`),
  CONSTRAINT `veterinarian_ibfk_1` FOREIGN KEY (`farm_id`) REFERENCES `farm` (`farm_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinarian`
--

LOCK TABLES `veterinarian` WRITE;
/*!40000 ALTER TABLE `veterinarian` DISABLE KEYS */;
INSERT INTO `veterinarian` VALUES (1,'Ahmet','Yılmaz','2020-01-01',NULL,1,'12345678901'),(2,'Mehmet','Kaya','2021-05-10',NULL,2,'23456789012'),(3,'Ayşe','Demir','2019-08-15',NULL,3,'34567890123'),(4,'Fatma','Çelik','2018-03-20',NULL,4,'45678901234'),(5,'Ali','Şahin','2022-06-25',NULL,5,'56789012345'),(6,'Zeynep','Koç','2023-02-12',NULL,6,'67890123456'),(7,'Hüseyin','Arslan','2020-11-11',NULL,7,'78901234567'),(8,'Emine','Öztürk','2021-07-01',NULL,8,'89012345678'),(9,'Murat','Polat','2019-09-22',NULL,9,'90123456789'),(10,'Selin','Erdoğan','2022-01-15',NULL,10,'01234567890'),(11,'Berk','Aydın','2020-04-18',NULL,11,'11234567891'),(12,'Elif','Uçar','2023-10-05',NULL,12,'22345678912'),(13,'Cem','Karaca','2021-03-11',NULL,13,'33456789023'),(14,'Pelin','Doğan','2018-12-30',NULL,14,'44567890134'),(16,'Mehmet','Yılmaz',NULL,NULL,1,'12345674901'),(50,'Sistem','Yöneticisi','1998-07-24','2030-01-01',1,'00000000000');
/*!40000 ALTER TABLE `veterinarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ahcdbms'
--

--
-- Dumping routines for database 'ahcdbms'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddAnimalVisit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddAnimalVisit`(
    IN p_animal_id INT,
    IN p_visit_date DATE,
    IN p_veterinarian_id INT,
    IN p_diagnosis_id INT,
    IN p_notes TEXT,
    IN p_is_spreading BOOLEAN,
    IN p_is_critical BOOLEAN
)
BEGIN
    -- Değişken tanımlamaları bloğun en başında yapılır
    DECLARE animal_exists INT;

    -- Hata yönetimi için handler tanımlanıyor
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Hata durumunda işlem geri alınır
        ROLLBACK;
        SELECT 'An error occurred while adding the animal visit record.' AS ErrorMessage;
    END;

    -- İşlem başlatılıyor
    START TRANSACTION;

    -- animal_id kontrolü
    SELECT COUNT(*) INTO animal_exists
    FROM Animal
    WHERE animal_id = p_animal_id;

    IF animal_exists = 0 THEN
        -- Hayvan kimliği bulunamadığında hata sinyali gönderilir
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Hata: animal_id geçerli bir kayda işaret etmiyor.';
    ELSE
        -- Ziyaret kaydı ekleme
        INSERT INTO AnimalVisit (
            animal_id, 
            visit_date, 
            veterinarian_id, 
            diagnosis_id, 
            notes, 
            is_spreading, 
            is_critical
        )
        VALUES (
            p_animal_id, 
            p_visit_date, 
            p_veterinarian_id, 
            p_diagnosis_id, 
            p_notes, 
            p_is_spreading, 
            p_is_critical
        );

        -- Yeni eklenen kaydın ID'si döndürülür
        SELECT LAST_INSERT_ID() AS new_visit_id;
    END IF;

    -- İşlem başarılıysa tamamlanır
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddVeterinarian` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddVeterinarian`(
    IN p_name VARCHAR(100),
    IN p_last_name VARCHAR(100),
    IN p_farm_id INT,
    IN p_tc_no VARCHAR(11)
)
BEGIN
    INSERT INTO Veterinarian (name, last_name, farm_id, tc_no)
    VALUES (p_name, p_last_name, p_farm_id, p_tc_no);

    SELECT LAST_INSERT_ID() AS new_veterinarian_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EndTreatment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EndTreatment`(
    IN p_treatment_application_id INT,
    IN p_treatment_outcome VARCHAR(50)
)
BEGIN
    -- Tedavi bilgilerini günceller: bitiş tarihi ve sonuç
    UPDATE TreatmentApplication
    SET 
        end_date = CURRENT_DATE,
        treatment_outcome = p_treatment_outcome
    WHERE 
        treatment_application_id = p_treatment_application_id;

    -- Güncellenen satır sayısını döndürür
    SELECT ROW_COUNT() AS UpdatedRows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FilterCompletedTreatments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FilterCompletedTreatments`(
    IN p_kupe_numarasi VARCHAR(50),
    IN p_baslangic_tarih DATE,
    IN p_bitis_tarih DATE,
    IN p_teshis_adi VARCHAR(100),
    IN p_sonuc VARCHAR(50)
)
BEGIN
    SELECT 
        a.name AS Hayvan_Adi,
        a.tag_number AS Kupe_Numarasi,
        at.animal_type_name AS Hayvan_Turu,
        b.breed_name AS Hayvan_Cinsi,
        av.visit_date AS Ziyaret_Tarihi,
        ta.end_date AS Cikis_Tarihi,
        d.diagnosis_name AS Teshis_Adi,
        t.treatment_name AS Tedavi_Adi,
        av.notes AS Ziyaret_Notlari,
        ta.treatment_outcome AS Sonuc,
        v.name AS Veteriner_Adi,
        v.last_name AS Veteriner_Soyadi
    FROM 
        TreatmentApplication ta
    INNER JOIN 
        Treatment t ON ta.treatment_id = t.treatment_id
    INNER JOIN 
        AnimalVisit av ON ta.visit_id = av.visit_id
    INNER JOIN 
        Animal a ON av.animal_id = a.animal_id
    INNER JOIN 
        AnimalType at ON a.animal_type_id = at.animal_type_id
    INNER JOIN 
        Breed b ON a.breed_id = b.breed_id
    INNER JOIN 
        Diagnosis d ON av.diagnosis_id = d.diagnosis_id
    INNER JOIN 
        Veterinarian v ON av.veterinarian_id = v.vet_id
    WHERE 
        ta.end_date IS NOT NULL
        AND (a.tag_number = p_kupe_numarasi OR p_kupe_numarasi IS NULL)
        AND (av.visit_date BETWEEN p_baslangic_tarih AND p_bitis_tarih OR p_baslangic_tarih IS NULL OR p_bitis_tarih IS NULL)
        AND (d.diagnosis_name = p_teshis_adi OR p_teshis_adi IS NULL)
        AND (ta.treatment_outcome = p_sonuc OR p_sonuc IS NULL)
    ORDER BY 
        av.visit_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAnimalHealthHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAnimalHealthHistory`(
    IN p_animal_id INT
)
BEGIN
    SELECT 
        a.name AS Hayvan_Adi,
        av.visit_date AS Ziyaret_Tarihi,
        d.diagnosis_name AS Teshis,
        t.treatment_name AS Tedavi,
        av.notes AS Ziyaret_Notlari
    FROM 
        Animal a
    INNER JOIN 
        AnimalVisit av ON a.animal_id = av.animal_id
    LEFT JOIN 
        Diagnosis d ON av.diagnosis_id = d.diagnosis_id
    LEFT JOIN 
        TreatmentApplication ta ON av.visit_id = ta.treatment_id -- Hatalı sütun kontrol ediliyor
    LEFT JOIN 
        Treatment t ON ta.treatment_id = t.treatment_id
    WHERE 
        a.animal_id = p_animal_id
    ORDER BY 
        av.visit_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAnimalReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAnimalReport`()
BEGIN
    SELECT 
        IFNULL(f.farm_name, 'Tüm Çiftlikler') AS Ciftlik_Adi,
        COUNT(a.animal_id) AS Toplam_Hayvan,
        ROUND(SUM(av.is_critical) / COUNT(a.animal_id) * 100, 2) AS Kritik_Durum_Yuzdesi,
        ROUND(AVG(DATEDIFF(CURDATE(), a.birth_date) / 365), 2) AS Yas_Ortalamasi,
        ROUND(SUM(CASE WHEN av.is_critical = 1 THEN 1 ELSE 0 END) / COUNT(a.animal_id) * 100, 2) AS Kritik_Durum_Orani
    FROM 
        animal a
    LEFT JOIN 
        animalvisit av ON a.animal_id = av.animal_id
    LEFT JOIN 
        farm f ON a.farm_id = f.farm_id
    GROUP BY 
        f.farm_name WITH ROLLUP;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCompletedTreatments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCompletedTreatments`()
BEGIN
    SELECT 
        a.name AS Hayvan_Adi,
        t.treatment_name AS Tedavi_Adi,
        ta.dosage AS Uygulanan_Doza,
        ta.end_date AS Tedavi_Bitis_Tarihi
    FROM 
        Animal a
    INNER JOIN 
        AnimalVisit av ON a.animal_id = av.animal_id
    INNER JOIN 
        TreatmentApplication ta ON ta.treatment_id = av.diagnosis_id -- Sütun ilişkilendirmesi kontrol ediliyor
    INNER JOIN 
        Treatment t ON ta.treatment_id = t.treatment_id
    WHERE 
        ta.end_date IS NOT NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCompletedTreatmentsByDateRange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCompletedTreatmentsByDateRange`(
    IN p_start_date DATE,
    IN p_end_date DATE
)
BEGIN
    SELECT 
        a.name AS Hayvan_Adi,
        t.treatment_name AS Tedavi_Adi,
        ta.dosage AS Uygulanan_Doz,
        ta.end_date AS Tedavi_Bitis_Tarihi,
        av.visit_date AS Tedavi_Baslama_Tarihi
    FROM 
        Animal a
    INNER JOIN 
        AnimalVisit av ON a.animal_id = av.animal_id
    INNER JOIN 
        TreatmentApplication ta ON ta.treatment_id = av.diagnosis_id -- İlişkilendirme kontrolü
    INNER JOIN 
        Treatment t ON ta.treatment_id = t.treatment_id
    WHERE 
        ta.end_date IS NOT NULL
        AND av.visit_date BETWEEN p_start_date AND p_end_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDeletedAnimalReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDeletedAnimalReport`()
BEGIN
    SELECT 
        animal_id AS Hayvan_ID,
        name AS Hayvan_Adi,
        animal_type AS Hayvan_Turu,
        tag_number AS Kupe_Numarasi,
        deleted_at AS Silinme_Tarihi
    FROM 
        DeletedAnimals
    ORDER BY 
        deleted_at DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDiagnosisFrequency` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDiagnosisFrequency`()
BEGIN
    SELECT 
        d.diagnosis_name AS Teshis_Adi,
        COUNT(av.diagnosis_id) AS Teshis_Sayisi,
        ROUND(COUNT(av.diagnosis_id) * 100.0 / (SELECT COUNT(*) FROM AnimalVisit WHERE diagnosis_id IS NOT NULL), 2) AS Yuzde
    FROM 
        AnimalVisit av
    INNER JOIN 
        Diagnosis d ON av.diagnosis_id = d.diagnosis_id
    GROUP BY 
        d.diagnosis_name
    ORDER BY 
        Teshis_Sayisi DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetVeterinarianPerformanceWithSuccessRate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetVeterinarianPerformanceWithSuccessRate`()
BEGIN
    SELECT 
        v.vet_id AS Veteriner_ID,
        v.name AS Veteriner_Adi,
        v.last_name AS Veteriner_Soyadi,
        COUNT(av.visit_id) AS Toplam_Ziyaret,
        COUNT(CASE WHEN av.is_critical = 1 THEN 1 END) AS Kritik_Tedavi_Sayisi,
        COUNT(CASE WHEN ta.end_date IS NOT NULL THEN 1 END) AS Tamamlanan_Tedavi_Sayisi,
        IFNULL(ROUND((COUNT(CASE WHEN ta.end_date IS NOT NULL THEN 1 END) / COUNT(av.visit_id)) * 100, 2), 0) AS Basari_Orani
    FROM 
        Veterinarian v
    INNER JOIN 
        AnimalVisit av ON v.vet_id = av.veterinarian_id
    LEFT JOIN 
        TreatmentApplication ta ON av.visit_id = ta.visit_id
    GROUP BY 
        v.vet_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetVisitsByDateRange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetVisitsByDateRange`(
    IN p_start_date DATE,
    IN p_end_date DATE
)
BEGIN
    SELECT 
        av.visit_date AS Ziyaret_Tarihi,
        a.name AS Hayvan_Adi,
        v.name AS Veteriner_Adi,
        v.last_name AS Veteriner_Soyadi,
        d.diagnosis_name AS Teshis_Adi,
        av.notes AS Ziyaret_Notlari
    FROM 
        AnimalVisit av
    INNER JOIN 
        Animal a ON av.animal_id = a.animal_id
    INNER JOIN 
        Veterinarian v ON av.veterinarian_id = v.vet_id
    LEFT JOIN 
        Diagnosis d ON av.diagnosis_id = d.diagnosis_id
    WHERE 
        av.visit_date BETWEEN p_start_date AND p_end_date
    ORDER BY 
        av.visit_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
SET FOREIGN_KEY_CHECKS=1;

-- Dump completed on 2024-12-24  3:28:07
