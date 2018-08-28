package cn.movie.servlet;

import cn.movie.dao.IOrderDao;
import cn.movie.dao.impl.OrderDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HandleOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String order_id = request.getParameter("order_id");
        IOrderDao orderDao = new OrderDao();
        orderDao.delOrder(order_id);
        response.sendRedirect("../admin/orderList.jsp");

    }


}
