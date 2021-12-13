<?php
session_start();
include 'koneksi.php';
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="icon" type="image/x-icon" href="foto/logobuzz.png" />
    <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
</head>
<body>

<?php include 'menu.php' ?>;

<br>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><center>Login Pelanggan</center></h3>
                    </div>
                    <div class="panel-body">
                        <form method="post">
                            <div>
                                <label>Email</label>
                                <input type="text" class="form-control" name="email">
                            </div>
                            <div>
                                <label>Password</label>
                                <input type="password" class="form-control" name="password">
                            </div><br>
                            <button class="btn btn-primary" name="login">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<?php
//jika ada tombol login (tombol login ditekan)
if (isset($_POST["login"])) 
{
    $email = $_POST["email"];
    $password = $_POST["password"];
    
    //lakukan query ngecek akun di tabel pelanggan di db
    $ambil = $koneksi->query("SELECT * FROM pelanggan
        WHERE email_pelanggan='$email' AND password_pelanggan='$password'");

    //menghitung akun yg terambil
    $akunyangcocok = $ambil->num_rows;

    //jika 1 akun yang cocok, maka diloginkan
    if ($akunyangcocok==1)
    {
        //anda sukses login
        //mendapatkan akun dalam bentuk array
        $akun = $ambil->fetch_assoc();
        //simpan di session pelanggan
        $_SESSION["pelanggan"] = $akun;
        echo "<script>alert('Login Sukses'); </script>";

        //jika sudah belanja
        if (isset($_SESSION["keranjang"]) OR !empty($_SESSION["keranjang"])) 
        {
            echo "<script>location='checkout.php'; </script>";
        }
        else {
            echo "<script>location='riwayat.php'; </script>";
        }
    }  
    else 
    {
        //anda gagal login
        echo "<script>alert('Login gagal, periksa kembali email dan password'); </script>";
        echo "<script>location='login.php'; </script>";
    }
}
?>
</body>
</html>