package com.oyzk.controller;

import com.oyzk.entity.Person;
import com.oyzk.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Kingkang
 * @title UserController
 * @create 2022/11/29
 **/
@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    private PersonService personService;

    /*@PostMapping("/toLogin")
    public ModelAndView login(Person person){
        Person person1 = personService.getPersonOne(person);
        ModelAndView modelAndView = new ModelAndView();
        if(person1!=null){
            modelAndView.addObject("person",person1);
            modelAndView.addObject("msg","登录成功");
            modelAndView.addObject("code","200");
            modelAndView.setViewName("homePage");
            return modelAndView;
        }else {
            modelAndView.addObject("msg","用户名或密码错误");
            modelAndView.addObject("code","500");
            modelAndView.setViewName("index");
            return modelAndView;
        }
    }*/



    @PostMapping("/toLogin")
    @ResponseBody
    public Map<String,String> login(Person person){
        Person person1 = personService.getPersonOne(person);
        Map<String,String> map= new HashMap<String,String>();
        if(person1!=null){
            map.put("msg","登录成功");
            map.put("code","200");
        }else {
            map.put("msg","登录失败");
            map.put("code","500");
        }
        return map;
    }

    @GetMapping("/userList")
    public String findAll(Model model){
        List<Person> personAll = personService.getPersonAll();
        model.addAttribute("userList",personAll);
        return "userList";
    }

    /**
     * 跳转修改页面请求
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/updateUserByIdPage")
    public String updateUserByIdPage(int id,Model model){
        Person person = personService.getPersonById(id);
        model.addAttribute("user",person);
        return "updateUser";
    }
    /**
     * 修改数据
     * @param person
     * @return
     */
    @PostMapping("/updateUser")
    public String updateUser(Person person,Model model){
        int i = personService.updatePerson(person);
        if(i>0){
            model.addAttribute("flageMsg","修改成功");
        }else {
            model.addAttribute("flageMsg","修改失败");
        }
        return "redirect:/user/userList";

    }

    /**
     * 删除
     * @param id
     * @param model
     * @return
     */
    @GetMapping("/deleteUser")
    public String deleteUser(int id,Model model){
        int i = personService.deletePerson(id);
        if(i>0){
            model.addAttribute("flageMsg","删除成功");
            return "redirect:/user/userList";
        }else {
            model.addAttribute("flageMsg","删除删除失败");
            return "redirect:/user/userList";
        }
    }

    /**
     * 新增数据
     * @param person
     * @return
     */
    @RequestMapping("/saveUser")
    public ModelAndView saveUser(Person person){
        ModelAndView modelAndView=new ModelAndView();
        int i = personService.addPerson(person);
        if(i>0){
            modelAndView.addObject("flageMsg","新增成功");
        }else {
            modelAndView.addObject("flageMsg","新增失败");
        }
        //重新去请求数据
        modelAndView.setViewName("redirect:/user/userList");
        return modelAndView;
    }

    @RequestMapping("/addUserPage")
    public String addUserPage(){
        return "addUser";
    }

}
