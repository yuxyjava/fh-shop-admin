package com.fh.shop.admin.mapper.log;

import com.fh.shop.admin.param.log.LogSearchParam;
import com.fh.shop.admin.po.log.LogInfo;

import java.util.List;

public interface ILogMapper {

    public void addLog(LogInfo logInfo);

    long findListTotalCount(LogSearchParam logSearchParam);

    List<LogInfo> findPageList(LogSearchParam logSearchParam);
}
