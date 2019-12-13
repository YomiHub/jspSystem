package com.wordmanage.servlet;

import com.wordmanage.bean.Word;
import com.wordmanage.dao.WordDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/checkWord")
public class checkWord extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        String english =request.getParameter("english");
        String chinese = request.getParameter("chinese");

        WordDao wordDao = new WordDao();
        try {
            String back = wordDao.getChineseByEng(english);
            if(back.equals(chinese)){
                backNew(request,response,true);
            }else{
                backNew(request,response,false);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void backNew(HttpServletRequest request, HttpServletResponse response,Boolean backNews) throws IOException, ServletException {
        response.setContentType("text/html;charset=utf-8");
        Word wordBean  = null;
        HttpSession session = request.getSession(true);
        wordBean = (Word)session.getAttribute("wordBean");
        if(backNews){
            wordBean.setInfoBackNews("答对了，你真棒！");
        }else {
            wordBean.setInfoBackNews("太遗憾，答错了~");
        }
        request.setAttribute("word", wordBean);
        request.getRequestDispatcher("/listWord?currentPage=1&pageSize=5&type=b").forward(request, response);
    }
}
