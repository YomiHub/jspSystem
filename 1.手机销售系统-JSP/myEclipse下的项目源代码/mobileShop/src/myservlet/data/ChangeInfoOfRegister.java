package myservlet.data;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class ChangeRegisterInfo
 */
@WebServlet("/ChangeRegisterInfo")
public class ChangeInfoOfRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeInfoOfRegister() {
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
        PrintWriter out = response.getWriter();
       
	          
        String logname = request.getParameter("logname").trim();
		String phone = request.getParameter("phone").trim();
		String address = request.getParameter("address").trim();
		String realname = request.getParameter("realname").trim();
	    
		boolean isLeagal = true;
		for(int i=0; i<logname.length(); i++) {
			char c = logname.charAt(i);
			if(!((c<='z'&&c>='a')||(c<='Z'&&c>='A')||(c<='9'&&c>='0')))
				isLeagal = false;
		}
        
		
		Login loginBean = null;
		HttpSession session = request.getSession(true);
	 	Connection connection = null;
		PreparedStatement prepareStatement = null;
		PreparedStatement prepareStatement2 = null;
		ResultSet rs = null;
		ResultSet rs2 =null;
		
		String backnews="";
		boolean boo = false;
		
		boo = (logname.length()>0||logname!=null)&&isLeagal;
		
		try {
			connection = JdbcUtil.getConnection();
			loginBean = (Login)session.getAttribute("loginBean");
			String name = loginBean.getLogname();
			//3.获取statement
			String sql ="select * from user where logname=?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, name);

			if(boo) {
    			//4.执行sql
    			rs = prepareStatement.executeQuery();
    			boolean m = rs.next();
    			
    			if(m==true) {
    				//查询成功
    				String changeSql = "update user set logname=?,phone=?,address=?,realname=? where logname=?";
    				prepareStatement2 = connection.prepareStatement(changeSql);
    				prepareStatement2.setString(1, logname);
    				prepareStatement2.setString(2, phone);
    				prepareStatement2.setString(3, address);
    				prepareStatement2.setString(4, realname);
    				prepareStatement2.setString(5, name);
    			    prepareStatement2.execute();
    			    loginBean.setLogname(logname);
    				backnews="注册信息修改成功";
    			}else {
    				backnews="未查找到相关信息！";
    			}
			}else {
				backnews="请输入用户名和密码";
			}
			loginBean.setChangeRegisterInfoBack(backnews);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/changeRegisterInfo.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			backnews="修改失败"+e.toString();
			loginBean.setChangeRegisterInfoBack(backnews);
			out.print(e.toString()); 
			e.printStackTrace();
		
		}finally {
			//5.释放资源 connection prepareStatement
			JdbcUtil.close(connection, prepareStatement, rs);
			JdbcUtil.close(connection, prepareStatement2, rs2);
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
