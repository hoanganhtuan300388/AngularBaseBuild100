-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2018 at 10:16 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `angular_100`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL COMMENT 'mã',
  `parent_id` int(11) DEFAULT NULL COMMENT 'mã loại cha',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'tên',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'đường dẫn slug',
  `description` text COLLATE utf8_unicode_ci COMMENT 'mô tả chi tiết',
  `lft` int(11) DEFAULT NULL COMMENT 'dữ liệu bên trái',
  `rght` int(11) DEFAULT NULL COMMENT 'dữ liệu bên phải',
  `created` datetime DEFAULT NULL COMMENT 'ngày tạo',
  `updated` datetime DEFAULT NULL COMMENT 'ngày sửa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `description`, `lft`, `rght`, `created`, `updated`) VALUES
(1, NULL, 'Loại 1', 'loai-1', 'Loại 1', 1, 4, '2018-03-07 10:02:01', '2018-03-07 10:02:01'),
(2, NULL, 'Loại 2', 'loai-2', 'Loại 2', 5, 8, '2018-03-07 10:02:09', '2018-03-07 10:02:09'),
(3, 2, 'Loại 3', 'loai-3', 'Loại 3', 6, 7, '2018-03-07 10:02:21', '2018-03-07 10:02:21'),
(4, NULL, 'Loại 4', 'loai-4', 'Loại 1', 9, 10, '2018-03-07 10:02:28', '2018-03-07 10:02:28'),
(5, 1, 'Loại 5', 'loai-5', 'Loại 5', 2, 3, '2018-03-07 10:02:41', '2018-03-07 10:02:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL COMMENT 'mã',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'địa chỉ email',
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT 'mật khẩu',
  `first_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT 'họ',
  `last_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT 'tên',
  `date_of_birth` date NOT NULL COMMENT 'ngày sinh Y-m-d',
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ảnh đại diện',
  `note` text COLLATE utf8_unicode_ci COMMENT 'ghi chú',
  `gender` tinyint(4) DEFAULT '1' COMMENT 'giới tính 1 - nam, 0 - nữ',
  `role` tinyint(4) DEFAULT '0' COMMENT 'quyền hạn 0 - user, 1 - manager, 2 - admin',
  `created` datetime DEFAULT NULL COMMENT 'ngày tạo',
  `updated` datetime DEFAULT NULL COMMENT 'ngày cập nhật'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `first_name`, `last_name`, `date_of_birth`, `avatar`, `note`, `gender`, `role`, `created`, `updated`) VALUES
(1, 'tuanha_1@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 1', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(2, 'tuanha_2@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 2', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(3, 'tuanha_3@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 3', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(4, 'tuanha_4@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 4', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(5, 'tuanha_5@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 5', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(6, 'tuanha_6@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 6', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(7, 'tuanha_7@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 7', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(8, 'tuanha_8@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 8', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(9, 'tuanha_9@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 9', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(10, 'tuanha_10@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 10', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(11, 'tuanha_11@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 11', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(12, 'tuanha_12@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 12', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(13, 'tuanha_13@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 13', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(14, 'tuanha_14@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 14', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(15, 'tuanha_15@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 15', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(16, 'tuanha_16@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 16', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(17, 'tuanha_17@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 17', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(18, 'tuanha_18@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 18', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(19, 'tuanha_19@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 19', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(20, 'tuanha_20@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 20', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(21, 'tuanha_21@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 21', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(22, 'tuanha_22@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 22', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(23, 'tuanha_23@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 23', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(24, 'tuanha_24@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 24', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(25, 'tuanha_25@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 25', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(26, 'tuanha_26@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 26', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(27, 'tuanha_27@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 27', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(28, 'tuanha_28@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 28', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(29, 'tuanha_29@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 29', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(30, 'tuanha_30@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 30', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(31, 'tuanha_31@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 31', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(32, 'tuanha_32@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 32', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(33, 'tuanha_33@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 33', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(34, 'tuanha_34@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 34', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(35, 'tuanha_35@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 35', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(36, 'tuanha_36@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 36', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(37, 'tuanha_37@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 37', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(38, 'tuanha_38@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 38', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(39, 'tuanha_39@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 39', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(40, 'tuanha_40@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 40', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(41, 'tuanha_41@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 41', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(42, 'tuanha_42@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 42', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(43, 'tuanha_43@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 43', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(44, 'tuanha_44@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 44', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(45, 'tuanha_45@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 45', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(46, 'tuanha_46@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 46', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(47, 'tuanha_47@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 47', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(48, 'tuanha_48@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 48', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(49, 'tuanha_49@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 49', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(50, 'tuanha_50@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 50', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(51, 'tuanha_51@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 51', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(52, 'tuanha_52@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 52', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(53, 'tuanha_53@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 53', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(54, 'tuanha_54@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 54', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(55, 'tuanha_55@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 55', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(56, 'tuanha_56@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 56', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(57, 'tuanha_57@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 57', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(58, 'tuanha_58@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 58', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(59, 'tuanha_59@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 59', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(60, 'tuanha_60@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 60', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(61, 'tuanha_61@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 61', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(62, 'tuanha_62@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 62', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(63, 'tuanha_63@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 63', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(64, 'tuanha_64@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 64', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(65, 'tuanha_65@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 65', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(66, 'tuanha_66@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 66', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(67, 'tuanha_67@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 67', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(68, 'tuanha_68@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 68', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(69, 'tuanha_69@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 69', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(70, 'tuanha_70@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 70', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(71, 'tuanha_71@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 71', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(72, 'tuanha_72@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 72', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(73, 'tuanha_73@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 73', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(74, 'tuanha_74@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 74', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(75, 'tuanha_75@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 75', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(76, 'tuanha_76@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 76', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(77, 'tuanha_77@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 77', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(78, 'tuanha_78@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 78', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(79, 'tuanha_79@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 79', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(80, 'tuanha_80@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 80', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(81, 'tuanha_81@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 81', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(82, 'tuanha_82@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 82', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(83, 'tuanha_83@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 83', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(84, 'tuanha_84@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 84', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(85, 'tuanha_85@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 85', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(86, 'tuanha_86@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 86', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(87, 'tuanha_87@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 87', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(88, 'tuanha_88@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 88', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(89, 'tuanha_89@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 89', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(90, 'tuanha_90@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 90', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(91, 'tuanha_91@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 91', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(92, 'tuanha_92@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 92', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(93, 'tuanha_93@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 93', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(94, 'tuanha_94@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 94', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(95, 'tuanha_95@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 95', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(96, 'tuanha_96@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 96', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(97, 'tuanha_97@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 97', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(98, 'tuanha_98@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 98', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(99, 'tuanha_99@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 99', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 15:59:01'),
(100, 'tuanha_100@runsystem.vn', '415424204c721a1e94ded85d08d36cc0d28629b5', 'Hoàng Anh', 'Tuấn 100', '1988-03-30', 'thanhnha_151124111152_con_ca_hay_can_cau.jpg', 'Ahihi', 1, 2, '2018-03-07 15:59:01', '2018-03-07 10:10:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'mã', AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'mã', AUTO_INCREMENT=101;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
