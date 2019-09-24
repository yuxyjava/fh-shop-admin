package com.fh.shop.admin.mapper.role;

import com.fh.shop.admin.param.role.RoleSearchParam;
import com.fh.shop.admin.po.role.Role;
import com.fh.shop.admin.po.role.RoleResource;

import java.util.List;

public interface IRoleMapper {

    public List<Role> findRoleList();

    Long findRoleCount(RoleSearchParam roleSearchParam);

    List<Role> findPageList(RoleSearchParam roleSearchParam);

    void addRole(Role role);

    void addRoleResource(List<RoleResource> roleResourceList);

    Role findRole(Long roleId);

    List<Long> findResourceIdList(Long roleId);

    void updateRole(Role role);

    void deleteRoleResource(Long id);
}
