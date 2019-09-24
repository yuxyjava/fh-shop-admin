package com.fh.shop.admin.controller.resource;

import com.fh.shop.admin.biz.resource.IResourceService;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.util.SystemConst;
import com.fh.shop.admin.vo.resource.ResourceVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/resource")
public class ResourceController {
    @Resource(name = "resourceService")
    private IResourceService resourceService;
    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/index")
    public String toIndex() {
        return "resource/index";
    }

    @RequestMapping("/menulist")
    @ResponseBody
    public ServerResponse menulist() {
       List<com.fh.shop.admin.po.resource.Resource> menuList = (List<com.fh.shop.admin.po.resource.Resource>) request.getSession().getAttribute(SystemConst.LGOIN_USER_MENU_LIST);
       return ServerResponse.success(menuList);
    }

    @ResponseBody
    @RequestMapping("/update")
    public ServerResponse update(com.fh.shop.admin.po.resource.Resource resource) {
        resourceService.updateResource(resource);
        return ServerResponse.success();
    }

    @RequestMapping("/deleteBatch")
    @ResponseBody
    public ServerResponse deleteBatch(@RequestParam("ids[]") List<Integer> ids) {
        resourceService.deleteBatch(ids);
        return ServerResponse.success();
    }

    @RequestMapping("/add")
    @ResponseBody
    public ServerResponse add(com.fh.shop.admin.po.resource.Resource resource) {
        resourceService.addResource(resource);
        return ServerResponse.success(resource.getId());
    }


    @RequestMapping("/list")
    @ResponseBody
    public ServerResponse list() {
        List<ResourceVo> menuList = resourceService.findList();
        return ServerResponse.success(menuList);
    }
}
