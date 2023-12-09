package com.dianshang.dao.impl;

import com.dianshang.bean.goods;
import com.dianshang.dao.users_goodsDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class users_goodsDaoImpl implements users_goodsDao {
    List<goods> list=null;
    Connection conn=JDBC.getconnect();
    @Override
    public List<goods> ShowCar(String userid){
        list=new ArrayList<>();
        try {
            //获取连接
            // 运行SQL语句
            String sql = "SELECT users_goods.user_id, users_goods.good_id, users_goods.count, goods.* from users_goods JOIN goods ON users_goods.good_id = goods.good_id WHERE" +
                    " users_goods.user_id = \""+userid+ "\"";
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()) {
                //实例化VO
                goods good = new goods();
                good.setGood_id(rs.getString("good_id"));
                good.setGood_name(rs.getString("good_name"));
                good.setGood_price(rs.getFloat("good_price"));
                good.setImage(rs.getString("Image"));
                good.setCount(rs.getInt("COUNT"));
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
        return list;
    }
    @Override
    public boolean addshop(String userid,String goodid,int num){

        boolean flag=false;
        try {
            //获取连接
            // 运行SQL语句
            String sql = "SELECT * FROM users_goods WHERE good_id=\""+goodid+ "\""+"And user_id=\""+userid+"\"";
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            if(rs.next()){
                //有的话
                PreparedStatement pStmt=conn.prepareStatement("UPDATE users_goods SET count = ? WHERE good_id = ? AND user_id = ?");
                pStmt.setInt(1,num);
                pStmt.setString(2,goodid);
                pStmt.setString(3,userid);
                int j=pStmt.executeUpdate();
                System.out.println("有的话的结果j是"+j);
                if(j!=0){flag=true;}

            }else{
                //没有的话
                PreparedStatement pStmt=conn.prepareStatement("INSERT INTO users_goods   "+"values(?,?,?)");
                pStmt.setString(1,userid);
                pStmt.setString(2,goodid);
                pStmt.setInt(3,1);
                int j=pStmt.executeUpdate();
                if(j!=0){flag=true;}

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
        return flag;
    }
    @Override
    public boolean clear(String name) {
        boolean flag=false;
        try {
            //获取连接
            // 运行SQL语句
            Statement stmt = conn.createStatement();
            //4.执行sql语句
            String sql = "delete from users_goods where user_id=\""+name+"\"";
            int count = stmt.executeUpdate(sql);

            if(count!=0){
                //有的话
                flag=true;

            }
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
        return flag;
    }
}
