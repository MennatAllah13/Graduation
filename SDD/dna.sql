-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2021 at 03:10 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dna`
--

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `result_id` int(11) NOT NULL,
  `sample_id` int(11) NOT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `result_id`, `sample_id`, `comment`, `date`) VALUES
(1, 1, 1, NULL, '2020-12-02');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sample_id` int(11) NOT NULL,
  `result` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `user_id`, `sample_id`, `result`) VALUES
(1, 3, 1, 'control');

-- --------------------------------------------------------

--
-- Table structure for table `sample`
--

CREATE TABLE `sample` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `PHV_status` varchar(10) NOT NULL,
  `PPARA` varchar(2) NOT NULL,
  `NOS3` varchar(2) NOT NULL,
  `COL1A1` varchar(2) NOT NULL,
  `VDR` varchar(2) NOT NULL,
  `ACTN3` varchar(2) NOT NULL,
  `BDNF` varchar(2) NOT NULL,
  `COL5A1` varchar(2) NOT NULL,
  `COL2A1` varchar(2) NOT NULL,
  `AMPD1` varchar(2) NOT NULL,
  `AGT` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sample`
--

INSERT INTO `sample` (`id`, `client_id`, `PHV_status`, `PPARA`, `NOS3`, `COL1A1`, `VDR`, `ACTN3`, `BDNF`, `COL5A1`, `COL2A1`, `AMPD1`, `AGT`) VALUES
(1, 1, '', '', '', '', '', '', '', '', '', '', ''),
(22, 3, 'Post-PHV', 'CG', 'CT', 'CC', 'GG', 'RR', 'CC', 'CT', 'CC', 'GA', 'GA'),
(23, 13, 'Post-PHV', 'CG', 'CT', 'CC', 'GG', 'RR', 'CC', 'CT', 'CC', 'GA', 'GA');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `usertype_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `email`, `phone`, `usertype_id`) VALUES
(1, 'Mennat Allah', '123', '', '01256879435', 1),
(2, 'Donya', '456', '', '01472583695', 2),
(3, 'Ahmed', '852', '', '01579348150', 3),
(13, 'Omar', '789', 'omar@gmail.com', '01234567892', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `type`) VALUES
(1, 'Admin'),
(2, 'Doctor'),
(3, 'Client');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `result_id` (`result_id`),
  ADD KEY `sample_id` (`sample_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sample_id` (`sample_id`);

--
-- Indexes for table `sample`
--
ALTER TABLE `sample`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_id` (`client_id`),
  ADD KEY `client_id_2` (`client_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usertype_id` (`usertype_id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sample`
--
ALTER TABLE `sample`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5908;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`result_id`) REFERENCES `result` (`id`),
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`);

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`);

--
-- Constraints for table `sample`
--
ALTER TABLE `sample`
  ADD CONSTRAINT `sample_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`usertype_id`) REFERENCES `user_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
