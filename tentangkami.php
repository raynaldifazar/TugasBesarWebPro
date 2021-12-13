<?php
session_start();
include 'koneksi.php';

?>

<!DOCTYPE html>
<html>

<head>
    <title>Tentang Kami</title>
    <link rel="icon" type="image/x-icon" href="foto/logobuzz.png" />
    <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
    <link rel="stylesheet" href="admin/assets/css/style.css">
</head>

<body>

    <?php include 'menu.php' ?>;

    <section class="about-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-5 col-md-12">
                    <div class="about-image">
                        <img src="foto/logobuzz.png" alt="About us" class="img-responsive">
                        <br>
                        <br>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 about-title">
                    <h2 class="text-uppercase pt-5">
                        <span>Let me</span>
                        <span>introduce</span>
                        <span>bazzcomputer</span>
                    </h2>
                    <br>
                    <h4>
                        <b>About</b>
                        <br>
                        Sebagai salah satu pelopor online shopping, BAZZCOMPUTER berkomitmen memberikan pengalaman berbelanja
                        online yang aman, nyaman, mudah, menyenangkan, dimana saja dan kapan saja
                        <br><br>
                        <b>Koleksi lengkap untuk semua kebutuhan Anda</b>
                        <br>
                        Menghadirkan ribuan produk IT pilihan dapat dilihat dari kategori yang tersusun sistematis mulai dari
                        kategori Desktop & Laptop, Office Equipment, Peripheral, Gadget & Tablets, Camera & Audio dan Server
                        & Networks.
                    </h4>
                    <br>
                    <div class="paragraph py-4 w-75">
                        <p class="para">
                            <b>BAZZCOMPUTER</b> merupakan salah satu pelopor toko online di Indonesia. Seiring berkembangnya teknologi,
                            semakin banyak aktivitas yang dilakukan secara digital, lebih mudah dan praktis, termasuk kegiatan
                            pembelian yang kini semakin marak dilakukan secara digital, baik melalui komputer, laptop, hingga
                            smartphone yang bisa diakses kapan saja dan di mana saja. <b>BAZZCOMPUTER</b> hadir memberikan pengalaman
                            berbelanja online yang aman, nyaman, mudah, dan menyenangkan serta dapat dilakukan dimana saja dan
                            kapan saja.
                            <br><br>
                            Menawarkan solusi untuk masyarakat Indonesia dapat menikmati berbagai kemudahan dalam berbelanja online
                            dengan menyediakan website yang mudah digunakan serta sistem pembayaran online yang lengkap. Kami
                            menjamin kenyamanan anda ketika anda mencari produk yang sedang anda cari serta menjamin opsi
                            pembayaran yang aman. Pilihan pembayaran kami termasuk Credit Card Fraud Detection System, Bank
                            Transfer, Mobile Banking dan berbagai layanan pembayaran online lainnya.
                            <br><br>
                            Kualitas Terbaik dan Terjamin untuk semua produk yang ada di <b>BAZZCOMPUTER</b>. Berbagai produk yang hadir di
                            <b>BAZZCOMPUTER</b> berasal dari Brand Terpercaya sehingga kualitasnya sangat terjamin. Beberapa brand
                            terpercaya tersebut antara lain <b>Cozistyle, Momax, Brother, Samsung, Apple, ASUS, Canon, HP,
                                Fuji Xerox, Lenovo, Lexmark, Griffin, DELL, Tucano, Micropack, Panasonic, Kingston, Seagate,
                                Logitech, Catalyst, XL, Epson, Xoopar.</b> Seluruh produk yang tersedia di <b>BAZZCOMPUTER</b> merupakan produk
                            original.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>

</html>

<?php
include 'footer.php';
?>