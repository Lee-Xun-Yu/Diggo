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
import vo.User;

@WebServlet("/allUsers")
public class allUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public allUsers() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8"); 
		response.setCharacterEncoding("UTF-8");
    	response.setHeader("Content-Type", "text/html;charset=UTF-8");
		List<User> userList = new ArrayList<User>(); 
		Connection conn = DBUtils.open(); 
		String sql = " select id,username,password,idcard,email,phone,birthday,address,permission from user ;";

		try {
			PreparedStatement prtmt = conn.prepareStatement(sql);
			ResultSet rs = prtmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String idcard = rs.getString("idcard");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String birthday = rs.getString("birthday");
				String address = rs.getString("address");
				String permission = rs.getString("permission");
				User user=new User();
				user.setId(id);
				user.setUsername(username);
				user.setPassword(password);
				user.setIdcard(idcard);
				user.setEmail(email);
				user.setPhone(phone);
				user.setBirthday(birthday);
				user.setAddress(address);
				user.setPermission(permission);
				userList.add(user);
			}
//			for(int i=0;i<userList.size();i++) {
//				System.out.println(userList);
//			}
			
			request.setAttribute("userList", userList);
			request.getRequestDispatcher("/userList.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtils.close();
		}
	} protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
