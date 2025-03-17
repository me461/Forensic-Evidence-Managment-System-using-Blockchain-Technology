/*
SQLyog Community Edition- MySQL GUI v7.15 
MySQL - 5.5.29 : Database - forensic_evidence
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`forensic_evidence` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `forensic_evidence`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`username`,`password`) values ('admin','admin');

/*Table structure for table `crime` */

DROP TABLE IF EXISTS `crime`;

CREATE TABLE `crime` (
  `fir` varchar(100) DEFAULT NULL,
  `inf` text,
  `bccode` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `crime` */

/*Table structure for table `crime_invesigation` */

DROP TABLE IF EXISTS `crime_invesigation`;

CREATE TABLE `crime_invesigation` (
  `fir` varchar(100) DEFAULT NULL,
  `evidence` text,
  `bccode` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `crime_invesigation` */

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `doctor` */

/*Table structure for table `doctor_report` */

DROP TABLE IF EXISTS `doctor_report`;

CREATE TABLE `doctor_report` (
  `fir` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `description` text,
  `bccode` int(100) DEFAULT NULL,
  `examination` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `doctor_report` */

/*Table structure for table `fir` */

DROP TABLE IF EXISTS `fir`;

CREATE TABLE `fir` (
  `fir` varchar(100) DEFAULT NULL,
  `location` text,
  `desc` text,
  `bccode` int(100) DEFAULT NULL,
  `psid` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fir` */

/*Table structure for table `forensic` */

DROP TABLE IF EXISTS `forensic`;

CREATE TABLE `forensic` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `password` varchar(100) DEFAULT NULL,
  `labname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `forensic` */

/*Table structure for table `frreport` */

DROP TABLE IF EXISTS `frreport`;

CREATE TABLE `frreport` (
  `fir` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `description` text,
  `bccode` int(100) DEFAULT NULL,
  `report` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `frreport` */

/*Table structure for table `labreport` */

DROP TABLE IF EXISTS `labreport`;

CREATE TABLE `labreport` (
  `fir` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `description` text,
  `bccode` int(100) DEFAULT NULL,
  `labreport` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `labreport` */

/*Table structure for table `official` */

DROP TABLE IF EXISTS `official`;

CREATE TABLE `official` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `password` varchar(100) DEFAULT NULL,
  `userid` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `official` */

/*Table structure for table `pathology` */

DROP TABLE IF EXISTS `pathology`;

CREATE TABLE `pathology` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `password` varchar(100) DEFAULT NULL,
  `userid` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `pathology` */

/*Table structure for table `police` */

DROP TABLE IF EXISTS `police`;

CREATE TABLE `police` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `password` varchar(100) DEFAULT NULL,
  `psid` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `police` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
