<%-- 
    Document   : header
    Created on : Feb 10, 2023, 10:25:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRJ Project</title>
        <link rel="stylesheet" href="Styles/userstyles.css">
    </head>
    <body>
        <nav class="header-user">
            <div>
                <ul>
                    <li><a href="login.jsp" >Login</a></li>
                    <li><a href="register.jsp">Register</a></li>
                </ul>
            </div>
        </nav>
        <nav class="header">
            <div>
                <a href="MainController?action=Search"><img class="logo" src="images/logo.png" width="50px" height="50px"></a>
                <ul>
                    <li>
                        <form action="MainController" method="get" class="formsearch">
                            <input class="searchbar" type="text" name="txtsearch" value="<%=(request.getParameter("keyword") != null) ? request.getParameter("keyword") : ""%>">
                            <select name="searchby">
                                <option value="byname">by name</option>
                                <option value="bycate">by category</option>
                            </select>
                            <input type="submit" value="Search" name="action" >
                        </form>
                    </li>
                    <li class="header-cart"><a href="cart.jsp"><img class="cart" src="images/cart.jpg"></a></li>
                </ul>   
            </div>
        </nav>
    </body>
</html>
