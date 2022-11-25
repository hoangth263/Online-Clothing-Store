/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.cart;

/**
 *
 * @author Thien's
 */
public class Cart {
    private String uId;
    private String pId;
    private String size;
    private int quantity;
    private String pName;
    private double price;
    private String image;

    public Cart() {
    }

    public Cart( String pId, String size, int quantity) {
        this.pId = pId;
        this.size = size;
        this.quantity = quantity;
    }

    public Cart(String pId, String size, int quantity, String pName, double price, String image) {
        this.pId = pId;
        this.size = size;
        this.quantity = quantity;
        this.pName = pName;
        this.price = price;
        this.image = image;
    }

    public Cart(String uId, String pId, String size, int quantity, String pName, double price, String image) {
        this.uId = uId;
        this.pId = pId;
        this.size = size;
        this.quantity = quantity;
        this.pName = pName;
        this.price = price;
        this.image = image;
    }

    public String getuId() {
        return uId;
    }

    public void setuId(String uId) {
        this.uId = uId;
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


    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
