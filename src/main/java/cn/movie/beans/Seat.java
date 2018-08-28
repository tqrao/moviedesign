package cn.movie.beans;

public class Seat {
    private int show_id;
    private int seat_row;
    private int seat_col;
    private int seat_type;

    public int getShow_id() {
        return show_id;
    }

    public void setShow_id(int show_id) {
        this.show_id = show_id;
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

    public int getSeat_type() {
        return seat_type;
    }

    public void setSeat_type(int seat_type) {
        this.seat_type = seat_type;
    }


}
