<?php
$ekspedisi = $_POST["ekspedisi"];
$distrik = $_POST["distrik"];
$berat = $_POST["berat"];
$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "https://api.rajaongkir.com/starter/cost",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => "origin=501&destination=" . $distrik . "&weight=" . $berat . "&courier=" . $ekspedisi,
  CURLOPT_HTTPHEADER => array(
    "content-type: application/x-www-form-urlencoded",
    "key: 62f7ca7158b1641efb6f3cf0e63821f5"
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {

  //masih dalam bentuk json
  //echo $response;

  //konversi menjadi array agar bisa dipakai oleh php
  $array_response = json_decode($response, TRUE);
  $paket = $array_response["rajaongkir"]["results"]["0"]["costs"];

  //echo "<pre>";
  //print_r ($paket);
  //echo "</pre>";

  echo "<option value=''>- Pilih Paket -</option>";
  foreach ($paket as $key => $tiap_paket) {
    echo "<option 
      paket='" . $tiap_paket['service'] . "' 
      ongkir='" . $tiap_paket["cost"]["0"]["value"] . "' 
      etd='" . $tiap_paket["cost"]["0"]["etd"] . "' >";
    echo $tiap_paket["service"] . " ";
    echo number_format($tiap_paket["cost"]["0"]["value"]) . " ";
    echo $tiap_paket["cost"]["0"]["etd"];
    echo "</option>";
  }
}
