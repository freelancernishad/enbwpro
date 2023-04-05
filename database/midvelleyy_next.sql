-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2023 at 01:24 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `midvelleyy_next`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Images` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tags` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Category` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `post_id`, `title`, `short_description`, `description`, `Images`, `Tags`, `Category`, `price`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'dfgfg', NULL, NULL, 'http://localhost:8000/blogs/1665224655____14015.jpeg', NULL, 'Products', '-P57MrGeM', 'active', '2023-01-08 04:46:22', '2023-03-01 05:54:08', '2023-03-01 05:54:08'),
(2, NULL, 'fg', NULL, NULL, 'http://localhost:8000/blogs/1665224655____14015.jpeg', NULL, 'Products', 'fN21oOdni_c', 'active', '2023-03-01 05:50:08', '2023-03-15 15:09:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `category_id`, `name`, `slug`, `parent_category`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '163649', 'Products', 'products', NULL, '2022-09-21 06:53:16', '2022-09-21 06:53:16', NULL),
(2, '183127', 'ddd', 'ddd', NULL, '2023-03-01 05:49:57', '2023-03-01 05:53:39', '2023-03-01 05:53:39');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_post_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `screenshot` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `curency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detials` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `try` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `method`, `amount`, `screenshot`, `curency`, `rate`, `final_amount`, `detials`, `sender`, `trx`, `try`, `status`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(2, '2', '1', '1100', NULL, 'Bdt', '1', NULL, NULL, '01909756552', '4777', NULL, 'pending', NULL, '2023-03-14 18:59:40', '2023-03-14 18:59:40'),
(3, '2', '1', '1100', NULL, 'Bdt', '1', NULL, NULL, '01909756552', 'hgfhfyu', NULL, 'approved', NULL, '2023-03-15 04:14:26', '2023-03-15 04:14:51'),
(4, '3', '1', '1100', NULL, 'Bdt', '1', NULL, NULL, '01909756552', 'dfghghj', NULL, 'approved', NULL, '2023-03-15 05:55:29', '2023-03-15 05:55:54'),
(5, '3', '1', '1100', NULL, 'Bdt', '1', NULL, NULL, '01909754655', 'fdgfghghj', NULL, 'approved', NULL, '2023-03-15 05:59:34', '2023-03-15 06:00:04'),
(6, '3', '1', '1100', NULL, 'Bdt', '1', NULL, NULL, '01909756552', 'dfghgh', NULL, 'approved', NULL, '2023-03-15 06:04:44', '2023-03-15 06:05:01'),
(7, '3', '1', '1100', NULL, 'Bdt', '1', NULL, NULL, '01909756552', 'dfgyjhghj', NULL, 'approved', NULL, '2023-03-15 06:06:44', '2023-03-15 06:07:04'),
(8, '4', '1', '1100', NULL, 'Bdt', '1', NULL, NULL, '01909756552', 'dghhgkjhjk', NULL, 'approved', NULL, '2023-03-15 06:09:12', '2023-03-15 06:09:34'),
(9, '2', '1', '1100', NULL, 'Bdt', '1', NULL, NULL, '01909756552', 'dfhgkjkg', NULL, 'pending', NULL, '2023-03-17 04:17:58', '2023-03-17 04:17:58');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percent_charge` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_charge` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processtime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_parameter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `name`, `currency`, `symbol`, `method_code`, `gateway_alias`, `min_amount`, `max_amount`, `percent_charge`, `fixed_charge`, `processtime`, `rate`, `image`, `gateway_parameter`, `number`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bkash', 'Bdt', '৳', '1000', NULL, '0000', '000', '15', '0', '24', '1', 'https://realearn69.com/assets/images/gateway/629a17595878f1654265689.jpg', NULL, '01909756552', 'active', NULL, '2022-10-13 19:02:34'),
(2, 'Nagad', 'Bdt', '৳', '1000', NULL, '000', '000', '15', '0', '24', '1', 'https://realearn69.com/assets/images/gateway/629a17595878f1654265689.jpg', NULL, NULL, 'deactive', NULL, '2022-09-16 17:20:47'),
(3, 'Rocket', 'Bdt', '৳', '1000', NULL, '00', '000', '15', '0', '24', '1', 'https://realearn69.com/assets/images/gateway/629a17595878f1654265689.jpg', NULL, 'TCAuoBpLTH9Z7stoccxtWBqT1EfrHXxQ7Z', 'deactive', NULL, '2022-09-16 17:21:00');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_commisition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `name`, `task_commisition`, `comission`, `created_at`, `updated_at`) VALUES
(1, 'Level1', '6', '10', NULL, '2022-09-01 02:06:13'),
(2, 'Level2', '3', '5', NULL, '2022-09-01 02:06:20'),
(3, 'Level3', '2', '2', NULL, '2022-08-30 13:51:19');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2022_07_06_113708_create_roles_table', 1),
(11, '2022_08_07_144646_create_plans_table', 1),
(12, '2022_08_07_144941_create_levels_table', 1),
(13, '2022_08_07_145217_create_deposits_table', 1),
(14, '2022_08_07_145648_create_withdrawals_table', 1),
(15, '2022_08_09_171543_create_gateways_table', 2),
(16, '2022_08_12_111216_create_transitions_table', 3),
(17, '2022_08_13_211811_create_tasks_table', 4),
(18, '2022_08_02_150515_create_blog_categories_table', 5),
(19, '2022_08_02_172832_create_blogs_table', 5),
(20, '2022_08_02_222336_create_blog_comments_table', 5),
(21, '2022_08_31_012134_create_settings_table', 6),
(22, '2023_02_18_123024_create_packages_table', 7),
(23, '2023_02_18_123712_create_package_buys_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('011fdec9d9a839903f6e890fa1267c67b0a9558ff46105128e19c7c32a79f98b9e6e4b56cf03cd59', 4, 2, 'accessToken', '[]', 0, '2022-10-08 10:24:29', '2022-10-08 10:24:29', '2023-10-08 16:24:29'),
('021a849aaea4875b1f66e7e2484a28d229dd493a1d2a20d4205a04a9e2c77a13e49edfa73ad2fff1', 23, 1, 'accessToken', '[]', 0, '2022-09-01 21:31:35', '2022-09-01 21:31:35', '2023-09-02 03:31:35'),
('028157da2106e16f3abdaa6ac26fc9d7e3073a3db691e909d531710167cc212b86473f37078f15b1', 6, 1, 'accessToken', '[]', 0, '2022-08-10 19:38:15', '2022-08-10 19:38:15', '2023-08-11 01:38:15'),
('0348194ee1c6e33f09a88854016b468c6fc4529309053d8ed4e0d65d72a61dfc3cc1aaf86d7dee43', 7, 1, 'accessToken', '[]', 0, '2022-08-13 08:25:41', '2022-08-13 08:25:41', '2023-08-13 14:25:41'),
('04751968c997cf19aba900e2e2cd09436e32136bd9102f4ac9776c12b68d8faa89027e7a76149259', 20, 1, 'accessToken', '[]', 0, '2022-09-01 04:05:44', '2022-09-01 04:05:44', '2023-09-01 10:05:44'),
('048849074025bbdd1c8ecbc24e8ed22487ee1ca8b25d7f0d2cd9d3a6c2b6d63bc849889f0003e64b', 3, 1, 'accessToken', '[]', 0, '2022-08-13 02:13:10', '2022-08-13 02:13:10', '2023-08-13 08:13:10'),
('04bc79cf8bbac6ed3b97dc106c053e8dff109074a3ccc97212370dc98c6ce2fa4b912f61a4516adb', 5641, 2, 'accessToken', '[]', 0, '2023-03-07 16:22:35', '2023-03-07 16:22:35', '2024-03-07 22:22:35'),
('052154aea1bca8584764417a1bae66fd86a738de7b87c09566d11b946d73e4adf1c245ed2051932e', 20, 1, 'accessToken', '[]', 0, '2022-08-30 19:41:45', '2022-08-30 19:41:45', '2023-08-31 01:41:45'),
('053305b1a8fb86516f542f9b725cb81685b8944afc673776ab3b8045c290c7f9835ac445514da90e', 5637, 2, 'accessToken', '[]', 0, '2022-10-29 07:21:21', '2022-10-29 07:21:21', '2023-10-29 13:21:21'),
('05331237f726a211b53c37d382fbe4e0607634f1510f55ae2835a1021e3b5e4bd0a10b5cf60c2de7', 5638, 2, 'accessToken', '[]', 0, '2022-11-13 05:08:06', '2022-11-13 05:08:06', '2023-11-13 11:08:06'),
('06077c7d358fa904690a7ced2fc7119136346a65c3158baba1a023c080ce2e143525bea5c4353356', 4, 2, 'accessToken', '[]', 0, '2022-10-12 13:03:46', '2022-10-12 13:03:46', '2023-10-12 19:03:46'),
('065b63d8dad79b510dec237c4b18015f89d45a215753284e2d2d0582dd419f9cbaa5abfa38ea00f2', 23, 1, 'accessToken', '[]', 0, '2022-09-02 04:22:56', '2022-09-02 04:22:56', '2023-09-02 10:22:56'),
('072c88ef874cf442520bc6da64ac3b0ececc1916685feddfcdb39f81b002d00dcd3600f1e43db44e', 2, 1, 'accessToken', '[]', 0, '2022-08-11 07:53:27', '2022-08-11 07:53:27', '2023-08-11 13:53:27'),
('075740d55a8deb88d1a8883b7b23e2383e9921f01db269b124c656d3a79f5d8b287b477677e4a191', 20, 1, 'accessToken', '[]', 0, '2022-08-31 20:23:58', '2022-08-31 20:23:58', '2023-09-01 02:23:58'),
('07beb4b4d6e7e13bf70452fb4d4960ef396d47895fb372cc380f64e10472b9330c20da1fdc006825', 15, 1, 'accessToken', '[]', 0, '2022-08-29 10:51:20', '2022-08-29 10:51:20', '2023-08-29 16:51:20'),
('07f7ddde0ffa7fd0da9482ab175126f2f0c64fe1f4ceeb7e8d687952147e7e117d4011646702f7ef', 2, 2, 'accessToken', '[]', 0, '2023-03-15 15:22:53', '2023-03-15 15:22:53', '2024-03-15 21:22:53'),
('0886378618f38142e7131f732222ac610a3dc43f406da56cca424f05968c213a98a5af374af44e81', 20, 1, 'accessToken', '[]', 0, '2022-09-01 06:49:11', '2022-09-01 06:49:11', '2023-09-01 12:49:11'),
('0898b0aa7404b3ab3cf828bad2286f0509bc528abe140fe45f08612d743d8f3502bb3f53d2a6c7fc', 5638, 2, 'accessToken', '[]', 0, '2022-10-29 07:24:18', '2022-10-29 07:24:18', '2023-10-29 13:24:18'),
('0961eed4a3f10e5487966a0d652dfb41af2e19dd7661ce78bf09837226112c9a0ecada13682ec38f', 6, 1, 'accessToken', '[]', 0, '2022-09-29 05:42:53', '2022-09-29 05:42:53', '2023-09-29 11:42:53'),
('09ce19a5e356dc241df8a0369050743ae5809bde8f347c82d873ec1b960512aa07365439b2b74e96', 5640, 2, 'accessToken', '[]', 0, '2023-02-20 15:41:08', '2023-02-20 15:41:08', '2024-02-20 21:41:08'),
('0a5d836f59e23e0627989421dfae473934ac4356a55dcce397a44478ae252b600116ae66646cf599', 5640, 2, 'accessToken', '[]', 0, '2023-02-10 05:21:39', '2023-02-10 05:21:39', '2024-02-10 11:21:39'),
('0a976651871eb8c96a94c7c2daffde081380c0e48e4920fdc9b0b856f485fdf44668cff6f2594fea', 12, 1, 'accessToken', '[]', 0, '2022-08-27 09:58:14', '2022-08-27 09:58:14', '2023-08-27 15:58:14'),
('0aced07c562796aac148cb65b628c9c2f580f1e716d3212955f55f2b2d471f4902616b0a2b4c37a8', 4, 2, 'accessToken', '[]', 0, '2022-10-25 10:06:07', '2022-10-25 10:06:07', '2023-10-25 16:06:07'),
('0bcd11733c0cd2ba90cf7ad6e44726f371db3c9efe88bcf47fcb56c13c25636460c4aa92d5f5892c', 3, 2, 'accessToken', '[]', 0, '2022-10-14 05:36:25', '2022-10-14 05:36:25', '2023-10-14 11:36:25'),
('0bf0e257c2a8a24117b6b95645a5be2660c84eadd07bfc46489fd99c58b88540b943fd7846eb458a', 20, 1, 'accessToken', '[]', 0, '2022-09-01 04:11:11', '2022-09-01 04:11:11', '2023-09-01 10:11:11'),
('0cad7d615b56314211f74b32ab13b51d0d234fdb8afdbe624b25672b59e6a37efe9571d19455e023', 3, 2, 'accessToken', '[]', 0, '2022-10-06 10:25:28', '2022-10-06 10:25:28', '2023-10-06 16:25:28'),
('0d9be1c43bf3c698a2e16a142b55f1b21a73f8ff064605f1c4c85eae5ec2d1b1c8378da9d2b8f835', 5640, 2, 'accessToken', '[]', 0, '2023-02-21 16:41:10', '2023-02-21 16:41:10', '2024-02-21 22:41:10'),
('0e2ce2d00d04cb2dda9173a0bb448ba065153a4e7304b420c4c418c61713372b4c5b4b1b0673231a', 2, 2, 'accessToken', '[]', 0, '2023-03-17 10:31:11', '2023-03-17 10:31:11', '2024-03-17 16:31:11'),
('11c281052203bc3383232fb7653877f587a4ece8fe211eec21cb5e815e8d883f04f1d09145ff957e', 4, 2, 'accessToken', '[]', 0, '2022-10-07 14:24:23', '2022-10-07 14:24:23', '2023-10-07 20:24:23'),
('12a7b26e327a4d5b4baaed1928b0adcdd2a63b8752678349f8b15b5034d5e319c2dbf1cd6f6b381e', 3, 1, 'accessToken', '[]', 0, '2022-08-18 06:46:28', '2022-08-18 06:46:28', '2023-08-18 12:46:28'),
('12cf71ae0216430ae2ac3a05c885a6d13b728896213a13faaa0a194b13aa31946b1c804d04495813', 4, 2, 'accessToken', '[]', 0, '2022-10-12 12:47:15', '2022-10-12 12:47:15', '2023-10-12 18:47:15'),
('13838bbeaad45a28b892f0b6083fc603a37ce23e9ca0e2c10bf719f6f925a6772122a52c50e715a6', 4, 1, 'accessToken', '[]', 0, '2022-09-22 08:12:23', '2022-09-22 08:12:23', '2023-09-22 14:12:23'),
('13bb6947bd24fdc8397f65ebf6424d2b709a55fbcaa3cd52e12e53c5461578e69af123cb7d545d07', 2, 1, 'accessToken', '[]', 0, '2022-08-13 13:46:21', '2022-08-13 13:46:21', '2023-08-13 19:46:21'),
('148013ed695170bbacd7836040d91d995f86fd7b1f14a35f8ffec0266086fe6922b1919cbdffc59a', 19, 1, 'accessToken', '[]', 0, '2022-08-30 19:45:26', '2022-08-30 19:45:26', '2023-08-31 01:45:26'),
('148a8f7b97955e2342d5e80457a90426dea7d90f821df2be6b160aa30665543e38c84faad0bfda83', 4, 2, 'accessToken', '[]', 0, '2022-10-09 18:29:37', '2022-10-09 18:29:37', '2023-10-10 00:29:37'),
('15dd128b8735a224b150fdef74b53a8b1e5071c6ef377843abfced0088c052a32299d29280038580', 2, 1, 'accessToken', '[]', 0, '2022-08-11 11:03:55', '2022-08-11 11:03:55', '2023-08-11 17:03:55'),
('162780bc312cb8f130ddddeef69fb4c7cf3915ac91b4768ee76483d12311feb92a33a07cf33e5fff', 3, 2, 'accessToken', '[]', 0, '2022-10-29 07:18:51', '2022-10-29 07:18:51', '2023-10-29 13:18:51'),
('16913a416a961efffcb285b9cfd4e97e217dc4137dbfc0c6ff9bdbe7fe4d19a8f48e1a2b8f50309e', 12, 1, 'accessToken', '[]', 0, '2022-08-27 10:31:34', '2022-08-27 10:31:34', '2023-08-27 16:31:34'),
('1800017f74057cf73f7f49f7c0a49aa4bbc1aa10a26a31f37df3b1bc106b4cd3f479141eed3e8404', 4, 2, 'accessToken', '[]', 0, '2022-10-11 16:07:34', '2022-10-11 16:07:34', '2023-10-11 22:07:34'),
('1833b0f7a340a11d35c0a02b4ae2b58848efeb3bdd0073998e97f21efdef0fad62afc80c3f677abc', 1, 1, 'accessToken', '[]', 0, '2022-08-09 05:18:19', '2022-08-09 05:18:19', '2023-08-09 11:18:19'),
('1b5542a4709732873df90ab02e13637c976047b59d75693474442d4c6b2915a5ebb1672dbcd66a21', 5641, 2, 'accessToken', '[]', 0, '2023-03-07 16:20:11', '2023-03-07 16:20:11', '2024-03-07 22:20:11'),
('1e740c0fdbbe42577682c47b113800d16eaa08dd66436f3354e40173b4cfceda0f955eadaab86b15', 4, 2, 'accessToken', '[]', 0, '2022-10-12 13:02:29', '2022-10-12 13:02:29', '2023-10-12 19:02:29'),
('1e955f03748fe399278b92aa611432a5cee3b6f099d7b07f314e388547478d5806b25f86ef690056', 1, 1, 'accessToken', '[]', 0, '2022-08-08 05:18:46', '2022-08-08 05:18:46', '2023-08-08 11:18:46'),
('1f07f247d4385b9cc4aa0250b6aef4bc94f8d64ab0dfec44b112675d3796e86462151cc432ef70c8', 3, 1, 'accessToken', '[]', 0, '2022-08-12 05:33:45', '2022-08-12 05:33:45', '2023-08-12 11:33:45'),
('205ad608c78686ae50cd79c7bafe83e2132f944f8608c799c1b37941196f01198a07b50b93be58c2', 5640, 2, 'accessToken', '[]', 0, '2023-02-18 15:45:50', '2023-02-18 15:45:50', '2024-02-18 21:45:50'),
('21393c0854efb6264b019b32409b6026bcf5260064a1a6be23d93d04834fcd8349b8a1b146a43130', 3, 2, 'accessToken', '[]', 0, '2023-03-15 05:55:07', '2023-03-15 05:55:07', '2024-03-15 11:55:07'),
('24039d8818d2dac23750216db70265b5a3f9849f2c201814b15857ce82fc3f44b7158d99dea19fe0', 5640, 2, 'accessToken', '[]', 0, '2023-01-07 15:48:05', '2023-01-07 15:48:05', '2024-01-07 21:48:05'),
('24bba3396c497d1f9405f82b214947e57a4c6589ebc1fc6f22a564e93996a3308b0fe9157c272f0d', 4, 2, 'accessToken', '[]', 0, '2022-10-24 16:53:33', '2022-10-24 16:53:33', '2023-10-24 22:53:33'),
('24ec7df3317468128a0a80f7da649dc82a1a7ca80da1bf23e98fccd7b37c7ea15ade6c1ef089155c', 4, 2, 'accessToken', '[]', 0, '2022-10-06 15:33:40', '2022-10-06 15:33:40', '2023-10-06 21:33:40'),
('268030d5271ad8f835f6913ae25fa09698767dfa23f0389dd90a7ee8be18c99c2a13460fbb36316b', 2, 2, 'accessToken', '[]', 0, '2023-03-16 04:08:43', '2023-03-16 04:08:43', '2024-03-16 10:08:43'),
('2693c0981bbfa64b49b2f767ecb4bde19b346d81fe79995e7d03837eba73a62018ae95b7e24a8769', 12, 1, 'accessToken', '[]', 0, '2022-08-23 19:59:39', '2022-08-23 19:59:39', '2023-08-24 01:59:39'),
('272d4e7904d9fda37837b0ef66078fabefc049a607d032958e76e98f69519ac1c9c5ab0d2e096328', 19, 1, 'accessToken', '[]', 0, '2022-09-01 21:01:49', '2022-09-01 21:01:49', '2023-09-02 03:01:49'),
('2865a6f473fd3202506df2747b9b69c1a9347779dbf728bf1436af17a4ab97e7190d488059f0c2d2', 5638, 2, 'accessToken', '[]', 0, '2022-11-10 15:17:12', '2022-11-10 15:17:12', '2023-11-10 21:17:12'),
('28fe5da1e8cb83b3babeaa502577ecd838e144da78753d811df51e39204963325dcf6c460e211d94', 10, 1, 'accessToken', '[]', 0, '2022-08-18 19:31:01', '2022-08-18 19:31:01', '2023-08-19 01:31:01'),
('29497247258966fe529fd3253b7e68f594af61f4ddf7f6e7f0f6b41edd9fda004f7e4748b4ea716e', 7, 1, 'accessToken', '[]', 0, '2022-08-22 10:26:07', '2022-08-22 10:26:07', '2023-08-22 16:26:07'),
('29c4a915c7b7c25e9842597839c007f3e80ce25210b2d97ce2280afdd35a63610e5f179e3161cba0', 1, 1, 'accessToken', '[]', 0, '2022-08-09 11:09:18', '2022-08-09 11:09:18', '2023-08-09 17:09:18'),
('2a2dd9ac0d01502639e63074d67cd666676158a3c563391c84f9fc7ef85f16baf803b35e4a771a3d', 4, 2, 'accessToken', '[]', 0, '2022-10-07 04:53:28', '2022-10-07 04:53:28', '2023-10-07 10:53:28'),
('2b9507de14f15730d12d7bb5ff27decdc4b682d217bca65bfb5492302e9a91d299aaed41da09e94f', 5641, 2, 'accessToken', '[]', 0, '2022-12-20 08:23:32', '2022-12-20 08:23:32', '2023-12-20 14:23:32'),
('2c059652b3ccf6b42fa75e6ae9caacb73fbc616f4c3ad3a144af230c3c756fd8da054f911d4eca28', 11, 1, 'accessToken', '[]', 0, '2022-08-10 18:59:14', '2022-08-10 18:59:14', '2023-08-11 00:59:14'),
('2c077af81145815f11d29b352ada742c8834fed0b228a7c5edbad919636674a64dfc487f7753dee1', 4, 2, 'accessToken', '[]', 0, '2022-10-07 14:28:34', '2022-10-07 14:28:34', '2023-10-07 20:28:34'),
('2c8bb25dcadbeeb17ac5411cbe5ed770c0ced6290f642a83641a2b290fc1b88c95a17e5f0017516d', 4, 2, 'accessToken', '[]', 0, '2022-10-06 15:34:39', '2022-10-06 15:34:39', '2023-10-06 21:34:39'),
('2d44a618ad3a9c1e81b0445625cb8afad80802c5441c2db0740dcfb6349740649e77b21f74926e2f', 19, 1, 'accessToken', '[]', 0, '2022-09-04 15:42:47', '2022-09-04 15:42:47', '2023-09-04 21:42:47'),
('2e8576be58332ad8359c67eb543e774709c8779a794b7735f47045a8adb52665c8d2a976e8049991', 5640, 2, 'accessToken', '[]', 0, '2023-02-08 04:59:28', '2023-02-08 04:59:28', '2024-02-08 10:59:28'),
('3028376ae81ac4f9251dfb320f989700948bd6440ee1fd29fffcdb5b279e13ee2c99a2a5d09f02d9', 19, 1, 'accessToken', '[]', 0, '2022-09-03 08:03:56', '2022-09-03 08:03:56', '2023-09-03 14:03:56'),
('30a42fa44d41a681d51510a8b26dc1a966dee537de235c3e7763e3788485a78ad13bb1359c5c3704', 11114, 1, 'accessToken', '[]', 0, '2022-09-20 18:05:42', '2022-09-20 18:05:42', '2023-09-21 00:05:42'),
('30ba6d4104ecf827b2e1e3eecc8739232c339e073de13f3b53462ec01d1fb300dfa095de0b42a4aa', 5638, 2, 'accessToken', '[]', 0, '2022-10-31 16:19:49', '2022-10-31 16:19:49', '2023-10-31 22:19:49'),
('31c15b202acf7e79b0a1e82e6332d30b8d1e035d05dc4e81d7afa3c07e19b0e8b647fd8369962206', 5640, 2, 'accessToken', '[]', 0, '2023-02-12 15:23:21', '2023-02-12 15:23:21', '2024-02-12 21:23:21'),
('325f1e76f2a6b5ef2a229d69c55f754b17c6bcc68bdb09210cfcf86c9681a767673991d4b3c3a29d', 4, 2, 'accessToken', '[]', 0, '2022-10-09 17:38:58', '2022-10-09 17:38:58', '2023-10-09 23:38:58'),
('325f6c9af7b1923cff815fc0646148b841e9d48eab50c59bf2e627467faf63a0bbc167f1f05c64e4', 24, 1, 'accessToken', '[]', 0, '2022-09-05 04:16:37', '2022-09-05 04:16:37', '2023-09-05 10:16:37'),
('33c1073d9c331f117949758be1959ddec55fd1e9ed917618926997526274bd99ee32a9a1642d3754', 11, 1, 'accessToken', '[]', 0, '2022-08-19 17:40:36', '2022-08-19 17:40:36', '2023-08-19 23:40:36'),
('34958883c26aa3f56447d8ca648bcdb83865858eddf0ef8b7da61bf4655b3654d1ffbd47d0f154bc', 5640, 2, 'accessToken', '[]', 0, '2023-02-18 05:32:28', '2023-02-18 05:32:28', '2024-02-18 11:32:28'),
('3509e6b1d91368159dddeca97e82cf8fc61992bf4f95a121a844b18f784cfb60719318f959be3785', 1, 1, 'accessToken', '[]', 0, '2022-09-26 18:51:58', '2022-09-26 18:51:58', '2023-09-27 00:51:58'),
('36b07b87998e2c93c6fa41a4a493bd9c101a35bfa5d939add967bbda58d70cecd58e833004e6edfe', 5640, 2, 'accessToken', '[]', 0, '2023-02-07 18:01:44', '2023-02-07 18:01:44', '2024-02-08 00:01:44'),
('378d0c0ea9a15902fc9831f4c43a094be6cf4dbc96097fd2265263356b107019e3d5ef432b83cd6b', 4, 2, 'accessToken', '[]', 0, '2022-10-25 05:58:21', '2022-10-25 05:58:21', '2023-10-25 11:58:21'),
('380668ae607a4dd25773c734d22fa6087dabefdf7ef36ed41caf04a53a3e5aa14ce9c9884c89c450', 5641, 2, 'accessToken', '[]', 0, '2023-03-14 07:30:47', '2023-03-14 07:30:47', '2024-03-14 13:30:47'),
('3856f298421b4282ab7ee097bc1566acbf6fbc7b795ab8ef6d6a88b5c261adb6450f50c39c08ec6d', 4, 1, 'accessToken', '[]', 0, '2022-09-22 08:45:27', '2022-09-22 08:45:27', '2023-09-22 14:45:27'),
('38e1e54be046e7802e4ca1f5019c6d07f2d9a79143cd95f645b1dc9da9b113bdef5150ee783c6574', 6, 1, 'accessToken', '[]', 0, '2022-08-10 11:44:40', '2022-08-10 11:44:40', '2023-08-10 17:44:40'),
('393eb0c21e98e0fa552122b1f56a7532c9a8212b58d668a5e7ded7879faa3dd306edc7ff6f669be8', 3, 1, 'accessToken', '[]', 0, '2022-08-12 06:16:34', '2022-08-12 06:16:34', '2023-08-12 12:16:34'),
('394aee8fe0ca4061b22b22efe8209bbeab411746b6f035b23fbe8092ee1cd9a1212d543e33404cc5', 20, 1, 'accessToken', '[]', 0, '2022-08-30 19:53:41', '2022-08-30 19:53:41', '2023-08-31 01:53:41'),
('396c1852ba5ce4b919aa214ce4ed7e38b094ebfe1970957f7f45710e7ec4a447b7224a1b89ddc8da', 5638, 2, 'accessToken', '[]', 0, '2022-11-11 05:10:25', '2022-11-11 05:10:25', '2023-11-11 11:10:25'),
('3a128b9c3997c108f43ed977f65e3c61a9514b64e1303305500b08fc21e360bce1e2bcb9ea7888b7', 7, 1, 'accessToken', '[]', 0, '2022-08-19 21:00:41', '2022-08-19 21:00:41', '2023-08-20 03:00:41'),
('3a5747f74fa10233e77eecfa7a908f51717a05701ae1b66f89996c3563be09033648cd4fdb21e04b', 4, 2, 'accessToken', '[]', 0, '2022-10-24 14:32:03', '2022-10-24 14:32:03', '2023-10-24 20:32:03'),
('3b1c8fe3babe7c57380a9812481d3a542dbee1a82941517280815d41dd4a60b044f0366c0a3fc260', 3, 1, 'accessToken', '[]', 0, '2022-08-11 07:53:06', '2022-08-11 07:53:06', '2023-08-11 13:53:06'),
('3b21e840c03066cf040bd8c36500f039a4d1d54d5c1144d2126947193604b8644921bbe65a4b8b94', 15, 1, 'accessToken', '[]', 0, '2022-08-29 08:06:01', '2022-08-29 08:06:01', '2023-08-29 14:06:01'),
('3b69203572cfdacf26029cb146dd2ca7022ca3e5f9310455597f93eadabc2f8908778c2cd609aeea', 4, 1, 'accessToken', '[]', 0, '2022-09-21 06:34:40', '2022-09-21 06:34:40', '2023-09-21 12:34:40'),
('3c15e5273b90d9fc8caf95dc62dbcfee147270ad553f1f72ccb0a7f3f99dee4b18ffde37aaf45bdc', 20, 1, 'accessToken', '[]', 0, '2022-09-05 04:17:15', '2022-09-05 04:17:15', '2023-09-05 10:17:15'),
('3c597be5cf11c5ca09bb98bdb26388ffebec3f847779a10049d87b8b32c0a1198ddc48fa73ce0a58', 11, 1, 'accessToken', '[]', 0, '2022-08-19 13:53:08', '2022-08-19 13:53:08', '2023-08-19 19:53:08'),
('3cc90afd97ea11213da820c0d6574bed8ecfaaa0312979a2779a3743d6fb470320de815155480967', 1, 1, 'accessToken', '[]', 0, '2022-09-26 18:45:53', '2022-09-26 18:45:53', '2023-09-27 00:45:53'),
('3e09326210927aa1f2a9073387d6a6fa2fac915f6ab7e59c31b73216a7694f2cbe7e4935beffbbf8', 23, 1, 'accessToken', '[]', 0, '2022-09-02 09:18:27', '2022-09-02 09:18:27', '2023-09-02 15:18:27'),
('3e5e08a301039570f607c3745f0ed0a4df8e17fd630a93a9861c27e19256d5098581ada98b4d65c0', 3, 1, 'accessToken', '[]', 0, '2022-09-21 05:05:09', '2022-09-21 05:05:09', '2023-09-21 11:05:09'),
('3e794c32bcf14ee17d08c3f9a96fbae3b83e87917b7cfad351998a3373e1e5391a0c84e8c81df0f8', 4, 2, 'accessToken', '[]', 0, '2022-10-13 14:58:28', '2022-10-13 14:58:28', '2023-10-13 20:58:28'),
('3f1ecde280a929d70bd031b3a5970643ded76401c9e639035a9f897d9ec6c46291ef2ffb8a077327', 15, 1, 'accessToken', '[]', 0, '2022-08-29 10:41:39', '2022-08-29 10:41:39', '2023-08-29 16:41:39'),
('3f9c31241768c107413713a578c4fa382f10ad2c61d0de6f7c6b5ed5009ce293bd59cb35fa457075', 19, 1, 'accessToken', '[]', 0, '2022-09-01 21:29:28', '2022-09-01 21:29:28', '2023-09-02 03:29:28'),
('4003772b44f0ee5a1e9b0382c1f2bbe419f5e7bfb89be9f5408ef46d14ab979a13d9d3738e46a28a', 3, 2, 'accessToken', '[]', 0, '2022-10-25 05:48:16', '2022-10-25 05:48:16', '2023-10-25 11:48:16'),
('405a7eb8667a8a40f007f465aa3922db34ae24eb0cac622fc2b6df92617ca11efc99eab9b8b64f74', 5640, 2, 'accessToken', '[]', 0, '2022-11-23 04:35:26', '2022-11-23 04:35:26', '2023-11-23 10:35:26'),
('42d958d6863c2b85b9fa9d98c09b20a7c30d50ccfe247b04720a3f3f334069ffac4dd8321ba2183e', 4, 1, 'accessToken', '[]', 0, '2022-09-21 06:35:20', '2022-09-21 06:35:20', '2023-09-21 12:35:20'),
('42f0055b975236dd466328d3b531e707e41a00819a86324cad020d75daf41f278b6aee3f6a4b6a9d', 6, 1, 'accessToken', '[]', 0, '2022-08-10 20:40:02', '2022-08-10 20:40:02', '2023-08-11 02:40:02'),
('4320fffd09443a84669d29e191c60e0ee9387915dde53b299973f3d6dcb75fb5f6572bdda2945c0b', 5640, 2, 'accessToken', '[]', 0, '2022-11-22 07:02:51', '2022-11-22 07:02:51', '2023-11-22 13:02:51'),
('4340a8edd069e189a0993589961f4d7f3983ffbf6d574f9c7fe684126e56b6dc18ed127d0bc55723', 23, 1, 'accessToken', '[]', 0, '2022-09-01 21:53:03', '2022-09-01 21:53:03', '2023-09-02 03:53:03'),
('437da74d2340514476c38e54bfaf9ffe1afe194fa16f9b7ea754293d273f15da2b4a1e71aebd400f', 19, 1, 'accessToken', '[]', 0, '2022-09-01 21:33:13', '2022-09-01 21:33:13', '2023-09-02 03:33:13'),
('4458cca00372ce86c7100a1538add17928682b05acab41b6e9563850f1f268fcbe26d1195c581e7a', 1, 1, 'accessToken', '[]', 0, '2022-08-10 08:44:54', '2022-08-10 08:44:54', '2023-08-10 14:44:54'),
('4521256fb716b180a777b786a6b9a4669143b62e7413705099b50eeb31a12873552ac33115caacb3', 7, 1, 'accessToken', '[]', 0, '2022-09-27 17:06:59', '2022-09-27 17:06:59', '2023-09-27 23:06:59'),
('45938bad9209c3c6de950dcb844fbea9d132afae8caa06e5121eb2cb9752eb0a750b440b3d6ba8cb', 2, 2, 'accessToken', '[]', 0, '2023-03-17 04:17:24', '2023-03-17 04:17:24', '2024-03-17 10:17:24'),
('459fcc70c272cc69efd4876a4c4c45d7d29af79eabcb1998faa935e5495ade31f8ca02b7a213bd9d', 3, 2, 'accessToken', '[]', 0, '2022-10-13 18:54:36', '2022-10-13 18:54:36', '2023-10-14 00:54:36'),
('46043a13d05b53212adc76503a568602f6ad790eb9e68266daf55cc5dbd48f50ccd327d6a8b67e60', 20, 1, 'accessToken', '[]', 0, '2022-08-31 16:09:05', '2022-08-31 16:09:05', '2023-08-31 22:09:05'),
('463b149f02f68958a320e2aedc79ff049d2165b552d1e318f666eea2fa6da1a70031d7f3f7f9e143', 4, 2, 'accessToken', '[]', 0, '2022-10-09 17:54:26', '2022-10-09 17:54:26', '2023-10-09 23:54:26'),
('467e6a8ad1a5dad4e3492ba209e847897d6b9752befac7e9099ae5b9a5faf4cc22e4fbf4ca11edca', 20, 1, 'accessToken', '[]', 0, '2022-08-31 11:41:06', '2022-08-31 11:41:06', '2023-08-31 17:41:06'),
('485a2e0a1981d6791d8301f57b61228d9a2e010f75bd459e330d39aa6dddc98a4b61ac05549b1b81', 19, 1, 'accessToken', '[]', 0, '2022-08-31 04:41:33', '2022-08-31 04:41:33', '2023-08-31 10:41:33'),
('4861bb6f2dce5bdb97fd11f2cc0d32bf8f3d9482d62590ae6f02617ea7ef19ab35324e267045b0a5', 6, 1, 'accessToken', '[]', 0, '2022-09-26 18:58:01', '2022-09-26 18:58:01', '2023-09-27 00:58:01'),
('4937a08e2e2c383a98fb3dade69b7540264b6cbc5b7f80c34284fa5cc2ab47f7b9b93f9a44a05cf9', 5641, 2, 'accessToken', '[]', 0, '2023-03-12 04:02:41', '2023-03-12 04:02:41', '2024-03-12 10:02:41'),
('493f62e965a8a27d1ec090a7581761836f8a37d61b5e9b376be23c7d8cea13dab09cb176df53963d', 6, 1, 'accessToken', '[]', 0, '2022-09-29 05:21:17', '2022-09-29 05:21:17', '2023-09-29 11:21:17'),
('4973513dce3526c61a1c61adcb8ba30874bd7687275f57f1af1464b422dcaeae30050400854ba792', 5640, 2, 'accessToken', '[]', 0, '2022-11-23 17:06:47', '2022-11-23 17:06:47', '2023-11-23 23:06:47'),
('4a24aa32a5df1aa3c7b22b8620f187415b548ee051abb8d1335253c8258082b873083c48249a3a7a', 19, 1, 'accessToken', '[]', 0, '2022-09-01 07:15:05', '2022-09-01 07:15:05', '2023-09-01 13:15:05'),
('4bb61b3955535171285d03605ec106681215221d8a87c86df7b78420d715e48f385bee06935b61ce', 3, 1, 'accessToken', '[]', 0, '2022-08-13 02:12:30', '2022-08-13 02:12:30', '2023-08-13 08:12:30'),
('4c9d3da08e94edbba999a7774ac340eda2a606d40be503538a925dfa99b5319c4508251a0bfb7315', 5638, 2, 'accessToken', '[]', 0, '2022-11-16 17:05:10', '2022-11-16 17:05:10', '2023-11-16 23:05:10'),
('4cad3b93a28497641c19245f5c5ccd11941583fa78a96f52108e25ca63e37cf1f74853677214ccc0', 3, 2, 'accessToken', '[]', 0, '2022-11-12 12:24:47', '2022-11-12 12:24:47', '2023-11-12 18:24:47'),
('4d88074540265c47d0d6026135cff3ef1c154438858c8ef10406e79f380a00e13ef4b310f92599f5', 3, 2, 'accessToken', '[]', 0, '2022-10-13 17:16:53', '2022-10-13 17:16:53', '2023-10-13 23:16:53'),
('4e7f390e1f55c84b4fdd1289f5f48710389c5f91875b4e82f9ccb827a8d05a33acef2ac0c0a817f9', 2, 2, 'accessToken', '[]', 0, '2023-03-15 04:10:15', '2023-03-15 04:10:15', '2024-03-15 10:10:15'),
('4e7ff0fdc9839cc6205ab8e02a561dd3ad57c7d97783bf126782e804e9ee8d2dab2304d5b1a5512f', 5638, 2, 'accessToken', '[]', 0, '2022-11-06 18:25:36', '2022-11-06 18:25:36', '2023-11-07 00:25:36'),
('4e900f1f620670714ab5654efdddc915235e171dd382f5e73b65bc80205a034dde718327e625298b', 5640, 2, 'accessToken', '[]', 0, '2023-01-28 03:35:29', '2023-01-28 03:35:29', '2024-01-28 09:35:29'),
('4f2e6d243e130a0d774fd39bc6e4561e5d11546a220ed662f82283ac5d2d604cb1bf068985f738c3', 5638, 2, 'accessToken', '[]', 0, '2022-11-13 15:01:43', '2022-11-13 15:01:43', '2023-11-13 21:01:43'),
('4fea983b8722440474400c8169a53eaa352040de88d10b2976ec7f8b5e54f0d17ae51ddda9330035', 5638, 2, 'accessToken', '[]', 0, '2022-10-29 10:20:25', '2022-10-29 10:20:25', '2023-10-29 16:20:25'),
('504739db0a6365964a4149c7d4d876a7b5994d69a279daaf5902db12b499394a8945d7f8fa285d5b', 20, 1, 'accessToken', '[]', 0, '2022-08-31 18:02:20', '2022-08-31 18:02:20', '2023-09-01 00:02:20'),
('5069df464b9a4cc95503b2c7dc7282bc500fbb15372b35fcf1abbbfeb39ae66dee87c6cf76f02c03', 13, 1, 'accessToken', '[]', 0, '2022-10-03 13:59:15', '2022-10-03 13:59:15', '2023-10-03 19:59:15'),
('50f0da4bf4d62efff2196a05dcd24aa5f70aa9a1465a945d81763349a34f98512573269cd3b7076a', 3, 2, 'accessToken', '[]', 0, '2023-03-15 06:04:26', '2023-03-15 06:04:26', '2024-03-15 12:04:26'),
('5105da9a3eb7009e07b4b2bd3291b25058bb7cee6d1efff03f4dd974905ab40b3500ec7ea8f11203', 4, 2, 'accessToken', '[]', 0, '2022-10-13 18:04:35', '2022-10-13 18:04:35', '2023-10-14 00:04:35'),
('5121a6e86e9e69dc1b1f30a42e87470260293722d9f7fc07a5567f4c183ab6f219df8615b20001db', 20, 1, 'accessToken', '[]', 0, '2022-09-03 07:24:38', '2022-09-03 07:24:38', '2023-09-03 13:24:38'),
('519f105cb634dda044a2d9e129cf9ea465810be80ed3b1865533ff0861fb7a30083a7044c4b82d58', 7, 1, 'accessToken', '[]', 0, '2022-08-29 10:40:10', '2022-08-29 10:40:10', '2023-08-29 16:40:10'),
('51c4f766c1ac0f2ea8ace2ed97eb6c1f997c83c49b8cc1247f58f2985817dbbd571c76c48918b9c8', 5641, 2, 'accessToken', '[]', 0, '2023-03-06 08:00:28', '2023-03-06 08:00:28', '2024-03-06 14:00:28'),
('52e2d591d2c9c6db13f602adc6d37e1f3067319ff7c8d38b6e900f052e1702d2e495a67a2174e5f6', 19, 1, 'accessToken', '[]', 0, '2022-08-30 18:29:17', '2022-08-30 18:29:17', '2023-08-31 00:29:17'),
('53bb8c6477d664d4711461afc96f4ed9b44b0e1b709879ce005c6589d7cffc188bf09b94f86f83c7', 4, 2, 'accessToken', '[]', 0, '2022-10-24 17:16:13', '2022-10-24 17:16:13', '2023-10-24 23:16:13'),
('5483d7d203d3da34f141420bdfe7bd2b9a39e66b5e1c73a4c1b7f1ab6705c921cdbd9c1f512a5e48', 4, 2, 'accessToken', '[]', 0, '2022-10-16 15:25:40', '2022-10-16 15:25:40', '2023-10-16 21:25:40'),
('575a332af8639f8fce45feb5240f82a08df0d67cc6ebc8e537907edb7edd98123397898641a12b7e', 5638, 2, 'accessToken', '[]', 0, '2022-11-10 10:58:24', '2022-11-10 10:58:24', '2023-11-10 16:58:24'),
('584d788801ab60ac165deef4a9c7030120a819226955f2541c8e285b02032459d8e95d0c1b527790', 20, 1, 'accessToken', '[]', 0, '2022-09-08 03:14:04', '2022-09-08 03:14:04', '2023-09-08 09:14:04'),
('58743b684d430d465b3f5736a3a860e8cde6713c2095488cfa8422eaa1c5ff1057599032d7f91aa3', 5640, 2, 'accessToken', '[]', 0, '2022-11-22 15:52:41', '2022-11-22 15:52:41', '2023-11-22 21:52:41'),
('58bc56e30cadb950e2e489a0daf3c14f2b103311e0e03966eb609728532b99a268aff10491122e06', 3, 2, 'accessToken', '[]', 0, '2022-10-12 05:48:53', '2022-10-12 05:48:53', '2023-10-12 11:48:53'),
('59f9b3873e3410b7c416c95d7ac465a0bf2f98e586438bc7edbd444647d75a5e69a090bcbf2d7ea5', 20, 1, 'accessToken', '[]', 0, '2022-08-31 10:22:19', '2022-08-31 10:22:19', '2023-08-31 16:22:19'),
('5a0282b4d66ecfcb99b76f3338472d4640f375301cc639ece928c83d1199971462c31bd5cb79e621', 11, 1, 'accessToken', '[]', 0, '2022-08-20 16:55:03', '2022-08-20 16:55:03', '2023-08-20 22:55:03'),
('5a5f2969790571ae9fef2e670cd33e1796252f37d7df9a522f5ec52412e33dd370a5a8232497e317', 2, 2, 'accessToken', '[]', 0, '2023-03-14 19:23:22', '2023-03-14 19:23:22', '2024-03-15 01:23:22'),
('5baf6dea63acdad667f7a8d986a3af7de8d3d0e9b5d7557077dcca7b4a37aa4a2e0d0f315ce3d7e7', 3, 2, 'accessToken', '[]', 0, '2022-10-13 16:07:44', '2022-10-13 16:07:44', '2023-10-13 22:07:44'),
('5d146f7051c70237032adc4535f20ac748351a5622647c2c1160f25af947c7cfd28bb1749629c0ac', 5642, 2, 'accessToken', '[]', 0, '2023-02-09 16:11:02', '2023-02-09 16:11:02', '2024-02-09 22:11:02'),
('5db73ae0ae0b98d28b88657572df493540f6c1bb34e3ebd7a8046f6476c83791b77ad213dd8b148a', 1, 1, 'accessToken', '[]', 0, '2022-08-07 09:26:48', '2022-08-07 09:26:48', '2023-08-07 15:26:48'),
('5ed411d63fc58e08cbf3b3c5f7e5c3cbded5e80b5b9234be6d07946632ebc37b5d248fbb5c095e62', 5641, 2, 'accessToken', '[]', 0, '2023-03-11 07:02:24', '2023-03-11 07:02:24', '2024-03-11 13:02:24'),
('5f12c258ea4a720f34b76a44b01f9ae068863ffd3f2518664f68f415c0d210ad7bb34ac92625762c', 4, 2, 'accessToken', '[]', 0, '2022-10-12 12:54:37', '2022-10-12 12:54:37', '2023-10-12 18:54:37'),
('5f9b3649ff0628f5093d34e4fbe7edce8ed34df6b40919af770d7a07289954c6e72743513fd89e33', 11, 1, 'accessToken', '[]', 0, '2022-08-10 20:03:29', '2022-08-10 20:03:29', '2023-08-11 02:03:29'),
('5fabe82949c13997f54f1f105bf8fffa2a8456a3283c012f45846dad411c4ce3f31355bb114e5c2b', 7, 1, 'accessToken', '[]', 0, '2022-08-12 01:35:57', '2022-08-12 01:35:57', '2023-08-12 07:35:57'),
('60ff3b43adf9f0c6aea0837b00b3e7378e3eb9f3596d12e7264eb73d1aab1e16b9a878f9eb8d4631', 13, 2, 'accessToken', '[]', 0, '2022-10-03 14:35:05', '2022-10-03 14:35:05', '2023-10-03 20:35:05'),
('617d36be073925612e2c33fa02a4dbbf1f7687426ec4df5a60aa3b1c53b70a10c7f38579774d377d', 4, 2, 'accessToken', '[]', 0, '2022-10-12 12:58:20', '2022-10-12 12:58:20', '2023-10-12 18:58:20'),
('61a11e9e15c9672d9b48f3374f777678a3abaa288ed107b6734431b715bd36caee6c514b511c401c', 5640, 2, 'accessToken', '[]', 0, '2023-01-24 15:26:04', '2023-01-24 15:26:04', '2024-01-24 21:26:04'),
('61c8eacb75f898954d7539260782eca6154779fb0fe940169e0325784e6f214a52f80e070ea1f13e', 12, 1, 'accessToken', '[]', 0, '2022-08-25 16:00:37', '2022-08-25 16:00:37', '2023-08-25 22:00:37'),
('61de9c7b29132ca4b95e0f15a2f436068bc415ecb775eccac2625cfb1c23b5cd486ab7c59fe898b1', 5641, 2, 'accessToken', '[]', 0, '2023-03-08 10:47:37', '2023-03-08 10:47:37', '2024-03-08 16:47:37'),
('6280ac6499e8907898ea0bb086e93730fd2bcf17db7446275fc627c03f1c53dfb3c9e6d0e87f58c7', 11, 1, 'accessToken', '[]', 0, '2022-08-19 21:01:24', '2022-08-19 21:01:24', '2023-08-20 03:01:24'),
('62d583d663bcf47fe85f7f99e749a4ef3085f93480701effcc655e19acb55e69b1d877ae197d9349', 19, 1, 'accessToken', '[]', 0, '2022-09-19 05:31:51', '2022-09-19 05:31:51', '2023-09-19 11:31:51'),
('652f9623f76324573aec3c388ebb2fef2aa00c34c18fd006cf4d8128715d54531a06649905e4dade', 4, 2, 'accessToken', '[]', 0, '2022-10-12 11:41:03', '2022-10-12 11:41:03', '2023-10-12 17:41:03'),
('66596cdf7f7530f3bf63e8616fad01b0c1f2ad9ad7b0f8053c83eaf018baa3e6810bc5ca864b5af1', 5640, 2, 'accessToken', '[]', 0, '2023-02-23 16:53:05', '2023-02-23 16:53:05', '2024-02-23 22:53:05'),
('66d667ca1b1ca281aadd22776f97211b7fe11815cb9e130b4f5edbb04e4586a6f12d6e00cc191a79', 3, 1, 'accessToken', '[]', 0, '2022-09-22 09:19:39', '2022-09-22 09:19:39', '2023-09-22 15:19:39'),
('6850783107b6143660a0800fe2495ba3d1dbbd2cb77c27b8a0f249af18a909fa8013de0bee7c7100', 5641, 2, 'accessToken', '[]', 0, '2023-03-11 18:10:37', '2023-03-11 18:10:37', '2024-03-12 00:10:37'),
('68a24a456f2ed652130ba4ea223bd27ca9125961f4175343c7ca6f6bb59152c64ea05b6e3f98a8e1', 10, 1, 'accessToken', '[]', 0, '2022-08-19 13:52:04', '2022-08-19 13:52:04', '2023-08-19 19:52:04'),
('6955fd923cb4d5a596222ac65d9de7dd69c1262ea9c01ec5f89ab566a13a8089e788ac8e53c0fc32', 12, 1, 'accessToken', '[]', 0, '2022-08-29 10:47:55', '2022-08-29 10:47:55', '2023-08-29 16:47:55'),
('6a3ed7c3f47c2e8f90b85d91f7360dc3feb7ddaa4bcba64ae1afc35c94ddaa6ca88fe59957a523bf', 5641, 2, 'accessToken', '[]', 0, '2023-03-04 11:02:27', '2023-03-04 11:02:27', '2024-03-04 17:02:27'),
('6a47c91355ccbe490b12dc5e142d4ed8facf75cf52b19d6f05b2ea286b8479f536cc4fe238e1331c', 3, 2, 'accessToken', '[]', 0, '2022-10-11 15:30:22', '2022-10-11 15:30:22', '2023-10-11 21:30:22'),
('6a4903bc1821e78b50158064f2c2295b2d7ad4e59f956fc56d1cc18ba881c6ea667f54f4e370dd7c', 23, 1, 'accessToken', '[]', 0, '2022-09-01 21:29:45', '2022-09-01 21:29:45', '2023-09-02 03:29:45'),
('6b20f30b02a34927d8dda85bc6230d0e8918ff18dd9cb46a8dc069a09ef750e1565ba9ffd6b2403f', 6, 1, 'accessToken', '[]', 0, '2022-09-27 17:01:34', '2022-09-27 17:01:34', '2023-09-27 23:01:34'),
('6c412dd05395e4d0916df8b0a09e7ce3ddc6e59ddf4cf33b46c1edc01b4b047ce6f6007b336def15', 5638, 2, 'accessToken', '[]', 0, '2022-10-30 18:00:39', '2022-10-30 18:00:39', '2023-10-31 00:00:39'),
('6e473f64ee71c8bb7a79713b9c034b7dd56cfdf98ed6b7b44ab102b2264228d202f2e249f263e116', 20, 1, 'accessToken', '[]', 0, '2022-09-01 04:59:18', '2022-09-01 04:59:18', '2023-09-01 10:59:18'),
('6e5865583ed1f0dd31e7dcc70eced07b2b4e48a4693dab742e8201b3e3f61c239c1b04c5d642d098', 3, 1, 'accessToken', '[]', 0, '2022-08-13 02:11:54', '2022-08-13 02:11:54', '2023-08-13 08:11:54'),
('6eafde7ae76e4447c30411288f73a343415384fb764151a0c30bc351774bc4c2c903f258ba416d38', 10, 1, 'accessToken', '[]', 0, '2022-08-18 19:15:38', '2022-08-18 19:15:38', '2023-08-19 01:15:38'),
('6ed8170460ee211b019124388a366bc70e7a56171d8b22ec4c6ee3d3440e860a4342d2af28170c05', 12, 1, 'accessToken', '[]', 0, '2022-10-01 04:55:28', '2022-10-01 04:55:28', '2023-10-01 10:55:28'),
('70d3c4eb65590bb73d7c5afc7ad945427c5258177c18ecd91b034fc2891960b73b19ea2385fdd2dc', 5640, 2, 'accessToken', '[]', 0, '2023-02-04 06:27:22', '2023-02-04 06:27:22', '2024-02-04 12:27:22'),
('7144b9d5027110ec0578f951a4794ecae0ba5ccc7e1d4d70f1f4b628b934541658c646f5e129991a', 5641, 2, 'accessToken', '[]', 0, '2023-03-08 10:33:37', '2023-03-08 10:33:37', '2024-03-08 16:33:37'),
('71b663b3a1ecef4ce452edb7f9d9e5473fbca40303966cba56980b0274ec585a859f9fa70d0469e5', 3, 1, 'accessToken', '[]', 0, '2022-08-13 06:54:03', '2022-08-13 06:54:03', '2023-08-13 12:54:03'),
('71fbc4b44d9d885298ab8582a84e23a5df35b866688ed143c9d434ec7b2b1bd3937365d2b8cffd0a', 20, 1, 'accessToken', '[]', 0, '2022-09-01 04:59:52', '2022-09-01 04:59:52', '2023-09-01 10:59:52'),
('725acf4005a00d1856bee878fe2b37972cad9fbcfbd39b220cce1657e1ff0f8895a9de6cb653a9d1', 6, 1, 'accessToken', '[]', 0, '2022-09-27 17:07:17', '2022-09-27 17:07:17', '2023-09-27 23:07:17'),
('7288ad1762e53caefac483f37155d07e14dd73ea959a5b0f4fa05ec0379b215a8cfee245106b23ce', 6, 1, 'accessToken', '[]', 0, '2022-08-10 11:48:45', '2022-08-10 11:48:45', '2023-08-10 17:48:45'),
('72fd86805d22cae5107856cdc6409d38c97dfa4b9c18e8ec78192960279be8b0132eaefb6115a34e', 1, 1, 'accessToken', '[]', 0, '2022-09-29 05:38:27', '2022-09-29 05:38:27', '2023-09-29 11:38:27'),
('74266bad8f5ba161212e7cefe798f63a19ec41ead6a0388fce32e8563947e29a940e5cc2d2c39e94', 3, 1, 'accessToken', '[]', 0, '2022-09-21 07:06:14', '2022-09-21 07:06:14', '2023-09-21 13:06:14'),
('75a447699d5aed7a257db7df3ab49773b0f2792d05a279b408aeb5b13478352f4287ff61b571c0c2', 11, 1, 'accessToken', '[]', 0, '2022-08-10 20:40:42', '2022-08-10 20:40:42', '2023-08-11 02:40:42'),
('767e27421621572c2db922bc8da8d024c1e19cb80edefd158760a45b277bba23e92aa9417b9e8cef', 4, 1, 'accessToken', '[]', 0, '2022-09-22 08:58:45', '2022-09-22 08:58:45', '2023-09-22 14:58:45'),
('76c0d2967eedc9c6f22f5b16c3d8d94b9c80c16404c361334e3c8923acf7b87320627a64524f7808', 5640, 2, 'accessToken', '[]', 0, '2023-02-03 15:41:06', '2023-02-03 15:41:06', '2024-02-03 21:41:06'),
('76e63269c2ffa7a5dbdd8806692c77005a34a9a064a9a6911db4e22783ac4c732e37285aa32e0c48', 10, 1, 'accessToken', '[]', 0, '2022-08-20 08:34:33', '2022-08-20 08:34:33', '2023-08-20 14:34:33'),
('77b01fd4a24b6678bf4a0ae86149fa45eb347548c9289e27a80f989837d8cd180b1339ec44d1c14b', 4, 2, 'accessToken', '[]', 0, '2022-10-13 18:06:02', '2022-10-13 18:06:02', '2023-10-14 00:06:02'),
('77c5679f2666681b91ff19869bcd42728d2b2a2152e2acf7045044fd2fbe52fe21256799db0fdbf5', 5640, 2, 'accessToken', '[]', 0, '2023-02-10 15:45:35', '2023-02-10 15:45:35', '2024-02-10 21:45:35'),
('77c7735e0957fa1b21805a5b04a7bd85d3707ed30f13b4dc1480e0e3c3030c09fc623b74ee2b87dd', 7, 1, 'accessToken', '[]', 0, '2022-08-13 02:14:37', '2022-08-13 02:14:37', '2023-08-13 08:14:37'),
('7a1838bb44d5d30681ecbd87f137844c70c4e91f2c8442d8702ffec1bfdb82d1ef0c0cfcec4b8fb1', 6, 1, 'accessToken', '[]', 0, '2022-09-29 05:25:43', '2022-09-29 05:25:43', '2023-09-29 11:25:43'),
('7a58cf08881a8fc33f6290da24f6b3eb7aedd3252fffde07e8d57eca29edc2a195cc10fe31018210', 4, 2, 'accessToken', '[]', 0, '2022-10-13 17:42:46', '2022-10-13 17:42:46', '2023-10-13 23:42:46'),
('7bf621098b3817a169760a88a56c78c0d547f95d4dbc5e5b7e6a62a75f0e3c3dcf033d3e4413dc2e', 12, 1, 'accessToken', '[]', 0, '2022-08-27 10:32:47', '2022-08-27 10:32:47', '2023-08-27 16:32:47'),
('7cb433ffe4ea29d8be88c8e72e608a9e1484dd4122652bf0b5b3e401e97c76098e0a7d91c5f4044f', 6, 1, 'accessToken', '[]', 0, '2022-08-10 17:43:30', '2022-08-10 17:43:30', '2023-08-10 23:43:30'),
('7d5bb0c7ce508944bb5f268b9cd70ed23d79e5e1985d7e30ab3279dac47df4cee1dc1b0d317b3576', 5638, 2, 'accessToken', '[]', 0, '2022-11-11 06:01:36', '2022-11-11 06:01:36', '2023-11-11 12:01:36'),
('7fc47ab98ce2082650fcaa19efb7ad46b09fb8b927febf63d3993ef8c8ae412d1b0f6c95a8cde531', 6, 1, 'accessToken', '[]', 0, '2022-09-25 16:59:59', '2022-09-25 16:59:59', '2023-09-25 22:59:59'),
('8167fdc130110903bb4f1ea1ae525a5aed242d6bd014190a9b073d69ec00a40e1c10ce85b96af69c', 5638, 2, 'accessToken', '[]', 0, '2022-10-30 18:00:14', '2022-10-30 18:00:14', '2023-10-31 00:00:14'),
('81bd79c67f7df69a37c5fc1779c0b8d3b01f2b505e5cba52d025593169258628ce3a75c74c1fa3e4', 19, 1, 'accessToken', '[]', 0, '2022-08-30 19:55:49', '2022-08-30 19:55:49', '2023-08-31 01:55:49'),
('82097ba1c1e4fa387921d6eaee14f6fafb7929f7526ddec27a62d3a988f0150765425d0aeb1d6f3d', 7, 1, 'accessToken', '[]', 0, '2022-09-26 05:54:55', '2022-09-26 05:54:55', '2023-09-26 11:54:55'),
('820a8e509afbf4153f9544605b091a8f3e907f7da7f4ee2952a91e702ea7e9c33161c5ff6116b0b7', 4, 2, 'accessToken', '[]', 0, '2022-10-06 16:52:39', '2022-10-06 16:52:39', '2023-10-06 22:52:39'),
('82ea576f27a8d5054f2fd98aec4b4284b407cc359198b6dc0044dcea8056bf8231cb8db04a3bbd38', 9, 1, 'accessToken', '[]', 0, '2022-08-13 08:24:28', '2022-08-13 08:24:28', '2023-08-13 14:24:28'),
('84524bf3dbc7592039d9f1f7876f5e7deb26bae0ee0937945672ea4ccc4fc41b4d4bace3398cdf3e', 5640, 2, 'accessToken', '[]', 0, '2023-01-24 08:00:10', '2023-01-24 08:00:10', '2024-01-24 14:00:10'),
('84a548b5d2e8a2324798e08244cec7819215cde9c1dd4958bd886a463ed5bc2fd953ea0d7235a483', 4, 2, 'accessToken', '[]', 0, '2022-10-12 12:49:30', '2022-10-12 12:49:30', '2023-10-12 18:49:30'),
('85fe1e97ef842fdc98c3e09bb2120f19a00ca4c64a3897d07255e7c6f24c5a9ade589f58a682761b', 10, 1, 'accessToken', '[]', 0, '2022-08-18 17:58:02', '2022-08-18 17:58:02', '2023-08-18 23:58:02'),
('861b2a6d716e6fc7303c7986249ed35907979c936ba7871cd33628cc0ad6d0bdbd1beb7733360721', 11, 1, 'accessToken', '[]', 0, '2022-08-20 04:56:49', '2022-08-20 04:56:49', '2023-08-20 10:56:49'),
('872823d738f81329c45bf43adbfbd2673030d735d71d6ee1b70562019c607b3128a18f397dbfc04d', 5640, 2, 'accessToken', '[]', 0, '2023-01-24 08:22:24', '2023-01-24 08:22:24', '2024-01-24 14:22:24'),
('874670cda116d25ba53b48d9caf7956e1662241833b322fdd4210859097b94317601ddd33362f5eb', 5640, 2, 'accessToken', '[]', 0, '2022-11-30 18:15:51', '2022-11-30 18:15:51', '2023-12-01 00:15:51'),
('88c5f0cb9edda87f8aa7cfc57006d588d0eef473fb8fc456af3d36a8c71c6623a9f920725ccdff58', 5640, 2, 'accessToken', '[]', 0, '2023-02-26 03:42:34', '2023-02-26 03:42:34', '2024-02-26 09:42:34'),
('897b675786d09d7b38ba703219ef5a6126961941cd654964094b2631a9384a4f8ca3c8b80a1d3bee', 12, 1, 'accessToken', '[]', 0, '2022-09-30 05:55:56', '2022-09-30 05:55:56', '2023-09-30 11:55:56'),
('8988ba4f6535717729c5fab77ce38952b399f80e7a7f3b6b92245edf5e227d3fd342372c76dbf063', 2, 1, 'accessToken', '[]', 0, '2022-08-11 07:46:17', '2022-08-11 07:46:17', '2023-08-11 13:46:17'),
('89f56c1c4f325b60fa499a9e8807f7b7db483b1da6e39b45f32474dd08889185d9697b8e98fc8696', 19, 1, 'accessToken', '[]', 0, '2022-08-31 19:59:46', '2022-08-31 19:59:46', '2023-09-01 01:59:46'),
('8a6a82a8bb6888761e83cb8569cded6670a3f823d4c909ca06d16c5a3df21cc667f4a89ae7b77744', 20, 1, 'accessToken', '[]', 0, '2022-08-31 04:53:21', '2022-08-31 04:53:21', '2023-08-31 10:53:21'),
('8b9cd4ac2a898e5d18a6ff9b43a987373930c09a10cc3c826b9983a8227e52dd4eb3591bb9e02848', 3, 1, 'accessToken', '[]', 0, '2022-08-13 02:38:38', '2022-08-13 02:38:38', '2023-08-13 08:38:38'),
('8be95f655e4895484ecb3a5d4cbb48cbac1f5dc3c866619e25aced4bfc6dd4cd42ed7c63e4102a69', 5640, 2, 'accessToken', '[]', 0, '2023-01-11 07:03:48', '2023-01-11 07:03:48', '2024-01-11 13:03:48'),
('8bf79b93c32c7c206b2d629a282b7c0ac39534f4dc17927e70f230739c019d9513f573d87d0e08ec', 3, 2, 'accessToken', '[]', 0, '2022-10-14 05:41:39', '2022-10-14 05:41:39', '2023-10-14 11:41:39'),
('8c3a211929e50edfd5d36b61273c20ef842883825069ec72036e9880e4b3c9cfe85d30eb19a55bef', 4, 2, 'accessToken', '[]', 0, '2022-10-08 09:43:05', '2022-10-08 09:43:05', '2023-10-08 15:43:05'),
('8c8f68f198bfc90c9eb4d4afd5148c1fe0b07972943d4ab513992c66e846284541a0b720cb362176', 1, 1, 'accessToken', '[]', 0, '2022-09-26 19:03:02', '2022-09-26 19:03:02', '2023-09-27 01:03:02'),
('8ca30ac2d3e08e5cb3ef3d27472e943c368367e3c4d652bb08606716662dde522686710fd88dabcc', 5640, 2, 'accessToken', '[]', 0, '2023-02-09 09:33:48', '2023-02-09 09:33:48', '2024-02-09 15:33:48'),
('8d1e4651af9bde8a989f304edfa8a08bd515f8fc78d0ddb3d120a5e869696904e35cdb83bf6fea2c', 2, 1, 'accessToken', '[]', 0, '2022-09-20 18:12:24', '2022-09-20 18:12:24', '2023-09-21 00:12:24'),
('8d7fa422498a1554b3b4ddf80bac4c4208874f38f8b7d8ccfead9f4ebb2d43b863443bb545cdb40a', 21, 1, 'accessToken', '[]', 0, '2022-08-31 19:47:22', '2022-08-31 19:47:22', '2023-09-01 01:47:22'),
('8e7379830b18bb52c60d89bb381823c0e369dd6fe7d76a716f7c26a12e388bdd221e9434258e8059', 3, 2, 'accessToken', '[]', 0, '2023-03-15 05:59:11', '2023-03-15 05:59:11', '2024-03-15 11:59:11'),
('8e8588916a965a02c28bae9562c40ee30fec6a941d278c60ca1262c64a1a3fb591c638c633341555', 4, 2, 'accessToken', '[]', 0, '2022-10-12 06:03:40', '2022-10-12 06:03:40', '2023-10-12 12:03:40'),
('8e884d528e0fd08e2a1334de300d403fd432e871a51cf98df978a650100ca2dbdd5007710b872243', 1, 1, 'accessToken', '[]', 0, '2022-08-08 07:08:14', '2022-08-08 07:08:14', '2023-08-08 13:08:14'),
('8ea5fefeb4c50b98bbc9c09c8bc6970d8b6a812c5b46d228cc5f3cbd7d1a462fead48e7f1b1abd9a', 11, 1, 'accessToken', '[]', 0, '2022-08-10 20:14:13', '2022-08-10 20:14:13', '2023-08-11 02:14:13'),
('8f0135a80108e676895fe3a1faf08a413c3bc24919a9fcc30516ed6581c2cbe5c3a0d4b095a99dc3', 3, 1, 'accessToken', '[]', 0, '2022-08-13 02:09:41', '2022-08-13 02:09:41', '2023-08-13 08:09:41'),
('8f33b3a87e19519aa89df23e7c63e593f9d9310151c823e20eb1d804d52339946bd5c4d7fa9513d0', 12, 1, 'accessToken', '[]', 0, '2022-08-26 06:01:33', '2022-08-26 06:01:33', '2023-08-26 12:01:33'),
('93d9774c31b10c640d6bb339eb87507f61678aeff61efa2f557851c73997f5267f7674040a5934b1', 5640, 2, 'accessToken', '[]', 0, '2023-01-19 15:43:45', '2023-01-19 15:43:45', '2024-01-19 21:43:45'),
('946e442fcd7701df91bb6221ea1b0ce953334d12573b34b9e7af700588e46685bd151bee93726362', 2, 1, 'accessToken', '[]', 0, '2022-08-11 06:57:34', '2022-08-11 06:57:34', '2023-08-11 12:57:34'),
('94c79eb43aaae6b948178d9a6fa5eddadd455c0f04235ec4b841af3ac3ced5ad24c8b817cffbb80e', 19, 1, 'accessToken', '[]', 0, '2022-09-11 19:16:32', '2022-09-11 19:16:32', '2023-09-12 01:16:32'),
('95711c5afe85176107b4bd9691247cf8f639bd548cd4120b1cb1145e3eeda89c3665ce8ad07411e3', 4, 2, 'accessToken', '[]', 0, '2022-10-10 16:26:25', '2022-10-10 16:26:25', '2023-10-10 22:26:25'),
('959f370df0443d1563c199888e7bc532b753b695a14e0bc8e78b58c60d35f343b412547af582006d', 5640, 2, 'accessToken', '[]', 0, '2022-11-22 06:46:09', '2022-11-22 06:46:09', '2023-11-22 12:46:09'),
('961409449ddaf338e72aa7f8a5420c818f8fc2c395eea61649dd3a8e3a4519b97f22df33428358e3', 3, 1, 'accessToken', '[]', 0, '2022-09-20 18:17:11', '2022-09-20 18:17:11', '2023-09-21 00:17:11'),
('96499051515310ca39d87e29ce80c9841f7f0aedc958da3b95010d307d265b57f39920082ddb41c3', 2, 1, 'accessToken', '[]', 0, '2022-08-12 00:41:56', '2022-08-12 00:41:56', '2023-08-12 06:41:56'),
('969f885c4c24511a48186c0c5152b7a34c991076d60b85ed460fdacd7c593d9340722ecd1ed1b8b1', 5638, 2, 'accessToken', '[]', 0, '2022-11-12 16:03:46', '2022-11-12 16:03:46', '2023-11-12 22:03:46'),
('972cbe9a39b455624e2d8a1922c97daf664367f81330488d213ca5f23066513eb98998967cb0ca47', 4, 2, 'accessToken', '[]', 0, '2022-10-29 07:19:30', '2022-10-29 07:19:30', '2023-10-29 13:19:30'),
('9750b10950019ac3e2e60c243b6022ea6aa37a8d09b82ec4524893520a468ff99991f523449e3038', 4, 2, 'accessToken', '[]', 0, '2022-10-09 18:31:56', '2022-10-09 18:31:56', '2023-10-10 00:31:56'),
('9762ae2af91100effbf35d3cd0f420e36b85fa5ad8ddbe03c6db8b972237208373fabd0142d7006f', 5638, 2, 'accessToken', '[]', 0, '2022-10-29 16:49:39', '2022-10-29 16:49:39', '2023-10-29 22:49:39'),
('9780f3af4e436ee7e5239710c02beeeb6537168dd2dd8196ebc5800b316826d2ed617cf80ba4edbb', 20, 1, 'accessToken', '[]', 0, '2022-09-01 05:00:41', '2022-09-01 05:00:41', '2023-09-01 11:00:41'),
('97ae1f8e06568e98f17a1e95de72de545121d18930cc7590bc0e527d4c2a12c929020454d24398a2', 24, 1, 'accessToken', '[]', 0, '2022-09-03 08:03:43', '2022-09-03 08:03:43', '2023-09-03 14:03:43'),
('999dd9f6bf087bc32866fe94ea9a82f936623a2946522dc4317bf4a44d10ca570cd4eb3c1ff32695', 23, 1, 'accessToken', '[]', 0, '2022-09-01 21:23:59', '2022-09-01 21:23:59', '2023-09-02 03:23:59'),
('99b4cd50eebfbdac9e2781858c0d8e1ae677579ad4f40d5035732514eb3e5b7d1b9ab3fd73ef941b', 11114, 1, 'accessToken', '[]', 0, '2022-09-20 05:26:03', '2022-09-20 05:26:03', '2023-09-20 11:26:03'),
('99b9a31c9ac6de39b4ebf6f65c95bf3faa10cae559bb0f80f9468626e30923ffe181a497ed804f7a', 20, 1, 'accessToken', '[]', 0, '2022-08-31 20:53:16', '2022-08-31 20:53:16', '2023-09-01 02:53:16'),
('9af060d88013df3f9ebad0a5915e4ca082aac5d7066f357364130e621a580988545f520f3124e4c2', 5636, 2, 'accessToken', '[]', 0, '2022-10-24 18:02:14', '2022-10-24 18:02:14', '2023-10-25 00:02:14'),
('9cd648c9aab371644e710cb2851d71c70ac697a927b10b4b11f916307a7659577c254a690fc01b8e', 19, 1, 'accessToken', '[]', 0, '2022-08-30 19:11:55', '2022-08-30 19:11:55', '2023-08-31 01:11:55'),
('9d94a1caf10eb1d4c7c20f3ed12491ed1c61abed4f97ae9b2d9d8b18bca061d07e0c784155525e0e', 2, 1, 'accessToken', '[]', 0, '2022-08-11 08:34:36', '2022-08-11 08:34:36', '2023-08-11 14:34:36'),
('9de247374869dc6e8ee0b35a95d5f724db8218ac2edbca6d7d99b512d452f88d5a6b9a5fa179ea3c', 4, 2, 'accessToken', '[]', 0, '2022-10-13 16:16:13', '2022-10-13 16:16:13', '2023-10-13 22:16:13'),
('9e8374021afa18be45ca40bbaec79b56ee9d0bc7b0ebc5defa86c3e6064b7e992f90ba938a0c72b7', 23, 1, 'accessToken', '[]', 0, '2022-09-01 21:31:57', '2022-09-01 21:31:57', '2023-09-02 03:31:57'),
('a05d02557524cda638f988ba7b8d1efdf897ac7344bc53d81fa60430078c6ae2998e12ec2fdc6b42', 5640, 2, 'accessToken', '[]', 0, '2023-01-07 15:36:46', '2023-01-07 15:36:46', '2024-01-07 21:36:46'),
('a12e3d9d00731f63c100faf0df341c3deb23c357a247ffb04464b51b4a6b75c4c7ded765de764544', 4, 2, 'accessToken', '[]', 0, '2022-10-11 15:07:30', '2022-10-11 15:07:30', '2023-10-11 21:07:30'),
('a16fa2b85816db4826e6ce7f19adc70347973bc3d3adb21851441d3075215c8bf46c4fd11c288961', 2, 2, 'accessToken', '[]', 0, '2023-03-18 11:59:53', '2023-03-18 11:59:53', '2024-03-18 17:59:53'),
('a1956ca8818ac565bceb2369e298135105061eab7c8cf1ed644582c824f23995a40a130ad76beef2', 5640, 2, 'accessToken', '[]', 0, '2023-02-07 05:33:01', '2023-02-07 05:33:01', '2024-02-07 11:33:01'),
('a33d00ce87616431d493d4953b656e892592b04f71fabf5f529ef4b9f431b08afb88ca161860bf8f', 6, 1, 'accessToken', '[]', 0, '2022-09-29 20:00:33', '2022-09-29 20:00:33', '2023-09-30 02:00:33'),
('a3b3d8f112dd36d0410dfa877910abb66810b87fdf4642a8d90b3822fc1c0d7f38e486f4bbb6db4c', 23, 1, 'accessToken', '[]', 0, '2022-09-01 21:04:56', '2022-09-01 21:04:56', '2023-09-02 03:04:56'),
('a3e3072154796cf56020c574353c7d2bf17de625c93de5b48f8e76b37b0d6329a5facb49d40b6054', 5, 1, 'accessToken', '[]', 0, '2022-09-22 08:48:36', '2022-09-22 08:48:36', '2023-09-22 14:48:36'),
('a421f586c6585d89076adfa3eada8a50b32a8456dcb0fe52bd52acb1e500678e776271779af09e13', 5638, 2, 'accessToken', '[]', 0, '2022-10-31 05:05:36', '2022-10-31 05:05:36', '2023-10-31 11:05:36'),
('a43e24b8670f0b7c1edd04146ae540dbe97ed02b485f98d11e2395613ec2d39730d8fb62dd360b31', 12, 1, 'accessToken', '[]', 0, '2022-09-29 06:24:15', '2022-09-29 06:24:15', '2023-09-29 12:24:15'),
('a48edce825d80a53d0cb95f28d51db523e76500e774304390997a94dfce4c86feed7d19f159e9e21', 5638, 2, 'accessToken', '[]', 0, '2022-11-12 16:17:49', '2022-11-12 16:17:49', '2023-11-12 22:17:49'),
('a53d5b20a360db59b074a8b03cb01782483e51086cf8bc90fab045315af369ed7bc6167333a0314e', 5638, 2, 'accessToken', '[]', 0, '2022-11-06 18:28:20', '2022-11-06 18:28:20', '2023-11-07 00:28:20'),
('a5583a9dd49852c1a06ba0a71c89e6f31c1ecb57592111315c2b1e521151e3a82ef5bb138c6f110e', 11, 1, 'accessToken', '[]', 0, '2022-08-11 04:03:41', '2022-08-11 04:03:41', '2023-08-11 10:03:41'),
('a5ecc494a0b6104a157f74655318efe2cef50cede6dfdd3855d9f107c101b9df1f2abe89819da19d', 4, 2, 'accessToken', '[]', 0, '2022-10-14 05:41:21', '2022-10-14 05:41:21', '2023-10-14 11:41:21'),
('a66956d905181cc9175e4541c9ce4ff2c1df5f23e2c09f80d01bf176ae9ff855d787b3fce86f0de6', 6, 1, 'accessToken', '[]', 0, '2022-09-29 20:00:55', '2022-09-29 20:00:55', '2023-09-30 02:00:55'),
('a73ec14f56e1edde688e1512703e29b3e267b69c772de8099479f9d65f28cff90596abbac4e55f78', 12, 1, 'accessToken', '[]', 0, '2022-10-03 06:09:21', '2022-10-03 06:09:21', '2023-10-03 12:09:21'),
('a7c4b6559d59f2c92794c88281bc73b675f78d11fdf92601d5d918dedafb4a0b0cbdc56740f4ac76', 7, 1, 'accessToken', '[]', 0, '2022-08-13 13:46:09', '2022-08-13 13:46:09', '2023-08-13 19:46:09'),
('aa2dc046b5728da794c1b82eb81f6e181675b08d69200e54dba8c721a2fcb18c94f8aa1025045639', 19, 1, 'accessToken', '[]', 0, '2022-08-31 20:24:31', '2022-08-31 20:24:31', '2023-09-01 02:24:31'),
('aa5a594367ae6dee8321c602ebd306bc1a79835a3cd1ae1b05a2ea379f390181bc9cf651a6ae0093', 19, 1, 'accessToken', '[]', 0, '2022-09-01 21:05:19', '2022-09-01 21:05:19', '2023-09-02 03:05:19'),
('aa821e1bd30eb68ba1d7f1e50bdf635e929ce634ad68d119a264a346c466f8a038e84a739168d033', 4, 2, 'accessToken', '[]', 0, '2022-10-06 13:27:55', '2022-10-06 13:27:55', '2023-10-06 19:27:55'),
('aba5bcfc3c8c5c28a6822ed2c6cd0b2266ac4471c15e60171ea46fa2c0a9a8c2b1785a768bce3645', 5640, 2, 'accessToken', '[]', 0, '2023-01-28 09:47:28', '2023-01-28 09:47:28', '2024-01-28 15:47:28'),
('adc2ff7287fd570c88c2be954ac6aa4fe4d0fe1d9aa53660a796ac1a654d2c52e158716809d5b79e', 19, 1, 'accessToken', '[]', 0, '2022-08-30 17:46:19', '2022-08-30 17:46:19', '2023-08-30 23:46:19'),
('ae3c4f116362b40782223bb84e0097739b48ee64960b2e48402a15f240672795956523f9cbc69d52', 20, 1, 'accessToken', '[]', 0, '2022-09-11 19:16:03', '2022-09-11 19:16:03', '2023-09-12 01:16:03'),
('aefde2b28240e90efe9b339e2ae6e5ed49783ba1ba96699fdcab0c6302a0214edcb0dbb9dde05594', 6, 1, 'accessToken', '[]', 0, '2022-09-27 17:06:07', '2022-09-27 17:06:07', '2023-09-27 23:06:07'),
('af434fc168b112a27b328a9ebc16742e5937ed11f4f9debee6eca355973fc60de8998d8e35d48ad7', 11112, 1, 'accessToken', '[]', 0, '2022-09-11 19:18:45', '2022-09-11 19:18:45', '2023-09-12 01:18:45'),
('afdd8f3a8df4d9be96d4ea76242ca385558f11592dedc7f00d425006735a9b45878cb4e37c762c8c', 6, 1, 'accessToken', '[]', 0, '2022-09-26 05:51:40', '2022-09-26 05:51:40', '2023-09-26 11:51:40'),
('b0fd4715e1b7fbeb77c9649bc21356de7b356838c3fd82fb4687bff3e5775687cca5f89baa0aa5eb', 12, 1, 'accessToken', '[]', 0, '2022-08-29 10:40:30', '2022-08-29 10:40:30', '2023-08-29 16:40:30'),
('b1bd202e3ddbc26866fa28c5e86881ec40fcbcc5201cd3ad252ae2c348d874f4a03633f1385f44ca', 5638, 2, 'accessToken', '[]', 0, '2022-11-06 16:54:04', '2022-11-06 16:54:04', '2023-11-06 22:54:04'),
('b2478dd94dca17c242ba44b963e3bc1ce602c5ce7b2c81b9fed0973e211733cdd14792fe27ba95be', 7, 1, 'accessToken', '[]', 0, '2022-09-27 17:04:11', '2022-09-27 17:04:11', '2023-09-27 23:04:11'),
('b25a85086e2edd8b808ad8ff093f87092ffbf7bfd315b69d369e4bf63ac79aef88f0fdb244e2ee8d', 12, 1, 'accessToken', '[]', 0, '2022-08-29 05:50:10', '2022-08-29 05:50:10', '2023-08-29 11:50:10'),
('b27416c9987bde96ddb9d86edac2ecfd89583126a67f339a4a64a9825432b9b55f86b7c975658e63', 5641, 2, 'accessToken', '[]', 0, '2023-03-08 15:29:04', '2023-03-08 15:29:04', '2024-03-08 21:29:04');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('b4701218cf72426b92c09537911f44153c77d32d8a19fda82021c5a91fc5cb7f9856a27979e6b96d', 5640, 2, 'accessToken', '[]', 0, '2023-02-09 09:22:19', '2023-02-09 09:22:19', '2024-02-09 15:22:19'),
('b4f42126dc8ab789fd1d6d4c7750cfc001a221af1cd06717a95a735eff130c2522cd678b931b2748', 20, 1, 'accessToken', '[]', 0, '2022-09-02 04:23:17', '2022-09-02 04:23:17', '2023-09-02 10:23:17'),
('b650e841c925272dd648e5b29c6190f8521f1b2752399f36400f528d631efd914c16f40f2964970d', 7, 1, 'accessToken', '[]', 0, '2022-08-12 05:35:27', '2022-08-12 05:35:27', '2023-08-12 11:35:27'),
('b654c628c7c529df98e6028ed2eedf0b8a88d0947319f59cc1cf2e83e465a5a1c67eb65b36cb9750', 4, 2, 'accessToken', '[]', 0, '2022-10-06 14:25:33', '2022-10-06 14:25:33', '2023-10-06 20:25:33'),
('b66e97c51fe2e374e05b689d73bf80c40baf2f7f2b116f58343ee56fa76ecbc6280356adf459a5bc', 5638, 2, 'accessToken', '[]', 0, '2022-10-30 18:25:03', '2022-10-30 18:25:03', '2023-10-31 00:25:03'),
('b6af05fbcfe89d48206df464a74f14828c4a8ed8e31508fbf0658c2d3c7109767ab6956846bd237a', 5640, 2, 'accessToken', '[]', 0, '2023-02-21 15:44:41', '2023-02-21 15:44:41', '2024-02-21 21:44:41'),
('b7aed368be7975a48d469ec47e447a6d19fdea73f7f126f6e85e44fe379766f615183b5829ac39d9', 3, 2, 'accessToken', '[]', 0, '2022-10-08 10:04:34', '2022-10-08 10:04:34', '2023-10-08 16:04:34'),
('b7e521c545bd0d2f9cad98d57e63b582667fd725216fbcdd9144b8f597dc2483828bb90ced0da88b', 21, 1, 'accessToken', '[]', 0, '2022-08-31 20:04:00', '2022-08-31 20:04:00', '2023-09-01 02:04:00'),
('b90b2e3aea4e65f1b598ea517b9391b9adf831436561cc86fe60f653298d7a67acb202a8225035b1', 5640, 2, 'accessToken', '[]', 0, '2023-02-21 11:36:15', '2023-02-21 11:36:15', '2024-02-21 17:36:15'),
('b92c880374d3e7dd879733c88403e4ed4b8ed0d7705065a1149e48030a54e46b665f25d5986a074f', 4, 2, 'accessToken', '[]', 0, '2022-10-24 16:47:21', '2022-10-24 16:47:21', '2023-10-24 22:47:21'),
('b9c354548ace56e36f248483a36761ad4f7933e51c16c94c2e18e5d03a468b4c38766cc4c27b04b4', 5640, 2, 'accessToken', '[]', 0, '2023-02-09 16:00:25', '2023-02-09 16:00:25', '2024-02-09 22:00:25'),
('ba25c241fdf8b4189d0c95005a728424fd0dc166af9237c6e69b6db2ddf248579d4d9e4528b1a992', 5640, 2, 'accessToken', '[]', 0, '2023-01-17 16:29:38', '2023-01-17 16:29:38', '2024-01-17 22:29:38'),
('ba3b21f89cb98551c173719b9514f0fe4b66c9f6c6ceda504f9fa6cf03d45eb2dcb689891495d200', 1, 1, 'accessToken', '[]', 0, '2022-08-11 06:08:25', '2022-08-11 06:08:25', '2023-08-11 12:08:25'),
('ba3f0958492a5922f7bfc1bb5176a35a2f19fed1de1cd65ce55f2d96376b397f413609b152b5fbe0', 12, 1, 'accessToken', '[]', 0, '2022-10-03 13:23:32', '2022-10-03 13:23:32', '2023-10-03 19:23:32'),
('ba49169a47b9a2bb74dc28dfe678844c1d2522a0608896977674dc167878ae7212034e1a39b21e9b', 6, 1, 'accessToken', '[]', 0, '2022-09-26 18:46:59', '2022-09-26 18:46:59', '2023-09-27 00:46:59'),
('baa28b51704e02971a255159d98c3d21860d443e9a5d12432d86003a44b6cece67decaed592055e8', 5638, 2, 'accessToken', '[]', 0, '2022-10-30 16:18:57', '2022-10-30 16:18:57', '2023-10-30 22:18:57'),
('bafef1062de64bdd7fa75fa3932017a4eede8434476a58f4fc64dd94b223076afe5da96e7ed90023', 2, 2, 'accessToken', '[]', 0, '2023-03-14 08:38:32', '2023-03-14 08:38:32', '2024-03-14 14:38:32'),
('bc7d7af0e3917d03ba74df3fb573ba2c16db31570ac08cda49b9c7f7d4156d2b9782ae4aa77ece22', 5640, 2, 'accessToken', '[]', 0, '2023-01-11 05:55:33', '2023-01-11 05:55:33', '2024-01-11 11:55:33'),
('bc7fa96efecdf84bc5ee897038c2ad71cfc1f770f2470b30823d30feec8aadb31b630d6bd67a08fc', 4, 2, 'accessToken', '[]', 0, '2022-10-24 14:45:33', '2022-10-24 14:45:33', '2023-10-24 20:45:33'),
('bcfdaa5ea3770a48c7ad92183a8a6789e11bc5207c96535d86d763b7edc959d97a67084a800ef280', 19, 1, 'accessToken', '[]', 0, '2022-09-01 21:12:43', '2022-09-01 21:12:43', '2023-09-02 03:12:43'),
('bde1643bd22014e8f098c6795f46b4a90d831a94db2b97090cd1023fe9196aeacedd0de84e266498', 5638, 2, 'accessToken', '[]', 0, '2022-11-12 13:58:29', '2022-11-12 13:58:29', '2023-11-12 19:58:29'),
('bf5f5c2d5278acb666477a19dabc6846dec8340ec8a2f4c7786b42fa3efc7fbf87235da95f450227', 13, 2, 'accessToken', '[]', 0, '2022-10-03 15:27:57', '2022-10-03 15:27:57', '2023-10-03 21:27:57'),
('bf76f54aad75d3c7ea64f94eaf875f33ea4afb41b817e3b5426c176d2014a0785c0fa99d68a34f39', 11, 1, 'accessToken', '[]', 0, '2022-08-20 08:37:26', '2022-08-20 08:37:26', '2023-08-20 14:37:26'),
('c01e72809afc7555f2c2a392e59294b1a9ef990302ead7d2c66010b0d0fede0de5cd4bd5d56b705f', 4, 2, 'accessToken', '[]', 0, '2022-10-12 12:50:44', '2022-10-12 12:50:44', '2023-10-12 18:50:44'),
('c29af1896144e56e250ed50080baadaaafbede386b5c90fbcf1ef0fd877fa7564daec0a0696f7574', 13, 1, 'accessToken', '[]', 0, '2022-10-03 13:41:19', '2022-10-03 13:41:19', '2023-10-03 19:41:19'),
('c2a063fe8b8e09891ebc2ce637931ed72ee9c607e3dc26f9b01b50e6673b4b160091e55c4aebc9c9', 2, 2, 'accessToken', '[]', 0, '2023-03-14 18:58:14', '2023-03-14 18:58:14', '2024-03-15 00:58:14'),
('c3aa2c7d6c5085e3e4f2a70baf015f7c407be2fde5ccd17c37012693c2a93efd14dd745ac8d8f063', 2, 2, 'accessToken', '[]', 0, '2023-03-17 16:10:55', '2023-03-17 16:10:55', '2024-03-17 22:10:55'),
('c3be68b805befbb2bd4550e9ba4c6d12dfb9f3ce831a75b48e053a9a2fd13624b6ce78839b00a428', 5641, 2, 'accessToken', '[]', 0, '2023-03-11 18:08:06', '2023-03-11 18:08:06', '2024-03-12 00:08:06'),
('c7297f62567bf8569243bed92217d383195f6ad27cd6cc25bd928d00c8bcf42bf906c5cb67f258b8', 5638, 2, 'accessToken', '[]', 0, '2022-11-12 12:24:13', '2022-11-12 12:24:13', '2023-11-12 18:24:13'),
('c74e601ff199e993d1f3883c69c5ade8765f4e2b0be251b6e5ad85b4969a8563b2dd91ccf8df4129', 4, 2, 'accessToken', '[]', 0, '2022-10-06 14:20:34', '2022-10-06 14:20:34', '2023-10-06 20:20:34'),
('c98cc4519e15d4c4bc2beb189de09c65587cba24449b5faa459540cac8782b8da675b83a45429bab', 5640, 2, 'accessToken', '[]', 0, '2023-01-13 05:36:21', '2023-01-13 05:36:21', '2024-01-13 11:36:21'),
('c99182a9acd91a491fb366207ad3a70f8813247ac4d83b2a98ab1ffc43f8b5ad9c343bb0c91cacd4', 20, 1, 'accessToken', '[]', 0, '2022-08-30 19:45:00', '2022-08-30 19:45:00', '2023-08-31 01:45:00'),
('c9d5c88a920686923c54ef5ec221e089b5043641558d0207411b009ec016ba96a41002ef39c8ffa7', 1, 1, 'accessToken', '[]', 0, '2022-08-11 07:58:15', '2022-08-11 07:58:15', '2023-08-11 13:58:15'),
('ca1de09b42744da8c687b7637bb9ca067d2c5ea2cacbaafd91e79633e72efa360587ce2a51afdcd7', 10, 1, 'accessToken', '[]', 0, '2022-08-19 14:11:33', '2022-08-19 14:11:33', '2023-08-19 20:11:33'),
('ca1f6e75880f8478103c104e60201a535c139c12e9b87c0618edad094294977415c9dc88b5990bce', 19, 1, 'accessToken', '[]', 0, '2022-09-08 03:16:34', '2022-09-08 03:16:34', '2023-09-08 09:16:34'),
('ca39d466bcb3bafcd57b67f926ff2f2983c6f79c19073efe3faa7916676cd2a748a14ad2279710e6', 5640, 2, 'accessToken', '[]', 0, '2023-01-16 10:55:21', '2023-01-16 10:55:21', '2024-01-16 16:55:21'),
('cafd453dbe34b0aa8f6e4b49184ef82bf1064bcd3bc1c242f68fc19089d28de92c29bbaad3a3badf', 4, 2, 'accessToken', '[]', 0, '2022-10-06 15:32:18', '2022-10-06 15:32:18', '2023-10-06 21:32:18'),
('cb9c8b8155ad6a3f4b269ad10060f78427db75c004049f47b0f448cc6f90cc78788f185de488cffd', 3, 1, 'accessToken', '[]', 0, '2022-09-21 17:03:09', '2022-09-21 17:03:09', '2023-09-21 23:03:09'),
('cca1bf5be60f54572801dda12162ddf01e2b4de15c6c1948c1e7184a4b799cc3a7dd3a11c350645b', 20, 1, 'accessToken', '[]', 0, '2022-08-31 11:38:02', '2022-08-31 11:38:02', '2023-08-31 17:38:02'),
('ccec830504e39b2b0d43a953860a507fc4cbe93c1c81e0ffa0e70bc6db032b5e694daa98b0b2b876', 4, 2, 'accessToken', '[]', 0, '2022-10-06 10:23:41', '2022-10-06 10:23:41', '2023-10-06 16:23:41'),
('cd4804817ef233c4925278a6fa1ce78a57b27511fef68c2ec05446a796bbc8440a25c3b6bfe6584a', 5640, 2, 'accessToken', '[]', 0, '2023-01-28 02:56:12', '2023-01-28 02:56:12', '2024-01-28 08:56:12'),
('ce992ed18e6994ca4680e8992e06b99cf40006973fa0ca6c571290623ba793f48e12e95e77cdc7ef', 6, 1, 'accessToken', '[]', 0, '2022-09-26 18:10:53', '2022-09-26 18:10:53', '2023-09-27 00:10:53'),
('cee69042a89603da726db6c60288cc7c794267e7a95e357723fe8b0bb16cf16008a77cd05c4e0bdd', 5638, 2, 'accessToken', '[]', 0, '2022-10-29 15:40:35', '2022-10-29 15:40:35', '2023-10-29 21:40:35'),
('cf83d5565d05e452b5ec026b2efe2a1e23b8a14e54e58cd6ebdeec06ce71485e32a991e136d30731', 4, 2, 'accessToken', '[]', 0, '2022-10-12 13:04:33', '2022-10-12 13:04:33', '2023-10-12 19:04:33'),
('cfd8a4888c10fd255536528ec211c06605b0c8f970720604a2c831381877bf786fa4a22dbb42f403', 15, 1, 'accessToken', '[]', 0, '2022-08-27 10:07:24', '2022-08-27 10:07:24', '2023-08-27 16:07:24'),
('d0561824a41b6b6ccc9bc39d2ca03a0789173bd78ff435d7ebb59b0cd110194a9b4f3580aa17d4ee', 19, 1, 'accessToken', '[]', 0, '2022-09-02 09:33:04', '2022-09-02 09:33:04', '2023-09-02 15:33:04'),
('d0c81d618b2262e67d72eeeca48ca066a9c9b6f1ed21ed031e6c43a8ff506f1f6149e6468460f0af', 5640, 2, 'accessToken', '[]', 0, '2023-02-21 11:03:20', '2023-02-21 11:03:20', '2024-02-21 17:03:20'),
('d0ebe723c4d5193407dfe6326bc887690474a37f5321f1991b5a87b5a401639544fcc737de389c10', 3, 2, 'accessToken', '[]', 0, '2022-10-06 17:09:46', '2022-10-06 17:09:46', '2023-10-06 23:09:46'),
('d28796c6eee396e72cd52e6c432707213bef6d9c93b8f9158ab1e907440f8821d10dffdbb823bca3', 5640, 2, 'accessToken', '[]', 0, '2023-01-08 04:15:42', '2023-01-08 04:15:42', '2024-01-08 10:15:42'),
('d30b13fd643594c2c57b320a2f601955e8d9d487359195cacfc1ffa0c86be578ddde7b8a7db16335', 5635, 2, 'accessToken', '[]', 0, '2022-10-11 15:29:40', '2022-10-11 15:29:40', '2023-10-11 21:29:40'),
('d31933d6a2f2b6b226f67752c40648866328477852b19fda94b421679bb44af1bb86809f3a667741', 20, 1, 'accessToken', '[]', 0, '2022-09-11 19:06:20', '2022-09-11 19:06:20', '2023-09-12 01:06:20'),
('d3abb464ffe5c0eda8d81c1a2d0bbcdd39bf60b11fd32c4fd7a084e99ff79a842a61858af6d18928', 23, 1, 'accessToken', '[]', 0, '2022-09-01 21:30:05', '2022-09-01 21:30:05', '2023-09-02 03:30:05'),
('d5b1af4c50cae43fd37cce9cc6bf5a76f30218df1eff53140fe7a6dc1164744a8c6f5667e737f5a5', 5638, 2, 'accessToken', '[]', 0, '2022-11-03 06:06:14', '2022-11-03 06:06:14', '2023-11-03 12:06:14'),
('d6a189cf89b26825cabbc43512d0e0c90afc18f29ff410bf7929d23c94a30bc71bb348f3758ea95e', 4, 2, 'accessToken', '[]', 0, '2022-10-06 10:27:43', '2022-10-06 10:27:43', '2023-10-06 16:27:43'),
('d6f88aa4509769e7f2905c6c5ad49426ebda07bea06a2fea67ba3c4a34d2d9ac78e370c9c6b611fe', 3, 1, 'accessToken', '[]', 0, '2022-09-21 18:29:05', '2022-09-21 18:29:05', '2023-09-22 00:29:05'),
('d770e4a04df9f8fe6da876b581a0515e2ffe8e0adc1ab53379870435a1afee195dc427ff727eeb41', 4, 2, 'accessToken', '[]', 0, '2022-10-14 05:42:01', '2022-10-14 05:42:01', '2023-10-14 11:42:01'),
('d78dc15b7c17a4924e63e7c9410acb700b48a4b81c9cbf17c38ddcc06183b29242ccd2d50fd9251e', 2, 2, 'accessToken', '[]', 0, '2023-03-15 15:02:55', '2023-03-15 15:02:55', '2024-03-15 21:02:55'),
('d8506ad1c26711177db2ac68643df315683c422523ea4aea864d2f02ffb1bf2be5e0011d7fbd3b4c', 5638, 2, 'accessToken', '[]', 0, '2022-11-13 05:03:25', '2022-11-13 05:03:25', '2023-11-13 11:03:25'),
('d865297fbae81c1a8d64c5b9529115427ea8ddb5e59dd7a9b6889404c7eaba32f0101f656970189c', 6, 1, 'accessToken', '[]', 0, '2022-08-10 11:46:22', '2022-08-10 11:46:22', '2023-08-10 17:46:22'),
('d8e1382cc3e3f36cb324536b3981d00a547ec4865780a79b58cdf73c26fdbac45efa2c9f364f45f9', 3, 2, 'accessToken', '[]', 0, '2022-10-25 10:05:13', '2022-10-25 10:05:13', '2023-10-25 16:05:13'),
('d92aa57f7d7dd63f6b67685171533d862961eea03faefc3ba6f25a757883b988bffc0f92414183db', 3, 2, 'accessToken', '[]', 0, '2022-10-06 10:11:10', '2022-10-06 10:11:10', '2023-10-06 16:11:10'),
('d9ae67e59c70434356a3505bc12b49976799bd5ec6fdd8ac695c85ccd87ba6db5ed83712fbe11c7d', 5641, 2, 'accessToken', '[]', 0, '2023-03-08 04:48:10', '2023-03-08 04:48:10', '2024-03-08 10:48:10'),
('d9db95c3aad45c1c3080d3d87d21ac9efe53ba909507c21c52a7fb90df83f4ca5cb8b646e171f1c9', 5637, 2, 'accessToken', '[]', 0, '2023-03-01 05:24:05', '2023-03-01 05:24:05', '2024-03-01 11:24:05'),
('ddd0e2a1d35523b1d3432bd10786fe3512e503656ff2862a3f2fba3e76d215ebfcf9cff42326d756', 4, 2, 'accessToken', '[]', 0, '2022-10-17 15:58:48', '2022-10-17 15:58:48', '2023-10-17 21:58:48'),
('deaef1d5bd3585b63d7743913d8d4fb03f2bd7013e0a223548029edff01beb5f4c7645d4754c415b', 3, 2, 'accessToken', '[]', 0, '2022-10-17 16:07:42', '2022-10-17 16:07:42', '2023-10-17 22:07:42'),
('deb19fb5c2c701d77325103f83e2a3db7cc453568b829f5821ad9e582a5beea01ee7fa4e539cb5c4', 7, 1, 'accessToken', '[]', 0, '2022-08-12 01:26:37', '2022-08-12 01:26:37', '2023-08-12 07:26:37'),
('df5d05b240e65dd1eae8e54e9e89702f3724ba727b4175cb011e752a9c09f4f30e2597ebd8e2378e', 5640, 2, 'accessToken', '[]', 0, '2022-11-22 15:19:15', '2022-11-22 15:19:15', '2023-11-22 21:19:15'),
('e048cd5267d7356bc1f9e149158fc8156421727f339768780d77a9111acddcf6ebdfc0bb3a784315', 7, 1, 'accessToken', '[]', 0, '2022-08-23 09:04:35', '2022-08-23 09:04:35', '2023-08-23 15:04:35'),
('e0b3aeb683f251242088e328ad19a7f8de4de376a67862b7997c421481b412bce3407fb987381f28', 11, 1, 'accessToken', '[]', 0, '2022-08-21 06:15:24', '2022-08-21 06:15:24', '2023-08-21 12:15:24'),
('e168dc0c2e40d5e222915c605eb0e9fd7fea6f2e47672cda3c6486ac6fdac487fff25c1d2662e99d', 5, 1, 'accessToken', '[]', 0, '2022-09-22 08:44:41', '2022-09-22 08:44:41', '2023-09-22 14:44:41'),
('e21ffadcc587df17bcc879830ec11b3f5c645595e11d529fcc54c87e1e730e3ac11706a2596c4b5c', 3, 1, 'accessToken', '[]', 0, '2022-09-22 06:04:11', '2022-09-22 06:04:11', '2023-09-22 12:04:11'),
('e24159cad2bfa9c5dd4ff6e140a3a7e118cb0167269823ebf2c09b083217105784bafa5106832ddf', 4, 2, 'accessToken', '[]', 0, '2022-10-13 18:03:14', '2022-10-13 18:03:14', '2023-10-14 00:03:14'),
('e24d269651cbc7d2db1da15980bdb2976d5d1d8d56300033ace665181e491b5e8a2270f58893cdbe', 11114, 1, 'accessToken', '[]', 0, '2022-09-19 20:43:26', '2022-09-19 20:43:26', '2023-09-20 02:43:26'),
('e26fe7cb05b0f660954ae40adaf9c47c5e14688b2031ffc8bab1ac1a44024098fa045dc68a80cfee', 5641, 2, 'accessToken', '[]', 0, '2023-03-06 16:04:47', '2023-03-06 16:04:47', '2024-03-06 22:04:47'),
('e27f669b6814cb22112e15fb3ffd5a0459a715068418820da7f31e2377985766a5b9cdc295daf3b1', 1, 1, 'accessToken', '[]', 0, '2022-09-29 05:24:18', '2022-09-29 05:24:18', '2023-09-29 11:24:18'),
('e3a91f0693256c54de69434664e5c6209088feb3b0f91746f920dc2f94f08b50e6c59d03ddbba080', 5640, 2, 'accessToken', '[]', 0, '2023-01-16 16:05:55', '2023-01-16 16:05:55', '2024-01-16 22:05:55'),
('e44dce0bff0eed3bf6dbccb700a9761201d2a3952d8e08106f9262bec969aaf0bedda6aef6aace26', 24, 1, 'accessToken', '[]', 0, '2022-09-01 21:51:58', '2022-09-01 21:51:58', '2023-09-02 03:51:58'),
('e5391b878f163462f3292635c08e795b3b580f04d2e53d0403d56a632cf2027f0581d4e58f27d5cd', 10, 1, 'accessToken', '[]', 0, '2022-08-19 06:03:29', '2022-08-19 06:03:29', '2023-08-19 12:03:29'),
('e5940516e0b0cd22ec6031e9477b2792dea2b7142e2000c2168ad54e6317760e0c29cf73397a7751', 19, 1, 'accessToken', '[]', 0, '2022-08-31 19:50:28', '2022-08-31 19:50:28', '2023-09-01 01:50:28'),
('e5b7c316356783e59e26e4893aa165e6c0497642a4fed828ca0cedca204f09e733bff21fc8772fdc', 5638, 2, 'accessToken', '[]', 0, '2022-11-01 06:14:47', '2022-11-01 06:14:47', '2023-11-01 12:14:47'),
('e6c5dfa683a7474ceca04ebf1e75823153d1a779d31e616aff18fef9d3d68c10399a67236549f88d', 4, 2, 'accessToken', '[]', 0, '2023-03-15 06:08:31', '2023-03-15 06:08:31', '2024-03-15 12:08:31'),
('e6d96804db51b79a2e836348bc1d5b611e806e688088f84409ca9a9aa6ebab06cf55cc0eda5817cf', 20, 1, 'accessToken', '[]', 0, '2022-08-31 04:41:52', '2022-08-31 04:41:52', '2023-08-31 10:41:52'),
('e707fddaff7849c7ab148ade0f3caa47b5944b9331678caff7032cf0e450e088871a08866aab4201', 7, 1, 'accessToken', '[]', 0, '2022-08-21 09:10:48', '2022-08-21 09:10:48', '2023-08-21 15:10:48'),
('e8daadda92c107deee283b6b623b1b45e320b240eff398c18fe47a15400cd08179ee96dd3cf1b686', 5641, 2, 'accessToken', '[]', 0, '2023-03-14 04:25:44', '2023-03-14 04:25:44', '2024-03-14 10:25:44'),
('ec46593c00aac81250ae070bed9a4d96dd76413938dda118c0f7a989b8092c56b42c2d06d4a46790', 5638, 2, 'accessToken', '[]', 0, '2022-10-30 10:21:12', '2022-10-30 10:21:12', '2023-10-30 16:21:12'),
('ed325e149b4a1d279db8eb94f9fd7e576e57298007a3e2160ecf5cb6d9d49f9e920d0edc0deed030', 20, 1, 'accessToken', '[]', 0, '2022-09-11 19:16:58', '2022-09-11 19:16:58', '2023-09-12 01:16:58'),
('ed9d7f98bb5094b8e7706f6e1b379c2b6b3962fcfeca37dd4bca1216e1c0bdcf85aaec7fd4bdd29c', 11114, 1, 'accessToken', '[]', 0, '2022-09-20 18:08:48', '2022-09-20 18:08:48', '2023-09-21 00:08:48'),
('eeafa2c8721532316e130bdb53adebb0e3dc47ebe1f74bd272b963d6367be950e2b4eba6ecfaeafc', 11, 1, 'accessToken', '[]', 0, '2022-08-20 08:16:42', '2022-08-20 08:16:42', '2023-08-20 14:16:42'),
('ef50146ef4865e479340c7208fc229babe24436b3a139c744598870a58467eba55ceecaefea25464', 5641, 2, 'accessToken', '[]', 0, '2023-03-11 05:35:51', '2023-03-11 05:35:51', '2024-03-11 11:35:51'),
('f14e4bf004659b71cee4b5eb8b7f832aab6d8e6e6a3bbd2735bd7fad52277a76941d5a0555a3ab16', 3, 2, 'accessToken', '[]', 0, '2022-10-17 16:08:52', '2022-10-17 16:08:52', '2023-10-17 22:08:52'),
('f1be4263632e6e3679c44fa2b624e946d148d8f9cafcb2681d8360cb85164500e5079b3b7b1d608b', 3, 1, 'accessToken', '[]', 0, '2022-09-23 19:08:42', '2022-09-23 19:08:42', '2023-09-24 01:08:42'),
('f31078c4f97aea73f898bdd2af4f79c5e46fb47dbc45c1f4332b401599c2c3b16db7bbab88cb6abd', 3, 2, 'accessToken', '[]', 0, '2022-10-13 18:04:46', '2022-10-13 18:04:46', '2023-10-14 00:04:46'),
('f58cc4b3100d2d6794af3c54c9fc8edf06f1d9912f559c70c0a70d504d1302c6efbd1ec7f4230317', 12, 1, 'accessToken', '[]', 0, '2022-08-21 08:02:01', '2022-08-21 08:02:01', '2023-08-21 14:02:01'),
('f61a6b93b49d1671412a197fdd87504bc48da5f1e63d7562d98a00bf544aa24fd23ce9e00ef5380a', 20, 1, 'accessToken', '[]', 0, '2022-09-02 10:27:44', '2022-09-02 10:27:44', '2023-09-02 16:27:44'),
('f62be57c158c0276b10d7d5c7669bf860293a05f9028e774fc1060637884e62810a47d9e6b1b7d18', 16, 1, 'accessToken', '[]', 0, '2022-08-30 17:09:59', '2022-08-30 17:09:59', '2023-08-30 23:09:59'),
('f71ad82109a9a92a4a43fe145dbc51c8b094c13a25dbaddd21506ee603c0a2c733dbb8e7f4c81c39', 4, 2, 'accessToken', '[]', 0, '2022-10-17 16:08:09', '2022-10-17 16:08:09', '2023-10-17 22:08:09'),
('f802708f9e9ba88b24936ae44112416212faf8536c7dc0a95cfeb2e02d61ea47cb5e90709830fb65', 5, 1, 'accessToken', '[]', 0, '2022-09-21 17:34:26', '2022-09-21 17:34:26', '2023-09-21 23:34:26'),
('f91ce4fac48aed3dee6058255b9b57593a44476a627a7f75daad97f294a9d9a6ba24e1019f92fc52', 5640, 2, 'accessToken', '[]', 0, '2023-01-28 15:29:22', '2023-01-28 15:29:22', '2024-01-28 21:29:22'),
('f962e6cbc6695d303bfa73134f2c00302912426c0a3587b498cbfc4332b1064c17d814ca6c8d4f00', 3, 2, 'accessToken', '[]', 0, '2022-10-29 07:18:15', '2022-10-29 07:18:15', '2023-10-29 13:18:15'),
('fc0d8310bf2a75131031f20f7b0122c293863b9de09e6803b4671eed0410b35f6d09908bb4917d93', 7, 1, 'accessToken', '[]', 0, '2022-08-21 08:05:03', '2022-08-21 08:05:03', '2023-08-21 14:05:03'),
('fcdc2d19822c2acfa51079de7aa7accdea95fb368a66416409c5fb9cb767fd02e51a62ed25100f4c', 5640, 2, 'accessToken', '[]', 0, '2023-01-26 16:54:09', '2023-01-26 16:54:09', '2024-01-26 22:54:09'),
('fcddd5c0d979562f6e805bcf33c3022fdf2836b4e978113bd4ecb49006e45e87c569cf27f82ae3ca', 11, 1, 'accessToken', '[]', 0, '2022-08-20 04:48:18', '2022-08-20 04:48:18', '2023-08-20 10:48:18'),
('fdcb556c5ed4c0b4a2a162104641860d9dfeb2c918a8ae8c98c2b8556b7b7933dff0056fec475473', 5640, 2, 'accessToken', '[]', 0, '2023-02-10 14:07:30', '2023-02-10 14:07:30', '2024-02-10 20:07:30'),
('fdcfaf086ae6e028779341ee12fedc9b3eb223b869fcf7f2e24791a24304dce93b852bb30ebe55ca', 19, 1, 'accessToken', '[]', 0, '2022-09-02 04:43:18', '2022-09-02 04:43:18', '2023-09-02 10:43:18'),
('fe5635bf0a141ca8f5757a3d591ac83557f80d0efc7112e102608e6836bafa47f6528240d1f514e6', 5641, 2, 'accessToken', '[]', 0, '2023-03-11 15:50:32', '2023-03-11 15:50:32', '2024-03-11 21:50:32'),
('feeb6110e74ccc71980358480b22f876e51e43cede13f719337babe1bb4692622fe2256a2a70ac07', 5638, 2, 'accessToken', '[]', 0, '2022-11-12 12:31:47', '2022-11-12 12:31:47', '2023-11-12 18:31:47'),
('fefca4a5d3739325b7e4c21a5ca84832ed89fc38fef61ee62e9d28a6c96bac936be83c1b01fc8d00', 13, 1, 'accessToken', '[]', 0, '2022-10-03 13:40:55', '2022-10-03 13:40:55', '2023-10-03 19:40:55'),
('ffa1c3bdf93a43f1202b5cbd3f7ebf8bff98c9ed55dd4c0781f1c2b5c16588aba2fd05e61dd95623', 1, 1, 'accessToken', '[]', 0, '2022-09-27 17:03:11', '2022-09-27 17:03:11', '2023-09-27 23:03:11');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel8.2 Personal Access Client', 'zko71X0nRLlMDH5vkpTG149iW6oQ1BelDFNyXb4b', NULL, 'http://localhost', 1, 0, 0, '2022-08-07 09:26:26', '2022-08-07 09:26:26'),
(2, NULL, 'Laravel8.2 Personal Access Client', '8z8bAC370oAKMlDgGrPwTsXs4xj11EvURLygCQHk', NULL, 'http://localhost', 1, 0, 0, '2022-10-03 14:30:29', '2022-10-03 14:30:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-08-07 09:26:26', '2022-08-07 09:26:26'),
(2, 2, '2022-10-03 14:30:29', '2022-10-03 14:30:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packageId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packagePrice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packageEarn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packageDuration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `image`, `packageId`, `packagePrice`, `packageEarn`, `packageDuration`, `created_at`, `updated_at`) VALUES
(1, 'package1', 'http://localhost:8000/packages/1679034699____43090.png', 'package1', '1000', '100', '30', NULL, '2023-03-17 06:31:40'),
(2, 'package2', NULL, 'package2', '2000', '200', '60', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_buys`
--

CREATE TABLE `package_buys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `packageId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `earn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_buys`
--

INSERT INTO `package_buys` (`id`, `packageId`, `userid`, `price`, `earn`, `duration`, `startDate`, `endDate`, `status`, `created_at`, `updated_at`) VALUES
(2, '1', '2', '1000', '100', '30', '2023-03-15', '2023-04-14', 'Active', '2023-03-15 07:21:23', '2023-03-15 07:21:23'),
(3, '2', '2', '2000', '200', '60', '2023-03-17', '2023-03-17', 'Deactive', '2023-03-17 04:55:28', '2023-03-17 04:55:28'),
(4, '1', '2', '1000', '100', '30', '2023-03-17', '2023-03-17', 'Deactive', '2023-03-17 16:14:16', '2023-03-17 16:14:16'),
(5, '1', '2', '1000', '100', '30', '2023-03-17', '2023-04-16', 'Active', '2023-03-17 16:18:32', '2023-03-17 16:18:32');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalorder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comission_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `totalorder`, `comission_rate`, `start_balance`, `end_balance`, `status`, `created_at`, `updated_at`) VALUES
(1, 'VIP0', '10', '0.28', '100', '999', 'active', NULL, '2022-09-01 01:56:09'),
(2, 'VIP1', '15', '0.2', '1000', '4999', 'active', NULL, '2022-09-01 01:56:41'),
(3, 'VIP2', '20', '0.175', '5000', '19999', 'active', NULL, '2022-09-01 01:58:07'),
(5, 'VIP3', '25', '0.152', '20000', '49999', 'active', '2022-08-30 13:49:30', '2022-09-01 01:58:38'),
(6, 'VIP4', '30', '0.1333', '50000', '200000', 'active', '2022-08-30 13:50:20', '2022-09-01 02:05:28');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `roleName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refer_bonus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_count` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `a` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_regitration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_deposit` int(11) DEFAULT NULL,
  `telegroup` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telesupport1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telesupport2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telesupport3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `worktime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdrawtext` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recharagetext` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slide1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slide2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slide3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slide4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bkash` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nagad` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rocket` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `notice`, `refer_bonus`, `ref_count`, `a`, `new_regitration`, `min_deposit`, `telegroup`, `telesupport1`, `telesupport2`, `telesupport3`, `worktime`, `withdrawtext`, `recharagetext`, `slide1`, `slide2`, `slide3`, `slide4`, `bkash`, `nagad`, `rocket`, `created_at`, `updated_at`) VALUES
(1, 'সম্মানিত গ্রাহক,\nআমাদের কোম্পানি আমেরিকান\nবাংলাদেশে এজেন্টের মাধ্যমে \nআমরা ২ বছরের জন্য বাংলাদেশে\nমার্কেট পরিদর্শন করতে আসছি,\nআমাদের এখানে অর্থ বিনিয়োগ করে \nআপনারা কাজ করে উপার্জন করতে পারেন', '5', '10', '0', '200', 300, 'go', '#yt', 'dfgdfg', 'dgdfg', '10', 'প্রত্যাহার সময় সপ্তাহের সোমবার থেকে শুক্রবার সকাল১০:০০ থেকে সন্ধা ০৫:০০ টা পর্যন্ত', 'রিচার্জ সময় সপ্তাহের সকল দিন সকাল ১০:০০ থেকে রাত ১১ঃ০০ টা পর্যন্ত', 'http://localhost:8000/slider/1674879651____40707.jpeg', 'http://localhost:8000/slider/1666677271____39236.png', NULL, NULL, '[\"ff\",\"dfg\"]', '[\"3\",\"4\"]', '[\"5\",\"6\"]', NULL, '2023-03-15 15:49:33');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `orderNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_comisition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `orderNumber`, `user_id`, `blog_id`, `task_comisition`, `date`, `created_at`, `updated_at`) VALUES
(1, NULL, '2', NULL, '20.00', '2023-03-15', '2023-03-15 06:40:54', '2023-03-15 06:40:54'),
(2, NULL, '2', NULL, '30.00', '2023-03-15', '2023-03-15 06:45:01', '2023-03-15 06:45:01'),
(3, NULL, '2', NULL, '0.42', '2023-03-15', '2023-03-15 15:03:11', '2023-03-15 15:03:11'),
(4, NULL, '2', NULL, '0.42', '2023-03-15', '2023-03-15 15:03:36', '2023-03-15 15:03:36'),
(5, NULL, '2', NULL, '0.42', '2023-03-15', '2023-03-15 15:03:48', '2023-03-15 15:03:48'),
(6, NULL, '2', NULL, '0.42', '2023-03-15', '2023-03-15 15:04:13', '2023-03-15 15:04:13'),
(7, NULL, '2', NULL, '0.42', '2023-03-15', '2023-03-15 15:05:24', '2023-03-15 15:05:24'),
(8, NULL, '2', NULL, '0.43', '2023-03-15', '2023-03-15 15:05:31', '2023-03-15 15:05:31'),
(9, NULL, '2', NULL, '0.43', '2023-03-15', '2023-03-15 15:11:12', '2023-03-15 15:11:12'),
(10, NULL, '2', NULL, '0.43', '2023-03-15', '2023-03-15 15:11:37', '2023-03-15 15:11:37'),
(11, NULL, '2', NULL, '0.43', '2023-03-15', '2023-03-15 15:11:38', '2023-03-15 15:11:38'),
(12, NULL, '2', NULL, '0.43', '2023-03-15', '2023-03-15 15:11:40', '2023-03-15 15:11:40'),
(13, NULL, '2', NULL, '0.43', '2023-03-15', '2023-03-15 15:13:39', '2023-03-15 15:13:39'),
(14, NULL, '2', NULL, '0.43', '2023-03-15', '2023-03-15 15:13:40', '2023-03-15 15:13:40'),
(15, NULL, '2', '2', '0.43', '2023-03-15', '2023-03-15 15:15:01', '2023-03-15 15:15:01'),
(16, NULL, '2', NULL, '0.44', '2023-03-15', '2023-03-15 15:41:52', '2023-03-15 15:41:52'),
(17, NULL, '2', NULL, '0.44', '2023-03-15', '2023-03-15 15:49:55', '2023-03-15 15:49:55'),
(18, NULL, '2', '2', '20.00', '2023-03-17', '2023-03-17 04:29:10', '2023-03-17 04:29:10'),
(19, NULL, '2', '2', '100', '2023-03-17', '2023-03-17 05:07:56', '2023-03-17 05:07:56'),
(20, NULL, '2', '3', '200', '2023-03-17', '2023-03-17 05:07:56', '2023-03-17 05:07:56'),
(21, NULL, '2', '2', '100', '2023-03-17', '2023-03-17 06:03:01', '2023-03-17 06:03:01'),
(22, NULL, '2', '3', '200', '2023-03-17', '2023-03-17 06:03:01', '2023-03-17 06:03:01'),
(23, NULL, '2', NULL, '5', '2023-03-18', '2023-03-18 12:15:43', '2023-03-18 12:15:43');

-- --------------------------------------------------------

--
-- Table structure for table `transitions`
--

CREATE TABLE `transitions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transitions`
--

INSERT INTO `transitions` (`id`, `user_id`, `amount`, `charge`, `post_balance`, `trx_type`, `trx`, `remark`, `details`, `created_at`, `updated_at`) VALUES
(1, '2', '110', '0', '1545.00', 'increase', 'dfgyjhghj', 'refer_commisition', 'L1', '2023-03-15 06:07:04', '2023-03-15 06:07:04'),
(2, '1', '55', '0', '7217.05', 'increase', 'dfgyjhghj', 'refer_commisition', 'L2', '2023-03-15 06:07:04', '2023-03-15 06:07:04'),
(3, '1', '22', '0', '7239.05', 'increase', 'dfgyjhghj', 'refer_commisition', 'L3', '2023-03-15 06:07:04', '2023-03-15 06:07:04'),
(4, '3', '1100', '0', '4600', 'increase', 'dfgyjhghj', 'rechage', '', '2023-03-15 06:07:04', '2023-03-15 06:07:04'),
(5, '2', '5', '0', '5', 'increase', '1234', 'refer_commisition', 'r', '2023-03-15 06:08:25', '2023-03-15 06:08:25'),
(6, '4', '200', '0', '200', 'increase', 'DJGDFGLJ', 'registration_bonus', '', '2023-03-15 06:08:26', '2023-03-15 06:08:26'),
(7, '3', '110', '0', '4715.00', 'increase', 'dghhgkjhjk', 'refer_commisition', 'L1', '2023-03-15 06:09:34', '2023-03-15 06:09:34'),
(8, '2', '55', '0', '1600.00', 'increase', 'dghhgkjhjk', 'refer_commisition', 'L2', '2023-03-15 06:09:34', '2023-03-15 06:09:34'),
(9, '1', '22', '0', '7261.05', 'increase', 'dghhgkjhjk', 'refer_commisition', 'L3', '2023-03-15 06:09:34', '2023-03-15 06:09:34'),
(10, '4', '1100', '0', '1300', 'increase', 'dghhgkjhjk', 'rechage', '', '2023-03-15 06:09:34', '2023-03-15 06:09:34'),
(11, '1', '1.2', '0', '1.2', 'increase', '', 'refer_task_commisition', 'L1', '2023-03-15 06:40:54', '2023-03-15 06:40:54'),
(12, '1', '0.6', '0', '0.6', 'increase', '', 'refer_task_commisition', 'L2', '2023-03-15 06:40:54', '2023-03-15 06:40:54'),
(13, '1', '0.4', '0', '0.4', 'increase', '', 'refer_task_commisition', 'L3', '2023-03-15 06:40:54', '2023-03-15 06:40:54'),
(14, '2', '20.00', '0', '20.00', 'increase', 'nkOHcjnkwN', 'task_comisition', '', '2023-03-15 06:40:54', '2023-03-15 06:40:54'),
(15, '1', '1.8', '0', '1.8', 'increase', '', 'refer_task_commisition', 'L1', '2023-03-15 06:45:01', '2023-03-15 06:45:01'),
(16, '1', '0.9', '0', '0.9', 'increase', '', 'refer_task_commisition', 'L2', '2023-03-15 06:45:01', '2023-03-15 06:45:01'),
(17, '1', '0.6', '0', '0.6', 'increase', '', 'refer_task_commisition', 'L3', '2023-03-15 06:45:01', '2023-03-15 06:45:01'),
(18, '2', '30.00', '0', '30.00', 'increase', 'ZVgkQQohVN', 'task_comisition', '', '2023-03-15 06:45:01', '2023-03-15 06:45:01'),
(19, '2', '1000', '0', '650', 'decrease', '', 'package', 'purchase', '2023-03-15 07:21:23', '2023-03-15 07:21:23'),
(20, '2', '500', '0', '150', 'decrease', '', 'Withdraw', '', '2023-03-15 07:47:10', '2023-03-15 07:47:10'),
(21, '1', '0.0252', '0', '0.0252', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:03:11', '2023-03-15 15:03:11'),
(22, '1', '0.0126', '0', '0.0126', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:03:11', '2023-03-15 15:03:11'),
(23, '1', '0.0084', '0', '0.0084', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:03:11', '2023-03-15 15:03:11'),
(24, '2', '0.42', '0', '0.42', 'increase', 'O37hlsEiGI', 'task_comisition', '', '2023-03-15 15:03:11', '2023-03-15 15:03:11'),
(25, '1', '0.0252', '0', '0.0252', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:03:36', '2023-03-15 15:03:36'),
(26, '1', '0.0126', '0', '0.0126', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:03:36', '2023-03-15 15:03:36'),
(27, '1', '0.0084', '0', '0.0084', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:03:36', '2023-03-15 15:03:36'),
(28, '2', '0.42', '0', '0.42', 'increase', 'QC10WoxsNo', 'task_comisition', '', '2023-03-15 15:03:36', '2023-03-15 15:03:36'),
(29, '1', '0.0252', '0', '0.0252', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:03:48', '2023-03-15 15:03:48'),
(30, '1', '0.0126', '0', '0.0126', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:03:48', '2023-03-15 15:03:48'),
(31, '1', '0.0084', '0', '0.0084', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:03:48', '2023-03-15 15:03:48'),
(32, '2', '0.42', '0', '0.42', 'increase', 'edLvwe49mY', 'task_comisition', '', '2023-03-15 15:03:48', '2023-03-15 15:03:48'),
(33, '1', '0.0252', '0', '0.0252', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:04:13', '2023-03-15 15:04:13'),
(34, '1', '0.0126', '0', '0.0126', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:04:13', '2023-03-15 15:04:13'),
(35, '1', '0.0084', '0', '0.0084', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:04:13', '2023-03-15 15:04:13'),
(36, '2', '0.42', '0', '0.42', 'increase', 'dj9oFFYK6C', 'task_comisition', '', '2023-03-15 15:04:13', '2023-03-15 15:04:13'),
(37, '1', '0.0252', '0', '0.0252', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:05:24', '2023-03-15 15:05:24'),
(38, '1', '0.0126', '0', '0.0126', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:05:24', '2023-03-15 15:05:24'),
(39, '1', '0.0084', '0', '0.0084', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:05:24', '2023-03-15 15:05:24'),
(40, '2', '0.42', '0', '0.42', 'increase', 'K8aoEUqTcU', 'task_comisition', '', '2023-03-15 15:05:24', '2023-03-15 15:05:24'),
(41, '1', '0.0258', '0', '0.0258', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:05:31', '2023-03-15 15:05:31'),
(42, '1', '0.0129', '0', '0.0129', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:05:31', '2023-03-15 15:05:31'),
(43, '1', '0.0086', '0', '0.0086', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:05:31', '2023-03-15 15:05:31'),
(44, '2', '0.43', '0', '0.43', 'increase', 'Pb6knpotAL', 'task_comisition', '', '2023-03-15 15:05:31', '2023-03-15 15:05:31'),
(45, '1', '0.0258', '0', '0.0258', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:11:12', '2023-03-15 15:11:12'),
(46, '1', '0.0129', '0', '0.0129', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:11:12', '2023-03-15 15:11:12'),
(47, '1', '0.0086', '0', '0.0086', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:11:12', '2023-03-15 15:11:12'),
(48, '2', '0.43', '0', '0.43', 'increase', 'o1R7C8tF4K', 'task_comisition', '', '2023-03-15 15:11:12', '2023-03-15 15:11:12'),
(49, '1', '0.0258', '0', '0.0258', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:11:36', '2023-03-15 15:11:36'),
(50, '1', '0.0129', '0', '0.0129', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:11:36', '2023-03-15 15:11:36'),
(51, '1', '0.0086', '0', '0.0086', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:11:37', '2023-03-15 15:11:37'),
(52, '2', '0.43', '0', '0.43', 'increase', 'EyQBO0DwEw', 'task_comisition', '', '2023-03-15 15:11:37', '2023-03-15 15:11:37'),
(53, '1', '0.0258', '0', '0.0258', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:11:38', '2023-03-15 15:11:38'),
(54, '1', '0.0129', '0', '0.0129', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:11:38', '2023-03-15 15:11:38'),
(55, '1', '0.0086', '0', '0.0086', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:11:38', '2023-03-15 15:11:38'),
(56, '2', '0.43', '0', '0.43', 'increase', '9RU0PVFtMo', 'task_comisition', '', '2023-03-15 15:11:38', '2023-03-15 15:11:38'),
(57, '1', '0.0258', '0', '0.0258', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:11:40', '2023-03-15 15:11:40'),
(58, '1', '0.0129', '0', '0.0129', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:11:40', '2023-03-15 15:11:40'),
(59, '1', '0.0086', '0', '0.0086', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:11:40', '2023-03-15 15:11:40'),
(60, '2', '0.43', '0', '0.43', 'increase', 'cDz1A3L3yf', 'task_comisition', '', '2023-03-15 15:11:40', '2023-03-15 15:11:40'),
(61, '1', '0.0258', '0', '0.0258', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:13:38', '2023-03-15 15:13:38'),
(62, '1', '0.0129', '0', '0.0129', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:13:39', '2023-03-15 15:13:39'),
(63, '1', '0.0086', '0', '0.0086', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:13:39', '2023-03-15 15:13:39'),
(64, '2', '0.43', '0', '0.43', 'increase', 'vHAWBFWeT1', 'task_comisition', '', '2023-03-15 15:13:39', '2023-03-15 15:13:39'),
(65, '1', '0.0258', '0', '0.0258', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:13:40', '2023-03-15 15:13:40'),
(66, '1', '0.0129', '0', '0.0129', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:13:40', '2023-03-15 15:13:40'),
(67, '1', '0.0086', '0', '0.0086', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:13:40', '2023-03-15 15:13:40'),
(68, '2', '0.43', '0', '0.43', 'increase', 'k1J3AOzmiX', 'task_comisition', '', '2023-03-15 15:13:40', '2023-03-15 15:13:40'),
(69, '1', '0.0258', '0', '0.0258', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:15:00', '2023-03-15 15:15:00'),
(70, '1', '0.0129', '0', '0.0129', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:15:00', '2023-03-15 15:15:00'),
(71, '1', '0.0086', '0', '0.0086', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:15:00', '2023-03-15 15:15:00'),
(72, '2', '0.43', '0', '0.43', 'increase', '38MqzH7dbL', 'task_comisition', '', '2023-03-15 15:15:01', '2023-03-15 15:15:01'),
(73, '1', '0.0264', '0', '0.0264', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:41:52', '2023-03-15 15:41:52'),
(74, '1', '0.0132', '0', '0.0132', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:41:52', '2023-03-15 15:41:52'),
(75, '1', '0.0088', '0', '0.0088', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:41:52', '2023-03-15 15:41:52'),
(76, '2', '0.44', '0', '0.44', 'increase', 'HyaXfIdDu4', 'task_comisition', '', '2023-03-15 15:41:52', '2023-03-15 15:41:52'),
(77, '1', '0.0264', '0', '0.0264', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:49:55', '2023-03-15 15:49:55'),
(78, '1', '0.0132', '0', '0.0132', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:49:55', '2023-03-15 15:49:55'),
(79, '1', '0.0088', '0', '0.0088', 'increase', '', 'refer_task_commisition', '', '2023-03-15 15:49:55', '2023-03-15 15:49:55'),
(80, '2', '0.44', '0', '0.44', 'increase', 'zXY7D73J0H', 'task_comisition', '', '2023-03-15 15:49:55', '2023-03-15 15:49:55'),
(81, '1', '1.2', '0', '7268.50', 'increase', '', 'refer_task_commisition', 'L1', '2023-03-17 04:29:10', '2023-03-17 04:29:10'),
(82, '1', '0.6', '0', '7269.10', 'increase', '', 'refer_task_commisition', 'L2', '2023-03-17 04:29:10', '2023-03-17 04:29:10'),
(83, '1', '0.4', '0', '7269.50', 'increase', '', 'refer_task_commisition', 'L3', '2023-03-17 04:29:10', '2023-03-17 04:29:10'),
(84, '2', '20.00', '0', '220.00', 'increase', 'ww4X5Z27kn', 'task_comisition', '', '2023-03-17 04:29:10', '2023-03-17 04:29:10'),
(85, '2', '2000', '0', '200', 'decrease', '', 'package', 'purchase', '2023-03-17 04:55:28', '2023-03-17 04:55:28'),
(86, '1', '18', '0', '7287.50', 'increase', '', 'refer_task_commisition', 'L1', '2023-03-17 05:01:10', '2023-03-17 05:01:10'),
(87, '1', '9', '0', '7296.50', 'increase', '', 'refer_task_commisition', 'L2', '2023-03-17 05:01:10', '2023-03-17 05:01:10'),
(88, '1', '6', '0', '7302.50', 'increase', '', 'refer_task_commisition', 'L3', '2023-03-17 05:01:10', '2023-03-17 05:01:10'),
(89, '1', '18', '0', '7320.50', 'increase', '', 'refer_task_commisition', 'L1', '2023-03-17 05:03:35', '2023-03-17 05:03:35'),
(90, '1', '9', '0', '7329.50', 'increase', '', 'refer_task_commisition', 'L2', '2023-03-17 05:03:35', '2023-03-17 05:03:35'),
(91, '1', '6', '0', '7335.50', 'increase', '', 'refer_task_commisition', 'L3', '2023-03-17 05:03:35', '2023-03-17 05:03:35'),
(92, '1', '18', '0', '7353.50', 'increase', '', 'refer_task_commisition', 'L1', '2023-03-17 05:07:56', '2023-03-17 05:07:56'),
(93, '1', '9', '0', '7362.50', 'increase', '', 'refer_task_commisition', 'L2', '2023-03-17 05:07:56', '2023-03-17 05:07:56'),
(94, '1', '6', '0', '7368.50', 'increase', '', 'refer_task_commisition', 'L3', '2023-03-17 05:07:56', '2023-03-17 05:07:56'),
(95, '2', '300.00', '0', '500.00', 'increase', 'C4FwicauK8', 'task_comisition', '', '2023-03-17 05:07:56', '2023-03-17 05:07:56'),
(96, '1', '18', '0', '7386.50', 'increase', '', 'refer_task_commisition', 'L1', '2023-03-17 06:03:00', '2023-03-17 06:03:00'),
(97, '1', '9', '0', '7395.50', 'increase', '', 'refer_task_commisition', 'L2', '2023-03-17 06:03:00', '2023-03-17 06:03:00'),
(98, '1', '6', '0', '7401.50', 'increase', '', 'refer_task_commisition', 'L3', '2023-03-17 06:03:00', '2023-03-17 06:03:00'),
(99, '2', '300.00', '0', '800.00', 'increase', 'fOBOnAFU5z', 'task_comisition', '', '2023-03-17 06:03:01', '2023-03-17 06:03:01'),
(100, '1', '100', '0', '7501.50', 'increase', '', 'refer_commisition', 'L1', '2023-03-17 16:14:16', '2023-03-17 16:14:16'),
(101, '1', '50', '0', '7551.50', 'increase', '', 'refer_commisition', 'L2', '2023-03-17 16:14:16', '2023-03-17 16:14:16'),
(102, '1', '20', '0', '7571.50', 'increase', '', 'refer_commisition', 'L3', '2023-03-17 16:14:16', '2023-03-17 16:14:16'),
(103, '2', '1000', '0', '7000', 'decrease', '', 'package', 'purchase', '2023-03-17 16:14:16', '2023-03-17 16:14:16'),
(104, '1', '100', '0', '7671.50', 'increase', '', 'refer_commisition', 'L1', '2023-03-17 16:18:32', '2023-03-17 16:18:32'),
(105, '2', '1000', '0', '6000', 'decrease', '', 'package', 'purchase', '2023-03-17 16:18:32', '2023-03-17 16:18:32'),
(106, '2', '5', '0', '6005.00', 'increase', 'U2Qryg5PTH', 'Check In', '', '2023-03-18 12:15:43', '2023-03-18 12:15:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiveable` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checkin` int(11) NOT NULL DEFAULT 1,
  `task` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depsit_time` int(11) DEFAULT NULL,
  `depsit_amount` int(11) DEFAULT NULL,
  `withdraw_amount` int(11) DEFAULT NULL,
  `nidfront` int(11) DEFAULT NULL,
  `nidback` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'reporter',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdrawpass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Bank_Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Bank_account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitorId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_sessid` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `mobile`, `username`, `ref_by`, `plan_id`, `receiveable`, `checkin`, `task`, `balance`, `depsit_time`, `depsit_amount`, `withdraw_amount`, `nidfront`, `nidback`, `address`, `email`, `role`, `email_verified_at`, `password`, `withdrawpass`, `Bank_Name`, `Bank_account`, `ip`, `visitorId`, `last_sessid`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'New Customer', '01981175973', '1234', '1234', '3', NULL, 1, '10', '7671.50', NULL, NULL, NULL, NULL, NULL, NULL, '1664220157@gmail.com', 'admin', NULL, '$2y$10$ALPIw3AwWeelxkUSebSvWuyGS1OgHnnAa3nrAG2PgYA6LWX2GmMDy', '123456', NULL, NULL, '103.127.177.115', NULL, NULL, 'active', NULL, '2022-09-26 13:22:37', '2023-03-17 16:18:32'),
(2, 'New Customer', '+8801909756552', '1235', '1234', '3', '1100', 0, '95', '6005.00', NULL, NULL, NULL, NULL, NULL, NULL, '1678783108@gmail.com', 'reporter', NULL, '$2y$10$x5aHkhDXboedaGC2.wPtVel2unsIzIF6om7TlmV2AFAFwtXV2Bv0q', '123456', '1', '01909756552', '127.0.0.1', NULL, NULL, 'active', NULL, '2023-03-14 08:38:28', '2023-03-18 12:15:43'),
(3, 'New Customer', '+8801909756553', '1236', '1235', '2', NULL, 1, '10', '4715.00', NULL, NULL, NULL, NULL, NULL, NULL, '1678858584@gmail.com', 'reporter', NULL, '$2y$10$LjM1DyDqhrG.oyhxUOx3puS083GKeSBSjxfkkbCA2XsMPfSejFswm', '123456', NULL, NULL, '127.0.0.1', NULL, NULL, 'active', NULL, '2023-03-15 05:36:24', '2023-03-15 06:09:34'),
(4, 'New Customer', '01909756552', '1237', '1236', '2', NULL, 1, '10', '1300', NULL, NULL, NULL, NULL, NULL, NULL, '1678860505@gmail.com', 'reporter', NULL, '$2y$10$EWikqwU6FMep1hsyZvKKHOk1ul5i/1edsMMgyoH10Or0a.Gp7Udn.', '123456', NULL, NULL, '127.0.0.1', NULL, NULL, 'active', NULL, '2023-03-15 06:08:26', '2023-03-15 06:09:34');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `curency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `after_charge` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdraw_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recieved_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_feedback` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `user_id`, `method`, `amount`, `curency`, `rate`, `charge`, `trx`, `final_amount`, `after_charge`, `withdraw_info`, `recieved_number`, `status`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, '2', '1', 200, 'Bdt', '1', NULL, NULL, NULL, NULL, NULL, '01909756552', 'pending', NULL, '2023-03-14 19:31:49', '2023-03-14 19:31:49'),
(2, '2', '1', 500, 'Bdt', '1', NULL, NULL, NULL, NULL, NULL, '01909756552', 'pending', NULL, '2023-03-15 07:47:10', '2023-03-15 07:47:10'),
(3, '2', '1', 300, 'Bdt', '1', '45', NULL, '200', '255', NULL, '01909756552', 'pending', NULL, '2023-03-15 16:13:48', '2023-03-15 16:13:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_buys`
--
ALTER TABLE `package_buys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transitions`
--
ALTER TABLE `transitions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `package_buys`
--
ALTER TABLE `package_buys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `transitions`
--
ALTER TABLE `transitions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
