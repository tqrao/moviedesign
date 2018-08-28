package cn.movie.servlet;

import cn.movie.beans.User;
import cn.movie.dao.IUserDao;
import cn.movie.dao.impl.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        User user = new User();
        IUserDao userDao = new UserDao();

        user.setUser_id(request.getParameter("user_id"));
        user.setUser_name(request.getParameter("user_name"));
        user.setUser_age(Integer.parseInt(request.getParameter("user_age")));
        user.setUser_pswd(request.getParameter("user_pswd"));
        user.setUser_phone(request.getParameter("user_phone"));
        //money

        userDao.updateUser(user);

        request.getRequestDispatcher("updateuser.jsp?username="+user.getUser_name()).forward(request, response);



    }

    /*protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


    }*/
}
