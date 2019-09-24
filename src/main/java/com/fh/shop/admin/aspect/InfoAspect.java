package com.fh.shop.admin.aspect;

import org.aspectj.lang.ProceedingJoinPoint;

// 切面就是一个普通的java类
// 想让普通的java类起到切面的作用，就需要进行相关的配置
public class InfoAspect {

    // 横切逻辑[非核心代码]
    public Object doInfo(ProceedingJoinPoint pjp) {
        // 方法执行
        Object result = null;
        try {
            // 实际上要执行的方法
            // result带表的是谁？
            result = pjp.proceed();
            // 写上一句话
            System.out.println("==========方法执行成功!!!");
        } catch (Throwable throwable) {
            throwable.printStackTrace();
            throw new RuntimeException(throwable);
        }
        return result;
    }
}
