<h2>Data Pembelian</h2>

<table class="table table-bordered">
    <tread>
        <tr>
            <th>No</th>
            <th>Nama Pelanggan</th>
            <th>Tanggal</th>
            <th>Status Pembayaran</th>
            <th>Total</th>
            <th>Aksi</th>
        </tr>
    </tread>
    <tbody>
        <?php $nomor = 1; ?>
        <?php $ambil = $koneksi->query("SELECT * FROM pembelian INNER JOIN pelanggan ON pembelian.id_pelanggan=pelanggan.id_pelanggan"); ?>
        <?php while ($pecah = $ambil->fetch_assoc()) { ?>
            <tr>
                <td><?php echo $nomor; ?></td>
                <td><?php echo $pecah['nama_pelanggan']; ?></td>
                <td><?php echo date("d F Y", strtotime($pecah['tanggal_pembelian'])); ?></td>
                <td><?php echo $pecah['status_pembelian']; ?></td>
                <td>Rp. <?php echo number_format($pecah['total_pembelian']); ?></td>
                <td>
                    <a href="index.php?halaman=detail&id=<?php echo $pecah['id_pembelian']; ?>" class="btn btn-info">Detail Pembelian</a>
                    <?php if ($pecah['status_pembelian'] !== "Pending") : ?>
                        <a href="index.php?halaman=pembayaran&id=<?php echo $pecah['id_pembelian'] ?>" class="btn btn-success">Konfirmasi</a>
                    <?php endif ?>
                    <a href="index.php?halaman=hapuspembelian&id=<?php echo $pecah['id_pembelian']; ?>" class="btn btn-danger" onclick="return confirm('Yakin Hapus?')">Hapus</a>
                </td>
            </tr>
            <?php $nomor++; ?>
        <?php } ?>
    </tbody>
</table>