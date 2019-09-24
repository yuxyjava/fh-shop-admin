package com.fh.shop.admin.controller.log;

import com.fh.shop.admin.biz.log.ILogService;
import com.fh.shop.admin.common.DataTableResult;
import com.fh.shop.admin.param.log.LogSearchParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/log")
public class LogController {

    @Resource(name="logService")
    private ILogService logService;

    @RequestMapping("index")
    public String index() {
        return "log/index";
    }

    @RequestMapping("list")
    @ResponseBody
    public DataTableResult list(LogSearchParam logSearchParam) {
        DataTableResult result = logService.findList(logSearchParam);
        return result;
    }
}
