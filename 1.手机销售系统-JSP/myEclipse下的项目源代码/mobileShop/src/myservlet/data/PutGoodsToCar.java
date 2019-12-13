package myservlet.data;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.Login;

/**
 * Servlet implementation class PutGoodsToCar
 */
@WebServlet("/PutGoodsToCar")
public class PutGoodsToCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PutGoodsToCar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        Login loginBean = null;
        HttpSession session = request.getSession(true);
	          
		String goods = request.getParameter("java");
		
		try {
			loginBean = (Login)session.getAttribute("loginBean");
			boolean b = loginBean.getLogname() == null||loginBean.getLogname().length()==0;
			
			if(b) {
				response.sendRedirect(request.getContextPath()+"/pages/login.jsp");
			}
			
			LinkedList<String> car = loginBean.getCar();
			car.add(goods);  //将产品放入购物车
			speakSomeMess(request,response,goods);
		}catch(Exception e) {
			
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void speakSomeMess(HttpServletRequest request, HttpServletResponse response, String goods) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		//String headTxtPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/WEB-INF/tags/tophead.txt";
		String lookShoppingCar = request.getContextPath()+"/pages/lookShoppingCar.jsp";
		String indexPath = request.getContextPath()+"/index.jsp";
		try {
			PrintWriter out = response.getWriter();
	       /* out.print("<head><%@ include file='"+headTxtPath+"'%></head>");*/
	        out.println("<html><body><div align=center>");
	        out.println("<h2>"+goods+"放入购物车</h2>");
	        out.println("查看购物车或返回<br>");
	        out.println("<a href='"+lookShoppingCar+"'>查看购物车</a>");
	        out.println("<br><a href='"+indexPath+"'>主页</a>");
	        out.println("</div></body></html>");
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

}
