package cn.movie.servlet;

import cn.movie.beans.Cinema;
import cn.movie.dao.ICinemaDao;
import cn.movie.dao.impl.CinemaDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddCinemaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cinema_name=request.getParameter("cinema_name");
        String cinema_addr=request.getParameter("cinema_addr");
        String cinema_info=request.getParameter("cinema_info");

        Cinema cinema=new Cinema();
        cinema.setCinema_name(cinema_name);
        cinema.setCinema_addr(cinema_addr);
        cinema.setCinema_info(cinema_info);
        ICinemaDao cinemaDao=new CinemaDao();
        cinemaDao.addCinema(cinema);
        response.sendRedirect("../admin/cinemaList.jsp");

    }


}
