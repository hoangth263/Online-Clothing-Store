/*
 * To change this license header, choose License Headers in Project Practionerties.
 * To change this template file, choose Tools | Templates
 * and actionen the template in the editor.
 */
package controllers;

import config.Config;
import db.cart.Cart;
import db.cart.CartFacade;
import db.product.Product;
import db.product.ProductFacade;
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

/**
 *
 * @author Hoang's
 */
@WebServlet(name = "ProductController", urlPatterns = {"/product"})
public class ProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = (String) request.getAttribute("action");
        String controller = (String) request.getAttribute("controller");
        action = action.toLowerCase();
        System.out.println("Option : " + action);
        switch (action) {
            case "listall":
                listAll(request, response);
                break;
            case "listshirts":
                listOneType(request, response, 1);
                break;
            case "listtrousers":
                listOneType(request, response, 2);
                break;
            case "listjackets":
                listOneType(request, response, 3);
                break;
            case "listaccessories":
                listOneType(request, response, 4);
                break;
            case "search":
                search(request, response);
                break;
        }
    }
    
    public void listAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int category = 0;
            ProductFacade pf = new ProductFacade();
            List<Product> listProduct = pf.selectAll();
            request.setAttribute("listProduct", listProduct);
            CartFacade cf = new CartFacade();
            List<Cart> listCart = cf.selectAll();
            request.setAttribute("list", listCart);
            request.setAttribute("count", listCart.size());
            request.setAttribute("category", category);
            request.setAttribute("controller", "category");
            request.setAttribute("action", "category");
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void listOneType(HttpServletRequest request, HttpServletResponse response, int caId) throws ServletException, IOException {
        try {
            int category = caId;
            ProductFacade pf = new ProductFacade(); 
            List<Product> listProduct = pf.selectType(caId);
            request.setAttribute("listProduct", listProduct);
            CartFacade cf = new CartFacade();
            List<Cart> listCart = cf.selectAll();
            request.setAttribute("list", listCart);
            request.setAttribute("count", listCart.size());
            request.setAttribute("category", category);
            request.setAttribute("controller", "category");
            request.setAttribute("action", "category");
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search").toLowerCase();
//        String search = (String) request.getAttribute("search");
        ProductFacade pf = new ProductFacade();
        List<Product> listProduct = null;
        try {
            listProduct = pf.search(search); 
            request.setAttribute("listProduct", listProduct);
            CartFacade cf = new CartFacade();
            List<Cart> listCart = cf.selectAll();
            request.setAttribute("list", listCart);
            request.setAttribute("count", listCart.size());
            request.setAttribute("search", search);
            request.setAttribute("controller", "category");
            request.setAttribute("action", "search");
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
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
