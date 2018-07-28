<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="css/login2.css">
	<script type="text/javascript" src="javaScript/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="javaScript/TweenMax.min.js"></script>
	

	
	
</head>
<body>
  







  <div id="login-button">
  <img src="https://dqcgrsy5v35b9.cloudfront.net/cruiseplanner/assets/img/icons/login-w-icon.png">
  </img>
</div>
<div id="container">
  <h1>Log In</h1>
  <span class="close-btn">
    <img src="https://cdn4.iconfinder.com/data/icons/miu/22/circle_close_delete_-128.png"></img>
  </span>

 <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
 	<input type="hidden" name="action" value="login" >
    <input type="text" name="user_name" placeholder="User Name" required="required">
    <input type="password" name="password" placeholder="Password" required="required">
    <input type="submit" value="Login" class="submit">
    <!--  <div id="remember-container">
      <input type="checkbox" id="checkbox-2-1" class="checkbox" checked="checked"/>
      <span id="remember">Remember me</span>
      <span id="forgotten">Forgotten password</span>
    </div>-->
</form>
</div>

<!-- Forgotten Password Container -->
<div id="forgotten-container">
   <h1>Forgotten</h1>
  <span class="close-btn">
    <img src="https://cdn4.iconfinder.com/data/icons/miu/22/circle_close_delete_-128.png"></img>
  </span>

  <form>
    <input type="email" name="email" placeholder="E-mail">
    <a href="#" class="orange-btn">Get new password</a>
</form>
</div>

  <script type="text/javascript" src="javaScript/login.js"></script>
  
</body>

</html>