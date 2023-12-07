package com.oyzk.controller;

import com.oyzk.entity.Person;
import com.oyzk.service.PersonService;
import com.oyzk.service.impl.PersonServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/person")
public class PersonController {


    @Autowired
    private PersonService personService;


    @PostMapping("/toLogin")
    @ResponseBody
    public Map<String, Object> login(Person person) {
        Person person1 = personService.getPersonOne(person);
        Map<String, Object> map = new HashMap<>();
        // 判断person的角色
        String role = person1.getRole();
        if (person1 != null) {
            map.put("msg", "登录成功");
            map.put("code", "200");
            map.put("role", role);
            map.put("personId", person1.getId());
        } else {
            map.put("msg", "登录失败");
            map.put("code", "500");
        }
        return map;
    }


    /**
     * 查詢所有数据
     * @param model
     * @return
     */
    @GetMapping("/findAll")
    public String findAll(Model model){
        List<Person> personAll = personService.getPersonAll();
        model.addAttribute("personList",personAll);
        return "homePage";
    }

    @GetMapping("/findById")
    public String findById(int id,Model model){
        Person person = personService.getPersonById(id);
        List<Person> personAll=new ArrayList<Person>();
        personAll.add(person);
        model.addAttribute("personList",personAll);
        return "homePage";
    }

    /**
     * 新增数据
     * @param person
     * @return
     */
    @RequestMapping("/savePerson")
    public ModelAndView savePerson(Person person){
        ModelAndView modelAndView=new ModelAndView();
        int i = personService.addPerson(person);
        if(i>0){
            modelAndView.addObject("flageMsg","新增成功");
        }else {
            modelAndView.addObject("flageMsg","新增失败");
        }
        modelAndView.setViewName("redirect:/person/findAll");
        return modelAndView;
    }

    /**
     * 跳转新增页面请求
     * @param
     * @return
     */
    @RequestMapping("/savePersonPage")
    public String savePersonPage(){
        return "addPerson";
    }

    @GetMapping("/deletePerson")
    public String deletePerson(int id,Model model){
        int i = personService.deletePerson(id);
        if(i>0){
            model.addAttribute("flageMsg","删除成功");
            return "homePage";
        }else {
            model.addAttribute("flageMsg","删除删除失败");
            return "homePage";
        }
    }

    /**
     * 修改数据
     * @param person
     * @return
     */
    @PostMapping("/updatePerson")
    public String updatePerson(Person person,Model model){
        int i = personService.updatePerson(person);
        if(i>0){
            model.addAttribute("flageMsg","修改成功");
        }else {
            model.addAttribute("flageMsg","修改失败");
        }
        return "redirect:/person/findAll";

    }

    /**
     * 修改跳转页面请求
     * @param id
     * @param model
     * @return
    toUpdatePerson*/
    @RequestMapping("/updatePersonPage")
    public String updatePersonPage(int id,Model model){
        Person person = personService.getPersonById(id);
        model.addAttribute("person",person);
        return "updatePerson";
    }
}
