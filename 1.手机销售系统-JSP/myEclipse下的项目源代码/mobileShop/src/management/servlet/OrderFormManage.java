package management.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import management.bean.OrderForm;
import management.databaseImp.OrderFormDatabaseImpl;
import management.tool.PageResult;

/**
 * Servlet implementation class OrderFormManage
 */
@WebServlet("/OrderFormManage")
public class OrderFormManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String oderListUrl = "/management/order/orderList.jsp";
	String editOrderUrl = "/management/order/editOrder.jsp";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderFormManage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		case "changeStatus":
			changeStatus(request, response);
			break;
		default:
			break;
		}
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		OrderFormDatabaseImpl orderService = new OrderFormDatabaseImpl();
		orderService.delete(Integer.parseInt(id));
		list(request, response);
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void changeStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		OrderFormDatabaseImpl orderService = new OrderFormDatabaseImpl();
		orderService.changeStatus(Integer.parseInt(id));
		list(request, response);
	}


	/**
	 *
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String logname = request.getParameter("logname");
		String mess = request.getParameter("mess");
		String sum  = request.getParameter("sum");
		String status = request.getParameter("status");  //当添加用户时
		
		OrderFormDatabaseImpl orderService = new OrderFormDatabaseImpl();
		OrderForm orderForm = new OrderForm(Integer.parseInt(id),logname,mess, Float.parseFloat(sum),Integer.parseInt(status));
		orderService.update(orderForm);
		
		list(request, response);
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void editUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if(id!=null&&id.trim().length()>0) {
			OrderFormDatabaseImpl orderService = new OrderFormDatabaseImpl();
			OrderForm orderForm = orderService.queryById(Integer.parseInt(id));
			request.setAttribute("orderForm", orderForm);
		}
		request.getRequestDispatcher(editOrderUrl).forward(request,response);
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
		
		OrderFormDatabaseImpl orderService = new OrderFormDatabaseImpl();
		PageResult pageResult = orderService.queryByPages(currentPageInt,pageSizeInt, userName);
		
		request.setAttribute("pageResult", pageResult);
		request.getRequestDispatcher(oderListUrl).forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
