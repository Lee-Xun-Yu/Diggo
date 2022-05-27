package DB;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBUtils {
	static Connection conn =null;
	static PreparedStatement st=null;
	static ResultSet rs =null;
	public static Connection open() {
		try {
			File f =new File("/Users/lixunyou/JSP/Diggo/src/sql.txt");
			try (BufferedReader obj = new BufferedReader(new FileReader(f))) {
				String DB_URL=obj.readLine();
				String USER=obj.readLine();
				String PASS=obj.readLine();
				String JDBC_DRIVER=obj.readLine();
				Class.forName(JDBC_DRIVER);
				System.out.println("連接成功......");
				return DriverManager.getConnection(DB_URL, USER, PASS);
			}
		} catch (Exception e) {
			System.out.println("連接資料庫失敗....");
		}
		return null;
	}
	
	public static Connection close() {
		if(rs!=null) {
			try {
				rs.close();
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		if(st!=null) {
			try {
				st.close();
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		if (conn != null) {
			try {
				conn.close();// 關閉數據庫
				System.out.println("關閉成功...");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("資料庫關閉失敗...");
			}
		}
		return null;
	}
	
}
