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
import java.util.List;

@WebServlet("/login")
public class login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String username =request.getParameter("username");
        String password = request.getParameter("password");
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        UserDao userdao = new UserDao();
        Boolean backNews= false;
        backNews=userdao.getUser(user);
        backNew(request, response,username,backNews);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void backNew(HttpServletRequest request, HttpServletResponse response,String username,Boolean backNews) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        User userBean  = null;
        HttpSession session = request.getSession(true);
        userBean = (User)session.getAttribute("userBean");
        userBean.setUsername(username);
        if(backNews){
            userBean.setInfoBackNews("登录成功");
            response.sendRedirect(request.getContextPath()+"/listWord?currentPage=1&pageSize=5&type=a");
        }else {
            userBean.setInfoBackNews("登录失败");
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }

        //重定向
        //response.sendRedirect(request.getContextPath()+"/index.jsp");
       /* }catch(IOException e) {
            userBean = (User)session.getAttribute("loginBean");
            userBean.setInfoBackNews("抛出异常"+e.toString());
        }*/
    }
}
