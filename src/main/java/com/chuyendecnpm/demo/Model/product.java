package com.chuyendecnpm.demo.Model;

public class product {
    private int ID;
    private String ProductID;
    private String Name;
    private String Category;
    private String Price;
    private String Amount;
    private String Status;
    private String Image;

    public product() {
    }

    public product(int ID, String ProductID, String Name, String Category, String Price, String Amount, String Status, String Image) {
        this.ID = ID;
        this.ProductID = ProductID;
        this.Name = Name;
        this.Category = Category;
        this.Price = Price;
        this.Amount = Amount;
        this.Status = Status;
        this.Image = Image;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getProductID() {
        return ProductID;
    }

    public void setProductID(String ProductID) {
        this.ProductID = ProductID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String Price) {
        this.Price = Price;
    }

    public String getAmount() {
        return Amount;
    }

    public void setAmount(String Amount) {
        this.Amount = Amount;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    @Override
    public String toString() {
        return "product{" +
                "ID=" + ID +
                ", ProductID='" + ProductID + '\'' +
                ", Name='" + Name + '\'' +
                ", Category='" + Category + '\'' +
                ", Price='" + Price + '\'' +
                ", Amount='" + Amount + '\'' +
                ", Status='" + Status + '\'' +
                ", Image='" + Image + '\'' +
                '}';
    }
}
