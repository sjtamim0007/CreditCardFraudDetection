<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
    <title>ATM</title>
    <link rel="icon" href="images/bank.ico">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <style><%@ include file="css/style.css"%></style>
</head>
<body onload="myFunction()" style="margin:0;">


    <div class="container-fluid">

        <!-- Nav tabs. These stay hidden -->
     

        <!-- Tab panes -->
        <div class="tab-content text-center">

            


            <!--TAB 2 - enter PIN-->

            <!--TAB 5 - please wait-->
            <div id="preparing">

                <h2><i class="fa fa-spinner fa-spin"></i> Please wait while we process your transaction</h2>

                
            </div>

            <div style="display:none;" id="canceltransaction" class="animate-bottom">

                <h2>Transaction cancelled. Please get your card.</h2>

            </div>

<a class="btn-lg btn-default canceltransaction" href="view/logout.jsp"><i class="fa fa-times"></i> LOG OUT</a>
    <script>
        var myVar;

        function myFunction() {
            myVar = setTimeout(showPage, 3000);
        }

        function showPage() {
          document.getElementById("preparing").style.display = "none";
          document.getElementById("canceltransaction").style.display = "block";
        }
    </script>

 <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</body>
</html>
