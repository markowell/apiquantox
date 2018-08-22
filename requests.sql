-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 22, 2018 at 09:27 AM
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
  `id` int(11) NOT NULL,
  `event` enum('VIEW','PLAY','CLICK') DEFAULT 'VIEW',
  `country` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `counter` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `event`, `country`, `date`, `counter`) VALUES
(4, 'PLAY', 'us', '2018-08-21 00:00:00', 7),
(5, 'CLICK', 'us', '2018-08-22 00:00:00', 2),
(6, 'CLICK', 'ca', '2018-08-22 00:00:00', 0),
(7, 'CLICK', 'sr', '2018-08-22 00:00:00', 1),
(8, 'CLICK', 'tr', '2018-08-22 00:00:00', 5),
(9, 'VIEW', 'tr', '2018-08-22 00:00:00', 11),
(10, 'PLAY', 'us', '2018-08-20 00:00:00', 7),
(11, 'VIEW', 'sr', '2018-08-22 00:00:00', 17),
(12, 'VIEW', 'ch', '2018-08-22 00:00:00', 26),
(13, 'VIEW', 'aut', '2018-08-22 00:00:00', 10),
(14, 'CLICK', 'aut', '2018-08-22 00:00:00', 6),
(15, 'PLAY', 'aut', '2018-08-22 00:00:00', 21),
(16, 'PLAY', 'uk', '2018-08-22 00:00:00', 36),
(17, 'VIEW', 'uk', '2018-08-22 00:00:00', 1),
(18, 'CLICK', 'uk', '2018-08-22 00:00:00', 1),
(19, 'VIEW', 'ch', '2018-08-17 00:00:00', 26),
(20, 'PLAY', 'ch', '2018-08-22 00:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
