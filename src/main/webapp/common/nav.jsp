<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/28 0028
  Time: 上午 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    .dropdown-submenu {
        position: relative;
    }

    .dropdown-submenu > .dropdown-menu {
        top: 0;
        left: 100%;
        margin-top: -6px;
        margin-left: -1px;
        -webkit-border-radius: 0 6px 6px 6px;
        -moz-border-radius: 0 6px 6px;
        border-radius: 0 6px 6px 6px;
    }

    .dropdown-submenu:hover > .dropdown-menu {
        display: block;
    }

    .dropdown-submenu > a:after {
        display: block;
        content: " ";
        float: right;
        width: 0;
        height: 0;
        border-color: transparent;
        border-style: solid;
        border-width: 5px 0 5px 5px;
        border-left-color: #ccc;
        margin-top: 5px;
        margin-right: -10px;
    }

    .dropdown-submenu:hover > a:after {
        border-left-color: #fff;
    }

    .dropdown-submenu.pull-left {
        float: none;
    }

    .dropdown-submenu.pull-left > .dropdown-menu {
        left: -100%;
        margin-left: 10px;
        -webkit-border-radius: 6px 0 6px 6px;
        -moz-border-radius: 6px 0 6px 6px;
        border-radius: 6px 0 6px 6px;
    }
</style>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">飞狐电商后台管理</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" id="nav_menu">

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">欢迎${user.realName}登录</a></li>
                <li><a href="#">今天是第${user.loginCount}次登录</a></li>
                <c:if test="${!empty user.loginTime}">
                    <li><a href="#">上次登录的时间<fmt:formatDate value="${user.loginTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </a></li>
                </c:if>


                <li><a href="/user/logout.jhtml">退出</a></li>
                <%--<li class="dropdown">--%>
                <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>--%>
                <%--<ul class="dropdown-menu">--%>
                <%--<li><a href="#">Action</a></li>--%>
                <%--<li><a href="#">Another action</a></li>--%>
                <%--<li><a href="#">Something else here</a></li>--%>
                <%--<li role="separator" class="divider"></li>--%>
                <%--<li><a href="#">Separated link</a></li>--%>
                <%--</ul>--%>
                <%--</li>--%>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<script src="/js/jquery-3.3.1.js"></script>

<script>

    $(function () {
        buildMenu();
    })

    $.ajaxSetup({
        complete:function (result) {
            var v_data = result.responseJSON;
            if (v_data.code == -10000) {
                bootbox.alert({
                    message: "<span class='glyphicon glyphicon-exclamation-sign'></span>"+v_data.msg,
                    size: 'small',
                    title: "提示信息"
                });
            } else if (v_data.code == -1) {
                bootbox.alert({
                    message: "<span class='glyphicon glyphicon-exclamation-sign'></span>操作失败",
                    size: 'small',
                    title: "提示信息"
                });
            }
        }
    })

    var menuArr;
    function buildMenu() {
        $.ajax({
            type:"post",
            url:"/resource/menulist.jhtml",
            success:function (result) {
                if (result.code == 200) {
                    menuArr = result.data;
                    initMenu();
                }
            }
        })
    }
    
    function initMenu() {
        // 获取最顶级菜单
        var v_topMenuHtml = getTopMenuHtml();
        var v_topMenuObj = $(v_topMenuHtml);
        // 获取顶级菜单的id
        var v_topMenuIdArr = getTopMenuIdArr();
        for (var i = 0; i < v_topMenuIdArr.length; i++) {
            var v_children = getChildren(v_topMenuIdArr[i]);
            if (v_children.length > 0) {
                // 有孩子,把孩子追加上去，并且增加特定的属性

                // 找到要增加特性属性的那个a
                var v_href = v_topMenuObj.find("a[data-id='"+v_topMenuIdArr[i]+"']");
                v_href.attr("data-toggle", "dropdown");
                v_href.append('<span class="caret"></span>');
                // 构建孩子对应的html代码
                var v_childsHtml = buildChildrenHtml(v_children);
                // 把孩子追加上去
                v_href.parent().append(v_childsHtml);
            }
        }
        console.log(v_topMenuObj);
        $("#nav_menu").html(v_topMenuObj)
    }

    function getTopMenuHtml() {
        var v_menuhtml = "";
        for (var i = 0; i < menuArr.length; i++) {
            if (menuArr[i].fatherId == 1) {
                v_menuhtml+='<li><a href="'+menuArr[i].url+'" data-id="'+menuArr[i].id+'">'+menuArr[i].menuName+'</a></li>';
            }
        }
        return v_menuhtml;
    }
    
    function getTopMenuIdArr() {
        var menuIdArr = [];
        for (var i = 0; i < menuArr.length; i++) {
            if (menuArr[i].fatherId == 1) {
                menuIdArr.push(menuArr[i].id);
            }
        }
        return menuIdArr;
    }
    
    function getChildren(id) {
        var v_children = [];
        for (var i = 0; i < menuArr.length; i++) {
            if (menuArr[i].fatherId == id) {
                v_children.push(menuArr[i]);
                getChildren(menuArr[i].id);
            }
        }
        return v_children;
    }

    function buildChildrenHtml(childs) {
        var v_result = '<ul class="dropdown-menu">';
        for (var i = 0; i < childs.length; i++) {
            v_result+='<li><a href="'+childs[i].url+'">'+childs[i].menuName+'</a></li>';
        }
        v_result+="</ul>";
        return v_result;
    }
</script>


