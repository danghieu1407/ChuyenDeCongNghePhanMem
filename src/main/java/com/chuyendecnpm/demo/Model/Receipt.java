package com.chuyendecnpm.demo.Model;

import java.sql.Date;

public class Receipt {
    private String email;
    private String productID;
    private String name;
    private String category;
    private int price;
    private int amount;
    private String image;
    private String detail;
    private String phone;
    private String address;
    private String status;
    private String date;

    public Receipt() {
    }

    public Receipt(String email, String productID, String name, String category, int price, int amount, String image, String detail, String phone) {
        this.email = email;
        this.productID = productID;
        this.name = name;
        this.category = category;
        this.price = price;
        this.amount = amount;
        this.image = image;
        this.detail = detail;
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Receipt{" +
                "email='" + email + '\'' +
                ", productID='" + productID + '\'' +
                ", name='" + name + '\'' +
                ", category='" + category + '\'' +
                ", price=" + price +
                ", amount=" + amount +
                ", image='" + image + '\'' +
                ", detail='" + detail + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", status='" + status + '\'' +
                '}';
    }

}
