<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.asif.dao.User"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Account Details</title>
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" type="text/css" href="PerfectMatch.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<style><%@ include file="css/user.css"%></style>
	<style><%@ include file="css/dropdownsub.css"%></style>
	<style><%@ include file="css/footer.css"%></style>
	<style><%@ include file="css/accountDetails.css"%></style>
</head>
<body>
<% ArrayList<User> al= new ArrayList<User>();
	al=(ArrayList<User>)request.getAttribute("userDetails");
%>
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
					<li class="active"><a href="#">Home</a></li>
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
						    <form action="${pageContext.request.contextPath}/AccountDetailsController" method="post" class="form-inline" autocomplete="off">
						    <input type="hidden" name="userName" value="<%=request.getAttribute("userName") %>">
						    <input type="hidden" name="action" value="">
						    <button type="button" class="btn btn-default button3">Transaction history</button>
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
			        <li><a href="view/logout.jsp">Logout <i class="fa fa-user" aria-hidden="true"></i></a></li>
			    </ul>
		    </div>
			
		</div>
	</nav>

	<div id="user-profile-2" class="user-profile">
		<div class="tabbable">
			<ul class="nav nav-tabs padding-18">
				<li class="active">
					<a data-toggle="tab" href="#home">
						<i class="green ace-icon fa fa-user bigger-120"></i>
						Acounts Details
					</a>
				</li>
			</ul>

			<div class="tab-content no-border padding-24">
				<div id="home" class="tab-pane in active">
					<div class="row">
						<div class="col-xs-12 col-sm-3 center">
							<span class="profile-picture">
								<img class="editable img-responsive" alt=" Avatar" id="avatar2" src="http://bootdey.com/img/Content/avatar/avatar6.png">
							</span>

							<div class="space space-4"></div>

							<a href="#" class="btn btn-sm btn-block btn-success">
								<i class="ace-icon fa fa-plus-circle bigger-120"></i>
								<span class="bigger-110">Upload user Pic</span>
							</a>

							<a href="#" class="btn btn-sm btn-block btn-primary">
								<i class="ace-icon fa fa-envelope-o bigger-110"></i>
								<span class="bigger-110">Update Profile</span>
							</a>
						</div><!-- /.col -->

						<div class="col-xs-12 col-sm-9">
							<h4 class="blue">
								<%= request.getAttribute("userName") %>

								<span class="label label-purple arrowed-in-right">
									<i class="ace-icon fa fa-circle smaller-80 align-middle"></i>
									online
								</span>
							</h4>

							<div class="profile-user-info">
								<div class="profile-info-row">
									<div class="profile-info-name"> First Name </div>

									<div class="profile-info-value">
										<span>Asif</span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> Last Name </div>

									<div class="profile-info-value">
										<span>sadi</span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> Email </div>

									<div class="profile-info-value">
										<span>as@gmail.com</span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> Mobile </div>

									<div class="profile-info-value">
										<span>11111</span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> Date of Birth </div>

									<div class="profile-info-value">
										<span>2222</span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> Marital Status </div>

									<div class="profile-info-value">
										<span>Single</span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> Gender </div>

									<div class="profile-info-value">
										<span>M</span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> Current Address </div>

									<div class="profile-info-value">
										<span>Dhaka</span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> Parmanent Address </div>

									<div class="profile-info-value">
										<span>Mymensingh</span>
									</div>
								</div>


								<div class="profile-info-row">
									<div class="profile-info-name"> City </div>

									<div class="profile-info-value">
										<i class="fa fa-map-marker light-orange bigger-110"></i>
										<span>Dhaka</span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> Country </div>

									<div class="profile-info-value">
										<i class="fa fa-map-marker light-orange bigger-110"></i>
										<span>Bangladesh</span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> Nationality </div>

									<div class="profile-info-value">
										<span>Bangladeshi</span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> Profession </div>

									<div class="profile-info-value">
										<span>Student</span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> Card Type </div>

									<div class="profile-info-value">
										<span>Platinum</span>
									</div>
								</div>
							</div>
							</div>
						</div><!-- /.col -->
					</div><!-- /.row -->
				</div><!-- /#home -->
			</div>
		</div>
	</div>

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