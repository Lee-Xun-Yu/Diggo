package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/outLogin")
public class outLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public outLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		if(session==null) {
			response.sendRedirect("/Diggo/Home.jsp");
			return;
		}
		session.removeAttribute("permission");
		session.removeAttribute("user");
		response.sendRedirect("/Diggo/Home.jsp");
	}

}
