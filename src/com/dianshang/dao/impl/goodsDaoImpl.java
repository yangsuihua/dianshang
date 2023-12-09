package com.dianshang.dao.impl;

import com.dianshang.bean.goods;
import com.dianshang.dao.goodsDao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class goodsDaoImpl implements goodsDao {
    public Connection conn = JDBC.getconnect();

    List<goods> list=null;
    @Override
    public List<goods> GetGoodsList(String userId) {
        list=new ArrayList<>();
        try {
            //获取连接

            // 运行SQL语句
            String sql = "SELECT * from goods";
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()) {
                //实例化VO
            goods good = new goods();
                good.setGood_id(rs.getString("good_id"));
                good.setGood_name(rs.getString("good_name"));
                good.setGood_price(rs.getFloat("good_price"));
                good.setImage(rs.getString("Image"));
                list.add(good);
            }
            rs.close();
            stat.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {// 关闭连接
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        System.out.println(list.toString());
        //开始给list的count赋值
        users_goodsDaoImpl users_goodsDaoImpl = new users_goodsDaoImpl();
        List<goods> goods = users_goodsDaoImpl.ShowCar(userId);
        System.out.println(goods.toString());
        for(goods g1:goods){
            for(goods g2:list){
                if(g1.getGood_id().equals(g2.getGood_id())){g2.setCount(g1.getCount());}
            }
        }
        System.out.println(list.toString());
        return list;

    }
    @Override
    public List<goods> SearchGoods(String name,String userid){
        list=new ArrayList<>();
        CallableStatement clbStmt = null;
        try {
            clbStmt = conn.prepareCall("{call proc_show(?)}");

            // 设置输入参数
            clbStmt.setString(1, name); // 查询第3页数据
            ResultSet rs = clbStmt.executeQuery();
            while (rs.next()) {
                //实例化VO
                goods good = new goods();
                good.setGood_id(rs.getString("good_id"));
                good.setGood_name(rs.getString("good_name"));
                good.setGood_price(rs.getFloat("good_price"));
                good.setImage(rs.getString("Image"));
                list.add(good);
            }
            clbStmt.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {// 关闭连接
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        System.out.println(list.toString());
        //开始给list的count赋值
        users_goodsDaoImpl users_goodsDaoImpl = new users_goodsDaoImpl();
        List<goods> goods = users_goodsDaoImpl.ShowCar(userid);
        System.out.println(goods.toString());
        for(goods g1:goods){
            for(goods g2:list){
                if(g1.getGood_id().equals(g2.getGood_id()))
                //如果id相同，代表这个id有count需要赋值
                {g2.setCount(g1.getCount());
                }
            }
        }
        System.out.println(list.toString());
        return list;

    }
}
