package cn.movie.dao.impl;


import cn.movie.beans.Movie;
import cn.movie.dao.IMovieDao;
import cn.movie.utils.DBUtil;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDao implements IMovieDao {
    private PreparedStatement ps;
    private ResultSet rs;
    Connection connection = DBUtil.getConnection();

    /*添加电影*/
    public void addMovie(Movie movie) {

        String sql = "INSERT INTO t_movie(movie_name, movie_type, movie_price, movie_info, director, roles, screentime, movie_img) VALUES(?,?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);

            ps.setString(1, movie.getMovie_name());
            ps.setString(2, movie.getMovie_type());
            ps.setBigDecimal(3, movie.getMovie_price());
            ps.setString(4, movie.getMovie_info());
            ps.setString(5, movie.getDirector());
            ps.setString(6, movie.getRoles());
            ps.setString(7, movie.getScreentime());
            ps.setString(8, "img/"+movie.getMovie_img());

            ps.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /*查询电影是否存在*/
    public boolean isExist(String movie_name) {
        boolean flag = false;
        String sql = "SELECT *FROM t_movie WHERE movie_name=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, movie_name);
            rs = ps.executeQuery();
            if (rs.next()) {
                flag = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    /*查看电影*/
    public List<Movie> viewMovie() {

        List<Movie> movieList = new ArrayList<>();
        String sql = "SELECT *FROM t_movie";

        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String movie_name = rs.getString("movie_name");
                String movie_type = rs.getString("movie_type");
                String movie_info = rs.getString("movie_info");
                BigDecimal movie_price = new BigDecimal(rs.getString("movie_price"));
                String director = rs.getString("director");
                String roles = rs.getString("roles");
                String screentime = rs.getString("screentime");
                String movie_img = rs.getString("movie_img");

                Movie movie = new Movie();

                movie.setMovie_name(movie_name);
                movie.setDirector(director);
                movie.setMovie_type(movie_type);
                movie.setMovie_price(movie_price);
                movie.setScreentime(screentime);
                movie.setMovie_img(movie_img);
                movieList.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movieList;
    }




    /*删除电影*/

    public  void delMovie(String movie_id) {
        String sql = "DELETE from t_movie where movie_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, movie_id);
            ps.execute();

        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    /*查找电影*/

    public Movie searchMovie(String movie_id){
        Movie movie=new Movie();
        String sql = "SELECT *FROM t_movie WHERE movie_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, movie_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                movie.setMovie_id(movie_id);
                movie.setMovie_name(rs.getString("movie_name"));
                movie.setDirector(rs.getString("director"));
                movie.setMovie_type(rs.getString("movie_type"));
                movie.setRoles(rs.getString("roles"));
                movie.setMovie_price(rs.getBigDecimal("movie_price"));
                movie.setScreentime(rs.getString("screentime"));
                movie.setMovie_img(rs.getString("movie_img"));
                movie.setMovie_info(rs.getString("movie_info"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movie;
    }

    /*更新电影*/
   public  void updateMovie(Movie movie){
       String sql = "update t_movie set movie_name=?,movie_type=?,movie_price=?," +
               "movie_info=?,director=?,roles=?,screentime=?,movie_img=? where movie_id=?";
       try{
           ps = connection.prepareStatement(sql);
           ps.setString(1, movie.getMovie_name());
           ps.setString(2, movie.getMovie_type());
           ps.setString(3, movie.getMovie_price().toString());
           ps.setString(4, movie.getMovie_info());
           ps.setString(5, movie.getDirector());
           ps.setString(6, movie.getRoles());
           ps.setString(7, movie.getScreentime());
           ps.setString(8, movie.getMovie_img());
           ps.setString(9, movie.getMovie_id());
           ps.execute();
       } catch (SQLException e) {
           e.printStackTrace();
       }
   }


}
