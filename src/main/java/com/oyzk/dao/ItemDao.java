package com.oyzk.dao;

import com.oyzk.entity.Item;

import java.util.List;

public interface ItemDao {
    List<Item> getAllItem();


    List<Item> getItemByNameOrCategory(String keyword);

    int addItem(Item item);

    Item getItemById(Integer itemId);

    int updateItem(Item item);

    int deleteItem(int id);

}
