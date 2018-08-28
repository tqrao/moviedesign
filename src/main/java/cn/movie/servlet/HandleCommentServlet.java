package cn.movie.servlet;

import cn.movie.dao.ICommentDao;
import cn.movie.dao.impl.CommentDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HandleCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String comment_id = request.getParameter("comment_id");
        ICommentDao movieDao = new CommentDao();
        movieDao.delComment(comment_id);
        response.sendRedirect("../admin/commentList.jsp");

    }


}
