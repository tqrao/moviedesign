package cn.movie.servlet;

import cn.movie.dao.IRoomDao;
import cn.movie.dao.impl.RoomDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HandleRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String edit = request.getParameter("edit");
        String del = request.getParameter("del");
        if(edit !=null){

        }

        if(del !=null){
            String room_id = request.getParameter("room_id");
            IRoomDao roomDao = new RoomDao();
            roomDao.delRoom(room_id);
            response.sendRedirect("../admin/roomList.jsp");
        }

    }
}

