package management.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import management.bean.User;
import management.tool.PageResult;
import management.service.UserServiceImpl;

/**
 * Servlet implementation class UserManage
 */
@WebServlet("/UserManage")
public class UserManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String userListUrl = "/management/user/userList.jsp";
	String editUserUrl = "/management/user/editUser.jsp";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
		String method = request.getParameter("method");
		switch (method) {
		case "list":
			list(request, response);
			break;
		case "editUI":
			editUI(request, response);
			break;
		case "edit":
			edit(request, response);
			break;
		case "delete":
			delete(request, response);
			break;
		default:
			break;
		}
	}

	
	/**
	 * 删除用户
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("logname");
		UserServiceImpl userService = new UserServiceImpl();
		userService.delete(name);
		list(request, response);
	}


	/**
	 * 修改信息或者注册用户
	 * 
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String isUpdate = request.getParameter("isUpdate");  //用于判断是添加用户还是编辑用户
		String logname = request.getParameter("logname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String realname  = request.getParameter("realname");
		String password = request.getParameter("password");  //当添加用户时
		UserServiceImpl userService = new UserServiceImpl();
		
		if(isUpdate!=null&&isUpdate.trim().length()>0) {
			User user = new User(logname, phone, address,realname);
			userService.update(user);
		}else {
			User user = new User(logname, phone, address,realname,password);
			userService.add(user);
		}
		
		list(request, response);
	}

	/**
	 * 根据用户名查找用户
	 * 
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void editUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String logname = request.getParameter("logname");
		if(logname!=null&&logname.trim().length()>0) {
			UserServiceImpl userService = new UserServiceImpl();
			User user = userService.queryByLogname(logname);
			request.setAttribute("user", user);
		}
		request.getRequestDispatcher(editUserUrl).forward(request, response);
	}

	/**
	 * 列出用户表中的信息
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currentPage = request.getParameter("currentPage");
		String pageSize = request.getParameter("pageSize");
		String userName = request.getParameter("userName");
		Integer pageSizeInt = 5;
		Integer currentPageInt = 1;
		if(pageSize!=null&&pageSize.length()>0) {
			pageSizeInt = Integer.parseInt(pageSize);
		}
		if(currentPage!=null&&currentPage.length()>0) {
			currentPageInt = Integer.parseInt(currentPage);
		}
		
		UserServiceImpl userService = new UserServiceImpl();
		PageResult pageResult = userService.queryByPages(currentPageInt,pageSizeInt, userName);
		
		request.setAttribute("pageResult", pageResult);
		request.getRequestDispatcher(userListUrl).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
