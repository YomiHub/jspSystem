package com.wordmanage.servlet;

import com.wordmanage.dao.WordDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteWord")
public class deleteWord extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String deleteId = request.getParameter("id");

        Integer id = 1;
        if(deleteId!=null) {
            id = Integer.parseInt(deleteId);
        }
        WordDao wordDao = new WordDao();
        if(wordDao.delete(id)){
            //演示重定向,无须刷新页面,直接打开一个新的请求
            response.sendRedirect("/listWord?currentPage=1&pageSize=5");
        }
    }
}
