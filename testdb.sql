-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2021 at 04:15 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'user', '2021-09-25 13:42:41', '2021-09-25 13:42:41'),
(2, 'moderator', '2021-09-25 13:42:41', '2021-09-25 13:42:41'),
(3, 'admin', '2021-09-25 13:42:41', '2021-09-25 13:42:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'mod', 'mod@gmail.com', '$2a$08$g7SAxrmAC/0tjZrQidCLtu6zMLJ8WmQjci5vFfWXpJRV/CSDbdvEe', '2021-09-25 06:47:07', '2021-09-25 06:47:07'),
(2, 'admin', 'admin@gmail.com', '$2a$08$a8/SWIbiGRg1So7AoR/NpuweV3.RiPnAQGIKpp.cR0MdUT2ReuvTe', '2021-09-25 06:49:45', '2021-09-25 06:49:45'),
(3, 'user', 'user@gmail.com', '$2a$08$Tc4CsrmJk4c7Z2HxRbR/bOYXg4L9rTsVaA2OdJJehRD7eoOL1FhPO', '2021-09-25 06:50:01', '2021-09-25 06:50:01'),
(4, 'alvi', 'alvi29@gmail.com', '$2a$08$wZg0.1bifCoAUc1hoBc19.nT/h1WNaqkz7nLukdu3FHNTd8rOjP86', '2021-09-25 11:03:52', '2021-09-25 11:03:52'),
(5, 'alvi123', 'alvi123@gmail.com', '$2a$08$jqRbjStGq8ivMvTDvKNi6eBGc63T5OjOLA2MOlB5DpPxXdhFnumxy', '2021-09-25 13:10:45', '2021-09-25 13:10:45'),
(6, 'latief', 'latief@gmail.com', '$2a$08$pe/t1qPxqwYtoVgWeB6pVO0/cMSB27XKM4CqcnQY9ko.PC/qNaQ0K', '2021-09-25 13:17:24', '2021-09-25 13:17:24'),
(7, 'latief123', 'latief123@gmail.com', '$2a$08$NXL554nTgYdcTC5xJqztbuAnkiHfMv1.2LZpPhM3WfMbX.rdpQ.AG', '2021-09-25 13:35:30', '2021-09-25 13:35:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`createdAt`, `updatedAt`, `roleId`, `userId`) VALUES
('2021-09-25 06:47:07', '2021-09-25 06:47:07', 1, 1),
('2021-09-25 06:50:01', '2021-09-25 06:50:01', 1, 3),
('2021-09-25 11:03:52', '2021-09-25 11:03:52', 1, 4),
('2021-09-25 13:10:45', '2021-09-25 13:10:45', 1, 5),
('2021-09-25 06:47:07', '2021-09-25 06:47:07', 2, 1),
('2021-09-25 06:49:45', '2021-09-25 06:49:45', 3, 2),
('2021-09-25 13:17:24', '2021-09-25 13:17:24', 3, 6),
('2021-09-25 13:35:30', '2021-09-25 13:35:30', 3, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`roleId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
