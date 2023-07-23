/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import object.Account;

/**
 *
 * @author Admin
 */
public class AddToCartServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String ID = request.getParameter("ID");// lay id cua plant chon mua
            HttpSession session = request.getSession();
            HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
            if (cart == null) {
                // Gio hang chua dc tao ra
                cart = new HashMap<>();
                cart.put(ID, 1);
            } else {
                if (cart.containsKey(ID)) {
                    //id co roi
                    int quantity = cart.get(ID);
                    quantity++;
                    //update cart
                    cart.put(ID, quantity);
                } else {
                    cart.put(ID, 1);
                }
            }
            //roi khoi trang nay luu cart vao session

            Account user = (Account) session.getAttribute("LoginUser");
            if (user == null || !user.equals("")) {
                session.setAttribute("cart", cart);
                request.setAttribute("Message", "Added");
                request.getRequestDispatcher("MainController?action=Search").forward(request, response);
            } else {
                session.setAttribute("cart", cart);
                request.setAttribute("Message", "Added");
                request.getRequestDispatcher("MainController?action=Search").forward(request, response);
            }
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
