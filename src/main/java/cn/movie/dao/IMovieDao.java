package cn.movie.dao;

import cn.movie.beans.Movie;

import java.util.List;

public interface IMovieDao {
    void addMovie(Movie movie);
    //boolean queryMovie(String movie_name);
    List<Movie> viewMovie();

    boolean isExist(String movie_name);
    void delMovie(String movie_name);

    Movie searchMovie(String movie_id);

    void updateMovie(Movie movie);
}
