package cn.movie.beans;

import java.math.BigDecimal;
import java.sql.Blob;

public class Movie {
    private String movie_id;
    private String movie_name;
    private String movie_type;
    private BigDecimal movie_price;
    private String movie_info;
    private String director;
    private String roles;
    private String screentime;
    private String movie_img;

    public String getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(String movie_id) {
        this.movie_id = movie_id;
    }

    public String getMovie_name() {
        return movie_name;
    }

    public void setMovie_name(String movie_name) {
        this.movie_name = movie_name;
    }

    public String getMovie_type() {
        return movie_type;
    }

    public void setMovie_type(String movie_type) {
        this.movie_type = movie_type;
    }

    public BigDecimal getMovie_price() {
        return movie_price;
    }

    public void setMovie_price(BigDecimal movie_price) {
        this.movie_price = movie_price;
    }

    public String getMovie_info() {
        return movie_info;
    }

    public void setMovie_info(String movie_info) {
        this.movie_info = movie_info;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public String getScreentime() {
        return screentime;
    }

    public void setScreentime(String screentime) {
        this.screentime = screentime;
    }

    public String getMovie_img() {
        return movie_img;
    }

    public void setMovie_img(String movie_img) {
        this.movie_img = movie_img;
    }


}
