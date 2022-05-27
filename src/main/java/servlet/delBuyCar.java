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

@WebServlet("/delBuyCar")
public class delBuyCar extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public delBuyCar() {
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
    	String user=request.getParameter("user");
    	String car_id=request.getParameter("car_id");
    	Connection conn =DBUtils.open();
    	String sql="DELETE  from buylist where car_id=?";
    	try {
			PreparedStatement st =conn.prepareStatement(sql);
			st.setString(1, car_id);
			int resInt = st.executeUpdate(); 
			System.out.println(resInt);
			request.getRequestDispatcher("/buyList?id="+user).forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	finally {
    		DBUtils.close();
    	}
	}

}
