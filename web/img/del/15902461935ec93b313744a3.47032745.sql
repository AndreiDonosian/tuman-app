-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2019 at 10:09 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adam_eva`
--

-- --------------------------------------------------------

--
-- Table structure for table `decese`
--

CREATE TABLE `decese` (
  `tip_deces` varchar(50) DEFAULT NULL,
  `id_viata` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iubita`
--

CREATE TABLE `iubita` (
  `id_iubita` int(11) NOT NULL,
  `nume` varchar(30) DEFAULT NULL,
  `id_viata` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `locatia`
--

CREATE TABLE `locatia` (
  `id_loc` int(11) NOT NULL,
  `nume_loc` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `locul_intanirii`
--

CREATE TABLE `locul_intanirii` (
  `nume_loc` varchar(50) DEFAULT NULL,
  `id_iubita` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `perioada_ist`
--

CREATE TABLE `perioada_ist` (
  `id_perioada` int(11) NOT NULL,
  `prioada` varchar(50) DEFAULT NULL,
  `id_loc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pers_implicate`
--

CREATE TABLE `pers_implicate` (
  `id_pers` int(11) NOT NULL,
  `nume` varchar(30) DEFAULT NULL,
  `ocupatia` varchar(50) DEFAULT NULL,
  `id_perioada` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vieti`
--

CREATE TABLE `vieti` (
  `id_viata` int(11) NOT NULL,
  `nume` varchar(30) DEFAULT NULL,
  `ocupatia` varchar(50) DEFAULT NULL,
  `id_perioada` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `decese`
--
ALTER TABLE `decese`
  ADD KEY `id_viata` (`id_viata`);

--
-- Indexes for table `iubita`
--
ALTER TABLE `iubita`
  ADD PRIMARY KEY (`id_iubita`),
  ADD KEY `id_viata` (`id_viata`);

--
-- Indexes for table `locatia`
--
ALTER TABLE `locatia`
  ADD PRIMARY KEY (`id_loc`);

--
-- Indexes for table `locul_intanirii`
--
ALTER TABLE `locul_intanirii`
  ADD KEY `id_iubita` (`id_iubita`);

--
-- Indexes for table `perioada_ist`
--
ALTER TABLE `perioada_ist`
  ADD PRIMARY KEY (`id_perioada`),
  ADD KEY `id_loc` (`id_loc`);

--
-- Indexes for table `pers_implicate`
--
ALTER TABLE `pers_implicate`
  ADD PRIMARY KEY (`id_pers`),
  ADD KEY `id_perioada` (`id_perioada`);

--
-- Indexes for table `vieti`
--
ALTER TABLE `vieti`
  ADD PRIMARY KEY (`id_viata`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `iubita`
--
ALTER TABLE `iubita`
  MODIFY `id_iubita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locatia`
--
ALTER TABLE `locatia`
  MODIFY `id_loc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perioada_ist`
--
ALTER TABLE `perioada_ist`
  MODIFY `id_perioada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pers_implicate`
--
ALTER TABLE `pers_implicate`
  MODIFY `id_pers` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vieti`
--
ALTER TABLE `vieti`
  MODIFY `id_viata` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `decese`
--
ALTER TABLE `decese`
  ADD CONSTRAINT `decese_ibfk_1` FOREIGN KEY (`id_viata`) REFERENCES `vieti` (`id_viata`);

--
-- Constraints for table `iubita`
--
ALTER TABLE `iubita`
  ADD CONSTRAINT `iubita_ibfk_1` FOREIGN KEY (`id_viata`) REFERENCES `vieti` (`id_viata`);

--
-- Constraints for table `locul_intanirii`
--
ALTER TABLE `locul_intanirii`
  ADD CONSTRAINT `locul_intanirii_ibfk_1` FOREIGN KEY (`id_iubita`) REFERENCES `iubita` (`id_iubita`);

--
-- Constraints for table `perioada_ist`
--
ALTER TABLE `perioada_ist`
  ADD CONSTRAINT `perioada_ist_ibfk_1` FOREIGN KEY (`id_loc`) REFERENCES `locatia` (`id_loc`);

--
-- Constraints for table `pers_implicate`
--
ALTER TABLE `pers_implicate`
  ADD CONSTRAINT `pers_implicate_ibfk_1` FOREIGN KEY (`id_perioada`) REFERENCES `perioada_ist` (`id_perioada`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
