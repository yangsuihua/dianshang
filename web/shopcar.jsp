<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023/11/30
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>购物车</title>
    <!-- 引入favicon图标 -->
    <link rel="shortcut icon" href="favicon.ico" />
    <!-- 引入我们初始化的css -->
    <link rel="stylesheet" href="css/base.css">
    <!-- 引入我们自己的注册页面的css -->
    <link rel="stylesheet" href="css/shopcar.css">
    <link rel="stylesheet" href="css/styles.css">
</head>

<body>
<div class="w">
    <header>
        <div class="logo">
            <a href="index.jsp"> <img src="images/logo.png" alt=""></a>
        </div>
    </header>
    <div class="registerarea">
        <h3>
            购物车
            <%@ page import="com.dianshang.dao.impl.users_goodsDaoImpl" %>
            <%@ page import="com.dianshang.bean.goods" %>
            <%@ page import="java.util.List" %>
            <%

                users_goodsDaoImpl users_goods = new users_goodsDaoImpl();
                Cookie[] cookies = request.getCookies();
                String cookieValue = null;
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("name")) {
                            cookieValue = cookie.getValue();
                            break;
                        }
                    }
                }
                List<goods> goods = users_goods.ShowCar(cookieValue);
                int size=0;

                for(goods g1:goods){

                    size+=g1.getCount();
                }
            %>

        </h3>


        <% for (goods good : goods) { %>
        <div class="info">
            <li class="info_1"><img src="images/<%= good.getImage() %>.jpg" alt="这是商品图片"></li>
            <li class="info_2"><a href="#"><%= good.getGood_name() %></a></li>
            <li class="info_3">￥<%= good.getGood_price() %></li>
            <li class="info_4">
                <button onclick="decrementQuantity('<%= good.getGood_id() %>', <%= good.getGood_price() %>)">-</button>
                <input type="text" name="<%=good.getGood_id()%>" id="<%=good.getGood_id()%>" value="<%=good.getCount()%>" oninput="updateTotalPrice('<%=good.getGood_id()%>', <%= good.getGood_price() %>)">
                <button onclick="incrementQuantity('<%= good.getGood_id() %>', <%= good.getGood_price() %>)">+</button>
            </li>
            <li class="info_5" id="totalPrice_<%=good.getGood_id()%>">￥<%= good.getCount() * good.getGood_price() %></li>
        </div>
        <% } %>

        <script>
            function updateTotalPrice(goodId, goodPrice) {
                var quantity = document.getElementById(goodId).value;
                var totalPrice = quantity * goodPrice;
                document.getElementById("totalPrice_" + goodId).innerHTML = "￥" + totalPrice;
                updateOverallTotal(); // Update the overall total whenever individual prices change
            }

            function incrementQuantity(goodId, goodPrice) {
                var inputField = document.getElementById(goodId);
                inputField.value = parseInt(inputField.value) + 1;
                updateTotalPrice(goodId, goodPrice);
            }

            function decrementQuantity(goodId, goodPrice) {
                var inputField = document.getElementById(goodId);
                var newValue = Math.max(1, parseInt(inputField.value) - 1); // Ensure quantity is at least 1
                inputField.value = newValue;
                updateTotalPrice(goodId, goodPrice);
            }

            function initializePage() {
                <% for (goods good : goods) { %>
                var quantity_<%= good.getGood_id() %> = document.getElementById('<%= good.getGood_id() %>').value;
                var total_<%= good.getGood_id() %> = quantity_<%= good.getGood_id() %> * <%= good.getGood_price() %>;
                document.getElementById("totalPrice_<%=good.getGood_id()%>").innerHTML = "￥" + total_<%= good.getGood_id() %>;
                <% } %>
                updateOverallTotal();
            }

            function updateOverallTotal() {
                var overallTotal = 0;
                <% for (goods good : goods) { %>
                var quantity_<%= good.getGood_id() %> = document.getElementById('<%= good.getGood_id() %>').value;
                overallTotal += quantity_<%= good.getGood_id() %> * <%= good.getGood_price() %>;
                <% } %>
                document.getElementById("overallTotal").innerHTML = "￥" + overallTotal;
            }

            // Initialize the page when it loads
            window.onload = initializePage;
        </script>

        <div class="banlance">
            <ul>
                <li class="fl">
                    <div id="overallTotal">总价：￥0</div>
                </li>
                <li>
                    <button class="button" onclick="pay()">
                        结账
                    </button>
                </li>
            </ul>
            <script src="js/common.js"></script>
        </div>





    </div>
    <footer>
        <div class="mod_copyright">
            <div class="links">
                <a href="#">关于我们</a> | <a href="#">联系我们</a> | 联系客服 | 商家入驻 | 营销中心 | 手机品优购 | 友情链接 | 销售联盟 | 品优购社区 |
                品优购公益 | English Site | Contact U
            </div>
            <div class="copyright">
                地址：广州理工学院实训楼 邮编：100096 电话：400-618-4000 传真：010-82935100 邮箱: zhanghj+itcast.cn <br>
                京ICP备08001421号粤公网安备110108007702
            </div>
        </div>
    </footer>
</div>
</body>

</html>