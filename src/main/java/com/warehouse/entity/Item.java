package com.warehouse.entity;


import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;

@Data
@Entity
//和数据库表对应
@Table(name = "item")
public class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "image")
    private String image;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "price")
    private BigDecimal price;

    @Column(name = "category")
    private String category;
}
