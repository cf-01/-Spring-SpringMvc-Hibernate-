package com.oyzk.dao.impl;

import com.oyzk.dao.PersonDao;
import com.oyzk.entity.Person;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

/**
 * @author Kingkang
 * @title PersonDaoImpl
 * @create 2022/11/28
 **/
@Repository
public class PersonDaoImpl implements PersonDao {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getOpenSession(){
        return  sessionFactory.openSession();
    }

    /**
     * 查询全部数据
     * @return
     */
    public List<Person> getPersonAll() {
        String hql=" from Person";
        Query query = getOpenSession().createQuery(hql);
        List<Person> list = query.list();
        return list;
    }

    /**
     * 通过id去查询数据
     * @param id
     * @return
     */
    public Person getPersonById(int id) {
        //Person person = getOpenSession().get(Person.class, id);
        return getOpenSession().get(Person.class, id);
    }

    public int addPerson(Person person) {
       /* person.setUsername("张三");
        person.setAddress("上海");
        person.setPhone("111");
        Serializable save = getOpenSession().save(person);*/
        Session openSession = getOpenSession();
        //新增
        Serializable save = openSession.save(person);
        if(save!=null){
            closeTrancation(openSession);
            return 1;
        }else{
            closeTrancation(openSession);
            return -1;
        }
    }

    public int updatePerson(Person person) {
        Session openSession = getOpenSession();
        openSession.update(person);
        closeTrancation(openSession);
        return 1;
    }

    public int deletePerson(int id) {
        Session openSession = getOpenSession();
        Person person=new Person();
        person.setId(id);
        openSession.delete(person);
        closeTrancation(openSession);
        return 1;
    }

    @Override
    public Person getPersonOne(Person person) {
        String hql="from Person where username=?1 and password=?2";
        Query query = getOpenSession().createQuery(hql);
        query.setParameter(1,person.getUsername());
        query.setParameter(2,person.getPassword());
        List<Person> list = query.list();
        if(!list.isEmpty()){
            return list.get(0);
        }else {
            return null;
        }
    }

    public void closeTrancation( Session openSession){
        openSession.beginTransaction().commit();
        openSession.close();
    }
}
