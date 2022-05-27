package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DBUtils;

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8"); 
		response.setCharacterEncoding("UTF-8");
    	response.setHeader("Content-Type", "text/html;charset=UTF-8");
    	String username =request.getParameter("username");
    	System.out.println(username);
    	String permission="";
    	String sql ="select permission from user where username="+"'"+username+"'";
    	Connection conne =DBUtils.open();
    	try {
			PreparedStatement st =conne.prepareStatement(sql);
			ResultSet rs =st.executeQuery();
			while(rs.next()) {
				permission=rs.getString("permission");
			}
			System.out.println(permission);
			request.getSession().setAttribute("permission", permission);
			request.getSession().setAttribute("user",username);
	    	response.sendRedirect("/Diggo/Home.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
