# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.38)
# Database: euclid
# Generation Time: 2015-03-22 19:24:54 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table assignment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assignment`;

CREATE TABLE `assignment` (
  `assignment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `due_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `weight` float NOT NULL,
  `description` text NOT NULL,
  `max_points` int(11) NOT NULL,
  `course_id` varchar(8) NOT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `assignment_course_id` (`course_id`),
  CONSTRAINT `assignment_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`listing`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;

INSERT INTO `assignment` (`assignment_id`, `due_date`, `name`, `weight`, `description`, `max_points`, `course_id`)
VALUES
	(1,'2015-04-01 23:59:58','Default MySQL ports',0.5,'A 1000 word essay on default MySQL ports and the importance of web standards.',100,'COMP3306'),
	(5,'2015-03-25 23:59:58','Enterprising Java Class Names',0.7,'Create 20 Enterprised java class names. No justification for naming scheme required.',20,'INFO1234'),
	(8,'2015-04-20 23:59:58','Telekinesis Assignment 1',0.05,'Discuss with a random stranger on an 8:56AM bus departing from a rural area the necessities of telekinetic sports in modern society.',5,'WPTK4000'),
	(9,'2015-03-20 23:59:58','Dolphin Language Meditation',1,'Meditate on dolhpin sign language. ',200,'DLSL8000'),
	(10,'2015-03-18 23:59:58','Essay 1',0.05,'In a 500 word essay, discuss the need for better staff room organization and why greek philosphers shouldn\'t just eat the sandwiches I left in the fridge.',50,'CLSC1300'),
	(11,'2015-01-11 23:59:58','The impact of bean sprouts in the late 1740\'s',0.6,'Write a 5600 word lab report on the impact that late 1740\'s subtropical bean sprouts have on our modern society.',600,'HSVT1740'),
	(12,'2015-05-12 23:59:58','How to talk about money',0.2,'Discuss funding issues with a low-level government official. ',1,'COMR3456');

/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `listing` varchar(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `teacher` int(10) unsigned NOT NULL,
  PRIMARY KEY (`listing`),
  KEY `course_teacher` (`teacher`),
  CONSTRAINT `course_teacher` FOREIGN KEY (`teacher`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;

INSERT INTO `course` (`listing`, `name`, `teacher`)
VALUES
	('BSKT1000','Introduction to basket weaving',2),
	('CLSC1300','Introduction to the great greek thinkers',4),
	('COMP3306','Introduction to MYSQL ports.',6),
	('COMR3456','Advanced Pyramid Schemes',3),
	('COMR4343','What they don\'t teach you in Harvard Business School',3),
	('DLSL1000','Introduction to dolphin sign language',1),
	('DLSL1678','Dolphin sign language as a practical courtroom language',4),
	('DLSL2104','Dolphin sign language as a business application',3),
	('DLSL4632','Advanced dolphin Pod linguistic structures',1),
	('DLSL8000','Transcending reality through dolphin sign language',1),
	('HSVT1732','The year 1732: a horticultural overview',5),
	('HSVT1740','Subtropical bean sprouts in in the late 1740\'s',5),
	('INFO1234','Advanced java class naming',6),
	('WPTK1010','Key concepts in telekinesis',7),
	('WPTK4000','Advanced pyshco-aquatic strategem selection',7);

/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table enrolled
# ------------------------------------------------------------

DROP TABLE IF EXISTS `enrolled`;

CREATE TABLE `enrolled` (
  `student_id` int(10) unsigned NOT NULL,
  `course_id` varchar(255) NOT NULL,
  PRIMARY KEY (`student_id`,`course_id`),
  KEY `enrolled_course_id` (`course_id`),
  CONSTRAINT `enrolled_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`listing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `enrolled_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `enrolled` WRITE;
/*!40000 ALTER TABLE `enrolled` DISABLE KEYS */;

INSERT INTO `enrolled` (`student_id`, `course_id`)
VALUES
	(10,'BSKT1000'),
	(13,'CLSC1300'),
	(1,'COMP3306'),
	(2,'COMP3306'),
	(3,'COMP3306'),
	(4,'COMP3306'),
	(8,'COMR3456'),
	(14,'COMR3456'),
	(9,'DLSL1000'),
	(11,'DLSL1678'),
	(7,'DLSL2104'),
	(1,'DLSL4632'),
	(9,'DLSL8000'),
	(10,'DLSL8000'),
	(11,'DLSL8000'),
	(5,'HSVT1740'),
	(15,'HSVT1740'),
	(2,'INFO1234'),
	(12,'INFO1234'),
	(6,'WPTK4000');

/*!40000 ALTER TABLE `enrolled` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `group`;

CREATE TABLE `group` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;

INSERT INTO `group` (`group_id`)
VALUES
	(1),
	(2),
	(3),
	(4),
	(5);

/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table group_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `group_member`;

CREATE TABLE `group_member` (
  `group_id` int(10) unsigned NOT NULL,
  `student_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`student_id`),
  KEY `group_member_student_id` (`student_id`),
  CONSTRAINT `group_member_group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `group_member_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `group_member` WRITE;
/*!40000 ALTER TABLE `group_member` DISABLE KEYS */;

INSERT INTO `group_member` (`group_id`, `student_id`)
VALUES
	(1,1),
	(1,2),
	(1,3),
	(1,4),
	(4,5),
	(3,6),
	(5,8),
	(2,9),
	(2,10),
	(2,11),
	(4,15);

/*!40000 ALTER TABLE `group_member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table student
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `student_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `major` varchar(255) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;

INSERT INTO `student` (`student_id`, `name`, `email`, `major`)
VALUES
	(1,'Aaron Hourie','aaron@email.com','Computer Science'),
	(2,'Bray Schurman','bray@email.com','Informatics'),
	(3,'Nick MacDonald','nick@email.com','Computer Science'),
	(4,'Sam Doiron','sam@email.com','Computer Science'),
	(5,'John Doe','john@email.com','18th Century Horticulture'),
	(6,'Jane Doe','jane@email.com','Advanced Telekinetic Water Polo'),
	(7,'Alistair Smith','alistair@email.com','Dolphin Sign Language'),
	(8,'Sven Arnbjorn','sven@email.com','Commerce'),
	(9,'Newton Smith','newton@email.com','Dolphin Sign Language'),
	(10,'Robert Boblaw','robert@email.com','Dolphin Sign Language'),
	(11,'Amir Jader','amir@email.com','Dolphin Sign Language'),
	(12,'Rick Astley','rick@email.com','Computer Science'),
	(13,'Randy Savage','randy@email.com','Classics'),
	(14,'Allison Smith','allison@email.com','Commerce'),
	(15,'Angus Young','angus@email.com','18th Century Horticulture');

/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table submission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `submission`;

CREATE TABLE `submission` (
  `assignment_id` int(10) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  `date_submitted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `grade` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  PRIMARY KEY (`group_id`,`assignment_id`),
  KEY `submission_assignment_id` (`assignment_id`),
  CONSTRAINT `submission_assignment_id` FOREIGN KEY (`assignment_id`) REFERENCES `assignment` (`assignment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `submission_group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `submission` WRITE;
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;

INSERT INTO `submission` (`assignment_id`, `group_id`, `date_submitted`, `grade`, `file_path`, `comments`)
VALUES
	(1,1,'2015-03-20 19:27:55',100,'path/to/file.extension','Excellent job!'),
	(1,2,'2015-03-22 13:24:12',80,'xx','xx'),
	(9,2,'2034-03-21 18:21:56',159,'path/to/file.extension','You have become one with the universe. I have taught all I know.'),
	(1,3,'2015-03-22 13:25:16',85,'xx','xx'),
	(8,3,'2015-03-20 19:29:12',4,'path/to/file.extension','The stranger\'s views were shallow and pedantic, but your defense was satisfactory.'),
	(1,4,'2015-03-22 13:25:26',72,'xx','xx'),
	(11,4,'2015-03-10 14:32:15',230,'path/to/file.extension','You failed to discuss how bean sprouts effect the evolution of roads in the republic of congo and therefore missed almost the entire point of the lab.'),
	(12,5,'2015-03-20 19:35:21',1,'path/to/file.extension','Masterfully spoken.');

/*!40000 ALTER TABLE `submission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table teacher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `teacher_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;

INSERT INTO `teacher` (`teacher_id`, `email`, `name`)
VALUES
	(1,'euclid@email.edu','Euclid of Alexandria'),
	(2,'plato@email.edu\r\n','Plato'),
	(3,'aristotle@email.edu','Aristotle'),
	(4,'confucius@email.edu','Confucius'),
	(5,'socrates@email.edu','Socrates\r\n'),
	(6,'pythagoras@email.edu','Pythagoras'),
	(7,'isaac@email.edu','Sir Isaac Newton');

/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
