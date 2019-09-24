package com.fh.shop.admin.aspect;

import com.fh.shop.admin.biz.log.ILogService;
import com.fh.shop.admin.common.Log;
import com.fh.shop.admin.common.WebContext;
import com.fh.shop.admin.po.log.LogInfo;
import com.fh.shop.admin.po.user.User;
import com.fh.shop.admin.util.SystemConst;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

public class LogAspect {

    private static final Logger LOGGER = LoggerFactory.getLogger(LogAspect.class);

    @Resource(name="logService")
    private ILogService logService;

    public Object doLog(ProceedingJoinPoint pjp) {
        // 获取类名
        String className = pjp.getTarget().getClass().getCanonicalName();
        // 获取方法名
        String methodName = pjp.getSignature().getName();
        // 获取用户名
        HttpServletRequest request = WebContext.getRequest();
        User userInfo = (User) request.getSession().getAttribute(SystemConst.CURRENT_USER);
        String userName = userInfo.getUserName();
        String realName = userInfo.getRealName();
        // 获取客户端提交的参数信息
        StringBuffer detail = getParamInfo(request);
        // 获取注解中的信息
        MethodSignature methodSignature = (MethodSignature) pjp.getSignature();
        Method method = methodSignature.getMethod();
        // 判断方法上面是否有自定义注解
        String msg = "";
        if (method.isAnnotationPresent(Log.class)) {
            // 获取自定义注解
            Log annotation = method.getAnnotation(Log.class);
            // 获取自定义注解中的内容
            msg = annotation.value();
        }
//        System.out.println("============="+userInfo.getRealName());
        // 执行真实的方法
        Object result = null;
        try {
             result = pjp.proceed();
             LOGGER.info(userName+"执行了"+className+"的"+methodName+"方法成功！！！");
             // 插入日志表中
            LogInfo logInfo = new LogInfo();
            logInfo.setCurrDate(new Date());
            logInfo.setErrMsg("");
            logInfo.setInfo("执行了"+className+"的"+methodName+"方法成功！！！");
            logInfo.setUserName(userName);
            logInfo.setRealName(realName);
            logInfo.setStatus(SystemConst.LOG_STATUS_SUCCESS);
            logInfo.setDetail(detail.toString());
            logInfo.setContent(msg);
            logService.addLog(logInfo);
        } catch (Throwable throwable) {
            // 打印异常信息到控制台
//            throwable.printStackTrace();
            // 记录异常信息到日志
            LOGGER.error(userName+"执行了"+className+"的"+methodName+"方法失败:"+throwable.getMessage());
            // 记录日志表
            LogInfo logInfo = new LogInfo();
            logInfo.setCurrDate(new Date());
            logInfo.setErrMsg(throwable.getMessage());
            logInfo.setInfo("执行了"+className+"的"+methodName+"方法失败！！！");
            logInfo.setUserName(userName);
            logInfo.setRealName(realName);
            logInfo.setStatus(SystemConst.LOG_STATUS_ERROR);
            logInfo.setDetail(detail.toString());
            logInfo.setContent(msg);
            logService.addLog(logInfo);
            // 抛出异常，只有这样统一异常处理才能捕获到对应的异常信息，并将其转换为serverResponse进行客户端响应
            throw new RuntimeException(throwable);
        }
        return result;
    }

    private StringBuffer getParamInfo(HttpServletRequest request) {
        Map<String, String[]> parameterMap = request.getParameterMap();
        Iterator<Map.Entry<String, String[]>> iterator = parameterMap.entrySet().iterator();
        StringBuffer detail = new StringBuffer();
        while (iterator.hasNext()) {
            Map.Entry<String, String[]> entry = iterator.next();
            String key = entry.getKey();
            String[] value = entry.getValue();
            detail.append("|").append(key).append("=").append(StringUtils.join(value, ","));
        }
        return detail;
    }
}
