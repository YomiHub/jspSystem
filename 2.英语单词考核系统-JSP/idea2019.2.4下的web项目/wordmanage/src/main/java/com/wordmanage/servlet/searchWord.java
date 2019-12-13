package com.wordmanage.servlet;

import com.wordmanage.bean.Word;
import com.wordmanage.dao.WordDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/searchWord")
public class searchWord extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String key = request.getParameter("key");

        WordDao wordDao = new WordDao();
        List<Word> list = wordDao.getList(key);
        request.setAttribute("searchList", list);
        request.getRequestDispatcher("/listWord?currentPage=1&pageSize=5&type=b").forward(request, response);
    }
}
