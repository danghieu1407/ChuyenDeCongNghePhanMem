package com.chuyendecnpm.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DemoController {

    @RequestMapping({ "/", "/index" })
    public String index() {
        return "index";
    }

    @RequestMapping({"/login" })
    public String login() {
        return "login";
    }
    
    @RequestMapping({"/product" })
    public String productDetail() {
        return "productDetail";
    }
}
