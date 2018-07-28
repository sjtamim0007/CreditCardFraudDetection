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

           <div class="container-fluid">

        <!-- Nav tabs. These stay hidden -->
        <ul class="nav nav-tabs nav-justified hide" role="tablist">
            <li role="presentation"><a href="#canceltransaction" aria-controls="canceltransaction" role="tab" data-toggle="tab">Cancel</a></li>
        </ul>
        
 		
			<div style="display:none;" id="customamount" class="animate-bottom">
				<div class="tab-content text-center">
                <h2>Please enter your secret code</h2>

                <form action="${pageContext.request.contextPath}/SecurityServlet" method="post" class="form-inline" autocomplete="off">
                <input type="hidden" name="userName" value="<%=request.getAttribute("userName")%>">
                <input type="hidden" name="amount" value="<%=request.getAttribute("amount")%>">
                    <div class="form-group">
                        <input type="password" name="answer2" maxlength="5" autocomplete="off" class="form-control input-lg" id="amount">
                    </div>
                    <button type="submit" class="btn btn-default btn-lg">Confirm</button>
                    <button type="reset" class="btn btn-lg btn-link">Reset</button>
                </form>

                <a class="btn btn-lg btn-default canceltransaction"><i class="fa fa-times"></i> CANCEL TRANSACTION</a>

            </div>
        </div>


    <script>
        var myVar;

        function myFunction() {
            myVar = setTimeout(showPage, 3000);
        }

        function showPage() {
          document.getElementById("preparing").style.display = "none";
          document.getElementById("customamount").style.display = "block";
        }
    </script>

 <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</body>
</html>
