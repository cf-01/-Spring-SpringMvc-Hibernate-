package com.warehouse.dao.impl;

import com.warehouse.dao.ItemDao;
import com.warehouse.entity.Item;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

@Repository
public class ItemDaoImpl implements ItemDao {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getOpenSession(){
        return  sessionFactory.openSession();
    }

    @Override
    public List<Item> getAllItem() {
        String hql=" from Item";
        Query query = getOpenSession().createQuery(hql);
        List<Item> list = query.list();
        return list;
    }

    @Override
    public List<Item> getItemByNameOrCategory(String keyword) {
        // 模糊查询
        String hql = "from Item where name like :keyword or category like :keyword";
        Query query = getOpenSession().createQuery(hql);
        query.setParameter("keyword", "%" + keyword + "%");
        List<Item> list = query.list();
        return list;
    }

    @Override
    public int addItem(Item item) {
        Session openSession = getOpenSession();
        //新增
        Serializable save = openSession.save(item);
        if(save!=null){
            closeTrancation(openSession);
            return 1;
        }else{
            closeTrancation(openSession);
            return -1;
        }
    }

    @Override
    public Item getItemById(Integer itemId) {
        String hql = "from Item where id = :itemId";
        Query query = getOpenSession().createQuery(hql);
        query.setParameter("itemId", itemId);
        Item item = (Item) query.uniqueResult();
        return item;
    }

    @Override
    public int updateItem(Item item) {
        Session openSession = getOpenSession();
        openSession.update(item);
        closeTrancation(openSession);
        return 1;
    }

    @Override
    public int deleteItem(int id) {
        Session openSession = getOpenSession();
        Item item=new Item();
        item.setId(id);
        openSession.delete(item);
        closeTrancation(openSession);
        return 1;
    }

    public void closeTrancation( Session openSession){
        openSession.beginTransaction().commit();
        openSession.close();
    }
}
