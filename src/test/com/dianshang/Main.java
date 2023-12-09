package test.com.dianshang;

import com.dianshang.dao.impl.goodsDaoImpl;
import com.dianshang.dao.impl.usersDaoImpl;
import com.dianshang.dao.impl.users_goodsDaoImpl;

public class Main {
    public static void main(String[] args) {
        goodsDaoImpl goodsDao = new goodsDaoImpl();
        System.out.println(goodsDao.GetGoodsList("U001"));
//        goodsDao.SearchGoods("酒","123");
//        users_goodsDaoImpl users_goodsDaoImpl = new users_goodsDaoImpl();
//        System.out.println(users_goodsDaoImpl.ShowCar("123").toString());
//        System.out.println(users_goodsDaoImpl.addshop("123","G006",1));
//        System.out.println(users_goodsDaoImpl.clear("123"));
//        usersDaoImpl usersDaoImpl = new usersDaoImpl();
//        System.out.println(usersDaoImpl.login("U001", "1S23"));
//        System.out.println(usersDaoImpl.regist("U010","S29231","广东省广州市","159184932"));

    }
}
