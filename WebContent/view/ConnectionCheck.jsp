<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="com.asif.utility.ConnectionProvider , java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection conn = ConnectionProvider.getConnection();
	
		if( conn != null){
			out.println("SuccessFul");
		}
		else{
			out.println("Failed");
		}
	%>

</body>
</html>