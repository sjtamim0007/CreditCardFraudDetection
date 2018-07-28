<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Welcome To the Home</h1>
	<form action="${pageContext.request.contextPath}/PinCodeMatcherController" method="post">
		<input type="hidden" name="userName" value="<%=request.getAttribute("user_name")%>">
		<b>Enter Pin : </b><input type="text" name="pin_number" placeholder="Pin Number">
		<input type="submit" value="Submit">
	</form>
</body>
</html>