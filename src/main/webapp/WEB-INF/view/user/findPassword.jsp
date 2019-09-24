<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/11 0011
  Time: 下午 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/common/head.jsp"></jsp:include>
    <title>找回密码</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">找回密码</div>
                <div class="panel-body">
                    <form class="form-horizontal" id="userSearch">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="mail" placeholder="请输入注册时候的邮箱...">
                            </div>


                        </div>
                        <div style="text-align: center">
                            <button class="btn btn-primary" type="button" onclick="sendPassword();"><i class="glyphicon glyphicon-ok"></i>发送密码到邮箱</button>
                            <button class="btn btn-default" type="reset"><i class="glyphicon glyphicon-refresh"></i>重置</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
<jsp:include page="/common/script.jsp"></jsp:include>
<script>
    function sendPassword() {
        var v_mail = $("#mail").val();
        $.ajax({
            type:"post",
            url:"/user/sendPassword.jhtml",
            data:{"mail":v_mail},
            success:function (result) {
                if (result.code == 200) {
                    bootbox.alert({
                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>发送密码成功，请查收！！！",
                        size: 'small',
                        title: "提示信息"
                    });
                } else {
                    bootbox.alert({
                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>"+result.msg,
                        size: 'small',
                        title: "提示信息"
                    });
                }
            }
        })
    }
</script>
</body>
</html>
