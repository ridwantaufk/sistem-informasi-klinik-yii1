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

