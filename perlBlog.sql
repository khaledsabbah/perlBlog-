-- phpMyAdmin SQL Dump
-- version 4.7.0-beta1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 19, 2017 at 09:52 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perlBlog`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `c_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `u_id` int(10) NOT NULL,
  `c_content` text NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`c_id`, `p_id`, `u_id`, `c_content`, `created_at`, `updated_at`) VALUES
(2, 1, 7, ' seif islam comment', 0, 0),
(3, 3, 7, ' we are testing', 0, 0),
(5, 7, 7, ' alsdkf alskd lkajsd flkasjfd lkafjsd ', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `p_id` int(11) NOT NULL,
  `u_id` int(10) NOT NULL,
  `p_title` text NOT NULL,
  `p_content` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`p_id`, `u_id`, `p_title`, `p_content`, `created_at`, `updated_at`) VALUES
(1, 3, 'title ', 'title ', '2017-03-19 18:02:03', '2017-03-19 18:02:03'),
(2, 3, 'title ', 'title ', '2017-03-19 18:02:11', '2017-03-19 18:02:11'),
(3, 3, 'title ', 'title ', '2017-03-19 18:02:28', '2017-03-19 18:02:28'),
(4, 3, 'title ', 'title ', '2017-03-19 18:02:37', '2017-03-19 18:02:37'),
(5, 3, 'title ', 'title ', '2017-03-19 18:02:59', '2017-03-19 18:02:59'),
(6, 3, 'title ', 'title ', '2017-03-19 18:03:20', '2017-03-19 18:03:20'),
(7, 3, 'new title', 'new title', '2017-03-19 18:05:46', '2017-03-19 18:05:46'),
(8, 3, 'new title', 'new title', '2017-03-19 18:06:24', '2017-03-19 18:06:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `firstname` varchar(75) NOT NULL,
  `lastname` varchar(75) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` enum('male','female','','') NOT NULL DEFAULT 'male',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` enum('guest','admin','','') NOT NULL DEFAULT 'guest'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `gender`, `created_at`, `updated_at`, `role`) VALUES
(2, 'khaled', 'sabbah', 'khaledgamalsabbah@gmail.com', 'fc4d0294ed89ade01e1c747c5253da04', 'male', '2017-03-19 05:25:11', '2017-03-19 07:25:11', 'guest'),
(3, 'ahmed', 'gamal', 'ahme@gmail.com', '9193ce3b31332b03f7d8af056c692b84', 'male', '2017-03-19 05:45:29', '2017-03-19 07:45:29', 'guest'),
(4, 'khaled', 'khaled', 'khaled@gmail.com', 'fc4d0294ed89ade01e1c747c5253da04', 'male', '2017-03-19 18:58:30', '2017-03-19 20:58:30', 'guest'),
(5, 'ramzy', 'ramzy', 'ramzy@gmail.com', 'cf017a25b9389193ea0308cd0960f7bb', 'male', '2017-03-19 19:00:29', '2017-03-19 21:00:29', 'guest'),
(6, 'mohamed', 'ahmed', 'mohamed@gmail.com', '309cd3800aacbd003ac36199fa537295', 'male', '2017-03-19 19:05:40', '2017-03-19 21:05:40', 'guest'),
(7, 'seif', 'ibrahim', 'seif@gmail.com', '48625e236b6f61d615ee44f4611857d2', 'male', '2017-03-19 19:12:00', '2017-03-19 21:12:00', 'guest');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `u_id` (`u_id`),
  ADD KEY `u_id_2` (`u_id`),
  ADD KEY `p_id_2` (`p_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `u_id` (`u_id`),
  ADD KEY `u_id_2` (`u_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `posts` (`p_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
