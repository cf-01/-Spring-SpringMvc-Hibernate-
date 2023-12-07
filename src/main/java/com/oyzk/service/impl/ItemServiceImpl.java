package com.oyzk.service.impl;

import com.oyzk.dao.ItemDao;
import com.oyzk.dao.OrderedDao;
import com.oyzk.entity.Item;
import com.oyzk.entity.ItemDTO;
import com.oyzk.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.beans.Transient;
import java.util.List;
import java.util.Map;

@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    private ItemDao itemDao;

    @Autowired
    private OrderedDao orderedDao;

    @Override
    public List<Item> getAllItem() {
        return itemDao.getAllItem();
    }

    @Override
    public List<Item> getItemByNameOrCategory(String keyword) {
        return itemDao.getItemByNameOrCategory(keyword);
    }

    @Override
    public int addItem(Item item) {
        return itemDao.addItem(item);
    }

    @Override
    @Transient
    public List<ItemDTO> outItem(List<ItemDTO> list) {
        System.err.println("list = " + list);
        // 遍历list
        for (ItemDTO itemDTO : list) {
            // 通过id查询物品
            Item item = itemDao.getItemById(itemDTO.getItemId());
            // 判断物品数量是否足够
            if (item.getQuantity() < itemDTO.getNums()) {
                return null;
            }
            itemDTO.setItemName(item.getName());
            itemDTO.setImage(item.getImage());
            itemDTO.setPrice(item.getPrice().intValue());
            // 减少物品数量
            item.setQuantity(item.getQuantity() - itemDTO.getNums());
            // 更新物品数量
            itemDao.updateItem(item);
            // 添加订单
            orderedDao.addOrdered(itemDTO);
        }
        return list;
    }

    @Override
    public int updateItem(Item item) {
        return itemDao.updateItem(item);
    }

    @Override
    public int deleteItem(int id) {
        return itemDao.deleteItem(id);
    }

    @Override
    public Item getItemById(int id) {
        return itemDao.getItemById(id);
    }
}
