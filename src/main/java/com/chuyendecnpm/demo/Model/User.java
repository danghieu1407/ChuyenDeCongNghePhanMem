package com.chuyendecnpm.demo.Model;

public class User {
    private String name;
    private String email;
    private String password;
    private String role;
    private String phone;
    private String address;
    private int wallet;

    public User() {
      
    }
    
    public User(String name, String email, String password, String phone, String address) {
    
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = "User";
        this.phone = phone;
        this.address = address;
        this.wallet = 0;
    }
    



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getWallet() {
        return wallet;
    }

    public void setWallet(int wallet) {
        this.wallet = wallet;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + this.name + '\'' +
                ", email='" + this.email + '\'' +
                ", password='" + this.password + '\'' +
                ", role='" + this.role + '\'' +
                ", phone='" + this.phone + '\'' +
                ", address='" + this.address + '\'' +
                ", wallet=" + this.wallet +
                '}';
    }

}
