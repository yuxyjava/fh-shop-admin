<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/19 0019
  Time: 上午 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Title</title>
    <link href="/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .show-grid [class ^="col-"] {
            padding-top: 10px;
            padding-bottom: 10px;
            background-color: #eee;
            border: 1px solid #ddd;
            background-color: rgba(86, 61, 124, .15);
            border: 1px solid rgba(86, 61, 124, .2);
        }
    </style>
</head>
<body class="show-grid">
<div class="container">
    <div class="row">
        <div class="col-md-12"></div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-6"></div>
            </div>
            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-6"></div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-12"></div>
            </div>
            <div class="row">
                <div class="col-md-12">

                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-6"></div>
            </div>
            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-6"></div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-5">
            <div class="row">
                <div class="col-md-12"></div>
            </div>
            <div class="row">
                <div class="col-md-12"></div>
            </div>
        </div>
        <div class="col-md-1">
            <div class="row">
                <div class="col-md-12"></div>
            </div>
            <div class="row">
                <div class="col-md-12"></div>
            </div>
        </div>
        <div class="col-md-1">
            <div class="row">
                <div class="col-md-12"></div>
            </div>
            <div class="row">
                <div class="col-md-12"></div>
            </div>
        </div>
        <div class="col-md-5">
            <div class="row">
                <div class="col-md-12"></div>
            </div>
            <div class="row">
                <div class="col-md-12"></div>
            </div>
        </div>
    </div>
</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="/js/jquery-3.3.1.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="/js/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
