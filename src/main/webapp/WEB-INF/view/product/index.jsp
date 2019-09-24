<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/16 0016
  Time: 下午 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/common/head.jsp"></jsp:include>
    <title>商品管理</title>
</head>
<body>
<jsp:include page="/common/nav-static.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">商品查询</div>
                <div class="panel-body">
                    <form class="form-horizontal" id="userSearch">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">商品名</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="productName" placeholder="请输入商品名...">
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">品牌</label>
                                <div class="col-sm-4" id="brandSelect">

                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">价格范围</label>
                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="minPrice" placeholder="开始价格..." >
                                    <span class="input-group-addon" ><i class="glyphicon glyphicon-transfer"></i></span>
                                    <input type="text" class="form-control" id="maxPrice" placeholder="结束价格..." >
                                </div>
                            </div>
                            <label  class="col-sm-2 control-label">入职时间</label>
                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="minCreateDate" placeholder="开始时间..." >
                                    <span class="input-group-addon" ><i class="glyphicon glyphicon-calendar"></i></span>
                                    <input type="text" class="form-control" id="maxCreateDate" placeholder="结束时间..." >
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
    <div style="background-color: #ebcccc;width: 100%;">
        <button class="btn btn-primary" type="button" onclick="showAddProductDlg();"><i class="glyphicon glyphicon-plus"></i>添加</button>
        <button class="btn btn-danger" type="button" onclick="deleteProducts();"><i class="glyphicon glyphicon-trash"></i>批量删除</button>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">产品列表</div>

                <table id="productTable" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                    <tr>
                        <th>选择</th>
                        <th>商品名</th>
                        <th>价格</th>
                        <th>生产日期</th>
                        <th>状态</th>
                        <th>品牌名</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tfoot>
                    <tr >
                        <th>选择</th>
                        <th>商品名</th>
                        <th>价格</th>
                        <th>生产日期</th>
                        <th>状态</th>
                        <th>品牌名</th>
                        <th>操作</th>
                    </tr>
                    </tfoot>
                </table>

            </div>
        </div>
    </div>
</div>


<div id="productAddDiv" style="display: none;">
    <form class="form-horizontal" >
        <div class="form-group">
            <label  class="col-sm-2 control-label">商品名</label>
            <div class="col-sm-4">
                <input type="text" class="form-control"  id="add_productName" placeholder="请输入商品名...">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">价格</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="add_price" placeholder="请输入商品价格...">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">生产日期</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="add_createDate" placeholder="请输生产日期...">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">品牌</label>
            <div class="col-sm-4" id="add_brandSelect">
                
            </div>
        </div>


    </form>
</div>

<div id="productUpdateDiv" style="display: none;">
    <form class="form-horizontal" >
        <div class="form-group">
            <label  class="col-sm-2 control-label">商品名</label>
            <div class="col-sm-4">
                <input type="text" class="form-control"  id="update_productName" placeholder="请输入商品名...">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">价格</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="update_price" placeholder="请输入商品价格...">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">生产日期</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="update_createDate" placeholder="请输生产日期...">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">品牌</label>
            <div class="col-sm-4" id="update_brandSelect">

            </div>
        </div>


    </form>
</div>


<jsp:include page="/common/script.jsp"></jsp:include>
<script>
    var v_productAddDivHtml;
    var v_productUpdateDivHtml;
    $(function () {

        initDate("minCreateDate");
        initDate("maxCreateDate");
        initSelectBrandList();


        initProductTable();
        v_productAddDivHtml = $("#productAddDiv").html();
        v_productUpdateDivHtml = $("#productUpdateDiv").html();
    })

    function initSelectBrandList() {
        $.ajax({
            type:"post",
            url:"/brand/findAll.jhtml",
            async:false,
            success:function (result) {
                if (result.code == 200) {
                    var v_selectHtml = "<select class=\"form-control\" id='brandId'><option value='-1'>===请选择===</option>";
                    var v_brandArr = result.data;
                    for (var i = 0; i < v_brandArr.length; i++) {
                        v_selectHtml += "<option value='"+v_brandArr[i].id+"'>"+v_brandArr[i].brandName+"</option>";
                    }
                    v_selectHtml += "</select>";
                    $("#brandSelect").html(v_selectHtml);
                }
            }
        })
    }
    
    function initUpdateBrandList() {
        $.ajax({
            type:"post",
            url:"/brand/findAll.jhtml",
            async:false,
            success:function (result) {
                if (result.code == 200) {
                    var v_selectHtml = "<select class=\"form-control\" id='update_brandId'><option value='-1'>===请选择===</option>";
                    var v_brandArr = result.data;
                    for (var i = 0; i < v_brandArr.length; i++) {
                        v_selectHtml += "<option value='"+v_brandArr[i].id+"'>"+v_brandArr[i].brandName+"</option>";
                    }
                    v_selectHtml += "</select>";
                    $("#update_brandSelect").html(v_selectHtml);
                }
            }
        })
    }

    function initBrandList() {
        $.ajax({
            type:"post",
            url:"/brand/findAll.jhtml",
            async:false,
            success:function (result) {
                if (result.code == 200) {
                    var v_selectHtml = "<select class=\"form-control\" id='add_brandId'><option value='-1'>===请选择===</option>";
                    var v_brandArr = result.data;
                    for (var i = 0; i < v_brandArr.length; i++) {
                        v_selectHtml += "<option value='"+v_brandArr[i].id+"'>"+v_brandArr[i].brandName+"</option>";
                    }
                    v_selectHtml += "</select>";
                    $("#add_brandSelect").html(v_selectHtml);
                }
            }
        })
    }

    function search() {
        var v_param = {};
        v_param.productName = $("#productName").val();
        v_param.minPrice = $("#minPrice").val();
        v_param.maxPrice = $("#maxPrice").val();
        v_param.minCreateDate = $("#minCreateDate").val();
        v_param.maxCreateDate = $("#maxCreateDate").val();
        v_param.brandId = $("#brandId").val();

        productTable.settings()[0].ajax.data = v_param;
        productTable.ajax.reload();
    }
    

    function initDate(elementName) {
        $('#'+elementName).datetimepicker({
            format: 'YYYY-MM-DD',
            locale: 'zh-CN',
            showClear: true
        });
    }
    var v_productAddDlg;
    function showAddProductDlg() {
        initBrandList();
        initDate("add_createDate");
        v_productAddDlg = bootbox.dialog({
            title: '添加商品',
            message: $("#productAddDiv form"),
            size:"large",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确认',
                    className: 'btn-primary',
                    callback: function(){
                        // 点击确定按钮，发送ajax请求，插入数据
                        var v_param = {};
                        v_param.productName = $("#add_productName", v_productAddDlg).val();
                        v_param.productPrice = $("#add_price", v_productAddDlg).val();
                        v_param.createDate = $("#add_createDate", v_productAddDlg).val();
                        v_param.brandId =  $("#add_brandId", v_productAddDlg).val();
                        $.ajax({
                            type:"post",
                            url:"/product/add.jhtml",
                            data:v_param,
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
        $("#productAddDiv").html(v_productAddDivHtml);

    }

    var v_productUpdateDlg;
    function showUpdateProductDlg(id) {
        initUpdateBrandList();
        initDate("update_createDate");
        $.ajax({
            type:"post",
            url:"/product/find.jhtml",
            data:{"id":id},
            success:function (result) {
                if (result.code == 200) {
                    var v_product = result.data;
                    // 赋值
                    $("#update_productName").val(v_product.productName);
                    $("#update_price").val(v_product.price);
                    $("#update_createDate").val(v_product.createDate);
                    $("#update_brandId").val(v_product.brandId);
                    // 弹出对话框
                    v_productUpdateDlg = bootbox.dialog({
                        title: '修改商品',
                        message: $("#productUpdateDiv form"),
                        size:"large",
                        buttons: {
                            confirm: {
                                label: '<span class="glyphicon glyphicon-ok"></span>确认',
                                className: 'btn-primary',
                                callback: function(){
                                    // 点击确定按钮，发送ajax请求，插入数据
                                    var v_param = {};
                                    v_param.productName = $("#update_productName", v_productUpdateDlg).val();
                                    v_param.productPrice = $("#update_price", v_productUpdateDlg).val();
                                    v_param.createDate = $("#update_createDate", v_productUpdateDlg).val();
                                    v_param.brandId = $("#update_brandId", v_productUpdateDlg).val();
                                    v_param.id = id;
                                    $.ajax({
                                        type:"post",
                                        url:"/product/update.jhtml",
                                        data:v_param,
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
                    $("#productUpdateDiv").html(v_productUpdateDivHtml);
                }
            }
        })

    }
    
    function updateProductStatus(id, status) {
        $.ajax({
            type:"post",
            data:{"id":id, "status":status},
            url:"/product/updateProductStatus.jhtml",
            success:function (result) {
                if (result.code == 200) {
                    search();
                }
            }
        })
    }

    var productTable;
    function initProductTable() {
        productTable =  $('#productTable').DataTable( {
            "language": {
                "url": "/js/DataTables/Chinese.json"
            },
            "processing": true,
            // 是否允许检索
            "searching": false,
            "serverSide": true,
            "lengthMenu": [5, 10, 15, 20, 30],
            "ajax": {
                "url": "/product/list.jhtml",
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

            "columns": [
                {

                    "data": "id",
                    "render": function (data, type, row, meta) {
                        return "<input type='checkbox' value='"+data+"'>";
                    }


                },
                { "data": "productName" },
                { "data": "price" },
                { "data": "createDate" },
                { "data": "status",
                    "render": function (data, type, row, meta) {
                        return data==1?"上架":"下架";
                    }
                },
                { "data": "brandName" },
                {
                    "data": "id",
                    "render": function (data, type, row, meta) {
                        var v_status = row.status;
                        var v_buttonText = "";
                        var v_class = "";
                        var v_icon = "";
                        var v_updateStatus;
                        if (v_status == 1) {
                            v_buttonText = "下架";
                            v_class = 'btn-warning';
                            v_icon = "glyphicon glyphicon-arrow-down";
                            v_updateStatus = 0;
                        } else {
                            v_buttonText = "上架";
                            v_class = 'btn-success';
                            v_icon = "glyphicon glyphicon-arrow-up";
                            v_updateStatus = 1;
                        }
                        return "<div class=\"btn-group\" role=\"group\" >\n" +
                            "  <button type=\"button\" class=\"btn btn-info\" onclick=\"showUpdateProductDlg('"+data+"')\"><i class='glyphicon glyphicon-pencil'></i> 修改</button>\n" +
                            "  <button type=\"button\" class=\"btn btn-danger\" onclick=\"deleteProduct('"+data+"')\"><i class='glyphicon glyphicon-trash'></i> 删除</button>\n" +
                            "  <button type=\"button\" class=\"btn "+v_class+"\" onclick=\"updateProductStatus('"+data+"','"+v_updateStatus+"')\"><i class='"+v_icon+"'></i> "+v_buttonText+"</button>\n" +
                            "</div>";
                    }
                }
            ]
        } );
    }
    
    function deleteProduct(id) {
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
                        url:"/product/delete.jhtml",
                        data:{"id":id},
                        success:function (result) {
                            if (result.code == 200) {
                                search();
                            }
                        }
                    })
                }
            }
        })
    }
</script>
</body>
</html>
