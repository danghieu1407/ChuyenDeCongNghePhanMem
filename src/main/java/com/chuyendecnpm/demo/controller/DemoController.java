package com.chuyendecnpm.demo.controller;

import com.chuyendecnpm.demo.DAO.UserDAO;
import com.chuyendecnpm.demo.Model.User;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DemoController {

    private UserDAO dao = new UserDAO();

    @RequestMapping({ "/", "/index" })
    public String index() {
        return "index";
    }

    // Đã add một atrribute vào trang Login với biến User, Object User bằng rỗng để
    // khi nhập các ô input dẽ nhập thẳng vào user
    @RequestMapping(value = { "/login" }, method = { RequestMethod.GET })
    public String Login(Model model) {
        model.addAttribute("User", new User());
        return "login";
    }

    // Xử lí giùm phần check login và đăng kí :/ , tạo seesion cho user lúc đăng
    // nhập thành công
    @RequestMapping(value = { "/login" }, method = { RequestMethod.POST })
    public String CheckLogin(@RequestParam(name = "emaillogin") String emailvalue,
            @RequestParam(name = "passwordlogin") String passwordvalue) {

        if (!emailvalue.isEmpty() && !passwordvalue.isEmpty()) {
            User user = dao.getUserByEmail(emailvalue, passwordvalue);
          
            if (user.getEmail() != null) {
                System.out.println(user.toString());
                System.out.println("Lấy user thành công");
                // Tạo session chỗ này để lưu lại user đã đăng nhập
                return "redirect:/index";

            }
        }
        System.out.println("User không tồn tại");
        return "redirect:/login";
    }

    @RequestMapping(value = { "/register" }, method = { RequestMethod.POST })
    public String register(Model model, @ModelAttribute("User") User user) {
        try {
            dao.Add(user);
            System.out.println("Đăng ký thành công");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Đăng ký thất bại");

        }

        return "redirect:/login";
    }
}
