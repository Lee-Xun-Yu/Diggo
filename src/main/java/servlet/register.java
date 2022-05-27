package servlet;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DBUtils;

@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8"); 
		response.setCharacterEncoding("UTF-8");
    	response.setHeader("Content-Type", "text/html;charset=UTF-8");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String idnum=request.getParameter("idnum");
		String email=request.getParameter("email");
		String phone=request.getParameter("phonenum");
		String birthday=request.getParameter("birthday");
		String address=request.getParameter("address");
		System.out.println(username);
		System.out.println(password);
		System.out.println(idnum);
		System.out.println(email);
		System.out.println(phone);
		System.out.println(birthday);
		System.out.println(address);
		Connection conn =DBUtils.open();
		String sql ="insert into user(username,password,idcard,email,phone,birthday,address) values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement st =conn.prepareStatement(sql);
			st.setString(1,username);
			st.setString(2,password);
			st.setString(3,idnum);
			st.setString(4,email);
			st.setString(5,phone);
			st.setString(6,birthday);
			st.setString(7,address);
			int resInt=st.executeUpdate();
			System.out.println(resInt);
			request.setAttribute("resInt", resInt);
			request.getRequestDispatcher("/success.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
		finally {
			DBUtils.close();
		}
	}

}
