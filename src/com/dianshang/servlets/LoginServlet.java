package com.dianshang.servlets;

import com.dianshang.dao.impl.usersDaoImpl;
import com.dianshang.dao.usersDao;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        usersDaoImpl usersDao = new usersDaoImpl();
        System.out.println(name+"  "+password);
        resp.setContentType("text/html;charset=utf-8");
        if(usersDao.login(name, password)){
            //登录成功，然后跳转到首页页面
            System.out.println("s");
            Cookie cookie = new Cookie("name", name);
            cookie.setMaxAge(3600);//设置cookie过期时间为1个小时
       //设置路径，这个路径即该工程下都可以访问该cookie 如果不设置路径，那么只有设置该cookie路径及其子路径可以访问
            cookie.setPath("/");
            resp.addCookie(cookie);
            sendResponse(resp, 1); // 登录成功
        }else{
            //登录失败，账号不存在或密码错误
            System.out.println("f");
            sendResponse(resp, 0); // 登录成功
        }
    }

    @Override
    public void destroy() {
        super.destroy();
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
    private void sendResponse(HttpServletResponse response, int status) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        out.print("{\"status\":" + status + "}");
        out.flush();
    }
}
