package com.fh.shop.admin.biz.product;

import com.fh.shop.admin.common.DataTableResult;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.mapper.product.IProductMapper;
import com.fh.shop.admin.param.product.ProductSearchParam;
import com.fh.shop.admin.po.product.Product;
import com.fh.shop.admin.util.DateUtil;
import com.fh.shop.admin.vo.product.ProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("productService")
public class IProductServiceImpl implements IProductService {

    @Autowired
    private IProductMapper productMapper;

    @Override
    public ServerResponse addProduct(Product product) {
        productMapper.insert(product);
        return ServerResponse.success();
    }

    @Override
    public ServerResponse findList(ProductSearchParam productSearchParam) {
        long totalCount = productMapper.findProductListCount(productSearchParam);
        List<Product> productList = productMapper.findProductPageList(productSearchParam);
        List<ProductVo> productVoList = buildProductVoList(productList);
        DataTableResult result = new DataTableResult(productSearchParam.getDraw(), totalCount, totalCount, productVoList);
        return ServerResponse.success(result);
    }

    @Override
    public ServerResponse deleteProduct(Long id) {
        productMapper.deleteById(id);
        return ServerResponse.success();
    }

    @Override
    public ServerResponse findProduct(Long id) {
        Product product = productMapper.selectById(id);
        ProductVo productVo = buildProductVo(product);
        return ServerResponse.success(productVo);
    }

    @Override
    public ServerResponse updateProduct(Product product) {
        productMapper.updateById(product);
        return ServerResponse.success();
    }

    @Override
    public ServerResponse updateProductStatus(Long id, int status) {
        Product product = new Product();
        product.setId(id);
        product.setStatus(status);
        productMapper.updateById(product);
        return ServerResponse.success();
    }

    private List<ProductVo> buildProductVoList(List<Product> productList) {
        List<ProductVo> productVoList = new ArrayList<>();
        for (Product product : productList) {
            ProductVo productVo = buildProductVo(product);
            productVoList.add(productVo);
        }
        return productVoList;
    }

    private ProductVo buildProductVo(Product product) {
        ProductVo productVo = new ProductVo();
        productVo.setId(product.getId());
        productVo.setProductName(product.getProductName());
        productVo.setPrice(product.getProductPrice());
        productVo.setCreateDate(DateUtil.date2str(product.getCreateDate(), DateUtil.Y_M_D));
        productVo.setStatus(product.getStatus());
        productVo.setBrandName(product.getBrand().getBrandName());
        productVo.setBrandId(product.getBrandId());
        return productVo;
    }


}
