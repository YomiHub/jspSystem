package management.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import management.bean.GoodsType;
import management.tool.PageResult;
import management.service.GoodsTypeServiceImpl;


/**
 * Servlet implementation class GoodsTypeManage
 */
@WebServlet("/GoodsTypeManage")
public class GoodsTypeManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String goodsTypeListUrl = "/management/mobile/mobileTypeList.jsp";
	String editGoodsTypeUrl = "/management/mobile/editMobileType.jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsTypeManage() {
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
		case "queryById":
			queryById(request, response);
			break;
		case "delete":
			delete(request, response);
			break;
		default:
			break;
		}
	}
	
	/**
	 * 
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		GoodsTypeServiceImpl GoodsTypeServiceImpl = new GoodsTypeServiceImpl();
		GoodsTypeServiceImpl.delete(Integer.parseInt(id));
		// 鍥炲埌鍒楄〃椤甸潰 鍥犱负鎴戜滑浣跨敤iframe妗嗘灦锛屾墍浠ュ彲浠ョ洿鎺ヨ皟鐢ㄦ柟娉曘��
		list(request, response);
		// response.sendRedirect(request.getContextPath() + "/user?method=list");
	}

	/**
	 * 
	 * 
	 * @param request
	 * @param response
	 */
	private void queryById(HttpServletRequest request, HttpServletResponse response) {
			
	}

	/**
	 *
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 * @throws FileUploadException 
	 */
	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String isUpdate = request.getParameter("isUpdate");  //用于判断是添加还是更新
		String id = request.getParameter("goodsTypeId"); 
		String name = request.getParameter("goodsTypeName");
		/*String imageUrl = upload(request);*/
		/*System.out.println(imageUrl);*/
		GoodsTypeServiceImpl goodsTypeService = new GoodsTypeServiceImpl();
		
		if(isUpdate!=null&&isUpdate.trim().length()>0) {
			GoodsType goodsType = new GoodsType(Integer.parseInt(id), name);
			goodsTypeService.update(goodsType);
		}else {
			GoodsType goodsType = new GoodsType(name);
			goodsTypeService.add(goodsType);
		}
		list(request, response);
	}

	/**
	 * 
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void editUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String typeId = request.getParameter("id");
		if(typeId!=null&&typeId.trim().length()>0) {
			GoodsTypeServiceImpl goodsTypeService = new GoodsTypeServiceImpl();
			GoodsType goodsType = goodsTypeService.queryById(Integer.parseInt(typeId));
			request.setAttribute("goodsType", goodsType);
		}
		request.getRequestDispatcher(editGoodsTypeUrl).forward(request, response);
	}

	/**
	 * 鍟嗗搧绫诲埆鍒楄〃
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currentPage = request.getParameter("currentPage");
		String pageSize = request.getParameter("pageSize");
		String typeName = request.getParameter("goodsTypeName");
		Integer pageSizeInt = 5;
		Integer currentPageInt = 1;
		if (pageSize != null && pageSize.length() > 0) {
			pageSizeInt = Integer.parseInt(pageSize);
		}
		if (currentPage != null && currentPage.length() > 0) {
			currentPageInt = Integer.parseInt(currentPage);
		}

		GoodsTypeServiceImpl goodsTypeService = new GoodsTypeServiceImpl();
		PageResult pageResult = goodsTypeService.queryByPages(currentPageInt, pageSizeInt,typeName);
		request.setAttribute("pageResult", pageResult);
		request.getRequestDispatcher(goodsTypeListUrl).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
