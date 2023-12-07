package com.oyzk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ItemController {

    @Autowired
    private ItemService itemService;

    @GetMapping("/getAllItem")
    public String getAllItem(){
        return "item";
    }


}
