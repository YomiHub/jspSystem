package myservlet.data;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.utils.JdbcUtil;

import com.sun.rowset.CachedRowSetImpl;

import mybean.data.DataByPage;

/**
 * Servlet implementation class searchByCondition
 */
@WebServlet("/searchByCondition")
public class searchByCondition extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CachedRowSetImpl rowSet = null;    //存储表中全部记录的行集对象
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchByCondition() {
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
       
		String searchMess = request.getParameter("searchMess");	
		String radioMess = request.getParameter("radio");
		
		if(searchMess == null||searchMess.length()==0) {
			fail(request,response,"没有填写查询信息，无法查询");
			return;
		}
		
		String condition = "";
		if(radioMess.equals("monile_version")) {
			condition = "select * from mobileForm where mobile_version='"+searchMess+"'";
		}else if(radioMess.equals("mobile_name")) {
			condition = "select * from mobileForm where mobile_name like '%"+searchMess+"%'";
		}else if(radioMess.equals("mobile_price")) {
			double max = 0,min =0;
			String regex = "[^0123456789.]";
			String[] priceMess = searchMess.split(regex);
			if(priceMess.length == 1) {
				max = min =Double.parseDouble(priceMess[0]);
			}else if(priceMess.length ==2) {
				min = Double.parseDouble(priceMess[0]);
				max = Double.parseDouble(priceMess[1]);
				
				if(max<min) {
					double t = max;
					max = min;
					min = t;
				}
			}else {
				fail(request,response,"输入价格格式有误");
				return;
			}
			condition = "select * from mobileForm where mobile_price <="+max+" and mobile_price>="+min;
		}
		
		HttpSession session = request.getSession(true);
		DataByPage dataBean = null;
		try {
			dataBean = (DataByPage)session.getAttribute("dataBean");
			if(dataBean == null) {
				dataBean = new DataByPage();
				session.setAttribute("dataBean", dataBean);
			}
		}catch(Exception e) {
			dataBean = new DataByPage();
			session.setAttribute("dataBean", dataBean);
		}
		
		Connection connection = null;
		Statement sql = null;
		ResultSet rs = null;

		try {
			connection = JdbcUtil.getConnection();
			sql = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			rs = sql.executeQuery(condition);
			
			rowSet = new CachedRowSetImpl();  //创建行集对象
			rowSet.populate(rs);
			dataBean.setRowSet(rowSet);
			out.println(condition+"条件"+rowSet);
			response.sendRedirect(request.getContextPath()+"/pages/byPageShow.jsp");   //重定向到结果显示页
		} catch (Exception e) {	
			out.println(condition+"条件"+e.toString());
			e.printStackTrace();
		}finally {
			//5.释放资源 connection prepareStatement
			JdbcUtil.statementClose(connection, sql, rs);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public void fail(HttpServletRequest request, HttpServletResponse response,String backnews) {
		response.setContentType("text/html;charset=utf-8");
		try {
			String searchMobilePath = request.getContextPath()+"/pages/searchMobile.jsp";
			PrintWriter out = response.getWriter();
			out.println("<html><body><div align=center>");
			out.println("<h2>"+backnews+"</h2>");
			out.println("返回主页");
			out.println("<a href='"+searchMobilePath+"'>查询手机</a>");
			out.println("</div></body></html>");
		}catch(IOException e) {
			
		}
	}
}
