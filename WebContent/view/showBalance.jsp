<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Balance Check</title>
    <link rel="icon" href="images/favicon.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <style><%@ include file="css/atm.css"%></style>
</head>
<body>
	<div class="tab-content text-center">
        <h1>Your Balance is</h1>
	
	<%=request.getAttribute("balance") %>
	</div>
 <a class="btn-lg btn-default canceltransaction" href="view/logout.jsp"><i class="fa fa-times"></i> CANCEL TRANSACTION</a>
</body>
</html>