<%-- 
    Document   : vieworder
    Created on : Mar 11, 2023, 5:35:45 PM
    Author     : Admin
--%>

<%@page import="object.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
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
        ArrayList<OrderDetail> list = (ArrayList) request.getAttribute("OrderDetail");
            int money = 0;
    %>
    <table class="">
        <tr>
            <td>ID</td>
            <td>Plant Name</td>
            <td>Image</td>
            <td>Quantity</td>
            <td>Total Price</td>
        </tr>
        <%
            for (OrderDetail detail : list) {
        %>
        <tr>
            <td><%= detail.getPlantID()%></td>
            <td><%= detail.getPlantName()%></td>
            <td><img src="images/<%= detail.getImgPath()%>" width="100" height="100"></td>
            <td><%= detail.getQuantity()%></td>
            <td><%= detail.getPrice() * detail.getQuantity()%></td>
            <% money = money + detail.getPrice() * detail.getQuantity(); %>
        </tr>
        <%
            }
        %>
    </table>
    <h3>Total money: <%= money%></h3>
</body>
</html>
