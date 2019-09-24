<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/27 0027
  Time: 上午 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="/common/head.jsp"></jsp:include>
    <title>角色管理</title>
</head>
<body>
<jsp:include page="/common/nav-static.jsp"></jsp:include>
<div class="container">
    <div style="background-color: #ebcccc;width: 100%;">
        <button class="btn btn-primary" type="button" onclick="showAddRoleDlg();"><i class="glyphicon glyphicon-plus"></i>添加</button>
        <button class="btn btn-danger" type="button" onclick="deleteUsers();"><i class="glyphicon glyphicon-trash"></i>批量删除</button>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">角色列表</div>

                <table id="roleTable" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                    <tr>
                        <th>选择</th>
                        <th>角色名</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tfoot>
                    <tr >
                        <th>选择</th>
                        <th>角色名</th>
                        <th>操作</th>
                    </tr>
                    </tfoot>
                </table>

            </div>
        </div>
    </div>
</div>

<div id="roleAddDiv" style="display: none;">

    <form class="form-horizontal" >
        <div class="form-group">
            <label  class="col-sm-2 control-label">角色名</label>
            <div class="col-sm-4">
                <input type="text" class="form-control"  id="add_roleName" placeholder="请输入角色名...">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">资源</label>
            <div class="col-sm-4">
                <ul id="add_menuTree" class="ztree"></ul>
            </div>
        </div>
    </form>
</div>

<div id="roleUpdateDiv" style="display: none;">

    <form class="form-horizontal" >
        <div class="form-group">
            <label  class="col-sm-2 control-label">角色名</label>
            <div class="col-sm-4">
                <input type="text" class="form-control"  id="update_roleName" placeholder="请输入角色名...">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">资源</label>
            <div class="col-sm-4">
                <ul id="update_menuTree" class="ztree"></ul>
            </div>
        </div>
    </form>
</div>
<jsp:include page="/common/script.jsp"></jsp:include>
<script>
    var v_roleAddDiv;
    var v_roleUpdateDiv;
    $(function () {
        v_roleAddDiv = $("#roleAddDiv").html();
        v_roleUpdateDiv = $("#roleUpdateDiv").html();
        initRoleTable();

    })
    
    function search() {
        roleTable.ajax.reload();
    }

    function initTree() {
        // 通过ajax获取后台数据
        $.ajax({
            type:"post",
            url:"/resource/list.jhtml",
            async:false,
            success:function (result) {
                if (result.code == 200) {
                    var s = {
                        check: {
                            enable: true,
                            chkboxType:{ "Y" : "ps", "N" : "s" }
                        },
                        data: {
                            simpleData: {
                                enable: true
                            }
                        }
                    };
                    // 如果v_roleAddDlg存在【有值】
                    $.fn.zTree.init($("#add_menuTree"), s, result.data);
                    var treeObj = $.fn.zTree.getZTreeObj("add_menuTree");
                    treeObj.expandAll(true);
                }
            }
        })

    }

    function initUpdateTree() {
        // 通过ajax获取后台数据
        $.ajax({
            type:"post",
            // ajax默认情况下是异步的，async设置为false则为同步
            async:false,
            url:"/resource/list.jhtml",
            success:function (result) {
                if (result.code == 200) {
                    var s = {
                        check: {
                            enable: true,
                            chkboxType:{ "Y" : "ps", "N" : "s" }
                        },
                        data: {
                            simpleData: {
                                enable: true
                            }
                        }
                    };
                    $.fn.zTree.init($("#update_menuTree"), s, result.data);
                    var treeObj = $.fn.zTree.getZTreeObj("update_menuTree");
                    treeObj.expandAll(true);
                }
            }
        })

    }
    var v_roleAddDlg;
    function showAddRoleDlg() {
        var v_resourceIds = [];
        // 初始化tree
        initTree();
        v_roleAddDlg = bootbox.dialog({
            title: '添加角色',
            message: $("#roleAddDiv form"),
            size:"large",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确认',
                    className: 'btn-primary',
                    callback: function(){
                        var treeObj = $.fn.zTree.getZTreeObj("add_menuTree");
                        var checkedNodes = treeObj.getCheckedNodes(true);
                        $(checkedNodes).each(function () {
                            v_resourceIds.push(this.id);
                        })

                        var v_roleName = $("#add_roleName", v_roleAddDlg).val();

                        // 发送请求
                        $.ajax({
                            type:"post",
                            url:"/role/add.jhtml",
                            data:{"roleName":v_roleName,"resourceIds":v_resourceIds},
                            success:function (result) {
                                // 刷新
                                search();
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
        $("#roleAddDiv").html(v_roleAddDiv);
    }
    
    var v_roleUpdateDlg;
    function showUpdateRoleDlg(roleId) {
        var v_resourceIds = [];
        $.ajax({
            type:"post",
            url:"/role/findRole.jhtml",
            data:{"roleId":roleId},
            success:function (result) {
                if (result.code == 200) {
                    // 初始化tree
                    // 如果是异步，可能会出现一个问题
                    // 树还没被初始化成功，就开始回填复选框了，肯定是不对的。

                    // 只有执行完了，才会走下面的代码
                    // 树被初始化成功后，才会执行下面的回填复选框
                    initUpdateTree();

                    // 赋值
                    var v_data = result.data;
                    var v_resourceIdArr = v_data.resourceIdList;
                    var treeObj = $.fn.zTree.getZTreeObj("update_menuTree");
                    for (var i = 0; i < v_resourceIdArr.length; i++) {
                        var v_id = v_resourceIdArr[i];
                        var v_node = treeObj.getNodeByParam("id", v_id, null);
                        console.log(v_node);
                        //console.log(treeObj);
                        treeObj.checkNode(v_node, true);
                    }
                    $("#update_roleName").val(v_data.roleName);

                    v_roleUpdateDlg = bootbox.dialog({
                        title: '修改角色',
                        message: $("#roleUpdateDiv form"),
                        size:"large",
                        buttons: {
                            confirm: {
                                label: '<span class="glyphicon glyphicon-ok"></span>确认',
                                className: 'btn-primary',
                                callback: function(){
                                    // 获取值
                                    var v_roleName = $("#update_roleName", v_roleUpdateDlg).val();
                                    var ids = [];
                                    var nodes = treeObj.getCheckedNodes(true);
                                    $(nodes).each(function () {
                                        ids.push(this.id);
                                    })
                                    $.ajax({
                                        type:"post",
                                        url:"/role/update.jhtml",
                                        data:{"id":roleId,"roleName":v_roleName,"ids":ids},
                                        success:function (result) {
                                            if (result.code == 200) {
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
                     $("#roleUpdateDiv").html(v_roleUpdateDiv);
                }
            }
        })

    }
    
    var roleTable;
    function initRoleTable() {
        roleTable =  $('#roleTable').DataTable( {
            "language": {
                "url": "/js/DataTables/Chinese.json"
            },
            "processing": true,
            // 是否允许检索
            "searching": false,
            "serverSide": true,
            "lengthMenu": [5, 10, 15, 20, 30],
            "ajax": {
                "url": "/role/findList.jhtml",
                "type": "POST"
            },

            "columns": [
                {

                    "data": "id",
                    "render": function (data, type, row, meta) {
                        return "<input type='checkbox' value='"+data+"'>";
                    }


                },
                { "data": "roleName" },
                {
                    "data": "id",
                    "render": function (data, type, row, meta) {
                        return "<div class=\"btn-group\" role=\"group\" >\n" +
                            "  <button type=\"button\" class=\"btn btn-info\" onclick=\"showUpdateRoleDlg('"+data+"')\"><i class='glyphicon glyphicon-pencil'></i> 修改</button>\n" +
                            "  <button type=\"button\" class=\"btn btn-danger\" onclick=\"deleteUser('"+data+"')\"><i class='glyphicon glyphicon-trash'></i> 删除</button>\n" +
                            "</div>";
                    }
                }
            ]
        } );
    }
</script>
</body>
</html>
