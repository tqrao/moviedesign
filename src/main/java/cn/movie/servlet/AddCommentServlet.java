package cn.movie.servlet;

import cn.movie.beans.Comment;
import cn.movie.dao.ICommentDao;
import cn.movie.dao.impl.CommentDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;

public class AddCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String movie_name=request.getParameter("movie_name");
        String user_name=request.getParameter("user_name");
        String comment_time=request.getParameter("comment_time");
        String comment_content=request.getParameter("comment_content");

        if("null".equals(user_name)){
            user_name=new String("user");
        }

        Comment com=new Comment();
        com.setUser_name(user_name);
        com.setMovie_name(movie_name);
        com.setComment_time(comment_time);
        com.setComment_content(comment_content);

        ICommentDao comDao= new CommentDao();
        comDao.add(com);
        movie_name=java.net.URLEncoder.encode(movie_name, "UTF-8");

        response.sendRedirect(request.getContextPath()+"/movie/detailmovie.jsp?movie_name="+movie_name+"&user_name="+user_name);
    }

}
