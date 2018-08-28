package cn.movie.beans;

import java.math.BigDecimal;

public class Order {
    private String order_id;
    private String user_id;
    private String user_name;
    private int cinema_id;
    private String cinema_name;
    private int room_id;
    private String room_name;
    private String order_date;
    private String cinema_addr;
    private String movie_name;
    private String movie_type;
    private String showtime;
    private int order_count;
    private BigDecimal movie_price;
    private int seat_row;
    private int seat_col;

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public int getCinema_id() {
        return cinema_id;
    }

    public void setCinema_id(int cinema_id) {
        this.cinema_id = cinema_id;
    }

    public String getCinema_name() {
        return cinema_name;
    }

    public void setCinema_name(String cinema_name) {
        this.cinema_name = cinema_name;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public String getRoom_name() {
        return room_name;
    }

    public void setRoom_name(String room_name) {
        this.room_name = room_name;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public String getCinema_addr() {
        return cinema_addr;
    }

    public void setCinema_addr(String cinema_addr) {
        this.cinema_addr = cinema_addr;
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

    public String getShowtime() {
        return showtime;
    }

    public void setShowtime(String showtime) {
        this.showtime = showtime;
    }

    public int getOrder_count() {
        return order_count;
    }

    public void setOrder_count(int order_count) {
        this.order_count = order_count;
    }

    public BigDecimal getMovie_price() {
        return movie_price;
    }

    public void setMovie_price(BigDecimal movie_price) {
        this.movie_price = movie_price;
    }

    public int getSeat_row() {
        return seat_row;
    }

    public void setSeat_row(int seat_row) {
        this.seat_row = seat_row;
    }

    public int getSeat_col() {
        return seat_col;
    }

    public void setSeat_col(int seat_col) {
        this.seat_col = seat_col;
    }


}
