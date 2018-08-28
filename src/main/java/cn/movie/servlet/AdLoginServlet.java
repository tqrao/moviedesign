package cn.movie.servlet;

import cn.movie.beans.Admin;
import cn.movie.dao.IAdminDao;
import cn.movie.dao.impl.AdminDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String adminname = request.getParameter("adminname");
        String password = request.getParameter("password");

        /*输入参数为空*/
        if ("".equals(adminname)) {
            request.setAttribute("error", "用户名不能为空");
            request.getRequestDispatcher("adlogin.jsp").forward(request, response);
            return;
        }
        if ("".equals(password) ) {
            request.setAttribute("error", "密码不能为空");
            request.getRequestDispatcher("adlogin.jsp").forward(request, response);
            return;
        }
        IAdminDao userDao = new AdminDao();
        Admin admin = new Admin();
        admin.setAdmin_name(adminname);
        admin.setAdmin_pswd(password);
        if(userDao.loginAdmin(admin)) {
            request.setAttribute("success", "成功登陆");
            response.sendRedirect(request.getContextPath()+"/admin/adindex.jsp?adminname="+adminname);


        }
        else {

            request.setAttribute("error", "用户名或密码错误");
            response.sendRedirect(request.getContextPath()+"/jsp/adlogin.jsp");

        }

    }

    /*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }*/
}
