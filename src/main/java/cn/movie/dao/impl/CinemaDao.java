package cn.movie.dao.impl;

import cn.movie.beans.Cinema;
import cn.movie.dao.ICinemaDao;
import cn.movie.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CinemaDao implements ICinemaDao {
    private PreparedStatement ps;
    private ResultSet rs;
    Connection connection = DBUtil.getConnection();
   /* 添加影院*/
    public void addCinema(Cinema cinema){
         String sql = "insert into t_cinema(cinema_name,cinema_addr,cinema_info) values(?,?,?)";
         try{
             ps = connection.prepareStatement(sql);
             ps.setString(1, cinema.getCinema_name());
             ps.setString(2, cinema.getCinema_addr());
             ps.setString(3, cinema.getCinema_info());
             ps.execute();
         }catch (SQLException e) {
             e.printStackTrace();
         }

    }
    /*删除电影*/
    public  void delCinema(String cinema_id) {
        String sql = "DELETE from t_cinema where cinema_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, cinema_id);
            ps.execute();

        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
