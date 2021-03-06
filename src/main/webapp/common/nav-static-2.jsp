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
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">商品管理 <span class="sr-only">(current)</span></a></li>
                <li><a href="#">品牌管理</a></li>
                <li><a href="#">地区管理</a></li>
                <li><a href="#">分类管理</a></li>
                <li>
                    <a href="#" data-toggle="dropdown">系统管理<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/user/index.jhtml">用户管理</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="/role/index.jhtml">角色管理</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="/resource/index.jhtml">菜单管理</a></li>
                        <li role="separator" class="divider"></li>
                        <li class="dropdown-submenu">
                            <a tabindex="-1" href="#">角色管理</a>
                            <ul class="dropdown-menu">
                                        <li class="dropdown-submenu"><a tabindex="-1" href="#">Second level link</a>
                                <ul class="dropdown-menu">
                                    <li><a tabindex="-1" href="#">Second level link</a></li>
                                    <li><a tabindex="-1" href="#">Second level link</a></li>
                                </ul>
                            </li>
                                        <li><a tabindex="-1" href="#">Second level link</a></li>
                                        <li><a tabindex="-1" href="#">Second level link</a></li>
                                        <li><a tabindex="-1" href="#">Second level link</a></li>
                                        <li><a tabindex="-1" href="#">Second level link</a></li>
                                      </ul>
                        </li>
                    </ul>
                </li>
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





