/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import db.cart.Cart;
import db.cart.CartFacade;
import db.order.Order;
import db.order.OrderFacade;
import db.product.Product;
import db.product.ProductFacade;
import config.Config;
import db.user.UserInfo;
import db.user.UserInfoFacade;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thien's
 */
@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String controller = (String) request.getAttribute("controller");
        String action = (String) request.getAttribute("action");
        switch (action.toLowerCase()) {
            case "delete":
                delete(request, response);
                break;
//            case "update":
//                update(request, response);
//                break;
            case "cartview":
                cartview(request, response);
                break;
            case "detail":
                detail(request, response);
                break;
            case "addtocart":
                addtocart(request, response);
                break;
            case "checkout": {
                checkout(request, response);
                break;
            }
            case "information": {
                information(request, response);
                break;
            }
            case "confirm": {
                confirm(request, response);
                break;
            }
        }
//      Cho hien main layout
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("pId");
            String size = request.getParameter("size");
            CartFacade cf = new CartFacade();
            cf.deleteBySize(id, size);
            List<Cart> list = cf.selectAll();
            request.setAttribute("list", list);
            request.setAttribute("count", list.size());
            request.setAttribute("action", "cartview");
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    protected void update(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            String pId = request.getParameter("pId");
//            int quantity = Integer.parseInt(request.getParameter("quantity"));
//            String size = request.getParameter("size");
//            CartFacade cf = new CartFacade();
//            Cart c = cf.find1(pId);
//            cf.update(c);
//            List<Cart> list = cf.selectAll();
//            request.setAttribute("list", list);
//            request.setAttribute("action", "cartview");
//            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
//        } catch (SQLException ex) {
//            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    protected void detail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            ProductFacade pf = new ProductFacade();
            Product p = pf.find(id);
            request.setAttribute("product", p);
            CartFacade cf = new CartFacade();
            List<Cart> list = cf.selectAll();
            request.setAttribute("count", list.size());
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void addtocart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String uId = request.getParameter("userName");
            String status = request.getParameter("status");
            String pId = request.getParameter("id");
            String size = request.getParameter("size");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            Order o = null;
            OrderFacade of = new OrderFacade();
            CartFacade cf = new CartFacade();
            ProductFacade pf = new ProductFacade();
            Product p = pf.find(pId);
            System.out.println(uId);
            Cart c = new Cart();
            c.setpId(pId);
            c.setSize(size);
            if (cf.findBySize(pId, size) != null) {
                c.setQuantity(cf.findBySize(pId, size).getQuantity() + quantity);
                cf.deleteBySize(pId, size);
            } else {
                cf.deleteBySize(pId, size);
                c.setQuantity(quantity);
            }
            cf.create(c);
            List<Cart> list = cf.selectAll();
            String id = request.getParameter("id");
            p = pf.find(id);
            request.setAttribute("count", list.size());
            request.setAttribute("controller", "cart");
            request.setAttribute("action", "detail");
            request.setAttribute("product", p);
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   

    protected void cartview(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            CartFacade cf = new CartFacade();
            List<Cart> list = cf.selectAll();
            request.setAttribute("count", list.size());
            request.setAttribute("list", list);
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
        } catch (SQLException ex) {
            request.setAttribute("controller", "home");
            request.setAttribute("action", "index");
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void checkout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String uId = (String) session.getAttribute("userName");
            double total = Double.parseDouble(request.getParameter("total"));
            CartFacade cf = new CartFacade();
            List<Cart> list = cf.selectAll();
            UserInfoFacade uif = new UserInfoFacade();
            UserInfo ui = uif.find(uId);
            request.setAttribute("count", list.size());
            request.setAttribute("list", list);
            request.setAttribute("total", total);
            request.setAttribute("userInfo", ui);
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void information(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            double total = Double.parseDouble(request.getParameter("total"));
            CartFacade cf = new CartFacade();
            List<Cart> list = cf.selectAll();
            request.setAttribute("total", total);
            request.setAttribute("count", list.size());
            request.setAttribute("list", list);
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void confirm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            double total = Double.parseDouble(request.getParameter("total"));
            String uId= request.getParameter("uId");
            CartFacade cf = new CartFacade();
            List<Cart> list = cf.selectAll();
            OrderFacade of= new OrderFacade();
            Order o = new Order();
            if(uId.isEmpty()){
                uId="Guest";
            }
            o.setuId(uId);
            o.setStatus("On-processing");
            StringBuilder sb = new StringBuilder();
            for(int i=0; i<list.size();i++){
                sb.append(list.get(i).getpId()+". ");
                sb.append(list.get(i).getpName()+"  ");
                sb.append("size: "+list.get(i).getSize()+" ");
                String s1=String.valueOf(list.get(i).getQuantity());
                sb.append("x"+s1+" ");
                sb.append(" || ");
            }
            String s2=String.valueOf(total);
            sb.append("total: "+s2+" ");
            o.setDescription(sb.toString());
            of.create(o);
            cf.deleteAll();
            list = cf.selectAll();
            request.setAttribute("count", list.size());
            request.setAttribute("list", list);
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
