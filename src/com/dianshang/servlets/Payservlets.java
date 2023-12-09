package com.dianshang.servlets;

import com.dianshang.dao.impl.users_goodsDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class Payservlets extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String name = req.getParameter("userId");

        users_goodsDaoImpl users_goods = new users_goodsDaoImpl();

        resp.setContentType("text/html;charset=utf-8");
        if(users_goods.clear(name)){
            //删除duo条数据
            sendResponse(resp, 1);
        }else{
            //删除0条数据
            System.out.println("f");
            sendResponse(resp, 0);
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
