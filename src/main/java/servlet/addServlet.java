package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DBUtils;

@WebServlet("/addServlet")
public class addServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public addServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
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
		String permission=request.getParameter("permission");
		Connection conn =DBUtils.open();
		String sql="insert into user(username,password,idcard,email,phone,birthday,address,permission) values(?,?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement st =conn.prepareStatement(sql);
			st.setString(1,username);
			st.setString(2,password);
			st.setString(3,idnum);
			st.setString(4,email);
			st.setString(5,phone);
			st.setString(6,birthday);
			st.setString(7,address);
			st.setString(8,permission);
			int resInt=st.executeUpdate();
			System.out.println(resInt);
			request.setAttribute("resInt", resInt);
			request.getRequestDispatcher("/allUsers").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			DBUtils.close();
		}
	}

}
