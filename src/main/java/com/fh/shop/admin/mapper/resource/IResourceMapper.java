package com.fh.shop.admin.mapper.resource;

import com.fh.shop.admin.po.resource.Resource;

import java.util.List;

public interface IResourceMapper {

    public List<Resource> findList();

    void addResource(Resource resource);

    void updateResource(Resource resource);

    void deleteBatch(List<Integer> ids);

    void deleteRoleResource(List<Integer> ids);

    List<Resource> findMenuListByUserId(Long id);

    List<Resource> findResourceListByUserId(Long id);
}
