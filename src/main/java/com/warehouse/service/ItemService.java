package com.warehouse.service;

import com.warehouse.entity.Item;
import com.warehouse.entity.ItemDTO;

import java.util.List;

public interface ItemService {
    List<Item> getAllItem();


    List<Item> getItemByNameOrCategory(String keyword);

    int addItem(Item item);

    List<ItemDTO> outItem(List<ItemDTO> list);

    int updateItem(Item item);

    int deleteItem(int id);

    Item getItemById(int id);
}
