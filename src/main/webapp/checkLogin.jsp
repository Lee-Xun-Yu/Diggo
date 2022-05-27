<%@ page language="java" import="java.util.*,java.sql.*,java.net.*" contentType="text/html; charset=UTF-8"
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
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String JDBC_DRIVER="com.mysql.cj.jdbc.Driver";
	String DB_URL="jdbc:mysql://localhost:3306/Diggo";
	String USER="user1";
	String PASS="1234";
	Class.forName(JDBC_DRIVER);
	Connection conn =DriverManager.getConnection(DB_URL, USER, PASS);
	PreparedStatement st=conn.prepareStatement("select username,password from user where username= '" +username+ "'and password='"+password+"'");
	ResultSet rs = st.executeQuery();
    if(!rs.next()){
        out.println("<script language='javascript'>alert('帳號或密碼錯誤！');window.location.href='login.jsp';</script>"); 
    }
    else {
                
                Cookie cookie1 = new Cookie("username", username);
                Cookie cookie2 = new Cookie("password", password);
                
                cookie1.setPath(request.getContextPath());
                cookie2.setPath(request.getContextPath());
             
                cookie1.setMaxAge(60 * 10 );
                cookie1.setMaxAge(60 * 10 );
                
                response.addCookie(cookie1);
                response.addCookie(cookie2);
                request.getRequestDispatcher("/login").forward(request, response);
            }        
	rs.close();
	st.close();
	conn.close();
%>
</body>
</html>