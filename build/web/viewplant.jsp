<%-- 
    Document   : viewplant
    Created on : Mar 11, 2023, 1:19:44 PM
    Author     : Admin
--%>

<%@page import="object.Plant"%>
<%@page import="object.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Styles/userstyles.css">
    </head>
    <body>
        <%
            //code Java
            Account user = (Account) session.getAttribute("LoginUser");
            if (user == null) {
                //Khi nguoi dung vao thang
        %>
        <div>
            <p style="color: red">You have not login yet!</p>
            <a href="index.jsp">Go back</a>
        </div>
        <%
        } else {

            Plant plant = (Plant) session.getAttribute("PlantInfo");
        %>
        <%@include file = "header_userpage.jsp"%>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Image</th>
                <th>Detail</th>
            </tr>
            <tr>
                <td><%= plant.getID()%></td>
                <td><%= plant.getName()%></td>
                <td><%= plant.getPrice()%></td>
                <td><img src="images/<%= plant.getImgpath()%>" width="100" height="100"></td>
                <td><%= plant.getDescription()%></td>
            </tr>

        </table>
        <%
            }
        %>
        <%@include file = "footer.jsp"%>
    </body>
</html>
