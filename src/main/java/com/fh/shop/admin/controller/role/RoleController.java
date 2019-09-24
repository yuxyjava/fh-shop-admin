package com.fh.shop.admin.controller.role;

import com.fh.shop.admin.biz.role.IRoleService;
import com.fh.shop.admin.common.DataTableResult;
import com.fh.shop.admin.param.role.RoleSearchParam;
import com.fh.shop.admin.po.role.Role;
import com.fh.shop.admin.vo.role.RoleVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Resource(name="roleService")
    private IRoleService roleService;

    @RequestMapping("/findList")
    @ResponseBody
    public DataTableResult findList(RoleSearchParam roleSearchParam) {
        return roleService.findPageList(roleSearchParam);
    }

    @RequestMapping("/findRole")
    @ResponseBody
    public Map findRole(Long roleId) {
        Map result = new HashMap();
        try {
            RoleVo roleVo = roleService.finRole(roleId);
            result.put("code", "200");
            result.put("msg", "ok");
            result.put("data", roleVo);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", "-1");
            result.put("msg", "error");
        }
        return result;
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map update(Role role, @RequestParam("ids[]") List<Long> ids) {
        Map result = new HashMap();
        try {
            roleService.updateRole(role, ids);
            result.put("code", "200");
            result.put("msg", "ok");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", "-1");
            result.put("msg", "error");
        }
        return result;
    }

    @RequestMapping("/index")
    public String index() {
        return "role/index";
    }

    @RequestMapping("/add")
    @ResponseBody
    public Map add(Role role, @RequestParam("resourceIds[]") List<Long> resourceIds) {
        Map result = new HashMap();
        try {
            roleService.addRole(role, resourceIds);
            result.put("code", "200");
            result.put("msg", "ok");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", "-1");
            result.put("msg", "error");
        }
        return result;
    }

    @RequestMapping("/list")
    @ResponseBody
    public Map list() {
        Map result = new HashMap();
        try {
            List<Role> roleList = roleService.findRoleList();
            result.put("code", "200");
            result.put("msg", "ok");
            result.put("data", roleList);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", "-1");
            result.put("msg", "error");
        }
        return result;
    }
}
