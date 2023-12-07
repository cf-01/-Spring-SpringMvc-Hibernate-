package com.oyzk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {


    @RequestMapping("toHomePage")
    public String toIndex(){
        return "homePage";
    }
}
