package cn.movie.dao.impl;

import cn.movie.beans.Admin;
import cn.movie.dao.IAdminDao;
import cn.movie.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDao implements IAdminDao {
    private PreparedStatement ps;
    private ResultSet rs;

    public boolean loginAdmin(Admin admin) {
        boolean flag = false;
        Connection connection = DBUtil.getConnection();
        String sql = "select *from t_admin where admin_name=? and admin_pswd=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, admin.getAdmin_name());
            ps.setString(2, admin.getAdmin_pswd());
            rs = ps.executeQuery();
            if (rs.next()) {
                flag = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;

    }


}
