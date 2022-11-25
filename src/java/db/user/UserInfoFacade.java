/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.user;

import db.product.DBContext;
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
public class UserInfoFacade {


    public void create(UserInfo userInfo) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("insert into UserInfo values(?,?,?,?,?)");
        stm.setString(1, userInfo.getId());
        stm.setString(2, userInfo.getName());
        stm.setString(3, userInfo.getPhone());
        stm.setString(4, userInfo.getEmail());
        stm.setString(5, userInfo.getAddress());
        stm.executeUpdate();
        con.close();
    }

    public UserInfo find(String id) throws SQLException {
        UserInfo userinfo = null;
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("select * from UserInfo where id=?");
        stm.setString(1, id);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            userinfo = new UserInfo();
            userinfo.setId(rs.getString("id"));
            userinfo.setName(rs.getString("name"));
            userinfo.setPhone(rs.getString("phone"));
            userinfo.setAddress(rs.getString("address"));
            userinfo.setEmail(rs.getString("email"));
        }
        con.close();
        return userinfo;
    }
    public boolean findByPhone(String phone) throws SQLException {
        UserInfo userinfo = null;
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("select * from UserInfo where phone=?");
        stm.setString(1, phone);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return true;
        }
        con.close();
        return false;
    }
    public boolean findByEmail(String email) throws SQLException {
        UserInfo userinfo = null;
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("select * from UserInfo where email=?");
        stm.setString(1, email);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return true;
        }
        con.close();
        return false;
    }
    
    public void update(UserInfo userinfo) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("update UserInfo set name=?, phone=?, address=?, email=? where id=?");        
        stm.setString(1, userinfo.getName());
        stm.setString(2, userinfo.getPhone());
        stm.setString(3, userinfo.getAddress());
        stm.setString(4, userinfo.getEmail());
        stm.setString(5, userinfo.getId());
        stm.executeUpdate();
        con.close();
    }
}
