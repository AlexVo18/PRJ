<%-- 
    Document   : userpage
    Created on : Feb 14, 2023, 4:06:25 PM
    Author     : Admin
--%>

<%@page import="dao.AccountDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="object.Plant"%>
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
            Account user = (Account) session.getAttribute("LoginUser");
            if (user != null) {
        %>
        <%@include file = "header_userpage.jsp"%>
        <%=(request.getAttribute("ThankYou") != null) ? request.getAttribute("ThankYou") : ""%>
        <%
            ArrayList<Plant> list = (ArrayList) request.getAttribute("ItemList");
            if (list != null && list.size() > 0) {
        %>
        <div class="background">
            <div class="container">
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
        <%
        } else {
        %>
        <div>
            <p style="color: red">You have not login yet!</p>
            <a href="index.jsp">Go back</a>
        </div>
        <%
            }
        %>
        <%@include file="footer.jsp" %>
    </body>
</html>
