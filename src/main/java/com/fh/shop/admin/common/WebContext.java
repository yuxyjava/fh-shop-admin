package com.fh.shop.admin.common;

import javax.servlet.http.HttpServletRequest;

public class WebContext {

    private static ThreadLocal<HttpServletRequest> requestThreadLocal = new ThreadLocal<>();

    // 以当前线程作为key，存值
    public static void setRequest(HttpServletRequest request) {
        requestThreadLocal.set(request);
    }

    // 以当前线程作为key,取值
    public static HttpServletRequest getRequest() {
        return requestThreadLocal.get();
    }

    public static void remove() {
        requestThreadLocal.remove();
    }
}
