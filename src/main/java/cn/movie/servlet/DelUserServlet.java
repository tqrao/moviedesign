package cn.movie.servlet;

import cn.movie.beans.User;
import cn.movie.dao.IUserDao;
import cn.movie.dao.impl.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DelUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username =request.getParameter("user_name");
        User user = new User();
        IUserDao userDao = new UserDao();
        user.setUser_name(username);
        userDao.delUser(user);

        request.setAttribute("success", "注销成功");
        System.out.println(username);
        response.sendRedirect("../admin/userList.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
