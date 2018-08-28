package cn.movie.dao.impl;

import cn.movie.beans.Show;
import cn.movie.dao.IShowDao;
import cn.movie.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ShowDao implements IShowDao {
    private PreparedStatement ps;
    private ResultSet rs;
    Connection connection = DBUtil.getConnection();

    /*增加排片*/
    public void addshow(Show show){
        String sql = "insert into t_show(movie_name,cinema_name,room_name,show_time) values(?,?,?,?)";
        try{
            ps = connection.prepareStatement(sql);
            ps.setString(1, show.getMovie_name());
            ps.setString(2, show.getCinema_name());
            ps.setString(3, show.getRoom_name());
            ps.setString(4, show.getShow_time());
            ps.execute();
        }catch (SQLException e) {
            e.printStackTrace();
        }

    }

    /*删除排片*/
    public  void delShow(String show_id) {
        String sql = "DELETE from t_show where show_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, show_id);
            ps.execute();

        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
