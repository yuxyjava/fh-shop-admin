<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/10 0010
  Time: 下午 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/common/head.jsp"></jsp:include>
    <title>修改密码</title>
</head>
<body>
<jsp:include page="/common/nav-static.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">修改密码</div>
                <div class="panel-body">
                    <form class="form-horizontal" id="userSearch">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">原密码</label>
                            <div class="col-sm-4">
                                <input type="password" class="form-control" id="oldPassword" placeholder="请输入原密码...">
                            </div>


                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">新密码</label>
                            <div class="col-sm-4">
                                <input type="password" class="form-control" id="newPassword" placeholder="请输入新密码...">

                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">确认密码</label>
                            <div class="col-sm-4">
                                <input type="password" class="form-control" id="confirmPassword" placeholder="请输入确认密码...">
                            </div>
                        </div>
                        <div style="text-align: center">
                            <button class="btn btn-primary" type="button" onclick="updatePassword();"><i class="glyphicon glyphicon-ok"></i>修改</button>
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
    function updatePassword() {
        var v_oldPassword = $("#oldPassword").val();
        var v_newPassword = $("#newPassword").val();
        var v_confirmPassword = $("#confirmPassword").val();
        var v_userId = '${user.id}';

        if (v_newPassword != v_confirmPassword) {
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>新密码和确认密码不一致！！！",
                size: 'small',
                title: "提示信息"
            });
            return;
        }

        $.ajax({
            type:"post",
            url:"/user/updatePassword.jhtml",
            data:{"userId":v_userId,"oldPassword":v_oldPassword,"newPassword":v_newPassword,"confirmPassword":v_confirmPassword},
            success:function (result) {
                if (result.code == 200) {
                    bootbox.alert({
                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>密码修改成功，请重新登录！！！",
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
