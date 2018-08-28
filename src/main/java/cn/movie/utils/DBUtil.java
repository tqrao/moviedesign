package cn.movie.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    private static final String DRIVER ="com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/data_movie?characterEncoding=UTF-8";
    private static final String USER="root";
    private static final String PASSWORD="123456";

    private static Connection connection;
    public static Connection getConnection(){

        try{
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,USER,PASSWORD);
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return connection;
    }
}
