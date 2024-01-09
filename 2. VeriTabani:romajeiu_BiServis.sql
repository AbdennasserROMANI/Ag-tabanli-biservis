-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 09 jan. 2024 à 17:03
-- Version du serveur : 10.5.20-MariaDB-cll-lve
-- Version de PHP : 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `romajeiu_BiServis`
--

-- --------------------------------------------------------

--
-- Structure de la table `adress`
--

CREATE TABLE `adress` (
  `ad_id` int(255) NOT NULL,
  `ad_city` varchar(500) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `ad_adress` varchar(500) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `wo_cu_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cocuk_yasli_table`
--

CREATE TABLE `cocuk_yasli_table` (
  `cy_id` int(255) NOT NULL,
  `cy_yas` int(3) NOT NULL,
  `cy_sex` varchar(10) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `sd_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `cocuk_yasli_table`
--

INSERT INTO `cocuk_yasli_table` (`cy_id`, `cy_yas`, `cy_sex`, `sd_id`) VALUES
(75, 3, 'Erkek', 126),
(76, 5, 'Kadın', 126),
(77, 70, 'Erkek', 127),
(78, 67, 'Kadın', 127),
(79, 75, 'Erkek', 127),
(80, 2, 'Erkek', 134),
(81, 67, 'Kadın', 135),
(82, 70, 'Erkek', 135),
(83, 7, 'Erkek', 142),
(84, 89, 'Erkek', 143),
(85, 1, 'Kadın', 150),
(86, 80, 'Kadın', 151),
(87, 3, 'Erkek', 158),
(88, 80, 'Erkek', 159),
(89, 2, 'Erkek', 166),
(90, 75, 'Erkek', 167),
(91, 3, 'Erkek', 174),
(92, 78, 'Erkek', 175),
(93, 3, 'Erkek', 182),
(94, 69, 'Erkek', 183),
(95, 4, 'Kadın', 190),
(96, 59, 'Kadın', 191),
(97, 7, 'Erkek', 198),
(98, 70, 'Kadın', 199),
(99, 5, 'Erkek', 201),
(100, 3, 'Erkek', 201),
(101, 0, 'Erkek', 201),
(102, 5, 'Erkek', 203),
(103, 8, 'Kadın', 203),
(104, 2, 'Erkek', 205),
(105, 3, 'Erkek', 205),
(106, 2, 'Erkek', 207),
(107, 3, 'Erkek', 207),
(108, 2, 'Erkek', 209),
(109, 3, 'Erkek', 209),
(110, 3, 'Erkek', 212),
(111, 6, 'Erkek', 212);

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

CREATE TABLE `customer` (
  `cu_id` int(255) NOT NULL,
  `cu_tc` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `cu_name` varchar(500) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `cu_password` varchar(1000) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `cu_city` varchar(500) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `cu_addres` varchar(5000) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `cu_posta` varchar(500) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `cu_tel` varchar(500) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `customer`
--

INSERT INTO `customer` (`cu_id`, `cu_tc`, `cu_name`, `cu_password`, `cu_city`, `cu_addres`, `cu_posta`, `cu_tel`) VALUES
(58, '99000000001', 'Musteri 01', 'musteri-01', 'Ankara', 'Musteri 01 Adresi', 'musteri-01@gmail.com', ' 90 555 111 11 11'),
(59, '99000000002', 'Musteri 02', 'musteri-02', 'Ankara', 'Musteri 02 Adresi', 'musteri-02@gmail.com', ' 90 555 222 22 22'),
(61, '99000000003', 'Musteri 03', 'musteri-03', 'Ankara', 'Musteri 03 Adresi', 'musteri-03@gmail.com', ' 90 555 333 33 33'),
(62, '99000000004', 'Musteri 04', 'musteri-04', 'Ankara', 'Musteri 04 Adresi', 'musteri-04@gmail.com', ' 90 555 444 44 44'),
(63, '99000000005', 'Musteri 05', 'musteri-05', 'Ankara', 'Musteri 05 Adresi', 'musteri-05@gmail.com', ' 90 555 555 55 55'),
(64, '99000000006', 'Musteri 06', 'musteri-06', 'Ankara', 'Musteri 06 Adresi', 'musteri-06@gmail.com', ' 90 555 666 66 66'),
(65, '99000000007', 'Musteri 07', 'musteri-07', 'Ankara', 'Musteri 07 Adresi', 'musteri-07@gmail.com', ' 90 555 777 77 77'),
(66, '99000000008', 'Musteri 08', 'musteri-08', 'Ankara', 'Musteri 08 Adresi', 'musteri-08@gmail.com', ' 90 555 888 88 88'),
(67, '99000000009', 'Musteri 09', 'musteri-09', 'Ankara', 'Musteri 09 Adresi', 'musteri-09@gmail.com', ' 90 555 999 99 99'),
(68, '99000000010', 'Musteri 10', 'musteri-10', 'Ankara', 'Musteri 10 Adresi', 'musteri-10@gmail.com', ' 90 555 101 10 10');

-- --------------------------------------------------------

--
-- Structure de la table `not_image_table`
--

CREATE TABLE `not_image_table` (
  `ni_id` int(255) NOT NULL,
  `ni_not` varchar(5100) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `ni_type` varchar(20) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `sd_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `servis_detay_table`
--

CREATE TABLE `servis_detay_table` (
  `sd_id` int(255) NOT NULL,
  `salon_count` int(255) NOT NULL,
  `salon_metresi` int(255) NOT NULL,
  `mutfak_count` int(255) NOT NULL,
  `mutfak_metresi` int(255) NOT NULL,
  `buro_count` int(255) NOT NULL,
  `buro_metresi` int(255) NOT NULL,
  `depo_count` int(255) NOT NULL,
  `depo_metresi` int(255) NOT NULL,
  `banyo_count` int(255) NOT NULL,
  `banyo_metresi` int(255) NOT NULL,
  `tuvalet_count` int(255) NOT NULL,
  `tuvalet_metresi` int(255) NOT NULL,
  `oda_count` int(255) NOT NULL,
  `oda_metresi` int(255) NOT NULL,
  `bahce_count` int(255) NOT NULL,
  `bahca_metresi` int(255) NOT NULL,
  `balkon_count` int(255) NOT NULL,
  `balkon_metresi` int(255) NOT NULL,
  `agac_count` int(255) NOT NULL,
  `sd_not` varchar(5100) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `saat_sayisi` int(255) NOT NULL,
  `gun_sayisi` int(255) NOT NULL,
  `order_date` varchar(20) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `baslangic_tarihi` varchar(20) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `cu_id` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `image` varchar(500) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `s_id` int(255) NOT NULL,
  `sd_stat` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `servis_detay_table`
--

INSERT INTO `servis_detay_table` (`sd_id`, `salon_count`, `salon_metresi`, `mutfak_count`, `mutfak_metresi`, `buro_count`, `buro_metresi`, `depo_count`, `depo_metresi`, `banyo_count`, `banyo_metresi`, `tuvalet_count`, `tuvalet_metresi`, `oda_count`, `oda_metresi`, `bahce_count`, `bahca_metresi`, `balkon_count`, `balkon_metresi`, `agac_count`, `sd_not`, `saat_sayisi`, `gun_sayisi`, `order_date`, `baslangic_tarihi`, `cu_id`, `image`, `s_id`, `sd_stat`) VALUES
(122, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 1 elektrikci notu', 0, 0, '02/01/2024', '2024-01-10T10:20', '99000000001', '', 3, 2),
(123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 1 Boyaci notu', 0, 0, '02/01/2024', '2024-01-11T07:19', '99000000001', '', 4, 2),
(124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 1 Marangoz notu', 0, 0, '02/01/2024', '2024-01-19T09:20', '99000000001', '', 5, 2),
(125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 100, 0, 0, 4, 'Musteri 1 Bahçıvan notu', 0, 0, '02/01/2024', '2024-01-17T07:15', '99000000001', '', 6, 2),
(126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 1 Çocuk Bakıcısı notu', 10, 3, '02/01/2024', '2024-01-16T07:25', '99000000001', '', 7, 1),
(127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 1 Yasli Bakıcısı notu', 4, 10, '02/01/2024', '2024-01-17T09:30', '99000000001', '', 8, 1),
(128, 1, 11, 1, 22, 1, 11, 2, 22, 2, 15, 2, 10, 3, 45, 0, 0, 2, 10, 0, 'Musteri 2 temizlikco notu', 0, 0, '02/01/2024', '2024-01-16T09:30', '', '', 1, 1),
(129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 2 Tesisatçınotu', 0, 0, '02/01/2024', '2024-01-10T09:31', '99000000002', '', 2, 1),
(130, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 2 Elektrikci notu', 0, 0, '02/01/2024', '2024-01-17T10:30', '99000000002', '', 3, 1),
(131, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 2 Boyaci notu', 0, 0, '02/01/2024', '2024-01-16T09:35', '99000000002', '', 4, 1),
(132, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 2 Marangoz notu', 0, 0, '02/01/2024', '2024-01-24T07:30', '99000000002', '', 5, 1),
(133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1000, 0, 0, 40, 'Musteri 2 Bahçıvan notu', 0, 0, '02/01/2024', '2024-01-02T05:29', '99000000002', '', 6, 1),
(134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 2 Çocuk Bakıcısı notu', 10, 3, '02/01/2024', '2024-01-17T09:31', '99000000002', '', 7, 1),
(135, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 2 Yasli Bakıcısı notu', 4, 10, '02/01/2024', '2024-01-17T08:35', '99000000002', '', 8, 1),
(136, 1, 11, 1, 22, 1, 11, 2, 22, 2, 15, 2, 10, 3, 45, 0, 0, 2, 10, 0, 'Musteri 3 temizlikco notu', 0, 0, '02/01/2024', '2024-01-08T08:30', '99000000003', '', 1, 1),
(137, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 3 Tesisatçı notu', 0, 0, '02/01/2024', '2024-01-10T10:35', '99000000003', '', 2, 1),
(138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 3 elektrikci notu', 0, 0, '02/01/2024', '2024-01-25T09:40', '99000000003', '', 3, 1),
(139, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 3 Boyaci notu', 0, 0, '02/01/2024', '2024-01-17T08:40', '99000000003', '', 4, 1),
(140, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 3 Marangoz notu', 0, 0, '02/01/2024', '2024-01-20T07:40', '99000000003', '', 5, 1),
(141, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1000, 0, 0, 40, 'Musteri 3 Bahçıvan notu', 0, 0, '02/01/2024', '2024-01-18T10:30', '99000000003', '', 6, 1),
(142, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 3 Çocuk Bakıcısı notu', 10, 3, '02/01/2024', '2024-01-18T09:40', '99000000003', '', 7, 1),
(143, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 3 Yasli Bakıcısı notu', 4, 10, '02/01/2024', '2024-01-19T09:40', '99000000003', '', 8, 1),
(144, 1, 11, 1, 22, 1, 11, 2, 22, 2, 15, 2, 10, 3, 45, 0, 0, 2, 10, 0, 'Musteri 4 temizlikco notu', 0, 0, '02/01/2024', '2024-01-24T09:45', '99000000004', '', 1, 1),
(145, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 4 Tesisatçı notu', 0, 0, '02/01/2024', '2024-01-25T07:45', '99000000004', '', 2, 2),
(146, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 4 elektrikci notu', 0, 0, '02/01/2024', '2024-01-24T09:45', '99000000004', '', 3, 1),
(147, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 4 Boyaci notu', 0, 0, '02/01/2024', '2024-01-27T08:45', '99000000004', '', 4, 1),
(148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 4 Marangoz notu', 0, 0, '02/01/2024', '2024-01-30T09:50', '99000000004', '', 5, 1),
(149, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1000, 0, 0, 40, 'Musteri 4 Bahçıvan notu', 0, 0, '02/01/2024', '2024-01-11T08:45', '99000000004', '', 6, 1),
(150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 4 Çocuk Bakıcısı notu', 10, 3, '02/01/2024', '2024-01-31T09:46', '99000000004', '', 7, 1),
(151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 4 Yasli Bakıcısı notu', 4, 10, '02/01/2024', '2024-01-25T10:45', '99000000004', '', 8, 1),
(152, 1, 11, 1, 22, 1, 11, 2, 22, 2, 15, 2, 10, 3, 45, 0, 0, 2, 10, 0, 'Musteri 5 temizlikco notu', 0, 0, '02/01/2024', '2024-01-20T08:50', '99000000005', '', 1, 1),
(153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 5 Tesisatçı notu', 0, 0, '02/01/2024', '2024-01-02T05:46', '99000000005', '', 2, 1),
(154, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 5 elektrikci notu', 0, 0, '02/01/2024', '2024-01-20T10:50', '99000000005', '', 2, 1),
(155, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 5 Boyaci notu', 0, 0, '02/01/2024', '2024-01-25T09:50', '99000000005', '', 4, 1),
(156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 5 Marangoz notu', 0, 0, '02/01/2024', '2024-01-24T09:50', '99000000005', '', 5, 1),
(157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1000, 0, 0, 40, 'Musteri 5 Bahçıvan notu', 0, 0, '02/01/2024', '2024-01-29T09:50', '99000000005', '', 6, 1),
(158, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 5 Çocuk Bakıcısı notu', 10, 3, '02/01/2024', '2024-01-23T07:50', '99000000005', '', 7, 1),
(159, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 5 Yasli Bakıcısı notu', 4, 10, '02/01/2024', '2024-01-30T11:55', '99000000005', '', 8, 1),
(160, 1, 11, 1, 22, 1, 11, 2, 22, 2, 15, 2, 10, 3, 45, 0, 0, 2, 10, 0, 'Musteri 6 temizlikco notu', 0, 0, '02/01/2024', '2024-01-30T10:55', '99000000006', '', 1, 1),
(161, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 1 Tesisatçınotu', 0, 0, '02/01/2024', '2024-01-31T07:55', '99000000006', '', 2, 1),
(162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 6 elektrikci notu', 0, 0, '02/01/2024', '2024-01-30T08:55', '99000000006', '', 3, 1),
(163, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 6 Boyaci notu', 0, 0, '02/01/2024', '2024-01-30T08:56', '99000000006', '', 4, 1),
(164, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 6 Marangoz notu', 0, 0, '02/01/2024', '2024-01-24T08:50', '99000000006', '', 5, 1),
(165, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1000, 0, 0, 40, 'Musteri 6 Bahçıvan notu', 0, 0, '02/01/2024', '2024-01-22T11:55', '99000000006', '', 6, 1),
(166, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 6 Çocuk Bakıcısı notu', 10, 3, '02/01/2024', '2024-01-28T10:55', '99000000006', '', 7, 1),
(167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 6 Yasli Bakıcısı notu', 4, 10, '02/01/2024', '2024-01-25T10:55', '99000000006', '', 8, 1),
(168, 1, 11, 1, 22, 1, 11, 2, 22, 2, 15, 2, 10, 3, 45, 0, 0, 2, 10, 0, 'Musteri 7 temizlikco notu', 0, 0, '02/01/2024', '2024-01-30T08:00', '99000000007', '', 1, 1),
(169, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 7 Tesisatçı notu', 0, 0, '02/01/2024', '2024-01-28T10:00', '99000000007', '', 2, 1),
(170, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 7 elektrikci notu', 0, 0, '02/01/2024', '2024-01-30T07:00', '99000000007', '', 3, 1),
(171, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 7 Boyaci notu', 0, 0, '02/01/2024', '2024-01-30T09:00', '99000000007', '', 4, 1),
(172, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 7 Marangoz notu', 0, 0, '02/01/2024', '2024-01-30T07:00', '99000000007', '', 5, 1),
(173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1000, 0, 0, 40, 'Musteri 7 Bahçıvan notu', 0, 0, '02/01/2024', '2024-01-30T08:05', '99000000007', '', 6, 1),
(174, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 7 Çocuk Bakıcısı notu', 10, 3, '02/01/2024', '2024-01-30T10:00', '99000000007', '', 7, 1),
(175, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 7 Yasli Bakıcısı notu', 4, 10, '02/01/2024', '2024-01-24T08:00', '99000000007', '', 8, 1),
(176, 1, 11, 1, 22, 1, 11, 2, 22, 2, 15, 2, 10, 3, 45, 0, 0, 2, 10, 0, 'Musteri 8 temizlikco notu', 0, 0, '02/01/2024', '2024-01-30T10:05', '99000000008', '', 1, 1),
(177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 8 Tesisatçı notu', 0, 0, '02/01/2024', '2024-01-30T09:05', '99000000008', '', 2, 1),
(178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 8 elektrikci notu', 0, 0, '02/01/2024', '2024-01-31T10:05', '99000000008', '', 3, 1),
(179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 1 Boyaci notu', 0, 0, '02/01/2024', '2024-02-03T10:05', '99000000008', '', 4, 1),
(180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 8 Marangoz notu', 0, 0, '02/01/2024', '2024-01-24T10:05', '99000000008', '', 5, 1),
(181, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1000, 0, 0, 40, 'Musteri 8 Bahçıvan notu', 0, 0, '02/01/2024', '2024-02-07T10:05', '99000000008', '', 6, 1),
(182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 8 Çocuk Bakıcısı notu', 10, 3, '02/01/2024', '2024-02-06T10:05', '99000000008', '', 7, 1),
(183, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 8 Yasli Bakıcısı notu', 4, 10, '02/01/2024', '2024-01-30T09:10', '99000000008', '', 8, 1),
(184, 1, 11, 1, 22, 1, 11, 2, 22, 2, 15, 2, 10, 3, 45, 0, 0, 2, 10, 0, 'Musteri 9 temizlikco notu', 0, 0, '02/01/2024', '2024-02-02T11:10', '99000000009', '', 1, 1),
(185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 9 Tesisatçı notu', 0, 0, '02/01/2024', '2024-01-30T10:10', '99000000009', '', 2, 1),
(186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 9 elektrikci notu', 0, 0, '02/01/2024', '2024-02-08T10:05', '99000000009', '', 3, 1),
(187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 9 Boyaci notu', 0, 0, '02/01/2024', '2024-02-05T11:00', '99000000009', '', 4, 1),
(188, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 9 Marangoz notu', 0, 0, '02/01/2024', '2024-02-08T10:05', '99000000009', '', 5, 1),
(189, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1000, 0, 0, 40, 'Musteri 9 Bahçıvan notu', 0, 0, '02/01/2024', '2024-02-07T10:05', '99000000009', '', 6, 1),
(190, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 9 Çocuk Bakıcısı notu', 10, 3, '02/01/2024', '2024-01-26T11:10', '99000000009', '', 7, 1),
(191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 9 Yasli Bakıcısı notu', 4, 10, '02/01/2024', '2024-02-05T10:10', '99000000009', '', 8, 1),
(192, 1, 11, 1, 22, 1, 11, 2, 22, 2, 15, 2, 10, 3, 45, 0, 0, 2, 10, 0, 'Musteri 10 temizlikco notu', 0, 0, '02/01/2024', '2024-01-31T10:10', '99000000010', '', 1, 1),
(193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 10 Tesisatçı notu', 0, 0, '02/01/2024', '2024-02-10T00:10', '99000000010', '', 2, 2),
(194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 10 elektrikci notu', 0, 0, '02/01/2024', '2024-02-06T10:15', '99000000010', '', 3, 1),
(195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 10 Boyaci notu', 0, 0, '02/01/2024', '2024-02-07T10:10', '99000000010', '', 4, 1),
(196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 10 Marangoz notu', 0, 0, '02/01/2024', '2024-02-10T00:10', '99000000010', '', 5, 1),
(197, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1000, 0, 0, 40, 'Musteri 10 Bahçıvan notu', 0, 0, '02/01/2024', '2024-02-09T11:10', '99000000010', '', 6, 1),
(198, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 10 Çocuk Bakıcısı notu', 10, 3, '02/01/2024', '2024-01-30T00:10', '99000000010', '', 7, 1),
(199, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Musteri 10 Yasli Bakıcısı notu', 4, 10, '02/01/2024', '2024-02-10T10:10', '99000000010', '', 8, 1),
(200, 2, 25, 1, 50, 3, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'acil\n', 0, 0, '2024-01-07', '2024-01-10T13:05', '99000000001', '', 1, 1),
(201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '2024-01-07', '2024-01-07T15:48', '99000000001', '', 7, 1),
(202, 2, 60, 1, 25, 6, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Acil', 0, 0, '2024-01-07', '2024-01-09T22:10', '99000000001', '', 1, 1),
(203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '2024-01-07', '2024-01-07T15:51', '99000000001', '', 7, 1),
(204, 5, 67, 2, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'acil', 0, 0, '2024-01-07', '2024-01-10T23:56', '99000000001', '', 1, 1),
(205, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '2024-01-07', '2024-01-07T15:57', '99000000001', '', 7, 1),
(206, 2, 30, 6, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Acil', 0, 0, '2024-01-07', '2024-01-17T22:10', '99000000001', '', 1, 1),
(207, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '2024-01-07', '2024-01-07T16:05', '99000000001', '', 7, 1),
(208, 2, 25, 3, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'acil', 0, 0, '2024-01-07', '2024-01-17T02:18', '99000000001', '', 1, 1),
(209, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '2024-01-07', '2024-01-07T16:19', '99000000001', '', 7, 1),
(210, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'işlemler ', 0, 0, '2024-01-07', '2024-01-07T16:27', '99000000001', '', 2, 2),
(211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'işlem ', 0, 0, '2024-01-07', '2024-01-10T11:05', '99000000001', '', 2, 1),
(212, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '2024-01-07', '2024-01-07T16:32', '99000000001', '', 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `servis_table`
--

CREATE TABLE `servis_table` (
  `s_id` int(255) NOT NULL,
  `s_name` varchar(500) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `s_logo` varchar(500) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `s_view_mode` varchar(11) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `servis_table`
--

INSERT INTO `servis_table` (`s_id`, `s_name`, `s_logo`, `s_view_mode`) VALUES
(1, 'Temizleyici', 'https://romani-au.digital/project_files/uploads/servis_image/1.png', 'M1'),
(2, 'Tesisatçı', 'https://romani-au.digital/project_files/uploads/servis_image/2.png', 'M2'),
(3, 'Electrikçi', 'https://romani-au.digital/project_files/uploads/servis_image/3.png', 'M2'),
(4, 'Boyacı', 'https://romani-au.digital/project_files/uploads/servis_image/4.png', 'M2'),
(5, 'Marangoz', 'https://romani-au.digital/project_files/uploads/servis_image/5.png', 'M2'),
(6, 'Bahçıvan', 'https://romani-au.digital/project_files/uploads/servis_image/6.png', 'M3'),
(7, 'Çocuk bakıcısı', 'https://romani-au.digital/project_files/uploads/servis_image/7.png', 'M4'),
(8, 'Yaşlı bakıcısı', 'https://romani-au.digital/project_files/uploads/servis_image/8.png', 'M5');

-- --------------------------------------------------------

--
-- Structure de la table `tekifler_table`
--

CREATE TABLE `tekifler_table` (
  `te_id` int(255) NOT NULL,
  `te_fiyat` int(10) NOT NULL,
  `te_date` varchar(20) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `te_stat` int(3) NOT NULL,
  `sd_id` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `wo_id` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `cu_stat` int(1) NOT NULL DEFAULT 0,
  `wo_stat` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `tekifler_table`
--

INSERT INTO `tekifler_table` (`te_id`, `te_fiyat`, `te_date`, `te_stat`, `sd_id`, `wo_id`, `cu_stat`, `wo_stat`) VALUES
(42, 1000, '02/01/2024', 1, '121', '991111111111', 0, 0),
(43, 6830, '2024-01-07', 0, '129', '991111111111', 0, 0),
(44, 6560, '2024-01-07', 0, '137', '991111111111', 0, 0),
(45, 64683, '2024-01-07', 1, '210', '991111111111', 0, 0),
(46, 2000, '2024-01-07', 1, '211', '991111111111', 0, 0),
(47, 6500, '09/01/2024', 0, '193', '991111111111', 0, 0),
(48, 4800, '09/01/2024', 0, '193', '991111111112', 0, 0),
(49, 5200, '09/01/2024', 0, '193', '991111111113', 0, 0),
(50, 3900, '09/01/2024', 1, '193', '991111111114', 0, 0),
(51, 8500, '09/01/2024', 1, '192', '991111111115', 0, 0),
(52, 7600, '09/01/2024', -1, '192', '991111111116', 0, 0),
(53, 9200, '09/01/2024', 0, '195', '991111111119', 0, 0),
(54, 4500, '09/01/2024', 0, '137', '991111111113', 0, 0),
(55, 6000, '09/01/2024', 1, '145', '991111111113', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int(255) NOT NULL,
  `user_name` varchar(1000) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `user_email` varchar(1000) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `user_password` varchar(1000) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(1, 'AbdennasserROMANI', 'abdo.romani1996@gmail.com', 'AbdennasserROMANI1996'),
(2, 'test', 'abr.romani19@gmail.com', '123');

-- --------------------------------------------------------

--
-- Structure de la table `worker_table`
--

CREATE TABLE `worker_table` (
  `wo_id` int(255) NOT NULL,
  `wo_tc` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `wo_name` varchar(500) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `wo_image` varchar(500) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `wo_posta` varchar(500) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `wo_tel` varchar(200) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `wo_city` varchar(500) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `wo_addres` varchar(2000) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `wo_bolum` varchar(50) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `wo_tecrube` varchar(2) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `wo_not` varchar(2000) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `worker_table`
--

INSERT INTO `worker_table` (`wo_id`, `wo_tc`, `wo_name`, `wo_image`, `wo_posta`, `password`, `wo_tel`, `wo_city`, `wo_addres`, `wo_bolum`, `wo_tecrube`, `wo_not`) VALUES
(39, '991111111111', 'Calisan 01', '991111111111.jpg', 'calisan-01@gmail.com', 'calisan-01', ' 90 111 111 11 11', 'Ankara', 'Calisan01 Adresi', '2', '2', 'Calisan 01 Notu'),
(40, '991111111112', 'Calisan 02', '991111111112.jpg', 'calisan-02@gmail.com', 'calisan-02', ' 90 111 111 22 22', 'Ankara', 'Calisan02 Adresi', '2', '2', 'Calisan 02 Notu'),
(41, '991111111113', 'Calisan 03', '991111111113.jpg', 'calisan-03@gmail.com', 'calisan-03', ' 90 111 111 33 33', 'Ankara', 'Calisan03 Adresi', '2', '4', 'Calisan 03 Notu'),
(42, '991111111114', 'Calisan 04', '991111111114.jpg', 'calisan-04@gmail.com', 'calisan-04', ' 90 111 111 44 44', 'Ankara', 'Calisan04 Adresi', '2', '3', 'Calisan 04 Notu'),
(43, '991111111115', 'Calisan 05', '991111111115.jpg', 'calisan-05@gmail.com', 'calisan-05', ' 90 111 111 55 55', 'Ankara', 'Calisan05 Adresi', '1', '3', 'Calisan 05 Notu'),
(44, '991111111116', 'Calisan 06', '991111111116.jpg', 'calisan-06@gmail.com', 'calisan-06', ' 90 111 111 66 66', 'Ankara', 'Calisan05 Adresi', '1', '4', 'Calisan 06 Notu'),
(45, '991111111117', 'Calisan 07', '991111111117.jpg', 'calisan-07@gmail.com', 'calisan-07', ' 90 111 111 77 77', 'Ankara', 'Calisan07 Adresi', '1', '2', 'Calisan 07 Notu'),
(46, '991111111118', 'Calisan 08', '991111111118.jpg', 'calisan-08@gmail.com', 'calisan-08', ' 90 111 111 88 88', 'Ankara', 'Calisan08 Adresi', '1', '5', 'Calisan 08 Notu'),
(47, '991111111119', 'Calisan 09', '991111111119.jpg', 'calisan-09@gmail.com', 'calisan-09', ' 90 111 111 99 99', 'Ankara', 'Calisan09 Adresi', '4', '5', 'Calisan 09 Notu'),
(48, '991111111010', 'Calisan 10', '991111111010.jpg', 'calisan-10@gmail.com', 'calisan-10', ' 90 111 111 01 10', 'Ankara', 'Calisan10 Adresi', '4', '4', 'Calisan 10 Notu'),
(49, '991111111011', 'Calisan 11', '991111111011.jpg', 'calisan-11@gmail.com', 'calisan-11', ' 90 111 111 01 11', 'Ankara', 'Calisan11 Adresi', '4', '6', 'Calisan 11 Notu'),
(50, '991111111012', 'Calisan 12', '991111111012.jpg', 'calisan-12@gmail.com', 'calisan-12', ' 90 111 111 01 12', 'Ankara', 'Calisan12 Adresi', '4', '3', 'Calisan 12 Notu'),
(51, '991111111013', 'Calisan 13', '991111111013.jpg', 'calisan-13@gmail.com', 'calisan-13', ' 90 111 111 01 13', 'Ankara', 'Calisan13 Adresi', '8', '3', 'Calisan 13 Notu'),
(52, '991111111014', 'Calisan 14', '991111111014.jpg', 'calisan-14@gmail.com', 'calisan-14', ' 90 111 111 01 14', 'Ankara', 'Calisan14 Adresi', '8', '4', 'Calisan 14 Notu'),
(53, '991111111015', 'Calisan 15', '991111111015.jpg', 'calisan-15@gmail.com', 'calisan-15', ' 90 111 111 01 15', 'Ankara', 'Calisan15 Adresi', '8', '6', 'Calisan 15 Notu'),
(54, '991111111016', 'Calisan 16', '991111111016.jpg', 'calisan-16@gmail.com', 'calisan-16', ' 90 111 111 01 16', 'Ankara', 'Calisan16 Adresi', '8', '1', 'Calisan 16 Notu'),
(55, '991111111017', 'Calisan 17', '991111111017.jpg', 'calisan-17@gmail.com', 'calisan-17', ' 90 111 111 01 17', 'Ankara', 'Calisan17 Adresi', '7', '4', 'Calisan 17 Notu'),
(56, '991111111018', 'Calisan 18', '991111111018.jpg', 'calisan-18@gmail.com', 'calisan-18', ' 90 111 111 01 18', 'Ankara', 'Calisan18 Adresi', '7', '2', 'Calisan 18 Notu'),
(57, '991111111019', 'Calisan 19', '991111111019.jpg', 'calisan-19@gmail.com', 'calisan-19', ' 90 111 111 01 19', 'Ankara', 'Calisan19 Adresi', '7', '1', 'Calisan 19 Notu'),
(58, '991111111020', 'Calisan 20', '991111111020.jpg', 'calisan-20@gmail.com', 'calisan-20', ' 90 111 111 01 20', 'Ankara', 'Calisan20 Adresi', '7', '3', 'Calisan 20 Notu'),
(59, '991111111021', 'Calisan 21', '991111111021.jpg', 'calisan-21@gmail.com', 'calisan-21', ' 90 111 111 01 21', 'Ankara', 'Calisan21 Adresi', '5', '3', 'Calisan 21 Notu'),
(60, '991111111022', 'Calisan 22', '991111111022.jpg', 'calisan-22@gmail.com', 'calisan-22', ' 90 111 111 01 22', 'Ankara', 'Calisan22 Adresi', '5', '6', 'Calisan 22 Notu'),
(61, '991111111023', 'Calisan 23', '991111111023.jpg', 'calisan-23@gmail.com', 'calisan-23', ' 90 111 111 01 23', 'Ankara', 'Calisan23 Adresi', '5', '4', 'Calisan 23 Notu'),
(62, '991111111024', 'Calisan 24', '991111111024.jpg', 'calisan-24@gmail.com', 'calisan-24', ' 90 111 111 01 24', 'Ankara', 'Calisan24 Adresi', '5', '5', 'Calisan 24 Notu'),
(63, '991111111025', 'Calisan 25', '991111111025.jpg', 'calisan-25@gmail.com', 'calisan-25', ' 90 111 111 01 25', 'Ankara', 'Calisan25 Adresi', '6', '7', 'Calisan 25 Notu'),
(64, '991111111026', 'Calisan 26', '991111111026.jpg', 'calisan-26@gmail.com', 'calisan-26', ' 90 111 111 01 26', 'Ankara', 'Calisan26 Adresi', '6', '4', 'Calisan 26 Notu'),
(65, '991111111027', 'Calisan 27', '991111111027.jpg', 'calisan-27@gmail.com', 'calisan-27', ' 90 111 111 01 27', 'Ankara', 'Calisan27 Adresi', '6', '7', 'Calisan 27 Notu'),
(66, '991111111028', 'Calisan 28', '991111111028.jpg', 'calisan-28@gmail.com', 'calisan-28', ' 90 111 111 01 28', 'Ankara', 'Calisan28 Adresi', '6', '5', 'Calisan 28 Notu'),
(67, '991111111029', 'Calisan 29', '991111111029.jpg', 'calisan-29@gmail.com', 'calisan-29', ' 90 111 111 01 29', 'Ankara', 'Calisan29 Adresi', '3', '2', 'Calisan 29 Notu'),
(68, '991111111030', 'Calisan 30', '991111111030.jpg', 'calisan-30@gmail.com', 'calisan-30', ' 90 111 111 01 30', 'Ankara', 'Calisan30 Adresi', '3', '6', 'Calisan 30 Notu'),
(69, '991111111031', 'Calisan 31', '991111111031.jpg', 'calisan-31@gmail.com', 'calisan-31', ' 90 111 111 01 31', 'Ankara', 'Calisan31 Adresi', '3', '4', 'Calisan 31 Notu'),
(70, '991111111032', 'Calisan 32', '991111111032.jpg', 'calisan-32@gmail.com', 'calisan-32', ' 90 111 111 01 32', 'Ankara', 'Calisan32 Adresi', '3', '7', 'Calisan 32 Notu');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`ad_id`);

--
-- Index pour la table `cocuk_yasli_table`
--
ALTER TABLE `cocuk_yasli_table`
  ADD PRIMARY KEY (`cy_id`);

--
-- Index pour la table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cu_id`),
  ADD UNIQUE KEY `cu_tc` (`cu_tc`);

--
-- Index pour la table `not_image_table`
--
ALTER TABLE `not_image_table`
  ADD PRIMARY KEY (`ni_id`);

--
-- Index pour la table `servis_detay_table`
--
ALTER TABLE `servis_detay_table`
  ADD PRIMARY KEY (`sd_id`);

--
-- Index pour la table `servis_table`
--
ALTER TABLE `servis_table`
  ADD PRIMARY KEY (`s_id`);

--
-- Index pour la table `tekifler_table`
--
ALTER TABLE `tekifler_table`
  ADD PRIMARY KEY (`te_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Index pour la table `worker_table`
--
ALTER TABLE `worker_table`
  ADD PRIMARY KEY (`wo_id`),
  ADD UNIQUE KEY `wo_tc` (`wo_tc`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adress`
--
ALTER TABLE `adress`
  MODIFY `ad_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cocuk_yasli_table`
--
ALTER TABLE `cocuk_yasli_table`
  MODIFY `cy_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT pour la table `customer`
--
ALTER TABLE `customer`
  MODIFY `cu_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT pour la table `not_image_table`
--
ALTER TABLE `not_image_table`
  MODIFY `ni_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `servis_detay_table`
--
ALTER TABLE `servis_detay_table`
  MODIFY `sd_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT pour la table `servis_table`
--
ALTER TABLE `servis_table`
  MODIFY `s_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `tekifler_table`
--
ALTER TABLE `tekifler_table`
  MODIFY `te_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `worker_table`
--
ALTER TABLE `worker_table`
  MODIFY `wo_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
