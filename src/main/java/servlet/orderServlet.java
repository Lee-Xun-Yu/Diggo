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

@WebServlet("/orderServlet")
public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public orderServlet() {
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
    	String car_id=request.getParameter("car_id");
    	String buy_id=request.getParameter("buy_id");
    	String rev =request.getParameter("rev");
    	String O_tel=request.getParameter("O_tel");
    	String O_add=request.getParameter("O_add");
    	String pay=request.getParameter("pay");
    	String total=request.getParameter("P_total");
    	String p =request.getParameter("P_id");
    	String price=request.getParameter("P_price");
    	String qty=request.getParameter("P_qty");
    	int P_price=Integer.parseInt(price);
    	int P_qty=Integer.parseInt(qty);
    	int P_id=Integer.parseInt(p);
    	int O_amount=Integer.parseInt(total);
    	int id = 0;
    	System.out.println(buy_id);
    	Connection conn=DBUtils.open();
    	String sqlString="DELETE  from buylist where car_id=?";
    	try {
			PreparedStatement st =conn.prepareStatement(sqlString);
			st.setString(1, car_id);
			int resInt = st.executeUpdate(); 
			System.out.println(resInt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	String sql="select ID from user where username="+"'"+buy_id+"'";
    	
    	try {
			PreparedStatement st=conn.prepareStatement(sql);
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
			id =rs.getInt("ID");
			System.out.println(id);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	System.out.println(buy_id);
    	System.out.println(rev);
    	System.out.println(O_tel);
    	System.out.println(O_add);
    	System.out.println(pay);
    	System.out.println(O_amount);
    	String sql1 ="insert into orderM(buy_id,rev,O_tel,O_add,pay,O_amount)values(?,?,?,?,?,?)";
    	
    	try {
			PreparedStatement st=conn.prepareStatement(sql1);
			st.setInt(1,id);
			st.setString(2,rev);
			st.setString(3,O_tel);
			st.setString(4,O_add);
			st.setString(5,pay);
			st.setInt(6,O_amount);
			int resInt=st.executeUpdate();
			System.out.println(resInt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	String sql2="insert into orderD(P_id,price,qty,buy_id)values(?,?,?,?)";
    	try {
			PreparedStatement st=conn.prepareStatement(sql2);
			st.setInt(1,P_id);
			st.setInt(2,P_price);
			st.setInt(3,P_qty);
			st.setInt(4, id);
			int resInt1=st.executeUpdate();
			System.out.println(resInt1);
			response.sendRedirect("orderList?id="+buy_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	finally {
    		DBUtils.close();
    	}
	}

}
