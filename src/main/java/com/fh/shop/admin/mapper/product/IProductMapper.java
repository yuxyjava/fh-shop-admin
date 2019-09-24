package com.fh.shop.admin.mapper.product;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fh.shop.admin.param.product.ProductSearchParam;
import com.fh.shop.admin.po.product.Product;

import java.util.List;

public interface IProductMapper extends BaseMapper<Product> {

    long findProductListCount(ProductSearchParam productSearchParam);

    List<Product> findProductPageList(ProductSearchParam productSearchParam);
}
