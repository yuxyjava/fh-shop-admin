<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/9 0009
  Time: 上午 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/common/head.jsp"></jsp:include>
    <title>日志管理</title>
</head>
<body>
<jsp:include page="/common/nav-static.jsp"></jsp:include>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">日志查询</div>
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
                            <label  class="col-sm-2 control-label">状态</label>
                            <div class="col-sm-4">
                                <select id="status" class="form-control">
                                    <option value="-1">===请选择===</option>
                                    <option value="1">成功</option>
                                    <option value="0">失败</option>
                                </select>
                            </div>
                            <label  class="col-sm-2 control-label">操作信息</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="content" placeholder="请输入操作信息...">

                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">操作时间</label>
                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="minCurrTime" placeholder="开始时间..." >
                                    <span class="input-group-addon" ><i class="glyphicon glyphicon-calendar"></i></span>
                                    <input type="text" class="form-control" id="maxCurrTime" placeholder="结束时间..." >
                                </div>
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
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info" style="width:100%">
                <div class="panel-heading">日志列表</div>

                <table id="logTable" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                    <tr>
                        <th>用户名</th>
                        <th>真实姓名</th>
                        <th>操作信息</th>
                        <th>状态</th>
                        <th>日志信息</th>
                        <th>错误信息</th>
                        <th>操作时间</th>
                        <th>详情</th>
                    </tr>
                    </thead>

                    <tfoot>
                    <tr>
                        <th>用户名</th>
                        <th>真实姓名</th>
                        <th>操作信息</th>
                        <th>状态</th>
                        <th>日志信息</th>
                        <th>错误信息</th>
                        <th>操作时间</th>
                        <th>详情</th>
                    </tr>
                    </tfoot>
                </table>

            </div>
        </div>
    </div>
</div>

<jsp:include page="/common/script.jsp"></jsp:include>
<script>
    $(function () {
        initLogTable();
        initSearchDate();
    })

    function search() {
        // 查询，本质是刷新datatable数据
        // 获取参数信息
        var v_userName = $("#userName").val();
        var v_realName = $("#realName").val();
        var v_status = $("#status").val();
        var v_content = $("#content").val();
        var v_minCurrTime = $("#minCurrTime").val();
        var v_maxCurrTime = $("#maxCurrTime").val();
        // 组装参数
        var v_param = {};
        v_param.userName = v_userName;
        v_param.realName = v_realName;
        v_param.status = v_status;
        v_param.content = v_content;
        v_param.minCurrTime = v_minCurrTime;
        v_param.maxCurrTime = v_maxCurrTime;

        // 调用datable中的方法，发送请求，传递参数，这样就能达到刷新datatable数据的效果
        logTable.settings()[0].ajax.data = v_param;
        logTable.ajax.reload();
    }

    function initSearchDate() {
        $('#minCurrTime').datetimepicker({
            format: 'YYYY-MM-DD HH:mm',
            locale: 'zh-CN',
            showClear: true
        });
        $('#maxCurrTime').datetimepicker({
            format: 'YYYY-MM-DD HH:mm',
            locale: 'zh-CN',
            showClear: true
        });
    }
    var logTable;
    function initLogTable() {
        logTable =  $('#logTable').DataTable( {
            "language": {
                "url": "/js/DataTables/Chinese.json"
            },
            "processing": true,
            // 是否允许检索
            "searching": false,
            "serverSide": true,
            "lengthMenu": [5, 10, 15, 20, 30],
            "ajax": {
                "url": "/log/list.jhtml",
                "type": "POST"
            },
            "columns": [
                { "data": "userName" },
                { "data": "realName" },
                { "data": "content" },
                {   "data": "status",
                    "render": function (data, type, row, meta) {
                        return data==1?"成功":"失败";
                    }
                },
                { "data": "info" },
                { "data": "errMsg" },
                { "data": "currDate" },
                {
                    "data": "detail"

                }
            ]
        } );
    }
</script>
</body>
</html>
