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
 * Servlet implementation class QueryRecord
 */
@WebServlet("/QueryRecord")
public class QueryRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CachedRowSetImpl rowSet = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryRecord() {
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
       
	    DataByPage dataBean = null;
		String classifyNum = request.getParameter("classifyNum");	          
        
		if(classifyNum == null) {
			classifyNum = "0";
		}
		
		int id = Integer.parseInt(classifyNum);
		HttpSession session = request.getSession(true);
	 	Connection connection = null;
	 	Statement sql = null;
		ResultSet rs = null;
		
		try {
			dataBean = (DataByPage)session.getAttribute("dataBean");
			if(dataBean==null) {
				dataBean = new DataByPage();  //创建dataBean对象
				session.setAttribute("dataBean", dataBean);
			}
		}catch(Exception e) {
			dataBean = new DataByPage();
			session.setAttribute("dataBean", dataBean);
		}
		
		try {
			connection = JdbcUtil.getConnection();
			//3.获取statement
			sql = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs = sql.executeQuery("select * from mobileForm where id="+id);
			rowSet = new CachedRowSetImpl();   //创建行集对象
			rowSet.populate(rs);
			dataBean.setRowSet(rowSet);  //行集数据存储在dataBean中

			response.sendRedirect(request.getContextPath()+"/pages/byPageShow.jsp");
    			
		} catch (Exception e) {
			out.print(e.toString()); 
			e.printStackTrace();
			
		}finally {
			//5.释放资源 connection 
			JdbcUtil.statementClose(connection, sql, rs);
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

}
