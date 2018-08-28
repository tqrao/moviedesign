package cn.movie.dao.impl;


import cn.movie.beans.Comment;
import cn.movie.dao.ICommentDao;
import cn.movie.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CommentDao implements ICommentDao {
    private PreparedStatement ps;
    private ResultSet rs;
    Connection connection = DBUtil.getConnection();

    /*删除电影*/
    public  void delComment(String comment_id) {
        String sql = "DELETE from t_comment where comment_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, comment_id);
            ps.execute();

        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void add(Comment com){
        String sql = "insert into t_comment(movie_name, comment_content, comment_time, user_name) values(?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, com.getMovie_name());
            ps.setString(2, com.getComment_content());
            ps.setString(3, com.getComment_time());
            ps.setString(4, com.getUser_name());
            ps.execute();

        }catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
