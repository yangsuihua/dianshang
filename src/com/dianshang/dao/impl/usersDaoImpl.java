package com.dianshang.dao.impl;

import com.dianshang.bean.users;
import com.dianshang.dao.usersDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class usersDaoImpl implements usersDao {


    public Connection conn = JDBC.getconnect();
    @Override
    public boolean regist(String user_id,String password,String Address,String TEL){
        boolean flag=false;
        try {
            //获取连接

            // 运行SQL语句
            String sql = "SELECT * FROM users WHERE user_id = \"" + user_id+ "\"";
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);

            String sql1 = "SELECT * FROM users WHERE tel = \"" + TEL+ "\"";
            Statement stat1 = conn.createStatement();
            ResultSet rs1 = stat1.executeQuery(sql1);
            if (rs.next()||rs1.next()) {
                System.out.println(sql);
                System.out.println(sql1);
                //userid重复了或者电话重复了
                return flag;
            }else{
                System.out.println("login2");
                System.out.println(sql);
                System.out.println(sql1);
                //如果可以注册
                PreparedStatement pStmt=conn.prepareStatement("INSERT INTO users  "+"values(?,?,?,?)");
                pStmt.setString(1,user_id);
                pStmt.setString(2,Address);
                pStmt.setString(3,password);
                pStmt.setString(4,TEL);
                int j=pStmt.executeUpdate();

                flag=true;
            }
            rs.close();
            rs1.close();
            stat.close();
            stat1.close();
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
    public boolean login(String id,String password) {
        boolean flag=false;

        try {
            //获取连接

            // 运行SQL语句
            String sql = "SELECT * FROM users WHERE user_id = \"" + id+ "\"";
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            if (rs.next()) {
                //实例化VO
                users user = new users();
                user.setUser_id(rs.getString("user_id"));
                user.setPassword(rs.getString("password"));
                user.setAddres(rs.getString("addres"));
                user.setTel(rs.getString("tel"));

                if(user.getPassword().equals(password)){
                    flag=true;}
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
}
