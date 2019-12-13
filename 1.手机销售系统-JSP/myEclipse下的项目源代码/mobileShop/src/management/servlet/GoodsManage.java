package management.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import management.bean.Goods;
import management.service.GoodsServiceImpl;
import management.tool.PageResult;

/**
 * Servlet implementation class GoodsManage
 */
@WebServlet("/GoodsManage")
public class GoodsManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String goodsListUrl = "/management/mobile/mobileList.jsp";
	String editGoodsUrl = "/management/mobile/editMobile.jsp";
	String imageUrl = "/images";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsManage() {
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
			try {
				edit(request, response);
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mobile_version = request.getParameter("mobileVersion");
		GoodsServiceImpl GoodsServiceImpl = new GoodsServiceImpl();
		GoodsServiceImpl.delete(mobile_version);
		// 鍥炲埌鍒楄〃椤甸潰 鍥犱负鎴戜滑浣跨敤iframe妗嗘灦锛屾墍浠ュ彲浠ョ洿鎺ヨ皟鐢ㄦ柟娉曘��
		list(request, response);
		// response.sendRedirect(request.getContextPath() + "/user?method=list");
	}

	/**
	 * 
	 * @param request
	 * @param response
	 */
	private void queryById(HttpServletRequest request, HttpServletResponse response) {
			
	}

	/**
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 * @throws FileUploadException 
	 */
	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, FileUploadException  {
		PrintWriter out = response.getWriter();
		String isUpdate = request.getParameter("isUpdate");  //用于判断是添加还是更新
		String ifSelect = request.getParameter("ifSelect");  //用于判断是添加还是更新
		String mobileVersion = request.getParameter("mobileVersion"); 
		String mobileName = request.getParameter("mobileName");
		String mobileMade = request.getParameter("mobileMade");	
		String mobilePrice = request.getParameter("mobilePrice"); 
		String mobileMess = request.getParameter("mobileMess");
		String mobilePic = request.getParameter("mobilePic"); 
        
		if(Integer.parseInt(ifSelect)==1) {
			mobilePic = up(request,response);  //选择了图片
		}
		/*out.print("pic"+mobilePic);*/
		
	    String id = request.getParameter("id");
	    
		GoodsServiceImpl goodsService = new GoodsServiceImpl();
		
		if(Integer.parseInt(isUpdate)!=0) {
			out.print(ifSelect+"选择"+isUpdate+"更新"+mobileVersion+"mobileName"+mobileName+"mobileMade"+mobileMade+"mobilePrice"+mobilePrice+"mobileMess"+mobileMess+"mobilePic"+mobilePic);
			Goods goods = new Goods(mobileVersion,mobileName,mobileMade,Float.parseFloat(mobilePrice),mobileMess,mobilePic,Integer.parseInt(id));
			goodsService.update(goods);
		}else {
			out.print(ifSelect+"选择"+isUpdate+"add"+mobileVersion+"mobileName"+mobileName+"mobileMade"+mobileMade+"mobilePrice"+mobilePrice+"mobileMess"+mobileMess+"mobilePic"+mobilePic);
			Goods goods = new Goods(mobileVersion,mobileName,mobileMade,Float.parseFloat(mobilePrice),mobileMess,mobilePic,Integer.parseInt(id));
			goodsService.add(goods);
		}
	    list(request, response);
	}
	
	public String up(HttpServletRequest req,HttpServletResponse response) throws ServletException, IOException{
		 DiskFileItemFactory factory = new DiskFileItemFactory();  
		 ServletFileUpload upload = new ServletFileUpload(factory);
	      //把文件的中文乱码解决了
	     upload.setHeaderEncoding("utf-8");
		 upload.setFileSizeMax(4 * 1024 * 1024);// 4M
		 upload.setSizeMax(4 * 1024 * 1024);// 6M
	     //设置文件的大小
	     //upload.setSizeMax(20*1024);
	     String  fileName="";
	     try {
	      //[3]获得前台传递过来的所有信息对象 
			List<FileItem> list = upload.parseRequest(req);
		   
			for (FileItem item : list) {
			//System.out.println(item.getFieldName()+"---"+item.getName()+"---"+item.getSize()+"----"+item.getContentType()+"----"+item.isFormField());	
			if(!item.isFormField()){
			//证明是文件对象
		    //f.l.jpg  文件的后缀
			String sub = item.getName().substring(item.getName().lastIndexOf("."));
				/****[2]保证上传的文件名称不重复***********/
				//利用UUID产生文件的 名称
				String uuid = UUID.randomUUID().toString();
				
				//拼接文件的名称
			    fileName=uuid+sub;
				
				/****[2]上传到指定的服务器目录中***********/ 
				 String realPath = req.getSession().getServletContext().getRealPath(imageUrl);
				 
			   /*****[1]上传的目录是否存在的解决*******/
				File  file=new File(realPath);
				
				if (!file.exists() && !file.isDirectory()) {
					// 鍒涘缓鐩綍
					file.mkdir();
				}
				
				//实现文件的上传 把item中的文件上传到指定的目录中
				item.write(new File(file,fileName));	
				return fileName;
			  }			
		  }
		
		} catch (Exception e) {			
			e.printStackTrace();
		} 
	    return fileName;
	}
	
	/**
	 * 上传图片方案二
	 * 
	 * @param request
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 * @throws FileUploadException 
	 */
/*	private String upload(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException, FileUploadException {
		PrintWriter outText = response.getWriter();
		String savePath =request.getSession().getServletContext().getRealPath(imageUrl);
		String resultUrl = "";
		File file = new File(savePath);

		if (!file.exists() && !file.isDirectory()) {
			// 鍒涘缓鐩綍
			file.mkdir();
		}
		
        DiskFileItemFactory factory = new DiskFileItemFactory();  
		ServletFileUpload upload = new ServletFileUpload(factory);
		 //把文件的中文乱码解决了
	    upload.setHeaderEncoding("utf-8");
		upload.setFileSizeMax(4 * 1024 * 1024);// 4M
		upload.setSizeMax(4 * 1024 * 1024);// 6M
		
		List<FileItem> items = upload.parseRequest(request);
		
		
		for (FileItem item : items) {
			InputStream in = item.getInputStream(); 
			String fileName = item.getName();
			if (fileName == null || "".equals(fileName.trim())) {
				continue;
			}
			fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
			String fileExt = FileUploadUtil.getFileExt(fileName);
			fileName = System.currentTimeMillis() +"."+ fileExt;
	
			String newStorePath = FileUploadUtil.getTimeDesPath();
			newStorePath = savePath +"\\"+ newStorePath + "\\";
			String storeFile = makeStorePath(newStorePath) + fileName;
			
			resultUrl = imageUrl+newStorePath+fileName;
			
			OutputStream out = new FileOutputStream(storeFile);
			
			
			byte[] b = new byte[1024];
			int len = -1;
			while ((len = in.read(b)) != -1) {
				out.write(b, 0, len);
			}
			outText.print("文件上传");
			in.close();
			out.close();
			item.delete();
		}
		return resultUrl;
	}
	
	 private String makeStorePath(String storePath) {  
        File file = new File(storePath);  
        if(!file.exists())  
        {  
            file.mkdirs();
        }  
        return storePath;  
           
    } */
	 
	/**
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void editUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mobileVersion = request.getParameter("mobileVersion");
		if(mobileVersion!=null&&mobileVersion.trim().length()>0) {
			GoodsServiceImpl goodsService = new GoodsServiceImpl();
			Goods goods = goodsService.queryByVersion(mobileVersion);
			request.setAttribute("goods", goods);
		}
		request.getRequestDispatcher(editGoodsUrl).forward(request, response);
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currentPage = request.getParameter("currentPage");
		String pageSize = request.getParameter("pageSize");
		String mobileVersion = request.getParameter("mobileVersion");
		Integer pageSizeInt = 5;
		Integer currentPageInt = 1;
		if (pageSize != null && pageSize.length() > 0) {
			pageSizeInt = Integer.parseInt(pageSize);
		}
		if (currentPage != null && currentPage.length() > 0) {
			currentPageInt = Integer.parseInt(currentPage);
		}

		GoodsServiceImpl goodsService = new GoodsServiceImpl();
		PageResult pageResult = goodsService.queryByPages(currentPageInt, pageSizeInt,mobileVersion);
		request.setAttribute("pageResult", pageResult);
		request.getRequestDispatcher(goodsListUrl).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
