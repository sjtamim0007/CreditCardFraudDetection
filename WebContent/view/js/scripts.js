
(function($) {
    $(document).ready(function() {

        /* ==========================================================================
         GENERIC
         ========================================================================== */

        /* allow only numbers on input fields  */
        $("input").on( "keyup", function() {
            $(this).val(this.value.match(/[0-9]*/));
        });

        /* preload some images */
        $('<img src="images/ad1.jpg" />');
        $('<img src="images/money.gif" />');

        /* generic function for redirection between tabs */
        function goTo(destination, time){
            setTimeout(function(){
                $('a[href="#' + destination + '"]').tab('show');
            },time)
        }

        var trial = 0; /* set tries variable  */

        /* when cancel button is clicked, redirect appropriately */
        $(".canceltransaction").on('click', function() {
            goTo('canceltransaction', 0);
        });


        // Javascript to enable link to tab
        if(window.location.hash != "") {
            $('.nav-tabs a[href="' + window.location.hash + '"]').tab('show');
        }

        // Change hash for page-reload
        $('.nav-tabs a').on('shown.bs.tab', function (e) {
            window.location.hash = e.target.hash.replace("#", "#");
        });

        /* back button or other internal link is clicked */
        $(".backbutton, .internal_link").on('click', function() {
            var backDestination = $(this).attr('href');
            $('.nav-tabs a[href="' + backDestination + '"]').tab('show');
        });


        /* ==========================================================================
         TAB 2 - enter PIN
         ========================================================================== */

        $('a[href="#pin"]').on('shown.bs.tab', function (e) {
            $("#pinfield").focus(); /* focus on the field when shown  */
        });

       

        /* ==========================================================================
         TAB 4 - fill input field
         ========================================================================== */

        // "other amount" form is submitted. There could be other validators here eg. allow only 20, 40, 60, 80
        // currently it will accept any kind of number but only 5 digits.
        $('#customamount form').submit(function(e) {
            e.preventDefault();
            if ($("#customamount input").val()) {
                goTo('preparing', 0);
            }
        });

        /* ==========================================================================
         TAB 5 - please wait
         ========================================================================== */

        /* transaction is being processed. Please wait :) */
        $('a[href="#preparing"]').on('shown.bs.tab', function (e) {
            goTo('showmethemoney', 5000);
        });

        /* ==========================================================================
         TAB 6 - get your money and your card
         ========================================================================== */

        /* thank you for using the ATM - take your money and card and redirect to homepage */
        $('a[href="#showmethemoney"]').on('shown.bs.tab', function (e) {
            goTo('home', 5000);
        });

        /* ==========================================================================
         TAB 7 - Cancel transaction
         ========================================================================== */

        /* screen to be visible only when transaction is cancelled because user wanted to or because PIN was mistaken for 3 times  */
        $('a[href="#canceltransaction"]').on('shown.bs.tab', function (e) {
            console.log('canc');
            trial = 0;
            goTo('home', 5000);
        });

    });
})(jQuery);