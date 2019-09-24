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
        <div class="collapse navbar-collapse" id="nav_menu">

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">欢迎${user.realName}登录</a></li>
                <li><a href="#">今天是第${user.loginCount}次登录</a></li>
                <c:if test="${!empty user.loginTime}">
                    <li><a href="#">上次登录的时间<fmt:formatDate value="${user.loginTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </a></li>
                </c:if>


                <li><a href="/user/logout.jhtml">退出</a></li>
                <li><a href="/user/toUpdatePassword.jhtml">修改密码</a></li>
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
        $.ajaxSetup({
            complete:function (result) {
                var v_data = result.responseJSON;
                // 在js中，code不为空[code有值，code存在] 并且code的值不等于200
                if (v_data.code && v_data.code != 200) {
                    bootbox.alert({
                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>"+v_data.msg,
                        size: 'small',
                        title: "提示信息"
                    });
                }
            }
        })
        initMenu();

        selectMenuItem();
    })
    var menuArr;
    function initMenu() {
        $.ajax({
            type:"post",
            url:"/resource/menulist.jhtml",
            async:false,
            success:function (result) {
                if (result.code == 200) {
                    menuArr = result.data;
                    console.log(menuArr);
                    buildMenu(1,1);
                    $("#nav_menu").append(v_html);
                    console.log(v_html);
                }
            }
        })
    }

    var v_html = "";
    function buildMenu(id, level) {
        // 获取指定id下的所有孩子
        var v_childArr = getChilds(id);
        // 退出条件
        if (v_childArr.length > 0)
        {
            // 父亲
            if (level == 1) {
                v_html+='<ul class="nav navbar-nav">';
            } else {
                v_html+='<ul class="dropdown-menu">';
            }
            for (var i = 0; i < v_childArr.length; i++)
            {
                var v_node = v_childArr[i];
                var hasChilds = hasChild(v_node.id);
                //v_node.level=level;
                if (level == 1) {
                    if (hasChilds) {
                        v_html+='<li id="li_'+v_node.id+'"><a href="#" data-toggle="dropdown">'+v_node.menuName+'<span class="caret"></span></a>';
                    } else {
                        v_html+='<li id="li_'+v_node.id+'"><a href="'+v_node.url+'#'+v_node.id+'">'+v_node.menuName+'</a>';
                    }
                } else {
                    if (hasChilds) {
                        v_html+='<li class="dropdown-submenu"><a href="#">'+v_node.menuName+'</a>';
                    } else {
                        getTopId(v_node);
                        v_html+='<li><a href="'+v_node.url+'#'+topId+'">'+v_node.menuName+'</a>';
                    }

                }
                // 自己调自己，参数在发生变化
                buildMenu(v_node.id,level+1);
                v_html+="</li>"
            }
            v_html+="</ul>";
        }
    }


    var topId;
    function getTopId(node) {

        for (var i = 0; i < menuArr.length; i++)
        {
            if (node.fatherId == menuArr[i].id)
            {
                topId = menuArr[i].id;
                getTopId(menuArr[i]);
            }
        }

    }

    function selectMenuItem() {
       var v_id = window.location.hash.substring(1);
       console.log(v_id);
       $("#li_"+v_id).addClass("active");
    }

    function getChilds(id) {
        var childs = [];
        for (var i = 0; i < menuArr.length; i++)
        {
            if (menuArr[i].fatherId == id)
            {
                childs.push(menuArr[i]);
            }
        }
        return childs;
    }

    function hasChild(id) {
        for (var i = 0; i < menuArr.length; i++)
        {
            if (menuArr[i].fatherId == id) {
                return true;
            }
        }
        return false;
    }

</script>





