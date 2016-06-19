-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 19, 2016 at 06:37 PM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `amelkam_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `authentications`
--

CREATE TABLE IF NOT EXISTS `authentications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `index` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destroy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `average_caches`
--

CREATE TABLE IF NOT EXISTS `average_caches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rater_id` int(11) DEFAULT NULL,
  `rateable_id` int(11) DEFAULT NULL,
  `rateable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avg` float NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_categories_on_category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'Electronics', '2016-06-02 00:00:00', '2016-06-02 00:00:00', NULL),
(2, 'Foods', '2016-06-01 00:00:00', '2016-06-01 00:00:00', NULL),
(3, 'Drinks', '2016-06-07 00:00:00', '2016-06-07 00:00:00', NULL),
(4, 'furnitures', '2016-06-04 00:00:00', '2016-06-04 00:00:00', NULL),
(5, 'mobiles', '2016-06-16 00:00:00', '2016-06-16 00:00:00', 1),
(6, 'Washing Machines', '2016-06-16 00:00:00', '2016-06-16 00:00:00', 1),
(7, 'Fridges', '2016-06-16 00:00:00', '2016-06-16 00:00:00', 1),
(8, 'Air conditioners', '2016-06-16 00:00:00', '2016-06-16 00:00:00', 1),
(9, 'Vegetables', '2016-06-16 00:00:00', '2016-06-16 00:00:00', 2),
(10, 'Fruits', '2016-06-17 00:00:00', '2016-06-17 00:00:00', 2),
(11, 'Pasta', '2016-06-17 00:00:00', '2016-06-17 00:00:00', 2),
(12, 'others', '2016-06-17 00:00:00', '2016-06-17 00:00:00', 2),
(13, 'Water', '2016-06-17 00:00:00', '2016-06-17 00:00:00', 3),
(14, 'coffee', '2016-06-17 00:00:00', '2016-06-17 00:00:00', 3),
(15, 'labtop', '2016-06-19 00:00:00', '2016-06-19 00:00:00', 1),
(16, 'chairs', '2016-06-17 00:00:00', '2016-06-17 00:00:00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `price_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_price_id` (`price_id`),
  KEY `index_comments_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `identities`
--

CREATE TABLE IF NOT EXISTS `identities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accesstoken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refreshtoken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urls` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_identities_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `overall_averages`
--

CREATE TABLE IF NOT EXISTS `overall_averages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rateable_id` int(11) DEFAULT NULL,
  `rateable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `overall_avg` float NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE IF NOT EXISTS `prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` text COLLATE utf8_unicode_ci,
  `price` decimal(16,2) DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `avg_rating` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_prices_on_product_id` (`product_id`),
  KEY `index_prices_on_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=33 ;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `image`, `price`, `address`, `longitude`, `latitude`, `avg_rating`, `created_at`, `updated_at`, `product_id`, `user_id`) VALUES
(1, 'aa.jpg', 3000.00, NULL, NULL, NULL, 4, '2016-06-19 00:00:00', '2016-06-19 00:00:00', 1, 3),
(2, 'grand.png', 5000.00, 'mansourah', NULL, NULL, 3, '2016-06-19 00:00:00', '2016-06-19 00:00:00', 2, 4),
(3, 'Samsung-Mobile-Phone-PNG-File.png', 2500.00, 'nozha,new cairo', NULL, NULL, 5, '2016-06-19 12:10:28', '2016-06-19 12:10:28', 1, 4),
(4, '60727.jpeg', 7000.00, 'dokki', NULL, NULL, 4.6, '2016-06-18 00:00:00', '2016-06-18 00:00:00', 3, 4),
(6, '97.jpeg', 9000.00, 'Haram,Giza', NULL, NULL, 3.5, '2016-06-13 00:00:00', '2016-06-13 00:00:00', 4, 6),
(7, '40596_0.png.jpeg', 10000.00, 'Mohandessi,Giza', NULL, NULL, 2.4, '2016-06-04 00:00:00', '2016-06-04 00:00:00', 5, 7),
(8, 'watervan-aquafina-packaged-drinking-water_2l.jpg', 12000.00, NULL, NULL, NULL, 1.5, '2016-06-06 00:00:00', '2016-06-06 00:00:00', 6, 7),
(9, '631188.jpg', 10000.00, NULL, NULL, NULL, 4.5, '2016-06-10 00:00:00', '2016-06-15 00:00:00', 7, 8),
(10, '2cd8b852-2170-4dbb-96b4-264b47a30637.jpg.png', 9000.00, NULL, NULL, NULL, 3, '2016-06-03 00:00:00', '2016-06-03 00:00:00', 8, 9),
(11, 'aaaaa.jpg', 8000.00, NULL, NULL, NULL, 4, '2016-06-03 00:00:00', '2016-06-03 00:00:00', 9, 9),
(12, 'p_817322.jpg', 6000.00, NULL, NULL, NULL, 4.5, '2016-06-01 00:00:00', '2016-06-01 00:00:00', 10, 8),
(13, '1337832766187.jpg', 5000.00, NULL, NULL, NULL, 4, '2016-06-08 00:00:00', '2016-06-08 00:00:00', 11, 4),
(14, '0973d7e2c655d60f8aaef22812df22ae.jpg', 4000.00, NULL, NULL, NULL, 4, '2016-06-08 00:00:00', '2016-06-08 00:00:00', 12, 2),
(15, '-400-.jpg', 3000.00, NULL, NULL, NULL, 5, '2016-06-08 00:00:00', '2016-06-08 00:00:00', 13, 2),
(16, 'k.jpeg', 2000.00, NULL, NULL, NULL, 4, '2016-06-08 00:00:00', '2016-06-08 00:00:00', 14, 6),
(17, 'ECO8410100021560.jpg', 1000.00, NULL, NULL, NULL, 3, '2016-06-08 00:00:00', '2016-06-08 00:00:00', 15, 3),
(19, '17088.jpg', 4000.00, NULL, NULL, NULL, 4, '2016-06-02 00:00:00', '2016-06-02 00:00:00', 16, 8),
(20, 'apple.jpg', 8000.00, NULL, NULL, NULL, 4, '2016-06-04 00:00:00', '2016-06-04 00:00:00', 18, 7),
(21, 'office-chairs-reviews.png', 6000.00, NULL, NULL, NULL, 3.5, '2016-06-08 00:00:00', '2016-06-08 00:00:00', 19, 9),
(22, '373151_extra3.jpg', 5000.00, '15st makkah,Giza', NULL, NULL, NULL, '2016-06-19 14:57:21', '2016-06-19 14:57:21', 10, 4),
(23, 'cce11f963ccde9e29ac2f233db8106ed.png', 8000.00, '20 st makka,Giza', NULL, NULL, NULL, '2016-06-19 14:59:07', '2016-06-19 14:59:07', 10, 4),
(24, 'tronic.png', 2000.00, '10st mah,Giza', NULL, NULL, NULL, '2016-06-19 15:00:23', '2016-06-19 15:00:23', 10, 4),
(25, 'imagess.jpeg', 6.00, NULL, NULL, NULL, 4.5, '2016-06-07 00:00:00', '2016-06-07 00:00:00', 20, 7),
(26, '1455874756.png', 2.00, 'maadi', NULL, NULL, NULL, '2016-06-19 15:07:31', '2016-06-19 15:07:31', 20, 7),
(27, '8850124035967-2_2.jpg', 5.00, 'new maadi', NULL, NULL, NULL, '2016-06-19 15:09:54', '2016-06-19 15:09:54', 15, 7),
(28, '8850124035967-2_2.jpg', 6.00, 'nozha', NULL, NULL, NULL, '2016-06-19 15:10:59', '2016-06-19 15:10:59', 15, 7),
(29, 'images.jpeg', 7.00, 'new cairo', NULL, NULL, NULL, '2016-06-19 15:13:37', '2016-06-19 15:13:37', 15, 9),
(30, 'images.jpeg', 3.00, 'new cairo', NULL, NULL, NULL, '2016-06-19 15:14:43', '2016-06-19 15:14:43', 15, 9),
(31, '07613034532671_c1c1-1.jpg', 5.00, 'sheikh zaid', NULL, NULL, NULL, '2016-06-19 15:17:34', '2016-06-19 15:17:34', 15, 9),
(32, '9677.png.jpeg', 4000.00, 'dokki', NULL, NULL, NULL, '2016-06-19 15:20:20', '2016-06-19 15:20:20', 19, 6);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `barcode` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_products_on_category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `barcode`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'samsung s2', NULL, '859563003115', '2016-06-19 00:00:00', '2016-06-19 00:00:00', 5),
(2, 'samsung grand', NULL, '1646265651114', '2016-06-19 00:00:00', '2016-06-19 00:00:00', 5),
(3, 'toshiba washing machine', NULL, '6281100350149', '2016-06-18 00:00:00', '2016-06-18 00:00:00', 6),
(4, 'samsung washing machine', NULL, '012345678905', '2016-01-18 00:00:00', '0000-00-00 00:00:00', 6),
(5, 'nestle water', NULL, '012345698705', '2016-06-14 00:00:00', '2016-06-14 00:00:00', 13),
(6, 'Aquafina water', NULL, '6281100350138', '2016-06-16 00:00:00', '2016-06-16 00:00:00', 13),
(7, 'HP pavillion', NULL, '1571100350987', '2016-06-11 00:00:00', '2016-06-11 00:00:00', 15),
(8, 'samsung Fridges', NULL, '3581100235987', '2016-06-09 00:00:00', '2016-06-09 00:00:00', 7),
(9, 'toshiba Fridges', NULL, '45681100350724', '2016-06-16 00:00:00', '2016-06-16 00:00:00', 7),
(10, 'carrier Air conditioners', NULL, '9881100350481', '2016-06-02 00:00:00', '2016-06-02 00:00:00', 8),
(11, 'tomato', NULL, '2342100350987', '2016-06-01 00:00:00', '2016-06-01 00:00:00', 9),
(12, 'strawberry', NULL, '62811087650987', '2016-06-05 00:00:00', '2016-06-05 00:00:00', 10),
(13, 'almaleka', NULL, '7631108750987', '2016-06-05 00:00:00', '2016-06-05 00:00:00', 11),
(14, 'katshab', NULL, '8781184350987', '2016-06-06 00:00:00', '2016-06-06 00:00:00', 12),
(15, 'neskafe', NULL, '4581135750987', '2016-06-10 00:00:00', '2016-06-10 00:00:00', 14),
(16, 'samsung ss', NULL, '4581135750944', '2016-06-14 00:00:00', '2016-06-14 00:00:00', 15),
(18, 'apple ', NULL, '023486532822', '2016-06-11 00:00:00', '2016-06-11 00:00:00', 15),
(19, 'chair', NULL, '287437865123', '2016-06-13 00:00:00', '2016-06-13 00:00:00', 16),
(20, 'juice', NULL, '8762350865', '2016-06-15 00:00:00', '2016-06-15 00:00:00', 12);

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE IF NOT EXISTS `rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rater_id` int(11) DEFAULT NULL,
  `rateable_id` int(11) DEFAULT NULL,
  `rateable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stars` float NOT NULL,
  `dimension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rates_on_rater_id` (`rater_id`),
  KEY `index_rates_on_rateable_id_and_rateable_type` (`rateable_id`,`rateable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rating_caches`
--

CREATE TABLE IF NOT EXISTS `rating_caches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheable_id` int(11) DEFAULT NULL,
  `cacheable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avg` float NOT NULL,
  `qty` int(11) NOT NULL,
  `dimension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rating_caches_on_cacheable_id_and_cacheable_type` (`cacheable_id`,`cacheable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20160529161439'),
('20160529161448'),
('20160529161459'),
('20160529161506'),
('20160529161539'),
('20160529161548'),
('20160529161711'),
('20160529161721'),
('20160529161727'),
('20160529161732'),
('20160529161902'),
('20160529161932'),
('20160529161939'),
('20160529161944'),
('20160529161951'),
('20160529161957'),
('20160529162003'),
('20160529162008'),
('20160529162013'),
('20160530155507'),
('20160531095017'),
('20160601102600'),
('20160608093327'),
('20160611101319'),
('20160612125308'),
('20160612125309'),
('20160612125310'),
('20160612125311'),
('20160612190448'),
('20160612223446');

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

CREATE TABLE IF NOT EXISTS `searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_price` decimal(10,0) DEFAULT NULL,
  `max_price` decimal(10,0) DEFAULT NULL,
  `address` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authentication_token` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_authentication_token` (`authentication_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `created_at`, `updated_at`, `name`, `image`, `phone`, `gender`, `dob`, `avatar`, `authentication_token`) VALUES
(1, 'asmaa@yahoo.com', '$2a$11$vqmHS/2k/Ivm2MKPQjuMSu8maLX4wEgnAJjH0HhUXihCpGr78Em1O', NULL, NULL, NULL, 1, '2016-06-02 11:47:50', '2016-06-02 11:47:50', '10.142.0.25', '10.142.0.25', '2016-06-02 11:47:50', '2016-06-02 11:47:50', 'asmaa', NULL, '', 'Gender ', '1980-06-02', '1.jpeg', 'w_Yx4E7Gamt4VwGdsuTy'),
(2, 'asmaa@ibrahim.com', '$2a$11$gM0H8tx92c5XDQ.h3V43CeXd8Ovq0g056Yy.O7wku9xDzcnFjd5oS', NULL, NULL, NULL, 1, '2016-06-03 12:00:29', '2016-06-03 12:00:29', '127.0.0.1', '127.0.0.1', '2016-06-03 12:00:29', '2016-06-03 12:00:29', 'asmaaa', NULL, '01068175999', 'Gender ', '1980-06-03', '1.jpeg', '4s3-WMPpqkDTrREdTEjq'),
(3, 'sarah@gmail.com', '$2a$11$yo4dFlRDyuyPjeZUzmkxNuvMopdJOoT/WLxThm3k5TWnhBIcK.WE6', NULL, NULL, NULL, 2, '2016-06-19 11:35:20', '2016-06-19 04:16:03', '127.0.0.1', '127.0.0.1', '2016-06-18 18:33:08', '2016-06-19 11:35:20', 'sarah', NULL, '01068175872', NULL, '1999-06-02', '1.jpeg', 'j9PxXs5y4j1rQk_bzycF'),
(4, 'mk@gmail.com', '$2a$11$wLLWJWZx9LpS10os/yqDru5twIS4K90Nxndrdrka86Y2.JJF0VD8.', NULL, NULL, NULL, 3, '2016-06-19 14:25:42', '2016-06-19 11:58:11', '127.0.0.1', '127.0.0.1', '2016-06-19 11:53:39', '2016-06-19 14:25:42', 'Mohamed', NULL, '0109875787687', 'Male', '1991-05-08', '1.jpeg', 'TDQBEQ9byKYX8AAsfAen'),
(6, 'ahmed@gmail.com', '$2a$11$UtnrI37J.OQl44OtowfYjepradxIuCl7H7fugMTDQccYFYxeezz36', NULL, NULL, NULL, 2, '2016-06-19 15:18:45', '2016-06-19 13:17:27', '127.0.0.1', '127.0.0.1', '2016-06-19 13:17:27', '2016-06-19 15:18:45', 'Ahmed', NULL, '01972357867', 'Male', '1989-08-14', NULL, 'UpEBu5d2gXBgPJkzHssx'),
(7, 'asmaaibrahim@yahoo.com', '$2a$11$wPOWlGIrpQ/S96pyWWlu2uhszIbmOYxBSrnKtCTLj0QfFxScGTExK', NULL, NULL, NULL, 2, '2016-06-19 15:01:19', '2016-06-19 13:19:09', '127.0.0.1', '127.0.0.1', '2016-06-19 13:19:09', '2016-06-19 15:01:19', 'asmaaibrahim', NULL, '01086542386756', 'Female', '1995-07-09', NULL, '5JV5HbKZxL5ySGFGjJ3S'),
(8, 'kareem@yahoo.com', '$2a$11$SFW72FLlBfYqI7wvyxVhK.Avvq48w.wYMkeYuyyIWEvOEuLVgp1xG', NULL, NULL, NULL, 1, '2016-06-19 13:20:25', '2016-06-19 13:20:25', '127.0.0.1', '127.0.0.1', '2016-06-19 13:20:25', '2016-06-19 13:20:25', 'kareem', NULL, '01082357865', 'Male', '1996-06-10', NULL, 'nP5q2Gqzj2aoGrciy7vu'),
(9, 'asmaaelsayed@yahoo.com', '$2a$11$JGWePdACV05l8EmJuv9CeePhdPsxo1hxtepIgjnpkin2zCXYWRb8O', NULL, NULL, NULL, 2, '2016-06-19 15:11:56', '2016-06-19 13:21:32', '127.0.0.1', '127.0.0.1', '2016-06-19 13:21:30', '2016-06-19 15:11:56', 'asmaa elsayed', NULL, '010725978356', 'Female', '1999-06-01', NULL, 'MgTL3_B-4KzUY-CVH4DQ');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_rails_09a423a16c` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_rails_03de2dc08c` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_rails_6a303ad7c9` FOREIGN KEY (`price_id`) REFERENCES `prices` (`id`);

--
-- Constraints for table `identities`
--
ALTER TABLE `identities`
  ADD CONSTRAINT `fk_rails_5373344100` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `prices`
--
ALTER TABLE `prices`
  ADD CONSTRAINT `fk_rails_221110ab02` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_rails_b8ee0bfea1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_rails_fb915499a4` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
