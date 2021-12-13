<?php
$id_produk = $_GET["id"];

$ambil = $koneksi->query("SELECT * FROM produk LEFT JOIN kategori 
    ON produk.id_kategori=kategori.id_kategori WHERE id_produk='$id_produk'");
$detailproduk = $ambil->fetch_assoc();


$fotoproduk = array();
$ambilfoto = $koneksi->query("SELECT * FROM produk_foto WHERE id_produk='$id_produk'");
while ($tiap = $ambilfoto->fetch_assoc()) {
    $fotoproduk[] = $tiap;
}

//echo "<pre>";
//print_r($detailproduk);
//print_r($fotoproduk);
//echo "</pre>";
?>

<h2>Detail Produk</h2>
<hr>

<table class="table">
    <tr>
        <th>Nama Produk</th>
        <th><?php echo $detailproduk["nama_produk"]; ?></th>
    </tr>
    <tr>
        <th>Kategori</th>
        <th><?php echo $detailproduk["nama_kategori"]; ?></th>
    </tr>
    <tr>
        <th>Harga</th>
        <th>Rp. <?php echo number_format($detailproduk["harga_produk"]); ?></th>
    </tr>
    <tr>
        <th>Berat</th>
        <th><?php echo $detailproduk["berat_produk"]; ?> gr</th>
    </tr>
    <tr>
        <th>Stok</th>
        <th><?php echo $detailproduk["stok_produk"]; ?></th>
    </tr>
    <tr>
        <th>Deskripsi</th>
        <th><?php echo $detailproduk["deskripsi_produk"]; ?></th>
    </tr>
</table>

<div class="row">
    <?php foreach ($fotoproduk as $key => $value) : ?>
        <div class="col-md-3 text-center">
            <img src="../foto_produk/<?php echo $value["nama_produk_foto"] ?>" alt="" class="img-responsive"><br>
        </div>
    <?php endforeach ?>
</div>

<hr>

<form method="post" enctype="multipart/form-data">
    <button class="btn btn-primary" name="kembali" value="kembali">kembali</button>
</form>

<?php
if (isset($_POST["kembali"])) {
    echo "<script>location='index.php?halaman=produk&id=$id_produk';</script>";
}
?>