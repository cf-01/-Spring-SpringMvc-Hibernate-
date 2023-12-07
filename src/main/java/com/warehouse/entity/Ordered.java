package com.warehouse.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
//和数据库表对应
@Table(name = "ordered")
public class Ordered {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "itemId")
    private int itemId;

    @Column(name = "userId")
    private int userId;

    @Column(name = "outTime")
    private Date outTime;

    @Column(name = "nums")
    private int nums;

}
