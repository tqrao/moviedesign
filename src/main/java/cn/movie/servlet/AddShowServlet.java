package cn.movie.servlet;

import cn.movie.beans.Show;
import cn.movie.dao.IShowDao;
import cn.movie.dao.impl.ShowDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddShowServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cinema_name = request.getParameter("cinema_name");
        String movie_name = request.getParameter("movie_name");
        String room_name=request.getParameter("room_name");
        String show_time=request.getParameter("show_time");

       Show show=new Show();
       show.setCinema_name(cinema_name);
       show.setMovie_name(movie_name);
       show.setRoom_name(room_name);
       show.setShow_time(show_time);
        IShowDao showDao=new ShowDao();
        showDao.addshow(show);


        response.sendRedirect("../admin/showList.jsp");

    }


}
