package com.warehouse.dao.impl;

import com.warehouse.dao.OrderedDao;
import com.warehouse.entity.ItemDTO;
import com.warehouse.entity.Ordered;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.Date;

@Repository
public class OrderedDaoImpl implements OrderedDao {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getOpenSession(){
        return  sessionFactory.openSession();
    }
    @Override
    public int addOrdered(ItemDTO itemDTO) {
        // 添加订单
        Session openSession = getOpenSession();
        // itemDTO 转成 ordered
        Ordered ordered = new Ordered();
        ordered.setUserId(itemDTO.getUserId());
        ordered.setItemId(itemDTO.getItemId());
        ordered.setNums(itemDTO.getNums());
        ordered.setOutTime(new Date());
        Serializable save = openSession.save(ordered);
        if(save!=null){
            closeTrancation(openSession);
            return 1;
        }else{
            closeTrancation(openSession);
            return -1;
        }
    }

    public void closeTrancation( Session openSession){
        openSession.beginTransaction().commit();
        openSession.close();
    }
}
