package com.fh.shop.admin.interceptor;

import com.alibaba.fastjson.JSONObject;
import com.fh.shop.admin.po.resource.Resource;
import com.fh.shop.admin.util.SystemConst;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PermissionInterceptor extends HandlerInterceptorAdapter {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 将用户访问的url和他所拥有的权限的url作对比
        System.out.println("=========权限拦截器");
        // 获取用户拥有的菜单权限url
        List<Resource> userAllResourceList = (List<Resource>) request.getSession().getAttribute(SystemConst.USER_ALL_RESOURCE_LIST);
        // 获取用户访问的url
        String requestURI = request.getRequestURI();
        StringBuffer requestURL = request.getRequestURL();
        System.out.println(requestURI+":"+requestURL);

        // 对于公共访问的资源【没有放到资源表的url都属于公共访问资源】，就直接放行
        List<Resource> allResourceList = (List<Resource>) request.getSession().getAttribute(SystemConst.ALL_RESOURCE_LIST);
        boolean isPermissionValidation = false;
        for (Resource resource : allResourceList) {
            if (StringUtils.isNotEmpty(resource.getUrl()) && requestURI.contains(resource.getUrl())) {
                // 受管控的资源,需要进行权限验证
                isPermissionValidation = true;
                break;
            }
        }
        if (!isPermissionValidation) {
            return true;
        }
        // 对于管控的资源【放到资源表的url】

        // 判断当前访问的url是否在权限范围内
        boolean hasPermission = false;
        for (Resource resource : userAllResourceList) {
            if (StringUtils.isNotEmpty(resource.getUrl()) && requestURI.contains(resource.getUrl())) {
                System.out.println(resource.getMenuName()+":"+resource.getUrl());
                hasPermission = true;
                break;
            }
        }
        if (!hasPermission) {
            String header = request.getHeader("X-Requested-With");
            if (StringUtils.isNotEmpty(header) && header.equals("XMLHttpRequest")) {
                // ajax请求
                Map result = new HashMap();
                result.put("code", "-10000");
                result.put("msg", "没有访问权限");
                String resultJson = JSONObject.toJSONString(result);
                outJson(resultJson, response);
            } else {
                response.sendRedirect(SystemConst.ERROR_PAGE);
            }
        }
        return hasPermission;
    }

    private void outJson(String json, HttpServletResponse response) {
        PrintWriter writer = null;
        try {
            // 解决中文乱码
            // 证明是json格式的字符串，并且指明编码为utf-8,解决中文乱码
            response.setContentType("application/json;charset=utf-8");
            writer = response.getWriter();
            writer.write(json);
            writer.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
             if (null != writer) {
                 writer.close();
                 writer = null;
             }
        }
    }

}
