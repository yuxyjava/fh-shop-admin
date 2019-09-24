package com.fh.shop.admin.biz.resource;

import com.fh.shop.admin.po.resource.Resource;
import com.fh.shop.admin.vo.resource.ResourceVo;

import java.util.List;

public interface IResourceService {

    public List<ResourceVo> findList();

    void addResource(Resource resource);

    void updateResource(Resource resource);

    void deleteBatch(List<Integer> ids);

    List<Resource> findMenuListByUserId(Long id);

    List<Resource> findAllList();

    List<Resource> findResourceListByUserId(Long id);
}
