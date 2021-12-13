<h2>Tambah Produk</h2>

<form method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label>Nama Produk</label>
        <input type="text" class="form-control" name="nama">
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
    <div class="form-group">
        <label>Harga</label>
        <input type="number" class="form-control" name="harga">
    </div>
    <div class="form-group">
        <label>Berat</label>
        <input type="number" class="form-control" name="berat">
    </div>
    <div class="form-group">
        <label>Deskripsi</label>
        <textarea class="form-control" name="deskripsi" rows="5"></textarea>
    </div>
    <div class="form-group">
        <label>Foto</label>
        <div class="letak-input" style="margin-bottom: 10px">
            <input type="file" class="form-control" name="foto[]">
        </div>
    </div>
    <div class="form-group">
        <label>Stok</label>
        <input type="number" class="form-control" name="stok" min="1">
    </div>
    <button class="btn btn-primary" name="save">Simpan</button>
</form>

<?php
if (isset($_POST['save'])) {
    //$namanamafoto = $_FILES['foto']['name'];
    //$lokasilokasifoto = $_FILES['foto']['tmp_name'];
    //move_uploaded_file($lokasilokasifoto[0], "../foto_produk/" .$namanamafoto[0]);
    //$koneksi->query("INSERT INTO produk (nama_produk,id_kategori,harga_produk,berat_produk,foto_produk,
    //    deskripsi_produk,stok_produk) VALUES ('$_POST[nama]','$_POST[id_kategori]','$_POST[harga]',
    //    '$_POST[berat]','$namanamafoto[0]','$_POST[deskripsi]','$_POST[stok]')");

    //mendapatkan id_produk barusan
    //$id_produk_barusan = $koneksi->insert_id;

    //foreach ($namanamafoto as $key => $tiap_nama) 
    //{
    //    $tiap_lokasi = $lokasilokasifoto[$key];

    //    move_uploaded_file($tiap_lokasi, "../foto_produk/".$tiap_nama);

    //    //simpan di mysql (tapi kita perlu tau id_produknya berapa)
    //    $koneksi->query("INSERT INTO produk_foto (id_produk,nama_produk_foto)
    //        VALUES ('$id_produk_barusan','$tiap_nama')");
    //}

    $nama  = $_POST['nama'];
    $kategori = $_POST['id_kategori'];
    $harga  = $_POST['harga'];
    $berat  = $_POST['berat'];
    $deskripsi  = $_POST['deskripsi'];
    $stok = $_POST['stok'];
    $namanamafoto = $_FILES['foto']['name'];
    $lokasilokasifoto = $_FILES['foto']['tmp_name'];
    move_uploaded_file($lokasilokasifoto[0], "../foto_produk/" . $namanamafoto[0]);
    $mysqli  = "INSERT INTO produk (nama_produk,id_kategori,harga_produk,berat_produk,deskripsi_produk,foto_produk,stok_produk) 
        VALUES ('$nama', '$kategori', '$harga', '$berat', '$deskripsi','$namanamafoto[0]','$stok')";
    $result  = mysqli_query($koneksi, $mysqli);

    //mendapatkan id_produk barusan
    $id_produk_barusan = $koneksi->insert_id;

    foreach ($namanamafoto as $key => $tiap_nama) {
        $tiap_lokasi = $lokasilokasifoto[$key];

        move_uploaded_file($tiap_lokasi, "../foto_produk/" . $tiap_nama);

        //simpan di mysql (tapi kita perlu tau id_produknya berapa)
        $koneksi->query("INSERT INTO produk_foto (id_produk,nama_produk_foto)
            VALUES ('$id_produk_barusan','$tiap_nama')");
    }

    if ($result) {
        echo "<div class='alert alert-info'>Data Produk Tersimpan</div>";
        echo "<meta http-equiv='refresh' content='1;url=index.php?halaman=produk'>";
    } else {
        echo "<div class='alert alert-info'>Input Produk Gagal</div>";
    }
    mysqli_close($koneksi);

    echo "<pre>";
    print_r($_FILES["foto"]);
    echo "</pre>";
}
?>

<script>
    $(document).ready(function() {
        $(".btn-tambah").on("click", function() {
            $(".letak-input").append("<input type='file' class='form-control' name='foto[]'>");
        })
    })
</script>