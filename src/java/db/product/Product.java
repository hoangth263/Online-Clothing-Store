/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.product;

/**
 *
 * @author DELL
 */
public class Product {
    String pId;
    String pName;
    double price;
    String image;
    int CaId;
    String Category;

    public String getCategory() {
        return Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

    public Product() {
    }

    public Product(String pId, String pName, double price, String image, int CaId) {
        this.pId = pId;
        this.pName = pName;
        this.price = price;
        this.image = image;
        this.CaId = CaId;
    }
    
    

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCaId() {
        return CaId;
    }

    public void setCaId(int CaId) {
        this.CaId = CaId;
    }
    
}
