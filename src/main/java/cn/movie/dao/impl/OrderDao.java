package cn.movie.dao.impl;

import cn.movie.dao.IOrderDao;
import cn.movie.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderDao implements IOrderDao {
    private PreparedStatement ps;
    private ResultSet rs;
    Connection connection = DBUtil.getConnection();

    /*删除电影*/
    public  void delOrder(String order_id) {
        String sql = "DELETE from t_order where order_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, order_id);
            ps.execute();

        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
