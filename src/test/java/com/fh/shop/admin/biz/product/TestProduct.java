package com.fh.shop.admin.biz.product;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fh.shop.admin.mapper.product.IProductMapper;
import com.fh.shop.admin.po.brand.Brand;
import com.fh.shop.admin.po.product.Product;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-common.xml"})
public class TestProduct extends AbstractJUnit4SpringContextTests {
    @Autowired
    private IProductMapper productMapper;

    @Test
    public void testAdd() {
        Product product = new Product();
        product.setProductName("测试44");
        product.setProductPrice(260);
        product.setCreateDate(new Date());
        product.setBrandId(1L);
        productMapper.insert(product);
    }

    @Test
    public void testDelete() {
        productMapper.deleteById(1);
    }

    @Test
    public void testBatchDelete() {
        List<Long> idList = new ArrayList<>();
        idList.add(2l);
        idList.add(3L);
        productMapper.deleteBatchIds(idList);
    }

    @Test
    public void testUpdate() {
        Product product = new Product();
        product.setId(4l);
        product.setProductName("aaa");
        productMapper.updateById(product);
    }

    @Test
    public void testUpdateInfo() {
        Product product = new Product();
        product.setProductName("ddd66");
        QueryWrapper<Product> updateWrapper = new QueryWrapper<>();
        updateWrapper.ge("price", 200);
        productMapper.update(product, updateWrapper);
    }

    @Test
    public void testList() {
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        queryWrapper.gt("price", 200);
        queryWrapper.like("productName", "6");
        queryWrapper.between("price", 200, 400);
        List<Product> productList = productMapper.selectList(queryWrapper);
        System.out.println(productList);
    }

    @Test
    public void testSelectOne(){
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        QueryWrapper<Product> productQueryWrapper = queryWrapper.eq("id", 6);
        Product product = productMapper.selectOne(productQueryWrapper);
        System.out.println(product);
    }


    @Test
    public void testPage() {
        Page<Product> productPage = new Page<>(3, 5);
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        queryWrapper.between("price", 20, 500);
        queryWrapper.le("price", 1000);
        IPage<Product> productIPage = productMapper.selectPage(productPage, queryWrapper);
        System.out.println(productIPage);
    }


}
