package com.dianshang.bean;

public class users {
    private String user_id;
    private String addres;
    private String password;
    private String tel;

    public users() {
    }

    public users(String user_id, String addres, String password, String tel) {
        this.user_id = user_id;
        this.addres = addres;
        this.password = password;
        this.tel = tel;
    }

    @Override
    public String toString() {
        return "users{" +
                "user_id='" + user_id + '\'' +
                ", addres='" + addres + '\'' +
                ", password='" + password + '\'' +
                ", tel='" + tel + '\'' +
                '}';
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getAddres() {
        return addres;
    }

    public void setAddres(String addres) {
        this.addres = addres;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
}
