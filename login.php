<?php
// Koneksi ke database (gantilah dengan informasi koneksi sesuai kebutuhan)
$servername = "http://xlordstore.com/tes.html";
$username = "user";
$password = "user";
$dbname = "xlordstore.com";

$conn = new mysqli($servername, $username, $password, $dbname);

// Periksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Fungsi untuk memeriksa login
function cekLogin($username, $password, $conn) {
    $username = mysqli_real_escape_string($conn, $username);
    $password = mysqli_real_escape_string($conn, $password);

    // Query untuk memeriksa login
    $query = "SELECT * FROM users WHERE username='$username' AND password='$password'";
    $result = $conn->query($query);

    if ($result->num_rows == 1) {
        // Login berhasil
        return true;
    } else {
        // Login gagal
        return false;
    }
}

// Contoh penggunaan fungsi cekLogin
if (isset($_POST['submit'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if (cekLogin($username, $password, $conn)) {
        echo "Login berhasil!";
        // Lakukan tindakan setelah login berhasil
    } else {
        echo "Login gagal. Periksa kembali username dan password.";
    }
}

$conn->close();
?>
