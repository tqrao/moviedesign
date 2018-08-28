package cn.movie.dao;

import cn.movie.beans.Cinema;

public interface ICinemaDao {
    void delCinema(String cinema_id);

    void addCinema(Cinema cinema);
}
