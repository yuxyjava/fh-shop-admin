package com.fh.shop.admin.biz.role;

import com.fh.shop.admin.common.DataTableResult;
import com.fh.shop.admin.param.role.RoleSearchParam;
import com.fh.shop.admin.po.role.Role;
import com.fh.shop.admin.vo.role.RoleVo;

import java.util.List;

public interface IRoleService {

    public List<Role> findRoleList();

    DataTableResult findPageList(RoleSearchParam roleSearchParam);

    void addRole(Role role, List<Long> resourceIds);

    RoleVo finRole(Long roleId);

    void updateRole(Role role, List<Long> ids);
}
