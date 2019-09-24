package com.fh.shop.admin.param.product;

import com.fh.shop.admin.common.Page;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class ProductSearchParam extends Page {

    private String productName;

    private Integer minPrice;

    private Integer maxPrice;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date minCreateDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date maxCreateDate;

    private Long brandId;

    public Long getBrandId() {
        return brandId;
    }

    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Integer getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(Integer minPrice) {
        this.minPrice = minPrice;
    }

    public Integer getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(Integer maxPrice) {
        this.maxPrice = maxPrice;
    }

    public Date getMinCreateDate() {
        return minCreateDate;
    }

    public void setMinCreateDate(Date minCreateDate) {
        this.minCreateDate = minCreateDate;
    }

    public Date getMaxCreateDate() {
        return maxCreateDate;
    }

    public void setMaxCreateDate(Date maxCreateDate) {
        this.maxCreateDate = maxCreateDate;
    }
}
