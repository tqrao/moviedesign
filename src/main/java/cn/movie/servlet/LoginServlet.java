package cn.movie.servlet;

import cn.movie.beans.User;
import cn.movie.dao.IUserDao;
import cn.movie.dao.impl.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        /*输入参数为空*/
        if ("".equals(username)) {
            request.setAttribute("error", "用户名不能为空");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        if ("".equals(password) ) {
            request.setAttribute("error", "密码不能为空");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        IUserDao userDao = new UserDao();
        User user = new User();
        user.setUser_name(username);
        user.setUser_pswd(password);
        if(userDao.loginUser(user)) {
            response.sendRedirect(request.getContextPath()+"/index.jsp?username="+username);
        }
        else {
            request.setAttribute("error", "登陆失败");
            response.sendRedirect(request.getContextPath()+"/jsp/login.jsp");
        }
    }

   /* protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }*/
}
