package com.fh.shop.admin.biz.log;

import com.fh.shop.admin.common.DataTableResult;
import com.fh.shop.admin.param.log.LogSearchParam;
import com.fh.shop.admin.po.log.LogInfo;

public interface ILogService {

    public void addLog(LogInfo logInfo);

    DataTableResult findList(LogSearchParam logSearchParam);
}
