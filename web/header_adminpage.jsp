<%-- 
    Document   : header_adminpage
    Created on : Feb 25, 2023, 1:31:03 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Styles/adminstyles.css">
    </head>
    <body>
        <nav>
            <a href="adminpage.jsp"><img class="logo" src="images/logo.png" width="50px" height="50px"></a>
            <ul>
                <li><a href="MainController?action=ManageAccounts">Manage Accounts</a></li>
                <li><a href="MainController?action=ManageOrders">Manage Orders</a></li>
                <li><a href="MainController?action=ManagePlants">Manage Plants and Categories</a></li>
                <li><a href='MainController?action=LogOut'>Log out</a></li>
            </ul>    
        </nav>
    </body>
</html>
