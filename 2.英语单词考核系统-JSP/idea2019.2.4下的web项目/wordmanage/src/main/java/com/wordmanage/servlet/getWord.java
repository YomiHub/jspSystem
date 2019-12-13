package com.wordmanage.servlet;

import com.wordmanage.bean.Word;
import com.wordmanage.dao.WordDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/getWord")
public class getWord extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        WordDao wordDao = new WordDao();
        Word word = new Word();
        try {
            word = wordDao.getWord();
            request.setAttribute("word", word);
            request.getRequestDispatcher("/listWord?currentPage=1&pageSize=5&type=b").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
