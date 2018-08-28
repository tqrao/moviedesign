package cn.movie.servlet;

import cn.movie.dao.ICinemaDao;
import cn.movie.dao.impl.CinemaDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HandleCinemaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String edit = request.getParameter("edit");
        String del = request.getParameter("del");
        if(edit !=null){



        }

        if(del !=null){
            String cinema_id = request.getParameter("cinema_id");
            ICinemaDao cinemaDao = new CinemaDao();
            cinemaDao.delCinema(cinema_id);
            response.sendRedirect("../admin/cinemaList.jsp");
        }

    }

}