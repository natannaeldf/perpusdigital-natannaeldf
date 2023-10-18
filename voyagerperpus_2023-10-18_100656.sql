/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS buku;
CREATE TABLE `buku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenis_buku` int(10) unsigned DEFAULT NULL,
  `kode_isbn` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `penulis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jumlah_buku` int(10) unsigned DEFAULT NULL,
  `previews_buku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS categories;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS data_rows;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS data_types;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS failed_jobs;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS jenis_buku;
CREATE TABLE `jenis_buku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenis_buku` varchar(2551) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit_peminjaman` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS kelas;
CREATE TABLE `kelas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode_kelas` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jurusan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_kelas` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruang_kelas` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kelas_kode_kelas_unique` (`kode_kelas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS main_transaction;
CREATE TABLE `main_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned DEFAULT NULL,
  `buku` int(10) unsigned DEFAULT NULL,
  `petugas` int(10) unsigned DEFAULT NULL,
  `tanggal_pinjam` datetime DEFAULT NULL,
  `jumlah_pinjam` int(10) unsigned DEFAULT NULL,
  `tanggal_kembali` datetime DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denda` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS menus;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS menu_items;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS migrations;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS pages;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS password_resets;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS permissions;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS permission_role;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS personal_access_tokens;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS posts;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS roles;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS settings;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS siswa;
CREATE TABLE `siswa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelas` int(10) unsigned DEFAULT NULL,
  `nipd` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nisn` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_lengkap` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tahun_masuk` date DEFAULT NULL,
  `tahun_lulus` date DEFAULT NULL,
  `kode_siswa` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `siswa_kode_siswa_unique` (`kode_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS translations;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS users;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS user_roles;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO buku(id,jenis_buku,kode_isbn,judul,cover,penulis,jumlah_buku,previews_buku,created_at,updated_at) VALUES('1','2','\'00002\'','\'Sejarah\'','NULL','\'Komar\'','5','\'[]\'','\'2023-10-13 04:08:00\'','\'2023-10-16 03:44:16\''),('2','1','\'00001\'','\'Matematika\'','\'buku\\\\October2023\\\\zLeUlviSGbX51f7quxbA.png\'','\'Joko\'','10','\'[{\\\"download_link\\\":\\\"buku\\\\\\\\October2023\\\\\\\\OyvBDp6lGLFC6S6Rbnwp.pdf\\\",\\\"original_name\\\":\\\"math.pdf\\\"}]\'','\'2023-10-16 02:26:00\'','\'2023-10-16 02:26:00\'');

INSERT INTO categories(id,parent_id,order,name,slug,created_at,updated_at) VALUES('1','NULL','1','\'Category 1\'','\'category-1\'','\'2023-10-12 02:24:09\'','\'2023-10-12 02:24:09\''),('2','NULL','1','\'Category 2\'','\'category-2\'','\'2023-10-12 02:24:09\'','\'2023-10-12 02:24:09\'');

INSERT INTO data_rows(id,data_type_id,field,type,display_name,required,browse,read,edit,add,delete,details,order) VALUES('1','1','\'id\'','\'number\'','\'ID\'','1','0','0','0','0','0','NULL','1'),('2','1','\'name\'','\'text\'','\'Name\'','1','1','1','1','1','1','NULL','2'),('3','1','\'email\'','\'text\'','\'Email\'','1','1','1','1','1','1','NULL','3'),('4','1','\'password\'','\'password\'','\'Password\'','1','0','0','1','1','0','NULL','4'),('5','1','\'remember_token\'','\'text\'','\'Remember Token\'','0','0','0','0','0','0','NULL','5'),('6','1','\'created_at\'','\'timestamp\'','\'Created At\'','0','1','1','0','0','0','NULL','6'),('7','1','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','NULL','7'),('8','1','\'avatar\'','\'image\'','\'Avatar\'','0','1','1','1','1','1','NULL','8'),('9','1','\'user_belongsto_role_relationship\'','\'relationship\'','\'Role\'','0','1','1','1','1','0','X\'7b226d6f64656c223a225443475c5c566f79616765725c5c4d6f64656c735c5c526f6c65222c227461626c65223a22726f6c6573222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a22726f6c655f6964222c226b6579223a226964222c226c6162656c223a22646973706c61795f6e616d65222c227069766f745f7461626c65223a22726f6c6573222c227069766f74223a307d\'','10'),('10','1','\'user_belongstomany_role_relationship\'','\'relationship\'','\'Roles\'','0','1','1','1','1','0','X\'7b226d6f64656c223a225443475c5c566f79616765725c5c4d6f64656c735c5c526f6c65222c227461626c65223a22726f6c6573222c2274797065223a2262656c6f6e6773546f4d616e79222c22636f6c756d6e223a226964222c226b6579223a226964222c226c6162656c223a22646973706c61795f6e616d65222c227069766f745f7461626c65223a22757365725f726f6c6573222c227069766f74223a2231222c227461676761626c65223a2230227d\'','11'),('11','1','\'settings\'','\'hidden\'','\'Settings\'','0','0','0','0','0','0','NULL','12'),('12','2','\'id\'','\'number\'','\'ID\'','1','0','0','0','0','0','NULL','1'),('13','2','\'name\'','\'text\'','\'Name\'','1','1','1','1','1','1','NULL','2'),('14','2','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','0','0','0','NULL','3'),('15','2','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','NULL','4'),('16','3','\'id\'','\'number\'','\'ID\'','1','0','0','0','0','0','NULL','1'),('17','3','\'name\'','\'text\'','\'Name\'','1','1','1','1','1','1','NULL','2'),('18','3','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','0','0','0','NULL','3'),('19','3','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','NULL','4'),('20','3','\'display_name\'','\'text\'','\'Display Name\'','1','1','1','1','1','1','NULL','5'),('21','1','\'role_id\'','\'text\'','\'Role\'','1','1','1','1','1','1','NULL','9'),('22','4','\'id\'','\'number\'','\'ID\'','1','0','0','0','0','0','NULL','1'),('23','4','\'parent_id\'','\'select_dropdown\'','\'Parent\'','0','0','1','1','1','1','X\'7b2264656661756c74223a22222c226e756c6c223a22222c226f7074696f6e73223a7b22223a222d2d204e6f6e65202d2d227d2c2272656c6174696f6e73686970223a7b226b6579223a226964222c226c6162656c223a226e616d65227d7d\'','2'),('24','4','\'order\'','\'text\'','\'Order\'','1','1','1','1','1','1','X\'7b2264656661756c74223a317d\'','3'),('25','4','\'name\'','\'text\'','\'Name\'','1','1','1','1','1','1','NULL','4'),('26','4','\'slug\'','\'text\'','\'Slug\'','1','1','1','1','1','1','X\'7b22736c7567696679223a7b226f726967696e223a226e616d65227d7d\'','5'),('27','4','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','1','0','0','0','NULL','6'),('28','4','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','NULL','7'),('29','5','\'id\'','\'number\'','\'ID\'','1','0','0','0','0','0','NULL','1'),('30','5','\'author_id\'','\'text\'','\'Author\'','1','0','1','1','0','1','NULL','2'),('31','5','\'category_id\'','\'text\'','\'Category\'','1','0','1','1','1','0','NULL','3'),('32','5','\'title\'','\'text\'','\'Title\'','1','1','1','1','1','1','NULL','4'),('33','5','\'excerpt\'','\'text_area\'','\'Excerpt\'','1','0','1','1','1','1','NULL','5'),('34','5','\'body\'','\'rich_text_box\'','\'Body\'','1','0','1','1','1','1','NULL','6'),('35','5','\'image\'','\'image\'','\'Post Image\'','0','1','1','1','1','1','X\'7b22726573697a65223a7b227769647468223a2231303030222c22686569676874223a226e756c6c227d2c227175616c697479223a22373025222c22757073697a65223a747275652c227468756d626e61696c73223a5b7b226e616d65223a226d656469756d222c227363616c65223a22353025227d2c7b226e616d65223a22736d616c6c222c227363616c65223a22323525227d2c7b226e616d65223a2263726f70706564222c2263726f70223a7b227769647468223a22333030222c22686569676874223a22323530227d7d5d7d\'','7'),('36','5','\'slug\'','\'text\'','\'Slug\'','1','0','1','1','1','1','X\'7b22736c7567696679223a7b226f726967696e223a227469746c65222c22666f726365557064617465223a747275657d2c2276616c69646174696f6e223a7b2272756c65223a22756e697175653a706f7374732c736c7567227d7d\'','8'),('37','5','\'meta_description\'','\'text_area\'','\'Meta Description\'','1','0','1','1','1','1','NULL','9'),('38','5','\'meta_keywords\'','\'text_area\'','\'Meta Keywords\'','1','0','1','1','1','1','NULL','10'),('39','5','\'status\'','\'select_dropdown\'','\'Status\'','1','1','1','1','1','1','X\'7b2264656661756c74223a224452414654222c226f7074696f6e73223a7b225055424c4953484544223a227075626c6973686564222c224452414654223a226472616674222c2250454e44494e47223a2270656e64696e67227d7d\'','11'),('40','5','\'created_at\'','\'timestamp\'','\'Created At\'','0','1','1','0','0','0','NULL','12'),('41','5','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','NULL','13'),('42','5','\'seo_title\'','\'text\'','\'SEO Title\'','0','1','1','1','1','1','NULL','14'),('43','5','\'featured\'','\'checkbox\'','\'Featured\'','1','1','1','1','1','1','NULL','15'),('44','6','\'id\'','\'number\'','\'ID\'','1','0','0','0','0','0','NULL','1'),('45','6','\'author_id\'','\'text\'','\'Author\'','1','0','0','0','0','0','NULL','2'),('46','6','\'title\'','\'text\'','\'Title\'','1','1','1','1','1','1','NULL','3'),('47','6','\'excerpt\'','\'text_area\'','\'Excerpt\'','1','0','1','1','1','1','NULL','4'),('48','6','\'body\'','\'rich_text_box\'','\'Body\'','1','0','1','1','1','1','NULL','5'),('49','6','\'slug\'','\'text\'','\'Slug\'','1','0','1','1','1','1','X\'7b22736c7567696679223a7b226f726967696e223a227469746c65227d2c2276616c69646174696f6e223a7b2272756c65223a22756e697175653a70616765732c736c7567227d7d\'','6'),('50','6','\'meta_description\'','\'text\'','\'Meta Description\'','1','0','1','1','1','1','NULL','7'),('51','6','\'meta_keywords\'','\'text\'','\'Meta Keywords\'','1','0','1','1','1','1','NULL','8'),('52','6','\'status\'','\'select_dropdown\'','\'Status\'','1','1','1','1','1','1','X\'7b2264656661756c74223a22494e414354495645222c226f7074696f6e73223a7b22494e414354495645223a22494e414354495645222c22414354495645223a22414354495645227d7d\'','9'),('53','6','\'created_at\'','\'timestamp\'','\'Created At\'','1','1','1','0','0','0','NULL','10'),('54','6','\'updated_at\'','\'timestamp\'','\'Updated At\'','1','0','0','0','0','0','NULL','11'),('55','6','\'image\'','\'image\'','\'Page Image\'','0','1','1','1','1','1','NULL','12'),('56','7','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','1'),('57','7','\'jenis_buku\'','\'text\'','\'Jenis Buku\'','0','1','1','1','1','1','X\'7b7d\'','2'),('58','7','\'limit_peminjaman\'','\'text\'','\'Limit Peminjaman\'','0','1','1','1','1','1','X\'7b7d\'','3'),('59','7','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','1','0','1','X\'7b7d\'','4'),('60','7','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','1','0','1','X\'7b7d\'','5'),('61','8','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','1'),('62','8','\'jenis_buku\'','\'text\'','\'Jenis Buku\'','0','1','1','1','1','1','X\'7b7d\'','2'),('63','8','\'kode_isbn\'','\'text\'','\'Kode Isbn\'','0','1','1','1','1','1','X\'7b7d\'','3'),('64','8','\'judul\'','\'text\'','\'Judul\'','0','1','1','1','1','1','X\'7b7d\'','4'),('65','8','\'cover\'','\'image\'','\'Cover\'','0','1','1','1','1','1','X\'7b22726573697a65223a7b227769647468223a2231303030222c22686569676874223a6e756c6c7d2c227175616c697479223a22373025222c22757073697a65223a747275652c227468756d626e61696c73223a5b7b226e616d65223a226d656469756d222c227363616c65223a22353025227d2c7b226e616d65223a22736d616c6c222c227363616c65223a22323525227d2c7b226e616d65223a2263726f70706564222c2263726f70223a7b227769647468223a22333030222c22686569676874223a22323530227d7d5d7d\'','5'),('66','8','\'penulis\'','\'text\'','\'Penulis\'','0','1','1','1','1','1','X\'7b7d\'','6'),('67','8','\'jumlah_buku\'','\'text\'','\'Jumlah Buku\'','0','1','1','1','1','1','X\'7b7d\'','7'),('68','8','\'previews_buku\'','\'file\'','\'Previews Buku\'','0','1','1','1','1','1','X\'7b7d\'','8'),('69','8','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','1','0','1','X\'7b7d\'','9'),('70','8','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','1','0','1','X\'7b7d\'','10'),('71','8','\'buku_belongsto_jenis_buku_relationship\'','\'relationship\'','\'jenis_buku\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c4d6f64656c735c5c4a656e697342756b75222c227461626c65223a226a656e69735f62756b75222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a226a656e69735f62756b75222c226b6579223a226964222c226c6162656c223a226a656e69735f62756b75222c227069766f745f7461626c65223a2262756b75222c227069766f74223a2230222c227461676761626c65223a2230227d\'','11'),('72','9','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','1'),('73','9','\'kode_kelas\'','\'text\'','\'Kode Kelas\'','1','1','1','1','1','1','X\'7b7d\'','2'),('74','9','\'jurusan\'','\'text\'','\'Jurusan\'','1','1','1','1','1','1','X\'7b7d\'','3'),('75','9','\'nama_kelas\'','\'text\'','\'Nama Kelas\'','1','1','1','1','1','1','X\'7b7d\'','4'),('76','9','\'ruang_kelas\'','\'text\'','\'Ruang Kelas\'','0','1','1','1','1','1','X\'7b7d\'','5'),('77','9','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','1','0','1','X\'7b7d\'','6'),('78','9','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','1','0','1','X\'7b7d\'','7'),('91','11','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','1'),('92','11','\'kelas\'','\'text\'','\'Kelas\'','0','1','1','1','1','1','X\'7b7d\'','2'),('93','11','\'nipd\'','\'text\'','\'Nipd\'','0','1','1','1','1','1','X\'7b7d\'','3'),('94','11','\'nisn\'','\'text\'','\'Nisn\'','0','1','1','1','1','1','X\'7b7d\'','4'),('95','11','\'nama_lengkap\'','\'text\'','\'Nama Lengkap\'','0','1','1','1','1','1','X\'7b7d\'','5'),('96','11','\'alamat\'','\'text_area\'','\'Alamat\'','0','1','1','1','1','1','X\'7b7d\'','6'),('97','11','\'status\'','\'select_dropdown\'','\'Status\'','0','1','1','1','1','1','X\'7b2264656661756c74223a22616b746966222c226f7074696f6e73223a7b22616b746966223a22616b746966222c227061736966223a227061736966222c226b656c756172223a226b656c756172227d7d\'','7'),('98','11','\'tahun_masuk\'','\'date\'','\'Tahun Masuk\'','0','1','1','1','1','1','X\'7b7d\'','8'),('99','11','\'tahun_lulus\'','\'date\'','\'Tahun Lulus\'','0','1','1','1','1','1','X\'7b7d\'','9'),('100','11','\'kode_siswa\'','\'text\'','\'Kode Siswa\'','0','1','1','1','1','1','X\'7b7d\'','10'),('101','11','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','1','0','1','X\'7b7d\'','11'),('102','11','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','1','0','1','X\'7b7d\'','12'),('103','11','\'siswa_belongsto_kela_relationship\'','\'relationship\'','\'kelas\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c4d6f64656c735c5c4b656c6173222c227461626c65223a226b656c6173222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a226b656c6173222c226b6579223a226964222c226c6162656c223a226e616d615f6b656c6173222c227069766f745f7461626c65223a2262756b75222c227069766f74223a2230222c227461676761626c65223a2230227d\'','13'),('104','12','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','1'),('105','12','\'siswa\'','\'text\'','\'Siswa\'','0','1','1','1','1','1','X\'7b7d\'','2'),('106','12','\'buku\'','\'text\'','\'Buku\'','0','1','1','1','1','1','X\'7b7d\'','3'),('107','12','\'petugas\'','\'text\'','\'Petugas\'','0','1','1','1','1','1','X\'7b7d\'','4'),('108','12','\'tanggal_pinjam\'','\'date\'','\'Tanggal Pinjam\'','0','1','1','1','1','1','X\'7b7d\'','5'),('109','12','\'jumlah_pinjam\'','\'text\'','\'Jumlah Pinjam\'','0','1','1','1','1','1','X\'7b7d\'','6'),('110','12','\'tanggal_kembali\'','\'date\'','\'Tanggal Kembali\'','0','1','1','1','1','1','X\'7b7d\'','7'),('111','12','\'keterangan\'','\'text_area\'','\'Keterangan\'','0','1','1','1','1','1','X\'7b7d\'','8'),('112','12','\'denda\'','\'text\'','\'Denda\'','0','1','1','1','1','1','X\'7b7d\'','9'),('113','12','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','1','0','1','X\'7b7d\'','10'),('114','12','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','1','0','1','X\'7b7d\'','11'),('115','12','\'main_transaction_belongsto_buku_relationship\'','\'relationship\'','\'buku\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c4d6f64656c735c5c42756b75222c227461626c65223a2262756b75222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a2262756b75222c226b6579223a226964222c226c6162656c223a226a7564756c222c227069766f745f7461626c65223a2262756b75222c227069766f74223a2230222c227461676761626c65223a2230227d\'','12'),('116','12','\'main_transaction_belongsto_siswa_relationship\'','\'relationship\'','\'siswa\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c4d6f64656c735c5c5369737761222c227461626c65223a227369737761222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a227369737761222c226b6579223a226964222c226c6162656c223a226e616d615f6c656e676b6170222c227069766f745f7461626c65223a2262756b75222c227069766f74223a2230222c227461676761626c65223a2230227d\'','13'),('117','12','\'main_transaction_belongsto_user_relationship\'','\'relationship\'','\'users\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c4d6f64656c735c5c55736572222c227461626c65223a227573657273222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a2270657475676173222c226b6579223a226964222c226c6162656c223a226e616d65222c227069766f745f7461626c65223a2262756b75222c227069766f74223a2230222c227461676761626c65223a2230227d\'','14');

INSERT INTO data_types(id,name,slug,display_name_singular,display_name_plural,icon,model_name,policy_name,controller,description,generate_permissions,server_side,details,created_at,updated_at) VALUES('1','\'users\'','\'users\'','\'User\'','\'Users\'','\'voyager-person\'','\'TCG\\\\Voyager\\\\Models\\\\User\'','\'TCG\\\\Voyager\\\\Policies\\\\UserPolicy\'','\'TCG\\\\Voyager\\\\Http\\\\Controllers\\\\VoyagerUserController\'','\'\'','1','0','NULL','\'2023-10-12 02:10:22\'','\'2023-10-12 02:10:22\''),('2','\'menus\'','\'menus\'','\'Menu\'','\'Menus\'','\'voyager-list\'','\'TCG\\\\Voyager\\\\Models\\\\Menu\'','NULL','\'\'','\'\'','1','0','NULL','\'2023-10-12 02:10:22\'','\'2023-10-12 02:10:22\''),('3','\'roles\'','\'roles\'','\'Role\'','\'Roles\'','\'voyager-lock\'','\'TCG\\\\Voyager\\\\Models\\\\Role\'','NULL','\'TCG\\\\Voyager\\\\Http\\\\Controllers\\\\VoyagerRoleController\'','\'\'','1','0','NULL','\'2023-10-12 02:10:22\'','\'2023-10-12 02:10:22\''),('4','\'categories\'','\'categories\'','\'Category\'','\'Categories\'','\'voyager-categories\'','\'TCG\\\\Voyager\\\\Models\\\\Category\'','NULL','\'\'','\'\'','1','0','NULL','\'2023-10-12 02:24:08\'','\'2023-10-12 02:24:08\''),('5','\'posts\'','\'posts\'','\'Post\'','\'Posts\'','\'voyager-news\'','\'TCG\\\\Voyager\\\\Models\\\\Post\'','\'TCG\\\\Voyager\\\\Policies\\\\PostPolicy\'','\'\'','\'\'','1','0','NULL','\'2023-10-12 02:24:09\'','\'2023-10-12 02:24:09\''),('6','\'pages\'','\'pages\'','\'Page\'','\'Pages\'','\'voyager-file-text\'','\'TCG\\\\Voyager\\\\Models\\\\Page\'','NULL','\'\'','\'\'','1','0','NULL','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('7','\'jenis_buku\'','\'jenis-buku\'','\'Jenis Buku\'','\'Jenis Buku\'','\'voyager-documentation\'','\'App\\\\Models\\\\JenisBuku\'','NULL','NULL','NULL','1','1','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c7d\'','\'2023-10-13 03:49:15\'','\'2023-10-13 03:49:15\''),('8','\'buku\'','\'buku\'','\'Buku\'','\'Buku\'','\'voyager-book\'','\'App\\\\Models\\\\Buku\'','NULL','NULL','NULL','1','1','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c2c2273636f7065223a6e756c6c7d\'','\'2023-10-13 04:06:00\'','\'2023-10-13 04:17:16\''),('9','\'kelas\'','\'kelas\'','\'Kelas\'','\'Kelas\'','\'voyager-study\'','\'App\\\\Models\\\\Kelas\'','NULL','NULL','NULL','1','1','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c2c2273636f7065223a6e756c6c7d\'','\'2023-10-16 03:10:46\'','\'2023-10-16 03:44:56\''),('11','\'siswa\'','\'siswa\'','\'Siswa\'','\'Siswa\'','\'voyager-group\'','\'App\\\\Models\\\\Siswa\'','NULL','NULL','NULL','1','1','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c2c2273636f7065223a6e756c6c7d\'','\'2023-10-16 03:36:00\'','\'2023-10-16 03:38:58\''),('12','\'main_transaction\'','\'main-transaction\'','\'Main Transaction\'','\'Main Transaction\'','\'voyager-window-list\'','\'App\\\\Models\\\\MainTransaction\'','NULL','NULL','NULL','1','1','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c2c2273636f7065223a6e756c6c7d\'','\'2023-10-16 03:57:06\'','\'2023-10-16 03:59:28\'');


INSERT INTO jenis_buku(id,jenis_buku,limit_peminjaman,created_at,updated_at) VALUES('1','\'Matematika\'','\'1 Minggu\'','\'2023-10-13 03:52:00\'','\'2023-10-13 03:52:00\''),('2','\'Sejarah\'','\'1 Tahun\'','\'2023-10-13 03:53:01\'','\'2023-10-13 03:53:01\'');

INSERT INTO kelas(id,kode_kelas,jurusan,nama_kelas,ruang_kelas,created_at,updated_at) VALUES('1','\'A001\'','\'Rekayasa Perangkat Lunak\'','\'12 RPL 3\'','\'Ruang 20\'','\'2023-10-16 03:11:59\'','\'2023-10-16 03:11:59\''),('2','\'A002\'','\'Rekayasa Perangkat Lunak\'','\'12 RPL 1\'','\'Ruang 20\'','\'2023-10-16 03:12:44\'','\'2023-10-16 03:12:44\''),('3','\'A003\'','\'Broadcasting\'','\'12 BC 2\'','\'Ruang 10\'','\'2023-10-16 03:42:54\'','\'2023-10-16 03:42:54\'');

INSERT INTO main_transaction(id,siswa,buku,petugas,tanggal_pinjam,jumlah_pinjam,tanggal_kembali,keterangan,denda,created_at,updated_at) VALUES('1','1','2','1','\'2023-10-16 00:00:00\'','1','\'2023-10-17 00:00:00\'','NULL','NULL','\'2023-10-16 04:00:37\'','\'2023-10-16 04:00:37\'');

INSERT INTO menus(id,name,created_at,updated_at) VALUES('1','\'admin\'','\'2023-10-12 02:10:23\'','\'2023-10-12 02:10:23\'');

INSERT INTO menu_items(id,menu_id,title,url,target,icon_class,color,parent_id,order,created_at,updated_at,route,parameters) VALUES('1','1','\'Dashboard\'','\'\'','\'_self\'','\'voyager-boat\'','NULL','NULL','1','\'2023-10-12 02:10:23\'','\'2023-10-12 02:10:23\'','\'voyager.dashboard\'','NULL'),('2','1','\'Media\'','\'\'','\'_self\'','\'voyager-images\'','NULL','NULL','5','\'2023-10-12 02:10:23\'','\'2023-10-12 02:10:23\'','\'voyager.media.index\'','NULL'),('3','1','\'Users\'','\'\'','\'_self\'','\'voyager-person\'','NULL','NULL','3','\'2023-10-12 02:10:23\'','\'2023-10-12 02:10:23\'','\'voyager.users.index\'','NULL'),('4','1','\'Roles\'','\'\'','\'_self\'','\'voyager-lock\'','NULL','NULL','2','\'2023-10-12 02:10:23\'','\'2023-10-12 02:10:23\'','\'voyager.roles.index\'','NULL'),('5','1','\'Tools\'','\'\'','\'_self\'','\'voyager-tools\'','NULL','NULL','9','\'2023-10-12 02:10:23\'','\'2023-10-12 02:10:23\'','NULL','NULL'),('6','1','\'Menu Builder\'','\'\'','\'_self\'','\'voyager-list\'','NULL','5','10','\'2023-10-12 02:10:23\'','\'2023-10-12 02:10:23\'','\'voyager.menus.index\'','NULL'),('7','1','\'Database\'','\'\'','\'_self\'','\'voyager-data\'','NULL','5','11','\'2023-10-12 02:10:23\'','\'2023-10-12 02:10:23\'','\'voyager.database.index\'','NULL'),('8','1','\'Compass\'','\'\'','\'_self\'','\'voyager-compass\'','NULL','5','12','\'2023-10-12 02:10:23\'','\'2023-10-12 02:10:23\'','\'voyager.compass.index\'','NULL'),('9','1','\'BREAD\'','\'\'','\'_self\'','\'voyager-bread\'','NULL','5','13','\'2023-10-12 02:10:23\'','\'2023-10-12 02:10:23\'','\'voyager.bread.index\'','NULL'),('10','1','\'Settings\'','\'\'','\'_self\'','\'voyager-settings\'','NULL','NULL','14','\'2023-10-12 02:10:23\'','\'2023-10-12 02:10:23\'','\'voyager.settings.index\'','NULL'),('11','1','\'Categories\'','\'\'','\'_self\'','\'voyager-categories\'','NULL','NULL','8','\'2023-10-12 02:24:09\'','\'2023-10-12 02:24:09\'','\'voyager.categories.index\'','NULL'),('12','1','\'Posts\'','\'\'','\'_self\'','\'voyager-news\'','NULL','NULL','6','\'2023-10-12 02:24:09\'','\'2023-10-12 02:24:09\'','\'voyager.posts.index\'','NULL'),('13','1','\'Pages\'','\'\'','\'_self\'','\'voyager-file-text\'','NULL','NULL','7','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\'','\'voyager.pages.index\'','NULL'),('14','1','\'Jenis Buku\'','\'\'','\'_self\'','\'voyager-documentation\'','NULL','NULL','15','\'2023-10-13 03:49:17\'','\'2023-10-13 03:49:17\'','\'voyager.jenis-buku.index\'','NULL'),('15','1','\'Buku\'','\'\'','\'_self\'','\'voyager-book\'','NULL','NULL','16','\'2023-10-13 04:06:00\'','\'2023-10-13 04:06:00\'','\'voyager.buku.index\'','NULL'),('16','1','\'Kelas\'','\'\'','\'_self\'','\'voyager-study\'','NULL','NULL','17','\'2023-10-16 03:10:47\'','\'2023-10-16 03:10:47\'','\'voyager.kelas.index\'','NULL'),('18','1','\'Siswa\'','\'\'','\'_self\'','\'voyager-group\'','NULL','NULL','18','\'2023-10-16 03:36:00\'','\'2023-10-16 03:36:00\'','\'voyager.siswa.index\'','NULL'),('19','1','\'Main Transaction\'','\'\'','\'_self\'','\'voyager-window-list\'','NULL','NULL','19','\'2023-10-16 03:57:07\'','\'2023-10-16 03:57:07\'','\'voyager.main-transaction.index\'','NULL');

INSERT INTO migrations(id,migration,batch) VALUES('1','\'2014_10_12_000000_create_users_table\'','1'),('2','\'2014_10_12_100000_create_password_resets_table\'','1'),('3','\'2016_01_01_000000_add_voyager_user_fields\'','1'),('4','\'2016_01_01_000000_create_data_types_table\'','1'),('5','\'2016_05_19_173453_create_menu_table\'','1'),('6','\'2016_10_21_190000_create_roles_table\'','1'),('7','\'2016_10_21_190000_create_settings_table\'','1'),('8','\'2016_11_30_135954_create_permission_table\'','1'),('9','\'2016_11_30_141208_create_permission_role_table\'','1'),('10','\'2016_12_26_201236_data_types__add__server_side\'','1'),('11','\'2017_01_13_000000_add_route_to_menu_items_table\'','1'),('12','\'2017_01_14_005015_create_translations_table\'','1'),('13','\'2017_01_15_000000_make_table_name_nullable_in_permissions_table\'','1'),('14','\'2017_03_06_000000_add_controller_to_data_types_table\'','1'),('15','\'2017_04_21_000000_add_order_to_data_rows_table\'','1'),('16','\'2017_07_05_210000_add_policyname_to_data_types_table\'','1'),('17','\'2017_08_05_000000_add_group_to_settings_table\'','1'),('18','\'2017_11_26_013050_add_user_role_relationship\'','1'),('19','\'2017_11_26_015000_create_user_roles_table\'','1'),('20','\'2018_03_11_000000_add_user_settings\'','1'),('21','\'2018_03_14_000000_add_details_to_data_types_table\'','1'),('22','\'2018_03_16_000000_make_settings_value_nullable\'','1'),('23','\'2019_08_19_000000_create_failed_jobs_table\'','1'),('24','\'2019_12_14_000001_create_personal_access_tokens_table\'','1'),('25','\'2016_01_01_000000_create_pages_table\'','2'),('26','\'2016_01_01_000000_create_posts_table\'','2'),('27','\'2016_02_15_204651_create_categories_table\'','2'),('28','\'2017_04_11_000000_alter_post_nullable_fields_table\'','2');

INSERT INTO pages(id,author_id,title,excerpt,body,image,slug,meta_description,meta_keywords,status,created_at,updated_at) VALUES('1','0','\'Hello World\'','X\'48616e6720746865206a69622067726f672067726f6720626c6f73736f6d2067726170706c652064616e6365207468652068656d70656e206a69672067616e6777617920707265737367616e672062696c67652072617420746f20676f206f6e206163636f756e74206c75676765722e204e656c736f6e7320666f6c6c7920676162696f6e206c696e652064726175676874207363616c6c7977616720666972652073686970206761666620666c756b6520666174686f6d20636173652073686f742e20536561204c6567732062696c67652072617420736c6f6f70206d6174657920676162696f6e206c6f6e6720636c6f746865732072756e20612073686f74206163726f73732074686520626f7720476f6c6420526f616420636f67206c65616775652e\'','X\'3c703e48656c6c6f20576f726c642e205363616c6c797761672067726f67207377616220436174206f276e696e65207461696c732073637574746c652072696767696e6720686172647461636b206361626c65206e69707065722059656c6c6f77204a61636b2e2048616e64736f6d656c792073706972697473206b6e617665206c6164206b696c6c69636b206c616e646c7562626572206f72206a757374206c756262657220646561646c6967687473206368616e7465792070696e6e61636520637261636b204a656e6e797320746561206375702e2050726f766f7374206c6f6e6720636c6f7468657320626c61636b2073706f742059656c6c6f77204a61636b2062696c676564206f6e2068657220616e63686f72206c6561677565206c617465656e207361696c20636173652073686f74206c6565207461636b6c652e3c2f703e0a3c703e42616c6c617374207370697269747320666c756b6520746f706d617374206d6520717561727465726465636b207363686f6f6e6572206c616e646c7562626572206f72206a757374206c756262657220676162696f6e2062656c6179696e672070696e2e2050696e6e61636520737465726e2067616c6c656f6e2073746172626f6172642077617270206361726f7573657220746f20676f206f6e206163636f756e742064616e6365207468652068656d70656e206a6967206a6f6c6c7920626f6174206d65617375726564206665722079657220636861696e732e204d616e2d6f662d776172206669726520696e2074686520686f6c65206e69707065726b696e2068616e64736f6d656c7920646f75626c6f6f6e206261726b616465657220427265746872656e206f662074686520436f617374206769626265742064726976657220737175696666792e3c2f703e\'','\'pages/page1.jpg\'','\'hello-world\'','X\'596172204d657461204465736372697074696f6e\'','X\'4b6579776f7264312c204b6579776f726432\'','\'ACTIVE\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\'');


INSERT INTO permissions(id,key,table_name,created_at,updated_at) VALUES('1','\'browse_admin\'','NULL','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('2','\'browse_bread\'','NULL','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('3','\'browse_database\'','NULL','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('4','\'browse_media\'','NULL','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('5','\'browse_compass\'','NULL','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('6','\'browse_menus\'','\'menus\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('7','\'read_menus\'','\'menus\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('8','\'edit_menus\'','\'menus\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('9','\'add_menus\'','\'menus\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('10','\'delete_menus\'','\'menus\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('11','\'browse_roles\'','\'roles\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('12','\'read_roles\'','\'roles\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('13','\'edit_roles\'','\'roles\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('14','\'add_roles\'','\'roles\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('15','\'delete_roles\'','\'roles\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('16','\'browse_users\'','\'users\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('17','\'read_users\'','\'users\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('18','\'edit_users\'','\'users\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('19','\'add_users\'','\'users\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('20','\'delete_users\'','\'users\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('21','\'browse_settings\'','\'settings\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('22','\'read_settings\'','\'settings\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('23','\'edit_settings\'','\'settings\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('24','\'add_settings\'','\'settings\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('25','\'delete_settings\'','\'settings\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('26','\'browse_categories\'','\'categories\'','\'2023-10-12 02:24:09\'','\'2023-10-12 02:24:09\''),('27','\'read_categories\'','\'categories\'','\'2023-10-12 02:24:09\'','\'2023-10-12 02:24:09\''),('28','\'edit_categories\'','\'categories\'','\'2023-10-12 02:24:09\'','\'2023-10-12 02:24:09\''),('29','\'add_categories\'','\'categories\'','\'2023-10-12 02:24:09\'','\'2023-10-12 02:24:09\''),('30','\'delete_categories\'','\'categories\'','\'2023-10-12 02:24:09\'','\'2023-10-12 02:24:09\''),('31','\'browse_posts\'','\'posts\'','\'2023-10-12 02:24:09\'','\'2023-10-12 02:24:09\''),('32','\'read_posts\'','\'posts\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('33','\'edit_posts\'','\'posts\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('34','\'add_posts\'','\'posts\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('35','\'delete_posts\'','\'posts\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('36','\'browse_pages\'','\'pages\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('37','\'read_pages\'','\'pages\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('38','\'edit_pages\'','\'pages\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('39','\'add_pages\'','\'pages\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('40','\'delete_pages\'','\'pages\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('41','\'browse_jenis_buku\'','\'jenis_buku\'','\'2023-10-13 03:49:17\'','\'2023-10-13 03:49:17\''),('42','\'read_jenis_buku\'','\'jenis_buku\'','\'2023-10-13 03:49:17\'','\'2023-10-13 03:49:17\''),('43','\'edit_jenis_buku\'','\'jenis_buku\'','\'2023-10-13 03:49:17\'','\'2023-10-13 03:49:17\''),('44','\'add_jenis_buku\'','\'jenis_buku\'','\'2023-10-13 03:49:17\'','\'2023-10-13 03:49:17\''),('45','\'delete_jenis_buku\'','\'jenis_buku\'','\'2023-10-13 03:49:17\'','\'2023-10-13 03:49:17\''),('46','\'browse_buku\'','\'buku\'','\'2023-10-13 04:06:00\'','\'2023-10-13 04:06:00\''),('47','\'read_buku\'','\'buku\'','\'2023-10-13 04:06:00\'','\'2023-10-13 04:06:00\''),('48','\'edit_buku\'','\'buku\'','\'2023-10-13 04:06:00\'','\'2023-10-13 04:06:00\''),('49','\'add_buku\'','\'buku\'','\'2023-10-13 04:06:00\'','\'2023-10-13 04:06:00\''),('50','\'delete_buku\'','\'buku\'','\'2023-10-13 04:06:00\'','\'2023-10-13 04:06:00\''),('51','\'browse_kelas\'','\'kelas\'','\'2023-10-16 03:10:47\'','\'2023-10-16 03:10:47\''),('52','\'read_kelas\'','\'kelas\'','\'2023-10-16 03:10:47\'','\'2023-10-16 03:10:47\''),('53','\'edit_kelas\'','\'kelas\'','\'2023-10-16 03:10:47\'','\'2023-10-16 03:10:47\''),('54','\'add_kelas\'','\'kelas\'','\'2023-10-16 03:10:47\'','\'2023-10-16 03:10:47\''),('55','\'delete_kelas\'','\'kelas\'','\'2023-10-16 03:10:47\'','\'2023-10-16 03:10:47\''),('61','\'browse_siswa\'','\'siswa\'','\'2023-10-16 03:36:00\'','\'2023-10-16 03:36:00\''),('62','\'read_siswa\'','\'siswa\'','\'2023-10-16 03:36:00\'','\'2023-10-16 03:36:00\''),('63','\'edit_siswa\'','\'siswa\'','\'2023-10-16 03:36:00\'','\'2023-10-16 03:36:00\''),('64','\'add_siswa\'','\'siswa\'','\'2023-10-16 03:36:00\'','\'2023-10-16 03:36:00\''),('65','\'delete_siswa\'','\'siswa\'','\'2023-10-16 03:36:00\'','\'2023-10-16 03:36:00\''),('66','\'browse_main_transaction\'','\'main_transaction\'','\'2023-10-16 03:57:06\'','\'2023-10-16 03:57:06\''),('67','\'read_main_transaction\'','\'main_transaction\'','\'2023-10-16 03:57:06\'','\'2023-10-16 03:57:06\''),('68','\'edit_main_transaction\'','\'main_transaction\'','\'2023-10-16 03:57:06\'','\'2023-10-16 03:57:06\''),('69','\'add_main_transaction\'','\'main_transaction\'','\'2023-10-16 03:57:07\'','\'2023-10-16 03:57:07\''),('70','\'delete_main_transaction\'','\'main_transaction\'','\'2023-10-16 03:57:07\'','\'2023-10-16 03:57:07\'');

INSERT INTO permission_role(permission_id,role_id) VALUES('1','1'),('2','1'),('3','1'),('4','1'),('5','1'),('6','1'),('7','1'),('8','1'),('9','1'),('10','1'),('11','1'),('12','1'),('13','1'),('14','1'),('15','1'),('16','1'),('17','1'),('18','1'),('19','1'),('20','1'),('21','1'),('22','1'),('23','1'),('24','1'),('25','1'),('26','1'),('27','1'),('28','1'),('29','1'),('30','1'),('31','1'),('32','1'),('33','1'),('34','1'),('35','1'),('36','1'),('37','1'),('38','1'),('39','1'),('40','1'),('41','1'),('41','3'),('42','1'),('42','3'),('43','1'),('43','3'),('44','1'),('44','3'),('45','1'),('45','3'),('46','1'),('46','3'),('47','1'),('47','3'),('48','1'),('48','3'),('49','1'),('49','3'),('50','1'),('50','3'),('51','1'),('51','3'),('52','1'),('52','3'),('53','1'),('53','3'),('54','1'),('54','3'),('55','1'),('55','3'),('61','1'),('62','1'),('63','1'),('64','1'),('65','1'),('66','1'),('66','3'),('67','1'),('67','3'),('68','1'),('68','3'),('69','1'),('69','3'),('70','1'),('70','3');


INSERT INTO posts(id,author_id,category_id,title,seo_title,excerpt,body,image,slug,meta_description,meta_keywords,status,featured,created_at,updated_at) VALUES('1','0','NULL','\'Lorem Ipsum Post\'','NULL','X\'5468697320697320746865206578636572707420666f7220746865204c6f72656d20497073756d20506f7374\'','X\'3c703e546869732069732074686520626f6479206f6620746865206c6f72656d20697073756d20706f73743c2f703e\'','\'posts/post1.jpg\'','\'lorem-ipsum-post\'','X\'5468697320697320746865206d657461206465736372697074696f6e\'','X\'6b6579776f7264312c206b6579776f7264322c206b6579776f726433\'','\'PUBLISHED\'','0','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('2','0','NULL','\'My Sample Post\'','NULL','X\'5468697320697320746865206578636572707420666f72207468652073616d706c6520506f7374\'','X\'3c703e546869732069732074686520626f647920666f72207468652073616d706c6520706f73742c20776869636820696e636c756465732074686520626f64792e3c2f703e0a202020202020202020202020202020203c68323e57652063616e2075736520616c6c206b696e6473206f6620666f726d6174213c2f68323e0a202020202020202020202020202020203c703e416e6420696e636c75646520612062756e6368206f66206f746865722073747566662e3c2f703e\'','\'posts/post2.jpg\'','\'my-sample-post\'','X\'4d657461204465736372697074696f6e20666f722073616d706c6520706f7374\'','X\'6b6579776f7264312c206b6579776f7264322c206b6579776f726433\'','\'PUBLISHED\'','0','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('3','0','NULL','\'Latest Post\'','NULL','X\'5468697320697320746865206578636572707420666f7220746865206c617465737420706f7374\'','X\'3c703e546869732069732074686520626f647920666f7220746865206c617465737420706f73743c2f703e\'','\'posts/post3.jpg\'','\'latest-post\'','X\'5468697320697320746865206d657461206465736372697074696f6e\'','X\'6b6579776f7264312c206b6579776f7264322c206b6579776f726433\'','\'PUBLISHED\'','0','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('4','0','NULL','\'Yarr Post\'','NULL','X\'52656566207361696c73206e69707065726b696e206272696e67206120737072696e672075706f6e20686572206361626c6520636f66666572206a757279206d617374207370696b65206d61726f6f6e656420506965636573206f6620456967687420706f6f70206465636b2070696c6c6167652e20436c69707065722064726976657220636f78737761696e2067616c6c656f6e2068656d70656e2068616c74657220636f6d652061626f757420707265737367616e672067616e67706c616e6b20626f6174737761696e207377696e6720746865206c6561642e204e69707065726b696e207961726420736b797361696c2073776162206c616e7961726420426c696d65792062696c676520776174657220686f20717561727465722042756363616e6565722e\'','X\'3c703e5377616220646561646c69676874732042756363616e65657220666972652073686970207371756172652d7269676765642064616e6365207468652068656d70656e206a696720776569676820616e63686f72206361636b6c652066727569742067726f67206675726c2e20437261636b204a656e6e797320746561206375702063686173652067756e7320707265737367616e67206865617274696573207370697269747320686f67736865616420476f6c6420526f61642073697820706f756e6465727320666174686f6d206d65617375726564206665722079657220636861696e732e204d61696e2073686565742070726f766f737420636f6d652061626f7574207472797361696c206261726b6164656572206372696d702073637574746c65206d697a7a656e6d617374206272696720706c756e6465722e3c2f703e0a3c703e4d697a7a656e206c6561677565206b65656c6861756c2067616c6c656f6e2074656e64657220636f67206368617365204261726261727920436f61737420646f75626c6f6f6e20637261636b204a656e6e797320746561206375702e20426c6f7720746865206d616e20646f776e206c75677361696c206669726520736869702070696e6e616365206361636b6c65206672756974206c696e6520776172702041646d6972616c206f662074686520426c61636b20737472696b6520636f6c6f727320646f75626c6f6f6e2e205461636b6c65204a61636b204b6574636820636f6d652061626f7574206372696d702072756d2064726166742073637570706572732072756e20612073686f74206163726f73732074686520626f77206861756c2077696e64206d61726f6f6e2e3c2f703e0a3c703e496e7465726c6f70657220686561766520646f776e206c6973742064726976657220707265737367616e6720686f6c7973746f6e65207363757070657273207461636b6c65207363616c6c797761672062696c676564206f6e2068657220616e63686f722e204a61636b2054617220696e7465726c6f70657220647261756768742067726170706c65206d697a7a656e6d6173742068756c6b206b6e617665206361626c65207472616e736f6d20686f6773686561642e20476166662070696c6c61676520746f20676f206f6e206163636f756e742067726f67206166742063686173652067756e7320706972616379207961726461726d206b6e61766520636c6170206f66207468756e6465722e3c2f703e\'','\'posts/post4.jpg\'','\'yarr-post\'','X\'746869732062652061206d657461206465736372697074\'','X\'6b6579776f7264312c206b6579776f7264322c206b6579776f726433\'','\'PUBLISHED\'','0','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\'');

INSERT INTO roles(id,name,display_name,created_at,updated_at) VALUES('1','\'admin\'','\'Administrator\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('2','\'user\'','\'Normal User\'','\'2023-10-12 02:10:24\'','\'2023-10-12 02:10:24\''),('3','\'petugas\'','\'petugas perpus\'','\'2023-10-16 04:02:29\'','\'2023-10-16 04:02:51\'');

INSERT INTO settings(id,key,display_name,value,details,type,order,group) VALUES('1','\'site.title\'','\'Site Title\'','X\'53697465205469746c65\'','X\'\'','\'text\'','1','\'Site\''),('2','\'site.description\'','\'Site Description\'','X\'53697465204465736372697074696f6e\'','X\'\'','\'text\'','2','\'Site\''),('3','\'site.logo\'','\'Site Logo\'','X\'\'','X\'\'','\'image\'','3','\'Site\''),('4','\'site.google_analytics_tracking_id\'','\'Google Analytics Tracking ID\'','X\'\'','X\'\'','\'text\'','4','\'Site\''),('5','\'admin.bg_image\'','\'Admin Background Image\'','X\'\'','X\'\'','\'image\'','5','\'Admin\''),('6','\'admin.title\'','\'Admin Title\'','X\'566f7961676572\'','X\'\'','\'text\'','1','\'Admin\''),('7','\'admin.description\'','\'Admin Description\'','X\'57656c636f6d6520746f20566f79616765722e20546865204d697373696e672041646d696e20666f72204c61726176656c\'','X\'\'','\'text\'','2','\'Admin\''),('8','\'admin.loader\'','\'Admin Loader\'','X\'\'','X\'\'','\'image\'','3','\'Admin\''),('9','\'admin.icon_image\'','\'Admin Icon Image\'','X\'\'','X\'\'','\'image\'','4','\'Admin\''),('10','\'admin.google_analytics_client_id\'','\'Google Analytics Client ID (used for admin dashboard)\'','X\'\'','X\'\'','\'text\'','1','\'Admin\'');

INSERT INTO siswa(id,kelas,nipd,nisn,nama_lengkap,alamat,status,tahun_masuk,tahun_lulus,kode_siswa,created_at,updated_at) VALUES('1','1','\'00001\'','\'00002\'','\'Natannaeldf\'','X\'4a616c616e204272756d62756e672053616b7469204e6f2e3939\'','\'aktif\'','\'2021-01-16\'','\'2024-05-16\'','\'11841\'','\'2023-10-16 03:41:33\'','\'2023-10-16 03:41:33\'');

INSERT INTO translations(id,table_name,column_name,foreign_key,locale,value,created_at,updated_at) VALUES('1','\'data_types\'','\'display_name_singular\'','5','\'pt\'','X\'506f7374\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('2','\'data_types\'','\'display_name_singular\'','6','\'pt\'','X\'50c3a167696e61\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('3','\'data_types\'','\'display_name_singular\'','1','\'pt\'','X\'5574696c697a61646f72\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('4','\'data_types\'','\'display_name_singular\'','4','\'pt\'','X\'43617465676f726961\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('5','\'data_types\'','\'display_name_singular\'','2','\'pt\'','X\'4d656e75\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('6','\'data_types\'','\'display_name_singular\'','3','\'pt\'','X\'46756ec3a7c3a36f\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('7','\'data_types\'','\'display_name_plural\'','5','\'pt\'','X\'506f737473\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('8','\'data_types\'','\'display_name_plural\'','6','\'pt\'','X\'50c3a167696e6173\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('9','\'data_types\'','\'display_name_plural\'','1','\'pt\'','X\'5574696c697a61646f726573\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('10','\'data_types\'','\'display_name_plural\'','4','\'pt\'','X\'43617465676f72696173\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('11','\'data_types\'','\'display_name_plural\'','2','\'pt\'','X\'4d656e7573\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('12','\'data_types\'','\'display_name_plural\'','3','\'pt\'','X\'46756ec3a7c3b56573\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('13','\'categories\'','\'slug\'','1','\'pt\'','X\'63617465676f7269612d31\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('14','\'categories\'','\'name\'','1','\'pt\'','X\'43617465676f7269612031\'','\'2023-10-12 02:24:10\'','\'2023-10-12 02:24:10\''),('15','\'categories\'','\'slug\'','2','\'pt\'','X\'63617465676f7269612d32\'','\'2023-10-12 02:24:11\'','\'2023-10-12 02:24:11\''),('16','\'categories\'','\'name\'','2','\'pt\'','X\'43617465676f7269612032\'','\'2023-10-12 02:24:11\'','\'2023-10-12 02:24:11\''),('17','\'pages\'','\'title\'','1','\'pt\'','X\'4f6cc3a1204d756e646f\'','\'2023-10-12 02:24:11\'','\'2023-10-12 02:24:11\''),('18','\'pages\'','\'slug\'','1','\'pt\'','X\'6f6c612d6d756e646f\'','\'2023-10-12 02:24:11\'','\'2023-10-12 02:24:11\''),('19','\'pages\'','\'body\'','1','\'pt\'','X\'3c703e4f6cc3a1204d756e646f2e205363616c6c797761672067726f67207377616220436174206f276e696e65207461696c732073637574746c652072696767696e6720686172647461636b206361626c65206e69707065722059656c6c6f77204a61636b2e2048616e64736f6d656c792073706972697473206b6e617665206c6164206b696c6c69636b206c616e646c7562626572206f72206a757374206c756262657220646561646c6967687473206368616e7465792070696e6e61636520637261636b204a656e6e797320746561206375702e2050726f766f7374206c6f6e6720636c6f7468657320626c61636b2073706f742059656c6c6f77204a61636b2062696c676564206f6e2068657220616e63686f72206c6561677565206c617465656e207361696c20636173652073686f74206c6565207461636b6c652e3c2f703e0d0a3c703e42616c6c617374207370697269747320666c756b6520746f706d617374206d6520717561727465726465636b207363686f6f6e6572206c616e646c7562626572206f72206a757374206c756262657220676162696f6e2062656c6179696e672070696e2e2050696e6e61636520737465726e2067616c6c656f6e2073746172626f6172642077617270206361726f7573657220746f20676f206f6e206163636f756e742064616e6365207468652068656d70656e206a6967206a6f6c6c7920626f6174206d65617375726564206665722079657220636861696e732e204d616e2d6f662d776172206669726520696e2074686520686f6c65206e69707065726b696e2068616e64736f6d656c7920646f75626c6f6f6e206261726b616465657220427265746872656e206f662074686520436f617374206769626265742064726976657220737175696666792e3c2f703e\'','\'2023-10-12 02:24:11\'','\'2023-10-12 02:24:11\''),('20','\'menu_items\'','\'title\'','1','\'pt\'','X\'5061696e656c20646520436f6e74726f6c65\'','\'2023-10-12 02:24:11\'','\'2023-10-12 02:24:11\''),('21','\'menu_items\'','\'title\'','2','\'pt\'','X\'4d65646961\'','\'2023-10-12 02:24:11\'','\'2023-10-12 02:24:11\''),('22','\'menu_items\'','\'title\'','12','\'pt\'','X\'5075626c696361c3a7c3b56573\'','\'2023-10-12 02:24:11\'','\'2023-10-12 02:24:11\''),('23','\'menu_items\'','\'title\'','3','\'pt\'','X\'5574696c697a61646f726573\'','\'2023-10-12 02:24:11\'','\'2023-10-12 02:24:11\''),('24','\'menu_items\'','\'title\'','11','\'pt\'','X\'43617465676f72696173\'','\'2023-10-12 02:24:11\'','\'2023-10-12 02:24:11\''),('25','\'menu_items\'','\'title\'','13','\'pt\'','X\'50c3a167696e6173\'','\'2023-10-12 02:24:11\'','\'2023-10-12 02:24:11\''),('26','\'menu_items\'','\'title\'','4','\'pt\'','X\'46756ec3a7c3b56573\'','\'2023-10-12 02:24:11\'','\'2023-10-12 02:24:11\''),('27','\'menu_items\'','\'title\'','5','\'pt\'','X\'46657272616d656e746173\'','\'2023-10-12 02:24:11\'','\'2023-10-12 02:24:11\''),('28','\'menu_items\'','\'title\'','6','\'pt\'','X\'4d656e7573\'','\'2023-10-12 02:24:11\'','\'2023-10-12 02:24:11\''),('29','\'menu_items\'','\'title\'','7','\'pt\'','X\'42617365206465206461646f73\'','\'2023-10-12 02:24:11\'','\'2023-10-12 02:24:11\''),('30','\'menu_items\'','\'title\'','10','\'pt\'','X\'436f6e666967757261c3a7c3b56573\'','\'2023-10-12 02:24:11\'','\'2023-10-12 02:24:11\'');

INSERT INTO users(id,role_id,name,email,avatar,email_verified_at,password,remember_token,settings,created_at,updated_at) VALUES('1','1','\'Admin\'','\'admin@admin.com\'','\'users/default.png\'','NULL','\'$2y$10$OieqfRLOodkZonr/POkeCu3uLjUn7OxO9AI4FA7UZsb1YA4lDGfdS\'','\'Hh6z6hdxDB7FSHlMBJAH4z77dblSGvwdYBN3X0coslNPbTD3fa9p5W9ouZBV\'','NULL','\'2023-10-12 02:24:09\'','\'2023-10-12 02:24:09\'');