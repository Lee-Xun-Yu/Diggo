package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DBUtils;
import vo.product;

@WebServlet("/searchP")
public class searchP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public searchP() {
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
    	String P=request.getParameter("search");
    	System.out.println(P);
    	List<product>proList=new ArrayList<product>();
    	Connection conn =DBUtils.open();
    	String sql ="select * from product where p_name like'%"+P+"%'";
    	try {
			PreparedStatement st =conn.prepareStatement(sql);
			ResultSet rs =st.executeQuery();
			while(rs.next()) {
				int P_id=rs.getInt("P_id");
				String P_name=rs.getString("P_name");
				int P_price=rs.getInt("P_price");
				int P_qty=rs.getInt("P_qty");
				String describe=rs.getString("describe");
				product p =new product();
				p.setP_id(P_id);
				p.setP_name(P_name);
				p.setP_price(P_price);
				p.setP_qty(P_qty);
				p.setDescribe(describe);
				proList.add(p);
			}
			request.setAttribute("proList", proList);
			request.getRequestDispatcher("searchP.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	finally {
    		DBUtils.close();
    	}
	}

}
