<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/25 0025
  Time: 下午 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <jsp:include page="/common/head.jsp"></jsp:include>
        <title>资源管理</title>
</head>
<body>
<jsp:include page="/common/nav-static.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">菜单管理
                    <button class="btn btn-primary" type="button" onclick="showAddMenuDlg();"><i class="glyphicon glyphicon-plus"></i>添加</button>
                    <button class="btn btn-info" type="button" onclick="showUpdateMenuDlg();"><i class="glyphicon glyphicon-pencil"></i>修改</button>
                    <button class="btn btn-danger" type="button" onclick="deleteMenus();"><i class="glyphicon glyphicon-trash"></i>删除</button>

                </div>

                    <ul id="menuTree" class="ztree"></ul>

            </div>
        </div>
    </div>
</div>


<div id="menuAddDiv" style="display: none;">
    <form class="form-horizontal" >
        <div class="form-group">
            <label  class="col-sm-2 control-label">菜单名</label>
            <div class="col-sm-4">
                <input type="text" class="form-control"  id="add_menuName" placeholder="请输入菜单名...">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">类型</label>
            <div class="col-sm-4">
                <input type="radio" name="add_type" value="1"> 菜单
                <input type="radio" name="add_type" value="2"> 按钮
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">URL地址</label>
            <div class="col-sm-4">
                <input type="text" class="form-control"  id="add_url" placeholder="请输入url...">
            </div>
        </div>
    </form>
</div>

<div id="menuUpdateDiv" style="display: none;">
    <form class="form-horizontal" >
        <div class="form-group">
            <label  class="col-sm-2 control-label">菜单名</label>
            <div class="col-sm-4">
                <input type="text" class="form-control"  id="update_menuName" placeholder="请输入菜单名...">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">类型</label>
            <div class="col-sm-4">
                <input type="radio" name="update_type" value="1"> 菜单
                <input type="radio" name="update_type" value="2"> 按钮
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">URL地址</label>
            <div class="col-sm-4">
                <input type="text" class="form-control"  id="update_url" placeholder="请输入url...">
            </div>
        </div>
    </form>
</div>



<jsp:include page="/common/script.jsp"></jsp:include>
<SCRIPT type="text/javascript">
    var v_menuAddDiv;
    var v_menuUpdateDiv;
    $(function() {
        initTree();
        v_menuAddDiv = $("#menuAddDiv").html();
        v_menuUpdateDiv = $("#menuUpdateDiv").html();
    })
    
    function deleteMenus() {
        var treeObj = $.fn.zTree.getZTreeObj("menuTree");
        var v_selectedNodes = treeObj.getSelectedNodes();
        if (v_selectedNodes.length > 0) {
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
                        var nodes = treeObj.transformToArray(v_selectedNodes);
                        console.log(nodes);
                        var ids = [];
                        for (var i = 0; i < nodes.length; i++) {
                            ids.push(nodes[i].id);
                        }
                        $.ajax({
                            type:"post",
                            url:"/resource/deleteBatch.jhtml",
                            data:{"ids":ids},
                            success:function (result) {
                                if (result.code == 200) {
                                    // 刷新
                                    for (var i = nodes.length-1; i >= 0; i--) {
                                        treeObj.removeNode(nodes[i]);
                                    }
                                }

                            }
                        })
                    }
                }
            })
        } else {
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>至少选择一个",
                size: 'small',
                title: "提示信息"
            });
        }
    }

    var v_menuUpdateDlg;

    function showUpdateMenuDlg() {
        // 如果没有选择节点进行添加，则提示
        var treeObj = $.fn.zTree.getZTreeObj("menuTree");
        var nodes = treeObj.getSelectedNodes();
        if (nodes.length == 1) {
           var v_selectedNode = nodes[0];
           $("#update_menuName").val(v_selectedNode.name);
           $("#update_url").val(v_selectedNode.menuUrl);
           $("input[name='update_type']").each(function () {
               if ($(this).val() == v_selectedNode.type) {
                   this.checked = true;
               }
           })
           $("#update_menuName").val(v_selectedNode.name);
           var v_id = v_selectedNode.id;
            v_menuUpdateDlg = bootbox.dialog({
                title: '修改菜单',
                message: $("#menuUpdateDiv form"),
                size:"large",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确认',
                        className: 'btn-primary',
                        callback: function(){
                            var v_menuName = $("#update_menuName", v_menuUpdateDlg).val();
                            var v_type = $("input[name='update_type']:checked", v_menuUpdateDlg).val();
                            var v_url = $("#update_url", v_menuUpdateDlg).val();
                            //更新
                            $.ajax({
                                type:"post",
                                url:"/resource/update.jhtml",
                                data:{id:v_id,"menuName":v_menuName,"url":v_url,"type":v_type},
                                success:function (result) {
                                    if (result.code == 200) {
                                        // 刷新
                                        v_selectedNode.name = v_menuName;
                                        v_selectedNode.menuUrl = v_url;
                                        v_selectedNode.type = v_type;
                                        treeObj.updateNode(v_selectedNode);
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
            $("#menuUpdateDiv").html(v_menuUpdateDiv);
        } else if (nodes.length > 1) {
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>只能选择一个",
                size: 'small',
                title: "提示信息"
            });
        } else {
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>至少选择一个",
                size: 'small',
                title: "提示信息"
            });
        }
    }
    
    var v_menuAddDlg;
    function showAddMenuDlg() {
        // 如果没有选择节点进行添加，则提示
        var treeObj = $.fn.zTree.getZTreeObj("menuTree");
        var nodes = treeObj.getSelectedNodes();
        if (nodes.length == 1) {
            var v_fatherId = nodes[0].id;
            v_menuAddDlg = bootbox.dialog({
                title: '添加菜单',
                message: $("#menuAddDiv form"),
                size:"large",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确认',
                        className: 'btn-primary',
                        callback: function(){
                            var v_menuName = $("#add_menuName", v_menuAddDlg).val();
                            var v_url = $("#add_url", v_menuAddDlg).val();
                            var v_type = $("input[name='add_type']:checked", v_menuAddDlg).val();
                            $.ajax({
                                type:"post",
                                url:"/resource/add.jhtml",
                                data:{"fatherId":v_fatherId,"menuName":v_menuName,"url":v_url,"type":v_type},
                                success:function (result) {
                                    if (result.code == 200) {
                                        // 刷新
                                        var resourceNode = {id:result.data,name:v_menuName,pId:v_fatherId,"menuUrl":v_url,"type":v_type};
                                        // 调用ztree的方法动态在前台添加节点
                                        treeObj.addNodes(nodes[0], resourceNode);
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
            $("#menuAddDiv").html(v_menuAddDiv);
        } else if (nodes.length > 1) {
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>只能选择一个",
                size: 'small',
                title: "提示信息"
            });
        } else {
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>至少选择一个",
                size: 'small',
                title: "提示信息"
            });
        }


    }

    function initTree() {
        // 通过ajax获取后台数据
        $.ajax({
            type:"post",
            url:"/resource/list.jhtml",
            success:function (result) {
                if (result.code == 200) {

                    console.log(result.data);

                    var s = {
                        data: {
                            simpleData: {
                                enable: true
                            }
                        }
                    };

                    $.fn.zTree.init($("#menuTree"), s, result.data);
                }
            }
        })

    }

</SCRIPT>
</body>
</html>
