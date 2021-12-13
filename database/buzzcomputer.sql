-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2021 at 11:09 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buzzcomputer`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(7, 'Aksesoris Komputer & Laptop'),
(8, 'Aksesoris PC Gaming'),
(9, 'Desktop & Mini PC'),
(10, 'Kabel & Adaptor'),
(11, 'Komponen Komputer'),
(12, 'Komponen Laptop'),
(13, 'Laptop'),
(14, 'Media Penyimpanan Data'),
(15, 'Memory Card'),
(16, 'Monitor'),
(17, 'Networking'),
(18, 'PC & Laptop Gaming'),
(27, 'Popok Bayi'),
(19, 'Software');

-- --------------------------------------------------------

--
-- Table structure for table `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(5) NOT NULL,
  `nama_kota` varchar(200) NOT NULL,
  `tarif` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Jakarta Timur', 10000),
(2, 'Kota Bandung', 15000),
(3, 'Bogor', 13000),
(4, 'Demak', 18000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(50) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(5, 'ray@gmail.com', '123456', 'Raynaldi Fazar', '081295040118', 'Villa Strawberry Cianjur'),
(8, 'test@gmail.com', 'zxcvb', 'test', '888666786', 'Jalan Patimura'),
(9, 'mantap@gmail.com', 'asdfg', 'mantap', '872334123', 'Bandung Coret');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(55, 52, 'Test Bayar', 'BCA', 135000, '2021-12-13', '2021121311061120190515-042338-5cdb370875065776065e29e6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'Belum Dibayar',
  `resi_pengiriman` varchar(50) NOT NULL,
  `totalberat` int(11) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `distrik` varchar(255) NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `kodepos` varchar(255) NOT NULL,
  `ekspedisi` varchar(255) NOT NULL,
  `paket` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `estimasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `tanggal_pembelian`, `total_pembelian`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`, `totalberat`, `provinsi`, `distrik`, `tipe`, `kodepos`, `ekspedisi`, `paket`, `ongkir`, `estimasi`) VALUES
(52, 5, '2021-12-13', 149000, 'Villa Strawberry', 'Pesanan Diproses', '5656', 300, 'Jawa Barat', 'Kabupaten', 'Cianjur', '43217', 'pos', 'Paket Kilat Khusus', 19000, '3 HARI');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(56, 46, 21, 1, 'Logitech F310 Stick Game Controler USB PC Joystick Joystik Controller', 285000, 1000, 1000, 285000),
(57, 46, 22, 1, 'ACER PC ALL IN ONE C20-830 - DUALCORE J4005U 4GB 1TB 19,5\" W10 RESMI', 4399000, 8500, 8500, 4399000),
(58, 47, 23, 1, 'MiniPC Z83V Dual Display Windows 10 64bit Intel Z8350 - Hitam', 1550000, 600, 600, 1550000),
(59, 48, 29, 1, 'RAM KINGSTON HYPER X FURY GAMING DDR3 4GB PC 12800 LONGDIMM', 225000, 100, 100, 225000),
(60, 49, 16, 1, 'X3 Kamera Web Webcam 1080P', 130000, 300, 300, 130000),
(61, 50, 25, 1, 'LAN TO USB ORICO UTJ-U2 USB 2.0', 115000, 50, 50, 115000),
(62, 50, 34, 1, 'LAPTOP ACER ASPIRE 5 A514-53 - i3-1005G1 4GB 512GB + OPTANE 14', 7399000, 3000, 3000, 7399000),
(63, 51, 32, 1, 'Keyboard Laptop Original Lenovo G40-30 G40-45 G40-70 G40-80', 75000, 400, 400, 75000),
(65, 52, 16, 1, 'X3 Kamera Web Webcam 1080P', 130000, 300, 300, 130000);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(100) NOT NULL,
  `berat_produk` int(100) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` mediumtext NOT NULL,
  `stok_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(16, 7, 'X3 Kamera Web Webcam 1080P', 130000, 300, 'camera.jfif', '            Bebas drive, Windows dapat digunakan dengan menghubungkan ke USB\r\n\r\nFitur:\r\n100% baru dan berkualitas tinggi.\r\nMikrofon penyerap suara internal, suara Anda dapat didengar dengan jelas dalam jarak 5 meter, yang berarti Anda tidak perlu mendekati bahkan mencium kamera Anda dengan canggung.\r\nDefinisi tinggi dengan piksel 2M dan gambar berwarna asli.\r\nAtas dan ke bawah 30 derajat dapat diputar, Anda dapat menyesuaikan sudut sesuka Anda.\r\n\r\nSpesifikasi:\r\nKisaran yang dapat digunakan: desktop\r\nJenis sensor: CMOS\r\nSensor pixel: 2 juta\r\nRasio resolusi maks: 1920 * 1080\r\nFrame rate: 30FPS\r\nPort: USB 2.0\r\nmode: operasi manual\r\nDukungan sistem: untuk 2000 XP win7 win8 Vista 32bit/64bit\r\nBahan: ABS\r\nWarna hitam\r\nUkuran: (kurang-lebih) panjang kabel * 1,4 m, 2,95 * 0,98 * 1,38 inci\r\nFitur: mikrofon bawaan\r\n\r\nIsi Kemasan:\r\n1 PC * Webcam FHD\r\n1 PC * Spesifikasi                ', 22),
(17, 7, 'Logitech M220 Silent Wireless Mouse', 249000, 200, 'mouse logitec.jpg', 'Garansi Resmi 1 tahun Logitech Indonesia (kemasan harap disimpan untuk claim)\r\n\r\nLogitech M220 Silent Wireless Mouse\r\nDengan perasaan klik yang sama dan pengurangan kebisingan suara lebih dari 90% pada suara klik, nikmati pengalaman yang tenang untuk Anda dan tetangga Anda. Kemudian, mouse ini memiliki alas yang berkualitas tinggi dan roda scroll yang berbahan karet sehingga gliding dan scrolling menjadi tenang.\r\n\r\nSederhana, Handal, Kuat.\r\nNikmati koneksi nirkabel hingga 10 meter lebih* terima kasih kepada colok-dan-lupakan nano receiver. Berfiturkan M220 Silent Logitech\" Advanced Optical Tracking untuk pergerakan yang sangat tepat dapat digunakan pada hampir seluruh permukaan. Tidak repot, tidak perlu perangkat lunak. Kompatibel dengan Windows, Mac, Chrome OS atau komputer berbasis Linux.\r\n\r\nDaya tahan baterai 18 bulan\r\nPeningkatan pada perubahan baterai yang dipengaruhi oleh perkembangan teknologinya. M220 Silent dengan otomatis merubah mouse menjadi Sleep Mode ketika tidak digunakan.\r\n\r\nBentuk yang nyaman. Ukuran yang dapat dibawa kemana saja.\r\nDidesain sedemikian rupa agar mouse ini dapat digunakan di tangan kanan dan kiri. Mouse ini menawarkan kenyamanan dan ketepatan yang lebih dari touchpad Anda. Ukurannya yang kecil sangat pas ditaruh di tas dibawa kemana saja.', 49),
(18, 7, 'Vacum Cooling Pad Laptop/Notebook', 55000, 300, 'vacum.jpg', '            Buat yg laptopnya panas :D disedot aja panasnya :P~\r\ncek dolo ya laptopnya ada pembuangan angin tidak di sampingnya kl ga ada brarti ga cocok :D\r\njgn tanya tipe laptop kita ga hafalin tipe2 laptop kl ada lubang pembuangan panas brarti bs di sedot :D\r\nMerk Taffware\r\nBarang sudah di cek dahulu sebelum kirim\r\n\r\n* Skarang Beda merk tp barang sama dgn pabrik yg sama untuk administrasi aja ganti merk :D\r\n\r\nBarang tidak sampai 100rb tapi bisa menambah umur laptopmu :D\r\nVacuum Cooler ini membantu laptop Anda untuk membuang panas dari dalam laptop sehingga laptop akan tetap dingin dan bekerja dengan lancar. Cooler ini juga memiliki knob untuk mengatur kecepatan kipas.\r\nAnda dapat mengatur kecepatan kipas dengan memutar knob yang terdapat pada bagian atas cooler. Ubah ke kecepatan maksimal untuk performa pendingin yang menakjubkan.\r\nCooler ini berkerja dengan cara menyedot suhu panas pada bagian dalam laptop dan membuangnya pada sisi lain cooler ini. Dengan cara kerja ini, suhu laptop Anda dijamin lebih dingin dibanding menggunakan cooling pad biasa yang hanya meniupkan angin ke laptop.\r\nKipas pada bagian vacuum cooler ini dapat berputar hingga kecepatan 3000 RPM.\r\n1 x CoolCold Universal Laptop Vacuum Cooler\r\n1 x USB Cable\r\n1 x CoolCold Accessories 3 karet\r\n\r\ntidak dapat adapter jadi cabel usb colok ke laptop :D        ', 49),
(19, 8, 'Gaming Mouse Pad dengan LED RGB 30x78CM - HITAM', 98500, 1300, '6667795_6f4403cd-5ac0-4d4b-809c-f3fb006de522_1000_1000.jpeg', '            Gaming mouse pad ini hadir dengan desain yang presisi disertai dengan glowing LED RGB yang menghadirkan tampilan gaming yang lebih hidup.Seringkali kita lihat perlengkapan gaming tidak jauh dari lampu LED berwarna warni, oleh sebab itu mouse pad ini juga tidak kalah sempurna untuk melengkapi warna-warni pernak pernik gaming Anda.\r\n\r\n\r\nFeatures\r\nEnchance Gaming Experience\r\nMouse pad ini dirancang khusus untuk kebutuhan gaming yang membutuhkan tingkat keakuratan mouse yang tinggi dan cocok untuk game-game yang memerlukan tingkat kecepatan yang tinggi.\r\n\r\nSoft Mouse Mats\r\nMaterial mouse pad ini terbuat dari kain yang halus dan silikon untuk memastikan fleksibilitas yang maksimum serta kenyamanan pada saat Anda bermain game atau bekerja.\r\n\r\nOptimized for all sensitivity settings and sensors\r\nMouse pad ini cocok bagi segala jenis kebutuhan sensivitas dan dapat mengkontrol mouse Anda dengan baik dan presisi pada saat bermain.\r\n\r\nAnti Slip Backing\r\nBagian bawah mouse pad terbuat dari material karet yang anti slip. Mouse pad akan tetap stabil tertempel di meja meskipun mouse Anda bergerak dengan cepat.\r\n\r\nRGB LED\r\nDisertai dengan lampu led berwarna warni membuat mouse pad ini lebih hidup dan cocok untuk disandingkan dengan gear gaming Anda lainnya. Pengaturan LED juga dapat dilakukan dengan switch yang tersedia pada bagian panel yang terhubung dengan kabel USB sebagai sumber tenaga untuk lampu.\r\n\r\nPackage Contents\r\n1 x Glowing LED High Precision Gaming Mouse Pad RGB\r\n1 x Micro USB Cable\r\n\r\nSpesifikasi MONTIAN Glowing LED High Precision Gaming Mouse Pad RGB\r\nLain-lain USB Cable: -+175cm        ', 30),
(20, 8, 'Fantech 5 in 1 Combo P51 Gaming Keyboard Mouse Headset Mousepad', 499000, 3000, '4fa8eac5-ee13-469c-9308-10d77764851f.jpg', '                        Biar gak bingung langsung punya 1 set isi 5 gaming gear !\r\n\r\nPaket ini terdiri dari tipe\r\n\r\nKeyboard Gaming K511 Hunter Pro\r\nMouse Gaming Thor X9\r\nHeadset Gaming Visage II HG17s\r\nHeadset Stand Gaming AC3001\r\nMousepad Gaming MP35\r\n\r\nTonton Video Unboxing nya di https://www.youtube.com/watch?v=Ck5Mf_HNJoc\r\n\r\nGaransi Resmi Fantech Care 1 Tahun\r\n\r\nPERHATIAN !!\r\n- Sebelum kirim Team Fantech telah melakukan QC dengan maksimal\r\n- Proses pesanan dilakukan pada jam operasional 09 AM - 04 PM Senin - Sabtu (diluar jam Operasional akan di proses ke esokan hari)\r\n- Order Grab/Gojek SAMEDAY batas maksimal adalah jam 2 sore | INSTAN jam 3 sore diluar ini akan di proses besok.\r\n- Berikan ulasan terbaik kamu dan kamu berkesempatan dapetin Merchandise Khusus dari Team Fantech                ', 15),
(21, 8, 'Logitech F310 Stick Game Controler USB PC Joystick Joystik Controller', 285000, 1000, '252625_9b5c68c7-f747-4d86-a1bf-79ffa7bba1a3_800_800.jfif', 'DUKUNGAN PERMAINAN YANG LUAS\r\nF310 mudah diatur dan digunakan dengan game favoritmu berkat XInput/DirectInput (Membutuhkan instalasi software untuk mode DirectInput).\r\n\r\nTATA LETAK MIRIP KONSOL YANG FAMILIER\r\nAmbil dan mainkan. Naluri Anda akan memandu aksi Anda pada tata letak yang familier. Anda akan siap bermain dalam sekejap mata. Diciptakan untuk pengalaman kendali mirip konsol dan inovasi dari rancangan tradisional, F310 sangat cocok.\r\n\r\nD-PAD 4-TOMBOL EKSKLUSIF\r\nD-pad standar terletak pada titik pivot tunggal, menyebabkan sulit dikendalikan. D-pad meluncur di atas empat tombol individual untuk nuansa sensitif yang responsif.\r\n\r\nDAPAT DIGUNAKAN DENGAN TV ANDROID\r\nController game kami sangat kompatibel dengan Sony Android TVâ„¢s. Dengan switch controller dalam mode XID, tata letak tombol kami yang mirip konsol akan memberikan keunggulan saat kamu bertanding. Lekukan mulus dan pegangan karet berkontur memungkinkanmu menikmati sesi permainan yang lama dengan nyaman. Kontrol TV Android Standar - disediakan melalui tombol Logo Logitech pada gamepad bersama dengan tombol Mundur pada controller - memungkinkanmu untuk menavigasi TV Android Anda dengan mulus.\r\n\r\nMUDAH DIATUR DAN DIGUNAKAN\r\nBeradaptasi dan kustomisasi. Ubahlah perintah standar atau adaptasikan F310 untuk memainkan judul game yang tidak didukung dengan menggunakan profiler software dari Logitech. Tombol dan kendali dapat diprogram dan bahkan meniru perintah keyboard dan mouse.\r\n\r\nKABEL 1,8 METER\r\nBersantai pada jarak yang nyaman dari monitor atau lakukan tarian kemenangan. Bahkan lakukan keduanya.\r\n\r\nPEGANGAN YANG NYAMAN\r\nNikmati sesi bermain yang panjang dan nyaman berkat kurva mulus dan pegangan karet berkontur.\r\n\r\nGaransi Resmi 1 Tahun Logitech Indonesia, Claim Garansi Beserta Packaging', 48),
(22, 9, 'ACER PC ALL IN ONE C20-830 - DUALCORE J4005U 4GB 1TB 19,5\" W10 RESMI', 4399000, 8500, '5109002_cff98504-c2f3-4a9d-929d-cd83910c6688_1000_1000.jfif', 'Spesifikasi :\r\nIntelÂ® DualCore CeleronÂ® J4005 Processor, 2GHz (4M Cache, up to 2.7 GHz)\r\nMemory DDR4 4GB\r\nStorage 2.5 HDD SATA 1TB\r\nDisplay 19.5\" (1600 x 900) resolution\r\nTouch Screen Non-touch\r\nGraphic Intel HD\r\nLAN 10/100/1000Mbps\r\nWiFi 802.11ac Bluetooth 4.2\r\nIntergrated 1.0 MP HD High-sense Webcam\r\nKeyboard & mouse : Wired Keyboard\r\nSide I/O Port \"1 x Microphone / Headphone Combo Jack\r\n2x USB 3.1\r\n2x USB 2.0\r\n1x HDMI\r\n1x Ethernet (RJ-45) port\r\n1x Headset / speaker jack\r\nSistem Operasi : Microsoft Windows 10 Home\r\nDimensi Produk : 58.5 x 14 x 50.5 cm\r\nDaya / Power : 65W\r\nGaransi Resmi ACER INDONESIA 1 TAHUN', 7),
(23, 9, 'MiniPC Z83V Dual Display Windows 10 64bit Intel Z8350 - Hitam', 1550000, 600, '3677779_8e3d9e52-5549-44f4-962c-1ca53e23791f_600_600.jfif', '            MiniPC Z83V 2020 Edition 4GB RAM 64GB ROM with 4 Port USB.\r\n\r\nUpdate New Z83V Versi 2020\r\nNEW body Design dan sudah 4 Port USB\r\n\r\nReady Stock Selama bisa di Klik Beli.\r\nBisa Gosend/Grab dikirim di hari yg sama.\r\n\r\nUntuk Harga Qty Grosir silahkan wa kami di 085799999512\r\n\r\nSpecifications\r\nModel Z83V\r\nType Mini PC\r\nSystem Windows 10 64Bit\r\nCPUIntel Atom X5-Z8350, up to 1.92GHz\r\nGPUIntel HD Graphic\r\nRAM 4GB DDR3\r\nROM 64GB\r\nMax. Extended Capacity128G (not included)\r\nDecoder Format H.263, H.264, H.265, HD MPEG4Video FormatAVI, DAT, ISO, MKV, MP4, MPEG, MPEG1, MPEG2, MPEG4, RM, WMV\r\nAudio FormatAAC, APE, FLAC, MP3, OGG, RM, WMA\r\nPhoto FormatGIF, JPEG, JPG, PNG\r\nSupport 5.1 Surround Sound OutputYes\r\nDual Wi-Fi2.4G/5.8G\r\nBluetooth Bluetooth4.0\r\nPower SupplyCharge\r\nAdapterInterface 3.5mm Audio, DC Power Port, HDMI, LAN, Reset Port, SD Card Slot, USB3.0\r\nLanguage Multi-language\r\nHDMI Version1.4\r\nOther Functions 3D Games,3D Video, Airplay, ISO Files, Miracast, NTSC\r\nPower Consumption12W\r\nRJ45 Port Speed1000M\r\nSystem Bit 64Bit\r\nWi-Fi Chip AP6234\r\nPower Type External Power Adapter Mode\r\nProduct Weight 197g\r\nProduct Size12 x 12 x 2.4 cm\r\n\r\nPackage Contents\r\n1 x Z83V Mini PC\r\n1 x Power Adapter\r\n1 x HDMI Cable\r\n1 x Manual\r\n1 x bracket        ', 14),
(24, 10, 'Vention [AACBJ 5M] Kabel HDMI 3D v2.0 4K UHD', 80000, 400, '15141361_abd3c588-c00e-472a-9683-4f3a9888134d_600_600.jpg', '*** 5 Meter AAC - Vention Kabel HDMI 3D v2.0 4K UHD High Speed Quality Original Product***\r\n\r\nKabel HDMI AAC adalah kabel HDMI v2.0 terbaru dari Vention, dengan peningkatan kualitas material dari versi sebelumnya (Improved), design leher yang lebih kokoh dan presisi\r\nmengusung design kepala yang baru, Gold Plated, mendukung tehnologi HDMI (4K) terbaru dengan transmisi gambar serta suara yang cepat dan berkualitas untuk menyempurnakan perangkat anda.\r\n\r\nFitur :\r\n- High Speed 18Gbps/60hz\r\n- 1080p, 3D v2.0, 4096x2160 (4K@60hz) Support, HDR\r\n- Ethernet Support\r\n\r\nSpesifikasi :\r\n- Lenght : 5 Meter\r\n- Connector Type : Standard HDMI Male-Male\r\n- Connector : 24k Gold Plated\r\n- Conductor : 28-30AWG, 99.99% Oxygen-Free Copper, Standard 19pin\r\n- Shielding : Aluminum Foil + Multi Shielded anti-jamming Material', 50),
(25, 10, 'LAN TO USB ORICO UTJ-U2 USB 2.0', 115000, 50, '6001039_99948897-b795-4f37-afaa-508acf0ff700_800_800.jfif', '            Spesifikasi : \r\n1.) Color : Black\r\n2.) Output Interface : RJ45 internet interface\r\n3.) Input Interface : USB2.0 Type-A\r\n4.) Power Supply : USB Power Input\r\n5.) Data Cable : About 10CM\r\n6.) Feature : Mini design of USB2.0 to Internet Interface\r\n\r\nSupport OS\r\nwin xp,7,8,10 and above\r\nlinux\r\nmac        ', 49),
(26, 10, 'Baseus USB Hub Adaptor Type C - USB 10CM', 210000, 100, '19256104_88d7f689-999b-4b0b-9dfb-a8fb7710bd94_800_800.jpg', '                        Spesifikasi\r\n\r\nMerek: Baseus\r\nBahan: Kawat ABS + TPE\r\nWarna: Hitam\r\nInput: USB 3.0 / Tipe-C\r\nOutput: USB 3.0 * 1 USB 2.0 * 3\r\nUSB3. 0 kecepatan transmisi: 5 Gbps\r\nDaya Micro 5V\r\nDukungan hard disk 4TB\r\n\r\nBerat Paket: 100 gr\r\nDimensi Paket: 19.4*9.1*3.5\r\n\r\nIsi Paket:\r\n1 x BASEUS HUB ADAPTOR\r\n\r\nGaransi: 6 bulan (Cacat pabrik, langsung ganti baru. kerusakan akibat penggunaâ€”â€”ã€‹garansi void)                ', 50),
(27, 11, 'Alcatroz PSU Magnum Pro 475X - Max Power 950watt', 479000, 2000, '30331860_01573dce-d221-4f5c-8421-3bd3a095064b_1024_1024.jfif', '            Alcatroz Magnum Pro 475X adalah PSU Magnum Pro Series yang dibuat untuk pengiriman daya yang stabil ke komputer Anda. Dibuat dari suku cadang berkualitas premium dan terjamin kualitasnya di Singapura, seri Magnum Pro adalah unit yang sangat handal. Sangat mudah untuk dipasanag dan memiliki berbagai macam kabel output untuk memastikan bahwa itu akan cocok dengan soket apapun. Magnum PSU adalah PSU dengan power yang dapat anda percaya, sempurna untuk komputer kantor maupun desktop khusus game.\r\n\r\nReal Power : 475W\r\nKabel + Konektor :\r\n- 1x Motherboard 20pin + 4pin konektor\r\n- 1x CPU 4pin + 4pin konektor\r\n- 1x 6 + 2pin PCI-E konektor\r\n- 5x SATA konektor\r\n- 4x HDD 4pin konektor\r\n\r\nSpesifikasi :\r\nVoltase Arus Frekuensi\r\nAC input 230VAC 6.3A 50Hz\r\nDC Output +3.3V +5V +12V1 +12V2 -12V +5VSB\r\nMax Output 20A 23A 27A 27A 0.5A 2A\r\n\r\nIsi Kemasan :\r\n1x Alcatroz PSU Magnum Pro 475X        ', 25),
(28, 11, 'Asrock A320M-HDV (AM4, AMD Promontory A320, DDR4, USB3.1, SATA3)', 749000, 900, '181632843_c2892a84-4b4b-4356-9d6c-bae7fa71ec43_500_500.jpg', 'Unique Feature\r\nASRock Super Alloy\r\n- High Density Glass Fabric PCB\r\n- Sapphire Black PCB\r\nASRock Ultra M.2 (PCIe Gen3 x4 & SATA3)\r\nASRock Full Spike Protection (for all USB, Audio, LAN Ports)\r\nASRock Live Update & APP Shop\r\nCPU\r\n- Supports AMD Socket AM4 A-Series APUs (Bristol Ridge) and Ryzen Series CPUs (Summit Ridge)\r\n- Digi Power design\r\n- 7 Power Phase design\r\n- Supports CPU up to 65W\r\nChipset\r\n- AMD Promontory A320\r\nMemory\r\n- Dual Channel DDR4 Memory Technology\r\n- 2 x DDR4 DIMM Slots\r\n- AMD Ryzen series CPUs support DDR4 3200+(OC)/2933(OC)/2667/2400/2133 ECC & non-ECC, un-buffered memory*\r\n- AMD 7th Gen A-Series APUs support DDR4 2400/2133 ECC & non-ECC, un-buffered memory**\r\n- Max. capacity of system memory: 32GB**\r\n- 15 Gold Contact in DIMM Slots***', 24),
(29, 11, 'RAM KINGSTON HYPER X FURY GAMING DDR3 4GB PC 12800 LONGDIMM', 225000, 100, 'a96df5de-0127-47f8-8342-2e6e13310835.jpg', 'Info produk :\r\n-kita JAMIN produk yang dibeli BARU dan ASLI hanya disini.\r\n-Garansi seumur hidup (lifetime warranty), RUSAK LANGSUNG GANTI UNIT SEUMUR HIDUP.\r\n-Pastikan Ram anda terdeteksi oleh CPU-Z!\r\n-GARANSI 100% CHIP ORI dan bukan REKONDISI / COPOTAN / KW2XAN.\r\n-Reputasi TOKO KAMI BINTANG 5.\r\n\r\nPERBEDAAN RAM ORIGINAL & RAM PALSU:\r\n-Gunakan aplikasi / software CPU-Z, perhatikan bagian MEMORY & MODULE MANUFACTURE. (Harus terbaca/ terdeteksi).\r\n-Module & Part number harus terdeteksi CPU-Z.\r\n-CPU-Z Terdeteksi (segala info mengenai ram terdapat pada CPU-Z, kalau tidak ada maka PALSU).', 24),
(30, 12, 'Corsair Mac Memory 16GB DDR3L SODIMM Memory CMSA16GX3M2A1600C11', 1250000, 200, '25364098_06e381f2-ffbb-4d2f-9dfb-d9e5d02fc324_339_339.jfif', 'Memori Mac CORSAIR, kit memori DDR3 16GB MHz untuk Apple iMac, MacBook, MacBook Pro, IMac dan Mac mini. Diuji di laboratorium kompatibilitas Apple untuk memastikan fungsionalitas dengan semua pertengahan 2011 dan sistem baru. Menambah memori sistem adalah salah satu cara paling efektif untuk meningkatkan kinerja secara keseluruhan dan Memori Mac Corsair menawarkan solusi yang teruji dengan garansi seumur hidup terbatas.\r\n\r\n\r\nWarranty\r\nLimited Lifetime\r\nFan Included\r\nNo\r\nHeat Spreader\r\n\r\nMemory Configuration\r\nDual Channel\r\nMemory Type\r\nDDR3L\r\nPackage Memory Format\r\nSODIMM\r\nPackage Memory Pin\r\n204\r\nPerformance Profile\r\nnone\r\nMemory Size\r\n16GB Kit (2 x 8GB)\r\nSPD Latency\r\n9-9-9-24\r\nSPD Speed\r\n1333MHz\r\nSPD Voltage\r\n1.35V / 1.5V\r\nSpeed Rating\r\nPC3-12800 (1600MHz)\r\nTested Latency\r\n11-11-11-30\r\nTested Speed\r\n1600MHz\r\nTested Voltage\r\n1.35V', 10),
(31, 12, 'Baterai Original Apple A1322 A1278 Macbook Pro 13\" 2009 2010 2011 2012', 490000, 500, '81977523_e88a127d-0222-4c4f-b02c-92085daec417_1024_1024.jfif', 'Kode baterai: A1322\r\nTipe: Li-Ion Polymer\r\nVoltage/Capacity: 10.95V - 5001mAh (63.5Wh)\r\nWarna: Hitam\r\nFree obeng termasuk dalam paket\r\nBaterai Original, Garansi 6 Bulan (Replace Unit)\r\n\r\nNote:\r\n- Pastikan seri Macbook dan Model Baterai yang digunakan sesuai\r\n- Pengiriman ke luar pulau gunakan Jasa Pengiriman JNE Reguler atau POS\r\n\r\nCompatible Battery Part:\r\nA1322\r\n020-6547-A, 020-6765-A\r\n661-5229, 661-5557', 25),
(32, 12, 'Keyboard Laptop Original Lenovo G40-30 G40-45 G40-70 G40-80', 75000, 400, '18854449_47c84f7b-edf7-4b35-ab00-9ddde4a7251d_500_500.jfif', 'Garansi 1 Bulan\r\n\r\nKeyboard Lenovo G40-30 G40-45 G40-70 G40-80', 14),
(33, 13, 'LAPTOP LENOVO IDEAPAD SLIM 3 - i5-1035G1 8GB 512GB MX330 2GB 14\" W10', 10099000, 3000, '5109002_102488ee-a2cc-47d3-a351-48cd84ea7b95_1024_1024.jfif', 'Processor Onboard : IntelÂ® Coreâ„¢ i5-1035G1 Processor 1.0 GHz (6M Cache, up to 3.6 GHz)\r\nDisplay : 14\" IPS FHD (1920 x 1080) Anti-Glare 250Nits\r\nMemori Standar : 8 GB DDR4 (4+4)\r\nHard Disk : SSD 512GB PCIeÂ® NVMeâ„¢ M.2 SSD\r\nTipe Grafis : VGA Card NVIDIA GeForce MX330 2GB DDR5, VRAM Graphics\r\nAudio : 2 x 2W stereo speakers with Dolby Audioâ„¢\r\nWebcam : 720p HD with Privacy shutter\r\nWireless Network : 1 x 1 AC WiFi + Bluetooth 4.2\r\n\r\nInterfaces\r\n2 x USB 3.1\r\n1x USB 2.0\r\n1x HDMI\r\n1x 4-in-1 SD card reader\r\n1x Headphone / mic combo\r\n1x DC jack\r\n\r\nSistem Operasi : Windows 10 Home + Office Home&Student 2019 Original\r\nBatery : 3 Cell Battery\r\nDimensi : 358 x 245 x 17.9 (mm)\r\nBerat : 1.79 Kg\r\n\r\nColour : Platinum Grey, Blue, Cherry Red, & Business Black\r\nFree : Bag\r\n\r\nGARANSI 2 Tahun RESMI LENOVO INDONESIA', 10),
(34, 13, 'LAPTOP ACER ASPIRE 5 A514-53 - i3-1005G1 4GB 512GB + OPTANE 14', 7399000, 3000, '16c16dc0-4e80-440d-8fa7-bf496924aa3f.jpg', '            Speksifikasi:\r\n- IntelÂ® Coreâ„¢ i3-1005G1 processor (4 MB Smart Cache, up to 3.40 GHz)\r\n- Windows 10 Home + Office HOME & STUDENT 2019 original PERMANEN\r\n- 14\" FHD 1920 x 1080 resolution Acer ComfyViewâ„¢\r\n- 4GB DDR4\r\n- 512GB SSD + Intel Optane\r\n- IntelÂ® UHD Graphics\r\n- BluetoothÂ® 5.0\r\n- HDMIÂ® port with HDCP support\r\n- IntelÂ® Wireless Wi-Fi 6 AX201, Dual Band (2.4 GHz and 5 GHz), 2x2 MU-MIMO technology\r\n- HD webcam with:\r\nâ€¢ 1280 x 720 resolution\r\nâ€¢ 720p HD audio/video recording\r\n- Two built-in stereo speakers\r\n\r\nHighlights :\r\n- Daya tahan batere 2 kali lebih lama dibandingkan notebook lain di kelasnya, dengan daya tahan hingga 14 jam pemakaian\r\n- 4X lebih cepat transfer speed vs HDD dengan latest Intel SSD Optane\r\n- 3X internet koneksi yg lebih cepat vs wifi 5 dengan penggunaan Wifi 6 dan juga di dukung Exo Amp Antenna untuk 360 derajat signal coverage\r\n- Stylish dan Attractive dengan new Magical Colour\r\n\r\nGARANS RESMI ACER INDONEISA 3 TAHUN (2 TAHUN FULL SPAREPART & SERVICE)\r\n        ', 9);

-- --------------------------------------------------------

--
-- Table structure for table `produk_foto`
--

CREATE TABLE `produk_foto` (
  `id_produk_foto` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk_foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk_foto`
--

INSERT INTO `produk_foto` (`id_produk_foto`, `id_produk`, `nama_produk_foto`) VALUES
(14, 16, 'camera.jfif'),
(15, 17, 'mouse logitec.jpg'),
(16, 18, 'vacum.jpg'),
(17, 19, '6667795_6f4403cd-5ac0-4d4b-809c-f3fb006de522_1000_1000.jpeg'),
(18, 20, '4fa8eac5-ee13-469c-9308-10d77764851f.jpg'),
(19, 21, '252625_9b5c68c7-f747-4d86-a1bf-79ffa7bba1a3_800_800.jfif'),
(20, 22, '5109002_cff98504-c2f3-4a9d-929d-cd83910c6688_1000_1000.jfif'),
(21, 23, '3677779_8e3d9e52-5549-44f4-962c-1ca53e23791f_600_600.jfif'),
(22, 24, '15141361_abd3c588-c00e-472a-9683-4f3a9888134d_600_600.jpg'),
(23, 25, '6001039_99948897-b795-4f37-afaa-508acf0ff700_800_800.jfif'),
(24, 26, '19256104_88d7f689-999b-4b0b-9dfb-a8fb7710bd94_800_800.jpg'),
(25, 27, '30331860_01573dce-d221-4f5c-8421-3bd3a095064b_1024_1024.jfif'),
(26, 28, '181632843_c2892a84-4b4b-4356-9d6c-bae7fa71ec43_500_500.jpg'),
(27, 29, 'a96df5de-0127-47f8-8342-2e6e13310835.jpg'),
(28, 30, '25364098_06e381f2-ffbb-4d2f-9dfb-d9e5d02fc324_339_339.jfif'),
(29, 31, '81977523_e88a127d-0222-4c4f-b02c-92085daec417_1024_1024.jfif'),
(30, 32, '18854449_47c84f7b-edf7-4b35-ab00-9ddde4a7251d_500_500.jfif'),
(31, 33, '5109002_102488ee-a2cc-47d3-a351-48cd84ea7b95_1024_1024.jfif'),
(32, 34, 'f02feb33-07a9-4c39-851d-a93859784065.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD KEY `nama_kategori` (`nama_kategori`);

--
-- Indexes for table `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`),
  ADD KEY `id_pembelian` (`id_pembelian`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `produk_foto`
--
ALTER TABLE `produk_foto`
  ADD PRIMARY KEY (`id_produk_foto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `produk_foto`
--
ALTER TABLE `produk_foto`
  MODIFY `id_produk_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
