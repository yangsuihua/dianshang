package com.dianshang.dao;

import com.dianshang.bean.goods;

import java.util.List;

public interface users_goodsDao {
    public List<goods> ShowCar(String userid);
    public boolean addshop(String userid,String goodid,int num);
    public boolean clear(String name);
}
