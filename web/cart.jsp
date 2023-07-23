<%-- 
    Document   : cart
    Created on : Feb 14, 2023, 4:19:52 PM
    Author     : Admin
--%>

<%@page import="object.Plant"%>
<%@page import="dao.PlantDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="object.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRJ Project</title>
    </head>
    <body>
        <%
            //code Java
            Account user = (Account) session.getAttribute("LoginUser");
            if (user == null) {
                //Khi nguoi dung chua login
        %>
        <%@include file = "header.jsp"%>
        <%
        } else {
            //Khi nguoi dung login roi
        %>
        <%@include file = "header_userpage.jsp"%>
        <%
            }
        %>
        <%
            HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
            if (cart != null && cart.size() > 0) {
        %>
        <div class="background">
            
            <div class="cart-location">
                <h1>Your shopping cart:</h1>
                <table class="cart-location-item">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Image</th>
                        <th>Quantity</th>
                        <th></th>
                        <th></th>
                    </tr>
                    <%
                        float total = 0;
                        for (String ID : cart.keySet()) {
                            Plant p = PlantDAO.getPlant(ID);
                    %>

                    <form action="MainController" method="post">
                        <tr>
                            <td><%= p.getID()%></td>
                            <td><a href="MainController?action=ViewPlant&plantID=<%= p.getID()%>"><%= p.getName()%></a></td>
                            <td><%= p.getPrice()%></td>
                            <td><img src="images/<%= p.getImgpath()%>" width="100" height="100"></td>                
                            <td><input type="number" value="<%= cart.get(ID)%>" min="1" max="100" name="quantity"></td>
                            <td>
                                <input type="submit" value="UpdateQuantity" name="action">
                            </td>
                            <td><input type="submit" value="RemovePlant" name="action"></td>
                        <input type="hidden" value="<%= p.getID()%>" name="ID"/>
                        </tr>
                    </form>  
                    <%
                            total = total + p.getPrice() * cart.get(ID);
                        }
                    %>
                </table>
                <h2>Total money: <%= total%> $</h2>
                <form action="MainController" method="post">
                    <input type="submit" value="CheckOut" name="action">
                </form>
            </div>
        </div>
        <%
        } else {
        %>
        <div class="background">
            <div class="empty-cart">
                <h1>Shopping cart is empty</h1>
            </div>
        </div>
        <%
            }
        %>
        <%@include file = "footer.jsp"%>
    </body>
</html>
