<?php
session_start();
include 'koneksi.php';

if (!isset($_SESSION['admin'])) {
    echo "<script>alert('Anda Harus Login');</script>";
    echo "<script>location='login.php';</script>";
    exit();
}
function tglIndonesia($str)
{
    $tr = trim($str);
    $str = str_replace(
        array('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'),
        array('Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum\'at', 'Sabtu', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'),
        $tr
    );
    return $str;
}
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Administrator | Buzz_Computer</title>
    <link rel="icon" type="image/x-icon" href="../foto/logobuzz.png" />
    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- MORRIS CHART STYLES-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
</head>

<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.php">Buzz Computer</a>
            </div>
            <div style="color: white; padding: 15px 20px 15px 20px; float: right;font-size: 16px;">
                <span style="margin-right:20px"><?php echo tglIndonesia(date('D, d F, Y')); ?></span>
            </div>
        </nav>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li class="text-center">
                        <img src="assets/img/logo.jpg" class="user-image img-responsive" />
                    </li>
                    <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
                    <li><a href="index.php?halaman=kategori"><i class="fa fa-book"></i> Kategori</a></li>
                    <li><a href="index.php?halaman=produk"><i class="fa fa-cube"></i> Produk</a></li>
                    <li><a href="index.php?halaman=pembelian"><i class="fa fa-shopping-cart"></i> Pembelian</a></li>
                    <li><a href="index.php?halaman=pelanggan"><i class="fa fa-users"></i> Pelanggan</a></li>
                    <li><a href="index.php?halaman=logout"><i class="fa fa-sign-out"></i> Logout</a></li>
                </ul>
            </div>
        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <?php
                if (isset($_GET['halaman'])) {
                    if ($_GET['halaman'] == "kategori") {
                        include 'kategori.php';
                    } else if ($_GET['halaman'] == "produk") {
                        include 'produk.php';
                    } else if ($_GET['halaman'] == "pembelian") {
                        include 'pembelian.php';
                    } else if ($_GET['halaman'] == "pelanggan") {
                        include 'pelanggan.php';
                    } else if ($_GET['halaman'] == "detail") {
                        include 'detail.php';
                    } else if ($_GET['halaman'] == "tambahkategori") {
                        include 'tambahkategori.php';
                    } else if ($_GET['halaman'] == "hapuskategori") {
                        include 'hapuskategori.php';
                    } else if ($_GET['halaman'] == "ubahkategori") {
                        include 'ubahkategori.php';
                    } else if ($_GET['halaman'] == "tambahproduk") {
                        include 'tambahproduk.php';
                    } else if ($_GET['halaman'] == "hapusproduk") {
                        include 'hapusproduk.php';
                    } else if ($_GET['halaman'] == "ubahproduk") {
                        include 'ubahproduk.php';
                    } else if ($_GET['halaman'] == "hapuspelanggan") {
                        include 'hapuspelanggan.php';
                    } else if ($_GET['halaman'] == "hapuspembelian") {
                        include 'hapuspembelian.php';
                    } else if ($_GET['halaman'] == "logout") {
                        include 'logout.php';
                    } else if ($_GET['halaman'] == "pembayaran") {
                        include 'pembayaran.php';
                    } else if ($_GET['halaman'] == "detailproduk") {
                        include 'detailproduk.php';
                    } else if ($_GET['halaman'] == "hapusfotoproduk") {
                        include 'hapusfotoproduk.php';
                    }
                } else {
                    include 'home.php';
                }
                ?>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->

    <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
    <!-- MORRIS CHART SCRIPTS -->
    <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>


</body>

</html>