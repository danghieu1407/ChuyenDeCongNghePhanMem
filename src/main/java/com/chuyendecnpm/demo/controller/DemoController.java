package com.chuyendecnpm.demo.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import com.chuyendecnpm.demo.DAO.UserDAO;
import com.chuyendecnpm.demo.DAO.CartDAO;
import com.chuyendecnpm.demo.DAO.ProductDAO;
import com.chuyendecnpm.demo.Model.User;
import com.chuyendecnpm.demo.Model.Cart;
import com.chuyendecnpm.demo.Model.Product;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.context.annotation.Configuration;

@Controller
public class DemoController {

    private UserDAO dao = new UserDAO();
    private ProductDAO dao1 = new ProductDAO();
    private CartDAO dao2 = new CartDAO();

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
                //set role cho user 
                session.setAttribute("role", user.getRole());
                System.out.print(user.getRole());
                return "redirect:/indexmain";

            }
        }
        System.out.println("User không tồn tại");
        return "redirect:/login?message=Error Email or Password";
    }

    @RequestMapping(value = { "/register" }, method = { RequestMethod.POST })
    public String register(Model model, @ModelAttribute("User") User user) {
        try {
            System.out.println(user);
            dao.Add(user);
            System.out.println("Đăng ký thành công");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Đăng ký thất bại");

        }

        return "redirect:/login?message=Register Success";
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

    
    @RequestMapping(value = { "/productDetail" }, method = { RequestMethod.POST })
    public String productDetail(Model model, @RequestParam(name = "id") String id ,@RequestParam(name = "category") String category) {
        System.out.println(dao1.findProductById("CCB").getName());
        Product product = dao1.findProductById(id);
        model.addAttribute("ProductDetail", product);
        System.out.println(product.getName());

        List<Product> list = dao1.getProductByCategory4ProductDetail(category);
         model.addAttribute("productrelative", list);
         System.out.print(list);
        return "productDetail";
    }

  

      @RequestMapping(value = { "/managementProduct" }, method = { RequestMethod.GET })
    public String managementProduct(Model model) {
        List<Product> list = dao1.getAll();
        model.addAttribute("Listproduct", list);

        

        return "managementProduct";
    }

    //Delete Product
    @RequestMapping(value = { "/deleteProduct" }, method = { RequestMethod.POST })
    public String deleteProduct(Model model, @RequestParam(name = "id") String id) {
        dao1.DeletebyID(id);
        return "redirect:/managementProduct?message=Delete Success";
    }

    //Add Product
    @RequestMapping(value = { "/addProduct" }, method = { RequestMethod.POST })
    public String addProduct(Model model) {
        model.addAttribute("Product", new Product());
        return "addProduct";
    }

    //add Product
    private static String UPLOAD_FOLDER = "D:/DoAnChuyenDeCongNghePhanMem/DoAn/ChuyenDeCongNghePhanMem/src/main/resources/static/images/";


    @RequestMapping(value = { "/upload" }, method = { RequestMethod.GET })
    public String upload(Model model ) {
        model.addAttribute("Product", new Product());
        return "addProduct";
    }

	@RequestMapping(value = { "/upload" }, method = { RequestMethod.POST })
	public String fileUpload(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes,Model model) {
        String fileName = file.getOriginalFilename();
       
       
		if (file.isEmpty()) {
			return "redirect:/addProduct?message=File was empty or not found "; 
		}
        //check size
        if (file.getSize() > 1000000) {
            return "redirect:/addProduct?message=File was empty or not found ";
        }

		try {
			// read and write the file to the slelected location-
			byte[] bytes = file.getBytes();
			Path path = Paths.get(UPLOAD_FOLDER + file.getOriginalFilename());
			Files.write(path, bytes);
            

		} catch (IOException e) {
			
            return "redirect:/addProduct?message=File too large "; 


		}
        
		return "redirect:/addProduct?message=Success&imagename="+fileName;
	}

    @RequestMapping(value = { "/addProduct" }, method = { RequestMethod.GET })
    public String addProduct(Model model, @RequestParam(name = "message") String message) {
        model.addAttribute("Product", new Product());
        model.addAttribute("message", message);
        return "addProduct";
    }

    @RequestMapping(value = { "/addProductProcess" }, method = { RequestMethod.POST })
    public String addProduct(Model model, @ModelAttribute("Product") Product product ,@PathParam("message") String message) {
        try {
            dao1.addProduct(product);
            System.out.println(product);
            System.out.println("Thêm thành công");
             model.addAttribute("message", message);
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Thêm thất bại");

        }

        return "redirect:/managementProduct?message=Add Success";
    }

  //UPDATE Product


    //update Product
    @RequestMapping(value = { "/editProduct" }, method = { RequestMethod.POST })
    public String updateProduct(Model model) {
   
        return "editProduct";
    }
    @RequestMapping(value = { "/editProduct" }, method = { RequestMethod.GET })
    public String updateProduct1(Model model) {
   
        return "editProduct";
    }
 
    @RequestMapping(value = { "/editProductProcess" }, method = { RequestMethod.POST })
    public String updateProduct(Model model, @RequestParam(name = "id") String id, @ModelAttribute("Product1") Product product) {
        try {
            
            dao1.findProductById(id);
            dao1.updateProduct(product);
            System.out.println(dao1.updateProduct(product));
            System.out.println("Update thành công");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Update thất bại");

        }

        return "redirect:/managementProduct";
    }
 

    //select Product by category
    @RequestMapping(value = { "/category"}, method = { RequestMethod.GET })
    public String selectProduct(Model model, @RequestParam(name = "category") String category) {
        List<Product> list = dao1.getProductByCategory(category);
        model.addAttribute("Listproduct", list);
        System.out.println(list); 
        return "category";
    }

    //cart
    @RequestMapping(value = { "/cart" }, method = { RequestMethod.GET })
    public String cart(Model model ,@RequestParam(name = "name") String name){
       
        List<Cart> getCart = dao2.getCart(name);
        model.addAttribute("Listcart", getCart);
        //print list cart get name
        int a = dao2.totalPrice(name);
        model.addAttribute("totalprice", a);
        System.out.println(getCart);
        

        
        return "cart";
    }

    // add to cart
    @RequestMapping(value = { "/addToCart" }, method = { RequestMethod.POST })
    public String addToCart(Model model, @RequestParam(name = "id") String id,@RequestParam(name = "name") String name ,@RequestParam(name = "email") String email ,@ModelAttribute("Cart") Cart cart,HttpSession session) {
      
        //insert to cart
        try {
            dao2.addCart(cart);
            //update quantity product
        
            System.out.println("Thêm thành công");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Thêm thất bại");

        }
        
        
        return "redirect:/indexmain?message=Add to cart success&name="+email ;
    }

    // delete item by productID
    @RequestMapping(value = { "/deleteCart" }, method = { RequestMethod.POST })
    public String deleteCart(Model model, @RequestParam(name = "productID") String id,@RequestParam(name = "name") String name) {
        try {
            dao2.deleteCart(id);
            System.out.println("Xóa thành công");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Xóa thất bại");

        }

        return "redirect:/cart?message=Delete Success&name="+name;
    }
    

    //update quantity cart

    @RequestMapping(value = { "/updateCart" }, method = { RequestMethod.POST })
    public String updateCart(Model model, @RequestParam(name = "productID") String id,@ModelAttribute("quantity") Cart cart ,@RequestParam(name = "name") String name) {
        try {
            dao2.findCart(id);
            dao2.updateCart(cart);
            System.out.println("Update thành công");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Update thất bại");
            return "redirect:/cart?message=Update fail&name="+name;

        }

        return "redirect:/cart?message=Update Success&name="+name;
    }
    
    @RequestMapping(value = { "/uploadFromEdit" }, method = { RequestMethod.POST })
	public String fileUploadEditCart(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes,Model model, @RequestParam("productid") String productid) {
        String fileName = file.getOriginalFilename();
       
       
		if (file.isEmpty()) {
			return "redirect:/editProduct?message=File was empty or not found "; 
		}

		try {
			// read and write the file to the slelected location-
			byte[] bytes = file.getBytes();
			Path path = Paths.get(UPLOAD_FOLDER + file.getOriginalFilename());
			Files.write(path, bytes);
            

		} catch (IOException e) {
			e.printStackTrace();
            
            return "redirect:/editProduct?message=LargeImage";
		}

		return "redirect:/editProduct?message=SuccesUploadImage&imagenameforedit="+fileName+"&productid="+productid;
	}

    //search product
    @RequestMapping(value = { "/searchProduct" }, method = { RequestMethod.POST })
    public String searchProduct(Model model, @RequestParam(name = "search") String search) {
        List<Product> list = dao1.searchProduct(search);
        model.addAttribute("Listproduct", list);
        System.out.println(list); 
        return "searchProduct";
    }

    @RequestMapping(value = { "/searchProduct" }, method = { RequestMethod.GET })
        public String searchProductget(Model model) {
            
            return "searchProduct";
        
    }

    //management account 
    @RequestMapping(value = { "/managementAccount" }, method = { RequestMethod.GET })
    public String managementAccount(Model model) {
        List<User> list = dao.getAll();
        model.addAttribute("Listaccount", list);
        System.out.println(list); 
        return "managementAccount";
    }

    //delete account by email
    @RequestMapping(value = { "/deleteAccount" }, method = { RequestMethod.POST })
    public String deleteAccount(Model model, @RequestParam(name = "email") String email) {
        try {
            dao.deleteAccount(email);
            System.out.println("Xóa thành công");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Xóa thất bại");

        }

        return "redirect:/managementAccount?message=Delete Success";
    }

    //update role to admin
    @RequestMapping(value = { "/updateRoleToAdmin" }, method = { RequestMethod.POST })
    public String updateRole(Model model, @RequestParam(name = "email") String email) {
        try {
            dao.updateAccountToAdmin(email);
            System.out.println("Update thành công");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Update thất bại");
            return "redirect:/managementAccount?message=Update fail";

        }

        return "redirect:/managementAccount?message=Update Success";
    }


    //update role to staff
    @RequestMapping(value = { "/updateRoleToStaff" }, method = { RequestMethod.POST })
    public String updateRoleToStaff(Model model, @RequestParam(name = "email") String email) {
        try {
            dao.updateAccountToStaff(email);
            System.out.println("Update thành công");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Update thất bại");
            return "redirect:/managementAccount?message=Update fail";

        }

        return "redirect:/managementAccount?message=Update Success";
    }

    //update role to user
    @RequestMapping(value = { "/updateRoleToUser" }, method = { RequestMethod.POST })
    public String updateRoleToUser(Model model, @RequestParam(name = "email") String email) {
        try {
            dao.updateAccountToUser(email);
            System.out.println("Update thành công");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Update thất bại");
            return "redirect:/managementAccount?message=Update fail";

        }

        return "redirect:/managementAccount?message=Update Success";
    }
   

    //add account method POST
    @RequestMapping(value = { "/addAccount" }, method = { RequestMethod.POST })
    public String addAccountget(Model model) {
        return "addAccount";
    }
    

    //add accountProcess
    @RequestMapping(value = { "/addAccountProcess" }, method = { RequestMethod.POST })
    public String addAccountProcess(Model model, @ModelAttribute("Account") User user) {
        try {
            dao.addAccount(user);
            System.out.println("Thêm thành công");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Thêm thất bại");
            return "redirect:/managementAccount?message=Add Account Fail";

        }

        return "redirect:/managementAccount?message=Add Account Success";
    }
    


   

}
