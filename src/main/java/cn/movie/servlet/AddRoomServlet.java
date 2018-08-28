package cn.movie.servlet;

import cn.movie.beans.Room;
import cn.movie.dao.IRoomDao;
import cn.movie.dao.impl.RoomDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cinema_name=request.getParameter("cinema_name");
        String room_name=request.getParameter("room_name");
        int row=Integer.parseInt(request.getParameter("row"));
        int col=Integer.parseInt(request.getParameter("col"));

        Room room=new Room();

        room.setCinema_name(cinema_name);
        room.setRoom_name(room_name);
       room.setCol(col);
       room.setRow(row);
        IRoomDao cinemaDao=new RoomDao();
        cinemaDao.addRoom(room);
        response.sendRedirect("../admin/roomList.jsp");
    }


}
