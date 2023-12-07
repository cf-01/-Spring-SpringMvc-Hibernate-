package com.warehouse.service.impl;

import com.warehouse.dao.PersonDao;
import com.warehouse.entity.Person;
import com.warehouse.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;


@Service
public class PersonServiceImpl implements PersonService {

    @Autowired
    private PersonDao personDao;

    public List<Person> getPersonAll() {
        return personDao.getPersonAll();
    }

    public Person getPersonById(int id) {
        return personDao.getPersonById(id);
    }

    public int addPerson(Person person) {
        if(StringUtils.isEmpty(person)){
            return -1;
        }
        return personDao.addPerson(person);
    }

    public int updatePerson(Person person) {
        return personDao.updatePerson(person);
    }

    public int deletePerson(int id) {
        return personDao.deletePerson(id);
    }

    @Override
    public Person getPersonOne(Person person) {
        return personDao.getPersonOne(person);
    }
}
