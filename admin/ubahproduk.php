<h2>Ubah Produk</h2>

<?php
$ambil = $koneksi->query("SELECT * FROM produk WHERE id_produk='$_GET[id]'");
$pecah = $ambil->fetch_assoc();

//echo "<pre>";
//print_r($pecah);
//echo "</pre>";
?>

<form method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label>Nama Produk</label>
        <input type="text" class="form-control" name="nama" value="<?php echo $pecah['nama_produk']; ?>">
    </div>
    <div class="form-group">
        <label for="kategori">Kategori Produk</label>
        <select name="id_kategori" id="kategori" class="form-control" required>
            <option value="">- Pilih -</option>
            <?php
            $ambil = $koneksi->query("SELECT * FROM kategori")
            ?>
            <?php while ($pecah = $ambil->fetch_assoc()) { ?>
                <option value="<?php echo $pecah['id_kategori'] ?>"><?php echo $pecah['nama_kategori'] ?></option>;
            <?php
            } ?>
        </select>
    </div>
    <?php
    $ambil = $koneksi->query("SELECT * FROM produk WHERE id_produk='$_GET[id]'");
    $pecah = $ambil->fetch_assoc();
    ?>
    <div class="form-group">
        <label>Harga</label>
        <input type="number" class="form-control" name="harga" value="<?php echo $pecah['harga_produk']; ?>">
    </div>
    <div class="form-group">
        <label>Berat</label>
        <input type="number" class="form-control" name="berat" value="<?php echo $pecah['berat_produk']; ?>">
    </div>
    <div class="form-group">
        <img src="../foto_produk/<?php echo $pecah['foto_produk'] ?>" width="200">
    </div>
    <div class="form-group">
        <label>Ganti Foto</label>
        <input type="file" class="form-control" name="foto">
    </div>
    <div class="form-group">
        <label>Deskripsi</label>
        <textarea class="form-control" name="deskripsi" rows="5">
            <?php echo $pecah['deskripsi_produk']; ?>
        </textarea>
    </div>
    <div class="form-group">
        <label>Stok</label>
        <input type="number" class="form-control" name="stok" value="<?php echo $pecah['stok_produk']; ?>">
    </div>
    <button class="btn btn-primary" name="ubah">Simpan Perubahan</button>
</form>

<?php
if (isset($_POST['ubah'])) {
    $namafoto = $_FILES['foto']['name'];
    $lokasifoto = $_FILES['foto']['tmp_name'];

    if (!empty($lokasifoto)) {
        move_uploaded_file($lokasifoto, "../foto_produk/$namafoto");

        $koneksi->query("UPDATE produk SET nama_produk='$_POST[nama]', id_kategori='$_POST[id_kategori]',
        harga_produk='$_POST[harga]', berat_produk='$_POST[berat]', foto_produk='$namafoto',
        deskripsi_produk='$_POST[deskripsi]',stok_produk='$_POST[stok]' 
        WHERE id_produk='$_GET[id]'");
    } else {
        $koneksi->query("UPDATE produk SET nama_produk='$_POST[nama]', id_kategori='$_POST[id_kategori]',
        harga_produk='$_POST[harga]', berat_produk='$_POST[berat]', deskripsi_produk='$_POST[deskripsi]',
        stok_produk='$_POST[stok]' WHERE id_produk='$_GET[id]'");
    }
    echo "<script>alert('Data Produk Berhasil Diubah');</script>";
    echo "<script>location='index.php?halaman=produk';</script>";
}
?>