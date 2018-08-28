package cn.movie.dao.impl;

import cn.movie.beans.Account;
import cn.movie.dao.IAccountDao;
import cn.movie.utils.DBUtil;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDao  implements IAccountDao {
    private PreparedStatement ps;
    private ResultSet rs;
    Connection connection = DBUtil.getConnection();

     public  boolean accCorrect(Account acc){
         boolean flag = false;

         String sql = "select *from t_account where name=? and type=? and pswd=?";

         try {
             ps = connection.prepareStatement(sql);
             ps.setString(1, acc.getName());
             ps.setString(2, acc.getType());
             ps.setString(3, acc.getPswd());
             rs = ps.executeQuery();
             if (rs.next()) {
                 flag = true;
             }

         } catch (SQLException e) {
             e.printStackTrace();
         }
         return flag;

     }

     //设想账号余额足够

   public boolean deduct(Account acc, BigDecimal num){

       boolean flag = false;

       String sql = "update t_account set money=money-?  where name=? ";

       try {
           ps = connection.prepareStatement(sql);
           ps.setBigDecimal(1, num);
           ps.setString(2, acc.getName());
           ps.execute();
           flag = true;

       } catch (SQLException e) {
           e.printStackTrace();
       }
       return flag;

   }

}
