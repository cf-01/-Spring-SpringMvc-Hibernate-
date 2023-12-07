package com.warehouse.dao;

import com.warehouse.entity.Person;

import java.util.List;


public interface PersonDao {
    /**
     * 查询全部的数据
     * @return
     */
    List<Person> getPersonAll();

    /**
     * 通过名字进行查询
     * @param id
     * @return
     */
    Person getPersonById(int id);

    /**
     * 新增数据
     * @param person
     * @return
     */
    int addPerson(Person person);

    /**
     * 修改
     * @param person
     * @return
     */
    int updatePerson(Person person);

    /**
     * 删除
     * @param id
     * @return
     */
    int deletePerson(int id);

    Person getPersonOne(Person person);

}
