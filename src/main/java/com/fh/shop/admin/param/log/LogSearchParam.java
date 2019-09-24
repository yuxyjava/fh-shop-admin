package com.fh.shop.admin.param.log;

import com.fh.shop.admin.common.Page;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class LogSearchParam extends Page implements Serializable {

    private String userName;

    private String realName;

    private int status = -1;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date minCurrTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date maxCurrTime;

    private String content;

    public Date getMinCurrTime() {
        return minCurrTime;
    }

    public void setMinCurrTime(Date minCurrTime) {
        this.minCurrTime = minCurrTime;
    }

    public Date getMaxCurrTime() {
        return maxCurrTime;
    }

    public void setMaxCurrTime(Date maxCurrTime) {
        this.maxCurrTime = maxCurrTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
