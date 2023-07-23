/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import object.Account;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {

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
            String email = request.getParameter("txtemail");
            String pwd = request.getParameter("txtpassword");
            String save = request.getParameter("savelogin");
            Account acc = AccountDAO.getAccount(email, pwd);
            try {
                if (acc == null) {
                    // Tai khoan khong ton tai
                    request.setAttribute("ERROR", "Invalid Login!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    // Tai khoan ton tai
                    HttpSession session = request.getSession();
                    session.setAttribute("LoginUser", acc);
                    if (save != null) {
                        // Neu admin co tick checkbox
                        String token = lib.RandomString.RandomToken();
                        AccountDAO.updateToken(token, email);
                        Cookie cookie = new Cookie("selector", token);
                        cookie.setMaxAge(60 * 60);
                        response.addCookie(cookie);
                    }
                    if (acc.getRole() == 1) {
                        //Go to admin
                        response.sendRedirect("adminpage.jsp");
                    } else if (acc.getRole() == 0) {
                        // Go to user
                        request.getRequestDispatcher("MainController?action=Search").forward(request, response);
                    } else {
                        request.setAttribute("ERROR", "Invalid Login!");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
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