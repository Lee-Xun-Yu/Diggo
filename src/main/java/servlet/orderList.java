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
import vo.order;

@WebServlet("/orderList")
public class orderList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public orderList() {
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
    	String user=request.getParameter("id");
    	int ID=0;
    	System.out.println(user);
    	Connection conn=DBUtils.open();
    	String sqlString="select ID from user where username="+"'"+user+"'";
    	try {
			PreparedStatement st=conn.prepareStatement(sqlString);
			ResultSet rs =st.executeQuery();
			while(rs.next()) {
				ID=rs.getInt("ID");
				System.out.println(ID);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	List<order> O_List=new ArrayList<order>();
    	String sql ="select O_id,p.P_id,P_name,price,qty from orderD o left join product p using(P_id) where buy_id="+ID;
    	try {
			PreparedStatement st=conn.prepareStatement(sql);
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				order order=new order();
				order.setO_id(rs.getInt("O_id"));
				order.setP_id(rs.getInt("P_id"));
				order.setP_name(rs.getString("P_name"));
				order.setPrice(rs.getInt("price"));
				order.setQty(rs.getInt("qty"));
				O_List.add(order);
			}
			request.setAttribute("orderList", O_List);
			request.getRequestDispatcher("/order.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	finally {
    		DBUtils.close();
    	}
	}

}
