package cn.movie.dao;

import cn.movie.beans.User;

import java.math.BigDecimal;


public interface IUserDao {

    void addUser(User user);

    boolean isExist(String username);

    boolean loginUser(User user);
    User updateUser(User user);

    void delUser(User user);

    boolean addMoney(String user_name, BigDecimal number);
}
