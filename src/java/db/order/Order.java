/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.order;

/**
 *
 * @author Thien's
 */
public class Order {
    private int oId;
    private String uId;
    private String status;
    private String description;

    public Order() {
    }

    public Order(String status) {
        this.status = status;
    }

    public Order(String uId, String status, String description) {
        this.oId = oId;
        this.uId = uId;
        this.status = status;
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Order(String uId, String status) {
        this.uId = uId;
        this.status = status;
    }

    public Order(int oId, String status) {
        this.oId = oId;
        this.status = status;
    }
    
    public int getoId() {
        return oId;
    }

    public void setoId(int oId) {
        this.oId = oId;
    }

    public String getuId() {
        return uId;
    }


    public void setuId(String pId) {
        this.uId = pId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
}
