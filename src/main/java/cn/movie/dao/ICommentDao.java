package cn.movie.dao;

import cn.movie.beans.Comment;

public interface ICommentDao {
    void delComment(String show_id);

    void add(Comment com);
}
