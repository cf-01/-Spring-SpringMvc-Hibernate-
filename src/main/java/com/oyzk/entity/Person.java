package com.oyzk.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

/**
 * @author Kingkang
 * @title Person
 * @create 2022/11/28
 **/
@Data
@Entity
//和数据库表对应
@Table(name="Person")
public class Person {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="username")
    private String username;

    @Column(name="address")
    private String address;

    @Column(name="sex")
    private String sex;

    @Column(name="role")
    private String role;

    @Column(name = "phone")
    private String phone;

    @Column(name = "password")
    private String password;


}
