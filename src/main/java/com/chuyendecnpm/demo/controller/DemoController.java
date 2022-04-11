package com.chuyendecnpm.demo.controller;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import com.chuyendecnpm.demo.DAO.UserDAO;
import com.chuyendecnpm.demo.DAO.ProductDAO;
import com.chuyendecnpm.demo.Model.User;
import com.chuyendecnpm.demo.Model.Product;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.context.annotation.Configuration;

@Controller
public class DemoController {

    private UserDAO dao = new UserDAO();
    private ProductDAO dao1 = new ProductDAO();

    @RequestMapping({ "/", "/index" })
    public String index() {
        return "index";
    }

    // lấy dữ liệu của product để hiển thị lên trang chủ


    // Đã add một atrribute vào trang Login với biến User, Object User bằng rỗng để
    // khi nhập các ô input dẽ nhập thẳng vào user
    @RequestMapping(value = { "/login" }, method = { RequestMethod.GET })
    public String Login(Model model) {
        model.addAttribute("User", new User());
        return "login";
    }
    // Check đăng kí xử lí bằng đã xử lí bằng javaScript
    // Xử lí giùm phần check login và đăng kí :/ , tạo seesion cho user lúc đăng
    // nhập thành công

    @RequestMapping(value = { "/login" }, method = { RequestMethod.POST })
    public String CheckLogin(HttpSession session, @RequestParam(name = "emaillogin") String emailvalue,
            @RequestParam(name = "passwordlogin") String passwordvalue) {

        if (!emailvalue.isEmpty() && !passwordvalue.isEmpty()) {
            User user = dao.getUserByEmail(emailvalue, passwordvalue);
            String username = user.getName();
            if (user.getEmail() != null) {
                // Tạo session chỗ này để lưu lại user đã đăng nhập
                session.setAttribute("tendangnhap", username);

                return "redirect:/indexmain";

            }
        }
        System.out.println("User không tồn tại");
        return "redirect:/login?message=Error Email or Password";
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

    @RequestMapping(value = { "/indexmain" }, method = { RequestMethod.GET })
    public String indexmain(Model model) {
        List<Product> list = dao1.getAll();
        model.addAttribute("Listproduct", list);

        return "indexmain";
    }


    @RequestMapping(value = { "/logout" }, method = { RequestMethod.GET })
    public String backtologin(HttpSession session) {
        session.invalidate(); 
        return "redirect:/login";
    }
}
