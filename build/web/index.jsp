<%-- 
    Document   : index
    Created on : Feb 10, 2023, 10:41:43 PM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="object.Plant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRJ Project</title>
        <link rel="stylesheet" href="Styles/userstyles.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="background">
            <div class="container">
                <%
                    ArrayList<Plant> list = (ArrayList) request.getAttribute("ItemList");
                    if (list != null && list.size() > 0) {
                %>
                <%
                    for (Plant t : list) {
                %>
                <ul class="item">
                    <li><img src="images/<%= t.getImgpath()%>" width="100" height="100"></li>
                    <li><%= t.getName()%></li>
                    <li>Description: <%= t.getDescription()%></li>
                    <li><br></li>
                    <li>Price: <%= t.getPrice()%>$</li>
                    <li class="item-add">
                        <form>
                            <input type="text" name="ID" value="<%= t.getID()%>" hidden="">
                            <button class="item-add-button" type="submit" name="action" value="AddToCart">Buy</button>
                        </form>
                    </li>

                </ul>
                <%
                    }
                %>
                <%
                    }
                %>
                <%
                    //doc msg tu trang addtocartservlet
                    String message = (String) request.getAttribute("Message");
                    if (message != null) {
                %>
                <script>
                    alert("Added sucessfully");
                </script>
                <%
                    }
                %>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
