package com.oyzk.entity;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class ItemDTO {
    /**
     * 商品id
     */
    private Integer itemId;
    /**
     * 商品数量
     */
    private Integer nums;
    /**
     * 商品名称
     */
    private String itemName;
    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 商品图片
     */
    private String image;

    private Integer price;

}
