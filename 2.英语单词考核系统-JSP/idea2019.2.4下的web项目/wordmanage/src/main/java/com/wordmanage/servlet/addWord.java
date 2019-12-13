package com.wordmanage.servlet;

import com.wordmanage.bean.User;
import com.wordmanage.bean.Word;
import com.wordmanage.dao.UserDao;
import com.wordmanage.dao.WordDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addWord")
public class addWord extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String backNews="";
        String english =request.getParameter("english");
        String chinese = request.getParameter("chinese");
        String type = request.getParameter("type");
        String comm = request.getParameter("comm");

        Word word = new Word();
        word.setEnglish(english);
        word.setChinese(chinese);
        word.setType(type);
        word.setComm(comm);
        WordDao wordDao = new WordDao();

        try {
            wordDao.addWord(word);
            request.getRequestDispatcher("/listWord?currentPage=1&pageSize=5&type=b").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
