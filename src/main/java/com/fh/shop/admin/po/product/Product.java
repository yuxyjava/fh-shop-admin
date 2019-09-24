package com.fh.shop.admin.po.product;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fh.shop.admin.po.brand.Brand;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Product implements Serializable {

    private Long id;

    private String productName;

    @TableField(value = "price")
    private Integer productPrice;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createDate;

    private int status;

    private Long brandId;

    @TableField(exist = false)
    private Brand brand = new Brand();

    public Long getBrandId() {
        return brandId;
    }

    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Integer getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Integer productPrice) {
        this.productPrice = productPrice;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
