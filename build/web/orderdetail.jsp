<%-- 
    Document   : orderdetail
    Created on : Feb 14, 2023, 10:26:37 PM
    Author     : Admin
--%>

<%@page import="javax.xml.soap.Detail"%>
<%@page import="dao.OrderDAO"%>
<%@page import="object.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="object.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        
        <%
            ArrayList<OrderDetail> list = (ArrayList) request.getAttribute("ViewOrderList");
            if (list != null && list.size() > 0) {
                int money = 0;
        %>
        <table class="order">
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
                <td><%= detail.getPrice() * detail.getQuantity() %></td>
                <% money = money + detail.getPrice() * detail.getQuantity(); %>
            </tr>
            <%
                }
            %>
        </table>
        <h3>Total money: <%= money%></h3>
        <a href="MainController?action=GetOrder&status=0">Go back</a>
        <%
        } else {
        %>
        <%=(request.getAttribute("NothingOrder") != null) ? request.getAttribute("NothingOrder") : ""%>
        <%
            }
        %>
        
        <%@include file = "footer.jsp"%>
        <%
            }
        %>
    </body>
</html>
