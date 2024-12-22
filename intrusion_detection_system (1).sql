-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2024 at 12:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `intrusion_detection_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `anomalies`
--

CREATE TABLE `anomalies` (
  `anomaly_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `anomalies`
--

INSERT INTO `anomalies` (`anomaly_id`, `log_id`, `status`) VALUES
(4, 40, 'Intrusion'),
(6, 40, 'Intrusion'),
(7, 40, 'Intrusion'),
(9, 40, 'Intrusion'),
(11, 12, 'Intrusion'),
(13, 12, 'Intrusion'),
(15, 12, 'Intrusion'),
(17, 12, 'Intrusion'),
(19, 12, 'Intrusion'),
(21, 12, 'Intrusion'),
(23, 12, 'Intrusion'),
(25, 12, 'Intrusion'),
(27, 12, 'Intrusion'),
(28, 12, 'Intrusion'),
(29, 12, 'Intrusion'),
(30, 12, 'Intrusion'),
(32, 12, 'Intrusion'),
(33, 40, 'Intrusion'),
(34, 4, 'Intrusion'),
(35, 40, 'Intrusion');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `access_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`log_id`, `url`, `access_time`) VALUES
(4, 'http://example.com/home', '2024-12-20 16:50:47'),
(5, 'http://example.com/home', '2024-12-20 16:50:53'),
(6, 'http://example.com/home', '2024-12-20 16:51:07'),
(7, 'http://example.com/home', '2024-12-20 16:51:14'),
(8, 'http://example.com/home', '2024-12-20 16:58:10'),
(9, 'http://example.com/home', '2024-12-20 16:58:13'),
(11, 'http://example.com/home', '2024-12-20 17:15:40'),
(12, 'http://example.com/home', '2024-12-20 17:15:41'),
(13, 'http://example.com/home', '2024-12-20 17:15:42'),
(14, 'http://example.com/home', '2024-12-20 17:15:43'),
(15, 'http://example.com/home', '2024-12-20 17:15:44'),
(16, 'http://example.com/home', '2024-12-20 17:15:45'),
(17, 'http://example.com/home', '2024-12-20 17:15:46'),
(18, 'http://example.com/home', '2024-12-20 17:15:47'),
(19, 'http://example.com/home', '2024-12-20 17:15:48'),
(20, 'http://example.com/home', '2024-12-20 17:15:49'),
(21, 'http://example.com/home', '2024-12-20 17:15:50'),
(22, 'http://example.com/home', '2024-12-20 17:15:51'),
(23, 'http://example.com/home', '2024-12-20 17:15:52'),
(24, 'http://example.com/home', '2024-12-20 17:15:53'),
(25, 'http://example.com/home', '2024-12-20 17:15:54'),
(26, 'http://example.com/home', '2024-12-20 17:15:55'),
(27, 'http://example.com/home', '2024-12-20 17:15:56'),
(28, 'http://example.com/home', '2024-12-20 17:15:57'),
(29, 'http://example.com/home', '2024-12-20 17:15:58'),
(30, 'http://example.com/home', '2024-12-20 17:15:59'),
(31, 'http://example.com/home', '2024-12-20 17:16:00'),
(32, 'http://example.com/home', '2024-12-20 17:16:01'),
(33, 'http://example.com/home', '2024-12-20 17:16:02'),
(34, 'http://example.com/home', '2024-12-20 17:16:03'),
(35, 'http://example.com/home', '2024-12-20 17:16:04'),
(36, 'http://example.com/home', '2024-12-20 17:16:05'),
(37, 'http://example.com/home', '2024-12-20 17:16:06'),
(38, 'http://example.com/home', '2024-12-20 17:16:07'),
(39, 'http://example.com/home', '2024-12-20 17:16:09'),
(40, 'ibik.ac.id', '2024-12-20 17:18:22'),
(41, 'ibik.ac.id', '2024-12-20 17:18:23'),
(42, 'ibik.ac.id', '2024-12-20 17:18:24'),
(43, 'ibik.ac.id', '2024-12-20 17:18:25'),
(44, 'ibik.ac.id', '2024-12-20 17:18:26'),
(45, 'ibik.ac.id', '2024-12-20 17:18:27'),
(46, 'ibik.ac.id', '2024-12-20 17:18:28'),
(47, 'ibik.ac.id', '2024-12-20 17:18:29'),
(48, 'ibik.ac.id', '2024-12-20 17:18:31'),
(49, 'ibik.ac.id', '2024-12-20 17:18:32'),
(50, 'ibik.ac.id', '2024-12-20 17:18:33'),
(51, 'ibik.ac.id', '2024-12-20 17:18:34'),
(52, 'ibik.ac.id', '2024-12-20 17:18:35'),
(53, 'ibik.ac.id', '2024-12-20 17:18:36'),
(54, 'ibik.ac.id', '2024-12-20 17:18:37'),
(55, 'ibik.ac.id', '2024-12-20 17:18:38'),
(56, 'ibik.ac.id', '2024-12-20 17:18:39'),
(57, 'ibik.ac.id', '2024-12-20 17:18:40'),
(58, 'ibik.ac.id', '2024-12-20 17:18:41'),
(59, 'ibik.ac.id', '2024-12-20 17:18:42'),
(60, 'ibik.ac.id', '2024-12-20 17:18:43'),
(61, 'ibik.ac.id', '2024-12-20 17:18:44'),
(62, 'ibik.ac.id', '2024-12-20 17:18:45'),
(63, 'ibik.ac.id', '2024-12-20 17:18:46'),
(64, 'ibik.ac.id', '2024-12-20 17:18:47'),
(65, 'ibik.ac.id', '2024-12-20 17:18:48'),
(66, 'ibik.ac.id', '2024-12-20 17:18:49'),
(67, 'ibik.ac.id', '2024-12-20 17:18:50'),
(68, 'ibik.ac.id', '2024-12-20 17:18:51'),
(69, 'http://example.com/home', '2024-12-20 17:20:20'),
(70, 'http://example.com/home', '2024-12-20 17:20:22'),
(71, 'http://example.com/home', '2024-12-20 17:20:23'),
(72, 'http://example.com/home', '2024-12-20 17:20:24'),
(73, 'http://example.com/home', '2024-12-20 17:20:25'),
(74, 'http://example.com/home', '2024-12-20 17:20:26'),
(75, 'http://example.com/home', '2024-12-20 17:20:27'),
(76, 'http://example.com/home', '2024-12-20 17:20:28'),
(77, 'http://example.com/home', '2024-12-20 17:20:29'),
(78, 'http://example.com/home', '2024-12-20 17:20:30'),
(79, 'http://example.com/home', '2024-12-20 17:20:31'),
(80, 'http://example.com/home', '2024-12-20 17:20:32'),
(81, 'http://example.com/home', '2024-12-20 17:20:33'),
(82, 'http://example.com/home', '2024-12-20 17:20:34'),
(83, 'http://example.com/home', '2024-12-20 17:20:35'),
(84, 'http://example.com/home', '2024-12-20 17:20:36'),
(85, 'http://example.com/home', '2024-12-20 17:20:37'),
(86, 'http://example.com/home', '2024-12-20 17:20:38'),
(87, 'http://example.com/home', '2024-12-20 17:20:39'),
(88, 'http://example.com/home', '2024-12-20 17:20:40'),
(89, 'http://example.com/home', '2024-12-20 17:20:41'),
(90, 'http://example.com/home', '2024-12-20 17:20:42'),
(91, 'http://example.com/home', '2024-12-20 17:20:43'),
(92, 'http://example.com/home', '2024-12-20 17:20:44'),
(93, 'http://example.com/home', '2024-12-20 17:20:45'),
(94, 'http://example.com/home', '2024-12-20 17:20:46'),
(95, 'http://example.com/home', '2024-12-20 17:20:47'),
(96, 'http://example.com/home', '2024-12-20 17:20:48'),
(97, 'http://example.com/home', '2024-12-20 17:20:49'),
(98, 'ibik.ac.id', '2024-12-20 17:52:42'),
(99, 'ibik.ac.id', '2024-12-20 17:52:43'),
(100, 'ibik.ac.id', '2024-12-20 17:52:44'),
(101, 'ibik.ac.id', '2024-12-20 17:52:45'),
(102, 'ibik.ac.id', '2024-12-20 17:52:46'),
(103, 'ibik.ac.id', '2024-12-20 17:52:47'),
(104, 'ibik.ac.id', '2024-12-20 17:52:48'),
(105, 'ibik.ac.id', '2024-12-20 17:52:49'),
(106, 'ibik.ac.id', '2024-12-20 17:52:50'),
(107, 'ibik.ac.id', '2024-12-20 17:52:51'),
(108, 'ibik.ac.id', '2024-12-20 18:04:42'),
(109, 'ibik.ac.id', '2024-12-20 18:04:43'),
(110, 'ibik.ac.id', '2024-12-20 18:04:44'),
(111, 'ibik.ac.id', '2024-12-20 18:04:45'),
(112, 'ibik.ac.id', '2024-12-20 18:04:46'),
(113, 'ibik.ac.id', '2024-12-20 18:04:47'),
(114, 'ibik.ac.id', '2024-12-20 18:04:48'),
(115, 'ibik.ac.id', '2024-12-20 18:04:49'),
(116, 'ibik.ac.id', '2024-12-20 18:04:50'),
(117, 'ibik.ac.id', '2024-12-20 18:04:51'),
(118, 'ibik.ac.id', '2024-12-21 06:36:56'),
(119, 'ibik.ac.id', '2024-12-21 06:36:57'),
(120, 'ibik.ac.id', '2024-12-21 06:36:58'),
(121, 'ibik.ac.id', '2024-12-21 06:36:59'),
(122, 'ibik.ac.id', '2024-12-21 06:37:00'),
(123, 'ibik.ac.id', '2024-12-21 06:39:59'),
(124, 'ibik.ac.id', '2024-12-21 06:40:00'),
(125, 'ibik.ac.id', '2024-12-21 06:40:01'),
(126, 'ibik.ac.id', '2024-12-21 06:40:02'),
(127, 'ibik.ac.id', '2024-12-21 06:40:03'),
(128, 'ibik.ac.id', '2024-12-21 06:40:04'),
(129, 'ibik.ac.id', '2024-12-21 06:40:05'),
(130, 'ibik.ac.id', '2024-12-21 06:40:06'),
(131, 'ibik.ac.id', '2024-12-21 06:40:07'),
(132, 'ibik.ac.id', '2024-12-21 06:40:08'),
(133, 'ibik.ac.id', '2024-12-21 06:40:09'),
(134, 'ibik.ac.id', '2024-12-21 06:40:10'),
(135, 'ibik.ac.id', '2024-12-21 06:40:11'),
(136, 'ibik.ac.id', '2024-12-21 06:40:12'),
(137, 'ibik.ac.id', '2024-12-21 06:40:13'),
(138, 'ibik.ac.id', '2024-12-21 06:40:14'),
(139, 'ibik.ac.id', '2024-12-21 06:40:15'),
(140, 'ibik.ac.id', '2024-12-21 06:40:16'),
(141, 'ibik.ac.id', '2024-12-21 06:40:17'),
(142, 'ibik.ac.id', '2024-12-21 06:40:19'),
(143, 'ibik.ac.id', '2024-12-21 06:40:20'),
(144, 'ibik.ac.id', '2024-12-21 06:40:21'),
(145, 'ibik.ac.id', '2024-12-21 06:40:22'),
(146, 'ibik.ac.id', '2024-12-21 06:40:23'),
(147, 'ibik.ac.id', '2024-12-21 06:40:24'),
(148, 'ibik.ac.id', '2024-12-21 06:40:25'),
(149, 'ibik.ac.id', '2024-12-21 06:40:26'),
(150, 'ibik.ac.id', '2024-12-21 06:40:27'),
(151, 'ibik.ac.id', '2024-12-21 06:40:28'),
(152, 'ibik.ac.id', '2024-12-21 06:40:29'),
(153, 'ibik.ac.id', '2024-12-21 06:40:30'),
(154, 'ibik.ac.id', '2024-12-21 06:40:31'),
(155, 'ibik.ac.id', '2024-12-21 06:40:32'),
(156, 'ibik.ac.id', '2024-12-21 06:40:33'),
(157, 'ibik.ac.id', '2024-12-21 06:40:34'),
(158, 'ibik.ac.id', '2024-12-21 06:42:11'),
(159, 'ibik.ac.id', '2024-12-21 06:42:12'),
(160, 'ibik.ac.id', '2024-12-21 06:42:13'),
(161, 'ibik.ac.id', '2024-12-21 06:42:14'),
(162, 'ibik.ac.id', '2024-12-21 06:42:15'),
(163, 'http://example.com', '2024-12-21 06:50:38'),
(164, 'http://example.com', '2024-12-21 06:50:39'),
(165, 'http://example.com', '2024-12-21 06:50:40'),
(166, 'http://example.com', '2024-12-21 06:50:41'),
(167, 'http://example.com', '2024-12-21 06:50:42'),
(168, 'http://example.com', '2024-12-21 06:50:43'),
(169, 'http://example.com', '2024-12-21 06:50:44'),
(170, 'http://example.com', '2024-12-21 06:50:45'),
(171, 'http://example.com', '2024-12-21 06:50:46'),
(173, 'ibik.ac.id', '2024-12-21 13:18:27'),
(174, 'ibik.ac.id', '2024-12-21 13:18:28'),
(175, 'ibik.ac.id', '2024-12-21 13:18:29'),
(176, 'ibik.ac.id', '2024-12-21 13:18:30'),
(177, 'ibik.ac.id', '2024-12-21 13:18:31'),
(178, 'youutube.com', '2024-12-21 13:30:22'),
(179, 'youutube.com', '2024-12-21 13:30:23'),
(180, 'youutube.com', '2024-12-21 13:30:24'),
(181, 'youutube.com', '2024-12-21 13:30:25'),
(182, 'youutube.com', '2024-12-21 13:30:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`) VALUES
(1, '232310030@student.ibik.ac.id', '232310030'),
(2, '232310037@student.ibik.ac.id', '232310037'),
(3, '232310042@student.ibik.ac.id', '232310042');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anomalies`
--
ALTER TABLE `anomalies`
  ADD PRIMARY KEY (`anomaly_id`),
  ADD KEY `log_id` (`log_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anomalies`
--
ALTER TABLE `anomalies`
  MODIFY `anomaly_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anomalies`
--
ALTER TABLE `anomalies`
  ADD CONSTRAINT `anomalies_ibfk_1` FOREIGN KEY (`log_id`) REFERENCES `logs` (`log_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
