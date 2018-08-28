package cn.movie.dao.impl;

import cn.movie.beans.User;
import cn.movie.dao.IUserDao;
import cn.movie.utils.DBUtil;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao implements IUserDao {

    private PreparedStatement ps;
    private ResultSet rs;
    Connection connection = DBUtil.getConnection();
    //更新用户信息
    public  User updateUser(User user)  {
        String sql = "update t_user set user_name=?,user_age=?," +
                "user_pswd=?,user_phone=? where user_id=?";
        try{
            ps = connection.prepareStatement(sql);
            ps.setString(1, user.getUser_name());
            ps.setInt(2, user.getUser_age());
            ps.setString(3, user.getUser_pswd());
            ps.setString(4, user.getUser_phone());
            ps.setString(5, user.getUser_id());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    //删除用户
    public void delUser(User user){
        String sql = "DELETE from t_user where user_name=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, user.getUser_name());
            ps.execute();

        }catch (SQLException e) {
            e.printStackTrace();
        }

    }

    //新增用户
    public void addUser(User user) {

        String sql = "insert into t_user values(?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, user.getUser_id());
            ps.setString(2, user.getUser_name());
            ps.setInt(3, user.getUser_age());
            ps.setString(4, user.getUser_sex());
            ps.setString(5, user.getUser_pswd());
            ps.setBigDecimal(6, user.getUser_money());
            ps.setString(7, user.getUser_phone());
            ps.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean isExist(String user_name) {
        boolean flag = false;

        String sql = "select *from t_user where user_name=?";

        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, user_name);
            rs = ps.executeQuery();
            if (rs.next()) {
                flag = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public boolean loginUser(User user) {
        boolean flag = false;
     /*   Connection connection = DBUtil.getConnection();*/
        String sql = "select *from t_user where user_name=? and user_pswd=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, user.getUser_name());
            ps.setString(2, user.getUser_pswd());
            rs = ps.executeQuery();
            if (rs.next()) {
                flag = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;

    }
   /* 充值*/
    public  boolean addMoney(String user_name, BigDecimal number){
        boolean flag = false;
        String sql = "update t_user set user_money=user_money+?  where user_name=? ";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(2, user_name);
            ps.setBigDecimal(1, number);
            if (ps.execute()) {
                flag = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;


    }


}
