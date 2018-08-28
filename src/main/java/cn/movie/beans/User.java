package cn.movie.beans;

import java.math.BigDecimal;

public class User {


    private String user_id;
    private String user_name;
    private int user_age;
    private String user_sex;
    private String user_pswd;
    private BigDecimal user_money;
    private String user_phone;



    public String getUser_id() { return user_id; }

    public void setUser_id(String user_id) { this.user_id = user_id; }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public int getUser_age() {
        return user_age;
    }

    public void setUser_age(int user_age) {
        this.user_age = user_age;
    }

    public String getUser_sex() {
        return user_sex;
    }

    public void setUser_sex(String user_sex) {
        this.user_sex = user_sex;
    }

    public String getUser_pswd() {
        return user_pswd;
    }

    public void setUser_pswd(String user_pswd) {
        this.user_pswd = user_pswd;
    }

    public BigDecimal getUser_money() {
        return user_money;
    }

    public void setUser_money(BigDecimal user_money) {
        this.user_money = user_money;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }


}
