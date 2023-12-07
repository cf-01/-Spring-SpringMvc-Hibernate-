package com.warehouse.dao;

import com.warehouse.entity.ItemDTO;

public interface OrderedDao {
    int addOrdered(ItemDTO itemDTO);
}
