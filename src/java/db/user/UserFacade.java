/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.user;

import db.product.DBContext;
import db.product.DBContext;
import db.user.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PHT
 */
public class UserFacade {

    public List<User> selectAll() {
        List<User> list = null;
        Connection con = DBContext.getConnection();
        try {
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from UserLog");
            list = new ArrayList<>();
            while (rs.next()) {
                User user = new User();
                user.setUserName(rs.getString("id"));
                user.setPassword(rs.getString("name"));
                list.add(user);
            }
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public void create(User user) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("insert into UserLog values(?,?)");
        stm.setString(1, user.getUserName());
        stm.setString(2, user.getPassword());
        stm.executeUpdate();
        con.close();
    }

    public User find(String userName) throws SQLException {
        User user = null;
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("select * from UserLog where userName=?");
        stm.setString(1, userName);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            user = new User();
            user.setUserName(rs.getString("userName"));
            user.setPassword(rs.getString("password"));
        }
        con.close();
        return user;
    }

    public void update(User user) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("update UserLog set password=? where userName=?");
        stm.setString(1, user.getPassword());
        stm.setString(2, user.getUserName());
        stm.executeUpdate();
        con.close();
    }
}
