package com.chuyendecnpm.demo.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.html.HTMLDocument.HTMLReader.TagAction;

import com.Database.Connect;


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
}
