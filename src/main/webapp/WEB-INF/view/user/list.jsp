<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/14 0014
  Time: 下午 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="/common/head.jsp"></jsp:include>
    <title>用户管理</title>
</head>

<body>
<jsp:include page="/common/nav-static.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">用户查询</div>
                <div class="panel-body">
                    <form class="form-horizontal" id="userSearch">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="userName" placeholder="请输入用户名...">
                            </div>
                            <label  class="col-sm-2 control-label">真实姓名</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="realName" placeholder="请输入真实姓名...">
                               
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">年龄范围</label>
                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="minAge" placeholder="开始年龄..." >
                                    <span class="input-group-addon" ><i class="glyphicon glyphicon-transfer"></i></span>
                                    <input type="text" class="form-control" id="maxAge" placeholder="结束年龄..." >
                                </div>
                            </div>
                            <label  class="col-sm-2 control-label">薪资范围</label>
                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="minSalary" placeholder="最小薪资..." >
                                    <span class="input-group-addon" ><i class="glyphicon glyphicon-yen"></i></span>
                                    <input type="text" class="form-control" id="maxSalary" placeholder="最大薪资...">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">入职时间</label>
                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="minEntryTime" placeholder="开始时间..." >
                                    <span class="input-group-addon" ><i class="glyphicon glyphicon-calendar"></i></span>
                                    <input type="text" class="form-control" id="maxEntryTime" placeholder="结束时间..." >
                                </div>
                            </div>
                            <label  class="col-sm-2 control-label">角色</label>
                            <div class="col-sm-4" id="searchRoleDiv">
                             
                            </div>
                        </div>
                        <div style="text-align: center">
                            <button class="btn btn-primary" type="button" onclick="search();"><i class="glyphicon glyphicon-search"></i>查询</button>
                            <button class="btn btn-default" type="reset"><i class="glyphicon glyphicon-refresh"></i>重置</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div style="background-color: #ebcccc;width: 100%;">
        <button class="btn btn-primary" type="button" onclick="showAddUserDlg();"><i class="glyphicon glyphicon-plus"></i>添加</button>
        <button class="btn btn-danger" type="button" onclick="deleteUsers();"><i class="glyphicon glyphicon-trash"></i>批量删除</button>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">商品列表</div>

                    <table id="userTable" class="table table-striped table-bordered" style="width:100%">
                        <thead>
                        <tr>
                            <th>选择</th>
                            <th>用户名</th>
                            <th>真实姓名</th>
                            <th>性别</th>
                            <th>年龄</th>
                            <th>手机</th>
                            <th>邮箱</th>
                            <th>薪资</th>
                            <th>入职时间</th>
                            <th>角色</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tfoot>
                        <tr >
                            <th>选择</th>
                            <th>用户名</th>
                            <th>真实姓名</th>
                            <th>性别</th>
                            <th>年龄</th>
                            <th>手机</th>
                            <th>邮箱</th>
                            <th>薪资</th>
                            <th>入职时间</th>
                            <th>角色</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </tfoot>
                    </table>

                </div>
        </div>
    </div>
</div>

<div id="userAddDiv" style="display: none;">
    <form class="form-horizontal" >
    <div class="form-group">
        <label  class="col-sm-2 control-label">用户名</label>
        <div class="col-sm-4">
            <input type="text" class="form-control"  id="add_userName" placeholder="请输入用户名...">
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">真实姓名</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="add_realName" placeholder="请输入真实姓名...">
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">密码</label>
        <div class="col-sm-4">
            <input type="password" class="form-control" id="add_password" placeholder="请输入密码...">
        </div>
    </div>
    <div class="form-group">

        <label  class="col-sm-2 control-label">确认密码</label>
        <div class="col-sm-4">
            <input type="password" class="form-control" id="add_confirmPassword" placeholder="请输入确认密码...">
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">年龄</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="add_age" placeholder="请输入年龄...">
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">性别</label>
        <div class="col-sm-4">
            <input type="radio"  name="add_sex" value="1">男
            <input type="radio"  name="add_sex" value="0">女
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">手机</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="add_phone" placeholder="请输入手机号...">
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">邮箱</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="add_email" placeholder="请输入邮箱...">
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">薪资</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="add_salary" placeholder="请输入薪资...">
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">入职时间</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="add_entryTime" placeholder="请输入入职时间...">
        </div>
    </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">角色列表</label>
        <div class="col-sm-4" id="roleDiv">

        </div>
    </div>


</form>
</div>

<div id="userUpdateDiv" style="display: none;">

    <form class="form-horizontal" >
        <div class="form-group">
            <label  class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-4">
                <input type="text" class="form-control"  id="update_userName" placeholder="请输入用户名...">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">真实姓名</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="update_realName" placeholder="请输入真实姓名...">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">年龄</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="update_age" placeholder="请输入年龄...">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">性别</label>
            <div class="col-sm-4">
                <input type="radio"  name="update_sex" value="1">男
                <input type="radio"  name="update_sex" value="0">女
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">手机</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="update_phone" placeholder="请输入手机号...">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">邮箱</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="update_email" placeholder="请输入邮箱...">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">薪资</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="update_salary" placeholder="请输入薪资...">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">入职时间</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="update_entryTime" placeholder="请输入入职时间...">

            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">角色列表</label>
            <div class="col-sm-4" id="update_roleDiv">

            </div>
        </div>

    </form>
</div>

<jsp:include page="/common/script.jsp"></jsp:include>
<script>
    var v_addUserDiv;
    var v_userUpdateDiv;
    $(function () {
        initUserTable();
        initBindEvent();
        initDate('add_entryTime');
        initDate('update_entryTime');
        initSearchDate();
        initRoleList('roleDiv', "add");
        initRoleList('update_roleDiv', "update");
        initSearchRoleList();
        backupHtml();
    })


    
    function initSearchRoleList() {
        $.ajax({
            url:"/role/list.jhtml",
            type:"post",
            success:function (result) {
                if (result.code == 200) {
                    var v_roleArr = result.data;
                    var v_html = "<select id='roleSelect' title=\"请选择角色\" multiple>"
                    for (var i = 0; i < v_roleArr.length; i++) {
                        v_html += "<option value='"+v_roleArr[i].id+"'>"+v_roleArr[i].roleName+"</option>";
                    }
                    v_html+= "</select>";
                    $("#searchRoleDiv").html(v_html);
                    $('#roleSelect').selectpicker();
                }
            }
        })
    }
    
    
    var v_ids = [];
    function initBindEvent() {
        // 给动态生成的元素添加事件
        $("#userTable tbody").on("click", "tr", function () {
            // 获取复选框
           var v_checkbox = $(this).find("input[type='checkbox']");
           var v_checked = v_checkbox.prop("checked");
           if (v_checked) {
               // 如果复选框选中，则取消选中，并还原背景色
               v_checkbox.prop("checked", false);
               $(this).css("background-color", "");
               // 删除
               for (var i = v_ids.length-1; i >= 0; i--) {
                   if (v_ids[i] == v_checkbox.val()) {
                       v_ids.splice(i, 1);
                       break;
                   }
               }
           } else {
               // 如果复选框未选中，则选中复选框，并改变背景色
               v_checkbox.prop("checked", true);
               $(this).css("background-color", "#ebcccc");
               v_ids.push(v_checkbox.val());
           }



        })
    }
    
    function deleteUsers() {
        if (v_ids.length > 0) {
            bootbox.confirm({
                message: "你确定删除吗?",
                size: 'small',
                title: "提示信息",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确定',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {
                    if (result) {
                        // 发送ajax进行删除
                        $.ajax({
                            type:"post",
                            url:"/user/deleteBatch.jhtml",
                            data:{"userIds":v_ids},
                            success:function (result) {
                                if (result.code == 200) {
                                    // 清空整个ids
                                    v_ids = [];
                                    // 刷新
                                    search();
                                }
                            }
                        })
                    }
                }
            })
        } else {
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请选择要删除的行",
                size: 'small',
                title: "提示信息"
            });
        }
    }
    
    function initRoleList(divName, prefix) {
        $.ajax({
            type:"post",
            url:"/role/list.jhtml",
            success:function (result) {
                if (result.code == 200) {
                   var v_roleList =  result.data;
                   var html = "";
                   for (var i = 0; i < v_roleList.length; i++) {
                       var v_role = v_roleList[i];
                       html+="<input type='checkbox' value='"+v_role.id+"' name='"+prefix+"_roleCheckbox'>"+v_role.roleName;
                   }
                   $("#"+divName).html(html);
                }
            }
        })
    }


    function backupHtml() {
        // 获取源，备份
        v_addUserDiv = $("#userAddDiv").html();
        v_userUpdateDiv = $("#userUpdateDiv").html();
    }

    function initDate(elementName) {
        $('#'+elementName).datetimepicker({
            format: 'YYYY-MM-DD',
            locale: 'zh-CN',
            showClear: true
        });
    }
    
    function initSearchDate() {
        $('#minEntryTime').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: 'zh-CN',
            showClear: true
        });
        $('#maxEntryTime').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: 'zh-CN',
            showClear: true
        });
    }


    var v_userAddDlg;
    function showAddUserDlg() {
        v_userAddDlg = bootbox.dialog({
            title: '添加用户',
            message: $("#userAddDiv form"),
            size:"large",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确认',
                    className: 'btn-primary',
                    callback: function(){
                        // 点击确定按钮，发送ajax请求，插入数据
                        var v_userName = $("#add_userName", v_userAddDlg).val();
                        var v_realName = $("#add_realName", v_userAddDlg).val();
                        var v_password = $("#add_password", v_userAddDlg).val();
                        var v_confirmPassword = $("#add_confirmPassword", v_userAddDlg).val();
                        var v_sex = $("input[name='add_sex']:checked", v_userAddDlg).val();
                        var v_age = $("#add_age", v_userAddDlg).val();
                        var v_salary = $("#add_salary", v_userAddDlg).val();
                        var v_phone = $("#add_phone", v_userAddDlg).val();
                        var v_email = $("#add_email", v_userAddDlg).val();
                        var v_entryTime = $("#add_entryTime", v_userAddDlg).val();
                        var v_roleIds = "";
                        $("input[name='add_roleCheckbox']:checked", v_userAddDlg).each(function () {
                            v_roleIds += ","+this.value;
                        })
                        if (v_roleIds.length > 0) {
                            v_roleIds = v_roleIds.substring(1);
                        }
                        // 空的json对象
                        var v_param = {};
                        // 给json动态添加属性
                        v_param.userName = v_userName;
                        v_param.realName = v_realName;
                        v_param.password = v_password;
                        v_param.age = v_age;
                        v_param.sex = v_sex;
                        v_param.salary = v_salary;
                        v_param.phone = v_phone;
                        v_param.email = v_email;
                        v_param.entryTime = v_entryTime;
                        v_param.roleIds = v_roleIds;



                        $.ajax({
                            url:"/user/add.jhtml",
                            type:"post",
                            data:v_param,
                            success:function (result) {
                                if (result.code == 200) {
                                    // 刷新
                                    search();
                                }
                            }

                        })
                    }
                },
                cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger'
                }
            }
        });
        // 还原
        $("#userAddDiv").html(v_addUserDiv);
        initDate('add_entryTime');
        initRoleList('roleDiv','add');

    }

    function checkRole(id) {
        $("input[name='update_roleCheckbox']:checkbox").each(function () {
            if (this.value == id) {
                this.checked = true;
                return;
            }
        })
    }

    var v_userUpdateDlg;
    function showUpdateUserDlg(id) {
        // 阻止事件冒泡[事件传播]
        event.stopPropagation();
        // 通过ajax查询到数据
        $.ajax({
            type:"post",
            url:"/user/findUser.jhtml",
            data:{"id":id},
            success:function (result) {
                console.log(result);
                if (result.code == 200) {
                    // 赋值
                    var data = result.data;
                    var v_userName = data.userName;
                    var v_realName = data.realName;
                    $("#update_userName").val(v_userName);
                    $("#update_realName").val(v_realName);
                    $("#update_age").val(data.age);
                    $("#update_phone").val(data.phone);
                    $("#update_email").val(data.email);
                    $("#update_salary").val(data.salary);
                    $("#update_entryTime").val(data.entryTime);
                    $("input[name='update_sex']").each(function () {
                        if (this.value == data.sex) {
                            this.checked = true;
                        }
                    })
                    var v_roleIdArr = data.roleIds;
                    for (var i = 0; i < v_roleIdArr.length; i++) {
                        checkRole(v_roleIdArr[i]);
                    }

                    v_userUpdateDlg = bootbox.dialog({
                        title: '修改用户',
                        message: $("#userUpdateDiv form"),
                        size:"large",
                        buttons: {
                            confirm: {
                                label: '<span class="glyphicon glyphicon-ok"></span>确认',
                                className: 'btn-primary',
                                callback: function(){
                                    // 更新
                                    var v_userName = $("#update_userName", v_userUpdateDlg).val();
                                    var v_realName = $("#update_realName", v_userUpdateDlg).val();
                                    var v_age = $("#update_age", v_userUpdateDlg).val();
                                    var v_phone = $("#update_phone", v_userUpdateDlg).val();
                                    var v_email = $("#update_email", v_userUpdateDlg).val();
                                    var v_salary = $("#update_salary", v_userUpdateDlg).val();
                                    var v_entryTime = $("#update_entryTime", v_userUpdateDlg).val();
                                    var v_sex = $("input[name='update_sex']:checked", v_userUpdateDlg).val();
                                    var v_roleids="";
                                    $("input[name='update_roleCheckbox']:checked").each(function () {
                                        v_roleids += ","+this.value;
                                    })
                                    if (v_roleids.length > 0) {
                                        v_roleids = v_roleids.substring(1);
                                    }
                                    // 发送ajax进行更新
                                    $.ajax({
                                        type:"post",
                                        url:"/user/updateUser.jhtml",
                                        data:{
                                            "userName":v_userName,"realName":v_realName,"id":id,
                                            "age":v_age,"phone":v_phone,"email":v_email,"salary":v_salary,
                                            "entryTime":v_entryTime,"sex":v_sex,"roleIds":v_roleids
                                        },
                                        success:function (result) {
                                            if (result.code == 200) {
                                                // 刷新
                                                search();
                                            }
                                        }
                                    })
                                }
                            },
                            cancel: {
                                label: '<span class="glyphicon glyphicon-remove"></span>取消',
                                className: 'btn-danger'
                            }
                        }
                    });
                    // 还原
                    $("#userUpdateDiv").html(v_userUpdateDiv);
                    initDate('update_entryTime');
                    initRoleList('update_roleDiv','update');
                }
            }

        })

    }
    
    function deleteUser(uid) {
        event.stopPropagation();
        bootbox.confirm({
            message: "你确定删除吗?",
            size: 'small',
            title: "提示信息",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确定',
                    className: 'btn-success'
                },
                cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
               if (result) {
                   // 发送ajax进行删除
                   $.ajax({
                       type:"post",
                       url:"/user/deleteUser.jhtml",
                       data:{"id":uid},
                       success:function (result) {
                           if (result.code == 200) {
                               // 刷新
                               search();
                           }
                       }
                   })
               }
            }
        })
    }



    function search() {
        // 查询，本质是刷新datatable数据
        // 获取参数信息
        var v_userName = $("#userName").val();
        var v_realName = $("#realName").val();
        var v_minAge = $("#minAge").val();
        var v_maxAge = $("#maxAge").val();
        var v_minSalary = $("#minSalary").val();
        var v_maxSalary = $("#maxSalary").val();
        var v_minEntryTime = $("#minEntryTime").val();
        var v_maxEntryTime = $("#maxEntryTime").val();
        var v_roleids=$("#roleSelect").val().join(",");
        // $("input[name='search_roleCheckbox']:checked").each(function () {
        //     v_roleids+=","+this.value;
        // })
        // if (v_roleids.length > 0) {
        //     v_roleids = v_roleids.substring(1);
        // }
        console.log($("#roleSelect").val());
        // 组装参数
        var v_param = {};
        v_param.userName = v_userName;
        v_param.realName = v_realName;
        v_param.minAge = v_minAge;
        v_param.maxAge = v_maxAge;
        v_param.minSalary = v_minSalary;
        v_param.maxSalary = v_maxSalary;
        v_param.minEntryTime = v_minEntryTime;
        v_param.maxEntryTime = v_maxEntryTime;
        v_param.roleIds = v_roleids;

        // 调用datable中的方法，发送请求，传递参数，这样就能达到刷新datatable数据的效果
        userTable.settings()[0].ajax.data = v_param;
        userTable.ajax.reload();
    }
    
    function isExist(id) {
        for (var i = 0; i < v_ids.length; i++) {
            if (v_ids[i] == id) {
                return true;
            }
        }
    }
    
    function updateUserStatus(userId) {
        bootbox.confirm({
            message: "你确定解锁该用户吗?",
            size: 'small',
            title: "提示信息",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确定',
                    className: 'btn-success'
                },
                cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result) {
                    // 发送ajax进行删除
                    $.ajax({
                        type:"post",
                        url:"/user/updateUserStatus.jhtml",
                        data:{"id":userId},
                        success:function (result) {
                            if (result.code == 200) {
                                // 刷新
                                search();
                            }
                        }
                    })
                }
            }
        })
    }
    
    function resetUserPassword(uid) {
        bootbox.confirm({
            message: "你确定要重置该用户的密码吗?",
            size: 'small',
            title: "提示信息",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确定',
                    className: 'btn-success'
                },
                cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result) {
                    // 发送ajax进行删除
                    $.ajax({
                        type:"post",
                        url:"/user/resetUserPassword.jhtml",
                        data:{"id":uid},
                        success:function (result) {
                            if (result.code == 200) {
                                bootbox.alert({
                                    message: "<span class='glyphicon glyphicon-exclamation-sign'></span>重置密码成功",
                                    size: 'small',
                                    title: "提示信息"
                                });
                            }
                        }
                    })
                }
            }
        })
    }

    var userTable;
    function initUserTable() {
        userTable =  $('#userTable').DataTable( {
            "language": {
                "url": "/js/DataTables/Chinese.json"
            },
            "processing": true,
            // 是否允许检索
            "searching": false,
            "serverSide": true,
            "lengthMenu": [5, 10, 15, 20, 30],
            "ajax": {
                "url": "/user/list.jhtml",
                "type": "POST",
                "dataSrc":function (result) {
                    if (result.code == 200) {
                        result.draw = result.data.draw;
                        result.recordsFiltered = result.data.recordsFiltered;
                        result.recordsTotal = result.data.recordsTotal;
                        return result.data.data;
                    }
                }

            },
            "drawCallback": function( settings ) {
                $("#userTable tbody tr").each(function () {
                    var v_checkbox = $(this).find("input[type='checkbox']");
                    var v_id = v_checkbox.val();
                    if (isExist(v_id)) {
                        // 回填
                        v_checkbox.prop("checked", true);
                        $(this).css("background-color", "#ebcccc");
                    }
                })
            },
            "columns": [
                {

                    "data": "id",
                    "render": function (data, type, row, meta) {
                        return "<input type='checkbox' value='"+data+"'>";
                    }


                },
                { "data": "userName" },
                { "data": "realName" },
                {   "data": "sex",
                    "render": function (data, type, row, meta) {
                       return data==1?"男":"女";
                    }
                },
                { "data": "age" },
                { "data": "phone" },
                { "data": "email" },
                { "data": "salary" },
                { "data": "entryTime" },
                { "data": "roleNames" },
                {
                    "data": "lock",
                    "render": function (data, type, row, meta) {
                        return data?"锁定":"正常";
                    }
                },
                {
                    "data": "id",
                    "render": function (data, type, row, meta) {
                        return "<div class=\"btn-group\" role=\"group\" >\n" +
                            "  <button type=\"button\" class=\"btn btn-info\" onclick=\"showUpdateUserDlg('"+data+"')\"><i class='glyphicon glyphicon-pencil'></i> 修改</button>\n" +
                            "  <button type=\"button\" class=\"btn btn-danger\" onclick=\"deleteUser('"+data+"')\"><i class='glyphicon glyphicon-trash'></i> 删除</button>\n" +
                            "  <button type=\"button\" class=\"btn btn-success\" onclick=\"updateUserStatus('"+data+"')\"><i class='glyphicon glyphicon-lock'></i> 解锁</button>\n" +
                            "  <button type=\"button\" class=\"btn btn-danger\" onclick=\"resetUserPassword('"+data+"')\"><i class='glyphicon glyphicon-refresh'></i> 重置密码</button>\n" +
                            "</div>";
                    }
                }
            ]
        } );
    }
</script>
</body>
</html>
