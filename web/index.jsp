<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>主体页</title>
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/index.css">
    <link rel="stylesheet" href="css/styles.css">
    <script src="js/common.js"></script>

</head>

<body>
<%@ page import="com.dianshang.bean.goods" %>
<%
    Cookie[] cookies = request.getCookies();
    String cookieValue = null;
    boolean showJSPCode = true;
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("name")) {
                showJSPCode = false;
                cookieValue = cookie.getValue();
                break;
            }
        }
    }
%>
<!-- 快捷导肮模块 -->
<section class="shortcut">
    <div class="w">
        <div class="fl">
            <ul>
                <!-- &nbsp空格 -->
                <% if (showJSPCode) { %>
                <a href="login.html">请登录&nbsp</a>
                <li>
                    <a href="register.html" class="style_red">免费注册</a>
                </li>
                <% } %>
                <% if (!showJSPCode) { %>
                <li>
                    <button type="button" onclick="exit()">退出登录</button>
                </li>

                <% } %>
            </ul>
        </div>
        <div class="fr">
            <ul>
                <li>我的订单</li>
                <!-- 这里的li做成竖线的形式，宽度限制为1像素，添加颜色-->
                <li></li>
                <li class="arrow-icon">我的品优购</li>
                <li></li>
                <li>品优购会员</li>
                <li></li>
                <li>企业采购</li>
                <li></li>
                <!-- 用到伪元素after -->
                <li class="arrow-icon">关注品优购</li>
                <li></li>
                <li class="arrow-icon">客户服务</li>
                <li></li>
                <li class="arrow-icon">网站导航</li>
            </ul>
        </div>
    </div>
</section>
<!-- 快捷导肮模块end -->
<!-- header头部模块制作 -->
<div class="header w">
    <!-- logo如何突出seo特性，h1,a,文字,title
        文字需要要隐藏
        -->
    <div class="logo">
        <h1>
            <a href="index.jsp" title="品优购商城">品优购商城</a>
        </h1>
    </div>
    <!-- 秒杀模块 -->
    <div class="sk">
        <img src="./images/sk.png" alt="">
    </div>
    <!-- search搜索模块 -->
    <div class="search">
        <!-- search有消除文本的功能 -->
        <!--  placeholder就是文本框内的提示文字 -->
        <input type="search" name="sea" class="fl" placeholder="品优商城">
        <button class="fl"  onclick="searchGood()">搜索</button>
    </div>
    <!-- hotwords模块 -->
    <div class="hotwords">
        <a href="#" class="style_red">优惠购首发</a>
        <a href="#">亿元优惠</a>
        <a href="#">9.9元团购</a>
        <a href="#">每满99减30</a>
        <a href="#">办公用品</a>
        <a href="#">电脑</a>
        <a href="#">通信</a>
    </div>
    <!-- shopcar模块 -->
    <div class="shopcar">
        <a href="shopcar.jsp">我的购物车</a>
        <!-- 这里是购物车的修改处 -->
        <%
            users_goodsDaoImpl users_goods = new users_goodsDaoImpl();


        List<goods> goods = users_goods.ShowCar(cookieValue);
            int size=0;

        for(goods g1:goods){

            size+=g1.getCount();
        }

            %>
        <li class="count"><%=size%></li>
    </div>
</div>
<!-- header头部模块制作end -->
<!-- nav模块 -->
<!-- 又名导航模块 -->
<nav class="nav">
    <div class="w">
        <div class="sk_list fl">
            <ul>
                <li><a href="#">品优秒杀</a></li>
                <li><a href="#">即将售罄</a></li>
                <li><a href="#">超值低价</a></li>
            </ul>
        </div>
        <div class="sk_con fl">
            <ul>
                <li>
                    <a href="#" class="style_red ">酒类</a>
                </li>
                <li>
                    <a href="#">家用电器</a>
                </li>
                <li>
                    <a href="#">化妆品</a>
                </li>
                <li>
                    <a href="#">动画周边</a>
                </li>
                <li>
                    <a href="#">母婴童装</a>
                </li>
                <li>
                    <a href="#">食品</a>
                </li>
                <li>
                    <a href="#">智能数码</a>
                </li>
                <li>
                    <a href="#">运动户外</a>
                </li>
                <li>
                    <a href="#">更多分类</a>
                </li>

            </ul>
        </div>
    </div>

</nav>
<!-- nav模块end -->

<!-- list专有 -->
<%@ page import="com.dianshang.dao.goodsDao" %>
<%@ page import="com.dianshang.dao.impl.goodsDaoImpl" %>

<%@ page import="com.dianshang.dao.impl.users_goodsDaoImpl" %>
<%@ page import="com.dianshang.utils.EscapeUnescape" %>
<%@ page import="java.util.List" %>

<%

    Cookie[] ck = request.getCookies();
    String ckv = "";
    if (ck != null) {
        for (Cookie cookie : ck) {
            if (cookie.getName().equals("sea")) {
                ckv = cookie.getValue();
                break;
            }
        }
    }
    ckv= EscapeUnescape.unescape(ckv);
    System.out.println("sdkdsk="+ckv);
    goodsDao goodsDaoImpl = new goodsDaoImpl();
    List<goods> list= goodsDaoImpl.SearchGoods(ckv,cookieValue);

%>
<div class="w sk_container">
    <div class="sk_hd">
        <img src="./upload/bg_04.png" alt="">
    </div>
    <div class="sk_bd">
        <ul class="clearfix">

            <% for (goods good : list) { %>
            <li class="shopimgbox">
                <div class="shopimg">
                    <img src="images/<%= good.getImage() %>b.jpg" alt="">
                </div>
                <div class="shoptext">
                    <%= good.getGood_name() %><br>
                    <span>￥<%= good.getGood_price() %></span>
                </div>
                <div class="putshopcar">
                    <button type="button" onclick="addToCart('<%= good.getGood_id() %>',
                        <%= (good.getCount() == 0) ? 1 : (good.getCount()+1) %>)">&nbsp;&nbsp;加入购物车</button>
                </div>
            </li>
            <% } %>
            <script src="js/common.js"></script>



        </ul>
    </div>
    <div class="sk_foot ">
        <h3 class="fr"><a href="index.jsp">
            >>&nbsp;&nbsp;
        </a>
        </h3>
    </div>
</div>
<!-- list专有end -->


<!-- 底部模块 -->
<footer class="footer">
    <div class="w">
        <div class="mod_service">
            <ul>
                <li>
                    <!--使用精灵图 -->
                    <h5></h5>
                    <div class="service_txt">
                        <h4>正品保障</h4>
                        <p>正品保障，提供发票</p>
                    </div>
                </li>
                <li>
                    <h5></h5>
                    <div class="service_txt">
                        <h4>急速物流</h4>
                        <p>急速物流，急速送达</p>
                    </div>
                </li>
                <li>
                    <h5></h5>
                    <div class="service_txt">
                        <h4>无忧售后</h4>
                        <p>无忧售后，7天无理由退货</p>
                    </div>
                </li>
                <li>
                    <h5></h5>
                    <div class="service_txt">
                        <h4>特色服务</h4>
                        <p>私人订制家电套餐</p>
                    </div>
                </li>
            </ul>
        </div>
        <div class="mod_help">
            <dl>
                <dt>
                    服务指南
                </dt>
                <dd>购物流程</dd>
                <dd>会员介绍</dd>
                <dd>生活旅行</dd>
                <dd>常见问题</dd>
                <dd>大家电</dd>
                <dd>联系客服</dd>

            </dl>
            <dl>
                <dt>
                    配送方式
                </dt>
                <dd>上门自提</dd>
                <dd>211限时达</dd>
                <dd>配送服务查询</dd>
                <dd>配送费收取标准</dd>
                <dd>海外配送</dd>
            </dl>
            <dl>
                <dt>
                    支付方式
                </dt>
                <dd>货到付款</dd>
                <dd>在线支付</dd>
                <dd>分期付款</dd>
                <dd>邮局汇款</dd>
                <dd>公司转账</dd>
            </dl>
            <dl>
                <dt>
                    售后服务
                </dt>
                <dd>售后政策</dd>
                <dd>价格保护</dd>
                <dd>退款说明</dd>
                <dd>返修/退换货</dd>
                <dd>取消订单</dd>

            </dl>
            <dl>
                <dt>
                    特色服务
                </dt>
                <dd>夺宝岛</dd>
                <dd>DIY装机</dd>
                <dd>延保服务</dd>
                <dd>品优购E卡</dd>
                <dd>品优购通信</dd>
            </dl>
            <dl>
                <dt>
                    帮助中心
                </dt>
                <dd>
                    <img src="../shoping/images/wx_cz.jpg" alt="">
                    品优购客户端
                </dd>
            </dl>
        </div>
        <div class="mod_copyright">
            <div class="links">
                <a href="#">关于我们</a>
                |
                <a href="#">联系我们</a>
                |
                <a href="#">联系客服</a>
                |
                <a href="#">商家入驻</a>
                |
                <a href="#">营销中心</a>
                |
                <a href="#">手机品优购</a>
                |
                <a href="#">友情链接</a>
                |
                <a href="#">销售联盟</a>
                |
                <a href="#">品优购社区</a>
                |
                <a href="#">品优购公益</a>
                |
                <a href="#">English Site</a>
                |
                <a href="#">Contact U</a>
            </div>
            <div class="copyright">
                地址：广州理工学院实训楼 邮编：100096 电话：400-618-4000 传真：010-82935100 邮箱: zhanghj+itcast.cn <br>
                京ICP备08001421号粤公网安备110108007702
            </div>
        </div>
    </div>
</footer>
<!-- 底部模块end -->
</body>

</html>
