package com.dianshang.bean;

public class goods {
    private String good_id;
    private String good_name;
    private float good_price;
    private String Image;
    private int count;

    public goods() {
    }

    public goods(String good_id, String good_name, float good_price, String image) {
        this.good_id = good_id;
        this.good_name = good_name;
        this.good_price = good_price;
        Image = image;
    }

    public String getGood_id() {
        return good_id;
    }

    public void setGood_id(String good_id) {
        this.good_id = good_id;
    }

    public String getGood_name() {
        return good_name;
    }

    public void setGood_name(String good_name) {
        this.good_name = good_name;
    }

    public float getGood_price() {
        return good_price;
    }

    public void setGood_price(float good_price) {
        this.good_price = good_price;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String image) {
        Image = image;
    }

    @Override
    public String toString() {
        return "{" +
                "good_id='" + good_id + '\'' +
                ", good_name='" + good_name + '\'' +
                ", good_price=" + good_price +
                ", Image='" + Image + '\'' +
                ", count=" + count +
                '}';
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
