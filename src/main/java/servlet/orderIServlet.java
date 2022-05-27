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

/**
 * Servlet implementation class orderIServlet
 */
@WebServlet("/orderIServlet")
public class orderIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public orderIServlet() {
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
    	String o_id=request.getParameter("O_id");
    	int ID=0;
    	Connection conn=DBUtils.open();
    	String sql="select ID from user where username="+"'"+user+"'";
    	try {
			PreparedStatement st=conn.prepareStatement(sql);
			ResultSet rs =st.executeQuery();
			while(rs.next()) {
				ID=rs.getInt("ID");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	int O_id=0;
		int buy_id=0;
		String rev = null ;
		String O_tel=null;
		String O_add=null;
		String pay =null;
		int O_amount=0;
		String O_date=null;
		int P_id=0;
		int price=0;
		int qty=0;
    	String sql1="select *from orderM m left join orderD using (O_id) where m.buy_id="+ID+"&& O_id="+o_id;
    	try {
			PreparedStatement st=conn.prepareStatement(sql1);
			ResultSet rs =st.executeQuery();
			while(rs.next()) {
				O_id=rs.getInt("O_id");
				buy_id=rs.getInt("buy_id");
				rev =rs.getString("rev");
				O_tel=rs.getString("O_tel");
				O_add=rs.getString("O_add");
				pay =rs.getString("pay");
				O_amount=rs.getInt("O_amount");
				O_date=rs.getString("O_date");
				P_id=rs.getInt("P_id");
				price=rs.getInt("price");
				qty=rs.getInt("qty");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	String P_name=null;
    	String describe=null;
    	String sql2="select *from product where P_id="+P_id;
    	try {
			PreparedStatement st=conn.prepareStatement(sql2);
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				P_name =rs.getString("P_name");
				describe=rs.getString("describe");
			}
			request.setAttribute("O_date", O_date);
			request.setAttribute("buy_id", buy_id);
			request.setAttribute("qty", qty);
			request.setAttribute("price", price);
			request.setAttribute("P_id", P_id);
			request.setAttribute("O_id",O_id);
			request.setAttribute("rev", rev);
			request.setAttribute("O_tel", O_tel);
			request.setAttribute("O_add", O_add);
			request.setAttribute("pay", pay);
			request.setAttribute("O_amount", O_amount);
			request.setAttribute("O_date", O_date);
			request.setAttribute("P_name", P_name);
			request.setAttribute("describe", describe);
			request.getRequestDispatcher("/orderI.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	finally {
    		DBUtils.close();
    	}
	}

}
