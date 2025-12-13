-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Des 2025 pada 07.56
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nike db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `athlete_interest`
--

CREATE TABLE `athlete_interest` (
  `ID_ATHLETES_INTEREST` int(11) NOT NULL,
  `SHACARRI_RICHARDSON` tinyint(1) DEFAULT NULL,
  `CHRISTIANO_RONALDO` tinyint(1) DEFAULT NULL,
  `ERLING_HAALAND` tinyint(1) DEFAULT NULL,
  `KYLIAN_MBAPPE` tinyint(1) DEFAULT NULL,
  `GIANNIS_ANTETOKOUNMPO` tinyint(1) DEFAULT NULL,
  `JA_MORANT` tinyint(1) DEFAULT NULL,
  `JAYSON_TATUM` tinyint(1) DEFAULT NULL,
  `KEVIN_DURANT` tinyint(1) DEFAULT NULL,
  `KOBE_BRYANT` tinyint(1) DEFAULT NULL,
  `LEBRON_JAMES` tinyint(1) DEFAULT NULL,
  `LUKA_DONCIC` tinyint(1) DEFAULT NULL,
  `PAUL_GEORGE` tinyint(1) DEFAULT NULL,
  `RUSSEL_WESTBROOK` tinyint(1) DEFAULT NULL,
  `ZION_WILLIAMSON` tinyint(1) DEFAULT NULL,
  `NAOMI_OSAKA` tinyint(1) DEFAULT NULL,
  `SERENA_WILLIAMS` tinyint(1) DEFAULT NULL,
  `JUJU_WATKINS` tinyint(1) DEFAULT NULL,
  `AJA_WILSON` tinyint(1) DEFAULT NULL,
  `CAITLIN_CLARK` tinyint(1) DEFAULT NULL,
  `SABRINA_LONESCU` tinyint(1) DEFAULT NULL,
  `ATHLETE_INTERST_UPDATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bag`
--

CREATE TABLE `bag` (
  `ID_BAG` int(11) NOT NULL,
  `TOTAL_ITEM` int(11) DEFAULT NULL,
  `SUB_TOTAL_PRICE` decimal(33,2) DEFAULT NULL,
  `ESTIMATED_DELIVERY___HANDLING` decimal(18,2) DEFAULT NULL,
  `TOTAL_PRICE` decimal(33,2) DEFAULT NULL,
  `SUB_TOTAL_ORIGINAL_PRICE` decimal(33,2) DEFAULT NULL,
  `TOTAL_ORIGINAL_PRICE` decimal(33,2) DEFAULT NULL,
  `BAG_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `BAG_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bag_item_pcs`
--

CREATE TABLE `bag_item_pcs` (
  `ID_ITEM_PCS` int(11) NOT NULL,
  `ID_CHECKOUT` int(11) NOT NULL,
  `ID_BAG` int(11) NOT NULL,
  `TOTAL_ITEM_PCS` int(11) DEFAULT NULL,
  `TOTAL_PRICE_PCS` decimal(33,2) DEFAULT NULL,
  `TOTAL_ORIGINAL_PRICE_PCS` decimal(33,2) DEFAULT NULL,
  `BAG_ITEM_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `BAG_ITEM_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `checkout`
--

CREATE TABLE `checkout` (
  `ID_CHECKOUT` int(11) NOT NULL,
  `DUTIES___TAXES` decimal(33,2) DEFAULT NULL,
  `FREE_SHIPPING` tinyint(1) DEFAULT NULL,
  `PREMIUM_SHIPPING` decimal(33,2) DEFAULT NULL,
  `FIRST_ARRIVAL_ESTIMATION` date DEFAULT NULL,
  `SECOND_ARRIVAL_ESTIMATION` date DEFAULT NULL,
  `PROMO_CODE` varchar(30) DEFAULT NULL,
  `TOTAL_COST` decimal(33,2) DEFAULT NULL,
  `ADDRESS_LINE_1` varchar(50) DEFAULT NULL,
  `ADDRESS_LINE_2` varchar(50) DEFAULT NULL,
  `ADDRESS_LINE_3` varchar(50) DEFAULT NULL,
  `SAVE_ADDRESS_TO_PROFILE` tinyint(1) DEFAULT NULL,
  `MAKE_THIS_MY_PREFERRED_ADDRESS` tinyint(1) DEFAULT NULL,
  `SAVE_NATIONAL_ID_DETAIL_TO_NIKE_PROFILE` tinyint(1) DEFAULT NULL,
  `BILLING_MATCHES_SHIPPING_ADDRESS` tinyint(1) DEFAULT NULL,
  `FULL_NAME_PAYMENT_CARD` varchar(50) DEFAULT NULL,
  `PAYMENT_CARD_EXPIRY_DATE` date DEFAULT NULL,
  `PAYMENT_CARD_SECURITY_CODE` varchar(30) DEFAULT NULL,
  `SAVE_CARD_FOR_LATER_USE` tinyint(1) DEFAULT NULL,
  `CHECKOUT_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CHECKOUT_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `CHECKOUT_FIRST_NAME` varchar(25) DEFAULT NULL,
  `CHECKOUT_LAST_NAME` varchar(25) DEFAULT NULL,
  `CHECKOUT_POSTAL_CODE` varchar(20) DEFAULT NULL,
  `CHECKOUT_CITY` varchar(50) DEFAULT NULL,
  `CHECKOUT_STATE_PROVINCE` varchar(30) DEFAULT NULL,
  `CHECKOUT_PHONE_NUMBER` varchar(30) DEFAULT NULL,
  `CHECKOUT_NPWP` varchar(30) DEFAULT NULL,
  `CHECKOUT_PASSPORT_NUMBER` varchar(30) DEFAULT NULL,
  `CHECKOUT_PASSPORT_EXPIRY_DATE` date DEFAULT NULL,
  `CHECKOUT_PAYMENT_CARD_NUMBER` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `citizen_national_id`
--

CREATE TABLE `citizen_national_id` (
  `CITIZEN_TYPE` varchar(25) DEFAULT NULL,
  `NATIONAL_ID` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `NPWP` varchar(20) DEFAULT NULL,
  `PASSPORT_NUMBER` varchar(30) DEFAULT NULL,
  `PASSPORT_EXPIRY_DATE` date DEFAULT NULL,
  `CITIZEN_NATIONAL_ID_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CITIZEN_NATIONAL_ID_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `city_interest`
--

CREATE TABLE `city_interest` (
  `ID_CITY_INTEREST` int(11) NOT NULL,
  `BANGKOK` tinyint(1) DEFAULT NULL,
  `MANILA` tinyint(1) DEFAULT NULL,
  `NEW_YORK_CITY` tinyint(1) DEFAULT NULL,
  `SINGAPORE` tinyint(1) DEFAULT NULL,
  `CITY_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CITY_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `communication_preferences`
--

CREATE TABLE `communication_preferences` (
  `SEND_ME_EMAILS` tinyint(1) DEFAULT NULL,
  `ID_COMMUNICATION_PREFERENCES` int(11) NOT NULL,
  `COMMUNICATION_PREFERENCES_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `COMMUNICATION_PREFERENCES_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `delivery_address`
--

CREATE TABLE `delivery_address` (
  `ADDRESS_ID` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `TOWN_VILLAGE` varchar(100) DEFAULT NULL,
  `IS_DEFAULT` tinyint(1) DEFAULT NULL,
  `DELIVERY_ADDRESS_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `DELIVERY_ADDRESS_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DELIVERY_ADDRESS_FIRST_NAME` varchar(25) DEFAULT NULL,
  `DELIVERY_ADDRESS_LAST_NAME` varchar(25) DEFAULT NULL,
  `DELIVERY_STREET_ADDRESS` varchar(255) DEFAULT NULL,
  `DELIVERY_ADDRESS_APT_SUITE_BUILDING` varchar(100) DEFAULT NULL,
  `DELIVERY_ADDRESS_POSTCODE` varchar(20) DEFAULT NULL,
  `DELIVERY_ADDRESS_CITY` varchar(50) DEFAULT NULL,
  `DELIVERY_ADDRESS_PROVINCE` varchar(50) DEFAULT NULL,
  `DELIVERY_ADDRESS_COUNTRY` varchar(50) DEFAULT NULL,
  `DELIVERY_ADDRESS_PHONE_NUMBER` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `favourite`
--

CREATE TABLE `favourite` (
  `FAVOURITE_ID` int(11) NOT NULL,
  `FAVOURITE_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FAVOURITE_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_card`
--

CREATE TABLE `payment_card` (
  `FULL_NAME` varchar(50) DEFAULT NULL,
  `PAYMENT_CARD_NUMBER` varchar(50) DEFAULT NULL,
  `EXPIRY_DATE` date DEFAULT NULL,
  `ID_PAYMENT_CARD` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `PAYMENT_CARD_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `PAYMENT_CARD_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `privacy`
--

CREATE TABLE `privacy` (
  `PERSONALISED_ADVERTISING` tinyint(1) DEFAULT NULL,
  `PROFILE_BASED_PERSONALISED_ADVERTISING` tinyint(1) DEFAULT NULL,
  `USE_WORKOUT_DATA` tinyint(1) DEFAULT NULL,
  `ID_PRIVACY` int(11) NOT NULL,
  `PRIVACY_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `PRIVACY_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `ID_PRODUCT` int(11) NOT NULL,
  `PRODUCT_NAME` varchar(50) DEFAULT NULL,
  `PRODUCT_DESCRIPTION` text DEFAULT NULL,
  `PRODUCT_BENEFITS` text DEFAULT NULL,
  `PRODUCT_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `PRODUCT_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`ID_PRODUCT`, `PRODUCT_NAME`, `PRODUCT_DESCRIPTION`, `PRODUCT_BENEFITS`, `PRODUCT_CREATED_AT`, `PRODUCT_UPDATED_AT`) VALUES
(1, 'Nike Field General', 'The Field General returns from its gritty American football roots to shake up the sneaker scene. It pairs soft suede and durable woven textiles with a nubby Waffle sole—creating that vintage gridiron look.', 'Layers of suede and textile create a retro look that\'s built to last.\r\nWaffle outsole provides grip, while a full cupsole stitch adds durability.', '2025-12-07 13:03:16', '2025-12-07 13:03:16'),
(2, 'Nike V5 RNR', 'Tackle the every day in a shoe that matches comfort with style. Staying true to its Y2K roots, the V5 RNR has a foam midsole that\'s chunky yet lightweight. Plus, metallic details and a 3D Swoosh logo elevate this retro runner.', 'Mesh upper with synthetic leather overlays is breathable and durable.\r\nThe plush collar lining and foam midsole provide all-day comfort.\r\nThe rubber outsole with \'00s-inspired grooves adds great traction.', '2025-12-08 01:03:44', '2025-12-08 01:03:44'),
(3, 'Nike Killshot 2', 'Inspired by our original tennis shoe, the Killshot 2 gets refreshed with soft suede and smooth leather. A gum rubber outsole adds a retro touch that is as durable as it is comfortable.', 'Suede upper with leather Swoosh logo softens and gains vintage character with wear.\r\nThe gum rubber sole adds a retro look and durable traction.', '2025-12-08 01:20:27', '2025-12-08 01:20:27'),
(4, 'Nike Air Force 1 Low Retro', 'Comfortable, durable and timeless—it\'s number 1 for a reason. The classic \'80s construction pairs with bold details for style that tracks whether you\'re on court or on the go.\r\n\r\n', 'Stitched overlays on the upper add heritage style, durability and support.\r\nOriginally designed for performance hoops, Nike Air cushioning adds lightweight, all-day comfort.\r\nLow-cut silhouette adds a clean, streamlined look.\r\nPadded collar feels soft and comfortable.', '2025-12-08 01:40:49', '2025-12-08 01:40:49'),
(5, 'Nike Zoom Vomero 5', 'Carve a new lane for yourself in the Zoom Vomero 5—your go-to for complexity, depth and easy styling. The richly layered design includes textiles, leather and plastic accents that come together to make one of the coolest sneakers of the season.', 'The upper mixes real and synthetic leather for a layered look built to last.\r\nMesh panels and ventilation ports on the heel keep it light and breathable.\r\nSnappy and responsive, Zoom Air cushioning helps provide a quick-off-the-ground sensation.\r\nPlastic caging on the side creates a supportive feel.\r\nRubber outsole gives you durable traction.', '2025-12-08 01:59:45', '2025-12-08 01:59:45'),
(6, 'Nike Dunk Low SE', 'You can always count on a classic. The Dunk Low pairs its iconic colour-blocking with charm details and plush padding for game-changing comfort. The possibilities are endless—how will you wear your Dunks?', 'Leather upper softens and gains vintage character with wear.\r\nFoam midsole offers lightweight cushioning.\r\nThe rubber outsole with classic pivot circle adds durable traction and heritage style.', '2025-12-08 03:17:44', '2025-12-08 03:17:44'),
(7, 'Nike Dunk Low Next Nature', 'You can always count on a classic. The Dunk Low pair iconic colour-blocking with premium materials and plush padding for game-changing comfort that lasts. The styling possibilities are endless—how will you wear your Dunks?', 'Upper softens and gains vintage character with wear.\r\nFoam midsole offers lightweight, responsive cushioning.\r\nThe rubber outsole with classic pivot circle adds durable traction and heritage style.', '2025-12-08 03:30:25', '2025-12-08 03:30:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_detail`
--

CREATE TABLE `product_detail` (
  `ID_PRODUCT_DETAIL` int(11) NOT NULL,
  `ID_PRODUCT` int(11) NOT NULL,
  `PRODUCT_PRICE` decimal(15,2) DEFAULT NULL,
  `PRODUCT_DISCOUNT` decimal(5,4) DEFAULT NULL,
  `PRICE_AFTER_DISCOUNT` decimal(15,2) DEFAULT NULL,
  `PRODUCT_LABEL` varchar(30) DEFAULT NULL,
  `COLOR_SHOWN` varchar(128) DEFAULT NULL,
  `PRODUCT_STYLE` varchar(18) DEFAULT NULL,
  `PRODUCT_COUNTRY_ORIGIN` varchar(128) DEFAULT NULL,
  `IMAGE_THUMBNAIL_1_PATH_FILE` varchar(255) DEFAULT NULL,
  `IMAGE_THUMBNAIL_2_PATHFILE` varchar(255) DEFAULT NULL,
  `IMAGE_THUMBNAIL_3_PATH_FILE` varchar(255) DEFAULT NULL,
  `IMAGE_THUMBNAIL_4_PATH_FILE` varchar(255) DEFAULT NULL,
  `PRODUCT_CATEGORY` varchar(128) DEFAULT NULL,
  `PRODUCT_DETAIL_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `PRODUCT_DETAIL_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `product_detail`
--

INSERT INTO `product_detail` (`ID_PRODUCT_DETAIL`, `ID_PRODUCT`, `PRODUCT_PRICE`, `PRODUCT_DISCOUNT`, `PRICE_AFTER_DISCOUNT`, `PRODUCT_LABEL`, `COLOR_SHOWN`, `PRODUCT_STYLE`, `PRODUCT_COUNTRY_ORIGIN`, `IMAGE_THUMBNAIL_1_PATH_FILE`, `IMAGE_THUMBNAIL_2_PATHFILE`, `IMAGE_THUMBNAIL_3_PATH_FILE`, `IMAGE_THUMBNAIL_4_PATH_FILE`, `PRODUCT_CATEGORY`, `PRODUCT_DETAIL_CREATED_AT`, `PRODUCT_DETAIL_UPDATED_AT`) VALUES
(1, 1, 1549000.00, 0.0000, 1549000.00, '', 'Black/Black/White', 'HF3165-001', 'China', '../image/NIKE+FIELD+GENERAL.png', '../image/NIKE+FIELD+GENERAL (1).png', '../image/NIKE+FIELD+GENERAL (2).png', '../image/NIKE+FIELD+GENERAL (3).png', 'Men\'s Shoes', '2025-12-07 23:50:39', '2025-12-07 23:50:39'),
(2, 1, 1549000.00, 0.2000, 1239200.00, '', 'Pale Ivory/Gum Yellow/Midnight Navy', 'HF3165-102', 'China', '../image/NIKE+FIELD+GENERAL pale.png', '../image/NIKE+FIELD+GENERAL pale (1).png', '../image/NIKE+FIELD+GENERAL pale (2).png', '../image/NIKE+FIELD+GENERAL pale (3).png', 'Men\'s Shoes', '2025-12-07 23:50:39', '2025-12-07 23:50:39'),
(3, 1, 1549000.00, 0.2000, 1239200.00, '', 'Pale Ivory/Gum Yellow/Picante Red', 'HF3165-104', 'China', '../image/NIKE+FIELD+GENERAL picante red.png', '../image/NIKE+FIELD+GENERAL picante red (1).png', '../image/NIKE+FIELD+GENERAL picante red (2).png', '../image/NIKE+FIELD+GENERAL picante red (3).png', 'Men\'s Shoes', '2025-12-07 23:50:39', '2025-12-07 23:50:39'),
(4, 1, 1549000.00, 0.2000, 1238000.00, '', 'Pale Ivory/Gum Yellow/Safety Orange', 'HF3165-105', 'China', '../image/NIKE+FIELD+GENERAL Safety Orange.png', '../image/NIKE+FIELD+GENERAL Safety Orange (1).png', '../image/NIKE+FIELD+GENERAL Safety Orange (2).png', '../image/NIKE+FIELD+GENERAL Safety Orange (3).png', 'Men\'s Shoes', '2025-12-07 23:50:39', '2025-12-07 23:50:39'),
(5, 1, 1549000.00, 0.2000, 1238000.00, '', 'Pale Ivory/Gum Yellow/Dusty Cactus', 'HF3165-106', 'China', '../image/NIKE+FIELD+GENERAL Dusty Cactus.png', '../image/NIKE+FIELD+GENERAL Dusty Cactus (1).png', '../image/NIKE+FIELD+GENERAL Dusty Cactus (2).png', '../image/NIKE+FIELD+GENERAL Dusty Cactus (3).png', 'Men\'s Shoes', '2025-12-07 23:50:39', '2025-12-07 23:50:39'),
(6, 1, 1549000.00, 0.2000, 1238000.00, '', 'Gym Red/Gum Medium Brown/Team Gold', 'HF3165-601', 'China', '../image/NIKE+FIELD+GENERAL Team Gold.png', '../image/NIKE+FIELD+GENERAL Team Gold (1).png', '../image/NIKE+FIELD+GENERAL Team Gold (2).png', '../image/NIKE+FIELD+GENERAL Team Gold (3).png', 'Men\'s Shoes', '2025-12-07 23:50:39', '2025-12-07 23:50:39'),
(7, 1, 1549000.00, 0.2000, 1238000.00, '', 'Pale Ivory/Gum Yellow/Cargo Khaki', 'HF3165-103', 'China', '../image/NIKE+FIELD+GENERAL Cargo Khaki.png', '../image/NIKE+FIELD+GENERAL Cargo Khaki (1).png', '../image/NIKE+FIELD+GENERAL Cargo Khaki (2).png', '../image/NIKE+FIELD+GENERAL Cargo Khaki (3).png', 'Men\'s Shoes', '2025-12-07 23:50:39', '2025-12-07 23:50:39'),
(8, 1, 1549000.00, 0.2000, 1239200.00, '', 'Pro Green/Gum Medium Brown/Pro Gold', 'HF3165-300', 'China', '../image/NIKE+FIELD+GENERAL Pro Green.png', '../image/NIKE+FIELD+GENERAL Pro Green (1).png', '../image/NIKE+FIELD+GENERAL Pro Green (2).png', '../image/NIKE+FIELD+GENERAL Pro Green (3).png', 'Men\'s Shoes', '2025-12-07 23:50:39', '2025-12-07 23:50:39'),
(9, 1, 1549000.00, 0.0000, 1549000.00, '', 'University Blue/Gum Medium Brown/White', 'HF3165-402', 'China', '../image/NIKE+FIELD+GENERAL University Blue.png', '../image/NIKE+FIELD+GENERAL University Blue (1).png', '../image/NIKE+FIELD+GENERAL University Blue (2).png', '../image/NIKE+FIELD+GENERAL University Blue (3).png', 'Men\'s Shoes', '2025-12-07 23:50:39', '2025-12-07 23:50:39'),
(10, 2, 1399000.00, 0.2000, 1119200.00, NULL, 'Black/Anthracite/Lime Blast/Black', 'HJ5228-005', 'Indonesia', '../image/NIKE+V5+RNR Anthracite.png', '../image/NIKE+V5+RNR Anthracite (1).png', '../image/NIKE+V5+RNR Anthracite (2).png', '../image/NIKE+V5+RNR Anthracite (3).png', 'Men\'s Shoes', '2025-12-08 01:14:14', '2025-12-08 01:14:14'),
(11, 2, 1399000.00, 0.2000, 1118000.00, NULL, 'Black/Anthracite/Smoke Grey/Black', 'HJ5228-004', 'Indonesia', '../image/NIKE+V5+RNR Smoke Grey.png', '../image/NIKE+V5+RNR Smoke Grey (1).png', '../image/NIKE+V5+RNR Smoke Grey (2).png', '../image/NIKE+V5+RNR Smoke Grey (3).png', 'Men\'s Shoes', '2025-12-08 01:14:14', '2025-12-08 01:14:14'),
(12, 2, 1399000.00, 0.2000, 1118000.00, NULL, 'White/Vast Grey/Photon Dust/Black', 'HJ5228-103', 'India', '../image/NIKE+V5+RNR Vast Grey.png', '../image/NIKE+V5+RNR Vast Grey (1).png', '../image/NIKE+V5+RNR Vast Grey (2).png', '../image/NIKE+V5+RNR Vast Grey (3).png', 'Men\'s Shoes', '2025-12-08 01:14:14', '2025-12-08 01:14:14'),
(13, 3, 1499000.00, 0.2000, 1198000.00, NULL, 'Black/Gum Medium Brown/White', 'FQ8903-002', 'Vietnam', '../image/KILLSHOT+2 Gum Medium Brown.png', '../image/KILLSHOT+2 Gum Medium Brown (1).png', '../image/KILLSHOT+2 Gum Medium Brown (2).png', '../image/KILLSHOT+2 Gum Medium Brown (3).png', 'Men\'s Shoes', '2025-12-08 01:38:26', '2025-12-08 01:38:26'),
(14, 3, 1499000.00, NULL, NULL, NULL, 'Vintage Green/Gum Medium Brown/White', 'FQ8903-300', 'Indonesia', '../image/KILLSHOT+2 Vintage Green.png', '../image/KILLSHOT+2 Vintage Green (1).png', '../image/KILLSHOT+2 Vintage Green (2).png', '../image/KILLSHOT+2 Vintage Green (3).png', 'Men\'s Shoes', '2025-12-08 01:38:26', '2025-12-08 01:38:26'),
(15, 3, 1499000.00, 0.2000, 1198000.00, NULL, 'Light Silver/Gum Dark Brown/White', 'FQ8903-003', 'Indonesia', '../image/KILLSHOT+2 Light Silver.png', '../image/KILLSHOT+2 Light Silver (1).png', '../image/KILLSHOT+2 Light Silver (2).png', '../image/KILLSHOT+2 Light Silver (3).png', 'Men\'s Shoes', '2025-12-08 01:38:26', '2025-12-08 01:38:26'),
(16, 3, 1499000.00, 0.2000, 1198000.00, NULL, 'Ashen Slate/Gum Dark Brown/White', 'FQ8903-401', 'Indonesia', '../image/KILLSHOT+2 Ashen Slate.png', '../image/KILLSHOT+2 Ashen Slate (1).png', '../image/KILLSHOT+2 Ashen Slate (2).png', '../image/KILLSHOT+2 Ashen Slate (3).png', 'Men\'s Shoes', '2025-12-08 01:38:26', '2025-12-08 01:38:26'),
(17, 3, 1499000.00, 0.2000, 1198000.00, NULL, 'Cargo Khaki/Gum Light Brown/Cargo Khaki', 'FQ8903-302', 'Indonesia', '../image/KILLSHOT+2 Cargo Khaki.png', '../image/KILLSHOT+2 Cargo Khaki (1).png', '../image/KILLSHOT+2 Cargo Khaki (2).png', '../image/KILLSHOT+2 Cargo Khaki (3).png', 'Men\'s Shoes', '2025-12-08 01:38:26', '2025-12-08 01:38:26'),
(18, 4, 2099000.00, 0.2000, 1679200.00, NULL, 'White/Gum Medium Brown/Summit White/Black', 'HQ1967-100', 'Vietnam', '../image/AIR+FORCE+1+LOW+RETRO Summit White.png', '../image/AIR+FORCE+1+LOW+RETRO Summit White (1).png', '../image/AIR+FORCE+1+LOW+RETRO Summit White (2).png', '../image/AIR+FORCE+1+LOW+RETRO Summit White (3).png', 'Men\'s Shoes', '2025-12-08 01:53:30', '2025-12-08 01:53:30'),
(19, 4, 2099000.00, 0.2000, 1679200.00, NULL, 'Desert Khaki/Black/White/Pink Foam', 'HQ1967-200', 'Vietnam', '../image/AIR+FORCE+1+LOW+RETRO Pink Foam.png', '../image/AIR+FORCE+1+LOW+RETRO Pink Foam (1).png', '../image/AIR+FORCE+1+LOW+RETRO Pink Foam (2).png', '../image/AIR+FORCE+1+LOW+RETRO Pink Foam (3).png', 'Men\'s Shoes', '2025-12-08 01:53:30', '2025-12-08 01:53:30'),
(20, 5, 2489000.00, 0.2000, 1991200.00, NULL, 'Ochre/Flat Gold/Light Orewood Brown/Metallic Silver', 'HF1553-301', 'Indonesia', '../image/NIKE+ZOOM+VOMERO+5 Flat Gold.png', '../image/NIKE+ZOOM+VOMERO+5 Flat Gold (1).png', '../image/NIKE+ZOOM+VOMERO+5 Flat Gold (2).png', '../image/NIKE+ZOOM+VOMERO+5 Flat Gold (3).png', 'Men\'s Shoes', '2025-12-08 02:03:32', '2025-12-08 02:03:32'),
(21, 5, 2489000.00, 0.2000, 1991200.00, NULL, 'Light Orewood Brown/White/Metallic Platinum/Light Smoke Grey', 'HF1553-101', 'Indonesia', '../image/NIKE+ZOOM+VOMERO+5 Metallic Platinum.png', '../image/NIKE+ZOOM+VOMERO+5 Metallic Platinum (1).png', '../image/NIKE+ZOOM+VOMERO+5 Metallic Platinum (2).png', '../image/NIKE+ZOOM+VOMERO+5 Metallic Platinum (3).png', 'Men\'s Shoes', '2025-12-08 02:06:36', '2025-12-08 02:06:36'),
(22, 6, 2099000.00, 0.2000, 1678000.00, NULL, 'Sail/Pale Ivory/Metallic Gold/Black', 'HQ7487-100', 'Vietnam', '../image/W+NIKE+DUNK+LOW+SE Metallic Gold.png', '../image/W+NIKE+DUNK+LOW+SE Metallic Gold (1).png', '../image/W+NIKE+DUNK+LOW+SE Metallic Gold (2).png', '../image/W+NIKE+DUNK+LOW+SE Metallic Gold (3).png', 'Women\'s Shoes', '2025-12-08 03:20:58', '2025-12-08 03:20:58'),
(23, 6, 2099000.00, 0.2000, 1678000.00, NULL, 'Particle Pink/Coconut Milk/Sail/Midnight Navy', 'HQ7487-600', 'Indonesia', '../image/W+NIKE+DUNK+LOW+SE Midnight Navy.png', '../image/W+NIKE+DUNK+LOW+SE Midnight Navy (1).png', '../image/W+NIKE+DUNK+LOW+SE Midnight Navy (2).png', '../image/W+NIKE+DUNK+LOW+SE Midnight Navy (3).png', 'Women\'s Shoes', '2025-12-08 03:23:51', '2025-12-08 03:23:51'),
(24, 7, 1729000.00, 0.2000, 1378000.00, NULL, 'Metallic Platinum/Pale Ivory/Summit White', 'IB7311-001', 'Vietnam', '../image/W+NIKE+DUNK+LOW+NEXT+NATURE Metallic Platinum.png', '../image/W+NIKE+DUNK+LOW+NEXT+NATURE Metallic Platinum (1).png', '../image/W+NIKE+DUNK+LOW+NEXT+NATURE Metallic Platinum (2).png', '../image/W+NIKE+DUNK+LOW+NEXT+NATURE Metallic Platinum (3).png', 'Women\'s Shoes', '2025-12-08 03:33:59', '2025-12-08 03:33:59'),
(25, 7, 1729000.00, 0.2000, 1378000.00, NULL, 'Sail/Parachute Beige', 'IB7311-101', 'Vietnam', '../image/W+NIKE+DUNK+LOW+NEXT+NATURE Parachute Beige.png', '../image/W+NIKE+DUNK+LOW+NEXT+NATURE Parachute Beige (1).png', '../image/W+NIKE+DUNK+LOW+NEXT+NATURE Parachute Beige (2).png', '../image/W+NIKE+DUNK+LOW+NEXT+NATURE Parachute Beige (3).png', 'Women\'s Shoes', '2025-12-08 03:36:59', '2025-12-08 03:36:59'),
(26, 7, 1729000.00, 0.2000, 1378000.00, NULL, 'White/Blue Tint', 'IB7311-100', 'Vietnam', '../image/W+NIKE+DUNK+LOW+NEXT+NATURE Blue Tint.png', '../image/W+NIKE+DUNK+LOW+NEXT+NATURE Blue Tint (1).png', '../image/W+NIKE+DUNK+LOW+NEXT+NATURE Blue Tint (2).png', '../image/W+NIKE+DUNK+LOW+NEXT+NATURE Blue Tint (3).png', 'Women\'s Shoes', '2025-12-08 03:40:30', '2025-12-08 03:40:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_interest`
--

CREATE TABLE `product_interest` (
  `ID_PRODUCT_INTEREST` int(11) NOT NULL,
  `ACG` tinyint(1) DEFAULT NULL,
  `AIR_FORCE_1` tinyint(1) DEFAULT NULL,
  `AIR_MAX` tinyint(1) DEFAULT NULL,
  `BIG_AND_TALL` tinyint(1) DEFAULT NULL,
  `BOYS` tinyint(1) DEFAULT NULL,
  `GIRLS` tinyint(1) DEFAULT NULL,
  `JORDAN` tinyint(1) DEFAULT NULL,
  `KOBE` tinyint(1) DEFAULT NULL,
  `MATERNITY` tinyint(1) DEFAULT NULL,
  `NIKE_AND_LEGO_PARTNERSHIP` tinyint(1) DEFAULT NULL,
  `NIKE_BY_YOU` tinyint(1) DEFAULT NULL,
  `NIKE_SPORTSWEAR` tinyint(1) DEFAULT NULL,
  `NIKELAB` tinyint(1) DEFAULT NULL,
  `PLUS_SIZE` tinyint(1) DEFAULT NULL,
  `SNKRS` tinyint(1) DEFAULT NULL,
  `SUSTAINABLE_MATERIALS` tinyint(1) DEFAULT NULL,
  `PRODUCT_INTEREST_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `PRODUCT_INTEREST_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_size___stock`
--

CREATE TABLE `product_size___stock` (
  `SIZE_9_1_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_9_5_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_10_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_10_4_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_10_8_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_11_2_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_11_6` decimal(3,1) DEFAULT NULL,
  `SIZE_12_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_12_5_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_13_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_13_3_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_14_2_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_14_6_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_15_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_15_5_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_15_9_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_16_3_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_16_7_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_17_2_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_17_6_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_18_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_18_4_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_18_8_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_19_3_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_19_7_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_20_1_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_20_5_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_20_9_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_21_4_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_21_8_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_22_2_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_22_4_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_22_7_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_23_2_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_23_5_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_23_8_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_24_6_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_25_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_25_4_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_25_8_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_26_2_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_26_7_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_27_1_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_27_5_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_27_9_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_28_3_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_28_8_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_29_2_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_29_6_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_30_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_30_5_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_30_9_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_31_3_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_31_7_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_32_2_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_32_6_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_33_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_33_4_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_33_9_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_34_3_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_34_7` decimal(3,1) DEFAULT NULL,
  `SIZE_35_1_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_35_5_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_36_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_36_4_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_36_8_CM` decimal(3,1) DEFAULT NULL,
  `SIZE_37_2_CM` decimal(3,1) DEFAULT NULL,
  `ID_SIZE___STOCK` int(11) NOT NULL,
  `ID_PRODUCT_DETAIL` int(11) NOT NULL,
  `SIZE___STOCK_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `SIZE___STOCK_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `product_size___stock`
--

INSERT INTO `product_size___stock` (`SIZE_9_1_CM`, `SIZE_9_5_CM`, `SIZE_10_CM`, `SIZE_10_4_CM`, `SIZE_10_8_CM`, `SIZE_11_2_CM`, `SIZE_11_6`, `SIZE_12_CM`, `SIZE_12_5_CM`, `SIZE_13_CM`, `SIZE_13_3_CM`, `SIZE_14_2_CM`, `SIZE_14_6_CM`, `SIZE_15_CM`, `SIZE_15_5_CM`, `SIZE_15_9_CM`, `SIZE_16_3_CM`, `SIZE_16_7_CM`, `SIZE_17_2_CM`, `SIZE_17_6_CM`, `SIZE_18_CM`, `SIZE_18_4_CM`, `SIZE_18_8_CM`, `SIZE_19_3_CM`, `SIZE_19_7_CM`, `SIZE_20_1_CM`, `SIZE_20_5_CM`, `SIZE_20_9_CM`, `SIZE_21_4_CM`, `SIZE_21_8_CM`, `SIZE_22_2_CM`, `SIZE_22_4_CM`, `SIZE_22_7_CM`, `SIZE_23_2_CM`, `SIZE_23_5_CM`, `SIZE_23_8_CM`, `SIZE_24_6_CM`, `SIZE_25_CM`, `SIZE_25_4_CM`, `SIZE_25_8_CM`, `SIZE_26_2_CM`, `SIZE_26_7_CM`, `SIZE_27_1_CM`, `SIZE_27_5_CM`, `SIZE_27_9_CM`, `SIZE_28_3_CM`, `SIZE_28_8_CM`, `SIZE_29_2_CM`, `SIZE_29_6_CM`, `SIZE_30_CM`, `SIZE_30_5_CM`, `SIZE_30_9_CM`, `SIZE_31_3_CM`, `SIZE_31_7_CM`, `SIZE_32_2_CM`, `SIZE_32_6_CM`, `SIZE_33_CM`, `SIZE_33_4_CM`, `SIZE_33_9_CM`, `SIZE_34_3_CM`, `SIZE_34_7`, `SIZE_35_1_CM`, `SIZE_35_5_CM`, `SIZE_36_CM`, `SIZE_36_4_CM`, `SIZE_36_8_CM`, `SIZE_37_2_CM`, `ID_SIZE___STOCK`, `ID_PRODUCT_DETAIL`, `SIZE___STOCK_CREATED_AT`, `SIZE___STOCK_UPDATED_AT`) VALUES
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-12-08 00:19:28', '2025-12-08 00:13:49'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, '2025-12-08 00:17:25', '2025-12-08 00:17:25'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 3, '2025-12-08 00:50:44', '2025-12-08 00:50:44'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, NULL, NULL, NULL, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4, '2025-12-08 00:52:17', '2025-12-08 00:52:17'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, '2025-12-08 00:53:40', '2025-12-08 00:53:40'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 6, '2025-12-08 00:54:17', '2025-12-08 00:54:17'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 7, '2025-12-08 00:54:51', '2025-12-08 00:54:51'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 8, '2025-12-08 00:56:04', '2025-12-08 00:56:04'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 9, '2025-12-08 00:57:19', '2025-12-08 00:57:19'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, NULL, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, '2025-12-08 01:17:52', '2025-12-08 01:17:52'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 11, '2025-12-08 01:18:25', '2025-12-08 01:18:25'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 12, '2025-12-08 01:18:56', '2025-12-08 01:18:56'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 13, '2025-12-08 01:41:56', '2025-12-08 01:41:56'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 14, '2025-12-08 01:43:18', '2025-12-08 01:43:18'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 15, '2025-12-08 01:43:53', '2025-12-08 01:43:53'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 16, '2025-12-08 01:44:41', '2025-12-08 01:44:41'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 17, '2025-12-08 01:45:54', '2025-12-08 01:45:54'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 18, '2025-12-08 01:55:09', '2025-12-08 01:55:09'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, 19, '2025-12-08 01:56:26', '2025-12-08 01:56:26'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 20, '2025-12-08 03:14:56', '2025-12-08 03:14:56'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, 21, '2025-12-08 03:15:43', '2025-12-08 03:15:43'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, NULL, 10.0, NULL, NULL, 10.0, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, 22, '2025-12-08 03:26:17', '2025-12-08 03:26:17'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, 23, '2025-12-08 03:28:17', '2025-12-08 03:28:17'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 24, '2025-12-08 03:46:07', '2025-12-08 03:46:07'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.0, 10.0, 10.0, 10.0, 10.0, NULL, 10.0, 10.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 25, '2025-12-08 03:49:10', '2025-12-08 03:47:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `relationship_4`
--

CREATE TABLE `relationship_4` (
  `ID_SHOP_PREFERENCES` int(11) NOT NULL,
  `ID_ADDITIONAL_PREFERENCES` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `relationship_8`
--

CREATE TABLE `relationship_8` (
  `ID_USER` int(11) NOT NULL,
  `ID_SPORT_INTEREST` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `relationship_9`
--

CREATE TABLE `relationship_9` (
  `ID_USER` int(11) NOT NULL,
  `ID_PRODUCT_INTEREST` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `relationship_10`
--

CREATE TABLE `relationship_10` (
  `ID_TEAM_INTEREST` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `relationship_11`
--

CREATE TABLE `relationship_11` (
  `ID_USER` int(11) NOT NULL,
  `ID_ATHLETES_INTEREST` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `relationship_12`
--

CREATE TABLE `relationship_12` (
  `ID_USER` int(11) NOT NULL,
  `ID_CITY_INTEREST` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `relationship_20`
--

CREATE TABLE `relationship_20` (
  `FAVOURITE_ID` int(11) NOT NULL,
  `ID_PRODUCT_DETAIL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `relationship_22`
--

CREATE TABLE `relationship_22` (
  `ID_STORE` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `relationship_23`
--

CREATE TABLE `relationship_23` (
  `ID_BAG` int(11) NOT NULL,
  `ID_PRODUCT_DETAIL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `review`
--

CREATE TABLE `review` (
  `ID_REVIEW` int(11) NOT NULL,
  `ID_PRODUCT` int(11) NOT NULL,
  `ID_IMAGE_REVIEW` int(11) NOT NULL,
  `STAR` int(11) DEFAULT NULL,
  `COMMENT` text DEFAULT NULL,
  `REVIEW_TITLE` varchar(150) DEFAULT NULL,
  `PRODUCT_FIT` varchar(30) DEFAULT NULL,
  `PRODUCT_COMFORTABILITY` varchar(30) DEFAULT NULL,
  `IS_RECOMMENDED` tinyint(1) DEFAULT NULL,
  `SIZE_YOU_NORMALLY_WEAR` decimal(3,1) DEFAULT NULL,
  `USED_FOR_ACTIVITY` varchar(50) DEFAULT NULL,
  `SURFACE_TYPE` varchar(50) DEFAULT NULL,
  `IS_AGREE_TO_PRIVACY_POLICY` tinyint(1) DEFAULT NULL,
  `REVIEW_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `review_photo`
--

CREATE TABLE `review_photo` (
  `IMAGE_1_PATH_` varchar(255) DEFAULT NULL,
  `IMAGE_2_PATH` varchar(255) DEFAULT NULL,
  `IMAGE_3_PATH` varchar(255) DEFAULT NULL,
  `IMAGE_4_PATH` varchar(255) DEFAULT NULL,
  `IMAGE_5_PATH` varchar(255) DEFAULT NULL,
  `ID_IMAGE_REVIEW` int(11) NOT NULL,
  `ID_REVIEW` int(11) DEFAULT NULL,
  `REWIEW_PHOTO_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `shop_additional_preferences`
--

CREATE TABLE `shop_additional_preferences` (
  `ID_ADDITIONAL_PREFERENCES` int(11) NOT NULL,
  `GIRLS_` tinyint(1) DEFAULT NULL,
  `BOYS_` tinyint(1) DEFAULT NULL,
  `WOMEN_S` tinyint(1) DEFAULT NULL,
  `MEN_S` tinyint(1) DEFAULT NULL,
  `SHOP_ADDITIONAL_PREFERENCES_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `SHOP_ADDITIONAL_PREFERENCES_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `shop_preferences`
--

CREATE TABLE `shop_preferences` (
  `SHOE_SIZE` decimal(3,1) DEFAULT NULL,
  `GENDER_PREFERENCES` varchar(8) DEFAULT NULL,
  `UNIT_OF_MEASURE` varchar(10) DEFAULT NULL,
  `SHOP_PREFERENCES_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `SHOP_PREFERENCES_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ID_SHOP_PREFERENCES` int(11) NOT NULL,
  `ID_USER` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sport_interest`
--

CREATE TABLE `sport_interest` (
  `BASKETBALL` tinyint(1) DEFAULT NULL,
  `CROSS_TRAINING` tinyint(1) DEFAULT NULL,
  `DANCE` tinyint(1) DEFAULT NULL,
  `FOOTBALL` tinyint(1) DEFAULT NULL,
  `GOLF` tinyint(1) DEFAULT NULL,
  `JORDAN_CHILES` tinyint(1) DEFAULT NULL,
  `LACROSSE` tinyint(1) DEFAULT NULL,
  `LIFESTYLE` tinyint(1) DEFAULT NULL,
  `RUNNING` tinyint(1) DEFAULT NULL,
  `SKATEBOARDING` tinyint(1) DEFAULT NULL,
  `SOFTBALL` tinyint(1) DEFAULT NULL,
  `SWIMMING` tinyint(1) DEFAULT NULL,
  `TENNIS` tinyint(1) DEFAULT NULL,
  `TRAINING___GYM` tinyint(1) DEFAULT NULL,
  `VOLLEYBALL` tinyint(1) DEFAULT NULL,
  `YOGA` tinyint(1) DEFAULT NULL,
  `ID_SPORT_INTEREST` int(11) NOT NULL,
  `SPORT_INTEREST_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `SPORT_INTEREST_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `store`
--

CREATE TABLE `store` (
  `ID_STORE` int(11) NOT NULL,
  `STORE_OPEN_DAY` varchar(5) DEFAULT NULL,
  `STORE_CLOSED_DAY` varchar(5) DEFAULT NULL,
  `STORE_OPEN_HOUR` time DEFAULT NULL,
  `SOTRE_CLOSED_HOUR` time DEFAULT NULL,
  `STORE_STATUS` varchar(8) DEFAULT NULL,
  `IMAGE_PATH_FILE` varchar(255) DEFAULT NULL,
  `API_DESTINATION` varchar(255) DEFAULT NULL,
  `DATA_STORE_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `DATA_STORE_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `STORE_COUNTRY` varchar(30) DEFAULT NULL,
  `STORE_CITY` varchar(30) DEFAULT NULL,
  `STORE_PROVINCE` varchar(30) DEFAULT NULL,
  `STORE_STREET_ADDRESS` varchar(50) DEFAULT NULL,
  `STORE_APT_SUITE_BUILDING` varchar(100) DEFAULT NULL,
  `STORE_POSTAL_CODE` varchar(20) DEFAULT NULL,
  `STORE_PHONE_NUMBER` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `store`
--

INSERT INTO `store` (`ID_STORE`, `STORE_OPEN_DAY`, `STORE_CLOSED_DAY`, `STORE_OPEN_HOUR`, `SOTRE_CLOSED_HOUR`, `STORE_STATUS`, `IMAGE_PATH_FILE`, `API_DESTINATION`, `DATA_STORE_CREATED_AT`, `DATA_STORE_UPDATED_AT`, `STORE_COUNTRY`, `STORE_CITY`, `STORE_PROVINCE`, `STORE_STREET_ADDRESS`, `STORE_APT_SUITE_BUILDING`, `STORE_POSTAL_CODE`, `STORE_PHONE_NUMBER`) VALUES
(1, 'Sun', 'Sat', '10:00:00', '22:00:00', NULL, '../image/Nike Grand Indonesia.jpeg', 'https://www.google.com/maps/dir/?api=1&destination=-6.195,106.81931', '2025-12-08 04:03:24', '2025-12-08 04:01:05', 'Indonesia', 'Jakarta', 'Jakarta', 'Jl. MH Thamrin No. 1  Jakarta', 'Lt. 3 Grand Indonesia Sky Bridge', '10310', '021-23581085'),
(2, 'Mon', 'Sat', '10:00:00', '21:00:00', NULL, '../image/Nike Aventura.jpg', 'https://www.google.com/maps/dir/?api=1&destination=25.9568456,-80.1410266', '2025-12-08 04:11:54', '2025-12-08 04:11:54', 'USA', 'Florida', 'Florida', '19565 Biscayne Blvd  Aventura', NULL, '33180-2342', '3059219872');

-- --------------------------------------------------------

--
-- Struktur dari tabel `team_interest`
--

CREATE TABLE `team_interest` (
  `ATLETICO_MADRID` tinyint(1) DEFAULT NULL,
  `CHELSEA` tinyint(1) DEFAULT NULL,
  `FC_BARCELONA` tinyint(1) DEFAULT NULL,
  `INTER_MILAN` tinyint(1) DEFAULT NULL,
  `LIVERPOOL_F_C` tinyint(1) DEFAULT NULL,
  `PARIS_SAINT_GERMAIN` tinyint(1) DEFAULT NULL,
  `TOTTENHAM_HOTSPUR_FC` tinyint(1) DEFAULT NULL,
  `BOSTON_CELTICS` tinyint(1) DEFAULT NULL,
  `BROOKLYN_NETS` tinyint(1) DEFAULT NULL,
  `GOLDEN_STATE_WARRIORS` tinyint(1) DEFAULT NULL,
  `LOS_ANGELES_LAKERS` tinyint(1) DEFAULT NULL,
  `MIAMI_HEAT` tinyint(1) DEFAULT NULL,
  `ANGEL_CITY_FC` tinyint(1) DEFAULT NULL,
  `BAY_FC` tinyint(1) DEFAULT NULL,
  `HOUSTON_DASH` tinyint(1) DEFAULT NULL,
  `KANSAS_CITY_CURRENT` tinyint(1) DEFAULT NULL,
  `NJ_NY_GOTHAM_FC` tinyint(1) DEFAULT NULL,
  `NORTH_CAROLINA_COURAGE` tinyint(1) DEFAULT NULL,
  `ORLANDO_PRIDE` tinyint(1) DEFAULT NULL,
  `RACING_LOUISVILLE_FC` tinyint(1) DEFAULT NULL,
  `SEATTLE_REIGN_FC` tinyint(1) DEFAULT NULL,
  `WASHINGTON_SPIRIT` tinyint(1) DEFAULT NULL,
  `CANADA_NATIONAL_TEAM` tinyint(1) DEFAULT NULL,
  `NIGERIA_NATIONAL_TEAM` tinyint(1) DEFAULT NULL,
  `ID_TEAM_INTEREST` int(11) NOT NULL,
  `TEAM_INTEREST_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `TEAM_INTEREST_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `EMAIL` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `DATE_OF_BIRTH` date DEFAULT NULL,
  `TOWN_CITY` varchar(50) DEFAULT NULL,
  `ID_USER` int(11) NOT NULL,
  `ID_SHOP_PREFERENCES` int(11) NOT NULL,
  `NATIONAL_ID` int(11) DEFAULT NULL,
  `ADDRESS_ID` int(11) DEFAULT NULL,
  `ID_PAYMENT_CARD` int(11) DEFAULT NULL,
  `ID_PRIVACY` int(11) NOT NULL,
  `ID_COMMUNICATION_PREFERENCES` int(11) DEFAULT NULL,
  `USER_CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `USER_UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USER_COUNTRY` varchar(50) DEFAULT NULL,
  `USER_PROVINCE` varchar(30) DEFAULT NULL,
  `USER_POSTCODE` varchar(20) DEFAULT NULL,
  `PROFILE_PICTURE_PATH_FILE` varchar(255) DEFAULT NULL,
  `SCREEN_NAME` varchar(50) DEFAULT NULL,
  `HOMETOWN` varchar(50) DEFAULT NULL,
  `ABOUT_ME` varchar(150) DEFAULT NULL,
  `USER_PROFILE_FIRST_NAME` varchar(25) DEFAULT NULL,
  `USER_PROFILE_LAST_NAME` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `athlete_interest`
--
ALTER TABLE `athlete_interest`
  ADD PRIMARY KEY (`ID_ATHLETES_INTEREST`);

--
-- Indeks untuk tabel `bag`
--
ALTER TABLE `bag`
  ADD PRIMARY KEY (`ID_BAG`);

--
-- Indeks untuk tabel `bag_item_pcs`
--
ALTER TABLE `bag_item_pcs`
  ADD PRIMARY KEY (`ID_ITEM_PCS`),
  ADD KEY `FK_BAG_ITEM_RELATIONS_BAG` (`ID_BAG`),
  ADD KEY `FK_BAG_ITEM_RELATIONS_CHECKOUT` (`ID_CHECKOUT`);

--
-- Indeks untuk tabel `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`ID_CHECKOUT`);

--
-- Indeks untuk tabel `citizen_national_id`
--
ALTER TABLE `citizen_national_id`
  ADD PRIMARY KEY (`NATIONAL_ID`),
  ADD KEY `FK_CITIZEN__RELATIONS_USER` (`ID_USER`);

--
-- Indeks untuk tabel `city_interest`
--
ALTER TABLE `city_interest`
  ADD PRIMARY KEY (`ID_CITY_INTEREST`);

--
-- Indeks untuk tabel `communication_preferences`
--
ALTER TABLE `communication_preferences`
  ADD PRIMARY KEY (`ID_COMMUNICATION_PREFERENCES`);

--
-- Indeks untuk tabel `delivery_address`
--
ALTER TABLE `delivery_address`
  ADD PRIMARY KEY (`ADDRESS_ID`),
  ADD KEY `FK_DELIVERY_RELATIONS_USER` (`ID_USER`);

--
-- Indeks untuk tabel `favourite`
--
ALTER TABLE `favourite`
  ADD PRIMARY KEY (`FAVOURITE_ID`);

--
-- Indeks untuk tabel `payment_card`
--
ALTER TABLE `payment_card`
  ADD PRIMARY KEY (`ID_PAYMENT_CARD`),
  ADD KEY `FK_PAYMENT__RELATIONS_USER` (`ID_USER`);

--
-- Indeks untuk tabel `privacy`
--
ALTER TABLE `privacy`
  ADD PRIMARY KEY (`ID_PRIVACY`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID_PRODUCT`);

--
-- Indeks untuk tabel `product_detail`
--
ALTER TABLE `product_detail`
  ADD PRIMARY KEY (`ID_PRODUCT_DETAIL`),
  ADD KEY `FK_PRODUCT__RELATIONS_PRODUCT` (`ID_PRODUCT`);

--
-- Indeks untuk tabel `product_interest`
--
ALTER TABLE `product_interest`
  ADD PRIMARY KEY (`ID_PRODUCT_INTEREST`);

--
-- Indeks untuk tabel `product_size___stock`
--
ALTER TABLE `product_size___stock`
  ADD PRIMARY KEY (`ID_SIZE___STOCK`),
  ADD KEY `FK_PRODUCT__RELATIONS_PRODUCT_` (`ID_PRODUCT_DETAIL`);

--
-- Indeks untuk tabel `relationship_4`
--
ALTER TABLE `relationship_4`
  ADD PRIMARY KEY (`ID_SHOP_PREFERENCES`,`ID_ADDITIONAL_PREFERENCES`),
  ADD KEY `FK_RELATION_RELATIONS_SHOP_ADD` (`ID_ADDITIONAL_PREFERENCES`);

--
-- Indeks untuk tabel `relationship_8`
--
ALTER TABLE `relationship_8`
  ADD PRIMARY KEY (`ID_USER`,`ID_SPORT_INTEREST`),
  ADD KEY `FK_RELATION_RELATIONS_SPORT_IN` (`ID_SPORT_INTEREST`);

--
-- Indeks untuk tabel `relationship_9`
--
ALTER TABLE `relationship_9`
  ADD PRIMARY KEY (`ID_USER`,`ID_PRODUCT_INTEREST`),
  ADD KEY `FK_RELATION9_PRODUCT_` (`ID_PRODUCT_INTEREST`);

--
-- Indeks untuk tabel `relationship_10`
--
ALTER TABLE `relationship_10`
  ADD PRIMARY KEY (`ID_TEAM_INTEREST`,`ID_USER`),
  ADD KEY `FK_RELATION_RELATIONS_USER` (`ID_USER`);

--
-- Indeks untuk tabel `relationship_11`
--
ALTER TABLE `relationship_11`
  ADD PRIMARY KEY (`ID_USER`,`ID_ATHLETES_INTEREST`),
  ADD KEY `FK_RELATION_RELATIONS_ATHLETE_` (`ID_ATHLETES_INTEREST`);

--
-- Indeks untuk tabel `relationship_12`
--
ALTER TABLE `relationship_12`
  ADD PRIMARY KEY (`ID_USER`,`ID_CITY_INTEREST`),
  ADD KEY `FK_RELATION_RELATIONS_CITY_INT` (`ID_CITY_INTEREST`);

--
-- Indeks untuk tabel `relationship_20`
--
ALTER TABLE `relationship_20`
  ADD PRIMARY KEY (`FAVOURITE_ID`,`ID_PRODUCT_DETAIL`),
  ADD KEY `FK_RELATION_RELATIONS_PRODUCT_` (`ID_PRODUCT_DETAIL`);

--
-- Indeks untuk tabel `relationship_22`
--
ALTER TABLE `relationship_22`
  ADD PRIMARY KEY (`ID_STORE`,`ID_USER`),
  ADD KEY `FK_RELATION22_USER` (`ID_USER`);

--
-- Indeks untuk tabel `relationship_23`
--
ALTER TABLE `relationship_23`
  ADD PRIMARY KEY (`ID_BAG`,`ID_PRODUCT_DETAIL`),
  ADD KEY `FK_RELATION23_PRODUCT_` (`ID_PRODUCT_DETAIL`);

--
-- Indeks untuk tabel `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ID_REVIEW`),
  ADD KEY `FK_REVIEW_RELATIONS_REVIEW_P` (`ID_IMAGE_REVIEW`),
  ADD KEY `FK_REVIEW_RELATIONS_PRODUCT` (`ID_PRODUCT`);

--
-- Indeks untuk tabel `review_photo`
--
ALTER TABLE `review_photo`
  ADD PRIMARY KEY (`ID_IMAGE_REVIEW`),
  ADD KEY `FK_REVIEW_P_RELATIONS_REVIEW` (`ID_REVIEW`);

--
-- Indeks untuk tabel `shop_additional_preferences`
--
ALTER TABLE `shop_additional_preferences`
  ADD PRIMARY KEY (`ID_ADDITIONAL_PREFERENCES`);

--
-- Indeks untuk tabel `shop_preferences`
--
ALTER TABLE `shop_preferences`
  ADD PRIMARY KEY (`ID_SHOP_PREFERENCES`),
  ADD KEY `FK_SHOP_PRE_RELATIONS_USER` (`ID_USER`);

--
-- Indeks untuk tabel `sport_interest`
--
ALTER TABLE `sport_interest`
  ADD PRIMARY KEY (`ID_SPORT_INTEREST`);

--
-- Indeks untuk tabel `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`ID_STORE`);

--
-- Indeks untuk tabel `team_interest`
--
ALTER TABLE `team_interest`
  ADD PRIMARY KEY (`ID_TEAM_INTEREST`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_USER`),
  ADD KEY `FK_USER_PAYMENT_CARD` (`ID_PAYMENT_CARD`),
  ADD KEY `FK_USER_SHOP_PREF` (`ID_SHOP_PREFERENCES`),
  ADD KEY `FK_USER_COMM_PREF` (`ID_COMMUNICATION_PREFERENCES`),
  ADD KEY `FK_USER_PRIVACY` (`ID_PRIVACY`),
  ADD KEY `FK_USER_NATIONAL_ID` (`NATIONAL_ID`),
  ADD KEY `FK_USER_DELIVERY_ADDR` (`ADDRESS_ID`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bag_item_pcs`
--
ALTER TABLE `bag_item_pcs`
  ADD CONSTRAINT `FK_BAG_ITEM_RELATIONS_BAG` FOREIGN KEY (`ID_BAG`) REFERENCES `bag` (`ID_BAG`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_BAG_ITEM_RELATIONS_CHECKOUT` FOREIGN KEY (`ID_CHECKOUT`) REFERENCES `checkout` (`ID_CHECKOUT`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `citizen_national_id`
--
ALTER TABLE `citizen_national_id`
  ADD CONSTRAINT `FK_CITIZEN__RELATIONS_USER` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `delivery_address`
--
ALTER TABLE `delivery_address`
  ADD CONSTRAINT `FK_DELIVERY_RELATIONS_USER` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `payment_card`
--
ALTER TABLE `payment_card`
  ADD CONSTRAINT `FK_PAYMENT__RELATIONS_USER` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `product_detail`
--
ALTER TABLE `product_detail`
  ADD CONSTRAINT `FK_PRODUCT__RELATIONS_PRODUCT` FOREIGN KEY (`ID_PRODUCT`) REFERENCES `product` (`ID_PRODUCT`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `product_size___stock`
--
ALTER TABLE `product_size___stock`
  ADD CONSTRAINT `FK_PRODUCT__RELATIONS_PRODUCT_` FOREIGN KEY (`ID_PRODUCT_DETAIL`) REFERENCES `product_detail` (`ID_PRODUCT_DETAIL`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `relationship_4`
--
ALTER TABLE `relationship_4`
  ADD CONSTRAINT `FK_RELATION_RELATIONS_SHOP_ADD` FOREIGN KEY (`ID_ADDITIONAL_PREFERENCES`) REFERENCES `shop_additional_preferences` (`ID_ADDITIONAL_PREFERENCES`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RELATION_RELATIONS_SHOP_PRE` FOREIGN KEY (`ID_SHOP_PREFERENCES`) REFERENCES `shop_preferences` (`ID_SHOP_PREFERENCES`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `relationship_8`
--
ALTER TABLE `relationship_8`
  ADD CONSTRAINT `FK_RELATION8_USER` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RELATION_RELATIONS_SPORT_IN` FOREIGN KEY (`ID_SPORT_INTEREST`) REFERENCES `sport_interest` (`ID_SPORT_INTEREST`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `relationship_9`
--
ALTER TABLE `relationship_9`
  ADD CONSTRAINT `FK_RELATION9_PRODUCT_` FOREIGN KEY (`ID_PRODUCT_INTEREST`) REFERENCES `product_interest` (`ID_PRODUCT_INTEREST`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RELATION9_USER` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `relationship_10`
--
ALTER TABLE `relationship_10`
  ADD CONSTRAINT `FK_RELATION_RELATIONS_TEAM_INT` FOREIGN KEY (`ID_TEAM_INTEREST`) REFERENCES `team_interest` (`ID_TEAM_INTEREST`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RELATION_RELATIONS_USER` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `relationship_11`
--
ALTER TABLE `relationship_11`
  ADD CONSTRAINT `FK_RELATION11_USER` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RELATION_RELATIONS_ATHLETE_` FOREIGN KEY (`ID_ATHLETES_INTEREST`) REFERENCES `athlete_interest` (`ID_ATHLETES_INTEREST`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `relationship_12`
--
ALTER TABLE `relationship_12`
  ADD CONSTRAINT `FK_RELATION12_USER` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RELATION_RELATIONS_CITY_INT` FOREIGN KEY (`ID_CITY_INTEREST`) REFERENCES `city_interest` (`ID_CITY_INTEREST`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `relationship_20`
--
ALTER TABLE `relationship_20`
  ADD CONSTRAINT `FK_RELATION_RELATIONS_FAVOURIT` FOREIGN KEY (`FAVOURITE_ID`) REFERENCES `favourite` (`FAVOURITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RELATION_RELATIONS_PRODUCT_` FOREIGN KEY (`ID_PRODUCT_DETAIL`) REFERENCES `product_detail` (`ID_PRODUCT_DETAIL`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `relationship_22`
--
ALTER TABLE `relationship_22`
  ADD CONSTRAINT `FK_RELATION22_USER` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RELATION_RELATIONS_STORE` FOREIGN KEY (`ID_STORE`) REFERENCES `store` (`ID_STORE`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `relationship_23`
--
ALTER TABLE `relationship_23`
  ADD CONSTRAINT `FK_RELATION23_PRODUCT_` FOREIGN KEY (`ID_PRODUCT_DETAIL`) REFERENCES `product_detail` (`ID_PRODUCT_DETAIL`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RELATION_RELATIONS_BAG` FOREIGN KEY (`ID_BAG`) REFERENCES `bag` (`ID_BAG`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_REVIEW_RELATIONS_PRODUCT` FOREIGN KEY (`ID_PRODUCT`) REFERENCES `product` (`ID_PRODUCT`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_REVIEW_RELATIONS_REVIEW_P` FOREIGN KEY (`ID_IMAGE_REVIEW`) REFERENCES `review_photo` (`ID_IMAGE_REVIEW`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `review_photo`
--
ALTER TABLE `review_photo`
  ADD CONSTRAINT `FK_REVIEW_P_RELATIONS_REVIEW` FOREIGN KEY (`ID_REVIEW`) REFERENCES `review` (`ID_REVIEW`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `shop_preferences`
--
ALTER TABLE `shop_preferences`
  ADD CONSTRAINT `FK_SHOP_PRE_RELATIONS_USER` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_USER_COMM_PREF` FOREIGN KEY (`ID_COMMUNICATION_PREFERENCES`) REFERENCES `communication_preferences` (`ID_COMMUNICATION_PREFERENCES`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_USER_DELIVERY_ADDR` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `delivery_address` (`ADDRESS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_USER_NATIONAL_ID` FOREIGN KEY (`NATIONAL_ID`) REFERENCES `citizen_national_id` (`NATIONAL_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_USER_PAYMENT_CARD` FOREIGN KEY (`ID_PAYMENT_CARD`) REFERENCES `payment_card` (`ID_PAYMENT_CARD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_USER_PRIVACY` FOREIGN KEY (`ID_PRIVACY`) REFERENCES `privacy` (`ID_PRIVACY`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_USER_SHOP_PREF` FOREIGN KEY (`ID_SHOP_PREFERENCES`) REFERENCES `shop_preferences` (`ID_SHOP_PREFERENCES`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
