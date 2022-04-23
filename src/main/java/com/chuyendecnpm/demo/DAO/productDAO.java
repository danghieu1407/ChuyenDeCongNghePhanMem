package com.chuyendecnpm.demo.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.html.HTMLDocument.HTMLReader.TagAction;

import com.Database.Connect;
import com.chuyendecnpm.demo.Model.Cart;
import com.chuyendecnpm.demo.Model.Product;

import org.apache.catalina.Session;

public class ProductDAO{
    public List<Product> getAll(){
        List<Product> list = new ArrayList<>();
        String sql = " Select * from _Product";
        try {
            Connection con = Connect.connectSQL();
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();

                product.setProductID(rs.getString("_productID"));
                product.setName(rs.getString("_name"));
                product.setCategory(rs.getString("_category"));
                product.setPrice(rs.getInt("_price"));
                product.setAmount(rs.getInt("_amount"));
                product.setImage(rs.getString("_image"));
                product.setDetail(rs.getString("_detail"));
                list.add(product);
            }
            con.close();
            stm.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

 
    public Product findProductById(String _productId) {

        List<Product> list = new ArrayList<>();
        Product product = new Product();

        String sql = " Select * from _Product WHERE _productID = '"+ _productId +"'";
        try {
            Connection con = Connect.connectSQL();
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {

                product.setProductID(rs.getString("_productID"));
                product.setName(rs.getString("_name"));
                product.setCategory(rs.getString("_category"));
                product.setPrice(rs.getInt("_price"));
                product.setAmount(rs.getInt("_amount"));
                product.setImage(rs.getString("_image"));
                product.setDetail(rs.getString("_detail"));
              
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return product;
    }

    public Product DeletebyID(String _productId) {
        List<Product> list = new ArrayList<>();
        Product product = new Product();

        String sql = " DELETE FROM _Product WHERE _productID = '"+ _productId +"'";
        try {
            Connection con = Connect.connectSQL();
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {

                product.setProductID(rs.getString("_productID"));
                product.setName(rs.getString("_name"));
                product.setCategory(rs.getString("_category"));
                product.setPrice(rs.getInt( "_price"));
                product.setAmount(rs.getInt("_amount"));
                product.setImage(rs.getString("_image"));
                product.setDetail(rs.getString("_detail"));
              
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return product;
    }

    //add Product
    public boolean addProduct(Product product) {
        boolean check = false;
        String sql = "INSERT INTO _Product(_productID,_name,_category,_price,_amount,_image,_detail) VALUES(?,?,?,?,?,?,?)";
        try {
            Connection con = Connect.connectSQL();
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, product.getProductID().toString());
            stm.setString(2, product.getName());
            stm.setString(3, product.getCategory());
            stm.setInt(4, product.getPrice());
            stm.setInt(5, product.getAmount());
            stm.setString(6, product.getImage());
            stm.setString(7, product.getDetail());
            stm.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    //update Product
    public Product updateProduct(Product product) {
        
        String sql = "UPDATE _Product SET  _name = ?,_category = ?,_price = ?,_amount = ?,_image = ?,_detail = ? WHERE _productID = ?";
        try {
            Connection con = Connect.connectSQL();
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, product.getName());
            stm.setString(2, product.getCategory());
            stm.setInt(3, product.getPrice());
            stm.setInt(4, product.getAmount());
            stm.setString(5, product.getImage());
            stm.setString(6, product.getDetail());
            stm.setString(7, product.getProductID());
            stm.executeUpdate();
          
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    //Select product where category = ?
    public List<Product> getProductByCategory(String category) {
        List<Product> list = new ArrayList<>();
        String sql = " Select * from _Product WHERE _category = '"+ category +"'";
        try {
            Connection con = Connect.connectSQL();
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();

                product.setProductID(rs.getString("_productID"));
                product.setName(rs.getString("_name"));
                product.setCategory(rs.getString("_category"));
                product.setPrice(rs.getInt("_price"));
                product.setAmount(rs.getInt("_amount"));
                product.setImage(rs.getString("_image"));
                product.setDetail(rs.getString("_detail"));
                list.add(product);
            }
            con.close();
            stm.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public List<Cart> getCart(String email) {
        return null;
    }



}
