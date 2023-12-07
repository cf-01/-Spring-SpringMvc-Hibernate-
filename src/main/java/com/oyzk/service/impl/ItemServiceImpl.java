package com.oyzk.service.impl;

import com.oyzk.dao.PersonDao;
import com.oyzk.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    private ItemDao itemDao;
}
