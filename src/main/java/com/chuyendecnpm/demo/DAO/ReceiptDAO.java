package com.chuyendecnpm.demo.DAO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Database.Connect;
import com.chuyendecnpm.demo.Model.Receipt;

public class ReceiptDAO {
    //insert into receipt(_email,_productID,_name,_category,_price,_amount,_image,_detail,_phone,_date) values (?,?,?,?,?,?,?,?,?,?)

    public void Add(Receipt receipt) throws Exception {
        String sql = "insert into _Receipt(_email,_productID,_name,_category,_price,_amount,_image,_detail,_phone,_address,_status) values (?,?,?,?,?,?,?,?,?,?,?)";
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
            stm.setString(11, receipt.getStatus());
    
            stm.executeUpdate();
            stm.close();
        }
    }

    //get all receipt
    public List<Receipt> getAllReceipt() throws Exception {
        List<Receipt> list = new ArrayList<>();
        String sql = "SELECT * FROM _Receipt ORDER BY _id DESC";
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
                receipt.setStatus(rs.getString("_status"));



                
                list.add(receipt);
            }
        }
        return list;
    }
    //change status to "Shipped" by phone
    public static boolean changeStatusToShipped(String phone) throws Exception {
        String sql = "UPDATE _Receipt SET _status = 'Shipping' WHERE _phone = ?";
        try (
                Connection con = Connect.connectSQL();
                PreparedStatement stm = con.prepareStatement(sql);) {
            stm.setString(1, phone);
            stm.executeUpdate();
            stm.close();
            return true;
        }
    }

    //change status to "done" by phone
    public static boolean changeStatusToDone(String phone) throws Exception {
        String sql = "UPDATE _Receipt SET _status = 'Done' WHERE _phone = ?";
        try (
                Connection con = Connect.connectSQL();
                PreparedStatement stm = con.prepareStatement(sql);) {
            stm.setString(1, phone);
            stm.executeUpdate();
            stm.close();
            return true;
        }
    }


    //change status to cancel
    public static boolean changeStatusToCancel(String phone) throws Exception {
        String sql = "UPDATE _Receipt SET _status = 'Cancel' WHERE _phone = ?";
        try (
                Connection con = Connect.connectSQL();
                PreparedStatement stm = con.prepareStatement(sql);) {
            stm.setString(1, phone);
            stm.executeUpdate();
            stm.close();
            return true;
        }
    }

    // get all receipt 
    public List<Receipt> getAllReceiptForStatistical() throws Exception {
        List<Receipt> list = new ArrayList<>();

        String sql = "SELECT * FROM _Receipt WHERE _status = 'Done' ORDER BY _date DESC";
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
        
                receipt.setStatus(rs.getString("_date"));





                
                list.add(receipt);
            }
        }
        return list;
    }

    //get all receipt sort by month
    public List<Receipt> getAllReceiptForStatisticalByMonth(String month) throws Exception {
        List<Receipt> list = new ArrayList<>();
        String sql = "SELECT * FROM _Receipt WHERE MONTH(_date) LIKE '%"+month+"%' and _status = 'Done'";
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
                receipt.setStatus(rs.getString("_date"));
                list.add(receipt);
            }
        }
        return list;
    }
    //delete receipt by name and phone and price
    public static boolean deleteReceipt(String name, String phone, String price) throws Exception {
        String sql = "DELETE FROM _Receipt WHERE _name = ? and _phone = ? and _price = ?";
        try (
                Connection con = Connect.connectSQL();
                PreparedStatement stm = con.prepareStatement(sql);) {
            stm.setString(1, name);
            stm.setString(2, phone);
            stm.setString(3, price);
            stm.executeUpdate();
            stm.close();
            return true;
        }
    }

    //add receipt
    public static boolean addReceipt(Receipt receipt) throws Exception {
        String sql = "INSERT INTO _Receipt(_email, _productID, _name, _category, _price, _amount, _image, _detail, _phone, _address, _status) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
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
            stm.setString(11, receipt.getStatus());
            stm.executeUpdate();
            stm.close();
            return true;
        }
    }

    //update receipt
    public static boolean updateReceipt(Receipt receipt,String name) throws Exception {
        String sql = "UPDATE _Receipt SET _email = ?, _productID = ?, _name = ?, _category = ?, _price = ?, _amount = ?, _image = ?, _detail = ?, _phone = ?, _address = ?, _status = ? where _name = '"+name+"'";
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
            stm.setString(11, receipt.getStatus());
       
            stm.executeUpdate();
            stm.close();
            return true;
        }
    }

    //findReceiptByNamePhonePrice
    public static Receipt findReceiptByNamePhonePrice(String name, String phone) throws Exception {
        Receipt receipt = new Receipt();
        String sql = "SELECT * FROM _Receipt WHERE _name = ? and _phone = ? ";
        try (
                Connection con = Connect.connectSQL();
                PreparedStatement stm = con.prepareStatement(sql);) {
            stm.setString(1, name);
            stm.setString(2, phone);
            // stm.setString(3, price);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
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
                receipt.setStatus(rs.getString("_date"));
            }
        }
        return receipt;
    }
   


}

