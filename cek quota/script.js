// script.js
$(document).ready(function () {
    // Toggle Dark Mode
    $('#toggleMode').click(function () {
        $('body').toggleClass('dark-mode light-mode');
        $('.card').toggleClass('dark-mode light-mode');
        $('.navbar').toggleClass('navbar-light-mode navbar-dark-mode');
        // Update the text of the button based on the current mode
        if ($('body').hasClass('dark-mode')) {
            $('#toggleMode').text('Light Mode');
        } else {
            $('#toggleMode').text('Dark Mode');
        }
    });

    // Form Submission and Input Validation
    $('#submitCekKuota').click(function (e) {
        e.preventDefault(); // Prevent the default form submission
        var msisdn = $('#msisdn').val();
        // Check if the number is valid (example validation, adjust as needed)
        if (msisdn.length >= 10 && msisdn.length <= 16 && $.isNumeric(msisdn)) {
            // Perform the quota check here
            $('#hasilnya').text('Checking quota...');
            // Simulate an API call with a timeout
            setTimeout(function() {
                $('#hasilnya').text('Quota details will be displayed here.');
            }, 2000);
        } else {
            // Display an error message
            $('#hasilnya').text('Please enter a valid XL number.');
        }
    });
});
