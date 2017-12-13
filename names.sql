-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2017 at 08:59 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `names`
--

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `ID` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Fullname` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Age` int(11) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`ID`, `Username`, `Fullname`, `Location`, `Age`, `Password`, `Modified`, `Created`) VALUES
(1, 'jack0872', 'Jack Jensen', 'Herning', 19, '$2y$10$jzm4jJHqtdaYxBnER0/iju94P3CBiQ5s8itJCULm6to/wSMS20ytC', '2017-12-08 11:00:17', '2017-12-08 11:00:17');

-- --------------------------------------------------------

--
-- Table structure for table `statusupdate`
--

CREATE TABLE `statusupdate` (
  `PostID` int(11) NOT NULL,
  `StatusUpdate` varchar(255) NOT NULL,
  `Modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statusupdate`
--

INSERT INTO `statusupdate` (`PostID`, `StatusUpdate`, `Modified`, `Created`, `ID`) VALUES
(1, '10/10', '2017-12-08 11:01:01', '2017-12-08 11:01:01', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `statusupdate`
--
ALTER TABLE `statusupdate`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PostID` (`PostID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `statusupdate`
--
ALTER TABLE `statusupdate`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `statusupdate`
--
ALTER TABLE `statusupdate`
  ADD CONSTRAINT `statusupdate_ibfk_1` FOREIGN KEY (`PostID`) REFERENCES `people` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
