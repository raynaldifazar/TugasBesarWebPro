<?php
session_start();
include 'koneksi.php';

//jika tidak ada session (blm login)
if (!isset($_SESSION["pelanggan"]) or empty($_SESSION["pelanggan"])) {
    echo "<script>alert('Silahkan login terlebih dahulu');</script>";
    echo "<script>location='login.php';</script>";
    exit();
}

?>

<!DOCTYPE html>
<html>

<head>
    <title>Riwayat Belanja</title>
    <link rel="icon" type="image/x-icon" href="foto/logobuzz.png" />
    <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
</head>

<body>

    <?php include 'menu.php' ?>;

    <section class="riwayat">
        <div class="container">
            <h3>Riwayat Belanja <u><b><?php echo $_SESSION["pelanggan"]["nama_pelanggan"] ?></b></u></h3>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Tanggal</th>
                        <th>Status</th>
                        <th>Total</th>
                        <th>Opsi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    //mendapatkan id pelanggan yg login dari session
                    $nomor = 1;
                    $id_pelanggan = $_SESSION["pelanggan"]["id_pelanggan"];
                    $ambil = $koneksi->query("SELECT * FROM pembelian WHERE id_pelanggan='$id_pelanggan'");
                    while ($pecah = $ambil->fetch_assoc()) {
                    ?>
                        <tr>
                            <td><?php echo $nomor; ?></td>
                            <td><?php echo date("d F Y", strtotime($pecah["tanggal_pembelian"])); ?></td>
                            <td>
                                <?php echo $pecah["status_pembelian"] ?>
                                <br>
                                <?php if (!empty($pecah['resi_pengiriman'])) : ?>
                                    No. Resi : <?php echo $pecah['resi_pengiriman']; ?>
                                <?php endif ?>
                            </td>
                            <td>Rp. <?php echo number_format($pecah["total_pembelian"]) ?></td>
                            <td>
                                <a href="nota.php?id=<?php echo $pecah["id_pembelian"] ?>" class="btn btn-info">Nota</a>

                                <?php if ($pecah['status_pembelian'] == "Belum Dibayar") : ?>
                                    <a href="pembayaran.php?id=<?php echo $pecah["id_pembelian"] ?>" class="btn btn-primary">Konfirmasi Pembayaran</a>
                                <?php else : ?>
                                    <a href="lihatpembayaran.php?id=<?php echo $pecah["id_pembelian"] ?>" class="btn btn-warning">Lihat Pembayaran</a>
                                <?php endif ?>
                            </td>
                        </tr>
                        <?php $nomor++; ?>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </section>

</body>

</html>