<%-- 
    Document   : userorders
    Created on : Feb 14, 2023, 4:18:56 PM
    Author     : Admin
--%>


<%@page import="object.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="object.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRJ Project</title>
        <link rel="stylesheet" href="Styles/userstyles.css">
    </head>
    <body>
        <%
            //code Java
            Account user = (Account) session.getAttribute("LoginUser");
            if (user == null) {
                //Khi nguoi dung vao thang
        %>
        <p style="color: red">You have not login yet!</p>
        <a href="index.jsp">Go back</a>
        <%
        } else {
        %>
        <%@include file = "header_userpage.jsp"%>

        <nav class="order-header">
            <form action="MainController" method="post" >
                <p><a href="MainController?action=GetOrder&status=0">All Orders</a></p> <!--Lay tat ca don -->
                <p><a href="MainController?action=GetOrder&status=1">Processing Orders</a></p> <!--Lay tat ca don dang lam -->
                <p><a href="MainController?action=GetOrder&status=2">Completed Orders</a></p> <!--Lay tat ca don hoan thanh -->
                <p><a href="MainController?action=GetOrder&status=3">Canceled Orders</a></p> <!--Lay tat ca don da huy -->
            </form>
        </nav>

        <%
            ArrayList<Order> list = (ArrayList) request.getAttribute("OrderList");
            String[] status = {"", "Processing", "Completed", "Canceled"};
            if (list != null && list.size() > 0) {

        %>
        <div class="background">
            <div class="order">
                <table class="user-order">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Order Date</th>
                            <th>Ship Date</th>
                            <th>Order's Status</th>
                            <th></th>
                        </tr> 
                    </thead>
                    <tbody>
                        <%                for (Order a : list) {
                        %>

                        <tr>
                            <td><%= a.getOrderID()%></td>
                            <td><%= a.getOrderDate()%></td>
                            <td><%= a.getShipDate()%></td>
                            <td><%= status[a.getStatus()]%>
                            </td>
                            <td>
                                <a href="MainController?action=ViewOrder&orderID=<%= a.getOrderID()%>">View Order's Detail</a> <br/>
                                <% if (a.getStatus() == 1) {
                                %>
                                <a href="MainController?action=CancelOrder&ID=<%= a.getOrderID()%>">Cancel order</a>

                                <%
                                } else {
                                %>
                                <a href="MainController?action=OrderAgain&orderID=<%= a.getOrderID()%>">Order again</a>    
                                <%
                                    }
                                %> 
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <%    } else {
        %>
        <%=(request.getAttribute("NoOrder") != null) ? request.getAttribute("NoOrder") : ""%>
        <%
            }
        %>
        <%
            String message = (String) request.getAttribute("CancelSuccess");
            if (message != null) {
        %>
        <script>
            alert("Cancel successfully");
        </script>
        <%
            }
        %>

        <%@include file = "footer.jsp"%>
        <%
            }
        %>

    </body>
</html>
