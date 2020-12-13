-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2020 at 09:25 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `site`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `task_id`, `created_at`, `updated_at`) VALUES
(27, 2, 2, '2020-12-10 05:24:57', '2020-12-10 05:24:57'),
(28, 2, 1, '2020-12-10 05:24:58', '2020-12-10 05:24:58'),
(33, 1, 1, '2020-12-10 17:40:25', '2020-12-10 17:40:25'),
(34, 1, 3, '2020-12-10 17:40:26', '2020-12-10 17:40:26'),
(36, 1, 4, '2020-12-10 17:48:47', '2020-12-10 17:48:47'),
(41, 4, 3, '2020-12-11 05:18:30', '2020-12-11 05:18:30'),
(42, 4, 1, '2020-12-11 05:18:34', '2020-12-11 05:18:34'),
(43, 1, 2, '2020-12-13 02:58:20', '2020-12-13 02:58:20');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `body` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` int(11) NOT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `body`, `commentable_id`, `commentable_type`, `created_at`, `updated_at`) VALUES
(31, 1, 'TIKRAI NE!', 32, 'App\\Thread', '2020-12-10 17:39:45', '2020-12-10 17:47:14'),
(32, 1, 'Negražiai pasakyta', 34, 'App\\Thread', '2020-12-10 17:39:55', '2020-12-10 17:39:55'),
(33, 1, 'Neliūdek :(', 33, 'App\\Thread', '2020-12-10 17:40:04', '2020-12-10 17:40:04'),
(34, 3, 'Sutinku su šiuo žmogumi, šokiai nekažka', 32, 'App\\Thread', '2020-12-11 05:14:16', '2020-12-11 05:14:16'),
(35, 1, 'Tikrai...', 37, 'App\\Thread', '2020-12-13 03:43:31', '2020-12-13 03:43:31');

-- --------------------------------------------------------

--
-- Table structure for table `halls`
--

CREATE TABLE `halls` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `halls`
--

INSERT INTO `halls` (`id`, `name`, `location`, `created_at`, `updated_at`) VALUES
(1, 'Kariauno salė', 'Vilniaus druskininų g. 98', '2020-12-01 20:22:23', NULL),
(2, 'Kariauno salė', 'Saules g. 15', NULL, NULL),
(3, 'Majueir salė', 'Klaipedos ventos g. 89', NULL, NULL),
(4, 'Posisko salė', 'Mažeikių naftininkų g. 10', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_04_13_012507_create_threads_table', 1),
(4, '2017_04_17_080216_add_user_id_to_threads', 1),
(5, '2017_04_22_123222_create_comments_table', 1),
(6, '2017_05_06_161732_add_solution_column_in_threads_table', 1),
(7, '2017_05_08_032932_create_likes_table', 1),
(8, '2017_05_20_132643_create_notifications_table', 1),
(9, '2017_07_03_004159_create_tags_table', 1),
(10, '2017_07_03_004815_create_tags_thread_table', 1),
(11, '2020_12_09_112501_create_tasks_table', 2),
(12, '2020_12_09_222341_create_bookings_table', 3),
(13, '2020_12_12_201856_create_halls_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0e15caab-2614-4dc1-9f40-2918fbeb9eab', 'App\\Notifications\\RepliedToThread', 1, 'App\\User', '{\"thread\":{\"id\":1,\"subject\":\"Kazkas\",\"thread\":\"zodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziai\",\"type\":\"niekas\",\"created_at\":\"2020-12-01 09:23:10\",\"updated_at\":\"2020-12-09 07:23:39\",\"user_id\":1,\"solution\":1,\"user\":{\"id\":1,\"name\":\"omegand\",\"email\":\"om@gmail.com\",\"created_at\":\"2020-11-04 06:04:19\",\"updated_at\":\"2020-12-01 06:04:19\"}},\"user\":{\"id\":1,\"name\":\"omegand\",\"email\":\"om@gmail.com\",\"created_at\":\"2020-11-04 06:04:19\",\"updated_at\":\"2020-12-01 06:04:19\"}}', NULL, '2020-12-09 05:27:11', '2020-12-09 05:27:11'),
('68cf3cde-db27-4960-9493-6807a679b589', 'App\\Notifications\\RepliedToThread', 1, 'App\\User', '{\"thread\":{\"id\":1,\"subject\":\"Kazkas\",\"thread\":\"zodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziai\",\"type\":\"niekas\",\"created_at\":\"2020-12-01 09:23:10\",\"updated_at\":\"2020-12-09 07:23:39\",\"user_id\":1,\"solution\":1,\"user\":{\"id\":1,\"name\":\"omegand\",\"email\":\"om@gmail.com\",\"created_at\":\"2020-11-04 06:04:19\",\"updated_at\":\"2020-12-01 06:04:19\"}},\"user\":{\"id\":1,\"name\":\"omegand\",\"email\":\"om@gmail.com\",\"created_at\":\"2020-11-04 06:04:19\",\"updated_at\":\"2020-12-01 06:04:19\"}}', NULL, '2020-12-09 06:11:15', '2020-12-09 06:11:15'),
('81918ff6-01e6-4204-be47-297ff5ec7c4d', 'App\\Notifications\\RepliedToThread', 1, 'App\\User', '{\"thread\":{\"id\":1,\"subject\":\"Kazkas\",\"thread\":\"zodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziai\",\"type\":\"niekas\",\"created_at\":\"2020-12-01 09:23:10\",\"updated_at\":\"2020-12-09 07:23:39\",\"user_id\":1,\"solution\":1,\"user\":{\"id\":1,\"name\":\"omegand\",\"email\":\"om@gmail.com\",\"created_at\":\"2020-11-04 06:04:19\",\"updated_at\":\"2020-12-01 06:04:19\"}},\"user\":{\"id\":1,\"name\":\"omegand\",\"email\":\"om@gmail.com\",\"created_at\":\"2020-11-04 06:04:19\",\"updated_at\":\"2020-12-01 06:04:19\"}}', NULL, '2020-12-09 05:25:20', '2020-12-09 05:25:20'),
('ca00adb8-6b7e-429a-bf76-6a65d49f15f5', 'App\\Notifications\\RepliedToThread', 1, 'App\\User', '{\"thread\":{\"id\":1,\"subject\":\"Kazkas\",\"thread\":\"zodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziai\",\"type\":\"niekas\",\"created_at\":\"2020-12-01 09:23:10\",\"updated_at\":\"2020-12-09 07:23:39\",\"user_id\":1,\"solution\":1,\"user\":{\"id\":1,\"name\":\"omegand\",\"email\":\"om@gmail.com\",\"created_at\":\"2020-11-04 06:04:19\",\"updated_at\":\"2020-12-01 06:04:19\"}},\"user\":{\"id\":2,\"name\":\"Tomas\",\"email\":\"tom@gmail.com\",\"created_at\":\"2020-12-09 08:07:09\",\"updated_at\":\"2020-12-09 08:07:09\"}}', NULL, '2020-12-09 06:24:16', '2020-12-09 06:24:16'),
('cbbb0b2d-43ac-4cfe-bb88-20b6e24bda14', 'App\\Notifications\\RepliedToThread', 1, 'App\\User', '{\"thread\":{\"id\":1,\"subject\":\"Kazkas\",\"thread\":\"zodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziai\",\"type\":\"niekas\",\"created_at\":\"2020-12-01 09:23:10\",\"updated_at\":\"2020-12-09 07:23:39\",\"user_id\":1,\"solution\":1,\"user\":{\"id\":1,\"name\":\"omegand\",\"email\":\"om@gmail.com\",\"created_at\":\"2020-11-04 06:04:19\",\"updated_at\":\"2020-12-01 06:04:19\"}},\"user\":{\"id\":2,\"name\":\"Tomas\",\"email\":\"tom@gmail.com\",\"created_at\":\"2020-12-09 08:07:09\",\"updated_at\":\"2020-12-09 08:07:09\"}}', NULL, '2020-12-09 06:07:18', '2020-12-09 06:07:18'),
('d4635168-222d-41f6-8d67-903dc3d48ef3', 'App\\Notifications\\RepliedToThread', 1, 'App\\User', '{\"thread\":{\"id\":1,\"subject\":\"Kazkas\",\"thread\":\"zodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziai\",\"type\":\"niekas\",\"created_at\":\"2020-12-01 09:23:10\",\"updated_at\":null,\"user_id\":1,\"solution\":null,\"user\":{\"id\":1,\"name\":\"omegand\",\"email\":\"om@gmail.com\",\"created_at\":\"2020-11-04 06:04:19\",\"updated_at\":\"2020-12-01 06:04:19\"}},\"user\":{\"id\":1,\"name\":\"omegand\",\"email\":\"om@gmail.com\",\"created_at\":\"2020-11-04 06:04:19\",\"updated_at\":\"2020-12-01 06:04:19\"}}', NULL, '2020-12-09 05:23:26', '2020-12-09 05:23:26'),
('f66abf26-850c-458a-8167-5450603021ad', 'App\\Notifications\\RepliedToThread', 1, 'App\\User', '{\"thread\":{\"id\":1,\"subject\":\"Kazkas\",\"thread\":\"zodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziaizodziai\",\"type\":\"niekas\",\"created_at\":\"2020-12-01 09:23:10\",\"updated_at\":\"2020-12-09 07:23:39\",\"user_id\":1,\"solution\":1,\"user\":{\"id\":1,\"name\":\"omegand\",\"email\":\"om@gmail.com\",\"created_at\":\"2020-11-04 06:04:19\",\"updated_at\":\"2020-12-01 06:04:19\"}},\"user\":{\"id\":1,\"name\":\"omegand\",\"email\":\"om@gmail.com\",\"created_at\":\"2020-11-04 06:04:19\",\"updated_at\":\"2020-12-01 06:04:19\"}}', NULL, '2020-12-09 05:43:54', '2020-12-09 05:43:54');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `halls_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `description`, `task_date`, `created_at`, `updated_at`, `halls_id`) VALUES
(1, 'Angels Rock Symphony', 'Pastaraisiais metais pristatęs solidžius projektus su žymiu rusų violončelininku ir kompozitoriumi Denisu Shapovalovu bei prancūzų tromboninku Jaques‘u Mauger, Kauno pučiamųjų instrumentų orkestras „Ąžuolynas“ gruodžio 11 d. savo ištikimus klausytojus bei klasikinės muzikos gerbėjus kviečia į prabangią muzikos puotą – koncertą „Angels and Rock Symphony“ („Angelai ir Roko Simfonija“) Kauno valstybinėje filharmonijoje.', '2020-12-26', '2020-12-09 09:34:42', '2020-12-09 09:34:42', 1),
(2, 'Soul Lounge - šokių studija', 'Uždegantiems šokių ritmams atsiduoti Jus kviečia šokių ir laisvalaikio centras „Soul Lounge\".\r\n\r\nCentro „Soul Lounge\" įkūrėjams, Karinai Eremian ir Deividui Meškauskui, šokis — tai meilė, kuria gerą dalintis su kitais. \r\n\r\n\r\nPrabanga tviskanti salė, profesionalūs treneriai ir čia besilankančios šokių pasaulio žvaigždės rodo, jog ši studija nėra eilinė.\r\n\r\n\r\nČia Jūsų laukia ne tik profesionalūs mokytojai, smagios ir vertingos šokių, kalanetikos pamokos, bet ir jauki aplinka, kurioje jausitės kaip namuose. Centre „Soul Lounge\" galėsite ne tik treniruotis, bet ir kurti, ilsėtis ir gerai praleisti laiką su šeima, draugais, kolegomis bei profesionaliais treneriais.', '2020-12-31', '2020-12-09 09:36:52', '2020-12-09 09:36:52', 2),
(3, 'Šokių studija - Flash Dance', 'Šokių studija siūlo įvairių šokių stilių treniruotes vaikams ir suaugusiems', '2020-12-12', '2020-12-10 07:42:07', '2020-12-10 07:42:07', 2),
(4, 'Šokių studija - GAMERS', 'Nauja šokių studija PPC \"AKROPOLIS\", 4 aukštas\r\nĮėjimas per VERSLO CENTRĄ iš Griunvaldo g. arba 3 aukštą', '2020-12-13', '2020-12-18 20:09:49', NULL, 3),
(7, 'Defqon', 'Ateikite!', '2020-12-31', '2020-12-13 06:00:17', '2020-12-13 06:00:17', 4),
(8, 'Kiurez', 'Pamatyk naujausius hitus', '2020-12-26', '2020-12-13 06:22:37', '2020-12-13 06:22:37', 3),
(9, 'Kiurez 2', 'Pamatyk naujausius hitus', '2020-12-31', '2020-12-13 06:23:05', '2020-12-13 06:23:05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thread` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`id`, `subject`, `thread`, `created_at`, `updated_at`, `user_id`) VALUES
(32, 'Ar patinka šokiai ?', 'Nežinau kaip jūs, bet man įdomiau partneriai.', '2020-12-10 19:39:26', '2020-12-10 17:46:42', 1),
(33, 'Vienišų žmogučių forumas', 'Nu ka - as vienisa iskaudinta ir nusivylusi gyvenimu.....\r\nKuriam vienisiu kluba!!!\r\nvisi kam sunku - sukit cia. kartu bus lengviau (tikiuosi)..', '2020-12-10 19:39:28', NULL, 2),
(34, 'Ar tiesa, kad šita svetainė beviltiška?', 'Sveiki mielieji draugautojai ir draugautojos. Laibai įdomu būtų sužinoti jūsų patirtį ir nuomonę apie šią \"susipažinimo\" svetainėlę. Man asmeniškai pabūvus čia susidaro įspūdis, kad ši svetai', '2020-12-10 19:39:30', NULL, 2),
(35, 'Ieškau partnerio į užsiemima', 'Man 22 mėtai, vyras, tinka bet koks partneris parašykit į tel. !!!! 5-55-55555', '2020-12-10 17:43:59', '2020-12-10 17:43:59', 1),
(36, 'Yra norinčiu vyktu kartu į ateinanti Flash Dance susiburima?', 'Man xx metų, ieškau draugo su kuo nueiti. Vienam kažkaip liūdna :D', '2020-12-11 05:25:14', '2020-12-11 05:25:14', 4),
(37, 'Kas kaune vyksta?', 'Už lango Korona, parazitai ir visi kitokie padarai. Baisu', '2020-12-13 03:43:25', '2020-12-13 03:43:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `admin`) VALUES
(1, 'omegand', 'om@gmail.com', '$2y$10$0hOqMtCR8LQLEmJftdOZo.RzDgNnoSLvtksSZb.wdJS5k8pKJRLNy', 'DsSsAR0gKaWIsnIskUQiQ5nQKYVsiRJGCjWXVK1XPCDxGtN7kGFeRWGx1eoY', '2020-11-04 04:04:19', '2020-12-09 20:10:59', 1),
(2, 'Tomas', 'tom@gmail.com', '$2y$10$XwEWEjAlYI3LnToBT8wF0ehNYdNHAHRwE5Y5hGCAd/FNI9D/spKB6', '84o7xsNOGMbIwAWUVnxMduAJ85hgob7iPiPRMxLXvrJXWOw8YGFyH4c3ML5e', '2020-12-09 06:07:09', '2020-12-09 06:07:09', 0),
(3, 'Vytauras', 'poker@gmail.com', '$2y$10$mm3dF1hLfx1ihQwACwKevOssNxBlxrnjMh5aKpTfP.oSeyfqX6eLS', '8yISnNSfFU5luZPFuez9BSAVG2IxiCUmcaLjPuG2vNVYagKWvNi1v7bfAOR1', '2020-12-11 05:13:58', '2020-12-11 05:13:58', 0),
(4, 'Kestas', 'kkk@gmail.com', '$2y$10$anWOsRFVWgBAb42fZQ1dVedL/ErCjDMo7kfcgWh.jMtF7Whr5fw5a', 'TxvOq4szAlRB3D6TuC4FBJ5C9IMIZMfYZIDIHwMdvnDPcSNXpPP0cDYuinBS', '2020-12-11 05:15:46', '2020-12-11 05:15:46', 0),
(5, 'admin', 'admin@gmail.com', '$2y$10$RrDQSjlJJVDiqJT3vcKQsuGnvKTxB363HpNJll6Vf2DkQKGZKmSvG', '51Oo8AmUV1w801rSTa8IADAGfZ9EdsWnWeRRMB1cJdGezROAKJfEhYfdmI4E', '2020-12-13 05:37:47', '2020-12-13 05:37:47', 1),
(6, 'Brown', 'brown@gmail.com', '$2y$10$AxIKvwj4Uzy/d8I0haxnGuesEmqn7BrxiVTpIJPuUEtIQqafekiki', 'vcpSPa4PzBDmBEkJz4UcY87d6eGCbC2t0D984uBdZ8hozzzBaYTwbjFd9FoW', '2020-12-13 05:39:08', '2020-12-13 05:39:08', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `halls`
--
ALTER TABLE `halls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `halls`
--
ALTER TABLE `halls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
