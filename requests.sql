-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 22, 2018 at 02:16 PM
-- Server version: 5.7.9
-- PHP Version: 7.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_quantox`
--

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `event` enum('VIEW','PLAY','CLICK') NOT NULL DEFAULT 'VIEW',
  `country` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `counter` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`event`, `country`, `date`, `counter`) VALUES
('VIEW', 'aut', '2018-08-22 00:00:00', 10),
('VIEW', 'ch', '2018-08-17 00:00:00', 26),
('VIEW', 'ch', '2018-08-22 00:00:00', 26),
('VIEW', 'sr', '2018-08-22 00:00:00', 17),
('VIEW', 'tr', '2018-08-22 00:00:00', 11),
('VIEW', 'uk', '2018-08-22 00:00:00', 1),
('PLAY', 'aut', '2018-08-22 00:00:00', 21),
('PLAY', 'ch', '2018-08-22 00:00:00', 1),
('PLAY', 'uk', '2018-08-22 00:00:00', 36),
('PLAY', 'us', '2018-08-20 00:00:00', 7),
('PLAY', 'us', '2018-08-21 00:00:00', 7),
('CLICK', 'aut', '2018-08-22 00:00:00', 6),
('CLICK', 'ca', '2018-08-22 00:00:00', 0),
('CLICK', 'sr', '2018-08-22 00:00:00', 1),
('CLICK', 'tr', '2018-08-22 00:00:00', 5),
('CLICK', 'uk', '2018-08-22 00:00:00', 1),
('CLICK', 'us', '2018-08-22 00:00:00', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`event`,`country`,`date`),
  ADD KEY `event` (`event`,`country`,`date`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
