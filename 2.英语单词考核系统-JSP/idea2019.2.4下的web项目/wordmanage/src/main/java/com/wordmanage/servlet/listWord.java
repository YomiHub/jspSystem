package com.wordmanage.servlet;

import com.wordmanage.bean.PageResult;
import com.wordmanage.bean.Word;
import com.wordmanage.dao.WordDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/listWord")
public class listWord extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String currentPage = request.getParameter("currentPage");
        String pageSize = request.getParameter("pageSize");
        String type = request.getParameter("type");

        Integer pageSizeInt = 5;
        Integer currentPageInt = 1;
        if(pageSize!=null&&pageSize.length()>0) {
            pageSizeInt = Integer.parseInt(pageSize);
        }
        if(currentPage!=null&&currentPage.length()>0) {
            currentPageInt = Integer.parseInt(currentPage);
        }
        WordDao wordDao=new WordDao();
        PageResult pageResult  = wordDao.queryByPage(currentPageInt,pageSizeInt);
        request.setAttribute("pageResult", pageResult);
        request.getRequestDispatcher("/pages/detail.jsp").forward(request, response);
    }
}
