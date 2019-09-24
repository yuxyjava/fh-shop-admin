package com.fh.shop.admin.biz.role;

import com.fh.shop.admin.common.DataTableResult;
import com.fh.shop.admin.mapper.role.IRoleMapper;
import com.fh.shop.admin.param.role.RoleSearchParam;
import com.fh.shop.admin.po.role.Role;
import com.fh.shop.admin.po.role.RoleResource;
import com.fh.shop.admin.vo.role.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("roleService")
public class IRoleServiceImpl implements IRoleService {
    @Autowired
    private IRoleMapper roleMapper;

    @Override
    public List<Role> findRoleList() {
        List<Role> roleList = roleMapper.findRoleList();
        return roleList;
    }

    @Override
    public DataTableResult findPageList(RoleSearchParam roleSearchParam) {
        // 获取总条数
        Long count = roleMapper.findRoleCount(roleSearchParam);
        // 获取分页列表
        List<Role> roleList = roleMapper.findPageList(roleSearchParam);
        return new DataTableResult(roleSearchParam.getDraw(), count, count, roleList);
    }

    @Override
    public void addRole(Role role, List<Long> resourceIds) {
        roleMapper.addRole(role);
        addRoleResource(role, resourceIds);
    }

    private void addRoleResource(Role role, List<Long> resourceIds) {
        List<RoleResource> roleResourceList = new ArrayList<>();
        for (Long resourceId : resourceIds) {
            RoleResource roleResource = new RoleResource();
            roleResource.setResourceId(resourceId);
            roleResource.setRoleId(role.getId());
            roleResourceList.add(roleResource);
        }
        roleMapper.addRoleResource(roleResourceList);
    }

    @Override
    public RoleVo finRole(Long roleId) {
        // 获取角色信息
        Role role = roleMapper.findRole(roleId);
        // 获取角色对应的资源列表
        List<Long> resourceIdList = roleMapper.findResourceIdList(roleId);
        RoleVo roleVo = new RoleVo();
        roleVo.setId(roleId);
        roleVo.setResourceIdList(resourceIdList);
        roleVo.setRoleName(role.getRoleName());
        return roleVo;
    }

    @Override
    public void updateRole(Role role, List<Long> ids) {
        // 更新角色信息
        roleMapper.updateRole(role);
        // 删除该角色对应的所有的中间表中的关联联系
        roleMapper.deleteRoleResource(role.getId());
        // 重新进行中间表的插入
        addRoleResource(role, ids);
    }
}
