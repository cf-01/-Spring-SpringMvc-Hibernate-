package com.warehouse.controller;

import com.warehouse.entity.Item;
import com.warehouse.entity.ItemDTO;
import com.warehouse.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("item")
public class ItemController {

    @Autowired
    private ItemService itemService;

    /**
     * 查找所有的物品
     * @return map
     */
    @GetMapping("/getAllItem")
    public String getAllItem(Model model){
        List<Item> itemList  = itemService.getAllItem();
        model.addAttribute("itemList",itemList);
        return "itemList";
    }


    /**
     * 查找所有的物品
     * @return map
     */
    @GetMapping("/getAllItemForUser")
    public String getAllItemForUser(Model model){
        List<Item> itemList  = itemService.getAllItem();
        model.addAttribute("itemList",itemList);
        return "userItem";
    }


    /**
     * 根据关键词模糊查询物品
     * @param keyword keyword
     * @return map
     */
    @GetMapping("/getItemByNameOrCategory")
    public String getItemByNameOrCategory(String keyword, Model model){
        List<Item> itemList =  itemService.getItemByNameOrCategory(keyword);
        model.addAttribute("itemList",itemList);
        return "itemList";
    }


    @GetMapping("/getItemByNameOrCategoryForUser")
    public String getItemByNameOrCategoryForUser(String keyword, Model model){
        List<Item> itemList =  itemService.getItemByNameOrCategory(keyword);
        model.addAttribute("itemList",itemList);
        return "userItem";
    }


    @PostMapping("/updateItem")
    public String updateItem(Item item,Model model){
        int i = itemService.updateItem(item);
        if(i>0){
            model.addAttribute("flageMsg","修改成功");
        }else {
            model.addAttribute("flageMsg","修改失败");
        }
        return "redirect:/item/getAllItem";
    }

    @GetMapping("/deleteItem")
    public String deleteItem(int id,Model model){
        int i = itemService.deleteItem(id);
        if(i>0){
            model.addAttribute("flageMsg","删除成功");
            return "itemList";
        }else {
            model.addAttribute("flageMsg","删除失败");
            return "itemList";
        }
    }



    /**
     * 添加物品
     * @param item item
     * @return
     */
    @RequestMapping("/addItem")
    public ModelAndView saveUser(Item item) {
        ModelAndView modelAndView = new ModelAndView();
        int i = itemService.addItem(item);
        if (i > 0) {
            modelAndView.addObject("flageMsg", "新增成功");
        } else {
            modelAndView.addObject("flageMsg", "新增失败");
        }
        //重新去请求数据
        modelAndView.setViewName("redirect:/toItemList");
        return modelAndView;
    }



    /**
     * 出库物品
     */
    @PostMapping("/outItem")
    @ResponseBody
    public Map<String, Object> outItem(@RequestBody Map<String, List<ItemDTO>> request) {
        List<ItemDTO> itemDTOS = request.get("itemDTOS");
        Map<String, Object> map = new HashMap<>();
        List<ItemDTO> itemList = itemService.outItem(itemDTOS);
        if (itemList == null) {
            map.put("code", "500");
            map.put("msg", "出库失败，物品数量不足");
            return map;
        }
        if (!itemList.isEmpty()) {
            map.put("code", "200");
            map.put("msg", "出库成功");
            map.put("itemList", itemList);
        } else {
            map.put("code", "500");
            map.put("msg", "出库失败");
        }
        return map;
    }


    /**
     * 修改跳转页面请求
     * @param id
     * @param model
     * @return
    toUpdatePerson*/
    @GetMapping("/updateItemPage")
    public String updateItemPage(int id,Model model){
        Item item = itemService.getItemById(id);
        model.addAttribute("item",item);
        return "updateItem";
    }

}
