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
import javax.servlet.http.HttpSession;

import DB.DBUtils;

@WebServlet("/CheckPermission")
public class CheckPermission extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CheckPermission() {
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
    	HttpSession session=request.getSession();
    	String s =(String)session.getAttribute("user");
    	System.out.println(s);
    	Connection conn =DBUtils.open();
    	String sql="select permission from user where username="+"'"+s+"'";
    	
    	try {
			PreparedStatement st =conn.prepareStatement(sql);
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				String p =rs.getString("permission");
				System.out.println(p);
				if(p.equals("管理者")) {
			    	request.getSession().setAttribute("permission",p);
					request.getRequestDispatcher("/allUsers").forward(request, response);
				}
				else {
					out.print("<script language='javascript'>alert('此為管理者頁面！');window.location.href='Home.jsp';</script>");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	finally {
    		DBUtils.close();
    	}

	}

}
