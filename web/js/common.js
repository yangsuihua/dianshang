function showModal(message,targetPage) {
    var modal = document.createElement('div');
    modal.className = 'modal';
    modal.innerHTML = '<p>' + message + '</p>';
    document.body.appendChild(modal);

    setTimeout(function () {
        modal.style.display = 'none';

        var urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('targetPage')) {
            targetPage = urlParams.get('targetPage');
        }

        window.location.href = targetPage;
    }, 1000);
}
function getCookie(cookieName) {
    var strCookie = document.cookie
    var cookieList = strCookie.split(';')

    for(var i = 0; i < cookieList.length; i++) {
        var arr = cookieList[i].split('=')
        if (cookieName === arr[0].trim()) {
            return arr[1]
        }
    }

    return ''
}
function addToCart(goodId,count) {
    // Call Java method using AJAX
    var cookievalue=getCookie("name");
    console.log("数字"+count)
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            handleResponse(response);
        }
    };
    function handleResponse(response) {
        if (response.status === 1) {
            // 加入成功
            showModal('加入购物车成功',"index.jsp");
        } else {
            // 加入失败，弹出错误提示
            showModal('请先登录',"login.html");
        }
    }

    xhr.open('POST', 'Index', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');


    var data = "goodId=" + encodeURIComponent(goodId) + "&userId=" + encodeURIComponent(cookievalue)+"&count=" + encodeURIComponent(count);
    xhr.send(data);

}
function pay() {
    // Call Java method using AJAX
    var cookievalue=getCookie("name");
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            handleResponse(response);
        }
    };
    function handleResponse(response) {
        if (response.status === 1) {
            // 登购买成功，跳转到 index 页面
            alert("小子这么有钱");
            window.location.href = "shopcar.jsp";
        } else {
            // 购买失败，弹出错误提示
            alert("请先去加入商品");
            window.location.href = "index.jsp";
        }
    }


    xhr.open('POST', 'Pay', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');


    var data = "&userId=" + encodeURIComponent(cookievalue);
    xhr.send(data);

}
function searchGood() {
    var name=document.getElementsByName("sea")[0].value;
    console.log(name);
    document.cookie="sea="+escape(name);   //cookie的存储形式为"userName=%u73CA%u73CA"
    window.location.href = "index.jsp";

}
function exit(){
    deleteCookie("name");
    showModal('退出成功',"login.html");
}

function deleteCookie(name) {
    document.cookie = name + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
}
