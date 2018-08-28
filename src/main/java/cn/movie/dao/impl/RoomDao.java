package cn.movie.dao.impl;

import cn.movie.beans.Room;
import cn.movie.dao.IRoomDao;
import cn.movie.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RoomDao implements IRoomDao {
    private PreparedStatement ps;
    private ResultSet rs;
    Connection connection = DBUtil.getConnection();
    /* 添加影厅*/
    public void addRoom(Room room){
        String sql = "insert into t_room(cinema_name,room_name,row,col) values(?,?,?,?)";
        try{
            ps = connection.prepareStatement(sql);
            ps.setString(1, room.getCinema_name());
            ps.setString(2, room.getRoom_name());
            ps.setInt(3, room.getRow());
            ps.setInt(4, room.getCol());
            ps.execute();
        }catch (SQLException e) {
            e.printStackTrace();
        }

    }

    /*删除影厅*/
    public  void delRoom(String room_id) {
        String sql = "DELETE from t_room where room_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, room_id);
            ps.execute();

        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
