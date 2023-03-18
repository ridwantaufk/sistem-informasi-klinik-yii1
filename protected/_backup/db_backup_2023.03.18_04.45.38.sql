-- -------------------------------------------
SET AUTOCOMMIT=0;
START TRANSACTION;
SET SQL_QUOTE_SHOW_CREATE = 1;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- -------------------------------------------
-- -------------------------------------------
-- START BACKUP
-- -------------------------------------------
-- -------------------------------------------
-- TABLE `tbl_barang`
-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_barang`;
CREATE TABLE IF NOT EXISTS `tbl_barang` (
  `id_barang` int NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(150) NOT NULL,
  `stok` int NOT NULL,
  `harga_pokok` int NOT NULL,
  `harga_jual` int NOT NULL,
  `diskon` varchar(10) NOT NULL DEFAULT '0',
  `keuntungan` varchar(20) NOT NULL,
  `created_at` varchar(100) NOT NULL,
  `updated_at` varchar(100) NOT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `tbl_barang_dalam`
-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_barang_dalam`;
CREATE TABLE IF NOT EXISTS `tbl_barang_dalam` (
  `id_barang_dalam` int NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `stok` varchar(10) NOT NULL,
  `harga_pokok` varchar(20) NOT NULL,
  `harga_jual` varchar(20) NOT NULL,
  `diskon` varchar(10) NOT NULL,
  `keuntungan` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_barang_dalam`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -------------------------------------------
-- TABLE `tbl_dokter`
-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_dokter`;
CREATE TABLE IF NOT EXISTS `tbl_dokter` (
  `id_dokter` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(150) NOT NULL,
  `tempat_tanggal_lahir` varchar(150) NOT NULL,
  `alamat` text NOT NULL,
  `no_telepon` varchar(150) NOT NULL,
  `spesialis` varchar(150) NOT NULL,
  `created_at` varchar(100) NOT NULL,
  PRIMARY KEY (`id_dokter`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `tbl_master_transaksi`
-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_master_transaksi`;
CREATE TABLE IF NOT EXISTS `tbl_master_transaksi` (
  `id_master_transaksi` int NOT NULL AUTO_INCREMENT,
  `id_pasien` int NOT NULL,
  `id_perawatan` int DEFAULT NULL,
  `created_at` varchar(100) NOT NULL,
  `updated_at` varchar(100) NOT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `hutang` int NOT NULL DEFAULT '0',
  `biaya` int NOT NULL DEFAULT '0',
  `total` int NOT NULL DEFAULT '0',
  `total_bayar` int NOT NULL DEFAULT '0',
  `status_pembayaran` varchar(20) NOT NULL DEFAULT 'Belum Lunas',
  PRIMARY KEY (`id_master_transaksi`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `tbl_obat_perawatan`
-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_obat_perawatan`;
CREATE TABLE IF NOT EXISTS `tbl_obat_perawatan` (
  `id_obat_perawatan` int NOT NULL AUTO_INCREMENT,
  `id_perawatan` int NOT NULL,
  `id_obat` int NOT NULL,
  `jumlah` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_obat_perawatan`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -------------------------------------------
-- TABLE `tbl_pasien`
-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_pasien`;
CREATE TABLE IF NOT EXISTS `tbl_pasien` (
  `id_pasien` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(150) NOT NULL,
  `alamat` text NOT NULL,
  `tempat_tanggal_lahir` varchar(100) NOT NULL,
  `no_telepon` varchar(100) NOT NULL,
  `created_at` varchar(100) NOT NULL,
  `member` varchar(5) NOT NULL DEFAULT 'Tidak',
  PRIMARY KEY (`id_pasien`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `tbl_pengaturan`
-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_pengaturan`;
CREATE TABLE IF NOT EXISTS `tbl_pengaturan` (
  `id_pengaturan` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id_pengaturan`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `tbl_pengeluaran`
-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_pengeluaran`;
CREATE TABLE IF NOT EXISTS `tbl_pengeluaran` (
  `id_pengeluaran` int NOT NULL AUTO_INCREMENT,
  `pengeluaran` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pengeluaran`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -------------------------------------------
-- TABLE `tbl_perawat`
-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_perawat`;
CREATE TABLE IF NOT EXISTS `tbl_perawat` (
  `id_perawat` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(150) NOT NULL,
  `tempat_tanggal_lahir` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `no_telepon` varchar(100) NOT NULL,
  `created_at` varchar(100) NOT NULL,
  PRIMARY KEY (`id_perawat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `tbl_perawatan`
-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_perawatan`;
CREATE TABLE IF NOT EXISTS `tbl_perawatan` (
  `id_perawatan` int NOT NULL AUTO_INCREMENT,
  `nama_perawatan` varchar(150) NOT NULL,
  `harga` int NOT NULL,
  `diskon_member` varchar(5) NOT NULL,
  `diskon_umum` varchar(5) NOT NULL,
  `komisi_dokter` int NOT NULL,
  `komisi_perawat` int NOT NULL,
  `created_at` varchar(50) NOT NULL,
  `updated_at` varchar(50) NOT NULL,
  PRIMARY KEY (`id_perawatan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `tbl_transaksi_dokter`
-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_transaksi_dokter`;
CREATE TABLE IF NOT EXISTS `tbl_transaksi_dokter` (
  `id_transaksi_dokter` int NOT NULL AUTO_INCREMENT,
  `id_master_transaksi` int NOT NULL,
  `id_dokter` int NOT NULL,
  `created_at` varchar(100) NOT NULL,
  PRIMARY KEY (`id_transaksi_dokter`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `tbl_transaksi_obat`
-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_transaksi_obat`;
CREATE TABLE IF NOT EXISTS `tbl_transaksi_obat` (
  `id_transaksi_obat` int NOT NULL AUTO_INCREMENT,
  `id_master_transaksi` int NOT NULL,
  `id_obat` int NOT NULL,
  `jumlah` int NOT NULL DEFAULT '0',
  `created_at` varchar(50) NOT NULL,
  PRIMARY KEY (`id_transaksi_obat`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `tbl_transaksi_perawat`
-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_transaksi_perawat`;
CREATE TABLE IF NOT EXISTS `tbl_transaksi_perawat` (
  `id_transaksi_perawat` int NOT NULL AUTO_INCREMENT,
  `id_master_transaksi` int NOT NULL,
  `id_perawat` int NOT NULL,
  `created_at` varchar(100) NOT NULL,
  PRIMARY KEY (`id_transaksi_perawat`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `tbl_transaksi_perawatan`
-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_transaksi_perawatan`;
CREATE TABLE IF NOT EXISTS `tbl_transaksi_perawatan` (
  `id_transaksi_perawatan` int NOT NULL AUTO_INCREMENT,
  `id_master_transaksi` int NOT NULL,
  `id_perawatan` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_transaksi_perawatan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -------------------------------------------
-- TABLE `tbl_user_cms`
-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_user_cms`;
CREATE TABLE IF NOT EXISTS `tbl_user_cms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'kasir',
  `telepon` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- -------------------------------------------
-- TABLE DATA tbl_barang
-- -------------------------------------------
INSERT INTO `tbl_barang` (`id_barang`,`nama_barang`,`stok`,`harga_pokok`,`harga_jual`,`diskon`,`keuntungan`,`created_at`,`updated_at`) VALUES
('3','Verile Acne Gel 10 g','99','20000','30000','0','10000','2023-03-18 03:30:27','2023-03-18 03:30:27');
INSERT INTO `tbl_barang` (`id_barang`,`nama_barang`,`stok`,`harga_pokok`,`harga_jual`,`diskon`,`keuntungan`,`created_at`,`updated_at`) VALUES
('4','Erha Acneact BHA & Allantoin Acne Back Spray 100 ml','83','75000','85000','5','5750','2023-03-18 03:30:56','2023-03-18 03:30:56');
INSERT INTO `tbl_barang` (`id_barang`,`nama_barang`,`stok`,`harga_pokok`,`harga_jual`,`diskon`,`keuntungan`,`created_at`,`updated_at`) VALUES
('5','Labore Sensitive Skin Care Essential Kit','56','120000','155000','5','27250','2023-03-18 03:31:56','2023-03-18 03:31:56');
INSERT INTO `tbl_barang` (`id_barang`,`nama_barang`,`stok`,`harga_pokok`,`harga_jual`,`diskon`,`keuntungan`,`created_at`,`updated_at`) VALUES
('6','Cefixime 200 mg 10 Kapsul','55','15000','25000','0','10000','2023-03-18 03:32:49','2023-03-18 03:32:49');
INSERT INTO `tbl_barang` (`id_barang`,`nama_barang`,`stok`,`harga_pokok`,`harga_jual`,`diskon`,`keuntungan`,`created_at`,`updated_at`) VALUES
('7','Sumagesic 600 mg 4 Tablet','98','3500','5000','0','1500','2023-03-18 03:33:16','2023-03-18 03:33:16');
INSERT INTO `tbl_barang` (`id_barang`,`nama_barang`,`stok`,`harga_pokok`,`harga_jual`,`diskon`,`keuntungan`,`created_at`,`updated_at`) VALUES
('8','Mefinal 500 mg 10 Kaplet','70','10000','15000','0','5000','2023-03-18 03:33:44','2023-03-18 03:33:44');
INSERT INTO `tbl_barang` (`id_barang`,`nama_barang`,`stok`,`harga_pokok`,`harga_jual`,`diskon`,`keuntungan`,`created_at`,`updated_at`) VALUES
('9','Sanmol Forte 4 Tablet','148','2500','5000','0','2500','2023-03-18 03:34:08','2023-03-18 03:34:08');
INSERT INTO `tbl_barang` (`id_barang`,`nama_barang`,`stok`,`harga_pokok`,`harga_jual`,`diskon`,`keuntungan`,`created_at`,`updated_at`) VALUES
('10','CDR Effervescent 10 Tablet','250','26000','35000','0','9000','2023-03-18 03:34:41','2023-03-18 03:34:41');
INSERT INTO `tbl_barang` (`id_barang`,`nama_barang`,`stok`,`harga_pokok`,`harga_jual`,`diskon`,`keuntungan`,`created_at`,`updated_at`) VALUES
('11','Tolak Angin Cair Plus Madu 15 ml 5 Sachet','120','15000','25000','0','10000','2023-03-18 03:35:15','2023-03-18 03:35:15');
INSERT INTO `tbl_barang` (`id_barang`,`nama_barang`,`stok`,`harga_pokok`,`harga_jual`,`diskon`,`keuntungan`,`created_at`,`updated_at`) VALUES
('12','Sangobion 10 Kapsul','139','14000','20000','0','6000','2023-03-18 03:35:44','2023-03-18 03:35:44');



-- -------------------------------------------
-- TABLE DATA tbl_barang_dalam
-- -------------------------------------------
INSERT INTO `tbl_barang_dalam` (`id_barang_dalam`,`nama_barang`,`stok`,`harga_pokok`,`harga_jual`,`diskon`,`keuntungan`,`created_at`,`updated_at`) VALUES
('1','Verile Acne Gel 10 g	','90','20000','30000','0','10000','2023-03-18 03:38:01','2023-03-18 03:38:01');
INSERT INTO `tbl_barang_dalam` (`id_barang_dalam`,`nama_barang`,`stok`,`harga_pokok`,`harga_jual`,`diskon`,`keuntungan`,`created_at`,`updated_at`) VALUES
('2','Erha Acneact BHA & Allantoin Acne Back Spray 100 ml','159','75000','85000','0','10000','2023-03-18 03:39:32','2023-03-18 03:39:32');
INSERT INTO `tbl_barang_dalam` (`id_barang_dalam`,`nama_barang`,`stok`,`harga_pokok`,`harga_jual`,`diskon`,`keuntungan`,`created_at`,`updated_at`) VALUES
('3','Labore Sensitive Skin Care Essential Kit','45','120000','155000','0','35000','2023-03-18 03:40:34','2023-03-18 03:40:34');
INSERT INTO `tbl_barang_dalam` (`id_barang_dalam`,`nama_barang`,`stok`,`harga_pokok`,`harga_jual`,`diskon`,`keuntungan`,`created_at`,`updated_at`) VALUES
('4','Sanadryl DMP Sirup 120 ml','19','15000','23500','0','8500','2023-03-18 03:41:31','2023-03-18 03:41:31');
INSERT INTO `tbl_barang_dalam` (`id_barang_dalam`,`nama_barang`,`stok`,`harga_pokok`,`harga_jual`,`diskon`,`keuntungan`,`created_at`,`updated_at`) VALUES
('5','Actifed Plus Cough Supressant Sirup 60 ml (Merah)','40','45000','56000','0','11000','2023-03-18 03:51:56','2023-03-18 03:51:56');
INSERT INTO `tbl_barang_dalam` (`id_barang_dalam`,`nama_barang`,`stok`,`harga_pokok`,`harga_jual`,`diskon`,`keuntungan`,`created_at`,`updated_at`) VALUES
('6','Cessa Baby Happy Nose / Cough And Flu 8 ml','20','30000','35000','0','5000','2023-03-18 03:52:32','2023-03-18 03:52:32');
INSERT INTO `tbl_barang_dalam` (`id_barang_dalam`,`nama_barang`,`stok`,`harga_pokok`,`harga_jual`,`diskon`,`keuntungan`,`created_at`,`updated_at`) VALUES
('7','Ventolin Nebules 2.5 mg 2 Strip (5 Ampul/Strip) - Obat Rutin','35','78000','95000','0','17000','2023-03-18 03:53:12','2023-03-18 03:53:12');



-- -------------------------------------------
-- TABLE DATA tbl_dokter
-- -------------------------------------------
INSERT INTO `tbl_dokter` (`id_dokter`,`nama`,`tempat_tanggal_lahir`,`alamat`,`no_telepon`,`spesialis`,`created_at`) VALUES
('3','Saridi','Garut, 20 November 1990','Rancaekek No. 33, Kab. Bandung, Jawabarat','08534273467','Dokter umum','2023-03-18 03:57:43');
INSERT INTO `tbl_dokter` (`id_dokter`,`nama`,`tempat_tanggal_lahir`,`alamat`,`no_telepon`,`spesialis`,`created_at`) VALUES
('4','Fita Airi','Bandung, 03 Oktober 1994','Margahayu No. 10, Bandung, Jawabarat','08823746527','Dokter Wajah','2023-03-18 03:58:55');
INSERT INTO `tbl_dokter` (`id_dokter`,`nama`,`tempat_tanggal_lahir`,`alamat`,`no_telepon`,`spesialis`,`created_at`) VALUES
('5','Indah Nurfitri','Jakarta, 14 Februari 1996','Jl. Cipagalo No. 76, Bandung, Jawabarat','08134623576','Dokter Kulit','2023-03-18 04:00:45');



