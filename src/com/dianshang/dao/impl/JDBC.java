package com.dianshang.dao.impl;


import java.sql.*;//导包
//新建一个测试类
public class JDBC {

    static String databaseName="shopping";//数据库名
    static String user = "root";//使用管理员账号启动
    static String pwd = "abc888";//数据库密码
    static String URL = "jdbc:mysql://localhost:3306/"+databaseName+"?useSSL=false&serverTimezone=UTC";
    static String DRIVER = "com.mysql.cj.jdbc.Driver";


    public static void main(String[] args) {
        JDBC myJDBC = new JDBC();
        System.out.println(myJDBC.getconnect());
    }

    public static Connection getconnect() {
        Connection connection = null;
        Statement statement = null;
        try {
            //启动JDBC驱动
            Class.forName(DRIVER);
            //链接数据库
            connection = DriverManager.getConnection(URL, user, pwd);
            return connection;




            //下面是异常处理
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } return null;
    }
}




