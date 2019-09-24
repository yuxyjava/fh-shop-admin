package com.fh.shop.admin.vo.role;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class RoleVo implements Serializable {

    private Long id;

    private String roleName;

    private List<Long> resourceIdList = new ArrayList<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public List<Long> getResourceIdList() {
        return resourceIdList;
    }

    public void setResourceIdList(List<Long> resourceIdList) {
        this.resourceIdList = resourceIdList;
    }
}
