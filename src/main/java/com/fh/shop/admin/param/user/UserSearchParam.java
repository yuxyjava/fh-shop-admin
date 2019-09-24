package com.fh.shop.admin.param.user;

import com.fh.shop.admin.common.Page;
import org.springframework.format.annotation.DateTimeFormat;
import sun.util.resources.cldr.ar.CalendarData_ar_YE;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserSearchParam extends Page implements Serializable {

    private String userName;

    private String realName;

    private Integer minAge;

    private Integer maxAge;

    private Integer minSalary;

    private Integer maxSalary;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date minEntryTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date maxEntryTime;

    private int roleListSize;

    private List<Integer> roleList = new ArrayList<>();

    private String roleIds;

    public String getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(String roleIds) {
        this.roleIds = roleIds;
    }

    public int getRoleListSize() {
        return roleListSize;
    }

    public void setRoleListSize(int roleListSize) {
        this.roleListSize = roleListSize;
    }

    public List<Integer> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Integer> roleList) {
        this.roleList = roleList;
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

    public Integer getMinAge() {
        return minAge;
    }

    public void setMinAge(Integer minAge) {
        this.minAge = minAge;
    }

    public Integer getMaxAge() {
        return maxAge;
    }

    public void setMaxAge(Integer maxAge) {
        this.maxAge = maxAge;
    }

    public Integer getMinSalary() {
        return minSalary;
    }

    public void setMinSalary(Integer minSalary) {
        this.minSalary = minSalary;
    }

    public Integer getMaxSalary() {
        return maxSalary;
    }

    public void setMaxSalary(Integer maxSalary) {
        this.maxSalary = maxSalary;
    }

    public Date getMinEntryTime() {
        return minEntryTime;
    }

    public void setMinEntryTime(Date minEntryTime) {
        this.minEntryTime = minEntryTime;
    }

    public Date getMaxEntryTime() {
        return maxEntryTime;
    }

    public void setMaxEntryTime(Date maxEntryTime) {
        this.maxEntryTime = maxEntryTime;
    }
}
