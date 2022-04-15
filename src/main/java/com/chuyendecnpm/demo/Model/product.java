package com.chuyendecnpm.demo.Model;

public class Product {
    private String productID;
    private String name;
    private String category;
    private int price;
    private int amount;
    private String image;
    private String detail;

    public Product() {
    }

    public Product(String productID, String name, String category, int price, int amount, String image, String detail)
     {
        this.productID = productID;
        this.name = name;
        this.category = category;
        this.price = price;
        this.amount = amount;
        this.image = image;
        this.detail = detail;
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


    @Override
    public String toString() {
        return "Product{" +
                "productID='" + productID + '\'' +
                ", name='" + name + '\'' +
                ", category='" + category + '\'' +
                ", price=" + price +
                ", amount=" + amount +
                ", image='" + image + '\'' +
                ", detail='" + detail + '\'' +
                '}';
    }



}
