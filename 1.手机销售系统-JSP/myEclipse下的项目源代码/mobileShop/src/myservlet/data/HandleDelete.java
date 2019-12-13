package myservlet.data;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.Login;

/**
 * Servlet implementation class HandleDelete
 */
@WebServlet("/HandleDelete")
public class HandleDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
   /*     PrintWriter out = response.getWriter();*/
        
        Login loginBean = null;  
        String delete = request.getParameter("delete");
        HttpSession session = request.getSession(true);
	          
		try {
			loginBean = (Login)session.getAttribute("loginBean");
			boolean b = loginBean.getLogname()==null||loginBean.getLogname().length() == 0;
			
			if(b) {
				response.sendRedirect(request.getContextPath()+"/pages/login.jsp");
			}
			
			LinkedList<String> car = loginBean.getCar();
			car.remove(delete);   //从购物车中删除产品
		}catch(Exception e) {
			response.sendRedirect(request.getContextPath()+"/pages/login.jsp");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/lookShoppingCar.jsp");
		dispatcher.forward(request, response); //转发
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
