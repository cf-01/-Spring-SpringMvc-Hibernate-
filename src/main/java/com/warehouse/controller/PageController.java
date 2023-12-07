package com.warehouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {


    @RequestMapping("toHomePage")
    public String toIndex(){
        return "homePage";
    }

    @RequestMapping("toItemList")
    public String toItemList(){
        return "itemList";
    }

    @RequestMapping("addItem")
    public String addItem(){
        return "addItem";
    }

    @RequestMapping("toUserItem")
    public String toUserItem(){
        return "userItem";
    }
}
