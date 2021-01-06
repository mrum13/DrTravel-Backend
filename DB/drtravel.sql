-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2021 at 04:30 AM
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
-- Table structure for table `kuliner_master`
--

CREATE TABLE `kuliner_master` (
  `id` int(2) NOT NULL,
  `nama_kuliner` text NOT NULL,
  `asal_kuliner` text NOT NULL,
  `deskripsi_kuliner` text NOT NULL,
  `gambar_kuliner` longtext NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kuliner_master`
--

INSERT INTO `kuliner_master` (`id`, `nama_kuliner`, `asal_kuliner`, `deskripsi_kuliner`, `gambar_kuliner`, `status`) VALUES
(1, 'Coto Makassar', 'Makassar, Sulawesi Selatan', 'Coto makassar atau coto mangkasara adalah makanan tradisional Makassar, Sulawesi Selatan. Makanan ini terbuat dari jeroan sapi yang direbus dalam waktu yang lama. Rebusan jeroan bercampur daging sapi ini kemudian diiris-iris lalu dibumbui dengan bumbu yang diracik secara khusus. Coto dihidangkan dalam mangkuk dan dinikmati dengan ketupat dan buras, yakni sejenis ketupat yang dibungkus daun pisang.', 'https://selerasa.com/wp-content/uploads/2016/11/images_Kue_cubit_Resep-coto-makassar-1200x798.jpg', 1),
(2, 'Palekko', 'Pinrang, Sulawesi Selatan', 'Nasu Palekko adalah salah satu kuliner khas suku Bugis yang terbuat dari Daging Bebek yang dipotong-potong kecil seperti dicincang, atau disebut Daging Bebek Cincang. Dimana dalam proses pembuatannya, daging bebek yang sudah disembelih dan dikuliti serta dicincang lalu dicuci bersih. Kemudian diberi cuka atau jeruk nipis untuk menghilangkan bau amis-nya.', 'https://bontangpost.id/wp-content/uploads/2020/02/ayam-palekko.jpg', 0),
(3, 'Kapurung', 'Palopo, Sulawesi Selatan', 'Namanya Kapurung, sebuah makanan berkuah dengan rasa sedikit asam namun sangat menyegarkan. Kuliner ini merupakan makanan khas tradisional dari Palopo, khususnya masyarakat Desa Luwu. Cara membuatnya cukup mudah, yang perlu disiapkan adalah sagu asli atau tepung sagu yang nantinya akan dilarutkan menggunakan air panas.', 'https://nusadaily.com/wp-content/uploads/2019/12/kapurung_.jpg', 0),
(4, 'Konro', 'Makassar, Sulawesi Selatan', 'Sup Konro adalah masakan sup iga sapi khas Indonesia yang berasal dari tradisi Bugis dan Makassar. Sup ini biasanya dibuat dengan bahan iga sapi atau daging sapi. Masakan berkuah warna coklat kehitaman ini biasa dimakan dengan burasa dan ketupat yang dipotong-potong terlebih dahulu.', 'https://sejutarumah.id/wp-content/uploads/2020/07/74-cara-memasak-sop-konro-makassar-paling-sederhana-1200x850.jpg', 0),
(5, 'Sop Sodara', 'Pangkep, Sulawesi Selatan', 'Sop saudara merupakan masakan khas dari Sulawesi Selatan berupa hidangan berkuah dengan bahan dasar daging sapi yang biasanya disajikan bersama bahan pelengkap seperti bihun, perkedel kentang, jeroan sapi (misalnya, paru goreng), dan telur rebus. Masakan ini umum dikonsumsi bersama dengan nasi putih dan ikan bolu (bandeng) bakar.', 'https://i2.wp.com/resepkoki.id/wp-content/uploads/2018/03/Resep-Sop-Sodara.jpg?fit=1473%2C1287&ssl=1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lupasandi_master`
--

CREATE TABLE `lupasandi_master` (
  `id` int(2) NOT NULL,
  `email_akun` varchar(100) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lupasandi_master`
--

INSERT INTO `lupasandi_master` (`id`, `email_akun`, `status`) VALUES
(1, 'admin123@gmail.com', 0),
(2, 'muhammadrum135@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `masjid_master`
--

CREATE TABLE `masjid_master` (
  `id` int(2) NOT NULL,
  `nama_masjid` text NOT NULL,
  `lokasi_masjid` text NOT NULL,
  `deskripsi_masjid` text NOT NULL,
  `gambar_masjid` longtext NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `masjid_master`
--

INSERT INTO `masjid_master` (`id`, `nama_masjid`, `lokasi_masjid`, `deskripsi_masjid`, `gambar_masjid`, `status`) VALUES
(1, 'Masjid Raya Makassar ', 'Makassar, Sulawesi Selatan', 'Masjid Raya Makassar merupakan sebuah masjid yang terletak di Makassar, Indonesia. Masjid ini dibangun pada tahun 1948 dan selesai pada tahun 1949. Masjid ini mengalami renovasi dari tahun 1999 hingga tahun 2005. Pertama kali dirancang oleh arsitek Muhammad Soebardjo setelah memenangi sayembara yang digelar panitia pembangunan masjid raya. Masjid ini dapat menampung hingga 10.000 jamaah.', 'https://cdn.idntimes.com/content-images/community/2018/11/masjid-raya-makassar-20150616-220409-d522709fbae791276fbe6e1e49bf346d.jpg', 1),
(2, 'Masjid Agung Gowa', 'Gowa, Sulawesi Selatan', 'Mesjid dua lantai di Jl. Bulusaraung ini menggunakan bahan bangunan sekitar 80 persen dari bahan baku lokal, memiliki dua menara setinggi 66,66 meter, daya tampung 10.000 jamaah dan fasilitas berupa perpustakaan, kantor Majelis Ulama Indonesia (MUI) Sulawesi Selatan.', 'https://www.tagar.id/Asset/uploads2019/1577647125847-masjid-agung-syekh-yusuf-gowa.jpg', 0),
(3, 'Masjid Dato Tiro', 'Bulukumba, Sulawesi Selatan', 'Bulukumba memiliki berbagai wisata alam pantai yang begitu memukau. Disana juga terdapat berbagai wisata lainnya yang menarik para wisatawan lokal maupun mancanegara. Bulukumba juga memiliki sebuah bangunan Masjid yang begitu megah. Masjid tersebut bernama masjid Islamic Center Dato Tiro Bulukumba. \r\nMasjid tersebut sudah ada sejak tahun 2014 kemarin. Nama masjid tersebut diambil sebagai penghormatan besar terhadap salah satu tokoh penyebar Islam di kawasan Bulukumba. Atas jasanya yang begitu mulia dalam menyebarkan agama serta ajaran islam, nama beliau diabadikan dalam sebuah bangunan tempat beribadah umat muslim Bulukumba dan untuk masyarakat Sulawesi Selatan umumnya.', 'https://promoliburan.com/userfiles/uploads/masjid.jpg', 0),
(4, 'Masjid Terapung', 'Makassar, Sulawesi Selatan', 'Masjid Terapung', 'https://muslimobsession.com/wp-content/uploads/2018/01/Masjid-Terapung-Makassar.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `penginapan_master`
--

CREATE TABLE `penginapan_master` (
  `id` int(2) NOT NULL,
  `nama_penginapan` text NOT NULL,
  `lokasi_penginapan` text NOT NULL,
  `deskripsi_penginapan` text NOT NULL,
  `gambar_penginapan` longtext NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penginapan_master`
--

INSERT INTO `penginapan_master` (`id`, `nama_penginapan`, `lokasi_penginapan`, `deskripsi_penginapan`, `gambar_penginapan`, `status`) VALUES
(1, 'Paduppa Resort', 'Bulukumba, Sulawesi Selatan', 'Bagus pengantin baru liburan di sini', 'https://cdn-2.tstatic.net/makassar/foto/bank/images/padduppa-resort-4.jpg', 1),
(2, 'Permata indah', 'Gowa, Sulawesi Selatan', 'Kolam renangnya mantap bro', 'https://2.bp.blogspot.com/-pBOZswyrBcA/WSgMiNHtRyI/AAAAAAAAPu0/e4kVcKcx4rITdlxMpOpvoWqGDJitNLGAgCLcB/s1600/Permata%2BIndah%2BResort%2B-%2B7.jpg', 0),
(3, 'Pondok Lembah Biru', 'Malino, Sulawesi Selatan', 'Satu lagi tempat wisata di Malino yang patut anda kunjungi yakni Lembah Biru Malino. Keindahan tempat ini tak perlu kalian ragukan lagi, secara tempat ini telah banyak dikunjungi oleh para wisatawan. Pemandangan alamnya yang asri serta udaranya sejuk membuat pengunjung merasa betah untuk berlama-lama. Hanya saja cuaca disana begitu dingin, membuat kita enggan untuk mandi.\r\nDi Lembah Biru Malino terdapat fasilitas kolam renang, tapi anda jangan langsung terjun dan mandi begitu saja soalnya airnya sangat dingin. Mungkin perlu adaptasi agar bisa menyesuaikan kondisi dinginnya. Yang sudah terbiasa dengan dinginnya tak mengapa kalian langsung menikmati mandi di kolam renang Lembah Biru Malino.\r\nTempat ini sangat cocok buat keluarga, selain memiliki fasilitas kolam renang yang airnya berasal dari pegunungan, juga pemandangan disekitarnya dihinggapi banyak pepohonan-pepohonan sehingga kesejukan alam sekitarnya begitu terasa. Sangat disayangkan jika kalian tidak menyempatkan diri untuk singgah ditempat ini.', 'https://1.bp.blogspot.com/-OfY3ElnRW0s/XNLxKK2ZtbI/AAAAAAAAPW0/WTd818SkJtIhvsHTu10X0EzFSgegmxwuACLcBGAs/w1200-h630-p-k-no-nu/lembah-biru-malino1.jpg', 0),
(4, 'Hotel Pantai Gapura', 'Makassar, Sulawesi Selatan', 'Pantai Gapura Hotel Makassar adalah tempat yang disarankan untuk Anda yang ingin menikmati keindahan dari matahari yang terbenam. Selain tempat untuk berlibur, Pantai Gapura Hotel Makassar adalah tempat yang banyak dipilih sebagai tempat untuk berbisnis. Pantai Gapura Hotel Makassar akan memberi pengetahuan tentang sejarah singkat Fort Rotterdam. Dengan desain yang menarik menggunakan kayu, akan menciptakan suasana yang sangat nyaman dan tak terlupakan bagi Anda.', 'https://cf.bstatic.com/images/hotel/max1024x768/141/141975865.jpg', 0);

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
(2, 'admin5@gmail.com', '$2y$10$HvrXJZJ.L9mKlkItibLbxurkng.wUnD2w.xf3wxYb0px68xW.DqXG', 'admin5'),
(3, 'adminrum@gmail.com', '$2y$10$pZyZMpO2ndmZjzsbrTp4Lux4pnlMgJjF1.I48DvooJFX4qnGrmSsy', 'Rum ji'),
(4, 'adminrum13@gmail.com', '$2y$10$1Ld7S18E1PGYCXVaXSJ4uucIGlTaoLWsNNf38qf7yzY4eVLF3fhOy', 'adminrummm'),
(5, 'adminbaru@gmail.com', '$2y$10$zaNKekDT60eMmfutQmAWVOC9rTH2RjRffqzzkZFqFh8kE.SE7mVZm', 'admin saja');

-- --------------------------------------------------------

--
-- Table structure for table `wisata_galleri`
--

CREATE TABLE `wisata_galleri` (
  `id` int(2) NOT NULL,
  `nama_wisata` text NOT NULL,
  `gambar_wisata` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(3, 'Pantai Losari', 'Makassar, Sulawesi Selatan', 'Banyak pisang epe', 1, 'https://www.pantaipedia.com/wp-content/uploads/2019/02/Pantai-Losari.jpg'),
(4, 'Benteng Rotterdam', 'Makassar, Sulawesi Selatan', 'Fort Rotterdam atau Benteng Ujung Pandang (Jum Pandang) adalah sebuah benteng peninggalan Kerajaan Gowa-Tallo. Letak benteng ini berada di pinggir pantai sebelah barat Kota Makassar, Sulawesi Selatan.\r\n\r\nBenteng ini dibangun pada tahun 1545 oleh Raja Gowa ke-9 yang bernama I manrigau Daeng Bonto Karaeng Lakiung . Awalnya benteng ini berbahan dasar tanah liat, namun pada masa pemerintahan Raja Gowa ke-14 Sultan Alauddin konstruksi benteng ini diganti menjadi batu padas yang bersumber dari Pegunungan Karst yang ada di daerah Maros. Benteng Ujung Pandang ini berbentuk seperti seekor penyu yang hendak merangkak turun ke lautan. Dari segi bentuknya sangat jelas filosofi Kerajaan Gowa, bahwa penyu dapat hidup di darat maupun di laut. Begitu pun dengan Kerajaan Gowa yang berjaya di daratan maupun di lautan.\r\nNama asli benteng ini adalah Benteng Ujung Pandang, biasa juga orang Gowa-Makassar menyebut benteng ini dengan sebutan Benteng Panyyua yang merupakan markas pasukan katak Kerajaan Gowa. \r\n\r\nKerajaan Gowa-Tallo akhirnya menandatangani perjanjian Bungayya yang salah satu pasalnya mewajibkan Kerajaan Gowa untuk menyerahkan benteng ini kepada Belanda. Pada saat Belanda menempati benteng ini, nama Benteng Ujung Pandang diubah menjadi Fort Rotterdam. Cornelis Speelman sengaja memilih nama Fort Rotterdam untuk mengenang daerah kelahirannya di Belanda. Benteng ini kemudian digunakan oleh Belanda sebagai pusat penampungan rempah-rempah di Indonesia bagian timur.', 0, 'https://makassar.singgasanahotels.com/img?src=1f5c6fde2b70ef6fbadeeb3faf94cdf5.jpg&width=920&height=530&crop-to-fit'),
(5, 'Pantai Bira', 'Bulukumba, Sulawesi Selatan', 'pantai tanjung bira ini bisa di bilang merupakan pintu masuk menuju Pulau Kambing. Karena jika Anda akan berkunjung ke Pulau Kambing, Anda harus menyewa perahu dari Pantai Tanjung Bira.', 1, 'https://www.pantaipedia.com/wp-content/uploads/2018/12/Pantai-Tanjung-Bira.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kuliner_master`
--
ALTER TABLE `kuliner_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lupasandi_master`
--
ALTER TABLE `lupasandi_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `masjid_master`
--
ALTER TABLE `masjid_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penginapan_master`
--
ALTER TABLE `penginapan_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wisata_galleri`
--
ALTER TABLE `wisata_galleri`
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
-- AUTO_INCREMENT for table `kuliner_master`
--
ALTER TABLE `kuliner_master`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lupasandi_master`
--
ALTER TABLE `lupasandi_master`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `masjid_master`
--
ALTER TABLE `masjid_master`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `penginapan_master`
--
ALTER TABLE `penginapan_master`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_account`
--
ALTER TABLE `user_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wisata_galleri`
--
ALTER TABLE `wisata_galleri`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wisata_master`
--
ALTER TABLE `wisata_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
