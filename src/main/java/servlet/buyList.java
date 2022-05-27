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
import vo.buyCar;

@WebServlet("/buyList")
public class buyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public buyList() {
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
    	
    	List<buyCar>buyList=new ArrayList<buyCar>();
    	String sql1 ="select car_id,user_id,P_id,price,qty,P_name from buylist left join product using(P_id) where user_id="+"'"+ID+"'";
    	try {
			PreparedStatement st =conn.prepareStatement(sql1);
			ResultSet rs =st.executeQuery();
			while(rs.next()) {
				buyCar car=new buyCar();
				car.setCar_id(rs.getInt("car_id"));
				car.setID(rs.getInt("user_id"));
				car.setP_id(rs.getInt("P_id"));
				car.setPrice(rs.getInt("price"));
				car.setQty(rs.getInt("qty"));
				car.setP_name(rs.getString("P_name"));
				buyList.add(car);
			}
			request.setAttribute("buyList", buyList);
			request.getRequestDispatcher("/buylist.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	finally {
    		DBUtils.close();
    	}
	}

}
