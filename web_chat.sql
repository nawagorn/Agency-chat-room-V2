-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2024 at 04:36 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id_comment` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id_comment`, `room_id`, `name`, `message`, `created_at`) VALUES
(1, 1, 'ดิว', '\"ตอนนี้เราตรวจสอบแล้ว พบว่าต้นไม้ล้มกีดขวางทางจริง ๆ ครับ เราจะเริ่มงานเคลียร์พื้นที่ทันทีเพื่อความปลอดภัยของประชาชน\"', '2024-11-29 03:11:28'),
(4, 1, 'คิว', '\"ผมจะประสานงานกับทีมเครื่องมือหนักมาเพื่อช่วยยกต้นไม้ออกจากพื้นที่ให้ทุกคนระวังจุดนี้ระหว่างการปฏิบัติงานด้วยนะครับ\"', '2024-11-29 04:28:29'),
(19, 1, 'อานนท์ ภูริรักษ', '\"ส่วนทางนี้ผมจะจัดการตั้งกรวยและป้ายเตือนให้รถชะลอความเร็วตรงจุดนี้ก่อน ระหว่างที่ทีมกำลังดำเนินงาน\"', '2024-11-29 06:17:10'),
(32, 1, 'ปลากัด', 'จากปลากัด', '2024-12-02 08:52:57'),
(33, 1, 'ดิว', 'ดีปลากัด', '2024-12-02 08:53:31'),
(34, 1, 'ปลากัด', 'ดีดิว', '2024-12-02 08:53:47'),
(61, 1, 'ปลากัด', 'ดีครับ', '2024-12-04 03:24:29');

-- --------------------------------------------------------

--
-- Table structure for table `roomdetails`
--

CREATE TABLE `roomdetails` (
  `id` int(11) NOT NULL,
  `room_code` varchar(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` enum('รอรับเรื่อง','ดำเนินการ','ส่งต่อ','เสร็จสิ้น','ไม่พอใจการแก้ไข','พอใจการแก้ไข') DEFAULT 'รอรับเรื่อง',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roomdetails`
--

INSERT INTO `roomdetails` (`id`, `room_code`, `title`, `status`, `created_at`) VALUES
(1, '12345', 'ต้นไม้กีดขวางทาง', 'ดำเนินการ', '2024-11-29 08:50:52'),
(2, '123456', 'ทิ้งขยะริมถนน', 'รอรับเรื่อง', '2024-12-04 08:45:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `roomdetails`
--
ALTER TABLE `roomdetails`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `roomdetails`
--
ALTER TABLE `roomdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `roomdetails` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
