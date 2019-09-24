package com.fh.shop.admin.common;

public enum ResponseEnum {

    USERNAME_IS_ERROR(1001, "用户名错误"),
    PASSWORD_IS_ERROR(1002, "密码错误"),
    USER_IS_LOCK(1003, "用户被锁定了"),
    USER_UPDATE_PASSWORD_INFO_IS_EMPTY(1004, "用户修改密码时的信息为空"),
    PASSWORD_IS_DIFFERENT(1005, "两次输入的密码不一致"),
    OLD_PASSWORD_IS_ERROR(1006, "老密码错误"),
    USER_IS_NULL(1007, "用户不存在"),
    MAIL_IS_NULL(1008, "邮箱不存在"),
    USERNAME_PASSWORD_IS_NULL(1000, "用户名或者密码为空");

    private int code;
    private String msg;

    private ResponseEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
