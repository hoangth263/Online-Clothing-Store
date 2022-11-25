/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.order;

import db.product.DBContext;
import db.order.Order;
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
public class OrderFacade {

    public void create(Order order) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("insert into orderinfo values(?,?,?)");
        stm.setString(1, order.getuId());
        stm.setString(2, order.getStatus());
        stm.setString(3, order.getDescription());
        stm.executeUpdate();
        con.close();
    }

    public List<Order> find(String id) throws SQLException {
        Connection con = DBContext.getConnection();
        List<Order> list = null;
        Order order = null;
        String sql = "select * from orderinfo where uId= ?";
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setString(1, id);
        ResultSet rs = stm.executeQuery();
        list = new ArrayList<>();
        while (rs.next()) {
            order = new Order();
            order.setoId(rs.getInt("oId"));
            order.setStatus(rs.getString("status"));
            order.setDescription(rs.getString("description"));
            list.add(order);
        }
        con.close();

        return list;
    }
}
