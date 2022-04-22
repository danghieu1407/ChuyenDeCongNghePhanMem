package com.chuyendecnpm.demo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Database.Connect;
import com.chuyendecnpm.demo.Model.Cart;
import com.chuyendecnpm.demo.Model.Product;
import com.chuyendecnpm.demo.Model.User;
import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;

public class CartDAO {
    // add Cart
    public static boolean addCart(Cart cart) {
        boolean check = false;
        String sql = "INSERT INTO _cart(_email, _productID, _name, _category, _price, _amount, _image, _detail) VALUES(?,?,?,?,?,?,?,?)";
        try {
            Connection con = Connect.connectSQL();
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, cart.getEmail());
            stm.setString(2, cart.getProductID());
            stm.setString(3, cart.getName());
            stm.setString(4, cart.getCategory());
            stm.setInt(5, cart.getPrice());
            stm.setInt(6, cart.getAmount());
            stm.setString(7, cart.getImage());
            stm.setString(8, cart.getDetail());
            int rs = stm.executeUpdate();
            if (rs > 0) {
                check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    //get Cart
    public static List<Cart> getCart(String email) {
        List<Cart> list = new ArrayList<>();
        String sql = "SELECT * FROM _cart WHERE _email = ?";
        try {
            Connection con = Connect.connectSQL();
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setEmail(rs.getString("_email"));
                cart.setProductID(rs.getString("_productID"));
                cart.setName(rs.getString("_name"));
                cart.setCategory(rs.getString("_category"));
                cart.setPrice(rs.getInt("_price"));
                cart.setAmount(rs.getInt("_amount"));
                cart.setImage(rs.getString("_image"));
                cart.setDetail(rs.getString("_detail"));
                list.add(cart);
            }
            stm.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    //calulte total price with quantity
    public static int totalPrice(String email) {
        int total = 0;
        String sql = "SELECT SUM(_price * _amount) AS total FROM _cart WHERE _email = ?";
        try {
            Connection con = Connect.connectSQL();
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                total = rs.getInt("total");
            }
            stm.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }
   

    // delete Cart item by productID
    public static boolean deleteCart(String productID) {
        boolean check = false;
        String sql = "DELETE FROM _cart WHERE _productID = ?";
        try {
            Connection con = Connect.connectSQL();
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, productID);
            int rs = stm.executeUpdate();
            if (rs > 0) {
                check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    //find card by productID
    public static Cart findCart(String productID) {
        Cart cart = new Cart();
        String sql = "SELECT * FROM _cart WHERE _productID = ?";
        try {
            Connection con = Connect.connectSQL();
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, productID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                cart.setEmail(rs.getString("_email"));
                cart.setProductID(rs.getString("_productID"));
                cart.setName(rs.getString("_name"));
                cart.setCategory(rs.getString("_category"));
                cart.setPrice(rs.getInt("_price"));
                cart.setAmount(rs.getInt("_amount"));
                cart.setImage(rs.getString("_image"));
                cart.setDetail(rs.getString("_detail"));
            }
            stm.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cart;
    }

    //update quantity of cart item
    public static boolean updateCart(Cart cart) {
        boolean check = false;
        String sql = "UPDATE _cart SET _amount = ?";
        try {
            Connection con = Connect.connectSQL();
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, cart.getAmount());
            int rs = stm.executeUpdate();
            if (rs > 0) {
                check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

}
