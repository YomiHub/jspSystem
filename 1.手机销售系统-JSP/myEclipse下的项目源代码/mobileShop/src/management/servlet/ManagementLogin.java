package management.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import management.service.UserServiceImpl;
import management.bean.User;

/**
 * Servlet implementation class ManagementLogin
 */
@WebServlet("/ManagementLogin")
public class ManagementLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagementLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		UserServiceImpl userService = new UserServiceImpl();
		User user = userService.queryManageByAccountAndPassword(phone,password);
		
		if(user==null) {
			response.sendRedirect(request.getContextPath()+"/management/login.jsp");
			return ;
		}else {
			session.setAttribute("manageBean", user);
		}
		
		
		/**
		 *
		 */
		request.getServletContext().setAttribute("user", user);
         //重定向到首页
		response.sendRedirect(request.getContextPath()+"/management/manageIndex.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
