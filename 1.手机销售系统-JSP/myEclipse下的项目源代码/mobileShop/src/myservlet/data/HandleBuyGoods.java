package myservlet.data;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.utils.JdbcUtil;

import mybean.data.Login;

/**
 * Servlet implementation class HandleBuyGoods
 */
@WebServlet("/HandleBuyGoods")
public class HandleBuyGoods extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleBuyGoods() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
       
	          
		String buyGoodsMess = request.getParameter("buy");
		if(buyGoodsMess == null||buyGoodsMess.length()==0) {
			fail(request,response,"购物车没有物品，无法生成订单");
			return;
		}
		
		String price = request.getParameter("price");
		if(price == null||price.length()==0) {
			fail(request,response,"没有计算价格和，无法生成订单");
			return;
		}
		
		float sum = Float.parseFloat(price);
		Login loginBean = null;
		HttpSession session = request.getSession(true);
		try {
			loginBean = (Login)session.getAttribute("loginBean");
			boolean b = loginBean.getLogname() == null||loginBean.getLogname().length()==0;
			if(b) {
				response.sendRedirect(request.getContextPath()+"/pages/login.jsp");
			}
		}catch(Exception e) {
			response.sendRedirect(request.getContextPath()+"/pages/login.jsp");
		}
      
	 	Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet rs = null;
		String backnews="";
		
		try {
			connection = JdbcUtil.getConnection();
			//3.获取statement
			//String sql ="insert into user(logname,password,phone,address,realname) value(?,?,?,?,?) ";
			String sql ="insert into orderform values(?,?,?,?) ";
			prepareStatement = connection.prepareStatement(sql);

			prepareStatement.setInt(1, 0);  //订单号自定义增加
			prepareStatement.setString(2, loginBean.getLogname());
			prepareStatement.setString(3, buyGoodsMess);
			prepareStatement.setFloat(4, sum);
				
			//4.执行sql
			int m = prepareStatement.executeUpdate();
			
			if(m!=0) {
				LinkedList<String> car = loginBean.getCar();
				car.clear();   //清空购物车
				success(request,response,"生成订单成功");
			}else {
				fail(request,response,"生成订单失败");
			}
			
		} catch (Exception e) {
			backnews=""+e.toString();
			out.print(e.toString()); 
			e.printStackTrace();
			fail(request,response,"生成订单失败"+backnews);
		}finally {
			//5.释放资源 connection prepareStatement
			JdbcUtil.close(connection, prepareStatement, rs);
		}
	     out.flush();
	     out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void success(HttpServletRequest request, HttpServletResponse response,String backnews) {
		response.setContentType("text/html;charset=utf-8");
		try {
			String lookOrderFormPath = request.getContextPath()+"/pages/lookOrderForm.jsp";
			String registerPath = request.getContextPath()+"/index.jsp";
			PrintWriter out = response.getWriter();
			out.println("<html><body><div align=center>");
			out.println("<h2>"+backnews+"</h2>");
			out.println("返回主页");
			out.println("<a href='"+registerPath+"'>主页</a>");
			out.println("<br>查看订单");
			out.println("<a href='"+lookOrderFormPath+"'>查看订单</a>");
			out.println("</div></body></html>");
		}catch(Exception e) {
			
		}
	}
	
	public void fail(HttpServletRequest request, HttpServletResponse response,String backnews) {
		response.setContentType("text/html;charset=utf-8");
		try {
			String registerPath = request.getContextPath()+"/index.jsp";
			PrintWriter out = response.getWriter();
			out.println("<html><body><div align=center>");
			out.println("<h2>"+backnews+"</h2>");
			out.println("返回主页");
			out.println("<a href='"+registerPath+"'>主页</a>");
			out.println("</div></body></html>");
		}catch(IOException e) {
			
		}
	}

}
