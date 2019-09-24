package com.fh.shop.admin.po.user;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {

    private Long id;

    private String userName;

    private String realName;

    private String password;

    private Integer sex;

    private Integer age;

    private String phone;

    private String email;

    private Integer salary;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date entryTime;

    private String roleIds;

    private Date loginTime;

    private int loginCount;

    private String salt;

    private int loginErrorCount;

    private Date loginErrorDate;

    public int getLoginErrorCount() {
        return loginErrorCount;
    }

    public void setLoginErrorCount(int loginErrorCount) {
        this.loginErrorCount = loginErrorCount;
    }

    public Date getLoginErrorDate() {
        return loginErrorDate;
    }

    public void setLoginErrorDate(Date loginErrorDate) {
        this.loginErrorDate = loginErrorDate;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public int getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(int loginCount) {
        this.loginCount = loginCount;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public String getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(String roleIds) {
        this.roleIds = roleIds;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public Date getEntryTime() {
        return entryTime;
    }

    public void setEntryTime(Date entryTime) {
        this.entryTime = entryTime;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
