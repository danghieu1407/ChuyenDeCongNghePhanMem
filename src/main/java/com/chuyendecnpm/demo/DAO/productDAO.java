package com.chuyendecnpm.demo.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.Database.Connect;

import com.chuyendecnpm.demo.Model.product;

public class productDAO {
    public List<product> getAll(){
        List<product> list = new ArrayList<>();
        String sql = " Select * from _Product";
        try {
            Connection con = Connect.connectSQL();
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                product product = new product();

                product.setProductID(rs.getString("_ProductID"));
                product.setName(rs.getString("_Name"));
                product.setCategory(rs.getString("_Category"));
                product.setPrice(rs.getString("_Price"));
                product.setAmount(rs.getString("_Amount"));
                product.setStatus(rs.getString("_Status"));
                product.setImage(rs.getString("_Image"));

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
}
