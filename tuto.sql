-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 16 août 2025 à 02:40
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tuto`
--

-- --------------------------------------------------------

--
-- Structure de la table `abscences`
--

CREATE TABLE `abscences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `classe_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `time_session_id` bigint(20) UNSIGNED NOT NULL,
  `absence_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `behaviors`
--

CREATE TABLE `behaviors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `classe_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `behaviors`
--

INSERT INTO `behaviors` (`id`, `student_id`, `classe_id`, `teacher_id`, `material_id`, `group_id`, `status_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 1, 8, 1, 1, 'aaaammmm', '2025-08-13 11:27:15', '2025-08-13 11:27:15'),
(2, 1, 5, 1, 8, 1, 2, 'tharthar', '2025-08-13 11:27:33', '2025-08-13 11:27:33'),
(3, 1, 5, 1, 8, 1, 3, 'mouchakes\n', '2025-08-15 22:08:10', '2025-08-15 22:08:10');

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('school-cache-livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3', 'i:2;', 1755301973),
('school-cache-livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1755301973;', 1755301973);

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `classes`
--

INSERT INTO `classes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '12د 1', '2025-08-05 17:03:25', '2025-08-05 17:03:25'),
(2, '12د2', '2025-08-05 17:03:35', '2025-08-05 17:03:35'),
(3, '12ع1', '2025-08-05 17:03:42', '2025-08-05 17:03:42'),
(4, '12ع2', '2025-08-05 17:03:47', '2025-08-05 17:03:47'),
(5, '12ع3', '2025-08-05 17:03:56', '2025-08-05 17:03:56'),
(6, '12ع4', '2025-08-05 17:04:02', '2025-08-05 17:04:02');

-- --------------------------------------------------------

--
-- Structure de la table `classe_teacher`
--

CREATE TABLE `classe_teacher` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `classe_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `classe_teacher`
--

INSERT INTO `classe_teacher` (`id`, `teacher_id`, `classe_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-08-07 11:44:10', '2025-08-07 11:44:10'),
(2, 2, 6, '2025-08-07 11:44:29', '2025-08-07 11:44:29'),
(3, 1, 5, '2025-08-07 12:01:17', '2025-08-07 12:01:17');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `groups`
--

INSERT INTO `groups` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'أ', '2025-08-07 13:50:56', NULL),
(2, 'ب', '2025-08-07 13:50:56', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `materials`
--

CREATE TABLE `materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `oral_note` int(11) NOT NULL DEFAULT 0,
  `written_note` int(11) NOT NULL DEFAULT 0,
  `total_note` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `materials`
--

INSERT INTO `materials` (`id`, `name`, `oral_note`, `written_note`, `total_note`, `created_at`, `updated_at`) VALUES
(1, 'اللغة العربية', 10, 10, 20, '2025-08-07 11:10:15', '2025-08-07 11:10:15'),
(2, 'اللغة الإنجليزية', 10, 10, 20, '2025-08-07 11:10:37', '2025-08-07 11:10:37'),
(3, 'فرنسي', 10, 10, 20, '2025-08-07 11:10:43', '2025-08-07 11:10:43'),
(4, 'رياضيات', 10, 10, 20, '2025-08-07 11:10:52', '2025-08-07 11:10:52'),
(5, 'العلوم ( كيمياء وفيزياء )', 10, 10, 20, '2025-08-07 11:11:00', '2025-08-07 11:11:00'),
(6, 'العلوم ( احياء وجولوجيا )', 10, 10, 20, '2025-08-07 11:11:06', '2025-08-07 11:11:06'),
(7, 'الاجتماعيات/الجغرافيا والتاريخ', 10, 10, 20, '2025-08-07 11:11:15', '2025-08-07 11:11:15'),
(8, 'الاجتماعيات(فلسفة و علم نفس)', 10, 10, 20, '2025-08-07 11:11:20', '2025-08-07 11:11:20'),
(9, 'الحاسوب', 10, 10, 20, '2025-08-07 11:11:26', '2025-08-07 11:11:26'),
(10, 'التربية الموسيقية', 10, 10, 20, '2025-08-07 11:11:32', '2025-08-07 11:11:32'),
(11, 'التربية البدنية', 10, 10, 20, '2025-08-07 11:11:39', '2025-08-07 11:11:39'),
(12, 'الدراسات العمليه', 10, 10, 20, '2025-08-07 11:11:45', '2025-08-07 11:11:45'),
(13, 'المكتبات وطرق البحث', 10, 10, 20, '2025-08-07 11:11:51', '2025-08-07 11:11:51'),
(14, 'التربية الفنية', 10, 10, 20, '2025-08-07 11:11:56', '2025-08-07 11:11:56'),
(15, 'التربية الإسلامية', 10, 10, 20, '2025-08-07 11:12:06', '2025-08-07 11:12:06');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(6, '2025_08_05_174714_create_classes_table', 3),
(7, '2025_08_05_190036_create_sessions_table', 4),
(9, '2025_08_06_121053_create_popups_table', 6),
(12, '2025_08_06_130136_create_notifications_table', 7),
(13, '2025_08_07_114924_create_materials_table', 7),
(14, '2025_08_07_122413_create_classe_teacher_table', 8),
(16, '2025_08_06_102130_create_students_table', 10),
(17, '2025_08_07_133038_create_groups', 11),
(18, '2025_08_05_120251_create_teachers_table', 12),
(19, '2025_08_10_153228_create_schools_table', 13),
(21, '2025_08_10_181120_create_abscences_table', 14),
(22, '2025_08_12_113221_create_student_statuses_table', 15),
(23, '2025_08_12_114907_create_behaviors_table', 16),
(24, '2025_08_13_143732_create_notes_table', 17),
(25, '2025_08_15_181120_create_seance_table', 18);

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `written_note` int(11) NOT NULL DEFAULT 0,
  `oral_note` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `notes`
--

INSERT INTO `notes` (`id`, `student_id`, `material_id`, `teacher_id`, `written_note`, `oral_note`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 1, 2, 3, '2025-08-13 14:13:31', '2025-08-13 14:13:45'),
(2, 4, 8, 1, 9, 6, '2025-08-15 22:10:45', '2025-08-15 22:10:45');

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `popups`
--

CREATE TABLE `popups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `popups`
--

INSERT INTO `popups` (`id`, `address`, `description`, `is_active`, `image`, `created_at`, `updated_at`) VALUES
(1, 'test', 'sds', 1, '01K22H85EBGWQ5B0XMYXC455SK.gif', '2025-08-06 11:23:53', '2025-08-07 14:09:02'),
(2, 'ddddddd', 'sdsfdfs', 0, '01K22H9DX12DSZW63GX4N7KTF3.gif', '2025-08-06 12:46:35', '2025-08-07 14:09:44');

-- --------------------------------------------------------

--
-- Structure de la table `schools`
--

CREATE TABLE `schools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `seances`
--

CREATE TABLE `seances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `classe_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `time_session_id` bigint(20) UNSIGNED NOT NULL,
  `absence_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `seances`
--

INSERT INTO `seances` (`id`, `student_id`, `classe_id`, `teacher_id`, `material_id`, `time_session_id`, `absence_date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, '2025-08-15 11:31:34', '2025-08-14 11:31:34', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('dKubxjOa6mCvAzfrU8PDZCVqfq1F5ffK5kzKvAOX', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiSUp2NzV4SkRXbXh2VU9LaDVmblBqWlR2ZFpHTnBVRkRtVTRTaEI0cSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZWFjaGVyL3N0dWRlbnQtbm90ZXM/dGFibGVGaWx0ZXJzJTVCY2xhc3NlX2lkJTVEJTVCdmFsdWUlNUQ9NSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTQ6ImxvZ2luX3RlYWNoZXJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfdGVhY2hlciI7czo2MDoiJDJ5JDEyJEhIZzdWdTB4SEgubi9ZOWI4WURieS45UjRjdlFoZ0p4L0Y2cnNoYU16cHlOSldSVlY3Tmh1Ijt9', 1755098665),
('Du71ELz2RHToGOUqMcSTm4HOKPg1kag2saOvcKOc', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiQThQZWVPaXhLWFlkWDVTbVRiRHdyeXJiQTlQRDE1aFRucFpMYkRlayI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNzoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL3RlYWNoZXIvc2VhbmNlcyI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM2OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYWRtaW4vc2Vzc2lvbnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkeHNodVdJZnJtdzJ3Q1BHeXdyaE9kZWVYd202MFpVMGxUejdQbVppMlpyc0xmbGF3M2J3cGUiO30=', 1755182133),
('lGWRbbewV571fpDEHG6uAs7YJjOb6tycxcWJztar', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVXUxNVBOc1AyY3Q1N3NnNVRCYVpOSGRjZGVOeEd5dEZaWjZwMGh4WSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9zdHVkZW50cyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiR4c2h1V0lmcm13MndDUEd5d3JoT2RlZVh3bTYwWlUwbFR6N1BtWmkyWnJzTGZsYXczYndwZSI7fQ==', 1755303930),
('rx3PTu2PKTnlMAF749MGELqux84TRPG5IgL0TSKt', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiZnJUSjhHTmJnYmY3bGJZTzRlSk1iOWNOUjE0NWpIT0RzNFlNZ1IzWSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvdGVhY2hlci9zZWFuY2VzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1NDoibG9naW5fdGVhY2hlcl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMToicGFzc3dvcmRfaGFzaF90ZWFjaGVyIjtzOjYwOiIkMnkkMTIkSEhnN1Z1MHhISC5uL1k5YjhZRGJ5LjlSNGN2UWhnSngvRjZyc2hhTXpweU5KV1JWVjdOaHUiO30=', 1755174363),
('xCFAEHSbffO2VmE4ZUPwayEy7UXe43eC7VfNZA6z', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiZjVwbGoxTnY5MHBiOHR2TndyakdsOVprWE9MZzFTWmZEWDFWOFdrSyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjc3OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvdGVhY2hlci9iZWhhdmlvcnM/dGFibGVGaWx0ZXJzJTVCY2xhc3NlJTVEJTVCdmFsdWUlNUQ9NSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTQ6ImxvZ2luX3RlYWNoZXJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfdGVhY2hlciI7czo2MDoiJDJ5JDEyJEhIZzdWdTB4SEgubi9ZOWI4WURieS45UjRjdlFoZ0p4L0Y2cnNoYU16cHlOSldSVlY3Tmh1Ijt9', 1755088177);

-- --------------------------------------------------------

--
-- Structure de la table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `classe_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `health` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `students`
--

INSERT INTO `students` (`id`, `name`, `classe_id`, `group_id`, `health`, `created_at`, `updated_at`) VALUES
(1, 'فارس أحمد علي عباس', 5, 1, 'malade', '2025-08-07 12:53:17', '2025-08-07 12:53:17'),
(2, 'أحمد سالم أحمد الهزاع', 6, 1, NULL, '2025-08-07 12:58:47', '2025-08-07 12:58:47'),
(3, 'محمد عيسى ابراهيم عبدالله الفرحان', 5, 1, 'mridh', '2025-08-11 13:38:36', '2025-08-11 13:38:36'),
(4, 'مشاري صلاح مشاري العجيل', 1, 2, 'sa7 sattar', '2025-08-11 13:39:30', '2025-08-11 13:39:30');

-- --------------------------------------------------------

--
-- Structure de la table `student_statuses`
--

CREATE TABLE `student_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `student_statuses`
--

INSERT INTO `student_statuses` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'عام', '2025-08-12 10:36:01', '2025-08-12 10:36:01'),
(2, 'ثرثار', '2025-08-12 10:36:01', '2025-08-12 10:36:01'),
(3, 'مشاغب', '2025-08-12 10:36:02', '2025-08-12 10:36:02');

-- --------------------------------------------------------

--
-- Structure de la table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `fcm_token` varchar(255) DEFAULT NULL,
  `is_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `email`, `password`, `tel`, `material_id`, `fcm_token`, `is_blocked`, `created_at`, `updated_at`) VALUES
(1, 'أحمد الكندري', 'teacher1@test.com', '$2y$12$HHg7Vu0xHH.n/Y9b8YDby.9R4cvQhgJx/F6rshaMzpyNJWRVV7Nhu', '123456', 8, NULL, 0, '2025-08-10 10:44:37', '2025-08-10 10:44:37'),
(2, 'أحمد بن ناجي', 'teacher2@test.com', '$2y$12$Cnzsqvu/guMFn2aJS9P5GueBBHDz5uaU9relj75aZUbs0zrYX27MK', '789456', 3, NULL, 0, '2025-08-10 10:45:18', '2025-08-10 10:45:18');

-- --------------------------------------------------------

--
-- Structure de la table `time_sessions`
--

CREATE TABLE `time_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_time` varchar(255) NOT NULL,
  `end_time` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `time_sessions`
--

INSERT INTO `time_sessions` (`id`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, '07:55', '8:40', '2025-08-05 18:20:42', '2025-08-05 18:21:29'),
(2, '8:45', '9:30', '2025-08-05 18:21:58', '2025-08-05 18:21:58'),
(3, '09:35', '10:20', '2025-08-05 18:22:10', '2025-08-05 18:22:10');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', NULL, '$2y$12$xshuWIfrmw2wCPGywrhOdeeXwm60ZU0lTz7PmZi2ZrsLflaw3bwpe', NULL, '2025-08-04 14:51:09', '2025-08-04 14:51:09');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abscences`
--
ALTER TABLE `abscences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `abscences_student_id_foreign` (`student_id`),
  ADD KEY `abscences_classe_id_foreign` (`classe_id`),
  ADD KEY `abscences_teacher_id_foreign` (`teacher_id`),
  ADD KEY `abscences_material_id_foreign` (`material_id`),
  ADD KEY `abscences_time_session_id_foreign` (`time_session_id`);

--
-- Index pour la table `behaviors`
--
ALTER TABLE `behaviors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `behaviors_student_id_foreign` (`student_id`),
  ADD KEY `behaviors_classe_id_foreign` (`classe_id`),
  ADD KEY `behaviors_teacher_id_foreign` (`teacher_id`),
  ADD KEY `behaviors_material_id_foreign` (`material_id`),
  ADD KEY `behaviors_group_id_foreign` (`group_id`),
  ADD KEY `behaviors_status_id_foreign` (`status_id`);

--
-- Index pour la table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `classe_teacher`
--
ALTER TABLE `classe_teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classe_teacher_teacher_id_foreign` (`teacher_id`),
  ADD KEY `classe_teacher_classe_id_foreign` (`classe_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_student_id_foreign` (`student_id`),
  ADD KEY `notes_material_id_foreign` (`material_id`),
  ADD KEY `notes_teacher_id_foreign` (`teacher_id`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `popups`
--
ALTER TABLE `popups`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `schools_email_unique` (`email`);

--
-- Index pour la table `seances`
--
ALTER TABLE `seances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seances_student_id_foreign` (`student_id`),
  ADD KEY `seances_classe_id_foreign` (`classe_id`),
  ADD KEY `seances_teacher_id_foreign` (`teacher_id`),
  ADD KEY `seances_material_id_foreign` (`material_id`),
  ADD KEY `seances_time_session_id_foreign` (`time_session_id`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_classe_id_index` (`classe_id`),
  ADD KEY `students_group_id_index` (`group_id`);

--
-- Index pour la table `student_statuses`
--
ALTER TABLE `student_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teachers_material_id_index` (`material_id`);

--
-- Index pour la table `time_sessions`
--
ALTER TABLE `time_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abscences`
--
ALTER TABLE `abscences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `behaviors`
--
ALTER TABLE `behaviors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `classe_teacher`
--
ALTER TABLE `classe_teacher`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `popups`
--
ALTER TABLE `popups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `seances`
--
ALTER TABLE `seances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `student_statuses`
--
ALTER TABLE `student_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `time_sessions`
--
ALTER TABLE `time_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `abscences`
--
ALTER TABLE `abscences`
  ADD CONSTRAINT `abscences_classe_id_foreign` FOREIGN KEY (`classe_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `abscences_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `abscences_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `abscences_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `abscences_time_session_id_foreign` FOREIGN KEY (`time_session_id`) REFERENCES `time_sessions` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `behaviors`
--
ALTER TABLE `behaviors`
  ADD CONSTRAINT `behaviors_classe_id_foreign` FOREIGN KEY (`classe_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `behaviors_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `behaviors_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `behaviors_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `student_statuses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `behaviors_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `behaviors_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `classe_teacher`
--
ALTER TABLE `classe_teacher`
  ADD CONSTRAINT `classe_teacher_classe_id_foreign` FOREIGN KEY (`classe_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `classe_teacher_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notes_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notes_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `seances`
--
ALTER TABLE `seances`
  ADD CONSTRAINT `seances_classe_id_foreign` FOREIGN KEY (`classe_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seances_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seances_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seances_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seances_time_session_id_foreign` FOREIGN KEY (`time_session_id`) REFERENCES `time_sessions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
