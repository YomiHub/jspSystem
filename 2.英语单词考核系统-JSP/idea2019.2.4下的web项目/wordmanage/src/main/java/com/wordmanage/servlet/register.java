package com.wordmanage.servlet;

import com.wordmanage.bean.User;
import com.wordmanage.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/register")
public class register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String backNews="";
        String username =request.getParameter("username");
        String password = request.getParameter("password");
        String rePass = request.getParameter("rePass");
        if(!password.equals(rePass)){
            backNews="密码输入错误~";
            backNew(request, response,backNews);
            return;
        }
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        UserDao userdao = new UserDao();

        try {
            userdao.addUser(user);
            backNews="注册成功!";
            backNew(request, response, backNews);
        } catch (SQLException e) {
            backNews="用户名被占用";
            backNew(request, response,backNews);
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void backNew(HttpServletRequest request, HttpServletResponse response,String backNews) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        User userBean  = null;
        HttpSession session = request.getSession(true);
        userBean = (User)session.getAttribute("userBean");
        userBean.setInfoBackNews(backNews);
        //重定向
        response.sendRedirect(request.getContextPath()+"/index.jsp");
       /* }catch(IOException e) {
            userBean = (User)session.getAttribute("loginBean");
            userBean.setInfoBackNews("抛出异常"+e.toString());
        }*/
    }

}
