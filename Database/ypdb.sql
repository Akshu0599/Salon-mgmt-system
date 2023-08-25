-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 13, 2020 at 08:37 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ypdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

DROP TABLE IF EXISTS `tbladmin`;
CREATE TABLE IF NOT EXISTS `tbladmin` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `AdminName` char(50) DEFAULT NULL,
  `UserName` char(50) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Admin', 'admin', 7040906595, 'harshadbora162@gmail.com', 'cdb42af1255c917bf9a6508d62d63982', '2019-07-25 06:21:50');

-- --------------------------------------------------------

--
-- Table structure for table `tblappointment`
--

DROP TABLE IF EXISTS `tblappointment`;
CREATE TABLE IF NOT EXISTS `tblappointment` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `AptNumber` varchar(80) DEFAULT NULL,
  `Name` varchar(120) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `PhoneNumber` bigint(11) DEFAULT NULL,
  `AptDate` varchar(120) DEFAULT NULL,
  `AptTime` varchar(120) DEFAULT NULL,
  `ApplyDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Remark` varchar(250) NOT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblappointment`
--

INSERT INTO `tblappointment` (`ID`, `AptNumber`, `Name`, `Email`, `PhoneNumber`, `AptDate`, `AptTime`, `ApplyDate`, `Remark`, `Status`) VALUES
(31, '321522468', 'harshad', 'harshad@gmail.com', 7040906595, '3/25/2020', '7:00am', '2020-03-09 07:56:42', 'Rejected Due To Load', '2'),
(32, '285445420', 'prit', 'prit@gmail.com', 9890554678, '3/19/2020', '8:00am', '2020-03-09 07:58:19', 'Accepted', '1'),
(33, '511758208', 'Rupali ', 'Rupali@gmail.com', 9890554678, '3/13/2020', '1:30am', '2020-03-09 11:02:36', '', ''),
(34, '260802872', 'Akanksha', 'akanksha@gmail.com', 9890554678, '3/19/2020', '11:00am', '2020-03-09 11:17:53', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblappointmentdetails`
--

DROP TABLE IF EXISTS `tblappointmentdetails`;
CREATE TABLE IF NOT EXISTS `tblappointmentdetails` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `aid` int(10) NOT NULL,
  `sid` int(10) NOT NULL,
  PRIMARY KEY (`aid`,`sid`),
  KEY `id` (`id`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblappointmentdetails`
--

INSERT INTO `tblappointmentdetails` (`id`, `aid`, `sid`) VALUES
(11, 222671668, 18),
(12, 222671668, 19),
(13, 321522468, 17),
(14, 321522468, 19),
(15, 321522468, 20),
(16, 285445420, 21),
(17, 511758208, 17),
(18, 511758208, 19),
(19, 511758208, 21),
(20, 260802872, 18),
(21, 260802872, 19),
(22, 260802872, 20);

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomers`
--

DROP TABLE IF EXISTS `tblcustomers`;
CREATE TABLE IF NOT EXISTS `tblcustomers` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(120) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Gender` enum('Female','Male','Transgender') DEFAULT NULL,
  `Details` mediumtext,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcustomers`
--

INSERT INTO `tblcustomers` (`ID`, `Name`, `Email`, `MobileNumber`, `Gender`, `Details`, `CreationDate`, `UpdationDate`) VALUES
(8, 'Snehal Ahirrao', 'snehal@gmail.com', 7895487820, 'Female', 'Good Customer!', '2020-03-05 18:44:30', '2020-03-06 05:37:46'),
(9, 'Shruta', 'shruta@gmail.com', 7895487820, 'Female', 'good', '2020-03-07 10:12:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblinvoice`
--

DROP TABLE IF EXISTS `tblinvoice`;
CREATE TABLE IF NOT EXISTS `tblinvoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Userid` int(11) DEFAULT NULL,
  `ServiceId` int(11) DEFAULT NULL,
  `BillingId` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblinvoice`
--

INSERT INTO `tblinvoice` (`id`, `Userid`, `ServiceId`, `BillingId`, `PostingDate`) VALUES
(22, 8, 17, 755028541, '2020-03-05 18:45:05'),
(23, 8, 17, 900785449, '2020-03-06 05:38:19'),
(24, 8, 18, 340531399, '2020-03-07 06:35:42'),
(25, 8, 19, 340531399, '2020-03-07 06:35:42'),
(26, 8, 20, 340531399, '2020-03-07 06:35:42'),
(27, 8, 17, 864181940, '2020-03-07 06:52:10'),
(28, 8, 19, 864181940, '2020-03-07 06:52:10'),
(29, 8, 21, 864181940, '2020-03-07 06:52:10'),
(30, 8, 18, 876029842, '2020-03-07 08:43:53'),
(31, 8, 19, 876029842, '2020-03-07 08:43:53'),
(32, 9, 17, 515549008, '2020-03-07 10:12:54'),
(33, 9, 18, 515549008, '2020-03-07 10:12:54'),
(34, 9, 19, 515549008, '2020-03-07 10:12:54'),
(35, 8, 18, 915733228, '2020-03-07 12:22:41'),
(36, 8, 19, 915733228, '2020-03-07 12:22:41'),
(37, 8, 18, 866139013, '2020-03-07 20:27:56'),
(38, 8, 20, 866139013, '2020-03-07 20:27:56'),
(39, 9, 18, 354578482, '2020-03-07 20:28:19'),
(40, 9, 19, 354578482, '2020-03-07 20:28:19'),
(41, 9, 18, 202307341, '2020-03-07 20:29:36'),
(42, 9, 19, 202307341, '2020-03-07 20:29:36'),
(43, 9, 20, 202307341, '2020-03-07 20:29:36'),
(44, 9, 18, 296086101, '2020-03-07 20:30:04'),
(45, 9, 19, 296086101, '2020-03-07 20:30:04'),
(46, 9, 20, 296086101, '2020-03-07 20:30:04'),
(47, 8, 18, 519542339, '2020-03-08 17:58:01'),
(48, 8, 19, 519542339, '2020-03-08 17:58:01'),
(49, 9, 17, 683480684, '2020-03-09 11:19:26'),
(50, 9, 19, 683480684, '2020-03-09 11:19:26'),
(51, 9, 20, 683480684, '2020-03-09 11:19:26');

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

DROP TABLE IF EXISTS `tblpage`;
CREATE TABLE IF NOT EXISTS `tblpage` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext,
  `PageDescription` mediumtext,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` date DEFAULT NULL,
  `Timing` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblservices`
--

DROP TABLE IF EXISTS `tblservices`;
CREATE TABLE IF NOT EXISTS `tblservices` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ServiceName` varchar(200) DEFAULT NULL,
  `Cost` int(10) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblservices`
--

INSERT INTO `tblservices` (`ID`, `ServiceName`, `Cost`, `CreationDate`) VALUES
(17, 'Fruit Facial', 500, '2020-03-05 18:43:47'),
(18, 'Hair Cut', 300, '2020-03-07 06:24:12'),
(19, 'Hair color', 500, '2020-03-07 06:24:45'),
(20, 'Hair styling', 500, '2020-03-07 06:25:05'),
(21, 'Hair Treatments', 1300, '2020-03-07 06:25:40');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
