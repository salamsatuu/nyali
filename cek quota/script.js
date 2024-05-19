// script.js
$(document).ready(function () {
    // Toggle Dark Mode and Light Mode
    $('#toggleMode').click(function () {
        $('body').toggleClass('dark-mode light-mode');
        $('.card').toggleClass('dark-mode light-mode');
        $('.navbar').toggleClass('navbar-light-mode navbar-dark-mode');
        // Update the text of the button based on the current mode
        var modeText = $('body').hasClass('dark-mode') ? 'Light Mode' : 'Dark Mode';
        $('#toggleMode').text(modeText);
    });

    // Check Quota Details
    $('#submitCekKuota').click(function (e) {
        e.preventDefault(); // Prevent the default form submission
        var msisdn = $('#msisdn').val();
        // Validate the input number
        if (msisdn.length >= 10 && msisdn.length <= 16 && $.isNumeric(msisdn)) {
            // Here you would make an AJAX call to your server to check the quota
            // For demonstration, we'll just show a placeholder message
            $('#hasilnya').text('Detail kuota akan ditampilkan di sini.');
        } else {
            // Display an error message if the number is not valid
            $('#hasilnya').text('Silakan masukkan nomor XL yang valid.');
        }
    });
});
