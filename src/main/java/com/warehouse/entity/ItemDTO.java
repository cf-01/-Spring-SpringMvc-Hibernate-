package com.warehouse.entity;

import lombok.Data;

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
