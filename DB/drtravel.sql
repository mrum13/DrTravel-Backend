-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 19, 2020 at 03:13 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drtravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`id`, `email`, `password`, `name`) VALUES
(1, 'admin1@gmail.com', '$2y$10$I7UPeCk4lDCAE.6KKIVW0uH8Cyu/0a5iKtmf7OtIB.ucC5XJfzAxu', 'admin1'),
(2, 'admin5@gmail.com', '$2y$10$HvrXJZJ.L9mKlkItibLbxurkng.wUnD2w.xf3wxYb0px68xW.DqXG', 'admin5');

-- --------------------------------------------------------

--
-- Table structure for table `wisata_master`
--

CREATE TABLE `wisata_master` (
  `id` int(11) NOT NULL,
  `nama_tempat` varchar(100) NOT NULL,
  `lokasi_tempat` varchar(200) NOT NULL,
  `deskripsi` text NOT NULL,
  `status` int(11) NOT NULL,
  `gambar` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wisata_master`
--

INSERT INTO `wisata_master` (`id`, `nama_tempat`, `lokasi_tempat`, `deskripsi`, `status`, `gambar`) VALUES
(3, 'Pantai Losari', 'Makassar, Sulawesi Selatan', 'Banyak pisang epe', 0, 'https://www.pantaipedia.com/wp-content/uploads/2019/02/Pantai-Losari.jpg'),
(4, 'Benteng Rotterdam', 'Makassar, Sulawesi Selatan', 'Peninggalan Belanda', 0, 'https://makassar.singgasanahotels.com/img?src=1f5c6fde2b70ef6fbadeeb3faf94cdf5.jpg&width=920&height=530&crop-to-fit'),
(5, 'Pantai Bira', 'Bulukumba, Sulawesi Selatan', 'Pantai pasir putih', 0, 'https://www.pantaipedia.com/wp-content/uploads/2018/12/Pantai-Tanjung-Bira.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wisata_master`
--
ALTER TABLE `wisata_master`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_account`
--
ALTER TABLE `user_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wisata_master`
--
ALTER TABLE `wisata_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
