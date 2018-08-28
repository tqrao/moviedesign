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

public class UpdateMovieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Movie movie=new Movie();
        IMovieDao movieDao=new MovieDao();
        movie.setMovie_id(request.getParameter("movie_id"));
        movie.setMovie_name(request.getParameter("movie_name"));
        movie.setDirector(request.getParameter("director"));
        movie.setMovie_type(request.getParameter("movie_type"));
        movie.setMovie_price(new BigDecimal(request.getParameter("movie_price")));
        movie.setScreentime(request.getParameter("screentime"));
        movie.setMovie_info(request.getParameter("movie_info"));
        movie.setRoles(request.getParameter("roles"));
        movie.setMovie_img(request.getParameter("movie_img"));

        movieDao.updateMovie(movie);
        request.getRequestDispatcher("movieList.jsp").forward(request, response);
    }


}
