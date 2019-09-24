package com.fh.shop.admin.interceptor;

import com.fh.shop.admin.util.SystemConst;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("=========登录拦截器");
        Object userInfo = request.getSession().getAttribute(SystemConst.CURRENT_USER);
        if (userInfo != null) {
            // 正常登录并且登录成功，则直接放行
            return true;
        } else {
            // 如果没有成功登录，则跳转到登录页面，阻止继续执行后续代码
            response.sendRedirect("/");
            return false;
        }



    }
}
