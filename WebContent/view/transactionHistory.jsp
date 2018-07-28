<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.asif.dao.TransactionDao"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
	<title>Transaction History</title>
	<style><%@ include file="css/history.css"%></style>
</head>
<body>

<head>
	<title>User Info</title>

	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" type="text/css" href="PerfectMatch.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<style><%@ include file="css/history.css"%></style>
	<style><%@ include file="css/user.css"%></style>
	<style><%@ include file="css/dropdownsub.css"%></style>
	<style><%@ include file="css/footer.css"%></style>
	<style><%@ include file="css/accountDetails.css"%></style>
	
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
		     	</button>
				<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-leaf" aria-hidden="true"></span> Online Bank</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
				<ul class ="nav navbar-nav">
					<li class=""><a href="#">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Contact</a></li>
					<li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My DashBoard <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            
		          	<!-- Accounts option-->
		            <li class="dropdown-submenu">
	                  <a  class="dropdown-item" tabindex="-1" href="#">Accounts</a>
	                  <ul class="dropdown-menu">
	                    <div class="btn-group-vertical">
							<form action="${pageContext.request.contextPath}/AccountDetailsController" method="post" class="form-inline" autocomplete="off">
						    <input type="hidden" name="userName" value="<%=request.getAttribute("userName") %>">
						    <input type="hidden" name="action" value="userInfo">
						    <button type="submit" class="btn btn-default button2">Account details</button>
							</form>
							<li role="separator" class="divider"></li>
						    <form action="${pageContext.request.contextPath}/TransactionHistoryController" method="post" class="form-inline" autocomplete="off">
						    <input type="hidden" name="userName" value="<%=request.getAttribute("userName") %>">
						    <input type="hidden" name="action" value="transactionHistory">
						    <button type="submit" class="btn btn-default button3">Transaction history</button>
						  </form>
						</div>
	                  </ul>
                	</li>
		            
		            <li role="separator" class="divider"></li>
		            <!-- Transfer option-->
		            <li class="dropdown-submenu">
	                  <a  class="dropdown-item" tabindex="-1" href="#">Transfers</a>
	                  <ul class="dropdown-menu">


	                    <div class="btn-group-vertical">
						  	<form action="${pageContext.request.contextPath}/AccountDetailsController" method="post" class="form-inline" autocomplete="off">
						    <button type="button" class="btn btn-default button1">Local Transfer</button>
							</form>
							<li role="separator" class="divider"></li>
						    <form action="${pageContext.request.contextPath}/AccountDetailsController" method="post" class="form-inline" autocomplete="off">
						    <button type="button" class="btn btn-default button3">Transfer history</button>
						  </form>
						</div>

	                  </ul>
                	</li>

                	<li role="separator" class="divider"></li>
		            <!-- Payments option-->
		            <li class="dropdown-submenu">
	                  <a  class="dropdown-item" tabindex="-1" href="#">Payments</a>
	                  <ul class="dropdown-menu">
	                    
						  <div class="btn-group-vertical">
						  	<form action="${pageContext.request.contextPath}/AccountDetailsController" method="post" class="form-inline" autocomplete="off">
						    <button type="button" class="btn btn-default button1">Pay Bills</button>
							</form>
							<li role="separator" class="divider"></li>
						    <form action="${pageContext.request.contextPath}/AccountDetailsController" method="post" class="form-inline" autocomplete="off">
						    <button type="button" class="btn btn-default button3">Payment History</button>
						  </form>
						  </div>
						
	                  </ul>
                	</li>

		          </ul>
		        </li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
			        <li><a href="#"><%= request.getAttribute("userName") %> <i class="fa fa-user-plus" aria-hidden="true"></i></a></li>
			        <li><a href="view/logout.jsp">LogOut <i class="fa fa-user" aria-hidden="true"></i></a></li>
			    </ul>
		    </div>
			
		</div>
	</nav>
<br><br>
 <div id="container">
	<div id="wrapper">
		<div id="header">
			<h2>My Transaction List</h2>
		</div>
	</div>
	
	<% ArrayList<TransactionDao> al= new ArrayList<TransactionDao>();
al=(ArrayList<TransactionDao>)request.getAttribute("transactionHistory");
%>
	
	
		<div id="content">
		<!-- put new Button add student -->
			<table border="3">
				<tr>
					<th>User Name</th>
					<th>Transaction Amount</th>
					
				</tr>
				<tbody>		
				<tr>
				<%
					for(TransactionDao user:al) {
				%>
						<td><%=user.getUserName()%></td>
						
						<td><%=user.getTransactionAmount()%></td>
					
						
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	</div>
	<br><br>
	
		  <!-- Footer -->
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <p>Copyright &copy; S. All rights reserved.</p>
        </div>
      </div>
    </div>
  </footer>
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
</body> 
</html>