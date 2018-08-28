package cn.movie.servlet;

import cn.movie.beans.Movie;
import cn.movie.dao.IMovieDao;
import cn.movie.dao.impl.MovieDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class ViewMovieServlet extends HttpServlet {
    /* protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

     }
 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Movie> movieList;
        IMovieDao movieDao = new MovieDao();
        movieList = movieDao.viewMovie();
        request.setAttribute("movieList", movieList);
        request.getRequestDispatcher("movieinfo.jsp").forward(request, response);
    }
}
