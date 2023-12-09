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

function regist() {
    var username = document.getElementById("name").value;
    var password = document.getElementById("password").value;
    var phone = document.getElementById("phone").value;
    console.log(username+"  "+password);
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                var response = JSON.parse(xhr.responseText);
                handleLoginResponse(response);
            } else {
                alert("服务连接失效.");
            }
        }
    };
    function handleLoginResponse(response) {
        console.log(response.status);
        if (response.status === 1) {
            // 登录成功，跳转到 index 页面
            console.log("成功")
            showModal('注册成功,请跳转登录页面',"login.html");
        } else {
            // 登录失败，弹出错误提示
            alert("账号重复或者手机号重复注册");
        }
    }
    xhr.open("POST", "Regist", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("name=" + encodeURIComponent(username) + "&password=" + encodeURIComponent(password)+"&phone=" + encodeURIComponent(phone));
}
