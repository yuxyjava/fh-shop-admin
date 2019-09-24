package com.fh.shop.admin.biz.resource;

import com.fh.shop.admin.mapper.resource.IResourceMapper;
import com.fh.shop.admin.po.resource.Resource;
import com.fh.shop.admin.vo.resource.ResourceVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("resourceService")
public class IResourceServiceImpl implements IResourceService {

    @Autowired
    private IResourceMapper resourceMapper;

    @Override
    public List<ResourceVo> findList() {
        List<Resource> list = resourceMapper.findList();
        List<ResourceVo> resourceVoList = new ArrayList<>();
        for (Resource resource : list) {
            ResourceVo resourceVo = new ResourceVo();
            resourceVo.setId(resource.getId());
            resourceVo.setName(resource.getMenuName());
            resourceVo.setpId(resource.getFatherId());
            resourceVo.setType(resource.getType());
            resourceVo.setMenuUrl(resource.getUrl());
            resourceVoList.add(resourceVo);
        }
        return resourceVoList;
    }

    @Override
    public void addResource(Resource resource) {
        resourceMapper.addResource(resource);
    }

    @Override
    public void updateResource(Resource resource) {
        resourceMapper.updateResource(resource);
    }

    @Override
    public void deleteBatch(List<Integer> ids) {
        // 删除资源表中的数据
        resourceMapper.deleteBatch(ids);
        // 删除中间表中的数据
        resourceMapper.deleteRoleResource(ids);
    }

    @Override
    public List<Resource> findMenuListByUserId(Long id) {
        List<Resource> menuList = resourceMapper.findMenuListByUserId(id);
        return menuList;
    }

    @Override
    public List<Resource> findAllList() {
        List<Resource> list = resourceMapper.findList();
        return list;
    }

    @Override
    public List<Resource> findResourceListByUserId(Long id) {
        List<Resource> resourceList = resourceMapper.findResourceListByUserId(id);
        return resourceList;
    }
}
