package com.luo.myweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class HelloController {

    @RequestMapping("/testCookieValue")
    public String testCookieValue(@CookieValue("JSESSIONID") String JSESSIONID) {
        System.out.println("JSESSIONID: " + JSESSIONID);
        return "hello";
    }

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String printWelcome(@RequestParam(value = "i", required = false, defaultValue = "0") int i, @RequestHeader(value = "Accept-Language") String al) {
        // model.addAttribute("message","hello word");
        System.out.print(al);
        System.out.println(i);
        return "hello";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id) {
        // model.addAttribute("message","hello word");
        System.out.println(id);
        return "hello";
    }
}
