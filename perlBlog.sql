-- phpMyAdmin SQL Dump
-- version 4.7.0-beta1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 24, 2017 at 11:25 PM
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
(1, 1, 3, ' this is my comment', 0, 0),
(2, 1, 3, ' another comment', 0, 0),
(4, 5, 3, ' this laksjdfaksf alskdf laskdf lasdjf ', 0, 0),
(5, 5, 3, ' asdfkjasldf laksjdf lasjkd fas kdlfjaslkdfj alksdj f asf;askfdj als kdfasldfj asld fj', 0, 0),
(6, 13, 2, ' now comment admin', 0, 0),
(7, 13, 2, ' again from admin', 0, 0);

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
(1, 3, 'title ', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2017-03-19 18:02:03', '2017-03-19 18:02:03'),
(5, 3, 'Lorem', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like', '2017-03-19 18:02:59', '2017-03-19 18:02:59'),
(7, 3, 'new title', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2017-03-19 18:05:46', '2017-03-19 18:05:46'),
(8, 3, 'new title', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2017-03-19 18:06:24', '2017-03-19 18:06:24'),
(9, 2, 'wow title', '    wow this is a post admin ', '2017-03-20 10:37:37', '2017-03-20 10:37:37'),
(10, 6, 'title', 'title', '2017-03-20 13:27:41', '2017-03-20 13:27:41'),
(11, 6, 'title', 'title', '2017-03-20 13:28:34', '2017-03-20 13:28:34'),
(13, 7, 'akslfjd', ' sldkaflak alksdjf laksdf lkasd flksdafj laksfj lkasdfjlkasdfasdlkfjasdlkfdalskfjd lasfdlaksjf laksfjd lasd', '2017-03-20 13:41:24', '2017-03-20 13:41:24'),
(14, 2, 'ADMINISTRATION', ' t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like', '2017-03-25 01:08:50', '2017-03-25 01:08:50');

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
(2, 'khaled', 'sabbah', 'khaledgamalsabbah@gmail.com', 'fc4d0294ed89ade01e1c747c5253da04', 'male', '2017-03-19 05:25:11', '2017-03-19 07:25:11', 'admin'),
(3, 'ahmed', 'khaled', 'ahme@gmail.com', '9193ce3b31332b03f7d8af056c692b84', 'male', '2017-03-19 05:45:29', '2017-03-19 07:45:29', 'guest'),
(4, 'khaled', 'khaled', 'khaled@gmail.com', 'fc4d0294ed89ade01e1c747c5253da04', 'male', '2017-03-19 18:58:30', '2017-03-19 20:58:30', 'guest'),
(6, 'seif', 'islam ibrahim', 'seif@gmail.com', '48625e236b6f61d615ee44f4611857d2', 'male', '2017-03-20 11:15:51', '2017-03-20 13:15:51', 'guest'),
(7, 'mohamed', 'mohamed', 'mohamed@gmail.com', '309cd3800aacbd003ac36199fa537295', 'male', '2017-03-20 11:39:44', '2017-03-20 13:39:44', 'guest');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `u_id` (`u_id`);

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
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
