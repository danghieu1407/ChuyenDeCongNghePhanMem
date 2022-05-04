package com.chuyendecnpm.demo.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Database.Connect;
import com.chuyendecnpm.demo.Model.Receipt;

public class ReceiptDAO {
    //insert into receipt(_email,_productID,_name,_category,_price,_amount,_image,_detail,_phone,_date) values (?,?,?,?,?,?,?,?,?,?)

    public void Add(Receipt receipt) throws Exception {
        String sql = "insert into _Receipt(_email,_productID,_name,_category,_price,_amount,_image,_detail,_phone,_address) values (?,?,?,?,?,?,?,?,?,?)";
        try (
                Connection con = Connect.connectSQL();
                PreparedStatement stm = con.prepareStatement(sql);) {
            stm.setString(1, receipt.getEmail());
            stm.setString(2, receipt.getProductID());
            stm.setString(3, receipt.getName());
            stm.setString(4, receipt.getCategory());
            stm.setInt(5, receipt.getPrice());
            stm.setInt(6, receipt.getAmount());
            stm.setString(7, receipt.getImage());
            stm.setString(8, receipt.getDetail());
            stm.setString(9, receipt.getPhone());
            stm.setString(10, receipt.getAddress());
    
            stm.executeUpdate();
            stm.close();
        }
    }

    //get all receipt
    public List<Receipt> getAllReceipt() throws Exception {
        List<Receipt> list = new ArrayList<>();
        String sql = "SELECT * FROM _Receipt";
        try (
                Connection con = Connect.connectSQL();
                PreparedStatement stm = con.prepareStatement(sql);
                ResultSet rs = stm.executeQuery();) {
            while (rs.next()) {
                Receipt receipt = new Receipt();
                receipt.setEmail(rs.getString("_email"));
                receipt.setProductID(rs.getString("_productID"));
                receipt.setName(rs.getString("_name"));
                receipt.setCategory(rs.getString("_category"));
                receipt.setPrice(rs.getInt("_price"));
                receipt.setAmount(rs.getInt("_amount"));
                receipt.setImage(rs.getString("_image"));
                receipt.setDetail(rs.getString("_detail"));
                receipt.setPhone(rs.getString("_phone"));
                receipt.setAddress(rs.getString("_address"));
                list.add(receipt);
            }
        }
        return list;
    }
    
}
