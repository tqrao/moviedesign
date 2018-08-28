package cn.movie.servlet;

import cn.movie.dao.IShowDao;
import cn.movie.dao.impl.ShowDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HandleShowServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String edit = request.getParameter("edit");
        String del = request.getParameter("del");
        if(edit !=null){



        }

        if(del !=null){
            String show_id = request.getParameter("show_id");
            IShowDao showDao = new ShowDao();
            showDao.delShow(show_id);
            response.sendRedirect("../admin/showList.jsp");
        }

    }


}
