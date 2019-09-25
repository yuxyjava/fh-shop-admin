<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/29 0029
  Time: 上午 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<form>
用户名:<input type="text" id="userName">
密码:<input type="text" id="userPwd">
<input type="button" value="登录" onclick="login();">
<input type="button" value="忘记密码1111" onclick="toFindPassword();">
<input type="reset" value="重置">
</form>

<script src="/js/jquery-3.3.1.js"></script>
<script>
    
    function toFindPassword() {
        location.href="/user/toFindPassword.jhtml";
    }
    
    function login() {
        var v_userName = $("#userName").val();
        var v_userPwd = $("#userPwd").val();

        // 前台验证

        $.ajax({
            type:"post",
            url:"/user/login.jhtml",
            data:{"userName":v_userName,"password":v_userPwd},
            success:function (result) {
                if (result.code == 200) {
                    // 跳转到后台的首页
                    location.href="/index.jhtml";
                } else {
                    alert(result.msg);
                }
            }
        })
    }
</script>
</body>
</html>
