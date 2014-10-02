-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2014 at 03:14 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hotelreservationsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE IF NOT EXISTS `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `hotel_name` varchar(30) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `price_perday` double unsigned DEFAULT NULL,
  `room_type` varchar(30) DEFAULT NULL,
  `booked_time` varchar(30) DEFAULT NULL,
  `entry_time` varchar(30) DEFAULT NULL,
  `exit_time` date DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `paymentmethod` varchar(30) DEFAULT NULL,
  `totalcost` double DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `book_id`, `hotel_name`, `location`, `price_perday`, `room_type`, `booked_time`, `entry_time`, `exit_time`, `address`, `phone`, `paymentmethod`, `totalcost`, `days`, `comment`, `status`) VALUES
(5, 265, 'Hotel Star', 'Christoph-probst Str.8, 80805,', 80, 'Double', '2014-10-01 09:45:55', '2014-10-04', NULL, 'Address,12. Munich', '+1909735902', 'Debit Card ', 320, 4, 'This is a simple comment', 'Pending'),
(6, 265, 'Hotel Star', 'Christoph-probst Str.8, 80805,', 100, 'Executive', '2014-10-01 09:47:27', '2014-10-24', NULL, 'addrss 12, 80805 mnich', '1299093834', 'Debit Card Cash ', 600, 6, 'This is a comment', 'Pending'),
(7, 266, 'Hotel Star', 'Christoph-probst Str.8, 80805,', 80, 'Double', '2014-10-01 11:50:36', '2014-10-03', NULL, 'address 12,munich,80805', '33342343324', 'Debit Card ', 320, 4, 'comment', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_mail` varchar(30) NOT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=267 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `e_mail`, `firstname`, `lastname`) VALUES
(265, 'habib@yahoo.com', 'Abcd', 'Efgh'),
(266, 'abc@yahoo.com', 'habib', 'rahman');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `confirmpassword` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `login_ibfk_1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `user_id`, `user_name`, `password`, `confirmpassword`) VALUES
(14, 265, 'habib', '12345', '12345'),
(15, 266, 'username', '12345', '12345');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `customer` (`cust_id`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
