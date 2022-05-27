<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8"); 
	response.setCharacterEncoding("UTF-8");
	response.setHeader("Content-Type", "text/html;charset=UTF-8");
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String JDBC_DRIVER="com.mysql.cj.jdbc.Driver";
	String DB_URL="jdbc:mysql://localhost:3306/Diggo";
	String USER="user1";
	String PASS="1234";
	Class.forName(JDBC_DRIVER);
	Connection conn =DriverManager.getConnection(DB_URL, USER, PASS);
	PreparedStatement st=conn.prepareStatement("select username from user where username= '" +username+ "'");
	ResultSet rs = st.executeQuery();
	if(rs.next()){
        out.println("<script language='javascript'>alert('該帳號已存在，請重新註冊！');window.location.href='register.jsp';</script>");
	 }
	 else{
		 request.getRequestDispatcher("/register").forward(request, response);
	 }
%>

</body>
</html>