package cn.movie.servlet;

import cn.movie.beans.Movie;
import cn.movie.dao.IMovieDao;
import cn.movie.dao.impl.MovieDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HandleMovieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String edit = request.getParameter("edit");
        String del = request.getParameter("del");
        String movie_id = request.getParameter("movie_id");
        IMovieDao movieDao = new MovieDao();
        if(edit !=null){
            Movie movie = movieDao.searchMovie(movie_id);
            request.setAttribute("movie",movie);
            request.getRequestDispatcher("../admin/movieUpdate.jsp").forward(request,response);
        }

        if(del !=null){

           movieDao.delMovie(movie_id);
            response.sendRedirect("../admin/movieList.jsp");
        }
    }

}
