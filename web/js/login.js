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

function login() {
    var username = document.getElementById("name").value;
    var password = document.getElementById("password").value;
     console.log(username+"  "+password);
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                var response = JSON.parse(xhr.responseText);
                handleLoginResponse(response);
            } else {
                alert("Error communicating with the server.");
            }
        }
    };
    function handleLoginResponse(response) {
        console.log(response.status);
        if (response.status === 1) {
            // 登录成功，跳转到 index 页面
            showModal('登录成功',"index.jsp");
        } else {
            // 登录失败，弹出错误提示
            alert("账号或密码错误");
        }
    }
    xhr.open("POST", "Login", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("name=" + encodeURIComponent(username) + "&password=" + encodeURIComponent(password));
}