package cn.movie.servlet;

import cn.movie.beans.Movie;
import cn.movie.dao.IMovieDao;
import cn.movie.dao.impl.MovieDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;



public class AddMovieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String movie_name = request.getParameter("movie_name");
        String movie_type = request.getParameter("movie_type");
        String movie_info = request.getParameter("movie_info");
        String price=request.getParameter("movie_price");
        BigDecimal movie_price = new BigDecimal(price);
        String director = request.getParameter("director");
        String roles = request.getParameter("roles");
        String screentime = request.getParameter("screentime");
        String  movie_img = request.getParameter("movie_img");

        Movie movie = new Movie();

        IMovieDao movieDao = new MovieDao();

        /*用户名已存在*/
        if (movieDao.isExist(movie_name)) {
            request.setAttribute("error", "电影名已存在");
            request.getRequestDispatcher("movieList.jsp").forward(request, response);
            return;
        }

        movie.setMovie_name(movie_name);
        movie.setDirector(director);
        movie.setMovie_type(movie_type);
        movie.setMovie_price(movie_price);
        movie.setScreentime(screentime);
        movie.setMovie_info(movie_info);
        movie.setRoles(roles);
        movie.setMovie_img(movie_img);

        movieDao.addMovie(movie);

        response.sendRedirect(request.getContextPath()+"/admin/movieList.jsp");

    }

   /* protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }*/
}
