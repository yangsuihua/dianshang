package com.dianshang.dao;

public interface usersDao {
    public boolean regist(String user_id,String password,String Address,String TEL);
    public boolean login(String id,String password);
}
