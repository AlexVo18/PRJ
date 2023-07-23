/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

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
            String action = request.getParameter("action");
            String url = "";
            if (action == null || action.equals("")) {
                url = "SearchServlet";
            } else {
                switch (action) {
//------------------------------Phan user---------------------------------------

// Cac chuc nang lien quan toi tai khoan
                    case "Login":
                        url = "LoginServlet";
                        break;
                    case "Create":
                        url = "RegisterServlet";
                        break;
                    case "LogOut":
                        url = "LogoutServlet";
                        break;
                    case "Update":
                        url = "UpdateProfileServlet";
                        break;

// Phan order cua user
                    case "ViewOrder":
                        url = "ViewOrderServlet";
                        break;
                    case "CancelOrder":
                        url = "CancelOrderServlet";
                        break;
                    case "OrderAgain":
                        url = "OrderAgainServlet";
                        break;
                    case "GetOrder":
                        url = "GetOrderServlet";
                        break;

// Phan ve gio hang va san pham
                    case "Search":
                        url = "SearchServlet";
                        break;
                    case "UpdateQuantity":
                        url = "UpdateQuantityServlet";
                        break;
                    case "RemovePlant":
                        url = "RemovePlantServlet";
                        break;
                    case "CheckOut":
                        url = "CheckOutServlet";
                        break;
                    case "AddToCart":
                        url = "AddToCartServlet";
                        break;
                    case "ViewPlant":
                        url = "ViewPlantServlet";
                        break;

//------------------------------Phan admin--------------------------------------                    
// Phan manage accounts trong admin
                    case "ManageAccounts":
                        url = "ManageAccountsServlet";
                        break;
                    case "SearchAccount":
                        url = "SearchAccountServlet";
                        break;
                    case "UpdateStatusAccount":
                        url = "UpdateStatusAccountServlet";
                        break;

// Phan manage orders trong admin
                    case "ManageOrders":
                        url = "ManageOrdersServlet";
                        break;
                    case "SearchOrder":
                        url = "SearchOrderServlet";
                        break;
                    case "ShipDateOrder":
                        url = "ShipDateOrderServlet";
                        break;
                    case "UpdateShipDateOrder":
                        url = "UpdateShipDateOrderServlet";
                        break;
                    case "ViewAdminOrder":
                        url = "ViewAdminOrderServlet";
                        break;
                    case "UpdateStatusOrder":
                        url = "UpdateStatusOrderServlet";
                        break;

// Phan manage plants trong admin
                    case "SearchPlant":
                        url = "SearchPlantServlet";
                        break;
                    case "ManagePlants":
                        url = "ManagePlantsServlet";
                        break;
                    case "UpdateStatusPlant":
                        url = "UpdateStatusPlantServlet";
                        break;
                    case "UpdatePlant":
                        url = "UpdatePlantServlet";
                        break;
                    case "ViewUpdatePlant":
                        url = "ViewUpdatePlantServlet";
                        break;
                    case "DeletePlant":
                        url = "DeletePlantServlet";
                        break;
                    case "AddPlant":
                        url = "AddPlantServlet";
                        break;
                    case "AddCategory":
                        url = "AddCategoryServlet";
                        break;
                    case "ManageCategories":
                        url = "ManageCategoriesServlet";
                        break;
                }
            }
            request.getRequestDispatcher(url).forward(request, response);
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
