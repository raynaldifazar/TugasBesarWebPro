<?php
session_start();
include 'koneksi.php';
?>

<!DOCTYPE html>
<html>

<head>
    <title>Nota Pembelian</title>
    <link rel="icon" type="image/x-icon" href="foto/logobuzz.png" />
    <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
</head>

<body>

    <?php include 'menu.php' ?>;

    <section class="konten">
        <div class="container">
            <h2><strong><u>Detail Nota Pembelian</u></strong></h2>

            <?php
            $ambil = $koneksi->query("SELECT * FROM pembelian JOIN pelanggan
            ON pembelian.id_pelanggan=pelanggan.id_pelanggan
            WHERE pembelian.id_pembelian='$_GET[id]'");
            $detail = $ambil->fetch_assoc();

            $idpelangganyangbeli = $detail["id_pelanggan"];
            $idpelangganyanglogin = $_SESSION["pelanggan"]["id_pelanggan"];

            if ($idpelangganyangbeli !== $idpelangganyanglogin) {
                echo "<script>alert('Hayo ngapain ke orderan orang !');</script>";
                echo "<script>location='riwayat.php';</script>";
                exit();
            }
            ?>


            <div class="row">
                <div class="col-md-4">
                    <h3>Pembelian</h3>
                    <strong>No. Pembelian : <?php echo $detail['id_pembelian']; ?></strong><br>
                    Tanggal : <?php echo date("d F Y", strtotime($detail['tanggal_pembelian'])); ?><br>
                    Total : Rp. <?php echo number_format($detail['total_pembelian']); ?>
                </div>
                <div class="col-md-4">
                    <h3>Pelanggan</h3>
                    <strong><?php echo $detail['nama_pelanggan']; ?></strong><br>
                    <p>
                        <?php echo $detail['telepon_pelanggan']; ?> <br>
                        <?php echo $detail['email_pelanggan']; ?>
                    </p>
                </div>
                <div class="col-md-4">
                    <h3>Pengiriman</h3>
                    <strong><?php echo $detail['tipe']; ?> <?php echo $detail['distrik']; ?>, <?php echo $detail['provinsi']; ?></strong><br>
                    <?php echo $detail['alamat_pengiriman']; ?> <br>
                    Ekspedisi : <?php echo $detail['ekspedisi']; ?> <?php echo $detail['paket']; ?> <?php echo $detail['estimasi']; ?><br>
                    Ongkos Kirim : Rp. <?php echo number_format($detail['ongkir']); ?>
                </div>
            </div>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Produk</th>
                        <th>Harga</th>
                        <th>Berat</th>
                        <th>Jumlah</th>
                        <th>Subberat</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $nomor = 1; ?>
                    <?php $totalbelanja = 0; ?>
                    <?php $ambil = $koneksi->query("SELECT * FROM pembelian_produk WHERE id_pembelian='$_GET[id]'"); ?>
                    <?php while ($pecah = $ambil->fetch_assoc()) { ?>
                        <tr>
                            <td><?php echo $nomor; ?></td>
                            <td><?php echo $pecah['nama']; ?></td>
                            <td>Rp. <?php echo number_format($pecah['harga']); ?></td>
                            <td><?php echo $pecah['berat']; ?> gr</td>
                            <td><?php echo $pecah['jumlah']; ?></td>
                            <td><?php echo $pecah['subberat']; ?> gr</td>
                            <td>Rp. <?php echo number_format($pecah['subharga']); ?></td>
                        </tr>
                        <?php $nomor++; ?>
                        <?php $totalbelanja += $pecah['subharga']; ?>
                    <?php } ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="6">Total Belanja</th>
                        <th>Rp. <?php echo number_format($totalbelanja) ?></th>
                    </tr>
                    <tr>
                        <th colspan="6">Ongkos Kirim</th>
                        <th>Rp. <?php echo number_format($detail['ongkir']) ?></th>
                    </tr>
                    <tr>
                        <th colspan="6">Total Bayar</th>
                        <th>Rp. <?php echo number_format($detail['total_pembelian']) ?></th>
                    </tr>
                </tfoot>
            </table>

            <div class="row">
                <div class="col-md-7">
                    <div class="alert alert-info">
                        <p><strong>
                                Silahkan melakukan pembayaran Rp. <?php echo number_format($detail['total_pembelian']); ?> ke Rekening Berikut : <br>
                                <strong><br>
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>
                                                <center>Nama Bank</center>
                                            </th>
                                            <th>
                                                <center>No Rekening</center>
                                            </th>
                                            <th>
                                                <center>Atas Nama</center>
                                            </th>
                                        </tr>
                                        <tr>
                                            <td>BANK BCA</td>
                                            <td>120-2333-22</td>
                                            <td>Bazz Computer</td>
                                        </tr>
                                        <tr>
                                            <td>BANK BNI</td>
                                            <td>829-212334</td>
                                            <td>Bazz Computer</td>
                                        </tr>
                                        <tr>
                                            <td>BANK MANDIRI</td>
                                            <td>324-322222-1223</td>
                                            <td>Bazz Computer</td>
                                        </tr>
                                    </table>
                                </strong>
                        </p>
                    </div>
                </div>
            </div>

        </div>
    </section>

</body>
</head>