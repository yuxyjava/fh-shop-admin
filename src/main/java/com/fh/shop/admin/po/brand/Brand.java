package com.fh.shop.admin.po.brand;

import java.io.Serializable;

public class Brand implements Serializable {

    private Long id;

    private String brandName;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }
}
