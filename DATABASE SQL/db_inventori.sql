/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.25-MariaDB : Database - homestead
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_inventori` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `db_inventori`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

INSERT  INTO `categories`(`id`,`name`,`created_at`,`updated_at`) VALUES 
(1,'Drone Racing','2024-02-19 11:50:55','2024-02-19 11:50:55'),
(2,'Drone Quadcopter','2024-02-19 11:55:17','2024-02-19 11:57:57');

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `customers` */

INSERT  INTO `customers`(`id`,`nama`,`alamat`,`email`,`telepon`,`created_at`,`updated_at`) VALUES 
(1,'Riki Mulyadi','Malang','rikimul@gmail.com','086553713724','2024-02-19 12:01:54','2024-02-20 05:02:12');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` INT(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

INSERT  INTO `migrations`(`id`,`migration`,`batch`) VALUES 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2018_12_18_035002_create_customers_table',1),
(4,'2018_12_18_035015_create_sales_table',1),
(5,'2018_12_18_035038_create_suppliers_table',1),
(6,'2018_12_18_041830_create_categories_table',1),
(7,'2018_12_18_042809_create_products_table',1),
(8,'2018_12_18_043146_create_product_masuk_table',1),
(9,'2018_12_18_043233_create_product_keluar_table',1),
(10,'2018_12_19_044911_add_field_role_to_table_users',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `product_keluar` */

DROP TABLE IF EXISTS `product_keluar`;

CREATE TABLE `product_keluar` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` INT(10) UNSIGNED NOT NULL,
  `customer_id` INT(10) UNSIGNED NOT NULL,
  `qty` INT(11) NOT NULL,
  `tanggal` DATE NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_keluar_product_id_foreign` (`product_id`),
  KEY `product_keluar_customer_id_foreign` (`customer_id`),
  CONSTRAINT `product_keluar_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_keluar_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_keluar` */

INSERT  INTO `product_keluar`(`id`,`product_id`,`customer_id`,`qty`,`tanggal`,`created_at`,`updated_at`) VALUES 
(1,2,1,1,'2024-02-02','2024-02-19 12:04:55','2024-02-20 05:06:14'),
(2,1,1,1,'2024-02-17','2024-02-20 03:37:00','2024-02-20 03:42:19');

/*Table structure for table `product_masuk` */

DROP TABLE IF EXISTS `product_masuk`;

CREATE TABLE `product_masuk` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` INT(10) UNSIGNED NOT NULL,
  `supplier_id` INT(10) UNSIGNED NOT NULL,
  `qty` INT(11) NOT NULL,
  `tanggal` DATE NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_masuk_product_id_foreign` (`product_id`),
  KEY `product_masuk_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `product_masuk_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_masuk_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_masuk` */

INSERT  INTO `product_masuk`(`id`,`product_id`,`supplier_id`,`qty`,`tanggal`,`created_at`,`updated_at`) VALUES 
(1,1,1,50,'2024-02-07','2024-02-19 12:22:50','2024-02-20 05:08:20');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` INT(10) UNSIGNED NOT NULL,
  `nama` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` INT(11) NOT NULL,
  `image` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` INT(11) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

INSERT  INTO `products`(`id`,`category_id`,`nama`,`harga`,`image`,`qty`,`created_at`,`updated_at`) VALUES 
(1,1,'Cleair O2',200000,'/upload/products/cleair-o2.png',346,'2024-02-19 11:54:21','2024-02-20 05:08:20'),
(2,2,'Broadream Quadcopter Drone Mini',186000,'/upload/products/broadream-quadcopter-drone-mini.jpg',292,'2024-02-19 11:59:12','2024-02-20 05:06:14');

/*Table structure for table `sales` */

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sales` */

/*Table structure for table `suppliers` */

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `suppliers` */

INSERT  INTO `suppliers`(`id`,`nama`,`alamat`,`email`,`telepon`,`created_at`,`updated_at`) VALUES 
(1,'PT Drone Serba Guna','Madiun','droneserbaguna@gmail.com','087123612389','2024-02-19 12:04:33','2024-02-19 12:04:33');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `role` ENUM('admin','staff') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'staff',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

INSERT  INTO `users`(`id`,`name`,`email`,`password`,`remember_token`,`created_at`,`updated_at`,`role`) VALUES 
(1,'Admin','admin@gmail.com','$2y$10$9a7b78YWmpUO1yS3Q2CeMOuWvemjp4Q13q52ykg5alI/f9NrICqB.','WgbQLlQXeNjcf4GXkXLfKi6xKHbmkkcJJeoo3amUeTnahM4ESuJQGXi1pf22','2019-12-24 20:14:09','2019-12-24 20:16:00','admin'),
(2,'Staff','staff@gmail.com','$2y$10$.RlOX9UYt/0OxeqfKrMXres/h89LCFz9P1C6SaeQS3I5tguWhCogC','u5WLIpz7RRaOxczDTtiFhHaKSqmpB5Aod79UyZzOrcRRc5oG9ICQ3zSGrsQN','2024-02-19 11:47:49','2024-02-19 11:47:49','staff');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
