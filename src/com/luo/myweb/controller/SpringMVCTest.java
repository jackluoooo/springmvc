package com.luo.myweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


//@RequestMapping("/springmvc")
//@SessionAttributes({"names"})
@Controller
public class SpringMVCTest {
    /**
     *
     *
     * @param servletRequest
     * @param servletResponse
     * eg:HttpSession;
     *    principle
     *    Local
     *    InputStream
     *    OutputStream
     *    Reader
     *    Writer
     * @return
     */
    @RequestMapping("/testServletAPI")
    public String testServletAPI(HttpServletRequest servletRequest, HttpServletResponse servletResponse) {
        System.out.print("servletRequest: " + servletRequest + "  " + "servletResponse: " + servletResponse);
        return "hello";
    }

    @RequestMapping("/testModelAndView")
    public ModelAndView testModelAndView(){
        ModelAndView modelAndView=new ModelAndView("hello");
        modelAndView.addObject("time",new Date());
        return modelAndView;
    }
    @RequestMapping("/testModelMap")
    public String tsetMap(Map<String,Object> map){
        /**
         * 入参可以页面传值
         */
//        User user=new User();
//        user.setName("ljx");
//        user.setAge(21);
//        map.put("user",user);
        map.put("names","jack ,jerry");
        return "hello";
    }

    /**
     * @Attribute
     */

    @RequestMapping("testView")
    public String testView(){
        return "helloView";
    }

    @RequestMapping("tsetRedirect")
    public String tsetRedirect(){
        return "redirect:hello.jsp";
    }



}
