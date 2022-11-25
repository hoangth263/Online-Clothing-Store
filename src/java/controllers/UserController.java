/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import config.Config;
import db.cart.Cart;
import db.cart.CartFacade;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import db.user.User;
import db.user.UserFacade;
import db.user.UserInfo;
import db.user.UserInfoFacade;

/**
 *
 * @author Thien's
 */
@WebServlet(name = "UserController", urlPatterns = {"/user"})
public class UserController extends HttpServlet {

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
        switch (action) {
            case "login": // Hien trang chu
                //code xu ly
                login(request, response);
                break;
            case "logout": // Hien trang chu
                //code xu ly
                logout(request, response);
                break;
            case "login_handler": // Hien trang chu
                //code xu ly
                login_handler(request, response);
                break;
            case "register":
                //code xu ly
                register(request, response);
                break;
            case "register_handler":
                //code xu ly
                register_handler(request, response);
                break;
            case "information":
                //code xu ly
                information(request, response);
                break;

        }
//      Cho hien main layout
    }

    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            CartFacade cf = new CartFacade();
            List<Cart> list = cf.selectAll();
            request.setAttribute("count", list.size());
            // Read cookies if available
            Cookie cookie = null;
            Cookie cUserName = null;
            Cookie cPassword = null;
            Cookie[] cookies = null;

            // Get an array of Cookies associated with the this domain
            cookies = request.getCookies();

            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    cookie = cookies[i];
                    if ((cookie.getName()).equals("userName")) {
                        cUserName = cookie;
                    } else if ((cookie.getName()).equals("password")) {
                        cPassword = cookie;
                    }
                }
            }
            if (cUserName != null && cPassword != null) {
                UserFacade uf = new UserFacade();
                User u = uf.find(cUserName.getValue());
                UserInfoFacade uif = new UserInfoFacade();
                UserInfo ui = uif.find(cUserName.getValue());
                if (cUserName.getValue().equals(u.getUserName()) && cPassword.getValue().equals(u.getPassword())) {
                    //Lưu userName vào session để ghi nhận đã login thành công
                    HttpSession session = request.getSession();
                    session.setAttribute("login", true);
                    session.setAttribute("name", ui.getName());
                    session.setAttribute("userName", u.getUserName());
                    request.setAttribute("controller", "home");
                    request.setAttribute("action", "index");
                    request.setAttribute("count", list.size());
                    request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
                }
            }
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void login_handler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("userName");
            String password = request.getParameter("password");
            boolean remember = request.getParameter("remember") != null;
            UserFacade uf = new UserFacade();
            UserInfoFacade userInf = new UserInfoFacade();
            User user = uf.find(id);
            UserInfo userf = userInf.find(id);
            HttpSession session = request.getSession();
            if (user == null || !password.equals(user.getPassword())) {
                request.setAttribute("userName", id);
                request.setAttribute("action", "login");
                request.setAttribute("message", "Username or password is incorrect. Please try again!");
                session.setAttribute("login", false);
                request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
            } // If login successfully
            else if (remember) {
                // Create cookies for username and password     
                Cookie cUserName = new Cookie("userName", id);
                Cookie cPassword = new Cookie("password", password);

                // Set expiry date after 24 Hrs for both the cookies
                cUserName.setMaxAge(60 * 60 * 24);
                cPassword.setMaxAge(60 * 60 * 24);

                // Add both the cookies in the response header
                response.addCookie(cUserName);
                response.addCookie(cPassword);

                System.out.println("Cookies have been stored");
            }
            //Lưu userName vào session để ghi nhận đã login thành công
            session.setAttribute("login", true);
            session.setAttribute("name", userf.getName());
            session.setAttribute("userName", id);
            request.setAttribute("controller", "home");
            request.setAttribute("action", "index");
            CartFacade cf = new CartFacade();
            List<Cart> list = cf.selectAll();
            request.setAttribute("count", list.size());
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
        } catch (SQLException ex) {
            request.setAttribute("action", "login");
            request.setAttribute("message", "Some thing goes wrong");
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
            Logger
                    .getLogger(UserController.class
                            .getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Destroy session
            HttpSession session = request.getSession();
            session.invalidate();

            //Clear cookies
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    cookies[i].setMaxAge(0);
                    response.addCookie(cookies[i]);
                }
            }

            //Redirect to logout.jsp
            CartFacade cf = new CartFacade();
            List<Cart> list = cf.selectAll();
            request.setAttribute("count", list.size());
            request.setAttribute("controller", "home");
            request.setAttribute("action", "index");
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            CartFacade cf = new CartFacade();
            List<Cart> list = cf.selectAll();
            request.setAttribute("count", list.size());

            Cookie cookie = null;
            Cookie cUserName = null;
            Cookie cPassword = null;
            Cookie[] cookies = null;

            // Get an array of Cookies associated with the this domain
            cookies = request.getCookies();

            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    cookie = cookies[i];
                    if ((cookie.getName()).equals("userName")) {
                        cUserName = cookie;
                    } else if ((cookie.getName()).equals("password")) {
                        cPassword = cookie;
                    }
                }
            }
            if (cUserName != null && cPassword != null) {
                try {
                    UserFacade uf = new UserFacade();
                    User u = uf.find(cUserName.getValue());
                    UserInfoFacade uif = new UserInfoFacade();
                    UserInfo ui = uif.find(cUserName.getValue());
                    if (cUserName.getValue().equals(u.getUserName()) && cPassword.getValue().equals(u.getPassword())) {
                        //Lưu userName vào session để ghi nhận đã login thành công
                        HttpSession session = request.getSession();
                        session.setAttribute("login", true);
                        session.setAttribute("name", ui.getName());
                        session.setAttribute("userName", u.getUserName());
                        request.setAttribute("count", list.size());
                        request.setAttribute("controller", "home");
                        request.setAttribute("action", "index");
                        request.getRequestDispatcher(Config.LAYOUT).forward(request, response);

                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UserController.class
                            .getName()).log(Level.SEVERE, null, ex);
                }
            }
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void register_handler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("userName");
            String password = request.getParameter("password");
            String rePassword = request.getParameter("re-password");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            UserFacade userf = new UserFacade();
            UserInfoFacade userInf = new UserInfoFacade();

            request.setAttribute("name", name);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("email", email);
            request.setAttribute("userName", id);
            request.setAttribute("password", password);
            request.setAttribute("rpassword", rePassword);
            //check
            if (userInf.findByPhone(phone)) {
                request.setAttribute("action", "register");
                request.setAttribute("pmessage", "This phone's number is already being used");
                request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
            } else if (userInf.findByEmail(email)) {
                request.setAttribute("action", "register");
                request.setAttribute("emessage", "This email is alreadu used for another account");
                request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
            } else if (!rePassword.equals(password)) {
                request.setAttribute("action", "register");
                request.setAttribute("rmessage", "Incorrect Reapeating Password");
                request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
            } else {
                //add to sql
                User u = new User();
                UserInfo uf = new UserInfo();
                u.setUserName(id);
                u.setPassword(password);
                uf.setId(id);
                uf.setName(name);
                uf.setPhone(phone);
                uf.setAddress(address);
                uf.setEmail(email);
                userf.create(u);
                userInf.create(uf);
                //Lưu userName vào session để ghi nhận đã login thành công
                HttpSession session = request.getSession();
                session.setAttribute("login", true);
                session.setAttribute("name", name);
                session.setAttribute("userName", id);
                request.setAttribute("controller", "home");
                request.setAttribute("action", "index");
                CartFacade cf = new CartFacade();
                List<Cart> list = cf.selectAll();
                request.setAttribute("count", list.size());
                request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
            }

        } catch (SQLException ex) {
            request.setAttribute("action", "register");
            request.setAttribute("message", "This Username is already exist");
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
            Logger
                    .getLogger(UserController.class
                            .getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void information(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String id = (String) session.getAttribute("userName");
            UserInfoFacade uif = new UserInfoFacade();
            UserInfo uf = uif.find(id);
            request.setAttribute("userInfo", uf);
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class
                    .getName()).log(Level.SEVERE, null, ex);
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
