package com.dianshang.servlets;

import com.dianshang.dao.impl.usersDaoImpl;
import com.dianshang.dao.usersDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        usersDaoImpl usersDao = new usersDaoImpl();
        if(usersDao.regist(name, password, "", phone)){
            // 注册成功
            System.out.println("s");
            sendResponse(resp, 1); // 注册成功
        } else {
            // 注册失败
            //登录成功，然后跳转到首页页面
            System.out.println("f");
            sendResponse(resp, 0); // 注册失败
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
