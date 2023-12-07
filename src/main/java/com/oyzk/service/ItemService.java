package com.oyzk.service;

import com.oyzk.entity.Item;
import com.oyzk.entity.ItemDTO;

import java.util.List;
import java.util.Map;

public interface ItemService {
    List<Item> getAllItem();


    List<Item> getItemByNameOrCategory(String keyword);

    int addItem(Item item);

    List<ItemDTO> outItem(List<ItemDTO> list);

    int updateItem(Item item);

    int deleteItem(int id);

    Item getItemById(int id);
}
