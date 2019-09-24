package com.fh.shop.admin.biz.log;

import com.fh.shop.admin.common.DataTableResult;
import com.fh.shop.admin.mapper.log.ILogMapper;
import com.fh.shop.admin.param.log.LogSearchParam;
import com.fh.shop.admin.po.log.LogInfo;
import com.fh.shop.admin.util.DateUtil;
import com.fh.shop.admin.vo.log.LogVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("logService")
public class ILogServiceImpl implements ILogService {

    @Autowired
    private ILogMapper logMapper;

    @Override
    public void addLog(LogInfo logInfo) {
        logMapper.addLog(logInfo);
    }

    @Override
    public DataTableResult findList(LogSearchParam logSearchParam) {
        long totalCount = logMapper.findListTotalCount(logSearchParam);
        List<LogInfo> logList = logMapper.findPageList(logSearchParam);
        List<LogVo> logVoList = buildLogVoList(logList);
        return new DataTableResult(logSearchParam.getDraw(), totalCount, totalCount, logVoList);
    }

    private List<LogVo> buildLogVoList(List<LogInfo> logList) {
        List<LogVo> logVoList = new ArrayList<>();
        for (LogInfo logInfo : logList) {
            LogVo logVo = new LogVo();
            logVo.setId(logInfo.getId());
            logVo.setCurrDate(DateUtil.date2str(logInfo.getCurrDate(), DateUtil.FULL_YEAR));
            logVo.setErrMsg(logInfo.getErrMsg());
            logVo.setRealName(logInfo.getRealName());
            logVo.setUserName(logInfo.getUserName());
            logVo.setInfo(logInfo.getInfo());
            logVo.setStatus(logInfo.getStatus());
            logVo.setDetail(logInfo.getDetail());
            logVo.setContent(logInfo.getContent());
            logVoList.add(logVo);
        }
        return logVoList;
    }
}
