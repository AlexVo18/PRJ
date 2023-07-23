<%-- 
    Document   : updatedate
    Created on : Mar 11, 2023, 5:57:45 PM
    Author     : Admin
--%>

<%@page import="object.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="o" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <o:import url="header_adminpage.jsp"></o:import>
            <nav>
                <ul>
                    <li>
                        <form action="MainController" method="post">
                            <input type="text" name="txtsearch" 
                                   value="<%=(request.getParameter("keyword") != null) ? request.getParameter("keyword") : ""%>"
                            placeholder="Enter user's email">
                        <button type="submit" value="SearchOrder" name="action">Search</button>
                    </form>
                </li>
            </ul>
        </nav>
        <%
            Order order = (Order) request.getAttribute("Order");
            String[] status = {"", "Processing", "Completed", "Canceled"};
        %>
        <form action="MainController" method="post">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Order Date</th>
                    <th>Shipping Date</th>
                    <th>Status</th>
                    <th></th>
                </tr>
                <tr>
                    <td> 
                        <%= order.getOrderID() %>
                        <input type="text" name="txtid" value="<%= order.getOrderID() %>" hidden="">
                    </td>
                    <td><input type="text" name="txtorderdate" value="<%= order.getOrderDate() %>" readonly=""></td>
                    <td>
                        <input type="text" name="txtshipdate" value="<%= order.getShipDate() %>" pattern="\d{4}-\d{2}-\d{2}"> <br>
                        <p style="font-size: 13px">Format:"YYYY-MM-DD"</p>
                    </td>
                    <td><input type="text" name="txtstatus" value="<%= status[order.getStatus()] %>" readonly=""></td>
                    <td><button type="submit" name="action" value="UpdateShipDateOrder">Submit</button></td>
                </tr>
            </table>
            
        </form>
    </body>
</html>
