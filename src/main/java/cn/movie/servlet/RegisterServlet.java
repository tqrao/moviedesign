package cn.movie.servlet;

import cn.movie.beans.User;
import cn.movie.dao.IUserDao;
import cn.movie.dao.impl.UserDao;

import java.io.IOException;
import java.math.BigDecimal;

public class RegisterServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {
        //String user_name = new String(request.getParameter("user_name").getBytes("ISO-8859-1"),"utf-8");
        String user_name = request.getParameter("user_name");
        String user_pswd = request.getParameter("user_pswd");
        String reuser_pswd = request.getParameter("user_pswd1");
        String user_age = request.getParameter("user_age");
        String user_id = request.getParameter("user_id");
        String user_phone = request.getParameter("user_phone");
        String user_sex = request.getParameter("user_sex");
        /*输入参数为空*/
        if ("".equals(user_name)) {
            request.setAttribute("error", "用户名不能为空");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        } else if ("".equals(user_pswd)) {
            request.setAttribute("error", "密码不能为空");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        } else if ("".equals(reuser_pswd)) {
            request.setAttribute("error", "密码不能为空");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        } else if (!reuser_pswd.equals(user_pswd)) {
            request.setAttribute("error", "密码不一致");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }


        IUserDao userDao = new UserDao();

        /*用户名已存在*/
        if (userDao.isExist(user_name)) {
            request.setAttribute("error", "用户名已存在");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        if (user_age == "") user_age = new String("0");


        User user = new User();
        //初始值设为0
        BigDecimal a = new BigDecimal(0);
        user.setUser_money(a);


        user.setUser_id(user_id);
        user.setUser_name(user_name);
        user.setUser_pswd(user_pswd);
        user.setUser_age(Integer.valueOf(user_age));
        user.setUser_phone(user_phone);
        user.setUser_sex(user_sex);
        userDao.addUser(user);

        response.sendRedirect("login.jsp");


    }

    /*protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {

    }*/
}
