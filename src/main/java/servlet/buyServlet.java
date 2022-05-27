package servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/buyServlet")
public class buyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public buyServlet() {
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
    	PrintWriter out = response.getWriter();
    	String user =request.getParameter("user");
    	if(user=="") {
    		out.println("<script language='javascript'>alert('請先登入會員！');window.location.href='login.jsp';</script>");
    	}
    	else {
    	String p_id=request.getParameter("P_id");
    	String price=request.getParameter("P_price");
    	String qty =request.getParameter("P_qty");
    	int P_id=Integer.parseInt(p_id);
    	int p=Integer.parseInt(price);
    	int q=Integer.parseInt(qty);
    	int ID=0;
    	Connection conn =DBUtils.open();
    	String sql ="select ID from user where username="+"'"+user+"'";
    	try {
			PreparedStatement st =conn.prepareStatement(sql);
			ResultSet rs =st.executeQuery();
			while(rs.next()) {
				ID=rs.getInt("ID");
			}
			System.out.println(ID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	String sql1="insert into buylist(user_id,P_id,price,qty) values(?,?,?,?)";
    	try {
			PreparedStatement st=conn.prepareStatement(sql1);
			st.setInt(1,ID);
			st.setInt(2, P_id);
			st.setInt(3, p);
			st.setInt(4, q);
			int resInt=st.executeUpdate();
			System.out.println(resInt);
			response.sendRedirect("buyList?id="+user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	finally {
    		DBUtils.close();
    	}
	}
	}
}
