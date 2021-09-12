-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 12, 2021 at 02:39 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_minhthuan`
--

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `parent_id`, `description`, `content`, `active`, `created_at`, `updated_at`) VALUES
(25, 'Nước hoa', 0, '', '', 1, '2021-08-31 03:33:23', '2021-09-03 20:05:23'),
(27, 'Dầu gội', 0, '', '', 1, '2021-08-31 19:19:14', '2021-09-04 02:20:57'),
(28, 'Nước hoa Nam', 25, 'c', '<p>c</p>', 1, '2021-09-03 20:07:31', '2021-09-03 20:07:57'),
(29, 'Nước hoa Nữ', 25, 's', '<p>s</p>', 1, '2021-09-03 20:08:33', '2021-09-03 20:08:33'),
(30, 'Nivea', 29, 'sd', '<p>sd</p>', 1, '2021-09-03 20:09:08', '2021-09-03 20:09:15'),
(31, 'Xmen', 28, 's', '<p>s</p>', 1, '2021-09-03 21:05:54', '2021-09-03 21:05:54'),
(32, 'Sữa tắm', 0, 'c', '<p>c</p>', 1, '2021-09-04 23:37:04', '2021-09-04 23:37:04'),
(33, 'Giày dép', 0, 'd', '<p>d</p>', 1, '2021-09-04 23:44:52', '2021-09-04 23:44:52'),
(34, 'Quần áo', 0, 'd', '<p>s</p>', 1, '2021-09-04 23:45:43', '2021-09-04 23:45:43'),
(35, 'Phụ kiện', 0, 'd', '<p>s</p>', 1, '2021-09-04 23:51:45', '2021-09-04 23:51:45');

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
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(13, '2021_08_30_145002_create_menus_table', 1),
(14, '2021_09_01_025926_create_products_table', 2),
(15, '2021_09_03_062329_create_sliders_table', 3);

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
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `price_sale` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `content`, `thumb`, `menu_id`, `price`, `price_sale`, `active`, `created_at`, `updated_at`) VALUES
(19, 'Converse Star 2021', 'd', '<p>s</p>', '/storage/uploads/2021/09/05/product-09.jpg', 33, 8000, NULL, 1, '2021-09-04 23:45:26', '2021-09-04 23:45:26'),
(20, 'Herschel supply', 'a', '<p>a</p>', '/storage/uploads/2021/09/05/product-03.jpg', 34, NULL, NULL, 1, '2021-09-04 23:46:26', '2021-09-04 23:46:26'),
(21, 'Only Check Trouser', '2', '<p>3</p>', '/storage/uploads/2021/09/05/product-11.jpg', 34, 5500, NULL, 1, '2021-09-04 23:47:12', '2021-09-04 23:47:12'),
(22, 'Square Neck Back', 'd', '<p>s</p>', '/storage/uploads/2021/09/05/product-16.jpg', 34, 12000, NULL, 1, '2021-09-04 23:47:40', '2021-09-04 23:47:40'),
(29, 'Converse Star 2021', 'd', '<p>s</p>', '/storage/uploads/2021/09/05/product-09.jpg', 33, 9500, NULL, 1, '2021-09-04 23:45:26', '2021-09-04 23:45:26'),
(30, 'Converse Star 2021', 'd', '<p>s</p>', '/storage/uploads/2021/09/05/product-09.jpg', 33, 240000, NULL, 1, '2021-09-04 23:45:26', '2021-09-04 23:45:26'),
(31, 'Herschel supply', 'a', '<p>a</p>', '/storage/uploads/2021/09/05/product-03.jpg', 34, 3000, NULL, 1, '2021-09-04 23:46:26', '2021-09-04 23:46:26'),
(32, 'Only Check Trouser', '2', '<p>3</p>', '/storage/uploads/2021/09/05/product-11.jpg', 34, 2000, NULL, 1, '2021-09-04 23:47:12', '2021-09-04 23:47:12'),
(33, 'Square Neck Back', 'd', '<p>s</p>', '/storage/uploads/2021/09/05/product-16.jpg', 34, 1000000, NULL, 1, '2021-09-04 23:47:40', '2021-09-04 23:47:40'),
(34, 'Converse Star 2021', 'd', '<p>s</p>', '/storage/uploads/2021/09/05/product-09.jpg', 33, 5800, NULL, 1, '2021-09-04 23:45:26', '2021-09-04 23:45:26'),
(35, 'Converse Star 2021', 'd', '<p>s</p>', '/storage/uploads/2021/09/05/product-09.jpg', 33, 6000, NULL, 1, '2021-09-04 23:45:26', '2021-09-04 23:45:26'),
(36, 'Herschel supply', 'a', '<p>a</p>', '/storage/uploads/2021/09/05/product-03.jpg', 34, 18000, NULL, 1, '2021-09-04 23:46:26', '2021-09-04 23:46:26'),
(37, 'Only Check Trouser', '2', '<p>3</p>', '/storage/uploads/2021/09/05/product-11.jpg', 34, 55000, NULL, 1, '2021-09-04 23:47:12', '2021-09-04 23:47:12'),
(38, 'Only Check Trouser', '2', '<p>3</p>', '/storage/uploads/2021/09/05/product-11.jpg', 34, 99000, NULL, 1, '2021-09-04 23:47:12', '2021-09-04 23:47:12'),
(39, 'Square Neck Back', 'd', '<p>s</p>', '/storage/uploads/2021/09/05/product-16.jpg', 34, 100000, NULL, 1, '2021-09-04 23:47:40', '2021-09-04 23:47:40'),
(40, 'Converse Star 2021', 'd', '<p>s</p>', '/storage/uploads/2021/09/05/product-09.jpg', 33, 3000000, NULL, 1, '2021-09-04 23:45:26', '2021-09-04 23:45:26'),
(41, 'Converse Star 2021', 'd', '<p>s</p>', '/storage/uploads/2021/09/05/product-09.jpg', 33, 50000, NULL, 1, '2021-09-04 23:45:26', '2021-09-04 23:45:26'),
(42, 'Herschel supply', 'a', '<p>a</p>', '/storage/uploads/2021/09/05/product-03.jpg', 34, 48000, NULL, 1, '2021-09-04 23:46:26', '2021-09-04 23:46:26'),
(43, 'Converse Star 2021', 'd', '<p>s</p>', '/storage/uploads/2021/09/05/product-09.jpg', 33, 68000, NULL, 1, '2021-09-04 23:45:26', '2021-09-04 23:45:26'),
(44, 'Herschel supply', 'a', '<p>a</p>', '/storage/uploads/2021/09/05/product-03.jpg', 34, 22000, NULL, 1, '2021-09-04 23:46:26', '2021-09-04 23:46:26'),
(45, 'Only Check Trouser', '2', '<p>3</p>', '/storage/uploads/2021/09/05/product-11.jpg', 34, 124870, NULL, 1, '2021-09-04 23:47:12', '2021-09-04 23:47:12'),
(46, 'Square Neck Back', 'd', '<p>C&ograve;n b&acirc;y giờ&nbsp;&aacute;o thun&nbsp;được sử dụng rộng r&atilde;i tới 80% ,&nbsp;<a href=\"http://aothun247.vn/dong-phuc-ao-thun.html\">&aacute;o thun&nbsp;</a>được người gi&agrave; , thiếu ni&ecirc;n trẻ em , n&oacute;i chung tất cả mọi lứa tuổi v&agrave; th&agrave;nh phần đều sử dung . V&igrave;&nbsp;&aacute;o thun&nbsp;ng&agrave;y nay rất dễ thương , c&aacute; t&iacute;nh , được in , th&ecirc;u , vẽ , dệt l&ecirc;n những hoa văn , c&acirc;u chữ , biểu tượng , rất dĩ dỏm v&agrave; h&agrave;i hước</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"đồng phục áo thun\" src=\"https://aothun247.vn/public/uploads/images/hinh-bai-viet/trang105/ao-thun-bai-viet-1.jpg\" title=\"đồng phục áo thun\" width=\"800px\" /></p>\r\n\r\n<h2>H&igrave;nh ảnh : &Aacute;o thun&nbsp;</h2>\r\n\r\n<p>&Aacute;o thun&nbsp;kh&ocirc;ng chỉ mặc hằng ng&agrave;y m&agrave; n&oacute; c&ograve;n được c&aacute;c c&ocirc;ng ty sử dụng để mặc đồng phục hằng ng&agrave;y , hoặc d&ugrave;ng&nbsp;<a href=\"http://aothun247.vn/dong-phuc-ao-thun/ao-thun-quang-cao.html\">&aacute;o thun quảng c&aacute;o thương hiệu</a>&nbsp;,&nbsp;<a href=\"http://aothun247.vn/dong-phuc-ao-thun/ao-thun-t-shirt.html\">&aacute;o thun qu&agrave; tặng</a>&nbsp;,<a href=\"http://aothun247.vn/dong-phuc-ao-thun/ao-thun-polo.html\">&nbsp;&aacute;o thun đi du lịch</a>&nbsp;...</p>\r\n\r\n<p>Mỗi c&ocirc;ng ty, doanh nghiệp đều x&acirc;y dựng cho ri&ecirc;ng m&igrave;nh một chiến lược ph&aacute;t triển v&agrave; định vị thương hiệu kh&aacute;c nhau. V&igrave; thế, ti&ecirc;u ch&iacute; chọn trang phục v&agrave; m&agrave;u sắc cũng kh&aacute;c nhau. T&ugrave;y v&agrave;o mục đ&iacute;ch sử dụng v&agrave; t&iacute;nh năng đặc trưng của từng ng&agrave;nh nghề m&agrave; chọn m&agrave;u ph&ugrave; hợp cho&nbsp;&aacute;o thun&nbsp;đồng phục.</p>\r\n\r\n<h3>Chọn m&agrave;u theo logo:</h3>\r\n\r\n<p>Ti&ecirc;u ch&iacute; n&agrave;y phần lớn được c&aacute;c được c&aacute;c doanh nghiệp lựa chọn. Với mục đ&iacute;ch định vị v&agrave; nhận diện thương hiệu n&ecirc;n tất cả sản phẩm li&ecirc;n quan đến h&igrave;nh ảnh của c&ocirc;ng ty, doanh nghiệp đều mang sắc th&aacute;i chung của logo để dễ nhận biết v&agrave; tạo dấu ấn ri&ecirc;ng trong l&ograve;ng kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<h3>Chọn m&agrave;u c&oacute; &yacute; nghĩa:</h3>\r\n\r\n<p>Lựa chọn n&agrave;y thường ứng dụng cho c&aacute;c sự kiện m&agrave; c&ocirc;ng ty, doanh nghiệp muốn quảng b&aacute;o h&igrave;nh ảnh hay tuy&ecirc;n truyền th&ocirc;ng điệp n&agrave;o đ&oacute; đến kh&aacute;ch h&agrave;ng. T&ugrave;y v&agrave;o mục đ&iacute;ch của từng chương tr&igrave;nh, sự kiện m&agrave; chọn m&agrave;u sắc kh&aacute;c nhau cho&nbsp;&aacute;o thun&nbsp;đồng phục.</p>\r\n\r\n<h3>Chọn m&agrave;u theo &yacute; th&iacute;ch:</h3>\r\n\r\n<p>T&ugrave;y v&agrave;o cảm nhận, sở th&iacute;ch m&agrave; c&oacute; sự lựa chọn ph&ugrave; hợp cho&nbsp;&aacute;o thun&nbsp;đồng phục. Yếu tố được nhiều người quan t&acirc;m v&agrave; quyết định l&agrave; chọn m&agrave;u sắc cho&nbsp;&aacute;o thun&nbsp;sao cho dễ kết hợp với c&aacute;c loại quần &aacute;o kh&aacute;c. Một số &iacute;t chọn m&agrave;u sắc ph&ugrave; hợp với m&agrave;u da.</p>\r\n\r\n<p><img alt=\"đồng phục áo thun \" src=\"https://aothun247.vn/public/uploads/images/hinh-bai-viet/trang105/ao-thun-bai-viet-2.jpg\" title=\"đồng phục áo thun \" width=\"800px\" /></p>\r\n\r\n<p>&Aacute;o thun&nbsp;thường c&oacute; tay &aacute;o ngắn v&agrave; kh&ocirc;ng c&oacute; cổ &aacute;o. Tuy nhi&ecirc;n một số&nbsp;&aacute;o thun&nbsp;c&oacute; tay &aacute;o d&agrave;i, n&uacute;t &aacute;o, cổ &aacute;o v&agrave; c&ograve;n c&aacute; cả cổ &aacute;o tr&aacute;i tim thời trang.</p>\r\n\r\n<p>&Aacute;o thun&nbsp;thường được l&agrave;m từ chất liệu sợi cotton (một số l&agrave;m từ loại vải kh&aacute;c), những sợi cotton n&agrave;y được dệt lại v&agrave; tạo n&ecirc;n đặc t&iacute;nh mềm mại ri&ecirc;ng biệt chỉ c&oacute; ở&nbsp;&aacute;o thun. Phần lớn&nbsp;&aacute;o thun&nbsp;hiện nay được dệt với kỹ thuật mới v&agrave; kh&ocirc;ng c&oacute; đường may gh&eacute;p nối như trước. Loại &aacute;o mới n&agrave;y được may bằng khung dệt vải tr&ograve;n để l&agrave;m cho&nbsp;&aacute;o thun&nbsp;kh&ocirc;ng c&ograve;n đường nối. Ng&agrave;nh c&ocirc;ng nghiệp may&nbsp;&aacute;o thun&nbsp;hiện nay đ&atilde; ho&agrave;n to&agrave;n tự động với kỹ thuật cắt bằng lazer hoặc phun nước &aacute;p lực cao.</p>\r\n\r\n<p><a href=\"http://aothun247.vn/dong-phuc-ao-thun/ao-thun-team.html\">&Aacute;o thun thời trang</a>&nbsp;c&oacute; nhiều mẫu m&atilde; kh&aacute;c nhau cho cả nam, nữ, unisex v&agrave; ph&ugrave; hợp với nhiều độ tuổi kh&aacute;c nhau như trẻ em, thanh ni&ecirc;n, người lớn tuổi...</p>\r\n\r\n<p>&Aacute;o thun&nbsp;mặc tr&ograve;ng v&agrave;o người m&agrave; kh&ocirc;ng c&oacute; n&uacute;t &aacute;o đ&atilde; trở n&ecirc;n thịnh h&agrave;nh tại Mỹ khi n&oacute; được sản xuất bởi lực lượng hải qu&acirc;n Mỹ trong cuộc chiến tranh với T&acirc;y Ban Nha. Loại&nbsp;&aacute;o thun&nbsp;n&agrave;y c&oacute; tay &aacute;o ngắn v&agrave; cổ tr&ograve;n, may bằng vải cotton trắng được sử dụng l&agrave;m &aacute;o l&oacute;t cho lực lượng hải qu&acirc;n Mỹ m&agrave; ch&uacute;ng ta vẫn thấy ở bộ đội Việt Nam hiện nay.&nbsp;&Aacute;o thun&nbsp;đ&atilde; được sử dụng phổ biến trong đo&agrave;n thủy thủ v&agrave; l&iacute;nh thủy đ&aacute;nh bộ gi&uacute;p qu&acirc;n đội Mỹ thoải m&aacute;i trong c&aacute;i n&oacute;ng ở nhiều v&ugrave;ng nhiệt đới với đặc t&iacute;nh m&aacute;t mẻ của&nbsp;&aacute;o thun.</p>\r\n\r\n<p>Sau đ&oacute;,&nbsp;&aacute;o thun&nbsp;đ&atilde; trở th&agrave;nh loại &aacute;o được sử dụng nhiều bởi c&ocirc;ng nh&acirc;n c&ocirc;ng nghiệp lẫn n&ocirc;ng d&acirc;n.&nbsp;&Aacute;o thun&nbsp;với độ co giản cao n&ecirc;n ph&ugrave; hợp với nhiều người với nhiều k&iacute;ch thước kh&aacute;c nhau. Ngo&agrave;i ra&nbsp;&aacute;o thun&nbsp;c&ograve;n tho&aacute;ng m&aacute;t, sạch sẽ v&agrave; đặc biệt l&agrave; gi&aacute; rẻ đ&atilde; trở th&agrave;nh lựa chọn h&agrave;ng đầu cho giới trẻ ng&agrave;y nay.&nbsp;&Aacute;o thun&nbsp;tạo cảm gi&aacute;c thoải m&aacute;i khi mặc ph&ugrave; hợp với c&aacute;c hoạt động linh hoạt hằng ng&agrave;y trong nhiều điều kiện kh&aacute;c nhau, v&agrave; c&oacute; thể mặc đi l&agrave;m hoặc đi chơi.</p>', '/storage/uploads/2021/09/05/product-16.jpg', 34, 56666, 50000, 1, '2021-09-04 23:47:40', '2021-09-08 07:53:25'),
(47, 'Converse Star 2021', 'd', '<p>s</p>', '/storage/uploads/2021/09/05/product-09.jpg', 33, 98752, NULL, 1, '2021-09-04 23:45:26', '2021-09-04 23:45:26'),
(48, 'Converse Star 2021', 'd', '<p>s</p>', '/storage/uploads/2021/09/05/product-09.jpg', 33, 10000, NULL, 1, '2021-09-04 23:45:26', '2021-09-08 06:14:17');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_by` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `url`, `thumb`, `sort_by`, `active`, `created_at`, `updated_at`) VALUES
(27, 'Hà nội', 'https://steamcommunity.com/sharedfiles/filedetails/?id=1522352870&searchtext=naruto', '/storage/uploads/2021/09/05/slide-04.jpg', 1, 1, '2021-09-04 20:47:17', '2021-09-04 20:48:52'),
(28, 'Sài gòn', 'https://steamcommunity.com/sharedfiles/filedetails/?id=1522352870&searchtext=naruto', '/storage/uploads/2021/09/05/slide-06.jpg', 1, 1, '2021-09-04 20:47:29', '2021-09-04 20:47:29'),
(29, 'Đà Nẵng', 'https://steamcommunity.com/sharedfiles/filedetails/?id=2474014689&searchtext=goku', '/storage/uploads/2021/09/05/slide-03.jpg', 1, 1, '2021-09-04 20:48:25', '2021-09-04 20:48:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'thuan', 'thuan@gmail.com', NULL, '$2y$10$gPsDLykqIr4U0Ow.dpNjO.MB9./KAPEYlZ2GunoZ4yC3lJWhPm8IW', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
