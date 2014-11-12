-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Nov 12, 2014 at 02:10 PM
-- Server version: 5.5.38
-- PHP Version: 5.5.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `finfork`
--

-- --------------------------------------------------------

--
-- Table structure for table `credit`
--

DROP TABLE IF EXISTS `credit`;
CREATE TABLE `credit` (
`id` int(11) NOT NULL,
  `type` enum('private','bank','card') NOT NULL DEFAULT 'bank',
  `debtor` varchar(45) NOT NULL,
  `total` int(11) NOT NULL,
  `payment` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rules`
--

DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules` (
`id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `pattern` varchar(80) NOT NULL,
  `action` varchar(45) NOT NULL,
  `matched` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
`id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `date_booked` datetime NOT NULL,
  `date_valuta` datetime NOT NULL,
  `source` varchar(80) NOT NULL,
  `purpose` mediumtext NOT NULL,
  `type` enum('in','out','in_fix','out_fix') NOT NULL,
  `category` int(11) NOT NULL,
  `recur_period` int(11) DEFAULT NULL,
  `credit_id` int(11) DEFAULT NULL,
  `is_forecast` tinyint(4) NOT NULL DEFAULT '0',
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trans_category`
--

DROP TABLE IF EXISTS `trans_category`;
CREATE TABLE `trans_category` (
`id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `color` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vat`
--

DROP TABLE IF EXISTS `vat`;
CREATE TABLE `vat` (
`id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `paid` tinyint(4) DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `credit`
--
ALTER TABLE `credit`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rules`
--
ALTER TABLE `rules`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_creditId_idx` (`credit_id`), ADD KEY `fk_categoryId_idx` (`category`);

--
-- Indexes for table `trans_category`
--
ALTER TABLE `trans_category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vat`
--
ALTER TABLE `vat`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_transId_vat_idx` (`transaction_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `credit`
--
ALTER TABLE `credit`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rules`
--
ALTER TABLE `rules`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trans_category`
--
ALTER TABLE `trans_category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vat`
--
ALTER TABLE `vat`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
ADD CONSTRAINT `fk_categoryId` FOREIGN KEY (`category`) REFERENCES `trans_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_creditId` FOREIGN KEY (`credit_id`) REFERENCES `credit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vat`
--
ALTER TABLE `vat`
ADD CONSTRAINT `fk_transId_vat` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
