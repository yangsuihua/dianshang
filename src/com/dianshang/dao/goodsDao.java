package com.dianshang.dao;

import com.dianshang.bean.goods;
import com.dianshang.dao.impl.JDBC;

import java.sql.Connection;
import java.util.List;

public interface goodsDao {

    public List<goods> GetGoodsList(String userId);

    public List<goods> SearchGoods(String name,String userid);
}
