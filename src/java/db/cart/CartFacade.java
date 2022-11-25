/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.cart;

import db.product.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Thien's
 */
public class CartFacade {

    public List<Cart> selectAll() throws SQLException {
        List<Cart> list = null;
        Connection con = DBContext.getConnection();
        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery("select p.pId,p.pName,p.price,p.image, c.size,c.quantity from product p join cart c on p.pId=c.pId");
        list = new ArrayList();
        while (rs.next()) {
            Cart cart = new Cart();
            cart.setpId(rs.getString("pId"));
            cart.setpName(rs.getString("pName"));
            cart.setPrice(rs.getDouble("price"));
            cart.setImage(rs.getString("image"));
            cart.setSize(rs.getString("size"));
            cart.setQuantity(rs.getInt("quantity"));
            list.add(cart);
        }
        con.close();
        return list;
    }

    public Cart find(String pId) throws SQLException {
        Connection con = DBContext.getConnection();
        Cart cart = null;
        String sql = "select * from cart where pId= ?";
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setString(1, pId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            cart = new Cart();
            cart.setpId(pId);
            cart.setSize(rs.getString("size"));
            cart.setQuantity(rs.getInt("quantity"));
        }
        con.close();
        return cart;
    }
    public Cart findBySize(String pId,String size) throws SQLException {
        Connection con = DBContext.getConnection();
        Cart cart = null;
        String sql = "select * from cart where pId= ? and size=?";
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setString(1, pId);
        stm.setString(2, size);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            cart = new Cart();
            cart.setpId(pId);
            cart.setSize(rs.getString("size"));
            cart.setQuantity(rs.getInt("quantity"));
        }
        con.close();
        return cart;
    }

    public void create(Cart cart) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("insert into cart values(?,?,?)");
        stm.setString(1, cart.getpId());
        stm.setString(2, cart.getSize());
        stm.setInt(3, cart.getQuantity());
        stm.executeUpdate();
        con.close();
    }
    
    public void delete(String id) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("delete from cart where pId=?");
        stm.setString(1, id);
        stm.executeUpdate();
        con.close();
    }
    public void deleteBySize(String id,String size) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("delete from cart where pId=? and size=?");
        stm.setString(1, id);
        stm.setString(2, size);
        stm.executeUpdate();
        con.close();
    }

    public void deleteAll() throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("delete from cart");
        stm.executeUpdate();
        con.close();
    }
}
