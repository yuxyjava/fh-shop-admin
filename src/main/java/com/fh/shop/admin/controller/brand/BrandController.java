package com.fh.shop.admin.controller.brand;


import com.fh.shop.admin.biz.brand.IBrandService;
import com.fh.shop.admin.common.ServerResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@RequestMapping("/brand")
@Controller
public class BrandController {

    @Resource(name = "brandService")
    private IBrandService brandService;

    @RequestMapping("/findAll")
    @ResponseBody
    public ServerResponse findAll() {
        ServerResponse all = brandService.findAll();
        return all;
    }
}
