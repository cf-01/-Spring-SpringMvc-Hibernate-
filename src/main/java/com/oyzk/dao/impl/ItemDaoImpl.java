package com.oyzk.dao.impl;

import com.oyzk.dao.ItemDao;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDaoImpl  implements ItemDao {

    @Autowired
    private SessionFactory sessionFactory;


}
