package com.chuyendecnpm.demo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Database.Connect;
import com.chuyendecnpm.demo.Model.User;


public class UserDAO {

    public void Add(User user) throws Exception {
        String sql = "insert into _User(_name,_email,_password,_phone,_address) values (?,?,?,?,?)";
        try (
                Connection con = Connect.connectSQL();
                PreparedStatement stm = con.prepareStatement(sql);) {
            stm.setString(1, user.getName());
            stm.setString(2, user.getEmail());
            stm.setString(3, user.getPassword());
            stm.setString(4, user.getPhone());
            stm.setString(5, user.getAddress());
           

            stm.executeUpdate();
            stm.close();
        }
    }

    public User getUserByEmail(String email,String password) {
        User user = new User();
        String sql = "select * from _User where _email = ? and _password = ?";
        try (
                Connection con = Connect.connectSQL();
                PreparedStatement stm = con.prepareStatement(sql);) {
            stm.setString(1, email);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                
                user.setName(rs.getString("_name"));
                user.setEmail(rs.getString("_email"));
                user.setPassword(rs.getString("_password"));
                user.setRole(rs.getString("_role"));
                user.setPhone(rs.getString("_phone"));
                user.setAddress(rs.getString("_address"));
                user.setWallet(rs.getInt("_wallet"));
            }
            stm.close();
          

        } catch (Exception e) {
            e.printStackTrace();
            return null;
           
        }
        return user;
        
    }

    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        String sql = " Select * from _User";
        try {
            Connection con = Connect.connectSQL();
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User();

                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setWallet(rs.getInt("wallet"));

                list.add(user);
            }
            con.close();
            stm.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //get user by email
    public User getUserByEmail(String email) {
        User user = new User();
        String sql = "select * from _User where _email = ?";
        try (
                Connection con = Connect.connectSQL();
                PreparedStatement stm = con.prepareStatement(sql);) {
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setWallet(rs.getInt("wallet"));
            }
            stm.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

}