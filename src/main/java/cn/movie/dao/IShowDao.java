package cn.movie.dao;

import cn.movie.beans.Show;

public interface IShowDao {
    void delShow(String show_id);

    void addshow(Show show);
}
