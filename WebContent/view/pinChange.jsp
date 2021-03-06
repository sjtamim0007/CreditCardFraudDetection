<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Pin Change</title>
    <link rel="icon" href="images/bank.ico">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <style><%@ include file="css/pinChange.css"%></style>
</head>
<body>
	<div class="container-fluid">

        <!-- Nav tabs. These stay hidden -->
        <ul class="nav nav-tabs nav-justified hide" role="tablist">
            <li role="presentation"><a href="#canceltransaction" aria-controls="canceltransaction" role="tab" data-toggle="tab">Cancel</a></li>
        </ul>
        
 		
			<div role="tabpanel" class="tab-pane" id="customamount">
				<div class="tab-content text-center">
                

                <form action="${pageContext.request.contextPath}/PinChangeController" method="post" class="form-inline" autocomplete="off">
                <input type="hidden" name="userName" value="<%=request.getAttribute("userName")%>">
                <input type="hidden" name="action" value="pinChange">
                <h2>Enter Old Pin Number</h2>
                    <div class="form-group">
                        <input type="password" name="oldPin" maxlength="5" autocomplete="off" class="form-control input-lg" id="oldPin">
                    </div>
                    <br>
                 <h2>Enter New Pin Number</h2>
                    <div class="form-group">
                        <input type="password" name="newPin" maxlength="5" autocomplete="off" class="form-control input-lg" id="newPin">
                    </div><br>
                    <button type="submit" class="btn btn-default btn-lg">Confirm</button>
                    
                </form>

                <a class="btn btn-lg btn-default canceltransaction"><i class="fa fa-times"></i> CANCEL TRANSACTION</a>

            </div>
        </div>
 	</div>
    <script src="javaScript/jquery-1.12.0.min.js"></script>
    <script src="javaScript/scripts.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>