-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.25 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table dbpenggajian.ci_sessions
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table dbpenggajian.ci_sessions: ~0 rows (approximately)
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
	('4fb84b70b22645e847b8a0324e701b0294501c1f', '::1', 1637812002, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313633373831323030323B),
	('7mgsfi503pnmn97o3816lk6dtbb9cj5k', '::1', 1637813123, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313633373831333131323B),
	('e463681f17026a12a02644b89bd5df02b70f9535', '::1', 1637813231, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313633373831333138333B);
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;

-- Dumping structure for table dbpenggajian.jabatan
CREATE TABLE IF NOT EXISTS `jabatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `aktif` enum('Y','N') DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Dumping data for table dbpenggajian.jabatan: 16 rows
/*!40000 ALTER TABLE `jabatan` DISABLE KEYS */;
INSERT INTO `jabatan` (`id`, `nama`, `aktif`) VALUES
	(7, 'IT Developer Programmer', 'Y'),
	(6, 'HRD', 'Y'),
	(5, 'Accounting', 'Y'),
	(4, 'Keuangan', 'Y'),
	(2, 'Manager', 'Y'),
	(3, 'Sekretaris', 'Y'),
	(1, 'Direktur', 'Y'),
	(8, 'IT Support', 'Y'),
	(9, 'Cutting', 'Y'),
	(10, 'Produksi', 'Y'),
	(11, 'Perbantuan', 'Y'),
	(12, 'Gudang', 'Y'),
	(14, 'Finishing', 'Y'),
	(18, 'Satpam', 'Y'),
	(19, 'Operator', 'Y'),
	(20, 'Packing', 'Y');
/*!40000 ALTER TABLE `jabatan` ENABLE KEYS */;

-- Dumping structure for table dbpenggajian.karyawan
CREATE TABLE IF NOT EXISTS `karyawan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_jabatan` int(11) NOT NULL,
  `tgl_masuk` date NOT NULL COMMENT 'untuk menghitung lama_kerja',
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(25) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `pendidikan` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table dbpenggajian.karyawan: 14 rows
/*!40000 ALTER TABLE `karyawan` DISABLE KEYS */;
INSERT INTO `karyawan` (`id`, `id_jabatan`, `tgl_masuk`, `nama`, `alamat`, `no_telp`, `jk`, `tempat_lahir`, `tgl_lahir`, `email`, `pendidikan`) VALUES
	(8, 9, '0000-00-00', 'Ahmad Munajat', 'Jl. Suryakencana No. 101', '085659120912', 'L', 'Sukabumi', '1984-09-10', 'ahmad.munajat@yahoo.com', 'D3'),
	(7, 5, '0000-00-00', 'Siti Nurani', 'Jl. Pajagalan No. 11', '0812090922', 'P', 'SUkabumi', '1991-11-05', 'siti.nurani@gmail.com', 'D3'),
	(5, 3, '0000-00-00', 'Wulandari', 'Jl. Ahmad Yani No. 11', '0811209091212', 'P', 'Sukabumi', '1991-09-01', 'wulandari@yahoo.com', 'S1'),
	(6, 6, '0000-00-00', 'Fitri Anggraeni', 'Jl. Pangleseran RT/RW 12/01 Kp. Citarum', '087709128800', 'P', 'Sukabumi', '1992-09-10', 'sry.fitriani@gmail.com', 'S2'),
	(1, 1, '0000-00-00', 'Yenda Purbadian', 'Jl. Cikini Stones Complex No. 101', '085659543844', 'L', 'Ciamis', '2015-08-23', 'virus.piss@ymail.com', 'S3'),
	(2, 2, '0000-00-00', 'Iman', 'Jl. Pajagalan', '081209091212', 'L', 'Sukanumi', '2015-08-26', 'iman@yahoo.com', 'S1'),
	(3, 9, '0000-00-00', 'Syarif Hidayatullah', 'Jl. Cikini No. 12', '081209091212', 'L', 'Sukabumi', '1990-09-01', 'syarif.hidayatullah@gmail.com', 'SMA/SMK'),
	(4, 8, '0000-00-00', 'M. Idris Firdaus', 'Jl. Mawar Selatan No. 201', '087812097766', 'L', 'Bandung', '1980-02-01', 'idris.firdaus@gmail.com', 'S1'),
	(9, 4, '0000-00-00', 'Saepul Anwar', 'Jl. Pojok No. 10', '081209128989', 'L', 'Sukabumi', '1990-09-10', 'saep.an.war@yahoo.com', 'D3'),
	(12, 8, '0000-00-00', 'M. Saepul Alam', 'Jl. Ciaul No. 101 Kp. Cikereteg RT/RW 12/03 Desa Cikereteg Kota Sukabumi', '081209221209', 'L', 'Sukabumi', '1976-01-21', 'saepul_alam@yahoo.com', 'S1'),
	(13, 4, '0000-00-00', 'Fitriyani', 'Jl. Mawar No. 2 ', '087792778912', 'P', 'Sukabumi', '1989-02-14', 'fitriyani@yahoo.com', 'S1'),
	(14, 5, '0000-00-00', 'Sry Fitryani', 'Jl. Bhayangkara Timur No. 101', '087812096667', 'P', 'Sukabumi', '1988-10-01', 'sry.fitryani@yahoo.com', 'S1'),
	(16, 9, '0000-00-00', 'david', 'ggggggg', '000008564667789', 'L', 'pasu', '2021-10-26', 'davidmahendra@gmail.com', 'SMA/SMK'),
	(17, 18, '2014-04-15', 'A', 'coba', '088888888888', 'L', 'Lamongan', '1999-02-01', 'yolafebrianto1@gmail.com', 'SMA/SMK');
/*!40000 ALTER TABLE `karyawan` ENABLE KEYS */;

-- Dumping structure for table dbpenggajian.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(200) DEFAULT NULL,
  `uri` varchar(200) DEFAULT NULL,
  `id_menu_induk` int(11) DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL,
  `aktif` enum('Y','N') DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;

-- Dumping data for table dbpenggajian.menu: 14 rows
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `nama`, `uri`, `id_menu_induk`, `urutan`, `aktif`) VALUES
	(1, 'Data Master', '#', 0, 1, 'Y'),
	(2, 'Transaksi', '#', 0, 2, 'Y'),
	(3, 'Laporan', '#', 0, 3, 'Y'),
	(4, 'Back Office', '#', 0, 4, 'Y'),
	(5, 'Perkiraan', '/master_data/perkiraan', 1, 5, 'Y'),
	(6, 'Jabatan', '/master_data/jabatan', 1, 6, 'Y'),
	(7, 'Karyawan', '/master_data/karyawan', 1, 7, 'Y'),
	(8, 'Penggajian', '/transaksi/penggajian', 2, 8, 'Y'),
	(9, 'Rekap Gaji Karyawan', '/laporan/rekap_gaji_karyawan', 3, 9, 'Y'),
	(10, 'Rincian Gaji Karyawan', '/laporan/rincian_gaji_karyawan', 3, 10, 'Y'),
	(11, 'Manajemen Menu', '/back_office/manajemen_menu', 4, 11, 'Y'),
	(12, 'Pengguna Grup', '/back_office/pengguna_grup', 4, 12, 'Y'),
	(13, 'Pengguna', '/back_office/pengguna', 4, 13, 'Y'),
	(103, 'wkwkkw', 'wkakw', 1, NULL, 'Y');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Dumping structure for table dbpenggajian.menu_akses
CREATE TABLE IF NOT EXISTS `menu_akses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) NOT NULL,
  `id_pengguna_grup` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

-- Dumping data for table dbpenggajian.menu_akses: ~26 rows (approximately)
/*!40000 ALTER TABLE `menu_akses` DISABLE KEYS */;
INSERT INTO `menu_akses` (`id`, `id_menu`, `id_pengguna_grup`) VALUES
	(65, 1, 1),
	(66, 5, 1),
	(67, 6, 1),
	(68, 7, 1),
	(69, 2, 1),
	(70, 8, 1),
	(71, 3, 1),
	(72, 9, 1),
	(73, 10, 1),
	(74, 4, 1),
	(75, 11, 1),
	(76, 12, 1),
	(77, 13, 1),
	(96, 1, 10),
	(97, 5, 10),
	(98, 6, 10),
	(99, 7, 10),
	(100, 10, 10),
	(101, 4, 10),
	(102, 11, 10),
	(103, 12, 10),
	(104, 13, 10),
	(105, 1, 11),
	(106, 5, 11),
	(107, 6, 11),
	(108, 7, 11);
/*!40000 ALTER TABLE `menu_akses` ENABLE KEYS */;

-- Dumping structure for table dbpenggajian.pengguna
CREATE TABLE IF NOT EXISTS `pengguna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna_grup` int(11) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `blokir` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table dbpenggajian.pengguna: 3 rows
/*!40000 ALTER TABLE `pengguna` DISABLE KEYS */;
INSERT INTO `pengguna` (`id`, `id_pengguna_grup`, `username`, `password`, `nama`, `foto`, `blokir`) VALUES
	(1, 1, 'superadmin', '21232f297a57a5a743894a0e4a801fc3', 'Superadmin', 'aa.jpg', 'N'),
	(3, 10, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'administrator.jpg', 'N'),
	(6, 11, 'marketing', '5be9a68073f66a56554e25614e9f1c9a', 'Iman Nasution', '621435_516269068386099_1999885273_o.jpg', 'N');
/*!40000 ALTER TABLE `pengguna` ENABLE KEYS */;

-- Dumping structure for table dbpenggajian.pengguna_grup
CREATE TABLE IF NOT EXISTS `pengguna_grup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table dbpenggajian.pengguna_grup: 3 rows
/*!40000 ALTER TABLE `pengguna_grup` DISABLE KEYS */;
INSERT INTO `pengguna_grup` (`id`, `nama`) VALUES
	(11, 'Marketing'),
	(10, 'admin'),
	(1, 'Superadmin');
/*!40000 ALTER TABLE `pengguna_grup` ENABLE KEYS */;

-- Dumping structure for table dbpenggajian.perkiraan
CREATE TABLE IF NOT EXISTS `perkiraan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'Y',
  `status` enum('0','1') NOT NULL COMMENT 'pendapatan atau potongan',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table dbpenggajian.perkiraan: 14 rows
/*!40000 ALTER TABLE `perkiraan` DISABLE KEYS */;
INSERT INTO `perkiraan` (`id`, `kode`, `nama`, `aktif`, `status`) VALUES
	(1, '001', 'Gaji Pokok', 'Y', '1'),
	(2, '002', 'Lembur', 'Y', '1'),
	(3, '003', 'Uang Makan', 'Y', '1'),
	(4, '004', 'Uang Transport', 'N', '1'),
	(5, '005', 'Tunjangan Keluarga', 'N', '1'),
	(6, '006', 'Tunjangan Kesehatan', 'N', '1'),
	(7, '007', 'THR', 'Y', '1'),
	(8, '008', 'Bonus', 'Y', '1'),
	(9, '101', 'Pajak', 'N', '0'),
	(10, '102', 'Koperasi', 'N', '0'),
	(11, '103', 'Utang Pinjam', 'Y', '0'),
	(14, '104', 'Asuransi Jiwa', 'N', '0'),
	(15, '105', 'BPJS', 'Y', '0'),
	(18, '009', 'Tunjangan Jabatan', 'N', '0');
/*!40000 ALTER TABLE `perkiraan` ENABLE KEYS */;

-- Dumping structure for table dbpenggajian.perusahaan
CREATE TABLE IF NOT EXISTS `perusahaan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` text,
  `kode_pos` varchar(25) DEFAULT NULL,
  `no_telp` varchar(25) DEFAULT NULL,
  `fax` varchar(25) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table dbpenggajian.perusahaan: ~0 rows (approximately)
/*!40000 ALTER TABLE `perusahaan` DISABLE KEYS */;
INSERT INTO `perusahaan` (`id`, `nama`, `alamat`, `kode_pos`, `no_telp`, `fax`, `email`) VALUES
	(1, 'PT. Perkasa Mitra Makmur Mandiri', 'Dusun Talun, Desa Gununggangsir, Beji, Pasuruan', '67155', '-', '-', '-');
/*!40000 ALTER TABLE `perusahaan` ENABLE KEYS */;

-- Dumping structure for table dbpenggajian.rincian_transaksi_gaji
CREATE TABLE IF NOT EXISTS `rincian_transaksi_gaji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_transaksi_gaji` int(11) NOT NULL,
  `id_perkiraan` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;

-- Dumping data for table dbpenggajian.rincian_transaksi_gaji: 54 rows
/*!40000 ALTER TABLE `rincian_transaksi_gaji` DISABLE KEYS */;
INSERT INTO `rincian_transaksi_gaji` (`id`, `id_transaksi_gaji`, `id_perkiraan`, `jumlah`) VALUES
	(137, 1602290006, 14, 100000),
	(136, 1602290006, 9, 200000),
	(135, 1602290006, 4, 400000),
	(134, 1602290006, 3, 300000),
	(133, 1602290006, 1, 3000000),
	(132, 1602150005, 15, 150000),
	(131, 1602150005, 9, 350000),
	(130, 1602150005, 6, 350000),
	(129, 1602150005, 4, 100000),
	(128, 1602150005, 3, 100000),
	(127, 1602150005, 2, 200000),
	(126, 1602150005, 1, 2000000),
	(125, 1601250004, 11, 300000),
	(124, 1601250004, 10, 150000),
	(123, 1601250004, 9, 350000),
	(122, 1601250004, 8, 375000),
	(121, 1601250004, 7, 2000000),
	(120, 1601250004, 6, 100000),
	(119, 1601250004, 5, 175000),
	(118, 1601250004, 4, 150000),
	(117, 1601250004, 3, 300000),
	(116, 1601250004, 2, 200000),
	(115, 1601250004, 1, 2000000),
	(114, 1601120003, 15, 250000),
	(113, 1601120003, 14, 250000),
	(112, 1601120003, 9, 750000),
	(111, 1601120003, 6, 1000000),
	(110, 1601120003, 5, 1000000),
	(109, 1601120003, 4, 1000000),
	(108, 1601120003, 3, 500000),
	(107, 1601120003, 1, 5000000),
	(106, 1601120002, 15, 200000),
	(105, 1601120002, 14, 200000),
	(104, 1601120002, 9, 500000),
	(103, 1601120002, 6, 500000),
	(102, 1601120002, 5, 500000),
	(101, 1601120002, 4, 350000),
	(100, 1601120002, 3, 350000),
	(99, 1601120002, 1, 4000000),
	(98, 1512180001, 15, 150000),
	(97, 1512180001, 14, 200000),
	(96, 1512180001, 10, 125000),
	(95, 1512180001, 9, 350000),
	(94, 1512180001, 6, 350000),
	(93, 1512180001, 5, 500000),
	(92, 1512180001, 4, 2000000),
	(91, 1512180001, 3, 125000),
	(90, 1512180001, 2, 2000000),
	(89, 1512180001, 1, 5000000),
	(138, 2110260007, 1, 1000000),
	(139, 2110260007, 2, 100),
	(140, 2110260007, 3, 10),
	(141, 2111240008, 1, 1029000),
	(142, 2111240008, 15, 50000);
/*!40000 ALTER TABLE `rincian_transaksi_gaji` ENABLE KEYS */;

-- Dumping structure for table dbpenggajian.transaksi_gaji
CREATE TABLE IF NOT EXISTS `transaksi_gaji` (
  `id` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `tgl_gaji` date NOT NULL,
  `pendapatan` int(11) NOT NULL,
  `potongan` int(11) NOT NULL,
  `gaji_bersih` int(11) NOT NULL,
  `waktu_input` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_pengguna_input` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table dbpenggajian.transaksi_gaji: 8 rows
/*!40000 ALTER TABLE `transaksi_gaji` DISABLE KEYS */;
INSERT INTO `transaksi_gaji` (`id`, `id_karyawan`, `tgl_gaji`, `pendapatan`, `potongan`, `gaji_bersih`, `waktu_input`, `id_pengguna_input`) VALUES
	(1602290006, 13, '2016-02-29', 3700000, 300000, 3400000, '2016-02-29 13:26:32', 1),
	(1602150005, 8, '2016-02-15', 2750000, 500000, 2250000, '2016-02-16 01:10:00', 1),
	(1601250004, 4, '2016-01-25', 5300000, 800000, 4500000, '2016-01-26 03:02:04', 1),
	(1601120003, 2, '2016-01-12', 8500000, 1250000, 7250000, '2016-01-13 00:07:26', 3),
	(1601120002, 9, '2016-01-12', 5700000, 900000, 4800000, '2016-01-13 00:06:10', 3),
	(1512180001, 1, '2015-12-18', 9975000, 825000, 9150000, '2015-12-18 23:43:38', 3),
	(2110260007, 16, '2021-10-26', 1000110, 0, 1000110, '2021-10-26 09:00:45', 1),
	(2111240008, 17, '2021-11-24', 1029000, 50000, 979000, '2021-11-24 09:34:50', 1);
/*!40000 ALTER TABLE `transaksi_gaji` ENABLE KEYS */;

-- Dumping structure for table dbpenggajian.usulan_gaji
CREATE TABLE IF NOT EXISTS `usulan_gaji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_karyawan` int(11) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `lama_kerja` int(11) NOT NULL DEFAULT '0',
  `id_jabatan` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `gajipokok` bigint(20) NOT NULL DEFAULT '0' COMMENT 'tergantung pada jabatan dan lama kerja',
  `tunj_jabatan` bigint(20) NOT NULL DEFAULT '0',
  `tunj_kemahalan` bigint(20) NOT NULL DEFAULT '0',
  `tunj_hadir` bigint(20) NOT NULL DEFAULT '0',
  `tunj_lain` bigint(20) NOT NULL DEFAULT '0',
  `gajiharian` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table dbpenggajian.usulan_gaji: ~0 rows (approximately)
/*!40000 ALTER TABLE `usulan_gaji` DISABLE KEYS */;
INSERT INTO `usulan_gaji` (`id`, `id_karyawan`, `tgl_masuk`, `lama_kerja`, `id_jabatan`, `status`, `gajipokok`, `tunj_jabatan`, `tunj_kemahalan`, `tunj_hadir`, `tunj_lain`, `gajiharian`) VALUES
	(1, 17, '2014-04-15', 0, 18, 'K/I', 1911000, 0, 0, 0, 0, 63700);
/*!40000 ALTER TABLE `usulan_gaji` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
