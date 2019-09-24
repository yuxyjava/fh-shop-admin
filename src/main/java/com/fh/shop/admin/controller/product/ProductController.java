package com.fh.shop.admin.controller.product;

import com.fh.shop.admin.biz.product.IProductService;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.param.product.ProductSearchParam;
import com.fh.shop.admin.po.product.Product;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@RequestMapping("/product")
@Controller
public class ProductController {

    @Resource(name = "productService")
    private IProductService productService;

    @RequestMapping("/index")
    public String index() {
        return "product/index";
    }

    @RequestMapping("/add")
    @ResponseBody
    public ServerResponse add(Product product) {
        return productService.addProduct(product);
    }

    @RequestMapping("/list")
    @ResponseBody
    public ServerResponse list(ProductSearchParam productSearchParam) {
        return productService.findList(productSearchParam);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public ServerResponse delete(Long id) {
        return productService.deleteProduct(id);
    }

    @RequestMapping("/find")
    @ResponseBody
    public ServerResponse find(Long id) {
        return productService.findProduct(id);
    }

    @RequestMapping("/update")
    @ResponseBody
    public ServerResponse update(Product product) {
        return productService.updateProduct(product);
    }

    @RequestMapping("/updateProductStatus")
    @ResponseBody
    public ServerResponse updateProductStatus(Long id, int status) {
        return productService.updateProductStatus(id, status);
    }
}
